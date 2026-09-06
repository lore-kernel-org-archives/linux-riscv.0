Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F29C79F85
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Sep 2026 16:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QYrjIiZpUTS36EiNGhNcQCakOTfDz8qKRlKNutOeLRM=; b=NgjsPfpAv0j9gY
	67HUMfLhdbUyM9eBxGBJIGeaGQr1v7OvTCOBw8jQ0C5DVFii6rkzKbc7hUabI/n/TOnGpUMhHyJ+Z
	sbbx0AW1lpe8LtTTFeGNkIoh1HeNITmWfL4CPgWqzrf6HVHssANipvanrO2hiXvSHFYQaHAEaBKj1
	LV7RW1oNEl0JDJZ+HivOldW0SUitMbfVq8hoYB5uTSEfCNIWaFgUerukFBlx8fcykECufnJ2BBzQc
	bm7QkvQ9IQRXl7wHJuijkuMJ72XpE0wIeaEaPdnOHK6JfpspYGGQptdmmGJKcYg1A4lCADmP3HWLi
	hUtqJQtNvDUdaI9kiQGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3FsN-00000005BuM-0tIv;
	Sun, 06 Sep 2026 16:37:51 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3FsJ-00000005BtJ-3tNm
	for linux-riscv@lists.infradead.org;
	Sun, 06 Sep 2026 16:37:49 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so37435645e9.3
        for <linux-riscv@lists.infradead.org>; Sun, 06 Sep 2026 09:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788712665; x=1789317465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ivyLPO2HZhtqk7cqP+57Dc0UEnfX7FjCnb9LTUCpQ7M=;
        b=evmST7NDdu9Irbom+cLS085LQXXEoGfidsxeLyEI4dYGhXWEXXqKHyLO5ROhkGnoU7
         lBg0HGVOG6lSMXZpOqkGUXr/1DElhovGUZtu4fFw2xMZDOPv6yzr4mkVX9EED9M9XBEl
         IHY0gnCaZmpX2OB+jqrnk3ozWYf861KJUOobmxG7IO9iSnf43TPCXImSSV1ZlHKkjgZA
         i6Be/duV2jf38Bm+L3gn6D7UgneMJEWLiZmay48t5YsazIZUe2kR1QMLh1CbBFg3rKw+
         v+yGGcccbna7HIsgoUF4z0NiZnrNelD5bnFAVYDQj2IPUncjNZmzGhBM05q6UITpYUWh
         PD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788712665; x=1789317465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ivyLPO2HZhtqk7cqP+57Dc0UEnfX7FjCnb9LTUCpQ7M=;
        b=dcfkBxsykn6cg+D/wq4vq/CQN8apFqYDMbffe9wHycKwciM78+RWtKMSkYcbzcX4kN
         0o6IBgeaZPRjFQI2BwRjSJsPrq2wemtRDfCsx5oZLHm70DUnbYK70VFCfeshJoKUV3DZ
         Q87j6/E5TR/pod1TTY+nlZJQATNMpGm5WuA3ihtbRqs7e4KDRVLdjx42MjBi6Qg/i+lQ
         bD8SVvQc5qq0llvWEZU9TJ5cytcMvwjyBnlDWz1nSBqIDisGSDUD6arsoT0lUcm97ogh
         w0sSmUSiuL84FzXjnWq0CUgyxc5E45o4JNNMJspPGXUqSmCDb56Q5U82oCROe/vJrXuX
         lQZg==
X-Forwarded-Encrypted: i=1; AKwUvBxZJ6hn8680qxyb0tQ+Wfgr9RNJGrl5sYdu3vRzb5iuyWwsUnhl6QgOJQ+HjnmSmV4PAyAyDy6wcYNzPw==@lists.infradead.org
X-Gm-Message-State: AFuF++kcby0C0UzYImZTUhANTsYO+bo2PzVb+LPEZOONHaBJj20JyrJt
	he784LbBWBByC+uT6T/716L9luTNq4G+G5m4uXyOGzoi7NohWMnKokiP
X-Gm-Gg: AYBFou0k5QqmFw9Bgp2Hi2/O86hJMqLR+tPqILHf/mJVKl70wvDf6HzO9FcBu4Z6OPI
	HxcB1Tj/PkvG/3XNGUzOhd74UN1jLSWVXg32HY4CL08UE4qsQziMQKruipXRQXYBV2QRJgyQol6
	vhGYpFZUOhi1SR1b3U7w2uUPsTJBgXeVxxNgslf5h89SPCB77MoKd+YmPn4FKKrMzMVE8oI7OUS
	/yQeFr3ec+Y3LJ94jJMRIDZaN6/vN/mwmQDROTSuxsmB/WFYY/RpiJa+nFtl5EtUDckmcXHAVsf
	yVxS6t+erc1YCU/AcEF9G+93qbfUGhwmcEmtK5N0E0Je6afsKJJW4glPkN9Ird1ZsFS0rNPLafT
	ZRgHLyyfboM79bSqUmXmQ5ZcVHOBYFPnq+otuaEGaZ4NhjFjLdTiJ4cmeL15jaUjwsx/xIcTSm2
	7j9Z8EXbioC0zVYAWmLB4e129XQaoL5mz2iRfM/MycFhs5vUiIOFSgSEGqJKnC7J5Pv6NFqERiP
	1sE2K82tpPqBbWOQ5DzSedMwss=
X-Received: by 2002:a05:600c:4e8f:b0:49d:4ef:bf70 with SMTP id 5b1f17b1804b1-49d04efc043mr96329235e9.10.1788712664882;
        Sun, 06 Sep 2026 09:37:44 -0700 (PDT)
Received: from localhost.localdomain (mob-5-93-26-136.net.vodafone.it. [5.93.26.136])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm20907997f8f.36.2026.09.06.09.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 09:37:44 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
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
	linux-pm@vger.kernel.org
Subject: [PATCH v1 0/2] arm64/cpufreq: report and track frequencies above 4.19 GHz
Date: Sun,  6 Sep 2026 18:37:13 +0200
Message-ID: <cover.1788712186.git.okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_093747_984510_F60CA0EE 
X-CRM114-Status: GOOD (  13.15  )
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

Oleg Keri (2):
  arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
  cpufreq: update capacity_freq_ref when the boost state changes

 arch/arm/include/asm/topology.h   |  1 +
 arch/arm64/include/asm/topology.h |  1 +
 arch/arm64/kernel/topology.c      |  5 +++--
 arch/riscv/include/asm/topology.h |  1 +
 drivers/base/arch_topology.c      | 19 +++++++++++++------
 drivers/cpufreq/cpufreq.c         |  2 ++
 include/linux/arch_topology.h     |  1 +
 include/linux/cpufreq.h           |  7 +++++++
 8 files changed, 29 insertions(+), 8 deletions(-)

base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
