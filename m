Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C26C7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 10:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TZKjtlwj+2E27RE9ws1BdnHe2nxEy130Ys/PBRrEPaY=; b=xuh4JIaDj76tTd
	48/bW2yeepy69o6KUO6M7BTCF1L3eReQ83CnvLi3062fUBZcj8C1mrdMHQFZG3e2Cml5FKYIE35PV
	UtNpkMk7owicimBFhimWSGi4SUId7UZO6o/hwSm2zKY/QsDFdKTOY2TRpkjAQGIYJKhJhxJP2ahmr
	pAl3c2oRoJzkkVfE4CFPqAomgvjTWOKnsQe+19Ch8j+SNFW7KFRc0jRbTJAQNg1eJsJBbaix2pHpy
	rZgTrq1Cqbu+nB5VrzvkE3wrVpnbX0stnjcwF6/sFSIV1Zf5KzcztXu9hz67gA56MXcc78Iwlka/r
	nWlKII7oRxPv/Zz02Isw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKe5-002tlc-2l;
	Tue, 09 May 2023 10:32:37 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKe3-002tiX-0m
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 10:32:37 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1aaec6f189cso38977325ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 03:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683628354; x=1686220354;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wN7ZHBcxzp7ZsRkqqH3xjhadPlnuKqjQR/mkhzwbhmg=;
        b=ccuT5IOXOWZXEkVCczhFZQg1DR5ApUiwiB8G4HWAXcLvcWjy0n/7uX/tX0xWcCeAIp
         ygpMvtU3DicpYIZ1v3/Mz7ceykNagPLEo6d5v4G3lPVpmtLGwHsTIouFPuaRoUwKVydc
         3M4+QtgPyg+Typ3Jkoyl11WGaeV8vPEx7miGPoBIK2jKe3FQ7r9oz6rxVuyNG2tS9gpH
         zsAf/LzqkyE5ImJOqBkabJ4JW0Jc+Txd4saDBjw6QuwVgyJlHKwsHlnzNWlfMaunK/ZM
         lEkb45jlwXwoOn4oPAjO1uQ9HGVE296cqjsu4NzPq2Yiyb9kQVmq5zCgQ+m7R+RGVbGG
         BIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683628354; x=1686220354;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wN7ZHBcxzp7ZsRkqqH3xjhadPlnuKqjQR/mkhzwbhmg=;
        b=hhSfcBN7lnAz6LJzkOYSIErUDbi2llBU3pbE5NjBDfjV8eOPHEe4GvpJQXhCbYKBH7
         oXKCsa/Y0PtL/bCcuyhqoLRkzLpf094Uls6auHxKi25da8xd1OwCGAf2GcRm9S/nXPkk
         fv/v+dmA7ap3DS86f9Gpi3IkXNNdpxDFja5SXGbtGsJUd+aoWWk3YVCLh2KdurqH8Bys
         WMUkw6C6ZSg1IFFDqwaMII1jkKL47/aRg3XcmhZxU+ADeY9omgopIOSJGkFxomCNTMTs
         tmy5Y6CCZNLT/7/4CWpCN8SNlaccLoU6QYWneWNbWGdgVRVncmf5iaMDXlt5Bbt0V1Sy
         CC2Q==
X-Gm-Message-State: AC+VfDwtgS1zc1PS5KUj9LnBDWXq1KW1qVDuwbP3mCzShWNH9Hwy1I3U
	L7lH0tLnQ6E2uUyK7UNwUsV71XgA9YcCtwzLIXrq4QH7ZY7vudQQ3Q9uINwQWl84ciJ7jMyuagV
	xTjvf0je5aaSZl60NiWZ5i6eLnf5TB7iY4H54s2NNRY0JkR4RjKz6VmXhwwRYeioObqSt9qrk6X
	psvQadGRKlpHmf
X-Google-Smtp-Source: ACHHUZ5JVUtGHm+RvvF2AiQVn+ndz7H6SRxoKr9k5Gp1HsvibL5yeUcf5X09oziZZrqPYY/Z2Ayoaw==
X-Received: by 2002:a17:902:f54b:b0:1aa:fe52:a827 with SMTP id h11-20020a170902f54b00b001aafe52a827mr18554926plf.13.1683628354237;
        Tue, 09 May 2023 03:32:34 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902d4cb00b001a076025715sm1195191plg.117.2023.05.09.03.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 03:32:33 -0700 (PDT)
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
	Al Viro <viro@zeniv.linux.org.uk>,
	Mathis Salmen <mathis.salmen@matsal.de>,
	Vincent Chen <vincent.chen@sifive.com>,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH -next v19 13/24] riscv: signal: check fp-reserved words unconditionally
Date: Tue,  9 May 2023 10:30:22 +0000
Message-Id: <20230509103033.11285-14-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230509103033.11285-1-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_033235_391067_401973D9 
X-CRM114-Status: GOOD (  18.36  )
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
index 9aff9d720590..6b4a5c90bd87 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -40,26 +40,13 @@ static long restore_fp_state(struct pt_regs *regs,
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
@@ -67,20 +54,9 @@ static long save_fp_state(struct pt_regs *regs,
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
@@ -92,11 +68,30 @@ static long restore_sigcontext(struct pt_regs *regs,
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
 
@@ -147,11 +142,17 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
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
