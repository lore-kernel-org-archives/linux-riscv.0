Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0272E6ADE7
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 21:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=os13w+0UL5x6xmcz3aiD9I1xDNNcFx7vkYIGlidAVLk=; b=jS0KqI0BBrQMQZwGLN9XYgIlFN
	nH1fqXj42OtnJIxRMsMHi/+X3lwH/5F/VAhT/5b1xg2zUNhr6lfMNeTKaoXXdFM7LDbYlnQ1QL8rj
	G6IkV7xZSnIJFfChtC0ldsW4cTZEy/RDNxeX7h8RD5oftJhfCWfVELoNuvhqKOt2NtJZZOO9S3jnw
	fwFmpKFagaJVOfF1jQq64Pj59xI1UMkfayH2UlNurI5orIr6mM7SJXk2R8pN3Wijsj1o4o7fBMubk
	VUEDuxpk22EWA33jekZ5TjsKrwn8VeczJZ0gi/FZPxswWvsDMvmS+sOHziKlliC+z1dWz1ggxFU9g
	tZqCj14g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXnWp-0000000EBzx-3Ay3;
	Mon, 22 Dec 2025 21:33:19 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXnWm-0000000EBza-49FK
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 21:33:18 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 1FBCFEC0091;
	Mon, 22 Dec 2025 16:33:15 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 22 Dec 2025 16:33:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1766439195;
	 x=1766525595; bh=hlZZc2/NQjeFTAUATJePoi9eA1h+qvYR8jAewG6kWX8=; b=
	JrvtLO6WskTrq/D0sE6sGwmT/moOJf6iq14x11Wd0a0tS0fFUFBHqkia6180F6f8
	jhz8PS8f1fF++f4vYubAnJZKdBs0ef7zNfNKXF2fsfX2ZjcDMNsw1mTchFACYtx8
	p6HJbPOcAklbm2tq5Xj6WB0zsw69r96AQxox9QZX2khLs2Vqf4ZCjCC+MIIbxoMZ
	v3Ujyu7JeQhQjC4S/dygX0Uf10PJ75es8VTUXUj+jZZ4shyEZXedNxU5rGMvKYem
	jgXml+BmrVeH3TZLVVJhG6pqhkj7lhshbz/QYW+pzXjoUWA2cXd4/5KmwmnyS+91
	ylH/8BieBC3hkwDRGT4XEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766439195; x=
	1766525595; bh=hlZZc2/NQjeFTAUATJePoi9eA1h+qvYR8jAewG6kWX8=; b=A
	BHtA8ntJBqqM3sAM5REb9PtwwpnIxlo4PRqNdE4Y6jQsgl84cj30NSbCHXLzJP0i
	7R6kvs+lBT6Sz9PsJq/BCaAX48nd6gbr/qwRfOO1hY/M/ybaSQiL7vOhJ72McOn5
	Tiqqo93MDxWwfuDc2Ml5bQQP1OR4U4jnmaBEO5Hn2IW5FrV+PgaOZ5fjKP9ij+zJ
	HnwvR+aMztvEkl3xWkLikqJrsFwM16ksdK+DxO87hsC4fykdqC9jlyNFPblUSaJa
	H5vAhWFrBzckVo+b4P3NFO9OJJ+/bRl/JrsOgd3Gfm7BxXIurDAAGUPlgb5DuwYI
	OB2D4E3ZVZB8VGYEpr5SA==
X-ME-Sender: <xms:GrlJaZZVQkkMq0bq5cd6v85RUxt7pdEUUZ3K0aZxhNreF9PwzryKmg>
    <xme:GrlJabMI-p-ppo3nYv4RDXHnaroIULMW7pzY5RSl5NZjav9j7Xpv2gYNPADle2mJK
    7N5mbtS4WY9neftJc3Yebrqn3IKogK9bnABqeBk_sFXYLVMqkonAbk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehkedtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheprghlvgigrghnuggvrhdruggvuhgthhgvrhesrghmugdrtghomhdprh
    gtphhtthhopegthhhrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomhdprhgtphht
    thhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhlihgvugesgh
    hmrghilhdrtghomhdprhgtphhtthhopehrrggsvghnuggrrdgtnhesghhmrghilhdrtgho
    mhdprhgtphhtthhopehgrghohhgrnhesihhstggrshdrrggtrdgtnhdprhgtphhtthhope
    grmhguqdhgfhigsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthht
    ohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdho
    rhhg
X-ME-Proxy: <xmx:GrlJaVXeDs2nrSDsoj-Tz6Oh6na-7BIIABx1SMZIdq36_Lw7_7GUXg>
    <xmx:GrlJab-G26k7C6p-BrtUnNJJ2iyZVmzQ43UDDl1uZorMS5FpwcfvgQ>
    <xmx:GrlJadoajOR5Zn3PK2CFFTa-mulqN4utFkNhaZBwmzHHVfYm239e_A>
    <xmx:GrlJaWLqLGIi4Av_0c0T1cafHn_pBvaButS_1neX2ANKEC3A86gPkg>
    <xmx:G7lJaUlgNUJdPwFA64hEHnKPx7DDAukkRQwmtUaroj24FPLGQdYf9wd4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 049C4700065; Mon, 22 Dec 2025 16:33:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A6eaVLahbyw3
Date: Mon, 22 Dec 2025 22:32:43 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Han Gao" <gaohan@iscas.ac.cn>,
 "Alex Deucher" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Dave Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: "Han Gao" <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev
Message-Id: <e86b823f-5e83-4105-8e4d-1db141d088a4@app.fastmail.com>
In-Reply-To: <20251220163338.3852399-1-gaohan@iscas.ac.cn>
References: <20251220163338.3852399-1-gaohan@iscas.ac.cn>
Subject: Re: [PATCH] drm/radeon: bypass no_64bit_msi with new msi64 parameter
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_133317_098180_9EA6EDB0 
X-CRM114-Status: GOOD (  14.14  )
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

On Sat, Dec 20, 2025, at 17:33, Han Gao wrote:
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c 
> b/drivers/gpu/drm/radeon/radeon_drv.c
> index 87fd6255c114..53af28494c03 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -249,6 +249,10 @@ int radeon_cik_support = -1;
>  MODULE_PARM_DESC(cik_support, "CIK support (1 = enabled, 0 = disabled, 
> -1 = default)");
>  module_param_named(cik_support, radeon_cik_support, int, 0444);
> 
> +int radeon_msi64;
> +MODULE_PARM_DESC(msi64, "MSI64 support (1 = enabled, 0 = disabled)");
> +module_param_named(msi64, radeon_msi64, int, 0444);
> +

As with the hda-intel patch, this should not be a module argument,
but we should have the kernel figure out what to do itself.

> diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c 
> b/drivers/gpu/drm/radeon/radeon_irq_kms.c
> index 9961251b44ba..62eb5a6968ff 100644
> --- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
> +++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
> @@ -250,7 +250,7 @@ static bool radeon_msi_ok(struct radeon_device 
> *rdev)
>  	 * of address for "64-bit" MSIs which breaks on some platforms, 
> notably
>  	 * IBM POWER servers, so we limit them
>  	 */
> -	if (rdev->family < CHIP_BONAIRE) {
> +	if (rdev->family < CHIP_BONAIRE && !radeon_msi64) {
>  		dev_info(rdev->dev, "radeon: MSI limited to 32-bit\n");
>  		rdev->pdev->no_64bit_msi = 1;

According to the comment above it, the device can apparently
do 40-bit addressing but not use the entire 64-bit space.

I assume the SG2042 chip has the irqchip somewhere above the
32-bit line but below the 40-bit line, so it ends up working.

I wonder if the msi_verify_entries() function should check
against dev->coherent_dma_mask instead of checking the
upper 32 bits for being nonzero, that probably gives you
the desired behavior.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
