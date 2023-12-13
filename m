Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8766AC35274
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 01:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SyL8SE6V/CsfGocFTgN1SlGwHLTd0VaoF6TsZpgl2fk=; b=BBxFS4CpIMcQGr
	oXz1nW+JON1jWzKEXPEXkijj6isCg/R7S5O3aa2The0GqsNnp6FLnlyJ43N5Q7Cjb1JOO+TllEm2j
	m4xLsPZy4o15izY/Lxo0RBaRdqlFkr622IxC+sm+OSYo5I9cq76Z5QOGwsCiNf0Dl8t8glIkLtlZ8
	3wDRnvUYqTGFJfWGJN9giaLXq7bLODHXEwKXsLR98OPZA7FHjQp++adsGewQUSf3qcMc8Q3j6Nglc
	pmZj00OqqHBWT8iymV9XvrGTt6OUxCXNqpopcVJF2zzabMY7dojToKbQxJToyBJs8QEkaN+dOPcp6
	PFk6HdzuYOgAFx1ml28Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDDtk-00DIGk-0Q;
	Wed, 13 Dec 2023 01:18:52 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDDtg-00DIEj-03
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 01:18:49 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1f060e059a3so4716576fac.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 17:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702430324; x=1703035124; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqZmArtiXcDp/s2cDCE6VomUeBtSGPPb+28mpDKaCFA=;
        b=YU1rLPSzjSRDjPlX7NHr3stf2AHkSYcEdciah2dEPT8OqAFUw2TTKb0SccEAObGVN0
         gKhb0606DSTIMTNRo55Q2B8DqckPO6BJOhgo9HQXVytBN90hXMI6kdb3R/aXTbiW+Te5
         RyiObziRtAoikAhBV1qk/I/xUMWZKm+G9rXTo8a35BpDx+zEdZUXu8ArSVp73o0HnHUU
         gfRD50Yqoi1XE49qCFSxiTKZQyLWMA0our+gGfhuST3nt2/Mrbq0cFOadN4Yq4q8sref
         sxmnfqvCz33vIcqPuAlczKAmwqsP98V28N/AYXUyGDSuXvx6udsCwOV3Hw+c97EruXYP
         ESFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702430324; x=1703035124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqZmArtiXcDp/s2cDCE6VomUeBtSGPPb+28mpDKaCFA=;
        b=jE/FyysnhPXAs7LjhBR5dQLFNg1O9G05pHChRAx6ZrNGZmx3LfBaebR3s3T5QIHjwa
         Xvcf3OFEtGk85wVEJoG7H0tuJsB9ZGfJ96O8l2AXN5CusyEOqUf93yXc/AuEgWvJ45u4
         lLlwbQi13sKXsaZodtiGiF/1eaGS1aNGm794BFDBYeMRIHzFIeek5m1z5hFjpJ2yTs5I
         ePdVf+fAc76gdgmQqvXYvb1RQ2b0TTZTQFhoJQDvCH97PJcRQYCeKL37nw9lQcGI+72x
         rVEBq4AgfOMa7Vj6FlSobV+tN1HXc6rgNOaxWToGPRCJjz/i0ev48ZQ/l+6uFLPjmI7D
         dOmQ==
X-Gm-Message-State: AOJu0Yy3wSccN5QPHG/hJCKVk+HgdsJqp8tVpINqXUxk0Z6PfpV7YWwE
	2UyBljbZgay8M7NyEJeSCeivEg==
X-Google-Smtp-Source: AGHT+IGsFck0SPpUMTDPNRoS1a9HAh0lw70Bi5Pk17kbqt6QzyhyTNrEMPN91SoWLcSJQPWhOYh+bw==
X-Received: by 2002:a05:6871:20c6:b0:1fb:75c:4001 with SMTP id rz6-20020a05687120c600b001fb075c4001mr8324843oab.97.1702430324255;
        Tue, 12 Dec 2023 17:18:44 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id cy26-20020a056830699a00b006d9a339773csm172548otb.27.2023.12.12.17.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 17:18:43 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 12 Dec 2023 17:18:39 -0800
Subject: [PATCH v12 2/5] riscv: Add static key for misaligned accesses
MIME-Version: 1.0
Message-Id: <20231212-optimize_checksum-v12-2-419a4ba6d666@rivosinc.com>
References: <20231212-optimize_checksum-v12-0-419a4ba6d666@rivosinc.com>
In-Reply-To: <20231212-optimize_checksum-v12-0-419a4ba6d666@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 David Laight <David.Laight@aculab.com>, Xiao Wang <xiao.w.wang@intel.com>, 
 Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702430319; l=2270;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=zAvCCM1AIoiNlx7AQwltNFw7ekzVRWkGRkhZ8BNL3iE=;
 b=mhX85bB1xkJTvDWiO9LH4y8qdkyCuhl0OJGpKcki8af27Bjwiy5p7yu815B3I3qZ0Rfh+lfto
 f1c8q+01P7SDeQ4/BUdp2oRga8T4T4ieW8kC+gZMi3zzM0Sinc2hFWs
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_171848_055112_88126E17 
X-CRM114-Status: GOOD (  12.34  )
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
