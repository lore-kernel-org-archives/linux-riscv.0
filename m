Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EB2C02182
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 13:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pooiCtzyCnzrJoEf4EmdHuTmHjhVBmyuQrxudFtH+qc=; b=wUT271CrpWQjIbHLdRCp4rHvUR
	HNqSdfDhEUhtX4HYIL3sa4EqtFrJeBDZPNJ2wf+/LRnsnnRRkzx2Tg8hUvBhToHd+vIvORgw5EAeV
	DWxhzQTuWi6JdptSXteUaKMMtpy2S4Ml+D4P+6F29O0LGjl/bVm082zce//p6TTIP1D3Ba3upTe3c
	VGymRMZ2IJ23xGP4OLFSdpPWJF+QoxX43w1fN8bulUFr0YerKMWUEqfD95/X42RM2e60dSV1XHmKy
	nF2BKCcwiiS3BM4kAYbH+et5pwvWkvWBm5iGeWMZwq095SjSW9DmMFmB9dflxZlXXAMImMIOJIwXE
	3BPf1JBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tabFQ-0000000ALkQ-1M20;
	Wed, 22 Jan 2025 13:58:24 +0000
Received: from mail-centralindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d409::] helo=PNYPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tabBk-0000000ALAU-0BX5
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jan 2025 13:54:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JWohJEk05KTmx3m5Iu0WaXOVfw1EJLxvKFWsIz4kuABSuzPOOwpmfFTpTf5d63uXsNX1RUhiHKz/Rbrmoki0EgPMMI64qPvaavZDXpHOEF660txHUJ2piqnaQJndxM6fxjTXEwKERU3SX8tezrawoUFIGvyaUxvnC7j7mZcZDPYJ7ktnldyIotSUKtpt4fv0tzidRcRcIvm8S3IhrlBiJU1hTkZAk6MRv+RI3EahDcteDUCjdwvCDwvsd5KdR85hBaUd0cevDfd7KssgjFk8kkMQxjsKH9o9LdHuot74Ra3HOR97YUBXpLHW/Go1xOGXUK16fjkhDEpzGwY7zARz7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Y9TQTYj0zwJnYJ7dI+kc5h5IcmmalPCVSBZPDtiU5A=;
 b=RMZ4EDWTeHWJWgM1d3qIaWXsdf7aWZee0dLlZbqD7PsvFFCnK1jFdE3Z7JSnfFl8YYCv7VNfWnrH46uACKOWX6WzDHrTrw29lKxM+xwUHsRDtpx7YS2IvM5Kz9IQXBcMGZ7kMX9N3BDKWQuTZZYFcRjP/jYTB6xQ6zdrPAfXGDtekosl/dzquzy3jn5yP5xMcW7CDFuZ2AODi5A4RTV/QOx6VDseMkqjKJuPCCX15jb9ch2FEWYPgrc4N2ILE7sPW/t/IEkoGiunwLl56srIh7nNNM/RHCpnkKyeP9MYr6ZkbWuYVokGUI3vqyOzre+E5JIOsqeFljK419SnuOQm/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Y9TQTYj0zwJnYJ7dI+kc5h5IcmmalPCVSBZPDtiU5A=;
 b=uP1I2+O3XPw60vHgaIhaK4EsDiv33mxdOmwNadbK8ZNlio6c/dRt93Cqfi8LSkXP7nxshGjqvkfAkAH4O+QCnLndiv7iPDUJsQEmJ2+XaeETvqIoc7jZWNFJOL3EzoXlIRLYMgFIQ6eVgQxlutsRmbBYAHZkXmP+nbKzOe70JsMQWRUwwnS9YOhG/opLbS7wR0R+PmHd3PLEO3gGbxFhuUqqhOcpBM0WLBW0AIess/c7oGVCqC9A8m+mLIn15j0W/5GqLKSOAGBjigfYPQUKb/zTukIkbTZzPQge/7Z6XdTxLNxxgDuyQ2srAp9ZkWyNXHZZ/zuFqZuVLNIutdVy+A==
Received: from BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:44::15)
 by MAYPR01MB10617.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:152::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 13:54:23 +0000
Received: from BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::954a:952d:8108:b869]) by BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::954a:952d:8108:b869%3]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 13:54:23 +0000
Message-ID: <BM1PR01MB2545B1CE7F4B917E9015F4ABFEE12@BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 22 Jan 2025 21:54:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] irqchip: Add the Sophgo SG2042 MSI interrupt
 controller
To: Inochi Amaoto <inochiama@gmail.com>, Chen Wang <unicornxw@gmail.com>,
 u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, arnd@arndb.de,
 conor+dt@kernel.org, guoren@kernel.org, inochiama@outlook.com,
 krzk+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 robh@kernel.org, tglx@linutronix.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com,
 samuel.holland@sifive.com, christophe.jaillet@wanadoo.fr
References: <cover.1736921549.git.unicorn_wang@outlook.com>
 <b5c2f13aa94f68c3415a1292678e16db33f291cd.1736921549.git.unicorn_wang@outlook.com>
 <6b4n7jbflkaparryguq2kjdg4bpfy4vgpzucd456awbhl362po@zytqbodpm2wc>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <6b4n7jbflkaparryguq2kjdg4bpfy4vgpzucd456awbhl362po@zytqbodpm2wc>
X-ClientProxiedBy: TYAPR01CA0104.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::20) To BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:44::15)
X-Microsoft-Original-Message-ID: <591bbc7a-7ca9-4916-b3a5-a7fded14be22@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BM1PR01MB2545:EE_|MAYPR01MB10617:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f974768-8855-4ff3-b19a-08dd3aec46ce
X-MS-Exchange-SLBlob-MailProps: rYPt1fhvLTXc97ntej+WqDiQNM+UKxVkq+cgCOpkQkTxxp6p2HuVYm1I65FTo4zkjxO7mmH+jbcGdI7U+GvJdD/l62xKSRXR2YTcU3QnMcqcKHAbbKT+DFj7Kl23fjinB/Fbj0Q1+uqKwcg6a5OvYY+uLJGcqj+VkX3Zn63dolUx7NTixZ4M0uHrYvLOvSCzW0i6sNyAv5nliytiKOR+k2rfe8hzJOIAfC2yg5D6grfOWNhVw+rFr0nFZyzCDp1k2snMxDq8JnAlia+Bv0q7KJGPHMHh0lLR7nZEOiD23jQAoW2b/H6rJyJsb6m+0IQCzop1kpGr7kEAmdrxe+ciQ7ER5Zim3rCDqCDG4SHrP9j92e3Z4w7kZ+lil/rebWTLH0Inx9eRfaRrAR92PYUjGWQ1voPMHSDmHbjuHmw311Dpy8ZrHB+3+iDVF7d5E5aTT9zsr68rj06/3A1WH29EaqM9eCe/LrWa22Eo5AQC58dXnjU3MBqX/PnWPt+p6ICyodQTbKfVLRrAric/wUEYyWW5CBdStHRmftQPmmY3ySbNtbzawtVckrDb6GvMsWvGU0slvafMcWYAF62dxODNGfALiTBKCpZS5EgdU1g+XLsLvWUSSJ4tctMmmBsFptEviZIxpcZ85MIo8Rlubzd0A0BJiFe881PXj4i/x1RnFJjtpWCbIuVpZSlQgrl/VLTIZxOK379sPerFgjG78/g+vA==
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799003|7092599003|5072599009|8060799006|461199028|15080799006|6090799003|440099028|3412199025|19111999003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzhMQ2VGdnc0MjF0eEE0eW5XT0NHbnVMMVNVSHoyY2Z4Q2JDVmlOeEJYaWJS?=
 =?utf-8?B?THF6OHBiblU5cHVJWUZIdzBDN3lrUnAzQUgrOXZtZzRrWW5YWDd2eHBJMjU2?=
 =?utf-8?B?SUVodEpmLzZGeXhFZk1aVUxDTXg0d2xQVEtzL0d0WFA2eStCTmxLU0hOYzly?=
 =?utf-8?B?eHc2N3RpYUxCaFp5ekp6Q0pRSTFPTE9ueFBLSW90QTNBMmdrU0xmMjhacXJy?=
 =?utf-8?B?TVphVm51dGFyUDNZY0FTVjNTTmVBWEp1RlQ3aWYzOTlCRlQ5aytFMWtlUnRT?=
 =?utf-8?B?WUt1eSs5NW9FMWNvMlVETVppY2pld2pnWGRIVys2cjM3eU1yUjdjeFlrNEkz?=
 =?utf-8?B?cExRZ1Z1MmxldFRaWStIKzZWOSt3WDdaMmpDNTI5Uks4cmlVaXhUV3pUelZ0?=
 =?utf-8?B?bUJvTW5tS3UwdGdCbytQcTdTNHUvS011ZEdTQk1pNmt4SjlyKzlZUUpZZzZC?=
 =?utf-8?B?eUwrVUFzelBSZmRDaSs0N0FxQ0xQaDJiOTcvUFpndzlLQXFKdlRSeGEyRk0y?=
 =?utf-8?B?YkJtMWVBRnNqbU5Bdm10TWlWR3JpaFpMQUs1K0duaUNtV1ZURUk0cms3TVlh?=
 =?utf-8?B?UW5peWRXZDhYTVRmNm04cytNamNnUzRBYUgyTXFGdUZkZW96b0VDK2tDQ0Nh?=
 =?utf-8?B?Rmxwb3h4QWIwUXZPQkxHK3RERzM0UERUUzdsNTFuTHlWR3RSeXlHdVQwYVNa?=
 =?utf-8?B?cVlZZC8rbTJxYURrMmplMUFwZFlueTk3L2kwcm04TGJ0Q2pibm1rWG5VeWJI?=
 =?utf-8?B?U1RZSm1lZkNPQW13MlJDSjA5QW9DTkhrQi95MG5rblU4UXJqeERCZS9HN3JU?=
 =?utf-8?B?aDNrSlNZcXpoQ05QcmFYRmNZbUZ1eXkyTHB4NnExYW9PNUczczJqRmRUaEFx?=
 =?utf-8?B?R1k1UGQ0a2dZUW5JQy9YNWRlNTB3eDNVRUVibGtlZDVOKzl2TktaVlJUV1RU?=
 =?utf-8?B?VVpCaGcxRFloYktLYmJFZFJlYUpIUnMvdEc1eXQyRkFkZXBzM1dGSHRBU3ZY?=
 =?utf-8?B?dkNDdHJmK0NZNXJyZHo2OGtVSFk3empvOHVWWG10RFBBU0pZenlxalI2d3Jl?=
 =?utf-8?B?dWoyZkFiVFdZWlJwbVQyQnhHQ2dGYXBXRE5iYlh6d2tsQmdBejZUSjNONEhB?=
 =?utf-8?B?VXlLeFQ5Rmh3YWNMcWR2UVZJbTFIMCtxR0UvZTZiQW5RT3VvOHpvcEZLbktx?=
 =?utf-8?B?cnBReFFGTVBGeW1INWtrYitJUGJ6UTRwVEFRbFFvMHNPYzE2SUp3QVhkVGZo?=
 =?utf-8?B?Z2VBVXBueGFOcXdjUm5vNzdZMTdxNUl6MGFXVjk2N3hGd0VJR2Jrd3RQaWxI?=
 =?utf-8?B?T0tpRXI4dU1lRUtXeUtGRVk2TzUyWUlUYVEyMm5VSytJcm9JSzNpK0NOOU9r?=
 =?utf-8?B?dXJOYkZwMVRvMlBtek1USmdCZjVSamVraFNXN1Z4d254NWNjbzBjbUs1bDNl?=
 =?utf-8?B?Z3FyR3pyaHlCNlk3aGhOWFdyd2h0SS9qU2NlZjNOUmo1WDJLajJiblpGUzZN?=
 =?utf-8?Q?2wmSP7bOFkb3yIt1qaFdCG/HoGc?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3NxN2R3Sk41UE5BMjFXWXJ1ZnNtc3NXRjV5Sy9QTk50TENJbElTTitveU91?=
 =?utf-8?B?MWEyREpHZ1JLMGhib0V6TnFTaVh5QjlOY1hRNmZsQ21oR1VtZlhNL0pmcHN1?=
 =?utf-8?B?RUo0ek1DdGQ1anNnMWhnejlTbjlwMG5SWGE1VEc0bUV1NkM5YU5rcmlaa2xq?=
 =?utf-8?B?bThuR2V6aGJ3VStvcXJKenZOcnNOdFVHR1RkN2x5UW1ZZ0hkVTk4YzVrZk9I?=
 =?utf-8?B?NVJINUU1eGpVQjZBdysvOCs2SXBjWGlUNzNzU1lyWFZPa1VsVktKUVIvMTlH?=
 =?utf-8?B?bWxPdjQ5NVE4YTlacW1YRk9JSDF5VjJwVVcrUFJmVnRqUVFVUUpGc1Zhd3JM?=
 =?utf-8?B?Z0xnV3FFUmhVLzhJT1BNVmsxWXIyVE4zSzl4alRMSDRDa1RVaXdub1UwZ3NP?=
 =?utf-8?B?VURLcGJyN3dLS1hCQVdnSVExT3RaeFFuRjNzT2NxMVI4VjV4Y0NOMkN4aUNw?=
 =?utf-8?B?dE1RTWw1eE1wU0NSOEZMRi9nKytkdVJadGxxeHVqNmExOTZuc2hKNHY0VzhL?=
 =?utf-8?B?Nm84Wi85Q3c0cTlzSC83M2RWOHM3ZU84OEl3VkpZOFdpZXBZNm9ZcEs5RHJG?=
 =?utf-8?B?a3BhNHVPSnNLSnFhY2VZUnc3MFp6WjAvVXdVVUNpbUFwY0V6NFBWeHB4b2k1?=
 =?utf-8?B?K0dKYjJYWHNoOElhZlFqUXhUWUZsakFseHVKYUJVRldxdWlzdXNrajdNQ3kx?=
 =?utf-8?B?RkxlUXlNZDBIS29tSFYyYTE2c0pZRnkvdDBKcWhkeW4wb1VMa2c4d1pQRzVP?=
 =?utf-8?B?WEVMbmkzTjZGYjEwajJnejlZb1RYOGRRRG5GcURXaVl1bGRJT1RIdEZKZ0dv?=
 =?utf-8?B?R1dVeTJSVUNSdXM0eCtiVFpHK0l6V3dHa21odmIwdlIwWEgvVWVEczMzdkxV?=
 =?utf-8?B?VnVHWVRMOVMrdk1oYlBVMlRrRmZXMGluOVpTNWJYWjRkNVBESnZTbzVZWWtS?=
 =?utf-8?B?TUJ6Q3E5YmEwSHhTWXZ4eXQ4MzlocENTTzhrNW1KcE1WNUFqNFlwdnRSQXg4?=
 =?utf-8?B?Zll2QlZXR2l6N0tpRExBV0hlV3RSanRaTEhnV3RVRXUrTkJBN09KZEpFOFRH?=
 =?utf-8?B?K1N0RHpuOHgvOWVINVJXaDBBTDIwWlo3YW1YcUZyMnBpaThwY2xiTk9jUDc0?=
 =?utf-8?B?cWpYbmlucGVUekdEd1Q1TUZaRzhha3NMWkVHQ0s2NGR6T2UrOHB5TjhXcE1n?=
 =?utf-8?B?dkUzM3hncGgvNFJMWDFBeGxsVWxEMHVCUmFkeDZvYVRwRVA0UDdHcGl6UjlB?=
 =?utf-8?B?bjlRMlNhYitTT0NWUk5xYnBsdEw5cEpMN09ncURxU1JFSSswUlZWVWhJQXgx?=
 =?utf-8?B?eU5sbld2TVNQMVBCRjBPckpXTHNVUEJoUm9WUHNtTjd2N0piZXh3VGo0c0RL?=
 =?utf-8?B?SUZxYkZYaWM0cDhWc2ZqM1QvRzlkSUN5cU56M05hV1FJSVFNUWJmWkw3Qzlh?=
 =?utf-8?B?VnFnOEdIMDFua0RNa202Mk9xUmdTbHF1SytTdzhaTW1CRUhtMGR2a2dpbk5Y?=
 =?utf-8?B?RERrWThnTkp1WXNBWUw1NUlEWlViVmIxbDNPak5JNkNmeVJzZ3R6a0c3VERr?=
 =?utf-8?B?cDZQeGJ1ZzNlWlFieW5QM2RYdXNtV3dxU044YnJuV1NPblQzcWttWXNZeTZu?=
 =?utf-8?B?TzR6ZHdKVTVjcHN2WXc5dXN0djNkU0JMdnIxVEQzSW1VTkJta0txL1d0NXVu?=
 =?utf-8?B?LzJsd0dOR29XdGVRMXpqcGpiWVFiRWZFKy9wNEpBc0hFTGxza2ZFcGJIaVJK?=
 =?utf-8?Q?rkD2NiuE1Y3O9yT5ZRKsMo8apm48Q/dlBOA66sa?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f974768-8855-4ff3-b19a-08dd3aec46ce
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 13:54:23.3508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYPR01MB10617
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_055436_089630_61906141 
X-CRM114-Status: UNSURE (   9.06  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 2025/1/20 10:43, Inochi Amaoto wrote:
> On Wed, Jan 15, 2025 at 02:33:45PM +0800, Chen Wang wrote:

[......]

>> +#define SG2042_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS |	\
>> +				   MSI_FLAG_USE_DEF_CHIP_OPS)
>> +
>> +#define SG2042_MSI_FLAGS_SUPPORTED MSI_GENERIC_FLAGS_MASK
>> +
> I think it is just OK to set the flag directly in the msi_parent_ops.
This shouldn't be a big problem, maybe it will be convenient for future 
expansion.
>> +static struct msi_parent_ops sg2042_msi_parent_ops = {
>> +	.required_flags		= SG2042_MSI_FLAGS_REQUIRED,
>> +	.supported_flags	= SG2042_MSI_FLAGS_SUPPORTED,
>> +	.bus_select_mask	= MATCH_PCI_MSI,
>> +	.bus_select_token	= DOMAIN_BUS_NEXUS,
>> +	.prefix			= "SG2042-",
>> +	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
>> +};
> This struct should be const.

Yes, will fix this in next version.

Thanks,

Chen

[......]



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
