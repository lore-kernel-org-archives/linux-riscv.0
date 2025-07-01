Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F133C83F01
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 12:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kJ26IDPdlo3tpH+bVOQw3ls5jFWI5h0R/op61d6lMXc=; b=MskPzc2/X+KZ6s
	I3E8db2iwOQN421kn5S7dhtMTUPEBv+IbOnxGh2MLiF0AD2YHyFKk+miQgGjHAWOovfrNc3KWTWAE
	29YzyZZZNxPJRWbACrhVt1F8LgHjPM8O10MbodkzggPLYF5QDiSe8srMjFdLJLqTtvlkiJhy1LbgX
	al0nB8DeAKBJJJySGeGHc3PKJ+aL/4FahZei5vCEBPy/u3cCQKMs8KP1G8dXPGSQXtod141vIzO+Y
	QWyFRAoFhNksq6Wny0ZoBEMXiK6o9GlDOILtFSB3Cbx9xVgoh6XxtO7BBg4JD/2ImiB/J57Llv6Hu
	yoyev4mIp7nah83TYoJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWa9B-00000005K0E-0Tjh;
	Tue, 01 Jul 2025 12:31:37 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZSy-00000004uia-44Ad
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 11:48:03 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-553e5df44f8so2687292e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 04:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370479; x=1751975279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHynz9mWDead3UZZabeI741cKQ7wi8Dc9CTNMBrKiZk=;
        b=WMEIZp7bRUjvyWbAnvkflEWzWsaWC5909ZMoUGH60rGH4l8bWt6BtNNnhbleovEDa2
         JnSprdt1NDdoilm/MXX/blJcAdG3Uigo8wPtylVJJ0JzQMtvGZ9GRg6ZsSvbVaSp3kZQ
         lHgVsPyM/nycIrv/5Kvr9bQOLyBTgdc1JtO3zq3JRsHao4YPwifJmBNTjtIbuugSsm6c
         /S+h7uFi6Qn6vVjuT4LfP3cZ4oYS6LL2yQnQDre7y19EqHwreXxfWZgJaolm7AZc4Kya
         +5B0d0nqfvurzjeAi8ZMRc4BuNt7v6hxik4fYtEGK2rUB2B8ZjWBNTqG8ksJhPSavU0Q
         iVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370479; x=1751975279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHynz9mWDead3UZZabeI741cKQ7wi8Dc9CTNMBrKiZk=;
        b=ZDhXBshE0n9tkElJIWspEH0TSe0iHbOxHVXv5zmArnaBMAZFnBPXrZrCfJy/laJGOV
         25ZlqBLecNbiIM+NQnZVYJhHKzCCUza8E5HiOfPfb+VlHicOJLunPrr8QspOjFlbfaso
         wnfowj3vaGNcvXtDYwfYV5JaTKkM29SSzrLGKRyHrabkSXVvYZPz6RbDnmfHKyV579Vw
         R7huCS2A1fgqb44VYvariPAXdBTT9GklHKR6FCOLTOqifJH2E48jgBGc66R6NhAaspBQ
         lL79D7crTpi6J86BlRrxRuYNGGzjxdRIBYFGbCLApJd2BMuhAMqTc+ekiDBp+Mp/F4ih
         2mIw==
X-Forwarded-Encrypted: i=1; AJvYcCVtiuxIg36NdBn4deKU3lnvaKh7U5FJ4FCS4lEIfp1cC61otLCZl4O0lN3DiYnM53AIyy5U1kozdLG5Qw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUvS0p5ewfc4deGPc546t24W+etU2RoC7t5xn4pg/oXCFT5Qod
	ZTKh+xjSOndGTWFgal4gEhXu/hllQ0JPjsvcxM2R4NK/ztuHbxirwROtjkVlDPNYCSE=
X-Gm-Gg: ASbGncsgSibFe+pM69w0iO30/PfB8b33lShkDLLmCxOYKHTsVf9tGGDwD0YkKmY+S/I
	HQeK0x/ULU9r27gvgDLu3Qd8Lx5vPU+mmN6OwwWYVzYJSX3mF8R2sCCc9m1n8OpAY7Wa03JPGDa
	UiW9bsSXm/eDz8ikUn/bmmoPFcW5PvOBky9XXzQZuFpYXIWhNhBVZKpagcuxe+cUVHizngahLno
	bZ2CssQy+eCasEqJ1kuXPM489Nlq8bJ606wEYYoSDPdIu/66iIyktRNpnytFZwKAXH7gvM8EB3h
	CnSAPyrPAHBbsHzPH2L6qy1unLj3UpNxuT56EN4wSSuEXXcdLPfX5oSP/hFaHJjm8r6+KgQWWmO
	Fwf+etXJyBTXJE7aNe0yO1VeCApH+fm6oUVXv
X-Google-Smtp-Source: AGHT+IFqyMXKCb8elAwuQdxdqHT2scTfHnmyox7XhrjqrojZnvfr/F02wddlYBxLw5k9BSZ0P+ueUg==
X-Received: by 2002:a05:6512:114a:b0:553:a867:8dd6 with SMTP id 2adb3069b0e04-5550b7ecd57mr5857067e87.9.1751370479219;
        Tue, 01 Jul 2025 04:47:59 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:47:58 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 11/24] cpuidle: riscv-sbi: Opt-out from genpd's common ->sync_state() support
Date: Tue,  1 Jul 2025 13:47:13 +0200
Message-ID: <20250701114733.636510-12-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044801_022133_3A759A68 
X-CRM114-Status: GOOD (  12.56  )
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

The riscv-sbi-domain implements its own specific ->sync_state() callback.
Let's set the GENPD_FLAG_NO_SYNC_STATE to inform genpd about it.

Moreover, let's call of_genpd_sync_state() to make sure genpd tries to
power off unused PM domains.

Cc: Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/cpuidle/cpuidle-riscv-sbi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index 0fe1ece9fbdc..83d58d00872f 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -347,11 +347,16 @@ static int sbi_cpuidle_init_cpu(struct device *dev, int cpu)
 
 static void sbi_cpuidle_domain_sync_state(struct device *dev)
 {
+	struct sbi_pd_provider *pd_provider;
+
 	/*
 	 * All devices have now been attached/probed to the PM domain
 	 * topology, hence it's fine to allow domain states to be picked.
 	 */
 	sbi_cpuidle_pd_allow_domain_state = true;
+
+	list_for_each_entry(pd_provider, &sbi_pd_providers, link)
+		of_genpd_sync_state(pd_provider->node);
 }
 
 #ifdef CONFIG_DT_IDLE_GENPD
@@ -396,7 +401,8 @@ static int sbi_pd_init(struct device_node *np)
 	if (!pd_provider)
 		goto free_pd;
 
-	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN;
+	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN |
+		     GENPD_FLAG_NO_SYNC_STATE;
 
 	/* Allow power off when OSI is available. */
 	if (sbi_cpuidle_use_osi)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
