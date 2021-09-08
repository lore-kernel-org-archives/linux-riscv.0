Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450EBC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:46:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C33C6108B
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C33C6108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JQEGe/95C/wtyRa40FgXnikufFmal5GhwovGXDpgdUc=; b=JdAz1v1mRPnl06
	RbGBgBycykZbl9mnTCdVyUHDgpWoZHX+Oy8mfWg5KbRQditpCmWxLmsI66pOkmyhXMK1ii4Im0Jr+
	cRobxqGZXFBOVQ0ly6yXc99D6b/N7NG2FAxEnDIwuNGHXomg4W6ym78dD6Ek4sbOqoN0L5XcY/i0a
	NAADPXtVm5H/8qzED/Ez8YVQRTO0UisEgIS+23cqMCOyDQX1XDUZjIXs6qTypOb4l2XshwPvbHl0Y
	SRCUYQNcQYtwK4pMQ8BIfG7GKh65tXz2WLfiQS2DkhFM1Sx+21ONL1hIuBGvwGqBMWOrWuw21xJCo
	eobzuZmw9f/c4Ro1LPdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO1e3-007IZ1-7D; Wed, 08 Sep 2021 17:45:59 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO1dr-007IPh-NZ
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 17:45:49 +0000
Received: by mail-pg1-x532.google.com with SMTP id s11so3388059pgr.11
 for <linux-riscv@lists.infradead.org>; Wed, 08 Sep 2021 10:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FnDMp1ofQ25bYz/7RSGb8GTJdDeWHokyAKow2uosXiE=;
 b=KovysMadsgNvWL5q/YHQnGrTzrMspxZfa+uuwZTx2mprioUTi6IwDPm0fFVZ2516Mi
 RUG+W/tL4Cg3/X7HYvtuHhRSDsYZhPZBDbfQ0T6LoPhZJwLboMii2rgE2lDutJfug/Wg
 q/270wwm8pCquUQThvgF7WgHQqvwaUOkjC7DWRpjxh41ruoC0cT8wHRgV5vzVd5P1mn7
 6k5+j0n5HJ5aPmPNG6QOKTHliZIKZQbm5snzjh+kLW2D9DEepUM60FX47xYBpsDZkSn1
 xdAVbjPxJFe+CM/fxOZ6gUfHsa9Vz3WNNwR2gWyAzxajF6E9Np11teUm3W4E4XDJbUO4
 OybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FnDMp1ofQ25bYz/7RSGb8GTJdDeWHokyAKow2uosXiE=;
 b=dv2ECxbsQUhl5IX2cVeyjbduix4jW+DmakfqtiHOTStfPhwmNlUQAq234PukBlbiY8
 crQVS8uA1OmdarVb9kYP293xrfqgbOV//S8xG8Q42YfzkWug50evjHUOCi5UmRvU3wgy
 5q+2ts9RTwT/S5ajvkch1TdZ2yulRJ1GL5jgGbi71xXkRDeMHZdo/ETJ3dIYydUf7/2O
 b7Us61ML3wsGQWIAO/pKv/KTjiAGvewrgpqAeQMwgHx+wc8ZbVEwwPAg8CwkFhyBSomA
 berFh3sLVmKSwUpz9bMmX0Hfy1448MyfEFgRx/G2wF43bioHi2icRQDMowCL2sExX0z+
 Avag==
X-Gm-Message-State: AOAM533fJwhqTeQjs9O0FaXgyDxVChFYJck2Addde8psAnfihVIq0e9+
 RfleeBfINdzlQbHv7Kj/P+fM4AMgPiRq0w==
X-Google-Smtp-Source: ABdhPJywSFVOWB8Dr1GKJgtf0k10iC73xTmYZfDxYYFTe6OCRO9dwD/WAfK8Ey/r1TxFYLZiiIQpPg==
X-Received: by 2002:a63:1861:: with SMTP id 33mr4849899pgy.406.1631123146858; 
 Wed, 08 Sep 2021 10:45:46 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id b5sm3108466pfr.26.2021.09.08.10.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 10:45:46 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 vincent.chen@sifive.com
Subject: [RFC PATCH v8 07/21] riscv: Reset vector register
Date: Thu,  9 Sep 2021 01:45:19 +0800
Message-Id: <6419a6326a5569987c4b3c5afb4b775887b2ca12.1631121222.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631121222.git.greentime.hu@sifive.com>
References: <cover.1631121222.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_104547_819969_7B1FA82C 
X-CRM114-Status: GOOD (  11.63  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Reset vector registers at boot-time and disable vector instructions
execution for kernel mode.

[greentime.hu@sifive.com: add comments]
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/kernel/entry.S |  6 ++---
 arch/riscv/kernel/head.S  | 49 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 50 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 98f502654edd..ad0fa80ada81 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -77,10 +77,10 @@ _save_context:
 	 * Disable user-mode memory access as it should only be set in the
 	 * actual user copy routines.
 	 *
-	 * Disable the FPU to detect illegal usage of floating point in kernel
-	 * space.
+	 * Disable the FPU/Vector to detect illegal usage of floating point
+	 * or vector in kernel space.
 	 */
-	li t0, SR_SUM | SR_FS
+	li t0, SR_SUM | SR_FS | SR_VS
 
 	REG_L s0, TASK_TI_USER_SP(tp)
 	csrrc s1, CSR_STATUS, t0
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index fce5184b22c3..cf331f138142 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -241,10 +241,10 @@ pmp_done:
 .option pop
 
 	/*
-	 * Disable FPU to detect illegal usage of
+	 * Disable FPU & VECTOR to detect illegal usage of
 	 * floating point in kernel space
 	 */
-	li t0, SR_FS
+	li t0, SR_FS | SR_VS
 	csrc CSR_STATUS, t0
 
 #ifdef CONFIG_SMP
@@ -432,6 +432,51 @@ ENTRY(reset_regs)
 	csrw	fcsr, 0
 	/* note that the caller must clear SR_FS */
 #endif /* CONFIG_FPU */
+
+#ifdef CONFIG_VECTOR
+	csrr	t0, CSR_MISA
+	li	t1, (COMPAT_HWCAP_ISA_V >> 16)
+	slli	t1, t1, 16
+	and	t0, t0, t1
+	beqz	t0, .Lreset_regs_done
+
+	li	t1, SR_VS
+	csrs	CSR_STATUS, t1
+	vmv.v.i v0, 0
+	vmv.v.i v1, 0
+	vmv.v.i v2, 0
+	vmv.v.i v3, 0
+	vmv.v.i v4, 0
+	vmv.v.i v5, 0
+	vmv.v.i v6, 0
+	vmv.v.i v7, 0
+	vmv.v.i v8, 0
+	vmv.v.i v9, 0
+	vmv.v.i v10, 0
+	vmv.v.i v11, 0
+	vmv.v.i v12, 0
+	vmv.v.i v13, 0
+	vmv.v.i v14, 0
+	vmv.v.i v15, 0
+	vmv.v.i v16, 0
+	vmv.v.i v17, 0
+	vmv.v.i v18, 0
+	vmv.v.i v19, 0
+	vmv.v.i v20, 0
+	vmv.v.i v21, 0
+	vmv.v.i v22, 0
+	vmv.v.i v23, 0
+	vmv.v.i v24, 0
+	vmv.v.i v25, 0
+	vmv.v.i v26, 0
+	vmv.v.i v27, 0
+	vmv.v.i v28, 0
+	vmv.v.i v29, 0
+	vmv.v.i v30, 0
+	vmv.v.i v31, 0
+	/* note that the caller must clear SR_VS */
+#endif /* CONFIG_VECTOR */
+
 .Lreset_regs_done:
 	ret
 END(reset_regs)
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
