Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F705E77197
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 09:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cv52VjILT9Xzi+o1xrKWhK2pUiSTfpYbsZP7jjEEjdM=; b=zGNp7kwrUAFmrX
	udsachjX781yqAmEEKUo2moZlBDzqwc4I4Ps10GUjFc9h6iziy/+0UoCZpNCpxVprM03dp/tza9Fx
	kqNr7n2JtFWALy/aaRsPg4MIM6L2mRuNpdM6g3R27qsbNexxi+1Taea5EXfY3UDYPd9nqPK4R4rv1
	RBrnT5DEFNLDmRG2y0IOAly3Uutt0AvykSRXq5FzfjALtqa0pIPFVytd6Qmhe9zoOdyftTgF95Zns
	cV0EhMiI3ok+3TpvqB6lZey7MwxLPSkvtDdW/gTKylCxlqZY9eh47wK09nbItmvHLHq2AUBGIGl9W
	QHXHtTsz+20VAaC/vnQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5Rl-000000040rV-3g5K;
	Tue, 07 Jan 2025 09:00:21 +0000
Received: from mail-dbaeur03on2062d.outbound.protection.outlook.com ([2a01:111:f403:260d::62d] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5Rf-000000040qO-3HtT
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jan 2025 09:00:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOY4FOHxhCiGWAs5wcjfL5UQwSXnkmzz0XI69ErzBPHdJGWzky67J96Qu7Y/JZmg9JEorGVfvQIui3kUk4kLIP+UAAWBH896pm5mQFEdwlOscOg9bGQPp+Ya1nFPqFrBgxTKsmZngaHg+pLTC5jBtNoprrxAu8Eq5D+qjRswLM7ATCa7OlShG1u0aoK/eK99IoalYGk0uuCnfzxKtyaUJWn8S7SSITi+m2eqvpj8WhljUtmzheHOA7/LoVfkeusoEpm3hg3gKTmHMZcW6ScY2UM4pXa1zQACHvqyn5SFtVz8mRXR8xNyf9MAXtJ1G+ivWD0Csq35SACRsOjkdF+qeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L64CjO5z+V/pBTco7fkF7vo4atSkzyPv1MvoNDYm5Qo=;
 b=YS4vvy6o4Gc1mZr+CpDUdvlbdamczggnsiXrz3ihY1+3qVZEFux6yfyflAXL1OppCPgimSi7ya/doWbvX7UJOJUI6RcZkCWTvj8wnqWgc9rs1WuwTxmisJ4pjZImOJFyHpjF8zyP14sSmPKCAKxt79sa7Ix/dY8BSGdfl8Od+pxaWDZUJQu+pXXlxYhMfKtuEnfzcI1ayhjJbkHUc7P9FIhP0pL4JUDzLjWpSJG1aJ/YF/ioZCkVLU3AvOajOt4ipOA6h9RQFKeglzlqk+CBrxxVJ70THIuTjaLcg3LvZ+2a01X5xzUl43YfdnncUJ1O8SZkr2XP9bejuR1wPuxk+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L64CjO5z+V/pBTco7fkF7vo4atSkzyPv1MvoNDYm5Qo=;
 b=UXvWWG+82bLM7RljOPsPRMYCoa70wqotisLV1ngBs8vQyLW9rPzjNBP0SvWHH/POJljDxIidlfBGhE1bUq7omWGcXEXYzpwAqzC5hgX6LDiGHn+JoX7LBrjHM3sERGoEFA/BuNxQaTLQS8UZ5CcwsUPvo983pRfVvaODebaNzSM=
Received: from VI1PR09MB2333.eurprd09.prod.outlook.com (2603:10a6:803:82::16)
 by PAVPR09MB6425.eurprd09.prod.outlook.com (2603:10a6:102:306::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 09:00:01 +0000
Received: from VI1PR09MB2333.eurprd09.prod.outlook.com
 ([fe80::fef9:cf7b:cbc2:d3b7]) by VI1PR09MB2333.eurprd09.prod.outlook.com
 ([fe80::fef9:cf7b:cbc2:d3b7%3]) with mapi id 15.20.8293.024; Tue, 7 Jan 2025
 09:00:00 +0000
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: add risc-v,aplic
 hart indexes
Thread-Topic: [PATCH 1/2] dt-bindings: interrupt-controller: add risc-v,aplic
 hart indexes
Thread-Index: AQHbXPqMeL3FLNBQc0WP6xJQQG7unbMDp6uAgAdhsLs=
Date: Tue, 7 Jan 2025 08:59:59 +0000
Message-ID: <VI1PR09MB2333BC61D958FB3DA5B8039594112@VI1PR09MB2333.eurprd09.prod.outlook.com>
References: <20250102094116.3847894-1-vladimir.kondratiev@mobileye.com>
 <20250102094116.3847894-2-vladimir.kondratiev@mobileye.com>
 <b69a88f7-0b72-4cd9-8e5d-d28db2e20444@kernel.org>
In-Reply-To: <b69a88f7-0b72-4cd9-8e5d-d28db2e20444@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR09MB2333:EE_|PAVPR09MB6425:EE_
x-ms-office365-filtering-correlation-id: 6897dea2-ec0f-4c34-2bc4-08dd2ef9aa8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?jOXV1HHMpbmiqQOQOSncmH+EnNCadvwlVrW54M6iV/UvO/0IaLXwDuyO9L?=
 =?iso-8859-1?Q?HXofNsF0ojYxomNgqgbes1RRqtVP2p7UVLqDYIBVaTvOAWXirKUyxDU9uF?=
 =?iso-8859-1?Q?FWrZoKEQ0+FRtvalvjb42keZGg8y3ngyZkImTk7lwzWTuJPLYvYEOD0ITw?=
 =?iso-8859-1?Q?CullM9BnnsJoNC5TCJIR3Gdxyc7PjdFBhEgnIc7SKpxo91D422FPIgVvzt?=
 =?iso-8859-1?Q?tc3pnPg+j6zbpd3r1RshcYphiCHWF5zxTRBsPIcRRjp6+x1Vxq4YBsXnkF?=
 =?iso-8859-1?Q?zhnUIIhZJeSMKy1UvVmWoFIJ7ydyMZEwc6t6R6m64oT5jMxtkWsy9uvhNn?=
 =?iso-8859-1?Q?vTmCJgjUkS+QGOc/d5+DuefihWC9ehXoX+VJiwR+jqevajIB4nyda5teYG?=
 =?iso-8859-1?Q?Er86BQ2HQEPssjMMIK6YfBSfrKYdNCiR7HADtcwPfGowYQDuwEBw6XkPyf?=
 =?iso-8859-1?Q?Eh62SOIF021XNP+QZlLB0gNEAySeVrY5QHqIpj4LoPw1n1wZ+LzQ5sDaeF?=
 =?iso-8859-1?Q?coQ3HbIhOEIGLWYTdJDEJh/1AwacfeyPkeVCnTej9mMwmV73RQjbMpukqH?=
 =?iso-8859-1?Q?eXa1r0q+6yc46DoStCRQAMzqHqTmhT9LWWBAUCnz9pBN2rEsP7FBZXPXtB?=
 =?iso-8859-1?Q?zoc9LCBGmcvoF/qR3hTPGjE0RbnfQhLstKyus2Rat05Yd7zEyz54m9+Hdp?=
 =?iso-8859-1?Q?sP12HcKEd4rDrgnTKgC90IqxeiAG8p4l7KqZSKRh3UmRs+9RyPx00mhjyu?=
 =?iso-8859-1?Q?ZEw2ZU/jC8yF/v107OoXdKcZcwGS1R7xhxUJoQRicysArS9u4coxwalf5X?=
 =?iso-8859-1?Q?kLFfDv0xXBZ2bJZRFQEk5cAFaJ1MveOkzbsBJY0PKOU8IvQigLUcdwMTNk?=
 =?iso-8859-1?Q?T/UPaJmAlEnqKLF1ZrSjaJmr6VoHDddCLjj0aJTxrfnSFolTQXxGeaOUJS?=
 =?iso-8859-1?Q?buCI0YgEo/eq8PwOPLalfO0kRy4YopH611ziu/L6UQgsSNIjwmWF6n3inO?=
 =?iso-8859-1?Q?X3mBkjcLT3/5S/VABG47GvA5DgbLASWrjH1iyuq08LBOE35CzUx5ydnKGC?=
 =?iso-8859-1?Q?dk+/kCy+HvF5F9Ydnx7w6UVp9So3EnIErgT4Fz8e89oEmYxHkhvFwHNJFi?=
 =?iso-8859-1?Q?Px27H/IjYK1vF9t1VVm7lAN0PKtjrWm30+Rt4Jgq85COqv5OL4wNQK+cFT?=
 =?iso-8859-1?Q?4M322+hPhr351Te47LE45+iIqefydWI/YiWzCgg/fG2Z9GBTfLXHH5PqyT?=
 =?iso-8859-1?Q?nB2o3jwi3qvlED0Yv4MWbVJCi5FQ3mv3IIsZQFeWvxThw44l1I2yDwDF1h?=
 =?iso-8859-1?Q?Wnp9lyAPG03GYJ61p6hDIwNa3y9Za/F617CnMLQ/itR+a2NnsxW1SgYg0R?=
 =?iso-8859-1?Q?nS4XN5iCENJr/N14nIFneqJGOwHbq5Lfq1RB/OEt6CZy3ofT5h17Z9DPZs?=
 =?iso-8859-1?Q?fTw4NIVMyAXf0iW76HKKqo1Doj5btbJ6QMnlosgJGYqKcVI5BQXTeNc4rQ?=
 =?iso-8859-1?Q?C/VoWS1mB1gSYKIF/WCFR4?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR09MB2333.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ePHwH2++EMqQRjub6IG30ByRcyvSQaRSbD0PxjGd4OtCY904bq3m+X+1a9?=
 =?iso-8859-1?Q?zx5mCZKJqabd61+jAsb04MmewPaKjWsOaioaWXoKzIXN9nUB4xdfLCi+OU?=
 =?iso-8859-1?Q?3CmbgrTkLdeUaywxmnSDUYAswg3QNh8V0ImruUatqPrZYLXovBAl/aDhJu?=
 =?iso-8859-1?Q?/zctXNDHUi9Whxrqz0FplZUV3vK68pwSbOL5uLdi2sZ2Byzp9DWpEaUvth?=
 =?iso-8859-1?Q?N0d8eg0Fj44fb2LN0pmgnQWPdFFev2pzFLNlqulfG2q8CMA2v6HMBDpGEO?=
 =?iso-8859-1?Q?x9C48YWDu3wEiXsmI8PkX1yJvfVX3TqHM+3b7n5iNa8vRaSht6K4elMKO+?=
 =?iso-8859-1?Q?7x6+iHWksbIXCnQFx690v8aOiH5sSwuORshnZsWA6mEYK2BXNgzAqmnoKt?=
 =?iso-8859-1?Q?KlTIxWJUpmv0vvCXzjtrYaYTR2LbNFSkkl4FrdZDEx3O5E+qFirF1syCkL?=
 =?iso-8859-1?Q?u/OY2MjBPcOK/CUUoF3goxWnjhwvflThj8ql716h0uAN82wJrEDHLidcai?=
 =?iso-8859-1?Q?0MAJAmF0QJ+L0KZjtISX+uCyWMm+YFddHOXTrwbrhttAz7WjbfrwTVKCaT?=
 =?iso-8859-1?Q?L4jFAVzAv0racgtzQlQCuR5HQS+6Z/KOwnvhogZY6lNd7YYvIkR4zx8xOQ?=
 =?iso-8859-1?Q?Tq4hFAi2WAV9J9+8ftVrR46Tp/ZVGkj2zhRP3Pb6GKLff/QINpo02MYEjf?=
 =?iso-8859-1?Q?K/ionZ4IYyYYNb1erv6ubLvZmzZkRbL4pRhpiWzI9xC9e+b9bp/8ktPiCI?=
 =?iso-8859-1?Q?rTfP+flPXnnNAGVrtEArDRyMkZtxZDgEbLdOsRErrcF5j0Q2J6knhy9KLe?=
 =?iso-8859-1?Q?XQAr3DawloszuhGbIKR843uPngt6GIWYeIwIReCwKJmi9E/taw8syM+9eR?=
 =?iso-8859-1?Q?UKJlaJHx2HYHm7jbwgohIApGTigx3ZNGvMf02bPp7ge3roJeEp7KX6DT3x?=
 =?iso-8859-1?Q?3qcUWd9AQ0mQw4FvMllIFw1TRc9Z1xMjuRVA6WdxgVnvvTPv+f+1eN6Uef?=
 =?iso-8859-1?Q?j0r23huWsDM/Q21WvhnkiZGpb3lasrgpdExHyRX9sNtuUlkmjbF/jLKXzb?=
 =?iso-8859-1?Q?OoJWMnqzn9M7wDxzroT0ORF6OOxDq37K/xaPx5sa2+SK2dE6KyZLRsyKoq?=
 =?iso-8859-1?Q?A7W65AZwCPOilYRUABaCDXNfRjA2j1z+NVtxrRYT98f3tU1k8VrMoffkWU?=
 =?iso-8859-1?Q?20k3xnaDTBYLBcUTq4uvIffhsfmWCEDoNfA49yZyEC73b0ttD6ay+4TVZG?=
 =?iso-8859-1?Q?i3a0lxmzhM6iH2IysP0QC6xOOSKfn9MBxhYCzocOhC1IJemhB06JWbsRYl?=
 =?iso-8859-1?Q?KLVRpaTd5lvyR33ecOunjuw2Ic+UvEEvV57edA8JXxQbywfWy3UVp+GVsK?=
 =?iso-8859-1?Q?99RwGkhOFAmVY5Ud8NbmAnnyjopa0lfusUEW22j1ER0K+DKkjVW469lXFk?=
 =?iso-8859-1?Q?zLAU4VoEwbW4SRHUq1973Tr3JQ33AV2hfrQNjfy0ASwdKE0a9v4ZZJo1em?=
 =?iso-8859-1?Q?lCM1BE59A6tKAPSPJabmIm/nOg8O+h5uJwQv3o7az7zvbbju3nbmA64iBO?=
 =?iso-8859-1?Q?Bg5oa0+POeKakppZZcukAUtyNkJBaHWIb+Nt/W3zbwIShK6sZ42mhrJlM6?=
 =?iso-8859-1?Q?AaKZR5RrjS5wuTdDv3nexU0MNngqa1paFt?=
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR09MB2333.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6897dea2-ec0f-4c34-2bc4-08dd2ef9aa8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 08:59:59.9636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8X+eeWnvNI6j+qfh5WmRe+par45GUA5w2wjhwCoQ37JtRNwchts91ng+jfY6GhUmNPoOBed+GAch+Cb0UV2TEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR09MB6425
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_010016_010289_5366B956 
X-CRM114-Status: UNSURE (   7.54  )
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

>Please use scripts/get_maintainers.pl to get a list of necessary people
>and lists to CC. It might happen, that command when run on an older
>kernel, gives you outdated entries. Therefore please be sure you base
>your patches on recent Linux kernel.

>Tools like b4 or scripts/get_maintainer.pl provide you proper list of
>people, so fix your workflow. Tools might also fail if you work on some
>ancient tree (don't, instead use mainline) or work on fork of kernel
>(don't, instead use mainline). Just use b4 and everything should be
>fine, although remember about `b4 prep --auto-to-cc` if you added new
>patches to the patchset.

>You missed at least devicetree list (maybe more), so this won't be
>tested by automated tooling. Performing review on untested code might be
>a waste of time.

>Please kindly resend and include all necessary To/Cc entries.
></form letter>

>Best regards,
>Krzysztof

Hi Krzysztof.
you're right, I missed devicetree@vger.kernel.org.
I do run scripts/get_maintainer.pl but indeed I missed this line.
I'll re-send adding it.
Question: can I re-send same "patch v3" or shall I increment
the version to "patch v4"?

Thanks, Vladimir


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
