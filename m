Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DDED63954
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Nov 2024 14:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eyFwJRM084FAhVGprDukV9DvkVOI7LJp7DJd+bYDaUQ=; b=HcqwA81rXtupH+
	x8gvJkQKKZskV4+Ys9E+sEDar0oWTULAWzYU8Ikie/FgAfSxlXCNx1btUIkBakeem2DSab02IPVoW
	U+On0OVWge0bnKZE3phQiWJCinc09WDiVVHiSqf/uyiOZ9PlnfySaxhI+tu4ZKLWJkiQNmBPTHgPg
	zXF3Zfxu3NNVfU2g2e4b3ln6EY9LtCYVYVMtL1UX+k6K3wqU6yq0Vn7S9UifADRYQ83O4r52fzuxI
	Y9BKBsxgZMq97cyjQA+Mv2MlGZeKlimPlr0bWgYvk7SScTA9ACKqTdjOsDou3xUsiu2s6L3GkwVm+
	VGtlmXXhF/yxe8sQoMdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlVn-0000000FW2k-2Iwy;
	Wed, 20 Nov 2024 14:16:55 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlOx-0000000FUpC-1CFi
	for linux-riscv@lists.infradead.org;
	Wed, 20 Nov 2024 14:09:52 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-2124ccf03edso19095965ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Nov 2024 06:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1732111791; x=1732716591; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3HiZ5B1+Hi9dts06uRmUFzh40lIglAJLzfcQl+niZxQ=;
        b=H80uVTqETr8o2u1lFTlBFSAc6lrvVaYFrSkj/4btdrqNbBWPbvXzcmtwY8T41jSGy4
         cfhZpX89RVtfGx7L1shJxYd8smuqovlUHR+5rEc0m8TWMH04gIgsQ2niMV2tjXCWoobu
         fodXati9uaVjrzcCggsMlo36sAL/D7ft7bHlgXersTySmYrNYl7QN5wXR7pfZ5TyPWY5
         V1K2qXFyAyLs5hMls0ZjC0uU7WBGbFOXTC4KT1C2LMpphj5CfbevmgmZRGB94GScgHI9
         xDbjOhYWYfANquaYS0iUvq6FRtcAS5N4q9XwwaJwxQDUcGbf8VRccd3s04wFqJvk9iEl
         QiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111791; x=1732716591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HiZ5B1+Hi9dts06uRmUFzh40lIglAJLzfcQl+niZxQ=;
        b=L//qXWk7NeMiqd9X5lX9OLMhBaMZoXzDPKtQb506Xftpob+ps52uU5+pyFYM+Dmcch
         HfmWH42d+sS6n+kUOjGbIHhIMB+nIypHwWO2pnpwAW3dLn5/JGsmOxk/BqpACGzs53ut
         Ikar/bXwwVf+ML+7oKg7kdgwReLKUDKvEimEGTqcvy8Rli1PhvTAijnO+yqc/sfjo8to
         kvJOSOMzdkMjsUHfncTu1toCX5dkudltjcecyHfq/4WUR1uNgZOlMW7tfdR5qTTW183q
         /MTrsGB+0INpa4ziv82kDGbBRLAgrBgLDzuW4ro3nGY71ctwlbKn/KR9iVEcFJf3iU9c
         7zmA==
X-Forwarded-Encrypted: i=1; AJvYcCVeDGcqfVo7KwvVL4zzjWcTN2Fd2OkWd4SKRQs0chv+U4whzHrpUjq8tZlRJy29BkMsGrUJAWNfqAnAoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+ffwssN/2GfxA+0mZMRzi4UM7X9mHbhizfJ7ABRNYllBG/jWq
	BXN/A5LwkOZQUBgEhBKBb7tJkt2UPNG5VMKjC9mMiM9RImK9S96WtJt/jOYTByY=
X-Google-Smtp-Source: AGHT+IENrSz65ancGchI+RHAOkUIUZtI0x71mxt8UzBTQ5e4W/m5EYNF2C+k64+tvhVagvHee3ibxg==
X-Received: by 2002:a17:902:ccc6:b0:212:51ba:cbd3 with SMTP id d9443c01a7336-2126a3bc80bmr34655035ad.30.1732111790594;
        Wed, 20 Nov 2024 06:09:50 -0800 (PST)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f474fcsm92502505ad.213.2024.11.20.06.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 06:09:50 -0800 (PST)
From: Max Hsu <max.hsu@sifive.com>
Date: Wed, 20 Nov 2024 22:09:33 +0800
Subject: [PATCH RFC v3 2/3] riscv: Add Svukte extension support
MIME-Version: 1.0
Message-Id: <20241120-dev-maxh-svukte-v3-v3-2-1e533d41ae15@sifive.com>
References: <20241120-dev-maxh-svukte-v3-v3-0-1e533d41ae15@sifive.com>
In-Reply-To: <20241120-dev-maxh-svukte-v3-v3-0-1e533d41ae15@sifive.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Max Hsu <max.hsu@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3055; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=kquTSCG6ldl8Jsr1Yyg5zz3XR4Ry7zAqV4fXZmtCDZs=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBnPe2kCySnhiICdX2FOUve6ohMWBNinXyZuOSER
 TmwTRZU4NeJAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCZz3tpAAKCRDSA/2dB3lA
 vQmxDACFDP3s/vWUFpUHlP87/uUPfleS9wQf2NhdzuRJWsDsduU2xxQhqEam/z0lAI0wqvR1DJl
 PyP3S/5v5NjRgpOwVC/NbwybscDQaz80y6p6BMOpwbpm+NON5pE8ZHEZz/sglp2wdMIYgSS+D9E
 ZlY4FYlnyJmU2EOuap5LE2mpW+YpKjIpD73bSULkLpIQpioRJY4B1ErwWLFPiqA3zwrpSMogbLR
 5n8HjWry7LU4vE2M0y1n/3AKkNhlG2kn7vAPqKcH9xA42vKCZUK8wOiVYjwJz6ZTf0tP0OFCgGL
 0cw/TDn1891BWiRDICzNaa1hfhGR/WuuJJsf/ANrmhyeWYQcHiP8dvGYUrEtQYJukfNrGqz8pvi
 vXq4W9bNG9oenwdz7/sa+HJ0Hn3FKLwWU6CBAq37WIti5aFXs+1HKpNaCF3ANZX72J5RZ30xDnR
 p5q264P1pYt8wQ9CzpTKFNXiln9VdNY1lRxY1wPxDOcYtUaM8Ufx3SLHKFrQ6hnUq8+nE=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_060951_327270_79691D4E 
X-CRM114-Status: GOOD (  11.11  )
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

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 arch/riscv/include/asm/csr.h   | 2 ++
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 5 +++++
 3 files changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index fe5d4eb9adea1d4e3065a4d6e2ff361a52aecc44..67ff78f7e480bcbfef04e58191ef85d5434f427e 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -126,6 +126,7 @@
 #define HSTATUS_VSXL		_AC(0x300000000, UL)
 #define HSTATUS_VSXL_SHIFT	32
 #endif
+#define HSTATUS_HUKTE		_AC(0x01000000, UL)
 #define HSTATUS_VTSR		_AC(0x00400000, UL)
 #define HSTATUS_VTW		_AC(0x00200000, UL)
 #define HSTATUS_VTVM		_AC(0x00100000, UL)
@@ -203,6 +204,7 @@
 #define ENVCFG_PMM_PMLEN_0		(_AC(0x0, ULL) << 32)
 #define ENVCFG_PMM_PMLEN_7		(_AC(0x2, ULL) << 32)
 #define ENVCFG_PMM_PMLEN_16		(_AC(0x3, ULL) << 32)
+#define ENVCFG_UKTE			(_AC(1, UL) << 8)
 #define ENVCFG_CBZE			(_AC(1, UL) << 7)
 #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
 #define ENVCFG_CBIE_SHIFT		4
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 08d2a5697466d07fe2319a2423f04657177db37f..98488d8ebf528ff5cd494ab753d91b77accd2488 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -98,6 +98,7 @@
 #define RISCV_ISA_EXT_SSNPM		89
 #define RISCV_ISA_EXT_ZABHA		90
 #define RISCV_ISA_EXT_ZICCRSE		91
+#define RISCV_ISA_EXT_SVUKTE		92
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index eb904ca64ad03565c6d521350f5e6b4c5cb9c6d9..a38e40477f0123eb7e80b096a38e0f956c9d4bc0 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -389,6 +389,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
+	__RISCV_ISA_EXT_SUPERSET(svukte, RISCV_ISA_EXT_SVUKTE, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(svvptc, RISCV_ISA_EXT_SVVPTC),
 };
 
@@ -931,6 +932,10 @@ void __init riscv_user_isa_enable(void)
 		current->thread.envcfg |= ENVCFG_CBZE;
 	else if (any_cpu_has_zicboz)
 		pr_warn("Zicboz disabled as it is unavailable on some harts\n");
+
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVUKTE))
+		current->thread.envcfg |= ENVCFG_UKTE;
+
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
