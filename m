Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33349C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 09:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1YY3ovKwRFIy2pbVyM0Oc21P6bMU0EbfJClqjn2BiAA=; b=PnL20+VwCUzXa/
	lkMB9uHpYV3y13YpAj7s65EPo4lt0UGq6jmGxMKGBjJbY8WYbQ0l1DbWvZF1H5FyeAwrULZ+Ln+cL
	nwa2Zl3TmUYaemnB5C/MiGvBhRbRe4qplGdEnIVXl/MofC4ZFX3xiBXlLh7QOySLT4XfMKHVIoQFB
	RWC3lKteaRiez4DULSDXGb8eLDe2SFh0En3hoohR5DdDtUpzMSy6CQ04CNyiKWU6aA2cJAi0zt7Hd
	0NVQVyFoRNg95aOUrwWSWfID8i4Hca5wtzxKfBWZF4FFaoA15ZYoW45ELmIINXDYokyMUy9trJqrJ
	poy5+rIpT24W2R7V4tTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og1Aa-00DVpl-9y; Wed, 05 Oct 2022 09:58:28 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og1AX-00DVne-Ag
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 09:58:26 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id B466F580390;
	Wed,  5 Oct 2022 05:58:20 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 05 Oct 2022 05:58:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1664963900; x=1664967500; bh=MxxMRDfEHO
	Qi5+nDumNVbTgRThG0gUKh/x3oMnocNco=; b=mG+OYpQFz6324WqipXqg6d0xeZ
	sOq4/cKAkQH8uMWu7ERXlX8iP1Ccrr/uOmLRnO4STFcbI8UOsVMmKR+Mlq6PVMDb
	7jV0TmdAG060BvIT2ovC/7OJqIi1T25dGQ0poIeHjAHC3gf+CJgtfYHhDVveNWbB
	DNSnTXnQcBS5x2UWo4L43Emmx9bq2PDeyaj6fh+izC0Rj0Z0ms7HGEedp9xFRJRT
	IdleXCv/KYBMWtSLdzVZqmI6UqC3Am1OdlEB6c0ShG0ZPd6l0oSoq3MYdxL8bF0M
	Ov+gd2C+VGRFCfGX579aS1NNGEYeMepl06UpC2pdW3NSJoAMVSxSfwjINqNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664963900; x=1664967500; bh=MxxMRDfEHOQi5+nDumNVbTgRThG0
	gUKh/x3oMnocNco=; b=k/LgWYEQ4plZKY81euqM1y9WWeZpyTgDh+Utx34fiWcH
	tueYqOx5ygZOjcRzXtNynTSKRum33aGLXXYtpWzAsiyR4KG0rClWluF7MG3i4CTc
	pwANzyzUR1uO0zMrqE6l78D8A7QLD8ylv7V1vzM1SdapxxFE/qsqdWgWUvvoX1t4
	UOvy4qeEWoYZkjxQTfhuJ/Fshddg2fA9iCKgLsAFgDTLXoBeH2noSZ8ALEQDtLtP
	26DvVFoQ7dHTRuL3yNpBlN69M0gTX8IxnGvy9JZg0YWD4LM2iHIXNES/XOPVQKrt
	VF6PMWY1KO8yK3qVWtvxh4+Ywj1IyxC0PTBNsbKIig==
X-ME-Sender: <xms:OlU9Y3Xkyc3wvk78mSeW9XNVvuoQcdHfEvKVorRz4Q5Dk2Odmx69Zw>
    <xme:OlU9Y_l_CVx44Emjsgq-GpNd4pueoGuCVgOPZHzAl8jSQQjOD4rz101njXovurXoG
    1PqJ-Tqr77G6BuWLBs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeifedgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:OlU9YzaL8Zdmnb1Ruh3YAWIBoX_Q0Bhd0axAZaSORn9lTQyhVIQ4TQ>
    <xmx:OlU9YyU2liM2dW_2DzP4U8zRZpFu7pQVHWixgZAWihjjnIyriFRBCA>
    <xmx:OlU9YxkQ-lf95koBJOcUhrGcT9MizbuYjlhynvsa0ZS3T-2ZxAk1Xg>
    <xmx:PFU9Y7pUafo5ZcQnzVLJou_wEcv5ZuS6vKgr_fOghsMP70Ldtpt4XQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D5467B60086; Wed,  5 Oct 2022 05:58:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1015-gaf7d526680-fm-20220929.001-gaf7d5266
Mime-Version: 1.0
Message-Id: <e7340230-9a5b-4caf-a7b0-d048cc335994@app.fastmail.com>
In-Reply-To: <YzxwoELNBctbhjJb@spud>
References: <20221003223222.448551-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221003223222.448551-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <YzxwoELNBctbhjJb@spud>
Date: Wed, 05 Oct 2022 11:57:58 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor Dooley" <conor@kernel.org>, Prabhakar <prabhakar.csengg@gmail.com>
Cc: "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Magnus Damm" <magnus.damm@gmail.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, guoren <guoren@kernel.org>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "Philipp Tomsich" <philipp.tomsich@vrull.eu>,
 "Nathan Chancellor" <nathan@kernel.org>, "Atish Patra" <atishp@rivosinc.com>,
 "Anup Patel" <apatel@ventanamicro.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, "Biju Das" <biju.das.jz@bp.renesas.com>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC PATCH v2 2/2] soc: renesas: Add L2 cache management for RZ/Five SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_025825_732878_7A43BD89 
X-CRM114-Status: GOOD (  10.78  )
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

On Tue, Oct 4, 2022, at 7:42 PM, Conor Dooley wrote:
> On Mon, Oct 03, 2022 at 11:32:22PM +0100, Prabhakar wrote:
>> 
>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>> ---
>>  arch/riscv/include/asm/cacheflush.h    |   8 +
>>  arch/riscv/include/asm/errata_list.h   |   2 +
>>  arch/riscv/include/asm/sbi.h           |   1 +
>>  arch/riscv/mm/dma-noncoherent.c        |  20 ++
>
> Stupid question maybe, but I assume you mixed the driver addition and
> the changes to arch/riscv for the sake of easily creating the RFC?
>
>>  drivers/soc/renesas/Makefile           |   4 +
>>  drivers/soc/renesas/rzf/Makefile       |   3 +
>>  drivers/soc/renesas/rzf/ax45mp_cache.c | 365 +++++++++++++++++++++++++
>>  drivers/soc/renesas/rzf/rzf_sbi.h      |  27 ++

My feeling is that L2 cache behavior should live in arch/riscv
rather than drivers/soc/, since this is not specific to a SoC
family but rather the CPU core. I would also expect that the
actual implementation and DT binding can be shared with
non-renesas SoCs using the same CPU core.


    Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
