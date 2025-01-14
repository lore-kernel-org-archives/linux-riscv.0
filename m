Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16979C02187
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 23:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4Xx6mtltzl3HJ7lbXshLRJ/GywDlA+Bq77CCG0FvnM=; b=3x2lmzStyy+/N3
	/ii8Wfsoqtpw7lhcUqojPdCW5O9Jb0oDqp/z+K5CGHikQbHP8NWv8tCVvmjbku5zKGupDu8HJ7wSO
	xnC9bm38Ct7IqTpAoO/Kq1bIDhLZj4K/6fJnPYNRpg4PdGv35taJGItFnvepxFPstpbpj8gnisEEE
	wY4RBZ2JA9Zbl6deFb4tIvyhFx0i99HQeE8kmNi6WSusj6Pa/bNNYUhL3/A+LGFIMZrS6MWr5yUyB
	IFHQw8Oj3koacg+N6hyoIScrRp/eJGB+ls79SISJ8WwS4zYfEJynKlNDU4cvMD2tt/M8aoneBry1O
	Txiyb/6EwIVYXj7dXEAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXq0C-0000000A2sF-3tJg;
	Tue, 14 Jan 2025 23:07:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXprj-00000009ztM-2Mx6
	for linux-riscv@bombadil.infradead.org;
	Tue, 14 Jan 2025 22:58:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=XdmJbLVNE72s4snJvlCZyY59rcdtG68osktCOOFf4IU=; b=nyreWamMCSnqPFJk5ptiZqb5aV
	6aS/uwog+nBcNDjA+haw4pIRCoarOxvc8/9/7BLcji4li/et48aqvIJpOY6SJMC+sT9Y7Yp6qLe4z
	ilg6jFk7D8ETI5YINiONeDOhHfxuU63XQvfnCrVs+/3f0TaN2erVLFTF/LZbZFlWWwz3Vovg8sifw
	CyRQ0qZ5kKUB0T+XwUoTwZAhHFj9wpo3OaMY+K8D5dNUx/3BOxRT1bxg57GxzQYLQWHflz8bCUl0o
	tRXNUOWLlalwLKBqND+nzZi+f+9pgstd8R5Vhse8nVeFIJM4SQCNUyYa8+zf8QfOZ2TE3ZX/E8q/v
	jShZ9WYw==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXpre-0000000Afoc-03BA
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:29 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21619108a6bso106385655ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 14:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895502; x=1737500302; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XdmJbLVNE72s4snJvlCZyY59rcdtG68osktCOOFf4IU=;
        b=TFp0Zn9PvbZ8anZKpaqnVEj6P/CL/N+u8ZvfxVAGUh/mb++rHfAYcFwfaL3iMO7oGq
         J29VcOkQZfeHkAdvLOixfN7U/J87VHDg6g0xxIiTzsOKFo5CcGLfZAXny9+7wtJDms6c
         QnJbNv28VawQwOLgLMjW1gHOGp4IEtYlHAC0IkU290C1v6CnDd8QTlUi5t04oqm9v9G+
         +voEQQ/Jb5JcQdku7Wg8DPFX+ohlAzHwPyXjqfZ6iurVk8BF6H4zC0QPYBYC1L0HHvim
         rudxNk8HW4uaE0SLzcoiWMgrCAg9fj7V139kkM5Y9iHAuPWeMz0Z+mFfdLQ2YCdPW+jg
         ms1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895502; x=1737500302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XdmJbLVNE72s4snJvlCZyY59rcdtG68osktCOOFf4IU=;
        b=rWLam+1yhVEdNQpN9IIAO/mYsAonNgH5W/nZxjizlAKQqwroqZqGJjIFn6ZYBl2smR
         eX2WnlX+bVB5nXsuxYye0IbuIcQhd0Ysm4+4X9HV/AGEbnFbzYqUx3smrfiFppwge9RA
         kgqEIU1kqkD86k4VZhSpqYFUsV6udy/Caxx/ogvRnnYFQ9ajK87o96Hhq2T8jiPU2dy6
         J+NDh/TsUQIHtbCgKuEeqUSPPLyD+j3V5sRDidnVCjk4/fTN0Lwff7KxgjdAqfZZ3mnS
         sfPnsUl0H1rKIUynynVpYnFjlpBnGkLEOBMtUXB6zoqpJ2guqM7b3klmEUhplzaRtxBX
         dRTA==
X-Gm-Message-State: AOJu0YydYY+eQMn4z9/Pn9wiwdRwUfKR80wxzSWPtC31pBmXz16HKpK2
	B71CDOy6CfChvdC5nnNNpimZ6QceBHZvjMGolSIk/mwzgM4nCO12FzNXtbKm19U=
X-Gm-Gg: ASbGnct5Y3WpFYJ83iZcM6/3vcmL5an0tbDMzaHZHY/70hk675tJelXey+5Io+Nu0BV
	90lgE2uoIQPgWO7MRzzSrOSSbq+1HUSZa6QHyPY33OE0mOgA9894+U+NRaDLNVZiVIudVo+PhLO
	ecYrdilOZ6Kpqol8FQPrXEHiCfDCWa0W9I59SI36LDVMN5IGe+5BavuJfVq9zbnN+n9m+yqn2q+
	1SNOqQZVhMYRaI0sEcsobs8Z9+TD6OnaGPKj3mYn6m47hZmnbVfNYq72Itg/SE7r9LL6A==
X-Google-Smtp-Source: AGHT+IH1ltU/mRUuewPYEws/WbJoOFmxt2kzpsU09c76uR3HaGq/wIEXCgpsEq3E5r1Kj+FsLU8f4Q==
X-Received: by 2002:a17:902:dad1:b0:21a:8716:fa97 with SMTP id d9443c01a7336-21a87264051mr357793715ad.13.1736895502516;
        Tue, 14 Jan 2025 14:58:22 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:22 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:28 -0800
Subject: [PATCH v2 03/21] RISC-V: Add Sxcsrind ISA extension definition and
 parsing
MIME-Version: 1.0
Message-Id: <20250114-counter_delegation-v2-3-8ba74cdb851b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250114_225827_032341_D1C50028 
X-CRM114-Status: GOOD (  11.21  )
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
