Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853B1C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 09:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UcToPg2m785GpyAdItHVfYSCpIjnDTcwPmWYdoGqZrs=; b=pVSw6cB6dA7yP+
	JkPIQnSfjD5C1TXGrjQdw7CUsDDd/XCcKBWibB86EoM5wWeqA/QFVx+cdzi/zgsPI8Mqct2ba8jdE
	1+OYFEV1/u4d8iwfCzHx4wS22Eg48hy1eQ8pO40N5LDyhfM2NjjZXmXZWRvgOLfLu0eyVNyARQoCc
	6scQ4Tc6bg9O7gOv2gOvXP+a1Qb0yc1YCVE6eqIcwdnb4j0s3tXwjkhWnibVSU/81NpKeWNkoqClX
	1/pkRoCnTUXa9AKqqHnW+KvsC0tsq7oA8gsavmBO3tboTqwt99ZSEnQEFW55ucirCYKHbxzXi/bth
	iLZKsKOzfgQWoBXUp7+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJtjV-001smk-2y; Tue, 15 Feb 2022 09:02:49 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJtjL-001sgy-MC
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 09:02:41 +0000
Received: by mail-qt1-x82a.google.com with SMTP id r9so6765674qta.1
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 01:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tvH+QlgZ/sWTfV6i2aUa3kw0ko5FhadKBSyH+clOvO0=;
 b=zDOmDakQzSP/7sYVbqUvgTuqj3R9yqw9Io/yxg0eMVPUCokXz05l725Roqs13h03JD
 BW5lBqOCdY/gs2ZQZgoXuo59dK7DiiAmXU3sTp2opcf8b8eyCEQvJyCyFOCMk+ZRPuKk
 J5MAL1FANaw0dRduBoLdPyQR34ITQkk7JBUBnanfPZ3HLkS9s7itxzo6ZI6SQTd3f4H1
 yfEha9FrysXE0pWov5Qav7AJFN+0wNW0v66l3I74aIq+aFJ/rFL016DdnN1vN0dGtKWk
 urU5TJzGKLu7VRgb9zliqAEdmSTu2CUiT4Q+RkpF2YamgfgavQBU9E6NYyvCA25mN/D7
 2HyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tvH+QlgZ/sWTfV6i2aUa3kw0ko5FhadKBSyH+clOvO0=;
 b=HjwfL48/sfp5O8tCmYhhhW8V8a1MnHiQxR3VC1ITiU2NJvmQmPL5SBdCiczuRp1CyR
 CNUHxosuWGe8ebnf+dNtm19zqgpCK6BCN3tm+M5liS1a6psVzS0EPjeD1c8Ye0OHpNvA
 1CBdVfxtk5Fv70UrXnd2DuDe6P2ty8SGE6gD9JKjAi198RUUXMVQ6XvZYb/X/PS0Sr4P
 dYj2wXzbD/M9Gk9zei5U7F2/ZODHWhRmNOWwQeHjjSNDgCMojnQl5wZgqN5RXQoAacGS
 iRyThaVTGHw0DbOn0xLWfXG9ZUeBHT7W7sYdPFmObDigpo6eR23FiPn9WXbb0vSU1YiM
 3ZwQ==
X-Gm-Message-State: AOAM530RcesMNnU/y9PrWasYDzaVvpggUSuMVGh5MFfM9opaGxBR5vyS
 oL72G+4MruvmBn196DBGRlrJfA==
X-Google-Smtp-Source: ABdhPJxlQfhS9S4weNHZVTY2A2fhMEBUPvoDEPwMIijVKZ9lCBMABQvdT0Ef3nN/KBssjp9v9AHT8w==
X-Received: by 2002:ac8:41cf:: with SMTP id o15mr1951017qtm.254.1644915758374; 
 Tue, 15 Feb 2022 01:02:38 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id w4sm17711158qko.123.2022.02.15.01.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:02:37 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 4/6] RISC-V: Implement multi-letter ISA extension probing
 framework
Date: Tue, 15 Feb 2022 01:02:09 -0800
Message-Id: <20220215090211.911366-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220215090211.911366-1-atishp@rivosinc.com>
References: <20220215090211.911366-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_010239_766664_8BD95325 
X-CRM114-Status: GOOD (  15.17  )
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
index cd9eb34f8d11..af9a57ad3d4e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -83,7 +83,7 @@ void __init riscv_fill_hwcap(void)
 
 	for_each_of_cpu_node(node) {
 		unsigned long this_hwcap = 0;
-		unsigned long this_isa = 0;
+		uint64_t this_isa = 0;
 
 		if (riscv_of_processor_hartid(node) < 0)
 			continue;
@@ -167,12 +167,22 @@ void __init riscv_fill_hwcap(void)
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
@@ -185,10 +195,21 @@ void __init riscv_fill_hwcap(void)
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
