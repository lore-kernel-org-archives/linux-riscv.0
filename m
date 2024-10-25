Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6172DD3A66C
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 15:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KpsaB43798P4uhIWiv8Adtl2o8nmvp+Fe1H27a4ltmc=; b=xfFxkq3umzuArU
	vPM8YMkANQWQO7W/CzCErQH70A+1PD3TpeC98HoV41ujdCaGTn10PDJ/QdcVbFHVb61umtnGdyp5T
	8PkaryoGIOA7lwWghsdeqvMC5oCUHg4V7aJPh5mQLhzTqtjJ4Zh4oIOJjK5Z++qL++sEctWEARS69
	ing49xTQaLCpYS2+o9B1LgyLx0LkPH9i1U+pW3wP6973gKlfd36eTb1q5D7pzOBL5wQr05GIs3zhB
	S8YSJdBovQhx9g2rAeKv0Fgrt72YBXkHqOhEm9LtZx7IXcs0BexfsdtCrMufQgBZy8P0yUipsnUGq
	u1nxK1795mQoUkvl3GjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oPe-0000000EyVM-2aiy;
	Tue, 29 Oct 2024 15:45:42 +0000
Received: from mail-sh0chn02on20702.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::702] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4A26-00000002Hqb-1ca8
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 02:26:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmD5TBrz1d8psYMushEzawmw+xXSuFnw6svW4Q7safsPz/5gouAsy5ka0uJzExJGDqgFKBnflkQaKWO35gDiIP5qrjsXoBU83WR0vGwLbNvJW3Nm91/w0/wLusNxpNAqQEXvavIhVoHbv5n23EJwc3a6Qp+jAFieTgp6aEFQtEHFVB2LSO+YjvuK3iRwlocwxjsuLO+ndKOxw8j6od3uXgBmFdQWUv7emiTpPNCZc0DbZEitrHomilJ+TadWnD+WpRQf+EIbtWSmr4++/qMILjvDsuMJW3MUGuichZmJmszNHtMfym4lz7/xMG/n6XpxPzhToCFU6fBB4fyP78Pqww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXve3JTMO9j7JYE3j0kQd0CKnXLUfrlY354SqZNl/a8=;
 b=fGeDxSHxzsYtfp42aHEzPf62VmdGe/dHih+okU5/9D8gUarASwL0oiWkvE1tfJG1qwWJ5GaH72q0UWIhiePKfqhUR4139R78BRAftU6Z9CH2/F3rEK5ZZ9Q8ZaUmQZRcEA5WfaSLBNdbCHHoYWpm5HFEtM/ZmmAL+qgTQrJqmN9f2nFeAX+9Mx9nVOnMibHTaqBQkkGohVQmMGwZQQG6FMgAX3CafKoWPvCBCOtm46oGoKXr+pQHqkzWkt5i7Kl6t+PvhOhvzkXKzklFS7Utpa3nbJ838KhcQPCamMkfkl1oKLR8WB2ipvGlYPCKH1hPBfBh73ZBPlJ60hnVbT/QSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1291.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.33; Fri, 25 Oct
 2024 02:11:10 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%4]) with mapi id 15.20.8069.031; Fri, 25 Oct 2024
 02:11:10 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Emil Renner
 Berthing <emil.renner.berthing@canonical.com>, William Qiu
	<william.qiu@starfivetech.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-can@vger.kernel.org"
	<linux-can@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 3/4] can: Add driver for CAST CAN Bus Controller
Thread-Index: AQHbDP78QyTswaw7pki8MOjaOJeAtrJkAHKAgAC5iGCAAI/MgIAxnAvw
Date: Fri, 25 Oct 2024 02:11:09 +0000
Message-ID: <ZQ2PR01MB13076C761C45F2D5834DA718E64F2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1291:EE_
x-ms-office365-filtering-correlation-id: 5ee6e6b3-d73d-4fde-4029-08dcf49a4b03
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|41320700013|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: ZV7vdnYnKu/IPmzURWv2K3L3quePUfB+kHLeZV9wlov53zmzg0rpROfDgImasLpl4FZe61QKP5MPW57z2TAce7m3qpUXxQ9pku2WRBbHhHy2MryvNBVnUGg6PfXwXIWef6EsQkORruxiXH7s+ol5IMR+34SL/4wMQ9smUea6DY7St9RS8hpV/uJaiD3I4GmhpTj86tA0rKShQBYcnE6GZWqWc24K7ACeca7ZWgZHPHbmlaXLZ4o7BVEo4IT7BtnNEfRGVHSAoLEYBQ+J5+YUR7Yi5aWstE9zxOC+oIfp7musYz6kqEzY7Vx22yQ7nv3LvjftBUortTqZDsyaUrou9Bz4+ItxgOi2aVbPOsp2syXMbd2jhridiDElP6nPV3UMhExix8+UQgN7/kE+GN4RRUVmIYzFRSIPEVloldXixtPYJc/X/81yT3HrKbX+gsvcqqRI5Ly7XSjk85qXJP3yGWHXsbY6sFJtzPEyIf4cYI2R/qkYcKxObCWfgsq+Jvl81SJlR7cbxM9Ti0/vvet641SJVSiGNY/rvNFffPq7UIohy5lTuOXHNB4dyGBuir33O0AyyiTEghOU3lXgs4HBLwWWNlEDrLE4ChmHXita1rJyq6rFSfzTt1hddR3NuJo+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(41320700013)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vrQo/2+v4clwuscgBDbo9+0vaiG5jpWrGFs0NLcRy2zj/eDa9tmjDIckP+ys?=
 =?us-ascii?Q?HHW7dNmkFJCjCiFHmhroxGbdcirLXizbmS642E3PTYfa6n+Yzjt+/Q2LNoRH?=
 =?us-ascii?Q?UYqWVJRJdckkpQoLL0FoMk0OnUMmrkFabhqc35Z/rTUTBBAWSVaHmmXNPrOH?=
 =?us-ascii?Q?LVLou4NSr1KJuqV2yUfpXEzQizua48OsYCM0Ay19zI/EJ7zRAzkJMRjzdCMb?=
 =?us-ascii?Q?zPA4TqutHq6cW/Or6+8O3oEgDwqv4qqg2AbGDhExjwJXr5hYkq0UsTGfD6uX?=
 =?us-ascii?Q?tB3F0oNnjcDLrDTF5A+jnczfj6N4Ht24bG9DlMi/HCb1sAOFdvlGmF0uf9yT?=
 =?us-ascii?Q?RBcWxCBNi+ivy56S1abBqHoWmlPqdXoI2dkqBWDxitar+8yeSgqPJNlfw1JO?=
 =?us-ascii?Q?O3i+wDoJ3mu7wgPQseJ/pcCLyN8N/9113rId4nFXAbpTXELaRjlw0cqDp47e?=
 =?us-ascii?Q?3uwUrb9GEWLUm7tZ9p14gEMPuGS+c+YF0Fw8l0RGgclue0GKpiujBO38QAHm?=
 =?us-ascii?Q?6Pr3bci9gjbpqKCF8+s08anCE1Ki9E9ha99CWVUHYv1jIXzJDWJuBiT8er6D?=
 =?us-ascii?Q?gvTvaFM0reD1pRfPzsQVMItfRLg/AfUAB4yHwXE0J8B5X7YqKTw70qgcmZHf?=
 =?us-ascii?Q?xBhgKXYrSI4uHtAQ3FMmAcylnghGbIY0xif5TU6mUaz+tKEqrnC0S984uovs?=
 =?us-ascii?Q?YaLb+X/sqvaA+A1FZ1y3q0mq+PqWiveEAKQkudGaiyEGBKoocpdVj9XjEsYM?=
 =?us-ascii?Q?79cillnRAY+/U90ZSqmoQmKed0loiv0p5qv08ZIZtH/ValKta1i+FyAci6x/?=
 =?us-ascii?Q?3EgBYvspJv2XCusBt2+3gDmv1GlSD4k+vnjTc5Bp1mtVdIdCPAQKz5MqQfV1?=
 =?us-ascii?Q?yN9g01NykRjA2FPjMUnaUbN7kIElWY4dJSg9/KqbSXA1DWtb0b2hGncyAAhE?=
 =?us-ascii?Q?dWttapqdDeUdqZjj2Y9GEgQZAIrsuH9bQR5+tdasV0EaLsRpozZCQO9Y1gzB?=
 =?us-ascii?Q?goM6m4WM27FnDtVyKAtLr0PEXkxBs/h17WFZ4DLM0yEKWnC79urQHRIUwTy9?=
 =?us-ascii?Q?vecPPtdBvsRnxFXZgRoYr1RQQi6LQOXOfM9vapi13BPMKNHGVE0MIvZLi0DE?=
 =?us-ascii?Q?Sspn0+kU/q+gJcgzqKoPcl7UkTiBAV7F8/VxtFx2bt/4i8lKZ92bVMHwM9s+?=
 =?us-ascii?Q?ClDnI9b1JNAu1MxlzK8046xrzxq+iN0lbSuj/2WFNE21S1oonWhsahUT+ga1?=
 =?us-ascii?Q?8/jXwJp3QIFDl/f0sUFbeb1NWJuU/N/O8nBE7jwJiJsdBbg1rs3XZZY94Hsa?=
 =?us-ascii?Q?TOeACyztqZ6qRpeQCz8oLnmMUdJtGveZHemNnCaZmYotpffG0HNcHO5Vv6pK?=
 =?us-ascii?Q?BXH2+N6hjvT8gAXCbde+SYT9+K/jmxeGGpET4YhkCGObSM7Fv/Mj9T0F236r?=
 =?us-ascii?Q?1EgfbCXc4FNV8H65hBIQkAbprszmsSD0d8ucoQrgQJzpPGW7Kplu0yhUZMmu?=
 =?us-ascii?Q?9OoljftsU+HnTYrh2L/4VPKg0XTYAff0/BlCJ/AVWyKN2Bcw6Y3DJy2G6lEZ?=
 =?us-ascii?Q?FvaTReRzpXKBehn6gLrlucVj+i84yKQVkfPgGj1X?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee6e6b3-d73d-4fde-4029-08dcf49a4b03
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 02:11:09.9851
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IWUOU/V0TMVBtWqtZYRUHVoPBH7Stv2DWeBoLKMXp40YWR4CSWehTrLIfYwqIPwHZwlPX0ZRymA/9FkfTfOoj3alE0YNKj+Ec36Ae+u2xUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1291
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_192634_437413_DB9344C6 
X-CRM114-Status: GOOD (  22.44  )
X-Mailman-Approved-At: Tue, 29 Oct 2024 08:37:07 -0700
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

> On 23.9.24 20:13, Andrew Lunn wrote:
> > > > +	reset_test = ccan_read_reg_8bit(priv, CCAN_CFG_STAT);
> > > > +
> > > > +	if (!(reset_test & CCAN_RST_MASK)) {
> > > > +		netdev_alert(ndev, "Not in reset mode, cannot set bit
> > > timing\n");
> > > > +		return -EPERM;
> > > > +	}
> > >
> > >
> > > You don't see nedev_alert() used very often. If this is fatal then
> netdev_err().
> > >
> > > Also, EPERM? man 3 errno say:
> > >
> > >        EPERM           Operation not permitted (POSIX.1-2001).
> > >
> > > Why is this a permission issue?
> >
> > Will use netdev_err() and return -EWOULDBLOCK instead.
> 
> I'm not sure that is any better.
> 
>        EAGAIN          Resource  temporarily unavailable (may be the same value
>                        as EWOULDBLOCK) (POSIX.1-2001).
> 
> This is generally used when the kernel expects user space to try a system call
> again, and it might then work. Is that what you expect here?

The bit timing should only be set when the module is in reset mode.
So we return an error here if the module is not in the correct mode.
Could you give me some suggestions about the return value here?

> 
> > > > +static irqreturn_t ccan_interrupt(int irq, void *dev_id) {
> > > > +	struct net_device *ndev = (struct net_device *)dev_id;
> > >
> > > dev_id is a void *, so you don't need the cast.
> >
> > OK, drop it.
> 
> Please look at the whole patch. There might be other instances where a void *
> is used with a cast, which can be removed. This was just the first i spotted.

OK. Will modify for the whole patch.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
