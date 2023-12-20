Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035D6C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 23:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SyL8SE6V/CsfGocFTgN1SlGwHLTd0VaoF6TsZpgl2fk=; b=xDXyUbNyDiys93
	gqFs9EfRp/ZVwQfJwrjoPqaukNTk1X5eF15s/JAaYKGWt+CkaPR72A6mHGA7pEGo7+I2Mr9l1DM78
	TFJBYxzeUcGMCsm3/DAtra7UFnuT8ae6y3SmURwZwu9cLHOnfGU8qb0WvYyEv7gWpIFjJvEIL34jM
	AHhdJPjVsxDYhxPU/Ff4B3WlSnEP844GU7/hq6XzDBwdtUopW2qPEPpiPtWSVG4qANmUdmSpiE3W0
	NusICkwJfGCScbz07snvHnNJ6ir/7htWzKT+vrqoH+sp+fCSMHf04pXOBZGqcz9IKcdlTCZAB9yWW
	YBG6gDFt13rCxlgHkwmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rG68O-001GY5-0e;
	Wed, 20 Dec 2023 23:37:52 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rG68I-001GVS-2u
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 23:37:48 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-1fab887fab8so117674fac.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 15:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703115465; x=1703720265; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqZmArtiXcDp/s2cDCE6VomUeBtSGPPb+28mpDKaCFA=;
        b=p8w0RuEPH/RMhHLvjX50THAT5mAqBYLgt9rM1HdNgQwAroDsUngCcGU4cnRJBlIJBv
         g8glrt0Fj+fbErrNEv4g7/9MVlrxrZvEfFZSvGozVG40DlpamsavpEH2Isxa2WNOfHlg
         u8YhCatliRdJQUYu3fZkyk2JxofpQ16C0766Xg5snwJXyfzMPLW5+Iv69cjHWL9FS+w8
         Dmmwdrk66ZH1NgUy9gTvOVGSl8sdOW7qA+me3hOyajvP4oL5xNEOVXROOnoeJ5/qdVpw
         D7mfxkTBYedPcuFCJmj0wo6FeJM/iEuWUv9QTxWnO6xQFMdHHPe1R5d5JuL7TrtWD78J
         9/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703115465; x=1703720265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqZmArtiXcDp/s2cDCE6VomUeBtSGPPb+28mpDKaCFA=;
        b=SicdDv4oZY0DEgd3XPy/lNWWCsFjuTUtHaa7sop7TpoLEP99WM9rCs8CQxvZ1B5xdh
         VaylvlQyfo5FKlYWuYTVeYmVKyLafTwzjlodkjlngW5WDSRmsMGF5V/sR77qPxDIafDj
         sL632THUizXxlFzl4hfnYLfd4RR3EAe18EBUFCca1WIs5RlgOomrcZRgk846nRATjWkZ
         XRKhGiCYizx/1wAkEuaMz+1Fee8U6XrvQLzxYeEDNRvJStWwo4eUR85m6luYEgHNrSX0
         xXjM7lIYiT2IMrUDOHitszl42TqW88XhebIFkiVtl/0YK/++OlWx5ColBtfwHapyunFS
         /E0A==
X-Gm-Message-State: AOJu0Yyj4n5EXfhzKLG/z4yJLTq9HUt9ZBg8EK68prB3+SmGNpl2dnRB
	POCCVI8c+kvg0gpxzHhbHH4eBiU50A9hv7LDpgY=
X-Google-Smtp-Source: AGHT+IFeBdaPxfNAXv1ibol3y9dWmT3hdCcKUPEGPwsCmFqAkFbMInLhFpUXJrzsQqwTH1nXqMZtFQ==
X-Received: by 2002:a05:6870:970f:b0:203:bcc7:8fa2 with SMTP id n15-20020a056870970f00b00203bcc78fa2mr672978oaq.5.1703115464850;
        Wed, 20 Dec 2023 15:37:44 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id k5-20020a056830150500b006d87e38f91asm132834otp.56.2023.12.20.15.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 15:37:44 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 20 Dec 2023 15:37:40 -0800
Subject: [PATCH v13 2/5] riscv: Add static key for misaligned accesses
MIME-Version: 1.0
Message-Id: <20231220-optimize_checksum-v13-2-a73547e1cad8@rivosinc.com>
References: <20231220-optimize_checksum-v13-0-a73547e1cad8@rivosinc.com>
In-Reply-To: <20231220-optimize_checksum-v13-0-a73547e1cad8@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 David Laight <David.Laight@aculab.com>, Xiao Wang <xiao.w.wang@intel.com>, 
 Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703115460; l=2270;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=zAvCCM1AIoiNlx7AQwltNFw7ekzVRWkGRkhZ8BNL3iE=;
 b=/aoALA0sPu/mQrg3wwtXeXAI2bR1ghCTU4z4qItLaJnMLYVXoeBeX/8KZsrRPbIY0Vt0eIUCZ
 CCU5N5pjCbdA2zEuvQCl+CIPeGSez/Ug3N2nd09YxVNQiBASexBl8Fz
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_153746_936413_3FAA8513 
X-CRM114-Status: GOOD (  12.32  )
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

Support static branches depending on the value of misaligned accesses.
This will be used by a later patch in the series. All cpus must be
considered "fast" for this static branch to be flipped.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h |  2 ++
 arch/riscv/kernel/cpufeature.c      | 30 ++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index a418c3112cd6..7b129e5e2f07 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -133,4 +133,6 @@ static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsi
 	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
 }
 
+DECLARE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
+
 #endif
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b3785ffc1570..095eb6ebdcaa 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -10,6 +10,7 @@
 #include <linux/bitmap.h>
 #include <linux/cpuhotplug.h>
 #include <linux/ctype.h>
+#include <linux/jump_label.h>
 #include <linux/log2.h>
 #include <linux/memory.h>
 #include <linux/module.h>
@@ -728,6 +729,35 @@ void riscv_user_isa_enable(void)
 		csr_set(CSR_SENVCFG, ENVCFG_CBZE);
 }
 
+DEFINE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
+
+static int set_unaligned_access_static_branches(void)
+{
+	/*
+	 * This will be called after check_unaligned_access_all_cpus so the
+	 * result of unaligned access speed for all cpus will be available.
+	 */
+
+	int cpu;
+	bool fast_misaligned_access_speed = true;
+
+	for_each_online_cpu(cpu) {
+		int this_perf = per_cpu(misaligned_access_speed, cpu);
+
+		if (this_perf != RISCV_HWPROBE_MISALIGNED_FAST) {
+			fast_misaligned_access_speed = false;
+			break;
+		}
+	}
+
+	if (fast_misaligned_access_speed)
+		static_branch_enable(&fast_misaligned_access_speed_key);
+
+	return 0;
+}
+
+arch_initcall_sync(set_unaligned_access_static_branches);
+
 #ifdef CONFIG_RISCV_ALTERNATIVE
 /*
  * Alternative patch sites consider 48 bits when determining when to patch

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
