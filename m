Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0260ACA0EFC
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 11:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eyasELYz4kHbau6gF6JA4pkc2SUFH7HlGKhOId5HU0Q=; b=EOljVByrHeUCrx
	LOV+g3xT0+BMKuHdsuSmMNYtJ0nMVrEUlw/BRydDQjApAqPUB/xSW6e0oXBi+0mvURmBJc0z1eGhD
	wJt2GxTKOTfjmNzK4tkxLqoZ6OVBpO+H6Nq6wtgGQ9TwU9uRKtWLWaior2xUbbFx5LUVa1x3vfMsi
	tKw6p9rWnOZH1X37kMAQcBlVaFMzpP4jDNkS5f97TkX0AgKciQvCmBgN2PTegee1tX0J143Ph0viO
	zhkA9r9q37t6Bdu0ZAlYDRBKok8Yjv2kIW7u6BLbCalm8UXHqca7tlc/KHtooS7KQ1feMYgKRJiB4
	eKsZjSFkPjLi3On6i6hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjzhn-000000061m7-3lGd;
	Fri, 30 Aug 2024 11:22:15 +0000
Received: from mail-dm6nam10olkn20819.outbound.protection.outlook.com ([2a01:111:f400:7e88::819] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjzhL-000000061hu-0NCR
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 11:21:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtIPNUoadn88SC1XKOpeXCpOApWAtdhfPMq8kZwXGdeyQ38MfS5vY1cdzC8IDzekHZ85UrtrfLUgXfHbQDbxmdyIj7PZdxCM1h9AQLSi5juGOEfXBvSVAqTEjO66X5xI36Wquu4SJ99yMM58Ui7pubWKTzZkZrkAYkZVEf29Jryv7RMNzrR+9XKODAzgxA/WeC+5yHAHVlLsaOOFVIANi3xof9aurglB/CaRVQvAe90ES9lHno9HWQxlwkazhZO67HPKcxQQm1VaKPLZRBTc2KpLzKKGj6N+23Me74+uYb9wo8NvEofyzc/+wg/kiHY5IshtGruy98E8xJlY7m/6/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBw/ShkxgyCx8P7AI3iBmG4g1YW8TotUnOsQziQonwI=;
 b=mNIytMKrg8BC/NwAmf/IR+w1R/GGWPTrKfIiac/Nal4cSI27iEbwGpVrEfRUVT9Vf4FtMtC0NXS9fOr4XKYTnWdffbbRy0Q7f4xAM7h0b8yuYVqm6iNJMrjdiWKG7BaMWUz1HZQqLqoD9GQXcPy67ieBRqXavaCEUy+dLCOst5fOokCIIejE52q2wFaR76J4snv24AQlh7Eg7mrOyVlCn+SpEx/qOrUV7olK/IYN0af4OZIYIpdnztTIDsUemu+S8fHO+bbfrtfphMS4B3uOISt6PZ+r8Pc8J4qHJz2G0Qd2PzsU5Tah4zskoAC2ha1oyeGVPTmfXMFO4FC5z275kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBw/ShkxgyCx8P7AI3iBmG4g1YW8TotUnOsQziQonwI=;
 b=MZyuU9fyG4FquVcsEC1oxtkXgXmX/ygfuExhLDM136ToteaTnqrj7MXapAIfl7XIVrHVwTVNbpU7qD/Y+5btM7o3zBAzbi4Chw7EQLcBldmYkEkkVhn58RzHCn3WzbYZprmg7CAahn8KWZPuF4BQUn4RsDIhjx8UHrg2tPeMzYOa9j2vQPXso7wAOmEvZ7MeqN8/PfHOAUeuuC4pMl1At2W56Vn3mnA6OPDwYsNJWmNNkiYrvC11QxnKMb/7QroiAmK2TDIesreHIBjTfMOw3nAnV01puszHu86TgPkKQ13ylzvObrjsrWB1zEroDCiTRpZngtg1s3dZK2d8xwdldA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SJ0PR20MB4383.namprd20.prod.outlook.com (2603:10b6:a03:42b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Fri, 30 Aug
 2024 11:21:26 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7897.021; Fri, 30 Aug 2024
 11:21:26 +0000
Date: Fri, 30 Aug 2024 19:20:20 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Chao Wei <chao.wei@sophgo.com>, Conor Dooley <conor@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 4/4] riscv: dts: sophgo: Add LicheeRV Nano board
 device tree
Message-ID: <IA1PR20MB4953AB5F2E922EA4E1E74184BB972@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <20240711-sg2002-v4-0-d97ec2367095@bootlin.com>
 <20240711-sg2002-v4-4-d97ec2367095@bootlin.com>
 <IA1PR20MB4953612773890B94FFD0C9EABB962@IA1PR20MB4953.namprd20.prod.outlook.com>
 <MA0P287MB2822AC58BC43FDE03802E773FE972@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <1b202582-0487-483c-ba80-47125551eb5d@bootlin.com>
Content-Disposition: inline
In-Reply-To: <1b202582-0487-483c-ba80-47125551eb5d@bootlin.com>
X-TMN: [aU/dwTnRLffBxQ1mLqobZvg0f7h+9W5hsoabw+EzwTk=]
X-ClientProxiedBy: TYCP286CA0012.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::16) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <imjioqy667h66iltv2ljygn6f5tnp7lzgsw6y3yxbnm4oxdjv3@sixojxedap5e>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SJ0PR20MB4383:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc660fc-0ff3-4c95-9f85-08dcc8e5e2be
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|19110799003|8060799006|461199028|15080799006|6090799003|1602099012|440099028|3412199025|4302099013|1710799026;
X-Microsoft-Antispam-Message-Info: /V2dbM2EIMo4/dk00UDuDQZZGDhAWgO96ZAgXDlcZynFQ7rGX8mOSviUKt3uWZrMtx/esx2R1fg87hcqFJJxide+QeYQ9KMOvqjHwX/1OThSRTAwJFhENuDB3pMg+8VV9Uswmc5fZLXSYsdwrh31n1AC+grc8CL70gyNY8wRCXAHMqYyh1WN4VAib8ZtFxsfEPBQ1VCZeTBRn98L8z6mDY51xJtQ+OpndtcHmpd4d7HMdJO0SY86fy9V6fwLU7n6Sl8KkQR0QqmdIXNkLyqm+Q8yj+S7hg4I8NIxkWuxFTnAw8PgpZvLeh71zplxnXOuVFGlFpFLYOcYufnpWiL/fQblR7xQoJDL6eA6Uz1NBQpAlh6Gdz5c1sR1Rf4d8084U1BQlrnTuyU1gCi4C4tcNsUQ8gGrwg4X4S800WEdyTiOJvAgXrWAwvqA/1RIrO7Qz0NYVDL6umcNYCXSVtiCacCm8VTA0HNnfAJ4nEvt7TAx3+jKyDwZMTavFVn6VREhYJFK5ILullCzG16zOHJWq6cKnAvCDRwzwCytPTwDc/l/okQ6jf2PdSd5jQp8AZGAiDj5mkfTDaNcVcvSmtoVKY1FKTqQygoVozLjPSft0Niaxc0HJSZjBkfxN67Qu3L+KUrwoPnXeyqaePe4mHvUSK0OVhXwR9sKwQGUZY98DP0fdsS0W2T7qEua/zKZODktvzPiW80dIyBNNO6yhBWOJOEV4vpkhyNrTcrvsglyfUsmY2ggBAyTsQKtWslF/6qtVPu6g22DI64at+u9H09UfoZYUkX2sishPF+EOe8AFQnVj7e2C8pFzFydBJtDblbOAGQjL2TJwee9fMR/whjUFPLyGsZW2usx1sG1/rsZGK5I0B23O66Uz/5VdmITixlEOc8UrrIW2OcUfGoG2n0vZVKMhGCmk4z7RzhJ7lkyp20=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RVmg1x7ljtICz4qIY9E4V+DlA0EGf6hSus8bvBUacfnu+KakRAalQREyb4?=
 =?iso-8859-1?Q?7KIj9W+FSdGy0as//NFriLSVrzfkuu8LnctYVHqON1SyY+MML6jknSj8bd?=
 =?iso-8859-1?Q?+NJkTLAQmyEkpIMRHSV+/W5UGdgfFsIKAkf1BcgUZOZltxVt/SgrxbjI4g?=
 =?iso-8859-1?Q?K7BT9gXxyi+ZOvfAWcBKbQ02ywIUqM27y8kd1N4k3gDMxpB6uxWseXbz0F?=
 =?iso-8859-1?Q?bCJYePaBS5Ae+vc8jS5fcS3jrk2zBAJ9nQpvKyM06q4YltdEIUD7flOAvb?=
 =?iso-8859-1?Q?AEVItNQ7Kwe1oaB06XBarUFdZZPOcK5QxrdfLQDcomTgbhMWUFzfR+/81g?=
 =?iso-8859-1?Q?wzby6acFAL+5RNfqqFx7gyy6jKnYa6rUMH98EeWDGxuNI3K3bC+eRTzTwf?=
 =?iso-8859-1?Q?9xX2Ba7DV06A6nPm2+KGEVqb+AF4FgNteWtxx8VjFm6SMwIkv/YgX/o95+?=
 =?iso-8859-1?Q?X6uCFvHFcZxrw7cMaGE3C1FM2sPOAnU81Exme0TForI9DshD7HT4pym8Qt?=
 =?iso-8859-1?Q?LLNNPq+ED2NQHBuZJKmTbGRP/0LTVXewM5XkckfNid2CXJjVAhT+6soE11?=
 =?iso-8859-1?Q?V34o/zN8tpJVW72VqsdTXxv5LIPb5tFT/uJNhokKACXPmETSGFonJjD2Xd?=
 =?iso-8859-1?Q?1XIwRygp2NQC4slHpxay5bjJQAJtB6Dao7hwHvXBDs8ACBUUm50gWYzJaZ?=
 =?iso-8859-1?Q?r6JqjIfLbbemVaVyqlXMUzBaFXx3cM6FAjuKGA3Fc3duXVreUTNT8lYTo1?=
 =?iso-8859-1?Q?MA0oy7lWygz5khpSK19wlf+hRu6XYWKk6+KwLyMHWuF0uNUy2mGU6AAEhT?=
 =?iso-8859-1?Q?MhEo9uBwgGvVtjdjTPROmcsRBuJGifsEfm8YLZ9wJtivO+kcnenAVidEnL?=
 =?iso-8859-1?Q?3VaXWmK2Ox27pSJ0A242fjGZVrlhfrYUoGH6PNJkNivVt+zpMkOICqnKUO?=
 =?iso-8859-1?Q?KqzbFo7aXaMeRaDIcfZWhTbwBkj5k3nOKiB2diNZXu0BQwLsziQNtJGxNV?=
 =?iso-8859-1?Q?25XmYuDYIyOoxYmGUBu+02XflI/+8MyvPIkhWxLTvreBXbhSmytI4x2kA9?=
 =?iso-8859-1?Q?0RKC/fZifq+wa7DBXgkkvxJJ41SteG9IFy9bmfm1dBZBwPdkXeNWYHNmgn?=
 =?iso-8859-1?Q?ULg2Mi7GD2lKcbVYF8EfN7AhqtO1Nl3jg+rHHv0KOKvPealAmUQphhwhAx?=
 =?iso-8859-1?Q?bi1BHCavu8qex3Tf9nLyhU7DCW4F67ovQ6DSucgyopiKzhBDpN5oQmRHKW?=
 =?iso-8859-1?Q?MJPArzSmuBcrIcwvekhSxelobHkVy2vLDfnWCOmAaP2MKPnlbh2ebo++St?=
 =?iso-8859-1?Q?xE6s?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc660fc-0ff3-4c95-9f85-08dcc8e5e2be
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 11:21:26.0242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR20MB4383
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_042147_144978_5072CB73 
X-CRM114-Status: GOOD (  19.02  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Aug 30, 2024 at 10:06:45AM GMT, Thomas Bonnefille wrote:
> > > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > > > +/*
> > > > + * Copyright (C) 2024 Thomas Bonnefille <thomas.bonnefille@bootlin=
.com>
> > > > + */
> > > > +
> > > > +/dts-v1/;
> > > > +
> > > > +#include "sg2002.dtsi"
> > > > +
> > > > +/ {
> > > > +=A0=A0=A0 model =3D "LicheeRV Nano B";
> > > > +=A0=A0=A0 compatible =3D "sipeed,licheerv-nano-b",
> > > > "sipeed,licheerv-nano", "sophgo,sg2002";
> > > > +
> > > > +=A0=A0=A0 aliases {
> > > > +=A0=A0=A0=A0=A0=A0=A0 gpio0 =3D &gpio0;
> > > > +=A0=A0=A0=A0=A0=A0=A0 gpio1 =3D &gpio1;
> > > > +=A0=A0=A0=A0=A0=A0=A0 gpio2 =3D &gpio2;
> > > > +=A0=A0=A0=A0=A0=A0=A0 gpio3 =3D &gpio3;
> > > > +=A0=A0=A0=A0=A0=A0=A0 serial0 =3D &uart0;
> > > > +=A0=A0=A0=A0=A0=A0=A0 serial1 =3D &uart1;
> > > > +=A0=A0=A0=A0=A0=A0=A0 serial2 =3D &uart2;
> > > > +=A0=A0=A0=A0=A0=A0=A0 serial3 =3D &uart3;
> > > > +=A0=A0=A0=A0=A0=A0=A0 serial4 =3D &uart4;
> > > > +=A0=A0=A0 };
> > > > +
> > > > +=A0=A0=A0 chosen {
> > > > +=A0=A0=A0=A0=A0=A0=A0 stdout-path =3D "serial0:115200n8";
> > > > +=A0=A0=A0 };
> > > > +};
> > > > +
> > > > +&osc {
> > > > +=A0=A0=A0 clock-frequency =3D <25000000>;
> > > > +};
> > > > +
> > > > +&sdhci0 {
> > > > +=A0=A0=A0 status =3D "okay";
> > > > +=A0=A0=A0 bus-width =3D <4>;
> > > > +=A0=A0=A0 no-1-8-v;
> > > > +=A0=A0=A0 no-mmc;
> > > > +=A0=A0=A0 no-sdio;
> > > > +=A0=A0=A0 disable-wp;
> > > > +};
> > > > +
> > > > +&uart0 {
> > > > +=A0=A0=A0 status =3D "okay";
> > > > +};
> > > > +
> > > > +&uart1 {
> > > > +=A0=A0=A0 status =3D "okay";
> > > > +};
> > > > +
> > > > +&i2c0 {
> > > > +=A0=A0=A0 status =3D "okay";
> > > > +};
> > > > =

> > > > -- =

> > > > 2.45.2
> > > > =

> > > Have you test you patch with a real board? Especially
> > > for device "uart1" and "i2c0", I suspect your
> > > configuartion does not work by default.
> > =

> > Hi, Thomas Bonnefille,
> > =

> > Can you please double check and feedback, I want to confirm this before
> > acking this change.
> > =

> > As you know, rc6 will come next week and I'm planning a pr next week.
> > =

> > Regards,
> > =

> > Chen
> > =

> Hello Chen and Inochi,
> =

> I'm really sorry, indeed, those nodes certainly don't work, it was a mist=
ake
> on my side introduced between v1 and v2.
> However, I can ensure that "uart0" and "sdhci0" are working fine.
> May I suggest to remove those two nodes? I can send a new iteration if it=
's
> easier for you to handle?

As you need a new version, please add pinctrl node and necessary pin
configuration. And I will take the first two binding patch. So there
is no need to add them anymore.

The pinctrl patch (note it also needs a dependency):
https://lore.kernel.org/all/IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20M=
B4953.namprd20.prod.outlook.com/

Regard,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
