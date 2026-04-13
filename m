Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EEBF34C64
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 15:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJoPV4b0UZSJ1V2eZEkAZA8Ip+qrzKQM+xJq+IBKcMw=; b=SRSfBDyvUFfpu1
	ryQBbiVqo+4Qv04nBpeH3/wv5b70lPUt6eCk88LTQ6zEMPPcadV0A+FEiSCs6BbzgdCk9mhyaNIY2
	9zRPY6oD0OYolzZSwshi9S9PJKmVwTdigUUHQFyh0HTSk070XplV4oL35TLAdHjHgIXDaQCfZHZfO
	Ol1rkeve88nb6T702vBZvEvIS/tUDEQCX/Zu111KhZREWK8h2KdaGBLbbCTukp60thN8aljkUg7l0
	rTR/l+Smm6XXKgwvdpnk6mBvC1OcvbGgQ/vytCfw6iFcadV4BfhxnFR4lt24pLn11G3srvbidQYP/
	8/OdPIIRGcmPN2lZx4RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJY1-0000000G0KP-2Uf5;
	Mon, 13 Apr 2026 15:50:01 +0000
Received: from mail-westus3azolkn190110003.outbound.protection.outlook.com ([2a01:111:f403:d116::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJXy-0000000G0JO-3jWO;
	Mon, 13 Apr 2026 15:50:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MGNNPt9UElyjwDS3SSBMi3aUD9/sBrxi7rNaxprqRbHShZFsxufHigS54yzsbBtA0lcWtPSSCKwgsJCgTfhzsNroR/2pkaJWdGHbVltbCE3ShfzHtpOu3Rm7UUimNCDy7YVqZJ8sBeezmewjpA2i5ENl9BR8z/2iVYeiKUDQvWOHlqddZ4PiLKvDxbd+nbAigUvu9vsl/0+kxJJ01OVlLFodV0o5+acH8Mzl+e56PBqvSNnySPFSG3Q53+FYM2e/D3uUTNE6iUtoUCbxigh0SdJKyq3MxiEk+WOMiDFr4qOzBBHrjretcwE4lLNwLt3TAQahWCowx+Chu/hcAqzPRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiVscvhF1iEMmG6ox2JnSq98LIX5NxlsNjEwygFu2Ek=;
 b=T13f2usn9hZSIz5cr2+zqU46uOgJGNM4supX5SYOUOIj6izPHIfYDRF1cpeRxeLYObR9CIfxGIY5KGpHvBrSqB8h7MWOpMABhMOuwVVfNS+/A6q54na/FpXtP8orvYPpcSS7ll829Mug5AWWAdQOl4sYTYVkSgM8DyJgfjvCrmPu+aG4PmNIXPdztyVQn6eUQmxrBDL3jbqcM2j9Ek/j6N+s55p2q2zX+Ai2FBNyx7LFSM0AZr4ABksAwjrpSyLfTzSmBdgcjvp/EhFl5EB96C/OhbULDEUw61QZAfy1ip0iF+9GOkFvtUMjjMiM/2asGPRInnXavn01Fu7A/B4EMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiVscvhF1iEMmG6ox2JnSq98LIX5NxlsNjEwygFu2Ek=;
 b=OW90revvz27fJRzquG+oyeyd0yWsLWTDS0Oc6XU5cDur8A/fAY3DlC4ZQDw2gjRHvkQZ8UekMv/b/lKbFsjJwhITemkypYd/osnodhs3p+Dle3ADLZg3Tqp6JewTEgd0Lnkm3xdtxnx28LpGjVellyN4DdQFfUERl8rjqdxT/u34Rdg7hDgJofBHxvNiS6NX69VyJFwYdxnJLNsFvrTTr6Tqnj3X5/so4bvAK8bmZw7NQSV+G/VH2bLkdddOLJ0xebYQ0Lf8pZiMHoTQXS5/5Ior3Agf6Y08tx27jvi/xaH2g4XNFknVSQ3bBl2YO+HzCzGnH7azT1kUq5Qk5i+YPQ==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by SA2PR02MB7658.namprd02.prod.outlook.com (2603:10b6:806:137::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 15:49:54 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 15:49:54 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Naman Jain <namjain@linux.microsoft.com>, "K . Y . Srinivasan"
	<kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu
	<wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Long Li
	<longli@microsoft.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H . Peter
 Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
CC: Marc Zyngier <maz@kernel.org>, Timothy Hayes <timothy.hayes@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, mrigendrachaubey
	<mrigendra.chaubey@gmail.com>, "ssengar@linux.microsoft.com"
	<ssengar@linux.microsoft.com>, "linux-hyperv@vger.kernel.org"
	<linux-hyperv@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: RE: [PATCH 06/11] Drivers: hv: Make sint vector architecture neutral
 in MSHV_VTL
Thread-Topic: [PATCH 06/11] Drivers: hv: Make sint vector architecture neutral
 in MSHV_VTL
Thread-Index: AQHctT5Uo06CdizxUEmOmS2tUYF/frXKhrvAgBKFcICAAEOtMA==
Date: Mon, 13 Apr 2026 15:49:53 +0000
Message-ID: <SN6PR02MB4157DA00A31F0BA8585B9B69D4242@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20260316121241.910764-1-namjain@linux.microsoft.com>
 <20260316121241.910764-7-namjain@linux.microsoft.com>
 <SN6PR02MB4157521DEF9EA2471B6F3359D450A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <b5125f61-173f-45d0-a6dc-d795ba0f8693@linux.microsoft.com>
In-Reply-To: <b5125f61-173f-45d0-a6dc-d795ba0f8693@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|SA2PR02MB7658:EE_
x-ms-office365-filtering-correlation-id: c18dcaea-8471-443a-2930-08de99744e28
x-microsoft-antispam: BCL:0;ARA:14566002|15080799012|37011999003|51005399006|31061999003|8062599012|461199028|13091999003|8060799015|19110799012|40105399003|3412199025|440099028|102099032|26121999003;
x-microsoft-antispam-message-info: =?utf-8?B?UE5GdmtkUUlyM1dIb1hEQzZHWUwrZDRXVEwyOXhzSzdWUHRtRm41dzFNdnhF?=
 =?utf-8?B?Qnl0Z3E4UDN4eVBUeVJnUDNEaDN2ZklLTzhqL1JrQWRjaWtENlQ0VEdkWW0w?=
 =?utf-8?B?NVRQTnBkdmYrM2wyZ0doMzl1ZEIxRk9CU2VZM0swWGZaNERQQzhHMExYQjV0?=
 =?utf-8?B?TnRteVlOVzhscHFQclA1Qno0cEwrQ1Q2ck1yNERMT3h1dml1Ym1LMVMyRnpP?=
 =?utf-8?B?UksraU84SjFRUCtCeEZJeDZpNHZmQ3B6aXNoNU0xMklDQkF5bmxtVnFKV2xx?=
 =?utf-8?B?aVZoL0k4eXphSVNyMFdpWkV3amMvaEZGOUVCNVlLYXpCTlZuTnhjVTZ0RFBm?=
 =?utf-8?B?ajNYWnRiSjkvdjZ2aFBIUXJBL2QzSlNMOVNVMTJLTnNkcHIrRmQvZkpyZHJa?=
 =?utf-8?B?REdOWVYrQUlYaGFDcjNKSHhkN1lCajlMVnR3QTF2bWVjZVZ0cHY3Q2d3Q0ta?=
 =?utf-8?B?UEVxeXNibzFzUUlFVGJVL0RGOXlIRVV2VE5pbGZEbXphVkJIUmlVckRkQ0ph?=
 =?utf-8?B?N3Y1Q2FEUGhRM0dxMG4zNm9qQnBoanRsdE9SUGEwU003TGQyaGtZMHNCWWdV?=
 =?utf-8?B?WXhCZTlUM0hnZnN3UzFwNUxRUzM4WFQwRWg3MGJuRU5sLzhmR2pxOFUvbGRD?=
 =?utf-8?B?clhORHdZRUIrKzhQWGowcjJXeVhCSlo0QmFTSFoxM2g5MVpFRHhKWG5tQ2tJ?=
 =?utf-8?B?TEZQdUhYY0c2dTVnV2JyQVJFeVlwREROTUtQWTJNNzhQN3c1UHdWVTZacEhr?=
 =?utf-8?B?WFlXSjZKQ01uOG9neXc2dEJzc3p6VWxyemF0ZGRTZVMwL2RSdG9rdjRwTnd1?=
 =?utf-8?B?anpPZWVZb0tKZmx6Nm1teHdyNmQ5dlZjMWErWG9YUDV4N0xubjZWMnl4Yk9l?=
 =?utf-8?B?cFYrSXNPTG40bjdBckgycmVMQTFaWWpKdXdpWlRNeExwbEdpbWNQNm1RY3h6?=
 =?utf-8?B?NHUrNkhxUXNUR0psRm4za2xzMW5XY3g0MnR4Yms1N3Y4V3FzeG92SlZpdHp3?=
 =?utf-8?B?c0tOZVhWeHVOWlU5cHJZVjF3NGxKMjNKbzhnL2xqQmQvMzVkL0Z5NGZTUGF6?=
 =?utf-8?B?NnNFd1IxRjRIa3RqeUdFTHVrMFNMNWxPSGVYVi9YQXZFbk1MZVdraFRudHEy?=
 =?utf-8?B?cEhTcVZqNCtuQkJTRy9idVRGcldrY0QrTDBBQnBCTW1xbVhxdWZVTzdiWll3?=
 =?utf-8?B?VDlyT1FYLzV6c3o0VUFNamQxcG91MjJRZHd1THl3YnBOSXRNSDNXd1Y1Y2RW?=
 =?utf-8?B?VEtNdzRRckxyZ1RZVDQrL2NVSkc0SnJCNVczN2NBcENpT0owczVjcEdVRFkv?=
 =?utf-8?Q?qGVTNZjb4uiinTLWTjGRDOOeOfRK5td+f6?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RG9oemFrQmdySnM2c0RzVlQxQ0xWWnIvZ1pvTW02eHhnaXlvMC9TTG1WTVJG?=
 =?utf-8?B?QXFFT1NSTjB6UC9SWHgrUWFCZWliWXdOQnE3OWgwc1RvZ292OWJKb0Y4N3FK?=
 =?utf-8?B?a1BuOFJya3E1YWs4S1VxbWRWRjlNR3dwSVZ6aFBqOFhVbzVCUHlUOXc5dFJt?=
 =?utf-8?B?amx2WlcrcEQ0SnV5dnhmSmx3RkhSeHZXdFA5V2dDcDczcjlCcEVRTjFZR0pH?=
 =?utf-8?B?LzYwTGNiQTNBYytZN3hzaWUwY2RXc3BWUTlTTHN3Z1lMRGM0dk9zSm5HQjdB?=
 =?utf-8?B?R0JKS3pndmlQd0tUUlZrK2RVcE0xYmFkTE91U1k3ZkNBWVFTYlc2d0ZhYits?=
 =?utf-8?B?WHBHVGpRS2JHUFA3alIwSy9PSC8xcTRZNmNzWm5Yam9qT0JtOTFnaDlZeTlu?=
 =?utf-8?B?NlcyTnNBdENEZGx5VE9VUXd3dDRLN1A1V2Z5R21DTzh0Y052NTRpYnB1VUlS?=
 =?utf-8?B?a2xqeVRtZlc4NEZwWUY4S1ZndHdqQUR2a0ZCUjU1QUMrTTJwWjJOTmZUamEw?=
 =?utf-8?B?SlFDcXNkUk5OZUNqTVErdXJMaGQwcGtxalF0NU53Qk5FRTI5ZW5QM2w4eWFU?=
 =?utf-8?B?WlpCdzExajIvWmF4ckVFWStqMDRJWTY0RU41dllieGtSdXRuWG41RGZQNW85?=
 =?utf-8?B?elFLdSswQUY4QlZGemUxUVdRTFNmU3ZBY2oxMjBjTzlYdnNDd0ZQZmNMdEg1?=
 =?utf-8?B?U2I1Qm0rUUU0UStYNFpBeTYvQU9ZRVZidC9PYjNGREREUmlLRzhiTjJxZE9H?=
 =?utf-8?B?bEE5N2pZVmNBU01RbXpVd00rRUV3c0ZZK1orWmF2bDRTb2svZVhWMnE1S1hE?=
 =?utf-8?B?eVAxWjY1eWFyL1hLWW9HWkhleVRkbWR5WTlwcllzblBqZDBCeE1iMUt4Tjhh?=
 =?utf-8?B?VkkyU0xrNmMxYldodDM2cFFONW43SXVSYjZDZnRRdnkyZVY2ZVhCckxoYnQv?=
 =?utf-8?B?V0l1VFlCekxHRm1wdHI0UElPNElGc1YzdWpTUVdBdHBmUnhiVmtNZnR1eStl?=
 =?utf-8?B?SFlvN3gvN3N6SnYvSndWdHV2OHl3RUZUSldTNmlPcmxWdC93Z0pwTWRoUE9P?=
 =?utf-8?B?RlFPdmtqcjEzL2toOTFVTkYwVXpIZnBsN3pFV0lGVmFuUUdQNU1pMlpvUEor?=
 =?utf-8?B?MGhEbWh0ZEZ4QzFPcExvRnFTeFFIbG5HblVrVGRZOGRweFZVMXBzb2hyTlpL?=
 =?utf-8?B?TkozaERjbDFWaFByZzNnMlhQc3NqS0oxb3FCNVluLzNGZ2h2VkFBMGc2ejJz?=
 =?utf-8?B?bU85NjZNR2pnWDlSckNXMU9RMXpKK3hUMFVRR0NYN0Z4endsSlByMTBCMlQz?=
 =?utf-8?B?aUdUR2ZtK3lxaXRCdE44TkdGWHBDUVR4ZTQ2clI5YU5zK2ZDL2FHRzFqQ041?=
 =?utf-8?B?M2I3WG13MjQ5Y3FrbnhaYVhKNWJUZEhGL1YzK3NXa0h1RUhndXp5REtyV0JB?=
 =?utf-8?B?WFltelhKMXdDZXR4Z1Z4NjlMbEFITGxIenBDUDM1WEJaMStPQlVaK0dKcEZ0?=
 =?utf-8?B?eS9JTTBNM3R0eFpLWEhJSTZIdDNwcHhUamZOV3h6SGRSaDBGaDBlYyszNnVE?=
 =?utf-8?B?S3hVNS9KZWdUT2o0WEZIWE9sV09DZWsxTGF0cVRBQ3VnS3RiVVlmNkp2MVRw?=
 =?utf-8?B?OVRrRWJNYnNQRkxLSE5NOStRaFhtMVN0dEk2SEpJa3VGVlowSXBaUWI4VlNn?=
 =?utf-8?B?QWFUSHRLbEdvdmFyeDdzRXhOUGpOSkQ5UHN0NmlQUjV1M25CZGNWQ1orcFdy?=
 =?utf-8?B?c1hNRVNsY3RPdjJWcFk0TUFwWFIwcjgxZFNCYm1GY1NJaGJsN1Y1cDdrWXpi?=
 =?utf-8?Q?ZIfzNbAO06btLSzkShSLuubuZysz0+3S0c2iQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c18dcaea-8471-443a-2930-08de99744e28
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2026 15:49:53.9629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7658
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_084958_938369_AE980D20 
X-CRM114-Status: GOOD (  19.89  )
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

From: Naman Jain <namjain@linux.microsoft.com> Sent: Monday, April 13, 2026 4:48 AM
> 
> On 4/1/2026 10:27 PM, Michael Kelley wrote:
> > From: Naman Jain <namjain@linux.microsoft.com> Sent: Monday, March 16, 2026 5:13 AM
> >>
> >> Generalize Synthetic interrupt source vector (sint) to use
> >> vmbus_interrupt variable instead, which automatically takes care of
> >> architectures where HYPERVISOR_CALLBACK_VECTOR is not present (arm64).
> >
> > Sashiko AI raised an interesting question about the startup timing --
> > whether the vmbus_platform_driver_probe() is guaranteed to have
> > set vmbus_interrupt before the VTL functions below run and use it.
> > What causes the mshv_vtl.ko module to be loaded, and hence run
> > mshv_vtl_init()?
> 
> There is no race condition here. The init ordering guarantees that
> vmbus_interrupt is always set before mshv_vtl_synic_enable_regs()
> reads it.
> 
> The call chain for setting vmbus_interrupt:
> 
>    subsys_initcall(hv_acpi_init)                          [level 4]
>      -> platform_driver_register(&vmbus_platform_driver) and so on.
> 
> 
> The call chain for reading vmbus_interrupt:
> 
>    module_init(mshv_vtl_init)                             [level 6]
>      -> hv_vtl_setup_synic()
>        -> cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, ..., mshv_vtl_alloc_context, ...)
>          -> mshv_vtl_alloc_context()
>            -> mshv_vtl_synic_enable_regs()
>              -> sint.vector = vmbus_interrupt
> 
> do_initcalls() processes sections in order 0 through 7, so
> hv_acpi_init() (level 4) is guaranteed to complete before
> mshv_vtl_init() (level 6) runs.
> 

I think the situation is more complex than what you describe, depending
on whether the VMBus driver and/or MSHV_VTL are built as modules vs.
being built-in to the kernel image. In include/linux/module.h, see the
comment for module_init() and how subsys_initcall() is mapped
to module_init() when built as a module.

If both are built-in, then what you describe is correct. But if either or
both are modules, then the respective init functions (hv_acpi_init
and mshv_vtl_init) get called at the time the module is loaded, and
not by do_initcalls(). I think hv_vmbus.ko gets loaded when an attempt
is first made to access a disk, but I would need to look more closely to
be sure. I don't have any understanding of what causes mshv_vtl.ko
to be loaded. And what is the ordering if MSHV_VTL is built-in while
VMBus is built as a module, or vice versa?

Michael




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
