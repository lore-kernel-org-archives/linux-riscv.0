Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92137C2FC0C
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 22:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zXVm1X37JObZd4fD82KQBRrXI51JPwkgpw1V2Y7Nz1s=; b=cgeenVVAOOPgrL
	j3iEsZImYtpkPxuK1tVY26UandHu7vIN80dxuNmldaIrH//ZjghqyCqNqPG1sJ2MdoTcLJAShfVHf
	mfUMkDUYMdFfApWp8Bh4dVHJpd2v3S+8WVHNslXyJLd3JE/prGuNiCuYIpnS1SvB8tRkPtw2PLlC1
	FjNzq2PIBjTWerDfIFXH/x8qjUqYITOtYOm9K2P7Zvaiz3KyP3ob5Xa7qEYuruRbCssonTdsbOaTd
	joXF4adTaKdj8w1BdcJpPHrwtrpGFeQiEbYDvWg9pdtsHw/TWZFJ7IrYHGw9lfdmokUA8ygAngwvU
	PjlgpiqIDnxP4o95m7Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qj5a3-004Ldt-0I;
	Wed, 20 Sep 2023 22:21:59 +0000
Received: from mail-dm6nam11olkn20816.outbound.protection.outlook.com ([2a01:111:f400:7eaa::816] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qj5Zz-004Ld8-1r
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 22:21:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrPDdy/t3ShL8zXp17zZr33jFBcann9HMD841F/fxxpr/AvfiL01WFZZyZfOFVB6ae6oRAV9tWdUjUCvXqe1RuVGn3nxY+tagi3ORBkeIW5yeQLmu6wLQqmQFgzlRwPAj0odRmm5u9Si10zwNbniTa5N57IxRdKC+nyi0CecWspaDNoAqmSHowujreWaor5Dl6CW3ybuReqGN0r1YEACq4XCbUiiAvAQcEO/1wKUdB4uqGrcMhGuCD2vmPWjfmSifLseb9X/kQHu43oNXkebVLJF8JGZ9VlVt1h184KmDpvcvABtOBUwsiOsBbnLriT3KIjWmaEXBsVNtj3kgSJgOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/SjzU1WZGGPI//CTri6AQ6g5/d2Xomw+KVu629KzzM=;
 b=Y3DKGleBiNcap8qbC4/xC/M5tpHVUfH/sHUBM3VtNC1joWpTZhwvXQt0WLNCMO91u9FzQAfyGx6KsAcNPaOp+PySeJWn4vwp8+f5E1GRIJ/ozUAcqPaM2ZFX3nGOhS4Sl5Q0QV0a+becoypBTfkvS8P2Bu1CNTJbQ+6kZa2x+ocLx1/fkM4AnBoHwABzEYKmmC3/kSSnIuKU9QKsuik3YPig+3rn9hjK9XyPs1MRHWVNTvmZdPFvc7+9oCGk1INMzfb+gYKRBv5Ka1w3F9Ukm6mtUD7+Y+fUfPTLBXSfxo3TVlALeVDlHChVbg0lfFd7E8J2kXLpmWxKFaELBSjYHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/SjzU1WZGGPI//CTri6AQ6g5/d2Xomw+KVu629KzzM=;
 b=RFpyFERDCvhXg8hgQFsyK4M8HMGlZtIT+yoGCUrDkOjCmYjFJkIflnHjCoXpbQ/tDpIIxFAgbYn7sYDHVkd3I90rZNhQO6AU+sYq0g+68oAh2x/UDbTHLuMajr2XPZOVF9I7lKKcF9Y29I2ECiBUb3uGppJ9dhwc0kfoHR/VK48mBMinw8pz4NjDp4jTNU2HQNYUc0UdXfZsdp56WMFUPemYSjZdI0rrQyUB01Q8+7LixYod0d+Jk9xH1ZhJ/WCPAAfUT6xK4XWbPi+tUgK8Cvb6AgLMlB3iGfMJOIhrwDcTIjgNXiKyRcvdzIOyyf+f28p5XAEr/RzxrimwlNxblw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by MW5PR20MB4428.namprd20.prod.outlook.com (2603:10b6:303:1a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Wed, 20 Sep
 2023 22:21:46 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263%4]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 22:21:46 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	evicetree@vger.kernel.org,
	emil.renner.berthing@canonical.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com,
	Chen Wang <wangchen20@iscas.ac.cn>,
	Inochi Amaoto <inochiama@outlook.com>
Subject: Re: [PATCH v2 06/11] dt-bindings: timer: Add Sophgo sg2042 clint
Date: Thu, 21 Sep 2023 06:20:58 +0800
Message-ID: <IA1PR20MB49531B3B43CCD5F1644E3B81BBF9A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920-992a56b66366f3c0591a6a94@fedora>
References: <20230920-992a56b66366f3c0591a6a94@fedora>
X-TMN: [+hQ5Ru9z/hKr435Dz2T8P58CyWWIzz5QtLbEye2GuKc=]
X-ClientProxiedBy: BY5PR16CA0003.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::16) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20230920222059.6068-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|MW5PR20MB4428:EE_
X-MS-Office365-Filtering-Correlation-Id: 79369663-36e4-4cb5-6f9d-08dbba27f955
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Cm+br/KMu+TMzivty4G2CAwE6hBMYqTC92Yi+Ddm0eU1UwOCkjIh5/ymPQ4/CGywZfxrgQGZjkjD5yEiuVh2PlteN5t8LQJ6MGec0zzekJrIzXKctBb9GPjZHNtgCXeXa+0mfubb/FMJ+RrUA+LGs7kjX8jPqsxL5OciY/E+T68Qdx7WUl8Up8IYRUucEb7M7r0ugyrutrIHDxp9bddkhOhh4OF0srUTKrc4HyUka2dHVcJMAbyZb22D/7putHIS52/qW0bGQU2Hzd7LRt7LyZXIkvm8qzjKlBm37s8o/zWQAhcwA5c6WHwkcqhlpYqovsvcCGIBJnY4m+cLmsCaHyfkMplqSaLR0ILp6kCDAesjMr0Wv3E7F3G2NTSopJaFe7UO4VbuaHM/fXXCOTpPLXhKZFSecBe4A6aucZbsIijp0PMrj2xGJfp36kNLs09UG3AQgPdsVvHgdWD98EhAic1Pv4aZ8IroVW1co6AnXnnTkhjR9Ejh5TfIk2Vpato5MxEJTTu2XJ4pE2zWrQorFAIeVW0OQlUrXOAnj74pOWInB8sD/6KZKzjz15fBcaEdCAVrOv9/BfkiwyTBM0og1vlHc3w7iuzePRl5WcyZqRQv/974fFERokcqf1qVnfwzPnaLcZzOR/b8kBR7AcRSehFxHg1RiO+pkye2UbDGIg=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU00L1dqNHNEOTRZTEY2ZjRkVXAxRzRKcERVMDFxU3N0ekxwZFJzR2JaV2Zx?=
 =?utf-8?B?T3l0dUxVb01LVjQ1bzNnd0cwd0h5YmUydnUvZGgvcWVhd2RFcHRHcXdFcGV6?=
 =?utf-8?B?ZVZRZldEWTcyOW45Z1FzNjVRcHpNMWMvOVgxNElYdjJPL2RrR3lmZ1BrK1Ra?=
 =?utf-8?B?ekxILzlGK0RmTzQ3Y0tJK1VDalRjdmdFeldyUi9YUW5ETXNWWExiU0xEQmxV?=
 =?utf-8?B?TkxKdWtPaXN2WWZ4Zms1TDNHa3ZHTzNhZHB3TmppRkIvbWt0eTlHdVltT0Na?=
 =?utf-8?B?dG9YRGx3ajdoVENrblVWcFpzajZRQW56OFJnT3FiVlQ5MzJkZ1AvcmFXeG5j?=
 =?utf-8?B?Vm96WXZHbnR0NGRmYTRiZTJ1TGJTUFVRZElsWEJ6cEFZY3E1dXVjUFJGMFZx?=
 =?utf-8?B?U2pDM1pSL0Y1OGpIKzBqL3MvZXk1cnhzb1pqd0Zzbk9GaTNKc3VycVZwU2dW?=
 =?utf-8?B?SU5MNk9HT011NFArRGtJRzllb0JOQWtCQkhQTERJSlhmZHQ2NzFzZVhVTnls?=
 =?utf-8?B?NWlDMHVhdkJXWUNBVjhJbElDWnZVNGxadm1zU05iZ2s5dG5nY1BoNjFnVUZ2?=
 =?utf-8?B?V0gydytGM2c3cTVZT3BFQVZSaVpUc09seGJCZ2ZPTHc2TUhnM0tCVWtuTDJB?=
 =?utf-8?B?MG8zV1A4QVhNa2w3MHNqeEJoSVRRSWVjN1V6YndiYm84SWlRZzZjT3lWRXZW?=
 =?utf-8?B?K0lvaDhkY3JlaUtCNVduTmR0dWJvQVdZNjJxZTRwWE42YXY0Q1JRMk5iVmNW?=
 =?utf-8?B?bExEV3Z5ZEVnekFoMUhHQlJEcE5jOVlya3h5WGtjVGdjT0wyVmlFWVhZVGNK?=
 =?utf-8?B?NXNwU2dMZS9sNEJEdldpNC9ydXJobVNEWEtVSWxmQ28zY0h1emdsYWFoc01C?=
 =?utf-8?B?VUNzSXpMcWJHem54RVFQcjgvVHNHTXJrWnFpdDhycWtmNU1WUUptRkJoSDRN?=
 =?utf-8?B?cnFENU93OVE5UjNlc2ExK0FqR3U3TDZsUkhFbS91c0VCNFZVZ09ta0F2OU0w?=
 =?utf-8?B?bkg5M01tUlBvcTVkTWk1dGxDRGNwaVU2OEdXcFU4bm1IVUZ6akJRU0I2aGFX?=
 =?utf-8?B?Q3BMcEZzbW44ZjBQUnBUVEFrbXFCMGNVSER0T2NGbnF0dzUrMjV2UC9wZHd0?=
 =?utf-8?B?SXVRZmpuVlVaWnRZSjVwTXhacS9naElzdk5JbEVIbTRLK1piK2tOYnF1R2ZG?=
 =?utf-8?B?YjR6SVpmeXlNb1lGSE5FUm9SbHBySUhNcng4SW1WRXdROEJ6OWxTN2d2WXpt?=
 =?utf-8?B?aVpyYVRYSUoxdXRha0t5RThoNFN1VWVhdVR0RmEvSFB3V0hvRFB4YVNDMFBW?=
 =?utf-8?B?Nms3SnhHL0d5U0FkT0FJVVM0MEd5eGVjWTVWdG9jMHRZNHBwRFlBcEd4Qjky?=
 =?utf-8?B?Nk1kY3VBQlU4aWVUaURQcG1jMjlGTUdXSlhnU05zMHhUQk82VEVSTGF1R0hU?=
 =?utf-8?B?YjNZemM4blMwVEZ5OUNEUGFxVEJ4QVFJMzh2Q2FpMk41ZVVrajM2T2xQOHRv?=
 =?utf-8?B?Z2tQdEhuRTcyMUdrS2R1OHIwY0F0NGlBWXdWblZHVXBlZkJKMjFEaENYSXcr?=
 =?utf-8?B?QTlIYVdtVEZlNXdLQ0VnSFJIZS8xNjJJUmdha0JFZ1Y4Mk1WT1V0VGV1NEcw?=
 =?utf-8?Q?Mxds4zZ21mp0XEE2fEG/eCQtLscQOe3hSwwlBEFQKva4=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79369663-36e4-4cb5-6f9d-08dbba27f955
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 22:21:46.7473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR20MB4428
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_152155_628629_72F40957 
X-CRM114-Status: GOOD (  21.15  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Pk9uIFdlZCwgU2VwIDIwLCAyMDIzIGF0IDA4OjA4OjQ5UE0gKzA1MzAsIEFudXAgUGF0ZWwgd3Jv
dGU6Cj4+IE9uIFdlZCwgU2VwIDIwLCAyMDIzIGF0IDY6MjjigK9QTSBDb25vciBEb29sZXkgPGNv
bm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4KPj4+IE9uIFdlZCwgU2VwIDIwLCAyMDIzIGF0IDA4
OjQwOjA3UE0gKzA4MDAsIElub2NoaSBBbWFvdG8gd3JvdGU6Cj4+Pj4+IE9uIDIwLzA5LzIwMjMg
MTQ6MTUsIElub2NoaSBBbWFvdG8gd3JvdGU6Cj4+Pj4+Pj4gT24gMjAvMDkvMjAyMyAwODozOSwg
Q2hlbiBXYW5nIHdyb3RlOgo+Pj4+Pj4+PiBGcm9tOiBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFA
b3V0bG9vay5jb20+Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEFkZCB0d28gbmV3IGNvbXBhdGlibGUgc3Ry
aW5nIGZvcm1hdHRlZCBsaWtlIGBDOXh4LWNsaW50LXh4eGAgdG8gaWRlbnRpZnkKPj4+Pj4+Pj4g
dGhlIHRpbWVyIGFuZCBpcGkgZGV2aWNlIHNlcGFyYXRlbHksIGFuZCBkbyBub3QgYWxsb3cgYzkw
MC1jbGludCBhcyB0aGUKPj4+Pj4+Pgo+Pj4+Pj4+IFdoeT8KPj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+
IElmIHVzZSB0aGUgc2FtZSBjb21wYXRpYmxlLCBTQkkgd2lsbCBwcm9jZXNzIHRoaXMgdHdpY2Ug
aW4gYm90aCBpcGkgYW5kCj4+Pj4+PiB0aW1lciwgdXNlIGRpZmZlcmVudCBjb21wYXRpYmxlIHdp
bGwgYWxsb3cgU0JJIHRvIHRyZWF0IHRoZXNlIGFzIGRpZmZlcmVudC4KPj4+Pj4+IEFGQUlLLCB0
aGUgYWNsaW50IGluIFNCSSB1c2UgdGhlIHNhbWUgY29uY2VwdHMsIHdoaWNoIG1ha2UgaGFyZCB0
byB1c2UgdGhlCj4+Pj4+PiBzZWNvbmQgcmVnaXN0ZXIgcmFuZ2UuIEkgaGF2ZSBleHBsYWluZWQg
aW4gYW5vdGhlciByZXNwb25zZS4KPj4+Pj4KPj4+Pj4gV2hhdCBpcyBhIFNCST8gTGludXggZHJp
dmVyPyBJZiBzbywgd2h5IHNvbWUgaW50ZXJtZWRpYXRlIExpbnV4IGRyaXZlcgo+Pj4+PiBjaG9p
Y2Ugc2hvdWxkIGFmZmVjdCBiaW5kaW5ncz8KPj4+Pj4gQmVzdCByZWdhcmRzLAo+Pj4+PiBLcnp5
c3p0b2YKPj4+Pj4KPj4+Pgo+Pj4+IFNCSSAoU3VwZXJ2aXNvciBCaW5hcnkgSW50ZXJmYWNlKSBp
cyBkZWZpbmVkIGJ5IHJpc2N2LCB3aGljaCBpcyBhbiBpbnRlcmZhY2UKPj4+PiBiZXR3ZWVuIHRo
ZSBTdXBlcnZpc29yIEV4ZWN1dGlvbiBFbnZpcm9ubWVudCAoU0VFKSBhbmQgdGhlIHN1cGVydmlz
b3IuIFRoZQo+Pj4+IGRldGFpbGVkIGRvY3VtZW50YXRpb24gY2FuIGJlIGZvdW5kIGluIFsxXS4K
Pj4+Pgo+Pj4+IFRoZSBpbXBsZW1lbnQgb2YgU0JJIG5lZWRzIGZkdCBpbmZvIG9mIHRoZSBwbGF0
Zm9ybSwgd2hpY2ggaXMgcHJvdmlkZWQgYnkKPj4+PiBrZXJuZWwuIFNvIHdlIG5lZWQgYSBkdC1i
aW5kaW5ncyBmb3IgdGhlc2UgZGV2aWNlcywgYW5kIHRoZXNlIHdpbGwgYmUKPj4+PiBwcm9jZXNz
ZWQgYnkgU0JJLgo+Pj4+Cj4+Pj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNh
L3Jpc2N2LXNiaS1kb2MKPj4+Cj4+PiBZZWFoLCB0aGlzIGlzIHRoZSB1bmZvcnR1bmF0ZSBwcm9i
bGVtIG9mIGhhbGYtYmFrZWQgYmluZGluZ3MgKElNTykKPj4+IGVuZGluZyB1cCBpbiBPcGVuU0JJ
ICh3aGljaCBsaWtlbHkgbWVhbnMgdGhleSBhbHNvIGVuZGVkIHVwIGluIFFFTVUpLgo+Pj4gVGhp
cyBULUhlYWQgc3R1ZmYgaXMgY29taW5nIGFjcm9zcyBvdXIgKG1ldGFwaG9yaWNhbCkgZGVza3Ms
IHNvIHdlIGFyZQo+Pj4gb2J2aW91c2x5IGdvaW5nIHRvIHRyeSB0byBkbyB0aGluZ3MgY29ycmVj
dGx5LiBJIG1heSBlbmQgdXAgc3BlYWtpbmcgdG8KPj4+IEFudXAgbGF0ZXIgdG9kYXksIGlmIEkg
ZG8gSSB3aWxsIHBvaW50IGhpbSBhdCB0aGlzIHRocmVhZCAoaWYgaGUgaGFzbid0Cj4+PiBzZWVu
IGl0IGFscmVhZHkpLgo+Pgo+PiBSSVNDLVYgQUNMSU5UIGlzIG9uZSBvZiB0aG9zZSB1bmZvcnR1
bmF0ZSBub24tSVNBIHNwZWNzIChsaWtlCj4+IFNpRml2ZSBQTElDKSB3aGljaCBpcyBpbXBsZW1l
bnRlZCBieSB2YXJpb3VzIG9yZ2FuaXphdGlvbnMgYnV0Cj4+IG5vdCBvZmZpY2lhbGx5IHJhdGlm
aWVkIGJ5IFJWSS4KPgo+WWVhaCwgSSBicm91Z2h0IHRoaXMgc3R1ZmYgdXAgYXQgdGhlIHdlZWts
eSBwdyBzeW5jIGNhbGwsIGFuZCBQYXVsCj5wb2ludGVkIHRoYXQgb3V0Lgo+Cj4+IFRoZSBTaUZp
dmUgQ0xJTlQgaGFzIGZsZXhpYmlsaXR5IHJlbGF0ZWQgbGltaXRhdGlvbnMgd2hpY2ggbWFrZXMg
aXQKPj4gbm90IHVzZWZ1bCBmb3IgbXVsdGktc29ja2V0IGFuZCBtdWx0LWRpZSBzeXN0ZW1zLiBU
aGUgU2lGaXZlIENMSU5UCj4+IGlzIGFsc28gbm90IHVzZWZ1bCBmb3Igc3lzdGVtcyB3aXRoIEFJ
QSBiZWNhdXNlIHdpdGggQUlBIE0tbW9kZSBoYXMKPj4gYSBuZXcgd2F5IG9mIGRvaW5nIE0tbW9k
ZSBJUElzLiBEdWUgdG8gdGhpcyByZWFzb25zLCB0aGUgUklTQy1WCj4+IEFDTElOVCBzcGVjIGJy
ZWFrcyBkb3duIHRyYWRpdGlvbmFsIFNpRml2ZSBDTElOVCBpbnRvIHR3byBzZXBhcmF0ZQo+PiBk
ZXZpY2VzIG5hbWVseSBtdGltZXIgYW5kIG1zd2kuIFRoaXMgYWxsb3dzIHBsYXRmb3JtcyB0byBp
bXBsZW1lbnQKPj4gb25seSB0aGUgcmVxdWlyZWQgc2V0IG9mIGRldmljZXMuIFRoZSBtdGltZXIg
YXMgZGVmaW5lZCBieSB0aGUgQUNMSU5UCj4+IHNwZWNpZmljYXRpb25zIGFsc28gYWxsb3dzIHBs
YXRmb3JtcyB0byBwbGFjZSBtdGltZSBhbmQgbXRpbWVjbXAKPj4gcmVnaXN0ZXJzIGF0IGRpZmZl
cmVudCBsb2NhdGlvbnMuCj4+Cj4+IFJlZmVyLCBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Yvcmlz
Y3YtYWNsaW50L2Jsb2IvbWFpbi9yaXNjdi1hY2xpbnQuYWRvYwo+Pgo+PiBXZSBuZWVkIGEgc2Vw
YXJhdGUgRFQgYmluZGluZ3MgZG9jdW1lbnQgZm9yIEFDTElOVCBNVElNRVIKPj4gYW5kIEFDTElO
VCBNU1dJIGJlY2F1c2UgdGhlc2UgYXJlIHNlcGFyYXRlIGRldmljZXMuIFRoZQo+PiBTb3BoZ28g
c2cyMDQyIFNvQyBzaG91bGQgYWRkIHRoZWlyIGltcGxlbWVudGF0aW9uIHNwZWNpZmljCj4+IGNv
bXBhdGlibGUgc3RyaW5ncyBpbiB0aGlzIGRvY3VtZW50Lgo+Cj5JZiB0aGUgc3BlYyBpc24ndCBm
cm96ZW4sIEknbSBub3QgYWNjZXB0aW5nIGEgYmluZGluZyBmb3IgdGhlICJnZW5lcmljIgo+dmVy
c2lvbiBvZiBpdC4gQmluZGluZ3MgZm9yIHRoaXMgc3BlY2lmaWMgaW1wbGVtdG5hdGlvbiBhcmUg
b2theS4KPkZvciBzdXJlIHRob3VnaCwgc3F1ZWV6aW5nIHRoaXMgaW50byB0aGUgc2lmaXZlLHBs
aWMgYmluZGluZyBpc24ndAo+YXBwcm9wcmlhdGUuCj4KCkEgc3BlY2lmaWMgaW1wbGVtdG5hdGlv
biBzb3VuZHMgbGlrZSBhIGdvb2QgaWRlYSwgYXMgdGhlIGNsaW50IGxheW91dApvZiBzZzIwNDIg
aXMgd2lyZWQgYW5kIGhhcmQgdG8gbWVyZ2UgKGlwaSBpcyBjb250aW5vdXMgYnV0IHRoZSB0aW1l
ciBpcwpwZXIgY2x1c3RlcikuCgpGb3IgYSBzcGVjaWZpYyBpbXBsZW10bmF0aW9uLCBJIHdvbmRl
ciBpZiBpdCBpcyBiZXR0ZXIgdG8gdXNlIHR3byBmaWxlcyB0bwppZGVudGlmeSB0aGVzZSBkZXZp
Y2UgZWFjaCwgaW5zdGVhZCBvZiBvbmUgZm9yIGFsbD8KCj5XaGF0IHdhcyBwb2ludGVkIG91dCwg
SSB0aGluayBieSBTYW11ZWwsIHRoYXQgdGhlIHJlYXNvbiB0aGF0IHRoaXMgbWF5Cj5uZWVkIHRv
IGJlIHNwbGl0IGlzIHRoZSBmYWN0IHRoYXQgdGhlcmUgYXJlIG1hbnkgcG9zc2libGUgTVRJTUVS
Cj5yZWdpc3RlciByYW5nZXMgJiBwb3NzaWJseSBzc3dpIHN0dWZmIHRvbyB0aGF0IHdvdWxkIG5l
ZWQgdG8gYmUKPmRpZmZlcmVudGlhdGVkLgo+Cj4+Cj4+IFJlZ2FyZHMsCj4+IEFudXAKPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
