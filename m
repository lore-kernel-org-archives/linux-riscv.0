Return-Path: <SRS0=2lO5=O3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED819C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 03:15:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B433D214C6
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 03:15:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bli9wF2q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="jy2O0Pmv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B433D214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D0iKhhryPF+lD+uw5YA/tIPkkK+S6MCZrLXpb2Ujyag=; b=Bli9wF2qGHHyE2
	mRk5Lf6Qj7FTvENXbMGP/p3US2f31NhMZE/Xq1a7TIayMcxIIz8lKE1EIrvRkpnb4NEu4GbeVELli
	mLkM1Q4fl3a0ehfnzEY605mc4hf//cA39mxQ6uz5miWf+f8Whinbbm1RZL7fXNc6B8ZTonL9RTI0O
	/5mDBXnb8FnWvuV50sBEGKkT55DKW4S8b/mJHUZylEv5aTG1Vny8cZgy1/0Ik7ZLgPp/g1thmpgyq
	pzFaZk/BqkGZIMnNeKpCUJawSHNdoIZBoxo+xFI0DlKD4f7EkxQ9psxw51Tymf+0Nmt4hyYSYExy4
	YIweAG/zLHFArwt2+JzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZ5qz-00070V-7R; Tue, 18 Dec 2018 03:15:29 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZ5qv-0006rA-LA
 for linux-riscv@lists.infradead.org; Tue, 18 Dec 2018 03:15:27 +0000
Received: by mail-pl1-x641.google.com with SMTP id b5so7123227plr.4
 for <linux-riscv@lists.infradead.org>; Mon, 17 Dec 2018 19:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:message-id:user-agent:mime-version;
 bh=2fkPyuVe/+Eb9oaaMmfp5ZNbRALVy3L/AzhL5ZaGSYI=;
 b=jy2O0PmvLiHh7VulOAmtYIEFUg1XHtNHNMTc4y1Bo+//Rj7SqTUPh5WHnjUqWkox+s
 IvHd7WAvAunSalzIwcgdMVYIG/uOESpQPOYAu2tPU12+dU+an2WkN/b0H7tFDwzZaZ7o
 CoeKuW601ns1y6mQsyMC12X+vtyw6A1WKLm3xUTamg+Zj5NLih2oL5jLgV3LMAxAbPWc
 UhoRNZgUTJsRpJHTdNSy4+R+0Y203It7/nFdp3RIp4ztgZW653fp8OifjnKI0wjQfyGF
 p5uuP94bqJM0RkrTyFBMRMjBR5BfleiM6YCuQUB7u70QdRm223GXJhtUnQeOxWnm3ioN
 tT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:user-agent
 :mime-version;
 bh=2fkPyuVe/+Eb9oaaMmfp5ZNbRALVy3L/AzhL5ZaGSYI=;
 b=Bqs+tdBaJ4RKTi8EFDz6Sujtg+sZeaGY5Pq1iOrqwwUSEinGf+sT6jOsMSU28bKchw
 vaMAZAEKYdrg7IXFE1ooDc2NpoUaFoKDQ7/RO3tZku1gbB3122WR3Hgw6U4uWbXAGNS0
 4K03BgfGMeS+yWmLO0Dl1B1CVt4PUPQDtI/s76NHbbQcEquNkteryEjfIOX2kI7MHfUQ
 2vmIhAD9xya7DLaTZJPLDRRf+X0hbiNRJc5YLud2Scd6PPTqEIzlSSpolLz+uPMT700q
 Z9hyo384HgV5COGL8ctMDaDWb31AXhNbQBm39uFUCIgc9enE/gpZNEIy6pohDqA0bWOH
 GiAQ==
X-Gm-Message-State: AA+aEWbZdu1f5SpAM5hr3azmYzMIup/wDsn3kb8M627Mv0pjmIHvCZGJ
 IZ6gCiZQu63pW0ZC1xWMN15j/zcSV24=
X-Google-Smtp-Source: AFSGD/UKokULiGcBmvfhuULU1nhDdeXHfPtgW4viIBlapdU9ie7QP7jzgV/68PJE9Jt4ufi4MxIDTg==
X-Received: by 2002:a17:902:bd4a:: with SMTP id
 b10mr15025231plx.232.1545102914304; 
 Mon, 17 Dec 2018 19:15:14 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id q195sm14787445pgq.7.2018.12.17.19.15.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 17 Dec 2018 19:15:13 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Mon, 17 Dec 2018 19:15:12 -0800 (PST)
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arch: riscv: support kernel command line forcing when no
 DTB passed
Message-ID: <alpine.DEB.2.21.9999.1812171913510.29609@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181217_191525_726892_E19C868A 
X-CRM114-Status: GOOD (  13.44  )
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
Cc: paul@pwsan.com, palmer@sifive.com, aou@eecs.berkeley.edu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


CONFIG_CMDLINE_FORCE doesn't work on RISC-V when no DTB is passed into
the kernel.  This is because the code that forces the kernel command
line only runs if a valid DTB is present at boot.  During debugging,
it's useful to have the ability to force kernel command lines even
when no DTB is present.  This patch adds support for doing so.

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org (open list)
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
---

Applies on v4.20-rc7.

 arch/riscv/kernel/setup.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 2c290e6aaa6e..e6b962ff39b1 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -171,7 +171,14 @@ asmlinkage void __init setup_vm(void)
 
 void __init parse_dtb(unsigned int hartid, void *dtb)
 {
-	early_init_dt_scan(__va(dtb));
+	if (!early_init_dt_scan(__va(dtb)))
+		return;
+
+	pr_err("No DTB passed to the kernel\n");
+#ifdef CONFIG_CMDLINE_FORCE
+	strlcpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
+	pr_info("Forcing kernel command line to: %s\n", boot_command_line);
+#endif
 }
 
 static void __init setup_bootmem(void)
-- 
2.20.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
