Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004EFC4167D
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 10:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jaHtMJw6tvP+i4XHIh26QWCQW8m1fbTMp1G9L2Qkbu0=; b=0s9+WrWy+U+dln
	WmTNqOthDcX5mC7h0GAoBUKmaDcR+V/P3NkUhlVdlb5GZI9AedivPvj/OCGGNrHBH7Z6MM2PKkarG
	HwoqwjilOkZNqENxF5rG/ArnF6TZ/cxLwiNT+lQ0v2tu0/DejimywlANG4bjsKIBZRspmM+xX7/BB
	ehDJzxrtVzvR8ugz0kcFXwxEx1nPi60QEf/mZGhd2Xp88M+bkJ55Gbo09RJrlmkfhQmXNQclhDRTJ
	D1ilzd+/q+dqnrQ6AkUHDDhzFmCNBRN1LBI6ypaUhaiUXCTqYz4gcp7sCohHKX8tUIgr8dGUqrSvZ
	nIBNHFkaBHowSEc53Ezg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r123o-005tgD-1i;
	Thu, 09 Nov 2023 10:14:52 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r123l-005tce-1o
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 10:14:51 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4079ed65582so4347835e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 02:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699524887; x=1700129687; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4oi3jXI7vrHdw4Az1EYDzA4Gdmd91pOzyx51udMAAeQ=;
        b=xHDvjBXKCVT/us4AcrS+hFxaEnJtjWo3eydd5KglulRElxwMdOhZsXoO/fadnrmJ9Q
         7gt/XWqNPdlMm5dXhdA7fWeM8/FjbZuEG2bk0Zu2Imyh7zoultWjJ4U6aXR6+lwDnjql
         xse3LfbT3as0ZkQChysZUtFyDsSdirZeKBKooQ54+9uzWZEkK0hpgmaT6i9CelC0Gpik
         7A45ZHXuS6NiHe1/bd9ssIuTLGGSR9L6Yn/OjGLnJy+x0TJm6h7xFDkoNQaPrI/JZTNb
         P5cCBSuaqvoif3j2PTP920pKPejd3kxlw/XDBdM70Sy3LtYIXlUwx9pQSoNyi6FYNZUz
         7uBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699524887; x=1700129687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4oi3jXI7vrHdw4Az1EYDzA4Gdmd91pOzyx51udMAAeQ=;
        b=OM+kzRgqQUsM0gm4Wo9C6aExB8OCoFB99vwlQrkqOfUUyLJNK8HsvWK6bmO0xEYSOE
         xSnbKN5x6dclndURk38hHA4R0bPx8H1QI4RensZJQUCj0nlpIDkb0WOMhalabT7U4oEc
         ex568+DcVm+U9X3krB05Q+OMRA+mCCs8LaNfyQXyWvvTBMY4U5+EUsE4mMwQeq9Ed507
         dPdjAi6Uct30qmI5Hol0YYQnlshBkO9wDysVF1Obk8VkN2eMfN4nV5PYIZhht1lfmuFt
         WoA8sJzQcjhBtUooDSjK0/S6Ihj9bAiCdYldES8T/CphgqZoxYX25E0WgrNbqYWUnWFW
         eHvQ==
X-Gm-Message-State: AOJu0YxUtI4npjKFHKJST6xF66KKUtbPhtw6pjp/a0/B78I612bMewlo
	4XkdzugeHEHUMmCe6zY4zTYPUg==
X-Google-Smtp-Source: AGHT+IGLiZmuTGbMYyyqS0Ud9k4f2BHvLpElKnJiu++mYwxV1ds6E0Yux6gLdmYe3xpB+kvAcq0ZeA==
X-Received: by 2002:a05:600c:20d:b0:408:fba2:f4bc with SMTP id 13-20020a05600c020d00b00408fba2f4bcmr4093547wmi.24.1699524886779;
        Thu, 09 Nov 2023 02:14:46 -0800 (PST)
Received: from vingu-book.. ([2a01:e0a:f:6020:26e5:c6da:63bc:dd99])
        by smtp.gmail.com with ESMTPSA id m17-20020a05600c4f5100b003fefb94ccc9sm1611816wmq.11.2023.11.09.02.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 02:14:46 -0800 (PST)
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
Subject: [PATCH v6 0/7] consolidate and cleanup CPU capacity
Date: Thu,  9 Nov 2023 11:14:31 +0100
Message-Id: <20231109101438.1139696-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_021449_595538_EFF3AA1A 
X-CRM114-Status: GOOD (  16.79  )
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

Changes since v5:
- remove useless return in freq_inv_set_max_ratio()
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
