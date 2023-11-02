Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC438C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 12:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=awytcyCw09DKXP/pmaW4a2jnPyn5lw/Ga2ZExb61ZMo=; b=Y7xDBrpcW+n9TwOhpuaQIsIMGi
	0krC07LgIvyBOThHkwRmwLnlXpaP88ydHezA+fW5i2wWplo2mLKgjxI1/YLHyRWut6Jd0953Lfl7K
	k4aLMM5RkY0SCaVxhqYDK7uPswtLO4BhHDYSyCi+z+r/rFrLBTupErT3vTDgoF/LtaCZ3ru6DXTnh
	gshCdiKGTf/ZeKWYDSnBG29uvkugrK7vsO+n4gMF2SwgawTFiNCsJQk+kJgvvc92gIt6zYuw+eA+n
	kkh8wL/NuMfOTbFTkONpwS/aHxQoMIP7e/Kp/7Kde9tLHGka+2UVmD45HpuJvc048IjTPWcAjpPKB
	d5+wOEgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyWOW-009PGH-21;
	Thu, 02 Nov 2023 12:01:52 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyWOT-009PDB-1h
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 12:01:50 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-694ed847889so851997b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 05:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698926506; x=1699531306; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xJAq1yPvWqyGBi5ZsWwrpgoSqVAMHLxRpGtyjE8Lpog=;
        b=NpE/eNz0DDeRfuI3uaqXa8bTWYu3y++tK/Q1wQCCLGWOz5avM0ig6NTSnBITOrkTSA
         5bWZsAwldceAcXzNsIZXV+PAcgfimONSgjQUxRnYhXmQrSZb2wxEL9hYts7Ypx4Op4Eg
         De5W/jP5Ss75IweKNyzdA46nnzZ6NCFAwlo3r/Ol8tg/YfTlmk8Kw9v0eJQd62IPTD/p
         r3a42LzfJ1LKJaQdAzLZmWLaocyuriyXx1hBp60ak/WNrBzNAv4WXOdoRQfLkh2Kxb9h
         sWitFGtxEE+h532e9/RTAu3wLEtyCv30EOvX0evMXlKozwglk2Cwn8uTE26rr8vBR8TG
         ETrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698926506; x=1699531306;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xJAq1yPvWqyGBi5ZsWwrpgoSqVAMHLxRpGtyjE8Lpog=;
        b=dxkmlMcx2nBa22epvgip+CcR2KdkFT1WdgZ2SkE3O+fJYN37vNl1T/u0Tq5VIYrNQR
         zp6LxrSDGOc4zn+hQ61uQW1apeKVypvrfrnDU0PdwLdOyn+9zqRVafv2mKKslmpS1wW2
         RMrxHsF4LvOrQCNaqfRILLX0sqPO1Ef2hCbsnGrWYPlWRaFpDn61RyNV4UcOVu6D4BGt
         Xv7OtWHzcinr3LJycK+AN9/te66HR/47wyCEOSzubPidhNEifX6Dm5+kF0akLiNKcFRd
         U/4pudQVmlcGT31RS3o1CYHDs3QGVluymmvuBfMLsMvjfpZDUbPeylaDYZdqFqdy1/nT
         mILA==
X-Gm-Message-State: AOJu0YwUDudhX9/JSXJtFDlibZm9EELj1z8PVhIBoFUlcRzzDwi2chu9
	aFaRsHgHISuArqQb4r274G/m0nYl45Hafz5JkG2/l5MEXOd63WdqXCDn6pIWKFvKLq0dp+pgjpO
	bGdmdLeSHYQju9g9jzrZJ7+01tnofd1M73/l5RxZhM4TE+V3gvBdzIbCSBetx2JIswx7hfoGD9Y
	GKOwATvoAbfCs4ivCeWA==
X-Google-Smtp-Source: AGHT+IG/wfKGcDVJAiG/TgytNJy0AhVTei/c041lmiY2sl7WVz0x3oclhwrVt0acJHl8aFDX+bEK+w==
X-Received: by 2002:a17:902:db10:b0:1cc:5833:cf5e with SMTP id m16-20020a170902db1000b001cc5833cf5emr10617317plx.27.1698926506097;
        Thu, 02 Nov 2023 05:01:46 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id l12-20020a170902f68c00b001cc0f6028b8sm2969008plg.106.2023.11.02.05.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 05:01:45 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v3 1/4] RISC-V: Detect and Enable Svadu Extension Support
Date: Thu,  2 Nov 2023 12:01:22 +0000
Message-Id: <20231102120129.11261-2-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231102120129.11261-1-yongxuan.wang@sifive.com>
References: <20231102120129.11261-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_050149_561397_F07BFCBA 
X-CRM114-Status: GOOD (  10.76  )
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
Cc: Heiko Stuebner <heiko@sntech.de>, Kemeng Shi <shikemeng@huaweicloud.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, conor.dooley@microchip.com, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, alex@ghiti.fr, David Hildenbrand <david@redhat.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, tjytimi@163.com, greentime.hu@sifive.com, ajones@ventanamicro.com, Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, linux-kernel@vger.kernel.org, vincent.chen@sifive.com, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Svadu is a RISC-V extension for hardware updating of PTE A/D bits.

In this patch we detect Svadu extension support from DTB and
add arch_has_hw_pte_young() to enable optimization in MGLRU and
__wp_page_copy_user() if Svadu extension is available.

Co-developed-by: Jinyu Tang <tjytimi@163.com>
Signed-off-by: Jinyu Tang <tjytimi@163.com>
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/csr.h     | 1 +
 arch/riscv/include/asm/hwcap.h   | 1 +
 arch/riscv/include/asm/pgtable.h | 6 ++++++
 arch/riscv/kernel/cpufeature.c   | 1 +
 4 files changed, 9 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 777cb8299551..e6935fd48c0c 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -194,6 +194,7 @@
 /* xENVCFG flags */
 #define ENVCFG_STCE			(_AC(1, ULL) << 63)
 #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
+#define ENVCFG_ADUE			(_AC(1, ULL) << 61)
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
