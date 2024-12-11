Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E52AE7717D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 09:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nk8rJK1/W6j8IZN+ZIvZJCfbU6eJT7pCZEbzehPejCM=; b=KeMcMugEyhLxWF50WF1oKn0/pO
	Oj6Lin4wbMthn/Fng58TuWWXHzx6NuMRIqapgadHbL9QC/rio0klUlB9b7aQG86MzaLwZNr1fGe9G
	gEHHrYqlh6pZN9nf7RTyX7zAWdZPxC7vJgmDl3YeIBDbUO0H1TiEbyOvTbsH76bZ7WbXiKEoav2xZ
	w88RLLzVeMfaY/qnzNK/eWnIi94Jtgk4cYlHqhuXrMG24rE1wvBQIKe6KzZr3eauYtQYInluk5x4T
	dnq06Z4loipQV4SU/nKoFOZp2Nbrjf7s9ffzQRFihRVk8B968sCpRrei6ndCwyccvPAILHlst9f3V
	Y/GGiJuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIiY-0000000ELqp-2Jqj;
	Wed, 11 Dec 2024 09:09:14 +0000
Received: from mail-southindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d408::] helo=MA0PR01CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIiB-0000000ELjK-1Zsq
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 09:08:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGeeFLacyy4TEXE28LL7Z4d9ZjsW9ETy0qJ+du783SBjdDy/C9RK4fpHIScTQXVp2y2mP7am6Wx2/wz1OBrjjTJsdU3B6FYPnfP6Ztn9E3NZlUW7JSOS/Qe46GaOlHAmthW1D+0CVqC+EGyUK5tqXKSuDAdaG9DHiQgwLi3arLQhmvz3jnzpBPaA8j3iO4nQUu48y/BJ/fJt6fd6r7Ky/d5vXZkdSJk9MxaWAMJiwaqR6Hpl/J8gSN8HWo8U1YOb+JCThiQCgAMJ9Rz1CO/wkhs8r36IChm1qCOf4Qbp79dsZB4mvaQ3J3qVp7cN6oDVqpCGCNg4AM9+ixuEvoVrCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QdaHx2cOfQ4dHjFbFh68el/bSWfI+0WK7mLc/NXSXw8=;
 b=ueTmmkr2CEuM0JU5TM662nvmJ/FhLeN+kvm8hOdTQRl25P6Un7nOcX7lo338dTdv9jsucxKKLglKY1ts1VH1qpCwNk8qkNndfO3TFjWzY5a47YHEp148YZicoBY+9NVq7c0rz5QkvBqvkTI0Zhd4CRz3ABzCKOj8rwYHypzHs5DvLURt9NtpJuMxJi5VgAD3vbc4bL/e8SGHAACPEwvPyJlVhvY5+1Uo4R5j3QX2q/tlHa7k2WFYuhiAJ8vV2fjQFrdQjQmcq0+DF8ho+GB2mXhNMgjg9Qooj/EPRiSyTkqk3B6soiz62Y4lKvT6FKddxAMd2pgJOIdz6Gb81veI4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdaHx2cOfQ4dHjFbFh68el/bSWfI+0WK7mLc/NXSXw8=;
 b=f5b7fILZCGbadf8Wwp0RtxHSo8SpsQrBZOVKPkQX7NvfAmHKJERV938ZUc0KXDDGSq2/TkMqlfmBfpRGOMUv0c/dK8F0ae5iRQgnPZA7Kz2eoZ/CG0zDZekidIL8SS0slY7/pNIq9A5UthptjDj1LJ9BSQkwkpTgpogeAf+0NlrpWLBb2X/Ca1J2LhnRy47xkm4whzi4POBsw1xN0CeGSvSKUkNukn3UFFqXldW5TnI9ik6IPsJd2jThmkg6O3lZ9NfstHA+inUF3kXY1NynKRp1RvdLkfjmFq2XfcXnVVGgMMB+0dd0csjZ3IOV417h/KbeHdGD80IMS2TgSKnbZw==
Received: from BM1PR01MB4515.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b01:13::10)
 by MA0PR01MB6106.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:7a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 09:08:41 +0000
Received: from BM1PR01MB4515.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d3b0:ebc1:c2d0:d13a]) by BM1PR01MB4515.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d3b0:ebc1:c2d0:d13a%6]) with mapi id 15.20.8207.010; Wed, 11 Dec 2024
 09:08:41 +0000
Message-ID: <BM1PR01MB45151FFF3F4D5B3B5BBD1E22FE3E2@BM1PR01MB4515.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 11 Dec 2024 17:08:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: interrupt-controller: Add Sophgo
 SG2042 MSI
To: Krzysztof Kozlowski <krzk@kernel.org>, Chen Wang <unicornxw@gmail.com>
Cc: u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, arnd@arndb.de,
 conor+dt@kernel.org, guoren@kernel.org, inochiama@outlook.com,
 krzk+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 robh@kernel.org, tglx@linutronix.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
References: <cover.1733726057.git.unicorn_wang@outlook.com>
 <8f857ba0d281010ddfb53d12b3dd66733ee6a810.1733726057.git.unicorn_wang@outlook.com>
 <ww2npib4iyivjqp4l4rdilry2iz2svtidue34v4bebkfmuzpnv@o6ujlbilrtw6>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <ww2npib4iyivjqp4l4rdilry2iz2svtidue34v4bebkfmuzpnv@o6ujlbilrtw6>
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To BM1PR01MB4515.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b01:13::10)
X-Microsoft-Original-Message-ID: <746bcb44-b6f8-486a-a5a7-ec830bc5f3f3@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BM1PR01MB4515:EE_|MA0PR01MB6106:EE_
X-MS-Office365-Filtering-Correlation-Id: 96fbcb01-c182-41e2-4598-08dd19c3680c
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|6090799003|461199028|19110799003|8060799006|7092599003|15080799006|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STErZkE3VGZvbGZMRFlnNnI4di9Wd3YycC9vRnB0M3RxZmxpaFVCcUxGL285?=
 =?utf-8?B?TjBOeXUwbmJFV0pzdURGRzJKc1hoUjF5MU5MNExaSDZpcTRKbjZmSWR4ZFZ3?=
 =?utf-8?B?QktFSjdnYWcwbCtacUVJKytUUWV2RU00Y20zMnBiQ09vWXlzRDdGWHdlaGk5?=
 =?utf-8?B?STg1Q3Rnb0xadzd3OEVjMUZqN0lldXRlMHYweHlrbVRVWHYxUHk1TU9DeGRN?=
 =?utf-8?B?blk3MGpGM3hkRk5yOU5Hc0dyK203TU0ydWUvNXZzblJMK2dVaCtDTmtpOFBw?=
 =?utf-8?B?d0syZ0o1aWFsVGJrZU5GS0wwbGZGTXpCY3RHY25sVXdhNnU1enY4SCt3Wnc5?=
 =?utf-8?B?VkpEdGoxd1hZZEh1eENjQ3JpV05CMTRPM0FreHB1aU92UTdsWXBjSnQzSEZL?=
 =?utf-8?B?VWV0MkV3Y1JCMndFc0d3TUhzaVNYTEg2emFMemc1dXJsSzlGQVM5YVJWVXJx?=
 =?utf-8?B?WGZXVElNcmFZK1RCTjVDcjJrYXJYcEgrd2VGNUVkOUsvUEZjU21nZlVDcDZm?=
 =?utf-8?B?WDhMc1B4N0JYWUs0WTIvSUFqY3V1bUV3Z0s4cFJZL2Z2WHNJY2xwWlQ0bk9R?=
 =?utf-8?B?dStjRzF4SDBaMUV4bERyemFaR24wcDlyUWJ6NUg1Y2JwbG04SjJ1UmZ6MUhu?=
 =?utf-8?B?Q0FzdnJKQW9yZG9odHNqaDM1d2JMTEVJOW9JT21xNVR0Vk5RbDNvak5GdE1j?=
 =?utf-8?B?ZnpscHcrTWl5dGJMMjA5RmQyYVNvT2VIdHVJa1hhNWFySUl0WWx6TDN2SHRw?=
 =?utf-8?B?U0Y0SzJ2MlVlRU5sM3FjZzNrOVR0S1ZUK2tmWVc4SlR2ZFZwSFhRSjdrY1lL?=
 =?utf-8?B?SlljM3A2MklRSHg5YTRBNTdxQ2hWTldwb0hRMmpUZ2FlVEwxNHFvM2dySFFC?=
 =?utf-8?B?SEtBZmxRaWNaNXBxSTlpNjNOWTVZR1Y0ZGQ4ZE5GRHd6S2RsVXBRNTBuQ2lk?=
 =?utf-8?B?OEJ2d1MrbmIrSGpQd1JvRWJicnhQYkRDUlU1YXNWVTBsRE1KYkllTEJnaVBm?=
 =?utf-8?B?ZlpoNllONDVJcmluaGxMcEYyMnM4V21JeHVGb0ZrbCtwZVNDbUM3ZjltNGNC?=
 =?utf-8?B?c1JWaWt1WDdxSzJuOUprTStrV2praGVDL2s5LzFLTjQrNXc3aUZnUk9SVW8z?=
 =?utf-8?B?dVRWa08ydFJ4cndIb0lPbUY2TGJKMEpUblZOcm94ZW1kMmhnNEpuZXB2MzBL?=
 =?utf-8?B?Wm8wOG5GK2Zna3h2OWYyWkpDcUcxNEoxdEZid2ZPbDZ2WkpwYkxwNDF0cm5D?=
 =?utf-8?B?RmtMY0lDNjkyY0s5bG1kSXBHbmQzcVo3NWN3THhxYnI3czJ2S3J5bi9Xell4?=
 =?utf-8?B?Q1NlWm0vQmVxTFhXTEhkLytPNDhVYm4wWHBUMFloZTNkdlkzWHdTUTZhQzNk?=
 =?utf-8?B?UjVSYlFub3ljbjZUVCtMYXV6QllzRmVwY3FMTjM5a3MydnlGR2hCSmpTdnhG?=
 =?utf-8?Q?I7jvpCCQ?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1dXZ2xLbkdVMHhCbXYzakVOOFpiRjVCenVSUDBiNDdFdE4ySU5KZ2dvUmVM?=
 =?utf-8?B?eWdkRllEV0duaVRxSU1OWjhNeVdPY3V4SkswUHBVMXV6TkpQQXJRZWMrNThF?=
 =?utf-8?B?TDhMTlVtRThWR0RtWisyRlJjeFpKRnVTK3lLMjd0Vm5LVmVjS3l0a2xEVFZC?=
 =?utf-8?B?cytQRkdzYVBwclJXd2Z5SzNZYURFbWEzUUI1N1BGb1U3TlFXWHQ1U3paVGZ3?=
 =?utf-8?B?cUE1QUFORHVFamZDTzRKUmt5Mmg3cVJOTUYzWW9PVGxIMWxWTWlKMFlkTU96?=
 =?utf-8?B?d0JlMUVuUHBpc1d3TEYzMnZrZDV3QzVaUlB1K0M0S2kzV0ZrdGRoN05Vamh5?=
 =?utf-8?B?a1d0K2NIeVhsdnVpdzh5eGNTNnF1VnN6S1dVNFBUNkVwUlpmU3BIdStUcHdU?=
 =?utf-8?B?akxtN1FZTGFVTkY0KzlWWWFTd0NYcEUvSGNBMkNzR3E0YlFJWHVqRE1ZOTFz?=
 =?utf-8?B?ZFJ6elZDY3ZZc3lpUXBwTEFpR0pTalBLS3dmUUx0d1VUR2sxaXY2SExGbFNV?=
 =?utf-8?B?VW9Na3I3WDE0VHlKR0ZKZzBtMHRaam05TnZRVGlGNHBZZlR4L2FiRkVzUW9m?=
 =?utf-8?B?RG1GNmZQVSt4b1pnbVRoL09wVmQ3c0k4Wkx5Q0Y1eXIyZ1RYdHJCY2l2MTM3?=
 =?utf-8?B?SWlidlZXQVV5eGM0SmtlanE4WnNFMis4dzhka3RXaDNnbGRQRmp4RktlMWxX?=
 =?utf-8?B?bzBZaTJJdnJvNHhlMVFnYUVMMndWa1dSSnpsSzJnL1F0OE00UlVDalpTQnRB?=
 =?utf-8?B?TXFwdm9icHNVcncxdmk4UmtHQ2xtUkZYT1RwaGVOaWdGS0xPVVpOVnJIckN2?=
 =?utf-8?B?cTV0NFRZSURjTXNJRlFPNzRFL2Q4RmZLbDVYQ3VEbWxNVTNnWHhTUEl4V0Jh?=
 =?utf-8?B?NHY0K1FmRVB0Y0FhY080cGJGR2dpMzNzeXBpRFdwc2llQVlncUJCMXRUeTc4?=
 =?utf-8?B?ZUN3cXhYZWZyS3hiY2tkWEhnQmEvUUM0dG9JNVNLQks4MjVGVldHR0ZZU0RF?=
 =?utf-8?B?aHkxVGtld29uTEdwQmpzSGxtRlJnVXptMGVHMkdXOE9Tc2thK1o1LzFnME40?=
 =?utf-8?B?K1dmMUt4TDk1Vms2VUxOM0FUNzhnK0NqTmpvNEtCdE94M2YzaFFmRWFqbm9N?=
 =?utf-8?B?OXRYdkZXVzJ1S004d0R3emVVdmI4TWdLbmFRREhTU1l1MnFucWtFNXNTVDVr?=
 =?utf-8?B?SmsvWE0xMm03d0RsM1ZvNXZUUEpGakVsTld4VU4xa3o4TUFOMjgvWEx1UXZW?=
 =?utf-8?B?cUFTU3llWkVnYXUwTHRWc1dkZVhBWEI4SFVzZGVRU2lWMTBJQlJEY3k4RTBN?=
 =?utf-8?B?ZldEejVKUlpvTGQ0eVF1QWJGekpTSzJzdk8zZ0JqVEhRZjFqQXFaWjAvajZy?=
 =?utf-8?B?M2xVVlhiZFFuVFRaZjBFbWo2NEZ2WmgrS0pDZ2h1TVpUY1EwZ2JPdnFNWjdm?=
 =?utf-8?B?ODF1OUMvck1HSlpFOE11VUpUM0s4U3hmQVhZVUlNVERuek5Relo0SG9LUkRB?=
 =?utf-8?B?OVVtSVVwa2hOMkVXUjB0TUREc2RlaXNEU1V3Ly9URVgzZFcrYi9UVnFhTnN1?=
 =?utf-8?B?YzJER0FXZ2hWN0pzTllBc2N2ZzE1VnZjcElwak93MGFKdmhKWG80NHU1eVk3?=
 =?utf-8?B?TzRLNzhsWFgvTDF4VERtY1kvV2o0VnBsa2t5Z2s1YUFVeFhqNUMzcHV3aHpJ?=
 =?utf-8?Q?XzcfoZwVSKZMzBXch0t5?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96fbcb01-c182-41e2-4598-08dd19c3680c
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB4515.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 09:08:41.4469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB6106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_010851_430067_1861098E 
X-CRM114-Status: GOOD (  10.16  )
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


On 2024/12/9 17:28, Krzysztof Kozlowski wrote:
> On Mon, Dec 09, 2024 at 03:11:29PM +0800, Chen Wang wrote:
>> +  msi-controller: true
>> +
>> +  msi-ranges:
>> +    maxItems: 1
>> +
>> +  sophgo,msi-doorbell-addr:
>> +    description:
>> +      u64 value of the MSI doorbell address
>> +    $ref: /schemas/types.yaml#/definitions/uint64
> reg, as asked last time. 'reg' does not mean you need to ioremap it.
Ok, I will fix this in next version.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - msi-controller
>> +  - msi-ranges
>> +  - sophgo,msi-doorbell-addr
>> +
>> +additionalProperties: true
> Nope, this cannot be true. There is no single device binding like that,
> so do not introduce your own conventions.
Got, will fix it.
>
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    msi: msi-controller@30000000 {
> Drop unused label.
Got, thanks.
>
> Best regards,
> Krzysztof
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
