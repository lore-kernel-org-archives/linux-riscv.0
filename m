Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FE2C531C9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 16:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ec1ZtwHrXu6TJZecNZCFvbcKH0QEnT6jysiuVUNfEak=; b=TUQtkz8+XOv0I6
	3cf5zUEirZmcPR4/yI/o7eVtVLl2Ipd68KdWLyKgHQZXyd+aqBZcT4whDDnvZL2E8ov0BV/4J2M0V
	kUJk6xJ/fftZ/n+QPmK1qxDuOHiSftCx8Ci+D2tkkT0SO005IYYGU4AiEqv6v3x01YxGt3porso/a
	kiws/L97GHHOw/8p6HsYzJL8bIwjUfG6kUlTXirvBhJzpSNIKMw54JboJJ6LGTLzG11BBpuGWHOHa
	ck3n18EUQTi9X+2Hq3goPQgDTsTLxjH4sgI98/QbbJcrPkDnOOvQXsbNEoOPSZnFymJovmFHJ3/G1
	CNgGP/C1p+d1mDrJUJ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnJ6Q-0000000Gsaz-1XoD;
	Fri, 24 Jul 2026 16:50:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnJ6N-0000000GsY1-1BVX
	for linux-riscv@bombadil.infradead.org;
	Fri, 24 Jul 2026 16:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5IUFt86dCMeouqveB0y7ovO9azpKFmoPUqPgEE244Qc=; b=g19vi65e7dkYJuXOg0lTn3fBqo
	wFIU52lTnWXj5wjH7YGMsmVvj9B7auS0EcBUgOXcItx8qqNOF6R+gwmMR+vkGyM47QcvyYvNq/sdU
	YSKF5h7FeBGQ61OGOvnGi3N7cPV40jPTn/oLMqDHzLoNgUUPewwxULnSQ72uHbQZgDMSfaPKRTG00
	AfCO6gs11k2hjFnBph4UPB8jpewD5cy4XmZyk62SeDCXJrSKa1SRx5AY1h3qk1p3lMzSZb055GCIz
	o4os/bRqpA9c9u6ZGvWuX03gFlzfy1W+yMk8WMKtXexR2bRc1CJLN3Of9wiGixNTzYAltIFW0P8uA
	umHPOHzQ==;
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wnJ6K-00000002mVm-1Jfx
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 16:50:22 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-6aae11ddd13so373750eaf.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 09:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784911818; x=1785516618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5IUFt86dCMeouqveB0y7ovO9azpKFmoPUqPgEE244Qc=;
        b=ACZBbQkG3uiW3w4+pk404pyrVl1N1AaSYD4CDzX7Hvrp+l+e8DNJC3c+9aqwY7T/bJ
         DtaNP1661jA19EkNkCh/36c453of7JMr7K2/VnUvFMfXUUrG7FyBoRj6z8bGk1OGIBGJ
         I2vKYqcCUp1zZIC3Ddf85WRYG6IgjHybgACgJv1zJ/hp0J6RplkiyLKbLPE82n67MyrE
         6iSfNsMwkjftUFuMktj72/vW6+CZ+ABeeYbCNLOwWk2xc9h5sdQOt2ROK5PRnH/GOqq4
         DddXz1dWFvAJkDkWu2yiXngCPdPa8VlT2svkIWmlj2iFmDvrcD4yT51TiEHwOQNbVqDM
         6PxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784911818; x=1785516618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5IUFt86dCMeouqveB0y7ovO9azpKFmoPUqPgEE244Qc=;
        b=LSrbRTOnLzpcEf+U59EBGU/lMz4JCmUvALMQcAbHxC7lvFd+y5Fu3th69HdIGawaC0
         a86tz/8+SroACjcQhHOmRMpMmGXX/jlm1H40SKUZ7/jDdXDzU4vuKffKDGJoyD1lurup
         jXSTKPZKau/fQxaB+I0XDE0bNnz8yY985jFFCSEX6/OybE5q3EQrtSImLv1HTj7Agwa6
         wPXlPMD+mPNjZrxaK/GZ0OHNdEgmLj4XpDq6dngrGbeGOeNNdIr69Ef3uBMP3jlMq3Ld
         2FcdOBpWG9dWh2qIyyQt4BpgvHAji9hhl7fqj3w9DXbGr54uaoJ9HBlOrzMlhWOvcBge
         axdg==
X-Forwarded-Encrypted: i=1; AHgh+RrOttdhy9zkSARlCcp5l/4jt4U2ujPxhIIVqk3xS4wlYJqBbvvco1KSMj5HMrdG0Hwq56EE5A7DM7Z8fw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr8M2Oy9urk6agmGcttJIGkqgWE3HpfiO/u5zzjXtykPX4Ir7h
	OJA1n/eKaLr0Rywk+R1lULJ2PyNGa+XPAPsszud6WTx/cUIN9vSwk1Y3z31yJg5Pius=
X-Gm-Gg: AR+sD10buvhc8FZN5PRtGXT1BpixDI2tZypoMlwxIOyFsfHC7vUVxxIHIvm/Kqn0U93
	V7k40yrJBNMadAEXvK9ha4yQOVccF2SdvB3INUpAIXyWekIwK4qKphPI4pgJj37z+JIB/Y6NiBv
	Srb4jkit7ypaKI13KSmkZCeijsweD211WlCp8O7RpjdBd1CMakghXcUiQYY/nIP1hA2kEXvXkC6
	pdmcXI+ZkDIE2No05G8Ue6WDMiBbiZ6ys/Ce/7F+cOu5NPUid5rwlhrDMqTGJHPhaCXju4v+d8F
	DZ10+JNN94La828PzIB6UJQiSYvqbadLGkBViXqzt4C9MCVw1SptSy4bnsV/twRKfbPOjZ5JZSU
	ay93mlsxwjB7Tetcj1rFoDwoLVM9KL2KwYQDcZhY9YvgI1en/IAV7cPHn7S6Fs09L29znIQ/Zfu
	P+9kyficauXhRs02hM/WUaRub1VJOSLQAfl/Q=
X-Received: by 2002:a05:6820:4c03:b0:6a3:8cf6:fdf6 with SMTP id 006d021491bc7-6aad418cb97mr4265835eaf.48.1784911818341;
        Fri, 24 Jul 2026 09:50:18 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaf96f4501sm210882eaf.12.2026.07.24.09.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:50:18 -0700 (PDT)
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
Subject: [PATCH v3 2/3] riscv: vector: allow non-preemptible kernel-mode vector with IRQs off
Date: Fri, 24 Jul 2026 11:49:53 -0500
Message-ID: <20260724165001.2317788-3-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724165001.2317788-1-tchiu@tenstorrent.com>
References: <20260724165001.2317788-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_175020_480623_414D026E 
X-CRM114-Status: GOOD (  13.72  )
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
Changelog v3:
 - Export {get,put}_cpu_vector_context() to only kvm modules (Sebastian)
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
index 307ac369c3d4..f76e52de1117 100644
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
+EXPORT_SYMBOL_FOR_KVM(get_cpu_vector_context);
 
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
+EXPORT_SYMBOL_FOR_KVM(put_cpu_vector_context);
 
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 static __always_inline u32 *riscv_v_flags_ptr(void)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
