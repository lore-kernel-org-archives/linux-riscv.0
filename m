Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D959C83F1B
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 11:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2yKXFWxZuV/+96KvQIFLqjnDEz4qtQ1I2roTWl7C/lM=; b=MsseWuChwirYWz
	acob0PfrURumCnQFtpPYKG1S5BuCRQ+mnVoJ1mDWKg8YKeAj1hCRAIZOxzyJXnI4wJX7WefzTqwWb
	iZkVTqypSdPpjPWjoHm8rdM0GH9avn+aA9ISXZuIQKVFFndYmBHPtvBoR1O+xdZTKeL/9a8xX2ax2
	MLy5dkjYo2Rpz3EaLGXBpkULjhJqpx9dP6ZgH632xyXlkyx2AXVEXYIs1jvh6kA06XgXBGKLTTlEN
	ij8Iu5lgu7z+N9IoTyJo1yL7q7jQLPQZi+RrKqt95UFWncNDD9YqUG09E172xfrFYz31/NKUin7CV
	RGA/4oyX8btoka24Izrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubH3J-00000001zzZ-3S5G;
	Mon, 14 Jul 2025 11:08:57 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubH21-00000001ztu-2WaL
	for linux-riscv@lists.infradead.org;
	Mon, 14 Jul 2025 11:07:39 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250714110732euoutp029ad80e791442054d5c6e3a9a0adbbec8~SGYJae6jo2265822658euoutp02e
	for <linux-riscv@lists.infradead.org>; Mon, 14 Jul 2025 11:07:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250714110732euoutp029ad80e791442054d5c6e3a9a0adbbec8~SGYJae6jo2265822658euoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752491252;
	bh=+cH1AagOLxRaP9OS6I3NvlMV9oNEy792Og/AFphHVSY=;
	h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
	b=YUsSXX4X1+KjPXjsXVONyLaXQwyN7k7TEJ0nSJb9/pastTcDa8yhUvxywTSIR+1MB
	 YtPzGs1xdcEdtWezuN0UBqH553GlvNUXRIrAX/SGWevx8EHoFZKQ044N/ShMWf9pTW
	 0IqaplYHTNcqWq3jxrf94tPNYM68OKMXNhykKl4Y=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250714110732eucas1p1c0c47358492d6b115b74c0d702bd4a1c~SGYI6A4zX1349413494eucas1p1l;
	Mon, 14 Jul 2025 11:07:32 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250714110730eusmtip1d440d37697b95bbfc6a074f6ce94fe19~SGYH0S8mA3118931189eusmtip1h;
	Mon, 14 Jul 2025 11:07:30 +0000 (GMT)
Message-ID: <1245a8c2-ca23-4faa-bceb-3354e92aca2c@samsung.com>
Date: Mon, 14 Jul 2025 13:07:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] drm/imagination: Use pwrseq for TH1520 GPU power
 management
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel
	<p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, Matt Coster
	<matt.coster@imgtec.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>, Marek
	Szyprowski <m.szyprowski@samsung.com>, Drew Fustini <fustini@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
Content-Language: en-US
In-Reply-To: <fa235fa1-d5ad-44b7-bf52-068ea41fc9ea@samsung.com>
X-CMS-MailID: 20250714110732eucas1p1c0c47358492d6b115b74c0d702bd4a1c
X-Msg-Generator: CA
X-RootMTR: 20250626093356eucas1p1adfcd565173d939f82e15252189c316f
X-EPHeader: CA
X-CMS-RootMailID: 20250626093356eucas1p1adfcd565173d939f82e15252189c316f
References: <20250626-apr_14_for_sending-v7-0-6593722e0217@samsung.com>
	<CGME20250626093356eucas1p1adfcd565173d939f82e15252189c316f@eucas1p1.samsung.com>
	<20250626-apr_14_for_sending-v7-1-6593722e0217@samsung.com>
	<fa235fa1-d5ad-44b7-bf52-068ea41fc9ea@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_040738_207596_650D03E4 
X-CRM114-Status: GOOD (  22.29  )
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



On 7/3/25 12:21, Michal Wilczynski wrote:
> 
> 
> On 6/26/25 11:33, Michal Wilczynski wrote:
>> Update the Imagination PVR DRM driver to leverage the pwrseq framework
>> for managing the complex power sequence of the GPU on the T-HEAD TH1520
>> SoC.
>>
>> To cleanly separate platform specific logic from the generic driver,
>> this patch introduces a `pwr_power_sequence_ops` struct containing
>> function pointers for power_on and power_off operations. This allows for
>> different power management strategies to be selected at probe time based
>> on the device's compatible string.
>>
>> A `pvr_device_data` struct, associated with each compatible in the
>> of_device_id table, points to the appropriate ops table (manual or
>> pwrseq).
>>
>> At probe time, the driver inspects the assigned ops struct. If the
>> pwrseq variant is detected, the driver calls
>> devm_pwrseq_get("gpu-power"), deferring probe if the sequencer is not
>> yet available. Otherwise, it falls back to the existing manual clock and
>> reset handling. The runtime PM callbacks now call the appropriate
>> functions via the ops table.
>>
>> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  drivers/gpu/drm/imagination/pvr_device.c |  36 +++++++-
>>  drivers/gpu/drm/imagination/pvr_device.h |  17 ++++
>>  drivers/gpu/drm/imagination/pvr_drv.c    |  27 +++++-
>>  drivers/gpu/drm/imagination/pvr_power.c  | 139 ++++++++++++++++++++++---------
>>  drivers/gpu/drm/imagination/pvr_power.h  |  13 +++
>>  5 files changed, 185 insertions(+), 47 deletions(-)
>>
> 
> Hi,
> 
> I'm checking in on the status of my pwrseq patch above. Is this on track
> for the next merge window?
> 
> Please let me know if there's anything else needed from my end to help
> get it ready.
> 
> Best regards,


Hi Matt,

I was very happy to see the recent "pvr: various enablement changes" get
merged in Mesa [1]. Congratulations to the team on that progress.

I just wanted to check in and see if you have any more requests for this
series ?

[1] - https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33998

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
