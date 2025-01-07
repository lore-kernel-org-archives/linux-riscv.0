Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B67E77188
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 00:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYGCKSHpIR55b66HXNiyVgK1eAszdr6/wQPxWN4OEHk=; b=rgMr8ywjat5upq6OF2AyDXeMeV
	IpLaUD6ieq2v96ZfbkNmJm12DpzcQcfcCo4LclUBowhzHOBkl23T2uOBSXE2G2THW6mTzbl81WGyO
	l1sJvUIdmqk8wiz6Lj/NooWUU8/OWLw4PgbTWpWgROI8rgrGS24PXHDei24Rq58uEYNauj5DqNW+C
	7oNC1RmYLvya9V62IkFv48yBh04bTl6DiEtNeQqFFM8DiBOacdVEHdB1PHaGUjNBF7/eiQi8qlsnN
	7TJyyeOlvz7r7AoWu5ldFFr+VTIT7ssx35tykS1RAv/5HmW/mIi2RDZJGzMQe91Autecp/7v+Gmua
	DB5m0N7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUxhm-000000033rM-2Bnq;
	Tue, 07 Jan 2025 00:44:22 +0000
Received: from mail-centralindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d409::] helo=PNYPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUxhj-000000033pO-3TGF
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jan 2025 00:44:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UIWcl6jMjDc4m66OwCgAgTS2dWtLYvzpb35gDFPhMJiOxAhwx6mW9BPvtq9xlH+ESnTAxJyij/HKpFXARU5NG34rcUGrKzvOPFVOTqMYLgzi4hq9LhX73+paDLu9cfihJ4TDBNnfgfoFZ4BaO4O5CeksO6ab7RfZMMAcoDYiS55r48bDge+m5WnsfoPIpiLIooCXSbwGLjbkvbXegE1EM0zCbvCQABecL9pSWt9O/aVV/rBmA6D6K/axfl7xX47qfLdTtQoxAQsjNgeok3+NLyc7euibsyZ/skMDQFeR3bctssOJLUpMc9/Cc70OjnKXNODWHtfq6hcnBxqd7O6PIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8K3CrMOtu+monAAo3ZA+65Mdcdyw7MN2KAbib/o/h+A=;
 b=FW9XMX5HdMhqWDylhGiD9k/bJInCqrMFTTd7Xt6vQNT8+5c7rnChfdy3ft2zZvDfFvAZbZ7g5d9zvMcpEPqiK8t7xNYnXjnaR1riJ2kmrLJx57yYdeNnl2ngr2gmJQudyVBNLSO3fO07vthguoVyeJjwCrqHU/wxijduYrggwEY4WoglzeAAi7A/CSlM2x35ZWWSMKFneBxFf0WeLtyfR18/2uTjeO5DIVVrE4my75yJGIBzF157ueYSTXF8gLXzhhI0QLbNMaoZNNlrB8l4YD9cdisz9GbSc374bo75JRKvAsAxMMqbOyzfVSR2xt/29jg7L5WWjfRVeGTkhjhHjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8K3CrMOtu+monAAo3ZA+65Mdcdyw7MN2KAbib/o/h+A=;
 b=n7oHhOjDBauhyCTk+LU097LrdF9LBObhyLN/TCb63auyouG9Ud9NZBWNERq5QJdcHafkaXvPJxLzCi5f+8sRDBtlXtMKCFa0WMb8JJCJgAIJdg2ptL5fCQ15r4UH9Li6KXZwQmCbHonI/4102wzmx0EzzKFx6hdEEMioWmfu2TAFul89CBahn8VGPXmSMiY9R9ZmIcqf9Xwd5Xddnu+HiATD2ebW29b3TBiU2OkIeJeqx73Li0YK+Fn24uNDdU8owZ6TN/VjT76ZXGvKshDv44MoJsVykHoIyh8yngsPDBlJMte4TQEUcwX7T2eMKcKDOew0c/5Tey1o/OvSyeMB2g==
Received: from PN2PR01MB9523.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:fb::11)
 by MA0PR01MB8945.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:c8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Tue, 7 Jan
 2025 00:43:56 +0000
Received: from PN2PR01MB9523.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::fc57:de35:cc59:cc4f]) by PN2PR01MB9523.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::fc57:de35:cc59:cc4f%4]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 00:43:56 +0000
Message-ID: <PN2PR01MB952383AEE840F23EF29AE73AFE112@PN2PR01MB9523.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 7 Jan 2025 08:43:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: pci: Add Sophgo SG2042 PCIe host
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Chen Wang <unicornxw@gmail.com>, kw@linux.com,
 u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, arnd@arndb.de,
 bhelgaas@google.com, conor+dt@kernel.org, guoren@kernel.org,
 inochiama@outlook.com, krzk+dt@kernel.org, lee@kernel.org,
 lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, pbrobinson@gmail.com, robh@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
References: <20250107001839.GA142126@bhelgaas>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250107001839.GA142126@bhelgaas>
X-ClientProxiedBy: TYCP286CA0115.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::19) To PN2PR01MB9523.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:fb::11)
X-Microsoft-Original-Message-ID: <8d267fa2-ecb3-4885-ad71-95a841582d79@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN2PR01MB9523:EE_|MA0PR01MB8945:EE_
X-MS-Office365-Filtering-Correlation-Id: bef0c19d-f426-41c0-5cc6-08dd2eb45df0
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|19110799003|7092599003|15080799006|8060799006|5072599009|6090799003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sitldm5ZZTROOThzQkh5TzNzVE1XWHhBNFpVNzVGWmg0NE9PRG5tSXkxVGNW?=
 =?utf-8?B?TlRMOTdOOEx6eGVlbkxEL2RDSjkxc2lWc1kzVm9EdFJ4YUhmeVRiN1hpZEdT?=
 =?utf-8?B?Q2EweW5iTVVlNWNEYXFoaitsQy9NL0xGNXJJeXZNWDN0bEhETEhVWWJOOGE2?=
 =?utf-8?B?bGRpOEFNSTBnVFFya2EyNHJ5SGZZMjFWTXRoYTNrQ1cwNE9YYUVSajc0TTA4?=
 =?utf-8?B?MXNONXpqL0NIdHBrQXVYZnpNWmU4MlhPUll2ZWRtRGk1M3hDYytCSGUya0pV?=
 =?utf-8?B?UmhDSDRhZFNlT1RDWlhKRTBackhxb2dmRDNnU1RUOWNKN0J2TStkSmRMUFBm?=
 =?utf-8?B?MlNsc3NqTkM1VHlLV0ZTeWNLMkxaZ1NjbHZGQ09vYlRTLzFnUFM5Qi9ld0dI?=
 =?utf-8?B?ZXpEdmE4SW9JSURUWjJOaWh4WkVoWlBRKzJPc25UMkQ2RGF4dkRLNVVPd25M?=
 =?utf-8?B?c2FweHhRL0VHSG1QRGhDb1pva3BtOGY5UHZMOWU3R2xzR1dEbFFqNmt3NXVm?=
 =?utf-8?B?RVJmWXM5TzIwRDU4c2dLK0J1Z1ArWHVWUHZIcXlsZ1pqYkNRZ0d5dWYyS1Qr?=
 =?utf-8?B?RWJTNHJ3TFdyMzNJV1kxV0gzbWZ2N0RIQWEraVh2N0V0T3gzTHFzK0NWNk51?=
 =?utf-8?B?ZU1oY1VyQkoyQVpRYmJEcE1ycTB2RGdZb3pPb2x0T0RhQ1dIVHRLVk5ZK1R5?=
 =?utf-8?B?Nzh4ZUZ3MnNvclJJaUlNODdyS2JHUWJhVExtbWZSSnpVem9Id2dEczNhUjBI?=
 =?utf-8?B?YzRBTm40SVp2YUVUZWtqb2FmS0pFVEVDR0RnVlRvaVFvVm5NNTVQRmVwemV2?=
 =?utf-8?B?Q1QvTnBQWU1kV2lCbXVmdWFJWHNDbzVjWjA0ZWEwQ3dBVUV2UU5XYXFLc2Z0?=
 =?utf-8?B?QXdLQTJTQ0drbE5MblgweFpxUWRlbjdETWM5eVdscm80dGF4a2dZays0QU42?=
 =?utf-8?B?dzI2VWpOQ3UxdnQ4c2tuS1l1eU5wN1prcTRjLzNxMjBsRnBwdXJ0dE5xT3lY?=
 =?utf-8?B?cHlqRUR1bWpFUzYzTmVsVjhBMUUwMnZDd2FkZnF1N3NUV0E5SmhYcmZZVDkx?=
 =?utf-8?B?U0kzcWg1L0NUcjZDd0pWVWdoM3Z3S0ppeXRKYVAzZEc5bDJaRzF1czZ4aUQ2?=
 =?utf-8?B?RE9GbFZnQVRXdXluQjFJMWF2Y3FrYWMvQ21pNGprbFBIUG95aDJ4aGFhUEpF?=
 =?utf-8?B?Z2FpamtpNE5MOGpyRVFZeXlXQXA1dWJ3RGQ2K2hydHVBNUpwOU80ck9mSUli?=
 =?utf-8?B?bmhGazRLVWM1cWh0bzhnQXBXVE9tY0l0L0tIdmxBUVo2OEdnbjVNcGV0MGdy?=
 =?utf-8?B?K1RUQnczSjBYcjZkV0k5TmYvenlkOS9yZkVja2x1UFRuUU5FT3hOdTI3QjFK?=
 =?utf-8?B?aFFwNzRmaTJIdldCZ1lwN2RIU0ZlUDAvK1l1QVpoZUtGeDNrZnpydUhYUkky?=
 =?utf-8?B?dnNqVXdpRUJwU2FZbDlicm8rb0RJcHRRM3ZOM1Q4WUgyUEpCbmV6VHB4bWJD?=
 =?utf-8?Q?bXdKhw=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnJKdmJYNFRzU0d6R0tBd2lYRTZ4L2RmRTVZdzUrb3pORjh5Q0NJWVUyS2xh?=
 =?utf-8?B?bW00d1NjaFpIS0pLaGJGb3VEMVp4bG5aQ2pydVZZa1dBUndqMCtJdksxbktN?=
 =?utf-8?B?R0JaNklpdVFmSnRYYlkyV1lTZk5iN1V4eEZFODEzMTVhL3lQblEvbWovckEr?=
 =?utf-8?B?S1pUK0FLeUpnaWZLVEhWS3ZUaTk2cTBEeG9DVmRCVnNMNXlvcWhDeHBLbDVK?=
 =?utf-8?B?MS9oRXMwbVBHQXFCWldWdU45S3REdS9VampNTndGTEFISEUyaVV0RHU1R1JC?=
 =?utf-8?B?S1VUejBBOHByaEhLekkxZE9BRUUvSHdIRCswWHVDL2p1K2Z0Z2J5QnJaellO?=
 =?utf-8?B?b1JnS256ZVpuUXMzZjluRlVQaktGb1NKVEI1emlGQXNPYkxKazZvTDJCcEh0?=
 =?utf-8?B?ZGIvRGJNT0VpREhLanFDaVZlWTJwSW1JYVJ5Q09oRlNQWVp6NFNnRzlUYmdU?=
 =?utf-8?B?dXV4SlVEbVZ6b2dhSnYzcklhRVZaVVRORXVXb1RkUmRGbzdEUGlrd3FOSWNJ?=
 =?utf-8?B?OHBUZC9yMC9Cdmt3WWFGendmVUZVU1MvVGRuV01ZL2h1bmppY3I2QWVnMmk2?=
 =?utf-8?B?Q0xiN01TdGJyYUE2QU1sdlpmai9YaU9KdnFQYUFNelZOOTVoL29wZEZtbE9Y?=
 =?utf-8?B?a2RHb25scUNVTWRRSEtTcW1iS3dxUm9yUHpjaG1JU2xVMVI0RTdiOHcwdk5H?=
 =?utf-8?B?Q0l0akpEdEx3RVhDUFFHV1lrb2lkOU41VWh2OEtrQVRVZnpVcEdwNk1WTGpE?=
 =?utf-8?B?R1RtNFZNU1Jyd1dOYUNLOWlxOHZXY1RmdGllcXBCdlk5Q0V0SEZ3UXBGNWky?=
 =?utf-8?B?VFlncmhINUtXdWNJSGp4R0oyNndjVXFwakdTQy9TK2hkODJFbS9LdWpSM1pa?=
 =?utf-8?B?K1JKalJWVElhcmgzYnlHeUJGS2lCR0dUdDVqMi9Ba2FqVXMvTFRHS3ZvSDZ1?=
 =?utf-8?B?cjhDNlRLSS9mVXdOZUxRelZyZEpidjZ2OFI0M1JnajlzamttMTAvb2NCU3Fq?=
 =?utf-8?B?RWY3SVRYOUhRYnE2VUVQQlk0b0ZNdVpvK20rWjN0VURLN3NXQ2h6QnZQTlpK?=
 =?utf-8?B?MGpsWE8rZWkwWDliamZ3eHJJN21PMnRjYmlIUzk5aGRxdzZMZjh6UGNWK003?=
 =?utf-8?B?b2VGWDFhTG9vVndjajN1WjZxTUV0OURVT2F3UzN0a1dFWlZtQXhlY3d3OU02?=
 =?utf-8?B?SGxIQmFWc2RneWZOVEFuNytQb0FHem1qWnZhRjQ2UnUwMEVBc3hLRlBOclpD?=
 =?utf-8?B?Z1cwZGk4UXZKQzVRQ0RBTm5nSUtaTnlqV2pwUkZoMUVvd0NZMXpxYkxRUzNE?=
 =?utf-8?B?d1RkdEs3M1hSZkNLU0JnTGFzRm1GTS9IaUlaemp0K0MySGU4bDE5QWM4Zlgx?=
 =?utf-8?B?WVM1ZjJKZVhDMWoxUVdLSUdLd0VXdTBGeGNaYWhGV21NNVRsREZSY0wvZEw5?=
 =?utf-8?B?TlNrMjQ2d1dFRUxJRENzUkhYaWdnbGJMZmVTdnU0UVpoT25jRU16WksrNXl6?=
 =?utf-8?B?MGRJTnR5YnZQanpqeE1VOVJHWTNhUG5hbzcvU25HV3NjUWNSSGJ3dmtoYlZV?=
 =?utf-8?B?WkpDMlRic3lHVXpNSjdGMmozWkZPdXNINThzQnAyK21HWWUxYlNVaDhVRStl?=
 =?utf-8?B?cWRMZVJZdjdlYWdxb1IwNlBtak12YmFvUi9yZTNrNlkxbzBlRU5GSUR1RFZF?=
 =?utf-8?B?OXIxNFZQdWdzay9CNXFRV282MlYvMHlaNWthOS9OYmNERFdodUtHQnZzSHU5?=
 =?utf-8?Q?AGGlURYNv1WG3c7UEAglyhNxXmeakTyZqM3IkBU?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bef0c19d-f426-41c0-5cc6-08dd2eb45df0
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB9523.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 00:43:56.4963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB8945
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_164419_864209_DEE2DA64 
X-CRM114-Status: GOOD (  18.86  )
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

Ck9uIDIwMjUvMS83IDg6MTgsIEJqb3JuIEhlbGdhYXMgd3JvdGU6Cj4gT24gVGh1LCBEZWMgMTks
IDIwMjQgYXQgMTA6MzQ6NTBBTSArMDgwMCwgQ2hlbiBXYW5nIHdyb3RlOgo+PiBoZWxsbyB+Cj4+
Cj4+IE9uIDIwMjQvMTIvMTEgMTozMywgQmpvcm4gSGVsZ2FhcyB3cm90ZToKPj4+IE9uIE1vbiwg
RGVjIDA5LCAyMDI0IGF0IDAzOjE5OjM4UE0gKzA4MDAsIENoZW4gV2FuZyB3cm90ZToKPj4+PiBB
ZGQgYmluZGluZyBmb3IgU29waGdvIFNHMjA0MiBQQ0llIGhvc3QgY29udHJvbGxlci4KPj4+PiAr
ICBzb3BoZ28scGNpZS1wb3J0Ogo+PiBbLi4uLi4uXQo+Pj4+ICsgICAgICBUaGUgQ2FkZW5jZSBJ
UCBoYXMgdHdvIG1vZGVzIG9mIG9wZXJhdGlvbiwgc2VsZWN0ZWQgYnkgYSBzdHJhcCBwaW4uCj4+
Pj4gKwo+Pj4+ICsgICAgICBJbiB0aGUgc2luZ2xlLWxpbmsgbW9kZSwgdGhlIENhZGVuY2UgUENJ
ZSBjb3JlIGluc3RhbmNlIGFzc29jaWF0ZWQKPj4+PiArICAgICAgd2l0aCBMaW5rMCBpcyBjb25u
ZWN0ZWQgdG8gYWxsIHRoZSBsYW5lcyBhbmQgdGhlIENhZGVuY2UgUENJZSBjb3JlCj4+Pj4gKyAg
ICAgIGluc3RhbmNlIGFzc29jaWF0ZWQgd2l0aCBMaW5rMSBpcyBpbmFjdGl2ZS4KPj4+PiArCj4+
Pj4gKyAgICAgIEluIHRoZSBkdWFsLWxpbmsgbW9kZSwgdGhlIENhZGVuY2UgUENJZSBjb3JlIGlu
c3RhbmNlIGFzc29jaWF0ZWQKPj4+PiArICAgICAgd2l0aCBMaW5rMCBpcyBjb25uZWN0ZWQgdG8g
dGhlIGxvd2VyIGhhbGYgb2YgdGhlIGxhbmVzIGFuZCB0aGUKPj4+PiArICAgICAgQ2FkZW5jZSBQ
Q0llIGNvcmUgaW5zdGFuY2UgYXNzb2NpYXRlZCB3aXRoIExpbmsxIGlzIGNvbm5lY3RlZCB0bwo+
Pj4+ICsgICAgICB0aGUgdXBwZXIgaGFsZiBvZiB0aGUgbGFuZXMuCj4+PiBJIGFzc3VtZSB0aGlz
IG1lYW5zIHRoZXJlIGFyZSB0d28gc2VwYXJhdGUgUm9vdCBQb3J0cywgb25lIGZvciBMaW5rMAo+
Pj4gYW5kIGEgc2Vjb25kIGZvciBMaW5rMT8KPj4+Cj4+Pj4gKyAgICAgIFNHMjA0MiBjb250YWlu
cyAyIENhZGVuY2UgSVBzIGFuZCBjb25maWd1cmVzIHRoZSBDb3JlcyBhcyBiZWxvdzoKPj4+PiAr
Cj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICstLSBDb3JlKExpbmswKSA8LS0tPiBwY2llX3Jj
MCAgICstLS0tLS0tLS0tLS0tLS0tLSsKPj4+PiArICAgICAgICAgICAgICAgICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgfAo+Pj4+ICsgICAg
ICBDYWRlbmNlIElQIDEgLS0rICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IGNkbnNf
cGNpZTBfY3RybCB8Cj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgIHwKPj4+PiArICAgICAgICAgICAgICAg
ICAgICAgKy0tIENvcmUoTGluazEpIDwtLS0+IGRpc2FibGVkICAgKy0tLS0tLS0tLS0tLS0tLS0t
Kwo+Pj4+ICsKPj4+PiArICAgICAgICAgICAgICAgICAgICAgKy0tIENvcmUoTGluazApIDwtLS0+
IHBjaWVfcmMxICAgKy0tLS0tLS0tLS0tLS0tLS0tKwo+Pj4+ICsgICAgICAgICAgICAgICAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICB8Cj4+
Pj4gKyAgICAgIENhZGVuY2UgSVAgMiAtLSsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgY2Ruc19wY2llMV9jdHJsIHwKPj4+PiArICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgfAo+Pj4+ICsgICAgICAg
ICAgICAgICAgICAgICArLS0gQ29yZShMaW5rMSkgPC0tLT4gcGNpZV9yYzIgICArLS0tLS0tLS0t
LS0tLS0tLS0rCj4+Pj4gKwo+Pj4+ICsgICAgICBwY2llX3JjWCBpcyBwY2llIG5vZGUgKCJzb3Bo
Z28sc2cyMDQyLXBjaWUtaG9zdCIpIGRlZmluZWQgaW4gRFRTLgo+Pj4+ICsgICAgICBjZG5zX3Bj
aWUwX2N0cmwgaXMgc3lzY29uIG5vZGUgKCJzb3BoZ28sc2cyMDQyLXBjaWUtY3RybCIpIGRlZmlu
ZWQgaW4gRFRTCj4+Pj4gKwo+Pj4+ICsgICAgICBjZG5zX3BjaWVYX2N0cmwgY29udGFpbnMgc29t
ZSByZWdpc3RlcnMgc2hhcmVkIGJ5IHBjaWVfcmNYLCBldmVuIHR3bwo+Pj4+ICsgICAgICBSQyhM
aW5rKXMgbWF5IHNoYXJlIGRpZmZlcmVudCBiaXRzIG9mIHRoZSBzYW1lIHJlZ2lzdGVyLiBGb3Ig
ZXhhbXBsZSwKPj4+PiArICAgICAgY2Ruc19wY2llMV9jdHJsIGNvbnRhaW5zIHJlZ2lzdGVycyBz
aGFyZWQgYnkgbGluazAgJiBsaW5rMSBmb3IgQ2FkZW5jZSBJUCAyLgo+Pj4gQW4gUkMgZG9lc24n
dCBoYXZlIGEgTGluay4gIEEgUm9vdCBQb3J0IGRvZXMuCj4+Pgo+Pj4+ICsgICAgICAic29waGdv
LHBjaWUtcG9ydCIgaXMgZGVmaW5lZCB0byBmbGFnIHdoaWNoIGNvcmUobGluaykgdGhlIHJjIG1h
cHMgdG8sIHdpdGgKPj4+PiArICAgICAgdGhpcyB3ZSBjYW4ga25vdyB3aGF0IHJlZ2lzdGVycyhi
aXRzKSB3ZSBzaG91bGQgdXNlLgo+Pj4+ICsKPj4+PiArICBzb3BoZ28sc3lzY29uLXBjaWUtY3Ry
bDoKPj4+PiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5k
bGUKPj4+PiArICAgIGRlc2NyaXB0aW9uOgo+Pj4+ICsgICAgICBQaGFuZGxlIHRvIHRoZSBQQ0ll
IFN5c3RlbSBDb250cm9sbGVyIERUIG5vZGUuIEl0J3MgcmVxdWlyZWQgdG8KPj4+PiArICAgICAg
YWNjZXNzIHNvbWUgTVNJIG9wZXJhdGlvbiByZWdpc3RlcnMgc2hhcmVkIGJ5IFBDSWUgUkNzLgo+
Pj4gSSB0aGluayB0aGlzIHByb2JhYmx5IG1lYW5zICJzaGFyZWQgYnkgUENJZSBSb290IFBvcnRz
Iiwgbm90IFJDcy4KPj4+IEl0J3MgdW5saWtlbHkgdGhhdCB0aGlzIGhhcmR3YXJlIGhhcyBtdWx0
aXBsZSBSb290IENvbXBsZXhlcy4KPj4gSSBqdXN0IGRvdWJsZSBjb25maXJtZWQgd2l0aCBzb3Bo
Z28gZW5naW5lZXJzLCB0aGV5IHRvbGQgbWUgdGhhdCB0aGUgYWN0dWFsCj4+IFBDSWUgZGVzaWdu
IGlzIHRoYXQgdGhlcmUgaXMgb25seSBvbmUgcm9vdCBwb3J0IHVuZGVyIGEgaG9zdCBicmlkZ2Uu
IEkgYW0KPj4gc29ycnkgdGhhdCBteSBvcmlnaW5hbCBkZXNjcmlwdGlvbiBhbmQgZGlhZ3JhbSBt
YXkgbm90IG1ha2UgdGhpcyBjbGVhciwgc28KPj4gcGxlYXNlIGFsbG93IG1lIHRvIGludHJvZHVj
ZSB0aGlzIGhpc3RvcmljYWwgYmFja2dyb3VuZCBpbiBkZXRhaWwgYWdhaW4uCj4+IFBsZWFzZSBy
ZWFkIGl0IHBhdGllbnRseSA6KToKPj4KPj4gVGhlIElQIHByb3ZpZGVkIGJ5IENhZGVuY2UgY29u
dGFpbnMgdHdvIGluZGVwZW5kZW50IGNvcmVzIChjYWxsZWQgImxpbmtzIgo+PiBhY2NvcmRpbmcg
dG8gdGhlIHRlcm1pbm9sb2d5IG9mIHRoZWlyIG1hbnVhbCwgdGhlIGZpcnN0IG9uZSBpcyBjYWxs
ZWQgbGluazAKPj4gYW5kIHRoZSBzZWNvbmQgb25lIGlzIGNhbGxlZCBsaW5rMSkuIEVhY2ggY29y
ZSBjb3JyZXNwb25kcyB0byBhIGhvc3QgYnJpZGdlLAo+PiBhbmQgZWFjaCBob3N0IGJyaWRnZSBo
YXMgb25seSBvbmUgcm9vdCBwb3J0LCBhbmQgdGhlaXIgY29uZmlndXJhdGlvbgo+PiByZWdpc3Rl
cnMgYXJlIGNvbXBsZXRlbHkgaW5kZXBlbmRlbnQuIFRoYXQgaXMgdG8gc2F577yMb25lIGNhZGVu
Y2UgSVAKPj4gZW5jYXBzdWxhdGVzIHR3byBpbmRlcGVuZGVudCBob3N0IGJyaWRnZXMuIFNHMjA0
MiBpbnRlZ3JhdGVzIHR3byBDYWRlbmNlCj4+IElQcywgc28gdGhlcmUgY2FuIGFjdHVhbGx5IGJl
IHVwIHRvIGZvdXIgaG9zdCBicmlkZ2VzLgo+Pgo+Pgo+PiBUYWtpbmcgYSBDYWRlbmNlIElQIGFz
IGFuIGV4YW1wbGUsIHRoZSB0d28gaG9zdCBicmlkZ2VzIGNhbiBiZSBjb25uZWN0ZWQgdG8KPj4g
ZGlmZmVyZW50IGxhbmVzIHRocm91Z2ggY29uZmlndXJhdGlvbiwgd2hpY2ggaGFzIGJlZW4gZGVz
Y3JpYmVkIGluIHRoZQo+PiBvcmlnaW5hbCBtZXNzYWdlLiBBdCBwcmVzZW50LCB0aGUgY29uZmln
dXJhdGlvbiBvZiBTRzIwNDIgaXMgdG8gbGV0IGNvcmUwCj4+IChsaW5rMCkgaW4gdGhlIGZpcnN0
IGlwIG9jY3VweSBhbGwgbGFuZXMgaW4gdGhlIGlwLCBhbmQgbGV0IGNvcmUwIChsaW5rMCkKPj4g
YW5kIGNvcmUxIChsaW5rMSkgaW4gdGhlIHNlY29uZCBpcCBlYWNoIHVzZSBoYWxmIG9mIHRoZSBs
YW5lcyBpbiB0aGUgaXAuIFNvCj4+IGluIHRoZSBlbmQgd2Ugb25seSB1c2UgMyBjb3JlcywgdGhh
dCdzIHdoeSAzIGhvc3QgYnJpZGdlIG5vZGVzIGFyZQo+PiBjb25maWd1cmVkIGluIGR0cy4KPiBI
b3N0IGJyaWRnZXMgYXJlIGxvZ2ljYWxseSBzZXBhcmF0ZSBQQ0kgaGllcmFyY2hpZXMsIHNvIHRo
ZXNlIHRocmVlCj4gaG9zdCBicmlkZ2VzIGNvdWxkIGJlIGluIHRocmVlIHNlcGFyYXRlIFBDSSBk
b21haW5zLCBhbmQgZWFjaCBvbmUKPiBjb3VsZCB1c2UgYnVzZXMgMDAtZmYuICBFYWNoIG9uZSBj
b250YWlucyBhIHNpbmdsZSBSb290IFBvcnQsIHNvCj4gZW51bWVyYXRpbmcgY291bGQgbG9vayBs
aWtlIHRoaXM6Cj4KPiAgICAwMDAwOjAwOjAwLjAgUm9vdCBQb3J0IHRvIFtidXMgMDEtZmZdCj4g
ICAgMDAwMTowMDowMC4wIFJvb3QgUG9ydCB0byBbYnVzIDAxLWZmXQo+ICAgIDAwMDI6MDA6MDAu
MCBSb290IFBvcnQgdG8gW2J1cyAwMS1mZl0KPgo+IERvZXMgdGhhdCBtYXRjaCB3aXRoIHlvdXIg
dW5kZXJzdGFuZGluZz8KClllcywgdGhhdCBtYXRjaCBteSB1bmRlcnN0YW5kaW5nLgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
