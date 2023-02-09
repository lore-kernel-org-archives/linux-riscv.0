Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E98BC636D3
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 23:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fgVK4yrVylIdZDo2Vd9aCxUCeiUlqMAixdY5HHoQM70=; b=OEbLYvQWlTjul5
	TBaVZGxXRHw7gx4LOrp3Z4Hi/108ToM38vODdBlAIb9yvF85u6bKnPt8vWg+UM3VypefjLE0xy4Et
	94KYNVZDqNxvMWTqi+xjlf7Lmh88/et5wqrwFIXEimCY9OF+uomLA3+ny3U9123DGu1YRvjM38S1C
	lKXXsxuAVI4CRoSwDO9fSsHN08d2exYkaRZxs4LcaBtinqbDOCZvqOPQkGS4eMlPtWaul8qIfnHYe
	t9yIcxlv1a8yCQ7BojlLP3bojWfvWJLHGcIeWPcZRXpcp1/Yg36Ty0edAos75CXztsVJdsQExJ+cl
	uJ6KRd1VL+ihAbaI92iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGSS-003Zly-MJ; Thu, 09 Feb 2023 23:36:04 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGSJ-003Zdp-IY
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 23:35:57 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 889AA320096C;
	Thu,  9 Feb 2023 18:35:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 09 Feb 2023 18:35:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1675985750; x=
	1676072150; bh=JOfA1zve2uYIe0/1WRppK6GlBT8MQYHItIokJ0eEGMI=; b=n
	f7woXzegwkj1R+Hn1r7/xE+qqVvLhEEmaa5eHBAa8AOtODeBCsCXMv8kW81VMVd6
	uvrKK/M82eDZ5SsaitQS3xlcV6tsp1NZy0k6y6gmaFh6Tfg1fwY6E5QHbVHbpzln
	vLvPvkthp8+BKFFbr/VLpP1dN7dgw7pdVSTPmlL3d/jro2T+qmU/gdcqyjQIwpUh
	eqVZUb0VreTa6gBbqNTgIua31R5OFbmorklE4XNzz6HcKkFiguApWtldwmPbS3hx
	xnyyCclRNxEh/EahOtHQQ2ljlLXRUc2JNXy2eMfTHKtSjP1Q9wEj/bvoL11iSf3M
	PXElMmTLjDlOGAahA9bbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1675985750; x=
	1676072150; bh=JOfA1zve2uYIe0/1WRppK6GlBT8MQYHItIokJ0eEGMI=; b=S
	6ADJCpv/8S9wqyLQXsxAv++IU6u2AWAu7acjrHZ3pKUr6m8hqkr7PewKNEZLOBRw
	wsEPf/7aO3sm1Pxo8+IniEKcnQRK/KXPb6ZNZ+w4eDyx911JejujiPkiVih30orS
	ozD+v3JXY/89r0W8wr/xDwOIcUZDY0sO+AHCVvAFfh9r4x5o/5OGOZp30RubQOov
	leCecTZOnQL3j1Yyt9QGoFbj6jAsg3W/dLFcrtuQ/8y9yWrUryp/G6PdWBBgGKRp
	pKpa2oJzCw70zfOybYkphMG8vH0scyl6Et2T5cSgT+OYH3ly3MZ8SMxBYNtyG7LP
	W82F7rPiRk7GV9RNtjD8w==
X-ME-Sender: <xms:VYPlY1RdIBlulpeWoDy0RRiZRgvchiOcYiRG3_GqJVftSolEo-sClA>
    <xme:VYPlY-xQB_Ds_PsTTrKDRqxUIgu5xoxPuKEddf2ShtNB1NGxwXr4yC6KD48LjYCmh
    bV1aT4C6Ccpkf2crw>
X-ME-Received: <xmr:VYPlY63Uwf4Cm0DmJhYPwAFyBvQZRI0sYpdEjM4Xm-Y80Yo8EOIckn0o4jHJZ_2GGmhROO9aF9h64wGoN8X2Hu-xwq_tSEt8aI0cWkA-zoB6Rk-OQt1gCQp7QA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehgedguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfvfevfhfhufgjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeejgfffhfdujeeftdeuudeguedttefgieetffffheejuefguedv
    heejteeftdfftdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:VYPlY9Bn-vfvW32oe8NXuqBghhJUrA92qgHk98uOQI5uRbRKvLIzLA>
    <xmx:VYPlY-jX5t59AYloVesErqvcXITFTP4_ibiQPhiD7mNZGpMSr2ZjZA>
    <xmx:VYPlYxr6Cgm4SWhbkP8IqzFyZAx1pznZ8SuHWCdAnKZDCY4-G-9nTg>
    <xmx:VoPlYyju1h3H7rb5wef2f1N_WmgKW61DcrHADeU-MY27pYBwPwWMnA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Feb 2023 18:35:48 -0500 (EST)
Message-ID: <87a0a7c9-6069-b043-2fc2-8d1bc05ddb1a@sholland.org>
Date: Thu, 9 Feb 2023 17:35:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 linux@rivosinc.com
References: <20230209232302.25658-1-palmer@rivosinc.com>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] clocksource/drivers/riscv: Refuse to probe on T-Head
In-Reply-To: <20230209232302.25658-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_153555_922747_941FA203 
X-CRM114-Status: GOOD (  26.28  )
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

Hi Palmer,

On 2/9/23 17:23, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> As of d9f15a9de44a ("Revert "clocksource/drivers/riscv: Events are
> stopped during CPU suspend"") this driver no longer functions correctly
> for the T-Head firmware.  That shouldn't impact any users, as we've got

The current situation is that the C9xx CLINT binding was just accepted,
so the CLINT is not yet described in any devicetree. So at least with
upstream OpenSBI, which needs the CLINT DT node, the SBI timer extension
never worked at all.

> a functioning driver that's higher priority, but let's just be safe and
> ban it from probing at all.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> This feel super ugly to me, but I'm not sure how to do this more
> cleanly.  I'm not even sure if it's necessary, but I just ran back into
> the driver reviewing some other patches so I figured I'd say something.

This is not necessary as long as we add the riscv,timer node with the
riscv,timer-cannot-wake-cpu property before we add the CLINT node. So it
should not be a problem for any C9xx platform going forward.

Regards,
Samuel

> ---
>  drivers/clocksource/timer-riscv.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index a0d66fabf073..d2d0236d1ae6 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -139,6 +139,22 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>  	if (cpuid != smp_processor_id())
>  		return 0;
>  
> +	/*
> +	 * The T-Head firmware does not route timer interrups to the core
> +	 * during non-retentive suspend.  This is allowed by the specifications
> +	 * (no interrupts are required to wake up the core during non-retentive
> +	 * suspend), but most systems don't behave that way and Linux just
> +	 * assumes that interrupts work.
> +	 *
> +	 * There's another timer for the T-Head sytems that behave this way
> +	 * that is already probed by default, but just to be sure skip
> +	 * initializing the SBI driver as it'll just break things later.
> +	 */
> +	if (sbi_get_mvendorid() == THEAD_VENDOR_ID) {
> +		pr_debug_once("Skipping SBI timer on T-Head due to missed wakeups");
> +		return 0;
> +	}
> +
>  	domain = NULL;
>  	child = of_get_compatible_child(n, "riscv,cpu-intc");
>  	if (!child) {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
