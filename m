Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA6EC54E71
	for <linux-riscv@archiver.kernel.org>; Wed, 21 May 2025 15:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SChJnH8IeOR+p41eIu92fvcqT0b7w9+ge+WQC/b1GvA=; b=ZkIxTqcu30sqxw
	qyGvpAkd5q08N5K4ezSE66ojWv1aT22hY00MDQvvLGC/TD4802h9AT9XL6R7zC14ctvWhfqMnWW0v
	WsOajz7Plbhw76/soKVnmlzLCVBYSjLLZDoeyaI++pRDq1MT7GuhubvKqr0qfNq9XpPWThlX32bbz
	7PYPEo1Y0u0bE+znPm3bMex9C3x48kHKQs+UWJ8lNJs+YQHZlnxB1gijfpoXFDl0z3saMdVPhfyes
	HB7RKMsfX7dk16MMMwF5plM8tI50rEI2cqwEQfTlNAr01WcPVSdFLAWVSbLG5G7vBoK/wpSRwQ0kK
	YWB3Wg8aWEJUNwbhSiYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHkwd-0000000GCcO-14zs;
	Wed, 21 May 2025 15:01:23 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHkt1-0000000GBsD-3BEI;
	Wed, 21 May 2025 14:57:41 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LD3V2x027985;
	Wed, 21 May 2025 14:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=oQVafFbpBMSPc1w6nimR35JIkDz9Dzc39Q1e6Xnt+jA=; b=
	VOkdrqCXWM88cHtVr2+4WGPWmxCCU9tezXuA/XLJ8l1b4M1GLacW0V5IsTdnSVHV
	SaXfx4jOIBm3qtZjm9172m14r2AckLRmaevnH6txCF7wJgAH7fnRgG4WsOBPaHX2
	ufoOKLAHt3pXAAy7A1zvarYK0iearJFlaXDDcaBUi2+PJN313C5AiXY8iFz5gz5x
	6/dR5cJkqmUxKMTQ/HYInN/CUbw+HeOLyfG9RUG9/UoWhU/AyrC5I98Ozyzk6OCI
	16DViQZWyinqLDbNy3zLI4k9pLnvO63+3eP+UK5wIIO7JNlZC6jMX1BGYqvDDYfM
	IcZppHIY7+4QhqksWahQwA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46sf77gc65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 14:57:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54LEqF7C020217;
	Wed, 21 May 2025 14:57:23 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011006.outbound.protection.outlook.com [52.101.62.6])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46rwetyf9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 14:57:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=faAD+KP1nTNh493AYM8uV5dkvW3JQty6dkrziwI43PvYEeCvTMyIXWIDI2qjrT0LDEM2XFuVnzte1NXxIvd2/MweeupLLXgBhj1Sq0ln7PlkiF4xmTvwd9UWz4db1RsCewdiKkdgoHDlr69Q6/5+l4w+NtrOrL1MpXrjqKsyHAe3StS20++GeoVMaRrxkM6FtFV2RST6G4NAbpLLBUXdTm+dQaN2MpgDCWVhdHRIetmuLZfNRAyE3f9/K7CxzEO0qKfQBYAshk/Uoi9RxDNL8jjvdawhk6xdgNNwl+0hrKNaeIppbp4Hb23H6DGm9+AFtlcuuqcSyd6SAwOVIm+o4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQVafFbpBMSPc1w6nimR35JIkDz9Dzc39Q1e6Xnt+jA=;
 b=u5QOPaiEJSuHCBA43sh7iu7iqG5FajJm/UwB/3xTzMXBcd+0rLYJVA7hvzPemUI6+88xUY3IzeRCJ+1AzXFyaPR/CncJtkQUqe2OgwSBis1jxXetejoPhm4VjpGJS8rjdxUQN0egKyLrtBNmIV+X3p9ikCmgzO4CeBqukRBfq02hWYMm28H3c6ZQza+6fym26wgm2m/27tY9uLpsnwKUmKkjc0qae/kIiQqSWtl6UfuSAKrrSeNNay5GbSr44dl4bSOHuCyizK0AT1emhojcdKmlRGU3iXt+JEV1SDInQRybVWkZnfCI/ACyamyGV+j5OvQe3SJeuE2azJTWNEPYHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQVafFbpBMSPc1w6nimR35JIkDz9Dzc39Q1e6Xnt+jA=;
 b=IklicshH/Jkzq520P3xzCtzFUUnF1tRFBXNi445U7ZBCr/O+uOk2d14pFXX1V/wfRTeRyqVh5VuaBf2d27oLQcHtetkbgxaQeiuIJdjXv+VqE48uBb8r7GkgArW7ZQlLcN2sfYJkv5g6J3h1Jn0CIxPowkWyydwVShRImRzRGSs=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY5PR10MB6213.namprd10.prod.outlook.com (2603:10b6:930:32::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Wed, 21 May
 2025 14:57:20 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 14:57:19 +0000
Date: Wed, 21 May 2025 15:57:17 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthew Wilcox <willy@infradead.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v5 0/9] Merge arm64/riscv hugetlbfs contpte support
Message-ID: <e1ff054e-bfaf-48d1-9d6f-46ea73d09ac9@lucifer.local>
References: <20250321130635.227011-1-alexghiti@rivosinc.com>
 <4dd5d187-f977-4f27-9937-8608991797b5@ghiti.fr>
 <64409a13-1c07-42cd-b1ec-572042738f1b@arm.com>
 <84cb893a-46e3-408a-ba0e-2eff0b44d2a1@ghiti.fr>
 <20250508123046.GA3706@willie-the-truck>
 <CAHVXubjZB-riBLv+RGis6ErS8NvU4ijVTgvUO06fTxPhbEjXfA@mail.gmail.com>
 <2ad910f4-6930-4da2-aa2b-f3875f71e001@arm.com>
Content-Disposition: inline
In-Reply-To: <2ad910f4-6930-4da2-aa2b-f3875f71e001@arm.com>
X-ClientProxiedBy: LO2P265CA0184.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::28) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY5PR10MB6213:EE_
X-MS-Office365-Filtering-Correlation-Id: 44202551-99e8-4c27-b22c-08dd9877c8ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFVPUDcwRi9rS0FSRHJmYzRJaXo5SUVZdTNPais0OVV5UVQ5MC9JNDllMVE0?=
 =?utf-8?B?V2tvL2pHRGd5b1lKSEFYZDJDYWk5MVdsaEhib1FEZERNdkR3bEVSSzBLTWtI?=
 =?utf-8?B?a1BUU0NFbnN4UmI0Q1V2VnhqeUJldkE0VGs1Z0RVS0lLS0JmMUZ3b1AzQWFY?=
 =?utf-8?B?VWhJZW5Dc2FSTjZjd3R5d1VyYUExVWE3VVA1TStadzdyd2JkWGFFYlZBRlZj?=
 =?utf-8?B?eU8zNXNWd04yYTZQVGN0NTBTOWFaTkNIL1pMT2pvRUV1SHFueWg4WHQ1OVJZ?=
 =?utf-8?B?dUtPd2hDUDRxUjQ2U3FMWUVNNEJ2MUFQc2ZHY1BGT3Z4aGgwV2J3WnlmYlFN?=
 =?utf-8?B?TFhIcHNleHZSZHkzSmU2aVZDMXNLNEx3Sjd6UUNFczVaRjFQWmpueXpNaFdz?=
 =?utf-8?B?Zk5OS0dHRG5uWmwrLy8zY2hFY2ZZMVV2bWV1bC9lVmpYa2ZXQURIOE5YVjcy?=
 =?utf-8?B?emlsYmdUaUVCR2x4VC9xcWdDQmdpcEE0SkNuWGVzMVVOVnQ5QzhJVkhKN2I4?=
 =?utf-8?B?WWEzODJISkhwWm1lM3ZzMkdHY2NiK2c4aUZWL0g3RzNyUElpQStReDFaYmRs?=
 =?utf-8?B?cmdvM2ZQdFFzOVFGUEpMUk1UNXkwKzFJRlQrS2tsUnliSTBJUVUzaE01ZVFU?=
 =?utf-8?B?azZaaCs5aE9Xa2kwaEVBRE43Wm1JY3ZQaWZnYWdUb3lqY1h1SndJUDNESk4y?=
 =?utf-8?B?VjJpc1kzTmI5SGdQcmZBQ0M1b0tIMDVMQW1BdnEya1Vqa0lONGJta0t0bEtR?=
 =?utf-8?B?T09oNU5ON3Z4dkkwcTFlRHhlNjlxc1JndVpZUkFsbDA5ZXB4SlV5SmlHUmNx?=
 =?utf-8?B?OUZBUFhOK1NtclFreWZBcmRGVDRXTCs0ZFBPbGt3Wi9OUjJ2ZEJoRjBtUGh1?=
 =?utf-8?B?WGVYRElCbDFXNWJSYnlFaGdUZ3ZpRTd3MDZqMWhDOFpRUzVIY0dlYng5aUxL?=
 =?utf-8?B?Q2g0a252M3F2Yk9sbVpWRVQ5VkVqVkJuWkVMc3FDSXo4ZmdnNlFsb1VGRG1p?=
 =?utf-8?B?dExNcUhTekFBd1JUQmZXcCtGb0RFMjEvSFRxRzZoY0hhQWlhOG0ySkJYVS9i?=
 =?utf-8?B?UjBQTmM5UE5DUHViSVB6cXVQSldQMmVDbWFFdkR4UnZLUU5qUVRQdkRLNy9o?=
 =?utf-8?B?RjJoTDJDZkJIM3E0YmtDZnBLMkZHbnVQcTJDc2xKbWt1K3dsTUg1OGhqYVFN?=
 =?utf-8?B?djIxS1NtMzV6dXRnODNBaHJ5aDhQZzBKaS9IQmlsTW5IZWlvYmtWTzhsaXdL?=
 =?utf-8?B?RkxLZWJBdG9XS29jaWdvVmNLekxMTklyOGN4T3F5L2ZrbExxVlRwVmlrYzFa?=
 =?utf-8?B?QWdRYy9jN2VVMWhYbHIxL002RHZHMFNYendBZWJjTDc5d3E2QnBwMFBMRlph?=
 =?utf-8?B?MU9XZHJRQldCVEYzeEtXTXlwbktzSStyRHBnVXR6MEpjUWhSZ1diVkQ5MjVn?=
 =?utf-8?B?UndqMExjYWRRZ3BTd1pIWk1tWTU3T1QzOS9scXoycDBaMm1ZQlNJU3BRV2dx?=
 =?utf-8?B?TjdGU1lKdWJZSVVVekJIMWNFYVN0Tm5TaS84am95WDFrYk50SG9ZWE5ZRUFY?=
 =?utf-8?B?L0EyYUc2ZEhJdmNkS1pVMkxweWI1N0tOZjhWelY0ZnUwdGN0aERDWWJxbVd6?=
 =?utf-8?B?Uk1pSi9uZk1DZWowdXYvRmpTYTJVVWhBSDgwUU9oSTczenZpRE1BN2tNWmwv?=
 =?utf-8?B?cmFvdWhFMUErNVpoOERqKzVXNHpJdkRvelVTK2d5VFl5TVk4VlR6NWpFdVhN?=
 =?utf-8?B?OFNNTWNxNXpmdEZiRzRtaUMrNHJxY1ozamMzNzlWNGdseWJUbmpsR3BRRFJL?=
 =?utf-8?B?em1zd1Z5NW1ROUJXU0UzWmVPSVJJT0RQQkNLZms0Z2NEYmdPSy9scE1GYnJm?=
 =?utf-8?B?RFpmR1BONjcwU0dhYXR0b2NSOWVlTitWTnpPd0dLNFRRSXBzT09BdjN6SlQx?=
 =?utf-8?Q?q8YoNai/miI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlROMm0xRGd1R3B0UmloK0VVcXBEUXAydEEzYjdpVnIrRTMvbXlIRzIrNW15?=
 =?utf-8?B?WkVWOHhJMFROV3FiajlORXd4b1JyeEYzSVM3OXN0VzRhK082N1JrN2ROWUVr?=
 =?utf-8?B?cUwwUmprbXJxUGNBekxQTXJMMTNyMzAzNE1lUG9vWUhxSFduOUlvUUwySnJL?=
 =?utf-8?B?eDJJSGMwWVdvZUtWSG5nZU1SMEFsZ25Qdzc2aHdacVZSUTZCbU9lZ2RlRkgw?=
 =?utf-8?B?V2NZdnIwZkdzL0NUMS9CSHRudi9YMWlaeDhVNWpZNG1zeXF0ZFh4ZjcrRWY1?=
 =?utf-8?B?Q0lIR0tsTkVEQmt3U3Q1VzhZZkthZjhTZCtZR0wvUm9QTkxtenMySVI0a0hP?=
 =?utf-8?B?VzhKVVM4SHl1bHJSSXl2OTlKZTA5Z2I0WEZDK0tjVDdCVFVRQzBTdmRLbHEr?=
 =?utf-8?B?QzFmSGZ3WTRRV0FDR096ZnU3M0U3ZGpsSVFjcldEVUx3VUpNMnNwUk4waW1w?=
 =?utf-8?B?MHB5MjFjQ29JdzlnMGRZeTV2a1VXZjNWbmNkRG5uVVp0M2xkWXA5WWZBZnp2?=
 =?utf-8?B?MWZPUDBSa0pHZFVvU0I1aXFON3VabEJTcG9DTjdvNW0rTGkzeHlZeHV5TC9W?=
 =?utf-8?B?dWlLRDl0R3FhZ3pTcWh5MmVQVGNqWSt1TlNXdCtSU3NQMzJBSWppcVU5NUI4?=
 =?utf-8?B?T3RUd1p4ckhlZHUzOXp3c0RLdjFmdWJ3Wk80ZjdQMk9RT1Y1NHZSTVhDRCsx?=
 =?utf-8?B?Z2Y0UW5lNjFvbWsyNGd6N0NpdFNocU92OWk1ME03R1lmNTFVVC9SK05FZXNk?=
 =?utf-8?B?Vks0c2hIYWNKbXBuYzBjOHl1dTlBOTlxaUtUd1ZXZVRBZDNsTCtkQ2J3MlZY?=
 =?utf-8?B?SkxMY29wL3cxM0FibUwySTJ1WUV3NG05cWtTdjVYWDhwM3dpTExlSytlYkxm?=
 =?utf-8?B?WDVzMmtGdEptSFhxd2NKQkRYaFMreGkvbHNmTU9aVTZUWWxqMnlPMWxKZWVC?=
 =?utf-8?B?NDFBblZLd05iZERsM1AyajlodVpSdk85OVlPUmsvT1lPU3pLVnd5bXlBQUZD?=
 =?utf-8?B?WkVFMExSWnNlWlZxemowVm94blR1dkYzOGdiYlZhT0lPSkRZd21RdlQ4Tzk2?=
 =?utf-8?B?anRYVDF0V09zSFByUFJLcDBWYm1BRVBVMWRUTFBRL3FMWEhOd2lhM3lyeEdI?=
 =?utf-8?B?UkJlaUw1OFIzQlRYMkJGUm1IKytuMWkxSGdzcjBXak1kWWpUeUxvK1hxa2xs?=
 =?utf-8?B?VXVjWXp5KytncG40dmlqR3BwcFQwUnhGd3R6UmJYQ1hVK3hWU0ZYS00yd0NX?=
 =?utf-8?B?dkVtUzRSMC9ycTdvVWdRTUwzS2ZWOCtpTklmT21tUGVXL3QwNU9OdTVPRmVU?=
 =?utf-8?B?b2lvNCs0THA4ZnFrVFBHTndXSTRBR0NkU2tNbWhEQi91RnJiYXordlF0b3FB?=
 =?utf-8?B?a1ZjenhXaHk0UjBFR0lWSXBHbnJyQThpZXhmSkV6VGhzWkxWblhudVNkL0RU?=
 =?utf-8?B?bFcrWVdQclBFVU1JVWpsUndFQWliMmNoNzhzM2lTRElFeGx4SlkwSUd6RWNT?=
 =?utf-8?B?anJ4NWZQdXRnYnNTSk90STBlNEhBdFV1SVRYb013WjY5ZFdpSGpQVjh0aWRX?=
 =?utf-8?B?SXcvMzd6eTE3eU1kYjNuWHhtdHQwbHRPeUtBOHBCN0R1Mm5NRzk1RjEvQ3Zv?=
 =?utf-8?B?c0wxa3BMYjEwaFhvdnZtSGtPMmtkTXJ5QkVXRzc4SVRGNnlyVUtGR3NSdDZ6?=
 =?utf-8?B?ODVwbVBIUnZjRHh2dURXZWNnRXZPTVkzOTRuOTR2enNtWWp6R1JVU2JZSkhN?=
 =?utf-8?B?UnpGeWdacVZualJndU1ZME1lWDNySUVKd29PUkJGeXQ1RE15OWFzNjd4dHI2?=
 =?utf-8?B?TVNJQldBNVdTNWhxdDVRTjJWSlpJS2pkRE85VGczYWxmbGVqa3FPRlVweFYv?=
 =?utf-8?B?T2xta0dwRTFtQ05IWXZBbEw3NmlDU1pjU3RYcTI2QUt2TVNVd3ppbis1a0Np?=
 =?utf-8?B?clNmdVgwSGl6M2JqZnc1ZkNCcXorZ0tHdUdITHFpRVN4dE9WeW9OSkJucUpL?=
 =?utf-8?B?ZUhzVFZybWNSOEV2V25QSTN0cDdNTkdncjBkejVuMHcvYTBYZVZmZDk3TVJO?=
 =?utf-8?B?ZStLdXhJUktwUVhERlY1M3ptT1BOQ2szMysvN3pJd0RBNkIvekl2Tk5KLzhu?=
 =?utf-8?B?SzgwRDE3Q1hqcFRDbERvaUlENWZBRlh0Y0VaMGxLMDdtaDEvaXFSek5haEdC?=
 =?utf-8?B?cnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: YVmQitnDgvRtEr4WuFpm65a1xGdRxoKUWapSkZ16cGSngA51lPEc6oZyb5v+Wz0ErLin1dfP8DlzJaL9IH+Odx4ReOOfd+u8IS4HIMe9oqs/mLHtCW5LDS+Gh0B4F1mmN+pTP6dOeIKmqR5bdjdipPLYZIZxHeZFC3YnwXlkEP/ChSGoF88LY0rXo9iIihgD8ZW2MurkHycX4pHpDYUO+0NGd7twzj8nKaswLyu2Wuln3/2rk6l6MlRcBF87v92a2Xx7ajyXy8Cu9oPpZHNm6UGKRkDZDqycLGqvE/4wBzfV4fkAyNafuDq4Vyr+0av5i1P8UeQijSMGceBEYqMug06u6fuZTpMWWgh/GdnRM31fz3KE9HibIW2Qe6fyc6t1KdCbAzFZrIKi9IsKJkJ7D8ljudH5kRSJsAQkOPHcBOF0GZ3l4rzlkxwO9PiFnPTJ/2jbmDWaFNG5GUJq/u1rgTXoYWURD5f2kt92RwnBcETNH59nspjME8yyj34WU3PHPj6q7pQGNfb7D0bsCYjk1YeDsQ70oYs5wL95NviKjqFdPtqZLM7emrZiX8q0OasCPZwGG4YmcvmhcQ+t+SmbtK+O6k/JBDnYX8mxPzhyxlw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44202551-99e8-4c27-b22c-08dd9877c8ad
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 14:57:19.5121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jz3H8D2niTWzFBcxoqsbMlc1de/sU2eM8mZsvzzmXUXapGrPwXG33XOMiBJfu4s/jC4+/dymWs/9uLVJUtWDvvuheGInx8TimuxtYpUuilI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6213
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505210145
X-Authority-Analysis: v=2.4 cv=Vb/3PEp9 c=1 sm=1 tr=0 ts=682de9d4 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=h0uksLzaAAAA:8 a=yPCof4ZbAAAA:8 a=CiC325fxN1SmnME7YsgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 a=MSi_79tMYmZZG2gvAgS0:22
 cc=ntf awl=host:13207
X-Proofpoint-ORIG-GUID: mmbvVNUMCjFqpMoy1MJbD8IR1JjRREXR
X-Proofpoint-GUID: mmbvVNUMCjFqpMoy1MJbD8IR1JjRREXR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE0NiBTYWx0ZWRfX3NswpcgQI3Wt vQbvPpiD3F5e58ueGiDmkXehrlCWYMiTwrBSUSqI1l0PAnC6LZpHDVG1O7W99H67V4KmM3PODVi iWve0F/lNGzKnpEdNwYBzi47GBoQSgvYKVhnF9EGbU8xoKjo+pBPkDyRZbsyDIT1qCONCv2zyUa
 mBBE3DIc6+mmPCmnYFPXfPEWJiLL1UxJUq/qAeQigb8lNP6VbdI/cAzotY5CQnRCHwF+F03lh3g Rz6FHU/m1c4ukunwunsTJFztYSqW1vg2IJX6HZ+phrWP6VM3OmS4NftbCxKISQX6mLFchfNkDOd cDTAqJ4g7H/US9uezCsM1SeqO8cl4XQdaczvssTnJq/dCtYVwqdkBvOPy2C1HuHPr0+aWU2BDaL
 fgT1Qdb+/ScK5bUDWdQuBrUgqcNGvYEidWdVf+1XQ1JKbLCxz1ugv5jMBUPc6cM0QktMkzCC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_075739_916417_826C01F1 
X-CRM114-Status: GOOD (  19.59  )
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

LWNjIG15IGdtYWlsLCBJIG5vIGxvbmdlciBjaGVjayBrZXJuZWwgbWFpbCBoZXJlIGF0IGFsbCwg
ZXZlcnl0aGluZyBpcyB2aWEgbXkKIHdvcmsgbWFpbCAobG9yZW56by5zdG9ha2VzQG9yYWNsZS5j
b20gOikKClNvIGFwb2xvZ2llcyBmb3IgbWlzc2luZyB0aGlzLgoKT24gRnJpLCBNYXkgMDksIDIw
MjUgYXQgMDI6MDI6MDNQTSArMDEwMCwgUnlhbiBSb2JlcnRzIHdyb3RlOgo+IE9uIDA5LzA1LzIw
MjUgMTI6MDksIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+IEhpIFdpbGwsCj4gPgo+ID4gT24g
VGh1LCBNYXkgOCwgMjAyNSBhdCAyOjMw4oCvUE0gV2lsbCBEZWFjb24gPHdpbGxAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4gPj4KPiA+PiBIaSBmb2xrcywKPiA+Pgo+ID4+IE9uIE1vbiwgTWF5IDA1LCAy
MDI1IGF0IDA2OjA4OjUwUE0gKzAyMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+Pj4gT24g
MjkvMDQvMjAyNSAxNjowOSwgUnlhbiBSb2JlcnRzIHdyb3RlOgo+ID4+Pj4gT24gMDcvMDQvMjAy
NSAxMzowNCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4+Pj4+IENhbiBzb21lb25lIGZyb20g
YXJtNjQgcmV2aWV3IHRoaXM/IEkgdGhpbmsgaXQncyBwcmVmZXJhYmxlIHRvIHNoYXJlIHRoZSBz
YW1lCj4gPj4+Pj4gaW1wbGVtZW50YXRpb24gYmV0d2VlbiByaXNjdiBhbmQgYXJtNjQuCj4gPj4+
PiBJJ3ZlIGJlZW4gdGhpbmtpbmcgYWJvdXQgdGhpcyBmb3IgYSB3aGlsZSBhbmQgaGFkIHNvbWUg
Y29udmVyc2F0aW9ucyBpbnRlcm5hbGx5Lgo+ID4+Pj4gVGhpcyBwYXRjaHNldCBoYXMgYm90aCBw
cm9zIGFuZCBjb25zLgo+ID4+Pj4KPiA+Pj4+IEluIHRoZSBwcm9zIGNvbHVtbiwgaXQgaW5jcmVh
c2VzIGNvZGUgcmV1c2UgaW4gYW4gYXJlYSB0aGF0IGhhcyBoYWQgcXVpdGUgb2YgZmV3Cj4gPj4+
PiBidWdzIHBvcHBpbmcgdXAgbGF0ZWx5OyBzbyB0aGlzIHdvdWxkIGJyaW5nIG1vcmUgZXllcyBh
bmQgaG9wZWZ1bGx5IGhpZ2hlcgo+ID4+Pj4gcXVhbGl0eSBpbiB0aGUgbG9uZyBydW4uCj4gPj4+
Pgo+ID4+Pj4gQnV0IGluIHRoZSBjb25zIGNvbHVtbiwgd2UgaGF2ZSBzZWVuIEhXIGVycmF0YSBp
biBzaW1pbGFyIGFyZWFzIGluIHRoZSBwYXN0IGFuZAo+ID4+Pj4gSSdtIG5lcnZvdXMgdGhhdCBi
eSBob2lzdGluZyB0aGlzIGNvZGUgdG8gbW0sIHdlIG1ha2UgaXQgaGFyZGVyIHRvIHdvcmthcm91
bmQKPiA+Pj4+IGFueSBmdXR1cmUgZXJyYXRhLiBBZGRpdGlvbmFsbHkgSSBjYW4gaW1hZ2luZSB0
aGF0IHRoaXMgY2hhbmdlIGNvdWxkIG1ha2UgaXQKPiA+Pj4+IGhhcmRlciB0byBzdXBwb3J0IGZ1
dHVyZSBBcm0gYXJjaGl0ZWN0dXJlIGVuaGFuY2VtZW50cy4KPiA+Pj4+Cj4gPj4+PiBJIGFwcHJl
Y2lhdGUgdGhlIGNvbnMgYXJlIG5vdCBzdHJvbmcgKnRlY2huaWNhbCogYXJndW1lbnRzIGJ1dCBu
ZXZlcnRoZWxlc3MgdGhleQo+ID4+Pj4gYXJlIHdpbm5pbmcgb3V0IGluIHRoaXMgY2FzZTsgTXkg
b3BpbmlvbiBpcyB0aGF0IHdlIHNob3VsZCBrZWVwIHRoZSBhcm02NAo+ID4+Pj4gaW1wbGVtZW50
YXRpb25zIG9mIGh1Z2VfcHRlXyAoYW5kIGNvbnRwdGVfIHRvbyAtIEkga25vdyB5b3UgaGF2ZSBh
IHNlcGFyYXRlCj4gPj4+PiBzZXJpZXMgZm9yIHRoaXMpIHByaXZhdGUgdG8gYXJtNjQuCj4gPj4+
Pgo+ID4+Pj4gU29ycnkgYWJvdXQgdGhhdC4KPiA+Pj4+Cj4gPj4+Pj4gVGhlIGVuZCBnb2FsIGlz
IHRoZSBzdXBwb3J0IG9mIG1USFAgdXNpbmcgc3ZuYXBvdCBvbiByaXNjdiwgd2hpY2ggd2Ugd2Fu
dCBzb29uLAo+ID4+Pj4+IHNvIGlmIHRoYXQgcGF0Y2hzZXQgZG9lcyBub3QgZ2FpbiBhbnkgdHJh
Y3Rpb24sIEknbGwganVzdCBjb3B5L3Bhc3RlIHRoZSBhcm02NAo+ID4+Pj4+IGltcGxlbWVudGF0
aW9uIGludG8gcmlzY3YuCj4gPj4+PiBUaGlzIGNvcHkvcGFzdGUgYXBwcm9hY2ggd291bGQgYmUg
bXkgcHJlZmVyZW5jZS4KPiA+Pj4KPiA+Pj4KPiA+Pj4gSSBoYXZlIHRvIGFkbWl0IHRoYXQgSSBk
aXNhZ3JlZSB3aXRoIHRoaXMgYXBwcm9hY2gsIHRoZSByaXNjdiBhbmQgYXJtNjQKPiA+Pj4gaW1w
bGVtZW50YXRpb25zIGFyZSAqZXhhY3RseSogdGhlIHNhbWUgc28gaXQgc291bmRzIHdlaXJkIHRv
IGR1cGxpY2F0ZSBjb2RlLAo+ID4+PiB0aGUgcHJvcyB5b3UgbWVudGlvbiBvdXR3ZWlnaCB0aGUg
Y29ucy4KPiA+Pj4KPiA+Pj4gVW5sZXNzIEknbSBtaXNzaW5nIHNvbWV0aGluZyBhYm91dCB0aGUg
ZXJyYXRhcz8gVG8gbWUsIHRoYXQncyBlYXNpbHkgZml4ZWQKPiA+Pj4gYnkgcHJvdmlkaW5nIGFy
Y2ggc3BlY2lmaWMgb3ZlcnJpZGVzIG5vPyBDYW4geW91IGRlc2NyaWJlIHdoYXQgc29ydCBvZgo+
ID4+PiBlcnJhdGFzIHdvdWxkIG5vdCBmaXQgdGhlbj8KPgo+IE9uZSBjb25jcmV0ZSBmZWF0dXJl
IGlzIHRoZSB1c2Ugb2YgQXJtJ3MgRkVBVF9CQk0gbGV2ZWwgMiB0byBhdm9pZCBoYXZpbmcgdG8g
ZG8KPiBicmVhay1iZWZvcmUtbWFrZSBhbmQgVExCIG1haW50ZW5hbmNlIHdoZW4gZG9pbmcgYSBm
b2xkIG9yIHVuZm9sZCBvcGVyYXRpb24uCj4gVGhlcmUgaXMgYSBzZXJpZXMgaW4gZmxpZ2h0IHRv
IGFkZCB0aGlzIHN1cHBvcnQgYXQgWzFdLiBJIGNhbiBzZWUgdGhpcyB0eXBlIG9mCj4gYXBwcm9h
Y2ggYmVpbmcgZXh0ZW5kZWQgdG8gdGhlIGh1Z2V0bGIgaGVscGVycyBpbiBmdXR1cmUuCj4KPiBJ
IGFsc28gaGF2ZSBhbm90aGVyIHNlcmllcyBpbiBmbGlnaHQgYXQgWzJdIHRoYXQgdGlkaWVzIHVw
IHRoZSBodWdldGxiCj4gaW1wbGVtZW50YXRpb24gYW5kIGRvZXMgc29tZSBvcHRpbWl6YXRpb25z
LiBCdXQgdGhlIG9wdGltaXphdGlvbnMgZGVwZW5kIG9uCj4gYXJtNjQtc3BlY2lmaWMgVExCIG1h
aW50ZW5hbmNlIEFQSXMuCj4KPiBbMV0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1h
cm0ta2VybmVsLzIwMjUwNDI4MTUzNTE0LjU1NzcyLTItbWlrby5sZW5jemV3c2tpQGFybS5jb20v
Cj4KPiBbMl0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0ta2VybmVsLzIwMjUw
NDIyMDgxODIyLjE4MzYzMTUtMS1yeWFuLnJvYmVydHNAYXJtLmNvbS8KPgo+IEFzIGZvciBlcnJh
dGEsIHRoYXQncyBvYnZpb3VzbHkgbXVjaCBtb3JlIGZ1enp5OyB0aGVyZSBoYXZlIGJlZW4gYSBi
dW5jaAo+IHJlbGF0aW5nIHRvIHRoZSBNTVUgaW4gdGhlIHJlY2VudCBwYXN0LCBhbmQgSSB3b3Vs
ZG4ndCBiZSBzaG9ja2VkIGlmIG1vcmUgdHVybmVkIHVwLgo+Cj4gRm9yIGZ1dHVyZSBhcmNoaXRl
Y3R1cmUgZW5jaGFuY2VtZW50cywgSSdtIGF3YXJlIG9mIG9uZSBwb3RlbnRpYWwgZmVhdHVyZSBi
ZWluZwo+IGRpc2N1c3NlZCBmb3Igd2hpY2ggdGhpcyBjaGFuZ2Ugd291bGQgbGlrZWx5IG1ha2Ug
aXQgaGFyZGVyIHRvIGltcGxlbWVudC4KPgo+ID4+Cj4gPj4gSWYgd2Ugc3RhcnQgd2l0aCB0aGUg
Y29tbW9uIGltcGxlbWVudGF0aW9uIHlvdSBoYXZlIGhlcmUsIG5vdGhpbmcKPiA+PiBwcmV2ZW50
cyB1cyBmcm9tIGZvcmtpbmcgdGhlIGNvZGUgaW4gZnV0dXJlIGlmIHRoZSBhcmNoaXRlY3R1cmVz
IGRpdmVyZ2UKPiA+PiBzbyBJJ2QgYmUgaW5jbGluZWQgdG8gbWVyZ2UgdGhpcyBzZXJpZXMgYW5k
IHNlZSBob3cgd2UgZ2V0IG9uLgo+Cj4gT0sgaWYgdGhhdCdzIHlvdXIgcHJlZmVyZW5jZSwgSSdt
IG9rIHdpdGggaXQuIEkgZG9uJ3QgaGF2ZSBzdHJvbmcgb3BpbmlvbiwganVzdAo+IGEgc2Vuc2Ug
dGhhdCB3ZSB3aWxsIGVuZCB1cCB3aXRoIGxvYWRzIG9mIGFyY2gtc3BlY2lmaWMgb3ZlcnJpZGVz
LiBBcyB5b3Ugc2F5LAo+IGxldCdzIHNlZS4KPgo+IEFsZXhhbmRyZSwgSSBndWVzcyB0aGlzIHNl
cmllcyBpcyBxdWl0ZSBvbGQgbm93IGFuZCB3aWxsIG5lZWQgdG8gaW5jb3Jwb3JhdGUgdGhlCj4g
aHVndGVsYiBmaXhlcyBJIGRpZCBsYXN0IGN5Y2xlPyBBbmQgaWRlYWxseSBJJ2QgbGlrZSBbMl0g
dG8gbGFuZCB0aGVuIGZvciB0aGF0Cj4gdG8gYWxzbyBiZSBpbmNvcnBvcmF0ZWQgaW50byB5b3Vy
IG5leHQgdmVyc2lvbi4gKEknbSBzdGlsbCBob3BlZnVsIHdlIGNhbiBnZXQKPiBbMl0gaW50byB2
Ni4xNiBhbmQgaGF2ZSBiZWVuIHdhaXRpbmcgcGF0aWVudGx5IGZvciBXaWxsIHRvIHBpY2sgaXQg
dXAgOykgKS4KPgo+IEkgZ3Vlc3Mgd2UgY2FuIHdvcnJ5IGFib3V0IFsxXSBsYXRlciBhcyB0aGF0
IGlzIG9ubHkgYWZmZWN0ZWQgYnkgeW91ciBvdGhlciBzZXJpZXMuCj4KPiBIb3cgZG9lcyB0aGF0
IHNvdW5kPwo+Cj4gPj4gSG93ZXZlciwKPiA+PiBvbmUgdGhpbmcgSSAqZG8qIHRoaW5rIHdlIG5l
ZWQgdG8gZW5zdXJlIGlzIHRoYXQgdGhlIHJlbGV2YW50IGZvbGtzIGZyb20KPiA+PiBib3RoIGFy
bTY0IChpLmUuIFJ5YW4pIGFuZCByaXNjdiAoaS5lLiBBbGV4YW5kcmUpIGFyZSBjYydkIG9uIGNo
YW5nZXMgdG8KPiA+PiB0aGUgY29tbW9uIGNvZGUuIE90aGVyd2lzZSwgaXQncyBnb2luZyB0byBi
ZSBhIHN0ZXAgYmFja3dhcmRzIGluIHRlcm1zCj4gPj4gb2YgbWFpbnRhaW5hYmlsaXR5Lgo+ID4+
Pj4gQ291bGQgd2UgYWRkIHNvbWV0aGluZyB0byBNQUlOVEFJTkVSUyBzbyB0aGF0IHRoZSBuZXcg
ZmlsZSBwaWNrcyB5b3UgYm90aAo+ID4+IHVwIGFzIHJldmlld2Vycz8KPgo+IFRoYXQncyBmaW5l
IHdpdGggbWUuIExvcmVuem8gYWRkZWQgbWUgZm9yIHNvbWUgcGFydHMgb2YgTU0gdGhpcyBjeWNs
ZSBhbnl3YXkuCj4KPiBUaGFua3MsCj4gUnlhbgoKSW5kZWVkIDopIGhhcHB5IHRvIGhhdmUgeW91
IHRoZXJlIFJ5YW4hCgo+Cj4gPgo+ID4gSSdtIGFkZGluZyBMb3JlbnpvIGFzIGhlIGlzIGNsZWFu
aW5nIHRoZSBtbSBNQUlOVEFJTkVSUyBlbnRyaWVzLgo+ID4KPiA+IEBMb3JlbnpvOiBzaG91bGQg
d2UgYWRkIGEgbmV3IHNlY3Rpb24gIkNPTlRQVEUiIGZvciB0aGlzPyBGWUksIGh1Z2V0bGIKPiA+
IGlzIHRoZSBmaXJzdCBwYXRjaHNldCwgSSBoYXZlIGFub3RoZXIgcGF0Y2hzZXQgdG8gbWVyZ2Ug
VEhQIGNvbnRwdGUKPiA+IHN1cHBvcnQgWzFdIGFzIHdlbGwgc28gdGhlICJIVUdFVExCIiBzZWN0
aW9uIGRvZXMgbm90IHNlZW0gdG8gYmUgYQo+ID4gZ29vZCBmaXQuCgpIbSwgdGhpcyBkb2VzIHNl
ZW0gdG8gYmUgdmVyeSBhcm02NC1zcGVjaWZpYyByaWdodD8KCkJ1dCBoYXZpbmcgc2FpZCB0aGF0
LCBsaXRlcmFsbHkgY2FuIHNlZSByaXNjIHYgZW50cmllcyA6KQoKV2UgYXJlIGluIGEgc3RyYW5n
ZSBzb3J0IG9mIHNjZW5hcmlvIHdoZXJlIHRoZXJlJ3Mgc29tZSBjcm9zcy1vdmVyIGhlcmUuCgpJ
IGRvbid0IHN0cmljdGx5IG9iamVjdCB0byBpdCB0aG91Z2gsIHRoaXMgc3R1ZmYgaXMgaW1wb3J0
YW50IGFuZCB3ZSBzaG91bGQgZ2V0CnRoZSBtbSBmaWxlcyBhYnNvbHV0ZWx5IHVuZGVyIGFuIGFw
cHJvcHJpYXRlIE1BSU5UQUlORVIgZW50cnkuCgpTbyByaWdodCBub3cgaXQgc2VlbXMgdGhlIGZp
bGVzIHdvdWxkIGNvbnNpc3Qgb2Y6CgppbmNsdWRlL2xpbnV4L2h1Z2V0bGJfY29udHB0ZS5oCm1t
L2h1Z2V0bGJfY29udHB0ZS5jCgpJcyB0aGlzIGNvcnJlY3Q/CgpJcyB0aGlzIHNlcmllcyBpbnRl
bmRlZCB0byBiZSB0YWtlbiBieSBBbmRyZXcgb3IgdGhyb3VnaCBhbiBhcmNoIHRyZWU/CgpBbmQg
d2hvIHdvdWxkIHlvdSBzZW5zaWJseSBwcm9wb3NlIGZvciBNJ3MgYW5kIFIncz8KCklmIHdlIGFy
ZSBkZWZpbml0ZWx5IGFkZGluZyB0aGluZ3MgdGhhdCBzaXQgb3V0c2lkZSBodWdldGxiIG9yIGFu
eXRoaW5nCmFyY2gtc3BlY2lmaWMsIGFuZCBpcyBpbiBmYWN0IGdlbmVyaWMgbW0gY29kZSwgdGhl
biB5ZXMgdGhpcyBzaG91bGQgYmUgYQpzZWN0aW9uLgoKRG9lcyBjb250cHRlIHN0YW5kIGZvciAn
Q29udGlndW91cyBQVEUnPwoKVGhlbiBlbnRyeSBjb3VsZCBwZXJoYXBzIGJlOgoKTUVNT1JZIE1B
TkFHRU1FTlQgLSBDT05UUFRFIChDT05USUdVT1VTIFBURSBTVVBQT1JUKQoKSSdkIHNheSB0aGlz
IGVudHJ5IHNob3VsZCBwcm9iYWJseSBiZSBhZGRlZCBhcyBhIHBhdGNoIGluIHRoaXMgc2VyaWVz
LgoKSWYgeW91IGdpdmUgbWUgYSBsaXN0IG9mIFIncyBhbmQgTSdzIGFuZCBjb25maXJtIHRob3Nl
IGZpbGVzIEkgY2FuIHZlcnkgcXVpY2tseQpjb3B5L3Bhc3RhIGZyb20gYW4gZXhpc3RpbmcgZW50
cnkgYW5kIHRoZW4geW91IGNvdWxkIHJlc3BpbiAoYW5kIGNjIG15IHdvcmsgbWFpbApmb3IgdGhl
IHNlcmllcyA6UCkgYW5kIGluY2x1ZGUgdGhhdCBhcyBhbiBhZGRpdGlvbmFsIHBhdGNoPwoKSGFw
cHkgdG8gQUNLIHRoYXQgaW4gdGhhdCBjYXNlLgoKCj4gPgo+ID4gWzFdIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjQwNTA4MTkxOTMxLjQ2MDYwLTEtYWxleGdoaXRpQHJp
dm9zaW5jLmNvbS8KPiA+Cj4gPiBUaGFua3MsCj4gPgo+ID4gQWxleAo+ID4KPiA+Pgo+ID4+IFdp
bGwKPgoKQ2hlZXJzLCBMb3JlbnpvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
