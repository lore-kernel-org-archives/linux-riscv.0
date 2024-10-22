Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8DED2C54A
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 12:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57Wkm+MUN60cHQLJBpMcNfr3xAh+nWi9fL2FIW6LeW0=; b=a1fUX0rCzAKnxe80ZzUJr7a8DJ
	r8KUioy0NLNVSFrieFKQW/rmIaK0caMekOfjUD1rh5l9Kk5KzgZ3YOi/Bosn1j+09tNh+n8mHznr7
	X4XTf4vukJHUnn0XfZpS6JDL/fEgcsmk4XiZ3JSxj9gXhuHswXoizpxPI2OBWXIZkQcDid15KtV4Y
	U5MTHqu1zjiRCkbIhkkSNWc+BTK1olp+BARulKdfUPv0yGjdxRi7gc7HbtRBpUnWQOBrvFmnM8ZND
	WpY2jo5J0+2RWfn5PlVCxGMT/+0CxF1LXCyX0VKC2OnQ8SHRJArN0U9eNhL9El+e0E20xUf8yR5JR
	E1NlgA0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3EQA-0000000Ases-3xBc;
	Tue, 22 Oct 2024 12:55:34 +0000
Received: from mail-bmxind01olkn20810.outbound.protection.outlook.com ([2a01:111:f403:281c::810] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3EOj-0000000AsUL-2ht1
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 12:54:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDRwxxXSyFXi4jz6WBwPv7HULd7tgKbR2i0FK3+TO5TcjSmYPjaSC7BD47ZIhgcQYSHbDPyTlW+Wb4HUwNBmYpHpMzLo7URAw55lOuXMpAcSqFGHuD0REuv+dzxJ2BPbGcSyQFI7dTElN++yiqV33CMsTA+Wzq1F+zCwikD6QyAKk5+RScNe9z0kIhRJ7fzsJawr7aTfj74fN5mnwlgC93hq9pMGpPBDGNVPofyYky2nOqR9jGkMCW1iNnEp91mw3CtMVus3ITeAY7twvq3Pdgi5thBNXE64GYpbrny5bCHy9wM3v4QsXBmOuIof/XCp2b4r1DEojWSbdiMNo4M27w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gc9L8jv3AwJ7tzrqeIi5ivlpnHBWG98Bq/HCoyWsuUo=;
 b=JSm1mMF233b4z/sTzDhTdBMWmMOjERDoFlF2wa9oUCFOfjo/2kzpyGazyZqqfHvkieZs6lv5l1RsZ6SnVB1/spz3L4Q0cvZr7xFprC0U5QxS3uRKVSX44JYiCCg16fHe++A/v7sDxM3I8vS5sX57sbUKexHV437rDqNyt/HO9oChrDbc0ZpADFGmKvsq7hy7LhejhCgyLA0fkq9kietuYQqOmoCniy40+3WZT/gvlU6X5tNVZ4KEk2JjbEqi/Boc3yQmt9QiVte6d02diwuyXQPkHKn3RL4LChfO9VbBBdnb/Ohk2fDkSNfKFxCoUJDFb2ilS4tTeYHKnmjFJXLL2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gc9L8jv3AwJ7tzrqeIi5ivlpnHBWG98Bq/HCoyWsuUo=;
 b=oduEVlTUWdyF1Owu7seYy38mto1HAkBXZ4Pe6Pqg8NoHN4U9xGdhuVOhAxgq4e6/jzF1aPKOWD7yRByus3dL0oPIkD7NPqOjH07NLihrFAsz0SPGh6pg7je1BtLM52V9sg/cBp4aRDVyoPPjOgp8/5Wzwi+K4Z3b+RvKq2oi+m+Lso9vZU+hFcP8xxgaXGzgYvXmdmzQIfvglpsqEm5oPlZThLdgFkS/aBmNLZAAUk+VCUosl23W6HziAISRa8Kzi7RmVfuXNxwY7u+o9zJnjuXdKdUyZRt8tiZrwhcWA3v681yxk/+GalCLHkX9diQQ6wQFG23J1JmXDmhrHeJhhA==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by MA0P287MB2056.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 12:53:46 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 12:53:46 +0000
Message-ID: <MA0P287MB2822C080A81F87037F9EE94CFE4C2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 22 Oct 2024 20:53:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] pwm: Add pwm driver for Sophgo SG2042
From: Chen Wang <unicorn_wang@outlook.com>
To: ukleinek@kernel.org, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>
Cc: Chen Wang <unicornxw@gmail.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, inochiama@outlook.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, chunzhi.lin@sophgo.com
References: <cover.1729037302.git.unicorn_wang@outlook.com>
 <MA0P287MB2822808440B26B1C445118BAFE4C2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB2822808440B26B1C445118BAFE4C2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-ClientProxiedBy: SG2PR01CA0120.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::24) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <7ffc4cd2-b40a-4e04-8a07-9e4a25a3eff5@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|MA0P287MB2056:EE_
X-MS-Office365-Filtering-Correlation-Id: fe218854-03c1-4476-70b7-08dcf29890fd
X-MS-Exchange-SLBlob-MailProps: cn60g5V53KMxaZkgzVRd+VbJkjx2XhG+T8aAhG3HU87PCd5VbdVCJBMHaeJi7Rw/EMdJg1AgBz0hVfjJRgyAmSrTlqfc9jMLoZwcDnKQNGNqOapzsT/nyZPKvoaqwuJdxs5x8tC8IqQu18FhrFBc4wppFr6L7e/pAVvSS/ZVh52lvNylWSgiymosMIP/uabaUA9s4ZGI2nwPR9Tvwz31VhLxR1/i5MvUJtSsVHAXoJ+UKdyGn4ifdmrXUzWpVmUvJwUJOolym5lFQXhbwZaxc36+rP1n1ao4xp0SpAEgiSeK3plp957PLHpvWhC5Qak2BW/bzMm2XwW48n+l81LSOO4FEG9WkHToUiWYFVss34NedpgrmQeY124V7KrH3D41/6mBIFVD7Cj/+WAiqNHNsgcRxIweHsEGSODPfu87lDr+RZRDU9eExf8eNMfqwpgoE2IhSL6x3smTAEpHEQDfxoz1/h8Hlw2k/xAlO3uxZFi0N4f+4Ck+njo0QPzJmeKLNBj4buWkrao5coADdRcYgUAQcCt4iixRus8tijaLGO//PaY74lZOp1+zuUxYALyU6jEe4v+TRJ80Fetv1XAPlvkaECHFjOmLlpkls19NAmVN+dN+CU2SK1UPsHHFMK06j2fnP3aAFaL38nnRuEXky5qrWkHhAikotPhyvoinyb4y7lDb3EDVZBzWkJ6DlTByOuY4oY7aismUMsjt76e7rAonDMl+P2Oh8H3mcFPdVl8e6mTP791ip3pP7ntzdUKb8Ezxo3xjF/D7ZERpa5QEsyzO1Wtgrid5BFwifIzsPdDJ0Nq4Lj17YyNmduZGaBm4d6Be9ivaVys70L5m5z3TDZLCdsjlB0Zv8SqLNZ41I20tOwUn75YHww==
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799003|461199028|5072599009|8060799006|6090799003|15080799006|7092599003|10035399004|440099028|3412199025|4302099013|1602099012;
X-Microsoft-Antispam-Message-Info: RTNwG7LaHoCDJMPq0vFB6o3duGR/8q9br1s48AlfyGu7ZmChrobP5UG3wSAUzIdhGeQXkc2mZpH6XFbZ9iydMKDy5KSdaEgLvT0dATsyS4WT4mmsnmY7riMm09nHBM42p7ZDNT82mgwBZTEyX+lfid/bcatRPM53m4PwdK+XL22tgD9gxS4qTnx+z211lS4VJSWN8x8w8yjHvR/pZ520plTbjQyM9mSlUIdvuO5y4E6zxbHugr52mhhWMg3lrUVY6wAngiuhFWmm30uXo6hfAJbO8yoyug7fgO3eu0tca0cU2dqkZkJ0vas2sZk2J3egB5VYv8jzUSJY7K69QuiHaf5eX+bnm1RxtdQq79mCIy4tilhWQIGTVOp3XCid7ckK4xpehy7s13H37KwaHwFlYfp2TDN3aCLChWWBe1jCG+As7CZFcYHZnX1VgyAQZh5QGkujW11E7jkfeU8Or6MQqfaW4zPE4cGc8xAmGJJUWIb9YAWjXzY0hKmHI9xpEG8tOohC8A5niOdrmdyOV4tB93SqSR/RS+fp5cQBKjvgp6xu/hqdECu+4W+0mkWCtFKgzf6zqmabNASpgIAPjKJpOFRw4poKOP9J60Qx77gYzb/DLGY8oIINZdZxQMzdkA93LyrLKl0a2Ol1lt5Z9vouYNlnFUs4IdrRpwLKX2wYKAenJ+E4Ybv14fjeHAM4UAiIulOot1KgRhlHYZleu86oNdC91CPsOnTbkU9S46Yr9rgV8ZCPw48BsreVEFJT5oVepLKO9y8h4VZ1hL/4BO2ZA5sMtiih0+lKwwAIUzOHvVMHdSwsah7yLOf4kCyfmu6W3zkRiM+y4aemiq8g1KDn1O9MKNuxlGHFfwVf2xMOa6MPqSExV7VA34wa54VvwQGobvK3pSZERVPlje97VY8gRxhZmquPx3QhPgwuR2MpRvg=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzlNNmZRaTd0MFFxd05uMjhESkplQ1FsdW5NOCtwSlhoR1Z4aHRnTXlTTllu?=
 =?utf-8?B?SjNBdzZsbGoxY2ZZQXVCN2Jkdm9BQjB6eXpHblI2encrREZncXAyd1dDQzgr?=
 =?utf-8?B?ek1LV3p6UnVzU3pDMDdwYWhpa1FWckFkQUE3Q05nTUtUa1BqL0tIM0NQWHVH?=
 =?utf-8?B?TzRKS3Zkd1UvdzVUVG9CM1Q1RlBTSkkxVVUrWUFKUGo2OWlscFI2Zklkazdw?=
 =?utf-8?B?eURORTdwS29QYUNEWHRIYjg3akRibWNRL3J6c1VZY2dEZ2J1Y2xramxpc3M2?=
 =?utf-8?B?NHBaUStxUkFYY3ZkY2hqMVFDMEE0dU8vS1ZFWHB2VWtnbGN4S1NDcTBvOW9r?=
 =?utf-8?B?Y1NUaUt4MWdId0w3akl2NU0yWmJ0VnB5Zkh6U1oxZU1GUXlaVy9xMDlYM0RU?=
 =?utf-8?B?aTFtY253K2VNOXZTZWxoTGN5REJTK25Mc1ZRQW96M1pGMUorSDEwMU9YQ3J5?=
 =?utf-8?B?aVVUMGx3R2ZiZHp6T0RUMWovejVlbTJ4QUVCQUJoSFl6R3YwR0pvTmhOVGlF?=
 =?utf-8?B?Qm1scitOckgwc2FvVG8rTXFJTzRyb0Q2NUlwZUdVckFsaldRUnpQVWh5cmFO?=
 =?utf-8?B?YTA3cStyTkZRSW1XNXB0d2NnTnBoNjJFbzV0RVZha0hxWjlkNUw1MkFsZGQx?=
 =?utf-8?B?eWJMcDZidzR0TENXWUxOLzA0WDNUL0ZnMFd1SFU1MGcrLzA4cGU2RUgvRXNG?=
 =?utf-8?B?bUZ4SHVSWE03Nld5YjVXbnRNVWEybitmTDJWb01BeHcvdCsyQSs0OFlmS3dS?=
 =?utf-8?B?d1NuajlTaC8vMyt1MGdLcStQdFBPZXIwWmMySUVOWFBIaE54bzI2U0kzSzla?=
 =?utf-8?B?bDR3Wng5SEJSRE1vdnBHU1V0ck5mUVVVcWJxNlFxNHg2dzQwNEJFVHNyVUdD?=
 =?utf-8?B?THJhWkhKYUdUQVZWRFNjNnNNV1RSNzN1bCtSRjlsZzJZWUlnMkRacitRTFlG?=
 =?utf-8?B?c2NOanBWcHBad3paWHErbEl1RDMyVmIxcXhybTZZd2d4bWhJczRMNGxoUi9L?=
 =?utf-8?B?MWtoNDVwK05qa0JKemZXQUhOOUZLOWxNL3NvdnlKMkZTekZENmdHdW16UHly?=
 =?utf-8?B?djcyMUpmS1hzcXJoV3llNzh4QnVjU0txYUYvOGduNU9TNkdxMWw3VCtxTTM1?=
 =?utf-8?B?ZG9DK3NJQVhaV3VLTk5UNUtmM0xUdWprRXhNNm9sR28zejU5Y2pmUDdaSmNy?=
 =?utf-8?B?czFmU1ZJNFJkbEkvVkhCVjJVVjhpdWhCT25VZDk3cm16aVRVY3I4bVdjNFJC?=
 =?utf-8?B?UU1BMkFtZkdNZkJhcUIzUzB2YnJUMUJBMzNzNGxpUXEreUU5RlptZlk0U0hB?=
 =?utf-8?B?TzdNMmlmS3BTTzg5Y3NPRzR1RE9wRUVNK0NkOWtQUXlsUTlVKy9nczUvM0pj?=
 =?utf-8?B?S1U3Zno4YzFQbTV6K0VXU1FKR3BKTDNCVnlMMXJEUDd4WlhTZGZmcmt5Nkts?=
 =?utf-8?B?cUViL2hoMmFVejlKQldlSkhEK080bjBmdnAxMThmdUtWNDQyakVkdXpXcmph?=
 =?utf-8?B?RzdxSkptaWZ3VzI3SFpieWk0c3ZLQ1Nud1IxbVVrWlNYMjVnS3NGOVoyb1Ew?=
 =?utf-8?B?UjF6SlZNNktnTUQzbWQ1OERJdG04YXRJa0VJT3lDWk9pK1llM1VUMGVQaUhm?=
 =?utf-8?B?UmhUc2twSzdVMWF4S0dvYnVVbzg2VlZmNnpTQjdDRExkRXFqSFMwR0xDcE1i?=
 =?utf-8?Q?6EuJvipXbPWae8/LSJDJ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe218854-03c1-4476-70b7-08dcf29890fd
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 12:53:46.4329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB2056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_055405_716101_8875C13A 
X-CRM114-Status: GOOD (  17.41  )
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

QWRkaW5nIGFub3RoZXIgZW1haWwgYWRkcmVzcyBvZiBVd2UuCgpIaSwgVXdlLCBub3Qgc3VyZSBp
ZiA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT5pcyBhbm90aGVyIGVtYWlsYm94IAphZGRl
cnNzIG9mIHlvdXJzPwoKCk9uIDIwMjQvMTAvMjIgODowMCwgQ2hlbiBXYW5nIHdyb3RlOgo+IEhl
bGxvLCBVd2UsCj4KPiBJZiBpdCBsb29rcyBnb29kIHRvIHlvdSwgY2FuIHlvdSBwbGVhc2UgYXBw
bHkgdGhlIGJpbmRpbmcgJiBkcml2ZXIgCj4gcGFydCBvZiB0aGlzIHBhdGNoc2V0IGZvciBuZXh0
IHY2LjEz77yfRm9yIGR0cyBwYXJ0LCBJIHdpbGwgaGFuZGxlIGl0Lgo+Cj4gVGhhbmtzLAo+Cj4g
Q2hlbgo+Cj4gT24gMjAyNC8xMC8xNiA4OjE5LCBDaGVuIFdhbmcgd3JvdGU6Cj4+IEZyb206IENo
ZW4gV2FuZyA8dW5pY29ybl93YW5nQG91dGxvb2suY29tPgo+Pgo+PiBBZGQgZHJpdmVyIGZvciBw
d20gY29udHJvbGxlciBvZiBTb3BoZ28gU0cyMDQyIFNvQy4KPj4KPj4gVGhhbmtzLAo+PiBDaGVu
Cj4+Cj4+IC0tLQo+Pgo+PiBDaGFuZ2VzIGluIHY0Ogo+PiDCoMKgIFRoZSBwYXRjaCBzZXJpZXMg
aXMgYmFzZWQgb24gdjYuMTItcmMxLgo+Pgo+PiDCoMKgIFVwZGF0ZWQgZHJpdmVyIHRvIHNldCBw
cm9wZXJ0eSBhdG9taWMgb2YgcHdtX2NoaXAgdG8gdHJ1ZSBhcyBwZXIgCj4+IHN1Z2dlc3Rpb24K
Pj4gwqDCoCBmcm9tIFNlYW4uCj4+Cj4+IENoYW5nZXMgaW4gdjM6Cj4+IMKgwqAgVGhlIHBhdGNo
IHNlcmllcyBpcyBjYXRjaGVkIHVwIHdpdGggdjYuMTItcmMxLiBZb3UgY2FuIHNpbXBseSAKPj4g
cmV2aWV3IG9yIHRlc3QKPj4gwqDCoCB0aGUgcGF0Y2hlcyBhdCB0aGUgbGluayBbM10uCj4+Cj4+
IMKgwqAgQWRkIHBhdGNoICMzIGZvciBkdHMgcGFydCBjaGFuZ2UuCj4+Cj4+IENoYW5nZXMgaW4g
djI6Cj4+IMKgwqAgVGhlIHBhdGNoIHNlcmllcyBpcyBiYXNlZCBvbiB2Ni4xMS1yYzYuIFlvdSBj
YW4gc2ltcGx5IHJldmlldyBvciAKPj4gdGVzdCB0aGUKPj4gwqDCoCBwYXRjaGVzIGF0IHRoZSBs
aW5rIFsyXS4KPj4KPj4gwqDCoCBGaXhlZCBmb2xsb3dpbmcgaXNzdWVzIGFzIHBlciBjb21tZW50
cyBmcm9tIFlpeHVuIExhbiwgS3J6eXN6dG9mIAo+PiBLb3psb3dza2kKPj4gwqDCoCBhbmQgVXdl
IEtsZWluZS1Lw7ZuaWcsIHRoYW5rcy4KPj4KPj4gwqDCoCAtIFNvbWUgbWlub3IgaXNzdWVzIGlu
IGR0LWJpbmRpbmdzLgo+PiDCoMKgIC0gZHJpdmVyIGlzc3VlcywgdXNlIG1hY3JvcyB3aXRoIG5h
bWUgcHJlZml4IGZvciByZWdpc3RlcnMgYWNjZXNzOyAKPj4gYWRkCj4+IMKgwqDCoMKgIGxpbWl0
YXRpb25zIGNvbW1lbnRzOyBmaXhlZCBwb3RlbnRpYWwgY2FsY3VsYXRpb24gb3ZlcmZsb3cgcHJv
YmxlbTsKPj4gwqDCoMKgwqAgYWRkIC5nZXRfc3RhdGUoKSBjYWxsYmFjayBhbmQgb3RoZXIgbWlz
Y2VsbGFuZW91cyBjb2RlIAo+PiBpbXByb3ZlbWVudHMuCj4+Cj4+IENoYW5nZXMgaW4gdjE6Cj4+
IMKgwqAgVGhlIHBhdGNoIHNlcmllcyBpcyBiYXNlZCBvbiB2Ni4xMS1yYzYuIFlvdSBjYW4gc2lt
cGx5IHJldmlldyBvciAKPj4gdGVzdCB0aGUKPj4gwqDCoCBwYXRjaGVzIGF0IHRoZSBsaW5rIFsx
XS4KPj4KPj4gTGluazogCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L2Nv
dmVyLjE3MjU1MzY4NzAuZ2l0LnVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbS8gCj4+IFsxXQo+PiBM
aW5rOiAKPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvY292ZXIuMTcyNTkz
MTc5Ni5naXQudW5pY29ybl93YW5nQG91dGxvb2suY29tLyAKPj4gWzJdCj4+IExpbms6IAo+PiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9jb3Zlci4xNzI4MzU1OTc0LmdpdC51
bmljb3JuX3dhbmdAb3V0bG9vay5jb20vIAo+PiBbM10KPj4gLS0tCj4+Cj4+IENoZW4gV2FuZyAo
Myk6Cj4+IMKgwqAgZHQtYmluZGluZ3M6IHB3bTogc29waGdvOiBhZGQgUFdNIGNvbnRyb2xsZXIg
Zm9yIFNHMjA0Mgo+PiDCoMKgIHB3bTogc29waGdvOiBhZGQgZHJpdmVyIGZvciBTb3BoZ28gU0cy
MDQyIFBXTQo+PiDCoMKgIHJpc2N2OiBzb3BoZ286IGR0czogYWRkIHB3bSBjb250cm9sbGVyIGZv
ciBTRzIwNDIgU29DCj4+Cj4+IMKgIC4uLi9iaW5kaW5ncy9wd20vc29waGdvLHNnMjA0Mi1wd20u
eWFtbMKgwqDCoMKgwqDCoCB8wqAgNTEgKysrKysKPj4gwqAgYXJjaC9yaXNjdi9ib290L2R0cy9z
b3BoZ28vc2cyMDQyLmR0c2nCoMKgwqDCoMKgwqDCoCB8wqDCoCA4ICsKPj4gwqAgZHJpdmVycy9w
d20vS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgIDEwICsKPj4gwqAgZHJpdmVycy9wd20vTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKPj4gwqAgZHJpdmVy
cy9wd20vcHdtLXNvcGhnby1zZzIwNDIuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAx
ODEgKysrKysrKysrKysrKysrKysrCj4+IMKgIDUgZmlsZXMgY2hhbmdlZCwgMjUxIGluc2VydGlv
bnMoKykKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IAo+PiBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcHdtL3NvcGhnbyxzZzIwNDItcHdtLnlhbWwKPj4gwqAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvcHdtL3B3bS1zb3BoZ28tc2cyMDQyLmMKPj4KPj4KPj4gYmFzZS1jb21t
aXQ6IDk4NTJkODVlYzlkNDkyZWJlZjU2ZGM1ZjIyOTQxNmM5MjU3NThlZGMKPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
