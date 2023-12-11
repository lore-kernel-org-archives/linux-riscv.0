Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07853C10F07
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 10:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2Saak5UvoCW9vQPJXIKF8sSj3e6l4GO3sGBBta2Oh60=; b=wn5+dIcAYiP9Tt
	EIoVXVNPvKaPKXmUgw5Ms3xVR4tYT4akuCeCcyll3tzT6ZtOIRKdi1Vo70p5H84q6hW80ohXSg3Pj
	bgRWNo1miWiO1HgW9cbv5YbD+oF8JQEj/y2AhIBzD4iAWSAvUYNNl0oLof2skgcL2vPk3SWiwxkNS
	Nkkz8qEYgJgCeFWaHKQMPfpllLwXCuQh9xnxGR19UmjeP1hIWgx1VC/lx4X2z5Vul95UTaFmgOdr+
	AHF1uamDsyKfWJXoVdoxoqqFx+3GVpJJicT3A8NbJJEj365gKeVIfWEzv8sY8J+p5heedGkWEiyGw
	OICf0oDisbaSzfUTppEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCdqx-004eCM-0W;
	Mon, 11 Dec 2023 10:49:35 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCdqb-004dyl-0O
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 10:49:23 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3333fbbeab9so3878880f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 02:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702291740; x=1702896540; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IWzSZuy+BJY5KdPH9uh7PFjswwXJ15GYr8pE1c5Ls/4=;
        b=hDTOzM0y6xZdDYwn1U6C462msbNtI+j7iLUoNN5qUKsT6SAbKaxDP8q3AZAhcCRza7
         n41nHvpw3/XGF+qBoKT12RjW7ZNObdShQVdzzu5cLnHs4KCIUA5gTG8GgTJt1+gk8BPl
         IXhq4+XxpFxM19BU/XdDvFaCLmi1giFsFohhRE1EstQNVKPWoFeJyX2GIuAeFD3PiaqF
         umYnjZ4IwRtRMjne7T2ldCmcJH1zWiA7czZnQIpQeINbwqeycoGtTqJy5KwcYbDQuvtT
         REPrvpSwPCyvhTPJcLu+gSpH+5jIVFAvysKpeTvbJ3GbxbkUe/LfeYvemWsq7iKVq7N0
         xuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702291740; x=1702896540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IWzSZuy+BJY5KdPH9uh7PFjswwXJ15GYr8pE1c5Ls/4=;
        b=Y0NnolrygLA5ml9JskKx51NrAXFuL5SsxuIsyhjCJ6yByJvm+Q02E52Fp8bTSQeRst
         DNI0Cx0rV/IPxzCN25IZfT9xA+2tRPnQdcybfSHxMThYbIpvbwb7iactc4mhI9dKehf1
         /SIRU9LtLDiFiwaEvoBJAJyzoaZOBXfQAculrrK5MbYTT682iFmr3WBWtGxq3QOuBqtL
         X/mkAGOCiAodvXOpM4WB0STtMnbCvhplOxKvi9QaRWZRCPJwmtBFp40rLZeP/4iUy/n8
         KJPhSGZ+xNAideSiA3QgQe5nxvP2EW56Cm+dNmKLiyUt75I5AmFhBPnRWXAyZjVFFJOc
         GRVg==
X-Gm-Message-State: AOJu0YwbMRXd8mv7ujTWVfeCJg5AmVwLiPMgQc4BHReAznIvQvNEsJaw
	95r+DSFHIqrg8cpYIuaU0JPDiw==
X-Google-Smtp-Source: AGHT+IEKJ8ZipmsRoGBJMPEX7p5Y8cHuPNamCdUScoQEcaAztSZfnYFJI6KbkQ8H4e5b59Wkt0BG5Q==
X-Received: by 2002:a05:6000:bc6:b0:336:ab9:9659 with SMTP id dm6-20020a0560000bc600b003360ab99659mr2961273wrb.92.1702291740351;
        Mon, 11 Dec 2023 02:49:00 -0800 (PST)
Received: from vingu-book.. ([2a01:e0a:f:6020:a8d:abc:f0ae:3066])
        by smtp.gmail.com with ESMTPSA id e16-20020adffd10000000b003346db01263sm8232579wrr.104.2023.12.11.02.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 02:48:59 -0800 (PST)
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
	lenb@kernel.org,
	robert.moore@intel.com,
	lukasz.luba@arm.com,
	ionela.voinescu@arm.com,
	pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-acpi@vger.kernel.org
Cc: conor.dooley@microchip.com,
	suagrfillet@gmail.com,
	ajones@ventanamicro.com,
	lftan@kernel.org,
	beata.michalska@arm.com,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v7 0/7] consolidate and cleanup CPU capacity
Date: Mon, 11 Dec 2023 11:48:48 +0100
Message-Id: <20231211104855.558096-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_024913_525971_9921EEEE 
X-CRM114-Status: GOOD (  16.36  )
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

This is the 1st part of consolidating how the max compute capacity is
used in the scheduler and how we calculate the frequency for a level of
utilization.

Fix some unconsistancy when computing frequency for an utilization. There
can be a mismatch between energy model and schedutil.

Next step will be to make a difference between the original
max compute capacity of a CPU and what is currently available when
there is a capping applying forever (i.e. seconds or more).

Changes since v6:
- Rebase on tip/sched/core and fix a conflict
- Add tags

Changes since v5:
- Remove useless return in freq_inv_set_max_ratio()
- Add tags

Changes since v4:
- Capitalize the verb in subject
- Remove usless parentheses in cppc_get_dmi_max_khz()
- Use freq_ref pattern everywhere
- Fix MHz / kHz units conversion for cppc_cpufreq
- Move default definition of arch_scale_freq_ref() in
  include/linux/sched/topology.h beside arch_scale_cpu_capacity
  which faces similar default declaration behavior. This location covers
  all cases with arch and CONFIG_* which was not the case with previous
  attempts.

Changes since v3:
- Split patch 5 cpufreq/cppc
- Fix topology_init_cpu_capacity_cppc() 
- Fix init if AMU ratio
- Added some tags

Changes since v2:
- Remove the 1st patch which has been queued in tip
- Rework how to initialize the reference frequency for cppc_cpufreq and
  change topology_init_cpu_capacity_cppc() to also set capacity_ref_freq
- Add a RFC to convert AMU to use arch_scale_freq_ref and move the config
  of the AMU ratio to be done when intializing cpu capacity and
  capacity_ref_freq
- Added some tags

Changes since v1:
- Fix typos
- Added changes in cpufreq to use arch_scale_freq_ref() when calling
  arch_set_freq_scale (patch 3).
- arch_scale_freq_ref() is always defined and returns 0 (as proposed
  by Ionela) when not defined by the arch. This simplifies the code with
  the addition of patch 3.
- Simplify Energy Model which always uses arch_scale_freq_ref(). The
  latter returns 0 when not defined by arch instead of last item of the 
  perf domain. This is not a problem because the function is only defined
  for compilation purpose in this case and we don't care about the
  returned value. (patch 5)
- Added changes in cppc cpufreq to set capacity_ref_freq (patch 6)
- Added reviewed tag for patch 1 which got a minor change but not for
  others as I did some changes which could make previous reviewed tag
  no more relevant.

Vincent Guittot (7):
  topology: Add a new arch_scale_freq_reference
  cpufreq: Use the fixed and coherent frequency for scaling capacity
  cpufreq/schedutil: Use a fixed reference frequency
  energy_model: Use a fixed reference frequency
  cpufreq/cppc: Move and rename cppc_cpufreq_{perf_to_khz|khz_to_perf}
  cpufreq/cppc: Set the frequency used for computing the capacity
  arm64/amu: Use capacity_ref_freq to set AMU ratio

 arch/arm/include/asm/topology.h   |   1 +
 arch/arm64/include/asm/topology.h |   1 +
 arch/arm64/kernel/topology.c      |  26 +++---
 arch/riscv/include/asm/topology.h |   1 +
 drivers/acpi/cppc_acpi.c          | 104 ++++++++++++++++++++++
 drivers/base/arch_topology.c      |  56 ++++++++----
 drivers/cpufreq/cppc_cpufreq.c    | 139 ++++--------------------------
 drivers/cpufreq/cpufreq.c         |   4 +-
 include/acpi/cppc_acpi.h          |   2 +
 include/linux/arch_topology.h     |   8 ++
 include/linux/cpufreq.h           |   1 +
 include/linux/energy_model.h      |   6 +-
 include/linux/sched/topology.h    |   8 ++
 kernel/sched/cpufreq_schedutil.c  |  26 +++++-
 14 files changed, 224 insertions(+), 159 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
