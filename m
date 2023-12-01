Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EBAC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 01:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X0V5r4HJheFSrqSYK9Aczr7K3F0IHIfQ59VbxihJUMQ=; b=VhMD3V57Wc0eUT
	iqSGlB1l3hDJe8X9wu88PCNL71PZNSfI94tmj538BTor40lJDRALNrT6yv6Ql+eQ+qn26mL6SYcgT
	Djpre+XTpi3XBYGudOjC1z2Wdtycm/6bXAzd+b9aZyA4/mm/GaIpXjJiCIC9nfEM8QLn2Z1/T1e04
	gB7l32nzNoqmD2bK00bylOruMtHp77DifRj/Xv+dT1ErlvrkiDlOP8+Ep+4ket1EXEJCHBP6Vf8B1
	QmIS03p352VJb0mnKazB5paZLB+g7ExR6zYVNUt4L91Pl6rnWbB+ZXaLoYnlnjdtRcfUERUgi5RdS
	2iX+FwjWU1qOtl3ONVfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8s6c-00CKLF-19;
	Fri, 01 Dec 2023 01:14:10 +0000
Received: from mail-bn8nam12olkn20818.outbound.protection.outlook.com ([2a01:111:f400:fe5b::818] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8s6Y-00CKKO-0Q;
	Fri, 01 Dec 2023 01:14:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPgp6dFhVN3QEGk5RehRNQukzAW42xn0ctVIgnI96pwREQZKv0F0tCu9h0aBmN16Vwj1VBwivd/JSq9nPDJI07dTboH/E59QlPmVvvsSDLHJfL4bZLKv8pTqzkTnJjK4OEUZDn2YMNazpnIMJnr0i511Eu2jyla6AQCaF1LGmc4jgT1GhH9ErsUaIwh4gfHuvrCvsjUySSjM2Wa/1YAKCcEvEshRTbxq21SCoiUhVEhQcA/B0IC1F3kJI96J8kLaoItRS4SgW6JW/39YtN34tVqZG5n1VY5z9aco4siUEmEyr7SrssOdduofUw9ac/7f6VTARg2PAON3LDuFNTDv2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yo83G1rRJRvcbUMQfZ8EBJAAeEhMUZNNNMzOYViTmT8=;
 b=m+ietNhwn+emCwOZrbb9da8fGtGsKeCn3+0yquW4Tq8rAHZH2z0vGoTaogL7aproHGekRqbck8pG5cjsvwHplkcaMXO2pxzVn3mrPSje1CkWliiGrxiPp421Nh8lBmE2MaJCdcU1FKSScheMpisp3q2l/NXKR99D33T0mboxnxTaAPKxxQ9g15MjX5stEq/nCRNVPP6ylRZO/HtZXtLJKqSX8gPTJOGdzRoGNA5mvdsJWi6gFBEE3UW5gkhbZJlo3WC1N+hQp7MxcrwvYwDuu062DHMVTBt3iXekk31kh/O4gcWyCf1AwMkiEGbmJwAngyZn2PSYfP6zlWUQ4l5arA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yo83G1rRJRvcbUMQfZ8EBJAAeEhMUZNNNMzOYViTmT8=;
 b=rKBhE64A9SAtbr3P9Q1NtIqIffLbxFKqi3hP+SpN5HOpZWLMKzmSBmzLcbZw6whw9yuFpg4HKHJBpXtrO61k2jzPFomTpERsp0QkJyJFUtlg7MNH8bhMfTcm4rkgG1luME/2ZhXuT/wR0kTlFM0ktkBr5EPS2P1kOhkTLGfqjt0mSaFKM2eG2Kd69hFodD8tXP9fPx5JEZy9O96N6hcjolk7SoL9RB32MMqEFgfWrqVEZnSkVhjtlzLp9nKZDJw3fkTgczuX7DdR4zvW1iLumn4oQnzH2BGemSu+BS/Ttiyba7kmX5QKsW8mF7SgozfmM42Tw7qkWZCLtU+Wv9VstA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by MW4PR20MB5373.namprd20.prod.outlook.com (2603:10b6:303:221::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Fri, 1 Dec
 2023 01:13:59 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8%6]) with mapi id 15.20.7046.024; Fri, 1 Dec 2023
 01:13:59 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Yu-Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [PATCH v4 09/13] dt-bindings: riscv: Add T-Head PMU extension description
Date: Fri,  1 Dec 2023 09:14:00 +0800
Message-ID: <IA1PR20MB4953460FE5BF431DD32CD860BB81A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ZWhT_VSpl2aksVK7@APC323>
References: <ZWhT_VSpl2aksVK7@APC323>
X-TMN: [O6RBKd2btNqpAk3NbgN/5ICNp+Wi114JSt2L4aapwvA=]
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231201011401.103057-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|MW4PR20MB5373:EE_
X-MS-Office365-Filtering-Correlation-Id: 70909365-d44e-4e2b-ed30-08dbf20acc2c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9gRh0N4KrEWKBS0O/+90zqEpMudlwnyFvBD0FH4+K56Bav0hsxXOtcwz7KO9mPg1SKrd0kSZFJ1OThf7su+HvD2xIJkntq9OvJFPM4U4/jWe5ArVzzm2iuh27HQ16M3sfp2oeSRV5ZTsKNZVzGEDymWlZlI27sKvJOWohSovfi531m5O3tdOP0VefHR9YPzhtc9w09tKXymPTf7ylW8Cxke8aJiQKU42mrtGBvPiedAoN2cabajsucOkztjTRfsUhfLNZUZQvdKt26WAaSv8oeN45whIJ7y0GAYRFh6NdsMdRkupaZW1e9kSPXQspFTHkvyCq91/t++7Zq2wXzScLw1oLO9KtmYCa/JGDiEDeq+FH+A2xd93k7+2JSXPM7l9XObOjB47moI9nrQM0mqX4AiSi652QggQnT6NLcPu8/e5qcEtaTS1hkaIJoZ8+zXzpQXvTmC5aOKM6ev+fAVOb8eI/Uig431ZxJXaTsgCSehgpkKAXolEUszLFe/xjEMwROlrTRCnY3PpvbB7CDwYD6hGgJtj6SqyQJrIrQk+sd6qIqqQuax62BLLGmFeeA3CEnW33r301SoTzicNYWWOPrhYd1R+Ed0al03uEVsWe9n65kI1wN+WpvzMhpq5VMTJOGFpLClWBG7NNkOpXf6YTlOdyYmsu9C8iLwA/lEs/B4=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnZkU3VMRjdXVVJTMExVSWVJWTRYOFFUcVp1d0VzbjdMQTdXN3VpNFduYmJ1?=
 =?utf-8?B?M1ZaN2MvSGtuM3dHS0RRZGhRWVpXbG90SXAvcW5WR1pPTjdyTnV1eklXZXVo?=
 =?utf-8?B?UGMxemV1Y2laWVh4eVlZSnZEbnpIT1l5d2tVY3lZRFh0Sk9aVWtSZm1QQTVJ?=
 =?utf-8?B?OGNSRldCdkNLWlBiNCsvbDVEd1R4Qy9sNUg5Qm5wQ20xY3RuV2ZsMjljSXNR?=
 =?utf-8?B?TGtYeG1pME0xMDgvUGc5cGxlZzZHVERvanZ4T1JQUzRNWFFudUl2T0hCMlNP?=
 =?utf-8?B?bmczclcvRnFZQ3NTSjZrUXp5UHZaYnNKLzJSRFd0cHFmcUlYQUY3VmN6WnYw?=
 =?utf-8?B?V0txTG9IK0Q0TU5hK1ZKbldndFVaOHVWR2pLQVpacFByOFZJZWJpbTFHa25Y?=
 =?utf-8?B?SnJlZ3Y3QkJvejlWSmhzWWxhSlVtc0tvMW9qRDdOcHFLRFdnNUI5akkydEtR?=
 =?utf-8?B?YnBTYUM0S2c5dkdRZ2tNcEE5NmpWRkVRaW9vOUUrMys3SzJENlcxK1pIWnhz?=
 =?utf-8?B?UTBmazRpSHNmaEZZT3dDUGpMSWhhTUdoR01RUWJwZGI2b09LT3Z6bU1DRm1I?=
 =?utf-8?B?NXFWV2E4S0xUeGJNSVNDM1lYdHovcUdSMXdUZ3ZrVDcwT1VNaFh3VWJrOXN2?=
 =?utf-8?B?cXE4S2JFdERpNzZoUlVabW5OdktOZGMydFJ6a2dFWm5rOVN6K2xVZ1IvVUp3?=
 =?utf-8?B?dWhGNlNpUXJ3WmE5RnRJZE1TU2pPTjNDMFJSR251S1EvbG9HbkxyMld4b3NG?=
 =?utf-8?B?akd0eEpGK29xdWZ0UitUUXc1Nk9uelUyaXJyU2x2Tzh3SElQTGdJRDJ6SFA4?=
 =?utf-8?B?SEJCWDNRQmVKMU1GbURIVlFyTFNNczlUSjNXOWp3WHc0aWs2QXN4bGVNcVpj?=
 =?utf-8?B?RUZpZWRJbENPd3ltWE51d3hMei96d3pud0N2YTRhUSt5YUN0TC83ZUpnc0sv?=
 =?utf-8?B?WHNHSjdiNWU4K2N2VTNUS3RSWUd0RFJDTmtUM2ZJam04elBCU0pEY0lBMWFv?=
 =?utf-8?B?L3ZDd3hKbmt0MzBXSjZ0bDZ6V1ZnYU90SkNhV0FmK3JxUkNtZFg4bDZhVEcw?=
 =?utf-8?B?S0R0MnhtcXltdmF0eGJOb1JWeEpuaktOYzVudWVwQnZjRlhqTm9LUG4vcnYy?=
 =?utf-8?B?VDNGY0tUa2N0S2p5M3BXOGtDQUFzNFBGdUlEYVF1TDlTaVNRRWxPN2FabDVK?=
 =?utf-8?B?cnJjM2wxOWFuakJYUTltTDdWS3J2WitHUGlZT1NpM2kvNmdvOGVrVFhWTkZX?=
 =?utf-8?B?ZXRBL3VWcS92bFZIQWJqcFZIVWRKNzVDeFgzelVRL2luelZJbEx2VjJIRFRv?=
 =?utf-8?B?a0xvcGo2SnRsYTBKdjF5aDVDcElwcFN0YkNCbDBVMDVLSEJJcnB3NlViK0h2?=
 =?utf-8?B?NE9oeEY1dlZ5azJsV3lKQzM1ZnZZcGRQMktrSTk3dEdoS1RKMGpmcUREVEpa?=
 =?utf-8?B?NUpVeHVWc2dsL0h1WjRHa1U3SWZoYUlNS2lRdXlOUkllb0U3a3ZWS3F5WFEy?=
 =?utf-8?B?cDFoQlRwZkpmYjRvQ2Z3VHpqZVN0dFpFTkZHcjBLR1ZQaGRPMzdGR3c4ZGRm?=
 =?utf-8?B?c2pycnVuUUNCaTdWZW1tY2RTNWVic3d2aHVrSXpzYUx0SHRvR0VZU2FqM1FT?=
 =?utf-8?Q?PmhspTENY+DTMniPQiv4WrlVP3wjYLuZ3U6UGLcpqDUc=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70909365-d44e-4e2b-ed30-08dbf20acc2c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 01:13:59.4470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR20MB5373
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_171406_303914_F540181B 
X-CRM114-Status: GOOD (  12.87  )
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
b3BlbmM5MDYvdHJlZS9tYWluL2RvYwo+Cj5JcyBpdCBPSyB3aXRoIHlvdT8KPgoKUGxlYXNlIGlu
ZGljYXRlIGNoYXB0ZXIgMTIgYW5kIGNoYXB0ZXIgMTMuNSBvZiB0aGUgbWFudWFsIHJlbGF0ZWQg
dG8KdGhlIFBNVS4gQW5kIGNoYW5nZWQgb3BlbmM5MDYgbWFudWFsIHRvIG9wZW5jOTEwIG1hbnVh
bCBiZWNhdXNlIGl0IGlzCm1vcmUgdXBkYXRlZC4KCklmIG1vZGlmaWVkOgoKUmV2aWV3ZWQtYnk6
IElub2NoaSBBbWFvdG8gPGlub2NoaWFtYUBvdXRsb29rLmNvbT4KCj5CZXN0IHJlZ2FyZHMsCj5Q
ZXRlciBMaW4KPgo+PiBCZXN0IHJlZ2FyZHMsCj4+IElub2NoaQo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
