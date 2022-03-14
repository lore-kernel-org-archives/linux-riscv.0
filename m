Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D410C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Mar 2022 20:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=urQw2R6Ixc4fscTN6+xadozzK7NpF6cAZQwflnKdQh8=; b=iLoz073EHy7TLK
	MC9VhuwF2BVt0A9vIYWcKH8/DdOYtTb4sp4t2YS/Zv1pLGwcXiUWWS+iZzc6N+A4GrD500ILK+ARA
	2BRPgcCN0Pc45zBcsTv3guDg/erqhBMAZ/MzpdZOWFob6/P27fECDN36H8aACGhf9/jwzLPjGod4V
	3jVVpDXhvN0iTEx/AkrnU6CsGKI6GHBQZ/+BOPmkIbnuPnqP95MwFLSGbBBoAU3nIkTTlT96J4EqM
	6FEBTJAHGn/AI4+eCiKWOoyxRub/u0P04lmQJOuSNTTzhJvB0Kq6yj6eF1bVOyQfRghc92lkP77Bo
	gdJqWg2Nt2X/3iqEFnqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTrTH-006ox7-QJ; Mon, 14 Mar 2022 20:39:15 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTrTE-006out-Rs
 for linux-riscv@lists.infradead.org; Mon, 14 Mar 2022 20:39:14 +0000
Received: by mail-qt1-x832.google.com with SMTP id l15so3882190qtk.8
 for <linux-riscv@lists.infradead.org>; Mon, 14 Mar 2022 13:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZKxcoiW2sFrGr3ldNCNu9wCCT4Ol89xMsxiQLGmBKoY=;
 b=NafqdwqBPqX1R63OZ/hAYGvoxQ/pek6BrUiwCv2wZ6cM99CFM236CS3evld1rZqbWQ
 fBrkYF/Gy/oOr10gKs/wxTkI0V5OetnpRZE2+wOJd6sA9PDuWCBVEeLlpoYTae9GPFBL
 s+ZhZJOUUMYcrMiKGQ07qSQXfsZP1SOi8YClR9x3F6lmwrmBfJm+Y0B617J590+xydoW
 ZcvshNTrD8o3XreqIaUYs5dq1k5QxpvSTGxinYU3Syxe2kRiOnTAcp5UzsRZ0yh7GWGw
 sKca4VdMAMawR2GSOi1zSJNge2UMCxdd953NrAbClfFO2GP0cYIlUYH1S57X8vukyQVv
 MK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZKxcoiW2sFrGr3ldNCNu9wCCT4Ol89xMsxiQLGmBKoY=;
 b=1q8s/Lh5geBkwV2UBoLDHVszDiFbE2tZu9Hgon7NmBBhxmGcdcLMCQ8Pix7yq4M3nY
 Nrwm2eJycwBHO7vMsfISUu0GIs/CGRjfS/klGnIru55zdGWXiC65xI9wuTD/IF2OW1tq
 LXPzr8VvL5X51hK/SKbs79xKuuTilcpmUO8N9UsKGUmXM2KhYE8w/TzWqG1c/wVvnz2R
 KevpyPOHowPyeisZMhX3hl0siGhKFIvKPBh1DtpzlZqs+I2rthxAlfGW//l5kPv9B+p3
 4K+mQUuSDIob0Wzc2S3YxtU+lsMxr+DikUKDuDpj/GCw61uV3sxWOrCE7l3zg1Fscxxr
 7vYg==
X-Gm-Message-State: AOAM533VIVhSLjtRUZ9vZk1TT6tkIdW9r16RzGoEEU8IUh5w7c9pufEd
 N1r4PqRpa2PqgzD+UPge4PQPkw==
X-Google-Smtp-Source: ABdhPJx87e8zvfeKGO0DgQLIPimSPq8sUch7uYeU6/3YirRmK8X3plKE2KVFWpNvipVAyavaY4RInw==
X-Received: by 2002:a05:622a:107:b0:2e1:d655:cc4c with SMTP id
 u7-20020a05622a010700b002e1d655cc4cmr3852217qtw.669.1647290351876; 
 Mon, 14 Mar 2022 13:39:11 -0700 (PDT)
Received: from rivos-atish.ba.rivosinc.com
 (adsl-70-228-75-190.dsl.akrnoh.ameritech.net. [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id
 j188-20020a3755c5000000b0067d1c76a09fsm8597023qkb.74.2022.03.14.13.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 13:39:11 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v6 4/6] RISC-V: Implement multi-letter ISA extension probing
 framework
Date: Mon, 14 Mar 2022 13:38:43 -0700
Message-Id: <20220314203845.832648-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220314203845.832648-1-atishp@rivosinc.com>
References: <20220314203845.832648-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_133912_938189_DEDDCC2A 
X-CRM114-Status: GOOD (  14.60  )
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

Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 18 ++++++++++++++++++
 arch/riscv/kernel/cpufeature.c | 22 ++++++++++++++++------
 2 files changed, 34 insertions(+), 6 deletions(-)

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
index b0df7eff47f7..3455fdfd680e 100644
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
@@ -172,12 +173,20 @@ void __init riscv_fill_hwcap(void)
 			if (*isa != '_')
 				--isa;
 
+#define SET_ISA_EXT_MAP(name, bit)						\
+			do {							\
+				if ((ext_end - ext == sizeof(name) - 1) &&	\
+				     !memcmp(ext, name, sizeof(name) - 1))	\
+					set_bit(bit, this_isa);			\
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
@@ -190,10 +199,11 @@ void __init riscv_fill_hwcap(void)
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
@@ -207,7 +217,7 @@ void __init riscv_fill_hwcap(void)
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
