Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F43C77B75
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 09:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7kW/fGYPyQFu0rZbWj8gWcDbuz/uvv2oVIfldaCV7I8=; b=4qsOi/h+qnplTR
	H9bmD3DTAbvdZq+r1b95STY4i7PdckWfCxf0DLz1MngS0xi50d7kDPsfOP0fPVQbYES1KeZ2HlBpm
	bedyzaOX9GiCipmsx4jwA5FbaZf2RY9CxOXhxbcXKBk9RFJ4N4b4EijXEuXqhB26Ersr2nUtqQKN/
	Vi5QtTnrQQyw3NTrMKM9ZPoH/AS+sYJfDm1unMsbL/RYOylZd2iw9dJR4YYqPKu2XYsuW6V2WdXa9
	84KaBH4ESpGsASfLC8WGLlnK3NCtYaC2LgA3NIn2tsML+898NYDiCwWYOPCXpeiDpuGqEYDbcLrid
	T6iftvQOxjIeesD4WHOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvxTA-0007BA-2j;
	Mon, 08 May 2023 09:47:48 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvxT7-00079x-1n
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 09:47:47 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-133-aC6YXYG9OjSIkw3kXPonVg-1; Mon, 08 May 2023 10:47:38 +0100
X-MC-Unique: aC6YXYG9OjSIkw3kXPonVg-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Mon, 8 May
 2023 10:47:37 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Mon, 8 May 2023 10:47:37 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Maksim Kiselev' <bigunclemax@gmail.com>, Andre Przywara
	<andre.przywara@arm.com>
CC: Icenowy Zheng <icenowy@aosc.io>, Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Cristian
 Ciocaltea" <cristian.ciocaltea@collabora.com>, Heiko Stuebner
	<heiko.stuebner@vrull.eu>, Maxime Ripard <mripard@kernel.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-sunxi@lists.linux.dev"
	<linux-sunxi@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v3 2/5] spi: sun6i: change OF match data to a struct
Thread-Topic: [PATCH v3 2/5] spi: sun6i: change OF match data to a struct
Thread-Index: AQHZgHJVw1wL+axJhkKYU1TQITl02K9QIrDQ
Date: Mon, 8 May 2023 09:47:36 +0000
Message-ID: <702d085b3b814759a344886364c518f8@AcuMS.aculab.com>
References: <20230506232616.1792109-1-bigunclemax@gmail.com>
 <20230506232616.1792109-3-bigunclemax@gmail.com>
In-Reply-To: <20230506232616.1792109-3-bigunclemax@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_024745_888203_6EC2BD23 
X-CRM114-Status: UNSURE (   8.08  )
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

From: Maksim Kiselev
> Sent: 07 May 2023 00:26
> 
> As we're adding more properties to the OF match data, convert it to a
> struct now.
> 
...
> -	sspi->fifo_depth = (unsigned long)of_device_get_match_data(&pdev->dev);
> +	sspi->cfg = of_device_get_match_data(&pdev->dev);

Is it worth doing a structure copy at this point?
The 'cfg' data is short and constant and it would make
the code that uses it smaller and faster.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
