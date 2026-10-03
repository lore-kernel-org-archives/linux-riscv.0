Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2311DCA5FEC
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 15:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vNYcFQgGIKwwVQ+inaD5OMa+4GlyafHAXZX9FfBKgQ8=; b=TRBPFIalmpZJ//
	9MY7U/yqdFVtaU9dzysdbbRzUth990b/fPByEPZavl5nxflnk6qDdmYwBXM04VOXduvKUfUmGfK+j
	QNwTmVe+86v9C6pTLCSOkOzOtGNQ6EQ34LsyIzWj13rV7GhLSvqhZXHHJIoeZOz/55x0AyjzkMRPG
	d1fPh54PwFTAq6DdecYuDKs5TzBosAm9njKjRse/Ripuf4Pb8edOPPUtw7WjJcJHiguXvUPEnuy3Q
	CkDyn2koDvyjo1pT41SKt7p/JPekH/i5/Ib93jFT1T+YF4Nw6t8K2JSaP1JBEkI4Yd7dD/QVRuMdz
	UijfE+Gucz8ucZm4aQ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD1Jf-0000000DfVj-1gJh;
	Sat, 03 Oct 2026 15:06:23 +0000
Received: from mail-sh0chn02on2071e.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::71e] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD1Ja-0000000DfUT-45c2
	for linux-riscv@lists.infradead.org;
	Sat, 03 Oct 2026 15:06:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYntLZ6yYKvQ9FZajFezJPPSD/KQYP69Q72L54zSQt4L7O31+jgDG0T0Gp9DVHWT8AQm4ewnKT5SSzOnrpsp+qmYG8gCCIggKbMMqlYJVtN6RG0VlKSOETLDFS8Km3ZB6Y0dm7tNl9O+/HEFokILdRVlD5WFeU9wnFB2DG6P/038wzj3XP68RYOq2TpDislfR+vLlCu+0c8bTslMsMZp5CF9Rq4majJ0ey0ZMtqHEZ41xqbqwUqFzssryGgx0u2w7tg3xo7uBdfWMyqCoLPAb4Ku9KTLgJO3xzfzZ/P29p24iBj2UAVD0HJNPtmVvj9p5ppLN3jBvc4oGfZrxhoS+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVggss/HtsWb6ofccQwL6CYpS6oEvLSU8P2tHr1RsbU=;
 b=msQTStKi9hCcI2u2vqQ+pWveHqb1dvLmVqibnFfixMPvel9rpK8Ag/M9rXpYp5w4dzPsL1x04oiT1w8xFI9JBQfbFULG7nqVVeFVu6X4zmB/GhDdTu0p8hMshEplnBNHbuNeEdCHyr5t5i/YjeIfg6Jfw3PD4ChnU1A7sovR6Blj71QLgsXx53GF+6Mvyyek2G/6x34xenfzUYzFn6JC/zYNsiLMbqp/fP7hbquceG2IbSRtL4Su64GwVVSMmzeDD44aZBt6Ne8si5D1u0NxKJ5F12L0zLbooY2GIBCtyL15NuY8myJ72tXkLyoEU1zEuKPSd/M3pR/qu8reBblBPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1316.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 15:05:53 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0472.016; Sat, 3 Oct 2026 15:05:53 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Brian Masney <bmasney@redhat.com>
CC: Michael Turquette <mturquette@baylibre.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Emil Renner
 Berthing <kernel@esmil.dk>, Kees Cook <kees@kernel.org>, "Gustavo A . R .
 Silva" <gustavoars@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, Hal Feng
	<hal.feng@starfivetech.com>
Subject: Re: [PATCH v5 06/23] clk: starfive: Add JHB100 System-0 clock
 generator driver
Thread-Topic: [PATCH v5 06/23] clk: starfive: Add JHB100 System-0 clock
 generator driver
Thread-Index: AQHdUNlT2UH7S9lmfU6lwd3lzav5CrbqnEuAgAFTX0A=
Date: Sat, 3 Oct 2026 15:05:53 +0000
Message-ID: <ZQ4PR01MB12025CFCCB879198B00A348FF2882@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260930124317.5648-1-changhuang.liang@starfivetech.com>
 <20260930124317.5648-7-changhuang.liang@starfivetech.com>
 <179096707364.821688.18177370718453496156.b4-review@b4>
In-Reply-To: <179096707364.821688.18177370718453496156.b4-review@b4>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1316:EE_
x-ms-office365-filtering-correlation-id: 74c4915a-81ce-4293-29a7-08df215fd1bd
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|10067099003|56012099006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: o6VYk5PNEHYnIHXSWmFjn8HW6bM7cUMoFSzv//jrpA0YJxKQq/Lo1Dima0DtidGMgSFV6FP2e4Ht8gXfXBVtKENMqr4lctbAvXVdlix1QLk7s7sVA+sq6zaOrPsj62QxRsIwCXPI0LUF7m2mc6iEx/BfafZrpDU4Zm/oBBG3hV+5ELPhhydiu5rLMAArUe272hFirsJ9pmg7IFAZxW+4w29ybQfm9b5ZBaMde8FPMaCB2ZVlFX+fnEOxQIhMTFALQCspkkqDq+bUyNt44g9Q0tFWX4qPhwa4+5V+m7UJ5YfEz/mHMkQ30/qKJskJMzWiyYKepciXONvOrr/iuO+DfONTKIwgPsJBbYVPaQJ26zFJiMC83gKAgMupfkg9iMVRrkX4V2fLeAXPTOK1UpHnhrQD7FHw9NMp/JPAoW5M7/3SZXnsFRbq41bwsduleL2PX1apouPKEe1CEQiUYYvMy/nPDSt/4QfhyDBR0/nDSiFo0TFKAlF+smJWf4zl6yPeqaiiRU5zVJY+1r4tmRmDeE3SmG2XtTk9r8oIs1zWqF55QZEh0Jbqwu0yi9uoRjm1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjUwOEhzMzI0YlFzYkhoTDlTU0NZOXpoMDJCdWpuRlhrbTJwTTVlQllSbmZw?=
 =?utf-8?B?a2NYa29XMzRENmtLZEpXMmwzZnBxMU5kU0owamZjcUZzakVETm5pS1ZMSTdq?=
 =?utf-8?B?bGx6ck5MaVUyaHZnQkp1aWhYYklBRzc3WTBMZTBTYWpBb1pmVWNBeG41RFpV?=
 =?utf-8?B?U09XUkRIeGVzY2tFN2FtL2N4cnRmUlNXWDYwQWNDanBwaVRybllVNVhseVlG?=
 =?utf-8?B?dmR3a2VaeXhtOEd6WDBTNWQwMzVQWk4rcDBBWlYxb2NRREhRTlozVkRBdkgr?=
 =?utf-8?B?RFdQOVJUM2NIWDUrQ2oyWDNBY1MrbTc4S3UybGMxOVBxRnhUSWkraGpRNnBS?=
 =?utf-8?B?cnB3RjlJY2Vwak9yWmt6cFRjZUVZcUJoTHZpcU1EVzZRaHJSTE1vbDJHNVIx?=
 =?utf-8?B?amhZYysrQzVSTEN0QTRJS2RaTjJOQlhZeWtFWW5Ub01aTmtPaFNiNWRkSmJo?=
 =?utf-8?B?M0tFbzJwNXgzZmcwSDRBRndjRVNMc2tIeEQyRXN5YmMyWlhlKzNZS3BzeUkr?=
 =?utf-8?B?bTZNbmFINmt1OXFrNVFFVVRFT0dXR2lucURJY0hOL1hPV1A0RU5HaGNJN2ow?=
 =?utf-8?B?Sy9XMkhVVnRFaFUza1hFRUQzNkpwVkFZcnFyYVpzYk1pVXFabC94QlFtUlNi?=
 =?utf-8?B?SUJBWFhTMW9ZMW00WHMxVFZRNFcrZ1ZHcnZkY0JCc09CdW1xV3M2RFJORTgw?=
 =?utf-8?B?SkUrbXZlTG91M2ZJSTk2dUhKQURDQmpLTEptR2hNZ2hNdUZZbkZRRHh0WTE2?=
 =?utf-8?B?MEk1Z2w2bENaYTBsU3JNcnEzSHhhVExKdUgzYU1YdzQwaFZpSDRSN1hNUkZo?=
 =?utf-8?B?RnlHdWpxZUZJMHBBRVR3VWxaUTBtd1dNZVBEUm5laHRUOFgzcFIxVDhwUlRi?=
 =?utf-8?B?UGdLRkw2ZUUwS2xpcnVxeVRWSEdoNlhybG1KMEhxWFRoQlVRRElQc04rSTF2?=
 =?utf-8?B?c3h1SHYzMGVBMk03RGx0azFQZTdVQUJGZXQ1M05mbFVqbmZpOVFSdlFEMnNE?=
 =?utf-8?B?cUhwRXJONVltV3kxQ1Y3alRPeGlpMDFSektxRGRiT05qOENXZXk0ZG1PdXVq?=
 =?utf-8?B?emRoRVd2SUpab2VRdkpRUkhqQ25naXBrb3RBOFhQQWpCS0tUUjkxSFFzdGdB?=
 =?utf-8?B?djVtVWV2ZXNYU3I3RUh2alg4Z1F0Zkt4ZmxQT3Bxakc1Nmc2V3VUV1dHVnQy?=
 =?utf-8?B?N29WTFdnZXIvckIwZ2FDbmI0RWNQWUtqd05YSE9hZEJUU2h0UFl0U25uSXpr?=
 =?utf-8?B?TC9rOXBJc3hZcndsYWloclZBSXJnMXpyR0c4T1NGMTVNRUJ5QVhkRlBMRFd6?=
 =?utf-8?B?aDhISFJCNTNlZlM2RnFoa0c2eEdBcG5ZWjBYcWw4YlRUUmZXOWY2TElabTY3?=
 =?utf-8?B?TDVnQU5YcU9GdnkwWXJNdlVuWGlHWGdXaEM5RzVtMWdiL3ltS2tFVDhQb0ha?=
 =?utf-8?B?M3c0Z1AycGVqSEhxUHJtbWZ2OHdkbzloalVjM0lGZlowdUxRenJldEhhZEVE?=
 =?utf-8?B?eWFWL3c4MTNJMHdheTRvZENUdkxWbDFkMDZPemNKbWZoc2JSVXR3VlVMMGdI?=
 =?utf-8?B?V1liVi9PVDdtNDRCZkJnbXhkc3hmcTk3N0g4TURZZjFxS3Awd0FBY3NDV3dP?=
 =?utf-8?B?dnVDM3lnREZubDltd2VzWG1jSUMvVmsyUmxuMU1sSndJRUVLOU9icFJMR2FX?=
 =?utf-8?B?aWdUNjlUVkdHNXF6bEpLUXJEdVc0Z25GMm50cHNJRGxrUEIvUjFjaWRKT0NS?=
 =?utf-8?B?djVxYmcvZWRjRkRoK2RVR3JCbXN1bzlWKzRMbXp1Ym5DZWVwTGp5VGd0KzBS?=
 =?utf-8?B?cEdkQnBlb2twZm1USGJhRFplY1poS3FmOU1jbjFSRUNZMGVDT1h5cHJlQW5B?=
 =?utf-8?B?enlMKzhGTDVUMS9PdFQvcGhiZFIxL2xWQ1djbWtFRGZUb1ZqcnErd1BCUzBM?=
 =?utf-8?B?WWJId2Y4MTVrUHJwVjUwMTJhbTlPYnZUL1BCTmZZYUgrWG5XMkJHWFM4NmV6?=
 =?utf-8?B?S0hRV3FUL3ZYNHdqV2Q4aGpnNHRMYVdDdU5WTFJhbzBOM2czUDBDaGpKWi8y?=
 =?utf-8?B?M0VPVStBdmtoZFFnREprZGI1cmthNzVPMzg2cG5FRlZGVytieHFFQnEwcFhE?=
 =?utf-8?B?ekdKVXNmZDZ6RUZDRXo0RzBCTGlQdW5zUkJNRUlxTVRWWkp3cHRaMURISy9Z?=
 =?utf-8?B?cUZCTmtza3E4bjRSWlp0akxoajlyNWNCVVZneTB4bnZ1WEpHYnJkZG1VOXVY?=
 =?utf-8?B?VitvSkN6ajFJaXJFMGU0OVZRNnZvOG9Bc3ZrUU93Z1Q5b0FyK0crMDlTdThO?=
 =?utf-8?B?aFRxVkRXV0lXaDNVSVNlTGZRak50VWg3bE4yeUlTd2FKV2ZXRE12d2NzeElq?=
 =?utf-8?Q?2nefuo0cxP4LMcMg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c4915a-81ce-4293-29a7-08df215fd1bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2026 15:05:53.4119
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nOzU0meUTIEYdsxvdMkzNpESLzsYIXHFzPr8SMCtSXESv/U6ve31Fx/SZYALyPisshpTV6WqlGk0knHi2I4s4oEyFyS88mmH1hIah/dH9mb3ay5p1bIfHbFjSN44AuTw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_080619_019850_F63F9260 
X-CRM114-Status: GOOD (  12.04  )
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

Hi, Brain

Thanks for the review.

> Hi Changhuang,
> 
> > Add support for JHB100 System-0 clock generator (SYS0CRG).
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > 4f72b4ac27ee..a0e5b4df96aa 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -26097,6 +26097,13 @@ S:	Supported
> >  F:
> 	Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml
> >  F:	drivers/phy/starfive/phy-jh7110-dphy-rx.c
> >
> > +STARFIVE JHB100 CLOCK DRIVERS
> > +M:     Changhuang Liang <changhuang.liang@starfivetech.com>
> > +S:     Supported
> > +F:     Documentation/devicetree/bindings/clock/starfive,jhb1*.yaml
> > +F:     drivers/clk/starfive/clk-starfive-jhb1*
> > +F:     include/dt-bindings/clock/starfive,jhb1*.h
> 
> The spacing after the : doesn't line up with the other sections. It looks like this
> is using spaces instead of a tab.

I've double-checked on my end, and they're all tabs. Could you please help confirm that again?

Best Regards,
Changhuang
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
