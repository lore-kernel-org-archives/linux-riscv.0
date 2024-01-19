Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49539C4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 07:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcTvax1DsEVMMykIJi3E1IhIpSgIfARCKduahKLuEpo=; b=RZXuMo46ZSRk3fdwm4vuvLFIir
	gKUcmi/Mbxl8G/1owgogELfpa361l5uvEQcX9GY1so7/P+d2etHZVGYDwQrjLGHlc5fAY+NGOVgeh
	luZOXS7Fmi9M+PgkDMZ55xqwxIQEz1Kwxg/t1cQ03iWw7oq4eMhuvZ2Edy6hNE2gNHM+IV1gtvXgB
	hvz/D2tivAcyWy/pvnnRetNsO0p6loGs0keG7oISGqSJsD1XaSy5z1zG8CPNHwiy02lyI9w+wgWDB
	KKrTfK5mwR2mXRCOYjduWo1JRzIivdxRU2AnOb1UGC1tLTQQPsdmBdtKTE2IxnFNLgcg1MQQ5b3k1
	vyI6U37Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQiu0-004eJ6-2b;
	Fri, 19 Jan 2024 07:02:56 +0000
Received: from mail-mw2nam04on20723.outbound.protection.outlook.com ([2a01:111:f400:7e8c::723] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQitx-004eIW-00;
	Fri, 19 Jan 2024 07:02:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPvfWeqdKL4Wm/C4vV9CbD89UYtPf/XuS2aTjdCnEyDGO50dqosJqkZ2VU9MgBnLFtoP891ycI9jciuIfhv1YLuE6j+Xo9SlJdtEXJAY6vllH8BjqKVjFlsPF5VoOyqPJiFvkZVmGvlYt4G43zmemDqsJZdv1XkcPcJu2XaMsKJ5cM32i/PA1J3xn6b9xPIYdskGEN8sTZf+VxKV+PftS2hIyDUB1Y9JXEFqsnooS9LcCu0/uDGx7mkYI4Ybwc201g70AFNkBGRa7YuebJlFZEKiQTqmsU+XjcMUQiZxYdKfNJthy75pPTIdQEALAXzcdIs2x3fpdW0V4w91tzY4LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+2XYSl4mpJYa8fH689AmNJ7/fkGOad19+DPwD5u2no=;
 b=I88XrNGSlhJKc5fzas5+IJ2l/MFmOXzlH++fNm5TZpq3L4Bq+Q7Gr7YHUSF1Dc4YXiRbYljZfRztm+oN1oNj8Df7TBDpolD5HIfhzFzlhnFOEDQBiomgK5crsnApOsXqOX8H3b0HETL8vY4vM49NZxkJtSn9wbbKoOV4zf4l8ZTuLwl+5pZzVoDkiOY3X32TOVPLwSApfNIoQBMkbrqQNzcy73DKklhumUBsDNZXHbM1wOKPAh+G2pumKyzyP46LGkjdw4cv5PxslDBISQlWNk/9aZFAsLioDgqpi2xRPsFR9zzTxzPnUNdiwfhjh/dT1fIOiWrX/BNMjo88L0Wrbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+2XYSl4mpJYa8fH689AmNJ7/fkGOad19+DPwD5u2no=;
 b=/AO6Qp0n3yIjHyUXHzbtBbRu/Ej361HxO6nTY7h0VvAqVhiTK54kZi3fqQH/50RA3PEny1NMBPDTdKh9rWNub3SSHZq57wbOPxmzLlZJXGEVkzBKb0dCm1sJEXz04BkSjw4swIR26/+PnoujwWn/BLwi2462lAfBeTn4GdDdQp8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 IA0PR01MB8240.prod.exchangelabs.com (2603:10b6:208:482::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.24; Fri, 19 Jan 2024 07:02:45 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a])
 by PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a%6]) with
 mapi id 15.20.7202.026; Fri, 19 Jan 2024 07:02:44 +0000
Message-ID: <c7ad2b9f-0ff2-4f08-a666-015284a289dc@amperemail.onmicrosoft.com>
Date: Fri, 19 Jan 2024 15:02:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] NUMA: Early use of cpu_to_node() returns 0 instead of the
 correct node id
From: Shijie Huang <shijie@amperemail.onmicrosoft.com>
To: Yury Norov <yury.norov@gmail.com>,
 Huang Shijie <shijie@os.amperecomputing.com>
Cc: gregkh@linuxfoundation.org, patches@amperecomputing.com,
 rafael@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, kuba@kernel.org, vschneid@redhat.com,
 mingo@kernel.org, akpm@linux-foundation.org, vbabka@suse.cz,
 rppt@kernel.org, tglx@linutronix.de, jpoimboe@kernel.org,
 ndesaulniers@google.com, mikelley@microsoft.com, mhiramat@kernel.org,
 arnd@arndb.de, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, chenhuacai@kernel.org,
 jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org,
 cl@os.amperecomputing.com
References: <20240119033227.14113-1-shijie@os.amperecomputing.com>
 <Zan9sb0vtSvVvQeA@yury-ThinkPad>
 <1cd078fd-c345-4d85-a92f-04c806c20efa@amperemail.onmicrosoft.com>
In-Reply-To: <1cd078fd-c345-4d85-a92f-04c806c20efa@amperemail.onmicrosoft.com>
X-ClientProxiedBy: CH0PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:610:cd::33) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|IA0PR01MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: 626fb682-a410-4c40-f603-08dc18bca2e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /5axF5t8qaO7Ghct689y3957hZIQ6knksQ7xsUi56cSsZTQJNYmfavYbJl+QqWfw5oYdVIxxsQtbIs/w/PdvraogqI2JCsK9torwcmBjiOtyOlALJp5ewLjRtfxk07nY34MA3sOPR9bisk31/U6oO8TxixtVhAfusajyeJM8bH4Fo+PKmDRYleMh3/o158SA2OcPmBe2HJJTv6EwqI5KihpvhAi8T9Rl3oKSWU3ijbn9PxgqmdEJ3mhVNuPHEzkA4n/SGMqN8EY0yTnIiCPT6clBU90H1kFRY89O6VTdhBXnxO/lHK42XOS5IjAeAs6ZvONmS2VqCvqmndKUfdfuuGGmM4MMvkzgJS6ZKlxoiDvwqs2T5SoPeTsB1D3UwKFIxXwsUDRhqlQu3UD8ybrT1ST8NKA21dosE0Q+ogcBk1RR9aZ4fHSTWYbTrmzSHuFSPukK1ugh11NywUClnbuurZ+GNx5ftTJUBHbDCw4XJOACrs4V9wGWSK2Xj2sEfbjwtiJs6j1X6Eu3jBtQiklHiJZKQhXtgPHjdYQelhAc5INMtDr2VJRmCP4pTQwSF5YM6RKTszDtEICmsW62dfVR005GIMkPZchY4Ka0N1rh6jU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(366004)(39850400004)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(478600001)(31696002)(66476007)(66946007)(8936002)(316002)(66556008)(4326008)(6486002)(110136005)(8676002)(38100700002)(83170400001)(6512007)(2616005)(26005)(107886003)(6666004)(6506007)(42882007)(83380400001)(31686004)(5660300002)(7416002)(2906002)(41300700001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzJybVNUZjc0SFNDdDkyWUNKVHZJVXlMc0ZtV0F1MW5aUDBjYXlHNWw5RzQy?=
 =?utf-8?B?TW1UcGowazJpU2hTK0RjRFRhRUtLQXJuaTJ0RURmd3RxdGdiTlJWQThZYWhS?=
 =?utf-8?B?L0lFZDhBWHhRT1R0MnIzVzJKWE5NZC9IemhSZ2NyWDlhVVdsbW9uYTh4dlZk?=
 =?utf-8?B?N1U3WjJsVU9JdmhsM1BBVUhlbm9Ma2xrdFp1NXAvRTlINzVIQUVWNlVkVVNz?=
 =?utf-8?B?ZU5ZMGVnQmhLMWwyY3ppQWJVdS9TSGFzQ3JzdW9tc2E0RWdTVnhPQlZqWkxI?=
 =?utf-8?B?QkxqQmFYRGN4OVg4MUsweDVKQWtOV2M2NW5VWnpTczJpcCtzN0hFbnR1czFs?=
 =?utf-8?B?RnN3ckZKR2RSMlBQR3F0ZkxSMVFyY29CNW5LYXRkUDNIOWhRb3diTVNHMkR1?=
 =?utf-8?B?TTdySlBFVm1KTStjQ3pHSWNJZzdJZ0paQlNaZ0M4all1UmpzTGUyZUFINmgy?=
 =?utf-8?B?TStaaXhTbzhPR2JSZEF5UnowWVh2dENLd2QraGQreUY0WTcrQWVuU1EwdmJo?=
 =?utf-8?B?Z01wdGptK0llMzRvelpZZEo2WElndWx3T0pNYytlb1BXaml1VCtQR3UyTFpv?=
 =?utf-8?B?OW9zUklUdng3Rmo0Vm1iY3pvenVwYUZoaGVoK2FLbHFIL0Y2NHdlb3RhZ0pa?=
 =?utf-8?B?TEE0N2VJdTVWWDkwdklHUHZHYVB2VVk2YWUwZlh0SjM2cWZDVWtlbjk3cXpi?=
 =?utf-8?B?aU1WaGFUV1B3OFB6WHBOT2MwaWhpQ1NkNWFXTUIyd3EvTCsxdTFQRW9UT3V4?=
 =?utf-8?B?Z3N0YldVWXJoa2R4UFZ2YXVQUmRES2h0NVdWNWRwMXBUOWtNdWs5Rm1ySlQ5?=
 =?utf-8?B?bWIzb2trcUFFMVpXdEZZMTBtVEkrMmd6Q0FxWExyVUhNMm83NEZaNnY0S0F6?=
 =?utf-8?B?dDRCK3FrWWxkd1R1RXcwVGVXZGVKU2VESENVaHBhTS9QMmR3UW5MSFdoM293?=
 =?utf-8?B?dWdxajE5bWlGRXFLYmQvYXQ4T1pmQjZ1aUNvSWtjNGNpRUR2YWh2aU1UM0d1?=
 =?utf-8?B?ZTc1ZzlXR2JCRFFuZUQxbTFFT2hBVTV6NVpBVEVvM0l3Y0lsbHhYNXo0RERk?=
 =?utf-8?B?b095Wmt5TGJKMmpxTktwS0dRZTFGdWR2MlpvdUYvTWdoUWxMK2xtMFdwUnYx?=
 =?utf-8?B?VnJlcUVqMzNNUFFCcUxMektFbGd4ekViYS9aV3lqSzhpNEVDWEpWaHN0MHNh?=
 =?utf-8?B?ZGorY0ROdWxlUHZLWm1pOVNUbmpCTlIxWnZvYk5PYjZIU0cyQmExQ1lvc2Nk?=
 =?utf-8?B?SUNzaHN1RUdvTUM2c0QwZ1pzVXhpV29KaVJzWGZqbkVNanVTa2E0dXl3bTB6?=
 =?utf-8?B?SzNkZmtYRTJWYnZaVnUrWDhLL0lUNkMybi9DV1M1Ym9wTDhKNGp2VG1JNVNt?=
 =?utf-8?B?M0sxQXM5aXphTVdTSXdIRkc1QkVNM2VjQ0J1ejBXdEtFT0Fod2dmNU81Y21y?=
 =?utf-8?B?T0luMGgyNU44UEFoU2tPU3JjdnZ1bGRSYVJLMys5MmQyNlU1MktKMmZHZUwx?=
 =?utf-8?B?Wjl4NWxGbi9ldW9YeERGamRsOTY3Smhua2o3QklGVXVzaXFOK0M2VEx3emdQ?=
 =?utf-8?B?ZTEyQVAzSFJFMnlyTCtLamN5d2dNZk9FQ2VVV1FaODdMdmorcHhMbjNwZzBB?=
 =?utf-8?B?NE9YN0ZEaU1LdnJjdkNwMXJtYVB2Mmc1Snd2TUVrNFlENXFrSE9LL3lHLzhJ?=
 =?utf-8?B?Umt3ZmRYWm9aakxqWUkwTzBSK2g1dU1aNWcwVzB4VkVnckh4WWFyNnM2YmUv?=
 =?utf-8?B?Z1cwZ2VMVkRGZTFQTHZOUmY3cGhEQmFvUHRaUXAwU3VRNG03bU9RMHB1VVFz?=
 =?utf-8?B?WEY2YlFITkR5NkVDdDhqbWIzNG5DcXoxWlFRYWpGQjN1YlhUMFNMVElSNlJk?=
 =?utf-8?B?clNNLysrS3VBR3BHdTNBSzRnMnRZVlV2ZEErZHhoWFRiY2cweXdUS09iRkEx?=
 =?utf-8?B?WG91NUtMS0lEWEc1MEhiV3RtcjlqK093Ui91SFMyaEE0ODVYSjByUTBCVE4v?=
 =?utf-8?B?NWsxVkk1RTlWdDViY1F1RUh2bTNhdzRoZ2dvZEVvNndRUnZiMTZLNHhZalJu?=
 =?utf-8?B?eExoRmdIUElVcmNiVG1wdCs5TzBSbzFVZjY2MTZJcWxoSEdBMW9BZ0ljOVE5?=
 =?utf-8?B?TmRyME9xdDVTUlhTUU1xdTdMM1h3UkU2dlliRmprcDVTN29zTzhucXJFRUFp?=
 =?utf-8?Q?XHmXj2LKbUgIW249gqufHHw=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 626fb682-a410-4c40-f603-08dc18bca2e8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 07:02:44.8603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2dgaVkCykNwQiGwp025k2ge4hFVNFjJNnLlXwZoqoB/F/2vulqsKgRPEIZ1srUXIf13/F7EVYJUw61xgN5KBGZPz56eDwyMrDSeN2ZpGzdLpiQAaLs9coK5z0wu9WFG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR01MB8240
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_230253_303446_8A08835B 
X-CRM114-Status: GOOD (  21.04  )
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

CuWcqCAyMDI0LzEvMTkgMTQ6NDYsIFNoaWppZSBIdWFuZyDlhpnpgZM6Cj4KPiDlnKggMjAyNC8x
LzE5IDEyOjQyLCBZdXJ5IE5vcm92IOWGmemBkzoKPj4gVGhpcyBhZGRzIGFub3RoZXIgbGV2ZWwg
b2YgaW5kaXJlY3Rpb24sIEkgdGhpbmsuIEN1cnJlbnRseSBjcHVfdG9fbm9kZQo+PiBpcyBhIHNp
bXBsZSBpbmxpbmVyLiBBZnRlciB0aGUgcGF0Y2ggaXQgd291bGQgYmUgYSByZWFsIGZ1bmN0aW9u
IHdpdGgKPj4gYWxsIHRoZSBhc3NvY2lhdGUgb3ZlcmhlYWQuIENhbiB5b3Ugc2hhcmUgYSBibG9h
dC1vLW1ldGVyIG91dHB1dCBoZXJlPwo+ICMuL3NjcmlwdHMvYmxvYXQtby1tZXRlciB2bWxpbnV4
IHZtbGludXgubmV3Cj4gYWRkL3JlbW92ZTogNi8xIGdyb3cvc2hyaW5rOiA2MS81MSB1cC9kb3du
OiAxMTY4Ly01ODggKDU4MCkKPiBGdW5jdGlvbsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvbGTCoMKgwqDCoCBu
ZXfCoMKgIGRlbHRhCj4gbnVtYV91cGRhdGVfY3B1wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxNDjCoMKgwqDCoCAyNDTCoMKgwqDCoCAr
OTYKPgo+IMKgLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4odG8gCj4gbWFueSB0byBza2lwKQo+Cj4gVG90YWw6
IEJlZm9yZT0zMjk5MDEzMCwgQWZ0ZXI9MzI5OTA3MTAsIGNoZyArMC4wMCUKPgo+Cj4+Cj4+IFJl
Z2FyZGxlc3MsIEkgZG9uJ3QgdGhpbmsgdGhhdCB0aGUgYXBwcm9hY2ggaXMgY29ycmVjdC4gQXMg
cGVyIHlvdXIKPj4gZGVzY3JpcHRpb24sIHNvbWUgaW5pdGlhbGl6YXRpb24gZnVuY3Rpb25zIGVy
cm9uZW91c2x5IGNhbGwKPj4gY3B1X3RvX25vZGUoKSBpbnN0ZWFkIG9mIGVhcmx5X2NwdV90b19u
b2RlKCkgd2hpY2ggZXhpc3RzIHNwZWNpZmljYWxseQo+PiBmb3IgdGhhdCBjYXNlLgoKc29ycnks
IEkgbWlzc2VkIHNvbWV0aGluZy4KCkkgYW0gbm90IHN1cmUgaWbCoCB0aGUgZWFybHlfY3B1X3Rv
X25vZGUoKSB3b3JrcyBvbiBhbGwgQVJDSHMuCgoKVGhhbmtzCgpIdWFuZyBTaGlqaWUKCj4+Cj4+
IElmIHRoZSBhYm92ZSBjb3JyZWN0LCBpdCdzIGNsZWFybHkgYSBjYWxsZXIgcHJvYmxlbSwgYW5k
IHRoZSBmaXggaXMgdG8KPj4gc2ltcGx5IHN3aXRjaCBhbGwgdGhvc2UgY2FsbGVycyB0byB1c2Ug
ZWFybHkgdmVyc2lvbi4KPgo+IEl0IGlzIGVhc3kgdG8gY2hhbmdlIHRvIGVhcmx5X2NwdV90b19u
b2RlKCkgZm9yIHNjaGVkX2luaXQoKSwgCj4gaW5pdF9zY2hlZF9mYWlyX2NsYXNzKCkKPgo+IGFu
ZCB3b3JrcXVldWVfaW5pdF9lYXJseSgpLiBUaGVzZSB0aHJlZSBwbGFjZXMgY2FsbCB0aGUgY3B1
X3RvX25vZGUoKSAKPiBpbiB0aGUgX19pbml0IGZ1bmN0aW9uLgo+Cj4KPiBCdXQgaXQgaXMgYSBs
aXR0bGUgaGFyZCB0byBjaGFuZ2UgdGhlIGVhcmx5X3RyYWNlX2luaXQoKSwgc2luY2UgaXQgCj4g
Y2FsbHMgY3B1X3RvX25vZGUgaW4gdGhlIGRlZXAKPgo+IGZ1bmN0aW9uIHN0YWNrOgo+Cj4gwqAg
ZWFybHlfdHJhY2VfaW5pdCgpIC0tPiByaW5nX2J1ZmZlcl9hbGxvYygpIC0tPnJiX2FsbG9jYXRl
X2NwdV9idWZmZXIoKQo+Cj4KPiBGb3IgZWFybHlfdHJhY2VfaW5pdCgpLCB3ZSBuZWVkIHRvIGNo
YW5nZSBtb3JlIGNvZGUuCj4KPgo+IEFueXdheSwgSWYgd2UgdGhpbmsgaXQgaXMgbm90IGEgZ29v
ZCBpZGVhIHRvIGNoYW5nZSB0aGUgY29tbW9uIGNvZGUsIEkgCj4gYW0gb2FreSB0b28uCj4KPgo+
Pgo+PiBJIHdvdWxkIGFsc28gaW5pdGlhbGl6ZSB0aGUgbnVtYV9ub2RlIHdpdGggTlVNQV9OT19O
T0RFIGF0IGRlY2xhcmF0aW9uLAo+PiBzbyB0aGF0IGlmIHNvbWVvbmUgY2FsbHMgY3B1X3RvX25v
ZGUoKSBiZWZvcmUgdGhlIHZhcmlhYmxlIGlzIHByb3Blcmx5Cj4+IGluaXRpYWxpemVkIGF0IHJ1
bnRpbWUsIGhlJ2xsIGdldCBOT19OT0RFLCB3aGljaCBpcyBvYnZpb3VzbHkgYW4gZXJyb3IuCj4K
PiBFdmVuIHdlIHNldCB0aGUgbnVtYV9ub2RlIHdpdGggTlVNQV9OT19OT0RFLCBpdCBkb2VzIG5v
dCBhbHdheXMgCj4gcHJvZHVjZSBlcnJvci4KPgo+IFBsZWFzZSBzZWUgdGhlIGFsbG9jX3BhZ2Vz
X25vZGUoKS4KPgo+Cj4gVGhhbmtzCj4KPiBIdWFuZyBTaGlqaWUKPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
