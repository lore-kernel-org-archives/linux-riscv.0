Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B1EC77B71
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 17:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P73mZPWEJkxJFZdJndOPjq6pZUcDlQJcmuHp15MHroQ=; b=TbPuMWlBSeU9Y7
	u9WJCioLAYELSDwyqSh9qAyblCPewDfykbWBDB+ZJ2cyNb89mZsf7PzzhAYEpvWvTUJ1iLSuLsgMb
	wH0QrOkp6v3xPqFDFppOYRvk2szfGeY7gBRSJz69LIy72zEV3swImjeT8lkHJ1jM5dUf/NRt1tyba
	5Oh0gOG9kIvmVmJPUQC7y0E9KQWOR6MJehnsvqUHvvEx4NXo1bHisGPoebUkqwjDyNFIeCntEPj3N
	WFsmpt+2yVNpMRZDcwpaga2wsDy9WnaSRRQxJqMhhbkb2LJTY7e65a/AyCEnRh91TPDzKp0Tsnd58
	WZeTBTfSqPLoNZRpQBSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnMnQ-00ABLm-2t;
	Fri, 14 Apr 2023 17:01:12 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLqM-00A1zC-1a
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 16:00:11 +0000
Received: by mail-pl1-x635.google.com with SMTP id l21so776505pla.5
        for <linux-riscv@lists.infradead.org>; Fri, 14 Apr 2023 09:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1681488009; x=1684080009;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SfhrBat26HES/W09UQouwTRtDc+oS9f+/Y0OrbpnIB4=;
        b=Cpc1OLK80fp2Vk+OfTwfWFJ4rIIchbHxVG6VTTA1i4wM2eSwwih69m47Wd70PAWx/U
         a8zAvqbq2RX1aJfOnf5djGXLd3AzOQLrZT3zb9Lf/3ANEt3kAKEdE9NeDTWBB6nFgafQ
         c9a2/kJgqJQzdUD/M6JxhRaQcpg5mu6CPLus3DLvoxci6hkBpUDkISuBc/+wc2DStVS3
         /hqmC3Bn3fx52+IRJVCY5bMSBElmXP5n15OQbAxKuYtunyLzSi2ALgaXk3KN8h/q1kze
         1O/nRtElqeoIqFPrc/slRxWD7zq9HK2wD7avGatrm40cxojJ+C7dlkDZ7xNjj6HdESMu
         tVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681488009; x=1684080009;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SfhrBat26HES/W09UQouwTRtDc+oS9f+/Y0OrbpnIB4=;
        b=JdyNpiHq1M/fAveYCp8dFAeoQZRNpScM6v3jr0OhvzFnkbGuLuKNxoi1IDUluA4GWc
         ww9ilpdgWBO7sgQGp6o3xBCYiUsIq1xxcsYVFXIMpP5pxai+Ba4maAwedSeO0/qDJtML
         mTKUOHCvmolNpdofDxtMjNgZyWRNbhVLkyB0mbwl2Ctu2gI0I886peru630PzXHFlwP+
         6UywPuUKBWzTo+m2N5GgaaoocwsvtOxzVzx0NtxhAZB1mS62h6tY+lpNgTb1PfXN8z8z
         K5d0qX4IE/I66+lq0Dfgytp6XeZWgl7nxQYgbWu105HHPE8v+odLZC61heEvE78hHcPs
         q2kQ==
X-Gm-Message-State: AAQBX9cZSCOgn23q8idYTtBgen6b9bHvj+qKAySSQCtMkQLftnzGYFZ+
	Bl6YY1H61XTixeuTargI84DrjUwD0XnGZ0MWahmdtVJ4DlC+BAsnBs0BySp8ycUBrNf7+SutDqJ
	b9g9QMgG0UQfOAMLzE4cpx9B8TRMOWcHM3fxmC73U3kI49oOdcXvgbsoWxRy+0ZLw07SWGHTiYV
	Nio8w8JKD+eFo0
X-Google-Smtp-Source: AKy350Yq5buuwKWHBAdXVXOcSMxtp/KzN9zluNkwjw+6poJKRVXRiimJGmkkVRZRiR95aWSKrJKWow==
X-Received: by 2002:a17:90a:7b8c:b0:23a:66:1d3a with SMTP id z12-20020a17090a7b8c00b0023a00661d3amr6095897pjc.45.1681488009342;
        Fri, 14 Apr 2023 09:00:09 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id br8-20020a17090b0f0800b00240d4521958sm3083584pjb.18.2023.04.14.09.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 09:00:08 -0700 (PDT)
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
	Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH -next v18 12/20] riscv: signal: check fp-reserved words unconditionally
Date: Fri, 14 Apr 2023 15:58:35 +0000
Message-Id: <20230414155843.12963-13-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230414155843.12963-1-andy.chiu@sifive.com>
References: <20230414155843.12963-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_090010_525450_CA17D313 
X-CRM114-Status: GOOD (  17.16  )
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

In order to let kernel/user locate and identify an extension context on
the existing sigframe, we are going to utilize reserved space of fp and
encode the information there. And since the sigcontext has already
preserved a space for fp context w or w/o CONFIG_FPU, we move those
reserved words checking/setting routine back into generic code.

This commit also undone an additional logical change carried by the
refactor commit 007f5c3589578
("Refactor FPU code in signal setup/return procedures"). Originally we
did not restore fp context if restoring of gpr have failed. And it was
fine on the other side. In such way the kernel could keep the regfiles
intact, and potentially react at the failing point of restore.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/kernel/signal.c | 55 +++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 2e365084417e..4d2f41078f46 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -39,26 +39,13 @@ static long restore_fp_state(struct pt_regs *regs,
 {
 	long err;
 	struct __riscv_d_ext_state __user *state = &sc_fpregs->d;
-	size_t i;
 
 	err = __copy_from_user(&current->thread.fstate, state, sizeof(*state));
 	if (unlikely(err))
 		return err;
 
 	fstate_restore(current, regs);
-
-	/* We support no other extension state at this time. */
-	for (i = 0; i < ARRAY_SIZE(sc_fpregs->q.reserved); i++) {
-		u32 value;
-
-		err = __get_user(value, &sc_fpregs->q.reserved[i]);
-		if (unlikely(err))
-			break;
-		if (value != 0)
-			return -EINVAL;
-	}
-
-	return err;
+	return 0;
 }
 
 static long save_fp_state(struct pt_regs *regs,
@@ -66,20 +53,9 @@ static long save_fp_state(struct pt_regs *regs,
 {
 	long err;
 	struct __riscv_d_ext_state __user *state = &sc_fpregs->d;
-	size_t i;
 
 	fstate_save(current, regs);
 	err = __copy_to_user(state, &current->thread.fstate, sizeof(*state));
-	if (unlikely(err))
-		return err;
-
-	/* We support no other extension state at this time. */
-	for (i = 0; i < ARRAY_SIZE(sc_fpregs->q.reserved); i++) {
-		err = __put_user(0, &sc_fpregs->q.reserved[i]);
-		if (unlikely(err))
-			break;
-	}
-
 	return err;
 }
 #else
@@ -91,11 +67,30 @@ static long restore_sigcontext(struct pt_regs *regs,
 	struct sigcontext __user *sc)
 {
 	long err;
+	size_t i;
+
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
+	if (unlikely(err))
+		return err;
+
 	/* Restore the floating-point state. */
-	if (has_fpu())
-		err |= restore_fp_state(regs, &sc->sc_fpregs);
+	if (has_fpu()) {
+		err = restore_fp_state(regs, &sc->sc_fpregs);
+		if (unlikely(err))
+			return err;
+	}
+
+	/* We support no other extension state at this time. */
+	for (i = 0; i < ARRAY_SIZE(sc->sc_fpregs.q.reserved); i++) {
+		u32 value;
+
+		err = __get_user(value, &sc->sc_fpregs.q.reserved[i]);
+		if (unlikely(err))
+			break;
+		if (value != 0)
+			return -EINVAL;
+	}
 	return err;
 }
 
@@ -146,11 +141,17 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
 {
 	struct sigcontext __user *sc = &frame->uc.uc_mcontext;
 	long err;
+	size_t i;
+
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
 	/* Save the floating-point state. */
 	if (has_fpu())
 		err |= save_fp_state(regs, &sc->sc_fpregs);
+	/* We support no other extension state at this time. */
+	for (i = 0; i < ARRAY_SIZE(sc->sc_fpregs.q.reserved); i++)
+		err |= __put_user(0, &sc->sc_fpregs.q.reserved[i]);
+
 	return err;
 }
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
