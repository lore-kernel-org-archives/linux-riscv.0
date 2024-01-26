Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E4DC47DDF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jan 2024 12:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ChaBtp4cCXYvmBrlps/P7baszmN2tWG5oqESkaCB8DU=; b=H+cDxunbOVWrI9KN977cZ7HFv4
	ARZ4VGI4dHwkONsoBAUEdvGgis01kf0MtliP4fOGG+dYDVjPULr02CRF/y9Dh+RE3l2BGI2B2AQ1z
	3w+31LQ8m5TUF4x8v70xu165UnOUgl97qc33mc8iKmMPqHI1e4s1EkZc6pol8PPla/an/A4ofW2Ew
	IrcWBCqrx/XK9rslJZk7Aa6njP8V6CQWE2UyETFNkC9vzPntsxbe5nmVXXT/OyKPxiYZR2oX5p+i6
	NdL7SnPTSBZcF5lpm5XRyr3beb+1mXKY++xfPy7wX3VcPIz8tvLRC7eJIEi6ErsKsorcQ2FhPHTzX
	YNTBmpfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTLMk-0000000473a-1vos;
	Fri, 26 Jan 2024 12:31:26 +0000
Received: from mail-maxind01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:281b::801] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTLMi-0000000472J-0KlY
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jan 2024 12:31:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kn4HQbsCsaEJr3tiveFPpH7Non68gfNKLWZfXeAOhhqEZDXkool4Z2kjt42HQS39YPILUa4VP5q1onvG+QXy0+TGuMbFskk8FrIcb5BnjneB8cvJvV5yTkqZh7cM4j+aKq5vn8ck7ju4eyc0pxYphLgzd/QDIYjAZUiZr7+jIdnOQSMTEHMJIqpwtQp1RteHsBuuVVZft60J24X1E6O5TPxyEHZYWVt0cCFQ/iqZTusZFrvecFbyww2/pTDPHXK52KENIUP0CCjeIO5wrUhmY7c1rezc3Qcg+flbDPDG/+6ED0QTFQOU4FlSFpWdJds74GCpfyP1CHHwknh68LC7bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cp9B3MrBZ8zk4Nex80q5Hj0AoiheHrl65cSvGxGrgA=;
 b=TPNUI9UsgOuvmdcaTnQAeQYhRXwIUGHGEW5c2tSzZDWjpgUgTtTSskV5orFhx14rMDw5gsM9j1afpS4H9j2+OKMVOgxQEKL3bgroow0t5NuadsvoRKBjQluanJj29zQZG3s2fRRNoV0ds09jJhVnhffxNfEmle9gUypv/tz21jtIub6Mv131knSzyOXynDGcsJ3ElNERxxgcDhOntV1Cx38uw/XC7GrXKVsOk82WGlVOf9xPESa3ZM7Ly/7bEVymVrXHaHsabAHRQWUDls2MKfqpxhgYdknte034h36L1bMNZ20jhVZSV5rwvKCjzl6Nu0/Vr5kHdNzXmoB3Qn7YcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cp9B3MrBZ8zk4Nex80q5Hj0AoiheHrl65cSvGxGrgA=;
 b=uUD46WGIFmecuda+7xYzKEkhiiT8Ad++3zYwFu+Wz89gDg6I90mup4Oy2PMORIlANcZGgVMqsh/t+ebyfHuI/ALKVNrbaBRcUsoWNFsnAIN58LM4uTppodE0qe1Pw9UijGmVr+3czo5X8lF8PuP81hJLUwVxGhDr1xutfN7TPkQ6b33/jB/6Z4tJyhmurE3mBi9bwRTogsVfYRQ8J+05QgKQ3LQJv/ftEDCKVWnR8kMJ6O92MS0WUn4HCGR8lf8rCMa53oUzVNTGoZ9ddRDBOYUbIb5VtS387bWkztHfBej34oRuIHTTRT+YzUFuJmp4lduri2fxwL14mAam83hUmg==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by MA0P287MB0784.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:e0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Fri, 26 Jan
 2024 12:31:13 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a2d5:82f2:b6d4:f2cd]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a2d5:82f2:b6d4:f2cd%2]) with mapi id 15.20.7228.022; Fri, 26 Jan 2024
 12:31:13 +0000
Message-ID: <MA0P287MB2822632A358DFEF21FCA333AFE792@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 26 Jan 2024 20:31:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] RISC-V Devicetrees fix for Sophgo/SG2042 v6.8-rc1
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Inochi Amaoto <inochiama@outlook.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com,
 Chao Wei <chao.wei@sophgo.com>
References: <MA0P287MB28228572C526C5099A8BDA2DFE7B2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <0f091a2a-0bc8-42ca-9d5d-aa218fa88e93@app.fastmail.com>
 <MA0P287MB28229E73972FE184B461511AFE792@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <cf70dd11-18fc-4c57-beab-b682f8edb220@app.fastmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <cf70dd11-18fc-4c57-beab-b682f8edb220@app.fastmail.com>
X-TMN: [sf3XkVt0VVsqM9Yhey2SE/aWWMoJ/60b]
X-ClientProxiedBy: SI2PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::10) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <8249b373-3e52-4882-b1d2-4abf3da8c1f8@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|MA0P287MB0784:EE_
X-MS-Office365-Filtering-Correlation-Id: e51c8403-b1de-4023-46e2-08dc1e6aaf3b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gGHPB35M9HvFPR+4GWww4tuQmSGV7qxRmQ9fPox3tNfCPvYlXYzbM01nNgRXE5AMJdLhR/1f3N4Rd/jGkLDDFZCKfZJh1gIcZr/tyWdetf28QPPGWWOJ/XxEGMpCsCt44e3aE/pmtAFRJlUvFLu2IpT2kUWNev/RWAnUqQQG/VUnsFA464TNyVeVPrHBtLkQ6Tco/inYvaHoT+IUWnVb2M1Yp1qYZBu5Mk5piyeHTdx1L68Y2DO3Pwjl2HHiqdxnL3YWXQxKyQUfU2vrlD2iVyIUE116WC02InQ9ffqb2HPg9VhdEoQ/LNtK5BbPaLirvE3laPQaU7HjNMg//3AFFUF2ukUYh6z0KyCSTcRqgC0Zz42l7NQrS5W62FTNUxMvWDRzTDxssb2PCN2cQA5b9hUkp13Jbt7b6g5+S/vY0FO9NSUIHB7TfIA7NNoz0T/Ecjh/kaQsUAOALLSJb3orH4WYlyEq16QRgvBYTqAq51eY1PA2V3lUTxXoObUbDqxi1uxE4nfC2i0TXnWytuHYXcPrvCjmH5OEATVm1tULBxDgCvEAoglx2kvudcnkb4lx
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eE5HTlRiNFkxVFMxNlR6UVN1SHZtRzExUkVpa2IyUEEvWEVSQkwvcEJ1Z2tq?=
 =?utf-8?B?aTdOZ0FwOVl5eGxKZGpia09HeXByWklWanZVY3AvUUFVYzkwZTRuRDMzdlBs?=
 =?utf-8?B?MllxMEphNW5YSjFNQ1dJNmJ4Ykg4dFRzdTJDNEZ1bXQyWTU4OXdNSEkwaWY1?=
 =?utf-8?B?ajFscTVmbU1uN2RnMGIrcHJ0TmJ2d0U2aEVpUWMzTm1HZ1dXc2ZTVTM5L0RO?=
 =?utf-8?B?SExWL1haYkFZSVFDUi93RC9HVXFtVEl6bEYvRlJUOFdrN3dDeVJENEZZeXNC?=
 =?utf-8?B?bzh6NFdyMWxKdkp0cG45aUlyUUZra29KSmtxaEI2RE9XRXpSRWlaaitGTjhC?=
 =?utf-8?B?NUlOMVhPdnF2T013WXJkcjI0RXR0ajJnOXFoUTFkU0lHVHZwL2VSWmQ0OUlk?=
 =?utf-8?B?S2JadUszajQ4c1VVSTc2RzFlNExNUHVXb3NmVUxKOC81Ykw3WHhmb0pRekVL?=
 =?utf-8?B?b0VxaHY2YmJCMGY2dHVQeHZaZVJNc29EZWVBdXI1Y2VvUDlyWTR2RzZMMmU5?=
 =?utf-8?B?a3hGV1h4SmRybUg4dDhubWhsUEdpVnNKWTBwdStlWUcwRitKL2pOUVNOUzFY?=
 =?utf-8?B?ZjBsUVFpUllrU0ZRMXVyam1mVHFXdEx4eTlGaW5uUDdlQUtLWWM0VUNyZmpD?=
 =?utf-8?B?QWRzY0tZVHg1aHF3cTU5eEZLamIyc0MwNnNmT0VYL0xKYnBaNCsyRkltMGd3?=
 =?utf-8?B?QlZ0YllVNm83RW9tK3hMNnZhZ040MTUrbjRObVpxNHhjcDRYSVRTTTlaakQ0?=
 =?utf-8?B?bmwwWWZiMXI0aTh3MGpicS9pK1FNMjUxL2RQY21BZmh4dHpWbE52L0Jyclh3?=
 =?utf-8?B?amswM1hUTTAyUmlOeHZIdmM4ZDFYbXBUL0tObWR4RmpwdzRHU3R0Nm9tZUxN?=
 =?utf-8?B?c2Z3L2dYbTQvMGtQeTdjT2ZQT3ZkTlpKMnpDcURwTXNsdGRCNHJ5cVFzSklx?=
 =?utf-8?B?OEF0VHFCcmVWSUVpWWJBZ3UyMkx5M0pjSVp0LzVac00yRXgxbitUdmRHc1hk?=
 =?utf-8?B?Q0o5M1FVN2RWSTh0ZjkzMEp5dGVRT01tNzhMYTAzYnlOMEQvOEZ1Z096Smty?=
 =?utf-8?B?ejdrTmpKS2VLWDA3T3lERHdBNzRBVC9ML293UnAwUk90TWZNMzk1T0cwY0h3?=
 =?utf-8?B?NnpkcndqUFdOVW1QOTM2bU5PQnE3ZzZDQnozYm1xdlpnRGI2b1lvNWM2b3dz?=
 =?utf-8?B?NS80V0tBVEluWlJ5VUpBanlQQVU0UEQwZ2p2VmhFbDg0UGRaQ3A3RzZGaUhV?=
 =?utf-8?B?NVdlM2F4dnRQcEd2dG9lbUNLTlUzSURZTW1sMGtMWDZJTVNSME15MjRIeU9B?=
 =?utf-8?B?a2JJNlVlcFJQUEEyTkQ4VWhRdk1TaGNPaVFKckRZV2x1dHkzaVI3UWhpbHN1?=
 =?utf-8?B?cjdHRnZ0N3ZndjFxTERxRGpqVXg5WU5pT1ZJSDJGcU1UME1lbnJDOVFsNnpQ?=
 =?utf-8?B?YlVRM21sMnhpZmxrdURvSUZJMkZlUmg5RUIxbklyaW1pK3lSOTc3Vjk1VmY4?=
 =?utf-8?B?ZTR2NCtZU2t3VDd5aFdBWWlabGthNmVQaEkzRlkvTXJKVjVBR2loY1dWK2Fw?=
 =?utf-8?B?WHQ1a2NwaVB1WVlkZG5qMTZ4eVFtYS9tN3JBdGhHcFc2WU1GQ0lRckx6M3BW?=
 =?utf-8?Q?7Y+in0/S1TzHy7kMcW82yWjcNaYAOPIr37fq5OMUK5P0=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e51c8403-b1de-4023-46e2-08dc1e6aaf3b
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 12:31:13.7074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0784
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_043124_158620_D29A25D9 
X-CRM114-Status: GOOD (  20.07  )
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

Ck9uIDIwMjQvMS8yNiAxNToxMCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBPbiBGcmksIEphbiAy
NiwgMjAyNCwgYXQgMDg6MDYsIENoZW4gV2FuZyB3cm90ZToKPj4gT24gMjAyNC8xLzI2IDE0OjEx
LCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+PiBbLi4uLi4uXQo+Pj4gVGhlIHRhZyBkZXNjcmlwdGlv
biBpcyB3aGF0IGdldHMgdHVybmVkIGludG8gdGhlIG1lcmdlIGNvbW1pdAo+Pj4gd2hlbiBJIHB1
bGwgaXQsIHNvIGl0IG5lZWRzIHRvIGJlIHNvbWV0aGluZyB0aGF0IG1ha2VzIHNlbnNlCj4+PiBm
b3IgdGhlIGxvbmctdGVybSBnaXQgaGlzdG9yeSBhcyB3ZWxsIGFzIGZvciBtZSB0byB1bmRlcnN0
YW5kCj4+PiB3aHkgSSBuZWVkIHRvIHB1bGwgaXQuCj4+Pgo+Pj4gRm9yIGEgbm9ybWFsIGJyYW5j
aCwgdGhhdCB3b3VsZCBtYWlubHkgbWVhbiB0aGF0IHlvdSBzaG91bGQKPj4+IGdpdmUgYSBzdW1t
YXJ5IG9mIHRoZSBicmFuY2ggY29udGVudHMuIEluIHRoaXMgY2FzZSwgSSBzZWUgeW91Cj4+PiBo
YXZlIG9ubHkgb25lIHBhdGNoLCBzbyBpdCdzIHByb2JhYmx5IGVhc2llciB0byBzZW5kIHRoYXQK
Pj4+IHBhdGNoIHRvIHNvY0BrZXJuZWwub3JnIGluZGl2aWR1YWxseSwgd2l0aCB0aGUgc2FtZSBj
YyBsaXN0Lgo+PiBJIGhhdmUgb25lIHF1ZXN0aW9uIGFib3V0IHlvdXIgbWVudGlvbmQgInNlbmQg
dGhhdCBwYXRjaCB0bwo+PiBzb2NAa2VybmVsLm9yZyBpbmRpdmlkaXVhbGx5IC4uLiIuwqAgSWYg
SSBzZW50IGl0IGFzIGEgcGF0Y2gsIHdoZXJlCj4+IHNob3VsZCBJIGFkZCB0aGUgZXhwbGFuYXRp
b24gb2Ygd2hhdCBJIGV4cGxhaW5lZCBpbiB0aGlzIEdJVCBQVUxMIGFib3V0Cj4+IHRoZSBvbWlz
c2lvbi4gQWZ0ZXIgYWxsLCB0aGUgY29udGVudCBvZiB0aGlzIGV4cGxhbmF0aW9uIGlzIG5vdCBw
YXJ0IG9mCj4+IHRoZSBjb21taXQgb2YgdGhhdCBwYXRjaC4KPj4KPj4gU2hvdWxkIEkgc2VuZCB0
aGlzIHBhdGNoIGVtYWlsIGFuZCB0aGVuIHJlcGx5IGl0LCBhbmQgdGhlbiBleHBsYWluIGluCj4+
IHRoZSByZXBseSBlbWFpbD8KPiBUaGVyZSBhcmUgdHdvIGNvbW1vbiB3YXlzIG9mIGRvaW5nIGl0
Ogo+Cj4gYSkgWW91IGNhbiBhZGQgZXh0cmEgaW5mb3JtYXRpb24gYmVsb3cgdGhlICctLS0nIGxp
bmUgaW4geW91cgo+ICAgICBwYXRjaCwgbmV4dCB0byB0aGUgZGlmZnN0YXQuIFRoaXMgdGV4dCB3
aWxsIGdldCBkcm9wcGVkIGR1cmluZwo+ICAgICAnZ2l0IGFtJyB3aGVuIEkgcGljayBpdCB1cCBi
dXQgaXMgYXZhaWxhYmxlIHdoZW4gSSBsb29rIGF0Cj4gICAgIHRoZSBlbWFpbC4KPgo+IGIpIFlv
dSBjYW4gc2VuZCB0aGUgcGF0Y2hlcyBhcyBhIHNlcmllcyB1c2luZyAnZ2l0IGZvcm1hdC1wYXRj
aAo+ICAgICAtLWNvdmVyIGxldHRlcicgYW5kICdnaXQgc2VuZC1lbWFpbCcuIEluIHRoaXMgY2Fz
ZSwgdGhlIGNvdmVyCj4gICAgIGxldHRlciB3aWxsIGJlIG51bWJlcmVkIGFzICdbUEFUQ0ggMC8x
XScgYW5kIGFsbG93IHlvdSB0bwo+ICAgICBhZGQgdGhlIHNhbWUga2luZCBvZiBkZXNjcmlwdGlv
biB0aGF0IHdvdWxkIGdvIGludG8gYSBwdWxsCj4gICAgIHJlcXVlc3QgYnV0IHdvbid0IGJlY29t
ZSBhIG1lcmdlIGNvbW1pdC4KPgo+ICAgICAgICAgQXJuZAoKSGksIEFybmQsCgpJIGhhdmUgcmUt
c2VudCB0aGF0IHBhdGNoIHRvIHNvY0BrZXJuZWwub3JnLiBXaWxsIGl0IGJlIG1lcmdlZCBpbiBt
YXN0ZXIgCmluIDYuOC1yYzI/CgpUaGFua3MsCgpDaGVuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
