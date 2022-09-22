Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216ABC54EE9
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 15:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qc9EBFkjGUEM8CmZAUNHWrphpa6OTAToiR7EC/nTgiI=; b=S5f/GIg3zA5wO1
	OXRQjUtfp+1DZQn4O5+Ns4BGAKdqWuj434xl20Qe/5lfsZf5uw00ft/wwJVbRDujonZnWkM28zBKj
	TeQ0EGeRgM12fez+hg4wkUhO8hXMhv5N6jhuKQ00oQJf6ukZvSuMU0piZovBYpxtXlcSoCj/9Drhr
	9bJvyHI5jmoDKDcZXJjqrHFO8ovxQIR4G80gZmg5lgcNA0dahxwK0qPpzZ5iv8Tw8j+JZ8I+sZrtM
	3uKVH7pkc81KzDIeNY2qIlNl3Afy+kmQHP8l9deGBLXfxirmojgPNxxX9e+817hRAXTKZ8nHPgdYM
	BTs1QlOYV5h/9Pfq8ZqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obNsH-00GKfW-Vp; Thu, 22 Sep 2022 15:12:26 +0000
Received: from mail-os0jpn01on2119.outbound.protection.outlook.com ([40.107.113.119] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obNgX-00GExf-Ji
	for linux-riscv@lists.infradead.org; Thu, 22 Sep 2022 15:00:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdo2gx1iAf16b96VgmEKF7LorNloOd2oGmW4069AeE7jjgRXRaCQbrMvF72KbWUbyTV8y8xiXp2+guoiRovLGw+PNPBadTDUoanPG9tI391BoQ3bD/tdv2Guno/fLYGKg0GWiKQv3HXb9ux22KFRQf5D8wArqbNa8/VEjCH24JjIfKvWripGYTa55PIZXw/QC1ed9DoZmj1kArRvCRCfcZkVY0Yd1YBILhGoovxF1wMq5NZJtuXelxz3bncAJt6G31OwtMSOgHdnK6qO9baCtt6KrSjMixIqL1kDUvlsP3o+YMrB3+78gdUIa0Yu+1HwQ2f1D6MsR9x7pH1TgY+HoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkCs6M6ilK5DipKzvTC6mf9sLA0PxzD5E1HW1qso4iI=;
 b=jgfEzhep0tpBMJrSMPh7C5QzCgZQYavYawtZgV5pET5wc+wDoWeIarQ6Vi83ocPIELAgt3xf76krJRhWWsunGI0C4nk+rIYlkx/aNiqNbKS+QyAsvye2aJi2gpOvJgp+KAr1BUeK7V71CBdhg5DTahEwK3d8IRWoaoemt0nV9hU/VOB0BqtW+k7cHipnNb26yMjtn1AzvxxUwQpZeYFQ0g9y3vgSFe80zJVVi1c80F5fDouQmXGFCcmkLr0nqC/r3HuzX7Q23Poh7lCNG8KAk6VG6rZ5gyGOVGMyq/FQZ7tXePhhwvhwvWSPbA/Q6E/gsoxaQ3bz0HeKhYeWPmWQbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FkCs6M6ilK5DipKzvTC6mf9sLA0PxzD5E1HW1qso4iI=;
 b=RUJhCqXAchsaGvJEFR/1d6e3NMAo+lDfU5ipu7PxtcOySgP0NQadVxdttMdawwX6e9PZugX/pssemRqLExDwk8nj5CpJf9VeMrNp9+hkPgVrxokf2611bt0HLLJoGfP2k5elEOKagGsYHKSJqvmLfz2UWKoMYN5rGDpWYxU5dHg=
Received: from TYCPR01MB10588.jpnprd01.prod.outlook.com (2603:1096:400:309::8)
 by TYCPR01MB8867.jpnprd01.prod.outlook.com (2603:1096:400:18a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Thu, 22 Sep
 2022 15:00:10 +0000
Received: from TYCPR01MB10588.jpnprd01.prod.outlook.com
 ([fe80::68d8:5e72:53f5:ea7b]) by TYCPR01MB10588.jpnprd01.prod.outlook.com
 ([fe80::68d8:5e72:53f5:ea7b%5]) with mapi id 15.20.5654.019; Thu, 22 Sep 2022
 15:00:09 +0000
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: Chris Paterson <Chris.Paterson2@renesas.com>, "Conor.Dooley@microchip.com"
	<Conor.Dooley@microchip.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
CC: "atishp@rivosinc.com" <atishp@rivosinc.com>, "apatel@ventanamicro.com"
	<apatel@ventanamicro.com>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "prabhakar.csengg@gmail.com"
	<prabhakar.csengg@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: RE: [RFC PATCH 1/2] riscv: vendors: andes: Add support to configure
 the PMA regions
Thread-Topic: [RFC PATCH 1/2] riscv: vendors: andes: Add support to configure
 the PMA regions
Thread-Index: AQHYwdrGeUEU7xo1X0C5pIjumEuYVq3SNg2AgAFpbSCAGANp4A==
Date: Thu, 22 Sep 2022 15:00:08 +0000
Message-ID:  <TYCPR01MB10588B0DABE67D528B412E9C9B74E9@TYCPR01MB10588.jpnprd01.prod.outlook.com>
References: <20220906102154.32526-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220906102154.32526-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <8ecb62b7-53c4-1c43-65b3-567d8c12e131@microchip.com>
 <TYCPR01MB1058865290D9F2ACFE99086DEB7419@TYCPR01MB10588.jpnprd01.prod.outlook.com>
In-Reply-To:  <TYCPR01MB1058865290D9F2ACFE99086DEB7419@TYCPR01MB10588.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB10588:EE_|TYCPR01MB8867:EE_
x-ms-office365-filtering-correlation-id: f8521ccc-d3a6-4e19-42f1-08da9cab2462
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  CkNYpm1AlLTgtdyUVeo9zt9baw6tGgiALJ+6gcs/D9eOwqHQyE2XO/kxtJNoCODtNSzpwQmvUfEogVzRPGBLXgwTqa7EoO38+ABJGNholTAq/RN/nxZ9vBiTvViUq0xTPh1AXIQp9ttelMqLLCfcfdY78KYGfafHRqPT/xwCcCGWsQH1n5sjivys1ENifbqRkw0Y1FfyyXz9Ru7ekIG36Q7y1EEhNgpRtGyuamlLhBYkRc3ykTulrkEq8XnUO6NdKOHPYZeLP1ZSSX7da8UiTa138MKwapRdooRn2IUa+YQXsx6aMrMoNe5nZAv1ikOOFpJeQNdhKxyfBdMSZI9LGNYBEwJkQ5//URlouskqTlc1unr0YXS8Z4DTjiD6pL+8yvGlZMVf0iqfp8zE4zpS2CDxN10lKecLOY3fceMXispjqrYEObok9CfGCd4pgbkUS6efGAAmiWcRkeS59wmpNQoYt8e+mxoOAWv6XW87q2wUWpMuncJUYlzEdyrZRGWG9V5ogohh+XSdHEjaRue1lMsc8xFSstcakrQy1a61fXYJQ+lMl+4O5t80JwzupU497E1fgXhrMFNwlJ/apa4htw2cGCqM95lzPjteh5krzqsaJHGwbAdiLW6AwzMj0wZ8mu35x+4UvBIEqSdnqKbKTBCQWduwpXhBvunKH2BBRD9SPe/aGKbLgRHLbmCZUnxpBa3G8MzlNA9FJKmAUnTgfczbt2nL1K/i5+s72T5nd1hujjBoRKVtz80/IMQ8LhAzEPkURyFHEECVuM3ynPefIYvpUCQvac5yC6kamR7vf4KBPeuN3m+QpjpL1H2FUJLSnoC5norD7OAz1CdOX7HOyA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199015)(478600001)(26005)(86362001)(66946007)(64756008)(66446008)(66476007)(76116006)(66556008)(4326008)(966005)(8676002)(186003)(107886003)(8936002)(4744005)(7696005)(2906002)(33656002)(41300700001)(55016003)(9686003)(6506007)(7416002)(5660300002)(71200400001)(52536014)(316002)(54906003)(110136005)(38070700005)(122000001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?Windows-1252?Q?dLU9UzyIhv1yGfdAx076mVr+0y96Zjgz5nNWTz9C65TTv5fO1FbxYlw3?=
 =?Windows-1252?Q?3zkU8bP+7ePOpK7rXHP8vNc0f4h13KUG71rao76kjEm/4jGxaz27fydU?=
 =?Windows-1252?Q?WHj/mPKHQLatfuKWGv60sSyGSeXlbpOtOgG+ajajGAomrKYB/Y28R9Du?=
 =?Windows-1252?Q?vJmJ/0sxyVq/ICFUuQeFfFnrg3yBpEa4eCYmF1Y0mFgNs5xqXXJFOwpg?=
 =?Windows-1252?Q?ZxHH+bz+OSREb4lHmf5hj87HZTqFqJju2Cu+TcVFZDBn2EUnXMBFe0uS?=
 =?Windows-1252?Q?tuK20C0aKYkv2qzHtvxbY4urGoN4mGJ7P5aue3/lclp7T9VFL60hTi9W?=
 =?Windows-1252?Q?eV1stM63SLwpXi1v7vkGsgLWUp0M27ZdI0RCDTWQnkg6MWPgW7c+BNng?=
 =?Windows-1252?Q?GN4+wRgbp/lk0pUraT/FW4PHxz5uLRUPQ/o95+Vkxgg3/raE1AWo8DqN?=
 =?Windows-1252?Q?eRnIpwqlMFQSEVpP5zPBNtauibzUxZ5FWw0t4A5xJHhQQs9PRNC43qrG?=
 =?Windows-1252?Q?mK1XlqXK+EkvLIfzvS7HY+NlJ9batjeLF2DZaVkp5ZXLUfLM8RGE3Iw4?=
 =?Windows-1252?Q?ZpXMNFZ8ZTatIEvh6IjwYOHbkV9yq+77wo5bt7f/xk5y/IzLVWArgfDV?=
 =?Windows-1252?Q?U2FistLnI/spG1DDZ6JVN+VS1MUk8UzlveBuOuqh8HUwGvotS1Mp6XWI?=
 =?Windows-1252?Q?3VGwQANMjdq7ZlVHki8eLortit9sX7vDEwYURIzm7ozic1pLlz+NpE3E?=
 =?Windows-1252?Q?dUkVn/ifYTGgOCS9RREt8IZfuOg8lMo2zmkoagFO6UIsFhRKUJ6GvMgb?=
 =?Windows-1252?Q?ApRmoJQY8oSHz9xysZ+rBuShHGeZuAlIGgXXznnHqCC0cFNEwP+lqOvv?=
 =?Windows-1252?Q?OUS9Q9Rr8gLScE6yvnIk7BRElXczCSGaD5KUwHLnKFwuGU+Y1cgVE0D7?=
 =?Windows-1252?Q?pGvxfbRu9zrJBmH7vpgV+ms49C+/OG+EtwFcCENzzU62jY5PsrUPcFfh?=
 =?Windows-1252?Q?+/2JePoGnaC4kKH3MNVJclTd5aUPPrb1PPRRuNDd24/9ud32sHFU3HXl?=
 =?Windows-1252?Q?YfaFzpQqWKyipO9Qw2vbYR3sKrHgB7t0q5sZ5J/uwK9pGKRVuh818mwT?=
 =?Windows-1252?Q?Ga2ybv+1VGIBSlQOPGdveYPqTsiA7O+x5S/Ymww8gbaEbWy7j2WkJ1un?=
 =?Windows-1252?Q?BMkg088cqqSEzYk8fHmOA3AvN7Sdf2dxUBm3YKLAdj4ZHxlBiSZojIYP?=
 =?Windows-1252?Q?HvSEhbZgh9Va4JRX0RHSSS/dX+y5+HXMt1PpU0YDMiMv4OQ//sVXi6GN?=
 =?Windows-1252?Q?n7nkGQtSowOB4jROnQaQp2l57kzrIHAdOJbQn78YJ6AiLpWUMd8cR4Vj?=
 =?Windows-1252?Q?NPsQymZUtGwbwVe9ChPiumrZbQysv+tkAZ5VzA611tov8lbidstP7h32?=
 =?Windows-1252?Q?+EUBdb9Q3q1+2oZGZlhoimC14nu7IQBqu+0CjIa0cXCSmg4vi9YIuVyZ?=
 =?Windows-1252?Q?ImI4/K9TV/JzDstz4hPrGrBOGI48PYwx72aWo9IDOWzvHs3wORKwMX5z?=
 =?Windows-1252?Q?2aE0LK6SVwYYcTZ3SPA/R/SUGXAq/zVLbnRGwhX8U4fh5PHrNHO4OE2B?=
 =?Windows-1252?Q?zhw+u8FDm1pCrqo9X8AmSp9BDADBxFUZeDzvFVU2EjTYHdNlC+P0Ezt+?=
 =?Windows-1252?Q?I1GQpIIYFY1gGww1I6bTVAICoNl6jbM5YjAKLwwnJj0p29sqnC9kVw?=
 =?Windows-1252?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8521ccc-d3a6-4e19-42f1-08da9cab2462
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2022 15:00:08.9481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nmMQHaLePsYF/QIgm9C/IGk+n9L0LjvRByoWLg8HIImRE0G9sV3Zn1tleaBe3EbDYEaCHyF9pci3CKPEecfJLxxW+Ci6mfBSiH9H2UMbR84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_080018_159461_8C4F65B3 
X-CRM114-Status: UNSURE (   8.94  )
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

Hello Conor,

> >
> > btw, where can I get my hands on your hardware?
> 
> The latest information I have is that it should be available via various
> distributors on the 21st Sept.

I've now seen it at the following distributors, perhaps there is also availability elsewhere.
https://uk.farnell.com/renesas/rtk9743f01s01000be/evaluation-board-kit-64bit-risc/dp/4051136
https://www.futureelectronics.com/p/semiconductors--embedded-solutions--embedded-boards--embedded-software/rtk9743f01s01000be-renesas-7166252
https://www.avnet.com/shop/us/products/renesas-electronics/rtk9743f01s01000be-3074457345649323718/

For those interested, the part number to google for is RTK9743F01S01000BE.

Kind regards, Chris


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
