Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C4CC79FA0
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Sep 2026 16:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nT+hQQbHBGuwCMyo4OZipyxardse+La6RrYw7H/JC1s=; b=BuPlOkrzDWGIS6
	5U28Z12F8vIXPZS+jy4L2WKD/aBxSF+qbyRrWuRWHswZpHPXFgJ6w2TKzlZLOwO9Z74nuYdS8tFE/
	x5ofvozsmHBBmQGY6JBOevaI4yQJEryfKidyPGgSyJ5+P8yNUDtyd+9DskD1a1Ri9e+8wMi64vlkJ
	HJeEUI1LlUeBwa5SZDefKHYhu0M8zf6neRz1pb2vyOfLdcnZgfAubm+PzchxeElr73eH9vxlnnI86
	kLvtm72682s7TvSaVPEaJZzYmk5PTFiwipYFxSv6YYD4R/PfGXjsuK+enlea6P0PcVkwLJxJgcSyA
	oJ375MPpGA0WPGGPHUmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Fsa-00000005BzN-1wdz;
	Sun, 06 Sep 2026 16:38:04 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3FsY-00000005Bxy-42cZ
	for linux-riscv@lists.infradead.org;
	Sun, 06 Sep 2026 16:38:04 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-485850cbac3so1651277f8f.3
        for <linux-riscv@lists.infradead.org>; Sun, 06 Sep 2026 09:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788712681; x=1789317481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zr4ziqFVq8nKF64tCdjpGyyZ2ASlabQVBOQtlNWXNp8=;
        b=eMgtLhN+QDKZsFmPc+RHYUnhLSnS65LSfxjLGV95rIUuJKQXh2jtI0fBOjn5RtIfnl
         PTWV9z3nAunDeyVMUi4O7jILT6eYvEW0UWzIO1GQvFl/rjbFP31YBMw1zIz6wMgU2F4u
         3NtquHFd7bL0l1e7xEHMK5+A6Z+noFqhzkfPQbO/QdL7Cj7ksekBt5Crk8HmEiNVPTuB
         W418TUHShaMEYPlvMUZWCoeIleKuyKLEyWGl0mvrxIqxTvRZnnFP5lIjkk4sYMpVnqIQ
         bQf2OBAnimRmdp72hBKM4DeeudG/oIYBG91ut5xrpoF/Jpjck1fIUgeBLR9y5gwJiDc8
         Um9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788712681; x=1789317481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zr4ziqFVq8nKF64tCdjpGyyZ2ASlabQVBOQtlNWXNp8=;
        b=ImbnBQXM0wsoVYPTdXQMQVio7nwFVN7fqT0NeT211D1YHD88sCKC6unMwu+R1FNljh
         6CpGWrQ7pY4Z7lxkRYbKN3IgyfO93laYPOkZkv5xOzxjQMoSl3Yu124lnhUt5pBrhywf
         MgSCznKevenkEljAL4gByHi10ZKni8HiempBfuv9PMyaVIzZoyyUDwaRs5w6vlcB8k9W
         9Yw3fMwXxSVXsH4uPjJA/l4kGp05Sv9B2Qj7DUDncFTTijYT93doeIlpCPQPawPm9Acd
         /uewjCPkPJREsdiCvy1Hgklbo/cu2qhbnyoEh7vYWdL5G0JFmf/TJ0bKxcbQoNEslw6J
         FmHQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8xZrdiEMUNd4exy5etylotBNfpSfHzwRkMyCReKmKLHeUICcCwGmY2eyFtCWyuwbe3tA7qN/z8N+Jyw==@lists.infradead.org
X-Gm-Message-State: AFuF++kg7FDntphQOzf6rtZy2ZzPvtkbQ06rhxZvX7VU2cmmHoQ1txOL
	uwfXa+/Yaeyo8YEuSh3whQkgUw3V3woSGa204H0KoSPsRY2PnNqkWRuM
X-Gm-Gg: AYBFou0kWdS4mgCc4AWxVWXDfFT1srVJqHeF5aKdDPk38pspVHzkuQ4yUTd2hxSZoGJ
	jHQT0SUS7cuAO3JEROhY57wD03hpfbABL79flJbDx+NRlp+78YOZeDTh6CJXXF6DZ4FNHQdTU12
	0/wUKs2B1PoaL7LlYNzz2wkjZETRTsZUQJeLmLRqLm4t4+c112bmKe9NN5z4OnCN/5XnBj8AEWh
	/oC6+RaKXwfu5xSMpOrg0s7lD/WW2iWBVr7rR9+Z/SUJA56vnXkzs9/43xWbnBz+1viJFE3Dp02
	hb0wBu5ZHQRbo4xYFcOG8JO6U28aQyix3AvuBUy6tbGmK3ClPTt6XfdjxmdyYiBaWVe6SsXfoRU
	fl+HtoEM5D/rBvLFOLrEmoMETJXUkVcjFmGUlriQGKg6S5QXptZc57/PM2xOZp7L1GkBj79Y74b
	Nv7X+4pqz5rlMB9IqzbD6StLVc29YeLOca9C+PROj9B/k7WbhwIQx/9otHo0jWqHukQkMj82ixt
	NVULZrL+y4UwfJ5fBmrUPp2LWk=
X-Received: by 2002:a05:6000:27dc:b0:485:8eba:b5eb with SMTP id ffacd0b85a97d-4858ebab621mr8247866f8f.1.1788712681094;
        Sun, 06 Sep 2026 09:38:01 -0700 (PDT)
Received: from localhost.localdomain (mob-5-93-26-136.net.vodafone.it. [5.93.26.136])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm20907997f8f.36.2026.09.06.09.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 09:38:00 -0700 (PDT)
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
Subject: [PATCH v1 1/2] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Sun,  6 Sep 2026 18:37:14 +0200
Message-ID: <08ee55292c1cedf26067d1a2b02fa5657d9650e8.1788712186.git.okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788712186.git.okerixx@gmail.com>
References: <cover.1788712186.git.okerixx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_093803_021913_2E657099 
X-CRM114-Status: GOOD (  12.81  )
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

arch_freq_get_on_cpu() computes the product of the frequency scale and
the reference frequency as a u64, but assigns it to an unsigned int
before shifting it back down:

	freq = scale * arch_scale_freq_ref(cpu);
	freq >>= SCHED_CAPACITY_SHIFT;

The product is truncated to 32 bits before the shift, so the result
wraps once arch_scale_freq_ref() exceeds 2^32 / SCHED_CAPACITY_SCALE,
i.e. 4194304 kHz.

On a Snapdragon X2 Elite (Glymur) laptop, whose boost OPP is 4723200
kHz, cpuinfo_avg_freq reports 524283 kHz instead of ~4723200 kHz while
the CPU demonstrably runs at the boost frequency: a fixed workload
completes in 1.72 s at the 4723200 kHz OPP versus 2.01 s at 4032000
kHz, matching the 1.171 frequency ratio.

Keep the arithmetic in 64 bits until after the shift.

Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 arch/arm64/kernel/topology.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index d28438f8b83f..804758eeb63a 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -245,8 +245,9 @@ int arch_freq_get_on_cpu(int cpu)
 	 * (see amu_scale_freq_tick for details)
 	 */
 	scale = arch_scale_freq_capacity(cpu);
-	freq = scale * arch_scale_freq_ref(cpu);
-	freq >>= SCHED_CAPACITY_SHIFT;
+	scale *= arch_scale_freq_ref(cpu);
+	scale >>= SCHED_CAPACITY_SHIFT;
+	freq = scale;
 	return freq;
 }
 
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
