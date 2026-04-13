Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBF5F34C5E
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 15:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tQSjxcYer3DAED7WH/4nbdzTmbcrOql4CEAgVXE0dwM=; b=xK+i5z2B1f8eaR
	Ailve06tEO4K6q2y5xlQc980FSbLmHYkYJpO6O3Epg5257BS5tq2poLKfTGr/5fNO7ZEP5OEV5pca
	Wm5vpny6muHx5ELiUtMTsiTuOMYJkn7lLSgcrQO1sBkwj9zxcRlDX9/Cc/JDoNTEKVZaYJYv4aJEF
	gE5rbQhyntX2LVN7z0XPTdSMr8Tnpn3XUmyHKIJifSnaTlSPCHgGm4TMsm6wEnkp79GpFvp6G1A7y
	tpBRvf04VqTRZFjCpa8xjaBbNve+v9ZccoQubs+hkZh/b/EN2DchNzw5mxh3C6uTsbQ80IfyVZlJN
	R4uQPStHn5ojsjDcHaZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJ4p-0000000Fwxv-2HLA;
	Mon, 13 Apr 2026 15:19:51 +0000
Received: from mail-southcentralusazolkn19012010.outbound.protection.outlook.com ([52.103.14.10] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJ4m-0000000Fwwc-0kK6;
	Mon, 13 Apr 2026 15:19:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdqG5U7qnnO8a5X0IGRqb8umHy0rO7RuJXa84ysjsik9q4zKj5Y/mfkF1qgaOjh1IaIBJRgQAnRTcdDWtJidVyfFKxEirrDfGCIpeeFBMTe+gSeOsRa0DnKkECYINwERrb53ArKuN6SmE3kxR7WMageQZL0r7BHCIWrVt9L2kJcTr47q811cdF3bO0bS6edcDdM4jbyZj6XZedR3rfHavElR74+hiRZrKsLNLE4CGzIoFDbsg4KD3fUvHjQ+fUzAi8MAmWl6fupsvvQE/iwrbcuxSADw2oVBxcBFfkz0ySZ2eMkoI1SgtjFm5KFMIz+OlLa9j3criFbvg+ReS3oLxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRpirEY2yKRuJlLfufoaGq3kMQ3qyc2dQDQhL3MlpoA=;
 b=pGIDTDew+SYPBbM/UfjZvNKYE2+ABWSTXD6l9nA9wPmkGKittEVQT4elG5ONooBRldL+rGvXm2OJLNTQYOaKuaOjdzYpkv77yIVlQB5swrsn0ssoSUBf3GOQWLzMTl+zVgrWeGzcCiqaKaVu2YtiSvIhBaSuVRLltjk9Kv8R4xPYqLlVzYuV58n24WcNVCfzWzD52v6AtQdus4MPMO3uB29YaSL+bZR9yhHv+wkVQnymqQ3BGWntf7Ui9jYXH/iukycdeniGobiBzYqb8fyjmz+iFnv6cc0u8PX5F6+9EqczqLnv2ShIMMKDjrx5uc4BTCDZj4LxRl/8vBwEkNUhIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRpirEY2yKRuJlLfufoaGq3kMQ3qyc2dQDQhL3MlpoA=;
 b=QYn3zUjdQii/tOELUVZfOPvvpz5PCxIAIa0kMbAq78HKEai6qnp3T80bfuWaRnL0UrW/QJAdcnJq8SFyGM9/ae2nqOpL1lbpJfVtCq1Y1xA+ALZJNiFcJK7JY6aK4N+CK28e4Q+qoyIBSLILu54hR3PuNVWrpxdt7M5PbpOpZp8o/tqw6aUYpUDEX38EoQue0XoyqP7FdyFZr+2fjDal4df6bnU417fE4lgi1W1u4EYcTTPqU5IgEnb130KTqth76w+lPmGwXJX3SmQPSNIEvQ+bkgW2berkrL3pLCNbSjtvVeMa0kIcYokMWNzyB3iC/ZfCzM+MwnHL6/ci2qKoow==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by LV2PR02MB11107.namprd02.prod.outlook.com (2603:10b6:408:348::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 15:19:40 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 15:19:40 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Naman Jain <namjain@linux.microsoft.com>, Michael Kelley
	<mhklinux@outlook.com>, "K . Y . Srinivasan" <kys@microsoft.com>, Haiyang
 Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui
	<decui@microsoft.com>, Long Li <longli@microsoft.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, Arnd Bergmann
	<arnd@arndb.de>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>
CC: Marc Zyngier <maz@kernel.org>, Timothy Hayes <timothy.hayes@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, mrigendrachaubey
	<mrigendra.chaubey@gmail.com>, "ssengar@linux.microsoft.com"
	<ssengar@linux.microsoft.com>, "linux-hyperv@vger.kernel.org"
	<linux-hyperv@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: RE: [PATCH 04/11] Drivers: hv: Refactor mshv_vtl for ARM64 support to
 be added
Thread-Topic: [PATCH 04/11] Drivers: hv: Refactor mshv_vtl for ARM64 support
 to be added
Thread-Index: AQHctT5V2BuRVBWyKkCpWfaIbANGJbXKhn/ggBKFRwCAADucwA==
Date: Mon, 13 Apr 2026 15:19:40 +0000
Message-ID: <SN6PR02MB4157BD69EBAA3890F326ABEFD4242@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20260316121241.910764-1-namjain@linux.microsoft.com>
 <20260316121241.910764-5-namjain@linux.microsoft.com>
 <SN6PR02MB41573C4A21BA96A534E5429CD450A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <fe4c0663-4ece-439c-bcb6-cd5780c15ed9@linux.microsoft.com>
In-Reply-To: <fe4c0663-4ece-439c-bcb6-cd5780c15ed9@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|LV2PR02MB11107:EE_
x-ms-office365-filtering-correlation-id: 2134bcb0-63ec-46bd-916d-08de9970156e
x-microsoft-antispam: BCL:0;ARA:14566002|31061999003|37011999003|51005399006|13091999003|461199028|19110799012|8062599012|15080799012|8060799015|41001999006|40105399003|3412199025|440099028|102099032|26121999003|1710799026;
x-microsoft-antispam-message-info: =?utf-8?B?a1dUektkbVdjL3pUR3hxYlludUtyL1NYN3cvNi9qZjFZTGNRSlg1LzBUUDk5?=
 =?utf-8?B?NXpPWldxV1Y1ZzkrR1o5Um1YVXpGUjd1aTVEU2tHc0lhQ2pvM1FsaVRMVkYy?=
 =?utf-8?B?OWRoR1lKMFpCWTI4WVpSSVVnVytLZjZaSTdxUXY0MzRmdWp3T1RZRkpWMVkr?=
 =?utf-8?B?VjRxcjZHTVgvdy9vYjR6dlVGY3ZrZ1lGZ3dsSm90bkNlK2NhZzA5dDFkMzJD?=
 =?utf-8?B?QWNFSzFqV2lNVVdVUlZKVXJ2QW12MElEK2lMZDVvRDYzakV6THk3SCtKQ0ZL?=
 =?utf-8?B?N2RFZGlLb29uMnM0TFl2Q1BaWmVVdnp0L21oODA1NnIzNkE4dE1DM01vWVZi?=
 =?utf-8?B?QkUzTkhicFgxeDJoUWQvL1dtR3JMWUx3cFdiNnJ4Y0xIRW9vNjl0bU1FWkZJ?=
 =?utf-8?B?OG5NZXM1OVdkOU9UZTNJb0ZibXRqSlp0eUFnTmpBSmhjSG1yWGxsMVlyVGZU?=
 =?utf-8?B?OUkwZW9qU0V3NDljMHE4cHJpcnlwdkZ2UnNVTDJ2NmZFYk5KVWVqa3EyeFJq?=
 =?utf-8?B?TVpWYUF5dGsxdmxPcDMwcDlsQWxxUERHRU0zMXpabGd3VXFvcUR6ZG9JaEx0?=
 =?utf-8?B?Tk5YRzNiSkNrVVVmdDZGVXlxN09EOWtJUzlQUnNVOTJNL0JPMU1uVFJ6cDFr?=
 =?utf-8?B?QlVoa0tvSmZId2pYZEl5MkdhOVFrMjRnRFo4aEZPOGhzcW9pYzdGTEwzUzk2?=
 =?utf-8?B?cXBDT2dPUU1tQThLYjI4eEEwQjZSUERHS1h1Z095K0gvdzhqeWs0Q2R5ZHBU?=
 =?utf-8?B?c2VJc0RZaDl5RFhGMmhKVUIxMEtOcFVxMGtSbXE1NEFPSzRNUk5pdkhzTy9Z?=
 =?utf-8?B?YzJzSHhHb2VnczJwTUhmelpHdzZnQVBQY1lqZ2J6ajN2aGlyaUh6UG55WjRx?=
 =?utf-8?B?ZjNhN0dLQzNNNlhtNmxYV25ZK0c4R2dzYWtSeXJUSXBrbHJlR3l3OFNYOVA5?=
 =?utf-8?B?SjVsdUlLRVdBYndxOVlyRldxbjV4bStrZzdySmJlaytPdDBTaThkUFBwNlFU?=
 =?utf-8?B?M0cwYUVkRGJQLy9rMnBXMUZ4eUcvRkRiditqV2xhUC9sbDBzZlNFUWE2M1hQ?=
 =?utf-8?B?WUhMWFNZQ3hlV1lCaElFa2x0bmxzWFdhV0V3Y2pNRWVkaEhwVnBEeFdSVUJa?=
 =?utf-8?B?V3RGY0kyZEhqekM2aXJ0dktjNDBydlJUTzJ6dDhmUklpaUhTb3BpSHpnUHU4?=
 =?utf-8?B?NTFNd2tTTEhiWW5OTVhNME1HRjl1Q3JSTWZ0NmswQmVJL2RNK2JEU3BCb2Mz?=
 =?utf-8?B?MTJCQjRKSmpERkRaZHdZcnhLYms2aVA1aGVzbjZBWmVxeE02ZVlvL29QTml5?=
 =?utf-8?B?MXZFdzlHRDltZXZMMkI0dWZHVkhlRDlNRU1oeVZrM0srbFZkQ2p2b2RYT1h5?=
 =?utf-8?B?WjQ1Q0FWRzZ0SWprdDIwVG0vSnIzakpZUGF3RUcySHVjQmZzS2FJRkFzZ1dF?=
 =?utf-8?Q?/WHs99ca?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?LysyQTJndVRoSnJzb1BNYTZGa0lEWmJhR2k1SjZ4bFpsWkhLTnkwZUN1TVBL?=
 =?utf-8?B?WmJEclVNS3ExV2V0QjdmUWFNaU40UnFiSlNoSlNUM3JKMTZLYmF5S05WS3RY?=
 =?utf-8?B?L3crV0ZUS2FFaFByMG9aQy8zQ3BXNXdYZEJ5L3BvT1pzMXhRaXpGemg3OUpU?=
 =?utf-8?B?K0FWVnh3S2prRkZLbmY5Uk9tTXhlYXEvL3ltMGdJYnJaM1VpcjJVRjNMLytT?=
 =?utf-8?B?YjdWZFdQdXlpZzJzY2llc01yWmpDckQ2SEk2bi82d2crcVJUTlpHOUNKWUtL?=
 =?utf-8?B?YTJrWk1VRGpKSHNMTXZYWHVrS2xhV05aV29VbjFVTjhXMWJnQ2o1cDl3cE8v?=
 =?utf-8?B?K3hFR0w0N1RKdGRQZTYyMXhwMmh5aitqVGlHbDNRWVg0TEs4RHhzOUxiK2gx?=
 =?utf-8?B?dWJLVmp2OFZvZzlMRGlHd1FDWDVvVkJSbExuYjJtd0VUQzBXK3ZVVDdtYmtF?=
 =?utf-8?B?S245akZ0aWpoWkxHNWoyWjc2QlJxZnJwNkJWdFJYSzJFZVdzR0pMM0VXU1Rl?=
 =?utf-8?B?Y0gwZFZieDBqeHE2QVloWWx4UDNlMVVsM04rUjRHclRYMjJpL0ZnQ1FWSm41?=
 =?utf-8?B?ZHAzeSs1WjAySG1UZU5CbTh1c0pLcEI3TTFUZk82Y1l5Z2ZhOXRvVmFZUjly?=
 =?utf-8?B?OXBUNTJlNG82NWVuNHF4TDEray8yVm1raGFPS0lITEptVnRpWndMRkxYajR4?=
 =?utf-8?B?NlNZZzZQNEpScnIrMFVyUCswbnRla0NBelNGRjVNRGhENU5SY0lMMVVLMW15?=
 =?utf-8?B?L2luQ3dEbTJBd3pZbWpCUFZkV2t3Z29kRTc0ZXpxeHdtNVNvMWd1c3JDaEZx?=
 =?utf-8?B?dnUwUG1VQlFYQUFreVVLd3BwYm10eUtFeERBdE44RUJXVmhCQnlWdklUcnN3?=
 =?utf-8?B?SWRHK2NCMG9kem5TL2JicXYxSEZaUisxKzNvQzVtQ0pYTkdOUXVWTlFpQ3Yx?=
 =?utf-8?B?T0s1WVZlZy9jQ1JIYWUzc21jVURQNVVycnhXajhKQlV3ZUk2Mmd2QU1jZ1JB?=
 =?utf-8?B?K2QyS05UOW00Q1lWWktacUhxNmdla3JPazV2K1I2N09YdGNwMHFvYlUwT1dt?=
 =?utf-8?B?Tm8yWHBNTTlja0dmREVUanF4YUxOZHNTUnhFVmNZeFpIdUsyZHRxelFjVmlq?=
 =?utf-8?B?SnltREZaenZBV1ZyN1I5NEJqZUNxYkxtR1hGVUttMnFrV3dFdllxaDBpVTVs?=
 =?utf-8?B?WWhIMStOOFpyN1dYK0F5L3dzU2RKMzhFSzZZV3BaVmx2UGQxYms4OVBZNzBy?=
 =?utf-8?B?TWdxV0x5SnhrTGxFcFZNT2JxbnhkTEJWT2prM20yQXJhVEpCMm1KV1UzRTU0?=
 =?utf-8?B?RjRQY2ZkZ3M1bk5kQURoV2JoZ1E3dnF4YW51dDFoZmh2cVJIVjNrTnZPVTVC?=
 =?utf-8?B?c1FKSEVYbnRHZVNkcytCaWtVcFZQMVFOTldMdlBQMStRYTB4cDJ6bXZCU2ZV?=
 =?utf-8?B?WDF1OGlXWkxxbzYvVnREYVlSa2hha2ZPbCtJeDJmK2RBYm1YeDhxbWNPcW5V?=
 =?utf-8?B?OE5jbXBoWm1EMWlBRDZrODZuT0w3QjBzcGZ2NStsa05SdHVvNDhFVnhvK3c0?=
 =?utf-8?B?cXpqd3FSRWd4bWNSWlFCYUFNanBKNVd5akJaRklZOERySWEzbWdSMUdDYWM0?=
 =?utf-8?B?VlNHSHBrTHRqOWtjYWhyTmRIWlFtaTB6Y1BnZGRaMzdaOEJGY3ZReXUvQm5W?=
 =?utf-8?B?NEFqZ3MrcUphR0lZakZkYms2MVNRU3V3aGxZR1lnaTVSYW9Dck5hSEJyaHFN?=
 =?utf-8?B?WThRWjNSV2QzbzVqR2JYRnliMGZ4bFlXWGNmSWdReXJMWkRsMXdkeXljajRT?=
 =?utf-8?Q?WGSUZ//KMdgAKVAEJ4i+0UQNxeMTMxmar9S7E=3D?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2134bcb0-63ec-46bd-916d-08de9970156e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2026 15:19:40.7540
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR02MB11107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_081948_274740_8F238296 
X-CRM114-Status: GOOD (  18.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Naman Jain <namjain@linux.microsoft.com> Sent: Monday, April 13, 2026 4:46 AM
> 
> On 4/1/2026 10:26 PM, Michael Kelley wrote:
> > From: Naman Jain <namjain@linux.microsoft.com> Sent: Monday, March 16, 2026
> 5:13 AM
> >>
> >> Refactor MSHV_VTL driver to move some of the x86 specific code to arch
> >> specific files, and add corresponding functions for arm64.
> >>
> >> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
> >> Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
> >> ---
> >>   arch/arm64/include/asm/mshyperv.h |  10 +++
> >>   arch/x86/hyperv/hv_vtl.c          |  98 ++++++++++++++++++++++++++++
> >>   arch/x86/include/asm/mshyperv.h   |   1 +
> >>   drivers/hv/mshv_vtl_main.c        | 102 +-----------------------------
> >>   4 files changed, 111 insertions(+), 100 deletions(-)
> >>
> >> diff --git a/arch/arm64/include/asm/mshyperv.h
> >> b/arch/arm64/include/asm/mshyperv.h
> >> index b721d3134ab6..804068e0941b 100644
> >> --- a/arch/arm64/include/asm/mshyperv.h
> >> +++ b/arch/arm64/include/asm/mshyperv.h
> >> @@ -60,6 +60,16 @@ static inline u64 hv_get_non_nested_msr(unsigned int reg)
> >>   				ARM_SMCCC_SMC_64,		\
> >>   				ARM_SMCCC_OWNER_VENDOR_HYP,	\
> >>   				HV_SMCCC_FUNC_NUMBER)
> >> +#ifdef CONFIG_HYPERV_VTL_MODE
> >> +/*
> >> + * Get/Set the register. If the function returns `1`, that must be done via
> >> + * a hypercall. Returning `0` means success.
> >> + */
> >> +static inline int hv_vtl_get_set_reg(struct hv_register_assoc *regs, bool set, u64 shared)
> >> +{
> >> +	return 1;
> >> +}
> >> +#endif
> >>
> >>   #include <asm-generic/mshyperv.h>
> >>
> >> diff --git a/arch/x86/hyperv/hv_vtl.c b/arch/x86/hyperv/hv_vtl.c
> >> index 9b6a9bc4ab76..72a0bb4ae0c7 100644
> >> --- a/arch/x86/hyperv/hv_vtl.c
> >> +++ b/arch/x86/hyperv/hv_vtl.c
> >> @@ -17,6 +17,8 @@
> >>   #include <asm/realmode.h>
> >>   #include <asm/reboot.h>
> >>   #include <asm/smap.h>
> >> +#include <uapi/asm/mtrr.h>
> >> +#include <asm/debugreg.h>
> >>   #include <linux/export.h>
> >>   #include <../kernel/smpboot.h>
> >>   #include "../../kernel/fpu/legacy.h"
> >> @@ -281,3 +283,99 @@ void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0)
> >>   	kernel_fpu_end();
> >>   }
> >>   EXPORT_SYMBOL(mshv_vtl_return_call);
> >> +
> >> +/* Static table mapping register names to their corresponding actions */
> >> +static const struct {
> >> +	enum hv_register_name reg_name;
> >> +	int debug_reg_num;  /* -1 if not a debug register */
> >> +	u32 msr_addr;       /* 0 if not an MSR */
> >> +} reg_table[] = {
> >> +	/* Debug registers */
> >> +	{HV_X64_REGISTER_DR0, 0, 0},
> >> +	{HV_X64_REGISTER_DR1, 1, 0},
> >> +	{HV_X64_REGISTER_DR2, 2, 0},
> >> +	{HV_X64_REGISTER_DR3, 3, 0},
> >> +	{HV_X64_REGISTER_DR6, 6, 0},
> >> +	/* MTRR MSRs */
> >> +	{HV_X64_REGISTER_MSR_MTRR_CAP, -1, MSR_MTRRcap},
> >> +	{HV_X64_REGISTER_MSR_MTRR_DEF_TYPE, -1, MSR_MTRRdefType},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE0, -1, MTRRphysBase_MSR(0)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE1, -1, MTRRphysBase_MSR(1)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE2, -1, MTRRphysBase_MSR(2)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE3, -1, MTRRphysBase_MSR(3)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE4, -1, MTRRphysBase_MSR(4)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE5, -1, MTRRphysBase_MSR(5)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE6, -1, MTRRphysBase_MSR(6)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE7, -1, MTRRphysBase_MSR(7)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE8, -1, MTRRphysBase_MSR(8)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASE9, -1, MTRRphysBase_MSR(9)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASEA, -1, MTRRphysBase_MSR(0xa)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASEB, -1, MTRRphysBase_MSR(0xb)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASEC, -1, MTRRphysBase_MSR(0xc)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASED, -1, MTRRphysBase_MSR(0xd)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASEE, -1, MTRRphysBase_MSR(0xe)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_BASEF, -1, MTRRphysBase_MSR(0xf)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK0, -1, MTRRphysMask_MSR(0)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK1, -1, MTRRphysMask_MSR(1)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK2, -1, MTRRphysMask_MSR(2)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK3, -1, MTRRphysMask_MSR(3)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK4, -1, MTRRphysMask_MSR(4)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK5, -1, MTRRphysMask_MSR(5)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK6, -1, MTRRphysMask_MSR(6)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK7, -1, MTRRphysMask_MSR(7)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK8, -1, MTRRphysMask_MSR(8)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASK9, -1, MTRRphysMask_MSR(9)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASKA, -1, MTRRphysMask_MSR(0xa)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASKB, -1, MTRRphysMask_MSR(0xb)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASKC, -1, MTRRphysMask_MSR(0xc)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASKD, -1, MTRRphysMask_MSR(0xd)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASKE, -1, MTRRphysMask_MSR(0xe)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_PHYS_MASKF, -1, MTRRphysMask_MSR(0xf)},
> >> +	{HV_X64_REGISTER_MSR_MTRR_FIX64K00000, -1, MSR_MTRRfix64K_00000},
> >> +	{HV_X64_REGISTER_MSR_MTRR_FIX16K80000, -1, MSR_MTRRfix16K_80000},
> >> +	{HV_X64_REGISTER_MSR_MTRR_FIX16KA0000, -1, MSR_MTRRfix16K_A0000},
> >> +	{HV_X64_REGISTER_MSR_MTRR_FIX4KC0000, -1, MSR_MTRRfix4K_C0000},
> >> +	{HV_X64_REGISTER_MSR_MTRR_FIX4KC8000, -1, MSR_MTRRfix4K_C8000},
> >> +	{HV_X64_REGISTER_MSR_MTRR_FIX4KD0000, -1, MSR_MTRRfix4K_D0000},
> >> +	{HV_X64_REGISTER_MSR_MTRR_FIX4KD8000, -1, MSR_MTRRfix4K_D8000},
> >> +	{HV_X64_REGISTER_MSR_MTRR_FIX4KE0000, -1, MSR_MTRRfix4K_E0000},
> >> +	{HV_X64_REGISTER_MSR_MTRR_FIX4KE8000, -1, MSR_MTRRfix4K_E8000},
> >> +	{HV_X64_REGISTER_MSR_MTRR_FIX4KF0000, -1, MSR_MTRRfix4K_F0000},
> >> +	{HV_X64_REGISTER_MSR_MTRR_FIX4KF8000, -1, MSR_MTRRfix4K_F8000},
> >> +};
> >> +
> >> +int hv_vtl_get_set_reg(struct hv_register_assoc *regs, bool set, u64 shared)
> >> +{
> >> +	u64 *reg64;
> >> +	enum hv_register_name gpr_name;
> >> +	int i;
> >> +
> >> +	gpr_name = regs->name;
> >> +	reg64 = &regs->value.reg64;
> >> +
> >> +	/* Search for the register in the table */
> >> +	for (i = 0; i < ARRAY_SIZE(reg_table); i++) {
> >> +		if (reg_table[i].reg_name != gpr_name)
> >> +			continue;
> >> +		if (reg_table[i].debug_reg_num != -1) {
> >> +			/* Handle debug registers */
> >> +			if (gpr_name == HV_X64_REGISTER_DR6 && !shared)
> >> +				goto hypercall;
> >> +			if (set)
> >> +				native_set_debugreg(reg_table[i].debug_reg_num, *reg64);
> >> +			else
> >> +				*reg64 = native_get_debugreg(reg_table[i].debug_reg_num);
> >> +		} else {
> >> +			/* Handle MSRs */
> >> +			if (set)
> >> +				wrmsrl(reg_table[i].msr_addr, *reg64);
> >> +			else
> >> +				rdmsrl(reg_table[i].msr_addr, *reg64);
> >> +		}
> >> +		return 0;
> >> +	}
> >> +
> >> +hypercall:
> >> +	return 1;
> >> +}
> >> +EXPORT_SYMBOL(hv_vtl_get_set_reg);
> >> diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
> >> index f64393e853ee..d5355a5b7517 100644
> >> --- a/arch/x86/include/asm/mshyperv.h
> >> +++ b/arch/x86/include/asm/mshyperv.h
> >> @@ -304,6 +304,7 @@ void mshv_vtl_return_call(struct mshv_vtl_cpu_context
> *vtl0);
> >>   void mshv_vtl_return_call_init(u64 vtl_return_offset);
> >>   void mshv_vtl_return_hypercall(void);
> >>   void __mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0);
> >> +int hv_vtl_get_set_reg(struct hv_register_assoc *regs, bool set, u64 shared);
> >
> > Can this move to asm-generic/mshyperv.h?  The function is no longer specific
> > to x86/x64, so one would want to not declare it in the arch/x86 version
> > of mshyperv.h. But maybe moving it to asm-generic/mshyperv.h breaks
> > compilation on arm64 because there's also the static inline stub there.
> 
> This is still arch specific (x86 to be precise). For ARM64, we always
> want to return 1, which is to tell the client to use hypercall as a
> fallback option. Moving this x86 specific implementation (X64 registers,
> MTRR etc) to a common code, would not be right. One thing that could be
> done here was to move the "return 1" stub code from arm64 to asm-generic
> mshyperv.h, but that would not provide much benefit.
> 
> I am currently not planning to make any changes here. If I misunderstood
> your comment, please let me know.
> 

Yes, the implementation of hv_vtl_get_set_reg() is arch-specific. But the
one-line declaration is not. If there was a full implementation on arm64
like with x86, then the declaration could move to asm-generic/mshyperv.h.
But the arm64 side is a "static inline" function, and I'm pretty sure the
above declaration would cause a compiler conflict.  So not making any
changes is appropriate. If the arm64 side should ever change to a full
implementation that isn't static inline, then the one-line declaration
should move to asm-generic/mshyperv.h.

I probably should have omitted my comment entirely as it was just
musing about a situation that doesn't actually exist at the moment. :-(

Michael
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
