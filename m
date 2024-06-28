Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C58C2BBCA
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 07:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2JZLsG+BoR9Hb3MwCECGw3lEl7eNfpCFeI9fDc30vqc=; b=giNiHTNEahMqGc
	k0gFlu0bclNlffMurLlerCxJAxCfhnislxhxV0fkcI1zg+elh67o850pkIijcMOyHqFKmHn/7jT2V
	GNPskKjooJFhXc/iAZfd2WsWITz7+Phffx2qrcuhEYVIw7GjepE3480G/oBtAsftj26uzIgdiU/bw
	OP7iQRtwoU7kvIQLEJ1inflaGdW8ZN1sO6WWVGMtAznj7CkfPrIyvyrKzJDX/1C3ZoW+eA0Z3+mAX
	QySopuPfPcHXp2JGedmWUA1L2uDhEYWbgCBZDcY5wV+LQabEgtMDjHJNPLqWJseNrYM6gVBt4urXZ
	bOuoawSdfA/URD7/Fopg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6P9-0000000CxXc-376C;
	Fri, 28 Jun 2024 07:52:23 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6Ov-0000000CxNy-2h3d
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 07:52:11 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-700cd43564eso168082a34.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2024 00:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719561127; x=1720165927; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8QTaOQgSJlRgxGe2DAtbRN63Xb4cFygQnCpr3YrplOU=;
        b=UK23aNaBN+oa+nnJfKxTjjOJIRLl6/0yNTtsJ1XT7t1aLdwbspjCWF/A2Sf4ZEDFeG
         eLkkgTiWn7pap2luVDyY98KCeNOrdUn/Bm5BoJVKEZt4id1Qkjj2TWWhCOw0WvjffDyW
         DgDPptIiOeVgrG36B3/HbViw3IIWDBlv7sNMbEBaENmYkK5dIhMgwdxvR+1uBT+L1iNz
         kjfk8hXj082SC+4oOrZKSCso8yBKTSwfSh2CvkQr94pT3cVBOO455GkHl+bX6O7mkUjY
         JCBz691UclQb/EO3/hCTLMuxVJkKBGJ4PbsEjuicaroAEQ4QVWxn5GAy2pdbkps/FrvC
         r2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719561127; x=1720165927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8QTaOQgSJlRgxGe2DAtbRN63Xb4cFygQnCpr3YrplOU=;
        b=FG/lf1JhBO7JrFaOBCFPdmyAA9sP8I99wkeYqXj1OL+JEqCOHVzdqHtN1ClsOCXu5w
         sURmewpk5ZcCOUbLxOgFMU/t2XNN/dTV+z0IIlWOfUXmXF0bJlsT5G2rcgWIvi10GXUs
         QfCdGLt/FzxtjZ9xo5P4it4Nof6T0Lbt11+0HSQWVISvRpRozzeq5bTLG/OZdBWoLKZS
         nCVKYBVChG++lG5DqzonPUCZoMqhH/f59Y8VQlnwbXWZUq0Wu4KPqyE6n5YTRr38wY7v
         HK+Ck9ooKOWVklnvyV6g53ugDROe+Sad0B0PYMr1D0FPp8OzMihzbF7v64keYNw4hbPJ
         xydQ==
X-Gm-Message-State: AOJu0Yx/miyBt4a0TayIre8Sc+YO4JVAG286JckAhdFE44GJUY+U3zHA
	fhiX1ULnKFrx3IIYVQDNHK313sk14DzYtlQDP+XL1Nw4oidT0tRtrKIUsIrYiNYiWZh98Iyoep9
	t
X-Google-Smtp-Source: AGHT+IE5FpdJsgBgjR00qw7HsO4MmvDOUqzWFrZg+uaxB1OldOrplMNqpPJ7b0OBtuxblj+ltyW8xw==
X-Received: by 2002:a9d:7495:0:b0:701:f1cd:350a with SMTP id 46e09a7af769-701f5874810mr3112027a34.11.1719561126989;
        Fri, 28 Jun 2024 00:52:06 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c69b53bf2sm685068a12.2.2024.06.28.00.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 00:52:06 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 28 Jun 2024 00:51:42 -0700
Subject: [PATCH v4 2/3] drivers/perf: riscv: Reset the counter to hpmevent
 mapping while starting cpus
MIME-Version: 1.0
Message-Id: <20240628-misc_perf_fixes-v4-2-e01cfddcf035@rivosinc.com>
References: <20240628-misc_perf_fixes-v4-0-e01cfddcf035@rivosinc.com>
In-Reply-To: <20240628-misc_perf_fixes-v4-0-e01cfddcf035@rivosinc.com>
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
X-CRM114-CacheID: sfid-20240628_005209_743775_B334A1E5 
X-CRM114-Status: GOOD (  11.90  )
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

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
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
