Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F79CC3DA61
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 12:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LolX6sPVdjQfWSX5ZyBUhWhbcUKl7OizMwXr8Yf99Wk=; b=anSsQTv8OZICWC
	5CjmnW3SG3rlaiJtCk5A4bH07xBoGEbd8ztU+Yf6cNWL8KpZy6Ud6ZesvOjVL8pVMoCwAyTSKHgyS
	HMTfgdnjFdpeiSLEGsbXrRueHX1F9lceqBNvgXbCN/rHBn3bCx5SxRYSe4BbAvxEHsuw2v2EStTqL
	uK5AcgQO9WdbVDgvFkbvcTaSsS75MibsTIITP+QTXSz3HmzFh1hKcYEzw+UjEYo/Soh2esJ1JXStl
	Q/7ygp2E/P6f5cgNjz531+m9AMaH1ikguRzcczvF23PVSlq7gsXUwFqzRmg5GEmxuL9SOuv7pxEo4
	JdgVLbV5W3etqE60AiEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYPUh-0000000BE7K-22PJ;
	Mon, 29 Jul 2024 12:28:51 +0000
Received: from mail-bn7nam10olkn20810.outbound.protection.outlook.com ([2a01:111:f403:2804::810] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYPUf-0000000BE6G-0WYr
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 12:28:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JSQguAOtMGJIml8YND0CNgEKhnl7dlbAZU46n45v90HnPZj+tpw/gw8FGKuArFbMnL8nFj0B3k/72nGy93hGInHBRKHgauXjoWug5vy6THuR/iYNL29x9hQn4MTYbnJquwkC0u7x9pdzh2gEunW6KPnhxJkD13nM0VbUDxPUXfh1q4EWmzTNzmdsyBine7btiS+we2Ybxn5hZa+C+nzy+zf1X4hMkdEBI+SY6akqxfIkAu9repXj8nuva0OfWQOor62JzQHA9o0p8v5Fg0zpNGjfW+0Cphg6i18Uyn5nYMnSttlr5uTwiwJFOnys9MvgQGvq7Teg0DgScvlzc3pDgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PM58Rsgwqq79pXUEh5CBS3gjtaqmwqiUlyG0ixhPdxE=;
 b=ZWNnwTm1sBdIt4ISp8QLcRT815f+rpCP7T21Wt4u6hWpo3u8JcYqe2DP5stAcvWRnHIeorjVBLvQt3xwQyAjUrFh2geNRn2Bi6BVy7p0HukvNUyDPm0q0xlEwsaT5U+1aAwiFurSOqdkoXswAXM6OaRKaxDUdDNznAhh/KWhsX7eKIamKD+uNCOcyB/El7HR2qHPigFOHROximBf7xLXwm2fIoT4Hg/jaY7a/M1y1wYGjxATyG8FDRgXV5NycNn7Wi/S+o2patxs4z1p21yIb+TKFObfK/oPoO8YZTRH7VUfx3CM19VbMcVecDtcN1YimrCH21oGiQUC+FdElmH9GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PM58Rsgwqq79pXUEh5CBS3gjtaqmwqiUlyG0ixhPdxE=;
 b=aOR6UZZJ54mde+MPqVdzl9az04X9DN2z9t/FFSeAzkOYLb7SIk733J9Kqt2jzNajg5XxUutAmd6Ld72XZ9EJEvLxrA7Nc1Um27TJSMGIOLW3/zwdAzERSO/aNA2FnR/SkuUE2OzvBSAiBxO3DXHqE45BrHw0JPeSpZxcr9Xn3RrckA9WjKL3BXqG2WxItk4CFMBo7q+wJ1y+lmfnUlUyzQ/dK2Z6l2a9GJxIpBl+ZFAnhC0rckc8xtdGrzhSZltjMDyW9577jC5Hlt3a+EkiOTC/83b4FkjrSUohklsD9SnW/RKTXLDlA2Z94Vq5erVIY6WYMsK6VUXz+yY4dKwabA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SN7PR20MB5814.namprd20.prod.outlook.com (2603:10b6:806:344::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.24; Mon, 29 Jul
 2024 12:28:36 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 12:28:36 +0000
Date: Mon, 29 Jul 2024 20:28:09 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Inochi Amaoto <inochiama@outlook.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	dmaengine@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Liu Gui <kenneth.liu@sophgo.com>, linux-riscv@lists.infradead.org, 
	Chen Wang <unicorn_wang@outlook.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v8 RESEND 1/3] dt-bindings: dmaengine: Add dma
 multiplexer for CV18XX/SG200X series SoC
Message-ID: <IA1PR20MB4953343445D88F046E1D28EFBBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49535EC188F8EE3F8FD0B68DBBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953865775FA926B2BA4580CBBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
 <172223050278.2763977.11180028101195359000.robh@kernel.org>
 <IA1PR20MB4953E3AEACAC85765AE9442BBBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
 <2e4b504c-6413-42fc-a544-472d4cc1a06b@linaro.org>
Content-Disposition: inline
In-Reply-To: <2e4b504c-6413-42fc-a544-472d4cc1a06b@linaro.org>
X-TMN: [CbF5PmV8xJlb3oS5OYSB06uq2L89flxYfCEGzVqVLt4=]
X-ClientProxiedBy: TYCPR01CA0141.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::8) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <2vtg3yh376ynxksfpyuqcxscf3xweqlrtrfy5rsw34nzyxmbwd@sv5xax6r5ucf>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SN7PR20MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c3aaba-58bd-414f-f868-08dcafc9f7e7
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799003|8060799006|5072599006|461199028|440099028|4302099013|3412199025|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info: djdW2ObLZeiOJzo+RORojkqT9m9c26m6Cs5F5CFY5t79vRBHvkp/43nPYHn8Uw/iiT3cbTF87+2Udxxth5A540d5Lbtrk7tUZ0XDB7A9CUnSUjSWI57NZGoLk+ZVtDiXJwtOB4dWRzMuCpD1fakhT3nTJuudDb58lpMP/8oSk+M/+sZynUwVZfMShmGU2pudXHFU7tEpAXT7u70UmN/JW7PL8lFDPo617AQkbvdg6FE6OkIHO4tkPuLATzvpM9GT4WG6lB2B1w8HLsmOthJ3OhGZVgBGfO28DHMFuK/p+8nd+sBGPFpYBUP3EFV25YCO2ybDOmr4z/l4092nx5iXZYG1UYeaSo1ellj6qzFvdzmWlsSQpLaMq6l0WBxfbXXMHrSbD+1z+uK7qRaLx8nf8L8AnfBIT2m6++sgQD7JhD2qpkH/+95sevlSYe4/yO1TS63g1bwN9ypianmBsLjEw+7/7Vsm5QbjrzD8Rnmaso245u2779zU61DzQtPLJo4ICj9lv4b1yLtdeqE8CsDymdwgpwDtQdQ/1z+/4EFaRhBKbmKRydx90UwTMMipWY/ZkcUy2qj08e/iULRBZI9bL/D7dMxlk7NRqK31gTKoegZ9LRIyJRo9h7SNSW5cGapMt+PrlkVqgUfjRk6zgh6YzocJZdyQudHOi/Xx70Bj27E6rFb/zwVnOGG8HB4nuoPsXMBzZJ1sZZqddejrQ8bP6/1VsSX4YM+223i9+/laW8OVPJNDRx/nkWAi1/raZDryPMgmm/nOt7MqE4KMOOc3ApJg198LOIot1FU9OymbBwEKeRr1rO10/B888ARyy+/S
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VPyiv0Y4YSQY/pJFLSSgicnZQIY4c+zNlHhrkaNTU1uBSNfs9ySb2JVjHFCj?=
 =?us-ascii?Q?5zaK69Gga9v0cmdmpXOlGIoVe4Zh0HE/f16V4QP4yBaKveW/LDYvtqaVyDlI?=
 =?us-ascii?Q?rWG2i0uinUu/qXIfGHr8SI6IL89Ygt84AGPUnW0Fv/E4+0riJJ3RyEWEhbiE?=
 =?us-ascii?Q?J7ZwWutKBflBp4oUfYIjNlnbP5ZftMmHHONkaLC9rApfdYyPYa75Aq7oUvRr?=
 =?us-ascii?Q?qGxBEwsXVv5Fr6OgB9ZkadIKqUFFgfJi9yd41xAmT93CO4eM9Vuqj5s9O1hm?=
 =?us-ascii?Q?jXX4IJubnjzDLaR/mOezUs+DnuYv2Kpihli+XHmXi6NA9I954i0egUEXxS4W?=
 =?us-ascii?Q?8BnN8FuI2RllPJ7daQclO9q0GA4DihrqRvOxIbj90BUGmRonscd2H8JV/h05?=
 =?us-ascii?Q?HFuUqaQVoZry8xTbxgnB9UIBjFmXUkUVXo/FqfHChP2ze2RG2CC+Da+y9SAE?=
 =?us-ascii?Q?XIhPlHjS0uCe1KENrpwsGgW8FFloJct0EZYffcCDh2e45BX/dY8IST8wUBAs?=
 =?us-ascii?Q?nbHmLNGjru5qexyZ6VaxQw5WWWpb4CapBejVcWu9PL9g1ZQ6aJxGDX4JNxp7?=
 =?us-ascii?Q?qp+TYOGhqh+MT6+0z+C4vmiO0x/Ua3UGiOOWfWyK/kapeguM9eJrF2AboQgl?=
 =?us-ascii?Q?J6L4hR3tXh4Ff024EtayqOtSelHW1+jZb0WjqsqjVb+tDom4/Y/SIIk/Mpka?=
 =?us-ascii?Q?TocAiNzsLwgrPjvQhOuUBinUdX9NjrTIwXZ+VsJjYYr9oGR0hXVmti0RVyk+?=
 =?us-ascii?Q?NHrNjD2yb/l/RF2ULHqzlegDBK9eCY+rLgpeSWNya8JCWD6FgK1OCowXF5yn?=
 =?us-ascii?Q?gMRe0soCxg3xyfDOOemHaguaMJBd8hQd0vlezewYxdsfFRUR99H2G84JIu5r?=
 =?us-ascii?Q?UaqpprK/QECXeMilPZGtDrE2irjI+/gvuD4yDrxJwyUUC5Ol1IQgXtLHpIpM?=
 =?us-ascii?Q?2STw5Zi2LFO7f9DpXv4V6fhWqM9hcTmWthwm7fRyWjBGt5AGH8epMdbhKxvG?=
 =?us-ascii?Q?pWxHFDa4orUPvvxhvCtQooqKuC5v0o2/LabI9gpDxUG3yPiln5/cw6xw0d9q?=
 =?us-ascii?Q?jDfBByMhnLF3Z4W667U1cI1QTiL+FR9mROL3x0nomVg59pQZH8DbFBwHJZxn?=
 =?us-ascii?Q?+CXRO5Hi0j6cBMd2l/uZ7hbLp+k0AunAhGrI1EcBMJdg5tpLVts087y8rrkr?=
 =?us-ascii?Q?US29I7e4JQtTFzyKF/CwMJM51AS8PgE6SVta19yBWNjqoWxNxYR3g7rUW6ys?=
 =?us-ascii?Q?xliNWKyr+l97cLn5sQqL?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c3aaba-58bd-414f-f868-08dcafc9f7e7
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 12:28:36.5583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR20MB5814
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_052849_198475_83D2F5FD 
X-CRM114-Status: GOOD (  14.52  )
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

On Mon, Jul 29, 2024 at 11:30:20AM GMT, Krzysztof Kozlowski wrote:
> On 29/07/2024 09:00, Inochi Amaoto wrote:
> >> yamllint warnings/errors:
> >>
> >> dtschema/dtc warnings/errors:
> >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.example.dtb: dma-router@154: dma-masters: 4294967295 is not of type 'array'
> >> 	from schema $id: http://devicetree.org/schemas/dma/sophgo,cv1800-dmamux.yaml#
> >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.example.dtb: dma-router@154: dma-masters: 4294967295 is not of type 'array'
> >> 	from schema $id: http://devicetree.org/schemas/dma/sophgo,cv1800-dmamux.yaml#
> >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.example.dtb: dma-router@154: dma-masters: 4294967295 is not of type 'array'
> >> 	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
> >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.example.dtb: dma-router@154: dma-masters: 4294967295 is not of type 'array'
> >> 	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
> >>
> > 
> > Hi Rob,
> > 
> > Could you share some suggestions? I can not reproduce this error with
> > latest dtschema. I think this is more like a misreporting.
> 
> You would need dtschema from the master branch, so newer than 2024.05.
> 
> Best regards,
> Krzysztof
> 

Is it a must for the type array to have more than 1 element?
I have tested the value "<&dmac 0>" and "<&dmac>, <&dmac>".
Both pass the check (These value are just for test, not the
real hardware).

Setting dma-masters to type "phandle" also has no change. 
It do not accept the value "<&dmac>", Is there any suggestion
for this? Thanks in advance.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
