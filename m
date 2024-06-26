Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1480DC41513
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 07:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mB9nUpf9jrQgnWYHwYh6l98kyrCpvU0+WVX9hzDLmcM=; b=agbKJ5gF8Pn8pP
	UZr2swa0t0NQTPhVCl1DbkyRMzSctTtQksZoJbsXTW3nSZpnvkjRjlJhyN1Ng2ptdXuNmZK1EHQPL
	1w2AHY5LmV+fwRL1gz2EfyWHq2A+cAgi2pPojzZS3Ez6x5tgpo5lBWgZPt6UaE/SV4JlcjtYzpx6W
	gA6xYCPbD2ZBAFiGxXH1gy7m4/srmEwfmhjdVqBS4zG4TxT+CWXYRapG3nFNJDa66ReUgBBP8R4kJ
	+LXxH/rfi2X/05Ih8J6+iqIikbAs/2g3zE1FbXg7GVYuuS2HzJf6THkWVQpnnicxvvNVoOO/putI9
	uoijAo4xah/58Ash8hxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMN18-00000005idW-2mhi;
	Wed, 26 Jun 2024 07:24:34 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMN0u-00000005iWD-30QL
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 07:24:22 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-70679845d69so2425700b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 00:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719386659; x=1719991459; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njNBT7xpsrpGcVD9LgzuKuD8VWJ85LTW2hNYGRcpIO8=;
        b=RzaGhjaKYrZbVTzTVhUNxnkrKMTYo8CLtjljAiO5ni9VqpDdf/0ofGxHy/CuCuS2Gu
         vGqWNKyn8Q5p45Wr97mVwsgbhPWmY83Re5bAoEtFcDdHmbxutMXPlglInC9Nbwmod+Q8
         hCUeZGe3VnXKCPSxZXrlQ6dHOjtV33mxN7pGooHknC/UAQ4kP+lfkzCn3T2Pgo20/Hgq
         lYGrP2SqvH4mHLf17YX3tE0Fejdu9RnOf4Hc7ocONmkCcfM0q/7zpGpwyFaH5BDl2bDK
         v64r3OEb3zj0Yx0JFkgCRgue5sQd5+OUmLF0gcksXdZ+Z/ceUAxNP9JfPd4RxktwWQx/
         9fHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719386659; x=1719991459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=njNBT7xpsrpGcVD9LgzuKuD8VWJ85LTW2hNYGRcpIO8=;
        b=cZjwc0d317X0DGJeHfuY3aaODBGGAQqPaC3vk2+kwtMoAPwrxKiRtZbpsqaXOv+s2Y
         Jj4ewGha0oZyXwTFmikyoUwsxssVuB3cyg1iN/MAU0973D2qk/85D2KxhWBZcSswLPiG
         O4IOVeJh15/R3k/cu1eUQHy0XIsQB3lwkEnLSoSGPoZzIlGjzX72YJ6dLOppChVrEG/h
         4u83AXnV57F8gXcQU8FUxMW0BThI6lVlxUBKvcbL2cEkL4RlOhG2D1T0um44+s5nXEW3
         ivu4Ws85NO2p0XZo9o++fAGZ8I16KUDsdQJISYqQ9zzHoHnbwkMOKBTB+dY/FuKnDE6n
         v3kg==
X-Gm-Message-State: AOJu0YzIc8PBA83FXgLAnTmiepAQFM7zOECdlDv0dDrq2kKiDOsotXuo
	VaSvVnuZh2PRMd+jIC+33DJQiM/XzAGHQkNeqrWVvGoILz4LSiIvRxx+HAcpzNE=
X-Google-Smtp-Source: AGHT+IFjsQF5e7oc0NKST2xoCih6SJziqYjY4xf7uMtfC2cP8xPNNQr3F5oh1Cg01FunjCN8iViJ7Q==
X-Received: by 2002:aa7:8ecb:0:b0:706:57ce:f042 with SMTP id d2e1a72fcca58-7067455bfd2mr9223061b3a.7.1719386659342;
        Wed, 26 Jun 2024 00:24:19 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-706984a721csm2692218b3a.37.2024.06.26.00.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 00:24:18 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 26 Jun 2024 00:23:02 -0700
Subject: [PATCH v3 2/3] drivers/perf: riscv: Reset the counter to hpmevent
 mapping while starting cpus
MIME-Version: 1.0
Message-Id: <20240626-misc_perf_fixes-v3-2-de3f8ed88dab@rivosinc.com>
References: <20240626-misc_perf_fixes-v3-0-de3f8ed88dab@rivosinc.com>
In-Reply-To: <20240626-misc_perf_fixes-v3-0-de3f8ed88dab@rivosinc.com>
To: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_002420_974242_3904D55F 
X-CRM114-Status: GOOD (  11.62  )
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

From: Samuel Holland <samuel.holland@sifive.com>

Currently, we stop all the counters while a new cpu is brought online.
However, the hpmevent to counter mappings are not reset. The firmware may
have some stale encoding in their mapping structure which may lead to
undesirable results. We have not encountered such scenario though.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index a2e4005e1fd0..94bc369a3454 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -762,7 +762,7 @@ static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
 	 * which may include counters that are not enabled yet.
 	 */
 	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
-		  0, pmu->cmask, 0, 0, 0, 0);
+		  0, pmu->cmask, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
 }
 
 static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
