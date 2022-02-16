Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABF2C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 00:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xqcmsnf0FNlOBQcQpPVnYKqcVLQuTIhef2PSSQ7jeVI=; b=LECqXgnYJaEOHx
	BKQgsxy59Wk/bG+ZaPIIBxDANlJiF0NEH1L9XTg+GIe4OyWVDN6hO44xEfVQ8BbLIUfX7mYTG+fuF
	eWZvVvvgTJcITPU1rYlgCo8xwvxiBrHkyIyC4WxzWyo+KJRHEGfD8BHoARuvyZCpwBR39gyV/YL4D
	0gGusf9+Sf4oG/Lv9wKWMtlrbsgtyr3kQTVJ0ZfpiD55E4YtoygjX5tDKfzWycpm8/ifnLV14HJn+
	pTAmScLLAsJ6mmHnhSkmYv7VTCo6wb0EL+dleq3md5VGu9zRhdyUsNkuh2JjPUXBE3eRj9cTwGxQe
	iPreypXsHFygcqwrto0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK8CM-00541h-Lq; Wed, 16 Feb 2022 00:29:34 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK8CG-0053xc-Li
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 00:29:30 +0000
Received: by mail-qt1-x830.google.com with SMTP id bt3so636717qtb.0
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 16:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+mccZjH8NSKhWBiWsNwtOYrEp5jTHyxoNdNyuVqRQ88=;
 b=mDyg+hQZjMQDU9Uq7wsWXXtGXQt/Kj3wzuz1/ouJ/1Wf9LjhMW6HW/T5utJ7R+WoUO
 8ZXqbkqpEOb7GH1YMqNDIXq+OW1lM5Ma7mLStdU64iy/UHbzDEKDPbQjJ3HcCvwwdlbI
 bsswUsWe0lxui3GYvtDlMTQKfDytGV898nYDWDOQANRtVJSQ1Kv35c7mkzYzj5MRe47v
 RRGq65bEr75KzZdsUYEPWi1htw2XehtkmyS9FwVO5wnnBz6H/lkp6qAEkHXXQI54eeQt
 Z/NDyijOhyhwoQBNpbyY6YKCoQU5JfwFIcTXE+jrErWVabp3/EAv827jBRw0BggzjQ41
 FXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+mccZjH8NSKhWBiWsNwtOYrEp5jTHyxoNdNyuVqRQ88=;
 b=s+LoI2hIkgYsOSkhARFqMiEfPH8mqWnH4fPIzXAIQ4Gza3GjFgOBelgtqR+M6v+dYh
 Meqm8FfvDRVEMBhIYe/gVnmQzeKpulPSnJrhx9T6pMWEeTuKjKZCzaJqZUd7ymOsqLAW
 alNboiYEfJO3ifd4Ge8tDlpu9JTqBCTZLKtt5Bz74/Z6yHNxD1sh3Wt7v1XFwiTDqg6Q
 7P6VWOHmxme93wpwKSh1baVuyjsRF4LnNAFrIZLZbUtPPARkshe/o77G32K/ucaSjE2J
 JkgcBFq15OGgHrBeVv/WeqyeliXPE+0DZrlnKTRtmW7bQgevGEsCQHmA1HA2tKlko0Km
 nx5A==
X-Gm-Message-State: AOAM530sWRUS+5c8jLL/jiL7Kt+4KZeojF5r08Agr5BQYxHBSQawQ5ey
 PLd/WTg4uc36pVGZZ9mhZZGgVA==
X-Google-Smtp-Source: ABdhPJxX/1iKDISaumVfrJKyBSCp+qB9sw5uGTWszMRMIRfujWc3uyE9wjTNu2++q4autCmibTBZPQ==
X-Received: by 2002:a05:622a:4d2:b0:2d7:1d2e:6dd0 with SMTP id
 q18-20020a05622a04d200b002d71d2e6dd0mr372899qtx.615.1644971367357; 
 Tue, 15 Feb 2022 16:29:27 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id g21sm20882584qtb.70.2022.02.15.16.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 16:29:26 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, heiko@sntech.de,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 4/6] RISC-V: Implement multi-letter ISA extension probing
 framework
Date: Tue, 15 Feb 2022 16:29:09 -0800
Message-Id: <20220216002911.1219593-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220216002911.1219593-1-atishp@rivosinc.com>
References: <20220216002911.1219593-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_162928_735865_4D7F2D20 
X-CRM114-Status: GOOD (  14.85  )
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

Multi-letter extensions can be probed using exising
riscv_isa_extension_available API now. It doesn't support versioning
right now as there is no use case for it.
Individual extension specific implementation will be added during
each extension support.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 18 ++++++++++++++++++
 arch/riscv/kernel/cpufeature.c | 24 ++++++++++++++++++------
 2 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 5ce50468aff1..170bd80da520 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -34,7 +34,25 @@ extern unsigned long elf_hwcap;
 #define RISCV_ISA_EXT_s		('s' - 'a')
 #define RISCV_ISA_EXT_u		('u' - 'a')
 
+/*
+ * Increse this to higher value as kernel support more ISA extensions.
+ */
 #define RISCV_ISA_EXT_MAX	64
+#define RISCV_ISA_EXT_NAME_LEN_MAX 32
+
+/* The base ID for multi-letter ISA extensions */
+#define RISCV_ISA_EXT_BASE 26
+
+/*
+ * This enum represent the logical ID for each multi-letter RISC-V ISA extension.
+ * The logical ID should start from RISCV_ISA_EXT_BASE and must not exceed
+ * RISCV_ISA_EXT_MAX. 0-25 range is reserved for single letter
+ * extensions while all the multi-letter extensions should define the next
+ * available logical extension id.
+ */
+enum riscv_isa_ext_id {
+	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
+};
 
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index cd9eb34f8d11..59c70c104256 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -83,7 +83,7 @@ void __init riscv_fill_hwcap(void)
 
 	for_each_of_cpu_node(node) {
 		unsigned long this_hwcap = 0;
-		unsigned long this_isa = 0;
+		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
 
 		if (riscv_of_processor_hartid(node) < 0)
 			continue;
@@ -100,6 +100,7 @@ void __init riscv_fill_hwcap(void)
 		if (!strncmp(isa, "rv64", 4))
 			isa += 4;
 #endif
+		bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
 		for (; *isa; ++isa) {
 			const char *ext = isa++;
 			const char *ext_end = isa;
@@ -167,12 +168,22 @@ void __init riscv_fill_hwcap(void)
 			if (*isa != '_')
 				--isa;
 
+#define SET_ISA_EXT_MAP(name, bit)						\
+			do {							\
+				if ((ext_end - ext == sizeof(name) - 1) &&	\
+				     !memcmp(ext, name, sizeof(name) - 1)) {    \
+					set_bit(bit, this_isa);			\
+					pr_info("Found ISA extension %s", name);\
+				}						\
+			} while (false)						\
+
 			if (unlikely(ext_err))
 				continue;
 			if (!ext_long) {
 				this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
-				this_isa |= (1UL << (*ext - 'a'));
+				set_bit(*ext - 'a', this_isa);
 			}
+#undef SET_ISA_EXT_MAP
 		}
 
 		/*
@@ -185,10 +196,11 @@ void __init riscv_fill_hwcap(void)
 		else
 			elf_hwcap = this_hwcap;
 
-		if (riscv_isa[0])
-			riscv_isa[0] &= this_isa;
+		if (bitmap_weight(riscv_isa, RISCV_ISA_EXT_MAX))
+			bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
 		else
-			riscv_isa[0] = this_isa;
+			bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
+
 	}
 
 	/* We don't support systems with F but without D, so mask those out
@@ -202,7 +214,7 @@ void __init riscv_fill_hwcap(void)
 	for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
 		if (riscv_isa[0] & BIT_MASK(i))
 			print_str[j++] = (char)('a' + i);
-	pr_info("riscv: ISA extensions %s\n", print_str);
+	pr_info("riscv: base ISA extensions %s\n", print_str);
 
 	memset(print_str, 0, sizeof(print_str));
 	for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
