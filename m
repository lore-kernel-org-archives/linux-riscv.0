Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9813AC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 15:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xY6zifao52XrN5CtVtkKlWqst0gPPf+674nquh32gRA=; b=brKiWEBWBlnGy4
	QvlgBap6VmDJNFU5KHwlD7FMFqzP4/B2XX2ybXoXSx56PqUr0m+NPvXGkXso61nLppWIFrlnVG2cx
	J4PaGxWfA4gO78fvOWKTct2SmJ2hJoxCWp9my3rmKPB9zdZ05xy+gbnftDk39b0P9eQIyXdG2iCQE
	J89SaMnFg2WxgIurD2Eyiy/FoObLPfTdwKpkyqbu/JWXFU03Kz37R9dtAnCKEeULPM2EI1qlzzrTL
	3zSo2YTTV/Z4cqbz64lBFfaPE4TOAW5rkjzug6AYxaXaFHqMgj3Sy9P86TMbIYXAmoKn3rlH/z11D
	70zRdiAKLt8sMTMZDP2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5Sn-00A0Kv-38; Wed, 04 Jan 2023 15:13:57 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD4YO-009cxC-Aj
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 14:15:43 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id BA7705C01B4;
	Wed,  4 Jan 2023 09:15:34 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 04 Jan 2023 09:15:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1672841734; x=1672928134; bh=Fn1aQEXTry
	mHnWymQOrd0h3tQi3NafhSd3arLPnzkI0=; b=Ks0nnbzchE3a9MdHfWdff6SGhT
	NNuBTQkbbQRk856PiUGuPtTPXOO4EWiG2eLnky1Fe83iKhf5isWyYaj6dL95goYM
	+cMT8kgsxV2X9wzhwbMjbpXYYnADB0Ol7YrgEl3+n/OK9EdNeoEDZuej8IMQYMHe
	jaQGPPpDyFLtK4t5NieoJ5z90fkE+rUvIZRvI+uLNHX5DIZGgDrdtdrBloqulWvN
	zXAVIAu1UmHxqJKJDtF3oUYSo5q6IXcgpxWdmWaEr3FUJfyviBNZAVsmCUyiF0Zd
	CK5frI7p3SK9N9d0R9Td3ss6wAzSYMbPCbmDU4cETX+HKVPGR95SmJKPSuCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1672841734; x=1672928134; bh=Fn1aQEXTrymHnWymQOrd0h3tQi3N
	afhSd3arLPnzkI0=; b=PfJJY7BdjE9XKomOO3FAguSwAJbsoxpOtteKA2AH9GCe
	di2SCn+pfmmZUfFL1RmJI0QtizGbuFnUVPmYzAc5KzNv/V+inA0isBcm420qg8eq
	z/SkxKiiNUe4LvBFGswlgp+tnPUxgzGw3x8+jU31+R18HOAGXgR5Ko/W9XLGX+eI
	/+VELJWfmf1fq/oQgk7yV2h6pY0f+xPJa14KNzKpVSGm/Dhrw3QhF9k3ghX+zJsf
	dGMIsAP9x8tIdYkChPUSDdufb2TjTSNzoRYzsW/vzqneWxok8gjC/lV9Zdn/RDID
	ngy7cN9Vmb0CTKHnGPe66J0dSyIESH+0NAmRnCEI8A==
X-ME-Sender: <xms:BYq1Y2YD9LaCyi7RpUrZlAjmlLUDlXKWz-coGihwz7dT58cbTP29-g>
    <xme:BYq1Y5Yy8f7exDo1k5sgaomeRmh2af6NHR3eOOmryQJcO1uZNS3WYMi8PNhkcUUx2
    Xfyfa9cn2Q7g09dXzE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeeigdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:BYq1Yw-mze03m1sJLe9G-8FhVbq1AUQK0F1vB5yNhoSvwQi0PQKrCA>
    <xmx:BYq1Y4qaeGBFCh7Qv7qiiZX0cTDdkDURjAaqDkUl7n2X2tL964mu9A>
    <xmx:BYq1YxqNrc3pbSXTNVpRj35tKeq1zjwvLxV_ED0Cg-KGuEHIPuUF1w>
    <xmx:Boq1Y3gt-izzaAnIaOt1oEBmJI_9SdY7uLaxxa_i3aDqxBWbFmyLMw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4ED8BB60086; Wed,  4 Jan 2023 09:15:33 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Mime-Version: 1.0
Message-Id: <62fa1fff-b055-410d-bbf9-e4017dc23e88@app.fastmail.com>
In-Reply-To: <Y7V9Debcc9lqWBmT@spud>
References: <Y62nOqzyuUKqYDpq@spud>
 <20230103210400.3500626-10-conor@kernel.org>
 <b5712732-40a2-4e29-b29f-e0ab5516d518@app.fastmail.com>
 <Y7TBh+CJdZPJ6Xzl@spud>
 <ed198390-1bde-44ec-9f3f-b0e016b4b24c@app.fastmail.com>
 <CFB874A3-3E6F-4C5B-B47D-381EB1E07C02@kernel.org>
 <43aee000-5b89-4d94-98d2-b37b1a18a83e@app.fastmail.com>
 <Y7VpeK48nslxklkF@spud>
 <1b7d4caa-2c9c-4aef-81ac-47288d3a652c@app.fastmail.com>
 <Y7V9Debcc9lqWBmT@spud>
Date: Wed, 04 Jan 2023 15:15:12 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor Dooley" <conor@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
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
X-CRM114-CacheID: sfid-20230104_061540_741034_D7DBDF40 
X-CRM114-Status: UNSURE (   9.80  )
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

On Wed, Jan 4, 2023, at 14:20, Conor Dooley wrote:
> On Wed, Jan 04, 2023 at 01:18:45PM +0100, Arnd Bergmann wrote:
>> On Wed, Jan 4, 2023, at 12:56, Conor Dooley wrote:
>> > On Wed, Jan 04, 2023 at 11:19:44AM +0100, Arnd Bergmann wrote:
> Perhaps more of a question for Palmer than you, but how about leaving
> ALT_CMO_OP as-is in riscv/for-next at the moment, wrapping it in
> zicbom_cache_foo() & leaving that extraction for a follow-on work?
> There's another conversation going on about expanding the THEAD stuff,
> so that could be done on top of Prabhakar's v6.

Right, makes sense to me.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
