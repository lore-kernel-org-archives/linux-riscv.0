Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AC3C5B572
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 18:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mKZ6eVw5dzl5Is+efBQmMvBjCZVvyJraDGboJLmiNMI=; b=k0LSSrdsZtuLdy
	1FCGsm4SSCTm8QsqhsJhgqIB2IAtSSREL/R7MJES3gVmnkwbV/MAgJ//x7Qsue1tX0CJB+sy4W2jF
	t1yUKCS8bewr+yBkB16/zPzzaNkQKUitwpaivBh0t9SL+FWWKHoHz9icH5OP5iPaici9irL0hwZPx
	e2UDLLar3xTwTCYcEa+dZOoGlBRjgkvuQVeo6q3HMqPNi7ErUc2A/h0kYYmvXEb1YlJBjbWSI4fR5
	x3NNiUVbVXUy2VSgIIlLQmVIZ92Qn2aJ+i7GyGMdtEjLjYLxJ1tSrRG+LLKAxLHVSz6ssWh91vFch
	PtlOktjVGtptPeowqSVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtr7n-0000000EkSC-3ze9;
	Tue, 11 Aug 2026 18:22:55 +0000
Received: from mail-eastusazon11021080.outbound.protection.outlook.com ([52.101.52.80] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtr7l-0000000EkRm-0uWH
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 18:22:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V419hjsZY/rPh/Z0OCaJoDbWqDprZMQP/FQ/qga/yWfUa0C+qcSMRCvouxMwJqGFLNxv/HBWhIMq6piuyfywCSV07hLh4VJjEj3YSyUyTGWcQJuaz+Gp8nefJdnP2/yxwvXrE5ANJguTA8sCtAdo/c/9nSLUxCy+LFSS59KMck0IrqnX5iPmryYiewL8Yq2JIrSIcMbfyrIVJj3drw9QVkeVvtD7uno4z8kOalApXd7gaw1046qJfFbhHcs50MOaC041SP12gNKgQ80bdZVb9aHtg0QYxtW5PQKnsKqTls2VpwqDn2zhwQULZDq6agNqlaYlZwIm0vaJc0soK/7e2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdJu61TGpkZquovgXmXp+5AqiW+8Z0G+8Ua1X95jT9I=;
 b=uv7jac2LrmVU1Ol3Mm7uF2iOLsnkSK030Me5IZsQXdLOcz8Lglkc1+A5OcPk1y6DLZWWw2MJMsvQ/1PHicuEW9cPxixcDU6A+Fbba2gevcDf1gt9S8ILc1vypvApzLoCEbQSMur988keVXJm0Md6IJNquOdSZxvPym1hSnO24OPfjOQzTG0nr5Hiik0QWO0HQJBobAS3vTEwEdlksnXKVxEUEprFa43LJIzzxwvF1in7I3NO7+k6APLCm0ryc0q7azcUDgrVjv4v0ZkqfjteOKm7OFvK4fOXyZQGkavUeD4/wAXAhZp0QUirPSV0WPXGAkX3rXChN9DvsjbNpPtnnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rambus.com; dmarc=pass action=none header.from=rambus.com;
 dkim=pass header.d=rambus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rambus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdJu61TGpkZquovgXmXp+5AqiW+8Z0G+8Ua1X95jT9I=;
 b=qd54JhEGepwdtJRBbo+R0bYMxBQEuZWBMOZyV0TvkbIMuXdrL0eq9W/DeLfr7tqKnokjhTOl3Jee7PiLb7nL9MPAeNI358VoUngcnE+bPQvbEm25H+XqgugaAGfZXSk2vzDCUuHVL/8Qj0ezNTyIjVH7eYX/DoqcgIjUSZeY5KXzTEqziQGu9Mg8oNFKelkxasLloCAtjBhJbTmwLTkwhLuRQhxdXpwyPQhjcE93XhRxU47/XSjDzj6S5Rsbx0oJeZvepFEohBEAxbzzOPoe1mOQ26HkJAWQfz6tOXt1KpCqqxQBBd9YxuHEqBKFv+D/YDOVeMn1iaAFM617sZ6hhw==
Received: from SA3PR04MB9001.namprd04.prod.outlook.com (2603:10b6:806:398::17)
 by PH0PR04MB10245.namprd04.prod.outlook.com (2603:10b6:510:116::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Tue, 11 Aug
 2026 18:22:41 +0000
Received: from SA3PR04MB9001.namprd04.prod.outlook.com
 ([fe80::3da3:45d7:8860:e196]) by SA3PR04MB9001.namprd04.prod.outlook.com
 ([fe80::3da3:45d7:8860:e196%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 18:22:41 +0000
From: "Ousherovitch, Alex" <aousherovitch@rambus.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "Krishnamoorthy, Saravanakrishnan"
	<skrishnamoorthy@rambus.com>
CC: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, Herbert Xu
	<herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, Shuah Khan
	<shuah@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Wittenauer, Joel"
	<Joel.Wittenauer@cryptography.com>, "linux-api@vger.kernel.org"
	<linux-api@vger.kernel.org>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Shuah Khan <skhan@linuxfoundation.org>,
	"Nguyen, Thi" <thin@rambus.com>
Subject: RE: [PATCH v3 03/19] crypto: cmh - add key provisioning and
 management
Thread-Topic: [PATCH v3 03/19] crypto: cmh - add key provisioning and
 management
Thread-Index: AQHdJd2Na7SDHzeaVkWiUIejOs5GKraYjJAAgACj8cA=
Date: Tue, 11 Aug 2026 18:22:41 +0000
Message-ID: <SA3PR04MB9001E35369E49D41506AC6A6D7DD2@SA3PR04MB9001.namprd04.prod.outlook.com>
References: <20260806195519.2703224-1-skrishnamoorthy@rambus.com>
 <20260806195519.2703224-4-skrishnamoorthy@rambus.com>
 <20260811-belligerent-analytic-sheep-3fce16@quoll>
In-Reply-To: <20260811-belligerent-analytic-sheep-3fce16@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.11.2.117
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=rambus.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR04MB9001:EE_|PH0PR04MB10245:EE_
x-ms-office365-filtering-correlation-id: 5dc58fed-d9dd-421b-0a52-08def7d5880d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|3023799007|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: AH9XstCvxhXU7ob3cWjAoFTcVGESIfS5I6IgM4vfIu5Hky80gnR6N/wf5ODylGzRuUoVtG6eFJVUj9pata7yBQNgNGjSjbCNLQvUyHzQlhw68pS0z60JgPUPmG09R46KFc+cXiQwJKjPFaLnzgO5sataMTdAP1w2pbiX/Gmki/GFzNpeR2gP0bowWUBSd0KdJG7xso7nm3Bi/FLQKGj+cXmAoErrN73RWYpQ0w44vzY7pTazKKMZb5X2VIWlZzs3HhtTW+CpFWzjfTv0+Tn5vg8ZsvYD8KK2gzXb4h46XEKXJ5Lpg87LXi8d8QZwYEmRlGzjm2UWVqh7NF8VEXlVTlXsJm9qgn11dxK9UKdoIBzXw/7mdgzFMyQJgWil7RZg83LC+mCOoh7otzKUAcwz/3x19vud27xOBbF5DWpQCnh+LPYTau7rgNiL9PBuCy9LB/TAnJRbMxR04wlLcqc5M4WejlNw5oE1m+h9j20uKvsHUx0owBPOkFjzQCoPYz9TypWt5dmknbg534XJk8I1iURmFRdthQyC5uuzwdQyGY/NZgLZ3E258OjfZs4xoU4gvnWydY3vP2MbEE4bKj8rNsw93z6x6Wp//ND2XzwuwVmapGHtveC4uyj5OLA9GxDxGtieOu4lRkeFSbp2XHhTCjfKl/PVhhR5cshkvAidJo0JUZndfCmQEzic6EW16+XlgnGqhTeyUIT85t4uBiyqmw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR04MB9001.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(3023799007)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2pUMHVlNm5jVHA1WDlWSlN0Rnk4WHhEOGdsSWZ2NjZMY3NOUGFMc3FZYjF4?=
 =?utf-8?B?R0xDdE5RNHI3VXdyM3Q3bzlQb0RzUUtJNUZVQ0xRZyt3aVcwUmZ4SkJXRTNK?=
 =?utf-8?B?UlcvOU5YQUVoUmhjODhibUN6dUdsZnRHRXpRRWJWRGhWeW9PalI5aWVrM3VI?=
 =?utf-8?B?Z1ROWUR2Ni84YWpUSUwwQUxNSlVWbklxWURoMzl2eW1EM3JRNHZaODlyc0Ns?=
 =?utf-8?B?UkVFdzh2NzBtTVUvODQyY0tsRVdEVWo4VWRUYWFhSnZxb1FTT29RdG0yMGhk?=
 =?utf-8?B?dkhPK3dJeGFTeFBWMUdYZlVvUWMxOTZ1a0J5T3lYVW5WUDVvTHI1L01Kdk1V?=
 =?utf-8?B?S1UvSlVXa2ZGaTkyb2tsaExrbE1SL3htT1VmZVFWV1JVK3lFcHhmL0poaUh4?=
 =?utf-8?B?dE5EZW4vaUxsT3puTmNsRlAxeGlCS3RrQ0FiKy9maXZ5NUdJQmlRZzlBRnVJ?=
 =?utf-8?B?dDRBNy8yeElERTFlVWJtNXphT2JiSVZKZ1RqdGJvZWZoYVd5cGxzNDRVNjYr?=
 =?utf-8?B?ZkNsYThlaUVTaUtrQWRBWVpsNml6VStNekRHMUlDejdXaG1wZ2VlV1FWUlha?=
 =?utf-8?B?QVpQYjFuU0Z0K2NmekNEUThjOVowdk5DY0ZSYWZOazdzVVoxUUhzc1dxOXBF?=
 =?utf-8?B?NHFLdno5ZjVlbEJPUUd2SktOcVhLZnA1RjNwaVRqd3FNbHpCZ1NubHVwMHJi?=
 =?utf-8?B?U2VmN1JyYVR5aG5zNWtaOTB2MjJtK0wrZUdRU2haKzZFVHNkUVJsMmltODhO?=
 =?utf-8?B?N201Rys1U0VOYWNzKzc0eitzd0VVTFNnSzJQcFY4WFlPbFVDL2JObEtDSy95?=
 =?utf-8?B?ZWtMVERPb2JyU0I4N2MvYmVxZ0IrcXlMTGwyaDlUK3RlK1RIZHJ0WUxRV2x2?=
 =?utf-8?B?aEVpRUREeDMrT2I0S0dXZVRib0hIRUFRSFRYaklNS1liWlZCR0MwUG1IQS9s?=
 =?utf-8?B?MFloN3ovY2tORDQzYkNLcnZsRGlFaVgwU2hLaUtJUWtieUhOLzMyNHVDS1kw?=
 =?utf-8?B?eEs4RUJpU3hPZ0lkYlFENE82bFFRM29zODF4NU5ZQXQyMlNXUzMzRTRNY3JW?=
 =?utf-8?B?N3pHSExSZzdVQThSSmVtaGJDajBIcnZsdEhqaVd2YnQ3dVA4ZFgrNTBtZ2FY?=
 =?utf-8?B?RkREODlKdk9GMkN4UlR1Q0hvdys0YThsVlYwK0Q3QTRxUVhYMlZRMXVWM09k?=
 =?utf-8?B?b012bjlhSVBuWmRxeHoxdjN4Z1lHVXhKK3BDWENBY3pMdkYxS2NQSUdmOFNX?=
 =?utf-8?B?ZTJHTjhOT2QxbHUzZTRXTG9YZHNZRzl0eno5NnpHTmRnN0MreGV2Y2FVUGRq?=
 =?utf-8?B?MWNmRmhzQm14UzdBamNFNDZUSG5FT2xwRnhUdWc0ZUk2M0JLWm5zOVVSaGlr?=
 =?utf-8?B?L0hsUmRNQmxwdUp1dDJDUzJjOVI4a1J5bEdXTktzQmwzNjJlWTh6U0NYdlhI?=
 =?utf-8?B?RFJiMDl4VTArSnF4K09tM1Z3VmxjMXltdWRoeGc2QlE2MEZPc2dWNFV6ckpq?=
 =?utf-8?B?d0JhL1FHc2dFUlFMTU8vRVBIbjJvbXhZTEZ1dnFad0QxdndueXRCblVIUXVE?=
 =?utf-8?B?TUlzUDRSUWVRVXRmQXQybXY5NUxJQk5MZjBVSzRpdFlZSTZrQ01OSWMyVEhL?=
 =?utf-8?B?WkRxUVQxZlpaUmdtb2ZITnhjeHRQZ0VsRFQ4RjF3N3lFUWk2a3ZqOGpJK3dV?=
 =?utf-8?B?QXQrMVNLL2RaR0QrS0pwUnNyZUFkd1dLcitjNDN3N0RJcVNmcnhRam5MNUxp?=
 =?utf-8?B?STNWcEM5QS80Y2xXZ3Q4cWRRZkFBOHNwNTArZW1yTCtuZ3cyaEJVRkRiWkpj?=
 =?utf-8?B?dTlMSG95N2oyeXZkSC93cnVRR2p6VnN1dTB5TkM1bExLUmgrdyt2aFhhQW1q?=
 =?utf-8?B?U25sUWYxZmg2d3FMcWVCUWZCRCtyQ0k4VGxoYUFZaTE1UjZXcktFMmVhS0NT?=
 =?utf-8?B?MjBML25BWU9qd1pLcmhiKzYvbnFQQmdDYUNLOERsU2tuaWxuV3lrUjA2aTQ3?=
 =?utf-8?B?bW45UnduOEJqdllqK2dMTnlnZ055TFVlY2lqeXJRbUFSQlYwclYrTTNsNjNG?=
 =?utf-8?B?ZGN5eWtSTG9DNDM2cW1BaldXamljQWRIVkVTaURrY2xaaGhxWW1zanJMZzl0?=
 =?utf-8?B?YmwyNktvYXplZHhRbkVhS01lUkVqamloRUx0OElNekxuZEwrNlFwSlo1eVl6?=
 =?utf-8?B?UTlzS1RobTYyV0pnYytSTDFPd1hVbU0zNWQ2eXdiT3dod01yd20vSEFWczdj?=
 =?utf-8?B?dXJzQ1RSOUdXY1pORzdTRDRXWWo1dDVFN1AySFFRSnFEM1ZyMkxvUWZONkpw?=
 =?utf-8?B?UVZtYlAybnh2Mm5ZTTVGdlhzSkZlV0lrUk1GUENXMXBDTGMvMUpDdz09?=
MIME-Version: 1.0
X-OriginatorOrg: rambus.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR04MB9001.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc58fed-d9dd-421b-0a52-08def7d5880d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2026 18:22:41.5072
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bd0ba799-c2b9-413c-9c56-5d1731c4827c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sL7JHzj5Rc8JtgQvhD4aezSz4oecx+92VX4iQTNoigvlkUeNS7uRYWg9IPkJUw4Rex3T7NzhDCJ1988QEdnIthWHgHFhf/LgoMHCNeInz8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB10245
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_112253_280665_7199EF67 
X-CRM114-Status: UNSURE (   9.82  )
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

On Tue, Aug 11, 2026 at 10:33:56AM +0200, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > +- Management ioctl interface (/dev/cmh_mgmt): ioctl commands
> > +  covering key lifecycle, KIC key derivation, PKE operations ...
>
> And we need custom IOCTL interface because existing kernel interfaces are ... ?
>
> Say something useful in commit msg, e.g. WHY you are doing this, not
> what you are doing.

The rationale is in the cover letter; we will move it into this commit
message in v4. 

Regards,
Alex
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
