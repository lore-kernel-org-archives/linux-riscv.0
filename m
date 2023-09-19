Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F226CD5BC4
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 14:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:To:References:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nMamBUJu4I7TLBnI1cb+2+u93uqsWQ48GRsKkjkLE+g=; b=ZLwEH04mwiXGZUqg44cAgm7Nm3
	V3DaBpKZo6eaH1J9T+JXyKrWiWa7waS6Mr85xZMfQ0K8yzzsG4W1b1O+sGrItcbXHFpeJeeVbPxQd
	sPpq22vdLQsuvl5g3wex2oiBFWW4y8JhKMbuAH4OJhOHl6DZZnNacfXUpuUfoMxXL1VZ/3ceT9p6y
	DfwkszBGUooH5bnVPTXuf5CacZyrj0X5j6Wdg2WpyCQPwtHzNcFdPb7Zd2UjlD3YUvF0T09N1299K
	gQLBDtFGn3ZcMLAe3VQUvLSuPZ0cy5n679S3BHB+pDsUi0AF3iJmY4uLpygtWBVvWyoXIr3/Bk+u9
	4+WXKl8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qibSA-000cH9-1l;
	Tue, 19 Sep 2023 14:11:50 +0000
Received: from mail-bmxind01olkn20824.outbound.protection.outlook.com ([2a01:111:f403:7011::824] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXZF-00Ha3q-27
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 10:02:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8agmTmcaxFiiVFd9a+TxCZ3ENzJlADAOlZ7NdcRJQxos/4OnIntw+evuvAXnOLtzHjrQG0Isa69/x+TSqm6auqZPxdIoAM103TYwyN9A86TOs4u0cJBpw9EkqvJ17KXQJXh15+JtBy5AskDRFFpezer63Fb41K3DN4wf8DI2+/9UeXPkTwI23lzzU1kf1emESdtm1n9J/vimON9Q5SVvKCSupY05OCGy5Vf57JAvQSHaIdbI4gsRYAYdHZsEtMBpIRyfANrzR0gqNLVy8bFA3yX41v6Ju47UUCbchfsr07rQAnuQG+S7X/mnJyImvvD/IpG/VBJF3DnedJ0oWIU9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yz+sotCaogLcXekREVzu60ftsgobRkbWya4h0166zgk=;
 b=QBBE4TDZ9a5PGGGP6tEd0wQTq8V4v7AezfRNkw72PBGVXd1jhugmRc2DGPbFOb3UPTFVvcYASvY/BSdLM/dadGmVsRjMVgYWyZzPk9/rDPvjZytaXLZ6NXCm0Le4eVqRxD1Nd9bDNlAjX0lpe1XZa8608lTQsgBbBelxDiiKVGcsedb6r/oCpYVYrpVFmrKH+m6ajpTPu6v3iGkZ/UKlyD2KPW4Gba6SBZjFbrA2vgrE7+sm8LU15bRGQ20KgaVFZVYvLybPR1QPvgn14IevV4TW26f+Cqkn99SOJZVzk0MS4oToTviGhFHeke9NqkJfVNOpybnJ1sHpVB8a90RICw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yz+sotCaogLcXekREVzu60ftsgobRkbWya4h0166zgk=;
 b=iIkkZ7RyDe3neOtZnTB0x6b0oGbNiQ9xTPm0GiMn0tfriN5S/q3SG/yOs6wBMb5g+7jcCwW1f+0+SGgWl18HjxF9yAvqujUkf9C3y0HlTH4ctePrnwbheIXdFVRDWF+Jj0lS0goG0Zv3WouujibE8qyZICffAsm+LetWyR0MzEdkl+2zZb7xvbf+J5JY3zI62N8zZvwibkNpvnbxpP5l0Gglh2n/0rKv0/cgvcRREE4AoYVjtsf1zIddHDUvEldJa36/CPYzLDpbVcDBbQhbzkdZlABuAmOCLR6tDmDAyqv/AVlFHqp+W7ld/YIzrodQfROCWxX+mnnC4OkxcxEv+Q==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 PN2P287MB1165.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:154::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.27; Tue, 19 Sep 2023 09:48:17 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7%3]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 09:48:17 +0000
Message-ID: <MA0P287MB0332FA927E168C6063DF3BD9FEFAA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 19 Sep 2023 17:48:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Fwd: Question about writing binding files for numa
References: <CAHAQgRC5-tSnUZXHxTeVDhYK1m0XCzXho097bV2Awj-6XJ-UFA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <CAHAQgRC5-tSnUZXHxTeVDhYK1m0XCzXho097bV2Awj-6XJ-UFA@mail.gmail.com>
X-Forwarded-Message-Id: <CAHAQgRC5-tSnUZXHxTeVDhYK1m0XCzXho097bV2Awj-6XJ-UFA@mail.gmail.com>
X-TMN: [T3/lI2p6IRQbuIBsfk+7s1nMYfqXzNOm]
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <125e2cdc-419b-4c42-8f27-0899403f103d@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|PN2P287MB1165:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c1a8953-0180-4c01-0792-08dbb8f58cc5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SKmatuqUwGzUS/q2r4TrKUXXkq9yg9yveELdJslu9a15n3T+48z1+BHmqESZmiAM7rflCrAbC0SMNTFFX8N99kJToZa37nbBjxge7yGglmy0gDz+qSbtdA3hTYkoI/PYI7u5ZPcEgmAlKIM2w5z+kwNHnxBUictDTR6SEQbrqXqzUz2D36LJPCVA95IVDpkmrRxjtuncO+A1peAva/Hk5FwTlWMuCLs3jD3SFpVq1bKVPfELBl3cq+YxhZFfzjO3ohhhnmSg2KVCtceB4oKXkdmmzasfyCUVFQ3pggT85D1R4m7d+pBBnuS3vdc/0xJdJqRlYI2n755DAJBN63uq5a82pPDYFKnu0ShzhaqdvXOeCbGjEHgt5JWojxQf8rxT2MamDidBalDmDXS54EL3/eZSwTQNxlNLpNGJa2wvP1RgSOsf8a+3cavSODT9pVxVXyE0ba4Lb5e2vN1wAHIcSK4jEZgfIMAFby9Bn6xp7xPrcULsWOnbNg/6anKlwhv4n47YMXBQwvbFsugx6viZNwUYr4FXUAcaon8NcYYuO1HsZegjmZ8YlHLqg18y3mq3c8E1vz42+zeDyQyGacyKeklh3FAt+SRZT+vXBsV6J0g=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2ZGRWFKOTJ6aHpacnAyWFdOUTBCWXJuZTRJdSs4bDhRdlhMOE9Ya085UjFi?=
 =?utf-8?B?OWpiWEloL1V5N0Y1MzVLWkFDQ2lUZzZGejhPekhaWnF2YkVnVERHbXVmek5m?=
 =?utf-8?B?NmVDWXRGNVowZzYzWTVwUXBxQUh6UGUxcFFLcWF4MjF0WHVVNUFicVNwekZ5?=
 =?utf-8?B?REFuYXpaYzlua0ROa2g5TUVBOGNJQ2tNR3cvbWxrSUI1MndQaGtEZlEzNlVm?=
 =?utf-8?B?UjNkdFFzaFljaVJYQStpWGdCQ1RMckhzMVZya0xVYThoOWJMa0xudzkxdG1E?=
 =?utf-8?B?WDJabGxMY01uNjN0TmtDSlpUVEl3WkdNeG5QR3NqNXBaYlZ1b2ZvdENpb3A4?=
 =?utf-8?B?b211MmtxdmNONDdBWnRmUEZaemhTZk42ZzRVdm9KK2U2aFFpam5NMjNMVk4v?=
 =?utf-8?B?YkhuTzZrTzRlQkZhM1hEQzhXV1ZCOEdQNzhsWkZaNFY5V2F6TW1VM2FoR1Vk?=
 =?utf-8?B?MXJaSThtbUNrZUxKVGNGMllSWGV1TEQ2ekFoeS9KV1EvOHBaK1htNUQvSUNt?=
 =?utf-8?B?TUoxMnRhS1NHMFZYZEd5VWdjN3BBMkhyMXFacUZNTUx4cGFmSUowNVB5enNz?=
 =?utf-8?B?Q0FES2hBZDFOQmZnenkwUWtPT0hDN1p0cm81a1JYbFFuVS9GTnlyMUlxd2NW?=
 =?utf-8?B?MXkrS0sybzdRakpPYnRIUWR4V05WeSs1K0FMVGFOYU5CcCt3V2tKWEJIL0N0?=
 =?utf-8?B?L3BLbU9ENkFGTkEyNXZEcnkvWEovNjB2V0FoS2RuQ2pLSURrakh1OTkyWHJN?=
 =?utf-8?B?Tkw5YzB2YWJzNXgvNGdvdGZEVmF2L2JMdjFpVkRxbGxoOWdaKzRFenBJZEZS?=
 =?utf-8?B?R0xiTmdpQWs5OUxvendnRGhmL0xqKzE2Si9jWktTQmp6OHhJKzVISzNwSjNX?=
 =?utf-8?B?M3R0RDQ1dHRTTXBSK2phRkJFZ3dHRWkzdW85N2h0UTZkMGxqZXR0UVh3am9B?=
 =?utf-8?B?Yi8veGFTSmZ3NGdVQW9YQ2NGUzRHT28zVFQyVkxpbmtZaDdkV0JuZE5IblBp?=
 =?utf-8?B?VjZDc3FCNWJMT2pMOVFWYXpCaXRZeVNzTml6TXRPcSt3UnVWbStWenRnRksv?=
 =?utf-8?B?ZDZPenQ0bCt1YWIrRzd4WFI0TmVENWZEZGV1Wk5kR2prZFhmcjN0OUh4OXhE?=
 =?utf-8?B?NzExTVFTcG45MUdiU0x0b0RmWUQwalFGUEUrZ0k2K1BZOVZ6SXFzTm0xU2RR?=
 =?utf-8?B?cjBnd25nd1A0SkFEcnBSZXd0WmNpUlZhYUg2MHF3TGxuWTRaRkhQMklpWjZv?=
 =?utf-8?B?MDRzZ0dNN2dlclZzcm9nNHEwMDJ6K1RtcGw4UXkxdUJkbDBMNmJnYWFZRzRJ?=
 =?utf-8?B?TUovT3RBZ0oxbE1qOFgxaHVlNmEzWUJuWnQ1ak5wYWFaVDFqZDhMN3VTUTNp?=
 =?utf-8?B?T1FDMDY2Zkd4VGs4WkpVWkRZMHgxTWVLVkxxRFlkbjRKT1BOSlRZcUVzdjBB?=
 =?utf-8?B?R3pMbGkwRmZQNEl3c0ZvUlMvR2ZmcW9DVnFSYTJmWTRnc051cm1FcGpBV0lh?=
 =?utf-8?B?alhuYlVtVmRERjIxcStYREFaZ1FPOHN1Slhydkd0WDNpYzA3dVZUNGNDd21u?=
 =?utf-8?B?ak81eUo4UlQ3UzJzaVZyMG9HTzdYa3drRE10WVVFd1JxZkYrZFNyYU50V3hk?=
 =?utf-8?Q?w75FlCvwkHiRwhSWXE8dHVDQhaqyEY0jEbdWVPKrlC00=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c1a8953-0180-4c01-0792-08dbb8f58cc5
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 09:48:17.5091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1165
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_030253_708099_8E0E764A 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 19 Sep 2023 07:11:49 -0700
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

YWRkaW5nIGxvb3AgdG8gbGludXgtcmlzY3YgbWFpbGxpc3QuCgoKCi0tLS0tLS0tIOi9rOWPkeea
hOa2iOaBryAtLS0tLS0tLQrkuLvpopg6IAlRdWVzdGlvbiBhYm91dCB3cml0aW5nIGJpbmRpbmcg
ZmlsZXMgZm9yIG51bWEK5pel5pyfOiAJVHVlLCAxOSBTZXAgMjAyMyAxMzozMzoxNiArMDgwMApG
cm9tOiAJQ2hlbiBXYW5nIDx1bmljb3JueHdAZ21haWwuY29tPgrmlLbku7bkuro6IAlyb2JoK2R0
QGtlcm5lbC5vcmcsIGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZywgQ29ub3IgCkRv
b2xleSA8Y29ub3JAa2VybmVsLm9yZz4sIHhpYW9ndWFuZy54aW5nIDx4aWFvZ3VhbmcueGluZ0Bz
b3BoZ28uY29tPiwgCmpzemhhbmdAa2VybmVsLm9yZywgSW5vY2hpIEFtYW90byA8aW5vY2hpYW1h
QG91dGxvb2suY29tPiwgCmRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnLCBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnCuaKhOmAgTogCUNoZW4gV2FuZyA8dW5pY29ybnh3QGdtYWlsLmNvbT4K
CgoKSGksIEkgYW0gd29ya2luZyBvbiB3cml0aW5nIGR0cyBmb3IgYSBuZXcgU09DIC0gU0cyMDQy
LCB5b3UgY2FuIHNlZQp0aGUgY2hhbmdlcyBvbiAKaHR0cHM6Ly9naXRodWIuY29tL3VuaWNvcm54
L2xpbnV4LXJpc2N2L2NvbW1pdC9lZTg2MmZjNGViZWFkZTMyYmZmMDBhZDAxNGQ2YjA1MTNjMDk0
MmE3LgpUaGlzIGhhcmR3YXJlIHVzZXMgYSBOVU1BIGFyY2hpdGVjdHVyZSwgc28gYSAiZGlzdGFu
Y2UtbWFwIiBub2RlIGlzCmFkZGVkIGFuZCBzZXZlcmFsICJudW1hLW5vZGUtaWQiIGFyZSBhZGRl
ZCBmb3IgY3B1L21lbW9yeS4gVGhlIHByb2JsZW0KaXMgSSBmaW5kIHRoZXJlIGlzIG5vIFlBTUwg
YmluZGluZyBmb3IgbnVtYSwgSSBvbmx5IGZpbmQKIkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9udW1hLnR4dCIuIFRvIHBhc3MgZHRiIGNoZWNrIEkgd2FudAp0byBjb252ZXJ0IHRo
ZSB0eHQgdG8geWFtbCBmaWxlLgoKTXkgcXVlc3Rpb24gaXM6IGhvdyB0byBoYW5kbGUgdGhlICJu
dW1hLW5vZGUtaWQiIHdoaWNoIGlzIGxpc3RlZCBpbgp0aGUgbnVtYS50eHQgZmlsZS4gVG8gbXkg
dW5kZXJzdGFuZGluZywgZHVlIHRvIGNwdS9tZW1vcnkgbm9kZSBuZWVkIHRvCmNvbnRhaW4gdGhp
cyBwcm9wZXJ0eS4gSSBzaG91bGQgZmluZCBzb21lIGJpbmRpbmcgZmlsZXMgZm9yIGNwdS9tZW1v
cnkKYW5kIGFkZCAibnVtYS1ub2RlLWlkIiBmb3IgY3B1L21lbW9yeS4KRm9yICJjcHUiLCBJIGZp
bmQgYQoiRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbCIs
IHdoZXJlIEkgdGhpbmsgSQpjYW4gYWRkIGEgcHJvcGVydHkgb2YgIm51bWEtbm9kZS1pZCIgdG8u
IE5vdGUgdGhlIFNHMjA0MiBpcyBhIFJJU0MtVgpjaGlwLgpCdXQgZm9yICJtZW1vcnkiLCB3aGVy
ZSBzaG91bGQgSSBhZGQgIm51bWEtbm9kZS1pZCIgZGVmaW5pdGlvbiB0bz8KClJlZ2FyZHMsCgpD
aGVuIFdhbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
