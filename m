Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC92C02192
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 05:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4Xx6mtltzl3HJ7lbXshLRJ/GywDlA+Bq77CCG0FvnM=; b=f4BwBWpguorwPb
	ULc2axatOR04MEyGVxjxbwTOmMDjx9w6KHWn1EE43mAshnvnX5TICvtTh5z7mBRYTF8Sfv6fKvod/
	NYQQZCskeqy7XT4+V5al/IfXbuMjoX/RKHEa0WFUy3JqUIB5SkpHh2vqt3dRw7epr98/c5hZoIb46
	sgG2WFurpG2o3mTmnQrryQkrOFlp/+pNB6k/Z3obJC/0kcub11mTLavWIQ4Zv+bRTbxjRkLCe12FE
	3jcewEy/vyhMgPhIN95j6PcMUAQfw98/2WO0m8JkHZvtddlA5G89Im+bZ4vAbwjcIqSIuH+8boXjF
	KDSnsG1PoszfVYZqY7TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdrx-000000047Op-293d;
	Tue, 28 Jan 2025 05:10:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdhj-000000044V0-3BtK
	for linux-riscv@bombadil.infradead.org;
	Tue, 28 Jan 2025 05:00:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=XdmJbLVNE72s4snJvlCZyY59rcdtG68osktCOOFf4IU=; b=mzrrtLOOgMIGa60Z0Mps9H+I46
	tQQaSxMif7EljIjSH0hpFeHFg50Dv8YvP3r38zG0HuGNL+aRzHYnFCdeABqxiSRZjKAhyNFCAqwCq
	e7t5XrBac641JBbKsHhlW1aeCmvG7qbCLZwk3Pkf2VeaT8WybhmZY0ZXjOOuIGt9FPia8D12BDjyA
	rmfgOrPNfjIbAIVRXdtLINaMa1seet0ckEIvBsGneSctepZOwJiNWevz10bGhp7ykyhL6PBp7HCbm
	CTrTaD9Sl4lYKEqzC7j00Jz3HGQkntKHG3dCCDPcr3UPTPorhbnrBstJpdmkYV69UBPW+OFyNnNDJ
	23JjbViQ==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdhe-0000000Ep8F-42re
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 05:00:02 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2ee8aa26415so8935610a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 20:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040394; x=1738645194; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XdmJbLVNE72s4snJvlCZyY59rcdtG68osktCOOFf4IU=;
        b=PmkeDGlOME7wgxtaBMxq5n2amg56RRG4c97oLuFR2oCfyToW1ixSgFMrdLR9z6mdUY
         geq639ASUKShvwP6qrJkj+W3vJGpI1lAqyOB9yTkHNfJREOvEGXvcXqnTl6BBrhYgzg9
         LJRX+5Q1rdmIAfuJlrpXqyYHJ1eNZv5nzMGZVKb+Xamr4XnJBw2fazRLf+1iaujQyoxR
         PjM8+tMXuTLWt8QgtROTmDR928WudIthKuUWgHoXYz8T5Z5Bzy7AEol0zsTo2BZC50WX
         hIlcgr0wGKGKlSeiIA7NqEZdrGHZ89M8dYgaaZYcCkAcgtCp58dZiIB21oZbvd0FQ+F5
         b2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040394; x=1738645194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XdmJbLVNE72s4snJvlCZyY59rcdtG68osktCOOFf4IU=;
        b=TaW47sgyIMB3Z5ceMC7okcMk/mNSaPvxIZpFHBUykOicudN3w0OCuWE0n2dbKbf+lD
         kRSl+fo/X4QKPwE0ihTr5DS5ApjaNiGT2+nymtSt+iTKK1bJAWe3Rm0TxSgkXRPB249f
         hk+m1P4cQ4nUx0XrsvkF7aIGCw6rgJd16w6FaMeQ5TIOm1vYrmeVC0mqRSDpdA9pQJE+
         O3P86IVDYn2k2aQcSZqJr4634wOkXzmXoqMdu8S5d7YqQRlXnA6ZxbLudJivAhsPG4UB
         Z4T3z6OFmzWNIMrdlkd0AebC8f+OQptHjUPV1C4J8PpuGWOPBMopgnmG2JnOfTvY4dVv
         /OYw==
X-Gm-Message-State: AOJu0YxUGx75L8GlYVPTSfrxbsS6/cL/rYYJ0AENq8Rg9B3ahaZADUuA
	mjomqM2fG8s3mtI8L/qCvu5nE4OV2COGoFaeIZGI6HfpVSblGPngoYFjPgG1bOo=
X-Gm-Gg: ASbGncs5jOxniQ0ApmXOUmpvgC/LbJuGNe3lRiz+xvIX6g0jv0pQqor2+Wym/5xD/z7
	OOuCzyMHxQWXDT2Xr6urR73ZTUUcHfZStm0INKSP1Nq2yJKhkUItiRUMUlbkdw2y/dR42X7tQe5
	bhtpjcukEiec+ta1tzd3KlTNti57aoypJvKvlQS3Jzmgg0NQCA8lHh9V8OR7UHa0kUN59UEc9Yf
	6MpxIq6EP4rsTb0OHwLmJ8pzRKXwtEUxVxkVtWSA2X/t+alQfCUJoGWO1d3/naSSR5WU9ZdRfHT
	MhxB1i31nQ4nvb32MFhvHdRYCr40
X-Google-Smtp-Source: AGHT+IHSyPvtuQcDcqt3ZNPeK0UBj94g96yzFH1G7FLZXdPg/qfAF4HitoyPnQvPmyX4Tw9btm7mhg==
X-Received: by 2002:a17:90b:258b:b0:2ee:48bf:7dc9 with SMTP id 98e67ed59e1d1-2f782cb092dmr65904028a91.15.1738040394340;
        Mon, 27 Jan 2025 20:59:54 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.20.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 20:59:54 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 20:59:44 -0800
Subject: [PATCH v3 03/21] RISC-V: Add Sxcsrind ISA extension definition and
 parsing
MIME-Version: 1.0
Message-Id: <20250127-counter_delegation-v3-3-64894d7e16d5@rivosinc.com>
References: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
In-Reply-To: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
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
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_045959_270530_A61E1D1A 
X-CRM114-Status: GOOD (  11.48  )
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

The S[m|s]csrind extension extends the indirect CSR access mechanism
defined in Smaia/Ssaia extensions.

This patch just enables the definition and parsing.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 5 +++++
 arch/riscv/kernel/cpufeature.c | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 869da082252a..3d6e706fc5b2 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -100,6 +100,8 @@
 #define RISCV_ISA_EXT_ZICCRSE		91
 #define RISCV_ISA_EXT_SVADE		92
 #define RISCV_ISA_EXT_SVADU		93
+#define RISCV_ISA_EXT_SSCSRIND		94
+#define RISCV_ISA_EXT_SMCSRIND		95
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
@@ -109,9 +111,12 @@
 #ifdef CONFIG_RISCV_M_MODE
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
 #define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SMNPM
+#define RISCV_ISA_EXT_SxCSRIND		RISCV_ISA_EXT_SMCSRIND
 #else
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
 #define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SSNPM
+#define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
+#define RISCV_ISA_EXT_SxCSRIND		RISCV_ISA_EXT_SSCSRIND
 #endif
 
 #endif /* _ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c0916ed318c2..d3259b640115 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -393,7 +393,9 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
+	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
+	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
