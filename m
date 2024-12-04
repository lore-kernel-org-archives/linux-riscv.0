Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8A0E7716B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 03:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:Cc:References:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I+bQEk+LSNTjKgP/vfIDzupTmDZ910iJ81Iy8rc+yZs=; b=Eh7V7cF2D0uGgMhEozduX0ddbE
	8NfPBMk2mh35ICNBaeosf0H+VEIeHuiOhRoYWJMudDCcxhOKFMrN5WGYCRsP537Nq61d9Qk33oSJt
	LkL3crN/w5ZyusGCI+zTukf7OrH3RGFJVSSSdXmsoQdKMzJWwrk0/po5s5zpfH09ZupWn3OZRPACJ
	xcoj031WhF4Fm3ZsCTvoF4GC8m64HH3SzSdFff32FbHR8KNUvjGFLVkGrxbtzijytU0YP5K/WMRbl
	szqyPqWIJvfKKB/UZPrtfp5qQ7Sfq0iBzmCrbd5vJ755S2vL/4Ebt+gASYg51kAJon2SjvQaJoBqV
	oDgSWO6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIfzJ-0000000BNXP-0vk5;
	Wed, 04 Dec 2024 03:23:41 +0000
Received: from mail-southindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d408::] helo=MA0PR01CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIfzF-0000000BNVd-1OsS
	for linux-riscv@lists.infradead.org;
	Wed, 04 Dec 2024 03:23:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qj/VesgACq2oA+Y4w44cY4KcXDb1ahimCI4i9paJh840r+F0s1hl4gOe5w1VjkkFtELvfjkjfFyXoEFgocGf9qoJk0jmhqs5pbUBcyQPAkJejZoT+dMeFr6BjQZnfGkwvGqG8z/4F//76tRksM2yGX+sbNKgKYKvZQus7vp/7uQht0guGZof08l4/GjSzbACypYscjp4OPgTiFdYrUFzyqeChkdCwjvLlBKk3MJdv6JNNu3IskpIKoPghaD6Qi/cnH8vAgF9v7PC4AJ1p2uwsh8/DrCetNFQuo+pWYABT+bpWcb8gwjiLQCcOfhUYj9PCLomZ+e8xL8QmSc6/+lbZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEIYQkyB4Smd+P+BECZuWMz6OmOagP+INf/nQWIDIJ8=;
 b=jytept3bOjdo/OfP23oECJd6YIAXOF+mrjKZPohuF31zRsbPN17mSOq6NeBbDFp9R1Ju0havrsl8g8kqMoDoIDA75QLLl5aOe/snBo+SxW6/C48w5LLQQssYPDV4j4BYrkVLZGmVNIgGDH2njKbYwY/CZiuhkhMiCIZQNRlLcCxu46X/rx3iJznVygQ4jzRPxKif3/KcFdqZXmIMbnzyHIpNWk/pQSUfrB7wKPNptUqBxUHUAc5DVspNyxXuxMnincYqwg4jS0ppepxgiVTnkbatFB9tKZG8tJrt5buFBDDGPasET1NanMMlkGyJ4R0ckMTAEOIFOQ7HgRNMYnC+TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEIYQkyB4Smd+P+BECZuWMz6OmOagP+INf/nQWIDIJ8=;
 b=tEgWJyg7H9e3zdNeZYlRwaNdCge0VayOZqRu5CC/XWdKn1nha/2OcIyCNkPT308pyT5BErQoR3+FhIBj3WFLu2CTtRbN1Gr3HJGkPpGYviGX40cNvlqSwHsbStZLVfrHnluTAc6korFWML59TbwMIjMfD+BpU3Cgi+9kO/Xme6CbGH0nVKaN4H/XdOcqAbIPeWi7TtNGmRLDlmIXarMGEdS4dz1xz78KE0QZG8XNX5+BkXMqX7ZhvUzu/zg7oEYBG8uddKOegWkqosQRr4VSseRFgpIhsFfFw4fYidYjvnIUbTb9rWXOT1OLsHk1DPJcyiT7kmD0DJay2sQYhHfYYw==
Received: from MA1PR01MB3979.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:77::15)
 by PN0PR01MB9037.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:164::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Wed, 4 Dec
 2024 03:23:12 +0000
Received: from MA1PR01MB3979.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8f4f:f03b:c8ca:7432]) by MA1PR01MB3979.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8f4f:f03b:c8ca:7432%3]) with mapi id 15.20.8230.010; Wed, 4 Dec 2024
 03:23:12 +0000
Message-ID: <MA1PR01MB3979DAB77659B77873E009F7FE372@MA1PR01MB3979.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 4 Dec 2024 11:23:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] pwm: Add pwm driver for Sophgo SG2042
To: ukleinek@kernel.org
References: <cover.1733281657.git.unicorn_wang@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, inochiama@outlook.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, chunzhi.lin@sophgo.com
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <cover.1733281657.git.unicorn_wang@outlook.com>
X-ClientProxiedBy: SG2P153CA0009.APCP153.PROD.OUTLOOK.COM (2603:1096::19) To
 MA1PR01MB3979.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:77::15)
X-Microsoft-Original-Message-ID: <0bace35b-2679-4017-a3b7-a54a3689bd6d@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA1PR01MB3979:EE_|PN0PR01MB9037:EE_
X-MS-Office365-Filtering-Correlation-Id: 8898a657-b16e-4a57-9721-08dd1412fb41
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|7092599003|15080799006|19110799003|461199028|6090799003|8060799006|1602099012|440099028|10035399004|4302099013|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2xDaHBOaXh1eWNIWm10cS9pbVVCblNJajNIS0toNTN0aXpQMVBIVTdxMjJJ?=
 =?utf-8?B?bW5ldzJ3N2pjNG0vR3pCamNSbUx6UURvRElOTHVVMzJodjdwMy9LTjl5aTBz?=
 =?utf-8?B?blBNcjVvWHpkbTlYNHR6eFZyOVhXUUVjWHpTUWptYkdDanFwdHFiTEdJTGEw?=
 =?utf-8?B?MUJoM2h1UkJ5RStsVGV1UWdzR0h3bE1kNlpiM1ZaVTIwenJVRE9uSmI0eFRx?=
 =?utf-8?B?YmxOOVVCUjluaGEvaG9TREhnWkZkYlpyQjNnREFJY0RWbU9SdmVwL2R3UnlC?=
 =?utf-8?B?WmsrR0lycndyNHN4RDhVVjV2d0djWjU1VkF5b08yMGh2djZZMTZRNDBDZEdo?=
 =?utf-8?B?ejZUb1BZZWUxc3VrVUN2Y1p1RjdpTk9pc2RsZEx6OFArUnRhQnJIQUZ1cnRu?=
 =?utf-8?B?eTdIMTc0V3hHNHlkL2xKMTFsZEllc2oydzFGdnZ6RmdXUTc2WTZyc01ZTVpU?=
 =?utf-8?B?dzZqOTZLdTZiOGswK2pOZFpCTEJlOVN0cTUvc1pkTmJkT0JlWmFwUDJCRGht?=
 =?utf-8?B?TnRTMThDektVbENOUXJ5eTY3aW4wZ1hlekREZzdqRDV1ckFwWHlPWWo1bVEx?=
 =?utf-8?B?NDlPS3ZNU0c0N0ZWd0F2VFRtWlVEdzFINnE0eGV0bjBLMlhUckNCUTg3KzVG?=
 =?utf-8?B?RlhvOXk2bVZCbzB6QURXNWtzUHdZeEY0SW9LTkZFTnAzb0VsekliT1VKdW5Z?=
 =?utf-8?B?VFNpbW41d2xmQjFwZGNuTUJEdmcyVTVkL0hxYlZscXpIK3VNQkEvYUNMNDlE?=
 =?utf-8?B?NUVrWnlTQjFUVi90YkkydHF6aUJ5Nzlvc0tzTWtKQk9CMFdEN1lpdk1SR2ZK?=
 =?utf-8?B?YWR5YmxMdkIrMlZyamc3YzhrL245Z3lwWm43WXVzMUJ5Q2pnTjNOck02alJK?=
 =?utf-8?B?UndxZEd1eUFnYzVienhTUnBrUWdZSTFDWGVwSkd2QVo0STdPTnd5NldvcUJ3?=
 =?utf-8?B?SkhoUUZ3YUdJU2hqZFJPLzU2MnFoL0ZtUjNRdTlRR0JPVzE4Si8zakVNcmly?=
 =?utf-8?B?RzJoeStBZTEwRlhaVHZIV25nYWRlM25uMHhRamNDcS9OT1hOQ1RQbUIvVlVJ?=
 =?utf-8?B?TkdhU00zKzVRYTR5dXdZYmhZOWIwSkZWZDN4V0N6cmFOa2lnLzZGdGhtV2sw?=
 =?utf-8?B?VGl0SzhmNTdlZG1rRVFjYWRBck5kRW9MTHpvaUdETFNGQVN0SCtlcVFNUjh6?=
 =?utf-8?B?ZXZlL21qQzI4OUVFMDRJemtaaTVOVXkva01IWklPSXJaMUdFeXplOHFPMXFp?=
 =?utf-8?B?dmRhQTBKSWdocGk4a05wL1RObXYwQ3h2UHhFc2xWWFhGT1BhZDc2Q2RmYk1q?=
 =?utf-8?B?NEV2dC9vUzQyN3FGYnVxNXJ1eVJzSVdMS3l3aFpXT2U4cDJwYkxxY1o0TktB?=
 =?utf-8?B?OGNCNWU4NFQ2ODU2UWF1MUwyTFZqZUJobnBpZ3J6WFI5NVhoMzc3YmxTblZP?=
 =?utf-8?B?OURKdUwweC9nTTAvbFRwa2xkaUZiQTFqVXU1YlE2SmorcTVNcjdvWWZMYTRU?=
 =?utf-8?B?Wm84SVlPNUpwRlVHeHNvT2crTzBDbHJYUVNXVGVvZ0JwVXNjU0hWVzcxNDJv?=
 =?utf-8?B?aUR5TDZhbFhNMjFOelQvblB1NFpwaVNGVDZFNXlTbjExVVZQOGZEUUw3ZDFB?=
 =?utf-8?Q?bNy+K/SG6Jn0Tb8XskzNH7V17txBJ/K0MhfcpKDEq7HE=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ti92bml4RXVudGFVblRSWXNmQzlpSDByNG9BL1NaR05qT3FIVmZkSGYxOXZu?=
 =?utf-8?B?SEw5QlVTaERJUFM0QnVpN0xnZVJkOXVORHE1a0JBc2RUb2JiZjk4aXZBbUor?=
 =?utf-8?B?U25rbmFuWVppREZpUFoySDVyNjUyZU1xY1dYTHAxaUJmOE5OOTY3U3Evck5q?=
 =?utf-8?B?VzBXeU1CemRXcTl0Vms3OWlQWnFDdVkzZzhWM0FLVWxqK0R5dkpSWEtBR0k0?=
 =?utf-8?B?cDdyZ00xQ1NrbkdDZzBOVkVJMVZNSXllUFJ3Q1BSSVlXWVNQWEVqNjNoUFRC?=
 =?utf-8?B?ZWdwUnNoZVBqLzNLeUtNNXRFQ2JQQUJKWDFKYkVwTUhpQy9mZEkvTmxYNEsz?=
 =?utf-8?B?VXpMbU5wOUJRcjV2TlZXVWdjOGtMa2pSYWtnRGo3elhLR3VJcHdkV01ZR0ND?=
 =?utf-8?B?VXdVZlJNUXpvbmttMEtSUVdvUjRWVXdKVHN0VzArcjkvYWFMUzFXbXo1SjdR?=
 =?utf-8?B?YlNjUjBLQVlQYUVuVDBHL3dmMEJTOFdhYTRvVkZjWjVKZGNmU255UmNBcWNH?=
 =?utf-8?B?V2tFenkxZ1J1UGNhd2VWSU1lanB6enNuTkNXUklLTDVFOG5JLzkrOEIyWmpq?=
 =?utf-8?B?OEl3TzFsRHA3bzdYZmNXMlQ2YXRkM1d4YUZMUk5kRUhCS09wam5VOTJNVG5L?=
 =?utf-8?B?TkpxVWZBbkZ2VDNqQ3cxVUQ3L2lNbzJldUh1Tm9jeFBjVEY4amgzaHpBQWlt?=
 =?utf-8?B?VFJlMUxkY1cyeUNaM2xHTjBoN2xlY2FVUEhKcmxucCtLa3VGUHpaMklYVUpK?=
 =?utf-8?B?ZEQ0Sk5BZyswMWtwc2E0cjIxdG54clNLNUNIbVpybkhxaytzS3pibXZBQTRj?=
 =?utf-8?B?WG5DRmlEbVl2dTFQOFF1aFRsZTVtRDJUU0pLQ25KdFB1NTQ4bkhZZlB6QVZY?=
 =?utf-8?B?cVVNVzRJZnhGSUtQODdwc2tuYW0rbUZsYXNKTVVDR0NwTkdET2ZjMEF6U1pL?=
 =?utf-8?B?YWJYZUhuMUZ6R0ZrVFl5VFhUVU1rRllOajg2bEZoZ3FzcExLdEFwNm8wOXQ5?=
 =?utf-8?B?ZXdPRDY1eHdFZTFMbE5GMzU2K29zb3NkczVLNUk1YWEzU1JMZ21HNnVkQldX?=
 =?utf-8?B?WmJaUUFJVGVTcjlLMzZyWEhQbWx0VVRJZmxOWG5RRzBQVzdtWEtJdDRuWXho?=
 =?utf-8?B?bTZ2NWo5NFBiSDBGMllTNUd5L0YvdWxkQXdXTnd5eXFvV2dNUnJwRU9YQWQv?=
 =?utf-8?B?QzhLcEVIeFVjRjZBcmovNU52SWJQa2dVV3ZwTHR5Vk1iUUFGNnc0YkpYTnFQ?=
 =?utf-8?B?c1JGZkhMaGFtbHpsTVhMZkYzdm1wd05GeWM4SGljVXpkVVNXZTFJSDBQSm9Q?=
 =?utf-8?B?MEZ2akhISVFqZWNsMHg3Sm5FT2MyMVRZK2VGTlJ0bGhGbDYySnNQK09hSnV2?=
 =?utf-8?B?T2RTbDlnVjFYYTBYbDVJOGlxVUJBYnhuU2lLRzFjcXM2MXg2eHhvL2xKaXY5?=
 =?utf-8?B?bkordzhmMUpzOEZMMmdkZUoyZGpGMnlJS1EvOGt5alVsbGFMQk9xY1N5Y2Mw?=
 =?utf-8?B?OXN1L25ZYWk5NnEya09HNGlIUzVXZUo4cVR4elc0c2lpVVNRVGdFK1RVSHd4?=
 =?utf-8?B?TUp0aTFMR0J1ZXJiQldSUm1BajdlenZQUUN0RmdGZ1JqWVpLdUQ5REFaNHdy?=
 =?utf-8?B?d3Q5aEIxMW1jL2V5WFNDOVFiQXlYTnFiRXl2d0ZGSk41Z0wxMG1JeW5id3NE?=
 =?utf-8?Q?keIbzQg+Ji8Nkb5q2Zsk?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8898a657-b16e-4a57-9721-08dd1412fb41
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB3979.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 03:23:11.7674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB9037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_192337_370780_CB5B6F99 
X-CRM114-Status: GOOD (  16.71  )
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

SGksIFV3ZSwKCkkganVzdCB1cGdyYWRlZCB0aGlzIHBhdGNoc2V0IGFuZCByZWJhc2VkIGl0IHRv
IHRoZSBsYXRlc3QgdjYuMTMtcmMxLCAKaG9wZSB5b3UgY2FuIG1lcmdlIGl0IGluIHY2LjE0LgoK
QlRXLCB5b3UganVzdCBwbGVhc2UgaGFuZGxlIHRoZSBiaW5kaW5ncyAmIGRyaXZlciBwYXJ0LCBJ
IHdpbGwgaGFuZGxlIAp0aGUgbGVmdCBEVFMgcGFydC4KClRoYW5rcywKCkNoZW4KCk9uIDIwMjQv
MTIvNCAxMToxNSwgQ2hlbiBXYW5nIHdyb3RlOgo+IEZyb206IENoZW4gV2FuZyA8dW5pY29ybl93
YW5nQG91dGxvb2suY29tPgo+Cj4gQWRkIGRyaXZlciBmb3IgcHdtIGNvbnRyb2xsZXIgb2YgU29w
aGdvIFNHMjA0MiBTb0MuCj4KPiBUaGFua3MsCj4gQ2hlbgo+Cj4gLS0tCj4KPiBDaGFuZ2VzIGlu
IHY2Ogo+ICAgIE5vdGhpbmcgbWFqb3IgY2hhbmdlcyBqdXN0IHJlYmFzZWQgb250byB2Ni4xMy1y
YzEgYW5kIHJldGVzdGVkLgo+Cj4gQ2hhbmdlcyBpbiB2NToKPiAgICBUaGUgcGF0Y2ggc2VyaWVz
IGlzIGJhc2VkIG9uIHY2LjEyLXJjMS4gWW91IGNhbiBzaW1wbHkgcmV2aWV3IG9yIHRlc3QKPiAg
ICB0aGUgcGF0Y2hlcyBhdCB0aGUgbGluayBbNV0uCj4KPiAgICBVcGRhdGVkIGRyaXZlciB0byBh
ZGQgcmVzZXRzIHByb3BlcnR5IGZvciBwd20gY29udHJvbGxlciBub2RlIGFzIHBlcgo+ICAgIHN1
Z2dlc3Rpb24gZnJvbSBJbm9jaGkuCj4KPiBDaGFuZ2VzIGluIHY0Ogo+ICAgIFRoZSBwYXRjaCBz
ZXJpZXMgaXMgYmFzZWQgb24gdjYuMTItcmMxLiBZb3UgY2FuIHNpbXBseSByZXZpZXcgb3IgdGVz
dAo+ICAgIHRoZSBwYXRjaGVzIGF0IHRoZSBsaW5rIFs0XS4KPgo+ICAgIFVwZGF0ZWQgZHJpdmVy
IHRvIHNldCBwcm9wZXJ0eSBhdG9taWMgb2YgcHdtX2NoaXAgdG8gdHJ1ZSBhcyBwZXIgc3VnZ2Vz
dGlvbgo+ICAgIGZyb20gU2Vhbi4KPgo+IENoYW5nZXMgaW4gdjM6Cj4gICAgVGhlIHBhdGNoIHNl
cmllcyBpcyBjYXRjaGVkIHVwIHdpdGggdjYuMTItcmMxLiBZb3UgY2FuIHNpbXBseSByZXZpZXcg
b3IgdGVzdAo+ICAgIHRoZSBwYXRjaGVzIGF0IHRoZSBsaW5rIFszXS4KPgo+ICAgIEFkZCBwYXRj
aCAjMyBmb3IgZHRzIHBhcnQgY2hhbmdlLgo+Cj4gQ2hhbmdlcyBpbiB2MjoKPiAgICBUaGUgcGF0
Y2ggc2VyaWVzIGlzIGJhc2VkIG9uIHY2LjExLXJjNi4gWW91IGNhbiBzaW1wbHkgcmV2aWV3IG9y
IHRlc3QgdGhlCj4gICAgcGF0Y2hlcyBhdCB0aGUgbGluayBbMl0uCj4KPiAgICBGaXhlZCBmb2xs
b3dpbmcgaXNzdWVzIGFzIHBlciBjb21tZW50cyBmcm9tIFlpeHVuIExhbiwgS3J6eXN6dG9mIEtv
emxvd3NraQo+ICAgIGFuZCBVd2UgS2xlaW5lLUvDtm5pZywgdGhhbmtzLgo+Cj4gICAgLSBTb21l
IG1pbm9yIGlzc3VlcyBpbiBkdC1iaW5kaW5ncy4KPiAgICAtIGRyaXZlciBpc3N1ZXMsIHVzZSBt
YWNyb3Mgd2l0aCBuYW1lIHByZWZpeCBmb3IgcmVnaXN0ZXJzIGFjY2VzczsgYWRkCj4gICAgICBs
aW1pdGF0aW9ucyBjb21tZW50czsgZml4ZWQgcG90ZW50aWFsIGNhbGN1bGF0aW9uIG92ZXJmbG93
IHByb2JsZW07Cj4gICAgICBhZGQgLmdldF9zdGF0ZSgpIGNhbGxiYWNrIGFuZCBvdGhlciBtaXNj
ZWxsYW5lb3VzIGNvZGUgaW1wcm92ZW1lbnRzLgo+Cj4gQ2hhbmdlcyBpbiB2MToKPiAgICBUaGUg
cGF0Y2ggc2VyaWVzIGlzIGJhc2VkIG9uIHY2LjExLXJjNi4gWW91IGNhbiBzaW1wbHkgcmV2aWV3
IG9yIHRlc3QgdGhlCj4gICAgcGF0Y2hlcyBhdCB0aGUgbGluayBbMV0uCj4KPiBMaW5rOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9jb3Zlci4xNzI1NTM2ODcwLmdpdC51bmlj
b3JuX3dhbmdAb3V0bG9vay5jb20vIFsxXQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LXJpc2N2L2NvdmVyLjE3MjU5MzE3OTYuZ2l0LnVuaWNvcm5fd2FuZ0BvdXRsb29rLmNv
bS8gWzJdCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvY292ZXIu
MTcyODM1NTk3NC5naXQudW5pY29ybl93YW5nQG91dGxvb2suY29tLyBbM10KPiBMaW5rOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9jb3Zlci4xNzI5MDM3MzAyLmdpdC51bmlj
b3JuX3dhbmdAb3V0bG9vay5jb20vIFs0XQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LXJpc2N2L2NvdmVyLjE3Mjk4NDMwODcuZ2l0LnVuaWNvcm5fd2FuZ0BvdXRsb29rLmNv
bS8gWzVdCj4gLS0tCj4KPiBDaGVuIFdhbmcgKDMpOgo+ICAgIGR0LWJpbmRpbmdzOiBwd206IHNv
cGhnbzogYWRkIFBXTSBjb250cm9sbGVyIGZvciBTRzIwNDIKPiAgICBwd206IHNvcGhnbzogYWRk
IGRyaXZlciBmb3IgU29waGdvIFNHMjA0MiBQV00KPiAgICByaXNjdjogc29waGdvOiBkdHM6IGFk
ZCBwd20gY29udHJvbGxlciBmb3IgU0cyMDQyIFNvQwo+Cj4gICAuLi4vYmluZGluZ3MvcHdtL3Nv
cGhnbyxzZzIwNDItcHdtLnlhbWwgICAgICAgfCAgNTggKysrKysrCj4gICBhcmNoL3Jpc2N2L2Jv
b3QvZHRzL3NvcGhnby9zZzIwNDIuZHRzaSAgICAgICAgfCAgIDkgKwo+ICAgZHJpdmVycy9wd20v
S2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEwICsKPiAgIGRyaXZlcnMvcHdt
L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gICBkcml2ZXJzL3B3
bS9wd20tc29waGdvLXNnMjA0Mi5jICAgICAgICAgICAgICAgfCAxOTQgKysrKysrKysrKysrKysr
KysrCj4gICA1IGZpbGVzIGNoYW5nZWQsIDI3MiBpbnNlcnRpb25zKCspCj4gICBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9zb3BoZ28sc2cy
MDQyLXB3bS55YW1sCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9wd20vcHdtLXNvcGhn
by1zZzIwNDIuYwo+Cj4KPiBiYXNlLWNvbW1pdDogNDAzODRjODQwZWExOTQ0ZDdjNWEzOTJlODk3
NWVkMDg4ZWNmMGIzNwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
