Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFD8C021A4
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 10:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ov3YUQPH0Rdqb8dtcgirEcKPIOcjA0gCFIHctquAVHs=; b=Cii5hinactMPpa
	aYz1ySfu9jTHJ+mmhsi3Xt9hi83Iu3YG5l1IkueHDASAFaxHT9QfTgeIxpEnpvPMIciKRkj5gfQAK
	ThNzF8A1iAvPXquivqWHzMyhRRm7lhnDMz8C9rW/qjjH8rH0BqLRVzWWbHFFzCe1ae2JmEDanr8f7
	dpmkuD1XGiy0wb+1vL5WF91v3qvbSwQWeXsGVTA2RNfXN56nx1PsYtep3nMqqziG4kyo+WrJfaNt9
	+GpecSmkVCi+vvI3jO7fFkNqGJm0RxMCyo344DZthim6g3+7IOQDlIk5Mv1hQJnBpBcFhteaeoodi
	iRGFcALZWdqJA8ozokew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVcu-0000000D6tG-2cW6;
	Mon, 24 Feb 2025 10:23:52 +0000
Received: from bayard.4d2.org ([5.78.89.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVXF-0000000D5c0-32dp
	for linux-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 10:18:03 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 52D4D122FE23;
	Mon, 24 Feb 2025 02:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1740392276; bh=Lwv+SdLlgCCVTrLfdebdm1ZrgIaYP0UgzwvumboP/Ow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=niCjXbTievjPfp2HmOums4MrUOg/tOro7gx/TCt7XJ2cPvwaMrZykwcckHHr0zJuG
	 p9xSjwlq7D713ed9/6aXE4x6EDZ/ym1Z+pP7cVdK/zk1dRqMZjPbxnHAnRGtk3iotm
	 XAEkIJ0aQ/Qkfref1IT+bVBZZT0QbM7QCjp47jQXdoOvFjhUmqSYNbNEroo9E4MFV1
	 srPvEaBJ4dmpjRr5NJaaJazeMJREqJSZZILgGxjo/XY6fce5oAfHPdVVjLd08rSADt
	 cIog1Xr8aUwP6vVrE2pFBkQH1CM0xlFwVbmEDzo2T4PUeDFm3lafA1b9icW3CZr25S
	 BQ848tOhqzc+Q==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zq8oGhaoyk3h; Mon, 24 Feb 2025 02:17:54 -0800 (PST)
Received: from ketchup (unknown [183.217.80.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id D9D65122FE21;
	Mon, 24 Feb 2025 02:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1740392274; bh=Lwv+SdLlgCCVTrLfdebdm1ZrgIaYP0UgzwvumboP/Ow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UkjrEQilES+wAWOqAgIE+CWAGiRh2WE8Z77le9pWr5tgNy1pWWbTyvFrFuLig7CnF
	 dyklHRklhPKiGkBC4LE6uYN+Rl0kydApuUOx4z+Z7LJpzk2udQKSZbeIGhkNZwg0jy
	 9aDvewbfZHh8T4ZBHNmauBCB//kbGb41vZo9tvBDP8ob6o8J4J7cS/Q/o6GqPIP7Tk
	 DT5ea06zULyMSIjah2/ojuRxiDYZP9KzU6IgCNnGOpNy5JImavBQtP+Rl042DCMURl
	 qZyAc5btfGtkVngR4Qcf1rNwimx5rW5utOUyUm+S8G0DjcrYcxmmkpMkFs8No+GFT9
	 sBeXApdL2iOjQ==
Date: Mon, 24 Feb 2025 10:17:40 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Alex Elder <elder@riscstar.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Guodong Xu <guodong@riscstar.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: soc: spacemit: Add spacemit,k1-syscon
Message-ID: <Z7xHRAFE4-QEA6PO@ketchup>
References: <aw2vqnz5vcccqqvrrhz5tgawj7fnzzg3tds7nnepuorit37a7r@jcj3wrs7d73h>
 <Z6rdBhQ7s2ReOgBL@ketchup>
 <19e5129b-8423-4660-8e4f-8b898214d275@kernel.org>
 <Z63T_EDvXiuRQbvb@ketchup>
 <2ab715bd-e26c-41bb-ac64-baa864d90414@kernel.org>
 <Z7BTVu10EKHMqOnJ@ketchup>
 <7c697e9a-d6d9-4672-9738-93ce3a71beb6@riscstar.com>
 <4f7bf109-bf18-42be-971c-5d5edd9595b5@kernel.org>
 <Z7mrdrACFp3m-7sy@ketchup>
 <6ea8ac17-42c8-46fa-b970-77ba89de66c4@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ea8ac17-42c8-46fa-b970-77ba89de66c4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_021802_097526_69A53A08 
X-CRM114-Status: GOOD (  40.23  )
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

On Sat, Feb 22, 2025 at 12:50:13PM +0100, Krzysztof Kozlowski wrote:
> On 22/02/2025 11:48, Haylen Chu wrote:
> > On Sat, Feb 22, 2025 at 10:59:09AM +0100, Krzysztof Kozlowski wrote:
> >> On 22/02/2025 00:40, Alex Elder wrote:
> >>> I have a general proposal on how to represent this, but I'd
> >>> like to know whether it makes sense.  It might be what Krzysztof
> >>> is suggesting, but in any case, I hope this representation would
> >>> work, because it could simplify the code, and compartmentalizes
> >>> things.
> >>>
> >>> Part of what motivates this is that I've been looking at the
> >>> downstream reset code this week.  It contains a large number of
> >>> register offset definitions identical to what's used for the
> >>> clock driver.  The reset driver uses exactly the same registers
> >>> as the clock driver does.  Downstream they are separate drivers,
> >>> but the clock driver exports a shared spinlock for both drivers
> >>> to use.
> >>>
> >>> These really need to be incorporated into the same driver for
> >>> upstream.
> >>
> >> Why? First, it is not related to the topic here at all. You can design
> >> drivers as you wish and still nothing to do with discussion about binding.
> >> Second, different subsystems justify different drivers and Linux handles
> >> this well already. No need for custom spinlock - regmap already does it.
> >>
> >>
> >>>
> >>> The clock code defines four distinct "units" (a term I'll use
> >>> from here on; there might be a better name):
> >>>    MPMU  Main Power Management Unit
> >>>    APMU  Application Power Management Unit
> >>>    APBC  APB Clock
> >>>    APBS  APB Spare
> >>>
> >>> The reset code defines some of those, but doesn't use APBS.
> >>> It also defines three more:
> >>>    APBC2 Another APB Clock
> >>>    RCPU  Real-time CPU?
> >>>    RCPU2 Another Real-time CPU
> >>>
> >>> Each of these "units" has a distinct I/O memory region that
> >>> contains registers that manage the clocks and reset signals.
> >>
> >> So there are children - mpmu, apmu, apbclock, apbspare, apbclock2, rcpu
> >> 1+2? But previous statements were saying these are intermixed?
> >>
> >> " I'll make APMU/MPMU act as a whole device"
> > 
> > My reply seems somehow misleading. The statement means I will merge the
> > children with the syscon into one devicetree node, which applies for
> > both APMU and MPMU. I wasn't going to say that APMU and MPMU are
> > intermixed.
> > 
> > As Alex said, all these units have their own distinct and separate MMIO
> > regions.
> > 
> >>>
> >>> I suggest a single "k1-clocks" device be created, which has
> >>
> >> For four devices? Or for one device?
> > 
> > By Alex's example, I think he means a device node taking all these
> > distinct MMIO regions as resource.
> 
> 
> You still do not answer about the hardware: how many devices is there?

In my understanding, the series covers four devices, APBC, APMU, MPMU
and APBS, each comes with its separate MMIO region and is clearly
described in the datasheet. I stated this in the later part of the
reply,

> > For APBC, MPMU, APBS and APMU, I'm pretty
> > sure they're standalone blocks with distinct and separate MMIO regions,
> > this could be confirmed by the address mapping[1].

Thus I don't agree on Alex's solution, since it creates fake devices not
mentioned by the datasheet (spacemit,k1-clocks and all its children in
the example devicetree).

> > 
> > 	clock {
> > 		compatible = "spacemit,k1-clocks";
> > 
> > 		reg = <0x0 0xc0880000 0x0 0x2050>,
> > 		      <0x0 0xc0888000 0x0 0x30>,
> > 		      <0x0 0xd4015000 0x0 0x1000>,
> > 		      <0x0 0xd4050000 0x0 0x209c>,
> > 		      <0x0 0xd4090000 0x0 0x1000>,
> > 		      <0x0 0xd4282800 0x0 0x400>,
> > 		      <0x0 0xf0610000 0x0 0x20>;
> > 		reg-names = "rcpu",
> > 			    "rcpu2",
> > 			    "apbc",
> > 			    "mpmu",
> > 			    "apbs",
> > 			    "apmu",
> > 			    "apbc2";
> > 
> > 		/* ... */
> > 	};
> > 
> >> No, it's again going to wrong direction. I already said:
> >>
> >> "You need to define what is the device here. Don't create fake nodes ust
> >> for your drivers. If registers are interleaved and manual says "this is
> >> block APMU/MPMU" then you have one device, so one node with 'reg'."
> >>
> >> So what is the device here? Can you people actually answer?
> >>
> > 
> > I'm not sure about the apbc2, rcpu and rcpu2 regions; they aren't
> > related to the thread, either. For APBC, MPMU, APBS and APMU, I'm pretty
> > sure they're standalone blocks with distinct and separate MMIO regions,
> > this could be confirmed by the address mapping[1].
> 
> They were brought here to discuss for some reason. Long discussions,
> long emails, unrelated topics like hardware or different devices - all
> this is not making it easier for me to understand.
>
> Best regards,
> Krzysztof

By the way, I made a summary on the hardware covered by this series in
one of my earlier reply[1]. Could you please comment further on my
proposal[2] according it, or pointing out anything that's unclear or
missing? It will be helpful for things to improve.

Thanks,
Haylen Chu

[1]: https://lore.kernel.org/all/Z7m2oNXbwJ06KtLQ@ketchup/
[2]: https://lore.kernel.org/all/Z7BTVu10EKHMqOnJ@ketchup/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
