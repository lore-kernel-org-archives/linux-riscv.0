Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBA0C5475B
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 02:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yn96M1GJQWY7ANj9Vu/xixZCilbwrk+4PDSMAZy32yo=; b=BDySLJa68H53lW
	l3tPX6c3jcZFiZ1eKPIANCmrwDVGkKJvwe0gHehGYoRfC04NjrfAy/vc0UntVRt4JiwWGajji4Ddv
	Xg4fRbz2Vuq3UuIP0fogWPkTXJKMSvDVbGRILXDsjEaYR2Ge+LOuFJgYsrnrPb78OmY5YzOWetjd+
	nsw/GfeRc5N155umIwJu2Ea+JLz2ru+f5JKZIcQcxGZ+Y0zvPb7yLHvEqR0U99VqKQb00bG41FSWS
	WqnKSozStjBhr5VopkDIFeRIG8UyKnXcTIGo09OsMbhEQWgCgquB5h5oKf5m+gP0g2QFg3D7fOHOw
	xOlPhAT0tbwZ+DwON56w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfVyq-0000000BisD-278z;
	Thu, 29 Feb 2024 02:17:04 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfUo0-0000000BW1B-0PyI
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 01:01:49 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1dc09556599so3809385ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 17:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709168507; x=1709773307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/Smp2oLhuu6GIJFXbIgbmjKI2p4Ava6d/2TN1s81h4=;
        b=KGh36A8xixvFbAsBFJ5BShHmZi8827E+MPqc2TCbwq3WdjeRjje9hS3wFKnFDlZg0w
         62NsZ/HBUQi3Th7MvCYxFpTZzZj/ssTp/LQ261UBQr39ogbMo3Nbi0EE/dURrp3gvcuz
         3gzmdxU1/2PBJNt5NH6rjwYXEs1mbF5U2JI9VUQSaRW5lJSIc5NgDS5dNaCTMx4o+jLk
         xXauC7TLGbgizgJcDcqNZaqIhaOFJMoc1XiWiNjOoRqc0pw5wX7ZWESl20RuMkshRHGP
         8m7BlNkrdJ5won7M0g8dP40F+k3Bv/xme5Vf7TNz7EyuCXMTf8lWZyi2J8O6XwVt51AU
         casg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709168507; x=1709773307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/Smp2oLhuu6GIJFXbIgbmjKI2p4Ava6d/2TN1s81h4=;
        b=qZlm5rVO3rqx328HYlULm/LXQD+blh7Df4xV568KodYVnHWplV77jjVOhWGhHIjY79
         JY1NXpp/IcZta/wXpEft5gSYYJ3Z+ziyJ1jp00krcPAOoz7iB9UpDN/ykDqmxI4C8bC3
         3c90J2mP8D3UdSqAfqfKJDufSwZSbag/gWKi2bsHiFAGIhlUnod5+XrSuJX1/tEN6u4H
         wAOFA+I75ZwWRWuIejOxFNuAi56E/1FN4qYpYRps6sSzEOgJCPfoKzsmxpDPXs1vTfen
         MP3+/s3kbR4fac/YnyZ6Cot3RiKFgdLoh1e9X3E8b7Sac63//0uQTWZ2H707tfEQYCDH
         j6/w==
X-Forwarded-Encrypted: i=1; AJvYcCVs73VZ9PLlONij0IEM4OUbG1EKCM6MkzlGLb8uyx2xIBjbIBs9+Xzip8k/skrM1GsAkwT6zvujG4A7hn+vwECQWdtKlMfgjCwyeIhK2hD9
X-Gm-Message-State: AOJu0YzNnMWyi55VnmVGrmOyfIkfnCLCLsen6Kpsm6XSiDX7lF1YqLfm
	YkodWhvH4IGjLJOnZ18rCLKodKgBYE4Xqx65v5V/h3QKZFPxNem//CMsx9if9+8=
X-Google-Smtp-Source: AGHT+IEZMqLInCQx07S+Rn3WGEj/67sJxXqMLsPFvU4OeQFWJPIk5NjjGR/a40uVdCrM5KTE7F+2QQ==
X-Received: by 2002:a17:902:ecc9:b0:1dc:a60f:4bef with SMTP id a9-20020a170902ecc900b001dca60f4befmr636692plh.63.1709168506981;
        Wed, 28 Feb 2024 17:01:46 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id j14-20020a170902da8e00b001dc8d6a9d40sm78043plx.144.2024.02.28.17.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 17:01:46 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 03/15] drivers/perf: riscv: Read upper bits of a firmware counter
Date: Wed, 28 Feb 2024 17:01:18 -0800
Message-Id: <20240229010130.1380926-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229010130.1380926-1-atishp@rivosinc.com>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_170148_233564_A3F9F2C9 
X-CRM114-Status: GOOD (  14.20  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Will Deacon <will@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Paolo Bonzini <pbonzini@redhat.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SBI v2.0 introduced a explicit function to read the upper 32 bits
for any firmwar counter width that is longer than 32bits.
This is only applicable for RV32 where firmware counter can be
64 bit.

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 16acd4dcdb96..ea0fdb589f0d 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -35,6 +35,8 @@
 PMU_FORMAT_ATTR(event, "config:0-47");
 PMU_FORMAT_ATTR(firmware, "config:63");
 
+static bool sbi_v2_available;
+
 static struct attribute *riscv_arch_formats_attr[] = {
 	&format_attr_event.attr,
 	&format_attr_firmware.attr,
@@ -488,16 +490,23 @@ static u64 pmu_sbi_ctr_read(struct perf_event *event)
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
+		}
 	} else {
-		info = pmu_ctr_list[idx];
 		val = riscv_pmu_ctr_read_csr(info.csr);
 		if (IS_ENABLED(CONFIG_32BIT))
 			val = ((u64)riscv_pmu_ctr_read_csr(info.csr + 0x80)) << 31 | val;
@@ -1108,6 +1117,9 @@ static int __init pmu_sbi_devinit(void)
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
