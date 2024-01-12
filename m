Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CC1C4707C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 08:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rBtj2cBsn8oT/W8QOgXwyJ+/f18geVzF5YVEhUWobY=; b=0jLATT6kafEi+lQab5DRG1gHct
	f/XdhxARlVRPy6ZE2f+l77wTAndZOGZhVxb/MhdYyAKdbRy37QUlTaLVLfdkYQgvQKoJoh9PYNHi7
	u2fSvjrc5txwMHzP2emg2h1kpv4K9TKl51XxOC18YR5ZmZM3rwviNOGmX4vtXWqLYY1Bmi5pEC4jO
	ATBjnUg+mrAmgIz7WfAlMxYK0Ox9VMo31w4Sxf5ewW2b69kgolUijm3hS854QfbYITNrnIe0R4R9o
	iqsQaJqek+wIe4iCGkuO3PfHkEnsjdbueL44Shlcjk8KNgCnoG42SStTUNlWVLkOBsxgWPH0mXRB6
	qeOnuxuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOCtY-002Cc6-0E;
	Fri, 12 Jan 2024 08:28:04 +0000
Received: from mail-bmxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281c::800] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOCtV-002CbI-1y
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 08:28:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8YpJRzh9wOXr1Jn5CoB/HzEtWvEFSsDJTUN9NkjBAONpLUdDC7y1XM2RAVY7A5/xJqj7G+lVncCx1MGs9v0AuDUqlz9bs4K2L+D9P5d2phtTueI57inJAxkv/o07WKgLCwdc/D7krMYg9NJYAFQSNOSnJxKxKfwnzeEAbAC2BlUFKTb66a1MD53YhMrp635DckLJADixSi1NuV+zCHwXrNXIi4yTyb99fVcAqbtbhWc5SgCYC9pb0JpdPwatmLOQldofW/DAjtMASFbh0FsKNVbRu1L8JIPhIbq+36iBpo21pHBH1dv+ghyt17bOtbX6FnmtDR4hidEfY+0kJPsQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DaTJdTg3B12wrLgbWoklTTxqPQ7XQJLsmTt/80ssg0Y=;
 b=Nog92v51G29dQLGTzjVGbdxUWfV1lU2snZkfWALRsaZKGjn9tVFpLtLR11I4B1O+BKet7hbxiuCKjXjXh9IvhaZfQq5OUoSxOBom0iRM6abIcrXuTVmlViqdsUO9U2OcQygxMhT6u64AKrxJiiM6CwG+HUKfXIX+5fSocNZG863bo9BMjau/FXoeiPDl/0Y4ZOMzw5tk2n+VcrSlSp+HDgotH/U/9j57dB6yIrDupJVVGdPM2IqRMJGlYU+zhQRu/V97k00m4uH8+9h6z3mIouFvJhGSFQdbbe6NbWS9OXRoUpRXA9jzGz+HHQv10uyMMBrHahdW6lT4BY9Elp+ejA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DaTJdTg3B12wrLgbWoklTTxqPQ7XQJLsmTt/80ssg0Y=;
 b=ZrmsPGJb75h/5NxvGHTMjLQPcTw/uyqjbw1k9NTGaQvOvXHvMbMxz93befVKwW7EdI+4N2qgcWUk0yQ2IR3k6+zniUjMJGyCWuJ/lHkt4Y0Au0xB4+MEjq+oo4VcqoprhwzNk/5acNfJBBboHtcapBgmwZqYYlHF43yCYjdku9RzY/zHpZZ7Qfu1l7PueZwwgTWHGvGLlq8EGD5t08Pb9lYY23pPkMpG/iyZPRlmjvUQsMnvS9BPOdFfXHLynCDOSiek9faimKC5jcfNOkeaUleKd4Sjz0rfYi8hwxUMv1NffznxBbNJB7pjmYJCX8x0bfwv/UPPxw3L5t17YSc4ng==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN2P287MB1503.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 08:27:38 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::6e80:69e1:f2e7:d70d]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::6e80:69e1:f2e7:d70d%3]) with mapi id 15.20.7181.020; Fri, 12 Jan 2024
 08:27:38 +0000
Message-ID: <MA0P287MB282243605EB9824657607192FE6F2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 12 Jan 2024 16:27:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] dt-bindings: clock: sophgo: support SG2042
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu, chao.wei@sophgo.com,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com,
 robh+dt@kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com,
 xiaoguang.xing@sophgo.com, guoren@kernel.org, jszhang@kernel.org,
 inochiama@outlook.com, samuel.holland@sifive.com
References: <cover.1704694903.git.unicorn_wang@outlook.com>
 <925d99d5b4ece01337cb3389aaea4b631894dd1d.1704694903.git.unicorn_wang@outlook.com>
 <f88b79c3-e44b-4136-ae56-10e1f2502e2d@linaro.org>
 <MA0P287MB2822C7A3C1DC7786708E860BFE692@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240110-untoasted-underfed-fe81479506f6@spud>
 <MA0P287MB282224A6097B4FCCF721C89AFE682@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240111-jolly-prize-930931cc648a@spud>
 <MA0P287MB28229BCC9EA83507B99A9F3BFE6F2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240112-overhead-disallow-8c2a4b97c36c@wendy>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20240112-overhead-disallow-8c2a4b97c36c@wendy>
X-TMN: [epeMN3zhYM4oTnqhGvcLMZ0RAL63rvUA]
X-ClientProxiedBy: SGXP274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::19)
 To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <db25cd73-fe54-4e91-95fd-56e4245fa5d7@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN2P287MB1503:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e12402e-6dd9-432d-b69c-08dc13485618
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bHqlMV4dkZUPbIklg9fH3lB9tsb6j158qVzwf+0NjlTnixHeS8MSOoFBYfCpOE3kikGZtbpzwrG0vJmqeJY92OkolswdQPgvyV4K7b6fVFbBPUNCSXMSfj8pBr2YcxAF2CjqTVTIySVorkIPtPALQueOgrDia7CjYLqDzcgqa9VL1DGd8bm82//BnqsEV98hGV77AvDlDHVz8Zjufub8Sy6q+42tupn2jL+C0Tvc58QIk3jjla9IK+PiOA84ViedPXal0lVp7vgvuLvdn99vskLs85GmtjyIYY5v+DEbwiQoWLjJYvNl/1jzJjJEgpnoTe02U+gLpEzyxaQB2qDINZKASpDfO9ITZk2tsP3Wpl0XL7u1cq5P0M7q1auqWRDUHjHPGWu8u5z7N4btUlJAnJtEusa+MI6deXkhkW9US0maGox6d7blG9F/M7xp4Skfmke69Ul077JwLLo7ScGnPxbhBqJqOowdtwZ0vcOTOhqkmmFW1a3hOW+fPDOgaOQIsDKqvxDQN1DGWybOZoGKg44rs+DEObxMX6BxVx5HqsJ6We5SEJz47/2L6YXaDfDm
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjBpUWNtZ1o1QUZJblA3SmM3S016NFpIZTVtZUhtQ2Q5bFhQK3FuR3pmWDJa?=
 =?utf-8?B?elovU2lJY1M3U1BDc0ZjMFhoQVJLTGdhVUNaRlhoaHJlZWFheUlvUDFyZ1Ix?=
 =?utf-8?B?bWt2R0Y3UGNMUjh0SjlqMG9FUS9XdEJDOG1ZY2lIQlkwNldNUVJIai9NaHBq?=
 =?utf-8?B?a0JHMmJYRUNQNHovcGFpR01FK1RYODZaSXNyRXRic0lycXVpU0UwazVabGwy?=
 =?utf-8?B?OXBrVWRtd21La1NGTUIzS3loRnBuTk5UMnN1T0hkOXJqY2J1TUVvaG9vaGJI?=
 =?utf-8?B?dm15TjRCQzFTd24yVEUwMXg2MWorUmtNdXpUWXpHQ1owVlVGNlQxbldtelM4?=
 =?utf-8?B?MmFWNXpKdkFMVWt1bWlFZkorVnhOczFaakdld3FjeVBJcVZEZUJWU2JmMHJ0?=
 =?utf-8?B?Z2xsektic21EalB2UWlLVmpIa1hFbFkxYjJxV1RwZE9pVDVWcDRncEd6YTdY?=
 =?utf-8?B?Ym5hb1NhZ2pIZVZ4QkU5R3FUYW5DbkFOdDdmR1g2bytFTCtaYnF4K0NMWjJ2?=
 =?utf-8?B?UytReUQvTHFRbHJ6TUtKZGptOVJPMXhaNDd6MG1ZNVZKSVlSeXgrQW1PZ2tK?=
 =?utf-8?B?NHBVM3BxQnVpQkRqL01QOXlGOGdxNXNMRnh1T0t4YXpqRkVxbFJyWDVrUHdz?=
 =?utf-8?B?TWtpV0FBZEhFUEJNMVFINDhUOVpUaG1oTGJTRmZkcklMc3dLVmdWMi9oOUcv?=
 =?utf-8?B?THFOYzJ0ekgycG9kWXIyZXFZRnBiN2NYY2Y3VkcrQmxTTHRYUUhCU1NRYWlD?=
 =?utf-8?B?N040a3BYODUrK0d3MUVxQ1BGREJiMlFWMUo2Q1RHNjl6UU16NlFwcWhha25U?=
 =?utf-8?B?WXZnamxINXgwUCtNWUNsWGxtKytMQTEvM1BqK1NvNkUrZjB4Ny9EZ0Y3cVVG?=
 =?utf-8?B?UmJPUTJHWDAwUFpBa1g5eENMc3pQOUQreU1QVmFEVk80a1lIY01vSTF6L05X?=
 =?utf-8?B?UytKa0Q2YnR4RmtuZTZDTnRoNWdJekhDQ1A1THRHak5JM0dRMGdlUC9Bbng5?=
 =?utf-8?B?dTlZWnNnSGdvU3YwWjg2dFErNGVWRVFqMmZTZlVnNjQ3Q0ZSSVZLN1lCWlV3?=
 =?utf-8?B?WTNFT1REMkJwVndocUFKdVEyd3dsSnF0b24vM2RYZ25YeDY3Y2l5TFJEVUFh?=
 =?utf-8?B?dzJIVEVGaHVucjRNWmZ0OENFa29hdkh5TWF3bDU1cDB3cDU3VWdoNWJiZDV0?=
 =?utf-8?B?VmVzbjEzQTEwdHY5WlNkVFlVcXk1ZVU1QXUrSnFXTFNnZ1kvRXFYcnRpcVln?=
 =?utf-8?B?VGxjN0VyMXI3cVZxdDNaOHcxQWplOEVOeThJNmk0VkErNTFpSlVWNndnNnUr?=
 =?utf-8?B?RmZrdExzZ3h3THo5Vi91SGR4UFRFcktoWUF3OGVvR1hoN1RxdXE4UmhIWXZp?=
 =?utf-8?B?UUM5VlNTRGlOY1VmVlJjS3dmSElnV0ZRWG9rbDFES01iZWRSOTV4aDQzejZW?=
 =?utf-8?B?dURwcENXN05YSTllb1lmamttV25SK092ODh2NXRiUy85YXYzclowWUh6N0pj?=
 =?utf-8?B?VlV0WDRTb28xa2FMVmY2MjdET1VtRm11ei9lSkY5TjdJdGdGNllOWUQwNFhz?=
 =?utf-8?B?RHFrWTdrN0FpY0gwSzdPNUtDdlJXMnIya2tMaGpQVzE3em5MZmNVdWUxdzkv?=
 =?utf-8?Q?gi3dAwc0D8lQJ79MSVCnuE+qnKCyozqNhLYVjO73peOQ=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e12402e-6dd9-432d-b69c-08dc13485618
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 08:27:38.6134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1503
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_002801_670263_D10185EA 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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

Ck9uIDIwMjQvMS8xMiAxNTo0MiwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IE9uIEZyaSwgSmFuIDEy
LCAyMDI0IGF0IDA4OjA4OjE1QU0gKzA4MDAsIENoZW4gV2FuZyB3cm90ZToKPj4gT24gMjAyNC8x
LzEyIDA6NTgsIENvbm9yIERvb2xleSB3cm90ZToKPj4+IE9uIFRodSwgSmFuIDExLCAyMDI0IGF0
IDA0OjAwOjA0UE0gKzA4MDAsIENoZW4gV2FuZyB3cm90ZToKPj4+PiBUaGVyZSBhcmUgZm91ciB0
eXBlcyBvZiBjbG9ja3MgZm9yIFNHMjA0MiBhbmQgZm9sbG93aW5nIGFyZSB3aGVyZSB0aGVpcgo+
Pj4+IGNvbnRyb2wgcmVnaXN0ZXJzIGFyZSBkZWZpbmVkIGluOgo+Pj4+Cj4+Pj4gUExM77yaYWxs
IGluIFNZU19DVFJMCj4+Pj4gRElWOiBhbGwgaW4gQ0xPQ0sKPj4+PiBHQVRFOiBzb21lIGFyZSBp
biBTWVNfQ1RSTCwgc29tZSBvdGhlcnMgYXJlIGluIENMT0NLCj4+PiBXaGVuIHlvdSBzYXkgInNv
bWUiLCBkbyB5b3UgbWVhbnQgc29tZSBlbnRpcmUgY2xvY2tzIGFyZSBpbiBTWVNfQ1RSTCBhbmQK
Pj4+IHNvbWUgZW50aXJlIGNsb2NrcyBhcmUgaW4gdGhlIENMT0NLUz8gT3IgZG8geW91IG1lYW50
IHRoYXQgZm9yIGEgZ2l2ZW4KPj4+IGNsb2NrLCBzb21lIHJlZ2lzdGVycyBhcmUgaW4gU1lTX0NU
UkwgYW5kIHNvbWUgYXJlIGluIENMT0NLPyBJdCdzIHRoZQo+Pj4gZmlyc3Qgb3B0aW9uLCByaWdo
dD8KPj4gSXQncyB0aGUgZmlyc3Qgb3B0aW9uLgo+IFRoZW4gdGhlIGdhdGUgY2xvY2tzIHRoYXQg
YXJlIGZ1bGx5IGNvbnRhaW5lZCB3aXRoaW4gU1lTX0NUUkwgYXJlCj4gb3V0cHV0cyBvZiBTWVNf
Q1RSTCBhbmQgZ2F0ZSBjbG9ja3MgZnVsbHkgY29udGFpbmVkIHdpdGhpbiBDTE9DSyBhcmUKPiBv
dXRwdXRzIG9mIENMT0NLLiBZb3Ugc2hvdWxkIG5vdCB1c2UgYSBwaGFuZGxlIHRvIFNZU19DVFJM
IGZyb20gdGhlCj4gQ0xPQ0tTIG5vZGUgc28gdGhhdCB5b3UgY2FuIHByZXRlbmQgdGhleSBhcmUg
cGFydCBvZiBDTE9DS1MganVzdCBiZWNhdXNlCj4gdGhhdCBtYWtlcyB3cml0aW5nIHlvdXIgZHJp
dmVyIGVhc2llci4gVGhhdCBzYWlkLCBvYnZpb3VzbHkgeW91IGNhbgo+IHNoYXJlIHRoZSByb3V0
aW5lcyBmb3IgdHVybmluZyB0aGUgZ2F0ZXMgb24gYW5kIG9mZiBldGMuCgpVbSwgc2VlbXMgdGhh
dCB3ZSBuZWVkIHRvIGRlZmluZSB0d28gY2xvY2stY29udHJvbGxlcnMgdG8gb3V0cHV0IHRoZWly
IApvd24gY2xvY2tzIHJlc3BlY3RpdmVseS4gVGhhbmsgeW91IGZvciB5b3VyIHBhdGllbnQgZ3Vp
ZGFuY2UsIGxldCBtZSAKcmUtY29vayB0aGUgY29kZS4KClJlZ2FyZHMsCgpDaGVuCgo+IENoZWVy
cywKPiBDb25vci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
