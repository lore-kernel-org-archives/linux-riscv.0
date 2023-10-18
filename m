Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EEFC41513
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 16:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g0S151P+sXazam/aWfZQGkbR+LxohiissehSQW69xrA=; b=zpnFr+0i1lGcCd
	GKXFv50KpwDXqFxso0SQoqv5RqL6NNKnFA1x9F8gZ/c5pd83jRTGc8nSistyp3CxJPQ2tRftFrlpZ
	+1WY5StVdxDqwlR/uqqaghTgsDPBRuizkvg993+qUBhiJnpilb23w5rkPyYKkSTD+JLEByzQqAmFm
	T+V8XyFdCUL5XfuwxLTGQVIf44Rlu8rJ1fc/wE6e6QjqmdgQpJpScpBDtVUuzsRmVdQegyfXU/dxi
	sa17wZ3V5/lQ6jzwt87VPJk4jASde6HrWv/h4+njKM8obCVnrr8An8UnE3ngFTyY4oR/0EA/bA7TT
	/YfTnI1eILCOD0VrJI0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt9Mn-00FB33-31;
	Wed, 18 Oct 2023 16:25:53 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt9Mk-00FAzL-0d
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 16:25:51 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c4fe37f166so87024091fa.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 09:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697646345; x=1698251145; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aBPvPoGvatc00L33SJsgf3xSxpMurf+haw6UVXLiWPI=;
        b=heAyzKCs9Ctamc4noHBXBxwdjVkdSGtxXUra4rtbpoIYRi5pA85B4Mvc0kYCrwsWwh
         6EssMpceHu4sUvFm0AO+2podbUOnHSkHD5WK87ts7vYf07qSUlkUg28kCZ/wnd3/kRfn
         pcNqaDSjAU1qupo3ZUmO+VXSgCWIUogKazDQ8iL85vywZA5OKqyAnm3ZauVOJn7iyscS
         5AB0s8yoJZBrfsIhhPGiXw7ekNa8odS3EKOnaiVLtJ8kAvp6la1m4Qu9AQ83Nv+UqX50
         /Pzm+aQEngY4kjTM1O4q6mjmqu9I+I+NFJKFNM9PDpfU1mL9v253QPLIdYQixEOqSvOo
         f5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697646345; x=1698251145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aBPvPoGvatc00L33SJsgf3xSxpMurf+haw6UVXLiWPI=;
        b=Fv4zZ6hbdf/6z6wWeXGh0IA5iwu34pJqehtECs5ITTpm4rl2qQDXGaXrksrjK+tCzj
         FnTB2e/MvSqMyf6ZqPQEkKbobg0L3ujv4EQrFmOGcb39LIHoqC1rd+ezbde82CtR4C30
         mA222uK5PhohIDvhmRkgdsfhG6pYZiL8OpQd7VvteRYpVP1Jo3vJe1kNNTbcHeT2C5lu
         7dDRJM80tUpO0yz2NlgiNkidSG/YWLHA+Gpw+jd1TMAi1MzUJi4xCClZr6aFbeR85bLw
         90qL/gvq2PJcRg2VOOmlP3KG6OEIrGsArX+bwfdebcloSuI2d7lwPDKRW3ifzG0q29zK
         ucpg==
X-Gm-Message-State: AOJu0YxT8em8SPWNPvtojSj1a2kT1M/Nl5AKTSDBLl91sK4RaNpdZwKN
	aY5By/LvLX5FSDtiBlyhSf+ZLw==
X-Google-Smtp-Source: AGHT+IGH+vBGDOxCQ/foE4RgwBOMrvwQGARWZwd5FKiVeXsCBR4rYrmOd1rONRCEvyTJKlIqnP29Cg==
X-Received: by 2002:a2e:800f:0:b0:2c0:a99:68e7 with SMTP id j15-20020a2e800f000000b002c00a9968e7mr4322747ljg.19.1697646344796;
        Wed, 18 Oct 2023 09:25:44 -0700 (PDT)
Received: from vingu-book.. ([2a01:e0a:f:6020:fcf4:9d83:8d0d:39aa])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600c2e4c00b0040648217f4fsm2033503wmf.39.2023.10.18.09.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 09:25:44 -0700 (PDT)
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
Subject: [PATCH v3 0/6] consolidate and cleanup CPU capacity
Date: Wed, 18 Oct 2023 18:25:34 +0200
Message-Id: <20231018162540.667646-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_092550_232877_12883D7E 
X-CRM114-Status: GOOD (  16.05  )
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

Vincent Guittot (6):
  topology: add a new arch_scale_freq_reference
  cpufreq: use the fixed and coherent frequency for scaling capacity
  cpufreq/schedutil: use a fixed reference frequency
  energy_model: use a fixed reference frequency
  cpufreq/cppc: set the frequency used for computing the capacity
  arm64/amu: use capacity_ref_freq to set AMU ratio

 arch/arm/include/asm/topology.h   |   1 +
 arch/arm64/include/asm/topology.h |   1 +
 arch/arm64/kernel/topology.c      |  18 ++--
 arch/riscv/include/asm/topology.h |   1 +
 drivers/acpi/cppc_acpi.c          |  93 ++++++++++++++++++++
 drivers/base/arch_topology.c      |  56 ++++++++----
 drivers/cpufreq/cppc_cpufreq.c    | 141 +++++-------------------------
 drivers/cpufreq/cpufreq.c         |   4 +-
 include/acpi/cppc_acpi.h          |   2 +
 include/linux/arch_topology.h     |   8 ++
 include/linux/cpufreq.h           |   9 ++
 include/linux/energy_model.h      |  14 ++-
 kernel/sched/cpufreq_schedutil.c  |  26 +++++-
 13 files changed, 225 insertions(+), 149 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
