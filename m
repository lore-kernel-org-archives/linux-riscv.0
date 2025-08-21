Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2804ACA0EEB
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 13:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QrIgQEyBZ5wlsaTRnZiquM+1YZolikyzbQuvRgLtGW4=; b=xfa+Kz1jGwZjJh
	6xFdKIWp2EafgMjuzLdS0aKoHy1CoXErUJjO+2Jl6V6aCtI3yBc3o0cDUE5OII/+naoLZQBzZqGWy
	NXZYQcjGYbuTF4PcwBB6M1lWkDWNNNogVG261kBgSS6OLwzdMjgN5aiap2LspN9WX557yXufZMQTT
	i8sCnXWMz7qyoGWtehcaZHl+BSCbqtD/9dAZSmGGMo2anJDlUMfpUAhsC1CrRwkipktvD14w+wQio
	EBIevJ6VoU8ZO4Y0IZLi/S+oreN0w4bdYvTZfJ9Lk5RBiwk/e4l+j+Aa3f1A2Kjfzs7FoNG8NKP5p
	uMVNeLF4RUUx2g2bSeaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5C3-0000000H1kC-3IRk;
	Thu, 21 Aug 2025 13:19:03 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1wd-0000000GVt6-01xA
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 09:50:57 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250821095049euoutp028dfda1608a81a966beba275a5dd84d37~dv2BExheW2668826688euoutp02S
	for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 09:50:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250821095049euoutp028dfda1608a81a966beba275a5dd84d37~dv2BExheW2668826688euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755769849;
	bh=HSvuQ3ZafL8FGWMfbxoBhMAcsMdHdvxyBcoWoRljZZM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Cgs6sY9VitL++i12YOxwq0KuzQAZAnn2/w0+ZDLDu1gKU8RWKenQa9vgELQCy6Bca
	 1NmZvhpPWd4fzDNHg7KzLBIvObQXwmtsw61R69jQaHVDpM9NRvToXL0zQyIn90P00E
	 oQO+2YS4H9vfYis0ZoNZRWeA6LJpss2UCdCDRBzU=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250821095049eucas1p19e5b485fe044f78c1cfcb62b720fd974~dv2Ao05Ph2463024630eucas1p1e;
	Thu, 21 Aug 2025 09:50:49 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250821095048eusmtip104d6456e3cae6213f4fc65d90468cf00~dv1-pHhmh0661206612eusmtip1s;
	Thu, 21 Aug 2025 09:50:48 +0000 (GMT)
Message-ID: <d5c31ec9-84c1-45ea-8c0d-aba78ebd6481@samsung.com>
Date: Thu, 21 Aug 2025 11:50:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/8] drm: verisilicon: add a driver for Verisilicon
 display controllers
To: Maud Spierings <maud_spierings@hotmail.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <AM7P189MB10098641C0B58ACFA3502A03E332A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
X-CMS-MailID: 20250821095049eucas1p19e5b485fe044f78c1cfcb62b720fd974
X-Msg-Generator: CA
X-RootMTR: 20250821093817eucas1p1d1f41f99c9fcf800c8230fb5795ad1d1
X-EPHeader: CA
X-CMS-RootMailID: 20250821093817eucas1p1d1f41f99c9fcf800c8230fb5795ad1d1
References: <4e6d1a0f-4270-4d25-86c5-e4ec3721c451@samsung.com>
	<CGME20250821093817eucas1p1d1f41f99c9fcf800c8230fb5795ad1d1@eucas1p1.samsung.com>
	<AM7P189MB10098641C0B58ACFA3502A03E332A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_025055_649574_98E00209 
X-CRM114-Status: GOOD (  17.62  )
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
Cc: fustini@kernel.org, heiko@sntech.de, dri-devel@lists.freedesktop.org, guoren@kernel.org, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, linux-riscv@lists.infradead.org, airlied@gmail.com, ziyao@disroot.org, simona@ffwll.ch, robh@kernel.org, rfoss@kernel.org, jernej.skrabec@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, tzimmermann@suse.de, jonas@kwiboo.se, maarten.lankhorst@linux.intel.com, mripard@kernel.org, neil.armstrong@linaro.org, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, rabenda.cn@gmail.com, krzk+dt@kernel.org, wefu@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 8/21/25 11:38, Maud Spierings wrote:
>> So I am trying to make it work on JH7110 as well, and here is the
>> problem:
>>
>> [    5.564433] ------------[ cut here ]------------                                                                                                                                           [    5.569161] refcount_t: addition on 0; use-after-free.                                                                                                                                     [    5.574485] WARNING: CPU: 2 PID: 71 at lib/refcount.c:25 refcount_warn_saturate+0x110/0x162                                                                                                [    5.574537] Modules linked in:                                                                                                                                                             [    5.574560] CPU: 2 UID: 0 PID: 71 Comm: kworker/u17:2 Not tainted 6.17.0-rc1-g60ec647ec20c-dirty #77 NONE                                                                                  [    5.574596] Hardware name: StarFive
>> VisionFive 2 v1.2A (DT)                                                                                                                                [    5.574613] Workqueue: events_unbound deferred_probe_work_func                                                                                                                             [    5.574654] epc : refcount_warn_saturate+0x110/0x162                                                                                                                                       [    5.574682]  ra : refcount_warn_saturate+0x110/0x162                                                                                                                                       [    5.574710] epc : ffffffff81336608 ra : ffffffff81336608 sp : ffffffc6006e7530                                                                                                             [    5.574732]  gp : ffffffff8514c1c0 tp : ffffffd6c14ba580 t0 :
>> ffffffc6006e7134                                                                                                             [    5.574753]  t1 : fffffffef0a29898 t2 : 5f746e756f636665 s0 : ffffffc6006e7550                                                                                                             [    5.574774]  s1 : ffffffff83c058a8 a0 : 000000000000002a a1 : 0000000000000004                                                                                                             [    5.574794]  a2 : 0000000000000000 a3 : ffffffff801ef586 a4 : 0000000000000000                                                                                                             [    5.574813]  a5 : 0000000000000000 a6 : fffffffef0a29899 a7 : 0000000000000003                                                                                                             [    5.574833]  s2 : ffffffd6c35e68e8 s3 : ffffffd6c35e6990 s4 :
>> ffffffd6c33dc008                                                                                                             [    5.574854]  s5 : 0000000000000000 s6 : 1ffffffad867b801 s7 : 0000000000000000                                                                                                             [    5.574873]  s8 : ffffffd6c35e6990 s9 : 0000000000000000 s10: ffffffd6c3099058                                                                                                             [    5.574894]  s11: 1ffffffad861320b t3 : 1ffffff8c00dce34 t4 : fffffffef0a29898                                                                                                             [    5.574915]  t5 : fffffffef0a29899 t6 : ffffffc6006e6f38                                                                                                                                   [    5.574933] status: 0000000200000120 badaddr: 0000000000000000 cause:
>> 0000000000000003                                                                                                     [    5.574952] [<ffffffff81336608>] refcount_warn_saturate+0x110/0x162                                                                                                                        [    5.574985] [<ffffffff8193a506>] drm_bridge_get+0x66/0x6e                                                                                                                                  [    5.575022] [<ffffffff8001f26e>] drm_bridge_attach+0x54/0x5a2                                                                                                                              [    5.575055] [<ffffffff8002740e>] vs_bridge_init+0x3bc/0x4ba                                                                                                                                [    5.575087] [<ffffffff82313026>]
>> vs_drm_initialize+0xe0/0x2f2                                                                                                                              [    5.575126] [<ffffffff80027ca4>] vs_dc_probe+0x758/0x85c                                                                                                                                   [    5.575156] [<ffffffff8233123c>] platform_probe+0xac/0x138                                                                                                                                 [    5.575186] [<ffffffff8232b2a8>] really_probe+0x164/0x59e                                                                                                                                  [    5.575221] [<ffffffff8232b818>] __driver_probe_device+0x136/0x266
>> [    5.575257] [<ffffffff8232bb18>] driver_probe_device+0x56/0x214
>> [    5.575292] [<ffffffff8232bdf0>] __device_attach_driver+0x11a/0x278
>> [    5.575329] [<ffffffff823272d8>] bus_for_each_drv+0xea/0x16e
>> [    5.575363] [<ffffffff8232c680>] __device_attach+0x160/0x2d4
>> [    5.575398] [<ffffffff8232ca06>] device_initial_probe+0xe/0x16
>> [    5.575434] [<ffffffff823291d8>] bus_probe_device+0xfe/0x134
>> [    5.575468] [<ffffffff82329c62>] deferred_probe_work_func+0x128/0x1d6
>> [    5.575503] [<ffffffff80126aae>] process_one_work+0x5c0/0xe76
>> [    5.575543] [<ffffffff80129da6>] worker_thread+0x6d4/0x1316
>> [    5.575572] [<ffffffff801429ce>] kthread+0x29a/0x570
>> [    5.575608] [<ffffffff8004693e>] ret_from_fork_kernel+0x10/0x9a
>> [    5.575643] [<ffffffff835f55f6>] ret_from_fork_kernel_asm+0x16/0x18
>> [    5.575682] ---[ end trace 0000000000000000 ]---
>>
>>
>> When a bridge is allocated with kzalloc, its kref count is initialized
>> to zero. The drm_bridge_attach() function then calls drm_bridge_get() on
>> this bridge, which sees the zero refcount and triggers a use-after-free
>> warning because it assumes the object has already been freed.
>>
>> To fix this, the bridge's refcount must be initialized with kref_init()
>> after allocation and before it's attached.
> 
> Do you have a tree I can look at? I am very interested in getting this working on the jh7110. looked at it myself a week ago, but got lost quite quickly. If you end up upstreaming it I will definetly be there to test it.

I first started working od getting the Keith version working and have
the 'old' tree here [1]. It works with older version of the DC driver.

[1] - https://github.com/mwilczy/linux/commits/dpu_Aug_9_2/

So the above version works, however the display was 'purple-ish', colors
were skewed. I shared the image in the 'Mainline Linux for RISC-V'
telegram chat.

For the current version from Icenowy it's still a bit messy to share
however it includes addition to inno-hdmi driver to make it works a bit
more like dw-hdmi currently - introduce a probe function, not just
bind, so it doesn't use component framework. Plus changes to
clocks/resets that were discussed.

> 
> Did you actually manage to get display out over hdmi? The hdmi output from last years starfive driver gave me some strange output issues that I'm currently just living with, but would love to see it gone.
> 

On the current version of the DC driver I'm still working on it.

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
