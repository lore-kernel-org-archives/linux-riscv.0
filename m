Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BF9C54FB3
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Jun 2025 23:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mAiiUtbdHADQTdg3agC363zTZgG7lkjBc9DmSabJC6o=; b=WKqr+lfFE/kmSC
	VBdaj52Z4b6g1fV6jApKdHMqttxtxgvY8OvPsO4QR5+TYWIT3jAW/CYPSMQn0Ha1P6WcZyvG0YFOV
	kWar7T646EVvVnQF81FLaUyK9fWLXOrNmhRKXOPCfFdgWlIGXHm0CTW9DSK1EeBJ32URW9fepHqGF
	kPNq/94Urwrx2/wDQoT7hpLp59m9JT6Or6PKC5XGrjQBnKZbVQ+JH8NQmo1SheRIGebb3MO9KZ8Eu
	8+AbyvkaBKa59JH8/8oromteGyWa6Zu/lJwICmz38mIGymjF4is05JICQTE6OLGd+Ra/1UQLRIyIF
	Xs+p6NSuGGgFHFJAjG+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLs04-00000006515-3KFI;
	Sun, 01 Jun 2025 23:21:56 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLrkD-000000063Yx-27qC
	for linux-riscv@lists.infradead.org;
	Sun, 01 Jun 2025 23:05:35 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3121aed2435so3384413a91.2
        for <linux-riscv@lists.infradead.org>; Sun, 01 Jun 2025 16:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1748819132; x=1749423932; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1fvDqBrE4PSD/vq25y+z/0fv2r3rQKmt0xaBYl9gR/Y=;
        b=vSNGmaW+wRS/2D/xiV7AHVPf+prR+3lMh80KJVMP6mmTBtd7Mmh4sAfIeYGZCsuWQt
         gBeDFWH5A7rpQRVrMbq12NRBDlcS/cng2n/n1D6kf17eNsAgImI7e2kESBbOiRqTUxcf
         OwBjRdHyPWs6K5momIxPtCWqnoMX4ADmq1RhVpV0GbEOQrRnho2UvKWiC6Ddksi1q6Qq
         tJ8Vo+rUkNyqMvDNzaPkjynEXHFN/eKagITL7gpfD0NWhPLixrb0mUAS2ao22bjdbIka
         MJgAHQvTX1K0xPxzJoscY8f1OjW8nZBx0P7jXwCVSd0tpCatg7B2uzLVfSplEu33vIpl
         s2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748819132; x=1749423932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fvDqBrE4PSD/vq25y+z/0fv2r3rQKmt0xaBYl9gR/Y=;
        b=a9Vj88IfLFyvYADSe0BpyPLxRIk31ZBUlHpGlmEa3STTcLbiYFeZhIEpD38SwluBnZ
         qE5uufw0YxcwHm4u7IqOzH1g7vB6wYkzf/jhv4m/SY0ybmrVb+lG/xwiheR9FwhY90e3
         fOzgGbomI7xVcHADQ3bQKXDa0xnJX7txnONj+jk5BJunZvh76BS98Js0AaDTCq86Xugb
         qXKu30Yttz18iA9C5U6GEAIlMx3BQJq/7+ehtDHh9dMb7J810K1JIQmP7v5klbxT8TfO
         g7NufXOkLv84rErlqnXxy9i3koyFPLbUfEwHGH71bBKrNGWLKkVEuHA6rDMTZulPolnv
         E5yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRRh1Pgi8gkLOp8QoFN2JdKI/NVN0E8kETE7Km+27ydlJFVNvYLpsFyNIfAZ2lLCZ0R0sE5j6//L2RTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4xg99IYoplr5xq5KcUiQ02WZPx/F4v6N4gT1+tpaBrHrhcWJp
	7kbmMTutyeYk/3q/qNkYfyfBX2r8JZW3Z230AyactjyaVp7STVkENSTAxcvrSjw4T08=
X-Gm-Gg: ASbGncu5fB8WJHVBhEtZ/g56JJ6LJzALA8tEiTGzYBZaZauA5iw1lIOuujZF6HVYOm9
	vWA600uNt8WsqL/1LJa5R9Iec14wn83PWvEFazyVMJpxeHQov16pXeOnBBp5+DySfZkqaA/SQpv
	45nK0GaC5+egkJ95PzboYPzY21ZIvENi3PevX82VUul6dMYsOSJl6CaUjfZSZxrr3zLZbAxr+Rf
	ISfHumE/8t+aELhPztAsXhX+ATb/EqeNtamuv1+tVPTFZY9M5fl96Iafqny3IM+ZDYPAtnvWmNw
	k1o7DxOeJciXND57vTO7fKa57iItz9/S
X-Google-Smtp-Source: AGHT+IFJ93lsJS+eE0bjnFv6KmogL+dSl97lhohNWrj7NLeLEHx5L8l95tdQ19djgO3Tt4ygx5bUvQ==
X-Received: by 2002:a17:90b:4c09:b0:312:1b53:5ead with SMTP id 98e67ed59e1d1-31240d1c0d7mr15746377a91.4.1748819132212;
        Sun, 01 Jun 2025 16:05:32 -0700 (PDT)
Received: from x1 ([97.120.245.255])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d14ca5sm59442445ad.242.2025.06.01.16.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 16:05:31 -0700 (PDT)
Date: Sun, 1 Jun 2025 16:05:30 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 0/8] Add TH1520 GPU support with power sequencing
Message-ID: <aDzcul5vBeQvP634@x1>
References: <CGME20250529222402eucas1p1c9e0ddd3efd62e078e5de2cf71655f58@eucas1p1.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_160533_797662_CDA279A5 
X-CRM114-Status: GOOD (  42.12  )
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

On Fri, May 30, 2025 at 12:23:47AM +0200, Michal Wilczynski wrote:
> This patch series introduces support for the Imagination IMG BXM-4-64
> GPU found on the T-HEAD TH1520 SoC. A key aspect of this support is
> managing the GPU's complex power-up and power-down sequence, which
> involves multiple clocks and resets.
> 
> The TH1520 GPU requires a specific sequence to be followed for its
> clocks and resets to ensure correct operation. Initial discussions and
> an earlier version of this series explored managing this via the generic
> power domain (genpd) framework. However, following further discussions
> with kernel maintainers [1], the approach has been reworked to utilize
> the dedicated power sequencing (pwrseq) framework.
> 
> This revised series now employs a new pwrseq provider driver
> (pwrseq-thead-gpu.c) specifically for the TH1520 GPU. This driver
> encapsulates the SoC specific power sequence details. The Imagination
> GPU driver (pvr_device.c) is updated to act as a consumer of this power
> sequencer, requesting the "gpu-power" target. The sequencer driver,
> during its match phase with the GPU device, acquires the necessary clock
> and reset handles from the GPU device node to perform the full sequence.
> 
> This approach aligns with the goal of abstracting SoC specific power
> management details away from generic device drivers and leverages the
> pwrseq framework as recommended.
> 
> The series is structured as follows:
> 
> Patch 1: Adds device tree bindings for the new T-HEAD TH1520 GPU
>          power sequencer provider.
> Patch 2: Introduces the pwrseq-thead-gpu driver to manage the GPU's
>          power-on/off sequence.
> Patch 3: Updates the Imagination DRM driver to utilize the pwrseq
>          framework for TH1520 GPU power management.
> Patch 4: Adds the TH1520 GPU compatible string to the Imagination
>          GPU DT bindings.
> Patch 5: Adds the missing reset controller header include in the
>          TH1520 DTS include file.
> Patch 6: Adds the device tree node for the GPU power sequencer to
>          the TH1520 DTS include file.
> Patch 7: Adds the GPU device tree node for the IMG BXM-4-64 GPU to
>          the TH1520 DTS include file.
> Patch 8: Enables compilation of the drm/imagination on the RISC-V
>          architecture
> 
> This patchset finishes the work started in bigger series [2] by adding
> all the remaining GPU power sequencing piece. After this patchset the GPU
> probes correctly.
> 
> This series supersedes the previous genpd based approach. Testing on
> T-HEAD TH1520 SoC indicates the new pwrseq based solution works
> correctly.
> 
> This time it's based on linux-next, as there are dependent patches not
> yet merged, but present in linux-next like clock and reset patches.
> 
> An open point in Patch 7/8 concerns the GPU memory clock (gpu_mem_clk),
> defined as a fixed-clock. The specific hardware frequency for this clock
> on the TH1520 could not be determined from available public
> documentation. Consequently, clock-frequency = <0>; has been used as a
> placeholder to enable driver functionality.
> 
> Link to v2 of this series - [3].
> 
> v3:
> 
>  - re-worked cover letter completely
>  - complete architectural rework from using extended genpd callbacks to a
>    dedicated pwrseq provider driver
>  - introduced pwrseq-thead-gpu.c and associated DT bindings
>    (thead,th1520-gpu-pwrseq)
>  - the Imagination driver now calls devm_pwrseq_get() and uses
>    pwrseq_power_on() / pwrseq_power_off() for the TH1520 GPU
>  - removed the platform_resources_managed flag from dev_pm_info and
>    associated logic
>  - the new pwrseq driver's match() function now acquires consumer-specific
>    resources (GPU clocks, GPU core reset) directly from the consumer device
> 
> v2:
> 
> Extended the series by adding two new commits:
>  - introduced a new platform_resources_managed flag in dev_pm_info along
>    with helper functions, allowing drivers to detect when clocks and resets
>    are managed by the platform
>  - updated the DRM Imagination driver to skip claiming clocks when
>    platform_resources_managed is set
> 
> Split the original bindings update:
>  - the AON firmware bindings now only add the GPU clkgen reset (the GPU
>    core reset remains handled by the GPU node)
> 
> Reworked the TH1520 PM domain driver to:
>  - acquire GPU clocks and reset dynamically using attach_dev/detach_dev
>    callbacks
>  - handle clkgen reset internally, while GPU core reset is obtained from
>    the consumer device node
>  - added a check to enforce that only a single device can be attached to
>    the GPU PM domain
> 
> [1] - https://lore.kernel.org/all/CAPDyKFpi6_CD++a9sbGBvJCuBSQS6YcpNttkRQhQMTWy1yyrRg@mail.gmail.com/
> [2] - https://lore.kernel.org/all/20250219140239.1378758-1-m.wilczynski@samsung.com/
> [3] - https://lore.kernel.org/all/20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com/
> 
> ---
> Michal Wilczynski (8):
>       dt-bindings: power: Add T-HEAD TH1520 GPU power sequencer
>       power: sequencing: Add T-HEAD TH1520 GPU power sequencer driver
>       drm/imagination: Use pwrseq for TH1520 GPU power management
>       dt-bindings: gpu: Add TH1520 GPU compatible to Imagination bindings
>       riscv: dts: thead: th1520: Add missing reset controller header include
>       riscv: dts: thead: Add GPU power sequencer node
>       riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU node
>       drm/imagination: Enable PowerVR driver for RISC-V
> 
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml |   9 +-
>  .../bindings/power/thead,th1520-pwrseq.yaml        |  42 +++++
>  MAINTAINERS                                        |   2 +
>  arch/riscv/boot/dts/thead/th1520.dtsi              |  29 ++++
>  drivers/gpu/drm/imagination/Kconfig                |   3 +-
>  drivers/gpu/drm/imagination/pvr_device.c           |  33 +++-
>  drivers/gpu/drm/imagination/pvr_device.h           |   6 +
>  drivers/gpu/drm/imagination/pvr_power.c            |  82 +++++----
>  drivers/power/sequencing/Kconfig                   |   8 +
>  drivers/power/sequencing/Makefile                  |   1 +
>  drivers/power/sequencing/pwrseq-thead-gpu.c        | 183 +++++++++++++++++++++
>  11 files changed, 363 insertions(+), 35 deletions(-)
> ---
> base-commit: 49473fe7fdb5fbbe5bbfa51083792c17df63d317
> change-id: 20250414-apr_14_for_sending-5b3917817acc
> 
> Best regards,
> -- 
> Michal Wilczynski <m.wilczynski@samsung.com>
> 

Thank you for continuing to work on this series.

I applied it to next-20250530 and the boot hangs:

<snip>
[    0.895622] mmc0: new HS400 MMC card at address 0001
[    0.902638] mmcblk0: mmc0:0001 8GTF4R 7.28 GiB
[    0.915454]  mmcblk0: p1 p2 p3
[    0.916613] debug_vm_pgtable: [debug_vm_pgtable         ]: Validating architecture page table helpers
[    0.920107] mmcblk0boot0: mmc0:0001 8GTF4R 4.00 MiB
[    0.936592] mmcblk0boot1: mmc0:0001 8GTF4R 4.00 MiB
[    0.944986] mmcblk0rpmb: mmc0:0001 8GTF4R 512 KiB, chardev (243:0)
[    0.947700] mmc1: new UHS-I speed DDR50 SDHC card at address aaaa
[    0.961368] mmcblk1: mmc1:aaaa SU16G 14.8 GiB
[    0.969639]  mmcblk1: p1 p2 p3
[    0.986688] printk: legacy console [ttyS0] disabled
[    0.992468] ffe7014000.serial: ttyS0 at MMIO 0xffe7014000 (irq = 23, base_baud = 6250000) is a 16550A
[    1.002085] printk: legacy console [ttyS0] enabled
[    1.002085] printk: legacy console [ttyS0] enabled
[    1.011784] printk: legacy bootconsole [uart0] disabled
[    1.011784] printk: legacy bootconsole [uart0] disabled
[    1.024633] stackdepot: allocating hash table of 524288 entries via kvcalloc
<no more output>

I pasted the full boot log [1]. I have clk_ignore_unused in the kernel
cmdline so I don't think it is related to disabling clocks. Boot does
complete okay if I set the gpu node status to disabled.

Any ideas of what might fix the boot hang?

Thanks,
Drew

[1] https://gist.github.com/pdp7/44bd6de63fb9274a66a705ad807690b6

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
