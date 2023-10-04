Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8977E7B5FB
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 11:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5eaNXwPWMmGN1dND5vfLxf86V/6wTki4dfrefizrSA=; b=ATZyfA3a8rfKnPvBUZJ0MU0wBJ
	uz8nDWiVZkwYCZ6RFFZa5oCJF5UZIb477GofvIB01NhJuxmPzElXM6FPDbXZ3JSQUm+c8vAPK/8TN
	eyFbTNQl2OtBdYxH8HscZSXyKbQslHfZ5EABJRY6p8rexzIKSm5RzLt5XRaQU5u4P0Y7WjK9bQDR+
	ZMyKhAjE+k3+TPk84Ei8E1zVpAJGyFKX+vbV3pyUq5q6Kos38T1hXsP6IxxIqbkE86JsDiZ+DuGfh
	+1s4mLR8KgReQTtJnC9L5yuBxG055MyLlln5OBdvDbntym6PBEf8mg7xamCMisXyK8BZqKMr+6mYo
	5lLkudeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo0WS-00HXFq-18;
	Wed, 04 Oct 2023 11:58:36 +0000
Received: from mail-maxind01olkn20827.outbound.protection.outlook.com ([2a01:111:f403:700f::827] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo0WO-00HXF6-37
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 11:58:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nW8Uxlx3LdG3zmvSoxHrBf2ebPw1DQTDDPA2Di0klKR8euWMb9jiMBhSbi5yaaxlcHX/9W8ttSCK2d6J/CFu0jl7qxkw94Ng2W2KzeTDrp4OBU0rK3TOkdb3g+2vJejRBvlz2Skel+FEnM7mrOaX1BgN4YoEt0MbyP0uLEIi4Xeh0ta6fBq+kyic7MEJxfodZVYNapbUHe/UUka7ZZqrez9UYeWByu8YF6Hz8+105MG7PAMNLNsGSBGQV2XAVf4UMmijPhIiGhtHNJoePq1Y5moMuCQugadCyc4bi4zt+Cyw3R5o2woxYLTSW7bQRKhjicUPl9z8CJBItXajMTt/hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ccy+yQxsR7TUqJ1fUBLvZgd9nKhfgA458BGt3N2o0i4=;
 b=LbvC1Eh1XNcqpf593p45sAt+NcL8U7f17/5UT0wJP/rbvCs4GyOpL3k4vNcVDCSsq6ujPqCXB2ovpRPTFzVSIJ26iFypfDYChyr4uSu32G/LVoizJOMPNYmnScmfwdpeuKdYJqPy4fPYLBcBZ5yz1LifSYJoM43jGPiu/EesnErlfC2eXK43rP8oGYhliXCnwPlI6+fa0LMLR4Y7bpWckU3xRPbHKNV9OI16cj3Y0H2HWLy7EDaiBzU9yy/iE0RqwFxZMLh0VRc8DgEcwhWqLFTAxYEVRZjrPoPM9jsae6pYaXRpQWSD20Um4msmRaD2HltzRRWUn0nU5pWr9y2FeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ccy+yQxsR7TUqJ1fUBLvZgd9nKhfgA458BGt3N2o0i4=;
 b=QSWoLNfk+iWNTP0VxPreigHX6KLYuzau1HT/rLwgF6/czjqw2ncGKKjhX85r8mb3kTwnbok1Hzm20Nmg/9Y5C1xHb9rofOOGVYP6uaXde3yhVWukrYucpYQlCVYgjm7PlIbp/wDboUwyhGycobKcSZmsCfKm1zKQlxvAEzFckQT6Ds3s9ILFZRbqVRf81WTBEeHzijbDzGyhj18ee+OumBiGWsgLUf9kgLs5h3e7s7uzdrDJhRozSoADMRdJFADEZw+1CRDaop8q04xFna1cJQhUi3NRh9w2Yva6EtNzDQUgSA1kmQDhYFmgVqhQJSJ46BOQZ4wvngJzAgXBnu8aPw==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 PN2P287MB0811.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:133::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.35; Wed, 4 Oct 2023 11:43:36 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7%3]) with mapi id 15.20.6838.028; Wed, 4 Oct 2023
 11:43:36 +0000
Message-ID: <MA0P287MB0332BD2EFF6C43DC154EB03BFECBA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 4 Oct 2023 19:43:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] riscv: dts: sophgo: add initial CV1800B SoC device
 tree
To: Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Anup Patel
 <anup@brainfault.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Inochi Amaoto <inochiama@outlook.com>, chao.wei@sophgo.com,
 xiaoguang.xing@sophgo.com
References: <20230930123937.1551-1-jszhang@kernel.org>
 <20230930123937.1551-5-jszhang@kernel.org>
 <MA0P287MB033277186E21A09127407452FECBA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
 <37021ef8-55e2-4116-8201-2ab7df9e0fc1@linaro.org>
 <20231004-caregiver-deserve-71849c94dcfb@spud>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20231004-caregiver-deserve-71849c94dcfb@spud>
X-TMN: [nZqIRyyNcUbGv1RM1xokrNfODBB8MVXq]
X-ClientProxiedBy: SI2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:194::17) To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <ac38aebc-66b9-4277-b814-4e1c00ad31f3@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|PN2P287MB0811:EE_
X-MS-Office365-Filtering-Correlation-Id: 49f850cf-dbca-4e26-4e82-08dbc4cf2505
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hIloQUR4cmn07S+BK9MR1ojLzCAxiF9RC7G0JVwFya3DgY0I8pc81mUwxNqVhv+yE4JP0tJhcLfvtIlpzlruICEJ4JmF+5ITvolUJ81UJVK4noIFntRa4DPCNHUzlOz4lQd8pR36+MBskE73VTONhtznErrHKA1n9T+9UzVe4nIdfRA2oM53q99QSlDvfB7/6dla64bA+IjGnx0Lz/ja0knm4d1/KrihNmThP8014cjfT1UCH62DZjNJq1KYlRMYO0iQz7mD5aOmAbnRmS6pRv78sW4571d4cuB63owKhTawngelvYOUXaizwi2UGZ0p7CuKEAt6NwWRznYLIzU/4z9MYjoF+mOdFRDvd+GwWqSHUgD48oQsY5MamZPCKpK4KJDBCip55PKmARXQHrKbxHFj6HOesyMZBVgfmrbcO1ok9aEUD859oOrF6DeSd18lQ1KIqoHlQBysnxG5JjO4ms/VHaCFLPX3jQNRAOzPa4itiSS4FvBLPaoL1oRCJB2DEgMOENfz/oXaRXf76tn5dYvl6qjHZeH/g9gEQpi9nyM=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1l2UmxEZGlxV01UNDErWjI0SkhXUzRac2NjdGh6SFBnUjhpMlRwSFluMjJy?=
 =?utf-8?B?dXVTVmoyMkhFVjVncTN6RHFhaTZ3OFhiWXdqb2o0T1d4N3Zkb3o4dFhveFZN?=
 =?utf-8?B?TTkzYTlpdit0R1l3ZElZUU1uemNDZisza2N4Q0pYbERIOEFzMGEyaGExd2xO?=
 =?utf-8?B?aEpzK0MxZ3JJeXIxM3FaRlFsS0wvTHVReEhySUhXWWIzWmNFQWhyb2piZHBP?=
 =?utf-8?B?a0p0Mjc2ajRHMnhUZEFuY2NoNmxsTmJQMVc3dUtqM2lDUVVlblZmOUl1bDJp?=
 =?utf-8?B?K2NaMUd1bFlTSVdLcTdBMVVkQjFrYVZCNFdKN1cwNlpuYXJpTEFJQ0RtNkFL?=
 =?utf-8?B?dUxPcnRVNjFBaVdGSHJLeEpnbGo4cHNvbGF0OWdBV2p1bjVPcTlRSGYrdjE3?=
 =?utf-8?B?S2FRMmMvaHJtcTI3THBhYXN6L2g4L0FiUWhMOU1scG9UZ0lucDdycFRkeDFV?=
 =?utf-8?B?ZDNkYzJicjVlTjkwdXg5Z3lZOUxzc0xGWGFoY2REK1E3VThMVmlueHNyT3Fm?=
 =?utf-8?B?UmtPQUlYNDNya2REbjJXeXVsbVRVYzVuY0hvMFBVcVd0amx0SU1xN1lCdFhq?=
 =?utf-8?B?ZzBrSTRrWDhpZ1VJNkJtbGtxVWxmakdzcjlQUzBzQ3JQUVJRbDViQWhPM2tB?=
 =?utf-8?B?U05zajlCbXk2clg4YTZUWkFkS3U3VDQ4QkNEMysxM3BocFNZajY5bVhlK29v?=
 =?utf-8?B?cG5zYzZUZ3V6NzNHUjM3MGJKSkU2RFZXNGkyYjJQb241TlZ3dGJvQ3dldThI?=
 =?utf-8?B?TW9NejB4bUpKbGRveVZReWxZZ1NmUGJuS3RndzRIbU5BTzhUZmFpKzVad1hz?=
 =?utf-8?B?Yk54U1ZZdFNya1h1RXpkeTRQU0o5akY0WEpKMnRPSDJqdUo3ZXZ0YXdIRndC?=
 =?utf-8?B?U09DcXJvVmFWUEdkTkEzZnRXdmJ5U0FScE85ZXdnbWRtNERsVm5sTUF0dEJV?=
 =?utf-8?B?MGxFMU9EaDQ3RTd5ZkVlZjN2R2t3U3FXeHNYempaTXQzRzFheCtqdk1XU0hZ?=
 =?utf-8?B?QmdnTHpCZndjcW04R3RYWEZwQ0hDZGdnVTgvaDIyVkNVcDVXS2ZINjF0dW9r?=
 =?utf-8?B?Y2d2Y2VQSXV5QkNiU1Z4WkV3TzNpb3h6Q0Zib3pCMm9XamdPSFh4RlFKMU9k?=
 =?utf-8?B?c2JwNVA0WmRRc252Z3FXZ2JUeHNNZUEzOXBOaU54MjhmZExxVlJWQUVEYmlY?=
 =?utf-8?B?YXZoY0x3ZnE3RGdTa3c2TVhDK0NSRlcwV0tjSUxvb2VZU3ZMRldxdkZCakNK?=
 =?utf-8?B?OVdpc1J2M0toVnR6U3AxREprdW1sd2hMNlBxS1FSYVF5Q1d0bVNIcWQrT3Z5?=
 =?utf-8?B?SGJjU2NkcTQ3UUNSZGhHeXU4UXlaM1czSVYrV25zNGZVV0RnTGRINGRtRkNG?=
 =?utf-8?B?aG9GR1Y5Zmx6RytOcm5TbFZxSGx1QzZPK3EyVzgvNGd2SmlQU3hmbm5CNDkv?=
 =?utf-8?B?bDNSTUxsT2h2L2NrTEo4Mng1TXlUS0V2VTZkZ3lHNnJicFVQK3c4bWZxUmh5?=
 =?utf-8?B?Vm5PV2hDbmhMeGUxVnJOMjFMQnA1RVEyTHAwT3lBK3QrSnNLQ3AxSjVXVmJs?=
 =?utf-8?B?eHRqRVdtQ1VrOElONndZeVdRMWhkYVRXV1AvYzFKT3NsMlNEcXpEN1JZWmFR?=
 =?utf-8?Q?nbS0KrEZ8s4lxci7V4edwunOGI+DEQQoecCv4Xtug15w=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f850cf-dbca-4e26-4e82-08dbc4cf2505
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 11:43:36.5242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_045833_014747_AB0D241E 
X-CRM114-Status: GOOD (  14.18  )
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

CuWcqCAyMDIzLzEwLzQgMTc6MTMsIENvbm9yIERvb2xleSDlhpnpgZM6Cj4gT24gV2VkLCBPY3Qg
MDQsIDIwMjMgYXQgMDk6NTc6MzNBTSArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToK
Pj4gT24gMDQvMTAvMjAyMyAwOToyMywgQ2hlbiBXYW5nIHdyb3RlOgo+Pj4g5ZyoIDIwMjMvOS8z
MCAyMDozOSwgSmlzaGVuZyBaaGFuZyDlhpnpgZM6Cj4+Pj4gQWRkIGluaXRpYWwgZGV2aWNlIHRy
ZWUgZm9yIHRoZSBDVjE4MDBCIFJJU0MtViBTb0MgYnkgU09QSEdPLgo+Pj4+Cj4+Pj4gU2lnbmVk
LW9mZi1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+Pj4+IC0tLQo+Pj4+
ICAgIGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgwMGIuZHRzaSB8IDExNyArKysrKysr
KysrKysrKysrKysrKysrKysKPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMTE3IGluc2VydGlvbnMo
KykKPj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28v
Y3YxODAwYi5kdHNpCj4+PiBIaSwgSmlzaGVuZywgYXMgZmFyIGFzIEkga25vdywgc2cyMDQyIGFu
ZCBjdjE4MHggYXJlIG5vdyB0cmFja2VkIGJ5Cj4+PiBkaWZmZXJlbnQgcGVvcGxlIGFuZCBldmVu
IGluIHNvcGhnbywgdGhleSBhcmUgdHdvIGluZGVwZW5kZW50Cj4+PiBwcm9qZWN0cyhzZzIwNDIg
aXMgdGFyZ2V0IGZvciBIUEMgYW5kIGN2MTgweCBpcyB0YXJnZXQgZm9yIGVtYmVkZWQKPj4+IGRl
dmljZSkuIFRvIGZhY2lsaXRhdGUgZnV0dXJlIG1hbmFnZW1lbnQgYW5kIHJldmlldywgSSByZWNv
bW1lbmQKPj4+IHJlZ2lzdGVyaW5nIHRoZSBtYWludGFpbmVyIGluZm9ybWF0aW9uIGluIHR3byBl
bnRyaWVzIGluIE1BSU5UQUlORVJTLgo+Pj4gVGhlIGV4YW1wbGUgaXMgYXMgZm9sbG93czoKPj4+
Cj4+PiBgYGAKPj4+Cj4+PiBTT1BIR08gQ1YxODBYIERFVklDRVRSRUVTCj4+PiBNOsKgIEppc2hl
bmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPj4+IEY6wqAgYXJjaC9yaXNjdi9ib290L2R0
cy9zb3BoZ28vY3YxODAwYi1taWxrdi1kdW8uZHRzCj4+PiBGOsKgIGFyY2gvcmlzY3YvYm9vdC9k
dHMvc29waGdvL2N2MTgwMGIuZHRzaQo+Pj4KPj4+IFNPUEhHTyBTRzIwNDIgREVWSUNFVFJFRVMK
Pj4+IE06wqAgQ2hhbyBXZWkgPGNoYW8ud2VpQHNvcGhnby5jb20+Cj4+PiBNOsKgIENoZW4gV2Fu
ZyA8dW5pY29ybnh3QGdtYWlsLmNvbT4KPj4+IFM6wqAgTWFpbnRhaW5lZAo+Pj4gRjrCoCBhcmNo
L3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9NYWtlZmlsZQo+Pj4gRjrCoCBhcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3NvcGhnby9zZzIwNDItY3B1cy5kdHNpCj4+PiBGOsKgIGFyY2gvcmlzY3YvYm9vdC9kdHMv
c29waGdvL3NnMjA0Mi1taWxrdi1waW9uZWVyLmR0cwo+Pj4gRjrCoCBhcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3NvcGhnby9zZzIwNDIuZHRzaQo+Pj4gRjrCoCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcmlzY3Yvc29waGdvLnlhbWwKPj4+IGBgYAo+Pj4KPj4+IEZvciBNYWtlZmlsZSBh
bmQgc29waGdvLnlhbWwgc3VjaCBjb21tb24gZmlsZXMsIGp1c3Qga2VlcCBpbiBzZzIwNDIKPj4+
IGVudHJ5IHNob3VsZCBiZSBmaW5lLgo+Pj4KPj4+IEBDb25vciwgd2hhdCBkbyB5b3UgdGhpbms/
Cj4+IFdlIGRvIG5vIGhhdmUgdXN1YWxseSBwZXItYm9hcmQgbWFpbnRhaW5lciBlbnRyaWVzICh3
aXRoIGZldwo+PiBleGNlcHRpb25zKS4gSSBzdHJvbmdseSBwcmVmZXIgdGhpcyBvbmUgaW5zdGVh
ZDoKPj4KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzgyOWIxMjJkYTUyNDgyNzA3Yjc4
M2RjM2Q5M2QzZmYwMTc5Y2IwY2EuY2FtZWxAcGVyY2hlcy5jb20vCj4gSSBkb24ndCBsaWtlIHRo
ZSBzdWdnZXN0aW9uIGhlcmUgZm9yIGEgZGlmZmVyZW50IHJlYXNvbiEgV2hpbGUgSSdtIGZpbmUK
PiB3aXRoIGhhdmluZyBzb21lIHBlci1ib2FyZCBTb0MgbWFpbnRhaW5lcnMsIGVzcC4gc2luY2Ug
dGhlIGN2MTgwMCBzdHVmZgo+IGlzIHZlcnkgZGlmZmVyZW50IHRvIHRoZSBzZzIwNDIsIEkgd2Fu
dCB0byBzZWUgc29tZW9uZSBzdGVwIHVwIHRvIGFwcGx5Cj4gdGhlIHBhdGNoZXMgZm9yIHRoZSB3
aG9sZSBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby8gZGlyZWN0b3J5IG9uY2UgbW9yZQo+IGNv
bWZvcnRhYmxlIHdpdGggdGhlIHByb2Nlc3MsIG5vdCByZWR1Y2UgdGhlIGVudHJ5IHRvIGNvdmVy
IGp1c3QgdGhlIDY0Cj4gY29yZSBTb0MuCj4KPiBUaGFua3MsCj4gQ29ub3IuClRoYW5rcywgQ29u
b3IgYW5kIEtyenlzdG9mLsKgIEFncmVlIHdpdGggeW91LCBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8g
a2VlcCAKb25seSBvbmUgZW50cnkgZm9yIGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvLyBkaXJl
Y3RvcnkuIEkgd2lsbCBkaXNjdXNzIAp3aXRoIG90aGVyIHBlb3BsZSB3b3JraW5nIG9uIHNvcGhn
byBhbmQgc3BlY2lmeSBhIHVuaWZpZWQgbWFpbnRlbmFuY2UgCnRhc2sgdG8gbWFpbnRhaW4gZmls
ZXMgdW5kZXIgaXQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
