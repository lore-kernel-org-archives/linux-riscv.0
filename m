Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6665E95A61
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 11:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sg8p5eLXgYazy8okld4XVYEmIwJJlI6hfXqmWH0DvqI=; b=VgXymxExC176sNOrG6XDVE8a1r
	4vzzGru78zxsF1PCR5Lc1QB8aKFFWD9X+WUkKAanFD4BO79F9PLXfjajWrddzfYPIF8e2UusrFej4
	8jvhY4A/lmZktRd6RoGr5ceTS5KxXNoPM+BnCYtxeIEIkkh+hkI+O2WuqohN454qrZAN2/6losoVV
	5z30DASUpBEzIj/BUCAkXqNs0Vf5Z6DNIX7VNlzKtYMJX2evoIAPPDpKAsvb2DSp4eTPT2GYiul/S
	sdnHe2QpbM29SrzXehOrvDOBvmZ7G3zw9l6ic+Kl5vJpIfHC+qpyBEe3yeYvlANlYXfk+U/GDt4Ni
	0G+rSQJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp5GR-007UTv-08;
	Sat, 07 Oct 2023 11:14:31 +0000
Received: from mail-bmxind01olkn20825.outbound.protection.outlook.com ([2a01:111:f403:7011::825] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp5GN-007USa-2i
	for linux-riscv@lists.infradead.org;
	Sat, 07 Oct 2023 11:14:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjSaJ/yW8pdw+n3RtgRRty5KqYldMryMMusILjHnLkHxra3agoCyPDMbzm8KvsUXPlNz3urvPAPdpjpM8Yx5i2dM1LNFNBxIEMiQR/ehpAaNcIZiyQ4zzrQYdlxCJxnHgFc91Uv1QR3VmduqbGOJEqE5gWZk0dJStQXoFdjBw84CjBRljRR5qKpIWh25Hqpzt3/n2VLPMonD5/3KuUVeoTAzwZKDg7J1ThA9ldh84E2VFsoLzHMTgmMF4rpNq5ImU3M0X8bHmUSljULCkqXVOS0rlaK+qnisdpTVeREXHhJjthA1OVFix/6LtLIJb4AGX8N9Cxe/3J8sLf9T/d3GhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkGimYAaL5DniDRqPLP5+9R8Jsx9B0X/D9yjXJIIcPw=;
 b=hURdKkjXiNMjmfsNpjMlKLZ1k2Ws86Nz57dqkv95Gu6rBB5p6ombwKM/9HMf7ZZ6bLdTbKG1DGwbAq8xU2lwZTDqyXxn1mfa0iyJFaP7XswTTZleODXvqx1bEvsxcewe4WWvnpS/kpYvTj4fVqUAIJ6mI4ZrdpqwLJ06pF4UFmRO2gNgkDBhJqffOXFGF3KNuX3KvLsHVyacD9ziLNBXHUHb/ju93EoLEzNoVqwXR3/nsgKy392OBXPINPV5WcjxgZ2TKUm21QKictwtMldh8+gsOg3GoZFW8/Sua/CeBBrP2ieOUXs1m/tl/m93ydobZkZ2VCTaPvJRQun643jkng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkGimYAaL5DniDRqPLP5+9R8Jsx9B0X/D9yjXJIIcPw=;
 b=ubALS8q/f0U/waKApNtvLH2sTrR748hiPsT0cDZ+ofUs0tsfjWMKX73mrKBCq1+9jYtKMksmP9KHapbJb5t1nr/3BejoOvKsSwVcnBTBkNdm7fL/8+t3RBoqvTFmZr7fV/do+lBwy1tPl22nt6+Vi4LUwAuCmO6y9iUDphtIaPMQP+ixSavlhsL9vyL7YMtp+S3Ly3hPF2ocJLOzfs0BBMueZUgleGaNg9DGK4FOgwMoP8qEWjU3aN18eypsfONj+ijPbOWgF8kzt/4bQXO3dy3mP75EhCvWHQucH45VLR4gVSQkfiRUQxveQYuEYrXNPl3KtfRCfv7fYAyeC2cGFQ==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 PN0P287MB0849.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:16b::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.41; Sat, 7 Oct 2023 10:58:59 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7%3]) with mapi id 15.20.6838.040; Sat, 7 Oct 2023
 10:58:59 +0000
Message-ID: <MA0P287MB0332F80102F534CBD7412ED3FEC8A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date: Sat, 7 Oct 2023 18:58:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/10] Add Milk-V Pioneer RISC-V board support
To: Conor Dooley <conor@kernel.org>, Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, devicetree@vger.kernel.org,
 guoren@kernel.org, jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org,
 xiaoguang.xing@sophgo.com, apatel@ventanamicro.com
References: <cover.1696663037.git.unicorn_wang@outlook.com>
 <20231007-grasp-retake-0463858c13df@spud>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20231007-grasp-retake-0463858c13df@spud>
X-TMN: [KtZz71w8Dw4BgZd0Fi4DC1EiG3EtyIvg]
X-ClientProxiedBy: TYCP286CA0285.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::20) To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <acdb4c08-79f6-4a22-9699-641027b566ca@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|PN0P287MB0849:EE_
X-MS-Office365-Filtering-Correlation-Id: 4af105a5-b54b-405e-e479-08dbc72467ec
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rxmSH58G2ncS7sEccZK7pm+7ek3eWSFUXaqWkJWcdYO5koK0yi3VBDJ16L3QRXiDS0tMm3Cu5ojKt4UgGxal06VpEvwX085ObvTU79IPg0iLw5j2q8+xXB4AsRoOWBh9WPAdOJ8GeyH9yo5m0R1NKYPXM9NqmAHCkhSVqQfGKl7+2u6eYa1yNID69i5eeZn7w7UTR1ZghaB9mmo90y3cA26B8h8ai7va1gVlKTc/JpK/TsXt7Izd5uifoMJVcuHLaNc+e8gha055ksS2ZN2j7IYzsErqKX2Ckoxv2Q1hFOeNH3Nz5koCHag/iAYoEN456TjUao5JXBch3j+Nd+lM9dLfVM57/qSUDLPuYWeL1Ik/IzTc43qg6AmSIOpKNpQnOsH40Or/EDA9OQivxonYC/C1HTfEAyTyCVzQOdk4fNL88F5iBnDCL4ndl97X5lVX8S+9K0jmOa7lzSr8xAea4dz/O5GRtKq7lZfEoTRPs5x1SHJTgBbnrZgYbBsJhW2jfzSggQ4Ze8asEUsY649X3EVhZJqu/c5EsrhLhf2qlMeT276MmYPHrtlenjyFF5E0
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KytoWlFEdDBndURHdXVWRCszYmxGcWxjWnRtbE1LdWl6SEpjamhja2JFSzRI?=
 =?utf-8?B?YjJZa1pSVUdabStpVDNvdjkxN0J4NzZVL1lHQUdnTEI5VkoybXB3YnNDRHBE?=
 =?utf-8?B?Z1FhRmFHNHE4dU5OamM5cWNjZk14YnpGOC9SSlJLSVRtVWpIQzJBTTBCZDBP?=
 =?utf-8?B?VlhKdVk5cUp0UTFIMHZZUWNDU0xGS2VCSTlaVFRvNDUxOUx4M2hMZTN3SGpR?=
 =?utf-8?B?L091VjB3MExwdUpYLzdQL1JENklkYit3d2p3aXNNQ3YxdUdLbXpBU1ZlT2pP?=
 =?utf-8?B?WUlERkJLUnl6Z2hwOG1aVStTSnpGN1Yrakl6SnRSdFJKWWVObFlzckYyYWxl?=
 =?utf-8?B?RTA4bHdsdzkvMk81ODFHU041VitMZDFDUjZCY09adTlsa1NNMjNWcTdqM3ll?=
 =?utf-8?B?MHN2aXM4cU1vdi9XZVNUMnVzdUJ0SkNpMnBURnZKdnNPV21ldndSSFFSM1N5?=
 =?utf-8?B?d1owY3gyaGtyYXljakFYb3JlTnI0czRnQis0Vzl2UGZHeFJ2NllBb25IcDR6?=
 =?utf-8?B?cDJ3MXJINEEzOWh3THNKQmVkQStFK2tabXlzUldFdkUyMG9ZTmdMVkNOdDNU?=
 =?utf-8?B?RElVZTB3QVpqTFJxSDF1dU10N2lRUUdhRWNIVk9lV1V3UnNjSUZoK3R3d0Ew?=
 =?utf-8?B?NXpqWE9Na0pOajVtQzMzUjE1UGprZXpvZFhURksrUVdhOU95VjRkZFAzNnM5?=
 =?utf-8?B?ZDFZN3VHWUxjcm82c1NDUjh5cnl1THNUcXpPbWg0aVFuaFMvWWFneU1hVUlQ?=
 =?utf-8?B?OUhtSHh5SlFENmZpTFV3WSt2SGxla1ZWSzEvbC92T1BBUkh4bkhqUVhiblVL?=
 =?utf-8?B?SE9EQllLVU1QSGhseXdRK0ZFTk4wOFpQNXI4K2R3MmlZektqMkdMWW5tbkR2?=
 =?utf-8?B?ZXdRdk05ejZpWS9NRzE4bXJTTm0zUU1idE95YXlSS3g0V0NJY3lwOUVwZzVo?=
 =?utf-8?B?NnBZMzFKeXpsbHVQbWdlRXB5TUtUMHJzWFhZSTdrbmFxa29GQ2dXOXpkamhN?=
 =?utf-8?B?bVhRZDJvNDNIalFiK1MzWS8ySzdlSHZEd2o5eEU3UFJ4NWx1azgrM3EramVo?=
 =?utf-8?B?cEdFZUhEOEtMR0JHR0FCazc1Z3lLampnOE8xVFpRMS9KQXkyOGMzSXVZa2x3?=
 =?utf-8?B?L1AxbGsyTHNTTUlOa3B2UVRhUFdnaHNLSS9aVmhuOVlUVDdxTFhCTmhCRU1q?=
 =?utf-8?B?aTVUczA2NkxWd1RoYS8xVFdhWXNaUXhEd1lEVHhSRlJGc2FtSGIvSDRlcFRa?=
 =?utf-8?B?VDN2L2ViWG9OaHZ3SllCb3dzZzRvWEFEblFsRGJtR05zeDF5YXlQWTVhOThB?=
 =?utf-8?B?alA3NFYvT1VBblFRLzI4aE5rUVg0V3ExMm5FenBPNEc0Q2RhTVo2RlJtQ0NO?=
 =?utf-8?B?djRDckJIUnJuek82SnVoWk5HdEI3U21tNHpuOVAxUkg1YS9KZkZtQkZyci9M?=
 =?utf-8?B?dWx6YlU4dEhYNUtzZ0ZzZWFtRC95SWpOMjBrc1pwWTRxaWI0aVY3bXJUUDFS?=
 =?utf-8?B?M1RrdDB0OVczQTJ3ZlBhcDBJd243ODgvRW1CUzVRdTF0N1l4UURZVWVsSVNF?=
 =?utf-8?B?eitwUXlDVnlrRFA4a0E0S2NxK2ZXOWtlY0xuQU5rYmsvbVpmdk9oZTZZSWlz?=
 =?utf-8?Q?lxLAZetCoYKBJ+wdFlDg4jh+k5zGOYUBwEwkbUiAxfyc=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4af105a5-b54b-405e-e479-08dbc72467ec
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2023 10:58:59.1040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0849
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_041427_890625_5BD1D850 
X-CRM114-Status: GOOD (  13.27  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 2023/10/7 18:17, Conor Dooley wrote:
> On Sat, Oct 07, 2023 at 03:52:04PM +0800, Chen Wang wrote:
>> From: Chen Wang <unicorn_wang@outlook.com>
>>
>> Milk-V Pioneer [1] is a developer motherboard based on SOPHON SG2042 [2]
>> in a standard mATX form factor. Add minimal device
>> tree files for the SG2042 SOC and the Milk-V Pioneer board.
>>
>> Now only support basic uart drivers to boot up into a basic console.
>>
>> Thanks,
>> Chen
>>
>> ---
>>
>> Changes in v5:
>>    The patch series is based on v6.6-rc1. You can simply review or test
>>    the patches at the link [7].
>>    - dts: changed plic to support external interrupt
>>    - pickup improvements from Conor, details refer to [8].
> Did you? I only see them partially picked up. I'll just replace patch 8
> with the patch 8 from this series I think.

Yes, only the patch 8 of this series(v5) is updated for plic node. For 
other patches, I just cherry-picked them from previous "sophon" branch.

BTW, what I did this time may be a bit redundant. I would like to ask, 
if I encounter a similar situation in the future (that is, only one 
patch needs to be modified, and the others remain unchanged), is there a 
better way to submit the patchset?

Thanks,

Chen


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
