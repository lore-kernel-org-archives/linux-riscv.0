Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E62E95A91
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 11:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=voWlsOJwku2nM+TvH8wlfDMzpq9pXth+SPp5zXHrVSs=; b=yppOdL/kr3NFLo
	b5ETb2kRkWv7H4v4Y+CDCvBTDAOiaeMK1uxUryXcEb3YeHrk4Rh/oXSWizqtn2YL+lVqjqVgDFXvv
	cJwVZCxIBpiDCV6E/qKZ7KElvXiO6FepDs+piTs7kB4r6LHBDT0KnFYQOlLF0MDLGDjYkTcByqtQu
	SdkYg7D2V7WbkEwQ90J4xst/gYfU+A7V6dZNC1ZqYe01BtKPVKf9kp8K2IKa+TB9kdJYDkZDGB99D
	akgLAJO3MUOF0yaYwiS6fqQmjFUSzNSa2ENI/37qPGTOeMrxrh+tZDCfJdl8R/x3hQ+QPbqLxfeqZ
	9uKVzpEUm2/mFoNRCzNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpohL-00AV97-1c;
	Mon, 09 Oct 2023 11:45:19 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpncj-00AFNc-3B
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 10:36:32 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-317c3ac7339so3962992f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 03:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696847785; x=1697452585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mzXAWoLrB1CkCF7mnZtizIq1zJhQkfdilgU0TBelMuw=;
        b=X1TFWevubdtBSA6t6J91ZzYKCEuzfgX2FJzilpcnh1h7UjG76L4tNIuvNcABxgnaPw
         50A3pGugevf4FQOweUv9+WjkxZ3vMqaa116V4OiEEQSnqN/GI7aX9r/UY0h/9jggFTZl
         lo6daWxhC808eYJU4hHfvglKZYgJa0zN8fADAqH8sdLodTybWFKInIb5oT6h2rmcqDab
         FK25kcC8Nv6bLIBAPd0nYbYCOjTg/Fig9mgtvfOwuvrmSdpnB1USKBrRvgmRBdN0+M0x
         fJmd7480dQ6QEt1dFqegBcJfb6rLvniMlEDgBEnM1M65Ut4woXSBIZX0dEqRhET2kOJS
         zaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696847785; x=1697452585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzXAWoLrB1CkCF7mnZtizIq1zJhQkfdilgU0TBelMuw=;
        b=WppcbefS2uGaw8dQBU5iwEASVastsUIQVm30ARqT39nRDs1AqRyTqZukOtX0lHhFH0
         8c4cZcH28Os5Oq0tB2NRwo4B+Edjkq/6tdsP2CTLtKFdw1Tmaq50kXLQelBGrDe0IEUf
         MNAMzz4M9fibv2S2i52BnSIH80o3s7CV4vAdy29ChUHvmzHr1landMeHqheqnZqwMzNS
         j0ubM+fSf/KlNItOWrcUuWK7BL/NtDzZ41GCcLs/iWtBvYxIEGCi45kZriXoQ4HlqXv8
         AktVngD87fzqayM4U7msWyl2Mwx46pJzc5CZk08ZshOQ9nRbvtENfYtuG3d4ylkC5hBy
         hE4A==
X-Gm-Message-State: AOJu0YwLA1MmRQvRfb02QZA+p/W93olGSAJkKN9ld26AoGxugq1HaTWn
	5EEVa+FtVuDTJEM9zd+e4k+SLA==
X-Google-Smtp-Source: AGHT+IEt52pH56UVIExYbvyXxteaZw3b7eTLevs8DuSQX1Vs9f8YnvubABJjGN5j4jCclR3s+K07Pw==
X-Received: by 2002:adf:e689:0:b0:319:8bb3:ab83 with SMTP id r9-20020adfe689000000b003198bb3ab83mr12316323wrm.66.1696847785473;
        Mon, 09 Oct 2023 03:36:25 -0700 (PDT)
Received: from vingu-book.. ([2a01:e0a:f:6020:53f1:24bc:5e47:821d])
        by smtp.gmail.com with ESMTPSA id f16-20020adfdb50000000b0031ff89af0e4sm9226722wrj.99.2023.10.09.03.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 03:36:24 -0700 (PDT)
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
Subject: [PATCH v2 0/6] consolidate and cleanup CPU capacity
Date: Mon,  9 Oct 2023 12:36:15 +0200
Message-Id: <20231009103621.374412-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_033630_026180_CDF0AB00 
X-CRM114-Status: GOOD (  14.27  )
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

Vincent Guittot (6):
  sched: consolidate and cleanup access to CPU's max compute capacity
  topology: add a new arch_scale_freq_reference
  cpufreq: use the fixed and coherent frequency for scaling capacity
  cpufreq/schedutil: use a fixed reference frequency
  energy_model: use a fixed reference frequency
  cpufreq/cppc: set the frequency used for capacity computation

 Documentation/scheduler/sched-capacity.rst | 13 +++++-----
 arch/arm/include/asm/topology.h            |  1 +
 arch/arm64/include/asm/topology.h          |  1 +
 arch/riscv/include/asm/topology.h          |  1 +
 drivers/base/arch_topology.c               | 29 +++++++++++-----------
 drivers/cpufreq/cppc_cpufreq.c             | 18 ++++++++++++++
 drivers/cpufreq/cpufreq.c                  |  4 +--
 include/linux/arch_topology.h              |  7 ++++++
 include/linux/cpufreq.h                    |  9 +++++++
 include/linux/energy_model.h               | 14 ++++++++---
 kernel/sched/core.c                        |  2 +-
 kernel/sched/cpudeadline.c                 |  2 +-
 kernel/sched/cpufreq_schedutil.c           | 26 +++++++++++++++++--
 kernel/sched/deadline.c                    |  4 +--
 kernel/sched/fair.c                        | 18 ++++++--------
 kernel/sched/rt.c                          |  2 +-
 kernel/sched/sched.h                       |  6 -----
 kernel/sched/topology.c                    |  7 ++++--
 18 files changed, 113 insertions(+), 51 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
