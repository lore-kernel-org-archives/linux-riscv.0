Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEF4E95A97
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 10:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SvT4iyrUdiuE1CCXvZ4fchbp+nyNeiwFwLOS5+Z/w5U=; b=0x0Dfmsx/Dz9Yt
	+ggfypyPFtGA+kILbltxaEH8cbwZLNFTzMRo2BFs6TIhlvztRGo6sAExHCIngp4gMej7Q3ajK9vv2
	PcP8J5GACUJO2sUFtePwXIrdq8HZGCJAcI+1EFcidMxy1zkBEALyDe+WfmWmISZYXOm0c7LH/6G42
	nKfqTG/f2/DnBcrmx6B2wZjxahIb8Wy45cSra+rSg2cQt/3FAiHcYo7v3qugXPHN226kQGniDz80z
	MHyJff/7/lkvL3iegn/gaZ0rWyNrQFXLt+SvJD+lQaFCVDyZMT4G/qUBnDdVvqh0G1nhsBslHQeaZ
	IQ8QrY9UtQmtVEMGyl8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpncz-00AFgo-1B;
	Mon, 09 Oct 2023 10:36:45 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpncr-00AFVw-1V
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 10:36:40 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3296a998234so2518015f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 03:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696847793; x=1697452593; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLqmJToKVvGx3RPF93C/D7OTDNmDiwUSULcdREcteNg=;
        b=U3GFykntT8dYxu8c/TtyuMsy/LZvSJrC5I2gXEOhpOPJ9p9chQEHVf1yC8Hp2/l+Ud
         SmvZs2gfCGVpreKLXm/UkGPEjVt+h2EpG6GbLz7UsFyaH17RzGzSpaV8yIbdlMX00VM9
         mwhRkMLKupFZ8112V0f5/kEDzBrI0it/tj/QT19bEQ37VMLEGu/dPg3G0n/OH0lBIOMT
         y2XYK1h1VEDmcZJaQWu8jx2vIw8SQHWLazISJJuS4nDfcd2kEj5D07/Y3oGQMpBrbzs+
         VHBM7zGo08FoUvtwm+BKo1hZF8YT8uLarAjZlF+rm/3bjml0CrWBnhMM0LgAEjldeM+3
         NWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696847793; x=1697452593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLqmJToKVvGx3RPF93C/D7OTDNmDiwUSULcdREcteNg=;
        b=rFxY/ViEbTMCM2pCk07rb1GIgYnADwkNfNrbh1TVTs4oeV/rHdeJBoaUmKoCuHfngq
         0+J0cGuVfkkEk2Hd8atlZXRrMud/ApqTzzTM5C52u0dDhiaSa1Sxc0l1Ia7Yj8PTZWZ6
         HWaGi3+mgspcugrABywKdPYjEIqVPizqgWpOlbZE+GuMBXuGJDGCoR63H2BEYJeVhc1n
         E+82o9VLGZscufdJlc8ayzCfppHKner4wn6fWKWBe7q9FoGV5ipdgUt67+qbG724JXlw
         VPEHU86RgulfH1nZbAB9NG7EZrFHr0IuM29/E0XsxSbiwK8dIjD+Xwyx8fJ+x1WIwxui
         tiqw==
X-Gm-Message-State: AOJu0Yx3ml0I5KS1HjW9t/DlRzYrYlVRgmruT7IP/aC+HrS5R6faxSO0
	ZF5cJUIst/paIqa6dkP6dxKtiA==
X-Google-Smtp-Source: AGHT+IE1c9bbdHMwBLMomM9sWbKgUcq5hfVG4KlvDcosRRJkN4Ti2TteiXopQtpHeenYl1QcJ2PxJw==
X-Received: by 2002:a5d:614b:0:b0:31c:8c93:61e3 with SMTP id y11-20020a5d614b000000b0031c8c9361e3mr12270603wrt.60.1696847793608;
        Mon, 09 Oct 2023 03:36:33 -0700 (PDT)
Received: from vingu-book.. ([2a01:e0a:f:6020:53f1:24bc:5e47:821d])
        by smtp.gmail.com with ESMTPSA id f16-20020adfdb50000000b0031ff89af0e4sm9226722wrj.99.2023.10.09.03.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 03:36:33 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	sudeep.holla@arm.com,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	bristot@redhat.com,
	vschneid@redhat.com,
	viresh.kumar@linaro.org,
	lukasz.luba@arm.com,
	ionela.voinescu@arm.com,
	pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org
Cc: conor.dooley@microchip.com,
	suagrfillet@gmail.com,
	ajones@ventanamicro.com,
	lftan@kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v2 6/6] cpufreq/cppc: set the frequency used for capacity computation
Date: Mon,  9 Oct 2023 12:36:21 +0200
Message-Id: <20231009103621.374412-7-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231009103621.374412-1-vincent.guittot@linaro.org>
References: <20231009103621.374412-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_033637_539946_ECCD09A8 
X-CRM114-Status: GOOD (  10.51  )
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

cppc cpufreq driver can register an artificial energy model. In such case,
it also have to register the frequency that is used to define the CPU
capacity

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 drivers/cpufreq/cppc_cpufreq.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
index fe08ca419b3d..24c6ba349f01 100644
--- a/drivers/cpufreq/cppc_cpufreq.c
+++ b/drivers/cpufreq/cppc_cpufreq.c
@@ -636,6 +636,21 @@ static int populate_efficiency_class(void)
 	return 0;
 }
 
+
+static void cppc_cpufreq_set_capacity_ref_freq(struct cpufreq_policy *policy)
+{
+	struct cppc_perf_caps *perf_caps;
+	struct cppc_cpudata *cpu_data;
+	unsigned int ref_freq;
+
+	cpu_data = policy->driver_data;
+	perf_caps = &cpu_data->perf_caps;
+
+	ref_freq = cppc_cpufreq_perf_to_khz(cpu_data, perf_caps->highest_perf);
+
+	per_cpu(capacity_ref_freq, policy->cpu) = ref_freq;
+}
+
 static void cppc_cpufreq_register_em(struct cpufreq_policy *policy)
 {
 	struct cppc_cpudata *cpu_data;
@@ -643,6 +658,9 @@ static void cppc_cpufreq_register_em(struct cpufreq_policy *policy)
 		EM_ADV_DATA_CB(cppc_get_cpu_power, cppc_get_cpu_cost);
 
 	cpu_data = policy->driver_data;
+
+	cppc_cpufreq_set_capacity_ref_freq(policy);
+
 	em_dev_register_perf_domain(get_cpu_device(policy->cpu),
 			get_perf_level_count(policy), &em_cb,
 			cpu_data->shared_cpu_map, 0);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
