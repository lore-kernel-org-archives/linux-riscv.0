Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395BBC04FF6
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 23:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Umy6/zfstJM0Eufgmh8MM1P0pR2r70/jClPHzqryvo=; b=h+MJvbqOM0r8Ww
	ixWBi8glHmOj1+IHDtlx2aQAwDY0KJhHbJjkRYiPRcExZWlwpJD9mYtApPuCXRdsViiEfJYw/+XuE
	yA8mN73zf4Lf+Qjs8fXjOsEarWmFkvKazKfvIvfUlgJIAGqkiGHF6NLBKTqxblKSYT0SIoHyhhEUU
	PKMOqtNlzyhh0tOEP3KL7Cf13XOPqPzG2m0o1NtpcC2CrxEANV7Wh8i3KaQiiprxCOkUOxPQyjwaa
	CdKkOFMa2Bg33dqscR2stxVMao0R5APTRhmPcrab80wyYcmYrqlJsSrmyqCzkd/GH8xWysTYQwYqV
	trcfiR0354KGcEy2fNdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxxW-00000007IeY-2DxE;
	Fri, 19 Apr 2024 23:47:58 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxxQ-00000007IXL-0Mip
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 23:47:54 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1e504f58230so23820265ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 16:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713570470; x=1714175270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUdjqPblbE6Q25Ekp/l365V3YEPrpPkLHh57fhpvEHQ=;
        b=2aX0jmzgM9YOXnL1/vk+JLxgG/aiyBWvakUvs8iJd61LGcp4O6OHmG59zhbBM1DpFA
         5Xos8e2jvs7+2gvMFjnfTGZdr7NSGRUb0IcdbCjPPLzXkfqL9iR5/kGFlIKVmoT8yYrw
         P5eQbGUpX2oBYUDDpmXHwfhEcag8p+eh5Tw+MaBCpJ6GckY4qOnwRFoGMixjp00w+Lpq
         WZ4N3AAOurfA6w1H6TOOqzjMZTMvfZ9pi48nb1Zl+TNow5t2H804/04RmKJ0qby7uR3n
         iNMTBQBhqRQyGi8auJmpWage498HeIFMZ7hBPjx74BtarWvTn18lHrUeUln3TdVe97on
         dqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713570470; x=1714175270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUdjqPblbE6Q25Ekp/l365V3YEPrpPkLHh57fhpvEHQ=;
        b=R0/PXL6YrOrKYj+CszhzihZxTlh4n+irLVSYfJUKHpfnJYb1zoVM/LaQolvQi/5TDU
         VFWD9dDrRm9NG78flD0E11s8rQEBXlkRtxkK0KLieTM3kGV33n42Dkhl+BFnU2+8TXao
         hX9HCXzcXDLyYdBzdFW1ylNFzGM9eU6VUausIDvSR426TXZqYIJVBQlHFUIyNJ5QB1/7
         kkS439tG37TTwxgiPWS7xIHoPGeveAqtlscZpEp7r09ldPSpsIfn8L8fTEzlS/KpMolQ
         qUgTuVHAT2vbmgibT6uOB5/mGdT4sg385a3Jyc0NO4O1n3iBtDzYm27NJyZC3GxL9VtE
         s2Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUrvkH2OaVBQyZRUUh+E/xZ/ufaA5l3Q31hfmd4+PW+GtWzYny28MUu6H9nrzn3nRGxlmGGOVPfx2TgoNIasjtwmtLw2CXYdPeAgDaWgK6v
X-Gm-Message-State: AOJu0YynBXR9LLvYBjrWptRaG0rOcSttrGzRJ6nF3WFT5S9FC0v6tVsX
	ulHtq7Kd52wRlJg5NM+B4bYtF2jooiorxkcOFs7PQ5COH2LechNBkYwXdtAoTBc=
X-Google-Smtp-Source: AGHT+IHHwHHNr57vk6UY+3yPVXMTfYgGKJY/BylkfQbNFTOXtEPd/o7PF2mQkqkaeyzxGO6UPPizVg==
X-Received: by 2002:a17:902:ce85:b0:1e2:3e7f:3b08 with SMTP id f5-20020a170902ce8500b001e23e7f3b08mr4580616plg.38.1713570470144;
        Fri, 19 Apr 2024 16:47:50 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id w17-20020a170902d11100b001e42f215f33sm3924017plw.85.2024.04.19.16.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 16:47:49 -0700 (PDT)
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
	samuel.holland@sifive.com,
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
Subject: [PATCH v8 03/24] drivers/perf: riscv: Read upper bits of a firmware counter
Date: Sat, 20 Apr 2024 08:17:19 -0700
Message-Id: <20240420151741.962500-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420151741.962500-1-atishp@rivosinc.com>
References: <20240420151741.962500-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_164752_216988_C9837C03 
X-CRM114-Status: GOOD (  15.87  )
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
