Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541C4C02180
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 18:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROOgjRt2xEhyIyozzXAsX+4ijL2IyWPxCWf+WrIxwtE=; b=nwcW4Vo+I7dZ/9
	7oC1QtAsnwwo6t14Og9p9HxJ1nHVgXBKpIUAqDrgd6a/kdQR8zIKpP2FspEt+RVDfow9qHokspQxc
	I2rLArGydzatghWTNoQ2Got3PxOMZp1T7sn+uVkaGx3I3fJuu4VsMaUGDU1eOwNsGPm6v7rxdKxtl
	a2CvJwWxJrG+D/YkNaIeC3ofG7T/6iKu2ekDxMTvpyThl9ZMnw+6emUCMpOlPDh7LFTzdz6tyobtu
	c7Uvay7eRJdr8ZRCQB8PfBL8AlShl7o5EQhO5AWM5YYUcv6AxRn+X2Fiv2WwYLa0eVNfqwJ1sH7Pv
	8RLrIqn4SBBygRdnwiAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8FT-0000000CmnB-0DIq;
	Wed, 15 Jan 2025 18:36:15 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8AO-0000000ClC6-3NYb
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 18:31:03 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2166f1e589cso155305615ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jan 2025 10:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736965860; x=1737570660; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCeV16Tw9Ue2BbFuxP2Jm0elvtAXwe5u9EmpHjH7wzE=;
        b=h8Yp7TE4M/x2CnoHbrQtjf0sxDOkhXQzJ5XdpO8HWEWW432Xtd6YnFejCEG7e1wWom
         kXN/s7O6jQSpEtKFyKJB4AwD9TaUWJPqajSyDDwSTaTaNrug7mPMbkkGuEWUWKfsBuCO
         lx2soA1Dq9oCKrCAGXKBbLI4B/W+M5I04sLYxkIi52g4NhDc3b8Qsp13YTU4movEWUQH
         mhosY8j/NbmW15LLYi5plThDWbBNrhQgmB4RcMONX/yyNFZnXlkas38nDvCyBgaaGcoj
         wuThcvgqNAQ9PI4lQZDPUgPBypdGZk0BMx52soz6CzMTrVb1UZuu7Ye+dGBrvIFWfrur
         aVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736965860; x=1737570660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCeV16Tw9Ue2BbFuxP2Jm0elvtAXwe5u9EmpHjH7wzE=;
        b=Ux9L4JnUxp91szUf1gHdyYJItFiBgr2M4a0vsfJRXDPHThATL8T0oZzftahhZYgnR/
         BbYM3UF3JESZqIkYAx/8m2QBmj1MS5botDVO290dRi3jDkXXoLQ4dg3DqiZ7QpTMv6YX
         hhXFjgQO4OMn+K1P+S201/yLIBvnxmI9ZalxEBkNMP48bLEdH9ASPscU2G2S61JoBHTr
         NXdDrvBids8JqwSIFoNk1MKsbIcM73WCNHfdok0zo1ODpjk90U9MA4XjL88zhF1kDatP
         goIpvQVlFj3y7+E2RT4kn1PF1owBc7kOVtzf0sfGzOJoimMPTbonvanImE1JGeivyuD5
         N/Fw==
X-Gm-Message-State: AOJu0YzSA4jRqiQ7KLkug3pAilRRHJMyCRft/vyG6D91eQ3Ko4OAy5Tg
	57twOjzS75aZQUzGS55RgLXeCUpYuhoUFoorSvg1DpljlLGVktFH973jcwLAA6c=
X-Gm-Gg: ASbGnctTxVtKjvNO6RHgl3P/HOI/Ic4THHR2fVAZrO+pL9KUXwTSyEDZJBohgSu1hN4
	bb9d8O08NipPWHucwcdKnI+8z5VIuq945wuSdzblS1SCmxNPeSxaOI0WbNiXCdtYT8cSBUN9DTu
	DHAxFC4R/KNApj/PTeuRWQUN/ZeMBsNXiwBx4oH0k2WBzaXHZ9yNV12qqI9NSRtAMj+9aGrZFeO
	xMof+VtvEeK22pTs/gzut5CfzOVPVkYuGpikIWaQCtMmdretqA/u/tcgmfT3hA0vByHCQ==
X-Google-Smtp-Source: AGHT+IFhv3d+iNN38adFn+dH29zIS7C6pmY5MPy1fONgMvFeK1H10VHPHqcDN6p90NhFpRdpeycXlA==
X-Received: by 2002:a17:902:f68b:b0:216:32c4:f807 with SMTP id d9443c01a7336-21a83fdea82mr472230285ad.45.1736965858786;
        Wed, 15 Jan 2025 10:30:58 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219f0dsm85333195ad.139.2025.01.15.10.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 10:30:58 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 15 Jan 2025 10:30:43 -0800
Subject: [PATCH v2 3/9] RISC-V: KVM: Add support for Raw event v2
MIME-Version: 1.0
Message-Id: <20250115-pmu_event_info-v2-3-84815b70383b@rivosinc.com>
References: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
In-Reply-To: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_103100_864151_AE46DEC1 
X-CRM114-Status: UNSURE (   9.95  )
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

SBI v3.0 introuced a new raw event type v2 for wider mhpmeventX
programming. Add the support in kvm for that.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 2707a51b082c..efd66835c2b8 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -60,6 +60,7 @@ static u32 kvm_pmu_get_perf_event_type(unsigned long eidx)
 		type = PERF_TYPE_HW_CACHE;
 		break;
 	case SBI_PMU_EVENT_TYPE_RAW:
+	case SBI_PMU_EVENT_TYPE_RAW_V2:
 	case SBI_PMU_EVENT_TYPE_FW:
 		type = PERF_TYPE_RAW;
 		break;
@@ -128,6 +129,9 @@ static u64 kvm_pmu_get_perf_event_config(unsigned long eidx, uint64_t evt_data)
 	case SBI_PMU_EVENT_TYPE_RAW:
 		config = evt_data & RISCV_PMU_RAW_EVENT_MASK;
 		break;
+	case SBI_PMU_EVENT_TYPE_RAW_V2:
+		config = evt_data & RISCV_PMU_RAW_EVENT_V2_MASK;
+		break;
 	case SBI_PMU_EVENT_TYPE_FW:
 		if (ecode < SBI_PMU_FW_MAX)
 			config = (1ULL << 63) | ecode;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
