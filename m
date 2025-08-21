Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C128CA0EEB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 03:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xw86paDHnsqQG335fHSwVPLwHCz7iy0WNui/J4iWAOw=; b=I5VgqWg7b5ZDpq
	U8H0/pXcedmk2IVAs3Fy6Siy9+sq9Uaf5E6xfB4G/HTtCqfk+8VQb0zL83vtKQB1gYAYJiOWUhRiF
	fb8FEnvT+kqcL8mmHDOJv0rmu48VqvCzlKBgA5WKut2jtmrJR3MqnHyNlME+HZ482ifFYmHMQnEOv
	nf5XqjhPx4k1pRud2sZj+hzjuP8OXTSSa06T/DUh/5Cw9oWhKcP9+fCx0LN0fmIDn6NEKjaRgIKt0
	VKcUBcEPsYODAsZQ6bzAcp2y0MM08LhGpoxUf5adXY2kzX4BFYQGdQT8LyJHZlLCKNWj1qQcrar6I
	QvJrkd8J8WmIzmT35dJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIWa-00000001Oa0-2Zuj;
	Fri, 22 Aug 2025 03:33:08 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDN9-00000000i2R-3Y8X
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 22:03:06 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250821220257euoutp0196ead7333121a1cc0e1b89cd8a7f6eab~d51QEuwXH0465004650euoutp01D
	for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 22:02:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250821220257euoutp0196ead7333121a1cc0e1b89cd8a7f6eab~d51QEuwXH0465004650euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755813777;
	bh=FhMuLkPlqfOoY3HIjX51+kKhFnIWCP0l9JSXpliABCM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=JA7/0yvQ9bCoZF7Gao2nrxDRcUPghZ/NnCzteaYJ3z8KWW17iOhcIqkflQLcbCGke
	 JoSwhBZpTny62tt11p3bJesDP5T7I8CrHVkS9lnGecvQVVA1hEn14jVVuMhdXmZRhm
	 XzkOGQNI4ARvYpm/Vo/b+NXer98BSONe8U6Ucw6w=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250821220256eucas1p2c4854f72c98d23d6b8a6247712430482~d51OvRzKh0715107151eucas1p2U;
	Thu, 21 Aug 2025 22:02:56 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250821220255eusmtip12f604debb503f4c26d3d8ae003a6c9a1~d51Nw2j0p2648126481eusmtip1c;
	Thu, 21 Aug 2025 22:02:55 +0000 (GMT)
Message-ID: <1b7b1e78-e94c-4d5b-a023-61852d2f7951@samsung.com>
Date: Fri, 22 Aug 2025 00:02:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/4] drm/imagination: Use pwrseq for TH1520 GPU
 power management
To: Matt Coster <Matt.Coster@imgtec.com>, Ulf Hansson
	<ulf.hansson@linaro.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel
	<p.zabel@pengutronix.de>, Frank Binns <Frank.Binns@imgtec.com>, Maarten
	Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski
	<m.szyprowski@samsung.com>, Drew Fustini <fustini@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <27d70d29-9e37-4905-9d22-0266c8a290a2@imgtec.com>
X-CMS-MailID: 20250821220256eucas1p2c4854f72c98d23d6b8a6247712430482
X-Msg-Generator: CA
X-RootMTR: 20250820085609eucas1p2938d69999f4d7c9654d5d2a12a20c906
X-EPHeader: CA
X-CMS-RootMailID: 20250820085609eucas1p2938d69999f4d7c9654d5d2a12a20c906
References: <CGME20250820085609eucas1p2938d69999f4d7c9654d5d2a12a20c906@eucas1p2.samsung.com>
	<20250820-apr_14_for_sending-v12-0-4213ccefbd05@samsung.com>
	<20250820-apr_14_for_sending-v12-1-4213ccefbd05@samsung.com>
	<CAPDyKFqeOUwTbZEUFmHS2Onyj5LZ1b26vGgC4=UHUOxhwbzjRw@mail.gmail.com>
	<27d70d29-9e37-4905-9d22-0266c8a290a2@imgtec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_150304_485565_01985FCB 
X-CRM114-Status: GOOD (  14.64  )
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



On 8/21/25 11:02, Matt Coster wrote:
> On 20/08/2025 18:08, Ulf Hansson wrote:
>> On Wed, 20 Aug 2025 at 10:56, Michal Wilczynski
>>> +#endif /* IS_ENABLED(CONFIG_POWER_SEQUENCING) */
>>
>> Yeah, this looks really messy to me.
>>
>> If there is something missing in the pwrseq interface to make this
>> simpler, let's add that instead of having to keep this if/def hacks
>> around.
> 
> Agreed (now that I've actually done my homework), I see no reason to
> keep the IS_ENABLED(...) checks around.
> 
> Cheers,
> Matt

Thank you both for the feedback, I haven't noticed that there are stubs
already. Will re-roll the patchset.

> 
>>
>> [...]
>>
>> Other than the if/def hacks, I think this looks good to me!
>>
>> Kind regards
>> Uffe
> 
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
