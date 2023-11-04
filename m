Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA42C4332F
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Nov 2023 10:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cyD96UE5+pZOyQABpFOrUZcxMwgCpP6xWm2RvwKuqLQ=; b=PxhlQXjGI8j7U0
	1IP9Yc5HFJlNcQAkj+Kv0+H0GfraJVqKfuRmqmPsRwOR6Yyij9xB/11LAtkJ0pp59Pkmat4sZa3nb
	jG9fNEesaxkfUjSx/Hbfj4nShm4u9t3RRXQNoE7QyRUGqlu8wSO5XgqeC49cmWqP8F0WSq3ohZQQM
	PcAD5QWSRm/Ul0dIeGN/rDfqvpk7FAMqhSY2qPFRDgsArhMAPPXX3WdaHWxkcttG+Y2kE8Se0X1Fs
	w1CofMgqqCWtfH7Gk1f00yoBEVyDr2U7HYEAvc+lwoJSPnL38QRVb8oeInH7zj9+KtFPGDBPY/GK6
	wwcuWc0Iys/ty1X8InVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzENB-00DGzz-2z;
	Sat, 04 Nov 2023 10:59:25 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzEN4-00DGmN-10
	for linux-riscv@lists.infradead.org;
	Sat, 04 Nov 2023 10:59:22 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-407da05f05aso20794925e9.3
        for <linux-riscv@lists.infradead.org>; Sat, 04 Nov 2023 03:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699095552; x=1699700352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NNExFK3YGciyQ9GJGSArLtOwz5E+OA3aCyO23C6vxdQ=;
        b=Fa6wVJBQC0KpUvOLv0JyvrRcG7U8c0kG2ifbpyTiGw0pKUKMZlH0zeqR8qoHq3NdEi
         tCkY4EtOn3MA5wklIVOTkVlC/BnqP4iRGqVeJ2jozR8NPZz7mXOdr35WYo5nvuBnnr42
         Q0dyKrTIc6y77yWWOxm+77j9xpCKNhJFrkWKxJHrZqmbL3vD24H1iSV2+SWQT9TWdhWf
         gara1OeoWd2HCSWDmEck/PBWAvVFMKRxKbc2tG4qzLx0NGy2gfJK9QDsEgh1A4DpRpUP
         +0rZai/mucrSj35T9MBnATLfujb+vFTtcKEtyoWa/le2Kl4LYv2pZ7wZBPRwbEoL6ldY
         ekCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699095552; x=1699700352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNExFK3YGciyQ9GJGSArLtOwz5E+OA3aCyO23C6vxdQ=;
        b=mcihsA7B9V8/CIZFeD8SSMvy1AabcjtiMTzKS5qbZPzTHvAuUONCbU8nrpDEJqaU7N
         BAGMPls+d3EvUWgVWeif6vXKGVClW6s3A14fMkf2V3b847HOFaw8ujdEzRiOPmaq4k39
         p6mOspOceWYM+NUvKU/vSZf6oJ9N7TCycBjTtx4uUZttKCE4ayvLy0cCAZo49vMAQmfw
         cc4rEVsrFXrlGymttkwKgFpeiRgunv41TXrV3Uad317Gdjgnbhl/IuEv0BimRgrc5vmk
         X71Hhk2afV7xzDPhJEX5kM25wK56wwhYRkQk8fTpB95XPwp9QvkvI9r4rV5Q64GN+mjV
         5Vxg==
X-Gm-Message-State: AOJu0Yykt3HpbnIHDmBrraM8T/QYE/vu3t+efIGKXjFNYn+jxSZpd1fC
	Fyt/QNOM5WPhcnlIm0Qeom3Nqw==
X-Google-Smtp-Source: AGHT+IGp4uWcYlP4kHjc0lmFKbWKIFKggNnAnfbnbMYGOblrMi2XBzxq72tIY/+NQsPArSEgCst3GQ==
X-Received: by 2002:a05:600c:1c90:b0:405:37bb:d942 with SMTP id k16-20020a05600c1c9000b0040537bbd942mr20094215wms.4.1699095551951;
        Sat, 04 Nov 2023 03:59:11 -0700 (PDT)
Received: from vingu-book.. ([2a01:e0a:f:6020:3172:eb13:5bac:126a])
        by smtp.gmail.com with ESMTPSA id p6-20020a05600c358600b004053a6b8c41sm5315809wmq.12.2023.11.04.03.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 03:59:11 -0700 (PDT)
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
	beata.michalska@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-acpi@vger.kernel.org
Cc: conor.dooley@microchip.com,
	suagrfillet@gmail.com,
	ajones@ventanamicro.com,
	lftan@kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v5 0/7] consolidate and cleanup CPU capacity
Date: Sat,  4 Nov 2023 11:59:00 +0100
Message-Id: <20231104105907.1365392-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231104_035918_371096_80F6CB73 
X-CRM114-Status: GOOD (  16.61  )
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
 14 files changed, 225 insertions(+), 158 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
