Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6E1C54FB3
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 08:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=77FuWqm3waq8OEtO/+isf5BYkABDJ8GhOhGanNACsYo=; b=WdGm5gygJn1eS6
	h5BuwwGdUAMtzooipSaLO8jqxKlYDE8hVuhGafEjw4gUx1LhLdxjLXMtfgLsdwuXQZmMkckysnRvR
	CcNVSd7LOWdK/k2FNyU45FudjRnuHqkAfvbaL01uRPwHKG625SE+i+/5eJqp1YkVcKt+k7Pnru1El
	EMgfUNZYyEwq5xCThoXGG3CPA1Bx2gxvcbJ9MWdELSGSHNJ6MwUAmHv17zZM2fu7WVe6GrQkJaQZQ
	ykaHZ7chMTBPiOllIu4PImOB7OrazWwvgcfePqmnbqbMPRPfSDkFB4vypAobPWib/HY5s93BmatNy
	SQGMF4x0oio+9v1Fzs9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM08h-00000006xaO-3IXC;
	Mon, 02 Jun 2025 08:03:23 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM08c-00000006xZB-00Tx
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 08:03:22 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250602080311euoutp0246f0bfb06a6f55d1a85cf5117a955251~FKxM79VEK1155211552euoutp02a
	for <linux-riscv@lists.infradead.org>; Mon,  2 Jun 2025 08:03:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250602080311euoutp0246f0bfb06a6f55d1a85cf5117a955251~FKxM79VEK1155211552euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1748851391;
	bh=yY1VEfuS50yeg4/M81P+3Gelb3X1t6c/xBU34vQDX40=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=BvJAdAXUUeS4TgFFAVomgr8G3/j+qxU/X7jD1xTYV3GCz9X8tzzjdiPOHdjOcfOfN
	 Moe1FdTUAWDNjqaMIHpu89KHE7MgZAB6EBiiL/adgwXGAWlPaqqgGgmsP3x5+fdWfP
	 DBO0FQYHapzcZrQzvVzl9Xq45R6ohD37aQ6po6sE=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250602080311eucas1p2d93fc4c597da6631557641b8024ac0b8~FKxMYZzjI2836028360eucas1p2o;
	Mon,  2 Jun 2025 08:03:11 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250602080310eusmtip1eeb2c0854b4142c150186f84a2b9d948~FKxLYFBbH1907619076eusmtip1q;
	Mon,  2 Jun 2025 08:03:10 +0000 (GMT)
Message-ID: <d949f2b5-1351-4778-9716-eaec1e2b1ba7@samsung.com>
Date: Mon, 2 Jun 2025 10:03:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] Add TH1520 GPU support with power sequencing
To: Drew Fustini <drew@pdp7.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel
	<p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, Matt Coster
	<matt.coster@imgtec.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>, Marek
	Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <aDzcul5vBeQvP634@x1>
X-CMS-MailID: 20250602080311eucas1p2d93fc4c597da6631557641b8024ac0b8
X-Msg-Generator: CA
X-RootMTR: 20250529222402eucas1p1c9e0ddd3efd62e078e5de2cf71655f58
X-EPHeader: CA
X-CMS-RootMailID: 20250529222402eucas1p1c9e0ddd3efd62e078e5de2cf71655f58
References: <CGME20250529222402eucas1p1c9e0ddd3efd62e078e5de2cf71655f58@eucas1p1.samsung.com>
	<20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
	<aDzcul5vBeQvP634@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_010318_685768_5CC72F8A 
X-CRM114-Status: GOOD (  46.09  )
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



On 6/2/25 01:05, Drew Fustini wrote:
> On Fri, May 30, 2025 at 12:23:47AM +0200, Michal Wilczynski wrote:
>> This patch series introduces support for the Imagination IMG BXM-4-64
>> GPU found on the T-HEAD TH1520 SoC. A key aspect of this support is
>> managing the GPU's complex power-up and power-down sequence, which
>> involves multiple clocks and resets.
>>
>> The TH1520 GPU requires a specific sequence to be followed for its
>> clocks and resets to ensure correct operation. Initial discussions and
>> an earlier version of this series explored managing this via the generic
>> power domain (genpd) framework. However, following further discussions
>> with kernel maintainers [1], the approach has been reworked to utilize
>> the dedicated power sequencing (pwrseq) framework.
>>
>> This revised series now employs a new pwrseq provider driver
>> (pwrseq-thead-gpu.c) specifically for the TH1520 GPU. This driver
>> encapsulates the SoC specific power sequence details. The Imagination
>> GPU driver (pvr_device.c) is updated to act as a consumer of this power
>> sequencer, requesting the "gpu-power" target. The sequencer driver,
>> during its match phase with the GPU device, acquires the necessary clock
>> and reset handles from the GPU device node to perform the full sequence.
>>
>> This approach aligns with the goal of abstracting SoC specific power
>> management details away from generic device drivers and leverages the
>> pwrseq framework as recommended.
>>
>> The series is structured as follows:
>>
>> Patch 1: Adds device tree bindings for the new T-HEAD TH1520 GPU
>>          power sequencer provider.
>> Patch 2: Introduces the pwrseq-thead-gpu driver to manage the GPU's
>>          power-on/off sequence.
>> Patch 3: Updates the Imagination DRM driver to utilize the pwrseq
>>          framework for TH1520 GPU power management.
>> Patch 4: Adds the TH1520 GPU compatible string to the Imagination
>>          GPU DT bindings.
>> Patch 5: Adds the missing reset controller header include in the
>>          TH1520 DTS include file.
>> Patch 6: Adds the device tree node for the GPU power sequencer to
>>          the TH1520 DTS include file.
>> Patch 7: Adds the GPU device tree node for the IMG BXM-4-64 GPU to
>>          the TH1520 DTS include file.
>> Patch 8: Enables compilation of the drm/imagination on the RISC-V
>>          architecture
>>
>> This patchset finishes the work started in bigger series [2] by adding
>> all the remaining GPU power sequencing piece. After this patchset the GPU
>> probes correctly.
>>
>> This series supersedes the previous genpd based approach. Testing on
>> T-HEAD TH1520 SoC indicates the new pwrseq based solution works
>> correctly.
>>
>> This time it's based on linux-next, as there are dependent patches not
>> yet merged, but present in linux-next like clock and reset patches.
>>
>> An open point in Patch 7/8 concerns the GPU memory clock (gpu_mem_clk),
>> defined as a fixed-clock. The specific hardware frequency for this clock
>> on the TH1520 could not be determined from available public
>> documentation. Consequently, clock-frequency = <0>; has been used as a
>> placeholder to enable driver functionality.
>>
>> Link to v2 of this series - [3].
>>
>> v3:
>>
>>  - re-worked cover letter completely
>>  - complete architectural rework from using extended genpd callbacks to a
>>    dedicated pwrseq provider driver
>>  - introduced pwrseq-thead-gpu.c and associated DT bindings
>>    (thead,th1520-gpu-pwrseq)
>>  - the Imagination driver now calls devm_pwrseq_get() and uses
>>    pwrseq_power_on() / pwrseq_power_off() for the TH1520 GPU
>>  - removed the platform_resources_managed flag from dev_pm_info and
>>    associated logic
>>  - the new pwrseq driver's match() function now acquires consumer-specific
>>    resources (GPU clocks, GPU core reset) directly from the consumer device
>>
>> v2:
>>
>> Extended the series by adding two new commits:
>>  - introduced a new platform_resources_managed flag in dev_pm_info along
>>    with helper functions, allowing drivers to detect when clocks and resets
>>    are managed by the platform
>>  - updated the DRM Imagination driver to skip claiming clocks when
>>    platform_resources_managed is set
>>
>> Split the original bindings update:
>>  - the AON firmware bindings now only add the GPU clkgen reset (the GPU
>>    core reset remains handled by the GPU node)
>>
>> Reworked the TH1520 PM domain driver to:
>>  - acquire GPU clocks and reset dynamically using attach_dev/detach_dev
>>    callbacks
>>  - handle clkgen reset internally, while GPU core reset is obtained from
>>    the consumer device node
>>  - added a check to enforce that only a single device can be attached to
>>    the GPU PM domain
>>
>> [1] - https://lore.kernel.org/all/CAPDyKFpi6_CD++a9sbGBvJCuBSQS6YcpNttkRQhQMTWy1yyrRg@mail.gmail.com/
>> [2] - https://lore.kernel.org/all/20250219140239.1378758-1-m.wilczynski@samsung.com/
>> [3] - https://lore.kernel.org/all/20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com/
>>
>> ---
>> Michal Wilczynski (8):
>>       dt-bindings: power: Add T-HEAD TH1520 GPU power sequencer
>>       power: sequencing: Add T-HEAD TH1520 GPU power sequencer driver
>>       drm/imagination: Use pwrseq for TH1520 GPU power management
>>       dt-bindings: gpu: Add TH1520 GPU compatible to Imagination bindings
>>       riscv: dts: thead: th1520: Add missing reset controller header include
>>       riscv: dts: thead: Add GPU power sequencer node
>>       riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU node
>>       drm/imagination: Enable PowerVR driver for RISC-V
>>
>>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml |   9 +-
>>  .../bindings/power/thead,th1520-pwrseq.yaml        |  42 +++++
>>  MAINTAINERS                                        |   2 +
>>  arch/riscv/boot/dts/thead/th1520.dtsi              |  29 ++++
>>  drivers/gpu/drm/imagination/Kconfig                |   3 +-
>>  drivers/gpu/drm/imagination/pvr_device.c           |  33 +++-
>>  drivers/gpu/drm/imagination/pvr_device.h           |   6 +
>>  drivers/gpu/drm/imagination/pvr_power.c            |  82 +++++----
>>  drivers/power/sequencing/Kconfig                   |   8 +
>>  drivers/power/sequencing/Makefile                  |   1 +
>>  drivers/power/sequencing/pwrseq-thead-gpu.c        | 183 +++++++++++++++++++++
>>  11 files changed, 363 insertions(+), 35 deletions(-)
>> ---
>> base-commit: 49473fe7fdb5fbbe5bbfa51083792c17df63d317
>> change-id: 20250414-apr_14_for_sending-5b3917817acc
>>
>> Best regards,
>> -- 
>> Michal Wilczynski <m.wilczynski@samsung.com>
>>
> 
> Thank you for continuing to work on this series.
> 
> I applied it to next-20250530 and the boot hangs:
> 
> <snip>
> [    0.895622] mmc0: new HS400 MMC card at address 0001
> [    0.902638] mmcblk0: mmc0:0001 8GTF4R 7.28 GiB
> [    0.915454]  mmcblk0: p1 p2 p3
> [    0.916613] debug_vm_pgtable: [debug_vm_pgtable         ]: Validating architecture page table helpers
> [    0.920107] mmcblk0boot0: mmc0:0001 8GTF4R 4.00 MiB
> [    0.936592] mmcblk0boot1: mmc0:0001 8GTF4R 4.00 MiB
> [    0.944986] mmcblk0rpmb: mmc0:0001 8GTF4R 512 KiB, chardev (243:0)
> [    0.947700] mmc1: new UHS-I speed DDR50 SDHC card at address aaaa
> [    0.961368] mmcblk1: mmc1:aaaa SU16G 14.8 GiB
> [    0.969639]  mmcblk1: p1 p2 p3
> [    0.986688] printk: legacy console [ttyS0] disabled
> [    0.992468] ffe7014000.serial: ttyS0 at MMIO 0xffe7014000 (irq = 23, base_baud = 6250000) is a 16550A
> [    1.002085] printk: legacy console [ttyS0] enabled
> [    1.002085] printk: legacy console [ttyS0] enabled
> [    1.011784] printk: legacy bootconsole [uart0] disabled
> [    1.011784] printk: legacy bootconsole [uart0] disabled
> [    1.024633] stackdepot: allocating hash table of 524288 entries via kvcalloc
> <no more output>
> 
> I pasted the full boot log [1]. I have clk_ignore_unused in the kernel
> cmdline so I don't think it is related to disabling clocks. Boot does
> complete okay if I set the gpu node status to disabled.
> 
> Any ideas of what might fix the boot hang?
> 
> Thanks,
> Drew

Hi,
Thanks a lot for testing and promptly providing debug data. I think the
problem is with the fallback logic implemented in the pvr_device.c:
	/*
	 * Try to get a power sequencer. If successful, it will handle clocks
	 * and resets. Otherwise, we fall back to managing them ourselves.
	 */
	pvr_dev->pwrseq = devm_pwrseq_get(dev, "gpu-power");
	if (IS_ERR(pvr_dev->pwrseq)) {
		int pwrseq_err = PTR_ERR(pvr_dev->pwrseq);

		/*
		 * If the error is -EPROBE_DEFER, it's because the
		 * optional sequencer provider is not present
		 * and it's safe to fall back on manual power-up.
		 */
		if (pwrseq_err == -EPROBE_DEFER)
			pvr_dev->pwrseq = NULL;
		else
			return dev_err_probe(dev, pwrseq_err,
					     "Failed to get power sequencer\n");
	}


Since you have:
# CONFIG_POWER_SEQUENCING_THEAD_GPU is not set
The fallback logic assumes that there is no pwrseq provider for
'gpu-power' and falls back on generic driver to do the initial power
sequence. Obviously for TH1520 the generic driver fails to do that
correctly, and the register access hangs.

So the code seems to behave as designed.

By the way, there are quite a lot of Kconfig options added recently to
TH1520 SoC that haven't made it's way to defconfig for risc-v. Do you
think it's a good idea to add them there ?

> 
> [1] https://protect2.fireeye.com/v1/url?k=ac29f739-cda2e203-ac287c76-74fe4860008a-0bca62898bcc20b4&q=1&e=e86ea026-835e-453e-a61b-1d30c11073e1&u=https%3A%2F%2Fgist.github.com%2Fpdp7%2F44bd6de63fb9274a66a705ad807690b6
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
