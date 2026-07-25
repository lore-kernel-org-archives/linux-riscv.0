Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4483EC531C9
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 00:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2jgrrrnAYMU+vRuCkXugQBGn3A7vWTyeroBVLqgnLvU=; b=fXisWELrOeX4o2
	q2tzUZDWuK8QdaY9bjPGykBW+k/ODX8HQN3KIWskHk0J38q4Mll2mcwGeRTV6I9MMG/DcekXyO/Ek
	XwSbAfGXjJINlhDeJqCP8T6tuYZfFvCBb92MRvAYU4/HTJCQyNhMOv+FeUPd6gr1FWWvovAOPBL/E
	UiMXRYjYzwBVc80Y0f/6SRCYbHzHjaKqNi7liHmWaWdObyR4+Mrk1Y3e3WUJzPoSAkh8fJuWcL1/x
	HcXn2EqA6l7QiGgqmvyOvdu+5ylHvMjADRpwL8j449CSjLUaPjjfZctOJTkWBslD351e0eWAT+erY
	5HT88whkqAIZxn5e+yTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQ5g-0000000HOsJ-1wdt;
	Sat, 25 Jul 2026 00:18:08 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQ5X-0000000HOku-3szX
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 00:18:06 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-6a190528769so372325eaf.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 17:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784938679; x=1785543479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYj46W8Df7hirMITCsNQUAF2P+9YRrFHR/TmGqySuFI=;
        b=arcN+khOUvOgvOemTBJGK6Q1s/deHLCfSLNhC7v9y7i4ErSR1psCj710KICSo+4IGg
         rWieBvGGGLCDRvv87sQgoMTi97ZyRqbr2//hIXDTe6HDzN4+tUTvVUsR0RI/Z429bO9z
         BvzuVu1CmW8wjAnpbEzXInrOXiVqKol+4+8pfeBINdjQoRtflH6V/zJQbC6Rxso0w3sc
         yK1vP5S0IP5gGlchxWjlGnVnVpO3V7by6qahHR/qYNYB8q8xIsD3HEsV4OlbHb3HueNM
         1clErSOp5+oh+8cR0EZuNYHgBc9BTNPFHyUbODJYVofFh6bzwy8gGCO/sg7lYEs9R/7p
         SRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784938679; x=1785543479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OYj46W8Df7hirMITCsNQUAF2P+9YRrFHR/TmGqySuFI=;
        b=n+BMZ2khQeAsjdjYYTMxVHb2P/IpfAYOFIsCBYTgD/iKAMfQWg4YpxBbQ9FId+X0ej
         zKA9hNUJY4pTyQvJwAntrhg3EtFqOR5D9ZK8OzunydkKV6CU6HKiXG7krLMvDkVMMH9a
         5ZQh70+9TCtK8z/rFDsBwF+RVfFAwnuNmE95LzcLgCEUG13f2A7duoSfki+BaIxQ4pjr
         KrFDcGqkGrWsPoca/KexU+Y99D/OmJwhfLHVIGnT/wuj36zUfw6Ie+jO7aoEwgXFO71n
         fNrI6YPTgAXWCaUZhqhlTQC405pAj+m4+I1JmUCIzXh3uYN6C16g7hYJAs/hBw5yEOim
         g+sA==
X-Forwarded-Encrypted: i=1; AHgh+RrpfWueA9Oi3h5lBvZgA/sB8ztupAa3jikb2IcA/W+/WuGwI5G1HzzgMWzHSHufAFTdbOsWYdS4gfbRLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPZWU+UK34sGgVM29aLm9k8qMWo0W7kLb4HcftOuk2xoZEchrY
	MNnBH3n/TeVZ6E+BAEVARZPdfLFovKlpXbbPimvFGq4ixpc5eWTLrdlU3awg7vhcjY4=
X-Gm-Gg: AR+sD10bvB9OzfDgbCnw3C8BQ369F82elqHUUsu6SxhFtScEDAL/A3IjEU0Mpbpf/w+
	3qrqdrpj02ZAWgbZvHuLwH0+wRD/0kfxipaCGNr0nNcC+MI6H5+uDYJFslnE/XRfBrdIl8OZ4CM
	aQTSOfPM1gepVuaqEY6b0BJItDm8VGKgzr59cPZVwFbGnYzntoT6SJlpa/BldeMRj6h7bJWGWY0
	g06IMJMjYL2jaZ86DlA668qVdvVKYX/TDB8mFepjMyoWVcR9E9ZgZWF7Qd4ac1Tcic/qg6oGIBD
	kXZYs/lIjkVVN0hFRfvyYCjB8C8Uh8qIT+VqZuyS5Erltoheptl+Fity7pAGFdazfJJ/HIUALOh
	YsH2QGGADuklL1NnVbkBIhONlENsLSZqLPVnFOqX8f46q1EmUDorm6AnPM5rUrMvjlkQ3x3ytp+
	f7HKQ0F+u1FlFIQWAqbpyHc7ukChwOCNmEWGM=
X-Received: by 2002:a05:6820:6ae8:b0:6a3:c5:30ca with SMTP id 006d021491bc7-6aaff9916e4mr432102eaf.31.1784938678681;
        Fri, 24 Jul 2026 17:17:58 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaf9385b35sm884057eaf.7.2026.07.24.17.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 17:17:58 -0700 (PDT)
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
Subject: [PATCH v4 2/3] riscv: vector: allow non-preemptible kernel-mode vector with IRQs off
Date: Fri, 24 Jul 2026 19:17:41 -0500
Message-ID: <20260725001749.2579274-3-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725001749.2579274-1-tchiu@tenstorrent.com>
References: <20260725001749.2579274-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_171800_040873_682090D2 
X-CRM114-Status: GOOD (  16.40  )
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

Also, export both symbols so the kvm module can call into it.

Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
Changelog v4:
 - Include the linux/kvm_types.h to prevent build fail (patchwork ci)
 - drop preempt_v_started check in may_use_simd()
Changelog v3:
 - Export {get,put}_cpu_vector_context() only to kvm modules (Sebastian)
Changelog v2:
 - new patch since v2
---
 arch/riscv/include/asm/simd.h          | 16 +++-------------
 arch/riscv/kernel/kernel_mode_vector.c | 19 +++++++++++++------
 2 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/include/asm/simd.h b/arch/riscv/include/asm/simd.h
index adb50f3ec205..f176a8072c62 100644
--- a/arch/riscv/include/asm/simd.h
+++ b/arch/riscv/include/asm/simd.h
@@ -36,20 +36,10 @@ static __must_check inline bool may_use_simd(void)
 	/*
 	 * Nesting is achieved in preempt_v by spreading the control for
 	 * preemptible and non-preemptible kernel-mode Vector into two fields.
-	 * Always try to match with preempt_v if kernel V-context exists. Then,
-	 * fallback to check non preempt_v if nesting happens, or if the config
-	 * is not set.
+	 * Only non-preempt_v can nest on top of preempt_v, if non-preempt_v is
+	 * unavailable, then preempt_v is not allowed.
 	 */
-	if (IS_ENABLED(CONFIG_RISCV_ISA_V_PREEMPTIVE) && current->thread.kernel_vstate.datap) {
-		if (!riscv_preempt_v_started(current))
-			return true;
-	}
-	/*
-	 * Non-preemptible kernel-mode Vector temporarily disables bh. So we
-	 * must not return true on irq_disabled(). Otherwise we would fail the
-	 * lockdep check calling local_bh_enable()
-	 */
-	return !irqs_disabled() && !(riscv_v_flags() & RISCV_KERNEL_MODE_V);
+	return !(riscv_v_flags() & RISCV_KERNEL_MODE_V);
 }
 
 #else /* ! CONFIG_RISCV_ISA_V */
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 307ac369c3d4..965c8edbe984 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -10,6 +10,7 @@
 #include <linux/percpu.h>
 #include <linux/preempt.h>
 #include <linux/types.h>
+#include <linux/kvm_types.h>
 
 #include <asm/vector.h>
 #include <asm/switch_to.h>
@@ -55,13 +56,16 @@ void get_cpu_vector_context(void)
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
+EXPORT_SYMBOL_FOR_KVM(get_cpu_vector_context);
 
 /*
  * Release the CPU vector context.
@@ -74,11 +78,14 @@ void put_cpu_vector_context(void)
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
+EXPORT_SYMBOL_FOR_KVM(put_cpu_vector_context);
 
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 static __always_inline u32 *riscv_v_flags_ptr(void)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
