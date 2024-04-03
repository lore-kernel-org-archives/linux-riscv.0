Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735F7CD1297
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 09:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o59O1CKB6Hrya+YfR9c+c6O1+zfHAbAmnP/TPJRBsYM=; b=3LWZH5og5oam83
	rdIqgrgYAqumWUrkC6vRYY4pwkfYu9jk1UC/66e9lWkyBa9U0p/02z7KZtYLli1UdsPysoVn+axWq
	iWpCU1lPXESBm6dVy8hfiNfQop4Znsgv9CiwgkNjmB1m6OhN+A4jgt2/PNA5YzBbJNo/PHSxmzJ5v
	uKcZZVDi+NVjKJ8EvGlVseTV6AM6dkZ47z7ZZK2XavScyIEbY1yxfoeSgx6NW6yl7pgvnBbyJlD+L
	gSekYnDxMhmNkG6HDyDMbjhVTIRvhN/xWs146mKFJ1d/ayhlvha21EirA1qbFDx/HKUvMZs7wscws
	7LCN0hfT32BiDOz5fgpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrwlv-0000000FADA-2i61;
	Wed, 03 Apr 2024 09:19:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvci-0000000EieL-07a7
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Apr 2024 08:05:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2ukUdwvkRaeQmBPwRJpu6uMxNPU93zNWp+RJiBVsFw4=; b=iyCeihnHE6l9/YvAqSjEPi3YWw
	qvbUEVURjXo9VN95Ve5FIekXahhbaeO923ClVMBMxW5aEt/4QSaq/zHz/T4g4ASGLFkRNLXGyi00n
	bDseD9zf83iGS5T5tIa4droFF2jwqNtlhsZklsZ9Mn5OfpxKa5yFcNHM7GA/Sl0IVw1MhhhQ1rAET
	HL7feresSKqHt4DIs0Y/1nzDUrdJWpUmyluJSQElbnQOBYW+DAZ6CFrBK4mk8SqmNtL+lZjj9fiZd
	e3zZ2VKgAFjk8DpsuBEadrZAGF5MHoLihmx0vBeAReDWnHd52hMm94+Hu56xltOmvfHFmY7IJ0y0C
	7L2TEODg==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvcX-000000044jz-0uHb
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 08:05:30 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1e29328289eso2500865ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 01:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712131518; x=1712736318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ukUdwvkRaeQmBPwRJpu6uMxNPU93zNWp+RJiBVsFw4=;
        b=o1s3h3XfZDwP3TZfKsxI9qRup2EDYQLh/pBQxocq6GRVpHHcMfMzCG8vtT3tjQAJyS
         hwkoT5AG5C2fpfZBlogKiB+v0v/RkylF0f2w3HAzzEsPJxfovUCNy3vjT4HZ2Q5Yn3pU
         ttC0LCJh1RI5erkwQBEQI2CZnIKKiF3gAaY5bcCWVXCMtSCx2vjQCsytSXu1Reflg2iQ
         TKxRGw/wVoMjWW02+iPWOQh/BjQJk2qTAR8QaOlm+3i9G11x3jBHE/vMRf7IHB77Rx2N
         XOY+ZLXJPSQeWvklZWx5IDwV3lnjQGKZ61Xyfs24E7tsLA61Opg5grmmeQI8Quc1DoKf
         8qKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712131518; x=1712736318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ukUdwvkRaeQmBPwRJpu6uMxNPU93zNWp+RJiBVsFw4=;
        b=mUQQMa1HECqGL5DjNx7f2OGf0GEVkZNOa8v4Iv0i5gcrnmzj67x0t9zGrnJgOiV/IO
         obVVLTizLl5+t6+X+TEYzvdvVfkUnd5NN1T27p5ufU7vrVyMEWNjJPqJcokk7Ao2vA2O
         APeoMlRFNgCc3L0UpRPwfV7m0Pr2w0y9oH2+keNhh5xKrVZ+0S/OqtlQ1GQDGU8x0eql
         HZq9/fa4CbNu6Dmv1YZ8mVejVlP1AYV3pCeoMbGh18UXKameqGil23bLB/hNJ67KKcFY
         zy/BJYsofEXyT3pbt3V2lT4QJd04cmqeaxnodEzII+8oIPfljdoEB5tfpQ1To2ysY9OH
         0yCg==
X-Forwarded-Encrypted: i=1; AJvYcCW0UVuL7K8wLvnrSgsY7ex6IGfrjYY+rMoLoxhKxWn53CTgsK3IllnHX6xU94QTgxEbDRg2yhSCwgjFzC936QULTl4hfluUfiHYkM81veN/
X-Gm-Message-State: AOJu0YxieBSW2InK16a7uqE0+nr8h2j+Dyp4uRUUCDQH++mQIlkMyTfB
	p5WKQvfImnmoJU2dw61vyiGZrvcTJigNgJZGmPx/wA2erPWGhj0mjJLTKoT6ayI=
X-Google-Smtp-Source: AGHT+IGzCaqR/FZVf4jG8/W5aRGI+FZChKgtdmsu22b2KjgU9hzL33Vhb0robWHwzAUPtLmResHVWQ==
X-Received: by 2002:a17:902:e741:b0:1dc:a605:5435 with SMTP id p1-20020a170902e74100b001dca6055435mr16071106plf.31.1712131518213;
        Wed, 03 Apr 2024 01:05:18 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id c12-20020a170902d48c00b001e0b5d49fc7sm12557229plg.161.2024.04.03.01.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 01:05:17 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>,
	Ajay Kaher <akaher@vmware.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <amakhalov@vmware.com>,
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
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v5 03/22] drivers/perf: riscv: Read upper bits of a firmware counter
Date: Wed,  3 Apr 2024 01:04:32 -0700
Message-Id: <20240403080452.1007601-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403080452.1007601-1-atishp@rivosinc.com>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_090521_565115_7E5DB753 
X-CRM114-Status: GOOD (  15.97  )
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
index 3e44d2fb8bf8..babf1b9a4dbe 100644
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
+				WARN_ONCE(1, "Unable to read upper 32 bits of firmware counter error: %d\n",
+					  sbi_err_map_linux_errno(ret.error));
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
