Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD68C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:51:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D4D2611BD
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D4D2611BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M2yiWKutROwGupdgIn7iFDWcKgveulNwJRNLPUh6bTI=; b=NtCb/CH1CWTr+n
	YaHLwwCYO9iC0kGV1dKhMBbiUfBb12EkcxtnnAURTtOtInXon71ygf+0C3JIP/E8oe2g9FlWnJYNY
	oYctEGb16nKz7TIh1eROTdOlnE6ZtBaKdYgLC1liZi+STnVTZresNLLU5z2+OPJTiQKPZbtXWASEQ
	IMz4hT3nmWFwUVY3r3PrpDlGfTloOmRWhHowI+uicd98ngA4r+UEMIKVuqUOg6XbwkVVKERhYSezT
	RoQjuhOmyl+oL9kpdQDP45F3Bk/9a5Ki2qSpY4xNN4omjLa3p0+INsQsan/8ld++azF4TW2koeXIi
	deF7ZqzMTCXlIvO/Gwog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkNnD-001Kkj-Go; Tue, 09 Nov 2021 09:51:51 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkNkC-001JV6-3Q
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 09:48:45 +0000
Received: by mail-pg1-x533.google.com with SMTP id p17so17993316pgj.2
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 01:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QSqFepERE4N2wqVXalvOoo260yooYSe4DI6a5ek1AvE=;
 b=bb5tQb/6VeknVaR406cXHwsp0nVG1x2yFyshVKlDcHEmIEaibX4qmuCrnx6r7i3Yzy
 OWdOraOah9Q6ITGHX4vvFKbZMLJelo1T2DmeZmd5HrSYIJM2iKB3Ls4U8bA0j4091ycA
 4dZum9J1j2u00hjCLTf5AADYx9x7fSyilEbPo9Ew+2AjYBoDXSRxEMitnBEGGl7mKqh9
 7MLp1wBHB1n4A3S1lWzFu8Xsqhr0mP/L01S7ezDht5Equ+H3qRNPbHZQb9AvS71SHzNv
 wTxCCUy9H4La495JDszWKYXJl2SRS/rSwWT3Ja+ydDocytajLMyt6FOsFCpcDoJUQYaw
 yzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QSqFepERE4N2wqVXalvOoo260yooYSe4DI6a5ek1AvE=;
 b=iUF/8S3rEMvM4dxI//dCHKAhVmtggREmEnn9zY3nJ2NY/xsJRze1sPgim/RoekVrNA
 mvX6g0oXPtWgG+nre7YbNlGlRng/jrOqFBw2pcwBrrmJsYFWz+Uo8R7PGpWx9sAwNNRM
 10lxIx9j+GKHOmCTomRY9z0ifthlBpdXXPmLpj4DIcTm+dzgdojeZRO19qpbcYK1A+ue
 EwdSrIqXTm0c1lUpdUbHdOq8OEc+1a+gnGLLheEByLFQyctZerr8FI0uxl5fCwwjl3hg
 p52GvvvXbtZ9kH3uyNhbREKYE1fe8iYZrpKSOSt7MeMYKIlTZar12fpl7d6V50FUJnn2
 b1RA==
X-Gm-Message-State: AOAM531kN+tAHIDBBUguxIjqYNJYHHcZ7fEkWFoZbE81YQ/gDLeh8/S6
 GD/o5iIqoKJntQg8u7dkP7A/YQ==
X-Google-Smtp-Source: ABdhPJz+XI26Bw7+LIrDII1mBcw/2IbYLT4/XZjMDBL60+W4P/sUugRbk2XDDdfmD5SP6IMja7V68w==
X-Received: by 2002:aa7:848a:0:b0:47f:d648:2df4 with SMTP id
 u10-20020aa7848a000000b0047fd6482df4mr6418681pfn.63.1636451323096; 
 Tue, 09 Nov 2021 01:48:43 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id cv1sm1940511pjb.48.2021.11.09.01.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 01:48:42 -0800 (PST)
From: Greentime Hu <greentime.hu@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu
Subject: [PATCH v9 07/17] riscv: Reset vector register
Date: Tue,  9 Nov 2021 17:48:19 +0800
Message-Id: <8612e69a10235e67fac8a55864e77a4ab8f771ac.1636362169.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636362169.git.greentime.hu@sifive.com>
References: <cover.1636362169.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_014844_192941_EA55DDA0 
X-CRM114-Status: GOOD (  11.87  )
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

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Co-developed-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Signed-off-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/kernel/entry.S |  6 +++---
 arch/riscv/kernel/head.S  | 22 ++++++++++++++++++++--
 2 files changed, 23 insertions(+), 5 deletions(-)

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
index 52c5ff9804c5..551afe1de85e 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -242,10 +242,10 @@ pmp_done:
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
@@ -433,6 +433,24 @@ ENTRY(reset_regs)
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
+	vsetvli t1, x0, e8, m8
+	vmv.v.i v0, 0
+	vmv.v.i v8, 0
+	vmv.v.i v16, 0
+	vmv.v.i v24, 0
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
