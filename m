Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E10C6379F
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Jan 2023 21:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8547yTttziLrWRtQCoiNdXSG+qcYTIWVitmF2HZ9vCM=; b=S17pHdWz7a87X9
	8+OyYNlA/EwHMsFB8e2dosfZ7wcHl3YHMiKznka7C7hreBzOTdAkR3ETJkpWmpYgrWzXAb33D7LvM
	c5wQjt1+LgCVk2No53iu/wDrf4g5ybKEYvQG9us+GTTffmyrqTJP2A82m40u9JCCcZA8waE2rb0iF
	l4LZHzPPdTe6pQJpVS4NS47lskCt/ZU3B0j1VghtCFHcmyHbSrgtdUMXWPcCPa96Ro3EkrfFLdqbS
	ogxhvtK8BSQR+KH97MuYCJIo9PPan0NlfrTeC49kolTQwwkkXVYFm0AvVBh20Mdki97ZK0mBcRcBy
	HR5yBkbwx9PzS+g8KjKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEH84-008Xvb-NI; Sat, 07 Jan 2023 21:53:28 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEH81-008Xu8-0N
	for linux-riscv@lists.infradead.org; Sat, 07 Jan 2023 21:53:26 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id C755E5C00A7;
	Sat,  7 Jan 2023 16:53:19 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Sat, 07 Jan 2023 16:53:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1673128399; x=1673214799; bh=J0Hsmp/ZZA
	pKnx0B5sCmuSruqbIuHaEX01SlY2kzFRM=; b=kzRcmPNZNu/H7aqihcqSRgUWfO
	co0tjtqxHgQrpli1E5Ajw90YVrqCDe9AhYhFNEad/MlGDXaPVc4LNDTl9MAKWakj
	nboXEUvB79kI30NGLDVHXDb9z+gHlKaEzsEjhy8b3choHAjBaXX/3tZTeypV9LBU
	WzR2JfVbb4YkZqwFTzjDLqAOa7Aam12aj8TFs3o9r2v4Jtf7T/D3VgDbZFJC5GMf
	2RRgJdaQEssbxMdNQ8R5JZzKT6b10PcXP0WD6GlzMWJYGoYmVMLDUIZJYSUffXBX
	dB3EqI0AdSCa4C4+yiE/PtDGuQGJnIN7lqeAf9B1jFQP4L4PryU1PE0e2PkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1673128399; x=1673214799; bh=J0Hsmp/ZZApKnx0B5sCmuSruqbIu
	HaEX01SlY2kzFRM=; b=blJIInZRK/GQsOPIwBvXOweynQ3zlY5g4o11vjwnOdZF
	GMLtY/FKHS3cHS130rnJPXBIF9neGtjk65Xw9hduShzP48m1Wxehuqbwk3TqftM4
	4utkwjLZwrpDcMf0qdMvAc/kpWLTJG0HLqyBKJwM37tVSveAuSCXVtuAdypfTXZu
	fPOa+9wt5tXZkPHMwI0AnGsQlKj9qw4U7bMlZ43fkfIaLe7SG5c4nptJigcxBPv5
	UqmdbppF4UgI98XyDv3xWijjh+M3KyMgitAEQpF3wsOwXyGBre7POZlFhF7boWmj
	Q0wo7RKEaXYqYYjT+LqicIfgfOdiZLYmUnmTrUvHnA==
X-ME-Sender: <xms:zem5Yxn2Xp6o7jv6v9ag-h3WSU6wVfSuNcWvmfvX5V-rrgPAd5ccwg>
    <xme:zem5Y81ai5R_3d8RtU0bh3jqnNdYzXd1lnoMxD9W0Y8oUltcX38cXw8kExg4ZqvVn
    iNvrKqlZavIZBQphlM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkedvgdduheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:zem5Y3ovRuULdDDY-9Yx8REuwAT6cDNvzbDyALM9RWPd4sIllTZuZg>
    <xmx:zem5Yxk_5YLVfecs2MUMX5WXmaycfzjq2uGGXBn9hKIBQNSGK4vtGQ>
    <xmx:zem5Y_0XnMcdIjXre2-ZSJ9OUR9nK75BTLzHr2z5ndwrVQH4Tc-0pA>
    <xmx:z-m5Y05EjgaOMU3qrpXvrTDuZTos01zxK2K7PYtuvab5MfoNp7bW4Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2053AB60086; Sat,  7 Jan 2023 16:53:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Mime-Version: 1.0
Message-Id: <fb3b34ae-e35e-4dc2-a8f4-19984a2f58a8@app.fastmail.com>
In-Reply-To: <Y7iu0RC9jgWh7hfJ@spud>
References: <20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230106185526.260163-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <6f7d06ef-d74d-4dfc-9b77-6ae83e0d7816@app.fastmail.com>
 <Y7iu0RC9jgWh7hfJ@spud>
Date: Sat, 07 Jan 2023 22:52:55 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor Dooley" <conor@kernel.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, guoren <guoren@kernel.org>,
 "Andrew Jones" <ajones@ventanamicro.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 "open list" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "Philipp Tomsich" <philipp.tomsich@vrull.eu>,
 "Nathan Chancellor" <nathan@kernel.org>, "Atish Patra" <atishp@rivosinc.com>,
 "Anup Patel" <apatel@ventanamicro.com>,
 "Tsukasa OI" <research_trasio@irq.a4lg.com>,
 "Jisheng Zhang" <jszhang@kernel.org>,
 "Mayuresh Chitale" <mchitale@ventanamicro.com>
Subject: Re: [RFC PATCH v6 1/6] riscv: mm: dma-noncoherent: Switch using function
 pointers for cache management
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_135325_665799_D3503EE4 
X-CRM114-Status: GOOD (  15.36  )
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

On Sat, Jan 7, 2023, at 00:29, Conor Dooley wrote:
> On Fri, Jan 06, 2023 at 11:31:33PM +0100, Arnd Bergmann wrote:
>> On Fri, Jan 6, 2023, at 19:55, Prabhakar wrote:
>> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>> > +struct riscv_cache_ops zicbom_cmo_ops = {
>> > +	.clean_range = &zicbom_cmo_clean_range,
>> > +	.inv_range = &zicbom_cmo_inval_range,
>> > +	.flush_range = &zicbom_cmo_flush_range,
>> > +};
>> > +#else
>> > +struct riscv_cache_ops zicbom_cmo_ops = {
>> > +	.clean_range = NULL,
>> > +	.inv_range = NULL,
>> > +	.flush_range = NULL,
>> > +	.riscv_dma_noncoherent_cmo_ops = NULL,
>> > +};
>> > +#endif
>> > +EXPORT_SYMBOL(zicbom_cmo_ops);
>> 
>> Same here: If the ZICBOM ISA is disabled, nothing should
>> reference zicbom_cmo_ops.
>
>> Also, since ZICBOM is a standard
>> extension, I think it makes sense to always have it enabled,
>> at least whenever noncoherent DMA is supported, that way
>> it can be the default that gets used in the absence of any
>> nonstandard cache controller.
>
> While I think of it, this is not possible as Zicbom requires toolchain
> support whereas the alternative methods for non-coherent DMA do not.

Ah, I see. Would it be possible to use the same .long trick
as in the other ones though? Something like

#if CONFIG_AS_VERSION >= 23600 /* or whichever version */
     /* proper inline asm */
#else
     /* .long hack */
#endif

That way everyone can use it, and the hack would automatically
go away in a few years after linux requires a newer toolchain.

Alternatively, the entire noncoherent-dma support could be
made to depend on whichever toolchain introduced Zicbom.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
