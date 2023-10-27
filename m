Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F24C25B47
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 08:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8/toTGtNLrBzSty1+gp/jF5clHfxkfmDs/nvsT/BuyI=; b=bnlg6G/SqRJSpN
	XKEoYm26MuNfIHy39iLtnRuMrTRJZJ1yU7hQkRnr7hYTzybs3pQCwV5A+AsLMHP0dPnyFL7bY03LI
	TCdnNJ6kvUm7RWTTc9d5T1R6q1eHSgNxPGx9ZWSdEcRjSySutx383cPN9Z0XRsyGTxeFWSXGupxUE
	ySb11TZxJ7cOVxCusz/KpiKzshpfLwqm95ie0tZ/FOh413e8+Md8EC1Kfelj4jQ/ByLCsqRgCupXo
	zYsuIyDutQ0Zi0hWW2fga6fdw5m5WpLRNZ3a3xL2q1ia5919rQgAmG6+NDx3J6IVhcsKMCNvUbkct
	CnG8KaWwtVNAQyEmDkfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHpB-00FsGa-0S;
	Fri, 27 Oct 2023 08:04:09 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHp8-00FsFX-2Y
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 08:04:08 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4083ac51d8aso13757365e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 01:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698393845; x=1698998645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=boXAGtuda+Qb9m4tektze7XbzOBCPPY4QNhYroPvhtw=;
        b=x2TFk+kXUlTQViw7qCo4j2DCWM9htk6UV6imx2AlvTCwDbc8ULNFUX6K05/qCo9pYc
         FiJzxRNrg8pp0tT53lSKKZErrftffGu5SHiHHMfVGKIDDdu/Z9YAlx695bVOZ/lRv69I
         ZqZOSsEedbnZ7ivTJdDXuZWyy4QB5vEshXTJEGAuYER7CtJNs+3rrvkOknvlLtayGssv
         Wml9rLe7w+v0BYml2A9wMYVhMpbL1y8Fgcl/T6D4/uyGD/dfq51axd0vQ1krYy5XVKjW
         4QAmNmd3tpCIO0srwSNsBGLNe8Y0sIyvr6aKntpil5HCel8XMUrvW32gseXRjCDCY80p
         yFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698393845; x=1698998645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=boXAGtuda+Qb9m4tektze7XbzOBCPPY4QNhYroPvhtw=;
        b=DRfau1L181Nbpua+WnPj5CdAUEBbxPcfDiSjHlnhs/7RF2cUzygOs6GlL0/ORQdc2l
         GlonNvR9ZmBXlhTUBnBxwE0gLD2fK8+tOCPwgz5Sdd8JYH77KrPqO7Y8J/brx0LDlS+m
         FH2wYH5iq0tP6vJGPO7oViaG4IgDHJIVUe5eSuxHRx7RN5x5Jm0MVCn3cq0WfPBndJ+0
         XgFZi7RakWBE+Zd24/N1M6be6R44RIsoEcXciB2IXEluXI0CbySY4apgcZWAsvXMUYXt
         7xHx/hgL7jzMHqo738rvfUg+d9hyLWgH9nRhFJDJOf8askS/KMO+SUtJcBPGEsl56HKa
         y8oA==
X-Gm-Message-State: AOJu0YzNKFSD6Kb86iGxOhpBjO5+LYJDoZH9Lwf31TomlHKxqVpD5poj
	cn3gixA00jBHd6cHFFkYq+Grag==
X-Google-Smtp-Source: AGHT+IH55gRvNIIGzxY2wtfBzfKIjKSV3fYf5Htk7gWA3H0RGtGe6nmb/WOdKqFqMmC7RaRaxT+LWQ==
X-Received: by 2002:a05:600c:a44:b0:3fc:dd9:91fd with SMTP id c4-20020a05600c0a4400b003fc0dd991fdmr1629085wmq.40.1698393845086;
        Fri, 27 Oct 2023 01:04:05 -0700 (PDT)
Received: from vingu-book.. ([2a01:e0a:f:6020:c5e:e24e:ad0b:58c6])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c025100b004083729fc14sm4397488wmj.20.2023.10.27.01.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 01:04:04 -0700 (PDT)
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
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linuxfoundation.org
Cc: conor.dooley@microchip.com,
	suagrfillet@gmail.com,
	ajones@ventanamicro.com,
	lftan@kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v4 0/7] consolidate and cleanup CPU capacity
Date: Fri, 27 Oct 2023 10:03:53 +0200
Message-Id: <20231027080400.56703-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_010406_835149_72D7813C 
X-CRM114-Status: GOOD (  15.71  )
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
  topology: add a new arch_scale_freq_reference
  cpufreq: use the fixed and coherent frequency for scaling capacity
  cpufreq/schedutil: use a fixed reference frequency
  energy_model: use a fixed reference frequency
  cpufreq/cppc: move and rename cppc_cpufreq_{perf_to_khz|khz_to_perf}
  cpufreq/cppc: set the frequency used for computing the capacity
  arm64/amu: use capacity_ref_freq to set AMU ratio

 arch/arm/include/asm/topology.h   |   1 +
 arch/arm64/include/asm/topology.h |   1 +
 arch/arm64/kernel/topology.c      |  26 +++---
 arch/riscv/include/asm/topology.h |   1 +
 drivers/acpi/cppc_acpi.c          |  93 +++++++++++++++++++++
 drivers/base/arch_topology.c      |  55 ++++++++----
 drivers/cpufreq/cppc_cpufreq.c    | 134 ++++--------------------------
 drivers/cpufreq/cpufreq.c         |   4 +-
 include/acpi/cppc_acpi.h          |   2 +
 include/linux/arch_topology.h     |   8 ++
 include/linux/cpufreq.h           |   9 ++
 include/linux/energy_model.h      |  14 +++-
 kernel/sched/cpufreq_schedutil.c  |  26 +++++-
 13 files changed, 221 insertions(+), 153 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
