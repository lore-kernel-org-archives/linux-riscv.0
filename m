Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C782CC07D5A
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 07:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2N2CEIPmT1ZfJL3sttofM+C1rQYfSniqFzShZz1lMTo=; b=r2Ov6lqaIXzixa
	nuMZ+2xHlDuryOrN9FpYC/01oe4t3dJF9gcMuwUhpLuOMJnS9wgj52YpfRfdKy9aO+o+G7BwaORrP
	Z3olW1nhbZsl3UqHx2IDoTMbFtVQWWY/mZ0/px+mJsQyYM26VNMMqdQvosFFFf+y8gi0j3wwc9KJt
	Z6kT+TtdySXgKoGmV8CqVzj1YsQ92lcqp2ua0IApXFqEFyazgN1uxKX3rO5UwgowwhHU7re3iBjle
	GG6oAueAXlKdZ0+GZsNAiGKcsbCucOQK1FO47WuVCo2S1rrzpexYHM8Ux7YpGDRShQsLU2GmK8PK2
	9MaIxyfSb6qT2ADrlnaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ViM-001er7-1E;
	Mon, 27 Nov 2023 07:07:30 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ViD-001eo8-2G
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 07:07:23 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1cf856663a4so24695235ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 23:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701068839; x=1701673639; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMA+62ieF0dHRmbCC9GfwETOr1r4110ste5ly+nBz6U=;
        b=UDj+EwKUE2jdt5YYk5M6I1fhwmwBjahGr7t/6tFnNX7+uaQvqU+3T2O1Ian38eFzrQ
         uORuyjJQ6cVg+UR6dp1JCzAXwigCeG32ysgriSdWBYWJd49Wn5ZzVYa+psrnS2oIzeMn
         rU/bqozgFwBOm63F7/iDkFE8u7wMPaiZVZvG0KGVMD9Pn+UXrgX5yoC+WP22/Wzk/jND
         Be1dTvsIg4xGVUhYo3GgixQwFSYt1QbdREFKHMSlP9IWCx5Tz0rfAwoD7Uwz4ZkoFPff
         EFLtHeSBmfFPk3LHG7YpNiUzY0FxLwp3W4YTxcaC4t/3L50m5wqhlhdfrq9tcscQ7u52
         Q2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701068839; x=1701673639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMA+62ieF0dHRmbCC9GfwETOr1r4110ste5ly+nBz6U=;
        b=HTRlD2hK0j7y8wEyGUsmbuUtEKnAPdX69uJ/waaVhuPNaEhURT0bHCd+hrZe5KuuV1
         jLciXJ8Tx1JH1eOAnjmnf3mC4A+O8u/FfvQF0wxoDI6OBn74UCbGGbr5+plIqWcBRFc3
         eJjdASFULDEJ59wQw2Rf32fFYVN1aPZIsW6rKIqOFP+Yljwu00yFd4RHpLcjsmLGWfh0
         rWZgAEiVVJNIDGsaD3Gj7bAs5TvP48Css2Rb8PJvENgLuY89D3ZfnmKs/9ceCL18pinM
         T1glYpg8TBzeMpMyrR/g1p7NM90Els4ZiDrFqbOm/vr1lsR4i7V5Vor2D7FyOLDi/xh1
         qvMw==
X-Gm-Message-State: AOJu0Yzl+KeHPCk7AykkxyCNJDulxQ/7bkh9ALS51devSmLgR01azEnU
	86TE2clRdiokbT+P0lpouKB1IQ==
X-Google-Smtp-Source: AGHT+IGuXY7hovfUUFK918N8FOS5pzp5Ne429WLs/7kFsDgC+8/3HusV0OnDurXW0gspNvwdh6EGhA==
X-Received: by 2002:a17:903:1205:b0:1cc:5589:7dba with SMTP id l5-20020a170903120500b001cc55897dbamr10929394plh.43.1701068839357;
        Sun, 26 Nov 2023 23:07:19 -0800 (PST)
Received: from localhost.localdomain ([101.10.45.230])
        by smtp.gmail.com with ESMTPSA id jh15-20020a170903328f00b001cfcd3a764esm1340134plb.77.2023.11.26.23.07.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Nov 2023 23:07:19 -0800 (PST)
From: Jerry Shih <jerry.shih@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	conor.dooley@microchip.com,
	ebiggers@kernel.org,
	ardb@kernel.org
Cc: heiko@sntech.de,
	phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: [PATCH v2 02/13] RISC-V: hook new crypto subdir into build-system
Date: Mon, 27 Nov 2023 15:06:52 +0800
Message-Id: <20231127070703.1697-3-jerry.shih@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20231127070703.1697-1-jerry.shih@sifive.com>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_230721_992443_241878AB 
X-CRM114-Status: GOOD (  13.84  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

Create a crypto subdirectory for added accelerated cryptography routines
and hook it into the riscv Kbuild and the main crypto Kconfig.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Signed-off-by: Jerry Shih <jerry.shih@sifive.com>
---
 arch/riscv/Kbuild          | 1 +
 arch/riscv/crypto/Kconfig  | 5 +++++
 arch/riscv/crypto/Makefile | 4 ++++
 crypto/Kconfig             | 3 +++
 4 files changed, 13 insertions(+)
 create mode 100644 arch/riscv/crypto/Kconfig
 create mode 100644 arch/riscv/crypto/Makefile

diff --git a/arch/riscv/Kbuild b/arch/riscv/Kbuild
index d25ad1c19f88..2c585f7a0b6e 100644
--- a/arch/riscv/Kbuild
+++ b/arch/riscv/Kbuild
@@ -2,6 +2,7 @@
 
 obj-y += kernel/ mm/ net/
 obj-$(CONFIG_BUILTIN_DTB) += boot/dts/
+obj-$(CONFIG_CRYPTO) += crypto/
 obj-y += errata/
 obj-$(CONFIG_KVM) += kvm/
 
diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
new file mode 100644
index 000000000000..10d60edc0110
--- /dev/null
+++ b/arch/riscv/crypto/Kconfig
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+menu "Accelerated Cryptographic Algorithms for CPU (riscv)"
+
+endmenu
diff --git a/arch/riscv/crypto/Makefile b/arch/riscv/crypto/Makefile
new file mode 100644
index 000000000000..b3b6332c9f6d
--- /dev/null
+++ b/arch/riscv/crypto/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# linux/arch/riscv/crypto/Makefile
+#
diff --git a/crypto/Kconfig b/crypto/Kconfig
index 650b1b3620d8..c7b23d2c58e4 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1436,6 +1436,9 @@ endif
 if PPC
 source "arch/powerpc/crypto/Kconfig"
 endif
+if RISCV
+source "arch/riscv/crypto/Kconfig"
+endif
 if S390
 source "arch/s390/crypto/Kconfig"
 endif
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
