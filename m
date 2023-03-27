Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3D6C76195
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 16:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5cyUL+N3bvRDiDRT3RcwpxDsORcMpAwp5Rbzae62AKU=; b=OA3CGKlPYJEYmq
	H8oUVtDlxPnxlh5zfecdhUkYTuLx3fLjk1rQseHh5DmJ3svOojdEuPvJ9URopV3QPi0IkcXMpoZ/4
	3/evnGW2F42uX8Qz7m6naKrMU+UZdRyc7yC9/NfOrYepowJZjGtiQP69GwVlyUL3fKXub0rfXFKsl
	p3rX0EE6TtMhiF3qeWREKhNNvUEvMrof5A5oKzhqUc1CWkHcjrKNNP0y2GVOALGAcpjFueCiQBd+N
	bFTJMSdr3LnWpvyLaINfGnUttjXn0G1YnvKU5mjHTR0MohwU99aAGbPBOkZVXq6a2nczlEOR4L+fj
	iM0JS2iMu2xRpUrLTGjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq3m-00Blfu-05;
	Mon, 27 Mar 2023 16:51:06 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq3i-00BldF-39
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 16:51:04 +0000
Received: by mail-pj1-x1030.google.com with SMTP id e15-20020a17090ac20f00b0023d1b009f52so12395996pjt.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 09:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679935862;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ryhVgZfdzbHh0bqi4ovsKoh5/46PxHir8xzw1qbPTpQ=;
        b=BZIzW3Y+sBfrcjEuAs1PUdSi8nWVf5N7Dfc+QTKUhfd4RIwh8hASjSvcaq1jR5Yy3b
         l/xBpFhsvQhzg5BAM1XjDliXHos9/4H0mNthp+hlID8qDU6jdmoPuKPGvtHFminJDBhy
         /k/IBWyti/NCDzNtZd79M5W1xdGugGzn8RoXXiLjukyarX8xFnh4bBUgQfTwiQJm9t+4
         v2sq+rsm+GA7ZFXtB2tdKa8Q5iBuOw6MZlLQg/OVq5/lsiOn+ZqZcbRM+ymCIopCRMEu
         3r4U/QVYLpwRnEokCGhjwM91XfS48GGL54Vcv4EETP9oN5+I4yy0koEMXGuMUFNkPyQ4
         yI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679935862;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ryhVgZfdzbHh0bqi4ovsKoh5/46PxHir8xzw1qbPTpQ=;
        b=c1Bmosvyx93yasrQDoYbdr+0IP7o+HaY0dmbdacy/NVtPSh4Mu2tldT7KdKwYt/Bsr
         j2hU4Zxe9sms+JAKCcV+u8ahNhpuWI3W2N1YpZKEfASKH/mxPFcvBmRHPIGEbRO8Ykud
         rGC/uAwDgLXdmJWB5TFKIjrnTeUf6RnNiw0AQ7c1NRnksCRzpzaIIQ3+54d2Lwno03fq
         xXCbPsxZrBQ5MG8ansIopZMLV1y1nYIJEgcOxvRpTfm7uoAF27IPuu17VOD3fbzbnV3c
         ywM4j6eVtWp5iWoMx1nCuwB2x5zJVoqd5+5aNm2Q4S9XiOfn/zG1QDqSvqEm9PxI3SyQ
         MJXg==
X-Gm-Message-State: AO0yUKUW8pmaHcVgzFfaF+N1wxNFzbQwvQnNeOP9TEugEtayJxVsayAQ
	iB1qEGO+iGRExWXi+9VLQjZKo26G0WlKZyPJVtAwUZT3QdYq/MKRh0dQoLqQmN1gsW4b3641EgC
	9L2qfPQppH3UT/JmJwQsCmGNq2ieK7GHXBiyQVTqPQfwvfiEPXFrLrQlsNjhUi582RY1D2tUiMa
	Nfu5xDOjjxT2r/
X-Google-Smtp-Source: AK7set/5d2wS+mMdlmZ2RwmM8M6hS6rSy+QQMS2XBSsO/0Eh1ED68Qw1WngW65tnFf8n0LCruRljsg==
X-Received: by 2002:a05:6a20:2a10:b0:d3:5224:bbc2 with SMTP id e16-20020a056a202a1000b000d35224bbc2mr11798260pzh.42.1679935861957;
        Mon, 27 Mar 2023 09:51:01 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q20-20020a62e114000000b0061949fe3beasm19310550pfh.22.2023.03.27.09.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 09:51:01 -0700 (PDT)
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
	Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH -next v17 12/20] riscv: signal: check fp-reserved words unconditionally
Date: Mon, 27 Mar 2023 16:49:32 +0000
Message-Id: <20230327164941.20491-13-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230327164941.20491-1-andy.chiu@sifive.com>
References: <20230327164941.20491-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_095103_027562_34F7A6C8 
X-CRM114-Status: GOOD (  17.22  )
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
