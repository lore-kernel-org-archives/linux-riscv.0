Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63D5C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 08:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=foBrLmGVvxjByLXlYqLmK3WVsXzKp2XhpW8CmSod+So=; b=ZII4C4Nmt3Io9v
	DN4TGQ2xDknmxAt11mgmyI8+156vTa+dtSDpMxxHydmQXDVxKntjLETPtEadLry3QMBnQc1VJmNj+
	53nFkgSUisD3uSXrvXOFuUrCIdL+KbZdUblWVjMurip0XkU4qgk+KRAquvRikQurDBGVG//e8G2na
	T7gFjS5nVG1lFSb2eUdIZUkaOUkj5+GYctYxkrP5wrUomWQLiI31V19xq57lgd/dGO2ExSYzl21z5
	YwtV3783a4xhnBDt5E5AlSA9sCYgsC5mMdKPCTZqgR7SN36mlclB4SDRqkh3qjzrs26JOXwnMrBqr
	HL0XLS7azZoGD0VoMO+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCyyy-007a0s-5q; Wed, 04 Jan 2023 08:18:44 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCyyW-007Zjd-4V
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 08:18:18 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id BD04D5C01B5;
	Wed,  4 Jan 2023 03:18:10 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 04 Jan 2023 03:18:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1672820290; x=1672906690; bh=sMeTVClvIY
	fuPYuMRUbp+49sG5zkB1a9qX5hlrXd14U=; b=m0KSjLZB/tFB/hVcAvmwjid+4L
	O8mqu0I9xmhgNX0IIcj7txjwMjC/hKKIkV3Q/HU1fYJ8s6gdDw89oNhgxWy8CLcl
	SpjLj4TQxJ2FZ0DlvLTGvJoqOlvJNSSg19+R6JvnrXBFMdInU/2CmVDADxYZ0cdf
	u11bPDmdpqfjIzfhgKObw76PyUIhUKa/W4gpvLLV+NsQsXHezH+74CaPLSq8vyAW
	aqn78wB9x9xkhUSm7Wp5B1ht2f4BDrE0Zd4ZSb7w79BXK6eSlCKnGOPMWzSsuwv6
	6QdWgARa7NAFbweGzQtrBz44fyx5FUdSrF6TwLlIdc0IPOfrFEwVnawVwqew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1672820290; x=1672906690; bh=sMeTVClvIYfuPYuMRUbp+49sG5zk
	B1a9qX5hlrXd14U=; b=ZAtrIOGplKB6sTP3Mya9p4i9BUddEnVf8m9cm7KbG54t
	Zsq1MVA8Zer87zOsphfiWKA09PMo+iNd+JI4XVSjlkwxnLBrutV1R+hsYiJ0BUoA
	jpQXpN25Eix3sBKECqkiSFjc3G5v/qENmZmG/tWG7MlONUGD7zG8EgZD1NLyKMej
	bFVo7pQvbkuqOo3mczDwKwhOba7E9sX8KBtaO/N6RD+rdVa/qfdOZ/pWKJx4jgPC
	54vvTQ6DrJpLisBfJHvrvERyJSuxbEyt70/9HLdcr1cdBNvuN03EnrU9riQG03dj
	u/rii4hUEw6ceQEI2YIj7afbdcLCMfdlxIA7s6IDRA==
X-ME-Sender: <xms:QTa1YwYdte0aQZViO8nBtAzwnjqsg0bssKUJQoC1PhDbJkbvfBiHYw>
    <xme:QTa1Y7bbriuc-Uf1IUfkKGbA_kq8Y8CAhat0_wp6RrTcBDUYugyT8PCl2kYUN6G3G
    cUW8Q4_-0zOb77sfaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeehgdduvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:QTa1Y69oAQqvgmo_0WadEAZCbjCOfiL41cXDP85H5ELKiiQA3wHKqg>
    <xmx:QTa1Y6o43g4sC1oC9dcf43ToR4Lj2JNsFIYEmWlYoCyIivQSL3a7OQ>
    <xmx:QTa1Y7qgguAE5D-MNdTzzpxyqHwi3iITTJVTWnnU7QV1Z7yJeCfB9w>
    <xmx:Qja1Y5hbKaL9mFyosQHTTu3WmQFUj6oWRoPlpduSWZnxdkqzJrHB2w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 32F83B60086; Wed,  4 Jan 2023 03:18:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Mime-Version: 1.0
Message-Id: <ed198390-1bde-44ec-9f3f-b0e016b4b24c@app.fastmail.com>
In-Reply-To: <Y7TBh+CJdZPJ6Xzl@spud>
References: <Y62nOqzyuUKqYDpq@spud>
 <20230103210400.3500626-10-conor@kernel.org>
 <b5712732-40a2-4e29-b29f-e0ab5516d518@app.fastmail.com>
 <Y7TBh+CJdZPJ6Xzl@spud>
Date: Wed, 04 Jan 2023 09:17:41 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor Dooley" <conor@kernel.org>
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>,
 Prabhakar <prabhakar.csengg@gmail.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "Andrew Jones" <ajones@ventanamicro.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Anup Patel" <apatel@ventanamicro.com>,
 "Atish Patra" <atishp@rivosinc.com>,
 "Biju Das" <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org,
 "Geert Uytterhoeven" <geert@linux-m68k.org>, guoren <guoren@kernel.org>,
 "Christoph Hellwig" <hch@infradead.org>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Jisheng Zhang" <jszhang@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
 linux-kernel@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-riscv@lists.infradead.org, "Magnus Damm" <magnus.damm@gmail.com>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Philipp Tomsich" <philipp.tomsich@vrull.eu>, "Lad,
 Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Samuel Holland" <samuel@sholland.org>, soc@kernel.org,
 "Daire McNamara" <daire.mcnamara@microchip.com>
Subject: Re: [RFC v5.1 9/9] [DON'T APPLY] cache: sifive-ccache: add cache flushing
 capability
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_001816_316883_D7DCB0D1 
X-CRM114-Status: GOOD (  22.28  )
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

On Wed, Jan 4, 2023, at 01:00, Conor Dooley wrote:
> On Tue, Jan 03, 2023 at 10:28:19PM +0100, Arnd Bergmann wrote:
>> On Tue, Jan 3, 2023, at 22:04, Conor Dooley wrote:
>> > From: Daire McNamara <daire.mcnamara@microchip.com>
>> >
>> > SiFive L2 cache controller can flush L2 cache. Expose this capability via
>> > driver.
>> >
>> > Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
>> > [Conor: rebase on top of move to cache subsystem]
>> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> > ---
>> > This commit needs more work, and a way to enable it from errata. I've
>> > not gone and done this as PolarFire SoC has archid etc all set to zero.
>> > So we need to go figure out a workaround for this, before adding in
>> > errata enabling code for this. I've included it here as a second user of
>> > the cache management stuff, since what's currently upstream for the
>> > ccache driver does not do any cache management.
>> > ---
>> >  drivers/cache/sifive_ccache.c | 45 +++++++++++++++++++++++++++++++++++
>> >  1 file changed, 45 insertions(+)
>> 
>> My feeling here is that the cacheflush code is unrelated to the
>> EDAC code and it should just be a separate file. From what I can
>> tell, all of the existing contents of this file can simply
>> get merged into drivers/edac/sifive_edac.c, with the newly
>> added code becoming a standalone driver.
>
> Sure? I'd like to do that independently of whatever is done for the
> ax45mp CMOs though, don't think it's worth holding up that platform's
> support on me splitting this out.

Right, no need to touch the existing file as part of this series,
it probably just gets in the way of defining a good interface here.

    Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
