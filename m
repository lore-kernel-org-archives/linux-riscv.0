Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C03C021A0
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 08:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIVYcI3FPQTvWhlyVDvYvHMjjNMkZDKbDSaelWVSS0s=; b=Ma3ZQQQnfdbZZ+TWFriNoMtBfT
	R3htd1lJwFpt4jXaJapZv1BLDV3tkkF/KiPHBJm8uB72ewC9wUqZKNu3DkTJYq7ktUdYPnsGL8aW+
	UptWKi/+MAA0XeQpQ7spF3czHW/hASXj51wzzmAXmFivKKxmAm6Fc24+HsRr1oFblMy5kEJ7mBQmF
	wj/SO/AlgDaBANMnlSBRwM/X1ESMp89mz6PvZscDVoEYnfThN7iRZxan/3cWaga8vXnLFBVt3De9D
	uj2/1at/ProVvg2OI5uKGWMLbuPiRJiXFphYUYYPq/tj8/ZRTbZJOnjyCBZCfaGlAMZxNYoFQOBlT
	nwn8dO8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwQe-00000003kkW-3u3x;
	Mon, 17 Feb 2025 08:24:36 +0000
Received: from mail-centralindiaazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d409::1] helo=PNZPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwOo-00000003kT3-1UgH
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 08:22:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2oCNUiBmlOG73nVn0rA6EYbbUf1Xolbi/evrY+oSf967G0Jpia1yfe/pCrg54+Q0EYCTneHbwYAO2AN4auIYHWlPycHJB16hYofYYpFynqwhrDCXJUqeHoMD68K7O7H1NQKsFvyB8WIU3KVTskqT3MmJ46iDOKrGqy0+xJdJyjK2Uzjft9W6oQH4ELyx8TAi+CAPbEdqOX/yDux42mnApXXCw7Bxw6eZgHTMvTqqZ489105K7jO9wOQZyqwiQJrldya0VCwJoDRz0hB/Hp/t1ZNEyve0wfUodvge97dKvIcMz7us+XOm0w8cywBHqVO4yQs7ZmjSwfg8VHHNA8ubQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1Z80JjkPmiEvyWEEXR8fcj0Ka9yDmmar+GY94yExG0=;
 b=Kaes00iKK8v0Rqaw1Y2V2ZpLwXvJBe4xHE4FesCU0ffkmozG45QQAxS1Efpu0stL96zcj+kbfCCYh6I1o4oaFdKwNE78NOjBsMoAFtJ0qZIkQ3gFUIZVfgt0Rf2UkdkV+K0KhjME8BTbhuPMTr9Rv9Rcqs7Bjhy52abCjGFWorfWuMlV2P+vTAmXggCF9bUjcIpfwv4o2CGYuT7fsc93A9S+tqLigp4+gGONKAWB5F3+B1ibCITz3Irol+84v84eIesiY5cJr7m/3sXxHuZBRITci2lTvLol1LPdCZvqsdMmJaCsHjeUFRf99KSgoBfkitWl0eKSQWqrVagQmqbDxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1Z80JjkPmiEvyWEEXR8fcj0Ka9yDmmar+GY94yExG0=;
 b=cMS4seh4E5B2w3bdFOV9T6L7wp6qHoIAmjvUUq+cghGHiWRAeqXtBaBK+WSE6TPCieo2OgSJrjp/VmrcgYgTguiXMcpDH24+3So/Xm46sDhhLW7NRfuDlikidOe26yeXikWrTSSGF9Uard6jfnGo2LDk6zu5OY6wRmTY+evGN4j0Gyt6YdmpQ4q9J2ZisHZAiOIZ0VMrR3UZZtkWxi2vF5MOyVxtM+d3rgvNPZHeM6s97bKBG9lgcp5H0zTKotnD6J6uP6RvAtHjGi/AOQ3yGJ+6Ousg9rzVpjus9zF4DGqxyexHhPWsP5lrw+phU9Gs5fQ1NrKzTt3xg/AxuxBppA==
Received: from MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:6e::9)
 by PN0PR01MB7719.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:b6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 08:22:15 +0000
Received: from MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6e06:bc2e:85c0:c2ee]) by MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6e06:bc2e:85c0:c2ee%2]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 08:22:15 +0000
Message-ID: <MA0PR01MB56715414B26AA601CFFB54C8FEFB2@MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 17 Feb 2025 16:22:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] PCI: sg2042: Add Sophgo SG2042 PCIe driver
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, maz@kernel.org
Cc: Chen Wang <unicornxw@gmail.com>, kw@linux.com,
 u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, arnd@arndb.de,
 bhelgaas@google.com, conor+dt@kernel.org, guoren@kernel.org,
 inochiama@outlook.com, krzk+dt@kernel.org, lee@kernel.org,
 lpieralisi@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 pbrobinson@gmail.com, robh@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
 xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com, helgaas@kernel.org
References: <cover.1736923025.git.unicorn_wang@outlook.com>
 <ddedd8f76f83fea2c6d3887132d2fe6f2a6a02c1.1736923025.git.unicorn_wang@outlook.com>
 <20250119122353.v3tzitthmu5tu3dg@thinkpad>
 <BM1PR01MB254540560C1281CE9898A5A0FEE12@BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM>
 <20250122173451.5c7pdchnyee7iy6t@thinkpad>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250122173451.5c7pdchnyee7iy6t@thinkpad>
X-ClientProxiedBy: TYBP286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::23) To MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:6e::9)
X-Microsoft-Original-Message-ID: <82f5ef91-4305-4b18-ae57-5d6f20a33fc7@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0PR01MB5671:EE_|PN0PR01MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a7df507-f591-4f13-99ee-08dd4f2c2f1a
X-Microsoft-Antispam: BCL:0;ARA:14566002|6090799003|5072599009|19110799003|8060799006|15080799006|461199028|7092599003|3412199025|440099028|41001999003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTczTmo3MGpxZEJuR0ZmWHhlbWdEUEgySGlzdEFyRTJYL1JrQmZKenpjTFgw?=
 =?utf-8?B?RXM1d0Mvdk13RWE5ODZYdGt3VTNnREZhRTJ3ZUwwbUJ0L1dvVndieEtSd3J4?=
 =?utf-8?B?ekxuK2lxMUFXR0ptanJNOXhGdCtKdGJRWHJWem93WWNnVUI2RUg0ZmpOYnEy?=
 =?utf-8?B?UW14dTN6NEZXZHNpWG5FTGV3d0x6ajhiZTlzSk9wZTd5eVZWbnA5clRpVzBF?=
 =?utf-8?B?TGdNRFZxTnU4ZlkrTkJ0dlNXMjF2VzVoVHJkb0RMM0xIYXFpUGY1ajR1NmJZ?=
 =?utf-8?B?dzR2UHFoU1FnYjEvczd2VnJobGFOYlc3d0dSSUptaUZTR1IrYmJmTkZPdlBY?=
 =?utf-8?B?UUhpanI3U0dvTUpvczhmYTBuM3ZRbjBUdFJxVXEvY01lN3hxZzZTUlVkWFRX?=
 =?utf-8?B?WEFLSjhQR3pjanJuSGZza2pSZW44S2JhcGdqMkJiOWtwa3kyeEU5Szc5UW9k?=
 =?utf-8?B?c0t3bk9GRU9sdWlVUnR0cTFWQVRQLzF6aERTeVdHdk5jOUJhdmVoOG0rUWRm?=
 =?utf-8?B?dk1kcmoxajVxSzF4cnUzbnF4NTFtRjZvaWlZS3VqU1VobUNwSmdhb2I5YzBN?=
 =?utf-8?B?SFpXWjBXOWhYVTROSVluQjNHSFkrcWl6WVdLNllDeUJOZXgxVmJKTC9HV09S?=
 =?utf-8?B?UnVsMlpLbEdBVkhjcjBRTERJcllsMGR3dkgrSlN2eUpua2J1RDJUQ2x0ekJu?=
 =?utf-8?B?Vld6WlVBdEUyU0ZiS3pycUZIOU9kbWkyY3B1aEU1WU4vVEZIY295L1IzSEh5?=
 =?utf-8?B?NVV6aDdpa3FTVUhKbXdCeWdYSk15NXZnTHI2ZGFTOHU3elIvajNGTnBGMnJM?=
 =?utf-8?B?aWtsRU1OSmF3YjZKZVhCUVJ0eFcvREx2U0N3NjN5OHpYYi9sUWRveUszSkFP?=
 =?utf-8?B?TkthN0NRL2tjZHFYSGFxNzJzc09RVUtocmdNVFRsakJSMlJyZUpwQm9nZzVj?=
 =?utf-8?B?bjZ1WWdsOHdNQjZMdmpvcjgxOFFINUpRWktBSUtqakQ0TSsxaU5VTVdTQ0pz?=
 =?utf-8?B?MHEwVGVlVGFNSWhNTmxPN1hldFRKYVRyaCs1dTB0d1JZQnpsNER4VUVDWTBW?=
 =?utf-8?B?M0tLQXFtcU9PRmhHL1RLYzFnN1NZSFp3Y2VKTnpUTlNuSjZXY3U2TUxhU204?=
 =?utf-8?B?eFdLcnFtMUJ1WW5kbHc2OTNNR3BVSlB6Vi9MaWtQUWQ0aS9uR1dvaG41SDBY?=
 =?utf-8?B?dXM5M2MySUo3d0x2RSt0WXJNcGJVc1Q2YnBWMi9MSklGdXZuM0xQVkc2alpY?=
 =?utf-8?B?VGFpcWI5RGdFclphREtLSzRKMjJreGg2LzJTMVF4WXhVYWRrcDVaeUhhenpn?=
 =?utf-8?B?MUptTGg0T0MzVXJPT0VNZXlLQWoyTlp5Yi9OYWdnMTd0L08yRVF5eDZHQW8r?=
 =?utf-8?B?cVBOMCtyMFBpVTU4bnJCK2hRdUNrZ2c3OE8wOEJRT21GT3J0K1VBTzhoOC90?=
 =?utf-8?B?NjRvdHRDT3FrblN1c2JLNVdjSzNVQlFncXdrenN5dkNFSGxlRlp0L1Y4RWpW?=
 =?utf-8?B?T1JtNlgxS2FwK2dEM3QrRUI3WHdneFF4eGRTWWxOSmo5VzVEanYrcVlMV1Ri?=
 =?utf-8?B?Q0hRZz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHpCTkpXY3ZDRjM4S0YzLzQ5ZUs1UGJ0UVFmL0xsYzZsVTBHYS9WeXNZVU54?=
 =?utf-8?B?SkxkWlpwUkpyeE5PR3o4QnI0Z3VpbXhneGhKZWxlZ3hDNkVQZXltRDN4ampx?=
 =?utf-8?B?RWdLRzkrM2lVN2Rab1dUd2ExUnkwSGp3cjlSUklIZng0Mmo1UU13ZWw0eGFI?=
 =?utf-8?B?RnBqWUxBUFpKY1VucXVWQ2hLU09DUFJEbVFpRElybC9lcklhRisyQ3FNZVJW?=
 =?utf-8?B?T2ZLTWs2STcwQ1FRN28yenlNcHg3emxNTE9uYjRWOWNQaVA2aFJrMlVuRll5?=
 =?utf-8?B?ZzZ4UEdkQXdEUVFFWjFXSzFHeFBWRzQrc0xQUG1iWit4eDZoVkVMdkU2b3Az?=
 =?utf-8?B?NlVINm1nZ1JiUEY0M3grRUNNbnlhaUl3dU4vbXR1dmlaMjV4cUZpTm1iczR5?=
 =?utf-8?B?d0ZYSFdjMVhXVE4rUHBtTE0xSmJZYnZ3WU5rRE5ETERzSVJzTDNHcnlzVElo?=
 =?utf-8?B?ZVd2VnA5RlpyWW5rNlZweTM2ZGxyL295SHpOaWxOZ2VvQk1lR3d4M0l4aHho?=
 =?utf-8?B?ZnZtRXZaOWs5dzRDRnBGVzBTSVo2cjlpaU5OK1BTazNESGM2QUJTNHJ5aGpl?=
 =?utf-8?B?cjZFQzlJZENRUmhXT2FMNGxoMTBsZzU5VFBsbjg2VFRKMTk5TVpyY2ZtU3BD?=
 =?utf-8?B?bk82TStvUWJ4RlRZdEVyUjRldk9URW9IbnRYOXZJWHdsb1BkYjJ3bXptbXFk?=
 =?utf-8?B?dzN4OHFiN3JIMnk4WlpOaHVycGRtWkpLYTFra1RlekRrN243UkduUThSZWZz?=
 =?utf-8?B?SG9XRWE1RllQRlkrTnpCT2JrZHg3aEptVjJ3WnN3cWdQdXFXQ3lRTFZoWjB5?=
 =?utf-8?B?dHpsOHNuTG1sZFBWMG5vdnJCS0M5eDdaN1FBUllhNVpYUEJoZXRCdGlDQ0gz?=
 =?utf-8?B?UGJydzJIb2xaczhmQndHTGU2UzdpVXlST1dwK0RVZ3pJV0hGdGQzTDFUNnJC?=
 =?utf-8?B?ODFuSGh0YVBuTG14MVhDZHdlVkxhemJzMTljcU1zelRhRlBBNVFKMlUyQTZi?=
 =?utf-8?B?SGZJWHZTMDAvTlZ6L0NZbG9sRS9tcWVoRU5HN3JGbDR0NmM1eXZOZEFsZDNm?=
 =?utf-8?B?a3lxdG9FaTJHMlhnOFJDRXVLZEFjQ2pUSnFmVUFodi9XUlgyZlBaK01Rc1pV?=
 =?utf-8?B?em9XbE9ZRFkzelpjdW0yUE1Sd0UrR3JzUG9vMmoyZ0djNVZYNWJNVHZpN3hq?=
 =?utf-8?B?SzliUTIxeGtHeDR6dWhpRS9aYlZXdllYZFFKY05nV2lvR1h5eG9GS09KSGp0?=
 =?utf-8?B?bWZJb0FESVFCNHREREovZTBaMjlpenJMbEQyMVdlY3ZqaFlVZlMyZDJ1YTdN?=
 =?utf-8?B?dE9FcDB3NkdRMHVqZFh0bXY0S2p2VGkxK1crc1lNc1ZBWTBzVVlWaEM0blpo?=
 =?utf-8?B?SWhnMkFFbzFyenFFdnhPaTVZU0cwVGZLeThvTVR0N0gwd3pWZkUyeFM3VUdz?=
 =?utf-8?B?UU9zbXZ6SnVQdXBrTWloRkppYk1rZXVhRHNJa1djQjV3TlNNWmtrL1NMa1Bp?=
 =?utf-8?B?U0VCMi9oWWJ0YVRoU2pWbnNKU0N2NnpwQmRSZklUQ3I2ZHBlK29MYVpIY1Uz?=
 =?utf-8?B?eUl4OUlhcXVtT0dNSHpzeURMbXVBLzJGSUJlcHNneTk3WnF2OGlhcjhsWFhO?=
 =?utf-8?B?c1NZSnF6WkZIeXJ5MlpsODZnWlJkdk1jKzBCeFduNk1zNi9UQ2x3MGpCWG4z?=
 =?utf-8?B?NnVZRmJUdjNnNFR3VTRGTFR1RnIvbnFkQjFneTEvWWt6NXVuRHk1U2JxSlN5?=
 =?utf-8?Q?rB0uUzsedTznTSpTG5NIJWk6IwvjlpQ2bd0HUXv?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a7df507-f591-4f13-99ee-08dd4f2c2f1a
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 08:22:14.8558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB7719
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_002242_392587_6CB61BC1 
X-CRM114-Status: GOOD (  15.00  )
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

Ck9uIDIwMjUvMS8yMyAxOjM0LCBNYW5pdmFubmFuIFNhZGhhc2l2YW0gd3JvdGU6CgpbLi4uLi4u
XQo+Pj4+ICsvKgo+Pj4+ICsgKiBTRzIwNDIgUENJZSBjb250cm9sbGVyIHN1cHBvcnRzIHR3byB3
YXlzIHRvIHJlcG9ydCBNU0k6Cj4+Pj4gKyAqCj4+Pj4gKyAqIC0gTWV0aG9kIEEsIHRoZSBQQ0ll
IGNvbnRyb2xsZXIgaW1wbGVtZW50cyBhbiBNU0kgaW50ZXJydXB0IGNvbnRyb2xsZXIKPj4+PiAr
ICogICBpbnNpZGUsIGFuZCBjb25uZWN0IHRvIFBMSUMgdXB3YXJkIHRocm91Z2ggb25lIGludGVy
cnVwdCBsaW5lLgo+Pj4+ICsgKiAgIFByb3ZpZGVzIG1lbW9yeS1tYXBwZWQgTVNJIGFkZHJlc3Ms
IGFuZCBieSBwcm9ncmFtbWluZyB0aGUgdXBwZXIgMzIKPj4+PiArICogICBiaXRzIG9mIHRoZSBh
ZGRyZXNzIHRvIHplcm8sIGl0IGNhbiBiZSBjb21wYXRpYmxlIHdpdGggb2xkIFBDSWUgZGV2aWNl
cwo+Pj4+ICsgKiAgIHRoYXQgb25seSBzdXBwb3J0IDMyLWJpdCBNU0kgYWRkcmVzcy4KPj4+PiAr
ICoKPj4+PiArICogLSBNZXRob2QgQiwgdGhlIFBDSWUgY29udHJvbGxlciBjb25uZWN0cyB0byBQ
TElDIHVwd2FyZCB0aHJvdWdoIGFuCj4+Pj4gKyAqICAgaW5kZXBlbmRlbnQgTVNJIGNvbnRyb2xs
ZXIgInNvcGhnbyxzZzIwNDItbXNpIiBvbiB0aGUgU09DLiBUaGUgTVNJCj4+Pj4gKyAqICAgY29u
dHJvbGxlciBwcm92aWRlcyBtdWx0aXBsZSh1cCB0byAzMikgaW50ZXJydXB0IHNvdXJjZXMgdG8g
UExJQy4KPj4+PiArICogICBDb21wYXJlZCB3aXRoIHRoZSBmaXJzdCBtZXRob2QsIHRoZSBhZHZh
bnRhZ2UgaXMgdGhhdCB0aGUgaW50ZXJydXB0Cj4+Pj4gKyAqICAgc291cmNlIGlzIGV4cGFuZGVk
LCBidXQgYmVjYXVzZSBmb3IgU0cyMDQyLCB0aGUgTVNJIGFkZHJlc3MgcHJvdmlkZWQgYnkKPj4+
PiArICogICB0aGUgTVNJIGNvbnRyb2xsZXIgaXMgZml4ZWQgYW5kIG9ubHkgc3VwcG9ydHMgNjQt
Yml0IGFkZHJlc3MoPiAyXjMyKSwKPj4+PiArICogICBpdCBpcyBub3QgY29tcGF0aWJsZSB3aXRo
IG9sZCBQQ0llIGRldmljZXMgdGhhdCBvbmx5IHN1cHBvcnQgMzItYml0IE1TSQo+Pj4+ICsgKiAg
IGFkZHJlc3MuCj4+Pj4gKyAqCj4+Pj4gKyAqIE1ldGhvZCBBICYgQiBjYW4gYmUgY29uZmlndXJl
ZCBpbiBEVFMsIGRlZmF1bHQgaXMgTWV0aG9kIEIuCj4+PiBIb3cgdG8gY29uZmlndXJlIHRoZW0/
IEkgY2FuIG9ubHkgc2VlICJzb3BoZ28sc2cyMDQyLW1zaSIgaW4gdGhlIGJpbmRpbmcuCj4+Cj4+
IFRoZSB2YWx1ZSBvZiB0aGUgbXNpLXBhcmVudCBhdHRyaWJ1dGUgaXMgdXNlZCBpbiBkdHMgdG8g
ZGlzdGluZ3Vpc2ggdGhlbSwKPj4gZm9yIGV4YW1wbGU6Cj4+Cj4+IGBgYGR0cwo+Pgo+PiBtc2k6
IG1zaS1jb250cm9sbGVyQDcwMzAwMTAzMDAgewo+PiAgwqDCoMKgIC4uLi4uLgo+PiB9Owo+Pgo+
PiBwY2llX3JjMDogcGNpZUA3MDYwMDAwMDAwIHsKPj4gIMKgwqDCoCBtc2ktcGFyZW50ID0gPCZt
c2k+Owo+PiB9Owo+Pgo+PiBwY2llX3JjMTogcGNpZUA3MDYyMDAwMDAwIHsKPj4gIMKgwqDCoCAu
Li4uLi4KPj4gIMKgwqDCoCBtc2ktcGFyZW50ID0gPCZtc2lfcGNpZT47Cj4+ICDCoMKgwqAgbXNp
X3BjaWU6IGludGVycnVwdC1jb250cm9sbGVyIHsKPj4gIMKgwqDCoMKgwqDCoMKgIC4uLi4uLgo+
PiAgwqDCoMKgIH07Cj4+IH07Cj4+Cj4+IGBgYAo+Pgo+PiBXaGljaCBtZWFuczoKPj4KPj4gcGNp
ZV9yYzAgdXNlcyBNZXRob2QgQgo+Pgo+PiBwY2llX3JjMSB1c2VzIE1ldGhvZCBBLgo+Pgo+IE9r
LiB5b3UgbWVudGlvbmVkICdkZWZhdWx0IG1ldGhvZCcgd2hpY2ggaXMgbm90IGFjY3VyYXRlIHNp
bmNlIHRoZSBjaG9pY2UKPiBvYnZpb3VzbHkgZGVwZW5kcyBvbiBEVC4gTWF5YmUgeW91IHNob3Vs
ZCBzYXksICdjb21tb25seSB1c2VkIG1ldGhvZCc/IEJ1dCBib3RoCj4gdGhlIGJpbmRpbmcgYW5k
IGR0cyBwYXRjaGVzIG1ha2UgdXNlIG9mIGluLWJ1aWx0IE1TSSBjb250cm9sbGVyIG9ubHkgKG1l
dGhvZCBBKS4KCiJjb21tb25seSB1c2VkIG1ldGhvZCIgbG9va3Mgb2sgdG8gbWUuCgpCaW5kaW5n
IGV4YW1wbGUgb25seSBzaG93cyB0aGUgY2FzZSBmb3IgTWV0aG9kIEEsIGR1ZSB0byBJIHRoaW5r
IHRoZSAKd3JpdGluZyBvZiBjYXNlIGZvciBNZXRob2QgQcKgIGNvdmVycyB0aGUgd3JpdGluZyBv
ZiBjYXNlIGZvciBNZXRob2QgQi4KCkRUUyBwYXRjaGVzIHVzZSBib3RoIE1ldGhvZCBBIGFuZCBC
LiBZb3UgY2FuIHNlZSBwYXRjaCA0IG9mIHRoaXMgCnBhdGNoc2V0LCBwY2llX3JjMSB1c2VzIE1l
dGhvZCBBLCBwY2llX3JjMCAmIHBjaWVfcmMyIHVzZSBNZXRob2QgQi4KCj4gSW4gZ2VuZXJhbCwg
Zm9yIE1TSSBpbXBsZW1lbnRhdGlvbnMgaW5zaWRlIHRoZSBQQ0llIElQLCB3ZSBkb24ndCB1c3Vh
bGx5IGFkZCBhCj4gZGVkaWNhdGVkIGRldmljZXRyZWUgbm9kZSBzaW5jZSB0aGUgSVAgaXMgdGhl
IHNhbWUuIEJ1dCBpbiB5b3VyIHJlcGx5IHRvIHRoZSBteQo+IHF1ZXN0aW9uIG9uIHRoZSBiaW5k
aW5ncyBwYXRjaCwgeW91IHNhaWQgaXQgaXMgYSBzZXBhcmF0ZSBJUC4gSSdtIGNvbmZ1c2VkIG5v
dy4KCkkgbGVhcm5lZCB0aGUgd3JpdGluZyBvZiBEVFMgZnJvbSAiYnJjbSxpcHJvYy1wY2llIiwg
c2VlIAphcmNoL2FybS9ib290L2R0cy9icm9hZGNvbS9iY20tY3lnbnVzLmR0c2kgZm9yIGV4YW1w
bGUuIFdvdWxkbid0IGl0IGJlIApjbGVhcmVyIHRvIGVtYmVkIGFuIG1zaSBjb250cm9sbGVyIGlu
IHRvcG8/CgpBbmQgcmVnYXJkaW5nIHdoYXQgeW91IHNhaWQsICJ3ZSBkb24ndCB1c3VhbGx5IGFk
ZCBhIGRlZGljYXRlZCAKZGV2aWNldHJlZSBub2RlIiwgZG8geW91IGhhdmUgYW55IGV4YW1wbGUg
SSBjYW4gcmVmZXIgdG8/CgpUaGFua3MsCgpDaGVuCgpbLi4uLi4uXQoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
