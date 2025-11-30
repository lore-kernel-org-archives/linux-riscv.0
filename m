Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2EFCFD376
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Nov 2025 12:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kDtqDWlYIIX+mJsV5wiZu2BVeBVHXEhIK9vbvCj2FS0=; b=CyLm/mmBBgXp/a
	xtb0WbV173kvGFEMG6W7a9DNgNxxPd0aPTCI76aL2V0BVJpsby1M7hVsS+JD6h+lQ+397InLaqRDJ
	UR8l5BFLVeqXN/K1cPSJylk0M+nKjRvluv3yWeen18Fi2pRoIzLXKw01imOgJZmaomK4h2hzXOibi
	7S5acMC7F7DVYgSm1YP1oMI4xgr6qWMHqnRKqEDii9BL3XunGE1mcIzRaSFLlhIoKaG9naj6jKWkK
	u32mF7OXeTVGdI+2CKlVV970eGiykv8kYfZQDX8XPXo4u2N6TueRwoV12RoN0FN0eLeghDGLfCR7N
	chDuxaX0kwujoH0gwBUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPgmD-00000002Ihq-16i4;
	Sun, 30 Nov 2025 12:43:41 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPgmA-00000002Igw-00u7
	for linux-riscv@lists.infradead.org;
	Sun, 30 Nov 2025 12:43:39 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-297e239baecso30782435ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 30 Nov 2025 04:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764506616; x=1765111416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q24/I9SndBUdDUiodRkHdhfBwRhvK6inDO5OAxEgMow=;
        b=RGRZZZfLbjNPSRiklp2zuFCBSyGNNr1nXwOcudS3BA12Lr8Q6OLcXJVP1vHx6uT/BI
         Dzeb/vBTPJo49dJUpRjtJKcUUQvKpxWibrXiQIxCTXQbCQQWKeCpdn+CcXOv6Acxyj7v
         ONqo89WLMoDMO7FjpqvZdY4t9/GQpUs6RJJB31Q+6dKueTJKJAXQMPF35lwCKM/LnsHc
         V26qJaJLSXvwoCPBg4RhaGWi+hdF9DYz4Ah0Nzn/WPCZcwftOemPnO5Coe8CkFUFOwlQ
         WDarwJTa6B5dmdnF+tny6KfNaUwXHlRocR1xoPcdX7h1btzuL0LyiffQm/8pzg7Dxfp+
         dRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764506616; x=1765111416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q24/I9SndBUdDUiodRkHdhfBwRhvK6inDO5OAxEgMow=;
        b=DhJutYcqWF/WolZL3ledoLEsPEhVfb/kzGkNsdAoAtB7NKAU2HQM6qvsv21sZLrn+G
         akbl4+bnzTXjhKt4D8BqbEJyVDTOE+Eh99bD+/5ysWr69XKN+xT0uVfjOvkrS86XoeoM
         GHWLGTjdueTySQgHekcMG5LYZDlxyhz7vfRKjJsThmQpvBNB3ivrd702QfnqpG7TWRYk
         qLaVE5Wevg8PjXacEBvDmYVmTjcKTVGNN8K5kW0ENOT32/iGzu/OW3ODXLWTTGFwSDi6
         EyE0cTfQNGGeqohovUwLOklqk2g/xqd9pGLaXAGuZ7txwgTf2slOwRBpRq+QIfUhHZvf
         8HJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlxjcwIyKcisPnn9Se2WHiSsM4lqbnldJk2ekhW0+lv68R/yq+HzIUy7b3MRaIVkwYUDPpkDc2k2ekng==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywem5QplokHH+0jIgBwS0No6w2L010XYyTlFIzlM7UMjt1M9tP9
	/y9BAbWtXHByjIpWCbPv4EHvbcfbR0yz6FoABZxBpGYiA5D2i93t4Xzb
X-Gm-Gg: ASbGncvRPdazwGZl95lJDHkGrQMZ5FGWNrPcY1niQCC0eLtw/5ojKw4Fg3RoRyTNbHu
	TK4anVGwPtOYJnBoeknwr46MELuExlsETOG/284vafJV9Yhq5z74imCw1Y06SnmzZt5yEmQqmKd
	a08Wg+YxwegvAJIMBzmAh+K8MMJT53s/e6toj/4FmxfXT9xl5JZZUNnb60xMgY+shyiT9DFWUh6
	66x5c05h86wcgc0d0l6qs2cSaopPy+IElH+xq3wX27Jke88hfBcvl60f/ebjqO65PN4Rym1hXDJ
	3VSV2AKCMErwAEiw8/Qe/6rlJAkM1fOw9WGcJDeiJeLOa7j+eies/dH3NpWcL3DrwfHhJCa82N1
	XaCj8SZuTi3te4vyIAdvaG4c02X8s6DObmnel+myQpOJO7l6Dj75l7nwGbuTfFVQpvypnUfvTXH
	I7wJL0w8TwhBKfLGjGGF97vy3aPzKiy5o=
X-Google-Smtp-Source: AGHT+IHQ1s8urnjdyeSUProWKNYbFdFfSSoKWTRTrBGlC3S9nSYGdG5k/0wJBSlO6lDVv0ToPmYK9Q==
X-Received: by 2002:a17:902:f547:b0:294:8c99:f318 with SMTP id d9443c01a7336-29b6beeda0fmr397752515ad.3.1764506616356;
        Sun, 30 Nov 2025 04:43:36 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb52d14sm94230235ad.82.2025.11.30.04.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 04:43:35 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: acme@kernel.org,
	adrian.hunter@intel.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	alex@ghiti.fr,
	alexander.shishkin@linux.intel.com,
	andreas@gaisler.com,
	anna-maria@linutronix.de,
	anshuman.khandual@arm.com,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	borntraeger@linux.ibm.com,
	bp@alien8.de,
	bsegall@google.com,
	dave.hansen@linux.intel.com,
	davem@davemloft.net,
	david@kernel.org,
	dietmar.eggemann@arm.com,
	frederic@kernel.org,
	gor@linux.ibm.com,
	hca@linux.ibm.com,
	hpa@zytor.com,
	irogers@google.com,
	james.clark@linaro.org,
	jolsa@kernel.org,
	juri.lelli@redhat.com,
	justinstitt@google.com,
	lorenzo.stoakes@oracle.com,
	luto@kernel.org,
	mark.rutland@arm.com,
	mathieu.desnoyers@efficios.com,
	max.kellermann@ionos.com,
	mgorman@suse.de,
	mingo@redhat.com,
	morbo@google.com,
	namhyung@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	nysal@linux.ibm.com,
	palmer@dabbelt.com,
	paulmck@kernel.org,
	peterz@infradead.org,
	pjw@kernel.org,
	riel@surriel.com,
	rostedt@goodmis.org,
	ryan.roberts@arm.com,
	segher@kernel.crashing.org,
	svens@linux.ibm.com,
	tglx@linutronix.de,
	thuth@redhat.com,
	urezki@gmail.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	linux@armlinux.org.uk
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v4 0/3] Optimize code generation during context switching
Date: Sun, 30 Nov 2025 20:43:04 +0800
Message-ID: <20251130124304.184107-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251123121827.1304-1-qq570070308@gmail.com>
References: <20251123121827.1304-1-qq570070308@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_044338_047149_FB2E7FC4 
X-CRM114-Status: GOOD (  11.23  )
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

On Sun, 23 Nov 2025 20:18:24 +0800, Xie Yuanbin wrote:
> This series of patches primarily make some functions called in context
> switching as always inline to optimize performance. Here is the
> performance test data for these patches:
> Time spent on calling finish_task_switch(), the unit is tsc from x86:
>  | test scenario             | old   | new   | delta          |
>  | gcc 15.2                  | 13.94 | 12.40 | 1.54  (-11.1%) |
>  | gcc 15.2 + spectre_v2     | 24.78 | 13.70 | 11.08 (-44.7%) |
>  | clang 21.1.4              | 13.90 | 12.71 | 1.19  (- 8.6%) |
>  | clang 21.1.4 + spectre_v2 | 29.01 | 18.91 | 10.1  (-34.8%) |

Hi everyone, I also conducted a performance test on raspberry pi 3b. I
hope this will be helpful in merging the patch.
The following is the test data:
Time spent on calling finish_task_switch(), the clocksource and unit is
cntvct_el0 from aarch64:
 | test scenario             | old  | new  | delta         |
 | gcc 15.2                  | 2.00 | 1.68 | 0.32 (-16.0%) |
 | clang 21.1.6              | 2.15 | 1.68 | 0.47 (-23.5%) |

Since raspberry pi 3b use a cortex-a53 processor, it is not affected by
the spectre v2 vulnerability, as is defined in
arch/arm64/kernel/proton-pack.c:
```c
	static const struct midr_range spectre_v2_safe_list[] = {
		MIDR_ALL_VERSIONS(MIDR_CORTEX_A35),
		MIDR_ALL_VERSIONS(MIDR_CORTEX_A53),
		MIDR_ALL_VERSIONS(MIDR_CORTEX_A55),
		MIDR_ALL_VERSIONS(MIDR_BRAHMA_B53),
		MIDR_ALL_VERSIONS(MIDR_HISI_TSV110),
		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_2XX_SILVER),
		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_3XX_SILVER),
		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_SILVER),
		{ /* sentinel */ }
	};
```
Link: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/kernel/proton-pack.c?id=7d31f578f3230f3b7b33b0930b08f9afd8429817#n152

Perhaps I can test the performace with spectre_v2 mitigation enabled on
a raspberry pi 4b in the future.

In order to make the test result stable, I fixed the cpu frequency by
setting config.txt as following:
```config
core_freq_fixed=1
arm_freq=800
arm_freq_min=800
gpu_freq=300
core_freq=300
h264_freq=300
isp_freq=300
v3d_freq=300
hevc_freq=300
sdram_freq=400
gpu_freq_min=300
core_freq_min=300
h264_freq_min=300
isp_freq_min=300
v3d_freq_min=300
hevc_freq_min=300
sdram_freq_min=400
```

The test source is commit 7d31f578f323 ("Add linux-next specific files
for 20251128") from liunx-next branch. Using default defconfig config,
and setting:
CONFIG_ARM64_SVE=n
CONFIG_COMPAT=n
CONFIG_COMPAT_32BIT_TIME=n
CONFIG_ARM64_PTR_AUTH=n
CONFIG_ARM64_GCS=n
CONFIG_ARM64_MTE=n
CONFIG_SHADOW_CALL_STACK=y
CONFIG_SCHED_AUTOGROUP=n
CONFIG_CGROUPS=n
CONFIG_KVM=n
CONFIG_HZ_100=y
CONFIG_HZ=100

Thanks very much!

Xie Yuanbin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
