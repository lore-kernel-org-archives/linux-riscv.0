Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A97C79FB7
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 06:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T7A2Tziqot4ASGTHQ0NmxLMXpTpBmu/e6acohDwrwt0=; b=nrtbSqdlg8lSJC
	6RNrA2K9fNtGLk8ODrzuwpO5ZmuUlaLTrzTO9x24mY1OyJ+Zw4YpXd4wiRuM1v85YYvnfJJ1S2DQm
	B1ony/VZjUjEf/xxdcZ3rwIJyjSZeeYD4QH3pI5z50BADqlIz0EBJX5OnsZXoKztiXWbwMsAc2r1Y
	geLrLytjYUky+OwuYLMUBjf3ONcsZXwXrSGZNSMsriV7V4SvOYnUVFHYPak+BMD9I60ENBpcCvueT
	+GrP/wOKfJglt8zl+w31jVyjTcOAZazrkM61AlclZXN/HvTNDwk2AQM7cCto/aIJeaNC+2prSlnll
	8PsleJBU/+ghJQHYWyCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YN9-0000000DWjg-22nO;
	Thu, 10 Sep 2026 06:34:59 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YN7-0000000DWi2-1DT1
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 06:34:58 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso54723165e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 23:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022095; x=1789626895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D92+v0nqxMJ3pOaah+t0R5RhuqJf5mej5Aw3sSQ7mCo=;
        b=NNuIRGLw/U+K3xqszManvj1gLPFfaf06FZR1N5YN/obBj//lLBgIEWhWsSq871czyz
         KcFFfcXMZ0UnurWlTw6BVDElk8fA9ceY1te7dzBVlGaZ6wfe+zPBgRzZbzpIxrykzT1U
         353+19nrAkopxMbnzSb9Y8Doy7maJliC2HCEy9oz0KDeg/ZXc4oNjvEGSejSo3rlkrhx
         IR/jmeeD12iDa4Gu9RKAdt2fi1M93ICd0cYkHvUKCel/basQMxymrBeM/uR1LkBbFHps
         wEkFhqeyQjvC2Rd1F6KvVzWW/+c7i4YiA5lPdv1EXG/SDEdzvdy/fZZrTRqdJAx8+Xtl
         f6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022095; x=1789626895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D92+v0nqxMJ3pOaah+t0R5RhuqJf5mej5Aw3sSQ7mCo=;
        b=rjBoYNvGz7AltB61KwFSLzuR7sSEMu21psViOuv13TpnsJtd234pdz2yAZJ+5jTvmd
         00U0gV2A+g0R8kdcJLOIzNUv8jLJZWaYI+aLabooryqCEuVUOMJtdwh/VlFBcIyghZ7o
         3BOyg+1jxMWPpbuZI8HBp2Z0XMH88c5GuOZ3UF4eyBlGsU2VqjQAIymXYNCNMnNxU/ed
         XSQhjtKcEAXtywEQWe2hlRWm8Y8X7QrdaxHJuysSj7xu9LZDFRE+2Ji3CfH+mItL3CY/
         sfJGFGTpv590raDufQGUsDbuK2jwM/e7IbcKrngqxJemcxTfnlOItRTWH9L3xLsz27gX
         LZqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTcXExte60RoTqAmRXwMn3syT5cZXWJ7kyCRaRP7X5q7Sg1lWi51QYvQ1h6H8qKfDVy+t4L2P3vd4AsQ==@lists.infradead.org
X-Gm-Message-State: AFuF++k8g+bUYn8Z3wnHVEvgKCInQ0/Bzcl2eotj4ini22slwk0NxW0r
	3eO1M4kAOoZOqkNmnt9GREAstx5/y3xjFpIx9J9vNrdvS47jG9W6J1fO
X-Gm-Gg: AYBFou1PXDFSjJfD7tj5hB6+j8RRbL8PxWLy2qa90XFdpSixAyXbR3CovlZmEm+Y1Zv
	f9GiXEoKMf7owm3Wzy+5GU8bXjBvBaNhb3UlGb9JTcs525vKtsoil3mQ1tKsvIT0MgSf9oFBsDf
	imkTKqA2ooIQecd55G5QipWGP5y8tEZRTXKgP3ujpxQDPzWvUx4lCsGXkkypCkREsi6+YRIkJXL
	/bBtxJ2m8t3Gcdh8ggJWFHI58lNED8hz8/s/uLnJMRBEo+Ii044tcOSGpFXOKsUlkoNYiA/uLHu
	RMpA1d7xwFx5LSpmIPnQGe4qJ0lxT0IGLoDik63jWrctYbYhVShqIQBmq+UB26/oTF0aO03mHcR
	H83KbXBRcFOpKUbks8clQPgQBPsc/ycG3EJrJdm4oxRDSOv6TJcr0KFN3ygw3iBQN7Cl9AsVham
	OLf9ETGKClkC5OH4B1J6zEBwCdH0qglfQH3x/uM8l6uLEYdOlzGNtol/TDbrmJfWO4X3Dkp8w+b
	rp8L0oCAg4MZhDfv+/rewZgGwrKeGITzA9rCK2BP561ryOUNGJj8w==
X-Received: by 2002:a05:600c:46d1:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-49cf820c992mr407515105e9.6.1789022095224;
        Wed, 09 Sep 2026 23:34:55 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e2212193esm2595255e9.1.2026.09.09.23.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:34:54 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Beata Michalska <beata.michalska@arm.com>,
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
	jonathan.cameron@oss.qualcomm.com,
	sibi.sankar@oss.qualcomm.com
Subject: [PATCH v3 0/2] arm64/cpufreq: report and track frequencies above 4.19 GHz
Date: Thu, 10 Sep 2026 08:34:38 +0200
Message-ID: <20260910063440.4677-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_233457_363037_B1574A0E 
X-CRM114-Status: GOOD (  16.25  )
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

Changes in v3:
- Patch 1: drop the Suggested-by trailer.  It was not warranted for a
  review comment on the shape of an existing patch; my mistake.
- No code changes.
- Link to v2: https://lore.kernel.org/all/20260909192351.33910-1-okerixx@gmail.com/

Changes in v2:
- Patch 1: fold the multiply and the shift into a single expression, as
  suggested on v1, instead of reusing the u64 scale variable as scratch.
  Same semantics - the multiply and the shift both stay in u64 and only
  the final value is narrowed to the unsigned int - but it reads better.
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
