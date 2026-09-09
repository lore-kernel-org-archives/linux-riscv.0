Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5AEC79FB7
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 19:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bj633sAO+1ZE0vJ46HuXsimLKedvqbi5eeitm9+DgPw=; b=exF29jwVhJd0TA
	pXYRdGC+WGl7yB2TMBYY6P2I23kHXnoLTySCz2BjMoPBRGfkZLpIC1tjLxNyujhkLInRRzJuFJfre
	bizJ//Fz/FoFCPkQDF2NNdT/sJSBuzC34CTmVF1tA9B2dgBMrjiJcwKX+x3Q2vScMeGqUkvroAxg2
	KZal95DOgulIXAmZnEibEzz9SVjXk3OZFdxTMli0/+YRzzCjBXic8TNOQ/DLhqq3u8CrbtX84/xFQ
	9zMAoG6WZhI0/SGn3bxFlKx0J1BgMbZKT72KgQktQPYi+J2Fz8U2zmI8ooefLarJkk7kQqhvl583Y
	T36Tj84VmGOXIyahHFBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ntz-0000000ChNR-0g6X;
	Wed, 09 Sep 2026 19:24:11 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ntv-0000000ChMc-2rEz
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 19:24:09 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso59534015e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 12:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788981845; x=1789586645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=juSntAU8rs/3fLNwoSR5HtlpUx6UI0vk4BclFthIHvc=;
        b=IbiVZL5Luy3ysD3myRqKaUojh9SESlM1Wf1x8ndBea6MzHAp0nBSkN9gzhhrB48pW2
         wBrFvsOYsmOCYQKZ95RUvHidRl1IspSUefP03OTytETullU4E5XcVGfziVsyB0+UoDtq
         rMamfC9x+j3dXZuWOGudE+Yg8nRbOPcZqMw2d6g02O3soURbTt2H7KzMBXiN1hA1JXQd
         TaDL0VbD9qXQLV5WhagKQsEEmWxxnA3A5Gd2f2VRHJXAX6Hl7QVJZvoL7fyt/8LVV+Cy
         clbSsf7NJKIoRbOMp5dAJO6wAyUoYJ9sKgZnqA1wHDsh0ou+Cf5wL3baIbmE4Zz11T/w
         fBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788981845; x=1789586645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=juSntAU8rs/3fLNwoSR5HtlpUx6UI0vk4BclFthIHvc=;
        b=R23aZYnHS1n119Zr31bJNLU0Do3Xpx5eyKJ8qVeoUbI4CB7SnJMTvggj++2/mybCwN
         UN/vPXE2S1eiA9+GLDDHa8mTc7BEqeg/Lue7byGzPBW9PY6N1qY///7TX50ZvZP4tT44
         BVUAJigz9OfiIPZtPKG6mHDRW9hMhqS8XH5Z12LsFcSk84g0TC1J9xZONuSKm4zyIX6O
         lHO8lm8Lo8CnnfrtboG4gRKgbc/+AzDjOxEwYcpng2uQAX9RHLH+E81cgzhZy4EhrbfB
         /pCsaSA80U2npXlj9Ct+MMXNw40vggyBj+K40FYN5ywKL+iRCAXg42yNuLHB/AUFwzjK
         OhOw==
X-Forwarded-Encrypted: i=1; AKwUvBwuALH+9fUi4q0kSeoo6pBGcoDNpMvZM3DrP7hZv8LnizXDhLCgwhCoPNTkZJ6VpmLJP33dG+PfmtBwvg==@lists.infradead.org
X-Gm-Message-State: AFuF++l/Yu7gR+WCZb4WFPzJLQiY83c0eAfWeR+MTVoEcKhJTbMW9xEG
	ZnR31MkXQeLTa/D7mUlfJUJ1UG38ryzvFbKKoveeCDmg26kCxpSvlilG
X-Gm-Gg: AYBFou3T7svb5dHaAAP2wuTe3zUqhFn4KqNf5pxicTVU9RWpiULS8+G/FjSeC9RswCH
	1zAhJ3GrrBNwbPzKaRSpt+FzFzLflEZYOiLtYZJ1Qx5nZ1LUAS+gucMbT0RiG6zrEHmchcBVllP
	D/uMiMa4NJot+5bn/tiLua1r9vWMN3KSIINm8m6n8voXHXI90ZATSHUUSeOKZLpbhG4F7+gwaR+
	m7EjyvVEsvRVKkziu37IHfjJQiRwAnmkmDR3N292Wb6ecIp6zTjfPnyRvZJqe1t6jYjY4UGe4JB
	dEdEZmnQVTzUqMotI/+kVhNw9NN2SF+jOWNeF97teUq+XTQPWS4wsEdQJ5ibnEtMk20/EniAt/Z
	fzjDJGkBaTlsh7uz2BxuWyMEGOiL9u45e3rNbMJX134Cz5y9E57v67+T9a2c447jqo0+TfxVF7N
	TzqKS2tE/rZsa6GLiqpIUB+ya3RU3ggnCIMyDdlMGWMg2hGnnizpkfJlNGHiV+0RON2MKAn76tl
	cQoEEDI8IpaI9P23ACrnkedTPrTR+9gdDqExM8i8Pk=
X-Received: by 2002:a05:600c:3b18:b0:49c:fa21:1c8a with SMTP id 5b1f17b1804b1-49cfa211d97mr316363405e9.31.1788981845342;
        Wed, 09 Sep 2026 12:24:05 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d26bf9490sm10925625e9.9.2026.09.09.12.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:24:03 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64/cpufreq: report and track frequencies above 4.19 GHz
Date: Wed,  9 Sep 2026 21:23:49 +0200
Message-ID: <20260909192351.33910-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_122407_739710_9F54BFA0 
X-CRM114-Status: GOOD (  15.83  )
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

The Snapdragon X2 Elite (Glymur) is the first arm64 laptop part I have
seen whose boost OPP, 4723200 kHz, sits above 4194304 kHz.  Two
independent problems become visible there, both of which make the
kernel believe a boosted CPU is running slower than it is.

Patch 1 fixes an overflow in arch_freq_get_on_cpu(): the u64 product of
the frequency scale and the reference frequency is truncated to
unsigned int before being shifted back down, which wraps for any
reference frequency above 2^32 / SCHED_CAPACITY_SCALE = 4194304 kHz.

Patch 2 makes capacity_freq_ref follow the boost state.  It is latched
once on CPUFREQ_CREATE_POLICY, and boost frequencies are excluded from
policy->cpuinfo.max_freq while boost is off, so on a machine that boots
with boost disabled it keeps the sustained maximum forever.  On arm64
that saturates the AMU frequency scale at SCHED_CAPACITY_SCALE, so the
scheduler cannot distinguish a boosted CPU from one at the sustained
maximum, and arch_freq_get_on_cpu() cannot report above it.

The order matters: patch 2 is what raises capacity_freq_ref past
4194304 kHz on this machine, so patch 1 has to land with or before it.

Measured on a Lenovo Yoga Slim 7x Gen 11 (Glymur, 4032000 kHz
sustained, 4723200 kHz boost), pinning a policy to a single OPP and
timing a fixed workload on one of its CPUs:

  requested OPP    time     cpuinfo_avg_freq
  ---------------------------------------------------------
  4032000 kHz      2.011s   4031325   (0.02% low)
  4723200 kHz      1.726s    524283   before
  4723200 kHz      1.726s   4032000   with patch 1 only
  4723200 kHz      1.726s   4718587   with both  (0.10% low)

The timings never change: 2.011 / 1.726 = 1.165 against a frequency
ratio of 4723200 / 4032000 = 1.171, so the hardware was running at the
requested frequency throughout.  Only the kernel's view of it was wrong.

Note that cpuinfo_cur_freq still reports 4032000 kHz at the boost OPP
on this machine.  That is a separate path -- scmi_dvfs_freq_get()
asking firmware for the current performance level -- with no clamp in
the kernel, and it is not addressed here.

Changes in v2:
- Patch 1: fold the multiply and the shift into a single expression, as
  suggested, instead of reusing the u64 scale variable as scratch.  Same
  semantics - the multiply and the shift both stay in u64 and only the
  final value is narrowed to the unsigned int - but it reads better.
  Suggested-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
- Patch 2: unchanged.
- Link to v1: https://lore.kernel.org/all/cover.1788712186.git.okerixx@gmail.com/


Oleg Keri (2):
  arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
  cpufreq: update capacity_freq_ref when the boost state changes

 arch/arm/include/asm/topology.h   |  1 +
 arch/arm64/include/asm/topology.h |  1 +
 arch/arm64/kernel/topology.c      |  3 +--
 arch/riscv/include/asm/topology.h |  1 +
 drivers/base/arch_topology.c      | 19 +++++++++++++------
 drivers/cpufreq/cpufreq.c         |  2 ++
 include/linux/arch_topology.h     |  1 +
 include/linux/cpufreq.h           |  7 +++++++
 8 files changed, 27 insertions(+), 8 deletions(-)

-- 
2.55.0


base-commit: df2908090cda368b01ff43709f51890076c56157

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
