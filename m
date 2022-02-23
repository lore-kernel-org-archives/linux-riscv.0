Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE3BC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 02:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=raaSbny8GvbKEpmdWJvQypn+t8fd4GzCI5ZFf7pe5fw=; b=0M1ydTrNIE8VsH1l/BSRrNBAGC
	SWYgePOg6oCAvcMtnEUgJ4wUOW+vPNn9v1VNUlEeHrGtlSQb8K8VO+lmNC8s0EV3Tyl4hT6xTjZk6
	vD7r3rBQse5VxTvqrEmv7NUAVU2XA9E8gzfqUw47ylQ55TNJ9KdPO2TJWgk5mC9FbTdLHz7b962F1
	eZVG4V2ojeGPGW1D8+qoA6DsR3kY1hQ4kdHFDpTP6o8NjygmDGxmaP1xDVyeDUkBjugPRMaUypS0s
	rFvocQCWb7KYteEKTOoQRaJBBeB6iidKQ+cxRfNTHygdSWfFSXEwKX0oCYGez1jRhKuSyuBFCOV4b
	9fqdp3Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMhrJ-00CRS1-7e; Wed, 23 Feb 2022 02:58:29 +0000
Received: from mail-psaapc01on20631.outbound.protection.outlook.com
 ([2a01:111:f400:feae::631]
 helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMhrG-00CRPt-3Y
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 02:58:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AhNAEhHRf1kMDwsfpnuSmV88oJo/rpHxDagpDyApGhA2GhzS9C1W5NDWOU3wzldBevEohTN8Pgn8lPt/fYS/NTpT37c85dPMm0x/IsTZXpaC/LD03NAT6lZzMpDxcYQ+7QzY82BKbfvqCgGwcCmxu81UEd5fHYQbrmnepof2M/9420VhLHinAcIDodQwmnR/efwsPeaIOaHrv3KH2T4k5VxaFDz5qCDsXdEwxFF6f+S8j8qkWzhVU9235+DorHbBITVWtHnHPkoo4xhdygUOuX68Nft6ZrclWen60qxhcIEhjD7cY2EuGaPnLz4Wz6k4OHhaEA708/fJhQQtf+RXkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTmcHFMwdpzn+h87cD+8spsdB4QhW1ySEcT/Dpk2aDE=;
 b=QKyPaDUMXGNZ+riLcJ3lhjJVdHpqX8Y/9XdNGCCilG3X0uEpH5oytD/qD6YDKWz0HuNHM//SPhrKRiXnK9jbd+6qh5LWRBBaQvxRzRa/YXwrYXkiXgvdCQcXiIQrXAxAdvq+iVzFwnWTON4nCdisw/oqgpjcHdySRj2suvXFw6/wHszjaMmOU8mYiGu2Dq+pAWA3N0oRw9Rw2j2CRxL/hsyhxSZDZpTptG7KkJabDXukrw9wVZIN489X1LgSfoEE+ZLq4knpzSkVvDvZkB5/lnwjfi2WT4hFU31iub8pJGUUHKW5y2xMdBdoMky2RrzoolK8tDeuKmjVpEJxjK5KxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTmcHFMwdpzn+h87cD+8spsdB4QhW1ySEcT/Dpk2aDE=;
 b=va/5nHvDFecVndW3KdMAzyRf75qlva6INGibeV/B43ZKaxrGL8oiS8vvbPJ6p6zg5+CtKMeJS0uZ4n7K3nvP8W5X6SzogaVTEnCl+YYZOucV9Qdy9gEdBDMYfoh0cvrwacDGtRLI05kjrniOHHAtjbaDARABZnCAiPo2RzzGM4c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SG2PR02MB5379.apcprd02.prod.outlook.com (2603:1096:4:177::10)
 by TYZPR02MB5151.apcprd02.prod.outlook.com (2603:1096:400:72::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 02:58:15 +0000
Received: from SG2PR02MB5379.apcprd02.prod.outlook.com
 ([fe80::1cb4:8e1f:49c0:8b1]) by SG2PR02MB5379.apcprd02.prod.outlook.com
 ([fe80::1cb4:8e1f:49c0:8b1%4]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 02:58:15 +0000
Message-ID: <e5c0cfdf-315c-836c-8be7-9f952ac0cd9e@oppo.com>
Date: Wed, 23 Feb 2022 10:58:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] riscv: mm: Remove the copy operation of pmd
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "jszhang@kernel.org" <jszhang@kernel.org>,
 "alexandre.ghiti@canonical.com" <alexandre.ghiti@canonical.com>,
 "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>,
 "zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>,
 "ebiederm@xmission.com" <ebiederm@xmission.com>,
 "liushixin2@huawei.com" <liushixin2@huawei.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <mhng-98c8a68c-ecb2-4db1-ab3e-3a35d5e764d0@palmer-ri-x1c9>
From: hanchuanhua <hanchuanhua@oppo.com>
In-Reply-To: <mhng-98c8a68c-ecb2-4db1-ab3e-3a35d5e764d0@palmer-ri-x1c9>
X-ClientProxiedBy: HK0PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:203:b0::29) To SG2PR02MB5379.apcprd02.prod.outlook.com
 (2603:1096:4:177::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2abfac51-a6df-406d-7d6b-08d9f67855f1
X-MS-TrafficTypeDiagnostic: TYZPR02MB5151:EE_
X-Microsoft-Antispam-PRVS: <TYZPR02MB5151EADB630C96AC284806C9DF3C9@TYZPR02MB5151.apcprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bjb+WNPhv+DTN6rKyIsotG4dvYc30fAM88xAx+Ko5u+qh1jzTjR2MoezXAY7LZdj9ojYhg0h65R8ao9wTnzLQgUFYHF5EzNy9mC18PHx6kzfKQXkLAy5M+HczuuCQ6e3Mp9MQe1U76CoYxjHMCg273tvPNuST6lkBwlItEsJoV8sSL/vfV92jT77kmriq1qgwE3fvSDagKZ4CN41YJ6m4WgG5aS+7XAG5TrJY3v3JnyADudMO6mW+73wnPmcxdiEpsQtRrsvDRJmBaVN3EbA7lFeEpUIr53vtvWI5A+FceoAGmwY1SGklPHU0sECjseAJ97dkH0DAoCXgiij9Ba7N3KmJA61FyvxXOZrc2JWFBceq0eejMxto/EmI19yejJmYCx1aBjLb7kSNHU/eIrWxZRylicul0ls9tQuWcuA0fLD0+SEYmAAM9fkqAAriiquy2rXxV3JhcpYdeSLAADsD0j/cpNscXIEXKKlpNx4vq1sB4eun+uO4ysArXNescJ9bcnDSoDiLLnn6ryVkg5ZWsXDGZKnnwn3X8lyQFESbOV+3R1FdBH66r9bpV+mUsTL9aCMeD3jNnG+R7od8c1Yzysz3zdHqWZJ7ITf/Nbd+jhdbqgiDh55sUdhUDR0h7mHHna9bWTmsHiFJCIovZZOxNKHAEtyXztDulXi0mvNPL9YWAT6hq3jBzb1jDAgM2Jx7kcK+qrkvtMByKpQFLeywBgod8PaNIzbnLMNddvVC+Sk9jRnZ3dNn99jV9djF3O9wiZjM6PVHKnhphwQWWQhXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR02MB5379.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(38350700002)(316002)(2906002)(7416002)(5660300002)(31686004)(8936002)(36756003)(83380400001)(6666004)(6506007)(66556008)(4326008)(31696002)(66946007)(66476007)(8676002)(508600001)(6486002)(54906003)(6916009)(26005)(186003)(53546011)(6512007)(52116002)(2616005)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE91M0FrenpBeXUxRC9QK21BTXRvUTFCUEhqYUxPdWhYYm1Ub0hrZDB0RXJ3?=
 =?utf-8?B?anpyRXp1SWFXZjRlL1hkVzVjaWtpdWdOMy92Y0RhZkt4ZXVnL1I0amNVd0dG?=
 =?utf-8?B?KzNYVGh1MHQ2NTRhYU02c0xPY3ZaVEI1OUxHbXFabnFuS0s5YXlka1ZuVHlJ?=
 =?utf-8?B?eXQrcWgzSzcrSFJEWXlPWFhTTnY1Z2xHYnQ3dWdXOG01VkZTZ3JZNk1hVTBu?=
 =?utf-8?B?eXppS1kwTEVCYXJOcE9YdzVhVld2S2p2eU5pL1NMakxaT1VXNWVWd2FZdk1i?=
 =?utf-8?B?WHpmQzI3ckQ5Q3FlOHB4OWhkV3cveFNPN1BwaENYMWNHMnpINm5aV253aVlt?=
 =?utf-8?B?NFh5OFVxajdwa016YjZqQVduZzVmTUpGN3pVNzFiSDdDYjltcG9JTnVhR1Fa?=
 =?utf-8?B?RnYvWFJFVXRaRWRLaExBcVVZSUpaNVYycnl1TG9GNGJHeGJVZFk3TjdwbCtH?=
 =?utf-8?B?TVJpc3RydjBjMVU1cUc0NGlIc0VQTzZqYUtmM2pJVXlHTGtxT0cxdkZHeCtU?=
 =?utf-8?B?MkNUcDh3dlpZb0xkM3R6bEEwQzhnR2had29RbTdmUHQraHRFR2NMbEdQbDM1?=
 =?utf-8?B?Tk9HOFU5TUt3Q3F5YUROOFQ3WFFDSU9WRWRSN0FXTHBEVmRlNXBJRUN6VFVZ?=
 =?utf-8?B?NmZTcGNDOVNYOE84SWE1NHNpeEhTMElZdDY1eUVNYm51bHVmcllydDJzUFdk?=
 =?utf-8?B?ajRpbzRwd3h4L25SL2d3azBWMHpneGE5ZTgzckNYaGx0cTNSK29VcW1qSy9h?=
 =?utf-8?B?Q2RMcWJvYzBTV0YvSnJOT3E1dkNsb3pWQ0dOOWRKRktLMjZYV084NmNISVVF?=
 =?utf-8?B?OFl0WmNGZTdSbExHQlZyRmFkcWx4K0w4MTJHOCtTaDM2YTM0SlhweWFUUlFv?=
 =?utf-8?B?d1A2ZTV2UmtKdFdVNS9JVzdMMXRrb0xXQXpZd3BaOHZ1Vml2a1hXTmRYV0xR?=
 =?utf-8?B?SGQzRmphcVFudGRuSnJKZ0dJdG9ubWo4WGpRdHlYS1gxa2lQMTRkdGJGb1pF?=
 =?utf-8?B?bENRVTZ3YlFvRGJETU5QMXBiUjV3T2dOZDU1bUFRckRPRUF2aFFXU2o5bnVq?=
 =?utf-8?B?VUhMQzV4NFdWRHBsQW0zRWl3WGJaSXJTejNSRHZSTkRDemlQVGRNMzdaMm5q?=
 =?utf-8?B?Q3NTS0NQYTdleUpLQ1VHdXYwTjNyRUVhK1hPZWZhMEtrWFNweGtjcHR5NDI5?=
 =?utf-8?B?MU93VnFWMENRK1p2OVY0VU55ejR6Y3NrR080U21pQUdGMCt1YXJ6WWtLQXZN?=
 =?utf-8?B?YUZRa3h0SnhmOWNXNk5GcUhIcVNlMDFyZGNOMmpmTW50amV0RjlEMEVnL0RX?=
 =?utf-8?B?cVJETDVSQUZjME8vUEhtVkxpZEQ1cE82emd1VHhSSVBmL1Z4QnErUXZoRWtx?=
 =?utf-8?B?ZnRLSVd3US9uaU5iVXJqSXh1ZHVNVGQxNTBQV2NmQWZnQUZHM1BRR1NVdkkv?=
 =?utf-8?B?QlJpdG9telNIUktvMlEyMDZwTjFMZGVaVjJNbnMrcVFTbFp0dTFUaHRzQTV2?=
 =?utf-8?B?eE5HNi9oekswOG82S1kzUTcyakVyazJsY0o4NkFCZkg0K2puS2J3Sk9rcDNG?=
 =?utf-8?B?M3ZUSlpzMjZFcXZObFJ0ZThKaGNwR3NudVpJK0wvS0x3dXZPSHpYbmM1STZE?=
 =?utf-8?B?WWxKaURtOVA1WmRYcDZ2a1BOZWcwSGdwRTZHSTJZSTFyVGk1YjNjOENkUTdn?=
 =?utf-8?B?VG4wZmtKZjNUVE9tK0w4N29pZ2k0SDFuSFkrQW1JK3g3L1RhL1NxOUxhYnlG?=
 =?utf-8?B?STFxS0hPK1N1ZFNvZUNqVk9RclNlaDI5aWRTVDh3dnQrUUhMMmpTaDZOVE5G?=
 =?utf-8?B?eldWL1VRK1FOdUlLWk5pQ0lPaTlrZHlIT1A5bENtRjZjcHBUeXJhOWh2TFB6?=
 =?utf-8?B?TFhWTFhjNWxFKytqY0xnd0lESE5QUFp2bmtDZVFBN0g2UUhVUVZqUVk4bC9Z?=
 =?utf-8?B?TmJka2ZEcGN2NmdManl0VGtFTEhGREVhYnJYWmVtTUVHRWRPbmR2Q042VG16?=
 =?utf-8?B?MkdzUnhXbHh2WFFVR1hLQW9CRVRMVU9PYi9VMDlDYkwrUDg5bkM3RG0zaVVY?=
 =?utf-8?B?c3hQQmdVOFlLUWpsRXdwZERzcnlGUDNFckhweUp2SWIrMjBPbXJlYnFDNjhm?=
 =?utf-8?B?RHBYSEwzTXRLUXpvKzBwNDNRUEpVcnpuKzl3WlBOc1hrcmQ0SmdPbEw2OTF2?=
 =?utf-8?Q?lZNu51xMlAqRKSZQRg42rGA=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2abfac51-a6df-406d-7d6b-08d9f67855f1
X-MS-Exchange-CrossTenant-AuthSource: SG2PR02MB5379.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 02:58:15.1471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gTZV0HqZZnceF8M7y0Hgc9AJRIKffaLwp1tzILvgb3d07NzfKUJ1G8eXZXBE+nw6OBoOda9uVkEBrH8sv6Uj3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB5151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_185826_184612_B5AAA368 
X-CRM114-Status: GOOD (  15.56  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjIvMi8yMyA1OjI1LCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiBPbiBUaHUsIDI3IEph
biAyMDIyIDAyOjA2OjIyIFBTVCAoLTA4MDApLCBoYW5jaHVhbmh1YUBvcHBvLmNvbSB3cm90ZToK
Pj4gU2luY2UgYWxsIHByb2Nlc3NlcyBzaGFyZSB0aGUga2VybmVsIGFkZHJlc3Mgc3BhY2UsCj4+
IHdlIG9ubHkgbmVlZCB0byBjb3B5IHBnZCBpbiBjYXNlIG9mIGEgdm1hbGxvYyBwYWdlCj4+IGZh
dWx0IGV4Y2VwdGlvbiwgdGhlIG90aGVyIGxldmVscyBvZiBwYWdlIHRhYmxlcyBhcmUKPj4gc2hh
cmVkLCBzbyB0aGUgb3BlcmF0aW9uIG9mIGNvcHlpbmcgcG1kIGlzIHVubmVjZXNzYXJ5Lgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBoYW5jaHVhbmh1YSA8aGFuY2h1YW5odWFAb3Bwby5jb20+Cj4+IC0t
LQo+PiAgIGFyY2gvcmlzY3YvbW0vZmF1bHQuYyB8IDEwICsrKy0tLS0tLS0KPj4gICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9tbS9mYXVsdC5jIGIvYXJjaC9yaXNjdi9tbS9mYXVsdC5jCj4+IGluZGV4
IDRlOWVmYmUuLjQwNjk0ZjAgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+
PiArKysgYi9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMKPj4gQEAgLTEwMiw5ICsxMDIsOSBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgYmFkX2FyZWEoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tLCBpbnQgY29kZQo+PiAgIHN0YXRpYyBpbmxpbmUgdm9pZCB2bWFsbG9jX2ZhdWx0
KHN0cnVjdCBwdF9yZWdzICpyZWdzLCBpbnQgY29kZSwgdW5zaWduZWQgbG9uZyBhZGRyKQo+PiAg
IHsKPj4gICAgICAgICAgcGdkX3QgKnBnZCwgKnBnZF9rOwo+PiAtICAgICAgIHB1ZF90ICpwdWQs
ICpwdWRfazsKPj4gLSAgICAgICBwNGRfdCAqcDRkLCAqcDRkX2s7Cj4+IC0gICAgICAgcG1kX3Qg
KnBtZCwgKnBtZF9rOwo+PiArICAgICAgIHB1ZF90ICpwdWRfazsKPj4gKyAgICAgICBwNGRfdCAq
cDRkX2s7Cj4+ICsgICAgICAgcG1kX3QgKnBtZF9rOwo+PiAgICAgICAgICBwdGVfdCAqcHRlX2s7
Cj4+ICAgICAgICAgIGludCBpbmRleDsKPj4gICAgICAgICAgdW5zaWduZWQgbG9uZyBwZm47Cj4+
IEBAIC0xMzIsMTQgKzEzMiwxMiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdm1hbGxvY19mYXVsdChz
dHJ1Y3QgcHRfcmVncyAqcmVncywgaW50IGNvZGUsIHVuc2lnbmVkIGxvbmcgYQo+PiAgICAgICAg
ICB9Cj4+ICAgICAgICAgIHNldF9wZ2QocGdkLCAqcGdkX2spOwo+Pgo+PiAtICAgICAgIHA0ZCA9
IHA0ZF9vZmZzZXQocGdkLCBhZGRyKTsKPj4gICAgICAgICAgcDRkX2sgPSBwNGRfb2Zmc2V0KHBn
ZF9rLCBhZGRyKTsKPj4gICAgICAgICAgaWYgKCFwNGRfcHJlc2VudCgqcDRkX2spKSB7Cj4+ICAg
ICAgICAgICAgICAgICAgbm9fY29udGV4dChyZWdzLCBhZGRyKTsKPj4gICAgICAgICAgICAgICAg
ICByZXR1cm47Cj4+ICAgICAgICAgIH0KPj4KPj4gLSAgICAgICBwdWQgPSBwdWRfb2Zmc2V0KHA0
ZCwgYWRkcik7Cj4+ICAgICAgICAgIHB1ZF9rID0gcHVkX29mZnNldChwNGRfaywgYWRkcik7Cj4+
ICAgICAgICAgIGlmICghcHVkX3ByZXNlbnQoKnB1ZF9rKSkgewo+PiAgICAgICAgICAgICAgICAg
IG5vX2NvbnRleHQocmVncywgYWRkcik7Cj4+IEBAIC0xNTAsMTMgKzE0OCwxMSBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgdm1hbGxvY19mYXVsdChzdHJ1Y3QgcHRfcmVncyAqcmVncywgaW50IGNvZGUs
IHVuc2lnbmVkIGxvbmcgYQo+PiAgICAgICAgICAgKiBTaW5jZSB0aGUgdm1hbGxvYyBhcmVhIGlz
IGdsb2JhbCwgaXQgaXMgdW5uZWNlc3NhcnkKPj4gICAgICAgICAgICogdG8gY29weSBpbmRpdmlk
dWFsIFBURXMKPj4gICAgICAgICAgICovCj4+IC0gICAgICAgcG1kID0gcG1kX29mZnNldChwdWQs
IGFkZHIpOwo+PiAgICAgICAgICBwbWRfayA9IHBtZF9vZmZzZXQocHVkX2ssIGFkZHIpOwo+PiAg
ICAgICAgICBpZiAoIXBtZF9wcmVzZW50KCpwbWRfaykpIHsKPj4gICAgICAgICAgICAgICAgICBu
b19jb250ZXh0KHJlZ3MsIGFkZHIpOwo+PiAgICAgICAgICAgICAgICAgIHJldHVybjsKPj4gICAg
ICAgICAgfQo+PiAtICAgICAgIHNldF9wbWQocG1kLCAqcG1kX2spOwo+Pgo+PiAgICAgICAgICAv
Kgo+PiAgICAgICAgICAgKiBNYWtlIHN1cmUgdGhlIGFjdHVhbCBQVEUgZXhpc3RzIGFzIHdlbGwg
dG8KPiBUaGlzIGxvb2tzIGdvb2QsIGJ1dCAiU2lnbmVkIG9mZiBieSIgbGluZXMgYXJlIHN1cHBv
c2VkIHRvIGhhdmUgcmVhbAo+IG5hbWVzIGFzc29jaWF0ZWQgd2l0aCB0aGVtIGFuZCB0aGlzIGxv
b2tzIGxpa2UgYSBoYW5kbGUgdG8gbWUuICBUaGVyZQo+IGFsc28gc2VlbXMgdG8gYmUgc29tZXRo
aW5nIGJyb2tlbiB3aXRoIHRoZSBlbWFpbCwgYXMgdGhpcyBpcyBjYXVzaW5nIGdpdAo+IHRvIGJs
b3cgdXAsIGJ1dCBmb3IgYSBzbWFsbCBwYXRjaCBsaWtlIHRoaXMgdGhhdCdzIE9LIGFzIEkgY2Fu
IHJlc3VycmVjdAo+IGl0IGJ5IGhhbmQuCj4KPiBSZXZpZXdlZC1ieTogUGFsbWVyIERhYmJlbHQg
PHBhbG1lckByaXZvc2luYy5jb20+ICMgYXNpZGUgZnJvbSB0aGUgbmFtZQo+Cj4gUGxlYXNlIHNl
bmQgYSB2MiB3aXRoIHRoZSBwcm9wZXIgU2lnbmVkIG9mZiBieSBsaW5lLCBhcyB0aGF0J3Mgbm90
Cj4gc29tZXRoaW5nIEknbSBzdXBwb3NlZCB0byBqdXN0IGZpeCB1cCBteXNlbGYuCj4KPiBUaGFu
a3MhCgpGaXJzdCBvZiBhbGwsIHRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcgYW5kIHJlcGx5LiBJ
IGRvbid0IHF1aXRlCnVuZGVyc3RhbmQgd2hhdCdzIHdyb25nIHdpdGggdGhlIGxpbmUgIlNpZ25l
ZCBvZmYgYnkiPwoKVGhhbmtzIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT1BQ
TwoK5pys55S15a2Q6YKu5Lu25Y+K5YW26ZmE5Lu25ZCr5pyJT1BQT+WFrOWPuOeahOS/neWvhuS/
oeaBr++8jOS7hemZkOS6jumCruS7tuaMh+aYjueahOaUtuS7tuS6uuS9v+eUqO+8iOWMheWQq+S4
quS6uuWPiue+pOe7hO+8ieOAguemgeatouS7u+S9leS6uuWcqOacque7j+aOiOadg+eahOaDheWG
teS4i+S7peS7u+S9leW9ouW8j+S9v+eUqOOAguWmguaenOaCqOmUmeaUtuS6huacrOmCruS7tu+8
jOivt+eri+WNs+S7peeUteWtkOmCruS7tumAmuefpeWPkeS7tuS6uuW5tuWIoOmZpOacrOmCruS7
tuWPiuWFtumZhOS7tuOAggoKVGhpcyBlLW1haWwgYW5kIGl0cyBhdHRhY2htZW50cyBjb250YWlu
IGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiBmcm9tIE9QUE8sIHdoaWNoIGlzIGludGVuZGVkIG9u
bHkgZm9yIHRoZSBwZXJzb24gb3IgZW50aXR5IHdob3NlIGFkZHJlc3MgaXMgbGlzdGVkIGFib3Zl
LiBBbnkgdXNlIG9mIHRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaGVyZWluIGluIGFueSB3YXkg
KGluY2x1ZGluZywgYnV0IG5vdCBsaW1pdGVkIHRvLCB0b3RhbCBvciBwYXJ0aWFsIGRpc2Nsb3N1
cmUsIHJlcHJvZHVjdGlvbiwgb3IgZGlzc2VtaW5hdGlvbikgYnkgcGVyc29ucyBvdGhlciB0aGFu
IHRoZSBpbnRlbmRlZCByZWNpcGllbnQocykgaXMgcHJvaGliaXRlZC4gSWYgeW91IHJlY2VpdmUg
dGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBieSBwaG9uZSBv
ciBlbWFpbCBpbW1lZGlhdGVseSBhbmQgZGVsZXRlIGl0IQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
