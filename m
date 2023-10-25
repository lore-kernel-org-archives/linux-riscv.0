Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568F1C25B6B
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 21:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qyy1B7o9TQ1QwMuWVbz16BRWVk2MkeYbHwuQgEKZklQ=; b=slEp1M60t27D6r
	RMwWHLvRv3p5CQmCukkEtrue47UGYYL7atJPNzddeN9/UJDHAuRJJQ01hirmctGhWtrEhNORyWkJr
	GHRTD6UoXChWPYYBwLWcGHPAb5FVR2KzjtRSl/7kZRYDzOHIwsr/VXEhybEQ2EAKrQAi65yDjJ/5e
	synHNDNVWja3ot7wcopAk7AVsGS3yOMuD15Z7Ery6YfUnPj10oTp5AojlR6eUfnGRkD0CR6qd9q4e
	itIBJ7ssgy9awnJGGfTB7G/SSAAiXqtDO1JkWpZUrmrJm7g9ayW/GGdUNMvmMAa4Noh+OLG0vrPiS
	bPAOvcjnPTWnzUrrBwRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvlHM-00D9rw-26;
	Wed, 25 Oct 2023 21:19:04 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvlHK-00D9rP-0B
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 21:19:03 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 217615C02D1;
	Wed, 25 Oct 2023 17:19:01 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 25 Oct 2023 17:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1698268741; x=1698355141; bh=sB
	bmzZrzS7uTnh17vfzRRsLGG5pya0cO071IzBgauVw=; b=cEGW65XAIPb/2izJgp
	CDNL/6qj+dj9I6xTv077eqlR9F9W9CENmDXvCK5w3j0oBgdR7HbmVHLb/MrRWvHs
	6fSWyu1V7USJiN7J/0oYHagyu11Opj2C6e6Jp1rGV5jOBVE8Ea4yqM09svL8kZCf
	pjGGu4CWF4OAcZX1K7FTRNFl/BWFqQXgqkdVEPnGzJa6dVONdvbGDDKwdgCVlHsd
	XMESC0iY7G2qWQgs3P+I7S1kHGTXSfZmvQrykBdFWoIz1qYWR95e7A1Vubgtrb4n
	yNvh/rii5JKXOwmTwghXClJTe5VfJfXno1JEpnPWJ3bdKNMwlGIHc0rYeplYAcR4
	mIsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1698268741; x=1698355141; bh=sBbmzZrzS7uTn
	h17vfzRRsLGG5pya0cO071IzBgauVw=; b=B6qwFUmEMob+EA2+IiIud9rsZ2Djn
	G3DTTilrXtsOAaKYdVplWsooJZj+Y2vbKCzWWNxY4Jfhe0di5qFyPcJ/4JQBQkZc
	WYYFytP0NLIGXoUhGP2JoDeANt50t3TAsZla/iURUbw98UK6E1yw3tZcEDP3oCfI
	7Lp2exF8FrfsqOWwhZ/ZYWdN0v3wUyedHltDhjdiw3dQiHiH4QZXP0XavdterzXa
	F8hm2tsjWmUmXptrG1RIGPkVGDU0YyrnJ4XgyHIA2mWAcFRRvHjKrn6rs+GoT3fy
	zX3bxaMerVMOQ3VhugI0tBEane6n35v6cbCNWFAVs2DF6rLy5xHOuV/7w==
X-ME-Sender: <xms:RIY5Zea-J8aJlz7w6-2ldbaHADRfwZNlDp_xPHG4DN8jAUm2rizNTQ>
    <xme:RIY5ZRYIbcw-LKwvoaMCqXDLngVtrU6PvSuCGiMyZnYgNxD9NgjKDjqNYY0s9v2ep
    d5fe48BRg6u6kUsOBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrledtgdduheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:RIY5ZY-NWH8RnQ3Ca-lO8LOcfcWcYxHfLEUraum6ie_cnzR3hq_VRQ>
    <xmx:RIY5ZQosmo5MZQLr0SpZy4s_-fDI_twUf6tm2sZr_llBb7AIBQ9TAg>
    <xmx:RIY5ZZqAsbzFIiWZYVkWTbWaKMVZeUoz2tQJCcG3CgYuhFWXRDTUhQ>
    <xmx:RYY5ZdLDIJ6YFR1ttxQ7mh393Xhg_dl0wsQT0TIOOTuG5imRmN402g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id BDBADB60089; Wed, 25 Oct 2023 17:19:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1048-g9229b632c5-fm-20231019.001-g9229b632
MIME-Version: 1.0
Message-Id: <571211a1-470a-43da-a603-fd12a640b7a8@app.fastmail.com>
In-Reply-To: <ZTmEkYn1NcUvL58n@ghost>
References: <20230919-optimize_checksum-v7-0-06c7d0ddd5d6@rivosinc.com>
 <20230919-optimize_checksum-v7-2-06c7d0ddd5d6@rivosinc.com>
 <DM8PR11MB575134C301E7E17E72281CFAB8DEA@DM8PR11MB5751.namprd11.prod.outlook.com>
 <ZTl8gauEst2NGrw6@ghost>
 <059f17e6-e240-40fa-8742-7844ad3b3502@app.fastmail.com>
 <ZTmEkYn1NcUvL58n@ghost>
Date: Wed, 25 Oct 2023 23:18:40 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Charlie Jenkins" <charlie@rivosinc.com>
Cc: "Wang, Xiao W" <xiao.w.wang@intel.com>,
 Linux-Arch <linux-arch@vger.kernel.org>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Conor Dooley" <conor@kernel.org>, "David Laight" <David.Laight@aculab.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v7 2/4] riscv: Checksum header
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_141902_160195_CC4F54C5 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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

On Wed, Oct 25, 2023, at 23:11, Charlie Jenkins wrote:
>
> Thank you for pointing that out, I had not realized that macro existed.
> Since riscv keeps NET_IP_ALIGN at 0 it should be expected that
> ip_fast_csum is only called with 32-bit aligned addresses. I will update
> the comment and refer to that macro. riscv supports misaligned accesses
> but there are no guarantees of speed.

Just to clarify for your comment: riscv gets the default value of '2',
which is the one that makes the header aligned.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
