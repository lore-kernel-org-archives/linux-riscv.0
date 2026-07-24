Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7F3C531C9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 16:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z4gwVI0ybqd944jvxCdpKwrtxe5qFcIZDg5S2VyNnYQ=; b=nYgnDpVWmFNszB
	53E1rp2kIOCvv3lDRE0DtQhxZTL/D6EGmwq71roPfVnZNTLqwsH5nlHmNu1A6QDJoc63QGltGv/zy
	8bqjgpKX4SdE6kskqqB9++iVRQvJbgWrFgnT4QDkdsRwlY9tIS2JV1t5HjKkt8iXHkTG3+ZXWhf6O
	W8o5n8JnEkOMzcnlYsfWD1z8W+90le0QQkoOZ/Q9tmrNF0/Bv6MsigJJ4dSrNVj+C6vbnLUJR526Y
	k/XydmqZPySM+vMpHN0EbsFG8hgWjo+DX07RPCZGRzhGgSVlH1/GColI1bzV/TyXjaRrUlBDyEhSH
	XGrghwF6puElup9LI7Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnJ6N-0000000GsY4-0bYm;
	Fri, 24 Jul 2026 16:50:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnJ6K-0000000GsWk-2kkS
	for linux-riscv@bombadil.infradead.org;
	Fri, 24 Jul 2026 16:50:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jhanRwh7zvnbA5tn7sDwLMiOA0lv2Dx4b1vq2Go0n2s=; b=ZAhchYd0FDOgBEkJM/yeu2IBg4
	X2Znd4eVvoHUbOTsjiRUjOc6OFLVckpQ0V+QWwd6jkLEnDOroPRa2QITnCEbYe0YI+4PnCZWPKDfe
	OuUZ2+xD4ry5trofK0IIkbQTuXk/QfeHhMFRx7Pxy1x6HT0s4Hdq9XtIc+U53wp0TuGcOlvc4SU1a
	hB70e3pDdaohtyaEj/X1qLWB1Rmj9+/VA4+PFXJzy3kpHXasfCf2uDRN6p/s5Sev7NJg4jA3owgzl
	9XvaeTn0Ie3j109LpjTJSdzIF9WBgEjh+NqHPdcnp6Dftr1AneiOKR8PX8XBylh+hgU8u4I5lNLEe
	Bce0pA3A==;
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wnJ6H-00000002mUz-2Gjg
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 16:50:19 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-6a31c05e092so258872eaf.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 09:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784911815; x=1785516615; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhanRwh7zvnbA5tn7sDwLMiOA0lv2Dx4b1vq2Go0n2s=;
        b=P2gnpmlN0xIuTOSRVzzAQW9SdyNnwtGF2wtcIyyd4pSSf15qhonWj38SHWRBmF0F07
         56LcbfjwzuPX0gWye4uPjF8047+7P6nByvA1ShwuM9OP62gUatV29n27fvRXCv3wn1py
         d6I+iiyzmNWUEnMfTzX5kzwiHdpkrrOupus19gGZMkhgYF3Cy9HvdBO9eI8MkBGCaPig
         jd8RClYhulrM3G5z1CoOiZcklzJ5ySZpiuI/acuV6xEOhBqO55BauP+ZL+UqZCR0uwCS
         Jq83sHpl6cT+bqhSoo5TTtM9vSSN/BVsEUrlWhBTLVtzBCCDu/3R+cvV9GtsiC/ilwpK
         H/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784911815; x=1785516615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jhanRwh7zvnbA5tn7sDwLMiOA0lv2Dx4b1vq2Go0n2s=;
        b=So1GQG2zXPvAfFGwwdpsLHlLv4a+woPgvU6yUTBbFx6VniXhMroDGJPenBGO06Vn0Y
         QJytxOtVogJ9kRoNPLcN09MAQC4x6A/dD79uyrslUzhEyyX3gTKADyjehhFJeBdZ8gsZ
         8cIFmX0W4BO3TxYggfv04Szf8z1Md39DDItCr13lutBtwxCI4OdKUgUc/bSGY1Pm9vIq
         EDxNn3zrP6qni+1UcNIl2EYOdlCMK5hYAjpYekwYJkZgFbcHk6KmEFZmJMqlrPyJj8WM
         1j+eZlvpZD4pA3Wb/6dqaq9zgA6AnsmvPAJOf1sBrvpJ1oXzm7ffmPxhX13TgHsaTsUP
         49EQ==
X-Forwarded-Encrypted: i=1; AHgh+RoHlQKPiDts3n4mRvgLvt2vu0JmFR74AZLqqUCEmYpIW6bICuPhaOJ+5sVdKns7o6UFFfBcb2Vu53SMOA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8Wb6DYU2sTVlQTSJ/sxq4TAv2dgQF/d9x9xkOjEj3O37uFbrs
	pYJRqFgYWwsVVW5Qxwx5YASIsfAmozX0G3R+eDfp8OCM1bBesWlDNBdCFYSi23GGow0=
X-Gm-Gg: AR+sD130Ui9ya/i6U0P2zep2aETtzZmhd1FJ+AAknl0YfZfto8v1Vu7Al/bcl+0KxTf
	q8bsmOtHawdpnQRw2328ljTXl7i77Y703uRbOVRUFhV+Gyl/jpiLGo/eEG/IEzAar75dixXY6SU
	kyShkI318BqgvJo09+/K9ZQX83YQYam0t2n7t2yikabFDCqhP/dAcBVnhGbRH8LFaVTuddep3ol
	f8ZUACxFL7CiNWH1Fu7TNmJ06RDCB1a+U5fYmoWVXuW6uPD2O1Zp07DzFEWET6fZfAGl8B6N00e
	r21/zk2ALNtu6SvjPcOSBtydmxsrlp4mz/MTSmTmABmWUOpG0n44MX3xL2In6h2b+nm7DOxVAxb
	pAwgiLu2XIODeG4e822U5AskxFeV/eNKHlvfTleETIvaPGM6J+odIH9lV3F8rhKcy20WdntZcHg
	Mm4OwGPwW22Xq6IrLI8VNPt9OiGHjQQhfKG8c=
X-Received: by 2002:a05:6820:4c03:b0:6a3:813d:c83f with SMTP id 006d021491bc7-6aad413fd96mr4677526eaf.53.1784911815442;
        Fri, 24 Jul 2026 09:50:15 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaf96f4501sm210882eaf.12.2026.07.24.09.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:50:15 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: anup@brainfault.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: kvm-riscv@lists.infradead.org,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com
Subject: [PATCH v3 1/3] riscv: vector: refactor riscv_v_start_kernel_context
Date: Fri, 24 Jul 2026 11:49:52 -0500
Message-ID: <20260724165001.2317788-2-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724165001.2317788-1-tchiu@tenstorrent.com>
References: <20260724165001.2317788-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_175017_905032_09D46C29 
X-CRM114-Status: GOOD (  10.38  )
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

Refactor riscv_v_start_kernel_context() to drop `is_nested` variable and
simplify the logic.

This introduces no functional change and works as a preparatory patch for
the kernel-mode vector fix.

Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
 arch/riscv/kernel/kernel_mode_vector.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 99972a48e86b..307ac369c3d4 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -121,7 +121,7 @@ static int riscv_v_stop_kernel_context(void)
 	return 0;
 }
 
-static int riscv_v_start_kernel_context(bool *is_nested)
+static int riscv_v_start_kernel_context(void)
 {
 	struct __riscv_v_ext_state *kvstate, *uvstate;
 
@@ -131,7 +131,6 @@ static int riscv_v_start_kernel_context(bool *is_nested)
 
 	if (riscv_preempt_v_started(current)) {
 		WARN_ON(riscv_v_ctx_get_depth() == 0);
-		*is_nested = true;
 		get_cpu_vector_context();
 		if (riscv_preempt_v_dirty(current)) {
 			__riscv_v_vstate_save(kvstate, kvstate->datap);
@@ -148,6 +147,7 @@ static int riscv_v_start_kernel_context(bool *is_nested)
 		__riscv_v_vstate_save(uvstate, uvstate->datap);
 	}
 	riscv_preempt_v_clear_dirty(current);
+	riscv_v_vstate_set_restore(current, task_pt_regs(current));
 	return 0;
 }
 
@@ -187,7 +187,7 @@ asmlinkage void riscv_v_context_nesting_end(struct pt_regs *regs)
 	}
 }
 #else
-#define riscv_v_start_kernel_context(nested)	(-ENOENT)
+#define riscv_v_start_kernel_context()		(-ENOENT)
 #define riscv_v_stop_kernel_context()		(-ENOENT)
 #endif /* CONFIG_RISCV_ISA_V_PREEMPTIVE */
 
@@ -206,20 +206,16 @@ asmlinkage void riscv_v_context_nesting_end(struct pt_regs *regs)
  */
 void kernel_vector_begin(void)
 {
-	bool nested = false;
-
 	if (WARN_ON(!(has_vector() || has_xtheadvector())))
 		return;
 
 	BUG_ON(!may_use_simd());
 
-	if (riscv_v_start_kernel_context(&nested)) {
+	if (riscv_v_start_kernel_context()) {
 		get_cpu_vector_context();
 		riscv_v_vstate_save(&current->thread.vstate, task_pt_regs(current));
-	}
-
-	if (!nested)
 		riscv_v_vstate_set_restore(current, task_pt_regs(current));
+	}
 
 	riscv_v_enable();
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
