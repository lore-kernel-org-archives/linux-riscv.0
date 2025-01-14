Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7854C02185
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 23:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AXrgis3YcPmVANcO8tyrFggDKSo975Wd34cKZcYKKvQ=; b=fpWSzFv+Lci8Bs
	YMwuWWKbOU6tvIrmdELdRBsav/7l9Uh5ldR3dWmgLF/5sBjpwLJd5OYj1FwKN58hl2T+h4r6PsTHF
	CY4TfbpHa6bo8tUC8RdHMRulScsc9T4dQY+z1lHi632ikyCH0TZuSTIt+XYOyN/kVhiRAigNm5Hen
	1vvljh5Z9g7f6xEv7pFgAtU4g8m359LSVA4oPf0nSDSSrb+7he2SpDjzETz+3b97CGrgH0xCwkPip
	xz1y++vPWbErwygCbM07GgRl+9ztQdlV7kdkeuC3fguU2G5rgHoI8+5VmtR0oP6FFXRxrhoCrU9Zc
	l2fKJ0v/52F7LqYjhrOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXq0F-0000000A2vP-29nw;
	Tue, 14 Jan 2025 23:07:19 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXprm-00000009zvX-01nK
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:35 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21644aca3a0so133715005ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 14:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895513; x=1737500313; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWIGDLFCubHBSCVyRujLDRmHtXnqwdBi6tbEZKWPh8g=;
        b=2vPLHZoLFiV4WXijHtAQltlQ+gAWhjC15ZR761aBlrex7ZVKO2qUoWZQCM6FjysmI7
         Fo3pSiL2Fs2e8rlnmJx4BTa1X4sIOiEjbemP9sfKyZ1DWf7WBeMx5Czh1mf7RrlijMB8
         jcmi128hcpCNZKgZsp8irGuzXPOnWpjRa0Y9WbUSmIPpNy6BwVFzp7CE6yR8GHDOY8fe
         SnMXZTbve2fnSoFzynFeShvdTMYHj5pz5D0P+FVLnJ3jvPOEEUI2Gotv1xp/ch1tnO1u
         25FxQdJCXESnzwOwAGcNOmb0OYGOliSvJwjgE9fNRpjEmofyWyN8QShzg5XBbpoenV8T
         vgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895513; x=1737500313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWIGDLFCubHBSCVyRujLDRmHtXnqwdBi6tbEZKWPh8g=;
        b=svyk/Tbfi1tWFOyS60lBdu/PonIT4ww+rM+TIShetKy1tTTUgLzTmW7ZOqg09xthyp
         LmEGKJuUeBvHOT5OzSZUv/qdWo/+bNIQphDOpqlyDHwcdj13AmOf7eE760wCy1EMj94r
         kMqALaV9FV6NndUi7GMV2mifvCnpmq+sNFSksNjt8cktoZXex5mcWs8n8Xfcpbi8+p15
         zthAqLSCpylzXc00vuRgYbMU4ODBi5qP1Zd38tBPd4x1LdcVFE6Wr+GXAMm4/GUYQRgK
         JFpwpkFoaKVg/sJhPDihILxdysXqssAY4ELbd49aQnCQEpJn8V4nkjSgp+Bw8tAXgUON
         6X3Q==
X-Gm-Message-State: AOJu0Yw5chCzKoKkptyyXAMX6RDqI5BlPMB3dHG4HRNX9B2aKVgZ+yfL
	56Hw9pIvkxge/mRscVsV24F6WgrG9zCIHmrLW4COBOFDGHix+cW9qBveDL5ZLC8=
X-Gm-Gg: ASbGnct+ZKxzNDIijfF1oh3ulutV8WwEXxko7bA85unZ5EbZx3gtOiIiLz6Bti+rmDF
	2ZPClwfqnL//10cdUL+YXymTmili6JRxH4ORhFUFYHqHjl0Umu7XfHQ4qewsxvHSxKyIRizMsz4
	HAaLDYkWEw/9hLtYfkcqjUd0Q/awHufiSFO3WRDVE6XRLxePVESTzNa4+YV268eTw99MUStFvzc
	aI4jATIqcyrg41YiY9IDV/kY02Lld1YRuhtOP3ubTW1EreYLZFC832MaB9f/arLe/VntA==
X-Google-Smtp-Source: AGHT+IEA456GfI5+8oEuqGE6qvT+i61hsuXVFO4kFDRLI54KTxTxc0Qi5q2Wl0+CmS3HjZwnXXbB9Q==
X-Received: by 2002:a17:902:dac6:b0:216:4a8a:2665 with SMTP id d9443c01a7336-21a84012a17mr412337025ad.50.1736895513466;
        Tue, 14 Jan 2025 14:58:33 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:33 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:34 -0800
Subject: [PATCH v2 09/21] RISC-V: Add Smcntrpmf extension parsing
MIME-Version: 1.0
Message-Id: <20250114-counter_delegation-v2-9-8ba74cdb851b@rivosinc.com>
References: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
In-Reply-To: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
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
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_145834_059970_0948E3AF 
X-CRM114-Status: GOOD (  11.29  )
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

Smcntrpmf extension allows M-mode to enable privilege mode filtering
for cycle/instret counters. However, the cyclecfg/instretcfg CSRs are
only available only in Ssccfg only Smcntrpmf is present.

That's why, kernel needs to detect presence of Smcntrpmf extension and
enable privilege mode filtering for cycle/instret counters.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 2f5ef1dee7ac..42b34e2f80e8 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -104,6 +104,7 @@
 #define RISCV_ISA_EXT_SMCSRIND		95
 #define RISCV_ISA_EXT_SSCCFG            96
 #define RISCV_ISA_EXT_SMCDELEG          97
+#define RISCV_ISA_EXT_SMCNTRPMF         98
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b584aa2d5bc3..ec068c9130e5 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -394,6 +394,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
+	__RISCV_ISA_EXT_DATA(smcntrpmf, RISCV_ISA_EXT_SMCNTRPMF),
 	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
