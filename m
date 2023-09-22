Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D50CD4F2B
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 07:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GpKTC+QfwQyNCqbz+YO73prpgInYIUUmmgHfO6yNqHg=; b=jSd6bDA1kxg4n0hYUf0n03fXlY
	TpHpb7RreqO2JfhK37S+9ryITK6d0x8/9eHFuvFmGcp4+uxLzzFQiixxB4cwoaSGKnJ7ReudxanEw
	oBMz0jXnoLhvNXhMjo/iERw91YYuUo8akxAkQiCpdtkJTaOfPsEyuGVEtuBWm/jfqZ6hfdQtqC/PN
	iCfNSfdwSdQWaQKYyXEOypC/wREwN05DlfpRJMYvq07t6LnIXAMdF8ydgv4nAUTUu+urn1EsY3Ad6
	Vyr4cXI8RNz4G8yyI2NwAE10WZTZ68yOlxaAAfhiP8FaXrsJ1XL1YkF1gvvb00jKHiehV8tJ3Iv2g
	/mvhbi1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjaux-008G2m-2Q;
	Fri, 22 Sep 2023 07:49:39 +0000
Received: from mail-bmxind01olkn2082f.outbound.protection.outlook.com ([2a01:111:f403:7011::82f] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjauv-008G1B-1B
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 07:49:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVgLguEGPSxSapNOjSeW0qK+xe0yoy42tP6RFlOuvym/CyVpuYlogMeUBRj3qIQGaYw5KKPL6lNkYRSoZOe7TTdj7cODmI2SH3GDXFvCY0OqKNypQEt6PYRhWYpusRN7ZJdpZM0On1wchBVJUR7+WI5bZwNEIxhvummDwzHJsNw6dTlDtGmZzh6gRQJLLAMsR4RA8uOm6I5OtkdncSQOcymOvb6dFEABQk/bHbiZh1lZYpsVj/3HtSM0vyf+qhY727LUvvwxZh8/u+NZ88S+x6NZZBuWOZpy4SXNBjsmX82y6McPm/9EDDTCs6Ui7UaSUegvSrzUWRLSA4sn1Qrtkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwrXXixeqa8TiVYbZNnZHkxKS6HE6Vomyn0sTkyDB6o=;
 b=P3ali8IWuxLWJRO5wPjgPf/C0y1VR4dRrJ65lU099Aihw69g0bc68XUyLuQcNaJpbPrw/mTEcIMwjYWh1V+xnY9Mq62x9h0ECD2/c08+1lT5hYSHm7hbIJK9JDeUnNyVNj5KTJhS9pHtl+ftmEYeo8Qoh80/EthiqMGqmT6aG1+u8KUzX59SksCBYtdSYNM3igyVLr4CzHOyAqr8w5RKiOKRId14++nfCfhZOADG2OEV9Sq9pmw256bUg7TKNTZ4kirOjhMFLFOLhro4Hl3treD0JjB9cl1e5N4sSgqGVoAQwmd27LpQSqqGAe/s4+sqbwb1lufbAM8uJ8u+s0Axww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwrXXixeqa8TiVYbZNnZHkxKS6HE6Vomyn0sTkyDB6o=;
 b=QU0WiYMZwrGFGLixzZ7/una0+UHmwtSqKoQ2jupX94QaR4UAMhh8qZhgy37qIpgkwXBBTWeijTz34/IsO95si4T4hKkXi6mVlriDiK3+C5nwTAYcZKUsOOnAl50ydbqOynniCOs322b6n2BjefTP9HHQlZiwSxQFNmT0g/nV7enZAtyTLwpcdVRT5Ly7MmI7kbRI0SYVgdYHzpQ3QdCcZ7p/lGARs77OD7sO4hTrL7COUnSo2N1EfeWZwoMU3P8tP/ctqbnCSaMFFscfCfIrrX/tRD5r8mUiz1uTH1fCFLg3fyYklvzBa6E6cFvAt62mbdHiC1/SJTuV50W/YRwg5Q==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 PN0P287MB0847.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:144::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.23; Fri, 22 Sep 2023 07:33:21 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7%3]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 07:33:21 +0000
Message-ID: <MA0P287MB033245E15897C496789A0979FEFFA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 22 Sep 2023 15:33:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 1/6] riscv: dts: microchip: convert isa detection to new
 properties
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org
References: <20230921095723.26456-1-conor@kernel.org>
 <20230921095723.26456-2-conor@kernel.org>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20230921095723.26456-2-conor@kernel.org>
X-TMN: [M7kct4xhIzbUyDF+xIAVGP57xHxULrM5]
X-ClientProxiedBy: SG2PR03CA0103.apcprd03.prod.outlook.com
 (2603:1096:4:7c::31) To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <37741f59-7c22-4474-8fcc-6c53ca3fc971@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|PN0P287MB0847:EE_
X-MS-Office365-Filtering-Correlation-Id: 373cceee-48b3-41ed-687b-08dbbb3e318f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lwz9+l016jKcfqK/HWSjf4r8oQ0m417VMAKR4vimRO2NbBR+7Mct4XutK5ZGjWSCUg3qdg8zzHJOwMOJAoxt7a9geGzivSs5n4gA+6Jx4TW+ok7LKQE2wU+8G+oiHlyPmoo1yRIZ8Ot2EgCJT1/m2sLWqcm1v4PxgpKhw2PFWr3muYPoI+LUXkZ/8gMwh7Idgqe9LKoVYVoESmm7ghc+xxfiCtgvcmkID0P/UysM9SG3yj92L/2YT7NUo4cIlmqsXvTklk4ubeCtKOL8q0MvjZfN4uSNG3mHhJeqbO0iBdy+X9ocQsH8519RJ/3kM64FkDl7ln/4Etgph3nupv+fHp56Q1dsCVZWRFOAiV/CLATngHc24ZIxnnFouQEcdztNcDSGL/3mu2MOWLCNb98aEJl8VThLgbOF1HnjAqybccNyFInOsZVdUhrOfnkUJDpHCw3UF5xxbR2KgS9jo6GQVFDyZT+2MhkSmMi1KfZagynNpJDNwoiPsijgCK9iwdDeqFQ03/S0p9p8JvKfpNEPVXliQhx2gcmFIMobdLB4+yadlPWCBUHjOerbhMj4dEmu
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2xzaFh1UTNBWHV0YzFQbHdrMklJSVJrMzk3d293SFJqSEs0dGpLRFA3VXVB?=
 =?utf-8?B?R09QbTJ0cVZONFV2aHBBV3hxZDl5TGFPbERNTjQ4QTlCV0svRzVqQmpSTTFD?=
 =?utf-8?B?NjlvbDRpUlI1R2VlK081c3lJcFBCWHNycXgyemRiUnRsaUxTL0JiZEVnZC9R?=
 =?utf-8?B?bE5jQnEvd1h3Ulc5bU5IQW9XVGhIeDRBa2ZnQkp5TXBQZFJJRUlyeWo2elZW?=
 =?utf-8?B?dmJSK3JKQUZBa3NsdGo1RkRlZWZOYjFlRG43b3RTNm5WTVhSRnVSWkVGSC9P?=
 =?utf-8?B?QklUR09lVUFEa3RQK2k2ZDltMXQrdXZpc3kvdWFUd05NaFlhc0k5U24vWkl1?=
 =?utf-8?B?ZnV5Q1JRS014R0JFbmFEOXRsOUZ3bHlyU2tidXA5K3BVQzZWVlJHSU1mVVNq?=
 =?utf-8?B?K2VoOEg4WFRGKzFpQnpDTWlydGVWOTE1bWxEdTlabGVLazRXSEUvSTVDazNn?=
 =?utf-8?B?OWt6Q1JIakVOME5XOVJ5a210Y00zUjc1RGRqZ3ZDWGZPWmdMV21xK3prZVdM?=
 =?utf-8?B?dXpudmZ6alhHa3BtUTkvdXZ4NGlOSmMxTWowanJxSk5kaG03ZEFzVXkzdXJN?=
 =?utf-8?B?Mm93b3NKWlczUENRR2x4c0hVa2FLaGxNdStMaWZucU9NMFI1Y1BHejhCUU9R?=
 =?utf-8?B?TURNbkF0a0gyODZWZTJSZEZ5djNRTDdGTGFsOHl6dlFocFgxTkFXMnVkbzhM?=
 =?utf-8?B?dk56dnVsejBOcm9Kc1Z2U083QnNEUkhBeTEwamoyTmk1NUY3ZTY1VldaRGdL?=
 =?utf-8?B?RDRwT1ZkTmtXYjVnK3hYOHIycnF4b1l0WHY3L01YdStTNS9hdVRucEZGVEE2?=
 =?utf-8?B?Rm91dGpyc3N2M3ZCam51bWcva09oQnZOdG1md0JDSk0wRmhOcUgxekFvN28z?=
 =?utf-8?B?c2RKS2NTMzV6d3lxVGdURWZRc1FCK0NSZE13T2IwMjdGbSs2M01NRXFIczhv?=
 =?utf-8?B?Y0NQQUIwMkphdzVYZ0NER2I1dUhGZ2p2bmRBR1duRHhBaS9jLytvU1kwR2lx?=
 =?utf-8?B?S0JlbkRYRHhzblI0QkQwMnkxVEhFSkhqeTBVSEkrNmRDNlBkM2xjZmVkNjVX?=
 =?utf-8?B?WE5uSlhJVWZ6ZnJTWXVQQTlOdG1keVZXNU90NDR3d08yeUNQd082U2tsMmZC?=
 =?utf-8?B?Nzd6V3l2OEtVaHRUU3hhRnI0QjJQRjFWaGZ6RVA3QnhSWWsyVXkvekpGOGFY?=
 =?utf-8?B?UjY2bjN0RktrWlpLc0JXVTJHcHYzdWdIczNMekw4ZGFHVjZ3MUF3T0htYWxx?=
 =?utf-8?B?U2hEVm0vTkQ3RTJmZFZiRmg2UE0vNlRuWkFPUlJjVk1abzJieEkvZVNxWjlR?=
 =?utf-8?B?eklXdlcxWU1NWjR0RU96cElXVHhFR0RSZzR3blMyVDZlSjlIVjlQWGVSekFl?=
 =?utf-8?B?a2RvaWRhallQbWJjdHEwbUUwbUdhMEdDT3NaVEZ0L1gvTmJ4alFEb1EwdVdj?=
 =?utf-8?B?UDdkbWpwN1NGcUZTNy9nSzBvL3I5VjlTWlZUaHR5WEFFampKZjZRVEliT0hp?=
 =?utf-8?B?ZkxDaFREWWZ5Umk3MmoweWhpdUl3R2V4RUZxNmY4NnhXRmVlOCs2ZE4vSHBt?=
 =?utf-8?B?Skg5OHZsV0FHekhyR3FidlY5QmxCVXhvYmhNckFGRDQwRmVGd1NINDJicHlC?=
 =?utf-8?Q?tcDwmlZIAspTgX8iqmjQ605Yvt+tAd4AJoTSxaGu43K4=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 373cceee-48b3-41ed-687b-08dbbb3e318f
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 07:33:21.5185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0847
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_004937_413240_0175A062 
X-CRM114-Status: GOOD (  11.16  )
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

CuWcqCAyMDIzLzkvMjEgMTc6NTcsIENvbm9yIERvb2xleSDlhpnpgZM6Cj4gRnJvbTogQ29ub3Ig
RG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPgo+IENvbnZlcnQgdGhlIFBvbGFy
RmlyZSBTb0MgZGV2aWNldHJlZXMgdG8gdXNlIHRoZSBuZXcgcHJvcGVydGllcwo+ICJyaXNjdixp
c2EtYmFzZSIgJiAicmlzY3YsaXNhLWV4dGVuc2lvbnMiLgo+IEZvciBjb21wYXRpYmlsaXR5IHdp
dGggb3RoZXIgcHJvamVjdHMsICJyaXNjdixpc2EiIHJlbWFpbnMuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IC0tLQo+ICAgYXJj
aC9yaXNjdi9ib290L2R0cy9taWNyb2NoaXAvbXBmcy5kdHNpIHwgMTUgKysrKysrKysrKysrKysr
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvbWljcm9jaGlwL21wZnMuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9k
dHMvbWljcm9jaGlwL21wZnMuZHRzaQo+IGluZGV4IDEwNDUwNDM1MmU5OS4uYjFmODczZDkyNDZj
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvbWljcm9jaGlwL21wZnMuZHRzaQo+
ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvbWljcm9jaGlwL21wZnMuZHRzaQo+IEBAIC0yMiw2
ICsyMiw5IEBAIGNwdTA6IGNwdUAwIHsKPiAgIAkJCWktY2FjaGUtc2l6ZSA9IDwxNjM4ND47Cj4g
ICAJCQlyZWcgPSA8MD47Cj4gICAJCQlyaXNjdixpc2EgPSAicnY2NGltYWMiOwo+ICsJCQlyaXNj
dixiYXNlLWlzYSA9ICJydjY0aSI7CnNob3VsZCBiZSAiaXNhLWJhc2UiLiBUaGlzIGFwcGxpZXMg
ZXZlcnl3aGVyZS4KPiArCQkJcmlzY3YsaXNhLWV4dGVuc2lvbnMgPSAiaSIsICJtIiwgImEiLCAi
YyIsICJ6aWNudHIiLCAiemljc3IiLCAiemlmZW5jZWkiLAo+ICsJCQkJCSAgICAgICAiemlocG0i
Owo+ICAgCQkJY2xvY2tzID0gPCZjbGtjZmcgQ0xLX0NQVT47Cj4gICAJCQlzdGF0dXMgPSAiZGlz
YWJsZWQiOwo+ICAgCj4gQEAgLTQ4LDYgKzUxLDkgQEAgY3B1MTogY3B1QDEgewo+ICAgCQkJbW11
LXR5cGUgPSAicmlzY3Ysc3YzOSI7Cj4gICAJCQlyZWcgPSA8MT47Cj4gICAJCQlyaXNjdixpc2Eg
PSAicnY2NGltYWZkYyI7Cj4gKwkJCXJpc2N2LGJhc2UtaXNhID0gInJ2NjRpIjsKPiArCQkJcmlz
Y3YsaXNhLWV4dGVuc2lvbnMgPSAiaSIsICJtIiwgImEiLCAiZiIsICJkIiwgImMiLCAiemljbnRy
IiwgInppY3NyIiwKPiArCQkJCQkgICAgICAgInppZmVuY2VpIiwgInppaHBtIjsKPiAgIAkJCWNs
b2NrcyA9IDwmY2xrY2ZnIENMS19DUFU+Owo+ICAgCQkJdGxiLXNwbGl0Owo+ICAgCQkJbmV4dC1s
ZXZlbC1jYWNoZSA9IDwmY2N0cmxscj47Cj4gQEAgLTc2LDYgKzgyLDkgQEAgY3B1MjogY3B1QDIg
ewo+ICAgCQkJbW11LXR5cGUgPSAicmlzY3Ysc3YzOSI7Cj4gICAJCQlyZWcgPSA8Mj47Cj4gICAJ
CQlyaXNjdixpc2EgPSAicnY2NGltYWZkYyI7Cj4gKwkJCXJpc2N2LGJhc2UtaXNhID0gInJ2NjRp
IjsKPiArCQkJcmlzY3YsaXNhLWV4dGVuc2lvbnMgPSAiaSIsICJtIiwgImEiLCAiZiIsICJkIiwg
ImMiLCAiemljbnRyIiwgInppY3NyIiwKPiArCQkJCQkgICAgICAgInppZmVuY2VpIiwgInppaHBt
IjsKPiAgIAkJCWNsb2NrcyA9IDwmY2xrY2ZnIENMS19DUFU+Owo+ICAgCQkJdGxiLXNwbGl0Owo+
ICAgCQkJbmV4dC1sZXZlbC1jYWNoZSA9IDwmY2N0cmxscj47Cj4gQEAgLTEwNCw2ICsxMTMsOSBA
QCBjcHUzOiBjcHVAMyB7Cj4gICAJCQltbXUtdHlwZSA9ICJyaXNjdixzdjM5IjsKPiAgIAkJCXJl
ZyA9IDwzPjsKPiAgIAkJCXJpc2N2LGlzYSA9ICJydjY0aW1hZmRjIjsKPiArCQkJcmlzY3YsYmFz
ZS1pc2EgPSAicnY2NGkiOwo+ICsJCQlyaXNjdixpc2EtZXh0ZW5zaW9ucyA9ICJpIiwgIm0iLCAi
YSIsICJmIiwgImQiLCAiYyIsICJ6aWNudHIiLCAiemljc3IiLAo+ICsJCQkJCSAgICAgICAiemlm
ZW5jZWkiLCAiemlocG0iOwo+ICAgCQkJY2xvY2tzID0gPCZjbGtjZmcgQ0xLX0NQVT47Cj4gICAJ
CQl0bGItc3BsaXQ7Cj4gICAJCQluZXh0LWxldmVsLWNhY2hlID0gPCZjY3RybGxyPjsKPiBAQCAt
MTMyLDYgKzE0NCw5IEBAIGNwdTQ6IGNwdUA0IHsKPiAgIAkJCW1tdS10eXBlID0gInJpc2N2LHN2
MzkiOwo+ICAgCQkJcmVnID0gPDQ+Owo+ICAgCQkJcmlzY3YsaXNhID0gInJ2NjRpbWFmZGMiOwo+
ICsJCQlyaXNjdixiYXNlLWlzYSA9ICJydjY0aSI7Cj4gKwkJCXJpc2N2LGlzYS1leHRlbnNpb25z
ID0gImkiLCAibSIsICJhIiwgImYiLCAiZCIsICJjIiwgInppY250ciIsICJ6aWNzciIsCj4gKwkJ
CQkJICAgICAgICJ6aWZlbmNlaSIsICJ6aWhwbSI7Cj4gICAJCQljbG9ja3MgPSA8JmNsa2NmZyBD
TEtfQ1BVPjsKPiAgIAkJCXRsYi1zcGxpdDsKPiAgIAkJCW5leHQtbGV2ZWwtY2FjaGUgPSA8JmNj
dHJsbHI+OwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
