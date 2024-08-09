Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002D0C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Aug 2024 06:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:Cc:References:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PICYX/m6vAD3kq9/9hy/2H1UUuQET43ZMlqz8o0UBLw=; b=OQte/cKVCVx16Adqff0vl5I9C2
	BBzL0etLhCSapgUZo0+gxH5uQtnPvgPv89QmJKhHFvILhYoLvrw6IsIK0o38FYnkAV6yKgId+pGXf
	VvF0lNmKq1zvWSu0KdSy0aJTgYUo4BUKcOQwH9+rcS1AM1dQgaN/aC9ZQ9kAmbm1xTDBcm59+T591
	KWKnHIe7lQF2F5+ioyXFnyQM70Ln7/oU1/38RdFtOu2Jsh7k7wd3qtLPXagmKL7/APjloBZXie4Ki
	kv3dJjFxPxU9bIOB5mEIiwrSlkufhYhI+JfjfLbK7COgQU9eVFZdws6Ch1lAGQQ8S8QLN8JuNCa6c
	9AQvHhwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scJ5c-0000000AR17-3RZf;
	Fri, 09 Aug 2024 06:27:04 +0000
Received: from mail-bmxind01olkn2080b.outbound.protection.outlook.com ([2a01:111:f403:281c::80b] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scJ5Z-0000000AR05-3nDb
	for linux-riscv@lists.infradead.org;
	Fri, 09 Aug 2024 06:27:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1wWO6RskEy6zNJ0WEsbufezyYBQntbVBSWij6ZzW24UjuTxfUXmZhZIRXSNH0HpMfQIDVdhSnBfqJecSGPCP/AbTZZoy3e95zkD6l6AZ1W4+yqx3rGvJHTOpoISU1zgrwuKD5Mw95mdTLpOmmdkvkY6/JRL9W+dOQpW4+ehawV6e9FBus2ELoVvhVLKO1B5RIe9BG7LeZgAl3qM0UkmOoVpTgzHJPQ7hrPNJ6brPjWyjUvhXpKuuvPN9/BgDqmx9bcPos7TkyY3uWicG78h0N5XXOyuOXXdjlbLjJNJoT1vOgWnHUKzV529eZkH8IfvKGh3Zmie00PdManMrREPwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHjBDdhdoQ/F0Z7UmCLr6oidpkqUTIW8UrdYYPA20m0=;
 b=oPMK6AlBUrrjTsf0hRc/Gc3QSuptIywNhfAgmGgGtyFDlRssr3DwxWdVZQEQZ9f+HN9oQFNpNn9HeGBMNTDO7+DkoWjT/Mr5TjvgjX4tuF3KludGOXeLLiT6K1oMaFI6RpZVcg615L3NN/FhcpRWRdqvbpAfjO9Kj2WqFjIMhDpdKLccc/Vzq7kbiC5fdyQeyQs1i7f1rzHXtr56QgkvKFkd8w/cyISgDLsnWTXEeInewTRVvVS14MAae0vQk/xTvbLUn3atOpbkJhg1QpmmvMu9gijBQNZMKjZDPsy+WZ+4TSRZ7DiI9/a46LQ1TEgnzTsW2XROCU60RkolsThfqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHjBDdhdoQ/F0Z7UmCLr6oidpkqUTIW8UrdYYPA20m0=;
 b=IJUBBpXt0X/PCl4YUP4rlZ3AT2XM2grotwGiffo0RZx4s+2d/eUSnuvDWJqtTQr8BLymJOcMIIBFb2t0RqBXOfLNn8as1GkG6mCxoA/pEMvpS7VdmaeroWzRKxeONmnoMIq92t3vu2jwaoNOXs0kRsShg/Nj++vQlunZIeqJ1W2bS7bW52aX7h6SIN38M3pceM7vAkKkcB4uuahY8S0EfqxJjIpdjdI+UeNvxiyqE292rK5541L7UmMlavnou7NzMzVW24y5/0yXccmqxdqaZBhmCIsY5MNAHAgOfewg8q2Ku9LA02BoRAWsNAwYasCHxay0Tl5xsqF7BuRAaP/Kmg==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by MA0P287MB0250.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13; Fri, 9 Aug
 2024 06:26:49 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%6]) with mapi id 15.20.7849.014; Fri, 9 Aug 2024
 06:26:48 +0000
Message-ID: <MA0P287MB28229593FA53BF75C625B468FEBA2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 9 Aug 2024 14:26:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: defconfig: sophgo: enable clks for sg2042
To: Palmer Dabbelt <palmer@dabbelt.com>
References: <20240805023320.1287061-1-unicornxw@gmail.com>
Cc: Chen Wang <unicornxw@gmail.com>, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, inochiama@outlook.com, conor.dooley@microchip.com,
 guoren@kernel.org, emil.renner.berthing@canonical.com,
 apatel@ventanamicro.com, hal.feng@starfivetech.com, dfustini@baylibre.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, haijiao.liu@sophgo.com,
 xiaoguang.xing@sophgo.com
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20240805023320.1287061-1-unicornxw@gmail.com>
X-TMN: [DYInumrGU3DCBhwvvQVoVoqDV/IjBQ3T]
X-ClientProxiedBy: TYCP286CA0013.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::20) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <9beb4313-87f7-41a6-a567-3a08e7bc4047@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|MA0P287MB0250:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e246a34-2fc8-44d9-a628-08dcb83c3ed2
X-Microsoft-Antispam: BCL:0;ARA:14566002|15080799003|8060799006|5072599009|19110799003|461199028|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: ksxiC1F25YK6N6gpP4AX+3YNRO4AAQyetuGK8o1tV3twax4fBPQB4evw8n8fYtRDZcyF1WeC0e7Vq5+D/yzq+RHYjiwM9Opc7liRmN0Bn7sC3kC+roOflgyikN251wwWgNbO60vfF2KgGLVWjtMkQiEe7joUBraCV0oJ3IuIzku5fTTVce9/2DjXlcn8c/8uLnAtH1NyM+HYYKxiph/XEUBW9B5PQdpUj9YGWrxynxFs8fl5qxOf1zZ4jrKuCP8FG48GH56G77Ga15RQIb95vC8HAxug7FVpWMGz5ij2AWkMrWiBDiJ4I8BkZhjULdbzYOEy5RWazl4Nhcd9m1EdakSH3KpHVFnfKiyXFSBwooFM77KHg4c3nK0Ek0h+G52U6hWo3YRcZ2IqfvZ26nLDWbZK2gVBaQk2hfUp3dURgTH4ffoQx2Y+6N68U1Tpj/5XlMUZAf/OOB7WB7958CijGN0HN/GvaivlmzKEbhrr0fFC+xBniAtKogLN+VXUFHroEHca8gA0gKX6tXdh0EeiE3kQundWtMKre36lY9NPNDH+soqsXkjkcaZ0wGhIKNGWB62VEhqMTUFG9iaR767JlrP0C3OW43MzGWIjn30MFSj14JbNu9JGshwPiRoWSh6xlp1oIBhEw8VcOmYBfSLVNuReIAaF68oc3sMCcgASe4OOzlnBtwexup0FtSlNKgG4nSeEkr17h5nrewhbsd5cYw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUp1T2RLUlJkd1ptQW55UWlWTXFBWlptMFE2MDlub0c4S3o2amVXS004YWYx?=
 =?utf-8?B?aXY0aytIZFJUblRkdmo2SG93L0YzTnQ0c1QxWENmcDF3djhNTk1BVlhWUkhy?=
 =?utf-8?B?L1o1Qk9pcmdpeTBVVkYxSVpFNm1tNkk1L0V6TUhPR2p4aGtFaU1ybXF6U2Nn?=
 =?utf-8?B?cXUzRytqQUNxUnYra3A5MnF0MEFYdEdKYVBFa1NVc3BEWElWdTVsWTdBbUZZ?=
 =?utf-8?B?OStpbUhGYVJtcXpwUWVCK3JDa2ZhaU5LanlsV0xuVXIycFh2YmVzM2g5bFp0?=
 =?utf-8?B?WWMyM0JJMGhYNnFBOHZSMnVUWFhCbnFLdmh0eitoSUxjTzI3dEpGNGhCcisz?=
 =?utf-8?B?dEYrUnZuWEQ5czBidUJYUU1Wd1RWdFUrVk1SdFBVT25vNitFc2JWVCtLZ04r?=
 =?utf-8?B?ZUlOTkFKZVZoNEJ0SUdQRXlaL1pQL001bGVBNVZrS2JVYTlnbzJBZ0pKNFRw?=
 =?utf-8?B?dUhsb21ady8zZzk2OSt3RE4zSis1cGt1VkF6aGRmSkNYOUd3US9mSjByUjlD?=
 =?utf-8?B?UUtiUmJSakc4V0h6WVJXdHlzdVdmMitySWFpOE8ydlpKMmR2L2hZdXJ3cUgy?=
 =?utf-8?B?dXc0VTJIcysyWjZRbkdseUZURDVXNmVac1FGRTBRL0M0YVR6ejhyOFAyUStH?=
 =?utf-8?B?ZXJPNndjTEpzcWZkQ3FIMmV0aDVYOEM4SUc1WkUxRmdqRHpqcWs2TlVkNVNE?=
 =?utf-8?B?WkFXZ0VHTy9kMndaNmhQUkF1QlpkenZqeThYS3c1NEsyeGhMSGNtQ1BCU0ph?=
 =?utf-8?B?UjlFTlNWNjB4amZJU2FLekNxTzIxUk1FRG1RY2FQdERwaVlWTC9uU1pjclJQ?=
 =?utf-8?B?cnprUGNmS0JkS1VlSnBGQ1lTWGR6a2tkVTB3OVNvNGhZRlRyVEkvdUY3ZHlx?=
 =?utf-8?B?REtWc0dxN3ZKWEN0eFBha1hROTBuRkVNUGIrNXpkOTZ5V3Y1dlkwRDh1dHJS?=
 =?utf-8?B?OEEyLzlZbTNmampWNnJBaklQWkp2TEJvQlhLRXpsNnc4UDY4MWRud2JpcFJO?=
 =?utf-8?B?RlhDb0EvSXNNQjMvci9pSFFMeFZkRElrVWVkZVhqVlVRM0FqNjc1NWwrWHBi?=
 =?utf-8?B?L1lCMlM0WVBuM2s4VFQ3UzM4MVovREVUY0NJTHY5VXMySU9OZ1RNQ2NELzBz?=
 =?utf-8?B?aHZSa2JBekFQdm1KQmV0U0x2UW9lOU96TW5TRmJQWWVodXVMTE1BMjJVV2Fn?=
 =?utf-8?B?cUpYWFYzbVFWWC9uc1NsUnhrVnFBU3JydGRrczBnQlVuMWF1Q0JXSEtQY2hR?=
 =?utf-8?B?eTdwN1JwZ3VwTzhNOUhTbzFUUGg3VUFpUjlSUE1OQy9oVmhsYWpSK3N3UTIx?=
 =?utf-8?B?bml4MlBRU2xJSjRSWTZoYXVNWlpsdjFoVEcvSDJhRGhmbW9DVzBtWG1nNG5K?=
 =?utf-8?B?VmhKR3FmbTZZb25NR2J4OXJVNXdvVnBLWGRhUmhmUFlNcWRvQ1ZNU05qblVI?=
 =?utf-8?B?MGZ3RmE2dmloalFQWVZsM1FmM0VFL1RoaWQ2eE4yWGtuVkQ3Zll4dE1wR09a?=
 =?utf-8?B?cUJ6ajhpYTJFSS9vdG5zeXFVZ21CY0JiamFvdlRzNklBRFA2andVZDg4WTRj?=
 =?utf-8?B?U2ZyeXhOWjQ5MDVHdTNnMk1QUHNORFhIdklxNzlsN1RQWmhFRnVoV28rRkFX?=
 =?utf-8?B?WlZ0UGkvSnFmcm5oa0lrVjVWYmM0UkJ5MVBRNndGYnJRQ0djMGMzWjdBRVlO?=
 =?utf-8?Q?KQcmCTIQYd7FamFWA+O3?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e246a34-2fc8-44d9-a628-08dcb83c3ed2
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 06:26:48.7612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0250
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_232701_976201_E66309B4 
X-CRM114-Status: GOOD (  10.66  )
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

Ck9uIDIwMjQvOC81IDEwOjMzLCBDaGVuIFdhbmcgd3JvdGU6Cj4gRnJvbTogQ2hlbiBXYW5nIDx1
bmljb3JuX3dhbmdAb3V0bG9vay5jb20+Cj4KPiBFbmFibGUgY2xrIGdlbmVyYXRvcnMgZm9yIHNn
MjA0MiBkdWUgdG8gbWFueSBwZXJpcGhlcmFscyByZWx5IG9uCj4gdGhlc2UgY2xvY2tzLgo+Cj4g
U2lnbmVkLW9mZi1ieTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+Cj4gLS0t
Cj4gICBhcmNoL3Jpc2N2L2NvbmZpZ3MvZGVmY29uZmlnIHwgMyArKysKPiAgIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2NvbmZpZ3Mv
ZGVmY29uZmlnIGIvYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZwo+IGluZGV4IDBkNjc4MzI1
NDQ0Zi4uZDQzYTAyODkwOWU1IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvY29uZmlncy9kZWZj
b25maWcKPiArKysgYi9hcmNoL3Jpc2N2L2NvbmZpZ3MvZGVmY29uZmlnCj4gQEAgLTI0OSw2ICsy
NDksOSBAQCBDT05GSUdfVklSVElPX0JBTExPT049eQo+ICAgQ09ORklHX1ZJUlRJT19JTlBVVD15
Cj4gICBDT05GSUdfVklSVElPX01NSU89eQo+ICAgQ09ORklHX0NMS19TT1BIR09fQ1YxODAwPXkK
PiArQ09ORklHX0NMS19TT1BIR09fU0cyMDQyX1BMTD15Cj4gK0NPTkZJR19DTEtfU09QSEdPX1NH
MjA0Ml9DTEtHRU49eQo+ICtDT05GSUdfQ0xLX1NPUEhHT19TRzIwNDJfUlBHQVRFPXkKPiAgIENP
TkZJR19TVU44SV9ERTJfQ0NVPW0KPiAgIENPTkZJR19SRU5FU0FTX09TVE09eQo+ICAgQ09ORklH
X1NVTjUwSV9JT01NVT15Cj4KPiBiYXNlLWNvbW1pdDogZGU5YzJjNjZhZDhlNzg3YWJlYzdjOWQ3
ZWZmNGY4YzNjZGQyOGFlZAoKSGnvvIxQYWxtZXIsCgpDb3VsZCB5b3UgcGxlYXNlIGhhdmUgYSBs
b29rIG9uIHRoaXMgcGF0Y2ggYW5kIHBpY2sgaXQgZm9yIG5leHQgdHJlZT8gClRoZXNlIGNsayBk
cml2ZXJzIGFyZSByZXF1aXJlZCBmb3Igc2cyMDQyIHRvIGJvb3QgaW50byBtaW5pbWFsIGNvbnNv
bGUuCgpUaGFua3MsCgpDaGVuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
