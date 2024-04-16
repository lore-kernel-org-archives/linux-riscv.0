Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F087EC04FFF
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 18:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Umy6/zfstJM0Eufgmh8MM1P0pR2r70/jClPHzqryvo=; b=gT4xumraawsi1b
	UL2l6aO5TUBsj2ccml2CUy/kfTHdyqZQdyMvpgROgYsrMlmb0VozQEyG5th47+kFabJAD1JPKAXNm
	AF6QVHAoy3tgFuwMWlcvtoFvN3U9QCahvUhDBYLjlTnKJI+qXO1lVwYpe/K9mOuMx2ZapbyTdB+81
	MojOn0PcCcZZ+4c8UQqOCZKwPb2m0CQYawpOiJHj605A/HGfZgfnTrVKLliwB46JUAaKkJQk2LyNZ
	SZCrMnkHvwuvpfX+xwyEeLj6Hd5ewTOZMaEJcXk7aMyH/GeHyV3FKODZSEl8CAbdurWD/L5mrTgrU
	vyUaOnGu+SXt5Sb+sv6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnnf-0000000DMMI-26KA;
	Tue, 16 Apr 2024 18:44:59 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnnS-0000000DMDN-30Yf
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 18:44:53 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6ed3cafd766so3847736b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 11:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713293085; x=1713897885; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUdjqPblbE6Q25Ekp/l365V3YEPrpPkLHh57fhpvEHQ=;
        b=l0g5IQIG5reVCne8T9tnFWyWJgy5j0jrvd6Eu+g3lljkqh8c6rflaa9EUBH4VEZCKL
         /vWxD4HT5+f5gfPF4nsYJqF8emhltqPCYDeyPkPxa7lVPluWi8gGl9pqwDvuYdJqNpXf
         b5Sh7veIopnexsWgRrtcXtEpHoGWjdaMDIhR69wU/NsJKdHGxVEblLEP3Sdvx8gZ+gi3
         QqGekMWxfUjro9dIYMkElVUpzhXn7if+c/OekSJXPvbzjPfuLSVWBfVZGSBu6NV6qlge
         YRGyjnm8h+ImboRAghssdOHY3uxzr9ZtC+ODwg89ntpx+WSO6SeKe289I29zsfEKAquW
         P3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713293085; x=1713897885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUdjqPblbE6Q25Ekp/l365V3YEPrpPkLHh57fhpvEHQ=;
        b=iufeHQhL/oR0sCdhAmCY71MczRGiX4CWjFsgLBmjeHe/EqO7msaFBMfpRw+KBxj/4m
         3vXIgG1RibOjfDWsd2wADkyNz/6j02hfIkMOV5e5lEO3YT+AXluhidiQji0YavgAtxML
         E9sGObbUz8rMnaa/hEpSOOHNd5aAh0hq2ClWXOWIcsXAsRZGkCDvgXVz3m423YHMhJ3T
         kkRpUKjgiJASYctG2QgYZys5bIToujpayD8hL+Qq/rDKb3kukObN6X4jqBupVijHnFkz
         LKv6Vpf7BsgwTQCM38NuCJUFS4BU9OCXC4fzGO8Iejp4S1ngC1cpArtaPJU2f67Grnvi
         pCtg==
X-Forwarded-Encrypted: i=1; AJvYcCUuaWSB+3vcTKEvAxSfbFwkW3qRDni0k/vwFBmzcYuRPd6TaSAVAIGOUL2zGx5wyvZW/YOVf9JB/H7GNY5LjCsbVhXtCzRhDJOuDBFH52OH
X-Gm-Message-State: AOJu0YwJ3Pc2rr0PsU8G92EwjtTuO4I6fz1kAq2t/kSJJJpAweipOjx5
	+jjPcI7UOC7BLJkYtVrLDvyCiL2pvU4pXEwfV4d45GSMA4yoUkpnWVn8z2RUd+M=
X-Google-Smtp-Source: AGHT+IFtzoiZdYWwgHn6C8yyQkHaJfDcObm06QyEqTUpANSp5NXvj3BXClLqKq4hZWSzGhyKgSBRzQ==
X-Received: by 2002:a05:6a20:3c9e:b0:1a8:2cd1:e437 with SMTP id b30-20020a056a203c9e00b001a82cd1e437mr14111733pzj.11.1713293085603;
        Tue, 16 Apr 2024 11:44:45 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id o19-20020a17090aac1300b002a269828bb8sm8883645pjq.40.2024.04.16.11.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 11:44:45 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Juergen Gross <jgross@suse.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	virtualization@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v7 03/24] drivers/perf: riscv: Read upper bits of a firmware counter
Date: Tue, 16 Apr 2024 11:44:00 -0700
Message-Id: <20240416184421.3693802-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416184421.3693802-1-atishp@rivosinc.com>
References: <20240416184421.3693802-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_114446_896423_9A264041 
X-CRM114-Status: GOOD (  15.83  )
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

SBI v2.0 introduced a explicit function to read the upper 32 bits
for any firmware counter width that is longer than 32bits.
This is only applicable for RV32 where firmware counter can be
64 bit.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 3e44d2fb8bf8..1823ffb25d35 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -57,6 +57,8 @@ asm volatile(ALTERNATIVE(						\
 PMU_FORMAT_ATTR(event, "config:0-47");
 PMU_FORMAT_ATTR(firmware, "config:63");
 
+static bool sbi_v2_available;
+
 static struct attribute *riscv_arch_formats_attr[] = {
 	&format_attr_event.attr,
 	&format_attr_firmware.attr,
@@ -511,19 +513,29 @@ static u64 pmu_sbi_ctr_read(struct perf_event *event)
 	struct hw_perf_event *hwc = &event->hw;
 	int idx = hwc->idx;
 	struct sbiret ret;
-	union sbi_pmu_ctr_info info;
 	u64 val = 0;
+	union sbi_pmu_ctr_info info = pmu_ctr_list[idx];
 
 	if (pmu_sbi_is_fw_event(event)) {
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ,
 				hwc->idx, 0, 0, 0, 0, 0);
-		if (!ret.error)
-			val = ret.value;
+		if (ret.error)
+			return 0;
+
+		val = ret.value;
+		if (IS_ENABLED(CONFIG_32BIT) && sbi_v2_available && info.width >= 32) {
+			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ_HI,
+					hwc->idx, 0, 0, 0, 0, 0);
+			if (!ret.error)
+				val |= ((u64)ret.value << 32);
+			else
+				WARN_ONCE(1, "Unable to read upper 32 bits of firmware counter error: %ld\n",
+					  ret.error);
+		}
 	} else {
-		info = pmu_ctr_list[idx];
 		val = riscv_pmu_ctr_read_csr(info.csr);
 		if (IS_ENABLED(CONFIG_32BIT))
-			val = ((u64)riscv_pmu_ctr_read_csr(info.csr + 0x80)) << 31 | val;
+			val |= ((u64)riscv_pmu_ctr_read_csr(info.csr + 0x80)) << 32;
 	}
 
 	return val;
@@ -1135,6 +1147,9 @@ static int __init pmu_sbi_devinit(void)
 		return 0;
 	}
 
+	if (sbi_spec_version >= sbi_mk_version(2, 0))
+		sbi_v2_available = true;
+
 	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
 				      "perf/riscv/pmu:starting",
 				      pmu_sbi_starting_cpu, pmu_sbi_dying_cpu);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
