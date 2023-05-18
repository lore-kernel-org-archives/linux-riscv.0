Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEE0C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 16:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TZKjtlwj+2E27RE9ws1BdnHe2nxEy130Ys/PBRrEPaY=; b=u21pG/sPxqjTYL
	szrHvmsFsvrU/Kopr027ZQiXvohx8UMFS/baPnzvcYgCdSzd58zJQxGUNmNcfs7Fvh2hl4xfqqJZ+
	xTnN6LrJaBhSqFCEXzYbIw/eoC6aQgoNJ3w6APgZcFs8bJf5UlaHson3pPbPpp7hQEbGNiqVxjw1x
	zKEFYZZtRUu4j+HhBE3tQS4COEcdAzD1aOimnBZpIYgSN2TbQWVAx885tDGIkJZjmoTcGM7pTOGfH
	X/TQRouAdXyp6dz7F112ru8StoKWMwpvnPY5GWzdknze1ovwOQtwxC0v/QPY/9f36DohemAjRCwpX
	89vcuQalQOT5aDNWWSeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgNn-00DRTB-1M;
	Thu, 18 May 2023 16:21:39 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgNk-00DRRO-2c
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 16:21:38 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-643b60855c8so2373374b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 09:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684426893; x=1687018893;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wN7ZHBcxzp7ZsRkqqH3xjhadPlnuKqjQR/mkhzwbhmg=;
        b=Ey/Kv6fYqD5T2pRmNIkZHqJshDKHFn1o47rgVMEFXsZRdMgpK3CFT3ChQdXNj+0lPp
         cdQu5Z9sN2SUfEM6Hmmj4aYIuB4U/tSGiJBgfoTCFqzmlnE3V2E8mEIPDuH8h7/Txnx1
         Sr2bCL/qlpo1cpsoKKFQasew6RJx+SprdF2Wvzp05nqmQlePetF85bxnX1tYcTEKXdXo
         1aw87RDL/IxOfdvvtijNlkciAYbhhVZDhkCYHcICqnxTdCJC69Z+IFTBP6wWSC847GBn
         aTWDg2TkfMWts3N0POuvP8VKR7dpn3p8cSiCq7TrIyeRFws/SAGA2caP8DgZdHG9DO8v
         hI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684426893; x=1687018893;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wN7ZHBcxzp7ZsRkqqH3xjhadPlnuKqjQR/mkhzwbhmg=;
        b=dVe34REdXnqMFUz7smPr8e70kIsRcvJYFWq6X4BKW417UI5zrEw57DBc5aI0G5y05y
         +MApTgLjIBhm68KrRc57AnMGTf1GgqZhOdbIORax2T44TlW+DHtPNOMdKQtQEmK6VnOA
         GLeHceGEMOFU21lxfLZ+hjQEnCK08kz9wFWfL1h1ZIvuVLFWFA1Q6h2lq3/0JL0LUZob
         YDjv7+h6pyZK4BPK6QWK3Rj5vxJHkP+Sa/HssXoQB4c/61ZdNtsHQesxbdnDlhqixZvh
         wbhNpac3c1or5OOZZlHDB8U+91HFVXdmq+eY/UtRKFaoPjdMPrl67szfzWkqKcQ6en0E
         MDkQ==
X-Gm-Message-State: AC+VfDyPZds51Ud+h+rN2Hv9hn9NQGxB6pimo0mydGwvrPKfDMvvV2rc
	ntJY/WQ3BE4TOquLdtOVtxx4Vu/wbnzP2i0UkkguAEstAF/Z99YEAGYPVd1T+hQKvHuNi4UGsTt
	RHM2t1QYf0E3bo4UA1vd4ut6/NdUILNdKmaYo73hykkZf6ttZU+3hyFif7DJAvry9TzhQkBo16Z
	7+dVe+Y32FM5gw45A=
X-Google-Smtp-Source: ACHHUZ5a7mpnEfLkm2ncBuEwvmz7HinzrDjpZDDOTe33aa1+1AbH0IGdXd8YEL4Z6HnfYyEePA9Dow==
X-Received: by 2002:a05:6a00:2d0c:b0:643:aa2:4dcd with SMTP id fa12-20020a056a002d0c00b006430aa24dcdmr5636544pfb.16.1684426893158;
        Thu, 18 May 2023 09:21:33 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id x23-20020a62fb17000000b006414b2c9efasm1515862pfm.123.2023.05.18.09.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 09:21:32 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH -next v20 13/26] riscv: signal: check fp-reserved words unconditionally
Date: Thu, 18 May 2023 16:19:36 +0000
Message-Id: <20230518161949.11203-14-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518161949.11203-1-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_092136_852243_90DF9DC4 
X-CRM114-Status: GOOD (  17.83  )
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
