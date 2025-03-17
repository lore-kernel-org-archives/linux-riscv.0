Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3213DC282EC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 08:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:From:Cc:To:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+rdbReAVza7tdDzMUBAGfu21i7KX460gqDwUfqneFTo=; b=dNhXpbIZpo5MdNC8La5MWpPtX3
	iaE6sba7rS5NRL+GOM4CyZeRr7/eYKp7b5qVCsPOm1XLFm5A3QKItCPr+Ths5w4qMX4mpEReqhvJ1
	6sgPXh6IfJAoUUBxhvx+TofuoHYZSagfcme0UTm12IPTPy92JyLfc95JAVhroAKR3J9YcVDhXQ8Jd
	z4Z4ELZCOgajSPpx4l6BWGViB1LpzoZ4GQDE2DyQKypXgSTuOFCqL+geAeNYIXr0MizvI14NDg5gw
	vuXYN1r/DjqafLCMEZ0kRnQc7kINmbODaEHEyH3RyQV7fws8L24yU/83IQXK/oqhYTC/8BP1cq5hz
	e0VkHG5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu69X-00000001nrW-3oWs;
	Mon, 17 Mar 2025 08:48:55 +0000
Received: from mail-centralindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d409::] helo=PNYPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu64k-00000001mxS-303N
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 08:44:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q85LbWhIXm4/mJCt0jBKt/nU9Xkalzstln61Q4I6k2pEOlzHEccxoTxlwXKsYhBjyIozEHXpMtmx+5ssO8UmG4sC+BxGKyBqXiVS6xYEnGhrznQ/5U7WdszDkreqPH1woJqPIAjSY86UFX0T6bIlQkLEr8U+aliaUOVTviRNNcUk+yVUSgvDB1fErvD8tj1xuOxCI/N8uCHwWBldLhatfAR4TZnJUzhiVQEYGlDyowJ1OxzM4SPUPwJNinCjSmOU+7BfG1ESsKcj9r3P7wYBvw8MeQeoXMWgcONedbCITwrSnM67YpHfHM4Fl15x0sRYAJSeJ4u+sf9Td6yh07VaYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PiPpljwaXvTpI//zi0SFgK9TSa+bMCP//eAc9sB0V60=;
 b=gY5onVc3Fli1kt0cgmKzKtpwPVLPhMsh4Tv+0gBfEvyEDHA5xl12eGJq3GMKIgzldmvR6csI8CwWMkLh8JBZCjdZQwfQtzjRD8UILN3SX8Zzq8ydZceLXWaBxC1D3hAiXdcONdMVBpmRdk6RBPGHyxztWlpekBkBqc6QcN3TAtqprmmwsA62f5iW2AKf7Ao2gTctAjlack3IPIGtH72SdYixk307CTo0zSYtZ5qWvEDVc3Opjm5RD/OLfNkIGrNg/A2c7BQh4MvOkKULxKrTqE8mET4FbiF7qaweHJy9KWFTVbZzo9HDX2od9a/ILf/0yVS1i0v7W+LyLjUl3XMKHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PiPpljwaXvTpI//zi0SFgK9TSa+bMCP//eAc9sB0V60=;
 b=av1nc7eg+bjeX5NUgteKNpBgFpu1wy0lfVbOkzYrgtiuPT/hgMAyPWbpWw+4XmvZQa/YK/n5ZtDYY1JoMR8BIGW4IEr36xVda0tqeOmcg6LlGwBcMEcnefhcZLLFvGq9xFlfH+notN0LMVr4yI7GrJdwRXOUvlOGquja4dIrGfx3CwKbmlYYGppzOEx5CTMVzcIIOtPjqvYlcD21rAL6Ls7kjmsUXQ84tupcBPqapovfuO7tAl2q0oUDTY/YnXyWTLg9t2qVGVkO+WN7xkSKYKdh/jgkbweK2/sUmPiIIr3HGFt+wy+c9S7q6AiKKjhv3MvsYfEU/wEz5wBa2BYQoA==
Received: from PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1eb::14) by PN3PR01MB7838.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 08:43:32 +0000
Received: from PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::1b4f:5587:7637:c5a5]) by PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::1b4f:5587:7637:c5a5%3]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 08:43:32 +0000
Message-ID: <PN0PR01MB10393CEC71B623E0A779E7393FEDF2@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 17 Mar 2025 16:43:28 +0800
User-Agent: Mozilla Thunderbird
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, Chao Wei <chao.wei@sophgo.com>,
 sophgo@lists.linux.dev, linux-riscv <linux-riscv@lists.infradead.org>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v6.15
X-ClientProxiedBy: SI2PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:4:197::12) To PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1eb::14)
X-Microsoft-Original-Message-ID: <9241aa49-822c-48b7-8cc4-bd83cdfc0987@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0PR01MB10393:EE_|PN3PR01MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: 002fe684-648a-49ce-670d-08dd652fcc1e
X-Microsoft-Antispam: BCL:0;ARA:14566002|7092599003|15080799006|461199028|6090799003|5062599005|19110799003|8060799006|5072599009|10035399004|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWNyZ1lrbGFWNXk0V1pMMU9BK2k3VkRGMXVlSkw2VndmR0t5T0ZhWndwVnUx?=
 =?utf-8?B?dWc3Q2ttS2NnTk5KVFczY1MvTG1KcklCbCtIUS9pU01tMG5Fa3RZejZZeW9u?=
 =?utf-8?B?NzZuNDZDZHBKNnNIQjhzdXlBc2VsWVRRblJSc0xkaUd2VGNEVDEwalZEVThm?=
 =?utf-8?B?Z3RiMFRQZjBKbjhFZlhCd2dyUnMzazVEcjBjaGRHTGtFYkZnTzdKaGFoaVZL?=
 =?utf-8?B?d2xtSm5zZkxHdTh0eC9ueVlOdVlzU0xkaGlnNk95eU12OXpvWG9CT0JJTW1F?=
 =?utf-8?B?dlZ2SzJFZm1zSW1xOGFzS1pVQjBCOUVHZFdUbnBNc0dNNVVYZWxXamEvSVoy?=
 =?utf-8?B?M0d4VXozTWVMSEFldWFIeGJHY2Z6dVBUY0FzMVRnbVlicTRuTzhQdXRjUTJL?=
 =?utf-8?B?dS95YVlzRzdTNmlSZGF1WGFaaktjWnI1eHM1VGhpVmR3WDRoV0d3Z3dIZ2pn?=
 =?utf-8?B?MmIwRGtSWnE1bzJkak1kYTJnczIrVWRRbDBjZWR4WTZGakVBYmdJQmJMSVBs?=
 =?utf-8?B?TUV6dW9iQVZIWjEyaXBVMllicHdIai9xR041NlQ2UUlXRUJPVlhaMTA3N0hp?=
 =?utf-8?B?U1VraVVwak1aQS9SVzE4U3ZDU0lVd0pMV2c4SDVLbElkQnBvR1ZRZzBvNGwz?=
 =?utf-8?B?T2ZhSnhST1hDaFdkTjJnM3huUEJ1cUxTcGovWkxqSXBiVnp3bnN3LzF1dVA5?=
 =?utf-8?B?T3k3QXUrdG9LVjFudjNtcDl1bEVIeUFUUkRMeCtGbGhCblg5Z0E1MnlYTlph?=
 =?utf-8?B?a3J6Qmx4b0hVdmlDY3NxT3NkK3ZzRTFqRVJHdjhIZENsY05rQ051d3N0RGo1?=
 =?utf-8?B?THZUeERmRHYydzB2RGtxdWt5Z2lTeEV3aXp3dFZKOStTZkQzUE5rekJSekcx?=
 =?utf-8?B?ZW1kQjZtZGIrY3gyRUdUR0hscU1tSG50RzhPMFJlRmhxd3cxOXVoZjQrR2Iy?=
 =?utf-8?B?S3pib0FGRUtIczArd1pyZks2NHJUWnEveXdUY1MxQmZhVmlXb0hmS3l4K0Fq?=
 =?utf-8?B?MFVHVnZVRnM0VFJ1YmZzbk1jNmhqelR1L0k1aVdVZ1NjenowR0IwR3hRLzlo?=
 =?utf-8?B?ckozQlpTOTlUVGRaSWxwZkFBNE9ETW4vRGlkcTBtSnA1VGc5Y2J4bnNTTFNS?=
 =?utf-8?B?eFk3MVZOTHBvNHk5WW9ndFQ3MTRqZW5KZmpiTXdWa0tadW9FZXIzb20vU1Bz?=
 =?utf-8?B?L0FDOVlXVWw0Q3FCMHgvdzdiWXUydjh5Zk5UQ0dzTzlIbTEvVlhEbEFhSklr?=
 =?utf-8?B?SFZUWXNxQmxQa3hZNk5ubC9Ob1FyR3RudjNJZy91aFFQUGYzcHZESnI5aFUw?=
 =?utf-8?B?dzFtc2g1RnJlQTV2cjJndWp1QXpwc1BaRUVRcHNHOWc3WU5zcEUvbWxHYm9T?=
 =?utf-8?B?MERGSGhGVjduZFJYT0cwb0FLYTl1K2tvU1hPdWswWEp2NHFlYjhrYk51ZXh6?=
 =?utf-8?B?cG8vWElZNU14cUpoOEpid3pEYldoa1FBVHNkbFFITFBtSWNhRCtTSzdMRGpB?=
 =?utf-8?B?TTdRWG8wNHVFQlRkb3VhbzJyU1E5ekpUcm5sTncxQzJSZ1V0Q29VR0VVOS83?=
 =?utf-8?B?SjFmRlFjSTZ2Y29HVEtuUWlpRFNLMFgyU0VHMEVaaGduVHBoakhaRjFzbE8y?=
 =?utf-8?B?Q2F5ME5OSjlQY0dnaWxjejRpL3g5TFNBYnRHNnhzWGVtbkc5czIycW9Wd1Bq?=
 =?utf-8?B?QlZmZjBZZlk1NnQwR0Q5ZlFrN0NYdysvVUYvSEFGZmIySG1BeWdUeC9RPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZU9OOVZ0N0gvK0NuMlE0VGxFcmo4alNJKzRIODlYNWc5UnFJUjV6YWlNcXlz?=
 =?utf-8?B?UmhXRHBkQmo2eWF0SUh6K0NSbHIxbjRJbDRtUzdldlBwODQ2S2JGb0NUbzhO?=
 =?utf-8?B?TzhkWU9QYVF5cXVINUtwNUlKVldETGR1dmhoQ3ZJa2tmZlNZeklQakpkL0NH?=
 =?utf-8?B?ZVVkOUZsWmhJZEtheFR0UVI2RlFVSEhzN0hYaXVuNGlxaTM1S2pSbnl4SG4x?=
 =?utf-8?B?WW00MmsyMlNxUytGSnlTNFkzaVRtU2xrb01VM1gxVkIzaHBmQndRUWhyTXJW?=
 =?utf-8?B?OUZGRHN5dXBNemM3NUc3dTRlUU1FbGdjQmlUSVF0b2ZCQUxvcVhMbTBJZ1dt?=
 =?utf-8?B?TXQvcnFjbU5mNWx1b3dMVDFieHdqT0xpK2REYzBOVEUxcHViMXl1NXFmVkZ2?=
 =?utf-8?B?SEkyVll2TnlrejZNNlpsajlpMGRHUGM0cktETXpnNGhCUDBPNTJEVFFVYnBC?=
 =?utf-8?B?UlRic211di85dDVNVWN4ZWxINTI2cURwMHBHdWtPeDJNcjhVaXpTNHpqWEpG?=
 =?utf-8?B?YUNnMkZXSzQzbkxkc2hzQUNrZHh5TUM2SGdCTjVWNmkxbm1UTWxrZXZoRnJp?=
 =?utf-8?B?c3RibWRvcVErSUpwemhDTVNYTFU3Uk94cmYzbWVMS2h0Y0R5c2xYSzRNQ0N3?=
 =?utf-8?B?cHdqUC9KVVlrNnd6OWJ3cTF1NFUvYUpMVmZMSFc0TDZHV1E4cDI2b2ZNQmd3?=
 =?utf-8?B?eitxbjZ1cFRnclA4cW1nbFpCL252UDNSNm94VlFIbFdKSmVXbWpDQUlndXh1?=
 =?utf-8?B?dWphSnNVaXBJalA0ME9xQW1oNHBhRVc5TEhwRjY5bHZ0TjBQUW5USDVDUWNk?=
 =?utf-8?B?Tm42dE5xRHpxaEhKaEVvZ2U1QktiOFRVWW5CbEVwTnVmbnlRdFh2bzJudUpN?=
 =?utf-8?B?ZXFPblJpak1oS1pnV29JTlpzSEkrbFlrS2xvbEpwd2x4SlM3aVA3WXZyV2Fn?=
 =?utf-8?B?ejZDcTRRS3ArUm84VEc4RHdpQllpblN0VXFKYkpXbG15bEFPRTZFM28yaTla?=
 =?utf-8?B?UjdSRVVhN2h4YkJMMkV3Sitxa1VseXFhU2NNUzBaRW9NTzdoQTVYNWs2OWdG?=
 =?utf-8?B?M0h4dmFyS3cwS1hRWlBYaCtrbGR5RWZKc3NiZEx4TlJpSklOTVRGTjdUcmFC?=
 =?utf-8?B?dlZacVlscmxuN0xDNy9rQ096Z3NJVWV3a1E5bGE5SDQ0R2Z3YUQvTTM0N3VI?=
 =?utf-8?B?RGltSGcvQ0tHQTh4NXRNVWdEUDJqZXdTYWN5NnFKOHlHQ2d6aHlrbm1IcWxs?=
 =?utf-8?B?Vm5ZYjc3aUQ4SktLRk9Na2t6bldab2llMnp1bUVOaEdtTllFWXpqeWdmazRq?=
 =?utf-8?B?RHpyUmtFN1Q5MDZNajBhZTBHVk11WUpEL2l0RmN5Y1pqMWt2M0R6RlA1SUUz?=
 =?utf-8?B?OHZYTEN6cnRZTVVTcUlRcVhUZFdiMmhwcVpaRE92anUwWTJZT1ZVUWw2SDZ1?=
 =?utf-8?B?NFV0UTVIQVcyTkdJRFBacVd5ZHM1OXk2SWFHZFRwcFc2R1lCR2NVRHNhTm1z?=
 =?utf-8?B?Ynd5QnlyT1pIU1k3K2RhMm42UGFjT0ZDUk9xZE8zY2J6ZlFES2tNZmZIZTNX?=
 =?utf-8?B?dkJxQUpVcW5qNXNDRXp3RUhJZmlJMXR3WCtUbW1teUV5NUZ5MkMzajByeWx6?=
 =?utf-8?B?U2lDdjJOUnJaYjJxYytpY1FnYUIrcFNYVGpsRjcrZWk3YWtnZFp6Z1J1T2Zt?=
 =?utf-8?B?c3ptNjd4Q2ZkRVV1K2NvZGJrMDQwZzN5cEorMThtb0ZEcUptdnE2L3k5aU5r?=
 =?utf-8?Q?uD2bOP7ZJsmzSzC6buJHZi7zMTgQgkqCeumt0cg?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 002fe684-648a-49ce-670d-08dd652fcc1e
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 08:43:32.0788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB7838
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_014358_764259_F218210C 
X-CRM114-Status: UNSURE (   4.15  )
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

SGV5IEFybmQsCgpQbGVhc2UgcHVsbCBkdCBjaGFuZ2VzIGZvciBSSVNDLVYvU29waGdvLgoKVGhh
bmtzLAoKQ2hlbgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAyMDE0Yzk1YWZl
Y2VlM2U3NmNhNGE1Njk1NmE5MzZlMjMyODNmMDViOgoKIMKgIExpbnV4IDYuMTQtcmMxICgyMDI1
LTAyLTAyIDE1OjM5OjI2IC0wODAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRv
cnkgYXQ6CgogwqAgaHR0cHM6Ly9naXRodWIuY29tL3NvcGhnby9saW51eC5naXQgdGFncy9yaXNj
di1zb3BoZ28tZHQtZm9yLXY2LjE1Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gZjA0
N2E5Mjg1ZjlmM2ZkNWMwZDVhZTUzYWYzNTBiOGI2MTllNDcwYToKCiDCoCByaXNjdjogc29waGdv
OiBkdHM6IGFkZCBjb29saW5nIG1hcHMgZm9yIE1pbGstViBQaW9uZWVyICgyMDI1LTAyLTE4IAox
MDoxMTozNyArMDgwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUklTQy1WIERldmljZXRyZWVzIGZvciB2Ni4xNQoKU29w
aGdvOgpBZGQgcHdtIGNvbnRyb2xsZXIgc3VwcG9ydCBmb3IgU0cyMDQyLgpBZGQgcHdtLWZhbiAm
IGNvb2xpbmcgbWFwcyBmb3IgTWlsay1WIFBpb25lZXIuClVwZGF0ZWQgTUFJTlRBSU5FUlMgaW5m
byBmb3IgU09QSEdPIERFVklDRVRSRUVTIGFuZCBEUklWRVJTLgoKU2lnbmVkLW9mZi1ieTogQ2hl
biBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkNoZW4gV2FuZyAoMyk6
CiDCoMKgwqDCoMKgIHJpc2N2OiBzb3BoZ286IGR0czogYWRkIHB3bSBjb250cm9sbGVyIGZvciBT
RzIwNDIgU29DCiDCoMKgwqDCoMKgIHJpc2N2OiBzb3BoZ286IGR0czogYWRkIHB3bS1mYW4gZm9y
IE1pbGstViBQaW9uZWVyCiDCoMKgwqDCoMKgIHJpc2N2OiBzb3BoZ286IGR0czogYWRkIGNvb2xp
bmcgbWFwcyBmb3IgTWlsay1WIFBpb25lZXIKCklub2NoaSBBbWFvdG8gKDEpOgogwqDCoMKgwqDC
oCBNQUlOVEFJTkVSUzogdXBkYXRlIGluZm8gZm9yIFNPUEhHTyBERVZJQ0VUUkVFUyBhbmQgRFJJ
VkVSUwoKIMKgTUFJTlRBSU5FUlPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDQgKystCiDCoC4u
Li9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLW1pbGt2LXBpb25lZXIuZHRzIHwgMzYgCisr
KysrKysrKysrKysrKysrKysrKysKIMKgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQy
LmR0c2nCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDkgKysrKysrCiDCoDMgZmlsZXMgY2hh
bmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
