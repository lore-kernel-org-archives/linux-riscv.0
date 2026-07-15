Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79C3C4450B
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 05:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z4gwVI0ybqd944jvxCdpKwrtxe5qFcIZDg5S2VyNnYQ=; b=cioPwTLca52Hu+
	llThDh55CHQU10rzfVuNB1Xpg9+szK3+5KgvM3LEIoKundGOBMlRw70OciHoMV2LvZwugvIXn73nt
	Wkepq3NDcJsunp+7H8gxsO1sacGeLNqF/dNQXJ2IZ1Om1SxSq7OrtUn8BWGHWNBu5GIgWQnXeLBFD
	lg/ddzF2HVQeJaJ3kCPpF3M7DaGek6nNqgiIpJ5LpSQGGgnq/xyoVoxWwFDId9XjsSwp12Fl80ClI
	Cr2oyX876zjS50kV/hLxo8W51dLpDrpXqLVaoIyvax4JaqravCGdN6BywCz7eT3rmeZySDgRuyCH/
	rZwcRjhAl8PARyoehcIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjrzX-0000000Dmh8-0bCc;
	Wed, 15 Jul 2026 05:17:07 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjrzV-0000000Dmfv-1nzN
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 05:17:06 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-81e8fa1b8d6so41874867b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 22:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784092624; x=1784697424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhanRwh7zvnbA5tn7sDwLMiOA0lv2Dx4b1vq2Go0n2s=;
        b=MUcNnnUgl0xHX4TbiZenN5hL1r1mETVTPeaUQ57Y7l/cO8A2KxuxchEuDgUYSKxao+
         RekyUyDDXSpxxN66gpmavYFKSYXcMUhz39I3JnXprFxdvwWmOqDTHNFVtpDqeg8YkP4p
         IzOzBRNz0N2GAKWriyOQB6r0IcPAn8PHE8VIlHFrkLBPpvFL9B2zG4+LfFii6j/P62qq
         AnbUZaFnFpcmeNmfm6lYAaEVxiWDVRf2GkrI/gVjxUZ90b0DFqW8Hlvhb2uSXdC84pvf
         Y7ShX3F8A46QaUgdpTXnpQ8gJUFC9ZExY884Ff52+S8P60vQlSGSeL2P/Trja7gbto43
         KwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784092624; x=1784697424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jhanRwh7zvnbA5tn7sDwLMiOA0lv2Dx4b1vq2Go0n2s=;
        b=Ra9HRAyJWAaj9zcM6vyLbwU3keDt7vaJD2VfjJ7f+efV8wNqFU0bMOrICQCclv0x43
         MsTtToW7evzZRsKGyKASTamjqhCKkF03xwKQLo1NUPBApNcluFEncSdfolh+s2lQsy6Y
         x+Vcn1x9QXybwo2v37Z1yrnzYLJ8oNmV2cuBZvUTBcZCzrCzVqgUwoVz61sKUWMrvHC0
         iXsepQ9j4/oEeCHkWEcQDjyflQpaVXPfEvfYhfSQBS1CotDMm6eOcboZ53i8iiG5NPe1
         lCaXOjzdkHgJuTE5bsyePkOdQS5TG5mmsgu/gCKi0fWqhAUKu1gA0ok8mS0sSpEW1q2k
         0lxA==
X-Forwarded-Encrypted: i=1; AHgh+RoGGft0VFWXupBpxcWiaWd4bl0/WPk1FvbzvI8db74bdpwjreUEDBwZlVEicEdAYJTBHiUIsFUh0wZdFA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzL5A2XX2w9+GC5knBLV/MoJ1KWsc1yhc2hxdDbDv2US/S9A7Q8
	vEtsU+vQ6W7EeXNanKqYDMmdBYB9DTp6DCsTiAP95kGpXgLjwpXE29xIk7EWSqBDZxE=
X-Gm-Gg: AfdE7ckK/aPkVin8wWdl/QoJdioVnb3PxH+UqYXv//Sod1XHPbuMfyMg/ZCQuV3R9tw
	LHacg0YjeATxTRH+ZGV3epKyRNdpo21q/qK82KNT1oE8DiyJx8XxaVXj7RhY8C8J5a4C90ZSmQj
	jvI80XBU4TPhkmesvVGVqAfMRb/wEzdE8qpHtAvrNmsCKLPcDp2YrV+gTmcRHAYbOYCLHP+vFDA
	D/Bf5EtdSvy0da31KNrbBh3q4KZtmeWoHTKpzsF1T32mODcHsvxK1MBWv7v5XH4P1X+EMDx3ZxG
	jHNAj+Xyd4o8K3uAd/6loVHMaWS4vAPTXe8IkLix0WGTCsdOpt0+TlrE1dVMiGhnom60F2HGnMv
	eunorE4Xu20yPUuJ/2jjCKlO60subQIjF6F6a5b8+WeCemRt2OgVrWhzGkZCwHqKVnbTctbGxCb
	8qNlSoRxjhD5a0o2VIgkDSUBSieB8SOyO/2YyE8RJFb3TYOGwcja8WSVJD8s4W93+PFTiZj9tTk
	kTgQAsACknIGedAnWSzhWZS9cbKiQ==
X-Received: by 2002:a05:690c:82:b0:80a:9f1a:d48f with SMTP id 00721157ae682-81ec006101bmr36800877b3.54.1784092624432;
        Tue, 14 Jul 2026 22:17:04 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net (108-196-157-19.lightspeed.austtx.sbcglobal.net. [108.196.157.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm159625657b3.46.2026.07.14.22.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 22:17:04 -0700 (PDT)
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
Subject: [PATCH v2 1/3] riscv: vector: refactor riscv_v_start_kernel_context
Date: Wed, 15 Jul 2026 00:16:20 -0500
Message-ID: <20260715051629.1169645-2-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715051629.1169645-1-tchiu@tenstorrent.com>
References: <20260715051629.1169645-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_221705_467510_930D888F 
X-CRM114-Status: GOOD (  10.88  )
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
