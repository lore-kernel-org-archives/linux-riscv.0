Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB3EC6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Sep 2022 06:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FnFYuqan3dzd3g00SPNDsZdCWPICQWIvlNkR4s7/rag=; b=bjA2nwV10psJWE
	PZewwBFXJCWY9vJT+R4FsrEBrKC89nP+jAcPptNn7u+WoI3ytMXk7HUOHfYhGF7h9kNzJhJvtdGvV
	Z5nMPpe/lCdpPWr+mYES1LlqNLPe9diCr6Lqideu96nJK9NbdWINyrul6CPPvtbT/UmQRw7QgTW5E
	DY+EdeeWSI76A0mizdsAAo0MPhPuTwAceeACAdFmCDhS72NmGdEiezKAcXY3oftxfBFlNFVf/l4gq
	up/4fcu9SeOBiUEEh2aqPHarcQ/H/x9qlRQ9dLeibap/wPgawEscgN3LBN7NdblhTzmt9EBhn7+j2
	6RKbPYEl1WAAQfR3pctA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXzGE-002ssA-PL; Tue, 13 Sep 2022 06:19:06 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXzFv-002sfD-2d
	for linux-riscv@lists.infradead.org; Tue, 13 Sep 2022 06:18:49 +0000
Received: by mail-pg1-x534.google.com with SMTP id i19so7116179pgi.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Sep 2022 23:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=ZnfegtzKSTTKTaSRmFYNgNfVRx+qne9CNs5pAuC2Bc4=;
        b=apj393/gyjHBwHhO2FJlGGE521DaSBAng4Lmljozp7KWCUQwKLChqR/8ZJ7pixHV1d
         9LGVWbRVbfb9METJVbNOzg8YIYcj9PVB371YCzU0N2yArwYZasnPe+goP04Q2hRir4MV
         gD4rTiJvEK0JhYSusuC+sZGR3ASmq3g5mp1bZn+HZnw1fz26Sfiu4o40hB+Ft7HutH6I
         bqH1Bu0iY93yzAJjW5/8ewMJVhGJIv1Xdw67pKS+nVzSqWrfClig2K33jNspRDsXkaHr
         Xr1Yzw0TBQS5M0Jd6sQfounEVUf5rYVl/o0iGmD6D/Gabry5KkX+3+3ya6Vu1Vimiwkd
         3hYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ZnfegtzKSTTKTaSRmFYNgNfVRx+qne9CNs5pAuC2Bc4=;
        b=rs8Qb0BAgCTVaR+6LdA2CbAGgYexuekVEM1Xhs3MCcoiiKS8NhxXI3dTNLFjTWPtt/
         TCf7Qdgr9OZRJjnQGESg7v3OdGyFDggGvH3oBfYQ15djnYpRla+4vVxKsycwwSy30kIe
         /bbbAfxtHqynLhgIeQCSHpmsDuCifhC1Mp9NY8FeBqh7NP4Lgstowub2d6bQFwuTgw5/
         YRhCsFrjQaj8IgKAgKexs7E1uaAu9XGPWB6gVyA0Qz/4g/uxfagS2mSA9vayyuOvSX9C
         G8Wly/oZGplGNYQnwDmjB/+vZIcXkY6rLD2XaKqkIKNHnfBnKrmGbZMiZgqAKSmmP+LR
         C65g==
X-Gm-Message-State: ACgBeo0IG0NQzeDMUBjgQGbaIkePWvJXL4uzEldGkGdYw0Qw4k6zv2pb
	1QOZp8fFxtmyrQoM90+JZP6I8Q==
X-Google-Smtp-Source: AA6agR69uTu3ksUgxhSvzWA664izt9+OmEr183NNyMUbA5CgJZDYqBSESKuk8rFd7wMr0WlLbXvUtQ==
X-Received: by 2002:a63:fb4a:0:b0:429:8605:6ebf with SMTP id w10-20020a63fb4a000000b0042986056ebfmr26149775pgj.225.1663049925060;
        Mon, 12 Sep 2022 23:18:45 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id z11-20020a170902cccb00b00173cfaed233sm7296332ple.62.2022.09.12.23.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 23:18:44 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	ben.dooks@sifive.com,
	bp@alien8.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v5 7/7] riscv: Add cache information in AUX vector
Date: Tue, 13 Sep 2022 06:18:17 +0000
Message-Id: <20220913061817.22564-8-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220913061817.22564-1-zong.li@sifive.com>
References: <20220913061817.22564-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_231847_230485_435F8688 
X-CRM114-Status: GOOD (  11.67  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Greentime Hu <greentime.hu@sifive.com>

There are no standard CSR registers to provide cache information, the
way for RISC-V is to get this information from DT. sysconf syscall
could use them to get information of cache through AUX vector.

The result of 'getconf -a|grep -i cache' as follows:
LEVEL1_ICACHE_SIZE                 32768
LEVEL1_ICACHE_ASSOC                2
LEVEL1_ICACHE_LINESIZE             64
LEVEL1_DCACHE_SIZE                 32768
LEVEL1_DCACHE_ASSOC                4
LEVEL1_DCACHE_LINESIZE             64
LEVEL2_CACHE_SIZE                  524288
LEVEL2_CACHE_ASSOC                 8
LEVEL2_CACHE_LINESIZE              64
LEVEL3_CACHE_SIZE                  4194304
LEVEL3_CACHE_ASSOC                 16
LEVEL3_CACHE_LINESIZE              64
LEVEL4_CACHE_SIZE                  0
LEVEL4_CACHE_ASSOC                 0
LEVEL4_CACHE_LINESIZE              0

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Suggested-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/include/asm/elf.h         | 4 ++++
 arch/riscv/include/uapi/asm/auxvec.h | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index 14fc7342490b..e7acffdf21d2 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -99,6 +99,10 @@ do {								\
 		get_cache_size(2, CACHE_TYPE_UNIFIED));		\
 	NEW_AUX_ENT(AT_L2_CACHEGEOMETRY,			\
 		get_cache_geometry(2, CACHE_TYPE_UNIFIED));	\
+	NEW_AUX_ENT(AT_L3_CACHESIZE,				\
+		get_cache_size(3, CACHE_TYPE_UNIFIED));		\
+	NEW_AUX_ENT(AT_L3_CACHEGEOMETRY,			\
+		get_cache_geometry(3, CACHE_TYPE_UNIFIED));	\
 } while (0)
 #define ARCH_HAS_SETUP_ADDITIONAL_PAGES
 struct linux_binprm;
diff --git a/arch/riscv/include/uapi/asm/auxvec.h b/arch/riscv/include/uapi/asm/auxvec.h
index 32c73ba1d531..fb187a33ce58 100644
--- a/arch/riscv/include/uapi/asm/auxvec.h
+++ b/arch/riscv/include/uapi/asm/auxvec.h
@@ -30,8 +30,10 @@
 #define AT_L1D_CACHEGEOMETRY	43
 #define AT_L2_CACHESIZE		44
 #define AT_L2_CACHEGEOMETRY	45
+#define AT_L3_CACHESIZE		46
+#define AT_L3_CACHEGEOMETRY	47
 
 /* entries in ARCH_DLINFO */
-#define AT_VECTOR_SIZE_ARCH	7
+#define AT_VECTOR_SIZE_ARCH	9
 
 #endif /* _UAPI_ASM_RISCV_AUXVEC_H */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
