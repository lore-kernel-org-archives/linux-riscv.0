Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6365AC43327
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 08:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m6j0Pa5jDg8a+QwmF4LUkoNAh5ivoTFhZnKLeHm6Hkw=; b=KRIDOqSIQITUvr
	YRr05muB1KSa8AlHCps5HMnj8z5t8Pp28squ8tgsYZ2+MleS39m7yRdWxprrHuoWXioNGaopxIb7f
	/PannnUjceKWwsZZ5u9/OigPorGlaQOrVH9AQhWsabiXf5hbqZfkBsItpcOJFJYprrBWjopW1miR1
	abl6riT2HSGwkajjgdCJV90p5e/OlJjns+ioxKMCDXL1eIFiG973KjsKqjiUpPc+f/zxV2Yu4Mbdm
	k2hg0O6e0i13gTGUIkD9SEO6rIIoEKE0Kq0ZedlY8QVwWbhZ/C8K/MxROWRXbl4eADxD8MckUJwy6
	x/Xt5aFkGiG5o3bOYjGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDEl-00000003vzh-3wRi;
	Thu, 02 Jul 2026 08:57:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDEj-00000003vyH-0HD8;
	Thu, 02 Jul 2026 08:57:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FF42288E;
	Thu,  2 Jul 2026 01:57:25 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6EFFB3F905;
	Thu,  2 Jul 2026 01:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782982649; bh=MSbq6+W3UnipbgRe5OqNXC2h5o+vLMVg75Y2ERCCqF4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vxlIj29X8SyZB1IgbyT7B2lCW/p+J0QTyfWT5aKusya9JNXJDD72C2MXt0nB1jJBq
	 L6w4cZPCwWj8mcv6ihhP+P0n5CwUEWYj6xE0SdD0s6CHqhEAm7j1wIRANnMYUKvYbY
	 gChO0ak5hCTtvm8wzYEpFjegAHoefiu3EimrD+Us=
Message-ID: <17e411b5-f025-4c72-90a7-5bdd5971654c@arm.com>
Date: Thu, 2 Jul 2026 10:57:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/8] clk: sunxi-ng: Add support for Allwinner A733 CCU
 and PRCM
To: Enzo Adriano <enzo.adriano.code@gmail.com>,
 Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org
References: <20260310-a733-clk-v1-0-36b4e9b24457@pigmoral.tech>
 <20260701160055.320000-a733-ccu-status-enzo.adriano.code@gmail.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260701160055.320000-a733-ccu-status-enzo.adriano.code@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_015733_149153_B8D71B74 
X-CRM114-Status: GOOD (  18.84  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Enzo,

On 7/1/26 18:07, Enzo Adriano wrote:
> Hi Junhui,
> 
> Thanks for the A733 CCU/PRCM RFC v1. I've been reading through the
> series and the review feedback, including the NSI clock/reset handling,
> the binding naming and ordering comments, the SDM macro cleanup, and the
> question around modeled but otherwise-unused clocks such as the GIC clock.

that's great, but please tell the list, by replying to the respective 
patches. There are still a few patches left that haven't been checked 
against the manual or otherwise reviewed. I will probably do this at 
some point in time, but we could use any help here.
You don't need to be an expert for this: just comparing the numbers in 
the struct (register offsets and bit positions) against the manual is 
already very helpful, and can be done by most people, just with some 
endurance ;-)

Thanks,
Andre

> I do not see a v2 on the list yet, so I wanted to check in: are you still
> planning to take this series forward? No rush at all, and I am happy to
> leave it entirely with you if so.
> 
> If you have moved on to other things, I would be glad to help carry the
> series forward and address the review comments, keeping your authorship
> and prior work intact. I have A733 hardware here and can help test the
> changes.
> 
> Either way, please let me know what works best for you.
> 
> Thanks,
> Enzo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
