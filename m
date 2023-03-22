Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AB2C6FD1C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 23:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z5e0VsV5DVCLKXX3GJqc/IfjbPwxkfgPaXFsuByXp/0=; b=m6CDXDZuFTAdkv
	R2MHW3Tq7UiKaOhYwp4ZJQeocdY5GgacaH0kajxbq0IO3F0jVrxtbh+gqX4Hs7XSCSmSIvSYcXwuV
	HhoDZ9AUq4jKO/eXuHyy7yd/oqWP9KnAiYqk4NFA6XG0c7lcVh5PjFOWwf/veJogWpXfefJPlNYJX
	RaPpEOfAJn5jX6P2FF4yV5jOb4a3NRh6DBe9uKZGwmvQtuUKJNwXIvr8RsZZv72VivN60mjOrWj2z
	A/qmy9nCfwE7Hg+HH+n5Lt9fsIKEwgnLg11Z2ag2GqgdDvs0JQ2vjfZvOXUSUGZrUoVpdVvGiEmkh
	wEeiMVfP1HbP2dT0Wvhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf8Gn-000E8B-1g;
	Wed, 22 Mar 2023 23:53:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf8Gk-000E7f-2E
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 23:53:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D70C062350;
	Wed, 22 Mar 2023 23:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31160C433D2;
	Wed, 22 Mar 2023 23:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679529205;
	bh=YhNph/4ta8FbF44lEZUNxH84xxM4Dhb4EA5vqQ7GTfQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=sSnptT/fc40Ox/q2g5fz1FwiCmNlTFZnNMtInH8BwlwJkIyZ3sib8iVFGavpg1daB
	 +K5l0T0xbv/G+W5V10zAurN1MCmqqu0fZlWtAt2avoQvUU0y2gGad5y86QPaWanQ/g
	 ZkQuPkqESuVgsFZQx/xusZkyu1y0GhuyvlhRpbrUXd+wlZnTTDmiygF0hk+2rN0CbB
	 yV3r1P6Gvyoa/aESrcaCHhjSdp/f7Emmj5vxFYyZur26oRWrMG71suOK2H/1NlK4rq
	 bhZz6Tw2O87E+YWv3z85UofnPXMOFLCXVEM0/Y3NdBo9CR87BSVnYW5yIKbn96EIk/
	 d/i6t3gpxdKFQ==
Message-ID: <1abd70426bb69995e6bdf1194ede56eb.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <a6358a5f-bbfd-4a14-a828-a3c28f82709a@spud>
References: <20230320103750.60295-1-hal.feng@starfivetech.com> <95f11f7c-611f-49a9-97e8-0de89846e430@spud> <62b766cef78d95793af95f428693c359.sboyd@kernel.org> <a6358a5f-bbfd-4a14-a828-a3c28f82709a@spud>
Subject: Re: [PATCH v6 00/21] Basic clock, reset & device tree support for StarFive JH7110 RISC-V SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: Hal Feng <hal.feng@starfivetech.com>, kernel@esmil.dk, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-kernel@vger.kernel.org
To: Conor Dooley <conor@kernel.org>
Date: Wed, 22 Mar 2023 16:53:23 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_165326_770859_E6CFB37E 
X-CRM114-Status: GOOD (  17.92  )
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

Quoting Conor Dooley (2023-03-22 14:06:00)
> On Tue, Mar 21, 2023 at 04:57:52PM -0700, Stephen Boyd wrote:
> > Quoting Conor Dooley (2023-03-21 16:03:54)
> > > 
> > > If you're happy on the driver side of things, do you want to pick those
> > > patches up on top of the bindings and send a PR to Stephen?
> > 
> > This sounds fine to me. Let me know if you plan to send a PR with the
> > starfive clk bits.
> 
> Since it was off-list:
> Emil and I spoke about this briefly today at the weekly linux-riscv
> meeting, the upshot of which is that it is likely to be me, rather than
> him, sending you a PR as he's pretty busy at the moment.
> That said, Emil mentioned that he has some doubts as to whether the
> bindings are correct, and from taking a look - he's right, so there'll
> likely not be a PR just yet! I'll go leave a comment about that...
> 
> I've got no real desire to maintain these drivers going forward though,
> so perhaps Hal, or one of the other StarFive folks, can get themselves
> set up to send them to you going forwards?
> 

Sure, or I can apply them myself based on some branch you provide that
has the required header files. It doesn't really matter as long as I
know what's going on.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
