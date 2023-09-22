Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E0DCD4F35
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 08:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RWnE9RVpLnTXMRmrTLIQNdVvSTYI2QNv+Y2C0Bfkgcs=; b=1PPgvUQBCG7oJiPruVJ4d7or07
	qFeYKThg4FbNQ8bGhbRtr0tBTedM8dXDsr+TiWLQUo8jBi0sAf2OdDvzHG11G16J1wgnJDyHRW1mH
	AwPXhdIaK3ibEpvABBcwRWmbl+s2D5ALOtMxgBGTEX7x/5nmZ20zV7SaSVCiVWQzg/UAtui8nHNLT
	JLpn03PtHqXpLSUSczgufzzMdCLRwnQmQDUeh+IY2Kh/ne2duDDEFlfCNbLVp2dMA1NKWZ/CM05QU
	4nbgy1sxq3K1iu0BfvRaJNZNjXvYft9PYkt3KpRx3im7p8YiSUhvH0KioivP2HMJjylZwfbHg09KP
	AoNGsXEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbyU-008TF9-0y;
	Fri, 22 Sep 2023 08:57:22 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbyS-008TDT-1m
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 08:57:21 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-690d2e13074so1703728b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Sep 2023 01:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1695373038; x=1695977838; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F/fCPUALx1igoJTdhtRLyUtdiJnxsv78mR4MUJv4qBk=;
        b=WNxwuoUkEoPX4HLHNEPwWZZoHA0Uv8LST2ktEPj0xsZ6zcMBx0B7UuVkJFZpPvfyi3
         BtwaZxbFzShGdAJBsQJqPIfmXfYfTyduoLkoLraQeSWJEiK8Dv1YEVgDRjVUT/vPUizF
         3HNpSKP7NPP0uHJ9CQEWQmmr16VlIiFyoeRETxn16DpLD/zwTfUdCMW4KVTpbFjrct8c
         ehnVwswqJ2ouyAYcqXO8plhOUw+npXKMbvS6dBANrvrDyZya6ie+blbBnEVxC4ownNwJ
         Bmg6GU5QA2OvjOSqRaF7jxhwdwwRu/Lpfw3+czsChYvz8qDq4cyHGBLPEHaOt7JqMQ/S
         nDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695373038; x=1695977838;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F/fCPUALx1igoJTdhtRLyUtdiJnxsv78mR4MUJv4qBk=;
        b=XCJf+urMrXFLFoZr9+6XxLQ2ZFkDeDTULLSNLm7FAHOLlqWfMs2Gzd6ppfDKXmEsZj
         okX69CXIDvAD/8xfC3who+ZVe/NJUVXK6+wsmYgTw2wVtzS6YmTlTgcbsIDSvdfISoPK
         W8CvwOT0A5b9ERRClseBDkBExzpC4daZGhySENlI6fbeFRn36uDXDyjbZzXWB1YDUJhI
         vN4HoMmQXxm7iEkdn8yUIC4gt8mqZh900e9cdf4cKTrGf5ycZ3SnOoUPFNQfvmipCEPD
         VvdOZFq1woRmIe9TrQOwrAermea+A7kWdpAG5tlj0HJpFIBqMxECa++AeA/RSqecMcQH
         kzJQ==
X-Gm-Message-State: AOJu0YzpRjunEBb5vfJeSfZIj5/wlfOH/8LLV1wlNNYPZEgsZKpDCuSc
	+z2bDQCRo8/GCGSz9q56eijZ8oR+gDbjY40tfYCbf1V3openq+JLz48RL3qs7+vUUcEglLz4dcF
	jWvVAMFFa5SQKHROPYZfcxCcBKHvVlBQcvk3awRfKD3vi+nef+nYShABPpwXpEg3GuItDD0mVUV
	E1bp8fPpu2m4+jXCUZOA==
X-Google-Smtp-Source: AGHT+IHQuDmm4XJD/EaaLhVrbzcHCkaG+iIjY/t5jt03Nftlcsx7KXgLd1DRqYf6xW91942noz6xTg==
X-Received: by 2002:a05:6a21:7899:b0:131:b3fa:eaaa with SMTP id bf25-20020a056a21789900b00131b3faeaaamr7980727pzc.61.1695373037555;
        Fri, 22 Sep 2023 01:57:17 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id t15-20020a17090a024f00b00256b67208b1sm4815024pje.56.2023.09.22.01.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 01:57:17 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v2 1/3] RISC-V: Detect and Enable Svadu Extension Support
Date: Fri, 22 Sep 2023 08:56:47 +0000
Message-Id: <20230922085701.3164-2-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230922085701.3164-1-yongxuan.wang@sifive.com>
References: <20230922085701.3164-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_015720_590029_62D3FAC1 
X-CRM114-Status: GOOD (  10.73  )
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
Cc: Heiko Stuebner <heiko@sntech.de>, Kemeng Shi <shikemeng@huaweicloud.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, alex@ghiti.fr, David Hildenbrand <david@redhat.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, tjytimi@163.com, greentime.hu@sifive.com, wchen <waylingii@gmail.com>, Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linux-kernel@vger.kernel.org, vincent.chen@sifive.com, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Andrew Jones <ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

We detect Svadu extension support from DTB and add arch_has_hw_pte_young()
to enable optimization in MGLRU and __wp_page_copy_user() if Svadu
extension is available.

Co-developed-by: Jinyu Tang <tjytimi@163.com>
Signed-off-by: Jinyu Tang <tjytimi@163.com>
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/include/asm/csr.h     | 1 +
 arch/riscv/include/asm/hwcap.h   | 1 +
 arch/riscv/include/asm/pgtable.h | 6 ++++++
 arch/riscv/kernel/cpufeature.c   | 1 +
 4 files changed, 9 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 777cb8299551..10648b372a2a 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -194,6 +194,7 @@
 /* xENVCFG flags */
 #define ENVCFG_STCE			(_AC(1, ULL) << 63)
 #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
+#define ENVCFG_HADE			(_AC(1, ULL) << 61)
 #define ENVCFG_CBZE			(_AC(1, UL) << 7)
 #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
 #define ENVCFG_CBIE_SHIFT		4
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index b7b58258f6c7..1013661d6516 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -58,6 +58,7 @@
 #define RISCV_ISA_EXT_ZICSR		40
 #define RISCV_ISA_EXT_ZIFENCEI		41
 #define RISCV_ISA_EXT_ZIHPM		42
+#define RISCV_ISA_EXT_SVADU		43
 
 #define RISCV_ISA_EXT_MAX		64
 
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index b2ba3f79cfe9..028b700cd27b 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -629,6 +629,12 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
 	return __pgprot(prot);
 }
 
+#define arch_has_hw_pte_young arch_has_hw_pte_young
+static inline bool arch_has_hw_pte_young(void)
+{
+	return riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
+}
+
 /*
  * THP functions
  */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1cfbba65d11a..ead378c04991 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -178,6 +178,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
+	__RISCV_ISA_EXT_DATA(svadu, RISCV_ISA_EXT_SVADU),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
