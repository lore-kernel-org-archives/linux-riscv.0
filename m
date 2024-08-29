Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED14C71135
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 09:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PTaXnf16Nz3PbQzgFz4cyuBPLx8yHKaZfzrwNn0wehE=; b=ey+f0ZHYOrQQrK
	Q/VQUM2mOazD0k+c2bvuCNq3vAUYlSGYdtSq6ofYD0ICKgcaQ3uogmwe8GWNj41HZ0bJ2mYtFeZ7i
	D1H7oj/KuaJ+tVbvNElKgUSKrsjiUkMfJ+pRZOmWkTszkRWAgXlw64qHG/sgcZ1uhVNWhKe/Cj7O7
	UWVFZX1XP27s+3afsV1G9F37SUl9f6kb/6JwgPt5PARrjn532aoBB+NhFw259QwqeQ/y2qVZ7QZMo
	4Zo5T8Q8pDIjebmY++g1SFvkn+v3BhZ9Wr49x1HFwIwETiCoZ9oiSOLg3D+yZO8rb4ANnOrDugXii
	5gJ76RmWJodQDq3UN19A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjb36-00000001GkJ-04vR;
	Thu, 29 Aug 2024 09:02:36 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjb1D-00000001Fzk-0tmE
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 09:00:41 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-371afae614aso253951f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Aug 2024 02:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724922037; x=1725526837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BeNRcsK1VBAVknVZMYL7LYgNLSYxmT3BPkThGqZl++4=;
        b=ji5u1e+UvA5Q3LRrQWbTLc7YHGlZzOxreM+9DJ2TFdPRzEjv3d2npe2PlywymUdozV
         Bn2XOVITPVhHZzsbCoU5q/L59Jzhj+oHmYVUrXjN8DWFugQPgyPTQYP4ity6UuebZDn/
         fnR8f17ApmIhhJ2RgGmtgvcNT+sp2PWwqm+lWe3WpwRZvWuMe1MitIdMFEhmbSFjiHZu
         zaCPhrQJ4AJMbtDCPYv8aA7Khk4/RmGEt9+Av6Nm5to8vHLL7Gia7g8zsqpsoXGki901
         +1dVpzDJPTA09OB/y+1Agk7lyHISGcGllZjhdLxOw4Y7eYhrzDTbSapuMiJouWBAYYRR
         tb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724922037; x=1725526837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BeNRcsK1VBAVknVZMYL7LYgNLSYxmT3BPkThGqZl++4=;
        b=eUh8QklUD64EtnW2/mU9nyZ2mqGeZLlx8s2AT17QeZHqm/OYeDNegKVZEIFsgzEc69
         YqaVpf4Ru7rINLibwwpQ8ZjPcJ86mp1DJO5YGcQDylxVBms/bECrcgKZwMSHV6vbFSQ8
         hSn478eF57v6eXvRHcmLNF09u9SeckCk5lSJELKX1zLq1d1y5AZ5b+Wcke/R6y13opuT
         UkSXRJr2cgBuGwCyUzA/oRAy0xSszrGezGKu5UYz37ibg0BCJXsw/Jujthq5Hc46Wkc+
         bG1kXP2J6dQ0y7pQGmk9DhC1Y6ozne75LNbU90xi/u0m0Garq1gSM023RyfHx/Qe65yr
         gGFA==
X-Forwarded-Encrypted: i=1; AJvYcCWu6infCbkv71Ts4/dzuT+nQfYNVQ7gBxn2az/ASaTb8tsv/hc8rG9H0bdOlIZnUfSXraVLtfI1f6oDjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMC5GHNxqQ7NkAMv6LKBezawIalkLfyi6hSidWSvyEcNE4GCJP
	prlk7PySFcZMFUvjb5tp2UhouZo0FZ10aUg0A6Fs9Uxr2EWl4bpsaBCkcUzVzV8=
X-Google-Smtp-Source: AGHT+IFDn/Gg69njG25mI4d4sEhZazC4fYygfh318ZFGyBPM6YU+PgABbs6EeHt9ufd4I3vB2nPnxQ==
X-Received: by 2002:a5d:51c9:0:b0:368:4218:a3d with SMTP id ffacd0b85a97d-3749b54fe8bmr1391056f8f.37.1724922036607;
        Thu, 29 Aug 2024 02:00:36 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749efb15b8sm860971f8f.105.2024.08.29.02.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 02:00:36 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nam Cao <namcao@linutronix.de>
Subject: [PATCH -fixes v2] drivers: perf: Fix smp_processor_id() use in preemptible code
Date: Thu, 29 Aug 2024 11:00:34 +0200
Message-Id: <20240829090034.15777-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_020039_632944_288F6CB8 
X-CRM114-Status: GOOD (  12.79  )
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

As reported in [1], the use of smp_processor_id() in
pmu_sbi_device_probe() must be protected by disabling the preemption, so
simply use get_cpu()/put_cpu() instead.

Reported-by: Andrea Parri <parri.andrea@gmail.com>
Reported-by: Nam Cao <namcao@linutronix.de>
Closes: https://lore.kernel.org/linux-riscv/20240820074925.ReMKUPP3@linutronix.de/ [1]
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---

Changes in v2:
- Do not disable the preemption in static_key_enable() (Will)

 drivers/perf/riscv_pmu_sbi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 31a17a56eb3b..febd8e74a72f 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -1373,11 +1373,16 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 
 	/* SBI PMU Snapsphot is only available in SBI v2.0 */
 	if (sbi_v2_available) {
+		int cpu;
+
 		ret = pmu_sbi_snapshot_alloc(pmu);
 		if (ret)
 			goto out_unregister;
 
-		ret = pmu_sbi_snapshot_setup(pmu, smp_processor_id());
+		cpu = get_cpu();
+		ret = pmu_sbi_snapshot_setup(pmu, cpu);
+		put_cpu();
+
 		if (ret) {
 			/* Snapshot is an optional feature. Continue if not available */
 			pmu_sbi_snapshot_free(pmu);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
