Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11249C282CD
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 09:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqr85NmqKt2Rtfnkb115luM3NPt6eEmnwqC8xUb6Wkc=; b=bcPw/F3cr63MxrO4fWj9q937Di
	w/yaXQtdYjmVtW7I3kzYrWkTNzGshApAAhMM0QB87WErZMFZaEnH+zFssE4I5NdQw7Dd3809Xef0p
	HaXGCbqeNXIvt65DYwvn6rYSEK9jR3Rv3Cj9utxvemZ/qudZ919k1I7lWaPbqmqEccav5Rvfm3X3k
	GuDji7ob4BNJXysQ+dGMjCjE8Mt5oWhqExBjdGlJlDG6pjUxeYVhYg2l8MBwSEF3eS6UYRVx6x+Io
	2k6tXspkbGr66fJjNeQVVxv1bHSgXKJiGxs8U/2bszAyt6mAw3ZZh3kvISwf1WXNfRcjjiqqoA3XV
	GHNX8bCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnx7y-0000000ATJ7-1sFZ;
	Fri, 28 Feb 2025 09:57:54 +0000
Received: from mail-db8eur05olkn20808.outbound.protection.outlook.com ([2a01:111:f403:2e14::808] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnx59-0000000AShu-1k3c
	for linux-riscv@lists.infradead.org;
	Fri, 28 Feb 2025 09:55:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nkFuiRa0IULaka9jVpC8jnhbyw74FBRf7EStGZQC1vodqy0b0nHmQFQVlK0ZdD0nQYjPgwADTjkrNJ5hFru6bC/ucA+pInWNeqM5bRfRXIBwx2sTy4FNBG5kCvUyYpUcr4dmQkbu3sl+VEvzpPqh18mtarq5lV2MJvwEWmasBuLmZx+B+AXD8oOD7hVc0V71HmrR/9IGua2UqTT0GJUKvCmEal1ekv81aGB8TOvs8zPVsSJNio1ZrvwsUYUcOHy4cd01jSeLUhisPouWvrTRIyMZFqU6Q1SvEnuj1eFxcbJw1Dq2ErZEwCQ0LXku2q4cQWxM4lq7d8gymy002Lk8rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PI9+3Tb+UpEMC+ABKac5nymhYqBfVX8/0sTPa8Nv+hs=;
 b=zOpMucyanfXCQjtQAktszrZo0bIXDJ/7wbRtmO91GmuqM0AgBcGcJCc2M64ly27JlwS5pQ8aJopzv99PY+ODnKXtQIQjjrIKMsB/tK3v4n+wIUvlFoMDm6zETn7O3D3YG7xtIpwH3DVX3umplpqryAfJpqqRbc3cheZLoE/JfwxLk4psdxgyc7BqKwU5+wJjppGvfIS8Yye+MXERzx/hzfnJYqKUqfj1cjmoAJliJrdmVYjuvsNyWiU3YL70Kqzcs5p3Gq2/l2VIgIyWcSibfIWoT5BVVMOoZc2FIIJV7hGptLVv03RUjm/KdxlJFkn3C0sJm0z6xcF2dCukwHU6WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PI9+3Tb+UpEMC+ABKac5nymhYqBfVX8/0sTPa8Nv+hs=;
 b=dCUu4f7YWksh4+2RFGqPVYT6eLCD5dBEMrjU9S51Th37ViafQ/yphtYrVEOoPhX2BAuHW6Cx6t9dCuFlAj8sHyxKkXg03oA3MF6dWl2H6+gAn4UOBFFCyoL5HD/6tWvTZiYwxii6WjVgCu10iMz9T8FWRKentz3u2P3gv9NDc6Nprh8lN+85lVx8/XhP7bom3j0s4TCdi280pwfzx3dqvT25cci70+id7Ih9XOBKAh/jDFBp57/rR/RW0OmeF556ljp3JQsJkjX0FbF5Jx60ScQW1eJUgGQkWErbJ9bsVqaXbayoyDoij7lQlWq48LS4SUc1pT8OPixQJEX4Rx1JeQ==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by DB4P189MB2414.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Fri, 28 Feb
 2025 09:54:49 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a%2]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 09:54:49 +0000
Message-ID: <AM7P189MB10099481BDC2CADF476EB755E3CC2@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Fri, 28 Feb 2025 10:54:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] riscv: dts: starfive: jh7110-common:
 bootph-pre-ram hinting needed by boot loader
To: E Shattow <e@freeshell.de>, Hal Feng <hal.feng@starfivetech.com>,
 Hal Feng <hal.feng@linux.starfivetech.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20250203013730.269558-1-e@freeshell.de>
 <20250203013730.269558-6-e@freeshell.de>
 <25B3D8909DBCC21B+43663a76-4afa-44ae-95e2-3a8792de614c@linux.starfivetech.com>
 <206a6ada-1ef9-47f3-b1cf-fb1a1540e95c@canonical.com>
 <62D89163A60680E7+f0f5a4d4-42f1-454d-9dfe-cf53e2aca4ac@linux.starfivetech.com>
 <cba21857-7eb2-4f10-a1bd-6743ce63dfa6@freeshell.de>
 <ZQ2PR01MB1307ECDF175D20547AC69287E6F1A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <8b0f7b4f-e58a-45ae-931f-2b2853918ab4@freeshell.de>
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <8b0f7b4f-e58a-45ae-931f-2b2853918ab4@freeshell.de>
X-ClientProxiedBy: AS4P192CA0026.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::10) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID: <8b9244a4-444e-481f-9f80-d11065c48247@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|DB4P189MB2414:EE_
X-MS-Office365-Filtering-Correlation-Id: ea43dc2c-dada-4808-f9be-08dd57ddf059
X-Microsoft-Antispam: BCL:0;ARA:14566002|15080799006|19110799003|8060799006|5072599009|461199028|6090799003|440099028|3412199025|10035399004;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXJJbW5pTWMrZXM1a2duTk5uYXVQTFJxZlB6VGFhbzk4bnlMSGZkVmt1YU1U?=
 =?utf-8?B?TDVDMVZpS05leVViSGNqZm5DNlZ3NlJpM0tVL1NSOUY1T2N1WkRyRTNsNEtn?=
 =?utf-8?B?cmxqQkFQMmVWM2N2cVNpMGM3QnF3a0ZTNnhudElhNkwxV2QrdGxFV0d3RENu?=
 =?utf-8?B?STFQWDAvYU9DR1ZKaDVoNitJMVBrQ0NiTFR4SVJtR2diQmw5QmsrNnJMQ2RE?=
 =?utf-8?B?K0s2REFERTZGd3ZpMWFvdFBVdVpOdjNaNVZrS3BSUWlJb1k2VWp4M3FlcVNo?=
 =?utf-8?B?MHFDYTMrQ1EvbVNuZWZPWk9rUng0S3dUMjVPTHpEL2ZCM1BBWE8vTldja2hn?=
 =?utf-8?B?WGx0NjNoWUhyVFVXbFhLZ0sxS0tRWHJFYmlNZ2N3d0ZUVWFUbUNxRjBPT0hI?=
 =?utf-8?B?VEJPNVh5dmJ3b3NVczN1YnAwU25HRGZJS05uTWhKRXhyV2NGRXF3QmlYK3Fq?=
 =?utf-8?B?REcva1Y1K0hwOHRnZ0FuaU1qbWs3SGowNnQvR01ucjNiclRUMGhxbkZWRTJM?=
 =?utf-8?B?ditsdzcvd2tqTjAya1pPMmFJdW5DQzBVb1Z4Y21ySHQyR1RBekp3OGxUYlVm?=
 =?utf-8?B?UjVrNFV1Wm1HZlp2K2laVzk1bFppWmRZcWhmdDdKd0hwMXF3RXVJcVROZnNT?=
 =?utf-8?B?UFo4Rnd6OEVGYjlPVUJHaHRwZllrMGZIN3R4RUJuc3BHTUowQWY2YzlDSDBz?=
 =?utf-8?B?M3JtUWNSaVFKazVkaW9zL3FyMUtlZ05ib04zZUF3TE5jOUNPOG5haHJ6b0N2?=
 =?utf-8?B?Sk02c1NPSGZkSkp6WnY2dDNOczBYMitON2ZlZUtBMWprbVZzRlJRMEJBWDEv?=
 =?utf-8?B?UEdqQjRwM1RBWnJNeUNaM1ZVdHYzdGgxc0xnbmhxendhREUxSnYyem1FQzlv?=
 =?utf-8?B?SElucDB3ZjR2RkdKcUJtcVBJVTFoUVp1YXozd3Rsby84NTVjQmVSWkNuRlJQ?=
 =?utf-8?B?VTJwK09YazVZb0xrMXJySy92L3U0K1JsQ0ZMdHRtSUpVT0RTUVdSRmxoZFpp?=
 =?utf-8?B?TlBBc05XcjZ0Q3E5ZmhTbUV2TWppMWRVL3hyRndhZ2lQb3paTldRV2VlbFFF?=
 =?utf-8?B?TVBiM1NZbW5nVDJUYjU2R29SYzU5SEFSbG96blh3WTQ0TjZyblpFdHJyWW16?=
 =?utf-8?B?bkQ2cXIzZUpGSUplSkhPSTdEaXNCK0dXTng5Y0NJOVpRaHRQRzQyakRyZkNU?=
 =?utf-8?B?TjNtT1k2SW9xdmtxZ2FaTjRkcElPN2szd2luZ2dKRGxrSXNIdmszb2J6MWs4?=
 =?utf-8?B?VWRuUGZnTzVZakVSYWNIckR0eVo3OHhVWjhDSFkzRFhyYnBJWS9wbWZWY3JI?=
 =?utf-8?B?akhYdnFOblBjMGtyWFVTc3EvbjhyWi90Z2tuT2lJWmNPamZxc0tUSzVCamlq?=
 =?utf-8?B?aVZpMkpBWDNPV2lIQ3V3dmJObi9vZ0QxdzVGeTk3ODh2VC8xV3JmM2huZ09y?=
 =?utf-8?B?WUUxd1Z4WjBPUktMcHhLUHZ2d1VnZkFVVDY1NDR4WDhRMFVubEQ1dEx4QWk5?=
 =?utf-8?Q?Cl6CoppXB1fvAI/gPdf2xrPJ4Lm?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWZENGwvbGIyZmsyWkZPWDcwVlo0QjJDLzczakFtQVh1RisrcEJMclN3UTRE?=
 =?utf-8?B?VkdBUXJhRW9HWGN0TTdBUkNnYjZPdVREUkI3SjFXTDVISGJiazRwTUZpYTR3?=
 =?utf-8?B?b0huMHIvNGF4MDJKbm5SaTNZUUpSUGhKKzZmTDZBM2ZZQW16a09QQ01FNDVE?=
 =?utf-8?B?WlpiNXNVMWo5WVJHaTNZa2JuSEZMZnhJc21URmxjZHlmOTNkOWR6cDBoWmVC?=
 =?utf-8?B?eG9KS3FNdjgrNTE0b0Rmb1RZVXE1OGxSWkhidFVaRVRiTG5EV1N2SUtjVzZU?=
 =?utf-8?B?b1Vkc0NOWkxYV0cxcXZ0cEpjL1ptcXlGMDM1S1ZwSXNEc0RZNGNJRDhOLzdu?=
 =?utf-8?B?MGFsQ3p0YmFLQ0JuV1ROOWVSblpmV2pDdE1FeVJweWlwYjVreG0zY0VMNTNL?=
 =?utf-8?B?djJ1a1pZMDNtd3F2ZTJ6MmcrY0gyeUdRYjEwTld6Y0RVbzNhMFpxODQ1OGZr?=
 =?utf-8?B?eE5oMXZ6U1RwNTFqQkxVQlprOGFHQjRCUmdjbGVKSEVzNnpWZ1lXNUZHTEw2?=
 =?utf-8?B?b3RSeGd2TXVjdjRiSEpDY1FzTE5CdXArc3FVc0pLSE0zNE45STJwczZydjlV?=
 =?utf-8?B?L1p0WExjUTJvOHpJOFVmeWQySE02dGZGQTdNRUx5N2RoQjQvWkpKUWdyVG5I?=
 =?utf-8?B?WXVLQyt6WFJnai92cnFiYmpYMVN0eURlVkFYTnAzUUNzZElPckxlSzNIWWoy?=
 =?utf-8?B?M0R1elI3Vm9wa0xNaVZzc3NyT0pMTTc5QWJkL2ZBeXc2S1o1d0hXZEp2U1lL?=
 =?utf-8?B?VU51a05mdDh3dERxQjFMdHc5R3QrLzBZUTVxMGJPTHk1NERKZHRpZWxLQytQ?=
 =?utf-8?B?WEY1TUh3ZEh0aG5QQ3NDaEQwOVBPVVFkMXlaQUJzelRiaUFPODNzaW9wQUc3?=
 =?utf-8?B?V3VLQkM5RXE4MUhTY2dKQkNNNnI0K1Z3WC9lZmZldlVWVnpwSFpOSDhrTVQv?=
 =?utf-8?B?UTcyd2c5VzFVUTltcklveEpPL2Z5MGRHU2tEQnNUeHp1VXJPMjdvZzJOL2hR?=
 =?utf-8?B?RzBXM2FZZE4wNGZaWEFLUG9RZVVUNk1PS3JGdTZDclpITytVSnQzYlB0NVp5?=
 =?utf-8?B?T0k4Rnl0NHhSZm9tdEFJTnlpK2JMOFNLQkZUZExDSDhYanY2ZUUwdW5YaU45?=
 =?utf-8?B?L09KV2JISXl4MU8rZThoMm1hSG5iSUhKSTRPWU1lTFdCMkloNktIWDNTSjZF?=
 =?utf-8?B?cTA3MzFZSmlVdWZtQ05nVDZUaDVCV2JUTHM1b1FnMWtPL0xncjZ5QTExUU1C?=
 =?utf-8?B?ZHloL2xkOVVPS2EwLzFGRy9GYWtJWkpUWTROcldSaG0yOWZkMTJ3N3hsMFRv?=
 =?utf-8?B?UUw1Q2x4VjBHMTZRcnZONG5XeDM0bFBaTU4vKzd3bHVhUlNDN3E3Vk1NY0do?=
 =?utf-8?B?NkV3Q0JKWmFqSjQxNUpFVjF4TEI5cHlhZEQ4bzk3dS9iaE54cUpzcTkvSEhB?=
 =?utf-8?B?bnN5Um5VU3NWSGw4SUMrUUhsZW1jMFRyVkhvZmZMUTRNdDF3S1BKSFZmOVlq?=
 =?utf-8?B?NGdPT3ZFVnRVUStTVU5EUDNhNnozdUdVOGpBekdydHd0M2xjc2dQRjQveVAy?=
 =?utf-8?B?NVBOVzRyUGdUb1lqKzFldDMvbHdEbkMyVmRUMGw5TEdySnYvL2pobGM3bHRT?=
 =?utf-8?B?aCtLbkg4RllaMmlnNk1wZXZoSWhwQ2JmMVhEU1BZNUJRV2lSZ0VwSXErdE1v?=
 =?utf-8?B?WG5ORHk2L2l6K2ZtMWJlQy93Tm1PemJSSTIxV2JTK0d5YVJEZnVMM1ViQUYy?=
 =?utf-8?Q?dlEqyvS7aDFz6B9t28WzwouTYTqoQ/oKMmT0Tbf?=
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c54b5.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ea43dc2c-dada-4808-f9be-08dd57ddf059
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 09:54:49.2147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2414
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_015459_467357_3A479642 
X-CRM114-Status: GOOD (  21.65  )
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

Ck9uIDIvMjgvMjUgODo1MyBBTSwgRSBTaGF0dG93IHdyb3RlOgo+Cj4gT24gMi82LzI1IDE5OjAx
LCBIYWwgRmVuZyB3cm90ZToKPj4+IE9uIDA2LjAyLjI1IDE5OjE3LCBFIFNoYXR0b3cgd3JvdGU6
Cj4+PiBPbiAyLzUvMjUgMTg6NTksIEhhbCBGZW5nIHdyb3RlOgo+Pj4+IE9uIDIvNS8yMDI1IDY6
MDEgUE0sIEhlaW5yaWNoIFNjaHVjaGFyZHQgd3JvdGU6Cj4+Pj4+IE9uIDIvNS8yNSAwODo1Nywg
SGFsIEZlbmcgd3JvdGU6Cj4+Pj4+PiBPbiAyLzMvMjAyNSA5OjM3IEFNLCBFIFNoYXR0b3cgd3Jv
dGU6Cj4+Pj4+Pj4gQWRkIGJvb3RwaC1wcmUtcmFtIGhpbnRpbmcgdG8gamg3MTEwLWNvbW1vbi5k
dHNpOgo+Pj4+Pj4+ICDCoMKgIC0gaTJjNV9waW5zIGFuZCBpMmMtcGlucyBzdWJub2RlIGZvciBj
b25uZWN0aW9uIHRvIGVlcHJvbQo+Pj4+Pj4+ICDCoMKgIC0gZWVwcm9tIG5vZGUKPj4+Pj4+PiAg
wqDCoCAtIHFzcGkgZmxhc2ggY29uZmlndXJhdGlvbiBzdWJub2RlCj4+Pj4+Pj4gIMKgwqAgLSBt
ZW1vcnkgbm9kZQo+Pj4+Pj4+ICDCoMKgIC0gdWFydDAgZm9yIHNlcmlhbCBjb25zb2xlCj4+Pj4+
Pj4KPj4+Pj4+PiAgwqDCoCBXaXRoIHRoaXMgdGhlIFUtQm9vdCBTUEwgc2Vjb25kYXJ5IHByb2dy
YW0gbG9hZGVyIG1heSBkcm9wIHN1Y2gKPj4+Pj4+PiAgwqDCoCBvdmVycmlkZXMgd2hlbiB1c2lu
ZyBkdC1yZWJhc2luZyB3aXRoIEpINzExMCBPRl9VUFNUUkVBTSBib2FyZAo+Pj4gdGFyZ2V0cy4K
Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBFIFNoYXR0b3cgPGVAZnJlZXNoZWxsLmRlPgo+Pj4+Pj4+
IC0tLQo+Pj4+Pj4+ICDCoCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1jb21t
b24uZHRzaSB8IDYgKysrKysrCj4+Pj4+Pj4gIMKgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKykKPj4+Pj4+Pgo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0
YXJmaXZlL2poNzExMC1jb21tb24uZHRzaQo+Pj4+Pj4+IGIvYXJjaC9yaXNjdi9ib290L2R0cy9z
dGFyZml2ZS9qaDcxMTAtY29tbW9uLmR0c2kKPj4+Pj4+PiBpbmRleCAzMGM1ZjM0ODdjOGIuLmM5
ZTdhZTU5ZWU3YyAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJm
aXZlL2poNzExMC1jb21tb24uZHRzaQo+Pj4+Pj4+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMv
c3RhcmZpdmUvamg3MTEwLWNvbW1vbi5kdHNpCj4+Pj4+Pj4gQEAgLTI4LDYgKzI4LDcgQEAgY2hv
c2VuIHsKPj4+Pj4+PiAgwqDCoMKgwqDCoCBtZW1vcnlANDAwMDAwMDAgewo+Pj4+Pj4+ICDCoMKg
wqDCoMKgwqDCoMKgwqAgZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsKPj4+Pj4+PiAgwqDCoMKgwqDC
oMKgwqDCoMKgIHJlZyA9IDwweDAgMHg0MDAwMDAwMCAweDEgMHgwPjsKPj4+Pj4+PiArwqDCoMKg
wqDCoMKgwqAgYm9vdHBoLXByZS1yYW07Cj4+Pj4+Pj4gIMKgwqDCoMKgwqAgfTsKPj4+Pj4+PiAg
wqAgwqDCoMKgwqDCoCBncGlvLXJlc3RhcnQgewo+Pj4+Pj4+IEBAIC0yNDcsNiArMjQ4LDcgQEAg
ZW1tY192ZGQ6IGFsZG80IHsKPj4+Pj4+PiAgwqDCoMKgwqDCoCB9Owo+Pj4+Pj4+ICDCoCDCoMKg
wqDCoMKgIGVlcHJvbUA1MCB7Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGJvb3RwaC1wcmUtcmFt
Owo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJhdG1lbCwyNGMwNCI7
Cj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHg1MD47Cj4+Pj4+Pj4gIMKgwqDC
oMKgwqDCoMKgwqDCoCBwYWdlc2l6ZSA9IDwxNj47Cj4+Pj4+Pj4gQEAgLTMyMyw2ICszMjUsNyBA
QCAmcXNwaSB7Cj4+Pj4+Pj4gIMKgwqDCoMKgwqAgbm9yX2ZsYXNoOiBmbGFzaEAwIHsKPj4+Pj4+
PiAgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7Cj4+Pj4+
Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MD47Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IGJvb3RwaC1wcmUtcmFtOwo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgY2RucyxyZWFkLWRl
bGF5ID0gPDI+Owo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgc3BpLW1heC1mcmVxdWVuY3kg
PSA8MTAwMDAwMDAwPjsKPj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIGNkbnMsdHNoc2wtbnMg
PSA8MT47Cj4+Pj4+Pj4gQEAgLTQwNSw2ICs0MDgsNyBAQCBHUE9FTl9TWVNfSTJDMl9EQVRBLAo+
Pj4+Pj4+ICDCoMKgwqDCoMKgIH07Cj4+Pj4+Pj4gIMKgIMKgwqDCoMKgwqAgaTJjNV9waW5zOiBp
MmM1LTAgewo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBib290cGgtcHJlLXJhbTsKPj4+Pj4+PiAg
wqDCoMKgwqDCoMKgwqDCoMKgIGkyYy1waW5zIHsKPj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcGlubXV4ID0gPEdQSU9NVVgoMTksIEdQT1VUX0xPVywKPj4+Pj4+PiAgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdQT0VOX1NZ
U19JMkM1X0NMSywgQEAgLTQxMyw2ICs0MTcsNyBAQAo+Pj4+Pj4+IEdQSV9TWVNfSTJDNV9DTEsp
PiwKPj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIEdQT0VOX1NZU19JMkM1X0RBVEEsCj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHUElfU1lTX0kyQzVfREFUQSk+
Owo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiaWFzLWRpc2FibGU7IC8qIGV4
dGVybmFsIHB1bGwtdXAgKi8KPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib290cGgt
cHJlLXJhbTsKPj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW5wdXQtZW5hYmxl
Owo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnB1dC1zY2htaXR0LWVuYWJs
ZTsKPj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+Pj4+Pj4gQEAgLTY0MSw2ICs2NDYs
NyBAQCBHUE9FTl9ESVNBQkxFLAo+Pj4+Pj4+ICDCoCB9Owo+Pj4+Pj4+ICDCoCDCoCAmdWFydDAg
ewo+Pj4+Pj4+ICvCoMKgwqAgYm9vdHBoLXByZS1yYW07Cj4+Pj4+Pj4gIMKgwqDCoMKgwqAgY2xv
Y2stZnJlcXVlbmN5ID0gPDI0MDAwMDAwPjsKPj4+Pj4+PiAgwqDCoMKgwqDCoCBwaW5jdHJsLW5h
bWVzID0gImRlZmF1bHQiOwo+Pj4+Pj4+ICDCoMKgwqDCoMKgIHBpbmN0cmwtMCA9IDwmdWFydDBf
cGlucz47Cj4+Pj4+PiBXaGF0IGFib3V0ICZtbWMwLCAmbW1jMSwgJnFzcGksICZzeXNncGlvLCAm
bW1jMF9waW5zLAo+Pj4gJm1tYzFfcGlucywgJmkyYzU/Cj4+Pj4+PiBXaHkgbm90IGFkZCAiYm9v
dHBoLXByZS1yYW07IiBmb3IgdGhlbT8KPj4+Pj4gV291bGQgdGhleSBiZSBuZWVkZWQgYmVmb3Jl
IHJlbG9jYXRpb24gb2YgVS1Cb290IHRvIERSQU0/Cj4+Pj4gWWVhaCwgdGhleSBhcmUgbmVlZGVk
IGJ5IFNQTCBhbmQgdGhleSBhcmUgc2V0IGluIFUtQm9vdAo+Pj4+IGFyY2gvcmlzY3YvZHRzL2po
NzExMC1jb21tb24tdS1ib290LmR0c2kuCj4+Pj4KPj4+PiBCZXN0IHJlZ2FyZHMsCj4+Pj4gSGFs
Cj4+Pj4KPj4+IFdoZW4gSSB0ZXN0ZWQgb24gU3RhcjY0IHRoZXJlIHdhcyBub25lIG9mIHRob3Nl
IG5lZWRlZCB0byBib290LiBXZSBjYW4gYWRkCj4+PiBtb3JlIGJvb3RwaC1wcmUtcmFtIGFzIG5l
ZWRlZCBidXQgSSB3YW50IHRvIGtub3cgaG93IHRvIHRlc3QgKGJlY2F1c2UgSQo+Pj4gZGlkIG5v
dCBzZWUgYW55IG5lZWQgZm9yIHRoZXNlKS4KPj4+Cj4+PiBIb3cgZG8geW91IHRlc3QgdGhhdCB0
aGVzZSBhcmUgbmVlZGVkPwo+PiBJbiBteSBvcGluaW9uLCBTUEwgbmVlZCB0byByZWFkIFUtQm9v
dCBmcm9tIEVNTUMgKG1tYzApIG9yIFNEY2FyZCAobW1jMSkgb3IKPj4gUVNQSSBmbGFzaCAocXNw
aSkuIEFsc28gaXQgbmVlZCB0byBjaG9vc2UgdGhlIGNvcnJlY3QgRFRCIGJ5IHJlYWRpbmcgRUVQ
Uk9NCj4+IG1vdW50ZWQgb24gaTJjNS4gVG8gcnVuIG1tYyAvIGkyYyBkcml2ZXJzLCB0aGUgcGlu
IGNvbmZpZ3VyYXRpb25zIChzeXNncGlvLCBtbWMwLzFfcGlucykKPj4gYXJlIGFsc28gbmVlZGVk
Lgo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+IEhhbAo+IEVNTUMgb3IgU0RjYXJkIGFyZSBub3QgcG9z
c2libGUgdG8gYm9vdCAodmlhIEpINzExMCBib290IFJPTSwgZGlzdGluY3QKPiBmcm9tIFFTUEkg
Ym9vdCBvZiBVLUJvb3QgYW5kIGxhdGVyIEVNTUMgb3IgU0RjYXJkIGNhcGFiaWxpdHkpIGluIHRo
aXMKPiB3YXkgb24gc29tZSBvZiB0aGUgYm9hcmRzIHdoZXJlIHRyYW5zaXN0b3IgbG9naWMgcGFp
cnMgR1BJTzAgYW5kIEdQSU8xCj4gYm90aC1vZmYgb3IgYm90aC1vbi4gU0RjYXJkIGJvb3QgaXMg
b2ZmaWNpYWxseSByZWNvbW1lbmRlZCBhZ2FpbnN0IGFzCj4gIm5vdCBzdXBwb3J0ZWQiIGJ5IHRo
ZSBTdGFyRml2ZSByZWZlcmVuY2UgZG9jdW1lbnRhdGlvbiwgYW5kIEkgc3VwcG9zZQo+IHdoYXQg
cmVtYWlucyBpcyBFTU1DIGJvb3QgYXMgdmFsaWQgdGhvdWdoIEkgaGF2ZSBub3QgaGVhcmQgb2Yg
YW55IHVzZXJzCj4gZm9yIHRoaXMuCgoKSSB0ZW5kIHRvIHVzZSBTRGNhcmQgYm9vdCBvbiBteSBk
ZWVwY29tcHV0aW5nIGZtbDEzdjAxIGJvYXJkIHRvIHRlc3QKCmJlZm9yZSBJIGZsYXNoIHRoZSBm
aXJtd2FyZSB0byBzcGkgZmxhc2guIEkndmUgbm90IGVuY291bnRlcmVkIGlzc3Vlcy4gSQpoYXZl
IG5vdCB0cmllZCBlTU1DIGJ1dCBJIGFzc3VtZSBpdCBpcyB0aGUgc2FtZS4KCj4gV2hhdCBpcyB0
aGUgdGVzdCBwcm9jZWR1cmUgZm9yIEVNTUMgYm9vdCwgY2FuIHlvdSBleHBsYWluIGFuZCBJIHdp
bGwgdHJ5Cj4gaXQgb24gdGhlIFN0YXI2ND8KCgpJIGJlbGlldmUgdGhpcyBwYWdlIGNvbnRhaW5z
IGVub3VnaCBpbmZvIHRvIHVzZSBpdDoKCmh0dHBzOi8vZG9jcy51LWJvb3Qub3JnL2VuL2xhdGVz
dC9ib2FyZC9zdGFyZml2ZS92aXNpb25maXZlMi5odG1sCgo+IC1FCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
