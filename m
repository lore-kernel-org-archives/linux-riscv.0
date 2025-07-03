Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D099C83F05
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Dw9sC7XNuDOXUzLHMg6sWNM6BX2TlCJmjjJKFpsoVaY=; b=pjhSUwc7PwmwP5tz2jo/Q9x4Pn
	AwiQ2pStBkWSObYT4NkW+sxQgfudHVkhWpzNZg/pfXNiLbYgIpBJLXUbjfHFUFhZ7r69apMN3gLxv
	U0q78we0rgMqIR0+kWktCgKm32MnRJ08TdgKCiZ6mwj0UrQy3dTLu3czw9Rl+pyiEUVC56uCUzM9U
	aiU/8I9WnQr0fhw/DY8aQ2p918vOJJc/3SUACGnXH31TLtLxZ79RtOsI7YWeRsO0uWIz7ySnWczaf
	YtoWJV1whZ8QvYD9k9GU7q1uEwCcNSIkYryteIkhFKbG61bIjAjpsAT29B/g+XK6NTbweq0eiHaCl
	YU8XMAow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQzo-0000000CTZo-0Bme;
	Thu, 03 Jul 2025 20:57:28 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLvP-0000000Bpt8-1T9K
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 15:32:37 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 2536BEC019E;
	Thu,  3 Jul 2025 11:32:32 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 03 Jul 2025 11:32:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751556752;
	 x=1751643152; bh=ew8V1Wt0zqQcHxxoIg5sNu57Yffvi4a5WQBGLVx8qhI=; b=
	TeUJR3HiGddMqqjV77VC9HGBhhaZ3k03dSlU7vhZd3VsPz2D/ehXYK9ligEVLJx5
	O3kD/7/KQbd4t0dOsPy0V56aHQcmg2TZ5nb3iKvI9WY368eyLnzQTDDqp9mh1hxE
	dHCCqWHiASU4A9hab6pDG9cR/CaOWm5aNT+IJPYjeEwpg1KaxoeoFXmtIPvbxYGN
	xw7fQfs008OMbtJF6izzV1omuM8Whk/Z+cetp7XFw7Pi/6sZRIxkfq9Ts7KgYLkn
	BuPO8Ae2Fes28kW8Dihcp1uBA3B0Sy+AxjLKxfF5q3HNeyV6OIWeDYjq/RHj92+0
	5/GU+zBGjDAzxzdLEIfrYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751556752; x=
	1751643152; bh=ew8V1Wt0zqQcHxxoIg5sNu57Yffvi4a5WQBGLVx8qhI=; b=S
	8hPrxeFaptSKvtsK3AQk0Jx9iOmD4i7WVRJ5Bbvv0Zyn8S83p1SiUUl82b/O6TK8
	r1yH6B66q17XGuj2vJX1xq6+IWC1C3vdLKhk3tj9EXUsNSrpDt9azhQgqCqaO13M
	VqOLv2ROgmvY5Ecr/HdYypsnR54Z2y3SSUneCNsmPbWJ6E92hOdAhxcHGbQk1wie
	vQ/Jjt+PVKKXZNkcy/mUe1ronZSCmK9F6EEAsi1iomkVT0rMOEIB2oy4k6DrZt+v
	fBYlST1sWsxbs249cTywKUlXbHktYDpdh/NjjEPfJz25CsscKQnbZ7bJ5JQw/E9G
	PCi67Fa05R1s0UDh/88dQ==
X-ME-Sender: <xms:jqJmaEMPSu9mK9t3v8ceuIc0c1sweaZh3Ca0np3Uc8ofDp2_Vn2MlQ>
    <xme:jqJmaK_N-N8C0rvvppZRNNmwERMxfQaiUW7NX1Ftf2Addwu-zN5B6PjlhVCUtnTG5
    DWhMSb_3HFkbgvlBTk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvtdeigecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepsggvnhejudejsegrnhguvghsthgvtghhrdgtohhmpdhrtghpthhtoh
    epthhimheitdelsegrnhguvghsthgvtghhrdgtohhmpdhrtghpthhtohepphhrrggshhgr
    khgrrhdrmhgrhhgruggvvhdqlhgrugdrrhhjsegsphdrrhgvnhgvshgrshdrtghomhdprh
    gtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhu
    segvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheprghlvgigsehghhhith
    hirdhfrhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheptghonhhorheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodguth
    eskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:jqJmaLQlbzw23tZap9l8GhAs0JzBTyEQZLGWYEzulH_bmtuHYuU6RQ>
    <xmx:jqJmaMsxBrbRxBt_iARNlMFV-BSW1qoKljFXXwWAyCmAsgvZODfH_Q>
    <xmx:jqJmaMdZxz60y-ioFEKplQ3W7pnTqOBiDVd_N3JQr4M0DWzse6agJw>
    <xmx:jqJmaA2g5KvNstND4KvC6COqqAnDVYaOhL7XUz7lBpHmu5Um0qzveA>
    <xmx:kKJmaCZHI53tiVjYm_Lc0S5bbd-RiP-rukW6qgy1aeTCRVT-UkD8pZ_U>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2ECB2700065; Thu,  3 Jul 2025 11:32:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Te44b159e2532e323
Date: Thu, 03 Jul 2025 17:32:08 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor Dooley" <conor@kernel.org>,
 "Ben Zong-You Xie" <ben717@andestech.com>
Cc: "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Rob Herring" <robh@kernel.org>,
 krzk+dt@kernel.org, "Conor Dooley" <conor+dt@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, tim609@andestech.com
Message-Id: <352681c3-88ca-4122-9ad3-0a0ef33caf7b@app.fastmail.com>
In-Reply-To: <20250611-tapeless-arson-a6ace3c42c00@spud>
References: <20250602060747.689824-1-ben717@andestech.com>
 <20250606-booth-icky-b416c1827a43@spud>
 <aEbOLztcBsKs84pn@atctrx.andestech.com>
 <20250609-donut-oozy-4dcc8b8a292d@spud>
 <20250609-twiddling-clamp-eaa0dd2b1cad@spud>
 <aEmrHPd7RxUSOLAY@atctrx.andestech.com>
 <20250611-tapeless-arson-a6ace3c42c00@spud>
Subject: Re: [PATCH v5 0/8] add Voyager board support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_083235_934790_9F48A65A 
X-CRM114-Status: GOOD (  31.65  )
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

On Wed, Jun 11, 2025, at 18:21, Conor Dooley wrote:
> On Thu, Jun 12, 2025 at 12:13:16AM +0800, Ben Zong-You Xie wrote:
>> On Mon, Jun 09, 2025 at 05:17:50PM +0100, Conor Dooley wrote:
>> > > > > 
>> > > > > Ball is in your court now, after rc1 make a tree and get it in
>> > > > > linux-next, and then send a pr to soc@kernel.org with this new content.
>> > > > > Perhaps the defconfig should go separately, I can take that one if you
>> > > > > want.
>
>> > > > Thanks for your guidance on these patches. I will send a PR to
>> > > > soc@kernel.org as you suggested.
>> > > > 
>> > > > For the defconfig patch, I'm happy for you to handle it. Just let me
>> > > > know if there's anything specific you'd like me to include.
>> > > 
>> > > Okay, I picked it up on the basis that you'll send this all to Arnd for
>> > > 6.17
>> > 
>> > Sorry, I think that was really poorly worded. I picked it up on the
>> > basis that you're going to send the other patches in the series to Arnd
>> > for 6.17.
>> 
>> According to the SoC maintainer documentation [1], I should send a
>> patchset (not a PR) to soc@kernel.org. Since I'm not a submaintainer yet.
>> I think I should not sent a PR to the main SoC maintainer. Is that right?
>
> I think you can send a PR and not worry about it.
>
>> Further, I have two questions about sending a patchset:   
>> 1. Should I send v5 or start a new patchset?
>> 2. Should I continue excluding the defconfig patch, as we discussed
>>    previously? I think it should be included now.
>
> Arnd, you okay with a defconfig in the same branch as the dts/core
> bindings for a new platform? I'll happily drop it from by branch if it
> can all go as one.

Sorry I missed your question earlier, I finally got to it now as
I am going through the pull requests in patchwork.

Having the defconfig, MAINTAINERS and Kconfig updates in the branch
for a new platform is fine, in this case it makes sense to keep
everything together.

I'm also planning to have multiple new SoC targets in 6.17 and
would put them into a separate branch that does not contain the
dts changes for the existing SoCs.

For the pull request that Ben sent, there were a couple of
mistakes, I'll reply on that separately. It probably would made
more sense to send the patches to soc@lists.linux.dev (note
that the soc@kernel.org address got renamed but they still
both work) than to send a pull request this time.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
