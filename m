Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF91C30658
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 12:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LatAZw6hlp9ZaifY5l3zNNBebPAthaZvpdf173NJ2Qs=; b=D8tvty6dnv4flXtFLNLk3dRzYz
	I7/FrN9KMG3xsvJa25GO02P3CRt0a9xWqenotNWCcRZnEASQPMb4vQls1lx7GTX5h1YcU4tNYhV3/
	4mpYgCucMEVofSkY6ENWRJwutXZVfuwudEwaY8OeRMLRdfBPfN58wmkIQUOMRs/XQF1TsIrTLyrRh
	f82/1Cr0UhaJu2Uj6DpdoZI1EgUtPagV+/frW0112x918ak2h9dESyyVnLe8rzPdG0EK1KcWEiTsO
	yyTNv1nUMm+qVxeaOFX3kpAWPi7l1wY1RwPcWYqSOVNg4HfP4wlsgqoFb8VCqrXV7P79zfFJaSWhP
	rBtZ19Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPiDg-0000000FvfT-3ye0;
	Fri, 05 Jul 2024 12:39:20 +0000
Received: from mail-bmxind01olkn20813.outbound.protection.outlook.com ([2a01:111:f403:281c::813] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPiDd-0000000Fvdb-1kFS
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 12:39:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhCOvngeqXlWX39ODM1TvQ6ZrZZCMF57UMuu62+OKnsaQClQWwfPqTsPKYLoByzAlWN8eaFasHubcs/1veNEsdjd+YBTOr6XzJFzSnblfeT+bolPmJFnugf0e/gE17t8MSCYm/BbWQr3hXukI2duZNC5DYcnHfxKobPetCccuZT8bz3s5yhnT1R8PFtLFZxDAFWxyXzqUHS7JzbJZOnvHa5WHr/IogruUv4onWBNVqBQaGqCoC9jWhdSjQBb19wf4ciKPi4XL5Rh8u+pHb9ajCAt2c1V9ARY6Hoao4I8BKOU7/37dxw2RBieAKONfTRb2x9YAhjycUraVFEH3sIb8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fwwuibg7rzbiOrFoCqqc4PSd1JP4j20igxvJdL5HuCA=;
 b=HJsjJw5jTxHFNqz4TOhSkbxJ8Ow/RXRK9KKIlmv5VsZH+GlPnEUtuw3HQhyb0wlbjQ0aLey5HKhtaPgm7g98xPKjaebYKaHpzEDlG2KgatC3qTqX3n7RRixPNhvzsINu0q5oSv4VOcP3gjGbjuoxBWxaNZUB9MArOjsbN7ScRZqaJehle+JSABUQKC3iMMO8Js5u5w4nH6rM7D9dBo+7e/MMtGoToF/aqhMHy++AM7QCXHSpEtalDOiBDE91XbdeYKQWXDlMzfAGFcoKWnPFAEUsgB16AbIoFJ4dH7uTIcITvOWU6gRAT98uxc5GGQnirkCD5v806OJLF+nQUJXw8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fwwuibg7rzbiOrFoCqqc4PSd1JP4j20igxvJdL5HuCA=;
 b=ln38gqJcbbG9Id/MJyLIsdwbeoACw5MlWVU2srLOx6fsEsrLrxqJ6ujHeIBgrnvOG8lYjZd2Uu2qgUOcHxYauJL9HUp77XPzlPOdHXdp9LhjTIiLQLVq/T0MdQkOP4cxiAYBzrgHKyoETHv4z98ZhicFN0ARnyJNRtiw1MWI4knR7kO2abqJM3cBd1Ksw0Jry9WE6B9jttk12bgaZxI1ELE93FggDyaB5m3iaDe5NDSdLl8itpOr9Q+kZbF9FhXhX8pnKphjMxp4D/oho73WF8/NMci7WQCCO8KvUl3aM26RcQCBLLXhNLuf2Q2m/Kb2xfVvaCtIFWoEEKnU08U4sQ==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by MAZP287MB0452.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:d3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.30; Fri, 5 Jul
 2024 12:39:02 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.7741.027; Fri, 5 Jul 2024
 12:39:02 +0000
Message-ID: <MA0P287MB2822F6666A518B70019EA43FFEDF2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 5 Jul 2024 20:38:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] RISC-V Sophgo SG2042 clock drivers for v6.11
From: Chen Wang <unicorn_wang@outlook.com>
To: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Inochi Amaoto <inochiama@outlook.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com,
 Chao Wei <chao.wei@sophgo.com>
References: <MA0P287MB28221A333D852974F55E3228FEC22@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <MA0P287MB2822C5A4682AE9EA6AB3B9E4FED72@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB2822C5A4682AE9EA6AB3B9E4FED72@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-TMN: [u2fFg8fIhhN5In+sYuycoZQGHLPolFEr]
X-ClientProxiedBy: TYAPR01CA0008.jpnprd01.prod.outlook.com (2603:1096:404::20)
 To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <1bd7b08b-824c-41a3-af76-e15221a96886@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|MAZP287MB0452:EE_
X-MS-Office365-Filtering-Correlation-Id: cf91e23d-dcb2-4d79-f731-08dc9cef7313
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|19110799003|8060799006|4302099013|440099028|3412199025|1602099012;
X-Microsoft-Antispam-Message-Info: S7ZrqGWOkSJQmn0jXAFDso2dsh93ugZs8gfBNdffsG62DE9fmyaLZShHSHvklU3JD9rSEd+3uIKVoYRrC/j9AJtF2K9LgqVxjQFkjmdoLN9CJ4goPN96v7AEVKBU2NJNmURh/lISqvz20hGPacikNaSNIq+s9ruQojuRZBOuN1Cq34GEmt2A09kb808NRw+++lIbnW1xDD+TjBO50Cz15nkLek7MoY3wxtk2qQTvWwc60muouNziB+CuBS/XRzaQSd7LdNv22NuOheRcCbm4hSRDc7MRS7ffjpHUPYZ8hRlxtsmnZVsmbgWOaP7YvPxsdVdZbI5sTXz7VscKeCNMPdrN+ZYxRSMa7eJDRkES7QuSt8cL1XBeJLhujMycNjmOJHuyGH2JC8s/nEXnl8yv89NY3EyZED/7qxbWGn8Vr/swVnXfjc2/hP/oUe1R9n2eweTadeX3LyJ1TFd8E/XXQkZwiedfQ2cqU/lrVqqvenoWzs1Oeo3SqG/DLr+fzV2kiJo1TXEf0fJCO2FPgb7xZ/LAQsA3UrOWXaxZlfDtBeQYaMHE+MJYBh5Vsp7v58mBZBoobL2PhmMJUXHbO/Kwo0cKDT/vEI6Ra0U7Mw4j2Le1gwlv5Am1GuOf/WSn6Ti139RzbdbyNQQ1EYXDDMP2Oodx6WjdvL3utT8zBw3AsgaGwAMzpM4TL0rPEpT5ZKkdgpvvEVzpqswfgPm1KHMmT9Dj0yT9OQkzDypDubCziHN3hdIQl572kl173ruXXEs9z69ZA1+AL95nvQm3q8zdww==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHZ1OEc4YyszTWtjanBUMm14VmM2UDlzNFpnRDhJVXQ2b2VwMkQrUmVTc0dq?=
 =?utf-8?B?TW5xZEpMUjRPZE4yRWFGamhTUzUweEp0WmJNa3BIWndqSU1ickNOdE80dnlZ?=
 =?utf-8?B?MnMxc052VkxZMUxrd0phOTRlcU8rZDZhaXJXa0p4OUlydmVuTFZJR0wwRVEv?=
 =?utf-8?B?MHlleUIxSzBZdnVIUjJpdTF5MHV4Mkp2OWZIeVlqa3p6dGVLVUVoNFVtbDly?=
 =?utf-8?B?WEIwaHlHZ3FlMHF1SGJhbjhFbFovUGtFcWFOMlIwMUFnTS9TaDVXR1ZlSlF1?=
 =?utf-8?B?Unc4SDdpSGdpeXRrUzJoMWdkTkE1SExkdEdRNVZTdTBtckdYWlR1VnJCb2Z4?=
 =?utf-8?B?UTc0SkkyZ04yeVo5bUYvTDFGWS9Uc3FvTkg5UUpQTGYvSGc1ZG4vWG5qMEo1?=
 =?utf-8?B?VkhrNC9jdktPcHJibzZidEo1OXY4aWc1K0FTZnE3MWlIREhFajZReE9ESWlY?=
 =?utf-8?B?cWUzQzE3Ni9ieTBBVGNNc0RIQ2lsbngybWF0SEp1RFVWOXMwNmZ5dS9teWRW?=
 =?utf-8?B?QnpTQmY1WFlXdlk3bGxNS3cwekNYUVZQMWFhQTlnekVhMG5OMUhUZ3p0V3Zm?=
 =?utf-8?B?N1pGYUx4WTMydWM5dEN1UFZkMnV5QlRJQzBLQ0FjOHpCVXVLSTYzR2RSNTFz?=
 =?utf-8?B?UkFhN0t3L2Fjenh0OFFrcVJqM0ZQbnBHeXlJL1JFZ0lRU09UdUZ6N2cxUU14?=
 =?utf-8?B?MDVLT240MW5yeFFFVEFJRjNxRUkvZVdRRThtME4zS0sveUFlL3ZKRlA0OElz?=
 =?utf-8?B?U0RNbDkxNURFQnZFM0d1cWtFa3BUOUVLNlBhMGdDR0RKYjZZbGJEVDFjOG5X?=
 =?utf-8?B?TnF5OURIRlpQL2JvYnJqdWpiR0ZNWmRVV2kyVEl5a1ZXT0FUNUVCMERGYklR?=
 =?utf-8?B?Z2RSNktJajVTeWNUVjVpa0xhdVZuNkhEczVUcjNmd3cyWEM1SURkTUl0Q3hG?=
 =?utf-8?B?SklpUTVHSmxiVFpFQ2l4RkVQUDNRbWxLbXdlWlhnazFlZ1Z6S3k4LytzV2Z4?=
 =?utf-8?B?QUFBUWl4NWx3ZzQ4QUZWMXM0aWlldi9ZT1ppZ2swRHNZUUVEUDMyL05YVlh6?=
 =?utf-8?B?T1k5SjRUampZbjZsVzd2MTJSemNHTzRTaXRWYlkzTXEraFVYWFpXU2t6WnRX?=
 =?utf-8?B?ZUxqYmxYNE9tcWVZcnRnRThIRlozNnBFbnpJL1daNWVXdEdSOFlEMWlmc1lT?=
 =?utf-8?B?K28wNm1nNmhUY2JwWWhZd2x5SFc0S253ejZGRFBpU09KbVFhbUk4ZnErcHl6?=
 =?utf-8?B?bm5tVkwvSldRVm1qZ1J4Um9aN2NYY1I1MTdqU05mNzdJN2phbFFRc05xQWhy?=
 =?utf-8?B?MXVjRVV2V1Nybk9BQXFVTEZmMFJ5M2pCMzZqMmZXS3RiMXhPRFNxdndpTmk3?=
 =?utf-8?B?Wlhid3k4OEZ6K1ZrUXZsb2dGKzMySkthVzRuQkZHR1k3YkQ2ZkZQblFwUDJ6?=
 =?utf-8?B?TkdaM1FpSWFyem0xS3c0SytrbTRDWEVnNWZqV01aT0NGRGR0TE1MT3B6UXFo?=
 =?utf-8?B?bUlxR2kxVGEyRGxmRGZjalREc2lHQ0ZzcnRaY25YTmtua2hMbFhVOUR0SC9F?=
 =?utf-8?B?Z2IzOXB6RXB4cVRhbjVzNkZSdi9iNzFQaVpqSGFNWkFTVU1NNDZadTdLKzBD?=
 =?utf-8?B?d3hoM00wZVFKZGphY0x6VkRCclNIbUtDWXpZN3JJT0tEbGI2bEZOcm9uNmRV?=
 =?utf-8?Q?18aECCXt6GaVgPM9x4tD?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf91e23d-dcb2-4d79-f731-08dc9cef7313
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 12:39:02.3764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZP287MB0452
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_053917_490776_B8314051 
X-CRM114-Status: GOOD (  14.24  )
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

UmVzZW5kLgoKSGksIFN0ZXBoZW4sCgpDYW4gd2UgaGF2ZSB0aGlzIG1lcmdlZCBpbiB2Ni4xMT8K
ClRoYW5rcywKCkNoZW4KCgpPbiAyMDI0LzYvMjcgMTg6MjYsIENoZW4gV2FuZyB3cm90ZToKPiBI
ae+8jCBTdGVwaGVu77yMCj4KPiBJcyBpdCBvayBmb3IgeW91IHRvIHB1bGwgdGhpcyBwYXRjaHNl
dO+8nyBJIHJlYWRsbHkgaG9wZSB3ZSBjYW4gZ2V0IHRoaXMgCj4gaW4gdjYuMTEuCj4KPiBUaGFu
a3MsCj4KPiBDaGVuLgo+Cj4KPiBPbiAyMDI0LzYvMTQgMTU6MjgsIENoZW4gV2FuZyB3cm90ZToK
Pj4gSGV5LCBTdGVwaGVuLAo+Pgo+PiBQbGVhc2UgcHVsbCBjbG9jayBjaGFuZ2VzIGZvciBSSVND
LVYvU29waGdvL1NHMjA0Mi4KPj4KPj4gRm9yIGR0cyBwYXJ0LCBJIHdpbGwgaGFuZGxlIGl0IGF0
IG15IHNpZGUuCj4+Cj4+IEkgc2VuZCB0aGlzIFBSIGp1c3Qgd2FudCB0byBleHBlZGl0ZSBwYXRj
aGVzIGZvciB0aGlzIGNsb2NrIGRyaXZlci4gCj4+IFRoZSBwYXRjaGVzIGhhdmUgZ29uZSB0aHJv
dWdoIDE2IHJvdW5kcyBvZiByZXZpZXcgWzFdLCBhbmQgSSBoYXZlIAo+PiBjYXJlZnVsbHkgY2hl
Y2tlZCBhbmQgcmV2aXNlZCBhbGwgb2YgdGhlbSBiYXNlZCBvbiBldmVyeW9uZSdzIGNvbW1lbnRz
Lgo+Pgo+PiBMaW5rOiAKPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvY292
ZXIuMTcxNzY2MTc5OC5naXQudW5pY29ybl93YW5nQG91dGxvb2suY29tLyAKPj4gWzFdCj4+Cj4+
IFRoYW5rcywKPj4gQ2hlbi4KPj4KPj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1p
dCAKPj4gMTYxM2U2MDRkZjBjZDM1OWNmMmE3ZmJkOWJlN2EwYmNmYWNmYWJkMDoKPj4KPj4gwqAg
TGludXggNi4xMC1yYzEgKDIwMjQtMDUtMjYgMTU6MjA6MTIgLTA3MDApCj4+Cj4+IGFyZSBhdmFp
bGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+Pgo+PiDCoCBodHRwczovL2dpdGh1Yi5j
b20vc29waGdvL2xpbnV4LmdpdCB0YWdzL3Jpc2N2LXNnMjA0Mi1jbGstZm9yLXY2LjExCj4+Cj4+
IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA0OGNmN2UwMTM4NmU3ZTM1ZWExMjI1NWJj
NDAxYmRkNDg0YzM0ZTdkOgo+Pgo+PiDCoCBjbGs6IHNvcGhnbzogQWRkIFNHMjA0MiBjbG9jayBk
cml2ZXIgKDIwMjQtMDYtMTQgMTQ6NDk6NDAgKzA4MDApCj4+Cj4+IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gUklTQy1W
IFNHMjA0MiBjbG9jayBkcml2ZXIgY2hhbmdlcyBmb3IgdjYuMTEKPj4KPj4gU29waGdvOgo+PiBB
ZGRlZCBjbG9jayBzdXBwb3J0IGZvciBzZzIwNDIKPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBX
YW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+Cj4+Cj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gQ2hlbiBXYW5n
ICg0KToKPj4gwqDCoMKgwqDCoCBkdC1iaW5kaW5nczogY2xvY2s6IHNvcGhnbzogYWRkIHBsbCBj
bG9ja3MgZm9yIFNHMjA0Mgo+PiDCoMKgwqDCoMKgIGR0LWJpbmRpbmdzOiBjbG9jazogc29waGdv
OiBhZGQgUlAgZ2F0ZSBjbG9ja3MgZm9yIFNHMjA0Mgo+PiDCoMKgwqDCoMKgIGR0LWJpbmRpbmdz
OiBjbG9jazogc29waGdvOiBhZGQgY2xrZ2VuIGZvciBTRzIwNDIKPj4gwqDCoMKgwqDCoCBjbGs6
IHNvcGhnbzogQWRkIFNHMjA0MiBjbG9jayBkcml2ZXIKPj4KPj4gwqBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvY2xvY2svc29waGdvLHNnMjA0Mi1jbGtnZW4ueWFtbCB8IAo+PiA2
MSArKysrKwo+PiDCoERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9zb3Bo
Z28sc2cyMDQyLXBsbC55YW1sIHzCoMKgIAo+PiA1MyArKysrCj4+IMKgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3NvcGhnbyxzZzIwNDItcnBnYXRlLnlhbWwgfCAKPj4g
NDkgKysrKwo+PiDCoGRyaXZlcnMvY2xrL3NvcGhnby9LY29uZmlnIHzCoMKgIDI4ICsrKwo+PiDC
oGRyaXZlcnMvY2xrL3NvcGhnby9NYWtlZmlsZSB8wqDCoMKgIDQgKwo+PiDCoGRyaXZlcnMvY2xr
L3NvcGhnby9jbGstc2cyMDQyLWNsa2dlbi5jIHwgMTE1MiAKPj4gKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCj4+IMKgZHJpdmVycy9jbGsvc29waGdvL2Nsay1zZzIwNDItcGxsLmMgfMKgIDU3
MCAKPj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+IMKgZHJp
dmVycy9jbGsvc29waGdvL2Nsay1zZzIwNDItcnBnYXRlLmMgfMKgIDI5MSArKysrKysrKysrKysr
KysrKysrKysKPj4gwqBkcml2ZXJzL2Nsay9zb3BoZ28vY2xrLXNnMjA0Mi5oIHzCoMKgIDE4ICsr
Cj4+IMKgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQyLWNsa2dlbi5oIHzC
oCAxMTEgKysrKysrKysKPj4gwqBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3NvcGhnbyxzZzIw
NDItcGxsLmggfMKgwqAgMTQgKysKPj4gwqBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3NvcGhn
byxzZzIwNDItcnBnYXRlLmggfMKgwqAgNTggKysrKysKPj4gwqAxMiBmaWxlcyBjaGFuZ2VkLCAy
NDA5IGluc2VydGlvbnMoKykKPj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgCj4+IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQyLWNsa2dlbi55YW1sCj4+
IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IAo+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvY2xvY2svc29waGdvLHNnMjA0Mi1wbGwueWFtbAo+PiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCAK
Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3NvcGhnbyxzZzIwNDIt
cnBnYXRlLnlhbWwKPj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvc29waGdvL2Ns
ay1zZzIwNDItY2xrZ2VuLmMKPj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvc29w
aGdvL2Nsay1zZzIwNDItcGxsLmMKPj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsv
c29waGdvL2Nsay1zZzIwNDItcnBnYXRlLmMKPj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9jbGsvc29waGdvL2Nsay1zZzIwNDIuaAo+PiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRl
L2R0LWJpbmRpbmdzL2Nsb2NrL3NvcGhnbyxzZzIwNDItY2xrZ2VuLmgKPj4gwqBjcmVhdGUgbW9k
ZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQyLXBsbC5oCj4+
IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svc29waGdvLHNn
MjA0Mi1ycGdhdGUuaAo+Pgo+Pgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
