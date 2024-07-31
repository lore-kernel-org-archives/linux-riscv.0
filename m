Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E01C3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 07:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hkunj01NIVxS7+INeEx1eHyxTpr7c0dKsPDRZ8T3uHs=; b=3VP4tqqVyv5OOS
	v3me14NyN3YENRIP+ZPTSx0sGRN10nvXV5aMAlqgUQXEbGCCu00G1jOFURx1V+7pwoelWuk3iaKNp
	M40CFlH7bykdcLD9XAFwW8psQd/2bOOfeIgAi/EMixby2OfmMhfwf+EHIfr3gy0zV+0fBAT4UC0ei
	9MR3wtF20dyzRoOyeCqvYFzu0izfSbZTbuNEzCZuhFYkIzKx55TzFfBMziYa+Mz/EqCJgStKKttyT
	2NKsZi9/Z208AknJsj+kqVWGMKLaOKVXHbyyI+ROf1Z9Prhfz394vv30vRgdwy9XLKMp9Y03VMq36
	hfgHk0BPwP0/+Osv2ELA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ3bZ-000000005rA-0c01;
	Wed, 31 Jul 2024 07:18:37 +0000
Received: from mail-mw2nam04olkn20828.outbound.protection.outlook.com ([2a01:111:f403:2c0a::828] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ3bW-000000005qg-2weO
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 07:18:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6J8Ta/yPZp0eVNtaO4+fkMzt8dPX/xP0PvicJ1P1cwdG2m8G74qyT3Sv/QfV6pyCP4Y4zUYrtsL/wCRDi4vgnVok/nl7BwZRIPS6UKI4WTKwu4vUW9IxrPtaqCyoE8El8HEOAxzAYSrhQTkoQYSyf4hwBfJgtkRB/5EgDx6epUJXNY78aH9Ywu+IP4YAnJEWy8Yr+aCvqjpYfRPLVGgXwuwzm0gqNcpUsn+GEf8U4/FxXdgU/CYrhtitlqPC7uQrQqF5vi8NDEtz1J7mDzK7lX9o7NZ+CAfX5VUdawx4MtEY+3gyB/eeL/5SPgQfgfmwP0OZYI5OY4oOuBxWfsixg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2OmqVlDaby94VWqTksiZmiMINjaMZzoQN6CNQMVC5c=;
 b=Yz0KdwyAvITtuZkT4YP3QHcRmLDjhdLrGAlRKXbotVvaCJb7A2hVRxWZ0YtE8857H42IovGnKc6D61kto/eOXLb13MU/RimyHSwVEpZ6b27eIqfgikS9+UFBN/s/h5k7AxnwAR3OFMGx8WymrrTtfdhu7KtwUSpQWFGtf7RAMcsXb4LomyKRlfyfeR3ywEgcVLzMZmApHfP89jmJPvUxtLonRkXcTBp7Y4B32xcUbasKP9qE9T5L2oSJYevrqS6SWbuiqcyY+l5fRgpobpXGjlbr1J8ZhMM9vdcwYXhngAInBXTf5CmnbV/9/IHjU+V0fUeFt+c9l5BHqZOoDuz/7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2OmqVlDaby94VWqTksiZmiMINjaMZzoQN6CNQMVC5c=;
 b=sNjb7HhWuDxCnYEhY1X5rbeCFSKVDGbVb9YlSXeZL2n6Nr9CkUSkim43Dn8MoUYLbXmqLnFja1Uy2pYnH6kgBBVgCGL2S1UVmB6qF1peesFb8p6Cw5KaZyEMDoxNPe9AunhVcdtopcOEsuRlAh3mdzqPFl0OEMZUYn0FUBzYzlmp3BjdhZG1et4U5W3WbXTlmmNlb/1JPV26uqb8+RVp2Iues3F2OT7zcnWjhvz/srtL93TdY1BBtWF1Ctb0j6n/9qMomIGfd9R0szJQz4GAG8dFXmCM1trurvea7282W/ofw34JyoQ8x0Il9eHTE1hrovmrJInrJqcBmeEG/NKSXw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CYYPR20MB6739.namprd20.prod.outlook.com (2603:10b6:930:ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.32; Wed, 31 Jul
 2024 07:18:28 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 07:18:28 +0000
Date: Wed, 31 Jul 2024 15:17:57 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, Hal Feng <hal.feng@starfivetech.com>, 
	Jinyu Tang <tangjinyu@tinylab.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	chunzhi.lin@sophgo.com, haijiao.liu@sophgo.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 2/4] drivers: hwmon: sophgo: Add SG2042 external
 hardware monitor support
Message-ID: <IA1PR20MB49534944E268A0A71AA3D5D1BBB12@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49538C09E94D90F07B7B2562BBB02@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953DE89C56AB3F328954131BBB02@IA1PR20MB4953.namprd20.prod.outlook.com>
 <MA0P287MB2822D0C770667CFE484EBC95FEB12@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Content-Disposition: inline
In-Reply-To: <MA0P287MB2822D0C770667CFE484EBC95FEB12@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-TMN: [LBHahn1gvbhgKhADi91zwParm2/qzUnQa46O8kNVyqE=]
X-ClientProxiedBy: OS0P286CA0071.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9f::22) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <uzxowagd4cg64kfs4xobj67yznxbsh4a4lgmuzabgst4tis5zq@pum5wyl3povv>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CYYPR20MB6739:EE_
X-MS-Office365-Filtering-Correlation-Id: 72042ef9-a21d-4cae-8355-08dcb130f921
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|8060799006|5072599009|19110799003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: 5/T+x1v9MbJYQDmPPZIchG9jTOgqo9Xm01VY0R5s4VEEcT2Uza3odnEp08VlXk5nh4Lu9MQ8JtIMJbJhKME7ff/vOnj2jydPkck7eeX/PKcu7GwXMiTe3P/ZRzFwV/LwUq0S5A9VjOWXFczST8iJnhZYDEV0rjSvHpM7LBtgXvBEVwBJxpucgdnEpuvQqDG0t4zmm9g0rv1QENuu9yx+c0RcDhCQyKhGFIVkQLkCOFumEIlJcpiHnxJylYprwPlNsDBeJIuZctPLM7M/SiT/2nEwtdCWoVnwJ5ojUq7XydxBSioe3EZuxRKGvGfQiFTGX18PpM3dFDnz8s3/ivQJRvLVXBbCAqDDmAducD1b6y+0FT43y+I0MABq0GiUWw5zyfI9GdzHaTy8JsKHIjyPDLYaALGz5IyIEx4uZIBUM1B5ThpRx75PfJzMdR4yWknLn/5mbkQuA51X/AfLm6JV1M6Tell5AG4y+tHEPWrtssNTS4QaqbNBCoOh0WcQQsnc+bIkeG86FHsdsiitP1r4oAqjZJiaKB+SCm2irdJpxGTPmXQBQs3NT5JH5bp7NgV85NuhrHguLSTJ4ygPxD6Gh7SVmvpcqByrttLf/pLEYoKGFe9No/sEToz2TpVbFsiSBRxZ0iV2fihc+Wsi+EHPsu2xPTkeaQy7w8QFzK4aZRUcD2jPHG8xcHgWU6LwUjZFvX2kR3PdkfmAIbEPVqli6Q==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWF3NGdyTHcvaFZGU3QvWWRpZmVSOWFXSXNacUlpTUM3ZEk3YjZqY0tYKy9x?=
 =?utf-8?B?bm1zbFdOUk5OTS95R3BabjY0YXZ2SHFEU2VRa2d2a1VPaWlxYW5XMysxcHZC?=
 =?utf-8?B?bUt4MjRWd1ZVZC9DSFBHUzhUUTZRU3A4OFExUVNHSE9HWElUaHdET01sSW5F?=
 =?utf-8?B?OElFajFSRXN2SFd0OEEvNWwrcDEvZFBuQThRdWx2Q3FJRDJDM1ZEam1qeTV6?=
 =?utf-8?B?QXdqazdhSWdHWVJFR2xFTVRYdGlBU3JsUHhDM0NYd2c0Ui9VdTF3TWdWUWx6?=
 =?utf-8?B?eDNGTDBBdHlpVXBMeVg0WlJ6dXBOeHdTRW1rWTdSTWRBY2hxNXJmWDBYNFhX?=
 =?utf-8?B?ZjFwZjFzNi83Zk5VNDNHSHk0dERQckZJWmRJVCs0M1ZrcVBtQmZoWGF6UEdE?=
 =?utf-8?B?djJKSTZjd1BCMHR5YnVJRExBQ1BBNkcrZHNzL292RmN5T0ppMi9EN2ZSeVNV?=
 =?utf-8?B?YnMybDQraXdPR1VGRDV5cHhQL2p4Nk5KYStBVTBCWHpvNUZ5eE1iQmt1cWxE?=
 =?utf-8?B?cUp1V09CZ0E0dmtjVzVOdWhIRkpvVVREakNvQXRmSllwOExtRlJnMDJ3aWNI?=
 =?utf-8?B?Ym5pY1k2b1R1T296MDVESHJrZS9uNW9EMWFZK1pXWS8vZjI4dWlFdFRqRFo0?=
 =?utf-8?B?WUdhczErZVAyWDNWUVJZcDloTEZ2RjE4c3NGZDlhUHVOUzJ6RGdKOGZwZkpX?=
 =?utf-8?B?aittZVMzVms5WTN3UzVrOXZOK3BsQkN1Q0tQQU5YZ2FBSE9iK21ia1Vqd3Zq?=
 =?utf-8?B?bW9zNW85bk14R2N5QlRYUU9EakFWK0o4TW5uYVFHWlR6bGVNOTQ4RkFNUUho?=
 =?utf-8?B?amRVVjF4WWwzcU96dCtCbmIwQkNkb3QrS3J5TDB1SEY1UVM0VG5KRHRUWnBo?=
 =?utf-8?B?TzRvNkh6TE1Ta1lJanBncHBDbHJJTm5PdlBua01iOCt1bFM2OUFkYy9WUzZs?=
 =?utf-8?B?V1hNdjZtTTREa0xJMlowNUdWZ3BibExxSkoyZlNTWkhKYUpWRU5MSVY1ZXdV?=
 =?utf-8?B?dmdQd0RhSVl4d0h4Z2tJL3UzKzdlNjNPS3JpWHhVMkkzRSsyYUtwdENxR2Qx?=
 =?utf-8?B?M3UwVjkvOTVkQ0pZSmFLd296d0RURjdJNDhoUU9wQURIV1U3djUrOXZISzlv?=
 =?utf-8?B?UktRUUtBSW5zdFpma2pmQzZjbDlueFlBTlN5N28xOTFVZzVNR0M2aE5zU1Nh?=
 =?utf-8?B?M1BHN3JGb3RaOTRheXRPNU9YV2dIZlRkUjNReG5DK2VQUGdVWFhwcW96VjFU?=
 =?utf-8?B?Nmh1QXlTZy9iSzlrdWFsaUhXUHB0b3A3NllWeUh3TGdib2pvYit3UFdtd0hj?=
 =?utf-8?B?RklwM1pycENuRmRZYUtNZHVZTk12Tnp2RkxDWmxtWEw4SjJKVnhBdHpMMjM0?=
 =?utf-8?B?eGxJdkNTUGFuaGlkUElYT2QxS21WaHhoakZKYUNON0N1UjNxOEdOZjJ4UENR?=
 =?utf-8?B?NmxUNnRteWhuNnhJUVJsa0wrUFQ2bzl4NzJGWS9QMFErMWVRZFdoL1loRGNx?=
 =?utf-8?B?TExweDJLdTFwWGxNN214dGNhWDcrYWlOaGFIcFZZeVR4ZEJZRWJzUU9JazVm?=
 =?utf-8?B?NXdPTDRTWnRGbDJZL0FFQ0tobkdKMFpBK1cxSE9wQ2V1ZlgwK1NqSXV3dFVY?=
 =?utf-8?B?QVNCSHpweVYyMzFSWE4rS0UyMmkwUjczcmVlZWxDVkJrcFlkSlB2b0k4Smc0?=
 =?utf-8?Q?Plh3OVoegK2a3Mg8Y/pM?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72042ef9-a21d-4cae-8355-08dcb130f921
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 07:18:27.8250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR20MB6739
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_001834_781160_782DC999 
X-CRM114-Status: GOOD (  29.19  )
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

T24gV2VkLCBKdWwgMzEsIDIwMjQgYXQgMDI6MTM6MjBQTSBHTVQsIENoZW4gV2FuZyB3cm90ZToK
PiAKPiBPbiAyMDI0LzcvMzAgMTU6NTAsIElub2NoaSBBbWFvdG8gd3JvdGU6Cj4gWy4uLi4uLl0K
PiA+ICsjZGVmaW5lIFJFR19DUklUSUNBTF9BQ1RJT05TCQkJMHg2NQo+IFRoZSBuYW1lICJSRUdf
Q1JJVElDQUxfQUNUSU9OUyIgaXMgYW1iaWd1b3VzLiBJIGhhdmUgY29uZmlybWVkIHdpdGggc29w
aGdvCj4gZW5naW5lZXJzIHRoYXQgdGhlIGNvbXBsZXRlIHByb2Nlc3MgaXM6IHdoZW4gdGhlIG1l
YXN1cmVkIHRlbXBlcmF0dXJlCj4gZXhjZWVkcyB0aGUgdGVtcGVyYXR1cmUgc2V0IGJ5IFJFR19D
UklUSUNBTF9URU1QLCB0aGUgcHJvY2Vzc29yIGlzIHBvd2VyZWQKPiBvZmYgYW5kIHNodXQgZG93
biwgYW5kIHRoZW4gYWZ0ZXIgdGhlIHRlbXBlcmF0dXJlIHJldHVybnMgdG8gdGhlIHRlbXBlcmF0
dXJlCj4gc2V0IGJ5IFJFR19SRVBPV0VSX1RFTVAsIGl0IGlzIGRlY2lkZWQgd2hldGhlciB0byBw
b3dlciBvbiBhZ2FpbiBvciByZW1haW4KPiBpbiB0aGUgc2h1dGRvd24gc3RhdGUgYmFzZWQgb24g
dGhlIGFjdGlvbiBzZXQgYnkgUkVHX0NSSVRJQ0FMX0FDVElPTlMsCj4gd2hldGhlciBpdCBpcyBy
ZWJvb3Qgb3IgcG93ZXJvZmYuCj4gCj4gU28gYmFzZWQgb24gdGhlIGFib3ZlIGRlc2NyaXB0aW9u
LCBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0bwo+IGNhbGzCoCJSRUdfQ1JJVElDQUxfQUNU
SU9OUyIgYXMgIlJFR19SRVBPV0VSX0FDVElPTlMiLiAiUkVHX0NSSVRJQ0FMX0FDVElPTlMiCj4g
Z2l2ZXMgcGVvcGxlIHRoZSBmaXJzdCBpbXByZXNzaW9uIHRoYXQgaXQgaXMgdXNlZCB0byBzZXQg
YWN0aW9ucyByZWxhdGVkIHRvCj4gUkVHX0NSSVRJQ0FMX1RFTVAuCj4gCj4gSXQgaXMgYWxzbyBy
ZWNvbW1lbmRlZCB0byBhZGQgdGhlIGFib3ZlIGRlc2NyaXB0aW9uIG9mIHRlbXBlcmF0dXJlIGNv
bnRyb2wKPiBhbmQgYWN0aW9uIHNldHRpbmdzIGluIHRoZSBjb2RlLiBDdXJyZW50bHksIHNvcGhn
byBkb2VzIG5vdCBoYXZlIGEgY2xlYXIKPiBkb2N1bWVudCBkZXNjcmlwdGlvbiBmb3IgdGhpcyBw
YXJ0LCBhbmQgYWRkaW5nIGl0IHdpbGwgaGVscCB1cyB1bmRlcnN0YW5kCj4gaXRzIGZ1bmN0aW9u
cy4KPiAKPiBBZGRpbmcgc29waGdvIGVuZ2luZWVycyBDaHVuemhpIGFuZCBIYWlqaWFvLCBGWUku
Cj4gCj4gPiArI2RlZmluZSBSRUdfQ1JJVElDQUxfVEVNUAkJCTB4NjYKPiA+ICsjZGVmaW5lIFJF
R19SRVBPV0VSX1RFTVAJCQkweDY3Cj4gPiArCj4gPiArI2RlZmluZSBDUklUSUNBTF9BQ1RJT05f
UkVCT09UCQkJMQo+ID4gKyNkZWZpbmUgQ1JJVElDQUxfQUNUSU9OX1BPV0VST0ZGCQkyCj4gCj4g
QXMgSSBzYWlkIHVwb24sIGFjdGlvbnMgYXJlIG5vdCByZWxhdGVkIHRvIGNyaXRpY2FsLCBidXQg
aXMgZm9yIHJlc3RvcmluZwo+IGZyb20gY3JpdGljYWwsIHN1Z2dlc3QgdG8gZ2l2ZSBhIGJldHRl
ciBuYW1lLgo+IAo+IFsuLi4uLi5dCj4gCj4gPiArc3RhdGljIHNzaXplX3QgY3JpdGljYWxfYWN0
aW9uX3Nob3coc3RydWN0IGRldmljZSAqZGV2LAo+IFsuLi4uLi5dCj4gPiArc3RhdGljIHNzaXpl
X3QgY3JpdGljYWxfYWN0aW9uX3N0b3JlKHN0cnVjdCBkZXZpY2UgKmRldiwKPiAKPiBbLi4uLi4u
XQo+IAo+IFRoZSBzYW1lIHJlYXNvbiBhcyB1cG9uLCAiY3JpdGljYWxfYWN0aW9uX3h4eCIgaXMg
bWlzbGVhZGluZy4KPiAKPiBbLi4uLi4uXQo+IAoKVGhhbmtzIGZvciBleHBsYW5hdGlvbiwgSSBq
dXN0IGdldCB0aGUgbmFtZSBmcm9tIHRoZSBkcml2ZXIgb2YgU0cyMDQyLgpUaGlzIGlzIG91dCBv
ZiBteSBrbm93bGVkZ2UuCgo+ID4gK3N0YXRpYyBpbnQgc2cyMDQyX21jdV9yZWFkX3RlbXAoc3Ry
dWN0IGRldmljZSAqZGV2LAo+ID4gKwkJCQl1MzIgYXR0ciwgaW50IGNoYW5uZWwsCj4gPiArCQkJ
CWxvbmcgKnZhbCkKPiA+ICt7Cj4gPiArCXN0cnVjdCBzZzIwNDJfbWN1X2RhdGEgKm1jdSA9IGRl
dl9nZXRfZHJ2ZGF0YShkZXYpOwo+ID4gKwlpbnQgdG1wOwo+ID4gKwl1OCByZWc7Cj4gPiArCj4g
PiArCXN3aXRjaCAoYXR0cikgewo+ID4gKwljYXNlIGh3bW9uX3RlbXBfaW5wdXQ6Cj4gPiArCQly
ZWcgPSBjaGFubmVsID8gUkVHX0JPQVJEX1RFTVAgOiBSRUdfU09DX1RFTVA7Cj4gPiArCQlicmVh
azsKPiA+ICsJY2FzZSBod21vbl90ZW1wX2NyaXQ6Cj4gPiArCQlyZWcgPSBSRUdfQ1JJVElDQUxf
VEVNUDsKPiA+ICsJCWJyZWFrOwo+ID4gKwljYXNlIGh3bW9uX3RlbXBfY3JpdF9oeXN0Ogo+ID4g
KwkJcmVnID0gUkVHX1JFUE9XRVJfVEVNUDsKPiA+ICsJCWJyZWFrOwo+ID4gKwlkZWZhdWx0Ogo+
ID4gKwkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+ID4gKwl9Cj4gPiArCj4gPiArCXRtcCA9IGkyY19z
bWJ1c19yZWFkX2J5dGVfZGF0YShtY3UtPmNsaWVudCwgcmVnKTsKPiA+ICsJaWYgKHRtcCA8IDAp
Cj4gPiArCQlyZXR1cm4gdG1wOwo+ID4gKwkqdmFsID0gdG1wICogMTAwMDsKPiA+ICsKPiA+ICsJ
cmV0dXJuIDA7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgc2cyMDQyX21jdV9yZWFkKHN0
cnVjdCBkZXZpY2UgKmRldiwKPiA+ICsJCQkgICBlbnVtIGh3bW9uX3NlbnNvcl90eXBlcyB0eXBl
LAo+ID4gKwkJCSAgIHUzMiBhdHRyLCBpbnQgY2hhbm5lbCwgbG9uZyAqdmFsKQo+ID4gK3sKPiA+
ICsJcmV0dXJuIHNnMjA0Ml9tY3VfcmVhZF90ZW1wKGRldiwgYXR0ciwgY2hhbm5lbCwgdmFsKTsK
PiA+ICt9Cj4gQ2FuIHdlIG1lcmdlIHNnMjA0Ml9tY3VfcmVhZCBhbmQgc2cyMDQyX21jdV9yZWFk
X3RlbXDvvJ8KClllcywgaXQgY2FuIGJlIG1lcmdlZC4gYnV0IEkgdGhpbmsgdXNpbmcgdGhpcyBu
ZXN0ZWQgZnVuY3Rpb24gCmlzIG1vcmUgY2xlYXIuIEFuZCBnY2MgY2FuIGF1dG8gaW5saW5lIHRo
aXMgZnVuY3Rpb24gc28gd2UKZ290IG5vIHBlcmZvcm1hbmNlIHBlbmFsdHkuCgo+ID4gKwo+ID4g
K3N0YXRpYyBpbnQgc2cyMDQyX21jdV93cml0ZShzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gPiArCQkJ
ICAgIGVudW0gaHdtb25fc2Vuc29yX3R5cGVzIHR5cGUsCj4gPiArCQkJICAgIHUzMiBhdHRyLCBp
bnQgY2hhbm5lbCwgbG9uZyB2YWwpCj4gPiArewo+ID4gKwlzdHJ1Y3Qgc2cyMDQyX21jdV9kYXRh
ICptY3UgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiA+ICsJaW50IHRlbXAgPSB2YWwgLyAxMDAw
Owo+ID4gKwlpbnQgaHlzdF90ZW1wLCBjcml0X3RlbXA7Cj4gPiArCWludCByZXQ7Cj4gPiArCXU4
IHJlZzsKPiA+ICsKPiA+ICsJaWYgKHRlbXAgPiBNQ1VfUE9XRVJfTUFYKQo+ID4gKwkJdGVtcCA9
IE1DVV9QT1dFUl9NQVg7Cj4gPiArCj4gPiArCW11dGV4X2xvY2soJm1jdS0+bXV0ZXgpOwo+ID4g
Kwo+ID4gKwlzd2l0Y2ggKGF0dHIpIHsKPiA+ICsJY2FzZSBod21vbl90ZW1wX2NyaXQ6Cj4gPiAr
CQloeXN0X3RlbXAgPSBpMmNfc21idXNfcmVhZF9ieXRlX2RhdGEobWN1LT5jbGllbnQsCj4gPiAr
CQkJCQkJICAgICBSRUdfUkVQT1dFUl9URU1QKTsKPiA+ICsJCWlmIChoeXN0X3RlbXAgPCAwKSB7
Cj4gPiArCQkJcmV0ID0gLUVOT0RFVjsKPiA+ICsJCQlnb3RvIGZhaWxlZDsKPiA+ICsJCX0KPiA+
ICsKPiA+ICsJCWNyaXRfdGVtcCA9IHRlbXA7Cj4gPiArCQlyZWcgPSBSRUdfQ1JJVElDQUxfVEVN
UDsKPiA+ICsJCWJyZWFrOwo+ID4gKwljYXNlIGh3bW9uX3RlbXBfY3JpdF9oeXN0Ogo+ID4gKwkJ
Y3JpdF90ZW1wID0gaTJjX3NtYnVzX3JlYWRfYnl0ZV9kYXRhKG1jdS0+Y2xpZW50LAo+ID4gKwkJ
CQkJCSAgICAgUkVHX0NSSVRJQ0FMX1RFTVApOwo+ID4gKwkJaWYgKGNyaXRfdGVtcCA8IDApIHsK
PiA+ICsJCQlyZXQgPSAtRU5PREVWOwo+ID4gKwkJCWdvdG8gZmFpbGVkOwo+ID4gKwkJfQo+ID4g
Kwo+ID4gKwkJaHlzdF90ZW1wID0gdGVtcDsKPiA+ICsJCXJlZyA9IFJFR19SRVBPV0VSX1RFTVA7
Cj4gPiArCQlicmVhazsKPiA+ICsJZGVmYXVsdDoKPiA+ICsJCW11dGV4X3VubG9jaygmbWN1LT5t
dXRleCk7Cj4gPiArCQlyZXR1cm4gLUVPUE5PVFNVUFA7Cj4gPiArCX0KPiA+ICsKPiBJdCBpcyBy
ZWNvbW1lbmRlZCB0byBhZGQgc29tZSBjb21tZW50cyB0byBleHBsYWluIHdoeSB3ZSBuZWVkIHRv
IGVuc3VyZSB0aGF0Cj4gY3JpdF90ZW1wIGlzIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byBoeXN0
X3RlbXAuIFRoaXMgaXMgZW50aXJlbHkgYmVjYXVzZQo+IHRoZSBjdXJyZW50IE1DVSBkb2VzIG5v
dCBsaW1pdCB0aGUgaW5wdXQsIHdoaWNoIG1heSBjYXVzZSB1c2VyIHRvIHNldAo+IGluY29ycmVj
dCBjcml0X3RlbXAgYW5kIGh5c3RfdGVtcC4KClllYWgsIHRoaXMgaXMgZ29vZCBpZGVhLgoKPiA+
ICsJaWYgKGNyaXRfdGVtcCA8IGh5c3RfdGVtcCkgewo+ID4gKwkJcmV0ID0gLUVJTlZBTDsKPiA+
ICsJCWdvdG8gZmFpbGVkOwo+ID4gKwl9Cj4gPiArCj4gPiArCXJldCA9IGkyY19zbWJ1c193cml0
ZV9ieXRlX2RhdGEobWN1LT5jbGllbnQsIHJlZywgdGVtcCk7Cj4gPiArCj4gPiArZmFpbGVkOgo+
ID4gKwltdXRleF91bmxvY2soJm1jdS0+bXV0ZXgpOwo+ID4gKwlyZXR1cm4gcmV0Owo+ID4gK30K
PiA+ICsKPiBbLi4uLi4uXQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
