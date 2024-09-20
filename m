Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD91CF58E5
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Sep 2024 07:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GRVOM4tDpH4ZTtKglLbwwo0wTjFCt4z3JDsbg0Nx1z8=; b=CGHCa0/G9HHt+U
	5FIZiaOW4oBIGQ1pikVhzOSIlrXyc1vllOvkiRG95KbG1s7fQTMNb3dglthM8Xy1CfbAUC/pJfGDz
	XMudag2b80GxPsN1s98Gn8jgwW73HJp23474MlIZj6mCrYKoZaC7BIYBZ5TVTUP3/Y1rNsNEGwf2R
	1z+585KsWCoJvQlP9T/pHcz1NAA+TEmypIlmMILy1NSBSfUkUmSS2BhfYc6OLo+pPBkfiVtceamwO
	0BCpBoHqoupCCWglWojv+kz4c5Ez9A1xeeiaJR4V9l9ev0fgaLKZXMy36JpwCQYz5I89Axl8BqbSX
	ld2pKzozHqbfvzpIKI4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srYEn-0000000Bdgn-3kKY;
	Fri, 20 Sep 2024 07:39:33 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srYEi-0000000BdbY-0eVO
	for linux-riscv@lists.infradead.org;
	Fri, 20 Sep 2024 07:39:30 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-71788bfe60eso1413316b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Sep 2024 00:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1726817967; x=1727422767; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CT9GEju7bSLmrePusCKKABH0ch7KuMtmsZgZpBqIFyo=;
        b=TaCO8cVJl4bpk3qS086J8V4tBqQUgxet8vNv1hS7ka12mlCF+AOzzl+4oE4iSyqEgb
         Cmd51KhIapI8oD1cuklozNyz/44oGp8nFsvD4ROCzWlldiAamwnCvuDjl269faYvJ9Hs
         W0+kHUwEQ1i67FUDyG7sHz/He2Dg6pyddzF2ahVxFyYPbc9ptp41rsdc6b0qdgzKABYf
         /pbhRqSjFHGHSY8xUtmmFzgixRbAVUPn8HpBfxB9+RDs+ZdBF2LN86wgUtIrpQMWZ2Qy
         bKALZlPk8NhQmn2MusQvDIinHI22z1OcCQ6Ql9yQlb2M/qVvclsTWSoeikdV1Jo6bVtz
         jAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726817967; x=1727422767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CT9GEju7bSLmrePusCKKABH0ch7KuMtmsZgZpBqIFyo=;
        b=RpkvLYSt/zpOv6l3P1FEYl9svQ4TWOfA/oQKnlkTFAK2hc1D0rVBJeCkHp+k149qFj
         PP8Jbw8VwvAKUwTGuB2GBe4i8bfXvF+DOQfnkmOk/WVGrVd3la7UgmwdEOX6wHwfF6tY
         U2HWXHqcyqakKZlWSEw1HZLlt7frIoB6swxcaex9AEItkKSeMuLBAFGOjZj8iOLwaDsI
         toNghCAhCwfoTcDR2RwWPUbdlZy64EMxGgMRJukHPyxGCpWrpl0vI9XlxjBMkF5K+NK9
         UK7GEFE6j9O+fIwZ7v8zDOb4dEkc5NNQirMEFE3Wu0drWVIKJoKjXRm8cobQTeLCkUwR
         Pc6g==
X-Forwarded-Encrypted: i=1; AJvYcCWeg2XG5eHctNRcRn7GYKg1zHVMF8MWYZ8PvHLTs8bJHm6ja3+bdnj0mz8jnkml6CHIqkeAGCAW0+wKQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtOv0owLdaBmSoyVSyaDHBvEYoftOhjKWcMKF8jmJYytqoE+AJ
	XYu6XdtK/KkmMH+5MJTzeCQWHTV9Ln8k/oHWrS47wYz+VuXuJxzxdHDSVtS7/1LR8SzSOXtjYCq
	pqsFGCw==
X-Google-Smtp-Source: AGHT+IG6rMP/j+HwSxFkfMOtJg3R/QYQ887j1ZDLI3TfRCRWapSDFkOo88W7gDM42Rehmyg7JS1hLA==
X-Received: by 2002:a05:6a20:3007:b0:1d3:dbd:fa28 with SMTP id adf61e73a8af0-1d30dbdfa3dmr1627879637.5.1726817967200;
        Fri, 20 Sep 2024 00:39:27 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946fcaa4sm89645805ad.212.2024.09.20.00.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 00:39:26 -0700 (PDT)
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 20 Sep 2024 15:39:04 +0800
Subject: [PATCH RFC 2/3] riscv: Add Svukte extension support
MIME-Version: 1.0
Message-Id: <20240920-dev-maxh-svukte-rebase-v1-2-7864a88a62bd@sifive.com>
References: <20240920-dev-maxh-svukte-rebase-v1-0-7864a88a62bd@sifive.com>
In-Reply-To: <20240920-dev-maxh-svukte-rebase-v1-0-7864a88a62bd@sifive.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Max Hsu <max.hsu@sifive.com>, Samuel Holland <samuel.holland@sifive.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3135; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=4PnzwBQpPeTEJe8Qyflfvtc6Ny2Buw6g2hFxclGw3nc=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBm7SalpnRzx0Rx+fnfGP+6rz4BVoxP95CqTG9z1
 RiuM/FdrVyJAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCZu0mpQAKCRDSA/2dB3lA
 vdVrDAC5RA31nXeuyC4GAVETdwPSt1TRyIVJS0n2P8hWI/QekT22Nd9FyP3fynCQ8CAR9Of5AmO
 jvxWOy+9+z/Lkoja2zXmFvjgbIzj3cP6KButtwuUqB3zHD0635hdapFEpXE5I4NIItTOUqpQH2q
 GHDAa4PsFViC6/ESfsbfcGeyrVrelye6tAW4vfX84uUA1EjDeANdYOliWXEPhDM55ynoR+H/zgV
 7Wnxv4XihHfsPE9G5nM0YBNDgTCp7iQBIlzvY0322wqkQVb2Dv1XE/I57MqEpHB8Fw+tcfYMX+4
 i2IXgPhw3f1DhCeyEKvd8Bqmcj8yWgHsZfel2dObsoX1JFIoPrAXspTPSiW1m6rwXdzxlNXUSW1
 nyPle2QpQHM+9UEMwOP/DjvkpFoHJoDgAOd7vFiyzy5Q5rC4108dLc9G//usfaKBVf67YEENkwy
 U/7UTr6JjM5eotlpyGrxdDYWyBBbJAVlpxWfbKYzWNfj6Sm7xcNUBGZhoglMOS+E980Qw=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_003928_227502_44F01AC7 
X-CRM114-Status: GOOD (  12.05  )
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

Svukte extension introduce senvcfg.UKTE, hstatus.HUKTE.

This patch add CSR bit definition, and detects if Svukte ISA extension
is available, cpufeature will set the correspond bit field so the
svukte-qualified memory accesses are protected in a manner that is
timing-independent of the faulting virtual address.

Since hstatus.HU is not enabled by linux, enabling hstatus.HUKTE will
not be affective.

This patch depends on patch "riscv: Per-thread envcfg CSR support" [1]

Link: https://lore.kernel.org/linux-riscv/20240814081126.956287-1-samuel.holland@sifive.com/ [1]

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 arch/riscv/include/asm/csr.h   | 2 ++
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 4 ++++
 3 files changed, 7 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 25966995da04e090ff22a11e35be9bc24712f1a8..62b50667d539c50a0bfdadd1c6ab06cda948f6a8 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -122,6 +122,7 @@
 #define HSTATUS_VSXL		_AC(0x300000000, UL)
 #define HSTATUS_VSXL_SHIFT	32
 #endif
+#define HSTATUS_HUKTE		_AC(0x01000000, UL)
 #define HSTATUS_VTSR		_AC(0x00400000, UL)
 #define HSTATUS_VTW		_AC(0x00200000, UL)
 #define HSTATUS_VTVM		_AC(0x00100000, UL)
@@ -195,6 +196,7 @@
 /* xENVCFG flags */
 #define ENVCFG_STCE			(_AC(1, ULL) << 63)
 #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
+#define ENVCFG_UKTE			(_AC(1, UL) << 8)
 #define ENVCFG_CBZE			(_AC(1, UL) << 7)
 #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
 #define ENVCFG_CBIE_SHIFT		4
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 5a0bd27fd11a6d3d3b573c19ebaeb89d23dd8535..87f88a3b3f967b27b50ed071eace631c50d07dc7 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -92,6 +92,7 @@
 #define RISCV_ISA_EXT_ZCF		83
 #define RISCV_ISA_EXT_ZCMOP		84
 #define RISCV_ISA_EXT_ZAWRS		85
+#define RISCV_ISA_EXT_SVUKTE		86
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b3b9735cb19a8a155b2e6710223ffd0992b8133e..891225a605547b312ab81d81f76f9bbba6c1b658 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -384,6 +384,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
+	__RISCV_ISA_EXT_SUPERSET(svukte, RISCV_ISA_EXT_SVUKTE, riscv_xlinuxenvcfg_exts),
 };
 
 const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
@@ -925,6 +926,9 @@ void __init riscv_user_isa_enable(void)
 		current->thread.envcfg |= ENVCFG_CBZE;
 	else if (any_cpu_has_zicboz)
 		pr_warn("Zicboz disabled as it is unavailable on some harts\n");
+
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVUKTE))
+		current->thread.envcfg |= ENVCFG_UKTE;
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
