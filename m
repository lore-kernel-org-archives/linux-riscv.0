Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC735C7EE2A
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 17:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4zId2zFTAginjTR4wGSqy/xyMBUy+6IBPEk/IiqNtg=; b=bwOLdXac9zqQm/
	AepDWRqlXeGiyDvLWw/fpDkz2nMy21QaKvbTs8EdzAtGH1KulQz6z6K8CKV4rHAKiLoRNSfA3qyvF
	ohmVTD0ml9lAEX0+jhrm5R2N9xc4iGZtez0qAw87S3zq+YRvNw5zuUmhiPopzvQJaZmnfyH6seH5h
	49hBq0Gcl6ez2wkOdc16jStMpO40nIRnfu1WHBghF6ndKusTxi+zsN8WUWSz1SgwjbcyCjknIDRwp
	fxK7/WQ7e6rYMu98E1SL45SvELZsxr/lg3DN+cMH7irU/1ORHbHIkWFdtLo76b8Qp8pOtHPhiAD0g
	Z0YmOrccJZFxsX6NcplQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU3D-00000009THr-3agD;
	Wed, 25 Jun 2025 17:36:47 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPdV-00000008h3b-3Xye
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 12:54:00 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250625125350euoutp0215553b35ce46258768f4e6a0e353feb3~MSkiNOACa0537005370euoutp02S
	for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 12:53:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250625125350euoutp0215553b35ce46258768f4e6a0e353feb3~MSkiNOACa0537005370euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750856030;
	bh=aHXPUrYiaWgQA8BN5Zf+BoDPK1tGYC0F+73wV5XjTXY=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=MqvdsWfuDOMUFFdpZ++uCNDRxIxCYkqgAv84879K/bIrv/0/5F8bSGtujVlCGo0Mi
	 2TWRc/cy9lNQA6MawjAhJV+EChId0q2Qo+ybYx2viknaXnZ5ZFh++pV8cpExALdK+e
	 AnqE2vKquHMcYIQjfNAMwsCUKOQJY7GIO+5WumIA=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250625125350eucas1p1dad14e84a8cc44516174ecc9053727b1~MSkhvbtf41252112521eucas1p14;
	Wed, 25 Jun 2025 12:53:50 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250625125349eusmtip10a4e23d9061b04dad7c3aa6ff3064088~MSkgtbupw0720807208eusmtip1C;
	Wed, 25 Jun 2025 12:53:48 +0000 (GMT)
Message-ID: <0b3d2deb-7f27-4390-b43e-353d4ba17bd7@samsung.com>
Date: Wed, 25 Jun 2025 14:53:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] drm/imagination: Enable PowerVR driver for
 RISC-V
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bartosz
	Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, Frank
	Binns <Frank.Binns@imgtec.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>, Marek
	Szyprowski <m.szyprowski@samsung.com>, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org"
	<linux-pm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <ff96ee1f-23ad-4e7f-9ac1-11f410e459e3@imgtec.com>
X-CMS-MailID: 20250625125350eucas1p1dad14e84a8cc44516174ecc9053727b1
X-Msg-Generator: CA
X-RootMTR: 20250623114439eucas1p17e4405b95a5693a972bf40a3b3ecdc11
X-EPHeader: CA
X-CMS-RootMailID: 20250623114439eucas1p17e4405b95a5693a972bf40a3b3ecdc11
References: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
	<CGME20250623114439eucas1p17e4405b95a5693a972bf40a3b3ecdc11@eucas1p1.samsung.com>
	<20250623-apr_14_for_sending-v6-8-6583ce0f6c25@samsung.com>
	<ff96ee1f-23ad-4e7f-9ac1-11f410e459e3@imgtec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_055358_152924_9FBBD8F5 
X-CRM114-Status: GOOD (  32.04  )
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



On 6/24/25 15:54, Matt Coster wrote:
> On 23/06/2025 12:42, Michal Wilczynski wrote:
>> Several RISC-V boards feature Imagination GPUs that are compatible with
>> the PowerVR driver. An example is the IMG BXM-4-64 GPU on the Lichee Pi
>> 4A board. This commit adjusts the driver's Kconfig dependencies to allow
>> the PowerVR driver to be compiled on the RISC-V architecture.
>>
>> By enabling compilation on RISC-V, we expand support for these GPUs,
>> providing graphics acceleration capabilities and enhancing hardware
>> compatibility on RISC-V platforms.
>>
>> Add a dependency on MMU to fix a build warning on RISC-V configurations
>> without an MMU.
>>
>> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  drivers/gpu/drm/imagination/Kconfig | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
>> index 5f9fff43d6baadc42ebf48d91729bfbf27e06caa..a7da858a5b301e8f088e3e22f5641feb2e078681 100644
>> --- a/drivers/gpu/drm/imagination/Kconfig
>> +++ b/drivers/gpu/drm/imagination/Kconfig
>> @@ -3,9 +3,10 @@
>>  
>>  config DRM_POWERVR
>>  	tristate "Imagination Technologies PowerVR (Series 6 and later) & IMG Graphics"
>> -	depends on ARM64
>> +	depends on (ARM64 || RISCV)
> 
> There were two issues you encountered when enabling COMPILE_TEST in v5,
> both of which are somewhat simple to workaround but expose underlying
> assumptions we made during early development.
> 
> The first [1] is due to us assuming a 64-bit platform, which was never a
> problem with the ARM64 dependency, but may actually be a problem with
> RISCV given this allows for 32-bit as well. You should probably make
> this (RISCV && 64BIT) until the implicit 64-bit dependency can be worked
> out.

Yeah will incude that in next revision.

> 
> Somewhat related, we also assume a little-endian host. Technically ARM64
> can also be big-endian, you just don't encounter that in the wild too
> often so it's never been a "real" issue. I do wonder if swapping out
> (ARM64 || RISCV) for (64BIT && CPU_LITTLE_ENDIAN) entirely would be a
> reasonable change, perhaps for another day though...
> 
> The other [2] is slightly more subtle. To keep things straightforward,
> we currently map CPU pages to GPU pages 1:1, meaning we use the CPU page
> size to define the GPU page size. That GPU page size is configurable,
> but does not support every possible size the CPU could support on any
> architecture. The failing test there was sparc64 with an 8K page size
> causing no GPU page size to be defined. See the #if/#elif ladder at the
> top of pvr_mmu.c for the supported sizes and the doc comment above
> PVR_DEVICE_PAGE_SIZE in pvr_mmu.h for the acknowledgement of the page
> size restrictions.
> 
> The "proper" fix here would be for us to make these two sizes
> independent, but that's not a trivial change. The "quick" fix I suppose
> would be to depend on one of the supported page sizes, so maybe
> (PAGE_SIZE_4KB || PAGE_SIZE_16KB || PAGE_SIZE_64KB || PAGE_SIZE_256KB)
> since the larger page sizes appear unsupported (probably for good
> reason).

Thanks for a great explanation !

> 
>>  	depends on DRM
>>  	depends on PM
>> +	depends on MMU
> 
> Nit: can you keep this alphabetical?
> 
> Cheers,
> Matt
> 
> [1]: https://lore.kernel.org/r/202506191323.zD1fszQb-lkp@intel.com/
> [2]: https://lore.kernel.org/r/202506201103.GX6DA9Gx-lkp@intel.com/
> 
>>  	select DRM_EXEC
>>  	select DRM_GEM_SHMEM_HELPER
>>  	select DRM_SCHED
>>
> 
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
