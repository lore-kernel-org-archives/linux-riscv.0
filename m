Return-Path: <SRS0=LWxS=5C=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F1AC10F29
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2020 13:35:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BCBD20767
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2020 13:35:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uH3lVqjD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="KsS6p0MS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BCBD20767
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+MKHW669WEkjd/iNBh7MeO0SsbRIG9idSMvjhyzbiM=; b=uH3lVqjDCkfYRs
	7V63HHTw6+zVrvUG0bkv0B4uyVZ8KWMDJ2wzjT2IpXs9buo4m3iaEv+PbACWIXbNFgT79qQhembmX
	ep2GGM2Vrhf+IAcw0HpQK4NzMab7FTQ0mv0zrxffKom3/lHx7AL0FrhxJ8Q2cgPEL8OUZkMmR2xjN
	92BjL9vN9bKSjaf+8o9Esr1NAJmef3Zb0SHBgr88GJ9v3XG05tQYT7/YFQ6eZsxcxHVwpOzk656wO
	z2ryVU+hnT6BQvKXK9XvTAvoxkF2s/bafEFFL2N+lBuVJz/OP9zjmQlY+j1wN73iYNikbs/OMf3cH
	IyFJUfOmAq8GybTEJ18g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jECNH-0006QG-QG; Tue, 17 Mar 2020 13:35:15 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jECMw-0004yK-FM
 for linux-riscv@lists.infradead.org; Tue, 17 Mar 2020 13:34:57 +0000
Received: by mail-wr1-x441.google.com with SMTP id s1so3964929wrv.5
 for <linux-riscv@lists.infradead.org>; Tue, 17 Mar 2020 06:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=Z+MKHW669WEkjd/iNBh7MeO0SsbRIG9idSMvjhyzbiM=;
 b=KsS6p0MSp52TQAcG7pvBldUBF4ekSYc5JYV6QQ25LYZtQM+GqD03+hDirW88u+gcB8
 i1g1ttt45YwZpoH3hjyZl4FIrK4b4qHgndHYQylhjojW0lVnobwze1ck8wlLy/XOTi8K
 1/HUrbQYGcLlGNCRXu7lDrkKVJFeYDXfkS48I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=Z+MKHW669WEkjd/iNBh7MeO0SsbRIG9idSMvjhyzbiM=;
 b=gMjlSadydGyVesnxiuksYpeNateWdSw1LHbzOdCoHOGnsY+8z0QXqFlB/GHkE7uLbR
 gGAQB3i4z21Ekxiehk16MDiqjtRXbd/hF24ffswJlmq2jIZ0WVzLzXC1sG1O+8qwks80
 KlpF39td4LG68SSVNQRHJOpJy6g1QYCcpu5BXsGueEn2dbOVez3bnAd3bDxy9yHCe3A1
 C+N+QzvwApboocll4/g5/hFSkpeKLSZTZsEgLAYRJ7zD9TYECzqHC0EO+oSDlohHnfN1
 xEkCQMq2LaxK7vGCpf3Sfi4h53zjrFs5Y+nzFyUQvYSBYRVbot55xbxKU0rWoRKRIEUx
 PVgA==
X-Gm-Message-State: ANhLgQ2ATipgFEghDeIUD8Xh0qajoiH2mP2xBR5wynng1tj4kmj3rZU4
 suI7/GdgxCZvr6Yob5v2jGgTHg==
X-Google-Smtp-Source: ADFU+vvJjTHmfHQo38ivXXn/g9YSOLIfUDH6jMyjCpk9QGccwR5GHnql6GYdWNxMSbtwzbwStHLX+w==
X-Received: by 2002:a5d:4d86:: with SMTP id b6mr6080882wru.253.1584452092645; 
 Tue, 17 Mar 2020 06:34:52 -0700 (PDT)
Received: from ub1910 ([213.48.11.149])
 by smtp.gmail.com with ESMTPSA id n6sm4003655wmn.13.2020.03.17.06.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 06:34:52 -0700 (PDT)
Date: Tue, 17 Mar 2020 13:34:50 +0000
From: Paul Barker <pbarker@konsulko.com>
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Subject: Re: [RFC PATCH 1/7] pwm: rename the PWM_POLARITY_INVERSED enum
Message-ID: <20200317133450.58c25bcb@ub1910>
In-Reply-To: <20200317123231.2843297-2-oleksandr.suvorov@toradex.com>
References: <20200317123231.2843297-1-oleksandr.suvorov@toradex.com>
 <20200317123231.2843297-2-oleksandr.suvorov@toradex.com>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_063454_539615_EC7FC8EC 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-pwm@vger.kernel.org,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 bcm-kernel-feedback-list@broadcom.com, NXP Linux Team <linux-imx@nxp.com>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>,
 devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Igor Opaniuk <igor.opaniuk@toradex.com>,
 Scott Branden <sbranden@broadcom.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Tony Prisk <linux@prisktech.co.nz>, Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 17 Mar 2020 14:32:25 +0200
Oleksandr Suvorov <oleksandr.suvorov@toradex.com> wrote:

> The polarity enum definition PWM_POLARITY_INVERSED is misspelled.
> Rename it to PWM_POLARITY_INVERTED.
> 
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>

Looks good. PWM_POLARITY_INVERSED confused me when I was working in this area
recently. After applying to master there's no more instances of
PWM_POLARITY_INVERSED in the source tree.

Reviewed-by: Paul Barker <pbarker@konsulko.com>

-- 
Paul Barker
Konsulko Group

