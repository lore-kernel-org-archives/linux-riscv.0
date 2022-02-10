Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75812C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Feb 2022 21:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YCNOFzOo3wUpMHiH8SOqPFy8N6ucsAllmdddDByoU1c=; b=NkohlGEJtkQSXB
	ngfz570gyK8vy/lTquPxXWkplOfhjYrIDAbY9OeeJm19L6hut3ZusbtoIPHbtrrIt5TK46k0MvT0I
	01Qq4/vywcuBaz/0NHOpqrvB8HQXb+qOOE7T5GkxML0zmjMBA8V5dBp0baqLE78GUX2yAux635i/t
	ec1nQrMuM1VNJBGqhNfadm1osPxLLahMlYs6bYUhiLnKN+9c0XR2H6yxDD7fmuHpYzpzPrlW4qaKS
	jzPkHYt09FSYZOBihhB7yQS/B1Pmg63OtjXve41NcwYZ3cpn5dPgAnwKH1x3JWyiJ0E/6qLqKqf5U
	pbMNj2QqrUg4sMJECrsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIHBE-004xHl-82; Thu, 10 Feb 2022 21:40:44 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIHB5-004xCX-OX
 for linux-riscv@lists.infradead.org; Thu, 10 Feb 2022 21:40:38 +0000
Received: by mail-oo1-xc33.google.com with SMTP id
 189-20020a4a03c6000000b003179d7b30d8so8046068ooi.2
 for <linux-riscv@lists.infradead.org>; Thu, 10 Feb 2022 13:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9HqpIlANdkOQKOXjwBjs8cYmBoShBh+rol5NQg2UHcQ=;
 b=sEIOgtn1hTncoRYD7rw8soECdhc+qTSuHFirYdgpmhgl11ZRxUmCTJqQVLp3uySO+W
 cWU9hHTcbrqdsckB4wBTllc/wKv00ME8JP7Kd53Mo4WiUozmQaHHnQ9cj3vRPUTSn/fF
 IlIOXfazff84lCs44cUF7H1kpTHRjy38zyayW8YKBIJYqZx9DwY2WvZTAi4uumZfvpcH
 z97M8iueKtbeA9mK57qbseZ9uMRuK3PMSfFtn/ytwtDFyxTVldrjOEscwCdZGImYqZGH
 s8YuADiDbhjizT4sb6v8MYxBmaDok5yNbwKiPCssHErMqICrXYMohrA7/oWN7P3RDraK
 g0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9HqpIlANdkOQKOXjwBjs8cYmBoShBh+rol5NQg2UHcQ=;
 b=D2YznpyUzFCj4aU6cYcVt2uYAOPeappxjCUQO3l9/5KGLEHuNckp1AS7sBqcs5bVEE
 9bAx+hRNhNBIi08SivVIqaYY9uOZseowPAiLKuVCe7DPRxnxDNmY7TwEVGFqkCAph94V
 Hw8D49/uZDRkwacOKcn2RvEx68T7IASi/0PTIlZ1SK7GXFj+26zhFboURw4TjdKg5UjQ
 Wi7muPp4dvRzmiJ6P9HASCZJkIhPSd9mhcst5z6WDio+M050TvIPzCGd9PAJBU4l/Skg
 ByYuezo/MKQa4sIqkajDrsHG+IXSv8+xKt3wVVbBAUCnpTad2EMb+6AeHP/rEpnsV7Uh
 bOQA==
X-Gm-Message-State: AOAM530j1CnjG7b9Icq+rru9M9kT/gLwYtTy6kqc7EtFp1aFbwtJbxRW
 ubWs40hBeo6U8FcwEOxoI2oMwA==
X-Google-Smtp-Source: ABdhPJwswvuwH8xTFr0UU7nRSK+wVt/HmmuoJ/He9mWLY9YbklssjC7cpvnAPAdYQwCb8VUFbiowSg==
X-Received: by 2002:a05:6870:e495:: with SMTP id
 v21mr1423427oag.39.1644529235166; 
 Thu, 10 Feb 2022 13:40:35 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id u5sm8700000ooo.46.2022.02.10.13.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 13:40:34 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 4/6] RISC-V: Implement multi-letter ISA extension probing
 framework
Date: Thu, 10 Feb 2022 13:40:16 -0800
Message-Id: <20220210214018.55739-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220210214018.55739-1-atishp@rivosinc.com>
References: <20220210214018.55739-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_134035_824606_5E1E1AC2 
X-CRM114-Status: GOOD (  15.00  )
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
 arch/riscv/kernel/cpufeature.c | 27 ++++++++++++++++++++++++---
 2 files changed, 42 insertions(+), 3 deletions(-)

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
index e9e3b0693d16..469b9739faf7 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -83,7 +83,7 @@ void __init riscv_fill_hwcap(void)
 
 	for_each_of_cpu_node(node) {
 		unsigned long this_hwcap = 0;
-		unsigned long this_isa = 0;
+		uint64_t this_isa = 0;
 
 		if (riscv_of_processor_hartid(node) < 0)
 			continue;
@@ -169,12 +169,22 @@ void __init riscv_fill_hwcap(void)
 			if (*isa != '_')
 				--isa;
 
+#define SET_ISA_EXT_MAP(name, bit)						\
+			do {							\
+				if ((ext_end - ext == sizeof(name) - 1) &&	\
+				     !memcmp(ext, name, sizeof(name) - 1)) {    \
+					this_isa |= (1UL << bit);		\
+					pr_info("Found ISA extension %s", name);\
+				}						\
+			} while (false)						\
+
 			if (unlikely(ext_err))
 				continue;
 			if (!ext_long) {
 				this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
 				this_isa |= (1UL << (*ext - 'a'));
 			}
+#undef SET_ISA_EXT_MAP
 		}
 
 		/*
@@ -187,10 +197,21 @@ void __init riscv_fill_hwcap(void)
 		else
 			elf_hwcap = this_hwcap;
 
-		if (riscv_isa[0])
+		if (riscv_isa[0]) {
+#if IS_ENABLED(CONFIG_32BIT)
+			riscv_isa[0] &= this_isa & 0xFFFFFFFF;
+			riscv_isa[1] &= this_isa >> 32;
+#else
 			riscv_isa[0] &= this_isa;
-		else
+#endif
+		} else {
+#if IS_ENABLED(CONFIG_32BIT)
+			riscv_isa[0] = this_isa & 0xFFFFFFFF;
+			riscv_isa[1] = this_isa >> 32;
+#else
 			riscv_isa[0] = this_isa;
+#endif
+		}
 	}
 
 	/* We don't support systems with F but without D, so mask those out
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
