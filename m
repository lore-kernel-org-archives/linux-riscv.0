Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53680C3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 21:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9mTWw+0fLLD7+h15T6O7SNeb70+vH9KEVfCVhz4KK5k=; b=yNY5ro/OtpnC+N
	FZjpoPI+WLLWLwQAZ5nRnufSLIeLy1IUvVJynVw203E3LOeSXst61SN7hj75lTeI6H0PEL1I51vlj
	Z1M4+gMUc4gUA1y5uTh3cxoynISQ6mzze7FzZO5hnOPuDKr/XSPmiAua0idVQpnjJ+OWmbLbM4Uoh
	EIdGypkrZyOSv272rvarGGTaPClOvwliTL1u9O4cpUuZDExwuC9vJfySn8ELY1ABijSi51A8R8heA
	SoeaRP0YvwemxAPAAR+U6mCyuDzs7JQLZucPyvhURt4ITzHyt4wsEo3O5L57oDWX5BemrEVIz5In3
	cx4NMMjWTmxszl1ehwTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCorO-0058Cy-K4; Tue, 03 Jan 2023 21:30:14 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCopt-0057mX-Ob
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 21:28:43 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id AB5955C010A;
	Tue,  3 Jan 2023 16:28:40 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 03 Jan 2023 16:28:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1672781320; x=1672867720; bh=yNCwZ6Th6X
	npsgpDnxdC5Wteq3Enf3afecAlxpz1Yf0=; b=RT3jcKWDrIdGX0GMBXlzEaJXZo
	t7WlxKzq6ISMii12Gw1Qgc3yw8AtUuj/Y7W8CH2UZcNBIqOpaaaa3FF7o5wWjf7v
	W/0cFDOQEzBC0TTVAMb3vPe6r2oM/JceBHauEqwON+EMplFJKDTXx8cItFH36s76
	cLGUmuBMIVn4VkGmiBZvnxMX+lkB05BKdaEtS3m2pLRWPeTNUDkDpezww9LQvO0S
	yDU0tUPjx8bvNWYbkbsMUwcEDUqltHHfT2T5HDZF0Eow6917hMhqQnl8gDAfc7fG
	LMnZcCAvIxI0wK7fOMuUCZ/OF0UeFStMonJ+95w2fo7Ue5RqKlKhuRnw8PNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1672781320; x=1672867720; bh=yNCwZ6Th6XnpsgpDnxdC5Wteq3En
	f3afecAlxpz1Yf0=; b=UYLDHjxb4WaTHgRLWiMAmf4ywTasuzhf9H9wzMvnKxZp
	IgksybaORA3FFMXapDEEhKCznDRLY5Sd/H6liz6G5N82nlk2QnIzZCzNBvGIFWRV
	45T4WaOnIYE0qVJOA3+60FNJchWtsUjdv93cDB+zqUaF7MAii11/5E82xI2DPTCl
	UXxdYAJbYtzuvOsEZ4qFPcMGmkqxx1s7kaJAZK/inMqTt4preDDRYxv1uGas36ru
	mYXwrjIrfxPm5jpk8prqohSSWczwMEoFMfpa9191QOJaD2l92h4xAny1fcgjd7yE
	IYw8DwbJcLurc8S/uFSdKf/xe+4snfiaMtAnfIKjqQ==
X-ME-Sender: <xms:B560Y9YFVX_Dtg4fkwkBUB8iaqySgKlZCFsv1f54amVqEenJtHdlLA>
    <xme:B560Y0bcr9dayeA-LTKyUlmSYnAuqLypLyM1clBFFloI9pXGTGZbXQXcVKAsbn-qT
    hYMAHh7qV2CQYUdkZc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeeggddugeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:B560Y_8FsJGuDFXA8ijKwIeAdFg_2ylkQS8WBxKhtAbYflLe_eD6uw>
    <xmx:B560Y7oTTRuD6ZJYnxdT2h534lETFq3EaNsZWptmYuf-RsFof0sw7A>
    <xmx:B560Y4pGRpch4vAS78YRVSLiIuo_2JMY4TMjgZ1MBfausSc3nUW31A>
    <xmx:CJ60Y6j-8vwFY28sh04DyTILDAsFcQFY_wlzCKt7SIv0jZUqJ7zzkA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id CB431B60086; Tue,  3 Jan 2023 16:28:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Mime-Version: 1.0
Message-Id: <b5712732-40a2-4e29-b29f-e0ab5516d518@app.fastmail.com>
In-Reply-To: <20230103210400.3500626-10-conor@kernel.org>
References: <Y62nOqzyuUKqYDpq@spud>
 <20230103210400.3500626-10-conor@kernel.org>
Date: Tue, 03 Jan 2023 22:28:19 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor Dooley" <conor@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 Prabhakar <prabhakar.csengg@gmail.com>
Cc: "Conor.Dooley" <conor.dooley@microchip.com>,
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
X-CRM114-CacheID: sfid-20230103_132841_954556_6AEA0B77 
X-CRM114-Status: GOOD (  16.96  )
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

On Tue, Jan 3, 2023, at 22:04, Conor Dooley wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
>
> SiFive L2 cache controller can flush L2 cache. Expose this capability via
> driver.
>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> [Conor: rebase on top of move to cache subsystem]
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> This commit needs more work, and a way to enable it from errata. I've
> not gone and done this as PolarFire SoC has archid etc all set to zero.
> So we need to go figure out a workaround for this, before adding in
> errata enabling code for this. I've included it here as a second user of
> the cache management stuff, since what's currently upstream for the
> ccache driver does not do any cache management.
> ---
>  drivers/cache/sifive_ccache.c | 45 +++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)

My feeling here is that the cacheflush code is unrelated to the
EDAC code and it should just be a separate file. From what I can
tell, all of the existing contents of this file can simply
get merged into drivers/edac/sifive_edac.c, with the newly
added code becoming a standalone driver.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
