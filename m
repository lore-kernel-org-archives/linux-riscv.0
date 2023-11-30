Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F07C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 23:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yFWFD5sOy9p1uXWHMNnweYkwZHpFEYj1EieBbsOagxc=; b=3Mp3bIok098cky
	LJy5rO/0KnVKWZgoaFWpBIlamHoKgcH2DFCMwoPKGwkJOswZVKP71//ClUuc4cC/SyuRe8IRS2Vaa
	IBNOg6fCcD1yGmBTPdrnEdGhEJe23g0abKN1E9McNTucPyKxwjHXzpYHNka3xYcbwBLFRYmX/9B+8
	/m2J4ki8rKSdaCG7e+FILBVd6z5+BVtcgy0J1Kct5At/7P+7/ZTHCSaIz+4a8nu2c5Ml/SQfVKTqK
	c0Y/zVBHveWuwbILWiXUTbjXl02LYAqtnVg24coUSGfetoNZin1QYtPUt24shDMKTwGzq0zlj9dbF
	dZ4B0VqaNWZrEhhnUSHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8qCE-00C8Mn-1m;
	Thu, 30 Nov 2023 23:11:50 +0000
Received: from mail-bn8nam12olkn20824.outbound.protection.outlook.com ([2a01:111:f400:fe5b::824] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8qCC-00C8Lm-1B;
	Thu, 30 Nov 2023 23:11:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDWDdYvSCRgicLmSfsRGH9+d2hzz6qpVphF8tx4vJOswfzJS/9CuoA/MmdN9jO7q31AwdmNSxVI5QmbtVOR9lvM6m4QZngJcUzXQQz6Ceak5QUCwPXEijasNniqjsg+jsxIM5bII9+4AGSNEo0XRvDhTzJT+imYxK9KwvyQWGlunW65ytHUxoogdOQdQfs2upXcS1CINlmIcLAShvTK+EUn9/fuLOfGPH0ScE00ee+HrmIyx+sbpd6JY3yO9UEBaj60TOuTpLKGXnSAT/2XSQpPgmTMQ93KBfjm9IxOz9kU/H6ho8sk6YSNEXUB1CKNATONJQQGGuDDpacDxAbCLNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8BHqhZn4539bNCaSZPXRguwoIBBdI81N4SjxUZcP7Q=;
 b=RtD6N6ZL9dtgVhqWkKepLudubHDE+UKy3XmwFzMYrfloTdZVJHvr2oR101kIjVd1nzzBPhkS9Ani6XSy9GVELlzoEIekGj9pnb8+oeKAEQ/lWQ28fwptxJObPICxjI91K6tGSov0NNVRjV76z5qmCN8tptCVVhTiuZyyxx/UBWyHzEiZRWXuhHTRC+hZYuFDCXP75w5WYk7dOGT0WVYtQog8YdqvaYn+64FF7kkxr2JJIsZ5/k+j4vIplOT6N2mt5iw5m2jXyEE8GreggxbCFFUwTPlToT6W+kDhkjYOR4kaWhf1tkl7adb/QRoCGir8mDZXMgu+pWLe/y4G4WBqEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8BHqhZn4539bNCaSZPXRguwoIBBdI81N4SjxUZcP7Q=;
 b=X9z/nyoiPYsGVOFEhb5X9udEei8ZOdV2QqQj5W0yFBZ9gWjuC51WyNhK1Sb3auKG4XHR3KqgMdLky5cg7+IaRTdz43piMCCaTsfN/jUkMzt3sGnjiq2jkba84+ywE6pD5mx/drqc51SUgF43upTtxVZSAkgFn/ci2z+LaopgYcNymtFvTO11HbnA+5nW0yhtD39TudHTDAWowRoD49ZOffPaaXyrmKLeA0SuBSeMDpqPSV4Q8z0IP9g2aU76G3vNfmx+Y5Rv0w+CNoIDrUXj0ZIk1jFMYIbVD44RRyx02B1yjQWwE4ccn0S2b6Sz9k5jflccz49Qtl9c+GQdcA6M1Q==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DM4PR20MB4579.namprd20.prod.outlook.com (2603:10b6:8:5e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.24; Thu, 30 Nov 2023 23:11:42 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8%6]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 23:11:42 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v4 09/13] dt-bindings: riscv: Add T-Head PMU extension description
Date: Fri,  1 Dec 2023 07:11:31 +0800
Message-ID: <IA1PR20MB495378652B09B37E92D8BB04BB82A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231130-isotope-runaround-9afb98579734@spud>
References: <20231130-isotope-runaround-9afb98579734@spud>
X-TMN: [ncJoUExl3SuevRzpqks02K/yP4DXvlwShqlGCXmGcak=]
X-ClientProxiedBy: TY2PR0101CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::16) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231130231132.9090-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DM4PR20MB4579:EE_
X-MS-Office365-Filtering-Correlation-Id: a06f4373-8804-4e35-0e7e-08dbf1f9b675
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lruw79LHkd+PYq272i8fkuGmuCThsHqF9UnT3vHV64in58VLYZSC0M9oCgM42UVP/+7PaerSiBGY3V9qSXdWZW22rr1U86D8qpKtXo5f440NrqbTVHN6BH9X+qnfSJnGRuBP4l5emS2Roh289veP/sRh3nG+a20o85uuUHVdJZKc+YxO6MZUXe06zHsK63tPSWxGYh4TR2dPx1scI5dX42l+TYnb0lg+aRkwq77EMJ2Ui6sUYTYQVg1t3YXgiIrhck9gMQ1pNkLgOmd80yBtUalJkrhNaZQsQKVk0/tJ2v+uk4rLFWQBGkcdb3p/HJT2zjuzXFxkswmw9fC5olBEc3THtxvFWOBtzAMe2iLj594Zp1zM4ib0jdwJTyGct4MNIY/j6QMfj5LJCkdtf866ZKHs0DrFpu2JS1bibg38G8x2X+OgLrYyvDzmz7rPMwWFYC+mlk33MruGmTuGInsdYn4eEjBkk7Ol1m1rzAKW+13KdME/gcvB84YYLp2SeGSelXlg/K8LwA2NlxRnS411RFS9RJ8uctUcEZSCpaMXPVLAT/Hl/Sw+ztRGXNXCsB+YE/OWM0TF4e+qpQfYj+hFdF2wpB/BDkmJu5ITh807iLFPyOpPBhD+y2zx4Ek261TcyyWbHEL8ZAOXqTGr9o5ezV6gc/nax/rmY+PR0QugLo8=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmgwUHhIeEZjSFp2MTVJSndrbjc0WTMvUjAzU3Ivck56ZXNRYXRBYU1EanM5?=
 =?utf-8?B?UFE2REpnZ2N0OVFUcVdJSms1ZzB4UlozQmt1Qk9Cb21GcHM0bTRzaHpzR3VD?=
 =?utf-8?B?L3VPZ05JSXJwWEZKdDJCaWgvSVFoTGROTGNGZ0liWmd4VmpHdDFmTGhKMXM1?=
 =?utf-8?B?L2RaaTgzc0lMUHc2aHVzUUN2aHhTU2JacjA5UmhvZnNiMiszZS9ZdmVKVlA1?=
 =?utf-8?B?T1FPbkQ3eHRpNWJ5SEdoTmNJVmZweEw2dG52ZVhGYUx1bHVkWjNCcmVvV2xI?=
 =?utf-8?B?SWVDeldRMWVleDZJQWhtb0FFY2RURDIvb1lHbklnK2txUjRabkZKUW8zNkpT?=
 =?utf-8?B?VWY1TkQvMFliMnRxcEJ1Tk1sU3JRK0pKeUI0a3Jmb2R0T3pZYWxjTldGTWxS?=
 =?utf-8?B?cW9ydWtRSlhLNS9mWTdTbStGNWg0MFVRNTdSd3ZaMDkwWTRqVXg3NGFGM3Zx?=
 =?utf-8?B?dHNnZkRLbTA2eVZRSVFweWZCUHVHMmVRRGtKRWVXaUxjMnhTNTFVOUpWU0xz?=
 =?utf-8?B?YW51M3BwbXJrYzhoMHpTT2lIeEVOdlNoWnlCOXd1bk1wQTgxbmlIQ3Q0cGVJ?=
 =?utf-8?B?RTNBdnAzaDYxVEpBcTA4a0F0S3Q4Wmxzb0FoNHROc1pIcy9lZEE2Y1YxQSsw?=
 =?utf-8?B?ZU90K2NOSzhINGdvUFRCV0VmTlRIa0tLbWJDYjRzek9KbUtJVHd5S29VYkFJ?=
 =?utf-8?B?RHlKendPWmV0UXBnejEwdWZsMWd4djVSaTd6ZSt4ZnFiQ0VpaTRucmd1cll0?=
 =?utf-8?B?TmF4bUhVeDh4eERyTXpMd0R3cndlY1ZrTklvNmVGbDJpcWo3b0orcXF5VEhW?=
 =?utf-8?B?RFpYN0hJV0lTTWJETngyalpGRXJoRFVWdW5SNk4zS1NON3V1aHo3cVdHWlY0?=
 =?utf-8?B?NUlhUmpzUXJnYkZBWlhxc05BL3ZaeDdnVU9NZVMzaFNZQy9xaXhabHJoRlZz?=
 =?utf-8?B?aUhlWnE1TEhCYWx5elFwWXFxUFljMnRMK3l4enM2ZlBjd2t5Y0o1WHZsT0Zr?=
 =?utf-8?B?S1B4UVZKb20za0lGWG9QemhUdjFKOGNlTDZGTWRFa0dmRmRGZlZYNUZKVVI4?=
 =?utf-8?B?ZURIOVJHdklFdUxhckNnOUxZUzVWYll0R3poa0JPT0JnOS90OWtyVmFqWU5P?=
 =?utf-8?B?RE0zL3JmYXVrYmxGV0lTQTkrU3ZrM3hmOUxMUnBuS1UzbS8zYnBieE45WEYr?=
 =?utf-8?B?TXdCU0NlM1dIWXl0RVcxeGYyMnhxaFhaWGdLVkdaVEQ1d1o1NFNoY2RzNGV5?=
 =?utf-8?B?a2FWUUdLb3F1VUpaYUVxTE93aENKQW5sNEl5WmFCYk5ZSGtRQnJPYW9YREY1?=
 =?utf-8?B?Qk9lQ0JxRHBoQTdWQUpyNFphRlZRTnpXZWN5K0NSZ05GQmRsUFVCTWxCb2Z4?=
 =?utf-8?B?amQ3TzVPYk0xblVTWnZxdllMeU9jbmU1REM2RFdaaFU3ckFmVFJqUUQxNWxL?=
 =?utf-8?B?ZExuZURKTWJ5L0ppMUZCWEdDcDB2Vmx3T0hyWnJMZDQzR0VuNzR4U01aWkx5?=
 =?utf-8?B?WXdYb0wzRm1QeVM0cWplMG9uZzRqTGE2OHc1WThJcjNPYUZpSytiV0t5Z3JJ?=
 =?utf-8?B?NUx0STBYbDFUMUdoTEcrcmY5ZmNBUGxYb0gwUHFPN0ZYVWxKSmlHZHp2VVhr?=
 =?utf-8?Q?GJj7RzLiRVQ/RbX4hRnOqJQZdnkTedKcKs6RQN/bokyg=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a06f4373-8804-4e35-0e7e-08dbf1f9b675
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 23:11:41.7481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR20MB4579
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_151148_564680_7A8269A0 
X-CRM114-Status: GOOD (  14.07  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, Guo Ren <guoren@kernel.org>, jszhang@kernel.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, Yu-Chien Peter Lin <peterlin@andestech.com>, krzysztof.kozlowski+dt@linaro.org, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, palmer@dabbelt.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, evan@rivosinc.com, Inochi Amaoto <inochiama@outlook.com>, jolsa@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Pgo+T24gVGh1LCBOb3YgMzAsIDIwMjMgYXQgMDg6MTY6MzhQTSArMDgwMCwgSW5vY2hpIEFtYW90
byB3cm90ZToKPj4+Cj4+PiBIaSBJbm9jaGksCj4+Pgo+Pj4gT24gVGh1LCBOb3YgMzAsIDIwMjMg
YXQgMDQ6Mjk6MjJQTSArMDgwMCwgSW5vY2hpIEFtYW90byB3cm90ZToKPj4+Pj4KPj4+Pj4gSGkg
R3VvIFJlbiwKPj4+Pj4KPj4+Pj4gT24gVGh1LCBOb3YgMjMsIDIwMjMgYXQgMDU6MTQ6MzBBTSAr
MDgwMCwgR3VvIFJlbiB3cm90ZToKPj4+Pj4+IE9uIFdlZCwgTm92IDIyLCAyMDIzIGF0IDg6MTfi
gK9QTSBZdSBDaGllbiBQZXRlciBMaW4KPj4+Pj4+IDxwZXRlcmxpbkBhbmRlc3RlY2guY29tPiB3
cm90ZToKPj4+Pj4+Pgo+Pj4+Pj4+IERvY3VtZW50IHRoZSBJU0Egc3RyaW5nIGZvciBULUhlYWQg
cGVyZm9ybWFuY2UgbW9uaXRvciBleHRlbnNpb24KPj4+Pj4+PiB3aGljaCBwcm92aWRlcyBjb3Vu
dGVyIG92ZXJmbG93IGludGVycnVwdCBtZWNoYW5pc20uCj4+Pj4+Pj4KPj4+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBZdSBDaGllbiBQZXRlciBMaW4gPHBldGVybGluQGFuZGVzdGVjaC5jb20+Cj4+Pj4+
Pj4gLS0tCj4+Pj4+Pj4gQ2hhbmdlcyB2MiAtPiB2MzoKPj4+Pj4+PiAgIC0gTmV3IHBhdGNoCj4+
Pj4+Pj4gQ2hhbmdlcyB2MyAtPiB2NDoKPj4+Pj4+PiAgIC0gTm8gY2hhbmdlCj4+Pj4+Pj4gLS0t
Cj4+Pj4+Pj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNp
b25zLnlhbWwgfCA2ICsrKysrKwo+Pj4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspCj4+Pj4+Pj4KPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPj4+Pj4+PiBpbmRleCBjOTFhYjBlNDY2
NDguLjY5NGVmYWVhOGZjZSAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4+Pj4+Pj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+Pj4+Pj4+
IEBAIC0yNTgsNSArMjU4LDExIEBAIHByb3BlcnRpZXM6Cj4+Pj4+Pj4gICAgICAgICAgICAgIGlu
IGNvbW1pdCAyZTUyMzYgKCJadHNvIGlzIG5vdyByYXRpZmllZC4iKSBvZiB0aGUKPj4+Pj4+PiAg
ICAgICAgICAgICAgcmlzY3YtaXNhLW1hbnVhbC4KPj4+Pj4+Pgo+Pj4+Pj4+ICsgICAgICAgIC0g
Y29uc3Q6IHh0aGVhZHBtdQo+Pj4+Pj4+ICsgICAgICAgICAgZGVzY3JpcHRpb246Cj4+Pj4+Pj4g
KyAgICAgICAgICAgIFRoZSBULUhlYWQgcGVyZm9ybWFuY2UgbW9uaXRvciBleHRlbnNpb24gZm9y
IGNvdW50ZXIgb3ZlcmZsb3cuIEZvciBtb3JlCj4+Pj4+Pj4gKyAgICAgICAgICAgIGRldGFpbHMs
IHNlZSB0aGUgY2hhcHRlciAxMiBpbiB0aGUgWHVhbnRpZSBDOTA2IHVzZXIgbWFudWFsLgo+Pj4+
Pj4+ICsgICAgICAgICAgICBodHRwczovL2dpdGh1Yi5jb20vVC1oZWFkLVNlbWkvb3BlbmM5MDYv
dHJlZS9tYWluL2RvYwo+Pj4+Pj4+ICsKPj4+Pj4+PiAgYWRkaXRpb25hbFByb3BlcnRpZXM6IHRy
dWUKPj4+Pj4+PiAgLi4uCj4+Pj4+Pj4gLS0KPj4+Pj4+PiAyLjM0LjEKPj4+Pj4+Pgo+Pj4+Pj4g
UmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+Pj4+Pgo+Pj4+PiBUaGFu
a3MgZm9yIHRoZSByZXZpZXcuCj4+Pj4+IFdvdWxkIHlvdSBzaGFyZSBkb2N1bWVudCBhYm91dCBU
LUhlYWQgUE1VPwo+Pj4+Pgo+Pj4+Cj4+Pj4gSGksIFBldGVyIExpbjoKPj4+Pgo+Pj4+IFlvdSBj
YW4gdXNlIHRoZSBmb2xsb3dpbmcgdHdvIGRvY3VtZW50IHRvIGdldCBhbGwgZXZlbnRzOgo+Pj4+
IGh0dHBzOi8vZ2l0aHViLmNvbS9ULWhlYWQtU2VtaS9vcGVuYzkwNi90cmVlL21haW4vZG9jCj4+
Pj4gaHR0cHM6Ly9naXRodWIuY29tL1QtaGVhZC1TZW1pL29wZW5jOTEwL3RyZWUvbWFpbi9kb2MK
Pj4+Pgo+Pj4+IFRoZXJlIGFyZSBhbHNvIHNvbWUgUlRMIGNvZGUgY2FuIGRlc2NyaWJlIHRoZXNl
IGV2ZW50czoKPj4+PiBodHRwczovL2dpdGh1Yi5jb20vVC1oZWFkLVNlbWkvb3BlbmM5MTAvYmxv
Yi9lMGM0YWQ4ZWM3ZjhjNzBmNjQ5ZDgyNmViZDZjOTQ5MDg2NDUzMjcyL0M5MTBfUlRMX0ZBQ1RP
UlkvZ2VuX3J0bC9wbXUvcnRsL2N0X2hwY3BfdG9wLnYjTDExMjMKPj4+PiBodHRwczovL2dpdGh1
Yi5jb20vVC1oZWFkLVNlbWkvb3BlbmM5MDYvYmxvYi9hZjU2MTRkNzJkZTdlNWE0Yjg2MDljNDI3
ZDJlMjBhZjFkZWIyMWM0L0M5MDZfUlRMX0ZBQ1RPUlkvZ2VuX3J0bC9wbXUvcnRsL2FxX2hwY3Bf
dG9wLnYjTDU0Mwo+Pj4+Cj4+Pj4gVGhlIHBlcmYgZXZlbnRzIGpzb24gY2FuIGFsc28gYmUgdXNl
ZCBhcyBkb2N1bWVudCwgdGhpcyBpcyBhbHJlYWR5Cj4+Pj4gYXBwbGllZCAod2l0aCBtb3JlIGRl
dGFpbGVkIGV4cGxhbmF0aW9uKToKPj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvSUEx
UFIyME1CNDk1MzI1RkNGNjAzQkFBODQxRTI5MjgxQkJCQUFASUExUFIyME1CNDk1My5uYW1wcmQy
MC5wcm9kLm91dGxvb2suY29tLwo+Pj4KPj4+IFRoYW5rcyBmb3IgcmVhY2hpbmcgb3V0IQo+Pj4g
VGhlIHVwZGF0ZWQgZGVzY3JpcHRpb24gd2lsbCBiZToKPj4+Cj4+PiAtIGNvbnN0OiB4dGhlYWRw
bXUKPj4+ICBkZXNjcmlwdGlvbjoKPj4+ICAgIFRoZSBULUhlYWQgcGVyZm9ybWFuY2UgbW9uaXRv
ciBleHRlbnNpb24gZm9yIGNvdW50ZXIgb3ZlcmZsb3csIGFzIHJhdGlmaWVkCj4+PiAgICBpbiBj
b21taXQgYmQ5MjA2ICgiSW5pdGlhbCBjb21taXQiKSBvZiBYdWFudGllIEM5MDYgdXNlciBtYW51
YWwuCj4+PiAgICBodHRwczovL2dpdGh1Yi5jb20vVC1oZWFkLVNlbWkvb3BlbmM5MDYvdHJlZS9t
YWluL2RvYwo+Pj4KPj4+IElzIGl0IE9LIHdpdGggeW91Pwo+Pj4KPj4KPj4gSSBzdWdnZXN0IHVz
aW5nIHBlcmYgZXZlbnQganNvbiBhcyBldmVudCBkZXNjcmlwdGlvbi4gVGhlIGpzb25zIHByb3Zp
ZGUKPj4gbW9yZSBkZXRhaWxlZCBleHBsYW5hdGlvbiBmb3IgdGhlc2UgZXZlbnRzIHRoYW4gdGhl
IHVzZXIgbWFudWFsLgo+Cj5Eb2VzIHRoZSAicGVyZiBldmVudCBqc29uIiBkZXNjcmliZSB0aGUg
cmVnaXN0ZXJzIGFuZCBpbnRlcnJ1cHQgYmVoYXZpb3VyPwo+CgpJdCBkb2VzIG5vdC4gSUlSQywg
dGhlIGxpbnV4IGp1c3QgdXNlcyBTQkkgYXMgcGVyZiBkcml2ZXIgYmFja2VuZC4gU28KdGhlIHJl
Z2lzdGVycyBhbmQgaW50ZXJydXB0IGJlaGF2aW91ciBpcyBwcmltYXJpbHkgZm9yIFNCSSBkZXZl
bG9wZXIuCgpGb3IgcmVnaXN0ZXJzIGFuZCBpbnRlcnJ1cCBkZXRhaWwsIGp1c3QgcmVmZXJlbmNl
IHRoZSBvcGVuYzkxMCBkb2MgdXJsCihodHRwczovL2dpdGh1Yi5jb20vVC1oZWFkLVNlbWkvb3Bl
bmM5MTAvdHJlZS9tYWluL2RvYykgYW5kIHRoZSBULUhFQUQKUE1VIGRyaXZlciBpbiBPcGVuU0JJ
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
