Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BECC02198
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 07:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bxx54/7BE5n8m8yOgMV/kWmYUlzD4M+T9C0Dz/6jqs0=; b=XBHYYWsPL/l1nF
	mJ8Aeb2J10p9EQA6Dg1EuuVkjbYtV6npshNC6oKIAt2Ujjfim2x/96h3dhCqwZ/6PR8gP+pDT8sJv
	73SeG55t+Hdhr/J98AChwt9G/iQeyHTxfkeW5MmOj2H+STZh4zy911uMgxJwx4g+AEXQ9GxqbWehI
	jyEEPeR33JTNujOkCjfrURR0sVcV41hllun8eXjtC2DSi6VnMLdslU5XV/CndzSqk0RxP3Uh8w2kM
	adqA7Ggsts4gClplq7nOdH+m6PRk4gB0riaUCOzq5bHIhcE5LNoJbO2AgUFS/7RU5Lz4NeoBsFB2M
	GU33J/bry5QMOLM3tWgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwFi-00000005Ygq-1HNO;
	Thu, 06 Feb 2025 07:24:46 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwEJ-00000005XuY-1XQw
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 07:23:22 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so788001a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 23:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826599; x=1739431399; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XpU79JAmkI/euhUSjfGzozskMgtqeVAFHucAlKFsR6c=;
        b=sn50xTzec3uGwtF43ZkIwEvB18tlDOmxe7hIscJxuuh9zeNBySgKj/YfvVp3/BmkrL
         01mpoZNxvdgxEabh2t8Z6NiI+stb05di3nWKFNJKq6Ha7mR0HxHKoTeewu9izpgPI7Q0
         eAN3kapm0gaY46OuPPzOPKtnnXvaJb28pmtSeLzo7rKMWnmPnmugNK34/VzUiMym+9Ea
         9PSRXFcf4l7Ke+u7g1WG/Ccmo6iHeP/64hBTXrgcDRIdebdGJaalzylJHXRwl6+hNmG0
         L2Y0W4V8dr8SS1aRgrlorlcwVGlgAowpNFXFNKqVf67zOQ8zqTDky+wjayPI0ZB/k0AP
         dLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826599; x=1739431399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XpU79JAmkI/euhUSjfGzozskMgtqeVAFHucAlKFsR6c=;
        b=IPdOEbsJ5ZpAjXuYBaAs/rJ5xqHAvldDhvpTv6bhn8/A+iIqq4ZkybIz0imJ3ftU5/
         vwRL5U9J+1qHO+6JYhAtQ3RQdeqXa1rnbCi07A4qni934AanZF1IP1HL64b4TzjBoa0g
         ngV6YGAX9S5GiTTGckfN3kLgDE3G/rw1OH4DkdU4sn26ffmraM4qKSqay8WkiSNeW4ke
         avLqztgNc+T2KHl73hmlqbLVVw2PhYvFixey/nQCvX265iW+dB+SL8Una/ICCnAW2pDG
         fo0NYBg8DPW0kSi06sh3thDsEoFX4lXVPOrcNjzB0xTQXR1y/UESfbqa1r1eS9MbhbaA
         vJOw==
X-Gm-Message-State: AOJu0YytIpRELmzcVLfEYdOpZr9Td4F9J8PH6B4/fwmsobaqXDcdh8N+
	z5ROJ8qVSbFs6a3UVHaNMX6DO/dxaQwtbmfT6WOwJ36bWE8Hx4eQk1Gf7BWZie4=
X-Gm-Gg: ASbGnctc2WdFJWN5hGCrRED/awWGwTUNJAqMmCK+U16f2iHGTOjIu/Cppbhh7RDU7Gc
	d1NVGkCKd00QzVDi15F7cW/IYYcRFtulEfRyKKIFAt6wRVitEIY3NwOx97O1RrsZMTd84Siehy3
	obyc95Jx47yacXdj9PY+kYTs67CWDFSIbnx1CpeKlOxWWpfG0Rzg2Nvh4Meg/6OasCoZ6iuo2sN
	6yWWrZ1lYeBGQaR5HwWnhLOZArrLJfPjLyPHdp+BJFGK3KlMoEPzANAMwciriwjWvV3UEaL/TkY
	pjMb07tMQfDiiC5wItAE9xcHJoho
X-Google-Smtp-Source: AGHT+IESyqIBQACISlQQVueV5obgLnnWc+HDOijngEV9yfltfz+MqhbZ4NE+KJYEXiM6dtB0C1mfdQ==
X-Received: by 2002:a17:90b:3d91:b0:2ee:d824:b594 with SMTP id 98e67ed59e1d1-2f9e083cd43mr8885048a91.31.1738826598796;
        Wed, 05 Feb 2025 23:23:18 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:18 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:07 -0800
Subject: [PATCH v4 02/21] RISC-V: Add Sxcsrind ISA extension CSR
 definitions
MIME-Version: 1.0
Message-Id: <20250205-counter_delegation-v4-2-835cfa88e3b1@rivosinc.com>
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>, Kaiwen Xue <kaiwenx@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_232319_470839_AC5338B4 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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
 arch/riscv/include/asm/csr.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 37bdea65bbd8..2ad2d492e6b4 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -318,6 +318,12 @@
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
@@ -365,6 +371,14 @@
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
@@ -407,6 +421,12 @@
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
@@ -452,6 +472,11 @@
 # define CSR_IEH		CSR_MIEH
 # define CSR_ISELECT	CSR_MISELECT
 # define CSR_IREG	CSR_MIREG
+# define CSR_IREG2	CSR_MIREG2
+# define CSR_IREG3	CSR_MIREG3
+# define CSR_IREG4	CSR_MIREG4
+# define CSR_IREG5	CSR_MIREG5
+# define CSR_IREG6	CSR_MIREG6
 # define CSR_IPH		CSR_MIPH
 # define CSR_TOPEI	CSR_MTOPEI
 # define CSR_TOPI	CSR_MTOPI
@@ -477,6 +502,11 @@
 # define CSR_IEH		CSR_SIEH
 # define CSR_ISELECT	CSR_SISELECT
 # define CSR_IREG	CSR_SIREG
+# define CSR_IREG2	CSR_SIREG2
+# define CSR_IREG3	CSR_SIREG3
+# define CSR_IREG4	CSR_SIREG4
+# define CSR_IREG5	CSR_SIREG5
+# define CSR_IREG6	CSR_SIREG6
 # define CSR_IPH		CSR_SIPH
 # define CSR_TOPEI	CSR_STOPEI
 # define CSR_TOPI	CSR_STOPI

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
