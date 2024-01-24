Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7F8C47422
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 07:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:From:Cc:To:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9r4Jrh7N8jrcQqMDDuPQ1QvAs5ZeK7V6iOoQIUHOvN8=; b=QOPkY6bzA1V6K2AoW8eOYnocn/
	nXRkTJlSeNNJQGoBXZH1UCUkddh+yb1A16EshGkCcDHyN6kbDAKBqXJbg2QaLPmxfouYJ/HptMmHT
	2OFhnLgs5bRDaQg/SuTVW3IaGQgyqDbYJYa2K1VbIY43f+ahUMX3dt8bkUL28sjPBCnwprU+d3fJf
	TcuEftgFgp5v+YSiETB1qjJVNI12k00IE8ipPIEwlm8SC5yh9FhjaigMCaK1lW3C7MSbMKBEE2Buh
	npSNQMPs77GZJm8urAKcWPrLSvajZIHfwiXhTzHYYX6LioHtGc/adZS+zxlo49SSRJqhHyEWteaq5
	0ISfA+Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSY2H-001v8n-04;
	Wed, 24 Jan 2024 07:51:01 +0000
Received: from mail-bmxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281c::800] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSY2E-001v7l-2q
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 07:51:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHxOg0oOBpbe/iXhtHmRYKBhxcYVZZv2Pcx4yHj4OmkDVxlqbUKPmc+T8Nl/nY+9GwOncoj3lIOcx8KuCqF7SIp9IckSA8Esdnhtpc0HJTMcnQ9jApKYtc6U64uJHvCBVbxQdnnd3iu45UFBgPw43r1jYiDyE2C4/4tNIQFzXMf9i8QD0//O+QXO3tNT2Qiroq5oezat/T9GgppXp82/z/SXTZ1LCGCxm1ZMis8Av1n2zM2g2Ze3Hkj0TBuzBrPMdyhfaFTxAS/+iq5sA41kVpnmkoiT9K7Br1H4fKmjEH8YNLG2/C3FO5heb5F8O4hKQN6BuJt+nY2HHEvn6HkkxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ij/+loR4YO4tUQ+DbSFFSmlvHVO6lUF3XW+pY+nIfMU=;
 b=chMiRHQtCNPRaDnawuqMIObo6VV5/W8F1SvJusH+MiCDL2ngRv3gh5zpsQtYgY5ApDb+UmfnFibPhcWNJ7nTjCzL3C+/OKa+zChMgdyQ4HKYLKVo2jmrL79+/EZAP9LRrXqLmmrO7cW7L+VMb9hMagQXuA+RMsVM/GNCTvbhkZlf6t83il5W4FkLScyeNroDRbSKFZZJfHF/4GbNiTNAYYpjfUyvoNhsg6WwY8fo/YQLXpRrGsG0WCUcGLwUxgxJQ5Dl6EI9b6V2v26hwYt8t4NnWs5iZD+C7x538v9SDCfKJd9RiqQgVd0HhhBUq3fF3ccECUlHdfW5mtemn590TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ij/+loR4YO4tUQ+DbSFFSmlvHVO6lUF3XW+pY+nIfMU=;
 b=pnzJdMAR3vWaYa2K+WjorE0PlK1d6BSu8YPLgN8qz2fFT1dzr8wo4/8cHweMbxBVU6QplkYMj+izYcyxHDvN8s0pQiEXZu3CUVd7nlg29kmnwJ2zVatk5dBN7UH8LjFrIm3DLbenx1HzT8/UqLxMj/mtX/i/TjZn1Ea6n5n4LH3fkbWt2kgnstjZ6C6GEEtAArUw7Z9iRUyKrMDexVBcQQNmKJV5zCLXWzL083goSiPfYPqSd1NWbINw1aLupoCmiBTvorqvfOt676xqTJBWdwn1xYA4DFOuoyMYaaNPmavGYFkY14+HGdivchbvSCJ2RbeDhmCZyif7Aar6cVa+rQ==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN0P287MB1154.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:142::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 07:50:47 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a2d5:82f2:b6d4:f2cd]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a2d5:82f2:b6d4:f2cd%2]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 07:50:47 +0000
Message-ID: <MA0P287MB28228572C526C5099A8BDA2DFE7B2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 24 Jan 2024 15:50:44 +0800
User-Agent: Mozilla Thunderbird
To: soc@kernel.org
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Inochi Amaoto <inochiama@outlook.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com,
 Chao Wei <chao.wei@sophgo.com>, unicorn_wang@outlook.com
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Devicetrees fix for Sophgo/SG2042 v6.8-rc1
X-TMN: [b+f6lx+Oo62ew/EpGBEWKoI0ykSdycZA]
X-ClientProxiedBy: SG2PR06CA0185.apcprd06.prod.outlook.com (2603:1096:4:1::17)
 To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <e897fa5d-8b9d-4781-b349-2c357a5f71cb@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN0P287MB1154:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f2dd1a9-9ecf-445c-12a0-08dc1cb12d57
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BnS7FPs9yosOoM8Z1oLNJB58ccoy7SkxiSzssUAjbJlnmZkeA300U+Hk/oqnuWdC8cEDERxjsVRfjbYw0BGOsV5/6gBGiZ8a0nrze0S3/io/DV4USp07jxnSQBYkopwnXOstEOv0DGLJs75tejb0wA7QsqCCk/08ENRLvSHmI2TojMF+HdQhbhAMkpIedNaozPKES8Fw5G2jNQwze4YDKViqzby0S13zG7Khi/VdvOAaAjrsE71wMzb9URB3twQOW8f85xCfgpTCWVgpOK9UwUmk5Ns7WL6fQcfqdeP2okgxyO6kql7gUfRCgwGHnmDXCOr7ULLD3SauqCdVUfrs0vAZT+WYTX00E0lyN5VNg6XgKuV4UsnhFoFG7PL5lGDwPm5+0zcFW2D1QVMSJ8icvZHpzUo4C2y5wdwUXACN0rGU6zz9J5nGAsrKxDDBpgtdC0dmUcm/hH0n714H1ksXhKaVAu9iuHwDQ7+OkPOSIh/XX/xE9OOK+gPd+BgUFnYS4d76th1JOdpcvVAV3dD1VkSMluMZTVvCiEsWZehNSJLGzR6mLvILs39ZYM/BL+rr2NP3fhJF3xSwy7VCtsLsIS3QqMUvNXkz9bDymNnI61LCLIY5xSWW5KjTuunYbDYCf4uXpEQZXGbVUQOm1T9e5sTn8O1dhoYElZ4d56oZUmw=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnBJUGdKZW5uYUdyTG9URjlZS0xkZTl0OWg5MjQrODhlSmxQdlRFNTJpRXdj?=
 =?utf-8?B?S1FaR2hjS0dsRkFQNkUvUTU2aW5jUW5tZVFZM2IzZHQvekhJK2lwSVN1N1g2?=
 =?utf-8?B?V0NtUnNPTkRNeEc2VUY5REJqa0lkY3V6ZVRuZ0NsamNVVUJyTFhvMTNqenJO?=
 =?utf-8?B?Q3VGWDFVR2FZRXRJUUVyNk1nb1pxRjczaVJQczg5NDFQRFNxSXpRNnFJOXRa?=
 =?utf-8?B?eXNrQ0tHZjZnVjVPMDNLVHo2ZW4vUDFRS0pqblI2S3JBbHREdzlWbnU5SytH?=
 =?utf-8?B?N1o3bVl6SE9Od1BTSEIwaEM4bWRXanJjd20vQ1V0QmV1Y2dvdW05aWd1NDB3?=
 =?utf-8?B?U2loc0k5eW5NRDRLYUM3aW1wK1pkQVZtdlB1bHJLamdPKzZXdjROOG9YVjNF?=
 =?utf-8?B?Y2tlKytVT3BzS1FEOVVHZVZ4KytVTVNsbWF3NWY2S01PZDZLU0dFelpYNW5E?=
 =?utf-8?B?RHZ6ZzlKeGhZWGZTcW1lU2RSa0V2MldLRW85MElNUDBTbThjdFhwR1VzRjBi?=
 =?utf-8?B?TWFWMXlTbHhmVFg0Vi9yU2RCUSt5cldzZEcxZkFhNkR0bGdxdGNBOVhmOWwy?=
 =?utf-8?B?bHQ3VWZ6TlA1RkpwOWlHYWphVDErdFJ3ZGMzREJoSGFpY1pDL2lSZkJWcTdn?=
 =?utf-8?B?eUZaMENocjdTVmNFMUZlNmZIbktzNHpiWkZPZ1VFWWR0OVgxWCt6RlZQL2ly?=
 =?utf-8?B?QVp5UGZiYituclo4UWt2L1g1V1dDTlhCVHV6TVFuQllyRzNIa0MyOVZiU3ZT?=
 =?utf-8?B?bGFwWld0c1J3UnFtYThLaVNSUnpyTFlibGtUWkF2YnZVQmdlc0oyZTdEZy9D?=
 =?utf-8?B?UG1zRTI1ZmVvQy96SitCWUZHNzVndCtBVE5qWDJvc3NMa25XYlRobE1yWTRV?=
 =?utf-8?B?cDRLcXNWN3AwUnplTngwQmZJbXRTZjh6cGUvYUtScWg4Z2NOK0VPYUJQMmhS?=
 =?utf-8?B?bmU4b2NWTTFGYm1QVlRqTk9wczhjRm5wWmZsWXRKbDY5SmNPTnR0cHhqTW95?=
 =?utf-8?B?L3ltSFJ0bHE3SXRJd2dTYVA2TUxvL0xrNjMvMUJ2cEtqdHp1K3JKeUVXVTRi?=
 =?utf-8?B?QTRVMlN3NFhlVnZEYXBFalNxK3E2R2U0TXFPbWNyZXdFaGpvUkJ6NFhOSURZ?=
 =?utf-8?B?Y2FmN0dsV2IvNER2NHZ3ODhqZmxPVmYxRFRlMmVRWkQxaHd5aC9COUlOeGE3?=
 =?utf-8?B?YXRCbStLWWJNWXJTY3ZVMDBFaVlVWVlTNnNJaEZkRlFuZDRXYVBxMHdsTm9V?=
 =?utf-8?B?TzR2Q3FNNG05citjTEt4UlJEL0ZVQ2lVRVhJNFZGSmtHVjEwb2w0N1RYTTc4?=
 =?utf-8?B?YlA2MzlUemluY1VHZE9OOFQ5UFRqMzUvNWlnODdjZ0pKSUd5V3R2MnNESnBP?=
 =?utf-8?B?TGpQeXpWK3hXVE15dDdiYmxyMDdKNllUYlFzSGl5a01zUG5VbnRrSys5ZVYz?=
 =?utf-8?B?Z3AvOG5aRTJIZXVWdm1kR3VjVnB6dmlGVk1lUUFaM243c0RvRWpYMHYzL1RF?=
 =?utf-8?B?QlBoR0c1ZGVSb1AxelJvR3RGSGFvVlRVYVdlbnM2SzJtbmFGMXNrR1VmaU0w?=
 =?utf-8?B?MnI4VS9wcWlyTndIeG93cW9xdzhncUxoZmlOREkvQVNCem5RVkZDaHlLeVkz?=
 =?utf-8?Q?oO4q3JiO2F38L3KNAB/q1HmV+9Q941u9ZDxEDHuzxrQ0=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f2dd1a9-9ecf-445c-12a0-08dc1cb12d57
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 07:50:47.7660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_235058_968058_5D4265FD 
X-CRM114-Status: UNSURE (   4.96  )
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

SGV5IEFybmQsCgpQbGVhc2UgcHVsbCBvbmUgRFQgZml4IGZvciBTb3BoZ28gU0cyMDQyIGJhc2Vk
IG9mZiB2Ni44LXJjMS4KClRoYW5rcywKQ2hlbi4KClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5j
ZSBjb21taXQgCjY2MTM0NzZlMjI1ZTA5MGNjOWFhZDQ5YmU3ZmE1MDRlMjkwZGQzM2Q6CgogwqAg
TGludXggNi44LXJjMSAoMjAyNC0wMS0yMSAxNDoxMTozMiAtMDgwMCkKCmFyZSBhdmFpbGFibGUg
aW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKZ2l0QGdpdGh1Yi5jb206c29waGdvL2xpbnV4Lmdp
dCAKdGFncy9yaXNjdi1kdC1maXhlcy1zb3BoZ28tc2cyMDQyLWZvci12Ni44LXJjMQoKZm9yIHlv
dSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGViMzdhMTUzN2RhOGM5MmVhZGM2YmRlMDI2YzE4OTg4
YjAwODkyYzE6CgogwqAgcmlzY3Y6IGR0czogc29waGdvOiBzZXBhcmF0ZSBzZzIwNDIgbXRpbWUg
YW5kIG10aW1lY21wIHRvIGZpdCBhY2xpbnQgCmZvcm1hdCAoMjAyNC0wMS0yNCAxNDoyMDo1MSAr
MDgwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUklTQy1WIERldmljZXRyZWVzIGZpeCBmb3IgU29waGdvL1NHMjA0MiB2
Ni44LXJjMQoKVGhpcyBwYXRjaCBpcyBbMi8yXSBvZiBbMV0uIFRoZSBiaW5kaW5nIHBhcnQgWzJd
IGhhcyBiZWVuIG1lcmdlZCBpbiAKdjYuOC1yYzEsIGJ1dAp0aGUgZHQgcGF0Y2ggWzNdIGlzIG1p
c3NlZC4gVGhpcyBmaXggYWRkIHRoZSBkdCBwYXRjaC4KClNpZ25lZC1vZmYtYnk6IENoZW4gV2Fu
ZyA8dW5pY29ybl93YW5nQG91dGxvb2suY29tPgoKTGluazogCmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC9JQTFQUjIwTUI0OTUzQzkxMkZDNThDMEQyNDg5NzY1NjRCQjg2QUBJQTFQUjIwTUI0
OTUzLm5hbXByZDIwLnByb2Qub3V0bG9vay5jb20vIApbMV0KTGluazogCmh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC8wOWIyZmMyZi1kZGU5LTRmNDMtOTcwNC1kODA1M2JmYzg1Y2ZAbGluYXJv
Lm9yZy8gClsyXQpMaW5rOiAKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0lBMVBSMjBNQjQ5
NTM2NjlDMDk3RDlDOUUyNEI1NDlGRkJCODZBQElBMVBSMjBNQjQ5NTMubmFtcHJkMjAucHJvZC5v
dXRsb29rLmNvbS8gClszXQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpJbm9jaGkgQW1hb3RvICgxKToKIMKgwqDCoMKgwqAg
cmlzY3Y6IGR0czogc29waGdvOiBzZXBhcmF0ZSBzZzIwNDIgbXRpbWUgYW5kIG10aW1lY21wIHRv
IGZpdCAKYWNsaW50IGZvcm1hdAoKIMKgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQy
LmR0c2kgfCA4MCAKKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIMKgMSBmaWxlIGNoYW5nZWQsIDQ4
IGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9ucygtKQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
