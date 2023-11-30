Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D82C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 12:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ZW2EOZPFcBTdRvBBNAtlZJ5vEhWz8koMYGSOaWuKis=; b=SvijqH8wyhCYLW
	vyuwmc1DW/ub2KqRRs5TKfEPD8nXCh/FD2RdXRfwj0Isl9FNLWIaI592Ffi8llJjGBSbAxuUEj8Wz
	5SOuQUuiW0xugy4iyw2UNGXAQU/dxZIP2HCJDCACTpf49mlhDgrhtXPXlp7rxPsxI1rZTrFai/gCI
	dh79jaMtaXCW2BVLpGs4WZicKnDWdH0c6Sw4xs2CyH8d5bBCpXtHBx6f4NhsI36Fw38EFSjljk1uO
	emkOOvc+3yHq6qxoFeithapE3pTX6sHtSCpZ6YVkbc3585B2dixeEbahwJrVhMAt7F0vP/3xxvHtH
	i+cPuaC7UIltWcsXNl9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8fyQ-00Aotl-1I;
	Thu, 30 Nov 2023 12:16:54 +0000
Received: from mail-sn1nam02olkn2082d.outbound.protection.outlook.com ([2a01:111:f400:7ea9::82d] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8fyM-00Aos1-0k;
	Thu, 30 Nov 2023 12:16:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHVmPhQ19fk1OC3DPtecWzLAVtxSKfQhRMryMaINBYZ6Bh0CFK0wG8Qat29cpV6DU7y/8r4vmWyrbHqXl9co5SiaLzZqXPBF5QwjVhw+HHtf3d7dzglXNNgts9SW+hvVz7ZwEr1O/UooNLN1sCRPPAyZC4xvKM1knQ4lYBGMdPx8tNucBSOAPHpto8H8A217Op3mGcDJNFzaSpnGsFmIJoUv91XFLrT6snTrpP05pMd+lkWwx9fO5jaPA9CttClDnKchrxwNw25eDOCgMqnNDQ5XVzIDt/cBAgdwhVbthFMlJh+kqZjSzjnFxj2LDNEu1hfYSmcfe1FXeL9G6clQZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+M/M9nICUXJYjG/hmaDCxcFvuxVJL7LsPIweNBcjmo=;
 b=O8+2IKPiPsW2K3cD6dhDOoL4Au6ZAiziH7pVf6mVjqsJJWENEfUpWvZaYnfRbgDp4IR9IFtFSzZuks/upsfbdNnFeNewovQBbZHxODc+BCL2+fCZ/GGihiSSV8W3ouuVPs3rSgPEYDA5LOYT+GCDPbDb+YLYL9nL/XYAmDx2oF1uRvVE1/BALtwqlwcKBq4Lkr6v+Lel9VtgQ7zGHXYW3LnkAKYEuKt5494+SC033r5wnM9vsXbGE+tjT2VfFIIQ9n68xTXbZYQTC7PufgpBKOy7jjZNrqYzpsJ8m0ngmXzpgMxWH4bUh0rv8t3fluljUns25+5t7BndxloOLibDgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+M/M9nICUXJYjG/hmaDCxcFvuxVJL7LsPIweNBcjmo=;
 b=sbhmQ1HdtGBy0HREo4PpUvkDSUIzMnLEpD8xosYP0yGNlebPm3MAaaAnb75g7E9vdDhB+Luk3GISK/Rv34mUm1YkRiT8qnOpUHUkVNX0Z6a1+evXGGgpnYeit/uyw7aVf8l8XvOcpFn/KwS9/Drya+axrVDPYGNl1qDYcB0vvaFp9z0bUL1QbPMWLoIP4EQx29YAhpOg21hq6D7AHFTHpQpgbZ6FOyx9CEsbR6JG8n+UqFsjAgXGni300wE38mH/1tsTk+H+1EHh3A/642sVAH4UTYIjn/VmfQX5QO9uQHF2OlsNiM/QUP7rOuIGXoKwIsNkhG1tpM88di+ogWI90w==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by MW3PR20MB3548.namprd20.prod.outlook.com (2603:10b6:303:59::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 12:16:42 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8%6]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 12:16:42 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Yu-Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [PATCH v4 09/13] dt-bindings: riscv: Add T-Head PMU extension description
Date: Thu, 30 Nov 2023 20:16:38 +0800
Message-ID: <IA1PR20MB4953A05B9162AA2659DE78A5BB82A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ZWhT_VSpl2aksVK7@APC323>
References: <ZWhT_VSpl2aksVK7@APC323>
X-TMN: [mIfqZYRrVxkVYQFgFS+wTBDERuDYG1VI49vmpWfNEtE=]
X-ClientProxiedBy: TYCP286CA0304.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::12) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231130121638.372252-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|MW3PR20MB3548:EE_
X-MS-Office365-Filtering-Correlation-Id: 23919dd2-30a1-4421-6388-08dbf19e3637
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mTQoCdoH2i2LeG/N07kZ/eXNisTe23G25Bw+0q72Ymjsr5lrpF93R9VT+nzQYjM4lopWcELUq5TCeI5VEn6U+NIWFnfi/mnUacFUfnBOTV6WFFRxCWBgYGxABjG+XV7+A0DPg6aigY+nH1IMWnWFiPBF053OF1z1IplVmOQah3WuoD1zsMJ1BiAdMfUcjj9YJluN5XWusRcnPCVN9eZOAKKySN8s7PKConZv82EshNUjha114/blZJfOVChHZzJy5N3elj98ir0FCsA1wh30scRKVSlt0s9MSfikYbAdO9ysY59M1eoF0iBMSdfxeUhMbEUe3rLRkNRGYzKKCtr67PtRR+DlnzyW0bd9oAmJ7P8eAPh+mqVHonyq/Dv2khZb105jfgDDaffrA03ZsMpnwWpX7qvdwEFfuxIduidahPKG95sl0L7jRijxocSQw1EQISw1Gva00/hW2kCm7MvIhtiMWbHvtYt28I89VyKFBHZN/ukQrVcX3qgU9VgrU7BBDMg5b8jsXIwqyLrHRu9XPzMTitaRhqFZ3SwSY0I0PV+/2ZLFhcLI+SeN3fzJCWqGBexfkfskFuH6RG7rmb+zPrfNiGwhlmi52+7avL6sYu1/ALf8IKuC1izUjnCIBcnYQ0mL29HlGqvtAzD8sspaZYnJ2MqduQemVCUK16ReBZE=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjFmNmlrMnY4bXZoTGFiWllybjJsZGtkN2p4My9PTk5obUZOU042enpCcE1P?=
 =?utf-8?B?Z28zbWRqWUk5T3RDMTByaGZQUVV5bXJLRmpqdThlbzhuczFXWm10cnE2cFEz?=
 =?utf-8?B?MVZzclNjcXJuNm1rRnNrZ0JJVldsUHJnQ0gzTE5TdnNRMDVYRkw3bVBJQXdv?=
 =?utf-8?B?K2FIcjdHbTNGeUtKeUo5cSt3S3k4K1hSQVkyVTNCQitVaUtvdVgyOG11MFpR?=
 =?utf-8?B?ZjV6dEplaHQxMmZhV0VYRWhzaktvS29WQStJL3FpcDZ4ckpmZUp0eXc1VTZk?=
 =?utf-8?B?TldaVjZ0bFM0MXdFZzB6VTlRZ1ZtVG8vWTRqeG9IMHRCcnBDOURydTIxYUcw?=
 =?utf-8?B?T3pXeG9mdHNvRldaZCtLdVdqVC9tRFdQMDJHRGdBY3JPejJ5UC82SXBSNGpn?=
 =?utf-8?B?WFhod2ZoOFZFd01QcHJ3bVA2RUhQWXJQTFhwWU9wTkxtWXRJOXFabEQ4bkM4?=
 =?utf-8?B?dU9FUGRuUlRod0txbzRJbmIyYW1OL25yQVB6NWViY0lBUG5YU0Q1S2x6dVpK?=
 =?utf-8?B?MVprbzZZTEkxODFEMEhaRlJxY0dzYzBsbk9WNXI3Zm1nRkJWTzFPUVdPT3Ry?=
 =?utf-8?B?NHpiSzJiWTMyMnVjeDYzU09ZNGFXci9DQUVvYm93Yyt4dk9FKzRNT3JaSDZm?=
 =?utf-8?B?OUxVVnJROGlyaXVIc08rTUF4ZHlldDNTWk94aTBxRk1tamJxcC9iL2J2TzF6?=
 =?utf-8?B?WDlTdW0yVDhaMlNyNjNiQzZCTFFUTzF1M1JVVkgyZ1BHZlRJNEw3cXZoUkNl?=
 =?utf-8?B?akdlOWtpWHAydkZ1VVdaSGFaSWliM09BR3ErdytyVHBmQzhaOU1JaGQzeTZx?=
 =?utf-8?B?WldYRmZxS3NQSTJHNnRydExhRDREOTRqV2RYbW1ya3ZqR25Odm5ZVlo1c0Fy?=
 =?utf-8?B?OEw2azdqZ21RY21pZ2VqRm9LL2laSVBjODdDSktKVks5d2hqZFZYSjlWODZn?=
 =?utf-8?B?YktZc3B2QlpSUTFnT2Z0TzRaZmxUcVpvdXhlLzFhNVFvVVB1Z1gxdG5ESHda?=
 =?utf-8?B?TmhzcVBhc0VIajNxVmJSWEdzay80d3JWMkJPQWlUQ2Vzbi9zQ2cvcUNVWmd5?=
 =?utf-8?B?Z2xmN0lTQm1Yc0I4b1FCSkloTFM5RFkrbDlCNGVTblVrVzllMHBvNGdXVFVS?=
 =?utf-8?B?M2xxckpJYkxOT3RCL3YwbGRzcmhKRHBqQ2xyYXRrQUROdG5SVlJpcGdwWDkz?=
 =?utf-8?B?RWNYQnZyMThVZytIZGRvVTJNdmpVbWxXUVZmMmQxdXZaeUJnRTU4bk5EREVX?=
 =?utf-8?B?QS80T0NvSURhYldOaTN6RWtMZEUzMG1OTUp4R0U5Z01jL0VmSElIdXNxU0ZD?=
 =?utf-8?B?c29UNkFPY3hPN0p3dXlmaXhwQVhCQitLUElSY2J5dUtGMGhsd25QVWlNZGQ2?=
 =?utf-8?B?MVRpRWYwMHcrb05rZzJVODF3ZkVtZW1IVTliam1tYlFPNEdhcjJTWHdVaDEv?=
 =?utf-8?B?MUdMS3puVGM5NkZCTHBkZkhhSXJtakxLbnVYdG0xZDJYZ1AyMnlsMlJDNmoy?=
 =?utf-8?B?QlBoUWttYzBoUXU3M1lGT08zb3ZkRDFMaGxGSjNxNkh4WmRLWHowa3ZUQzFW?=
 =?utf-8?B?K3ZVNDAzeXlHRGh2V0swaXU3L3M2akRROHlPOEQyOVZHUzhweGhrR2ZGbFRH?=
 =?utf-8?Q?HL4/t2zz/JQf5ncvoxRmiQWlM0MeH305i3K6vMEk58S4=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23919dd2-30a1-4421-6388-08dbf19e3637
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 12:16:42.2227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR20MB3548
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_041650_329468_0D8E9F65 
X-CRM114-Status: GOOD (  14.41  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, Guo Ren <guoren@kernel.org>, jszhang@kernel.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, krzysztof.kozlowski+dt@linaro.org, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, palmer@dabbelt.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, Inochi Amaoto <inochiama@outlook.com>, jolsa@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Pgo+SGkgSW5vY2hpLAo+Cj5PbiBUaHUsIE5vdiAzMCwgMjAyMyBhdCAwNDoyOToyMlBNICswODAw
LCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+Pj4KPj4+IEhpIEd1byBSZW4sCj4+Pgo+Pj4gT24gVGh1
LCBOb3YgMjMsIDIwMjMgYXQgMDU6MTQ6MzBBTSArMDgwMCwgR3VvIFJlbiB3cm90ZToKPj4+PiBP
biBXZWQsIE5vdiAyMiwgMjAyMyBhdCA4OjE34oCvUE0gWXUgQ2hpZW4gUGV0ZXIgTGluCj4+Pj4g
PHBldGVybGluQGFuZGVzdGVjaC5jb20+IHdyb3RlOgo+Pj4+Pgo+Pj4+PiBEb2N1bWVudCB0aGUg
SVNBIHN0cmluZyBmb3IgVC1IZWFkIHBlcmZvcm1hbmNlIG1vbml0b3IgZXh0ZW5zaW9uCj4+Pj4+
IHdoaWNoIHByb3ZpZGVzIGNvdW50ZXIgb3ZlcmZsb3cgaW50ZXJydXB0IG1lY2hhbmlzbS4KPj4+
Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogWXUgQ2hpZW4gUGV0ZXIgTGluIDxwZXRlcmxpbkBhbmRl
c3RlY2guY29tPgo+Pj4+PiAtLS0KPj4+Pj4gQ2hhbmdlcyB2MiAtPiB2MzoKPj4+Pj4gICAtIE5l
dyBwYXRjaAo+Pj4+PiBDaGFuZ2VzIHYzIC0+IHY0Ogo+Pj4+PiAgIC0gTm8gY2hhbmdlCj4+Pj4+
IC0tLQo+Pj4+PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVu
c2lvbnMueWFtbCB8IDYgKysrKysrCj4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+Pj4+PiBpbmRleCBjOTFhYjBlNDY2NDguLjY5
NGVmYWVhOGZjZSAxMDA2NDQKPj4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+Pj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4+Pj4+IEBAIC0yNTgsNSAr
MjU4LDExIEBAIHByb3BlcnRpZXM6Cj4+Pj4+ICAgICAgICAgICAgICBpbiBjb21taXQgMmU1MjM2
ICgiWnRzbyBpcyBub3cgcmF0aWZpZWQuIikgb2YgdGhlCj4+Pj4+ICAgICAgICAgICAgICByaXNj
di1pc2EtbWFudWFsLgo+Pj4+Pgo+Pj4+PiArICAgICAgICAtIGNvbnN0OiB4dGhlYWRwbXUKPj4+
Pj4gKyAgICAgICAgICBkZXNjcmlwdGlvbjoKPj4+Pj4gKyAgICAgICAgICAgIFRoZSBULUhlYWQg
cGVyZm9ybWFuY2UgbW9uaXRvciBleHRlbnNpb24gZm9yIGNvdW50ZXIgb3ZlcmZsb3cuIEZvciBt
b3JlCj4+Pj4+ICsgICAgICAgICAgICBkZXRhaWxzLCBzZWUgdGhlIGNoYXB0ZXIgMTIgaW4gdGhl
IFh1YW50aWUgQzkwNiB1c2VyIG1hbnVhbC4KPj4+Pj4gKyAgICAgICAgICAgIGh0dHBzOi8vZ2l0
aHViLmNvbS9ULWhlYWQtU2VtaS9vcGVuYzkwNi90cmVlL21haW4vZG9jCj4+Pj4+ICsKPj4+Pj4g
IGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlCj4+Pj4+ICAuLi4KPj4+Pj4gLS0KPj4+Pj4gMi4z
NC4xCj4+Pj4+Cj4+Pj4gUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+
Pj4KPj4+IFRoYW5rcyBmb3IgdGhlIHJldmlldy4KPj4+IFdvdWxkIHlvdSBzaGFyZSBkb2N1bWVu
dCBhYm91dCBULUhlYWQgUE1VPwo+Pj4KPj4KPj4gSGksIFBldGVyIExpbjoKPj4KPj4gWW91IGNh
biB1c2UgdGhlIGZvbGxvd2luZyB0d28gZG9jdW1lbnQgdG8gZ2V0IGFsbCBldmVudHM6Cj4+IGh0
dHBzOi8vZ2l0aHViLmNvbS9ULWhlYWQtU2VtaS9vcGVuYzkwNi90cmVlL21haW4vZG9jCj4+IGh0
dHBzOi8vZ2l0aHViLmNvbS9ULWhlYWQtU2VtaS9vcGVuYzkxMC90cmVlL21haW4vZG9jCj4+Cj4+
IFRoZXJlIGFyZSBhbHNvIHNvbWUgUlRMIGNvZGUgY2FuIGRlc2NyaWJlIHRoZXNlIGV2ZW50czoK
Pj4gaHR0cHM6Ly9naXRodWIuY29tL1QtaGVhZC1TZW1pL29wZW5jOTEwL2Jsb2IvZTBjNGFkOGVj
N2Y4YzcwZjY0OWQ4MjZlYmQ2Yzk0OTA4NjQ1MzI3Mi9DOTEwX1JUTF9GQUNUT1JZL2dlbl9ydGwv
cG11L3J0bC9jdF9ocGNwX3RvcC52I0wxMTIzCj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9ULWhlYWQt
U2VtaS9vcGVuYzkwNi9ibG9iL2FmNTYxNGQ3MmRlN2U1YTRiODYwOWM0MjdkMmUyMGFmMWRlYjIx
YzQvQzkwNl9SVExfRkFDVE9SWS9nZW5fcnRsL3BtdS9ydGwvYXFfaHBjcF90b3AudiNMNTQzCj4+
Cj4+IFRoZSBwZXJmIGV2ZW50cyBqc29uIGNhbiBhbHNvIGJlIHVzZWQgYXMgZG9jdW1lbnQsIHRo
aXMgaXMgYWxyZWFkeQo+PiBhcHBsaWVkICh3aXRoIG1vcmUgZGV0YWlsZWQgZXhwbGFuYXRpb24p
Ogo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvSUExUFIyME1CNDk1MzI1RkNGNjAzQkFB
ODQxRTI5MjgxQkJCQUFASUExUFIyME1CNDk1My5uYW1wcmQyMC5wcm9kLm91dGxvb2suY29tLwo+
Cj5UaGFua3MgZm9yIHJlYWNoaW5nIG91dCEKPlRoZSB1cGRhdGVkIGRlc2NyaXB0aW9uIHdpbGwg
YmU6Cj4KPi0gY29uc3Q6IHh0aGVhZHBtdQo+ICBkZXNjcmlwdGlvbjoKPiAgICBUaGUgVC1IZWFk
IHBlcmZvcm1hbmNlIG1vbml0b3IgZXh0ZW5zaW9uIGZvciBjb3VudGVyIG92ZXJmbG93LCBhcyBy
YXRpZmllZAo+ICAgIGluIGNvbW1pdCBiZDkyMDYgKCJJbml0aWFsIGNvbW1pdCIpIG9mIFh1YW50
aWUgQzkwNiB1c2VyIG1hbnVhbC4KPiAgICBodHRwczovL2dpdGh1Yi5jb20vVC1oZWFkLVNlbWkv
b3BlbmM5MDYvdHJlZS9tYWluL2RvYwo+Cj5JcyBpdCBPSyB3aXRoIHlvdT8KPgoKSSBzdWdnZXN0
IHVzaW5nIHBlcmYgZXZlbnQganNvbiBhcyBldmVudCBkZXNjcmlwdGlvbi4gVGhlIGpzb25zIHBy
b3ZpZGUKbW9yZSBkZXRhaWxlZCBleHBsYW5hdGlvbiBmb3IgdGhlc2UgZXZlbnRzIHRoYW4gdGhl
IHVzZXIgbWFudWFsLgoKPkJlc3QgcmVnYXJkcywKPlBldGVyIExpbgo+Cj4+IEJlc3QgcmVnYXJk
cywKPj4gSW5vY2hpCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
