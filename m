Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B52CCFA18
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 15:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b9PKFaJd+A96P2lMp23KtEj0kwpCcObuUw83E+jXfTM=; b=2UvpI5jmG5tpcM
	IozeQzrD7nKlzM//SJdBGKrPV6nV1w2LB+P+PiZlKSM3tckAftgYcdxvNxbAMVMGcTY+iaHkE3Tal
	SNf7Go824bcHtomC9LVnvUn3TZSUD9LzfaukkMBwL2bEEN2NP6fqQKTRXJGgjvZlXxgrIpatA100H
	nvymU1Sy4l5unSYZEMu9tcFqLsZz1KIOZvKBRS65Y8Tvi0rej4hToYFvCGKs9G0tT2KdR65sX0pbR
	5f8JeAGn/MzMJLdZBxUCdgUoo3A/BAAPU0Rgyno7l0KvO+51sgdibTGoxWT3OQdasCVXL2iWQko5r
	tXg2yd3GBkvajnsxmdHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIqNL-00000007O14-0uH7;
	Tue, 11 Nov 2025 15:33:43 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIqNG-00000007Nz9-10wO;
	Tue, 11 Nov 2025 15:33:41 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251111153330euoutp017494b02d40dededb563d4b1ef58097a0~2-aoKSf6x0077200772euoutp01-;
	Tue, 11 Nov 2025 15:33:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251111153330euoutp017494b02d40dededb563d4b1ef58097a0~2-aoKSf6x0077200772euoutp01-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1762875210;
	bh=sloWl4MVPqNxu4Lal6cMW3w9aEbG/4Pt1qYZPePhrtE=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Kfe+2Ek/w+bUpLwTygBNEWcXj2/9RpeCAYPlT7bjoq9HA70uytTNDmVDA9tYZm8xn
	 PjfXlhu7atr5sek/dPX6o47ChghH0J8IS0BtsFXtYrpuN/fnnz0AbmKOzh7YLkYBX9
	 OkTday6AnTVrcPFQljKo3ZyNeUQFXkvGD25BUqsQ=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251111153330eucas1p213a4f040efad6ebe0add9670332c93b9~2-anlypPk2653326533eucas1p2R;
	Tue, 11 Nov 2025 15:33:30 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251111153328eusmtip2a21c5725c16f8d6a9d517389e448b5f7~2-amHRvql2096320963eusmtip2G;
	Tue, 11 Nov 2025 15:33:28 +0000 (GMT)
Message-ID: <00e897dc-9966-439b-a74a-7604a1870027@samsung.com>
Date: Tue, 11 Nov 2025 16:33:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/13] drm: starfive: jh7110: Enable display
 subsystem
To: Conor Dooley <conor@kernel.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20251110-clang-baking-b8b27730356e@spud>
X-CMS-MailID: 20251111153330eucas1p213a4f040efad6ebe0add9670332c93b9
X-Msg-Generator: CA
X-RootMTR: 20251108010451eucas1p1c7bf340dbd2b1b7cbfb53d6debce7a2e
X-EPHeader: CA
X-CMS-RootMailID: 20251108010451eucas1p1c7bf340dbd2b1b7cbfb53d6debce7a2e
References: <CGME20251108010451eucas1p1c7bf340dbd2b1b7cbfb53d6debce7a2e@eucas1p1.samsung.com>
	<20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
	<20251110-clang-baking-b8b27730356e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_073339_649115_FB6BDDBC 
X-CRM114-Status: GOOD (  21.53  )
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Lee Jones <lee@kernel.org>, Andy Yan <andyshrk@163.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Hal Feng <hal.feng@starfivetech.com>, Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Xingyu Wu <xingyu.wu@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, Maud Spierings <maudspierings@gocontroll.com>, Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Zimmermann <tzimmermann@suse.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 11/10/25 20:35, Conor Dooley wrote:
> On Sat, Nov 08, 2025 at 02:04:34AM +0100, Michal Wilczynski wrote:
>> This series enables the display subsystem on the StarFive JH7110 SoC.
>> This hardware has a complex set of dependencies that this series aims to
>> solve.
>>
>> I believe this is a PHY tuning issue that can be fixed in the new
>> phy-jh7110-inno-hdmi.c driver without changing the overall architecture.
>> I plan to continue debugging these modes and will submit follow up fixes
>> as needed.
>>
>> The core architectural plumbing is sound and ready for review.
>>
>> Notes:
>> - The JH7110 does not have a centralized MAINTAINERS entry like the
>>   TH1520, and driver maintainership seems fragmented. I have therefore
>>   added a MAINTAINERS entry for the display subsystem and am willing to
>>   help with its maintenance.
> 
> Yeah, bunch of different folks wrote the drivers, so lots of entries.
> Pretty much all as you've done here, authors are responsible for the
> individual components and Emil is the platform maintainer but
> responsible for most drivers.
> 
> Do you need any feedback dt wise on the RFC, or is it too likely that
> we'll both waste our breath if the DRM folks don't approve of your
> approach for the rest of this series?

Hi Conor,

Thank you for your response.

That's a fair point about the risk of the DRM approach being rejected.
While I can't be certain, I'm hopeful that part is relatively
straightforward, as it primarily integrates other recently reviewed
(though not yet merged) components like the inno-hdmi bridge and dc8200
drivers.

To be honest, I was more concerned that the DT part of the series would
be more problematic. Given that, I would find it very helpful to get
your feedback on the DT aspects now, if you have the time.

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
