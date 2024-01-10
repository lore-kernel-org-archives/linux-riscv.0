Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E51C4725D
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 23:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HB4vqe6DZrlPd5/82zTn+bdYiZXJq/sj52gC1tfiCXQ=; b=zL6bYj2zvcswrW
	C6VuB5uoqz8GWQSy5bqgcDEJ8vN9Es/DW3zqnkmryMV13pGqBzKuLa4BdAKu1g066d0xLJPvX8pg+
	6meQUcNaxYIDCOrqm16ppBaw58ayceLcOs176eIRhl/UD+X/gGtj+kGkV3QpoCMCM7hWNP+JF6Y1p
	PGrT2J+PWYeE3QQ1XPxyYLS0Qq5VwfegpYd3KPO7EUjik0bpKspFR3kLMqqRWlVjbaaC4QumPyjQq
	VwaGoOd+hyez7uTMgHbyerp0S7QHc8RhXw02JSr0q8u6K0MICr3WPmGNrNPjxjUacJyAjAyRn/Jnq
	VqnCTUs21LxJnCw89B0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNhmc-00EdWI-2G;
	Wed, 10 Jan 2024 23:14:50 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNhmY-00EdQz-1B
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 23:14:47 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-7bc32b04d16so199257539f.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jan 2024 15:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704928484; x=1705533284; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bzy66lxPBsLKj7NzWfh0sHPmHGdfbEMoaok8d/cKAlM=;
        b=PNEiEhcOdiImz29mY9xo+idd5DVhbmcUi3CeT3Z7+RFhl/xU+LPbiBJgGfqICgayOR
         c2hQo01UJFRqF70b0N/F4CLbT0pIFhijwTwPX8sbmsRU1324R1UP4h5IO30fHzkg1IwG
         VieCCqGdI0Q/3vv/h/5boUsQjmh+7un82eVOxoCoINNAHip1Vv69yCn4pB1TVcZYomcs
         5fF3g5Q9u2Ty83zW3cloKvojvZDSCi9zsRLX7CIbga5RFfHnd9LSJ7AZigh4MQh3wPv3
         gLk8QeJl4q2sNJ/exDBckZ2g7DkZbdAGJlWUbfmR32uu5jGTV/jvDkdZezF/4bvLGi1m
         dyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704928484; x=1705533284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bzy66lxPBsLKj7NzWfh0sHPmHGdfbEMoaok8d/cKAlM=;
        b=w+UClozB43yaAt3mlqDeYJbN4oIBeDqAA4wFKO77CODsgxR5dEOECFf8H1stru1ggm
         p5bxfVMb/ZlOjm8GZT6X5dlMueQHy+RMMsBoEeEFFK5zab94yw3zHDhwyFPY9ny+HVol
         tz/DxfE/v9IoZaE73cEGJQ5BTP+BiWyzjomxe1ILxwYb26wW4iKz5dRe0ajVJwRIpSWK
         zhN3/2tG3ZJGIECxt1+1QWyY3K875OyHP39RaFMIP8RmO1xtJaFpu6Q6wfJZT7hBwd+z
         /Kd5vL3utj5wYg1rul1IzadICULVfDeMHsG0VQTmHDNnd8BqDKXzs5j11jkUhGplhjem
         Lysg==
X-Gm-Message-State: AOJu0YyaFlX7RBUVnzlcrQJe042/8FVLLLXQZsUBt+P1JpficUzXryNE
	R2zluCYDW40asX4FdCz0KAJgkU66rNB05w==
X-Google-Smtp-Source: AGHT+IGm7HAe0+skSsl/Idm/HM451rWShQSb9VP0fha0ecUw+9h1tvFJhWz0TqlC4nQuQ/KiihcYqA==
X-Received: by 2002:a05:6602:730:b0:7be:eeee:816e with SMTP id g16-20020a056602073000b007beeeee816emr392642iox.4.1704928484498;
        Wed, 10 Jan 2024 15:14:44 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id co13-20020a0566383e0d00b0046e3b925818sm1185503jab.37.2024.01.10.15.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 15:14:44 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [v3 04/10] RISC-V: Add SBI PMU snapshot definitions
Date: Wed, 10 Jan 2024 15:13:53 -0800
Message-Id: <20240110231359.1239367-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110231359.1239367-1-atishp@rivosinc.com>
References: <20240110231359.1239367-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_151446_410215_0596CFA9 
X-CRM114-Status: GOOD (  11.75  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Vladimir Isaev <vladimir.isaev@syntacore.com>, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SBI PMU Snapshot function optimizes the number of traps to
higher privilege mode by leveraging a shared memory between the S/VS-mode
and the M/HS mode. Add the definitions for that extension and new error
codes.

Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 914eacc6ba2e..75e95a7d9aa3 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -123,6 +123,7 @@ enum sbi_ext_pmu_fid {
 	SBI_EXT_PMU_COUNTER_STOP,
 	SBI_EXT_PMU_COUNTER_FW_READ,
 	SBI_EXT_PMU_COUNTER_FW_READ_HI,
+	SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
 };
 
 union sbi_pmu_ctr_info {
@@ -139,6 +140,13 @@ union sbi_pmu_ctr_info {
 	};
 };
 
+/* Data structure to contain the pmu snapshot data */
+struct riscv_pmu_snapshot_data {
+	u64 ctr_overflow_mask;
+	u64 ctr_values[64];
+	u64 reserved[447];
+};
+
 #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
 #define RISCV_PMU_RAW_EVENT_IDX 0x20000
 
@@ -235,9 +243,11 @@ enum sbi_pmu_ctr_type {
 
 /* Flags defined for counter start function */
 #define SBI_PMU_START_FLAG_SET_INIT_VALUE (1 << 0)
+#define SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT BIT(1)
 
 /* Flags defined for counter stop function */
 #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
+#define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT BIT(1)
 
 enum sbi_ext_dbcn_fid {
 	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
@@ -276,6 +286,7 @@ struct sbi_sta_struct {
 #define SBI_ERR_ALREADY_AVAILABLE -6
 #define SBI_ERR_ALREADY_STARTED -7
 #define SBI_ERR_ALREADY_STOPPED -8
+#define SBI_ERR_NO_SHMEM	-9
 
 extern unsigned long sbi_spec_version;
 struct sbiret {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
