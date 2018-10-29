Return-Path: <SRS0=N0YM=NJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D7CC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Oct 2018 19:27:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF58120824
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Oct 2018 19:27:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mb69awXw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="iAmk3zUd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF58120824
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmwb8n7r2KYOUIxWC8dP8vINTY9SJv72/0n0NODFp5w=; b=mb69awXwCLZvoI
	wN0C3gILZ7ErB7rcDTXO7ACNRjWhp+mP7WibLNGWk0q9TNy/BPpZZ6sJWsj8BKMT5s385evkIUs/2
	Yz0VIbw9Ea4vbMH18tqN95Ne/ftB4LXUqmztaSijZ5RBQVHc+zx9Ac5Wy4Pi2CJKhBJVKM/8pHV36
	VrPSLnf6ktN7zI8NTQ6e47AfgR0caSpDOUp2YgrlFOhFz4om3VQdhQRu2Az3acZfai9J/rRTQKDdI
	P3N0daP3ovUeu+XIJ6K8jxT0I59oUMyBiOcFhZuBDwNRT3zHHRcJiuuh1rpxGbRncI0TnUvzBitCB
	Os1NU/2pCg7hfINjHKmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHDBu-0005Ti-GY; Mon, 29 Oct 2018 19:27:10 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHDBp-0005HX-So
 for linux-riscv@lists.infradead.org; Mon, 29 Oct 2018 19:27:07 +0000
Received: by mail-pl1-x643.google.com with SMTP id f10-v6so4307290plr.1
 for <linux-riscv@lists.infradead.org>; Mon, 29 Oct 2018 12:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:cc:from:to;
 bh=pkstlzjOSZ4fucbTr95yWc/rdxg9PHy2rBXqPF9UZVk=;
 b=iAmk3zUdrqtu5z71roW0mzLDU61Bag7JVrRwfB6UrJ/gXnwTzbMrLF8nln/LlMFDoC
 sdyto9XNnoLwot0dzQ4Pncaq43HRjzFcBngGEeSNWSHGKucWQ95EXFmmS31DB2L8GWyQ
 KtB93GhCJf32lxXSFq/0HIcrE1cgvxIGD/LUJkhvL8WZxbkJVyA8RofbXd9hLgyhMcqw
 8aarX9UKCmbMO39Z77Ndu5jKPrWLyMQipOQrmbxe2IcoOqi9HKDTuApIMBA11BU2hZ/y
 VXr7x+jD+jazW3GAkKa5RjjJMKVM6N5xi9SQ6tlPYLKC5u2yO3N/f4HON9lw5SI99r08
 atbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :cc:from:to;
 bh=pkstlzjOSZ4fucbTr95yWc/rdxg9PHy2rBXqPF9UZVk=;
 b=RErXCtp7m+Frkvi/Pg1mhdQGubCWjeJnI1bDP1BhbXNLtcC8ob9doyeDikEa2e3isz
 KzkCKmVCsQxbsH03gbk4rox9/OVgIYT69hmdQk0+ceUKNeh2y18Sjk+BFMXoRR+piSgE
 4OV6PGHvaWSLLieCyjensopeFDn6AOnDuyHLEFPpjHj0hWtB0NnpztZXff8hSOvSE5MS
 SbzhC3Fq2L9yeiw39o/kH6tzuLuth7y9+bjF+ulCNcRLg1KJ8YMh0kCz0VCm9MjplwI6
 w5iETHL25dq3h9uclyA1Akzp3vHrH2jujbYM/yqMn7zmGyc2I7Xi/1DcQj5ev1HGeIPn
 rDxA==
X-Gm-Message-State: AGRZ1gLsKYRtdKsdpqIDhA3VGSbflywGGimMRb2OJAJgBmOHYIlq4d7p
 nTC8pMFtPXqEM/5/AwI+h7YLiA==
X-Google-Smtp-Source: AJdET5cSrwgYX54x2/ixsdzTwj8APPIUhFNisPVhh0jpv8/RdrkJWFSKpiDY6RL8Ur8uU/MgAVqJtQ==
X-Received: by 2002:a17:902:4222:: with SMTP id
 g31-v6mr15444295pld.236.1540841215226; 
 Mon, 29 Oct 2018 12:26:55 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id p1-v6sm28923492pfj.72.2018.10.29.12.26.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Oct 2018 12:26:54 -0700 (PDT)
Subject: [PATCH 1/2] Revert "RISC-V: Select GENERIC_LIB_UMODDI3 on RV32"
Date: Mon, 29 Oct 2018 12:26:33 -0700
Message-Id: <20181029192634.30078-2-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181029192634.30078-1-palmer@sifive.com>
References: <20181029192634.30078-1-palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org, zongbox@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181029_122705_953067_369D6CDC 
X-CRM114-Status: GOOD (  10.09  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: robh@kernel.org, aou@eecs.berkeley.edu, keescook@chromium.org,
 matt.redfearn@mips.com, alexander.shishkin@linux.intel.com,
 Greg KH <gregkh@linuxfoundation.org>, bigeasy@linutronix.de,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 willy@infradead.org, colyli@suse.de, boris.brezillon@bootlin.com,
 ynorov@caviumnetworks.com, yuanzhichang@hisilicon.com,
 akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com,
 linux-riscv@lists.infradead.org, khandual@linux.vnet.ibm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181029192633.BDEsDsKNJ-WNYH9QdfNWi6EUuylJGFnV34q_c2okCQw@z>

I'm removing the generic 64-bit divide support, which means this will no
longer work.

This reverts commit 757331db921428295948fed5e7377a436e66d34e.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index fe451348ae57..4198759f6798 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -109,7 +109,6 @@ config ARCH_RV32I
 	select GENERIC_LIB_ASHRDI3
 	select GENERIC_LIB_LSHRDI3
 	select GENERIC_LIB_UCMPDI2
-	select GENERIC_LIB_UMODDI3
 
 config ARCH_RV64I
 	bool "RV64I"
-- 
2.18.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
