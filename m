Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973C7C5AD49
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 13:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZPK+1u+Ay+Ul9LFLA+JYLDaN/eEwNui2m7NM7lC5U1o=; b=3bhVF7o+rckMBc
	A9QKaZpOEo1U90B+h83x30fn7Np+h9vuINQekEyQScfKMo8tyjKf7HovT9sj1JMFYMVaySDvwVmYv
	WL8eYyH4o6XQhzogPW6jZwBEmq52aav2f65NXfb8DBMN0DPHI4OpoGPM8yszC2QIxRTmKQIjH0xhv
	SRXrzyxVyoT49ZCkgix1tRdtx7SVa5y7joYuC4akyumq0G2N6omyCrewAbhyDM6Qww5QzIJRee8ij
	I3xk8+xqM+LHELSaVvHSKjQ1FCxRRtI+cb4RWI9HqZbWLo3a7fmtepyyCwjJfu79QeRvHf60ECfmQ
	vJufSMqh/+CHahmFnKMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNXKu-00000000MEH-2yIP;
	Fri, 06 Jun 2025 13:42:20 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNXKr-00000000MDm-1yQw
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 13:42:19 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565NO5N012746;
	Fri, 6 Jun 2025 13:41:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=ApA3niORv5NqgA+qW1GewKpafM0Rklu9TT0TjWoXWbU=; b=
	gdM9hmqLBoB6IoEiGCKrf5BwrHc/yEdOZtEdVSJ6Nvs8msIWUuyTRKLRHwy59V5U
	FMyFdaAvgbPgffdIJykAHgT3x4q3bJOsQBoVRH5VNtN27IL1SaWy636sBVXNLC4J
	YEquyqsGZMCgkMocDq+n07rMZda13BsyjpxsK9cMBgqYwbADFGEYm+Ycxd8XKRYf
	7SmyNOjUVfySLfQKPUI742NfUGDDIyVEkLvNf4TyAiw1AZZgfXeRszBG6v7J5mE+
	YUpPiMu/7eK7OtKaQeWlWExlv22nZvDT/YGRX5kFhrsn2X5sL07f8l21sf4ZjVY8
	MMRwXAc7AxRV+gKvK6EaDA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8j82rw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 13:41:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 556C8XHH033797;
	Fri, 6 Jun 2025 13:41:57 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2083.outbound.protection.outlook.com [40.107.100.83])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7d9qf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 13:41:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JbphUMBQ+3HqvxD2Awb8nW6H8ApNRsZtX7DaXYquRN1pUSVgLQ2j2iCXyAE4Bm++A2DiDXNt9WN9EZi8Oej2LoLPeowNwvs6MHub18fHSD2Y++4jCC4xdMf/biEsOKkrw0IJ1cunn7vsdQAI2GgM72y3aejk8O3Bgli5IxMDOgU4N1pS0IHBO1iHHz5xw9KdYAOS38xvyWx741CzR9KessxMX8anCI82npf+WA/+bJP+JgtR0MfM3nciL4qvHrXO+eZ7prkrK1+14wrU3Kv1qcXuLUffvQs0UJVcXPvV9JEhvZUYuSSESnC/wLAN0YTG8bdcmgkKkCMHlDIgLSd2DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ApA3niORv5NqgA+qW1GewKpafM0Rklu9TT0TjWoXWbU=;
 b=GcOAWTCUxiFql3H///0tkWvUUdQ3CTnB8TlvfIAQkJlAP/NJnszQuaCTxDpNXjama8FPwEcF19GK8sIS9nUB0CelOdKeX2AykCjd1kmniisrDAalxCbPa+s7ohSeAqASsZqUqhi5FeN1Bv2nLU3Od2DlAsIuDzYkbCYVlzdQUmMvdP3kDLDoLmDQsQc38/4y0J8HfgApJSoVp82bUyR5gVAC8clW6XslRprUsf7WpfZACqtgI0I5IJsimSWEe2zlyeb+b41Skr71rr5CAFHNGIhuasHaw7qNksfIr05cmn+jPXIuijseRq9qzblAGoAY2Aov66s/JDXYiRv97SKpvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApA3niORv5NqgA+qW1GewKpafM0Rklu9TT0TjWoXWbU=;
 b=ujZFEKGPekWtOxqJICn624ZONClMwZHocNhJlHl8fLjvE00DJl3hZ461FIVT5OVbch+VTcjR4NsZ8S6f0cChIf12HRIWVuaFRwn5vXIX9kg0Uw87K/yqA3JHZNzmf90P6WHiwbJt0i2TsppilOLnUDkzrchlsmk67LWSdi9B1/A=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB6132.namprd10.prod.outlook.com (2603:10b6:510:1f4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 13:41:53 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.022; Fri, 6 Jun 2025
 13:41:53 +0000
Date: Fri, 6 Jun 2025 14:41:49 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Jann Horn <jannh@google.com>
Cc: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Barry Song <baohua@kernel.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        Jonas Bonn <jonas@southpole.se>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne <shorne@gmail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, loongarch@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v2] mm/pagewalk: split walk_page_range_novma() into
 kernel/user parts
Message-ID: <3664f529-cba0-4e9b-a434-356695c109db@lucifer.local>
References: <20250604141958.111300-1-lorenzo.stoakes@oracle.com>
 <CAG48ez3hvPbfc2dapQQu9TKrjdi5mhZ4tAWi+m0tNZeEtSZBrQ@mail.gmail.com>
 <af6d28d0-d646-45d5-832c-66add20ea388@redhat.com>
 <CAG48ez3-QiaT1hSFz64xiucR4azQsrcj+6rQrLoz+d0zd-BUuQ@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAG48ez3-QiaT1hSFz64xiucR4azQsrcj+6rQrLoz+d0zd-BUuQ@mail.gmail.com>
X-ClientProxiedBy: LO3P123CA0030.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB6132:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cb47e8f-e018-4f5e-efe9-08dda4ffe56a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3hJTFB0RGd0NkUyNnZxSFNHQ0VDSHFuYUR0dklxYklKLzFUYjN5anJuVEtp?=
 =?utf-8?B?TUlSdFJKMTNSQ1JtSzZiWitremV0M3JLbjV3T3ZzRkovYVdiai9PT0djaW8x?=
 =?utf-8?B?bGhyR3I5Z3ZzSGpwQlAzcTZ2S0IyVS9tVzVibnQzemhtWjZaMCtNOTNNODJa?=
 =?utf-8?B?eEV2amtFUXN1UkNLVnE0RnhlQ05TUmF2MjZuTE9LbEJNaFlUeUkrakhDSi9n?=
 =?utf-8?B?LzdoZTNXL1NIdmt1Sm1xTU9Td2IyR203amkwMmhLVnc2b3pvWngxS1gyVGpU?=
 =?utf-8?B?NGFYaGpVcEdpbkd5czlGNDJMcHAwUFpubzgveE96a1MyZ3NMQzhRamlhUmpa?=
 =?utf-8?B?Wk5KaWM1MmdvYWZSYmhRT24raU45SXR4SXVhdnpnRnEwd0QwL3FRRkpmTVB1?=
 =?utf-8?B?NWZ4Unc4ZTVIb2VXWEVxTzA2NHdnWmo0SFdzaUlCeXcrUzVJNnYvOWErNzJx?=
 =?utf-8?B?RXBoQ1BUZEU4aHl4NXhQeUxhMmxGREplUEovQ2ZqbkVnRHNScElNdnd2NHJG?=
 =?utf-8?B?UE91aFdaVjFwMWx0ZWlLU2Y0UDdwM294L2tiODRmaXRnUVJLS0gxWDk0YTc1?=
 =?utf-8?B?Uy9KbVhxRXY1TUZ3OVNORVF4S3hEdWJHeW1NYkZsY0tiamFaOWhGTElmWjZI?=
 =?utf-8?B?eUtXenFSUEZSeHQ5QWtYUFBQNWZVZlNmOFBVYUdUSFV5N2xTVVBmZVJVL1dt?=
 =?utf-8?B?V0ZtMGN3QUovMWVjd1ZKd3hKNTJ0NmUxQ09lYVliakxwdnNNY2YyNk00a2NP?=
 =?utf-8?B?MjQyS2luOXZHUWNKWTlwT213UFNQbERsNlpFZEhzeDlnUk94bTJBQkxMTFJ1?=
 =?utf-8?B?NUhIemJjNmFRNmc0SGFWVGtkYmNhaDVXazJFTFlOb1pzSlRSZ01EZXFwOW9a?=
 =?utf-8?B?aUN2d3puLytVQXNyOElWTFZvV21XQUhsQkU0NTUzRkZ5YWNpZ1FsMUU2RkZo?=
 =?utf-8?B?eCtLTWF6aGF6Wm5iQnB2ZWdWUllZakxnZXVGcHlBUmJCcjAyRjVPMTlaaDBn?=
 =?utf-8?B?N3UyNm5qSEJzeGVXQ0kycFpUR1ZMRnltQXpBeEpEUVhpMkZ0TDdTRmpRMWoz?=
 =?utf-8?B?UThWNngweVdiSVB1Rk5kU3FKRHh5OFAzTEw0dFM4bW44NVBHdlNYUGZkU1Aw?=
 =?utf-8?B?WlZLSDROUHdYS1B0SXVxekdIaFpnbkVFTmJtbmwvaWFpRVFQWElsTHNkNXJ5?=
 =?utf-8?B?V3FKYzl0Slp4dU1PRjNDWkNjcUl3Y2plVCtGUlFzK2tuczY2UVdCMEZNbDhq?=
 =?utf-8?B?NTBSSS8rWkpOeTZXMGx2amhxUDB6My9uQytrdTVBNWNrWlUvUWIxMkEwOGVB?=
 =?utf-8?B?MUFNNnBaaGNyS282bjJhNVJEbnFDR0p5Y3lMeG9BQzhqUUNRVTNNaEhWUWFI?=
 =?utf-8?B?dEJNNTBkNnFDNWlwRFZEV0Jnb0l2QldCUjlxOWRBeUx1b3FNSU5qS2JmTXY5?=
 =?utf-8?B?ZUdUR1BUT3FHN1duMjZMZjZVaVNHRE5yRW9HSmRzSnM3bWtaeERpM2R2TFNs?=
 =?utf-8?B?WFBlZG9EdmVmdWQyc3lJUUxwVHlWeG9SckpnNUcxWWxvdlFINHIrSHFJUzZ6?=
 =?utf-8?B?Z2JVZ0pCUUpTUzVuek16ZVgzODVOYWJlRG04TUpRQWx4SnowTjJvdEJQa2xI?=
 =?utf-8?B?TU11b1l3RWswcE5OR1ZiT051UDRvSjZZMlJ1cVk5allqSE1FVEw3bWIyVmNH?=
 =?utf-8?B?V05kZUtoTjlLR0VuYllyWG5oSUdDbVFINVhpYk1VeU9DcnR5SGh1ZzRaRm1V?=
 =?utf-8?B?UzhxcGUwdnQvSHk4TnNMYWRva1hEbWJwazZTYmFaNDNCdFprYXJ5dzJNZDVa?=
 =?utf-8?B?amtFM0x3OXBKdFFEazZmUWVZekxaR1lpN3IxeHl3MWI3aU0wV0gwVzVkdUJP?=
 =?utf-8?B?UVg2UTVYdThhNXdIR1U5U3JLbncrYXJxVGlWbDFmWGxSc3BpeWdYNEtGc29u?=
 =?utf-8?Q?vxdKMia2PCM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmtoY1JaMVRocDVyQVV0WG5TUWVhVDNobWdBdVJUVTcwbEFiVWlFbmVOczN1?=
 =?utf-8?B?RlFSeSs2ZUNiaytvbXJLZFZ1ejI3SGkwVWprUHJMcGZQVHVqWVFXL3JlM0ts?=
 =?utf-8?B?VXJjaHBtOHdzVU95Y2RTMVZBclErQnF6YlNha0VwSmVSR3Y5am9VQnJIY2g2?=
 =?utf-8?B?Z3BNdXR5VnFVZ0c4dTRlUTFNSzRVeHdMOUxac09ETnBqYmpKd3RIc0xvL1BC?=
 =?utf-8?B?M2xoc2dpSlNIQU1YZG1SdlFGRVpxZ1VHckphTHp5Yi91YkY1L1NwZUl0b2xM?=
 =?utf-8?B?dkltQTd4SkVUMUpHd3lDWmIrNEN5ZmU5Qmg3dW5yOHFDaUhkWkFNYnVpS1Bl?=
 =?utf-8?B?RVp0NEpNV0ZuYVRWSUI1dytvQXgyZTRVRGlvQUVLN244cnlRa2FGK3h4cFph?=
 =?utf-8?B?bEIySTFkclVuaERzUXplUjlzdGNOR1hUbVRYY0FOamRJQXorb1EybVY4K2RT?=
 =?utf-8?B?eHdsSUVoeWtuT1hPczFwY3VvZXhBcWFPRVJ4aXgvdm8yVkJPbXVxQlVzYWUv?=
 =?utf-8?B?N2JsSUdiM1hkRnJRSnNFMzN2OFRlVmhoZ3VsWEJ5bFAyT0RJYnAwdUlZUmIv?=
 =?utf-8?B?UkVQUENFU09BWTVZTDRBREkzODBiVkl6S0oxbzJWeHd1OGlaaUNMQXFyV2V1?=
 =?utf-8?B?TUhPZGptOVY4Q1N2N1kvc2lZRGVQRkkvTWdHblAvcXRpQmxYUlgrZ05odGlh?=
 =?utf-8?B?T2djWFM1SklsRzBuaFk3US95TzYrL0JyS2dRd1VMYkVCSHdOR2cyaDNTMzR2?=
 =?utf-8?B?OVQ0RUt6a0hla0ViVlF4dWM4NllGYTVuQ3ZoQWdIY1pVNzJ5cUtjSlpWbXkz?=
 =?utf-8?B?YVU3OHI3cEgwT3pDSUdOYWZjMzlIcjVYZjJoWXVyUFpoamtDb2JYTzZZOEgv?=
 =?utf-8?B?TVZJRFJMaDdmUkY2dnhweWI0T09SODFKY1FwWThIV2lvRnYrTS9UOWcvMjNx?=
 =?utf-8?B?YTZ2cFJqbTZCNXRoaFlLMlZJOVBCUUliOEs4OG5xYzVBQ1pGQ0tzNmpCK0lU?=
 =?utf-8?B?S05WMzVoQ0xHc0ZxeTh1QUxBY2xNWGt1NmU4eWFJdXJVSXM2Zm9sbWVYVmEw?=
 =?utf-8?B?cWZKYnQ4NFNHNXFyYUtoeFAxSjI2MkxvWXBjcXB5N1ptaDlEdEYzbmJlaHho?=
 =?utf-8?B?b2JwL3c5TDgxdVptbGxPRGpTWC8rdVpadTdFTnRBM3c2UFRsUkFBNDdvaStM?=
 =?utf-8?B?NWxaeTNJQ2hJMXZkUXhvNy94ZXFhRDdRRkVDSDFnMkZCZEZ6cWt0T08wRHJw?=
 =?utf-8?B?NWt6V1VUR2tFaGI2ZHdMQit6Y0Q3WjBIam1tR29Ja1hWR1ppZHJrTHpza2pM?=
 =?utf-8?B?OXpPdXFQZTJ3TGdnMkdHeEtuV2dENzgvTG04b2RDNUh0UzRac05sd0R4L255?=
 =?utf-8?B?TzA5cDlmTTRTMVljVjBTd3NTT25HeXVmaTl0MW5zZ0RDU2FWcVB1ZkQwbXlM?=
 =?utf-8?B?SlNNdloxTERQVUg5RnpUdDMrUnJXdXdqL2ljdU12UkIxWS9tRmpmcTdnWWZP?=
 =?utf-8?B?MmsvTWtsTHlsMjk3Zi81QVloNHZuZEpyZzlDdUIxRTZpb2hLZ0Nmb0IxNFRX?=
 =?utf-8?B?TTNkUUtJQjRLaTF5azBxa3NpRXl5TmRqQ056Vnh4U3grTDJybkVmZU5wVVNk?=
 =?utf-8?B?dEc5azdnbE1peEw1TzlSYndYcVdkckRaN25kb2RmSU9DU1VBcVlGbTNGRlNT?=
 =?utf-8?B?Vjh3K0N5MHAyQkFITHRJUytGN1FHM0hIenc3U0JLcThVQmJSUjRiYTF0c3pn?=
 =?utf-8?B?SWNINUhvUGl6WGo1RzN4QTdCOWhCblp2Z01IVmhQR2VKRzk0UEgzZTRuTHhi?=
 =?utf-8?B?UW80WGFnTjhucjFBSjc0cUxWd28vcEtnSjcxYzJDWXU5WGpMNVFkbzJHUUZH?=
 =?utf-8?B?NGtGcTVsQzMzQkdzTEN6WmpKNy9xb1Rrd25FS3V2TWpMR3RZR3pvL3k4bUJF?=
 =?utf-8?B?QWZ5NG9GQkVWNS9jajlubCtKcUFTOGdTT2g3anREeCs0V3pHNmZiRmhTWHFN?=
 =?utf-8?B?bXhBRlphMVVGOEJGSi93SU9FUUZ3ZHd2RXI0bjZpNW9maTg0WGpiK1l1ck12?=
 =?utf-8?B?Ni8vRVRrRlRFOUpycnZLQUZGK3pFTWI0aXBnTVhpUVhQSTMyeVdJcHh1SmJt?=
 =?utf-8?B?dFdNQ0Z1RVVoUmYyNzV1Q21NbGpYYVhmalFHNmpKRHJQdzgvbVVDRng0ek5y?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: TKHU7JlWd/tPXHWuRv+4fNSzlXEEW4E8/lXlYJIkm4wBLkb6da4/Ee1lHGpAlz8cI6GMBaaA5PyMRALQpDqXbFEd+pF8rVycASCWKIFzlvAbRMupcvpukAbBb2ZFKYuW9RCLXJb/bD/Z7RccRSkxWEBYchJ0ttmpBrJ8Syf8Ty/3Q6O8C5wVzbQlFq+MDhxcdqVsGOGUUzygQ1C5i7ItmYUlgdc31eH1Ppvw2eNBC/3zgDusuxozknEggNzKnGXpL5vKhiIf5EsZnWiHMaT9T8rrx011Ua4MuIskVt0F5FpPIZNuUmYe4KmBenxi/zF0ZW14T45BXEoPRry7oXt23ZwLQEtQ8efAd9kg0GnPuZ581Rf3mdHyvE01lh2o0PqAeflEz/eZP/Z8RGi19jEiLMZmooAnR0VNkt3pWa44MZuByPfCNP0LYyvzh00oEzZfZ6qTh7huF4TOjwv9qf7ACBx8GUqQ1AEMrHg0o0qIdNm2CWW/S2v96LCaxhufdX7tDOX39LFpu5S31kyCVI1y6hkd8Q9tDVFMS775d+IjzmIcmSHRnHvm0sPji4z0CySQmT38zp3ZLyfej07XS5XNO1kbFmhRKP/+wyzCFDugIWI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb47e8f-e018-4f5e-efe9-08dda4ffe56a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 13:41:53.0246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2oRqwLEJ49syUbPhQo7hU619PxMmym9hlBxDkfBn9SnUhXEnkKVtrRIY9BppLqN/r3eJ8DCVy5Jr7+/AjZUbzMhWZQMfwefNjZ6rp5AiZlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6132
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506060124
X-Proofpoint-GUID: -jFIZ8eEI2im3NM1Oprz65htIbhzq-dD
X-Proofpoint-ORIG-GUID: -jFIZ8eEI2im3NM1Oprz65htIbhzq-dD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEyNCBTYWx0ZWRfX7s8xQqQDRqTe K7/euXT1ZmyMXRYpAixSo5WjoeKrUJTgWIky7IzSidc9EnMbfEpCIyppHc4B3ehzByP6SMr6AqF NMCOREH4MtW+gdLPQMVYzleIBgXsqJVd6fvhmJWqk2z0UN4xPLxVH4NxLssb+AvO9ibUHfR0vtn
 e6gsacTLvuKjPoCNSpktgE04vvqm8vCRbk5wMRQqzkj9EULT6XQYPI093ETqq/DgPWyGlm4yQD4 JXKJxBD1d+brY2cDq2ocbsAWlQBJnwxj0k09BvD8+QbvSjwfRixtVcSR0ZusftJ7rvfFiec2y1c xpQrwXVvYuCkdYEZW1VZQYrQRMhQzFdh56BJa46fWsvLm+CLNxxHJd9HkaNyHxxn36B/Fzu9lJ/
 3vYz6RNrUvsI+u9w0IAfss498E27x0EwXdS7dF6Gom3XADkxbXy0Dbxv43jReRquV7C6El39
X-Authority-Analysis: v=2.4 cv=QI1oRhLL c=1 sm=1 tr=0 ts=6842f026 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=yPCof4ZbAAAA:8 a=UjR7xggHdibGdW3K1PsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=5XbyYV5GRZAA:10 cc=ntf
 awl=host:13207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_064217_625483_A5F47800 
X-CRM114-Status: GOOD (  20.84  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdW4gMDYsIDIwMjUgYXQgMTI6NTk6MjBQTSArMDIwMCwgSmFubiBIb3JuIHdyb3Rl
Ogo+IE9uIFRodSwgSnVuIDUsIDIwMjUgYXQgMTA6MjPigK9QTSBEYXZpZCBIaWxkZW5icmFuZCA8
ZGF2aWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiBPbiAwNS4wNi4yNSAyMToxOSwgSmFubiBIb3Ju
IHdyb3RlOgo+ID4gPiBPbiBXZWQsIEp1biA0LCAyMDI1IGF0IDQ6MjHigK9QTSBMb3JlbnpvIFN0
b2FrZXMKPiA+ID4gPGxvcmVuem8uc3RvYWtlc0BvcmFjbGUuY29tPiB3cm90ZToKPiA+ID4+IFRo
ZSB3YWxrX3BhZ2VfcmFuZ2Vfbm92bWEoKSBmdW5jdGlvbiBpcyByYXRoZXIgY29uZnVzaW5nIC0g
aXQgc3VwcG9ydHMgdHdvCj4gPiA+PiBtb2Rlcywgb25lIHVzZWQgb2Z0ZW4sIHRoZSBvdGhlciB1
c2VkIG9ubHkgZm9yIGRlYnVnZ2luZy4KPiA+ID4+Cj4gPiA+PiBUaGUgZmlyc3QgbW9kZSBpcyB0
aGUgY29tbW9uIGNhc2Ugb2YgdHJhdmVyc2FsIG9mIGtlcm5lbCBwYWdlIHRhYmxlcywgd2hpY2gK
PiA+ID4+IGlzIHdoYXQgbmVhcmx5IGFsbCBjYWxsZXJzIHVzZSB0aGlzIGZvci4KPiA+ID4+Cj4g
PiA+PiBTZWNvbmRseSBpdCBwcm92aWRlcyBhbiB1bnVzdWFsIGRlYnVnZ2luZyBpbnRlcmZhY2Ug
dGhhdCBhbGxvd3MgZm9yIHRoZQo+ID4gPj4gdHJhdmVyc2FsIG9mIHBhZ2UgdGFibGVzIGluIGEg
dXNlcmxhbmQgcmFuZ2Ugb2YgbWVtb3J5IGV2ZW4gZm9yIHRoYXQgbWVtb3J5Cj4gPiA+PiB3aGlj
aCBpcyBub3QgZGVzY3JpYmVkIGJ5IGEgVk1BLgo+ID4gPj4KPiA+ID4+IEl0IGlzIGZhciBmcm9t
IGNlcnRhaW4gdGhhdCBzdWNoIHBhZ2UgdGFibGVzIHNob3VsZCBldmVuIGV4aXN0LCBidXQgcGVy
aGFwcwo+ID4gPj4gdGhpcyBpcyBwcmVjaXNlbHkgd2h5IGl0IGlzIHVzZWZ1bCBhcyBhIGRlYnVn
Z2luZyBtZWNoYW5pc20uCj4gPiA+Pgo+ID4gPj4gQXMgYSByZXN1bHQsIHRoaXMgaXMgdXRpbGlz
ZWQgYnkgcHRkdW1wIG9ubHkuIEhpc3RvcmljYWxseSwgdGhpbmdzIHdlcmUKPiA+ID4+IHJldmVy
c2VkIC0gcHRkdW1wIHdhcyB0aGUgb25seSB1c2VyLCBhbmQgb3RoZXIgcGFydHMgb2YgdGhlIGtl
cm5lbCBldm9sdmVkCj4gPiA+PiB0byB1c2UgdGhlIGtlcm5lbCBwYWdlIHRhYmxlIHdhbGtpbmcg
aGVyZS4KPiA+ID4KPiA+ID4gSnVzdCBmb3IgdGhlIHJlY29yZCwgY29weS1wYXN0aW5nIG15IGNv
bW1lbnQgb24gdjEgdGhhdCB3YXMKPiA+ID4gYWNjaWRlbnRhbGx5IHNlbnQgb2ZmLWxpc3Q6Cj4g
PiA+IGBgYAo+ID4gPiBTb3J0IG9mIGEgdGFuZ2VudGlhbCBjb21tZW50OiBJIHdvbmRlciBpZiBp
dCB3b3VsZCBtYWtlIHNlbnNlIHRvIGdpdmUKPiA+ID4gcHRkdW1wIGEgZGlmZmVyZW50IHBhZ2Ug
dGFibGUgd2Fsa2VyIHRoYXQgdXNlcyByb3VnaGx5IHRoZSBzYW1lIHNhZmV0eQo+ID4gPiBjb250
cmFjdCBhcyBndXBfZmFzdCgpIC0gdHVybiBvZmYgSVJRcyBhbmQgdGhlbiB3YWxrIHRoZSBwYWdl
IHRhYmxlcwo+ID4gPiBsb2NrbGVzc2x5LiBXZSdkIG5lZWQgYmFzaWNhbGx5IG5vIGxvY2tpbmcg
YW5kIG5vIHNwZWNpYWwgY2FzZXMKPiA+ID4gKHJlZ2FyZGluZyB1c2Vyc3BhY2UgbWFwcGluZ3Mg
YXQgbGVhc3QpLCBhdCB0aGUgY29zdCBvZiBoYXZpbmcgdG8KPiA+ID4gd3JpdGUgdGhlIHdhbGtl
ciBjb2RlIHN1Y2ggdGhhdCB3ZSBwZXJpb2RpY2FsbHkgcmVzdGFydCB0aGUgd2FsayBmcm9tCj4g
PiA+IHNjcmF0Y2ggYW5kIG5vdCBiZWluZyBhYmxlIHRvIGluc3BlY3QgcmVmZXJlbmNlZCBwYWdl
cy4gKFRoYXQgbWlnaHQKPiA+ID4gYWxzbyBiZSBuaWNlciBmb3IgZGVidWdnaW5nLCBzaW5jZSBp
dCB3b3VsZG4ndCBibG9jayBvbiBsb2Nrcy4uLikKPiA+ID4gYGBgCj4gPgo+ID4gSSBhc3N1bWUg
d2UgZG9uJ3QgaGF2ZSB0byBkdW1wIG1vcmUgdGhhbiBwdGUgdmFsdWVzIGV0Yz8gU28KPiA+IHB0
ZV9zcGVjaWFsKCkgYW5kIGZyaWVuZHMgYXJlIG5vdCByZWxldmFudCB0byBnZXQgaXQgcmlnaHQu
Cj4gPgo+ID4gR1VQLWZhc3QgZGVwZW5kIG9uIENPTkZJR19IQVZFX0dVUF9GQVNULCBub3Qgc3Vy
ZSBpZiB0aGF0IHdvdWxkIGJlIGEKPiA+IGNvbmNlcm4gZm9yIG5vdy4KPgo+IEFoLCBnb29kIHBv
aW50LCB0aGF0J3MgYW5ub3lpbmcuLi4gbWFhYXliZSB3ZSBzaG91bGQganVzdCBnYXRlIHRoaXMK
PiBlbnRpcmUgZmVhdHVyZSBvbiBDT05GSUdfSEFWRV9HVVBfRkFTVCB0byBtYWtlIHN1cmUgdGhl
IHVzZXJzcGFjZQo+IG1hcHBpbmdzIGFyZSBkZXNpZ25lZCB0byBiZSB3YWxrYWJsZSBpbiB0aGlz
IHdheT8gSXQncyBpbiBkZWJ1Z2ZzLAo+IHdoaWNoIF90aGVvcmV0aWNhbGx5Xwo+IChodHRwczov
L2RvY3Mua2VybmVsLm9yZy9maWxlc3lzdGVtcy9kZWJ1Z2ZzLmh0bWwpIG1lYW5zIHRoZXJlIGFy
ZSBubwo+IHN0YWJpbGl0eSBndWFyYW50ZWVzLCBhbmQgSSB0aGluayBpdCBpcyBub3JtYWxseSB1
c2VkIG9uIGFyY2hpdGVjdHVyZXMKPiB0aGF0IGRlZmluZSBDT05GSUdfSEFWRV9HVVBfRkFTVC4u
LgoKSG0sIGl0J3MgYSBuaWNlIGlkZWEsIGJ1dCBJIHdvbmRlciBpZiBpdCdzIHdvcnRod2hpbGUg
anVzdCBmb3IgcHRkdW1wPwoKSSByZWFsbHkgaGF0ZSBob3cgd2UncmUganVzdCBhcmJpdHJhcmls
eSB1c2luZyBpbml0X21tLm1tYXBfbG9jayBhcyBhIG11dGV4CmhlcmUgdGhvdWdoLgoKQ291bGQg
d2UgR1VQIGZhc3Qgd2Fsa2VycyBoZXJlIGluIGdlbmVyYWwgSSB3b25kZXIuLi4/IE9yIG9wdGlv
bmFsbHkgbWF5YmUKZm9yIG1vcmUgZ2VuZXJhbCBwYWdlIHRhYmxlIHdhbGtpbmc/CgpJIG1lYW4g
b2YgY291cnNlIGdhdGVkIG9uIGF2YWlsYWJpbGl0eS4KCldlIHNvcmVseSBuZWVkIGEgdHJ1bHkg
Z2VuZXJhbGlzZWQgcGFnZSB3YWxrZXIgOikgdGhvdWdoIG9mIGNvdXJzZSBpdCdzIGEKbWF0dGVy
IG9mIHBlb3BsZSBoYXZpbmcgdGltZSA6UAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
