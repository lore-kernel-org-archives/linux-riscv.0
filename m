Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6059BC001DE
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Aug 2023 04:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yopy8Y4f1BQYkdXQkEYg4tLyj2Fz/DF/eBhALX6EvZc=; b=rnbv7Bl4HW4Xwi
	6ktzYUJyXB+RJxyDtuqZUiuRufqU5Xm7xv/pvPcnYhGO40yFYodknb3RwlGUaZb0jyI38WbCE6cnz
	QmnYwu7QkTlc7S/UK/bVg+cP8U6Le3U+A0Z0hgKu5NORvQso2mjwmfvrGB35jjsmqM8+6zBr9g3ip
	KEUIo60eusPOi96N1qFKjzDLi2C8wqs7xN6blJ0HwDNUO1iOodRDP6VqIpP+7tUKumW69o+S0lFMF
	wJTHQGONqqQlsWfD7MOYDmZ3udO05RW8oha34ZkbLiAgmfsTzVJRgHK7xIlr8M8Y6Egv0ZJdMWpD7
	aWc+cOlvdMucw0nnW2Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qV2dy-00ERj4-1G;
	Sun, 13 Aug 2023 04:23:58 +0000
Received: from out-110.mta1.migadu.com ([2001:41d0:203:375::6e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qV2dw-00ERi5-0W
	for linux-riscv@lists.infradead.org;
	Sun, 13 Aug 2023 04:23:57 +0000
Date: Sun, 13 Aug 2023 14:23:23 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1691900622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a6J4O4LcgB0OvYhD9lsAZN0hjV+jYfip4h50cDdtwXM=;
	b=rVBhQaLLGPc/hJvDQWXmWex9rEukDK7PwJImulIVytTKqLck/I3R6y9nlyEyvADT9RWl6X
	+VxaxBClb+sTt5ZPIP0lKXHybhiZaZrez04tQyrqu8zeSSayPCxU82o80rG7MfikOgLW8k
	BuvyNjZYuR/TNHeBx6ER2XBiQb7rgab5aU2wz35zbz7b9ALUJW9fqf6I51foFfFBkjAXcX
	CiIONMTYk7ZycnK+dmm/Ex0GC4VnP1MyUbdtu38lnvuY+/lpQV7acfjg1THU3Z2jstbUYg
	SYXdL44Fym4wk1gzUBET2HWn4pGvLnkhIoh7c6RzFLlQ/Oj7ozQHOgrWAEiKqw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v3] riscv: dts: allwinner: d1: Add CAN controller nodes
Message-ID: <ZNhau0j_tV3EXGxl@titan>
References: <20230807191952.2019208-1-contact@jookia.org>
 <CAGb2v66vqrNZ-ga-1O_bQ16BWXH=RmSHo2Kb+WHJyw-Nm1kWVg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGb2v66vqrNZ-ga-1O_bQ16BWXH=RmSHo2Kb+WHJyw-Nm1kWVg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_212356_366571_51AB828F 
X-CRM114-Status: GOOD (  19.18  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-riscv@lists.infradead.org, Marc Kleine-Budde <mkl@pengutronix.de>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Aug 13, 2023 at 12:17:27PM +0800, Chen-Yu Tsai wrote:
> > Signed-off-by: John Watts <contact@jookia.org>
> > ---
> > Changes in v3:
> > - Set default pinctrl for can controller
> > - Moved can nodes to proper location
> > - Moved can pins to proper location
> >
> >  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 34 +++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> > index d59b4acf183a..24f2e70d5886 100644
> > --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> > +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> > @@ -52,6 +52,18 @@ pio: pinctrl@2000000 {
> >                         #gpio-cells = <3>;
> >                         #interrupt-cells = <3>;
> >
> > +                       /omit-if-no-ref/
> 
> Just FYI this likely ends up doing nothing if you also have them
> referenced through a default pinctrl setting. They end up always
> referenced and always included. For the D1 series it looks like no
> peripheral has default pinctrl setting given.
>
> We can still keep it though. It would help when future chip variants
> specify different pinmuxes.

Oops, thanks for pointing that out. I'll try to avoid that mistake in future.

> The compatible string should be the first property. In other sunxi SoC dtsi
> files, we put the pinctrl just before the "status" property if it's present
> to specify a default pin muxing.

Oh that makes sense.

> 
> I can fix it up while applying.

Please do!

> ChenYu

Thanks,

John.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
