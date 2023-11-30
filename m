Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE36C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 08:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BSbumJM7gw1/XnVo07JjHQUQO53uIAGDatiSXSbzvsU=; b=Ip/sHv7/qPv/7i
	WmKj36ldOdH7QXRc/ZsXkw/9UcyuGEQ8X+NWBXWtBkKwJCNS/RLJfUNul1dAhyDEnJEUZELdXZZWw
	QK5Zk9zaLy97yb6Tm3wubCTomOlZQt7WRS8HGeBhp4GTDsjpHTcTIn2oGfRr2c3/DX3htBdS+8+wd
	GoKz9rCrQl+P9V3BP6wFPIhS4NlS7fDgOu8GlPY7I19S/genjD/WgdF5lhqxwxjRe7k0ushoZBHhk
	YB/k2CwTaG5BVm+ovzkqEn3+/t+8Ao6NWwE3EtBqs600GPqOcgb040GtTcKNDHu4yYeds9Ats/EzG
	SInltdqRSdY7pPMHUxfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8cQQ-00ADQC-2o;
	Thu, 30 Nov 2023 08:29:34 +0000
Received: from mail-co1nam11olkn2081e.outbound.protection.outlook.com ([2a01:111:f400:7eab::81e] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8cQN-00ADOa-0G;
	Thu, 30 Nov 2023 08:29:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lc0tBwpg/ZdzqGBY4sADoowzVDOZyBXXOkXpIm16krdRBYiSvYhO/hIxbyfP6YwN/lFm2RCtPqxPPzVFyCn84YYZp7Qe/D+vmqdmcs+iKi2pjC3fR5LtL+Ge7OQhR6mfcNIlw1sgCaA73CZ2KLSToLV0mtpRvAeYZMEAPKFztqHRvwNw1t4xVXN812sgPbBGe99aTjSd2IlGoyGNYnv8wm0lE7G0sguB7CCk08o/TTuviFCriolDyjDk3LV7YGtK+0vBeu41P3BIcXN5PmjWJT+13qR4uuhIkAqTam10/EX8yvg9XoqT/PHrAtE4Y2OzUeIIrSP6BIHMiNSkIo1R4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuS3J0Mb2RKzFcskZ/u9lKpG1xUxld7DKBvalFR5ETc=;
 b=CoLd4zrKs7xt0p5fi1IlE1VcmxNUhFVQ+hZiFj1pxNsICMOEQu+AG/WlvbZarYN7yEDkWxrtgbDIYhx+AlCF8gVhJheFMRWaRujbUwDOPH8+nJWXi1KB1bVy3kskGjva8MOLVvi027rupp0SRT7bIRFYSl6dBZGGgS2T/a20L9PjcuFdvaiBWneAeeZhusSMs61jipCF9ieuEs8niK56VNUNqc7dgcbecdWY11JUBrGoqsWC6mTU5obszmmy+SQW5/A5g1IFlcDBtnumJ94dNhckaNZ6sEXzcBFPaiXWzuDpTFD8wJdnj9YayahKSBEF/LSBDDLZwTgdXO+mDyuFHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuS3J0Mb2RKzFcskZ/u9lKpG1xUxld7DKBvalFR5ETc=;
 b=ei71DpBgglKmI2xbQn6yIpk0JIqGpQ3DsyOO9lQUEX3eLsGIk8iTthqwoR6EV1mPmxpfIqjAkM8elYBh34AG5WTV6dPr9rVinbR57B0gvpfcTrbM0q5Lfhbtaa8xknCn42MCK4uuwIlap6iMZNlGm1vJr3foCkrNvA8xyMzQIQdk8Y0Lwt8PMFcPDr1sT8m6XHS7bT9tYKxUn3hPsXRIRtsqVUFE0rABZSVR13lUDgmIMTNYvAbA+FfvNnQ0nrUyGs8GVxEwRPa21dOY1+ieVM+bcKm0pzjQKWOssGf6XYZqRUU4VYHap5sxZNQrGXgQlxjCY9nsR4Sf1vxmZ5xYCA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by LV2PR20MB4677.namprd20.prod.outlook.com (2603:10b6:408:179::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Thu, 30 Nov
 2023 08:29:24 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8%6]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 08:29:24 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Yu-Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [PATCH v4 09/13] dt-bindings: riscv: Add T-Head PMU extension description
Date: Thu, 30 Nov 2023 16:29:22 +0800
Message-ID: <IA1PR20MB49537364BDF1ADE185CA8FE4BB82A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ZWb6-LEkyh5RRpcP@APC323>
References: <ZWb6-LEkyh5RRpcP@APC323>
X-TMN: [EBa3r4hqDh0RrCv7sIxmB+P9fF6W+5EBDmKKlKMZNfo=]
X-ClientProxiedBy: SJ0PR13CA0111.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::26) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231130082923.329153-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|LV2PR20MB4677:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a3eea9f-f97b-4dec-37bf-08dbf17e7561
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xisGXSkcn1uetDq33P2fZ8q455etabpBOtR7zrHsBtZfNJ9AOW526dIoHAXI4vDRJXYR9PVgKdP/RBenqVDdFrV02oVndu24TcYGBB33KeI+xsQ5yK6C/rj8VJjeeEzNCMOE46o4J24CVNdTSu6prKKLHW/7gMH6HHw3ZSke6FG0LT8tWKCkVsNq51eh/LGAKwreJSYYtoApROJJajk7SnufPUpvxS0np8bCkoLgwORe+2HRszVLhQYYj8DI93mcy81ohsyHCmdA51qA/bURIRPDlfZTkKjSfGOO3TuiCLPGkL3GvdOXM4gaBVwnCNFNOOL9I/Zl5tzuFRpLzk9CqmRb16iFLWMoiFu8if+WJizx/4m33qmEKD1RNneh0tVOp6JtmEQ01InwnNufS3/ewtr+ZBI1VVbPpqp2o85Hjcb/F/DRAWgc4so35ZRpeWTrG/egGCFRtL5zh9XnbfTgxTCNIEmYD8Z+DXgvjbnamK7wPpAC4pZ6ZjJKchMBfnjbhgaE/ZWTb7sBhczFd7qSLF30gTalc1q/EAVkBvMk5rZFD5BKca+rMcjjALSZhLhVrmJ47mBWP0jVQx/rZu/XC6IhHn7+1Nz3T3i0F+TPihUvImNiOkBgsosDC7KiRZe480fiVAgJl0giT5FgV3aMTnbOoeiRbCqmwxDe3fYkEhU=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OExRSXhmenZtUms5SEpiekdUODRUREROM0NIL0EvTVBWbDV0YnBremhrZWNr?=
 =?utf-8?B?VmtSZWJldlhGbWI0M3hsc0lwUG4zV240L3BRdzJXTnVpS2dOVjloNE5NUVlx?=
 =?utf-8?B?SG9HVFRDTWgwVDI3RHFkZEVNTVpTWDZyOHplRmMvOXpXVWZLK2lmdVFzZGs4?=
 =?utf-8?B?ZDBSc1FUM1BiY1VPdWZhRVZ2cUFBdUx2L0pKNlVSMUQyOHdubkFIdWtKd01N?=
 =?utf-8?B?bGpJdG85ZFB3TDZ5WEhEc0ltVVdnckNXMTZkNGd4a25mZlFuSXRWVWJUR1Rt?=
 =?utf-8?B?bXpqWXRjRGtTTVlwcU5tWld4M1p4NzJaMzNlWjdEZlhiNjZjYjkrUXlwK2xT?=
 =?utf-8?B?MGJseVJ1di9zWTkrSWZCdkdYbVQxMVh6R1h0dHFnTHBPeFpLNGp3QjA3ek0y?=
 =?utf-8?B?aUVZT1JtVlExbmt6ekJ5d0pET05DWHo5eStPdzc5cExDTVp2TXZwMk5CMVE5?=
 =?utf-8?B?RmdodCtFeHpuazVYTXZrZWlUaEFWVFFKQjc3ODhEVk1yZVNqbFNBYWtsR0RL?=
 =?utf-8?B?Zy9PUUQ1azFFRk0rVXA5bW9QRnY5bXJ5RjV3N2hweERXdks4OUFoc2ZIL3gz?=
 =?utf-8?B?YTFwTGM3dmswbnFBWlp3aHR5VkNyTGMwTzJVbGkvMUY5K3g2bVBOTjdUaHl1?=
 =?utf-8?B?eThuUjlpSWJIWG5aRGJkaisxZ0xLODBlMDBIYlNVUDZkRjNSQ3p0eForbVZ5?=
 =?utf-8?B?SUxqbnpjVnZ5TVdHSkk4S1lnU0Z6b29TQkNuVGNpK1NETHQxMXU4azNxMjh5?=
 =?utf-8?B?ZGhwd2JrUGhodnVwdFpFTUkwVCtmMExIOHZ6MEdacU1EaTVYOFdtakJBV2Iv?=
 =?utf-8?B?bWxteS9nd2VZTVI4MEZyN2VLYlFNajNyVmRCQ3dDZ2dkcC9qQVMxbXJmak12?=
 =?utf-8?B?bDRSK244NDVURTFmK0JRakpJT3lIb1JneTAxbmxFQUNDZGh3MHNVRmtCank5?=
 =?utf-8?B?QjN2eEluUm5HY2s5dU5XQ0hwa0U2Q0FDVjg4dy9qc0ZzZlp0UUJKYXgrWnNL?=
 =?utf-8?B?ZVBTVGYrZ1BYUUhOQWpLWm93UktBcmd5MStOOFdYRFY0cjR0YW90Z0s4TTdM?=
 =?utf-8?B?OU45Y00vQmVvanVnUmhuSm84enNKSUhMeG5LSUdkbUc5OGFKWkZQTTB0QXRn?=
 =?utf-8?B?VnNzRlJjYkFaK0krSVBvMitIMk5PVFo1MU04QnN3TnY4VHpxUXluNWhqSDBU?=
 =?utf-8?B?cy8zdFZQQTlQampGTmV0TCtrZ1ltWUZBZUkyQ2tkSW5WQis1VXZGNDJaRGc3?=
 =?utf-8?B?ZnFyR2txd1dXalNqNDFLQzI4YjJieXJ5ZmVuTFFrbTJ3NGM3bUFpYWREZ3RJ?=
 =?utf-8?B?eTd1Uno4U0NoOEw2NW5yQit0Y1hROFcvcHhGS09kNldpZ0VoT1N5Y0cxVVVH?=
 =?utf-8?B?UU9MMGdTRjlXMlRadng2ODlRc3U0SENpS3Q0bnJ3QTZTV1pHZ0xzeStQSE1Q?=
 =?utf-8?B?N0czbC9FZndybGljTko4NUo3WGpFZktvTlRZeEtQWno0aHkrb3hrTXExWGV4?=
 =?utf-8?B?NUtvTnh5OXJkRkVBRk90S1lDTC96RFFDei92RWF3VUxXcWc2TVc2L1ZwL3B6?=
 =?utf-8?B?aFgwR2VvUDI4K3hsMmo4c2NyTlFJbnU1cDdKOUpDbFMwVUtkdTNWQmhrR2ZB?=
 =?utf-8?Q?zXKwDrWghnBg2h9P+9Lq+YQmkB3iGbEKZW/ow3LnF1cA=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3eea9f-f97b-4dec-37bf-08dbf17e7561
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 08:29:24.2850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR20MB4677
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_002931_234423_9B072FB7 
X-CRM114-Status: GOOD (  10.53  )
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

Pgo+SGkgR3VvIFJlbiwKPgo+T24gVGh1LCBOb3YgMjMsIDIwMjMgYXQgMDU6MTQ6MzBBTSArMDgw
MCwgR3VvIFJlbiB3cm90ZToKPj4gT24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgODoxN+KAr1BNIFl1
IENoaWVuIFBldGVyIExpbgo+PiA8cGV0ZXJsaW5AYW5kZXN0ZWNoLmNvbT4gd3JvdGU6Cj4+Pgo+
Pj4gRG9jdW1lbnQgdGhlIElTQSBzdHJpbmcgZm9yIFQtSGVhZCBwZXJmb3JtYW5jZSBtb25pdG9y
IGV4dGVuc2lvbgo+Pj4gd2hpY2ggcHJvdmlkZXMgY291bnRlciBvdmVyZmxvdyBpbnRlcnJ1cHQg
bWVjaGFuaXNtLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFl1IENoaWVuIFBldGVyIExpbiA8cGV0
ZXJsaW5AYW5kZXN0ZWNoLmNvbT4KPj4+IC0tLQo+Pj4gQ2hhbmdlcyB2MiAtPiB2MzoKPj4+ICAg
LSBOZXcgcGF0Y2gKPj4+IENoYW5nZXMgdjMgLT4gdjQ6Cj4+PiAgIC0gTm8gY2hhbmdlCj4+PiAt
LS0KPj4+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9u
cy55YW1sIHwgNiArKysrKysKPj4+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4+
Pgo+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNj
di9leHRlbnNpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvcmlz
Y3YvZXh0ZW5zaW9ucy55YW1sCj4+PiBpbmRleCBjOTFhYjBlNDY2NDguLjY5NGVmYWVhOGZjZSAx
MDA2NDQKPj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9l
eHRlbnNpb25zLnlhbWwKPj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPj4+IEBAIC0yNTgsNSArMjU4LDExIEBAIHByb3BlcnRp
ZXM6Cj4+PiAgICAgICAgICAgICAgaW4gY29tbWl0IDJlNTIzNiAoIlp0c28gaXMgbm93IHJhdGlm
aWVkLiIpIG9mIHRoZQo+Pj4gICAgICAgICAgICAgIHJpc2N2LWlzYS1tYW51YWwuCj4+Pgo+Pj4g
KyAgICAgICAgLSBjb25zdDogeHRoZWFkcG11Cj4+PiArICAgICAgICAgIGRlc2NyaXB0aW9uOgo+
Pj4gKyAgICAgICAgICAgIFRoZSBULUhlYWQgcGVyZm9ybWFuY2UgbW9uaXRvciBleHRlbnNpb24g
Zm9yIGNvdW50ZXIgb3ZlcmZsb3cuIEZvciBtb3JlCj4+PiArICAgICAgICAgICAgZGV0YWlscywg
c2VlIHRoZSBjaGFwdGVyIDEyIGluIHRoZSBYdWFudGllIEM5MDYgdXNlciBtYW51YWwuCj4+PiAr
ICAgICAgICAgICAgaHR0cHM6Ly9naXRodWIuY29tL1QtaGVhZC1TZW1pL29wZW5jOTA2L3RyZWUv
bWFpbi9kb2MKPj4+ICsKPj4+ICBhZGRpdGlvbmFsUHJvcGVydGllczogdHJ1ZQo+Pj4gIC4uLgo+
Pj4gLS0KPj4+IDIuMzQuMQo+Pj4KPj4gUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJu
ZWwub3JnPgo+Cj5UaGFua3MgZm9yIHRoZSByZXZpZXcuCj5Xb3VsZCB5b3Ugc2hhcmUgZG9jdW1l
bnQgYWJvdXQgVC1IZWFkIFBNVT8KPgoKSGksIFBldGVyIExpbjoKCllvdSBjYW4gdXNlIHRoZSBm
b2xsb3dpbmcgdHdvIGRvY3VtZW50IHRvIGdldCBhbGwgZXZlbnRzOgpodHRwczovL2dpdGh1Yi5j
b20vVC1oZWFkLVNlbWkvb3BlbmM5MDYvdHJlZS9tYWluL2RvYwpodHRwczovL2dpdGh1Yi5jb20v
VC1oZWFkLVNlbWkvb3BlbmM5MTAvdHJlZS9tYWluL2RvYwoKVGhlcmUgYXJlIGFsc28gc29tZSBS
VEwgY29kZSBjYW4gZGVzY3JpYmUgdGhlc2UgZXZlbnRzOgpodHRwczovL2dpdGh1Yi5jb20vVC1o
ZWFkLVNlbWkvb3BlbmM5MTAvYmxvYi9lMGM0YWQ4ZWM3ZjhjNzBmNjQ5ZDgyNmViZDZjOTQ5MDg2
NDUzMjcyL0M5MTBfUlRMX0ZBQ1RPUlkvZ2VuX3J0bC9wbXUvcnRsL2N0X2hwY3BfdG9wLnYjTDEx
MjMKaHR0cHM6Ly9naXRodWIuY29tL1QtaGVhZC1TZW1pL29wZW5jOTA2L2Jsb2IvYWY1NjE0ZDcy
ZGU3ZTVhNGI4NjA5YzQyN2QyZTIwYWYxZGViMjFjNC9DOTA2X1JUTF9GQUNUT1JZL2dlbl9ydGwv
cG11L3J0bC9hcV9ocGNwX3RvcC52I0w1NDMKClRoZSBwZXJmIGV2ZW50cyBqc29uIGNhbiBhbHNv
IGJlIHVzZWQgYXMgZG9jdW1lbnQsIHRoaXMgaXMgYWxyZWFkeQphcHBsaWVkICh3aXRoIG1vcmUg
ZGV0YWlsZWQgZXhwbGFuYXRpb24pOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvSUExUFIy
ME1CNDk1MzI1RkNGNjAzQkFBODQxRTI5MjgxQkJCQUFASUExUFIyME1CNDk1My5uYW1wcmQyMC5w
cm9kLm91dGxvb2suY29tLwoKQmVzdCByZWdhcmRzLApJbm9jaGkKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
