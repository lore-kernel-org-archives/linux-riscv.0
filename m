Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB4FC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Mar 2022 17:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sL0QJHT3EmPghsFoKvwRVzRPeSJGq8GXDXFMZ0QCjy4=; b=46205Je1Aka+gv
	STWRVwb1Mmknksr5y0r1OqLhI0qSOV4laY6sRU5qDbN/8ZSURd6zrhblanvZmXKrKdwmZp51Z5hdp
	9FELJIfZG4NN4am5X/biN8B/4WYnZe8aM7FnbtlIWcgUIXOPG/R61RlSzMZ8WtxZOulIpjePM48dw
	XaO4VzEh0l1thbnYlbMFFrgcC+OVEdIiPTH/XgvA4izQSp71WTTRE5/DRkgadgN/rWpRKrQTbocdu
	MUn/K5KUx8OdXEF/ycKzVQdEMJEb4sXiujQ/LLQC3f2BxJGrhw1oFdzcl1TLIDxpJ3uydbzGFeuXU
	LOC1WimUDVNx8Yk8T03g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPpjo-007Pba-14; Thu, 03 Mar 2022 17:59:40 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPpjk-007Pac-Rs
 for linux-riscv@lists.infradead.org; Thu, 03 Mar 2022 17:59:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646330378; x=1677866378;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=E5+jFUjQJnlAAXMBcx3+d5GCw0f2vfuHJTMNLbblLMo=;
 b=p+ldNCTtiyHTbIL3QoBxqfXZp/Gxu4AIFPlkr75iqODiW0k+47NBmv9P
 bGXZpgxyJx9TXnru67zD5xLjuMXgjhEehz3vmqehu89n4+a0e5JLxrO28
 wb/X98VjEGjrsrJWj/dvGSG6rru7H7r6nGQPCL5ZFA/hw0M90RLctjKss
 ljqt/yayB3cGRzxCAJtrndZid7BXyZLlkpqhXVVPLKVQ4LMPzqKhJRJki
 q/zpu6juT066TyU6r60dLffcz1Fr4BDfp/qYHClY7C8jeM1k2uakKIlYI
 /fODdpMTC8W1Xd4myK1VqyRPM12t+lEdaMctGhX9lXm2Oq2LLOtU2SQBN A==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643644800"; d="scan'208";a="195373843"
Received: from mail-sn1anam02lp2040.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.40])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2022 01:59:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CyMRvGoWMC5XO6T72nFSQclAOI5STOw04upUDNpayx091xLV2JdLXm7pyc9g4A1JLyXaM90sOrV3z75SrjxdUeXnegj39fF9NtFmdMwGpO0M0Robv3qQE3fWkhtd7BcZbmJcolnavFeNf1Wqkx+ZZWbM+dy1FYdCAyhu5jKDFZrk6gKy1Lp72BNzWF0SKxGoM8n7H3U/QEN4J6Gfs+pxn1r2aLep64Z6wTf6wGKJDvO4s6Ykea0ZDEiK3tkFQ/Z0mrF9IddtjH6HsXddI8+YD0i/MdR9ifXV2nMkFFXj/4GM5V5U6y0Q7fzAf2hjB+DRpy/G61xq4JLmgI4hD/JbiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5+jFUjQJnlAAXMBcx3+d5GCw0f2vfuHJTMNLbblLMo=;
 b=VmPi6wWtm7DQ05gG6oFsZkxXB8cqNOZprLv//D08AVjy4jRvc/+VbnvcqixXeAQHoA0eSIw5cMQ3AITwxKRXTxomxxbpdLo5wlLZNBHpVbqvzWfV9Bu6EhZxUpJ9Uk/NI3kc8OYg2uNnJulUkh1z3uihVfXj3LHgSWYLlX6zpE9BdVJkkRg1/L8AfP0A4b+pnOHqmkah746lkBZnRPCta2IBuNXnmKGUnuQCmefQCdX2fuAXI4frT52l6owYRnG40uughRruXfiGh7qWmSx0PsRrX05pbChpN5XPQ1gDh9GYqJ24Wae5vSkkZoMEYoo8r6KrJh7tSJskLxx6UtRHXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5+jFUjQJnlAAXMBcx3+d5GCw0f2vfuHJTMNLbblLMo=;
 b=NVxBv2BP36XpO/OmdqVVk6BMaYucVm2i+vZQW/VBWTUsBC6NF1tdT4JbRQNy7KyoRAUUcxNUGyUHlfU3hgCxGBCtY/mCnA+1ZAKyM5saniYjUrq7lnv0NeWmiwiXSO/Aj22W1wOEoUEhZ+na+tqG6U51ndBBPftYUlRXOlzZXCk=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by BN7PR04MB4404.namprd04.prod.outlook.com (2603:10b6:406:f0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 17:59:31 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::c8f4:8499:a5fc:1835]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::c8f4:8499:a5fc:1835%3]) with mapi id 15.20.5038.016; Thu, 3 Mar 2022
 17:59:31 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Niklas Cassel <Niklas.Cassel@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] riscv: dts: k210: fix broken IRQs on hart1
Thread-Topic: [PATCH] riscv: dts: k210: fix broken IRQs on hart1
Thread-Index: AQHYLQV8jnfNWmqMsk69WSN/LNe4H6yt9tEA
Date: Thu, 3 Mar 2022 17:59:31 +0000
Message-ID: <ac991e09-40b1-8fd9-d178-84b48af43a55@wdc.com>
References: <20220301004355.3038142-1-Niklas.Cassel@wdc.com>
In-Reply-To: <20220301004355.3038142-1-Niklas.Cassel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b9ffe86-a8cc-431c-d8bf-08d9fd3f9156
x-ms-traffictypediagnostic: BN7PR04MB4404:EE_
x-microsoft-antispam-prvs: <BN7PR04MB44049B35D12D8314084C681DE7049@BN7PR04MB4404.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CON57vP/W1HTDAo17dgSGKmgA31y44kYmHTR76DOm/1EbXpS404hHGvSjllHn86aeh5L4KkdP3h5bqCCL4aElUy2h8SQgm+R58N5YBCJGn+oy+gk30NmLco+/VUzicxTB0nmkefiy5M1llHAB+5UXmsYkCSp/kh3MJZ1Zyrpyu7JI+SREfmTeGlrzGWjvcF0740ErB5SpU+AiU4a/lMEPw7XaU5nOmQTYw5u1fat26Iqo+d4yKa/p7PgthFZ6ZNgzhMHcTjvTjrz+2Gb27W4hiRybyTTXYI6IPcOiAqsdJ4xiei34L9F463E7soz3tU0ZFctMFKTerusoiaD5V3QHonWorP/37GCfaI3SRsPgvCFauZLdjk2fpfG8StwekVPXaAzLaRzJNFJjDD7wWyQ3WbGI8WP2FQtllvUB2QFOjURehq1AqdyfTM/nPBofU76mmKHhCfK+RldBWAUVInovR7CUimwquALbkzZU7kjXAMt5gV/CZkidwqfsR+o2TohYgl8FtRWAT8wypVV3mzSBNy/6qfbfoX5TrBsqjhoiiZtFn2+OScT8qwi9A839U+FuGgcaSDs4RzJFiN4VFial1MCa4zHzvDdjl631+D7SAIJ+d/MjPg4vfSqHOTNdAyN6VPhWYFEwltOgnM5jyBh/6S/10LbI7pVheRYeVLXs75hcMlHdR60hNiJKhoxvcFSoroaIZwssq1/Sb2VdAnZPMrixbSU0ZzLAHGAVQaMp/RYpZuDYL5ERxv2EMacK3JKM7MoRy3RuwcMzAMSPWf/uQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(66556008)(64756008)(8676002)(6512007)(83380400001)(91956017)(76116006)(66946007)(66446008)(4326008)(122000001)(2616005)(38100700002)(316002)(54906003)(53546011)(26005)(110136005)(508600001)(2906002)(82960400001)(38070700005)(5660300002)(186003)(6486002)(71200400001)(6506007)(86362001)(8936002)(36756003)(31686004)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXROWDVIeDFIVUllSGY1SjU3V2Vjak5vNE5OaEhacEphUHo4RFV4S1BVcnR2?=
 =?utf-8?B?M3JRLzB1Y216aFFZRGhnODRBcEJpd1Z6NmtwMGFZMmpRbERuK21IVExsa3ZW?=
 =?utf-8?B?UHVWYTRjL1N2S2ZYTDFadGdoZlQxaFBKWm4vcGpHNVNHeGpxcVU3cDZENVdT?=
 =?utf-8?B?WG9jeDNzbVZIL2lZTHRrN3Bmb1dlRDVZT3ZhY3oxaGRrYllUcXROK1lLSjBO?=
 =?utf-8?B?NjlubUNpTmprQ1BnMmhyMDNaOWZlc1NteWJQY1Zqb25DTTJlRmFpa0VPb3U4?=
 =?utf-8?B?SmN4MTdkL0dlVUJGY0drRnlWN3hFaUVEREdmTHFKUmo3bTRzNjJKS3BCUm9Q?=
 =?utf-8?B?QXVQajJBRXcxK2pqOElzZHhqbm8rTGhsN0gyV1JycWZrTjR2emhKWXgvSzZw?=
 =?utf-8?B?aTFDTmE0UUs2ZnNTdHUrRGtSM2ZXWmRQbkc2dGhxZmpNeHpyL21lVkpIUDVZ?=
 =?utf-8?B?dVlJajZSaFhkTkl6ajJUQnB2UnE5QUFtaUhJYWpEOGZ5MTJ2TGdkWmtnUjdK?=
 =?utf-8?B?aVl4RFp3eFdjZTBySVJrLzhEVldPRVcyUXVTWUN0V2VQZkI3T1FJRGttem16?=
 =?utf-8?B?aEN0YjZNTjBkZnhFZXo2L01RaUtxL0I3WUZxbEVUbTI3Y0FuLzFFOEpyaldY?=
 =?utf-8?B?blpOOURtSGlBUlJBS2ExbFNjZlUvWkNoTkhYQ3p5MjlvazhBaU5EWktDUFk5?=
 =?utf-8?B?TCtqYVdFc2s2MEhvM3hpNmhobHFuKzFxRnpLa1FQUTdkTXcyN0hHd0dTN240?=
 =?utf-8?B?MFY5TkJOMXBsZzJMUGMrOTltZEpzZ2wyZWlabDNBanlBc3Y3SWdNVnJ4NEhu?=
 =?utf-8?B?UXJQOW4zQkxORTIrWnNMb285RG5Vb3B0VUJtL1JYc3dGc3FpS3MyZTEyL2dC?=
 =?utf-8?B?dXpTOHROdS9nV05lSENmMEdSZ3RPdEtzOHc0QzF4UVZyNWNVK0RXWjVwaDRn?=
 =?utf-8?B?ZGc2Q0pvYUU4clgvTUtwVTFnYlQyenJ6cTY4Wm8vWTdXVmw3Z0NWeW1uK1hj?=
 =?utf-8?B?Vkx0L3d0ZHNobGN1aG84SGVaYllQTWJBZWozOFM2WEF2T3Z1ZHlSOG9ZOTVt?=
 =?utf-8?B?elY0dVBNRHdVeVhyS1R1K2QrUCtON2V2dGo4MDlOd2w0MHZlbmI5S2l5RW9D?=
 =?utf-8?B?RUZrYWFVUTNEZklDaUNmSmxLT09KaFJnRnVKWDRRckE1TmpwZGt6QUZqc2hU?=
 =?utf-8?B?U1FmOUFVSzllZFQ1Q3pOb08zaFBNNXdjaGt1K2NhNEdIL2RVbWdHZlZtSkMv?=
 =?utf-8?B?RytCM3dscEJvY013S1ZXSXJtU3V3aFNQWSt1RWdDQmIyeE5pbEk0bHY1YVNj?=
 =?utf-8?B?M2cyUEY3T1dSUTVLK214SmVSMjhxUmlyV1ZtYkJzbFlBdy9OUk1adFFjVGF4?=
 =?utf-8?B?RnJ5S2t5QWQ0bUFoV28wR1ZTU3BLNy9sb1dsUko5NGg1K0M4R1U4eXFmTmlv?=
 =?utf-8?B?ZG5SSngvVjRJWUZaMUdsWVFjZTVNU3JhYXpVVVVHdWdlZ0ZBUUdNd293ajB3?=
 =?utf-8?B?TkpnV1BianlpNGFKampWd2dwNU1VQVV2QUd2cGs3L1pUWEpUQzVTVExhYTIr?=
 =?utf-8?B?MnRJWDZ3N3JIc2ptcXBLSS9Cb0ltRUl6VUZjUEFnc2ExT01BUkFiY2dPK1pO?=
 =?utf-8?B?OEt5NmxhbWgvOWlkZGZOQ1RrRG0xQ2JYNzRCbnVFV0NyRFdUK2lpMVBQNzYy?=
 =?utf-8?B?QjJqZWxYM1pzVm9TaElOL000QURpSklsczlKQWRXN3ZGNnk4R3pGVHRaRmQ2?=
 =?utf-8?B?RzNxMEpWTStqdnl0MUNHQi9hajFOZDFmTGVZRVBNQWRUZVlxZmJuYUdVaXVa?=
 =?utf-8?B?L0dGSmdJRlppbzRPSnFPL3Q3WnJUbXg5Tzl0VXRDZFZLY3pzaWN6OHJhQjlD?=
 =?utf-8?B?SnkycktLelRsQWZSQ3hXSTlkSndKSTg2a1BFTS85WTJ5WklCY3M2U3lOSEcx?=
 =?utf-8?B?UTJSOEtBUlZXS2pObFpTMi9Sa2RhUmlNUkhyWlhtaXQ2ZDVqeWRkUmhQVGFq?=
 =?utf-8?B?VjFmZkhEN3pub2tJUHlVSUQ4QkNkYm1PYjNlUVNneTZ3ejdVcmRwblVTaEdF?=
 =?utf-8?B?SUIvRnp5cTlSNWlaVjVmSWxaN1dXTEdHY1lsY2NhLzdybmhmRHo3UTBhTE5o?=
 =?utf-8?B?b0NtQUQyQzFxdzNSTHJzbk1pVUtoS1JNVmxPUTUxcTV5TVNkdkYvWUJrcWp3?=
 =?utf-8?Q?FvvWRUPo8d9fk2VepqLma2v2Qye1lruDrYPcOuLevVxK?=
Content-ID: <A22D84F6FBF72A41AE7AAE000DFE58FB@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9ffe86-a8cc-431c-d8bf-08d9fd3f9156
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 17:59:31.2165 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OOA3cM06w80VpxvHN3yMM8sKaBiYv4AwI07jXVGBezzEDvgunhix91OCy4ISOomKL2Itt6aJRvi9GvtOD5QhZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR04MB4404
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_095937_045399_905BD32D 
X-CRM114-Status: GOOD (  24.44  )
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

On 2022/03/01 2:44, Niklas Cassel wrote:
> From: Niklas Cassel <niklas.cassel@wdc.com>
> 
> Commit 67d96729a9e7 ("riscv: Update Canaan Kendryte K210 device tree")
> incorrectly removed two entries from the PLIC interrupt-controller node's
> interrupts-extended property.
> 
> The PLIC driver cannot know the mapping between hart contexts and hart ids,
> so this information has to be provided by device tree, as specified by the
> PLIC device tree binding.
> 
> The PLIC driver uses the interrupts-extended property, and initializes the
> hart context registers in the exact same order as provided by the
> interrupts-extended property.
> 
> In other words, if we don't specify the S-mode interrupts, the PLIC driver
> will simply initialize the hart0 S-mode hart context with the hart1 M-mode
> configuration. It is therefore essential to specify the S-mode IRQs even
> though the system itself will only ever be running in M-mode.
> 
> Re-add the S-mode interrupts, so that we get working IRQs on hart1 again.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 67d96729a9e7 ("riscv: Update Canaan Kendryte K210 device tree")
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> ---
>  arch/riscv/boot/dts/canaan/k210.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
> index 56f57118c633..44d338514761 100644
> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
> @@ -113,7 +113,8 @@ plic0: interrupt-controller@c000000 {
>  			compatible = "canaan,k210-plic", "sifive,plic-1.0.0";
>  			reg = <0xC000000 0x4000000>;
>  			interrupt-controller;
> -			interrupts-extended = <&cpu0_intc 11>, <&cpu1_intc 11>;
> +			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>,
> +					      <&cpu1_intc 11>, <&cpu1_intc 9>;
>  			riscv,ndev = <65>;
>  		};
>  

Looks good to me.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
