Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E31EBC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 06:15:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 982BE610D2
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 06:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 982BE610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EfQcjR6hMJXRyeX/6h3Mhtr9horAf8DDvqqaUzyGA+s=; b=heqMxI7DuuC5Vo
	mZ5mOG2niu3rOpd28hfrxTfOtSCPJjaJ1mVYgIkcA8KTGqmqy6xZTc1LKgErEV7tdvg0/kCbcqm6q
	7TePDZjtqcwnWRo9SHidengO132roBnpjN+89LVp7PEom7lyxgXg5gUYOWZKDjq9/VAoVPWXE85IT
	3FyZg5AV97RMC8ZVxaqVbguyVq+1fR/mtRs0isygonEwBKDthmLVJDBImfxeAhMUuAEhF/pfZSKfN
	AAvOwTLyayGEd01c1ZL5AQBf2XZdLz6jR9JSTLLJ+S4wvgCVkFes4Ww540YTco3IKOeJQQ4aQFSYJ
	1yKy80ibp57tm16+h37Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdnq0-009n6V-6q; Fri, 22 Oct 2021 06:15:32 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdnpx-009n5w-Id; Fri, 22 Oct 2021 06:15:30 +0000
Received: by mail-ed1-x532.google.com with SMTP id t16so1200972eds.9;
 Thu, 21 Oct 2021 23:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D7VyhyVFqGiDLOi0b0J5PndE5AU+ffBlyz6llD7egu4=;
 b=TS+J4Al3sMzV26NQKn3chW4Y5DPwz6ZgsxtYGkRaiHjYuvuFg3J/NTZGq+ib0DDywj
 YmED8b+6p/0wRvkOoosk8qqzfff2zAxwghpKPsVK6m5P1RTke8fFhbyTcqjz4SRecmxB
 8rTFbNjCGaS3Axp10JUmD8YFqBE27/gvk9LuaK+HGVgdjWOh88tpGWyurpb1D8BpYEus
 yGdbiIaXNc79YMHYiDvWhoezFbvN6gTh8kLyg1QiD7pPdfRvS/VLqiIVA1p2i2xzIfXC
 HD8DgUnYWqdmgZxAcGEP38j1SudXm7AhzEQOQl/DTu7OHR2K5rwHdnjos00gp864XNs8
 3z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D7VyhyVFqGiDLOi0b0J5PndE5AU+ffBlyz6llD7egu4=;
 b=igRbfzDlIvhWO3K+LfAulQSvcY0Fl4p4fXoSptsow+4AGR/6bGzFJhXjA6V4GjlTVB
 nvff+Mdc6Iuc7gqUe2uTa/17Vwl116Yykau5IvGvi06kxzSpC9jTxosNTczqLYIJmrBy
 jWofprefsKYs4bNRwPjV820EDImP31xJnTAYjHKyM1OpPqTN/8Syqnf/T0N2B2OOM4VP
 IycD19inzpw9hYvmr8/ot7+IVSqDTRo2c11UcixlaflLRdmR7uMS8nDZf1DR/QX/d1HN
 nUoDKLgEUj7mIiLF+TNMJ5+ZNRGagbWuWPi/+8wfu/1kBsk3TMP9NC3S1HMJAO8npA1/
 pY0w==
X-Gm-Message-State: AOAM530vbHsi+CxIBmEXOwIRfP+ANTzUPTcmvZCdDB+DdNR5z0oH/mZ7
 qlkDn17YliH+RRZZqUqSSg4=
X-Google-Smtp-Source: ABdhPJwu/4BoryeayGd7ByNreZLZztNsbNVBdT/fKy92ljUk/Ozzu1AnOb/HVAiRYhX+teLfmLYNDw==
X-Received: by 2002:a17:907:90d7:: with SMTP id
 gk23mr7483091ejb.300.1634883326467; 
 Thu, 21 Oct 2021 23:15:26 -0700 (PDT)
Received: from localhost.localdomain (i5C74E2CB.versanet.de. [92.116.226.203])
 by smtp.gmail.com with ESMTPSA id
 w11sm4108710edl.87.2021.10.21.23.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 23:15:25 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] riscv: do not select non-existing config ANON_INODES
Date: Fri, 22 Oct 2021 08:15:14 +0200
Message-Id: <20211022061514.25946-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_231529_640675_6F1AED2C 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Commit 99cdc6c18c2d ("RISC-V: Add initial skeletal KVM support") selects
the config ANON_INODES in config KVM, but the config ANON_INODES is removed
since commit 5dd50aaeb185 ("Make anon_inodes unconditional") in 2018.

Hence, ./scripts/checkkconfigsymbols.py warns on non-existing symbols:

  ANON_INODES
  Referencing files: arch/riscv/kvm/Kconfig

Remove selecting the non-existing config ANON_INODES.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/riscv/kvm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index a712bb910cda..f5a342fa1b1d 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -22,7 +22,6 @@ config KVM
 	depends on RISCV_SBI && MMU
 	select MMU_NOTIFIER
 	select PREEMPT_NOTIFIERS
-	select ANON_INODES
 	select KVM_MMIO
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select HAVE_KVM_VCPU_ASYNC_IOCTL
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
