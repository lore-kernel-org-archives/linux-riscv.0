Return-Path: <SRS0=oUx1=CT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C8AC43461
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:13:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6C7720731
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:13:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HVgkK3Py";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Q2cGez+F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6C7720731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SYqqMpzAC+m/rr3eQzJeL1NYI11/U+2FXWf7LLsnBAs=; b=HVgkK3PyZ3Ijf0p1s6MXphupS
	XTe1GmEZkPDz5SpBCXrUvCtY1kQJzvL6MUXhUV4itgykQXiCe5wgPzh+/Td8EwMV06FcV2gYLpNkp
	dzrPexdPVU1WpMAoRAQ4Zy22p0brjU7MaWsx3QhKbHDtd8hD/THo7l6cizmYl0zd3z/HCVQj6EWIz
	nLnukgoOzUx6xzEa95h/wAMZyEVVWlhVJajIPPGagxJO/nxzGo2bol1MINyHkwoL0g0Lk4hvRJNR2
	bHjvkxgBehi0H0mkzWuIqvNK0xIag9TTaILmPcSVN4P064d2pW/Zj5t6euEv+wXhA0OOAMwg4EvUG
	uwkm0zebw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGHhQ-0008IL-Tj; Thu, 10 Sep 2020 08:12:56 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGHhN-0008FB-5u
 for linux-riscv@lists.infradead.org; Thu, 10 Sep 2020 08:12:54 +0000
Received: by mail-pg1-x541.google.com with SMTP id u13so3849548pgh.1
 for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2020 01:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ommHQQSpigOoxveeOFgXjiVdJvwUb8j2DzRPHrvB8ew=;
 b=Q2cGez+F8URgAoZvPAYByAl6wQOxX86fqXQguCLGEvBvEVALos9gy+uGgwCfIaqzx4
 tQAN+B8kOPNupoqb1AZETPXjyLVaqWO0hRhl3MbUE2G4YQstbdgBJvkVE3jMsPzY9JGq
 duU4NTbnVx7Bp3jjv+xrBpjQXRX7KXD7xZlO1c9y5iLb/siA0xBPxtbN8vIvYBmqI0bW
 47Swj8CvaqU/+YSM++ibx1DXz4ja3Gotg2Q7Gdcq1b+giT78Y60o6Ca8ZWg6RCUS4VX9
 IyUfwSLcj0qa1AAxEK7saXRh6+Yw+v5qLo/zkdyEOxLScRUgFTr+PwnfhaBRt/Z3hasj
 Y9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ommHQQSpigOoxveeOFgXjiVdJvwUb8j2DzRPHrvB8ew=;
 b=AttoMJ4iDegBZ49PizY4gTu2YRpkEUcBX2WHsoj2f7MIfHCFiLbnCHLnCDP5aMmdmx
 rBeOLix+1nRFzGzM3Vq3hBx+ybA7sD8kKwcrMLtMSSyxmP4ICEuNuxqhNQcytS7daLpa
 SfaTa7C7foCDiIKSMBH2+K3Ma91UtmbwtsiSVATAo7Lo4A7AeKybFaOeO/EsHSipaIQ9
 m0Yh/Kb0lWHLe83YVyBQV1+guVJyrSNLD7y4eQjaLTWI/mEA2qCG43dW1xZH4HI32bjR
 E/ORoiZDe0Q4QwCB4lPCrL8jCthmYNTgBXAKhPWCpAv4c4xifYn2e9nyOSV+MPygMDLj
 GJlQ==
X-Gm-Message-State: AOAM531w4NjeoKrRGa8MG2B0+ClWH40mTB5cXQYLlYLb7bQACXUBiDRy
 24gBSqrteEpS0N0Ezr+7oGx6OQ==
X-Google-Smtp-Source: ABdhPJw4mbqJR11v7mgubz1trEb59ezNxgb6EoFi6G+IlzBsjor6vQFM5ZmYEz/7BxSXw5fxGISSFw==
X-Received: by 2002:a63:fd51:: with SMTP id m17mr3785010pgj.210.1599725571382; 
 Thu, 10 Sep 2020 01:12:51 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id e1sm2196056pfl.162.2020.09.10.01.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 01:12:50 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Subject: [RFC PATCH v7 07/21] riscv: Reset vector register
Date: Thu, 10 Sep 2020 16:12:02 +0800
Message-Id: <9ea7cdc5f290d33f52643ec00830362723b71ec4.1599719352.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1599719352.git.greentime.hu@sifive.com>
References: <cover.1599719352.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_041253_367038_71D999BC 
X-CRM114-Status: GOOD (  13.41  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Reset vector registers at boot-time and disable vector instructions
execution for kernel mode.

[greentime.hu@sifive.com: add comments]
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/riscv/kernel/entry.S |  6 ++---
 arch/riscv/kernel/head.S  | 49 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 50 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 524d918f3601..c905efb6c998 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -67,10 +67,10 @@ _save_context:
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
index 0a4e81b8dc79..e97c7915ae27 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -204,10 +204,10 @@ pmp_done:
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
@@ -365,6 +365,51 @@ ENTRY(reset_regs)
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
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
