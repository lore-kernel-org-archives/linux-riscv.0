Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728D6C7EE24
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 15:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ikdIZ+BSpvXmJaLJSHdgBOuTiiiyQ6iH5Vgj6WzlVlk=; b=WWMx/lQaX+IoZq
	X0j8q03iGu1i8blwESVyTH84DSVsSzzXvWtLHzhkSCN0H5tRd848TJl7WJxbJt0dkTB17z/xjIFtQ
	U5mIwBW8KZmcRZ81pozu4BWzxcCQmFbjxslCqYYQK9+T/KxzAFKb4ioo15wP/Q5+jsvNHrpj5FR2L
	sS1KpI8xj5K7Pq9aLP+FAnwELuC9kBuinPiNnkyLbjeeqVallkVBCEEWgYxT+zXiNhRCuh2U/j+mw
	YznEr/WzPFKElr/InIIN00uHmFt5dFKluUUTqZ4dqw1Id+luhmki188b+9NO0DXWBT+5V/WDks2+3
	V1yfPmTlmn6gTfvGlN6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CJW-00FykZ-1n;
	Mon, 05 Jun 2023 15:40:10 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CJU-00Fyic-03
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 15:40:09 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b01dac1a82so24970615ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 08:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1685979607; x=1688571607;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=peA7uNBICYxq78TCCLilok9fr+B5gTYL7MG+xHpLNFU=;
        b=RFh4xAkvYh3f6QR+0XxnxTmnNZRh6PgSSh0DDSPDE2PjLKjQokrhAYmYM5dILHmT2u
         tdSPgkHZiI8CmClOVVxAULvfDeIbjr8jgO3uD4jLNGrSufutHHAziJXxKCQW8OGX7KgC
         svpNkOdKQImWBoYlOc3uNdgyZ/4OLsAEbwZrctVF05JaMmLTw2JLLE07biXaKWdXU9gG
         An2uwwe+AI9eY2IGufvCqOqVCE/LGcBcImLt0r98qPSBE0hxN3jF0/aOitmiaV+pSGuw
         RaoxlggCBAIczXH9A0UCHRR9xRBTQ480h6WZt9E5JZHTfdbHdYiLfUQLShQlwcIHlgYU
         lemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979607; x=1688571607;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=peA7uNBICYxq78TCCLilok9fr+B5gTYL7MG+xHpLNFU=;
        b=QvKaK1gQwARvDjhAGqMXvwrmhrx3u+BeTRtliVViAhsdvGflKqs+VPDSO6QNjzMySQ
         +d2JtMz6KiCGOg+hb/MfQVtlEZvEf6yFYPq/jAjuzX3Su2WK43imaEj+//LCbLa4WQ3g
         f6Mc1EK1jF5a9cT1DgBOoe7qtcdpydzpabpOESmIeeyQvYJCEm7qWGo9l7sYeqDtlTzQ
         YN1rAsGpcwcTyonAweYKr2SKKM5RzuUL2OKbuypp9TT3gYMvUTe+DI2tpcMXHRo/wrEv
         8jMgcrzvuCvMQlIN/qlxcR8s8SWqNi2xuib1uRD6rvuPWADS6UJrzpA4xFHbtbSmsgrA
         cAkQ==
X-Gm-Message-State: AC+VfDyej/Z3fgw88xBUtPpQjMtlYnL4fEdxX35eYKVBiilzpBg57KM5
	xqNoS4kFOwzgcQw0AS83qvxz1JUtyy+nvhrISnPmforCgkqwrchVEgIDYtUXzUzFQcdk9iBSbTg
	VeN7b2AK2SELGx2Dx+cnEnNe3oeAt3GAFKRj/uHHudI9+0rnQqRzAhVFhnjPpN1Yf+MlIuvoyzT
	wE1GagWEfnbZvIWVc=
X-Google-Smtp-Source: ACHHUZ7gYODQ3SKlK35nN9OhEisobMlQaL3fKtJqvAH701pPC6rDPo6Jb5H+GX2b1PvrbT1TdvrUXQ==
X-Received: by 2002:a17:902:fe01:b0:1b0:307c:e6fe with SMTP id g1-20020a170902fe0100b001b0307ce6femr3421831plj.10.1685979607093;
        Mon, 05 Jun 2023 08:40:07 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id jk19-20020a170903331300b001b0aec3ed59sm6725962plb.256.2023.06.05.08.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:40:06 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Vincent Chen <vincent.chen@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH -next v21 05/27] riscv: Clear vector regfile on bootup
Date: Mon,  5 Jun 2023 11:07:02 +0000
Message-Id: <20230605110724.21391-6-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230605110724.21391-1-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_084008_057695_214D392A 
X-CRM114-Status: GOOD (  10.31  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Greentime Hu <greentime.hu@sifive.com>

clear vector registers on boot if kernel supports V.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/kernel/head.S | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 4bf6c449d78b..3fd6a4bd9c3e 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -392,7 +392,7 @@ ENTRY(reset_regs)
 #ifdef CONFIG_FPU
 	csrr	t0, CSR_MISA
 	andi	t0, t0, (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D)
-	beqz	t0, .Lreset_regs_done
+	beqz	t0, .Lreset_regs_done_fpu
 
 	li	t1, SR_FS
 	csrs	CSR_STATUS, t1
@@ -430,8 +430,31 @@ ENTRY(reset_regs)
 	fmv.s.x	f31, zero
 	csrw	fcsr, 0
 	/* note that the caller must clear SR_FS */
+.Lreset_regs_done_fpu:
 #endif /* CONFIG_FPU */
-.Lreset_regs_done:
+
+#ifdef CONFIG_RISCV_ISA_V
+	csrr	t0, CSR_MISA
+	li	t1, COMPAT_HWCAP_ISA_V
+	and	t0, t0, t1
+	beqz	t0, .Lreset_regs_done_vector
+
+	/*
+	 * Clear vector registers and reset vcsr
+	 * VLMAX has a defined value, VLEN is a constant,
+	 * and this form of vsetvli is defined to set vl to VLMAX.
+	 */
+	li	t1, SR_VS
+	csrs	CSR_STATUS, t1
+	csrs	CSR_VCSR, x0
+	vsetvli t1, x0, e8, m8, ta, ma
+	vmv.v.i v0, 0
+	vmv.v.i v8, 0
+	vmv.v.i v16, 0
+	vmv.v.i v24, 0
+	/* note that the caller must clear SR_VS */
+.Lreset_regs_done_vector:
+#endif /* CONFIG_RISCV_ISA_V */
 	ret
 END(reset_regs)
 #endif /* CONFIG_RISCV_M_MODE */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
