Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE05C98324
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 06:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5itC0WaQ+pv580Y8Y8SNrHZIHkv5qiOQ41r6KHvTfc=; b=yFSFV6R0qNJ8jc
	m+BsYkmvEWqT0qY9FnDCGMX44D6b2xeWpfwQhW7oEyqd8nu82OrF6E9iRc7jP8ttJFPGA3GsGR8TX
	/eBYucWjIJp5yG61YaKEBkDjce6XV5QZYm/Upm0iDgfxj/ZeS118+Zd6ZPNU4xJMqfxrRQbfNiiy4
	D4v1OuAKFrCQMIbtlJXU+EQiCpDPZXl93+NTmByIIZyI957n6I6Tk1OoTuiiNqtHOjR8SXRuuFIw1
	G9R8UgA8BlD7GC/jFtOR+zaNWS17dcJNFyAb1+LE8EdaxECx4oT6Ny2P2am/3GLMKKFKF5ld6w1kE
	tD4CivjbQTUz8Wi9tyMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAikb-0000000G4jH-2t3y;
	Sun, 27 Sep 2026 06:52:41 +0000
Received: from mail-sh0chn02on2105.outbound.protection.partner.outlook.cn ([139.219.146.105] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAikY-0000000G4iV-09PW
	for linux-riscv@lists.infradead.org;
	Sun, 27 Sep 2026 06:52:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5jHzgK1FE+jTSD7pQuF48gLJk9vRWtf9HBN9ktu7WkAJ4iMRvjlV/3rNMyp1wOF8mw3rtmUS6XW8ENkaGi092JxX14UJu25ugWhdkYOs5diWinO3rSL32CtIlU+6m2ocQhFxEoIVVHw/F7vKAjHcNHtqbyvI6H+cPuuXCuVP2x8FSWhb5YLr09reAPHpWNUKqnS5Mi/LAJa6pdPSvKXonJYDvwdjt/Fbcq1odOVY2wUT1e776Z2qD+tcMUbkF7uMvhj7SskBph8CQFImqV6dT97UbVoWLpKsR74D6Uxk2SU0e05ICcswG72uXUSzYApN22vtduejjnMRFLXOfqPcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnZJME+4G3RpGZv5levsyQYfLduGttwDMrhtuCRuoqg=;
 b=QJbkhMrmsYeeVrVCiny0zqBk4sybYnDM+F6HjpOTyhuGZjsg7SjB+rPGt32oF0k5tA0970MU3vPGVk5ApJO3dbuQckfxJlIxVOC2GGb7qQmG74CwNPYKnwaPWsKLF3NGKDyG2wopN0VE36fJhiicBAqd1QDSu90MymZUFZOXGL6WCUAlnOeH81m28sPu0neGc39BiCJjTL9ptIgqyYUr2WpQDgrGJoj876igZJsYojf+SDJ9f9HD0dH/DrTAOxjAw0TfJrY+GZUOOmutTetBC9oYa2XdWNT8omG0IzvSCjvW0zU/AdOsncBAlYdra4DXn7ccKHRTNH7IIL/DiqiaWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0554.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:9::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Sun, 27 Sep
 2026 06:37:49 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::435e:52b5:c524:459c]) by
 SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn ([fe80::435e:52b5:c524:459c%3])
 with mapi id 15.21.0451.014; Sun, 27 Sep 2026 06:37:49 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: Conor Dooley <conor@kernel.org>, Mark Brown <broonie@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "rahul@summations.net" <rahul@summations.net>,
	"anup@brainfault.org" <anup@brainfault.org>, "lftan.linux@gmail.com"
	<lftan.linux@gmail.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "pjw@kernel.org" <pjw@kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "alex@ghiti.fr" <alex@ghiti.fr>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] dt-bindings: regulator: Add RPMI voltage service
 bindings
Thread-Topic: [PATCH v2 1/3] dt-bindings: regulator: Add RPMI voltage service
 bindings
Thread-Index: AQHdSylV/+AHvSJ/TkisWFCqzwhgHrbcn7gAgAGZTwCAAFYf0IAAQt4AgAAPfqCAAIpOAIAAINGAgAHXAQCAAJrocA==
Date: Sun, 27 Sep 2026 06:37:49 +0000
Message-ID: <SH0PR01MB0841C1D66873DD3EF1307D5BF98E2@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
References: <20260923070014.1340761-1-joshua.yeong@starfivetech.com>
 <20260923070014.1340761-2-joshua.yeong@starfivetech.com>
 <9c0ae39b-d214-40f5-b010-cdea14ccc774@kernel.org>
 <c2c57bf0-e610-4353-93a4-84edfd08e767@sirena.org.uk>
 <SH0PR01MB08411AA7F403A71D2D7470A6F9802@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
 <0db3ed29-8bb8-4dc3-a4cb-cc5b9bf2e893@kernel.org>
 <SH0PR01MB0841C933DE1E00C4012BDF53F9802@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
 <ed0c4c67-6933-455a-937d-f5888d124538@kernel.org>
 <a5d0d4df-7e8e-4f12-b011-e41b66efd8a7@sirena.org.uk>
 <20260926-peddling-share-5e5e8dffaa63@spud>
In-Reply-To: <20260926-peddling-share-5e5e8dffaa63@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SH0PR01MB0841:EE_|SH0PR01MB0554:EE_
x-ms-office365-filtering-correlation-id: 07211a47-6035-4576-3700-08df1c61d942
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|7416014|38070700021|10067099003|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: Vf6ikhjgrsFF5y3BFd26mf4fjy18ST6GjxYijzWMLeNNtjsguaDZGkNK34IJkvY2v+06ypOsNfCs3EGPmQQ3LdYPS9w2Mr22ncOs4Q+tXKCkU2n7hejYjjg7hOs7esLL5AZczGI81nqAnILqjIiT4/2IpUrCba/nyxoVfJjWwSnXl4hAQoQS94waWHqK8RIsaVO70Dxtb5rAhafxyTtJ5eGK8UsuPckjx9nWXhOM8dMkDrmRIrAmDMEHySlXBD9yoDNJgi5d8ccQ1ErIrAXcKzFkmz2ZghfU11PzeCEoakyOAjV5dsVFpCOhTWglOZCEWiGwtvK2ESdYT8urny/cMDszQfJ/OdGRiEW9gzBRTPTwdLPT64dConC0br2P+YB1UgusJ7niQvKQZ0FW9Oc2R0tiLtcuBccFbQ4TIdjqwW5dsvOieHxAMOAs3vnwFW0NZBIWhXMed/b4TC6sOkEEupk1W3sG4/ZAztItTlfbpoTIzmp7+w6XvsGBvIK7oxPTDfE4Ggm5wyB6ktqXt6I3HK+2KSOGgv6C9vZKNGBFEomRXRKwNyrRLx2ykuEEyRsz
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(7416014)(38070700021)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Iivs12ZMRizLcpjsxX0jI7Dgcqf8mWCRdrh506Jx04MKLHWeAHAwBvXLeUp8?=
 =?us-ascii?Q?wGrfPihnWhIZWDBp6f1V3rUPPCfs12ctpl7js+6GGNwH95D/gTso1DAp8OnZ?=
 =?us-ascii?Q?VbehP/ufsuWgIDhsQoF+F8vPnbR07g+XTYmhJ/GYvaiYLjJ4VfkBgqmHdV+O?=
 =?us-ascii?Q?s3Rf9SSTxRx9VsMrDqHmM+RFdoxV3XBSRcokzvbsnhpGHRse0L9zxrVhyVID?=
 =?us-ascii?Q?WcuCBPdcLMRJ41b/RCsjcSkoZW8bZegR0Py9oqUqJ+sFjYqHd/dq26L1BiFN?=
 =?us-ascii?Q?P8ntx3mhXeG/Yic4GtwjLRIxTo5mFjlU21TF/xfReQRCILcfkxE4xSEwyrjw?=
 =?us-ascii?Q?cE+qtiCyreZfOIqBUZ7G6HjR2hHjVWKai5MpudHni9Us3wTA0OAYAxuxKXYg?=
 =?us-ascii?Q?FgBLahFlKrTc1rPBCtW/4pqA8Zeu9mw0eICWm1s1ATc0z9rJzm8gtykxp5gp?=
 =?us-ascii?Q?GVHgK3KDCYUQd7uqsKSsCHbMa8qDohMVsd3ZMAzJg7q4H/jnxWN2zjPbmCQZ?=
 =?us-ascii?Q?lnsvBVXiACBUhKAFYU8OOShwTLa5AdzHexY5DcRRFVAhF7oVGGkTz1dgC0eu?=
 =?us-ascii?Q?saF6ln7uPSWhRNLJv18QW5iIk9HE8f6LekKTsY24OL4yYrFgowqyfPtVRlVz?=
 =?us-ascii?Q?+r+opLQG7eYWczV5NOkL5CthHodeCsQ+13SVdAv57UpkgLQ/ufMEJNp99qH2?=
 =?us-ascii?Q?4DC/RXnsNWLKJ6prYwyn2E1FDxngnr6nIUFFJFxmrJKRzv9PKRh9VkYIYyBw?=
 =?us-ascii?Q?5K4Oi6w9+SbwlCXukMM7GWgaBu74c/EVMTASqgcajV3hLN9VCnqYsG/cfWiI?=
 =?us-ascii?Q?Edqb6zgncdZ0fCoLerdwNMCIBEPuEJel6ouWqiUCuRLuIQnRzVh2s6Xr2KeU?=
 =?us-ascii?Q?osYCs7a5W270xJlix/OVkECWjV2cpX/mNwRN+fzAVlM4CgSgVc18RdPq3/Tg?=
 =?us-ascii?Q?yic0ZC81nuNk3R3fhBeAYVVCYUalADjFUhLzhZJB0c2Qlz42s9ZItabjrL+Q?=
 =?us-ascii?Q?ncqxfXGkYbFp80mOSILTcf+A4IpntXHtKjht7phLgfUvGKIK0sTGdXUmyjbX?=
 =?us-ascii?Q?l82xpmuIsytCLAjvqDSArk3KWl31xIdfEJnhSnVvXtWHMn3YLbQAJRY7j15M?=
 =?us-ascii?Q?gdiVErlaesOuzQCmcLuSk7UpGJ0IKK/x22J90sPArB0BYmSS/G6boPJjkIr4?=
 =?us-ascii?Q?usZZ1vW3lixGlc5DdSZ/1SrGeFxenhsL/VKoPI49VsPw0pu86Iadnl1Sc4o6?=
 =?us-ascii?Q?WvTNm7VGcnr3yQYl2DpGgbxe8arU/04h3W+5MxMnWw8kPrR4R7mMVy0JwJDS?=
 =?us-ascii?Q?Sc0uk2W8cWJcNHSMmLuIsl8BqLdzihFA7rsNBU2/RwHM6CVj6ef5m3wqFhdv?=
 =?us-ascii?Q?UkvisO5VKt0ajrERmXvDp/+W9nEb7CNLMfNryEq6H3aj/e0X8lKE0nJ5nhlQ?=
 =?us-ascii?Q?7cG7iiPTnBifGZVXFffrRnIHJNjI9hfexSZlkzBmcQnO+8gwQgmdkEUiOgtk?=
 =?us-ascii?Q?pK//H3VJnE+SNsm/+0SPLnOMDUn5KtYWau32BOcpjooKPlTjoxyCZpFeoprM?=
 =?us-ascii?Q?hRIPbUIUlT5HK0zt1BRFFve2rlPOZ33m00M1Ngs5NduBdrUYs+7/BkGOJUcV?=
 =?us-ascii?Q?uC92eFQUKNnbN1Qtq0G0ZuA+07FRXWcbJt+V61fxuqsWOQGl1PYuYhuKIDaG?=
 =?us-ascii?Q?/ySsi5fAgVevirh8Y0rW0tbBwLBjFNrTmcycBb7Bm2maYQJEyPpcyNp4Oq5H?=
 =?us-ascii?Q?r9VXoznoY+aw+g0BuhufnH1PgNs5FYw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 07211a47-6035-4576-3700-08df1c61d942
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2026 06:37:49.2223
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QutWz/8CtG0qVQLXYbauzsemqqBt+wsPHAQaVXiBuD3C0C78vWjaNrhg9q5I8uNzRA5mb3wHuQWmWXn5d7x0IQu0YcUszRn+tDMWVeTT8Z4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0554
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_235238_095290_01BFCF9B 
X-CRM114-Status: GOOD (  16.05  )
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

On Sat, Sep 26, 2026 at 10:21:22PM +0100, Conor Dooley <conor@kernel.org> wrote:
> On Fri, Sep 25, 2026 at 06:15:35PM +0100, Mark Brown wrote:
> > On Fri, Sep 25, 2026 at 05:18:08PM +0200, Krzysztof Kozlowski wrote:
> > > On 25/09/2026 09:14, Joshua Yeong wrote:
> > 
> > > > While the above method works but I'm trying to get the entire simplify to the following.
> > 
> > > > user-app-b {
> > > > 	compatible = "...";
> > > > 	voltage-domains = <&rpmi-voltage 0x01>;
> > 
> > > I see. Why power domains do not fit here?
> > 
> > The spec seems to map very clearly onto voltage regulators, it 
> > describes voltages in mV:
> > 
> >   
> > https://github.com/riscv-non-isa/riscv-rpmi/blob/main/src/srvgrp-vol
> > tage.adoc
> > 
> > I really don't see any problem describing this as regulators, it 
> > seems to fulfil exactly the same role as SCMI regulators, supporting 
> > things like SD slots where the OS genuinely needs to control 
> > voltages on a mostly system power controller system.
>
> Unless I misunderstand your intent, me either. The binding permits 
> having regulator subnodes too, so culling this "voltage-domain" 
> business and going for the regulators alone shouldn't be much of a shift.

OK, I will just get the "voltage-domain" removed in V3.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
