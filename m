Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09724C021B2
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Feb 2025 10:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8fKkzy3WYM82dldwuf1kumAab6Q8cGmwEjIqe8p6XNI=; b=w7u1dFp2v98Y82
	/AIoVxV20MLbQcZk7AX4n+fFI5N5dsahXGbaiiux/nuu0/rliDaWP9kRdvGO3oppXsJMdX9Uikksn
	+MKJWeI7g/FlhG5rLP5RtvLYSVfbU5D7L/1Y6oA0iJ5/aTua9HYXSsjv03WRUNaXDGKDdPvB4WKIp
	WFN7NiZv3fjkf8kgo5wJSw3lcP97RrJbKnGvrk28mtpm8+a+6A2PX6YmZnEp+/iHENjFaU7cyNDGI
	fKbFfCZIe/FY+8mM8x/JVT7QqLmw502Z+cT21f5T8f9qCIp+MNzwrLCT19kwcy1HECVDVnT6BTmlf
	y28ZNjV8G41hv1DQjlrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tln8F-00000007rB5-1S5r;
	Sat, 22 Feb 2025 10:53:15 +0000
Received: from bayard.4d2.org ([5.78.89.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tln3t-00000007qhF-2rvk
	for linux-riscv@lists.infradead.org;
	Sat, 22 Feb 2025 10:48:47 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 9C190122FE22;
	Sat, 22 Feb 2025 02:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1740221322; bh=K6Nyh2RaPue8OIU5uYXZtZdm/qdGvXvMpPEc6QdZmgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HzjEUkHqYogZ4w4yPtviWueYx3hvNn9UNpccS9i/tP9tyGV1Z4Qww4PGQxXBhYLmn
	 OuFgUUK7Tr3rTe9gF7sYohMdKKmUZoqQNn25sxgGu8kLYsaoRj2A7YYOFXErvmJUfF
	 AQbUm+Ory1Et5e/yiqd2y+eIZOe+ZloZsNqAEiELT/myB/Ze8bKM9kl9IkZhdY1wQg
	 jdv5p0krxErHwv8215mOwWfAP/p8co//eXlbtH1H2ecY9XuI3O0WnLAffPiJOal3MA
	 WHErU5lEI0Mu8qH77YSYQ0O1vja2q+lF9heApJY1FjZDt2DkiF21iVsHelrWtq48DY
	 SoZIfYI1NO9Zg==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iDt5bERNoadS; Sat, 22 Feb 2025 02:48:36 -0800 (PST)
Received: from ketchup (unknown [183.217.80.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 197FE122FE21;
	Sat, 22 Feb 2025 02:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1740221316; bh=K6Nyh2RaPue8OIU5uYXZtZdm/qdGvXvMpPEc6QdZmgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0xpAi6Of6hQKz9iujbvRVBr3slZR+xJVJAu0zPYmyLnY7SzjI1s7DSDt7gOjoGho7
	 YDJiMQZoRd/yVZQeHZhFeY8PuDcK8bhtqjE3IU6NoYh3Cz42WuhCFxIi+Bv10Ace1l
	 hw5MxLUb3rm9RWOd3WL8bZ5Rxe2OM4F+1x9mb5iyCVN5iyjkNe/JqoRYgA3sQ0I1dR
	 2cwbR/RHg/w5We67fqS3fkxegj2WMvyNzEYGWuEf3od5VzhTe0tSrqxFSwYaAul6Jn
	 jKzbI9RjkJsfrtrvzdtX9xIvutwypw/i6w8XGuimC7ey7T7oi2rG8R808ZbKR2GFXi
	 lxTxErqCfPQ6w==
Date: Sat, 22 Feb 2025 10:48:22 +0000
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
Message-ID: <Z7mrdrACFp3m-7sy@ketchup>
References: <20250103215636.19967-2-heylenay@4d2.org>
 <20250103215636.19967-4-heylenay@4d2.org>
 <aw2vqnz5vcccqqvrrhz5tgawj7fnzzg3tds7nnepuorit37a7r@jcj3wrs7d73h>
 <Z6rdBhQ7s2ReOgBL@ketchup>
 <19e5129b-8423-4660-8e4f-8b898214d275@kernel.org>
 <Z63T_EDvXiuRQbvb@ketchup>
 <2ab715bd-e26c-41bb-ac64-baa864d90414@kernel.org>
 <Z7BTVu10EKHMqOnJ@ketchup>
 <7c697e9a-d6d9-4672-9738-93ce3a71beb6@riscstar.com>
 <4f7bf109-bf18-42be-971c-5d5edd9595b5@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4f7bf109-bf18-42be-971c-5d5edd9595b5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_024846_031238_D9268006 
X-CRM114-Status: GOOD (  36.68  )
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

On Sat, Feb 22, 2025 at 10:59:09AM +0100, Krzysztof Kozlowski wrote:
> On 22/02/2025 00:40, Alex Elder wrote:
> > I have a general proposal on how to represent this, but I'd
> > like to know whether it makes sense.  It might be what Krzysztof
> > is suggesting, but in any case, I hope this representation would
> > work, because it could simplify the code, and compartmentalizes
> > things.
> > 
> > Part of what motivates this is that I've been looking at the
> > downstream reset code this week.  It contains a large number of
> > register offset definitions identical to what's used for the
> > clock driver.  The reset driver uses exactly the same registers
> > as the clock driver does.  Downstream they are separate drivers,
> > but the clock driver exports a shared spinlock for both drivers
> > to use.
> > 
> > These really need to be incorporated into the same driver for
> > upstream.
> 
> Why? First, it is not related to the topic here at all. You can design
> drivers as you wish and still nothing to do with discussion about binding.
> Second, different subsystems justify different drivers and Linux handles
> this well already. No need for custom spinlock - regmap already does it.
> 
> 
> > 
> > The clock code defines four distinct "units" (a term I'll use
> > from here on; there might be a better name):
> >    MPMU  Main Power Management Unit
> >    APMU  Application Power Management Unit
> >    APBC  APB Clock
> >    APBS  APB Spare
> > 
> > The reset code defines some of those, but doesn't use APBS.
> > It also defines three more:
> >    APBC2 Another APB Clock
> >    RCPU  Real-time CPU?
> >    RCPU2 Another Real-time CPU
> > 
> > Each of these "units" has a distinct I/O memory region that
> > contains registers that manage the clocks and reset signals.
> 
> So there are children - mpmu, apmu, apbclock, apbspare, apbclock2, rcpu
> 1+2? But previous statements were saying these are intermixed?
> 
> " I'll make APMU/MPMU act as a whole device"

My reply seems somehow misleading. The statement means I will merge the
children with the syscon into one devicetree node, which applies for
both APMU and MPMU. I wasn't going to say that APMU and MPMU are
intermixed.

As Alex said, all these units have their own distinct and separate MMIO
regions.

> > 
> > I suggest a single "k1-clocks" device be created, which has
> 
> For four devices? Or for one device?

By Alex's example, I think he means a device node taking all these
distinct MMIO regions as resource.

	clock {
		compatible = "spacemit,k1-clocks";

		reg = <0x0 0xc0880000 0x0 0x2050>,
		      <0x0 0xc0888000 0x0 0x30>,
		      <0x0 0xd4015000 0x0 0x1000>,
		      <0x0 0xd4050000 0x0 0x209c>,
		      <0x0 0xd4090000 0x0 0x1000>,
		      <0x0 0xd4282800 0x0 0x400>,
		      <0x0 0xf0610000 0x0 0x20>;
		reg-names = "rcpu",
			    "rcpu2",
			    "apbc",
			    "mpmu",
			    "apbs",
			    "apmu",
			    "apbc2";

		/* ... */
	};

> No, it's again going to wrong direction. I already said:
> 
> "You need to define what is the device here. Don't create fake nodes ust
> for your drivers. If registers are interleaved and manual says "this is
> block APMU/MPMU" then you have one device, so one node with 'reg'."
> 
> So what is the device here? Can you people actually answer?
> 

I'm not sure about the apbc2, rcpu and rcpu2 regions; they aren't
related to the thread, either. For APBC, MPMU, APBS and APMU, I'm pretty
sure they're standalone blocks with distinct and separate MMIO regions,
this could be confirmed by the address mapping[1].

> 
> > access to all of the I/O address ranges.  And then within
> > the DT node for that device there is a sub-node for the
> 
> Uh, confusing. You said there is one device for all the clocks, so if
> there is one device so also one device node. No children.
> 
> Maybe you have more devices but none of you is explaining the hardware
> that way. Mixing talk about drivers is really not helping.
> 
>
> 
> 
> Best regards,
> Krzysztof

Best regards,
Haylen Chu

[1]: https://developer.spacemit.com/documentation?token=LzJyw97BCipK1dkUygrcbT0NnMg

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
