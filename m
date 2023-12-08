Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8114CC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 10:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2Tp63IVp6Cp9tkqKDMBtzZ6dvBwNmHg8aYJi1Nqv1c=; b=A4U/bfJrbwaNlXmuA9bW4T3Dsa
	NQ+UUJ9Pr3lKCG205cCg/AXvRD7O1nCh0N7HE9Ru8gxPt4++C57zKYkT8iD2l1sYM7pt3Pbie7UjZ
	4plPGiiYVk8qOGHtLJBz6+p71N40v+Rr9Y8Z1bBFrUx+9dcQDKUh0VdDhYxlPP6LgSH781f/wGQVC
	BU4+NG2D9PhKlxXUcDCKxaWKHJj6L0MlCvaYeiA2imtetrsI7ASkIrYgfbv95jPEAD3Hqb2j65tjF
	bqzhRvthRib1KTEpdODvdllgccjfE+tTs61S/dhdCgx7tN1w5zgVQSgrG/BSq9KX4VA5EffUurFAn
	lUpv0Elg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBXpc-00FDQx-0w;
	Fri, 08 Dec 2023 10:11:40 +0000
Received: from mail-maxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281b::800] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBXpY-00FDOm-1o
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 10:11:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jl7Brl2xiKpaUCmM/OEKg35eJ+OUn/B+JL71COYnukxlCEeU9Dz//jwP4ma9VtAIQcth+QInLPtRkzMHAo9vIufDFfgM5lsWydHo1AUHh/F877Binkna9caG9ewg+PBvSXKC84jA22VTw0B3E7OgrYezgHa8kSWSREcZQ3atu5WXgVAt5+qVuuOsn8pvfDrmGvsjtLD3gh3QORexxPya0q4yeDH/z57WWzHxVctOE5TViUNaPFVU+amAKkoDy2DLJZchvrqGLPKDpSZrSSk0Mt2QznN8Qzr5J1N5DPKDiD7X3qmKfjRfp1q5YNw4jz7lsyxT5SN/NlNpIdyPR4rtbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgYg+otZzPIgXrw6iExNueZiSlU9FQY3CH64r9iMO34=;
 b=KX/1Ra9Fy50vE03j2x/7QlXegQGNI/mqYttGy8kACNAaNuEblpE58K/mia5dF88r0Xwref4GizcjWoTy/2jlOJqwAIfhZjnW7yvgIXdhjZ/2CJh+Mfc92rR5S93iHD2xLz+UfWcFRKPCFEgtHwrfjUg5I2iD1hNnepXIUWH1OaRtK+/RotuuI3y9+BBYUabb4lYflSQPp7SfDgiyozGGXEEbT50K6ClFbO+oCY+h9jQmdCF7CGzqtyS9D1Ib4fHuDptKLPgn2AiXOoNrHjXpJus3xbUtt58kkJnaPbZEwmB2yyTNfEfDTV4MAOAGS5o1Gh7rRro3viROQ6QQ4/jkyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TgYg+otZzPIgXrw6iExNueZiSlU9FQY3CH64r9iMO34=;
 b=sZwQExpgqyqx9EPvL/A5SFXwre5nayHW3a30vOpW64KvZx03lkA3mcpD5RTqYFGBeNyBSSOlGqThYOCBYEa8LSoAuCZ0RSXckwHnbLEuaajUQYsIaSA2QxtKy07EeY/3NrrCrXnLxn10gE5t/CQdKlAdFbUb4rlNFBEhfz+2ligMsWYA4Fp7i3MHpARaNosMszT7ZZ8DFu3RAr4HTlAPzgEzKTtg+movminyf0NIXAMxGc4x/4ippCHN7C1EjnTLBihIfYeS3WtEFIOMRjwwleHgRskqzt0HIsCA0x2wYB6HRNf2afxpI7lRwRZLqEu5eHsDHgqBqzxTNznIsWPp7Q==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 PN3P287MB1587.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.28; Fri, 8 Dec 2023 10:11:20 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::b1a7:eee7:e903:9ef3]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::b1a7:eee7:e903:9ef3%7]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 10:11:20 +0000
Message-ID: <MA0P287MB0332EEB2858B8B39F151CECAFE8AA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 8 Dec 2023 18:11:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] riscv: sophgo: add clock support for sg2042
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
 chao.wei@sophgo.com, conor@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 richardcochran@gmail.com, robh+dt@kernel.org, sboyd@kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, guoren@kernel.org,
 jszhang@kernel.org, inochiama@outlook.com, samuel.holland@sifive.com
References: <cover.1701997033.git.unicorn_wang@outlook.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <cover.1701997033.git.unicorn_wang@outlook.com>
X-TMN: [e0xQ6LXQxsZe/4PvfhdyNCI4KLKMcBaN]
X-ClientProxiedBy: TYCP286CA0355.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::12) To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <d96056fb-cc10-4660-a49c-b307e6856fc2@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|PN3P287MB1587:EE_
X-MS-Office365-Filtering-Correlation-Id: 69e88254-1f9d-4ea7-9703-08dbf7d60502
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vdC33G2A5m3pCv+IPz6SNbf8veGbxAwz4hi4RuhYboDMpX0MxgDrp1DhxXwBkB/mYk/ymgojbzYyrwc189La6MsFaWpd2DUacCZwGcmFlhktetpmUxmLtEE2/ochuqIzLVsVEY7jI20eQ3eztkbHEri8TQOBsNGHXqbkwMh1+z+BxCiAlnPT+x5TQXgkFI+dqmBECpmBy4I18kiARXWrlXvEwLMn6JZQGu2s/C7Ys7Vzoi2nm5Y0w+xzVk3dQe+rPLQlxAz+QcffRqalBrbjpfUCEflPr1BrinJS7ULz7YrDislR6J7mqp7Q4FlmbEtNHcpFQJ1vPM7RctSI75RA2G9dYJiv/zNaZWsNeEtZRR0HvsvzV0Eca0hh/UYkZdY6i9/6rkw8rLkr6Dl+1LQz2g3LJ/i/VxSbtmcyYkE9suuOKbcdwYlbW0wp24C9/cfDcT4g/0s6Ct3uXRXcIJtDdl3NGFV8qjrSyph1VxTGG177vR1en2gSBcrgrZT8O9Ap+f7CDND3o7TpDS1QVCaWA+CWuJaTPdQ3XlQkvhx4hJWmt9LE1MpEk+LpXdqhKVT1WwU2rudtAkd9zJRJvOcU2GktTInEslAHJMjsOJH9zlkem3QaT44ju+50WjJkwfQCKwQBZoNZvBMs1Ba2NFrxfQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1dKWUZhMWlpMkIwK1BhK2hrM3BOQUhNWVpvR09WQ0dSOTV1clR3TVBXWXZR?=
 =?utf-8?B?SkdneVVDRmEydmw5L3oyV2p2aDZkNEd0VE1aSXhPSHUySWRSVGZyQzFpM2hS?=
 =?utf-8?B?UVdrak1vM1pKWEFyeHZYbTZJRjdyYkFkRUxFN0YyWnRvOW5mTVB0a0lWWnpH?=
 =?utf-8?B?SExSY282WVhiWmxYczB1NDZ0NUlMQXBXVTlWdzhBZ1VwalE3ZUtWVmZnZmlY?=
 =?utf-8?B?aFJOVTlqeWVIcGJRUjRPVVY1VDQrYW5ONXpSKzZTMEYvUmVuSXUxaS9Xblps?=
 =?utf-8?B?THNwd1d2RXRUSXJoOVE5bE0vUllleWVNanIyemNsMkltc3VlRjhOQWh5NExv?=
 =?utf-8?B?dFdhY2VJNWFNSStVU1lYQ3V3NjU5SktPYjVmQmxqTFpxVC9Ra2g4Q0s3OXRK?=
 =?utf-8?B?YnJHNksxMHBCeXg5UlYyTFBJbzdsYmJXZG9kQzYxRm0rQjhKY2dDSUY2V01u?=
 =?utf-8?B?TDJMZXJvOSsrSXlySVBaRVVTTmZxZ2tvYzRGOWdPNUIyZG02SDE0NTdSay91?=
 =?utf-8?B?M0xNODZhSmFCMnhtRzRZRHlPampLTlZYOGZzbXB2QlFtMlNwQktoRnZjOUlL?=
 =?utf-8?B?V1FTUVRWdnJxbktqdFZ0KzNCVWtrcEdObFc4ZlVTTUMyc3BGTmJYYllseTRw?=
 =?utf-8?B?VnlZa3NNYjJXaHdzWCtBUkdSemVkbVNMNHpXd1Z5SW5UTjBQVWtCSjZrTUhG?=
 =?utf-8?B?b2xaTzBmQmR0YVFqcDBEaDU5QjZPSW9DVnk2VDBMSFJwWE5jdUMvZE56Ym5U?=
 =?utf-8?B?eFR0VDdLekszemc3SkNORGMvYTliVGEyU2pSUkdEWElSdkZqelU0VDArelI2?=
 =?utf-8?B?RUwvaXFUSVp4dHMyTzlTdTNzSHBlb1d1RWx3Vkh1Zy9SQnN6SVVUMnRibzJj?=
 =?utf-8?B?aDZBUmxuQ0Q5NHZzb0ZwbXMxZ0VVdlo0M2NGU045SndZWkRjTTRPL3luWGFT?=
 =?utf-8?B?NWFrWldLZTdjWlg4ODhqRU4zYkVFZEwwUXhDWFR0OXdEOHBGQjB1dWZTYXFt?=
 =?utf-8?B?MHk5Rlh2NzZOV0RDZGdneFYyY3kwR1FIekk1U1N3SVIxSHlGS3RBZ2tFZTE2?=
 =?utf-8?B?T3k1b0pVbzVyNGY2NlZoaGlMUXloMnV0Y0JMLzYvOGVLTDJpeXRJZG5MNDJt?=
 =?utf-8?B?U1NXcW9PWFd2ZFNNNHNiS2k5VlozZlUvVGtFelZBSlVUZm5iUGlGY1pzZjQr?=
 =?utf-8?B?Nk1xY3BSMG1IdWtBQnkrL2RqUDErNHQwZm1kdTNCZzUxZ1pNWnd1REFYdG41?=
 =?utf-8?B?TldOTDZxUFJBM256RGMwV1NBYzlscXdFNjJ4U0IxY1M4Qi8zOVh6akNzUG5U?=
 =?utf-8?B?OXhaODRESURKUk5Zb3ZUeVlXalJjbG9MakZSeHQyWHY0VzhlSEFodkJ6YWlH?=
 =?utf-8?B?bFlONEhISnBCKzZ1ZXgxV1Q5OW52UnArT1E0bTc2VkZNYy9CZzM2NmpQMlMx?=
 =?utf-8?B?cmZmcXZ3UUE4d2ovZjFUMUdEMFlLeFdGUThKVEZ5K0Nqb3dKMWp2QTllVTAx?=
 =?utf-8?B?MmttNHJRRUpDSU1qWXZyU3BMOG8vQjJxYUo5N3ZmS0lQZzVXSnp6c2J3S1dk?=
 =?utf-8?B?NzZRMmtZOWEvKzZySnZYRkhEUkJWamN1YWZHSUFnSzdEbFVHREM5VDRNbXBB?=
 =?utf-8?Q?soGicSflE0LpLDMn/avjwCHFagEJc3t4kvg4HxEAIrtg=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e88254-1f9d-4ea7-9703-08dbf7d60502
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 10:11:19.9549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1587
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_021136_625169_B71CD9AF 
X-CRM114-Status: GOOD (  19.18  )
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

T24gMjAyMy8xMi84IDk6MTMsIENoZW4gV2FuZyB3cm90ZToKPiBGcm9tOiBDaGVuIFdhbmcgPHVu
aWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KPgo+IFRoaXMgc2VyaWVzIGFkZHMgY2xvY2sgY29udHJv
bGxlciBzdXBwb3J0IGZvciBzb3BoZ28gc2cyMDQyLgo+Cj4gVGhhbmtzLAo+IENoZW4KPgo+IC0t
LQoKSGnvvIxDb25vcu+8jAoKQ2FuIHlvdSBwbGVhc2UgaGF2ZSBhIHJldmlldyBvZiB0aGlzIHBh
dGNoPwpBbmQgSSdtIG5vdCBzdXJlIGlmIHlvdSBhcmUgb2sgdG8gcGljayB1cCB0aGlzIHBhdGNo
IHNvIGl0IGNhbiBiZSBtZXJnZWQgCmludG8gdGhlIG5leHQgdjYuOD8KClRoYW5rcywKCkNoZW4K
Cgo+IENoYW5nZXMgaW4gdjY6Cj4gICAgVGhlIHBhdGNoIHNlcmllcyBpcyBiYXNlZCBvbiB2Ni43
LXJjMS4gWW91IGNhbiBzaW1wbHkgcmV2aWV3IG9yIHRlc3QgdGhlCj4gICAgcGF0Y2hlcyBhdCB0
aGUgbGluayBbN10uCj4gICAgLSBmaXhlZCBzb21lIHdhcm5pbmdzL2Vycm9ycyByZXBvcnRlZCBi
eSBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4uCj4KPiBDaGFuZ2VzIGluIHY1Ogo+
ICAgIFRoZSBwYXRjaCBzZXJpZXMgaXMgYmFzZWQgb24gdjYuNy1yYzEuIFlvdSBjYW4gc2ltcGx5
IHJldmlldyBvciB0ZXN0IHRoZQo+ICAgIHBhdGNoZXMgYXQgdGhlIGxpbmsgWzZdLgo+ICAgIC0g
ZHQtYmluZGluZ3M6IGltcHJvdmVkIHlhbWwsIHN1Y2ggYXM6Cj4gICAgICAtIGFkZCB2ZW5kb3Ig
cHJlZml4IGZvciBzeXN0ZW0tY3RybCBwcm9wZXJ0eSBmb3IgY2xvY2sgZ2VuZXJhdG9yLgo+ICAg
ICAgLSBBZGQgZXhwbGFuYXRpb24gZm9yIHN5c3RlbS1jdHJsIHByb3BlcnR5Lgo+ICAgIC0gbW92
ZSBzb3BoZ28sc2cyMDQyLWNsa2dlbi55YW1sIHRvIGRpcmVjdGx5IHVuZGVyIGNsb2NrIGZvbGRl
ci4KPiAgICAtIGZpeGVkIGJ1Z3MgZm9yIGRyaXZlciBNYWtlZmlsZS9LY29uZmlnCj4gICAgLSBj
b250aW51ZSBjbGVhbmluZy11cCBkZWJ1ZyBwcmludCBmb3IgZHJpdmVyIGNvZGUuCj4KPiBDaGFu
Z2VzIGluIHY0Ogo+ICAgIFRoZSBwYXRjaCBzZXJpZXMgaXMgYmFzZWQgb24gdjYuNy1yYzEuIFlv
dSBjYW4gc2ltcGx5IHJldmlldyBvciB0ZXN0IHRoZQo+ICAgIHBhdGNoZXMgYXQgdGhlIGxpbmsg
WzVdLgo+ICAgIC0gZHQtYmluZGluZ3M6IGZpeGVkIGEgZHRfYmluZGluZ19jaGVjayBlcnJvci4K
Pgo+IENoYW5nZXMgaW4gdjM6Cj4gICAgVGhlIHBhdGNoIHNlcmllcyBpcyBiYXNlZCBvbiB2Ni43
LXJjMS4gWW91IGNhbiBzaW1wbHkgcmV2aWV3IG9yIHRlc3QgdGhlCj4gICAgcGF0Y2hlcyBhdCB0
aGUgbGluayBbM10uCj4gICAgLSBEVFM6IGRvbid0IHVzZSBzeXNjb24gYnV0IGRlZmluZSBzZzIw
NDIgc3BlY2lmaWMgc3lzdGVtIGNvbnRyb2wgbm9kZS4gTW9yZQo+ICAgICAgYmFja2dyb3VuZCBp
bmZvIGNhbiByZWFkIFs0XS4KPiAgICAtIFVwZGF0aW5nIG1pbm9yIGlzc3VlcyBpbiBkdC1iaW5k
aW5ncyBhcyBwZXIgaW5wdXQgZnJvbSByZXZpZXdzLgo+Cj4gQ2hhbmdlcyBpbiB2MjoKPiAgICBU
aGUgcGF0Y2ggc2VyaWVzIGlzIGJhc2VkIG9uIHY2LjctcmMxLiBZb3UgY2FuIHNpbXBseSByZXZp
ZXcgb3IgdGVzdCB0aGUKPiAgICBwYXRjaGVzIGF0IHRoZSBsaW5rIFsyXS4KPiAgICAtIFNxdWFz
aGVkIHRoZSBwYXRjaCBhZGRpbmcgY2xvY2sgZGVmaW5pdGlvbnMgd2l0aCB0aGUgcGF0Y2ggYWRk
aW5nIHRoZQo+ICAgICAgYmluZGluZyBmb3IgdGhlIGNsb2NrIGNvbnRyb2xsZXIuCj4gICAgLSBV
cGRhdGluZyBkdC1iaW5kaW5nIGZvciBzeXNjb24sIHJlbW92ZSBvbmVPZiBmb3IgcHJvcGVydHkg
Y29tcGF0aWJsZTsKPiAgICAgIGRlZmluZSBjbG9jayBjb250cm9sbGVyIGFzIGNoaWxkIG9mIHN5
c2Nvbi4KPiAgICAtIERUUyBjaGFuZ2VzOiBtZXJnZSBzZzIwNDItY2xvY2suZHRzaSBpbnRvIHNn
MjA0Mi5kdHNpOyBtb3ZlIGNsb2NrLWZyZXF1ZW5jeQo+ICAgICAgcHJvcGVydHkgb2Ygb3NjIHRv
IGJvYXJkIGRldmljZXRocmVlIGR1ZSB0byB0aGUgb3NjaWxsYXRvciBpcyBvdXRzaWRlIHRoZQo+
ICAgICAgU29DLgo+ICAgIC0gRml4ZWQgc29tZSBidWdzIGluIGRyaXZlciBjb2RlIGR1cmluZyB0
ZXN0aW5nLCBpbmNsdWRpbmcgcmVtb3Zpbmcgd2FybmluZ3MKPiAgICAgIGZvciBydjMyX2RlZmNv
bmZpZy4KPiAgICAtIFVwZGF0ZWQgTUFJTlRBSU5FUlMgaW5mby4KPgo+IENoYW5nZXMgaW4gdjE6
Cj4gICAgVGhlIHBhdGNoIHNlcmllcyBpcyBiYXNlZCBvbiB2Ni43LXJjMS4gWW91IGNhbiBzaW1w
bHkgcmV2aWV3IG9yIHRlc3QgdGhlCj4gICAgcGF0Y2hlcyBhdCB0aGUgbGluayBbMV0uCj4KPiBM
aW5rOiBodHRwczovL2dpdGh1Yi5jb20vdW5pY29ybngvbGludXgtcmlzY3YvY29tbWl0cy91cHN0
cmVhbS1zZzIwNDItY2xvY2stdjEgWzFdCj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL3VuaWNv
cm54L2xpbnV4LXJpc2N2L2NvbW1pdHMvdXBzdHJlYW0tc2cyMDQyLWNsb2NrLXYyIFsyXQo+IExp
bms6IGh0dHBzOi8vZ2l0aHViLmNvbS91bmljb3JueC9saW51eC1yaXNjdi9jb21taXRzL3Vwc3Ry
ZWFtLXNnMjA0Mi1jbG9jay12MyBbM10KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1yaXNjdi9NQTBQMjg3TUIwMzMyOUFFMTgwMzc4RTFBMkUwMzQzNzRGRTgyQUBNQTBQMjg3
TUIwMzMyLklORFAyODcuUFJPRC5PVVRMT09LLkNPTS8gWzRdCj4gTGluazogaHR0cHM6Ly9naXRo
dWIuY29tL3VuaWNvcm54L2xpbnV4LXJpc2N2L2NvbW1pdHMvdXBzdHJlYW0tc2cyMDQyLWNsb2Nr
LXY0IFs1XQo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS91bmljb3JueC9saW51eC1yaXNjdi9j
b21taXRzL3Vwc3RyZWFtLXNnMjA0Mi1jbG9jay12NSBbNl0KPiBMaW5rOiBodHRwczovL2dpdGh1
Yi5jb20vdW5pY29ybngvbGludXgtcmlzY3YvY29tbWl0cy91cHN0cmVhbS1zZzIwNDItY2xvY2st
djYgWzddCj4KPiAtLS0KPgo+IENoZW4gV2FuZyAoNCk6Cj4gICAgZHQtYmluZGluZ3M6IHNvYzog
c29waGdvOiBBZGQgU29waGdvIHN5c3RlbSBjb250cm9sIG1vZHVsZQo+ICAgIGR0LWJpbmRpbmdz
OiBjbG9jazogc29waGdvOiBzdXBwb3J0IFNHMjA0Mgo+ICAgIGNsazogc29waGdvOiBBZGQgU0cy
MDQyIGNsb2NrIGdlbmVyYXRvciBkcml2ZXIKPiAgICByaXNjdjogZHRzOiBhZGQgY2xvY2sgZ2Vu
ZXJhdG9yIGZvciBTb3BoZ28gU0cyMDQyIFNvQwo+Cj4gICAuLi4vYmluZGluZ3MvY2xvY2svc29w
aGdvLHNnMjA0Mi1jbGtnZW4ueWFtbCAgfCAgIDUzICsKPiAgIC4uLi9zb2Mvc29waGdvL3NvcGhn
byxzZzIwNDItc3lzY3RybC55YW1sICAgICB8ICAgMzQgKwo+ICAgTUFJTlRBSU5FUlMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgNyArCj4gICAuLi4vYm9vdC9kdHMvc29w
aGdvL3NnMjA0Mi1taWxrdi1waW9uZWVyLmR0cyAgfCAgICA0ICsKPiAgIGFyY2gvcmlzY3YvYm9v
dC9kdHMvc29waGdvL3NnMjA0Mi5kdHNpICAgICAgICB8ICAgNzkgKwo+ICAgZHJpdmVycy9jbGsv
S2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMSArCj4gICBkcml2ZXJzL2Ns
ay9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAxICsKPiAgIGRyaXZlcnMv
Y2xrL3NvcGhnby9LY29uZmlnICAgICAgICAgICAgICAgICAgICB8ICAgIDggKwo+ICAgZHJpdmVy
cy9jbGsvc29waGdvL01ha2VmaWxlICAgICAgICAgICAgICAgICAgIHwgICAgMiArCj4gICBkcml2
ZXJzL2Nsay9zb3BoZ28vY2xrLXNvcGhnby1zZzIwNDIuYyAgICAgICAgfCAxMzU2ICsrKysrKysr
KysrKysrKysrCj4gICBkcml2ZXJzL2Nsay9zb3BoZ28vY2xrLXNvcGhnby1zZzIwNDIuaCAgICAg
ICAgfCAgMjI2ICsrKwo+ICAgLi4uL2R0LWJpbmRpbmdzL2Nsb2NrL3NvcGhnbyxzZzIwNDItY2xr
Z2VuLmggIHwgIDE2OSArKwo+ICAgMTIgZmlsZXMgY2hhbmdlZCwgMTk0MCBpbnNlcnRpb25zKCsp
Cj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Nsb2NrL3NvcGhnbyxzZzIwNDItY2xrZ2VuLnlhbWwKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL3NvcGhnby9zb3BoZ28sc2cyMDQy
LXN5c2N0cmwueWFtbAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL3NvcGhnby9L
Y29uZmlnCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvc29waGdvL01ha2VmaWxl
Cj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvc29waGdvL2Nsay1zb3BoZ28tc2cy
MDQyLmMKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9zb3BoZ28vY2xrLXNvcGhn
by1zZzIwNDIuaAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvY2xv
Y2svc29waGdvLHNnMjA0Mi1jbGtnZW4uaAo+Cj4KPiBiYXNlLWNvbW1pdDogYjg1ZWE5NWQwODY0
NzFhZmI0YWQwNjIwMTJhNGQ3M2NkMzI4ZmE4NgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
