Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0969C3ABC0
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 17:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r+NNW880HETwuOhTBZOlURB28wI4dF5G81L7ukUp0Dg=; b=vHWqZVSKbjaVhR
	0I8gb/nXXzEJqC6Z2k2ph40nnb4t4Nhfr4WQB2rB3p378zKO/zNR2Nsgkpi5rp9fQrKkkVrtiZbtz
	csXbET3XGeWhjgdBsgFn/ORzsLl+lVg1ACZWTjCCnztbTJQPs26rM/mEkU7KMvN/mJV0PesPjOpus
	5Lmp07Owq4SQFyutW1FDsU6bmfKtgAtn8mXkQuRmPKBhFat+Oe+T+CYR8b/877MLMmwM2bVf1WCiL
	XieVhqwAW36Zip3KeuwAybAK8W04jOY92PYj2FiyunWi27IE9ZrRcCZ0pPE+mkc/f9OZW02YOAJXl
	nImVNYi87HaYzAdeoIKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiXL-0000000GJLN-0VYz;
	Wed, 07 May 2025 17:26:27 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChXX-0000000G8xi-46si
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 16:22:37 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547GBuD2031947;
	Wed, 7 May 2025 16:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=iZ/Pfc8aQVOskF145wVEDHf6cBd8RKkaz16uNLm0PK0=; b=
	BJ8h4sxyjYJDgpiP1WJ+jofQ3s5j76w/yW5g/EGCPFM9YgskGDH6IxnmVjqMw8jo
	d6W4eLtL8AggFy8enFH7jdDVDZ8EO2EyRNN7rg+F6slvuBWx4XupW5PGvB0BKZul
	UljeEaSpSP+ZdVyiQWMNp5yKV5yz3LZ0hDJ5lWwEXhoSWi8ZIVW3Tj1qU14PlsD9
	RXL1Q+/7nDFGZRIcIxI9y0PhlGtuqPG7uaeHGPPxOXUAnxunEqjSqkE161FlD1h9
	lM0PsNjTfPWgpZpsbms29RhagcEdVV1XfR91SnXsrtgSMnDqs4Z0Z7pGEteTtI9G
	l2oxBkOXQdHyfXHT5Cmnow==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46gardg1gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 07 May 2025 16:22:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 547F5G2S024474;
	Wed, 7 May 2025 16:22:20 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kgvfen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 07 May 2025 16:22:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lHf9xvyQrpaElOf2gaLyxmuGkELfEYVadkCPjWuK6xT8PxDnV0ZY7lckNfWbUkfxw141WEH9ncCRJwg+BHB4fD/AjH5IkxBWtygfcA6WPsb7MVn9HSK342eF7vjnYcBHBj/j9+pFLn/np0Z2a3bVlddKoJKyjUOPLQRy+sq2miPLbNYJf5OGAiMnycqozE6sL3iU4UeUap/AxIPVPt0xuVosaJVywu2F1+AhDaT7gJDlJBbwAGWvp5kKWVkTnGjEaIpKR1J+5jPkSUfqKOET9Mfeq+Xy0DSCXqhtlHkRGTusGf6u9rYVSIFhiXaGi/I+okxtDnMfAcxNqsB5rSehyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZ/Pfc8aQVOskF145wVEDHf6cBd8RKkaz16uNLm0PK0=;
 b=E/IPwTk8mLrFf5NuL52z8qatCfzvjDkgkL2EuL1kXq9J/aGr28cu6d8CTBqa+87gmUAvIwNq0/Jl+7LeqdbcnPP2O/J8Z8XH2GNUsCaYHJZTNLMbCCekEy5vPRimZuWYyQoWJRY84T8uTfi4NpC61XriLFJFmUB0fYLCM2xprgls3tNKXEYe+gQZCGOV9pRh5QyGctxt8AXYSvkWtD1UuIJASdyrsjXMIW0e/IJle/+D6ftZX5HodSqrg7mNXRrg/CnpHA/Mpdc0c5PzWrrN7LqawENg9DNiI5oGLHcFs9D2UYBWj4BMnM4ZndqfKUoKOxGPJX4jeDpTDabUCCVWGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZ/Pfc8aQVOskF145wVEDHf6cBd8RKkaz16uNLm0PK0=;
 b=y2T7gOCjcKQw2tIhvY6JlS0kwmbsrYPNipCQz8NvPnHzeMVNQps9iOiiTDShqc/CzzrkOPnw6Dop/5Z28ANCTn589niC7pIyArv5tT6rATJP6+Ray9wA1L8CS+XxwEMhI1LQM+gfdYrWsuU64ruV2AK2ivf7EQyJekDd3drdsa8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB6986.namprd10.prod.outlook.com (2603:10b6:510:27e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 16:22:12 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Wed, 7 May 2025
 16:22:12 +0000
Date: Wed, 7 May 2025 17:22:09 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Jeff Xu <jeffxu@chromium.org>
Cc: Jisheng Zhang <jszhang@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Kees Cook <kees@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH] riscv: enable mseal sysmap for RV64
Message-ID: <5e7f2acd-2eef-4e69-9c11-ba8d1ec0bbc5@lucifer.local>
References: <20250426135954.5614-1-jszhang@kernel.org>
 <CABi2SkXJgeLLYQEp1c7EepYzpGU+d0TsOZ5ix6PUUmJLuHyvwQ@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CABi2SkXJgeLLYQEp1c7EepYzpGU+d0TsOZ5ix6PUUmJLuHyvwQ@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0073.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB6986:EE_
X-MS-Office365-Filtering-Correlation-Id: 1400c34f-5aac-4b1e-ee99-08dd8d8352ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UC9DTGNvVkJtRFFPdVZ5ZVd2ejc3QkZSOVdSNDhFVXZOdS9lODN5bFpFTGZw?=
 =?utf-8?B?T3V5MXFCNmtFRGpDTTQ2SG5OeHhuOWRiN2RxaXZRcFZNQm51bTFFRjFTVzU5?=
 =?utf-8?B?Q3Irenk5OW9mS09sbTU5ODdCMEhmaFNLek9FR0t1dEk1R0ZuaXFiYkV5dEJJ?=
 =?utf-8?B?UHp5OUlrRVhZOFMvNkQ3WE45SVJhYWRFZCt6cFVKYytmcFU1dmp2dG94N1k5?=
 =?utf-8?B?eGZMK3JUem01WnNIRllCeGsrNmwxYkYrL0VZZVRkZzBvRDJjU0lETmJCenFw?=
 =?utf-8?B?UVZsZ1hSUXhtVnRQSVhNbGVPUWpEUFMrcm1EbGQvdjJ1aUR4UzJlRUU5Z3VF?=
 =?utf-8?B?VFc5Z2M1OTE2ZG92eW1GQnhxMjhCZnJqOFVSWTZMeTRBU0FHbFB1OTRSUHcv?=
 =?utf-8?B?TTZuQ21RMm5peEVCM0M5b2N2OVMwdE1XMm1VMHJ4LytVa3JVME5WSVdPdmVo?=
 =?utf-8?B?TnNKUjFhRHB0U2IvMGRsT0FWaE94dU1uRGkvL2NlVXYyN3VJa2pIS0JPOWNQ?=
 =?utf-8?B?Rkk5TUtWNkdOU1Q4WE9lcWJYOVVOWTFlb2MwSnI0WUhnRlMyaUQ1UjJ0Y2tN?=
 =?utf-8?B?aXdhM2pKemhtSG9lWVgwS3NYbVJhMXA1N2pEV3pWUUw3a0ZiV2luQVdTdUQ3?=
 =?utf-8?B?eDFxUldvdWIyMm9XQTlWT3NKWDVXbUVlSGdYZDZSRGE0RzBCakJpNlNYRERo?=
 =?utf-8?B?REQxOURuV29PM3VxTWlTS0luTmg2bTJjNXNrR2QwNk15MU5kNnQzNEtXSGFo?=
 =?utf-8?B?ODUvZy94STI2MzVLWFl4bUVRTlZKVEJUMXh0M2QxMnJqMW40Mk9MN1JVVVo1?=
 =?utf-8?B?VE45T2RTaWJjRWJPYUhySnBzRnZBM2N2S08ydGQ0MmNET3l5MFNyTktJNGV6?=
 =?utf-8?B?LzU0TU96VVdGSFA2YkxCS1RpdTFkdktEaDNkWWhMM0tEZ0pjMFJ5UGwwRkho?=
 =?utf-8?B?cFhYS0FNTjNkUTZ5bVpNSGRmS24zT0UzdTVHYmZZVmh3R05NU0R4WnFmSlVh?=
 =?utf-8?B?UHJWWjBzQVhjQVhvaUpaOGtLMDZITktWd2VGcFR3SGZkYkNLY3FvS2l5bGlj?=
 =?utf-8?B?aFk0YjBmSnhTcEp1a05SdTZKeCsvZUt3UmlUeEFmYnozWis4b1I5QmVsaHZK?=
 =?utf-8?B?c1pqWDV0MTF2TUJyb1AzVU5sb2FrUnVJdEk4enkyQURXOTdLSnJGTlV3c3hI?=
 =?utf-8?B?a1pkRC9yK3lLL3hWdEZKOVB5ZVZiblgydk9JQWpqMVhudG40L0JQTU1kbklP?=
 =?utf-8?B?OGdWRVg1WVQ5TDJqQXZnZUtnNWxTRHBNRFBPelF4OENjSUIweTAyV2F3ZGFt?=
 =?utf-8?B?VzNWYzVGRnNGMFNGTk41M1hRUGJBekNkeU4yODdkVlArRVRkekZTVkY1dTJp?=
 =?utf-8?B?ZmE5alh1ZzdtbkJKZmdJYTBDaTV1QzFlMEQra2Urb3lpZGRMT054c1RRNzgx?=
 =?utf-8?B?OEQyclJQWWJvekZMMjdJNzJ6R0QzWHpOYzRWOVZ6Y3QyWG95cDhyeDhjampE?=
 =?utf-8?B?M2lMaFpLMUsvZmlMR1BNc1VCRkVRSFFFby95a2RhWWcvcEhrWEJwTzg2S3h4?=
 =?utf-8?B?Skl0Q0FHRFBkd05CZkNYMXhRcGJmZlRoZ0RVNHNGTUh4blI0R2xCbTFKSmNS?=
 =?utf-8?B?L2xGK2xJU0p3NjNjZTdycGMrbnNlSmVXNWdGZ1d2L1FSczM3YlJXaE5MakFn?=
 =?utf-8?B?U01zQ1BCUDY2VkJDV3JRVlJ5UGRBdUNIZGRBdzFyT3ZNOTdNS3dscWtvV2Zz?=
 =?utf-8?B?S0VUVVVFbFdGaTNBVG1RSWhlcVFlSFpEMklHdmNFTnpocjA4TFJpV2hlci9v?=
 =?utf-8?B?UEN2dld1eHV2anZaWjJkV1NvYnpsaUJOd212WFAxTG03UG5lbUZVMDBMdzVR?=
 =?utf-8?B?Wm9nV3l6S3JhbnBKTFZXRUhNYkZUcTZNZm4zWVJLbndKSElVcVZVQ0ZxNHZ5?=
 =?utf-8?Q?n8WQvaP6rQo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dSs1WWxPQ1F6MjVCd0FzYUE3Yk8yMEI1YTBWeGhjNXZsT0RHN0tnN1ZkKzBu?=
 =?utf-8?B?Y0xGNFNHVXpTajVpblNEcXE0RVJKdHo0T3FDcUt2dEVjd1FUaDU0d3BvL21Y?=
 =?utf-8?B?STY1OEFWUmpYZ01qSTdBeTd1TlV6ME1Ia1YzU1Y1U2hNV1FwNkdWL1M5Rk1V?=
 =?utf-8?B?eXNhdTEzckVEN05aeHBlTjFCZG5YeTZCRDQ5RU5HUUtFS1QxK05zWlZLanFP?=
 =?utf-8?B?bXBmMXg5bnp2U3hiNnhzOFI5N1FwVHRiQ2htUS9GYkc0RjJqZXd2RitoVE9i?=
 =?utf-8?B?Z1NuUm1hdkZxYzhHSWlnS3lSUUZ2MXhTaDE2VzFxNk5oSS9kaUdjVWRPMElv?=
 =?utf-8?B?cEhlcHVFOTRBdjRibWhHVGFWYVZEaWk2bFZjbG5XQmd1Ly9nRnhWK2dWTjho?=
 =?utf-8?B?T29ZY0VmZUlGQ3BqVml6YkI4OG4yTE02SlVTS2toMUgwczMrUWd2c0RUWWg3?=
 =?utf-8?B?VnZXRExsQk05WDFNRGtBT2cxVFhHWSsxdzhpRFZtRkRmNjcrcWRQNGhrbEVx?=
 =?utf-8?B?RWpJT3BrSjdnNUNRL1o5VUZSYjhlS0tHMndPRXl4OWR4RVd2MG8vVU9CYXMv?=
 =?utf-8?B?OXQ3dkZnV0g3d2NBUHdMeGdYTnJsN1phK0pXYmVjOFF0NFoxcjF1aUw5cks0?=
 =?utf-8?B?THk3MXEyclhNKzF5MWQwQzhrcHV1eXZ5bndCL3NBVFVBQlljTWtVLzA4VXRI?=
 =?utf-8?B?b3hIQmM0dkNMdjlOSWY2QkUyU3RxRjBMNHV2cXIxVnNsY1ZlRzRLc2cyWmFv?=
 =?utf-8?B?MGRxemJ5U0FrbGtiOGZ2ZVZ5WjVPYmJ3aXU3VzU2dDFpbUJxaGNVZHRBbkdz?=
 =?utf-8?B?bkRsTWlBUHB3V0tkU0hvNnY0aS9JWDc1WGdIbk91VGtUQ3dRQ28zZFlZNDlF?=
 =?utf-8?B?enRRZExxVVFWOGRtdC8zTWtIeU1TSTgxbytlUVVnOGd0dXdocnU0S1FhSm9X?=
 =?utf-8?B?RkNWeGZFYU0yWlZIZ01DV3NuTXlrTTFHL3BMbjVpUmVSYnBYMW1CTzBDS3lY?=
 =?utf-8?B?cUJEajhxa0g1ZDVkZFBUcjV6ekdJVjRZTXdpajE0TEpBVmpCaEZKZzNzNGJJ?=
 =?utf-8?B?RTVUaUlQS1FySTRqQUdmMnJwTlFhQUo4aXRmbm1DR3kwdC9LaElka0VhQm1C?=
 =?utf-8?B?Sk1HcGQ5Mk4rb2NETU1mTDlBeENnRWFkUDhobUt0SndHQ3RSN2dTWHdHYnRy?=
 =?utf-8?B?eEg2aUNNdUpzQldzUWhpREVzcXdndVhPZDJPS0FkVGw3cFdyS1FnQlZzWFc2?=
 =?utf-8?B?Rk1EaHpwVmVTRVVTeHVLd0hhdDFGZG5CUVkzcWhBTjRxUzZVSGdPOXdWYWkx?=
 =?utf-8?B?ZGdHN1dJSjl0TDlnM0Rydm1yM2dneStZSUtoZ1k2RHpIL1k5Tk9BNkR3d3U4?=
 =?utf-8?B?SGl4dWdpc2E0NFNaTjByZ1MrNFdOR09kenJtV1Z1NUNtNzYveUhYN3pCdXVn?=
 =?utf-8?B?WUJkbE1aZDFYZDlZVHF6NE16aFpuaC9FSTRoMkFnT0dZQ3ZWbEtCbEVSaXI2?=
 =?utf-8?B?NE9HLy82ZWpVdDJtd1FIaFhOTXRWYkRGdFR3OTNNV2JHdThLNmRvZnhubUlD?=
 =?utf-8?B?WXFGV0dSRmxDNjdnSkZSMHNYY3o1dGR0L1Z5VkUvN2ZaRThWRlVpaWloMUpr?=
 =?utf-8?B?TFhIc2haZE03a05DeWgrQWRyZVRHZmxOSytUNGM1aTdXR3BCdFIxeS9DQnd5?=
 =?utf-8?B?eW12RVI4UlVHNklNZ2VUdlBrbW02U3lSMWNLd3JuSysrRTBKdG1KUmZjaGtR?=
 =?utf-8?B?S1l6UmI2dXJQMzcrSEp1TEdVU1F2SnlwNFRrdmRDa2RyWTNXV0FFeFRraTBR?=
 =?utf-8?B?b08zczBJUHd4cU40Y0xHWVNOd1cxUE5DcER5ZlA5RE4yaklteDUzb0pVZmsx?=
 =?utf-8?B?TlVFbUs1L2d1VFZ1ZTIyb2k4UUNZd01FQmhyQUxOQ09zTVhlRmpaTTZVU3Jv?=
 =?utf-8?B?Q2xRR05TSTVhdWtrMG55TC9xRVlIVUdwRlZBNE96aFRDUVpkWk4zZGlEV3M4?=
 =?utf-8?B?MlBzNE0vMkx2YzFxcU1mMUY0WEw3UGhOQlZVdFpDaTRHc0pQYUZjdis5MzNJ?=
 =?utf-8?B?RGJERjE1MEhEOU5Ca0dKUzhlaFkyUEp1cHdidWVQK0NWVnJWVWZHdnJZa24z?=
 =?utf-8?B?SVhWeXo2LzVlNTVSbzl3ODBQeDRhOUZLNTNWZ2J6R3g3eFgxUlN1MU04Qy9O?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: HUBAYoZdqe0Qv3XiUWXDZo+PKnunD/w6Yvn3mRi8Qj1XxS/qWtbN3t+yS6wCqzfvXqbRSr65gi7vjHmRVsFeU2GCtZ8ETo7kaBxDB3PE8T4nvFrzOfNJZarQbvs7eDYIPMLe0P8CtuNx23Z7o8rYnwTKGr/TWCMqUKnUEUYnI+ZaUtxdQPfMygXPOVFOZhZsX0mEsWnvX7PEZuHEk0wC6Dtb5gNCw7nXyNiUbqRcXRKIHl5z7wfBVGqjNimFg6lTRcdWbNFsfTbNEQv5w1DuXwHdyTamBuOlv5t+mCdY7aK+FL9Dqkes92D7NQkdag3pMit+Cy3fgIBfc9rDq481gp+Z2WfG5S/NrY5d8aD4qEeYJ5W3p2MBMGXI9U46JDBpIuSolpiT083zAFb2vb59LuRNDs25GS1df/WaF1tNTuko1kmB+h+3DzpjYe3SE3Jv/ARY8Oo5YX0p1exIlZ8qg8D+RE+/8ghW/h6CJwwkpkoCWG5su9kfWtMrIKsPXU8qb5vbLHhh/E+bS7yWHB629MFNqjX8sbn7oxnkCEM3m/LYiJf/F/SnJhbRMFju+U88eMP7xBgj/cj47mL5BfZs+wBru6zB7cV/F2hsRzFP4UA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1400c34f-5aac-4b1e-ee99-08dd8d8352ea
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 16:22:12.8965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMbHad7l276Yy/GXISO1yT8v0gR1v2C6y4i51An7tzf2ulmJX4IxFksFqtd2SxR+6+4qnqb2bZJ1DnTxbsR5+6GzPXi2lNjP5WyOa/HvOQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6986
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_05,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505070153
X-Proofpoint-GUID: AGcIvVfEBPaRzN_Ulez-7h9z4RzFC2ws
X-Proofpoint-ORIG-GUID: AGcIvVfEBPaRzN_Ulez-7h9z4RzFC2ws
X-Authority-Analysis: v=2.4 cv=B8G50PtM c=1 sm=1 tr=0 ts=681b88bd b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=iHwBjlyiAAAA:8 a=cm27Pg_UAAAA:8 a=k64a2eEoAupXybcLCi0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uNSKXYNwxGiU6LD0JREI:22 cc=ntf awl=host:13185
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE1NCBTYWx0ZWRfXyNTc3G6973P3 1UbK6q1KymKV9qriwSsaYlQi/6c6Jx6rTsu1RXfoV79QGxPUe6fvCrgcWHONA2EA9eKuc1fACXA oRx7I9DF/Qr0agh26Rh+q+uRrASmLuO9FfIlR9nVOLb2S0UNUbQSlzbbOIvGTzIkr+tu2yOF8a3
 Bzl2yLMFVXYAlRFuhvAnoF5Czi7adWGgiLoYZEYKrF/tGey7/xz3uK9ttB3GFE5OrgyEhtTV6EA 57rNyDVBmT4A7+M2DYH7MUMn+riGxB8oEOiNVx/TInPUTEp5ADsIQmCrOsGPyHUBaJG+lHOrByw l87EgXAtUihugTLdTXVgIB0S7a0YYgV3KE4ZMV1Cyf7azZAgx3KInxw/fJ1nvQfzZFPvdj3lV05
 GvfnlTW7hmF7j8doxA2GFasAFiZwDMaqhAu6eGclgHhNPnoXF/ehDqAQIidaDwKwt4nI3p3h
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_092236_035438_C4708983 
X-CRM114-Status: GOOD (  24.26  )
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

T24gV2VkLCBNYXkgMDcsIDIwMjUgYXQgMDk6MTg6MzFBTSAtMDcwMCwgSmVmZiBYdSB3cm90ZToK
PiBIaSBKaXNoZW5nCj4KPiBJdCBzZWVtcyBtbSBtYWludGFpbmVycyBtaWdodCBwcmVmZXIgYXJj
aCBjaGFuZ2UgcmV2aWV3ZWQgYnkgYXJjaAo+IG1haW50YWluZXIgYW5kIGdvZXMgdG8gYXJjaCB0
cmVlLCBhY2NvcmRpbmcgdG8gZGlzY3Vzc2lvbiBpbiBbMV0sIEkKPiBkb24ndCBoYXZlIGFuIG9w
aW5pb24gb24gdGhpcywgIGFkZGluZyBtbSBtYWludGFpbmVycyBhcyBGWUkuCgpUaGFua3MgSmVm
ZiwgYXBwcmVjaWF0ZSB0aGUgcGluZyEKCkppc2hlbmcgLSB0aGUgbWFpbiBwb2ludCBoZXJlIGlz
IHRvIGVuc3VyZSB0aGF0IHRoZSBhcmNoIGRvZXNuJ3QgcmVseSBpbiBhbnkgd2F5Cm9uLCB3aXRo
aW4gdGhlIGFyY2ggY29kZSBpdHNlbGYsIHJlbG9jYXRpbmcgYW55IG9mIHRoZXNlIG1hcHBpbmdz
LiBJdCdzIHByZXR0eQplYXN5IHRvIGV5ZWJhbGwgaXQgYW5kIGdldCBhIHNlbnNlLgoKQmVjYXVz
ZSBpZiB0aGlzIGlzIHRoZSBjYXNlLCB0aGUgYXJjaCB3aWxsIGJlIGJyb2tlbiBieSB0aGlzIGNo
YW5nZSBzaG91bGQgYQp1c2VyIGVuYWJsZSBpdCwgYW5kIG9idmlvdXNseSB3ZSdkIHJhdGhlciBh
dm9pZCB0aGF0ISA6KQoKSXQncyByZWFsbHkgbGlrZWx5IHRoYXQgeW91J3JlIGZpbmUsIGFzIGl0
J2QgYmUgdW51c3VhbCBmb3IgYW4gYXJjaCB0byBkbyB0aGlzLApidXQgSSBzdHJvbmdseSBzdWdn
ZXN0IHlvdSBkbyBzby4KCkFuZCB5ZXMsIEkgdGhpbmsgdGhlc2Ugc2hvdWxkIHJlYWxseSBnbyB0
aHJvdWdoIGFyY2ggdHJlZXMgYXMgZXhwbGljaXRseSBhcmNoCmNvZGUuCgpUaGFua3MsIExvcmVu
em8KCj4KPiBPbiBTYXQsIEFwciAyNiwgMjAyNSBhdCA3OjE24oCvQU0gSmlzaGVuZyBaaGFuZyA8
anN6aGFuZ0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBQcm92aWRlIHN1cHBvcnQgZm9yIENP
TkZJR19NU0VBTF9TWVNURU1fTUFQUElOR1MgZm9yIFJWNjQsIGNvdmVyaW5nIHRoZQo+ID4gdmRz
bywgdnZhci4KPiA+Cj4gPiBQYXNzZWQgc3lzbWFwX2lzX3NlYWxlZCBhbmQgbXNlYWxfdGVzdCBz
ZWxmIHRlc3RzLgo+ID4gUGFzc2VkIGJvb3RpbmcgYSBidWlsZHJvb3Qgcm9vdGZzIGltYWdlIGFu
ZCBhIGNsaSBkZWJpYW4gcm9vdGZzIGltYWdlLgo+ID4KPiBtbSBtYWludGFpbmVycyBsaWtlIHRv
IGdldCBjb25maXJtYXRpb24gdGhhdCB0aGUgYXJjaCBkb2Vzbid0IHJlbHkgb24KPiByZW1hcHBp
bmcgdGhlIFZEU08sIFZWQVIsIG9yIGFueSBvdGhlciBzcGVjaWFsIG1hcHBpbmdzLCBzZWUKPiBk
aXNjdXNzaW9uIGluIFsyXQo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKaXNoZW5nIFpoYW5nIDxqc3po
YW5nQGtlcm5lbC5vcmc+Cj4gPiBDYzogSmVmZiBYdSA8amVmZnh1QGNocm9taXVtLm9yZz4KPiA+
IC0tLQo+ID4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICB8IDEgKwo+ID4gIGFyY2gvcmlzY3Yv
a2VybmVsL3Zkc28uYyB8IDIgKy0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+Cj4gUGxlYXNlIGNvbnNpZGVyIHVwZGF0aW5nIGRvY3VtZW50IGFz
IHBhcnQgb2YgeW91ciBwYXRjaDoKPiBmZWF0dXJlcy9jb3JlL21zZWFsX3N5c19tYXBwaW5ncy9h
cmNoLXN1cHBvcnQudHh0Cj4gRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL21zZWFsLnJzdAo+
Cj4gU2FtcGxlIGNoYW5nZSBpbiBbM10KPgo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+IGluZGV4IGJiZWM4N2I3OTMwOS4uM2Ni
MGIwNWVlZjYyIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiArKysgYi9h
cmNoL3Jpc2N2L0tjb25maWcKPiA+IEBAIC03MCw2ICs3MCw3IEBAIGNvbmZpZyBSSVNDVgo+ID4g
ICAgICAgICAjIExMRCA+PSAxNDogaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0
L2lzc3Vlcy81MDUwNQo+ID4gICAgICAgICBzZWxlY3QgQVJDSF9TVVBQT1JUU19MVE9fQ0xBTkcg
aWYgTExEX1ZFUlNJT04gPj0gMTQwMDAwCj4gPiAgICAgICAgIHNlbGVjdCBBUkNIX1NVUFBPUlRT
X0xUT19DTEFOR19USElOIGlmIExMRF9WRVJTSU9OID49IDE0MDAwMAo+ID4gKyAgICAgICBzZWxl
Y3QgQVJDSF9TVVBQT1JUU19NU0VBTF9TWVNURU1fTUFQUElOR1MgaWYgNjRCSVQgJiYgTU1VCj4g
VGhlICJpZiA2NEJJVCAmJiBNTVUiIGFyZSBub3QgbmVlZGVkIGhlcmUuCj4KPiBNTVUgaXMgbm90
IGNoZWNrZWQgYnkgTVNFQUxfU1lTVEVNX01BUFBJTkdTLCB3aGljaCB3ZSBzaG91bGQsICB0aGlz
Cj4gY2FuIGdvIHRvIHNlY3VyaXR5L0tjb25maWcgc2VwYXJhdGVseS4gSWYgeW91J2QgbGlrZSwg
cGxlYXNlIHN1Ym1pdCBhCj4gZml4IHRvIG1tIHRyZWUgZGlyZWN0bHkuCj4KPiBbMV0gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzdFQjA4N0I3MkM0RkJERDMrMjAyNTA0MTcxMzI0MTAuNDA0
MDQzLTEtd2FuZ3l1bGlAdW5pb250ZWNoLmNvbS8sCj4gWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8zZGU1NTlkNi1iZTE5LTQ0YmMtYmE4Zi00YzUyZDRiY2E2ODRAbHVjaWZlci5sb2Nh
bC8KPiBbM10gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzY0OEFCMzAzMUI1NjE4QzArMjAy
NTA0MTUxNTM5MDMuNTcwNjYyLTEtd2FuZ3l1bGlAdW5pb250ZWNoLmNvbS8KPgo+IFRoYW5rcwo+
IC1KZWZmCj4KPiA+ICAgICAgICAgc2VsZWN0IEFSQ0hfU1VQUE9SVFNfUEFHRV9UQUJMRV9DSEVD
SyBpZiBNTVUKPiA+ICAgICAgICAgc2VsZWN0IEFSQ0hfU1VQUE9SVFNfUEVSX1ZNQV9MT0NLIGlm
IE1NVQo+ID4gICAgICAgICBzZWxlY3QgQVJDSF9TVVBQT1JUU19SVAo+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL3Zkc28uYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28uYwo+ID4g
aW5kZXggY2MyODk1ZDFmYmMyLi4zYThlMDM4YjEwYTIgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC92ZHNvLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28uYwo+ID4g
QEAgLTEzNiw3ICsxMzYsNyBAQCBzdGF0aWMgaW50IF9fc2V0dXBfYWRkaXRpb25hbF9wYWdlcyhz
dHJ1Y3QgbW1fc3RydWN0ICptbSwKPiA+Cj4gPiAgICAgICAgIHJldCA9Cj4gPiAgICAgICAgICAg
IF9pbnN0YWxsX3NwZWNpYWxfbWFwcGluZyhtbSwgdmRzb19iYXNlLCB2ZHNvX3RleHRfbGVuLAo+
ID4gLSAgICAgICAgICAgICAgIChWTV9SRUFEIHwgVk1fRVhFQyB8IFZNX01BWVJFQUQgfCBWTV9N
QVlXUklURSB8IFZNX01BWUVYRUMpLAo+ID4gKyAgICAgICAgICAgICAgIChWTV9SRUFEIHwgVk1f
RVhFQyB8IFZNX01BWVJFQUQgfCBWTV9NQVlXUklURSB8IFZNX01BWUVYRUMgfCBWTV9TRUFMRURf
U1lTTUFQKSwKPiA+ICAgICAgICAgICAgICAgICB2ZHNvX2luZm8tPmNtKTsKPiA+Cj4gPiAgICAg
ICAgIGlmIChJU19FUlIocmV0KSkKPiA+IC0tCj4gPiAyLjQ3LjIKPiA+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
