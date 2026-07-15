Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00264C4450B
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 05:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t6srDnIdbcwk+APZyGAbTTltr/X7YCXfaps/TtxAf4g=; b=vyQ673kVWZYA1Q
	XxvkTwrlKY94AsvjXkywLy97ZB79K9LKbJojGAmhCsfxB8IA4GTkftQsMnaOgTOOvK7Im1uZLhIJ0
	XXgyXrCvHf6wrsIHsIWELr8getFmmvdKXUvzA5Z4lcNDL13PnXgHXHTfa91nPCdzuSC5RzWdIysu5
	zceJU2XakOuj8237eAJ7v+CPlBmUKE0Nz7wrxNoAWps9ePbSPRuYCtKmqiiQCKq5aPpnbNQqOs+sI
	UcfSHG/VWmcY3q+7NrcNL+ybxnKxuY8vBveNO2GtndDhq3VJmJ8UwYWpKFoBs9R6urSG2mQZdDKLv
	WvDs5AmzaAZ50Me7McpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjrza-0000000Dmk7-1mQN;
	Wed, 15 Jul 2026 05:17:10 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjrzY-0000000DmhL-1bBV
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 05:17:09 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-8051ad12d23so16691727b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 22:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784092627; x=1784697427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/mLoZb5ms98D0YoseVgyr3YqsEnYg/BNwWq+M/OSz/0=;
        b=VvdSvt935REc+GrkE2ZJ4Jy90MHiVTrDiFfZ0B7l68kJf3bZUNWmuG63k7ENKdpTYV
         tMBkA4LldkwgdURUE+PtkDLhtVg4PEPlQdRvG5f1+r8H8AIxSJFsbNHl22BDyUDgNITS
         D12lVBhgEk27uyTRNsnb5nRFwNv0q4LHExLZkFkzSmS27R3Gab0d5u60iYx9g8B6rfM+
         O3sKKBjEyIHAWrnkGcv53wiqiXPKHPLOibYFFfPp0TjA4C6NuSHwfDralKEMZnRa214e
         3I+B9v+mOJyq+z9hzcEoNLjrS2fJqTWXXswcaGBS7TEMhMvQ5FyqP6LXyLn6FlCMWx0c
         2I6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784092627; x=1784697427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/mLoZb5ms98D0YoseVgyr3YqsEnYg/BNwWq+M/OSz/0=;
        b=WOXWp8VYBLrnOxTiPL5mCfiEFybC9vZk0KlnNwKj5OMkpg8FhK1aam5obl5zflZSTz
         MI6yWGMzehoScCT3QAoPBiKcJhtYnpPsfXMdzW1+QiiMqfhK2/dFU2pEit4sYt8C7pkg
         qb/X2PlWDCYcg91lLdjups3JxBgBxEIs1WvkIBZPLIC7HGbZFHUXtpx1RHjLn4pjRCXD
         VUAbMXjBliGspyONMWTIvJBosNaIz0l7GdJSAmrcCNhuUQd7BqEf1U6O202MBPnzNsod
         ot3wKqTJfjFv922FQa0+xifTyll2RGdvSRocgztv59MT+ZWQ+3vzSfEMVMybzR2+APu/
         gNAg==
X-Forwarded-Encrypted: i=1; AHgh+RqYMToNzPvGndyU/gc275D9e8vsBv5y8mpf6bdkArySiBTS/4QabW23eABuMlH129tMKq9BPb9a0Gj20A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVHratzUdvGW+AKFXcCpO45cf8unnB2pk4gKQPS1YpWQxIfLvw
	MkbzihtTcpLjAvdKO0EIGJEsolaGA+5wtsguw8t1GMasd4l5e9jRdb7kftBhFfscPhg=
X-Gm-Gg: AfdE7clKRY7JPDc6SQpnDESQSQlBMjRr8DU9xlzHkoteLuYRvpE+aKgVICg00S1no6w
	XOhkEAWj9HxluHaP/lJw1CfcCFMBkEq/oVfzhgUX0zF+qWmLxUXBMwzvzSve8faHPhCCg/J8Fp+
	odPhYi8S4I5ScCavI+SuWKY1Mwh2X/ZTHl289xfD8YRl/dEl9GFSAOdW2xn6bmzIOsepYBrCoF5
	kRF80j/RK2MOTDVJvOZIvvgYACdHxTzo7m+zSTDuue1tCVQkKhnsR916YUo+HKcrg03XZFd7PPo
	rtATGfxKVePZV4QSPY1ojg12qy7kSilKGOIsYBjgchrhvlK9PvvyPnW/fzDQq3dctG1FnkMQDr5
	hsssXstlvundKMWS2aHSWZ4FWVG+JCAHcKwMLbFLJWOvx0pQAB2Ju0G5E+Tc8o4ni2EVXVATLbO
	RkymBuyv116c16mY23jhG0YQEzi03c9b1v2hzeAymUnKISk2RYS1YWRcPQZOaWlfqvWx0t/GIxt
	yoMGaF1uBhGgHWH1CJc9BZIgMQRhyYwre6KynwFBgfOjw5pC/o=
X-Received: by 2002:a05:690c:6d0d:b0:81e:c972:e8c3 with SMTP id 00721157ae682-81ec972e93emr25328327b3.29.1784092627340;
        Tue, 14 Jul 2026 22:17:07 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net (108-196-157-19.lightspeed.austtx.sbcglobal.net. [108.196.157.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm159625657b3.46.2026.07.14.22.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 22:17:07 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: anup@brainfault.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-riscv@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: kvm-riscv@lists.infradead.org,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com
Subject: [PATCH v2 2/3] riscv: vector: allow non-preemptible kernel-mode vector with IRQs off
Date: Wed, 15 Jul 2026 00:16:21 -0500
Message-ID: <20260715051629.1169645-3-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715051629.1169645-1-tchiu@tenstorrent.com>
References: <20260715051629.1169645-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_221708_445100_A1B5C539 
X-CRM114-Status: GOOD (  13.66  )
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

Similar to commit 7137a203b251 ("arm64/fpsimd: Permit kernel mode NEON
with IRQs off"), we are upgrading get/put_cpu_vector_context such that
kvm_arch_vcpu_load/put can be safely called under both irq off and
regular process context.

Also, export both symbols so kvm module can call into it.

Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
Changelog v2:
 - new patch since v2
---
 arch/riscv/include/asm/simd.h          |  8 ++------
 arch/riscv/kernel/kernel_mode_vector.c | 18 ++++++++++++------
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/simd.h b/arch/riscv/include/asm/simd.h
index adb50f3ec205..678c8b97cd49 100644
--- a/arch/riscv/include/asm/simd.h
+++ b/arch/riscv/include/asm/simd.h
@@ -44,12 +44,8 @@ static __must_check inline bool may_use_simd(void)
 		if (!riscv_preempt_v_started(current))
 			return true;
 	}
-	/*
-	 * Non-preemptible kernel-mode Vector temporarily disables bh. So we
-	 * must not return true on irq_disabled(). Otherwise we would fail the
-	 * lockdep check calling local_bh_enable()
-	 */
-	return !irqs_disabled() && !(riscv_v_flags() & RISCV_KERNEL_MODE_V);
+
+	return !(riscv_v_flags() & RISCV_KERNEL_MODE_V);
 }
 
 #else /* ! CONFIG_RISCV_ISA_V */
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 307ac369c3d4..6627e1a82e19 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -55,13 +55,16 @@ void get_cpu_vector_context(void)
 	 * disable softirqs so it is impossible for softirqs to nest
 	 * get_cpu_vector_context() when kernel is actively using Vector.
 	 */
-	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
-		local_bh_disable();
-	else
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT)) {
+		if (!irqs_disabled())
+			local_bh_disable();
+	} else {
 		preempt_disable();
+	}
 
 	riscv_v_start(RISCV_KERNEL_MODE_V);
 }
+EXPORT_SYMBOL_GPL(get_cpu_vector_context);
 
 /*
  * Release the CPU vector context.
@@ -74,11 +77,14 @@ void put_cpu_vector_context(void)
 {
 	riscv_v_stop(RISCV_KERNEL_MODE_V);
 
-	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
-		local_bh_enable();
-	else
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT)) {
+		if (!irqs_disabled())
+			local_bh_enable();
+	} else {
 		preempt_enable();
+	}
 }
+EXPORT_SYMBOL_GPL(put_cpu_vector_context);
 
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 static __always_inline u32 *riscv_v_flags_ptr(void)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
