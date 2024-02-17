Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAF5C48260
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 02:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oIPD3gszHris/W8e4l361NhIE3tjGqLpE93lG8mqb0s=; b=wH4qnCQRGSky6P
	lc1Si1ZE7GSgnyGmivWK5bUcMGRmri7z63nHcVv3Ax7GXG1I9I/L6jMdiyNWq69V0LGmt+uP0ZEVU
	cUxfaADdabKgXd49Kh58UtVe/qEco0cnZELmJPZd0ijnoTHshJXkxoI/7N1B2Y2gcDZeStnhIW45i
	J54g9vQsfF9RH4VD5VwsWrxAV0GO1EO9BxHkCxI+2ROVZv/4eLfxgt6sSZUXbzTxNzYPEr08XA2Or
	hzl1eHFd3GMKjtxM/BLGYQAfoMIz3lmgsnGUcaXFndXPQ7aQGjNqr1si1DiVPpoAz1S40C3seEDtw
	CYnSd25L7xLfv6dr3+IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbA3S-00000004SAP-2Xjz;
	Sat, 17 Feb 2024 02:03:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb92Z-00000004INL-3Tkq
	for linux-riscv@bombadil.infradead.org;
	Sat, 17 Feb 2024 00:58:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=aQNMm6dQ5GKoaAsA3+Ylkhz7wa/7Q2Lc0P2/ZDz1Yac=; b=I5OGKjLc58wMFQIKJa8Y5jeO79
	59tnnMftsIFG66YffiSmGukhWjN+wnjh79fqR3Mf5AmWAzVVqvzov0XwE7ZAjeTglFlRzQQvSU+c5
	vEkV/uN6w56iOMiogm8pwF/hblQibELo0nrVwnSdoRxFvJVYSNUvKtxq6u3cqieEw9P7YZg5fZSsq
	WenAei3icBFMxqU/o6o6QBbfovyFKrgVpqcW6HfOc2tcYVzwiIxZOLR1yaCxdb89yoiHP+EBsMeOq
	ELmBofKt3tSFqTAxVrQi3sN94UoZlczJEtC5y6Ua6Gllh3uerQPv/ShqTUL2S1G7lVr3nCq1Zxoxw
	qAo6QHFw==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb926-000000007H4-1q0F
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 00:58:45 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6e08dd0fa0bso2239300b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 16:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708131499; x=1708736299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQNMm6dQ5GKoaAsA3+Ylkhz7wa/7Q2Lc0P2/ZDz1Yac=;
        b=05DpMZXYxwex0tvTfd/IInF87FyE3QDfwYni1ypaCnSGSwhSJcyip1mbHWiTT2qFdc
         ztSY2qJfWP0geENmsDrRgq8DOBDmNzW4CRv9rIMJ70wcILFPZcBAiJU/VsVfrgkavzZZ
         w1yqAqveNOmtCQHFxpUnvjunFE+6Dm3Y9xaHOGCcy8SFI+79HlMvt6+Xjhp9MCpH5giE
         HzIuj5d0KwLEZd2Xnr+YAq9wHNWnj9q1SMnZQHLBeXBPwFUtKLknmvA3LzGg0Fn/Lb4H
         nOXX9sgQs3kG636FesJE/DeM7sH+Tlbywdu8QjstbJE8xLmfcQpdDyJnfJzUzNHK0oTg
         bPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708131499; x=1708736299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aQNMm6dQ5GKoaAsA3+Ylkhz7wa/7Q2Lc0P2/ZDz1Yac=;
        b=O7IslJZAnyNIvpInRjeylz565LY+9FNXc7RnE181xkHHN6EQUaqQSO2sPj03ZZPhqO
         kDRXOYg/H9JRSMj3a8GXG49VV8xrURBY0gBT5l8rJhMYmU93nRonpFYtf9MvsxrFvLH7
         kHp7iE9EjcLN8pnRkYigPEIb0AjbJkzHfjC18+tJRGHA0ebXfYjGHODl/bt2+kaEHH5q
         FMKp0VCB5AkgQ87/SGq2dqW8KKgJY2JQNULW8RkOysy0+S+b7eQbmzUR079x9V/rD0cA
         pSKT6/Ax3NcPX5knhHPL4otLtQyyDA/4AkShXcnp+6V7WXlVSyjAdGE9Rt9+c4tLDIJr
         y18w==
X-Forwarded-Encrypted: i=1; AJvYcCVQA58qrUJASLYFsAva8UyYGypaDwPYzK7rmYoo/xberwlL0yJBKRKjxq/68ZCsws79pajMtjGIXstAi50wXPSluW1fC8DN1/YcTTUauEcX
X-Gm-Message-State: AOJu0Yzw2LL97eSubQP8gDGD4AaFfJiT39BTPydcMmCUCclsN054JHHk
	vRsReQFqg1aUs8COINXVHHU5OA+Cy/szxDerNeJoNct6Lh94dJMqphTAJVHfJqg=
X-Google-Smtp-Source: AGHT+IHBAccR7wewW50qDb/5Fg2zOt9vMTs18qGTYlJw9BsFoZL8lyrT4M/cgU7xwOtlRTzAVrdVuQ==
X-Received: by 2002:a05:6a00:2451:b0:6e0:50cb:5f0a with SMTP id d17-20020a056a00245100b006e050cb5f0amr13240534pfj.12.1708131499011;
        Fri, 16 Feb 2024 16:58:19 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d188-20020a6336c5000000b005dc89957e06sm487655pga.71.2024.02.16.16.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:58:18 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Atish Patra <atishp@atishpatra.org>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org,
	Evan Green <evan@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@arm.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	John Garry <john.g.garry@oracle.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Kan Liang <kan.liang@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Weilin Wang <weilin.wang@intel.com>,
	Will Deacon <will@kernel.org>,
	kaiwenxue1@gmail.com,
	Yang Jihong <yangjihong1@huawei.com>
Subject: [PATCH RFC 02/20] RISC-V: Add Sxcsrind ISA extension CSR definitions
Date: Fri, 16 Feb 2024 16:57:20 -0800
Message-Id: <20240217005738.3744121-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_005823_235501_485E08A0 
X-CRM114-Status: GOOD (  10.33  )
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

From: Kaiwen Xue <kaiwenx@rivosinc.com>

This adds definitions of new CSRs and bits defined in Sxcsrind ISA
extension. These CSR enables indirect accesses mechanism to access
any CSRs in M-, S-, and VS-mode. The range of the select values
and ireg will be define by the ISA extension using Sxcsrind extension.

Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 510014051f5d..0a54856fd807 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -302,6 +302,12 @@
 /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_SISELECT		0x150
 #define CSR_SIREG		0x151
+/* Supervisor-Level Window to Indirectly Accessed Registers (Sxcsrind) */
+#define CSR_SIREG2		0x152
+#define CSR_SIREG3		0x153
+#define CSR_SIREG4		0x155
+#define CSR_SIREG5		0x156
+#define CSR_SIREG6		0x157
 
 /* Supervisor-Level Interrupts (AIA) */
 #define CSR_STOPEI		0x15c
@@ -349,6 +355,14 @@
 /* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
 #define CSR_VSISELECT		0x250
 #define CSR_VSIREG		0x251
+/*
+ * VS-Level Window to Indirectly Accessed Registers (H-extension with Sxcsrind)
+ */
+#define CSR_VSIREG2		0x252
+#define CSR_VSIREG3		0x253
+#define CSR_VSIREG4		0x255
+#define CSR_VSIREG5		0x256
+#define CSR_VISREG6		0x257
 
 /* VS-Level Interrupts (H-extension with AIA) */
 #define CSR_VSTOPEI		0x25c
@@ -389,6 +403,12 @@
 /* Machine-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_MISELECT		0x350
 #define CSR_MIREG		0x351
+/* Machine-Level Window to Indrecitly Accessed Registers (Sxcsrind) */
+#define CSR_MIREG2		0x352
+#define CSR_MIREG3		0x353
+#define CSR_MIREG4		0x355
+#define CSR_MIREG5		0x356
+#define CSR_MIREG6		0x357
 
 /* Machine-Level Interrupts (AIA) */
 #define CSR_MTOPEI		0x35c
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
