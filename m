Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1BCEB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 08:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=20FuT/psqh3xi93+PVX5Gz/lFmFDy9mcMK1hXRiTBfA=; b=ZZ4mUYUW81sgqy
	brgnYyRYlxXbYbrTdBXRWJyfqcko3dTqQeo4O533XyvoYqMlYZuvvg7QulSyebhuSdmnLb1Rk+peH
	Us5L1yFN1v3HIMBAqaGTzmZns8/NwlRXyzdUJbzvIOKNlsMfxxkwGvwAKWiSQUbC8X+atewBkWsnA
	boPmxnQl0EY7j0X2jsqLCTSlRAHZFmdnGrfSQ8xamXBnqZpDKlrhz2ILmP9Y1XJ6IJKKVmCzJUaCk
	qAD1ySJw1+Tji0L8IAluKggO5aMxBMXbt8x9dL80IURNwrofYToVwlx3vFEIa+g7LGU/qsrhU/NKT
	czc1Xr5iXmcb5y+fA2Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF9bd-003Bqp-0x;
	Fri, 30 Jun 2023 08:35:53 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF9ba-003BoV-0p
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 08:35:51 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f9fdb0ef35so2642957e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 01:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688114144; x=1690706144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ourpCES+L8D+Sf3DlwDnrKMPgPuj2Rb0Ie1m7RKO9o=;
        b=0KLssk8HRfE90130xKoKTzd8QqIpNNmEGYyeL+ivfM59890lBfIuxPh/YTTtxMCeJu
         HilIlZL6yYJHT+NSdn2sWN1C3I33DwQxN5PPXQk69+hLlbGiOnTa3XOfshkprJru9dCp
         AeDmMl1VoQDpxwaI+8E2wJD1THYAUCwr1Zaa0GHElk3IDp8gkCxpUazrlnegNSdrthgC
         JBuREIxskFXjzwLrlDfKLochEuX5EBp/lfz3dW1Ko/jbOkZn5tzbNH7Xy/WEQlTW29Mw
         zbe10nFdCWzgoKjjn4/cjhnuLG9yl9b+oDWEOXNbIRq2mQX+Hv0MyM55crAam+humX+M
         /6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688114144; x=1690706144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ourpCES+L8D+Sf3DlwDnrKMPgPuj2Rb0Ie1m7RKO9o=;
        b=QtcrBggn3AJaHrUKBkn9gBztXLyLrOXQWW4fLOvsdKkol2dnhCKPwvWIL/DM4Qnd7S
         uMXkakhTxTcbKnji5V3yZmhF6P8llr4cBBTn3ElMzp1+8PBJix0HRca2jxhrYbcfChg+
         mu8MoXME1YTqmQXvy2Bt7H7o8EpUOgjWwIKW03M6dq7+IyY6+lGexG5o4Jm7UENIwwdm
         qD1VcRUYCD6Fv3ev2ILHBforpDtlsBlkujU+fLa9roly1x9eckHce5FaOBx0zfJq0Z9L
         4k+whtP6xFgE42s86ZT1+YI1OmkkZeEbAbDxhM6KgcZri3qI8p7K5z7IgViFAfbSIe4n
         HhVw==
X-Gm-Message-State: ABy/qLZuZTGFFKjJMxRtBZ4qyfAdHur0FgYc+mN97e40yNMlWdsuWHKL
	KvMqmpYLAUibmeS+pkB2WXGH+Q==
X-Google-Smtp-Source: APBJJlEKmo6oGA8BhKLYpuMDCbIqFVI+6Q81fGGqSIHo2vLevwphPX4q4nQy50JIRXqiJIM8dj26WQ==
X-Received: by 2002:a19:9110:0:b0:4fb:8ee0:b8a5 with SMTP id t16-20020a199110000000b004fb8ee0b8a5mr1396269lfd.46.1688114144613;
        Fri, 30 Jun 2023 01:35:44 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id s15-20020adfeccf000000b003127741d7desm6286799wro.58.2023.06.30.01.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 01:35:44 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 04/10] drivers: perf: Rename riscv pmu sbi driver
Date: Fri, 30 Jun 2023 10:30:07 +0200
Message-Id: <20230630083013.102334-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630083013.102334-1-alexghiti@rivosinc.com>
References: <20230630083013.102334-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_013550_313517_D384309E 
X-CRM114-Status: GOOD (  15.28  )
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

That's just cosmetic, no functional changes.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/perf/riscv_pmu_sbi.c   | 4 ++--
 include/linux/perf/riscv_pmu.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 4f3ac296b3e2..83c3f1c4d2f1 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -914,7 +914,7 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 static struct platform_driver pmu_sbi_driver = {
 	.probe		= pmu_sbi_device_probe,
 	.driver		= {
-		.name	= RISCV_PMU_PDEV_NAME,
+		.name	= RISCV_PMU_SBI_PDEV_NAME,
 	},
 };
 
@@ -941,7 +941,7 @@ static int __init pmu_sbi_devinit(void)
 	if (ret)
 		return ret;
 
-	pdev = platform_device_register_simple(RISCV_PMU_PDEV_NAME, -1, NULL, 0);
+	pdev = platform_device_register_simple(RISCV_PMU_SBI_PDEV_NAME, -1, NULL, 0);
 	if (IS_ERR(pdev)) {
 		platform_driver_unregister(&pmu_sbi_driver);
 		return PTR_ERR(pdev);
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 9f70d94942e0..5deeea0be7cb 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -21,7 +21,7 @@
 
 #define RISCV_MAX_COUNTERS	64
 #define RISCV_OP_UNSUPP		(-EOPNOTSUPP)
-#define RISCV_PMU_PDEV_NAME	"riscv-pmu"
+#define RISCV_PMU_SBI_PDEV_NAME	"riscv-pmu-sbi"
 #define RISCV_PMU_LEGACY_PDEV_NAME	"riscv-pmu-legacy"
 
 #define RISCV_PMU_STOP_FLAG_RESET 1
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
