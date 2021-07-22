Return-Path: <SRS0=ruHO=MO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C010C6377A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 02:17:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBBF361285
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 02:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBBF361285
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V8d8tqiUF1HFVUmgvozCdGp9XDYiwd90mMaBopyrnVQ=; b=PxgFsGgQptge16
	uP/tK8ZCna2GGcpHmG+yUDVk91IchJPkFbgCj8GNXzJhC/fHT3S4v6nWUTebJhwC297zIUv06V42s
	Cg6/zRk2NjQuckeZ1iowobtSJN770TMHYOAiEGIToPpwhgdzY1v+V/Dg7/FlQfAgUQ0RC7R5DJrKM
	P4gg8/ULPZl5pBXqStM8oGkhDvPb3UHrOG/MocSpdQ2PFSG8SBaXvWgUqK77FKXf7Hoh25nHUQfKp
	n/TlE3pnDsC67ZKc83cZgaYVXk78/vwt4z/RTWEa/d8hnX05beii6L3jYXaCGgyzezxAln76/+v23
	YujkbHw4iH5ySCkNT2DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6OHB-00Hb3F-IX; Thu, 22 Jul 2021 02:17:29 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6OH8-00Hb1J-Fp
 for linux-riscv@lists.infradead.org; Thu, 22 Jul 2021 02:17:27 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 a17-20020a17090abe11b0290173ce472b8aso2107540pjs.2
 for <linux-riscv@lists.infradead.org>; Wed, 21 Jul 2021 19:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=07mq1tbTyL2EUpcAXYfDuJ/atzwMHIawr2ISlNOgil0=;
 b=fll3GwPr5G609VlObfTF3PBHdPewGkU5Y7oNH+VWKn/lzjN7EbWyM3Uf3+iyN2r4gj
 hgHYCiBbMCoZZOoPs2FhLDGRR1sJH7epGaZDjalcFdw8uqCd3g+/fe7sgf1+HB/1UYVB
 eHF6m8xxUGRHfhZW5GmOClGyh2JMJCnEbWSVP5qTnYQtQovVSTCUltkfNWHmkc7KHz6N
 rH+/xfr/inpgCniZt5DeTeNCKFrkWB9gJ1+G9A49LL/e4/OqqI38/ZMIXosYJGY2G4TL
 xiRDr87bZqYXe9b33xjiZcxRBgTspxxcsFZI2CJsPIs30D0FLfNW8I9mJ1u2pPjsZF+c
 L/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=07mq1tbTyL2EUpcAXYfDuJ/atzwMHIawr2ISlNOgil0=;
 b=uhfRSP90lISo0itV9uB2KjUbTBQamXTMqz7QPceZPXCXRJMa9NZnshZzJJirSVdr0k
 LDGC6C/G9q/JDcLLVZSap9yXGV5sLRqNUy1ihXyrZF5pexYSNTa3Jq0SNc6Q8dmI9zSM
 Zn+lfn3rPLa6DJHgsSAO/kM66At4rcFrfa9Lcg8tUqgNkESAbDPsXwQk0zdmqauUV9wo
 O0bKVXVMKIXgT/q7xCqtcvLLAMwwyGI1axpIUDlQJVJkXUAasaWZIXblS+Tw0RoSQx9D
 zbD49C4b73emFdqPDMXv68tPBb1x5ZKOfEaTzfkbTHmU93sEUeA7sBANWYesQSUWSSwe
 ypAw==
X-Gm-Message-State: AOAM532pASjD3vp2hqSwC8Hh2kz3oUbbBZwMWoDBzyEIaeu/PBO5P4Rs
 Gu3hFAcFDzIiE2wBhjHibHM=
X-Google-Smtp-Source: ABdhPJya/laHEhbhnkuWT6LkpVzEG5xHxaJhq+pxOP5h+XehJ/ZBHvG0mQRxtrDKApw5VAPIbLrQVg==
X-Received: by 2002:a62:be18:0:b029:318:df2e:c17c with SMTP id
 l24-20020a62be180000b0290318df2ec17cmr40104107pff.30.1626920241309; 
 Wed, 21 Jul 2021 19:17:21 -0700 (PDT)
Received: from vultr.guest ([141.164.41.4])
 by smtp.gmail.com with ESMTPSA id b3sm1245448pju.47.2021.07.21.19.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 19:17:20 -0700 (PDT)
From: Changbin Du <changbin.du@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Changbin Du <changbin.du@gmail.com>
Subject: [PATCH] riscv: kexec: do not add '-mno-relax' flag if compiler
 doesn't support it
Date: Thu, 22 Jul 2021 10:17:15 +0800
Message-Id: <20210722021715.127066-1-changbin.du@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_191726_601456_073848A9 
X-CRM114-Status: UNSURE (   8.97  )
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

The RISC-V special option '-mno-relax' which to disable linker relaxations
is supported by GCC8+. For GCC7 and lower versions do not support this
option.

Fixes: fba8a8674f ("RISC-V: Add kexec support")
Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 arch/riscv/kernel/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index d3081e4d9600..3397ddac1a30 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -11,7 +11,7 @@ endif
 CFLAGS_syscall_table.o	+= $(call cc-option,-Wno-override-init,)
 
 ifdef CONFIG_KEXEC
-AFLAGS_kexec_relocate.o := -mcmodel=medany -mno-relax
+AFLAGS_kexec_relocate.o := -mcmodel=medany $(call cc-option,-mno-relax)
 endif
 
 extra-y += head.o
-- 
2.26.2



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
