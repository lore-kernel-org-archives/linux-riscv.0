Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9153BCD11C2
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 00:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Umy6/zfstJM0Eufgmh8MM1P0pR2r70/jClPHzqryvo=; b=3OFB/ZAEsAPBqS
	HsFjjWTbHmLILdXNvpTNIhXrFHqBj1RGLG16z6XcRThLBqGfCB2uP16x1Mbh7IGAVPFwMDdn3u69f
	SoSbrc6wy6gyYyIBETqi/Li3Gb+zvVvHooEztwwNlNlEoqhvhffPdFx08Uazo8J8Ac+AKVp/lOWFl
	4ngpyLbFKG5NJLB5SaD+PHXd5WnpmOfSyizID0quKrzIWe13RRwQzmBEDZwTZvKCdSfz5PNFMu3Ps
	ypzMRJ0nepvF3F1u7fCw+TccRC8AFPennnXnjZnpqQ0DDdQt/Ift/CBYCUtdirPgfAQvXAPg2EVPG
	mEAiARoi6Pe9kcy++j0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhzQ-00000009Zg7-3SzP;
	Thu, 11 Apr 2024 00:08:28 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhzF-00000009ZUL-0Ohy
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 00:08:20 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1e51398cc4eso7939995ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 17:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712794095; x=1713398895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUdjqPblbE6Q25Ekp/l365V3YEPrpPkLHh57fhpvEHQ=;
        b=KzUo+ubC6n/AxxuDLtCQrRPj3gEL9zpHAaozfF9VQsmXUx2o/epfJk4P7mCuEcnGm6
         QWkve5jRbnJkeiowMj/DiIyrC/coGhCtIOWu/UjPdX1iDcilDPgE4uHP1AyFrokXfrvf
         /w0f50r1lAUcyRZXeNVoUkKNRvHh6EZhLjXI0NTrql2Psjb1ZEde8VyX0iu25uFCoUo5
         3ZmSOLi3LXE8dJi7aSAg7Pg0wkqtyFbD6Mw445g1JVOPhJGsGzWqZfg/BRz65D7zy0j3
         eWm3iTQzjHGRbF00o5VuKGHtYRBq4KY89r9acTLnSwEwNldK/Hfc1mNpsVtPQvNPeTcG
         //pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712794095; x=1713398895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUdjqPblbE6Q25Ekp/l365V3YEPrpPkLHh57fhpvEHQ=;
        b=n7i6+Oj0Ss1M3uDr4C4UTAdFZU/DDxPUlyKI/7ayasnrMdbuVjdnji6Sm3LVC3Edwf
         Dm9caMLe+VaHU7lq/K5VRfMGtTZXcorrVFgr7Is51jyE8ha0yAP2dqPjY2YfVjP0K5vo
         EoLVYlCmGcnZTJivbs8hPzzDcFKI6+vAtKwT4e2CDyFZmBTqaTZ/qUCAr9lM/jCCVCoQ
         PEMF9a7APYHmDo0eX0l7XngX4ZfiCFkb12gGpnOKwmUS6eJ7egMsR+WrzBsuZccTfjkJ
         x1O+qQ65rASDwLXgfxMpN7NWg3BzrpHQISbHPwGl7Gtecbm20MfcHKnszUCSjQBRPR0g
         vjrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY4L61LT23sOVSLnTljgYelr6XPyDgD4BMMlxFcTMDTeJY/DlqKi1VqBa769Wk/oZMmFT/aa6ciJnA8kmc+HKqNI86mmDKmLwRvKopM29D
X-Gm-Message-State: AOJu0YxSHeyysugfGZfb2N6NuO6VZQC+n5d4Q4HoKx2zX3D97sC+vzI7
	l/3G4m/XN9wGNBmPc2LB4Rm5yVuDlM8ipj9frYJaQwEG8mEOyv22nyZ7DBDKsTg=
X-Google-Smtp-Source: AGHT+IFIBD1SOaWsgt2948dyeKGyG07Tn/ktfC4uoEXfuxeDgccQR9pNsvZjwG3GwFp5aB5INBJAQw==
X-Received: by 2002:a17:902:7618:b0:1e4:fd4:48db with SMTP id k24-20020a170902761800b001e40fd448dbmr4188157pll.43.1712794095332;
        Wed, 10 Apr 2024 17:08:15 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902684700b001e3d8a70780sm130351pln.171.2024.04.10.17.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 17:08:14 -0700 (PDT)
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
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Atish Patra <atishp@atishpatra.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
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
Subject: [PATCH v6 03/24] drivers/perf: riscv: Read upper bits of a firmware counter
Date: Wed, 10 Apr 2024 17:07:31 -0700
Message-Id: <20240411000752.955910-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411000752.955910-1-atishp@rivosinc.com>
References: <20240411000752.955910-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_170817_345643_40AE1B94 
X-CRM114-Status: GOOD (  15.96  )
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
