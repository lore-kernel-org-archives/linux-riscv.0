Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED1DF9D0D5
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 15:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DVGiA+lIO5Ldrqb1/hKhacOI6lJTNrdlZWfeRVVCAt4=; b=aBz3Gt9ep3IpW2
	5py19uMZnP8gpSRi/AIkRvC7cZ0B6VtQVwfY4w9YPU7YM24azp+dwJBlpLzwTYRfT2uA49HBtA7x+
	S8Af6yYz2NSsqLSu7FPwDTfGm+KGCDXBDErHPQzuynFzv+4faPb09IYGd0U0T/b+AXOT3AUa3UCBc
	Nu/8wquRQUpR6piwX1QwUTLdgL+xXB7oRMIywnmdPK8XkcO5HSGjQ5qM1I4kLH8jTfiBOEUPXldji
	WMtqRipgbfKrD4tNheNMiXdvnossx6VGdyKCLTvAO6qNIPdEnTgOQD253Hhj0SVUH1rRwLHNT97nM
	PgS3PQNQ7fMCnythldBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCfn0-0000000HYAe-0Cef;
	Tue, 14 Apr 2026 15:34:58 +0000
Received: from mail-northcentralusazolkn190130003.outbound.protection.outlook.com ([2a01:111:f403:d111::3] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCfmx-0000000HY9N-1Wt6;
	Tue, 14 Apr 2026 15:34:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZJDyA+l5mT1EfFi6waipwpK2sqB2AZVzNQVJ70XRt7S3xjbON4+7qWfgwDi/08L8gPuDSxneQ8o83s+khqU4irYc93bOvLf/zXfwWcMp/Xfq5coa+igqd9TbyY0rF9qpJliorxIMC23qDET/ja5wQadYKPx3C3y5yV/0IgN8AZU/b1vK+/G31IKB0Jqit1WG1cYTnt0pdU+ZY5MFe/mkz2nUDOf9I5Gm3c7Bh9tQIWCgqaaIuNHJ9Gu8uKH9kLV8oQScTXWyIHbyfdViVQVB53aaRHYrBo9j2pKp4xgzNfZLLAiyPjRzb1sS69XDlHqcEjUeui4lgwmZBFmxvUkpxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tB4b991+0ngkd6tGR/yUAp1V5N1zlqLnmoPuJHD488=;
 b=gLhSRRjEqDclJdPVshussCtWeC7qsIpBmaTU3sYgV1giWyEj1JPG6MVZBCLkD1BMdbrR67+Tz+qyvOcQRJPiH29oONzF07vm5Lw1GwY95JnCAdjmZA0GvViOep4VgeucIkCjXnOoeSzQw/0nRXP2jcRt+zQqdc65dMP1zTxa1TW3K1gQ3Oi7xwi7NuyrC5EPmq1lQjskxD9gJLQMiRq2OPkDXZt7907w8vOoO3L4E3wHDeB4N+9bOmPuuUTkCH2BX1X84TzXUUJJqOr6VdDwoX6GdjrBsZ8UlVf98HP3ro19lxeeErkAOcHSjD9HJCgQgnHpITh7XMrqWhZO/6v+Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tB4b991+0ngkd6tGR/yUAp1V5N1zlqLnmoPuJHD488=;
 b=LhXajarnWqnpzVjpL11EO88N5WqFZmK12rTuLny1mEWv52RJA23LFVnddQFFZUJ7Nc58WkVHPKt/AbpWavHpGD0RfQa6CMCaTP5sAeQPbi+WHTVypekkXA+BPPtBAy+bgxUiME092Vgf+sZTRbLS/aHLiVG8A9pUXQli/iXxNlAZoqhNEMh0BFyKLnxwZkpfJ8Rj43bWqK61enZrM5zzrlmSNRCSDncgWfMdu6PmGGnl1GhxQN1q3YQNA7cOdykxPLAR2mprf7pLFWJsoKLsXP+n5CbMC84A+ybmDQQpdsKTCsnqLQlzs6TuDzts8jHs3Uk/0e8ffcUkjrnXukkS1g==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by CH3PR02MB9987.namprd02.prod.outlook.com (2603:10b6:610:1a5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 15:34:52 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6%6]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 15:34:52 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Naman Jain <namjain@linux.microsoft.com>, "K . Y . Srinivasan"
	<kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu
	<wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Long Li
	<longli@microsoft.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H . Peter
 Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
CC: Marc Zyngier <maz@kernel.org>, Timothy Hayes <timothy.hayes@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, mrigendrachaubey
	<mrigendra.chaubey@gmail.com>, "ssengar@linux.microsoft.com"
	<ssengar@linux.microsoft.com>, "linux-hyperv@vger.kernel.org"
	<linux-hyperv@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: RE: [PATCH 06/11] Drivers: hv: Make sint vector architecture neutral
 in MSHV_VTL
Thread-Topic: [PATCH 06/11] Drivers: hv: Make sint vector architecture neutral
 in MSHV_VTL
Thread-Index: AQHctT5Uo06CdizxUEmOmS2tUYF/frXKhrvAgBKFcICAAEOtMIAAEU2AgAF80pA=
Date: Tue, 14 Apr 2026 15:34:52 +0000
Message-ID: <SN6PR02MB4157331531DA55B2591ED8A0D4252@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20260316121241.910764-1-namjain@linux.microsoft.com>
 <20260316121241.910764-7-namjain@linux.microsoft.com>
 <SN6PR02MB4157521DEF9EA2471B6F3359D450A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <b5125f61-173f-45d0-a6dc-d795ba0f8693@linux.microsoft.com>
 <SN6PR02MB4157DA00A31F0BA8585B9B69D4242@SN6PR02MB4157.namprd02.prod.outlook.com>
 <3264b2e6-f6fb-41b1-97da-22b5249c1839@linux.microsoft.com>
In-Reply-To: <3264b2e6-f6fb-41b1-97da-22b5249c1839@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|CH3PR02MB9987:EE_
x-ms-office365-filtering-correlation-id: 277ac8cd-da33-4b5d-74c1-08de9a3b5f04
x-microsoft-antispam: BCL:0;ARA:14566002|15080799012|8062599012|8060799015|13091999003|19110799012|461199028|31061999003|37011999003|51005399006|440099028|3412199025|26121999003|102099032|40105399003;
x-microsoft-antispam-message-info: =?utf-8?B?b0grRWlyN2liUUFXRm96UThoUEZXUU5FZlVHbGY3V3ZkR25sOFhydDdhUkk0?=
 =?utf-8?B?cnl5WnNwelBrcmROaEY3UTNrWXBQaHFrR3pTRHVTTmR4aklnWm5qbHovbFJv?=
 =?utf-8?B?WXpWQ0lGb3pCOUt0QzZ0cHA2bEdmRkNON0VranBKQzk1VytCWjluTlhWQ3kz?=
 =?utf-8?B?ZTgzSG5iNzJQS1JYVEF4cHJCOU5IOHlEUCtpd0IrNHNoYzduYzFrdXZSWkNj?=
 =?utf-8?B?c2lWdk94ditlSUFmMmVGS01ocWd2WWN2UVZLa3QyRUtSYnNoMXUzcFRjM2M3?=
 =?utf-8?B?dWlldnlGWEk0ZDU3ZmhQbFJKTVdtNlBXcUUrai9FcjVVNVhrVnU4T2FpK1JU?=
 =?utf-8?B?Z1BVcjVBREZhRzIzY3RBNHBpbzFVa3MwTXk4bFU5MktPV0hXdjlOOWVzQ1E5?=
 =?utf-8?B?TGpTMGk2MXBLZkRJWUtPM1hMNUhGSHBNQTQwaUoxb2ZIMVJncU90NHBXT3hp?=
 =?utf-8?B?cmV3T3AvbnJ3eXF5YjcrdmFocFZXUDRCMG4wSjJreGxYVXp2bHNxZ1BKckN3?=
 =?utf-8?B?SFZFbkZxclVreG1VK05NeHo3UWtKZkxkUGRmTlZQcnFWNXVieGNVK3VGR05O?=
 =?utf-8?B?Z1diVUJ3S3Rkdi91Vzdsd3M4WGZNWW44WVc5UExhaThHL0lCYkwvN3liRVNS?=
 =?utf-8?B?VTA5TUxYSkJMY1BiS0FOWVpRR2xEbGtuTTlmSHZ3VEozaStYOEpMVUVyV2Vi?=
 =?utf-8?B?bE92ZXRVM3VQc0NBaGw5SUc2WSs3SkxDNmlyemxJS2R0U2V4S3lndy8zazZM?=
 =?utf-8?B?eldIb3g3Q1I0Yy8wbURibDJYSkdySFdSVHdKb0FjdkRrSmpxRWdUNStrOEFD?=
 =?utf-8?B?TXA0SkpNU1FLbHQ0YTdCNXBwMmxDaWhqbXV4WlMzSHBKdE1MeGF3MW9XLzds?=
 =?utf-8?B?OGpGSjRyMHFWTXBJVFNXUTB3ejVNQVlORlh2V3MxSVVJZnFsVWt5WWRMa3ZB?=
 =?utf-8?B?Mm1wV1Jsd1o1ZXB0RjNHSm55U0ZQY1dCNnd3ek94VjYwUGVSaTd6c3BvREU0?=
 =?utf-8?B?RFZUeGJwL1J0cERQNXdIRDg0dGhXdkRSZ1BkMUhoRnFXOXNTbUFGYmZoZlVI?=
 =?utf-8?B?V1VNN0RSNUNDQklYTUptWnlQbkVJdTZndGQ0TTAweUR0cEx6QWNRMGxObUtu?=
 =?utf-8?B?V2xKZUZQZnU2ZlVZWk9aNXlYSTBzais4emdNZ0YvMlo1V0hHNlo2Wmtia2tq?=
 =?utf-8?B?K3FkWTgxNERmckZBRFlIcktmMXU1b1NyRmJuc0szcG5RN1BGbCtyb3dYZ2U0?=
 =?utf-8?B?eExyUGc0SFdsdmNpL0tuclBIMHpDekVLVnAvTnpCTXpBRnFuWEsrand0YkpZ?=
 =?utf-8?Q?PqshYcwiYOyRSgGUhm3STcwYFQx3gnwbAV?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUhZT3NZY0Vvc1BWRVZ4bjh3dnZXa0c5UGhjNUZ2ZzZEOStzbHk1aDNWQzIr?=
 =?utf-8?B?S29ERWVDVmlWNkJxRFBwKzdveEVTWVA5MmNlai9nZnFlcVh2K29tcVJqY3NV?=
 =?utf-8?B?Y0ZnWlpOWG1nTlVSNHVQTUFjSUxIcDJkV2JHcVNjTlVYUDI3bUxtdGZQZkhl?=
 =?utf-8?B?aUJjaVAwVHhNTkhHRFhjSDIyMWErQmp5dkRNMU9mWGl2TDhwOU5paTlCZmpp?=
 =?utf-8?B?T0s2UXU3Mk4rb3ovS1NERk5hY0pwakkwZFNsbWlYbEVZVnlZNlpPbjJuVG51?=
 =?utf-8?B?eUhpRGpRekpYUGNocm1WWE13LzV2dlRRMk1NK3padkRhbTBzZmVnS3EvVnJ3?=
 =?utf-8?B?K0Voa1k2cVh4ZzBRK2Fzb21ENmh3eXRRWGxNRHhkWHNpUUhtRkN4SGU1c1Zu?=
 =?utf-8?B?VW1Fd2tSektEcEUxWlRCVFpxNTNybFBKMFFZZm1IeXZBRVVCRlVSenUrUzRC?=
 =?utf-8?B?TWxpalVyaVBBblNwOHpaZWdNbEpzQmZ6Mk15cDBWQVRaTzlmcnU0VDEydmp2?=
 =?utf-8?B?a0FZQit3TkMvNlJ3S0VTdy8wRWc0NHViUHI5cU40Qy9zV3FjcDR4VVFwb2ZJ?=
 =?utf-8?B?SVpNSlJhUC9DRW5zUStDeTFrL3dpeFAwN1VzS2IyOFd2ellYRHc1S1RlM3JW?=
 =?utf-8?B?RitmS3VNNGpkU0JhUG9wcDVVczV1ZjVxUlVWa094aVJzQ0NBRThFWmp6Zkk3?=
 =?utf-8?B?SVVYaEtTV05tMDZDUGkyT21qT21hdjRmbnJaRk9KclM5TWovZkVzVE5McWQ0?=
 =?utf-8?B?M0pMb0Y2a0pENmkvTWt1WUp6Q25MdXF5N1hReTEwMms1VEh3NTdQYytqT2t3?=
 =?utf-8?B?dm4vQXdzbmFPT1h0L1pnektHMUdBcUNIWnBBaU5wTVlRVUFKNzJ1OFV3bXVN?=
 =?utf-8?B?MmdjSTYwZzZNQ3J4WHJXK0VaMGdZa21idmlyc2FvaC81SndpTW5ZVTVycXNa?=
 =?utf-8?B?am90Z0V6blQ4a2tiU1pJSFFJM08wcGZSSFpTb0pmcUdaUWNockdzejNvUEta?=
 =?utf-8?B?WkprekpCcllRZFJMQXV5K3QzVkdCa0xXeWIrT3czRXhEVWNtL0dkMzdqdHV0?=
 =?utf-8?B?WFZ2S3ZNRllYa01VRWVtODFCaGI5UUFuSWpqcmltNjdrc2UxNnRwYy9HaXNo?=
 =?utf-8?B?clhvcXJNUHRjQnRrTy9QTm5XRUh3ajV3cHJUaTlvRUlXYy9sQ1FlUFJZOC9h?=
 =?utf-8?B?RmZTWVo3dGZONFFWd1dyMlB6a3FOL0FHa0RQeHhXY25vQUZnM2VFT09GOEk0?=
 =?utf-8?B?NVJWOGxXQ28rM2JQd3Z5ajJUMDR1NjN6MERQbDA0WVQ0dSt3eWJ2emNNUTBR?=
 =?utf-8?B?RnhNYkozeXc0R3N1TGJjNERXUWZuYVc2L2FmLzF0bXAxQ3lPTld1LzNhWjZj?=
 =?utf-8?B?dDhDSWNjaDkxV0tkNWNYdVVkL1J1MzFDR0srTFJHMGpjeFN5eVQ1RU11UWhu?=
 =?utf-8?B?OHRUcnZnQktmZ3llSjIxZkI0Si9wR1V5RWRHbkNsTmxtdVJ5THFpTUJ5VUc2?=
 =?utf-8?B?TVVLT3F5OUZkd0EzV1l5Y2h0M04wVjhINkJ6OXdTcG5jUEJqZjJ2ODIvUVhI?=
 =?utf-8?B?QjdVU08zRjIyZ2NNRGoyTDdzNFNnREUveitXc2pZK3g1aUZNemNhTG1Gb3dV?=
 =?utf-8?B?QXYra2RLcjdIZFF6K0tZeVlrSlE3V3FJcnRYL2k0Q1ZCY1dJL0NVWFlvV0dN?=
 =?utf-8?B?bEVHL004Y2NjOFNhM01WeWxBb1Z5MFJPRnZYZWg5ekg1MkdoZ0pQWTd0cXRQ?=
 =?utf-8?B?SXFHUFVFVkM5OVUzN2Yyai9haWRaSWh5eVI4RkdZWVV4UGhud3BBL3BiMWZj?=
 =?utf-8?Q?BVMuBarF/QDNwal17/FDacvjgtVtwUWaSR1bI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 277ac8cd-da33-4b5d-74c1-08de9a3b5f04
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 15:34:52.0967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR02MB9987
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_083455_413182_11BD8EA1 
X-CRM114-Status: GOOD (  26.16  )
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

From: Naman Jain <namjain@linux.microsoft.com> Sent: Monday, April 13, 2026 9:52 AM
> >>>
> >>> Sashiko AI raised an interesting question about the startup timing --
> >>> whether the vmbus_platform_driver_probe() is guaranteed to have
> >>> set vmbus_interrupt before the VTL functions below run and use it.
> >>> What causes the mshv_vtl.ko module to be loaded, and hence run
> >>> mshv_vtl_init()?
> >>
> >> There is no race condition here. The init ordering guarantees that
> >> vmbus_interrupt is always set before mshv_vtl_synic_enable_regs()
> >> reads it.
> >>
> >> The call chain for setting vmbus_interrupt:
> >>
> >>     subsys_initcall(hv_acpi_init)                          [level 4]
> >>       -> platform_driver_register(&vmbus_platform_driver) and so on.
> >>
> >>
> >> The call chain for reading vmbus_interrupt:
> >>
> >>     module_init(mshv_vtl_init)                             [level 6]
> >>       -> hv_vtl_setup_synic()
> >>         -> cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, ..., mshv_vtl_alloc_context, ...)
> >>           -> mshv_vtl_alloc_context()
> >>             -> mshv_vtl_synic_enable_regs()
> >>               -> sint.vector = vmbus_interrupt
> >>
> >> do_initcalls() processes sections in order 0 through 7, so
> >> hv_acpi_init() (level 4) is guaranteed to complete before
> >> mshv_vtl_init() (level 6) runs.
> >>
> >
> > I think the situation is more complex than what you describe, depending
> > on whether the VMBus driver and/or MSHV_VTL are built as modules vs.
> > being built-in to the kernel image. In include/linux/module.h, see the
> > comment for module_init() and how subsys_initcall() is mapped
> > to module_init() when built as a module.
> >
> > If both are built-in, then what you describe is correct. But if either or
> > both are modules, then the respective init functions (hv_acpi_init
> > and mshv_vtl_init) get called at the time the module is loaded, and
> > not by do_initcalls(). I think hv_vmbus.ko gets loaded when an attempt
> > is first made to access a disk, but I would need to look more closely to
> > be sure. I don't have any understanding of what causes mshv_vtl.ko
> > to be loaded. And what is the ordering if MSHV_VTL is built-in while
> > VMBus is built as a module, or vice versa?
> >
> > Michael
> >
> 
> Based on this, I still feel that this race is not possible.
> 
> hv_vmbus   mshv_vtl
>     y          y  -> different initcall levels, no issues
>     y          m  -> use without initialization is not possible
>     m          y  -> config dependencies take care of this, and mshv_vtl
> is forced to compile as a module in this case.
>     m          m  -> config and symbol dependencies should take care of
> it. mshv_vtl has symbol and config dependencies on hv_vmbus, and it
> won't allow loading mshv_vtl if hv_vmbus module is not loaded.
> 
> Relevant code here: kernel/module/main.c
> 

Makes sense.  I'm convinced!  :-)

Michael
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
