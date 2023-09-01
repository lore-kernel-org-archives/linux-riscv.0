Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DEACA0FE8
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 13:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QAjqD9fug5ohRgq65YbbgmhGdBtrEX5iHcq0ucBTI0g=; b=Dqa03wXXxHb2dY
	MmXwS/JK03owkqFo5CGOOW/29sM+swZ1wXU4TD0RzCM3kcokrL4SUcUfJEatjIuVdOI9hMUpXs1Lu
	4BtnijHUt+35+RUg885BSN3JK3kKFFY2A1t33RmMdDM2fLdlwjOn6pdAUdcO0oxxWWM0aFrf+XdXh
	nOc5YIumL8ke812ZTug8e+h/2KD8JEiFd4Vx1uLJFdwqruPktY+bo7lZ6Bow2f7GzZfq5tCBpG67d
	ejFQlw9Q7PCAi4Mf8Xw2/yA8j4GSHWORkyOmUrCr9Ufn7edgyrlvWQCoExhZM72xsc43J48v4uEny
	t2vCSUy1Ohbq+yypaWhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc3o3-00HXHq-0H;
	Fri, 01 Sep 2023 13:03:23 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc3nz-00HXFe-3A
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 13:03:21 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40078c4855fso18880395e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 06:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693573396; x=1694178196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=75a9HyrrjsY749mq1nl+lxvfuPogake/gzHsJRTckdM=;
        b=CxSccmYM/O+PNPOKPL0WO7PCJImCF2OTxgUB9xSPNqPW1PNMgylgDBZNQ0ZObtYwiA
         gbeklBXuHSxK0qHaqMKX6h6ucTHvmcsaCsFH6mdhkXAqd3uHCcul4fH24+2jx2MCcHat
         w4VH+DAwCFwvneXcCrkGQxSpRzSvVN2ZtEnmkpYHdq3cJF5DX6dQshcVkPq6cwLo2hxg
         3ul1ZbKPLxCXK4AZ7K4Em/qgLZRdLRLn7EZ2uQ/TMjCcXZVqkPselrD+saoKvGrMKGaT
         n8N3AkVy+5zRgh92PuUAR7CpXtCa6epJWu9ISylFyFYgUxLvKKu4+l2cnXG8/FrUYai7
         58xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693573396; x=1694178196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=75a9HyrrjsY749mq1nl+lxvfuPogake/gzHsJRTckdM=;
        b=HpLWXlHUABW4bstPSm7P3PIf57Xei+8DUBark/jhH9gQ7YTGkmlk15o3cGDK6Qpeil
         MPRzI9jYBDNYirmNAF4DA9sw2fguVqeAzWbl1qVh7oZXq1z+nqpef8BAHVduP7m4jmzM
         h9/hvRfZe2YLnU1XV5VNWj9nNv2ecbRL4IaXwMtIVQn7s3/JkXj5cRHHiZryJvyjpqOY
         Kar3rj/QTEYr6CNjQnV8bmOK2InLvKH162lcYfzBXKdsMLK7ubirOV+9/HiHy9KBXEZQ
         lEWn5VdSlSrEealR26gXJ1gKzPmZEa937poke8uGWZttiEFqbKT8yV2b1wtlX928qxDo
         qYtA==
X-Gm-Message-State: AOJu0YxtTHBdx9Z76RD53M9pKQyCW8EfEYPZt28UMfo47BkhyctXqgkC
	49kw7bril1bIKKjLFc5XfUOtcg==
X-Google-Smtp-Source: AGHT+IHxmfvngPUK7Awew8G7DdP5NSFVpNGfgrE/M5Ydxk/eDsyeJJCfJ1+9HSWbnzqkm8MYrfOrQQ==
X-Received: by 2002:a5d:500d:0:b0:31a:d90d:8d9f with SMTP id e13-20020a5d500d000000b0031ad90d8d9fmr2074597wrt.25.1693573395616;
        Fri, 01 Sep 2023 06:03:15 -0700 (PDT)
Received: from vingu-book.. ([2a01:e0a:f:6020:e9bd:add1:d9ac:7b3e])
        by smtp.gmail.com with ESMTPSA id i14-20020adfdece000000b003142e438e8csm5167452wrn.26.2023.09.01.06.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 06:03:15 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org
Cc: conor.dooley@microchip.com,
	suagrfillet@gmail.com,
	ajones@ventanamicro.com,
	lftan@kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 0/4] consolidate and cleanup CPU capacity
Date: Fri,  1 Sep 2023 15:03:08 +0200
Message-Id: <20230901130312.247719-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_060320_037626_47FC8EBE 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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

Vincent Guittot (4):
  sched: consolidate and cleanup access to CPU's max compute capacity
  topology: add a new arch_scale_freq_reference
  cpufreq/schedutil: use a fixed reference frequency
  energy_model: use a fixed reference frequency

 arch/arm/include/asm/topology.h   |  1 +
 arch/arm64/include/asm/topology.h |  1 +
 arch/riscv/include/asm/topology.h |  1 +
 drivers/base/arch_topology.c      |  9 +++------
 include/linux/arch_topology.h     |  7 +++++++
 include/linux/energy_model.h      | 20 +++++++++++++++++---
 kernel/sched/core.c               |  2 +-
 kernel/sched/cpudeadline.c        |  2 +-
 kernel/sched/cpufreq_schedutil.c  | 29 +++++++++++++++++++++++++++--
 kernel/sched/deadline.c           |  4 ++--
 kernel/sched/fair.c               | 18 ++++++++----------
 kernel/sched/rt.c                 |  2 +-
 kernel/sched/sched.h              |  6 ------
 kernel/sched/topology.c           |  7 +++++--
 14 files changed, 75 insertions(+), 34 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
