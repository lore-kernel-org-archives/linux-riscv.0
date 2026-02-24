Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4030FF357D5
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 17:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jycDfZ2I2WoPeiYE3qMGAFg6ZubF5yib8wQYbxGrHmk=; b=LYDoUzSimYOtzA
	GTE787Xdt10FJ0Gi/T4FBx3+eJ7bYA4+90E3JvvSwlbM6rzDccwZBELlJUoMYlck6tytNFWnKLjPf
	s/DZFBNw1UEIMn97s22Xq9CpfihvybOb+XoM5pXYuxreNRATmbG53wpbx2MYTJzv0oWS9gPltGIzw
	uy3dLajvdaWvsq3F0WkzI2cUcnosyFi8EqqGJNJ1nZ7gJHBbG5epgeZtPj3ZSQik740ytIwp9Iuxy
	WoxMocx59t31q7U/xKGUTyFpTSB5VU6Tv7HlH3QO6XWTQIppH+ETCNl9JwUSPQ/1fsRSuzRUn96f7
	ArNnZ3QVxfBLniElTQag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuvzg-00000002SB8-3GUz;
	Tue, 24 Feb 2026 17:14:44 +0000
Received: from mail-eastusazon11011040.outbound.protection.outlook.com ([52.101.52.40] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuvzf-00000002SAX-0OLQ
	for linux-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 17:14:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbXf81yhKSIf4+gAL7u/QwA/54S9SusYItETWbeyfLGTVKZuloHf81lns4FOEsDmB+UbX4nYrk2cYsrGEpoPXWtsDWr+RJXixrkBKqL3ApTkCKg57/F7bQ7LTQdn2+eszIqFtgsTjftmJvxQTM26AAl0nBCzbk+wLuSZzbYN3NdvnCgGz9c/emB5J/UFASVuSZ9DMmfQrT0F+MrxEEJi8f5wsxb/nsOozd+d2s690wO3PgRj+OHyVRnfYJUZPrvJv13FIWWyzi4xd7QEqmZZzHKVfaxfOFApkHLVl74dR0Ckoc4zxtoG2NQwaQbygbEn/rcLcvQT6uK/SkMYn3HytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+57v9Rn+lwqivMYwjWLh+tpOKOe7LRj4R3wcxKulock=;
 b=gjtzojsZjZIuF75JmFut7gAfqeppobCMcPnxm5VSlFhDgZlyC3kNnsTA58EGoG4fXSr94jQSOHo1hszhcXGfvwgb1Y103PbE5FGivOJRaCeopR6+QJwvdOQDHBJMvLhSufCAJnGhZl/gPoNiGGTfqKN4UKyAT3lW1jRmL5Cz4OpIE0kot9CoaQQVAdJEyInADVKnIsoiuYGX3DRVL4P4Qg5utvs96t0w2P2CiGcf5IuNQSBlfkDtVGFj+cv7Fi1jboxJ1JTjMR0q9zOgwVrFSejqng3wnZtHJDmGgU5/PaYWaeEfW/X7KgAwKZaqorXtmxVEvrVirEMVr9j5NUOfAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+57v9Rn+lwqivMYwjWLh+tpOKOe7LRj4R3wcxKulock=;
 b=ReVWd5RfsPjIeRzUoUdEK6iSM+rrIjo2DrGendpdBu53+6Cl2qoQFHfxfNVpEcEES8qgtGxTs+M0a2cfBk0pUdLhFPmToI7yeXutAukRAGWmBRVAoS98ndg84IsRL/83U6t9PJKgwVXpLCtnAGImqws/7FTB8DXtzxxNFr0Z2yrvZHJj68LoDIWyJtjsFmKMHz4q9ziZwsiOUzIBHwxB8VvLWfZDT0iZOwvswiMr3uv/aUdwD/otrk0HxjVj/p74nswAKrW7bA3L4k7IBMGYD+RybJXriDdMFF/EQ1D++/bAGp01oLxNl8fR/Q25qjZSc9NcGyDBQ1LU+Wh2gOSBxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ2PR12MB8009.namprd12.prod.outlook.com (2603:10b6:a03:4c7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 17:14:36 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 17:14:36 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <davidhildenbrand@mailbox.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Ron Economos <re@w6rz.net>,
 wangkefeng.wang@huawei.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, jackmanb@google.com, jane.chu@oracle.com,
 hannes@cmpxchg.org, willy@infradead.org, muchun.song@linux.dev,
 osalvador@suse.de, sidhartha.kumar@oracle.com, vbabka@suse.cz,
 claudiu.beznea.uj@bp.renesas.com, Mark Brown <broonie@kernel.org>,
 akpm@linux-foundation.org, pjw@kernel.org
Subject: Re: mm: Regression with v7.0-rc1 on RISC-V
Date: Tue, 24 Feb 2026 12:14:28 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <78D36EC1-2596-448A-A939-0A1AC7B3D1BC@nvidia.com>
In-Reply-To: <1966378802.577797.1771952827516@app.mailbox.org>
References: <1b17c38f-30d3-4bb4-a7e1-e74b19ada885@w6rz.net>
 <13b8d60d-1209-4650-9fa5-982381c53512@kernel.org>
 <1966378802.577797.1771952827516@app.mailbox.org>
X-ClientProxiedBy: BY3PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::30) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ2PR12MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: 950b0a8e-68eb-431d-8a96-08de73c82f95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b01jemV2QlZ5RCtZRkFXdEJkZWpIM2k5ckdCSkUzT211MDZsanVwVm05NHFv?=
 =?utf-8?B?MjAyZjRBc3BtclN6ZXRzUkxNUmtoNTFXK25xNjg5MzdZTktlYVN2V3lpeXIz?=
 =?utf-8?B?b1VXRWE4YzcrNnI0UCtEaE9ncjdtUGpyNnRkK1VVLzRoSDUwMjk5blRFbVdD?=
 =?utf-8?B?aTl1aXY1M1hzZGlwRmVzTi96bk1YS2dRbXI2OGdQaEVJb0F0bmQzTE5SeWFS?=
 =?utf-8?B?dzREc1IvY2Y2ZWF4OFdkSWVBdnVQUDk5NEtPWFpzV1lydjZ4U3kvT2N3c1My?=
 =?utf-8?B?NkowYUR6NmV4K29GZzRyQVJLWDVCZWpkNXE5SEJ2RXZIU0NCYWNhcXVtTzdY?=
 =?utf-8?B?TmRCdVA3QjBjYXhXWExQNlFSZkJBelFoWGhSS1I1YVBKcm1FWEVOM2tvQzAv?=
 =?utf-8?B?Q1RBblRGK2xBdFFBQi9zZE5JL21XNDVCdXhVZHE1cm11RXhqSVJjUTZUSFNm?=
 =?utf-8?B?WFVYL0tkdjV3azNDaUtxRXBZK1YwUDBtTkl0Kzk2YU9OdTAxNjVpbmtEZmhS?=
 =?utf-8?B?MjZGeVNtUUNRS2crMCtiM0xZdlQzTUlkRk5uelVEc2VZbFkvZXdHVkZCU09H?=
 =?utf-8?B?THhZNzRHSnhzSHY1UGswR1dvOEpOZ2I5WEZxNnA2ZnRFekhVZWlWVFZGNlpX?=
 =?utf-8?B?cmF4NUMrbkZFejZRTVh3YmorazVlbkxsZWF6ZE5hUHd1d0c1RWxKejZ4bEN2?=
 =?utf-8?B?ZWQxSTJxaGpZQXZRS3o5OGZ4bk15VnFBdzZDYVNZRmhxc24yNWpkN3ZydHJF?=
 =?utf-8?B?cm5weUhGdXVMSk1OVkJlRjFTMHo1Z3huMVZJNUx6WDg1TXdOc2YydU5RWENZ?=
 =?utf-8?B?UmVpY0k5dUFOQWJtNHlhbnRGWWZzUjIvOUx6RDcySDExbmNPYzVqcjBZSytJ?=
 =?utf-8?B?emhFcFAzMHZQWlNRbFhqdG1Ua2FRZ2ZLanB3WFB1cHc1djh3enoxb3hRTk1E?=
 =?utf-8?B?RHhTQThiVmFRN3d5T0hWcThYK3RBQ0d3Y05CTy9iSXR1ZkVwbTlmNTE0K0p3?=
 =?utf-8?B?Z0xGakJ2d2NQUDFpV0YweWY3YU1tUEtBYlhMVGtlMUpkTHFrSHg5SHY5UlpI?=
 =?utf-8?B?NkZnSGtGTStPMm1NTjBtc1VwT1ZCaDk5N0lYVVNWU29VTjlMTjB4Zkk3WFoz?=
 =?utf-8?B?aWlpWHZzOXpKUnJZVytiUGZFOGRzUzM1VXRFK0dKZEhJdTgwNTJOeXM3T29l?=
 =?utf-8?B?OWNqakh5WERLdDFOMnV2bnhvN25tUmhkcDh1elArbGxtV29kdTgvQXVIV3ZR?=
 =?utf-8?B?STExUGJ3YnVpdW5uMWptRHlROFFMQkd1SmdNWS8xdUJLQ1ljMnJTVzI0eENr?=
 =?utf-8?B?NU1wWG5ZYm84anBLc1dhK2l3RUtxOTI0ek9jL0dRZHJ0dlpoeUtaUWRFQkpj?=
 =?utf-8?B?elFrLzgycnRpUmdRVHZTUmRSOWdpZHA2eHlyNTNUTzlMd1lOTFdVUDIrWk5Z?=
 =?utf-8?B?WG1Ha29EMDJCdlF4SkM4YVR6MU1GM1crU05rcFNFb2d4bnpDM0VJSGdjZ2hH?=
 =?utf-8?B?UmJhLzUwbDk2ZkJQZHIxYmFOOWR0RWVFbFpKZ280OUxFRnNuUlRXRHlTLzl5?=
 =?utf-8?B?QlRKVkgvUkkrU3IvWXpMTitscEdlaWg0MFduL01oaXhiUmNjdlhUdGlxWTdM?=
 =?utf-8?B?UmcrS2trV0ppQ2x6NHJocTlUQU4xQ1ZVbHIzckMvZVVlVWNPbTRYTlNXVkwr?=
 =?utf-8?B?aFQrc0Vta1FhWlVxL1Jmd3B3d1R5SkRJMU9wZmx0QWdnb0lueDVXUUp4RGdS?=
 =?utf-8?B?UzhUcDZRZkw0dTZhNkE3WTlXbHIzRGtxWXl2K0Q3SUdMUGY0MlNUU2R4d0Z4?=
 =?utf-8?B?UjRDQ0hXYktmYWYyTXBqMXFTNURFUC9SWWlLZGNpbnBrU3N4U0pnZzl6L29x?=
 =?utf-8?B?QnlHZXoyV2RaajljQWpqZEVIdUljRnZRc2tSVllITjdnU1FnZ20wS2VYVXFR?=
 =?utf-8?B?L2o0YWdGb1dRVzE3d0wwaWJRTUh2MzZxamV6YWxFVy91Mi83YmRoKzlWUklH?=
 =?utf-8?B?QllCdjVmaE94dTRIZFM1TmFrZjlFc1RKNXNJUzBpN2FIRjhJRHhGRnpDMkJV?=
 =?utf-8?B?SzlETWdWaVh5TE5qUEIrVlBFSEJNeG5wUjkyRnBiZWJ5NmtWWUdzalhRVy8x?=
 =?utf-8?Q?nqUc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDEvdUZRYWJuc1F6TkJ5V1VVbzFLb0h4ajNQZ2M3YlFqWk9IQkovcnVZNE13?=
 =?utf-8?B?V0s0U1dkV21BRmNqSHZ6TnhDS2hraEY2QlBLZU9FYlU2dkFWbHpCQXhYbTh6?=
 =?utf-8?B?dW5uTU1YQlRjb0NlTDVQWU10YjFVT1pLWUxjMVYyVkZnNTBlN2hvTTdkeDZt?=
 =?utf-8?B?d0tIRm0yWXNxMzR6eHlVSG1zSjMvK0Uza2VFV0ZFdU84S2JJVm5wc0dQVEFN?=
 =?utf-8?B?eHlHaDJ6eFF4a05TMzdPejE5Q2tzNWFYNCt6ZHpWbjdCeTVreGpJeFUzQWxs?=
 =?utf-8?B?V1ZKSEFMVWN4bWJ2K3dhbkIreDZ6V2wzNEorMUtqWDNScjRzdG80bGhMZ0No?=
 =?utf-8?B?MXhobjNsRmdqbkJFRG1JMEhJRTJTa212dk1LbDhudDhmU2srdG5FaHNtZWQw?=
 =?utf-8?B?TFVwRStNWTZ3TzRZU0hUMFd1eGEzaWRLd0wxZXFOWGZXdHQyOUhuSkZFVjhY?=
 =?utf-8?B?S0V3OGNSU0VMU0h0VS9xYzhhNExucWtSZXVoZ0V1Z2xvcU5pK0FZMjR5MG1z?=
 =?utf-8?B?ZUVkQklydGxzSjJyN3ZubDU3LzFkaWM3QllkZHdPUm1XQWtMWnhDRDA1Uk91?=
 =?utf-8?B?M0JQL1UrWFlkUUMvbUpkQmtOK3p6djJHNVArYitLTkhjUmpnRENaV20xbksr?=
 =?utf-8?B?RU4vRzVlNUNDRlRXNWIzd3B5UFFFMFN0U3JCcFlBNFBTbUFMK0d3WFV5Q0c2?=
 =?utf-8?B?UGtkaHB6ckR6S2xNMFUrU0VtdjArRUVWcTNSMklYdWNySnlXbDg0V2tlSVRG?=
 =?utf-8?B?SjcvQ2FJcUxHYmNpNFZzbVdPbzlvcVY4L2hJYkdqU3VPQ1ZZNXQ4NGZwUW1F?=
 =?utf-8?B?cWNaSEw4TjdOa3RsUzdMd0I4TmpGN2d1WDlhOUhVd0x4Mmd6dVRGaWdTZlBj?=
 =?utf-8?B?a28rN1hLdE5LTXlEUlk2L24ycGZnKzBmbExtTEVpUlVoRG5ublFjOERveUpL?=
 =?utf-8?B?NEdld3NOcWdGZVc2ejlkd054RDRGQWd6TU9EckF3clUwcXFkNkdibHFtS01K?=
 =?utf-8?B?MzFIQmtMUVZHckxUZFFSbmdOeWwweUczcFVWZjU2dGRScmMrMWJjV0FBTVVO?=
 =?utf-8?B?OTNZY0k5b2FJVGRnbExvUW9qUTQ4R0t6Vm5kV0EvMVBpLzREN3JkS2Z1SUNH?=
 =?utf-8?B?M1FFbjEveW9MVjBuUDBpbGRrVnpaLzBqOEtNbCtsUXZpOVB1dFduT1JzVzRv?=
 =?utf-8?B?dkFXQjIxdFluYm1pUmZzUkN1YTRTOXpqaG12TWM4VVV3VTc0emFSYnErbXRw?=
 =?utf-8?B?TkQydEI0YjFOREo2SzhOZXBzUDhiWEJzeVYxd1RhTHU5cWZzMEtUOE90d2tn?=
 =?utf-8?B?UzlZM0toYXhTbHFmR0FUdWR0YVkxQjVKWGY0a0FvTEhqTTI0OEFaWDJ1c2cr?=
 =?utf-8?B?MHVrUGJmWEEydllLeXMyRWFIa09lVnV4MGo0YXcxZTB5bjJKTTdiNzNDWGZl?=
 =?utf-8?B?T2tvVU9Xb2FOQVRZTmErdUwvRCtiaGZQSkhLSUNsRTRzbzBqQW9UUDF6a29N?=
 =?utf-8?B?T1l5ZTlhSjg0Z05CVkNsWXRjRWRRYkkvSmpJeWovR0tsa2gxRk8zVDd2MEFr?=
 =?utf-8?B?TEN3cGpMREtINkdCTExhZksvaGdNUjh2dlZqUlpzZkoxUlBRT1doMU1KZTAr?=
 =?utf-8?B?Q2R0a1BGV2hpdU9mbUJueWloelgxTUticXllaFBWQzlnY3YvVWlJaTd1M2Js?=
 =?utf-8?B?ZlNYTDZTZWE3TkdVcjd6L0V0QlJyUkRjQ3J6SlB6bWlYWFUrNG1uejFlVFJH?=
 =?utf-8?B?VmgzZ0JNYjQrSDBXWG9LSHhoSnpOZlZ3TjA1Vjg3cTRQVTFGL1N4bExza2Vr?=
 =?utf-8?B?VWRBcDQ3ejFrUUJ1VFdTT3g2SmZ4akdiYjFVRmtwaFRjOTZ1Z0pwVlRrNzlS?=
 =?utf-8?B?bWRqemVIYVYzNUswUmxDWXFETTBFWFBrb2RoMXFsKzBrZ1I5eVJtVzZrVWlX?=
 =?utf-8?B?a3d1d0Y0M09FSTBBZlZCQm1mRDRKYWE5c3dYeThXWkNBN0RRNVlzcTRDN3dC?=
 =?utf-8?B?TE42Q1RPMjc5Y0Ira05KN2RCdGgrKzVzZFREWTZDdUlCVmU3Smt5ejRMU20r?=
 =?utf-8?B?dmluZlBQSndyQ29EUmdLU1VqSXlrTjh6aXhwSTFjbU5nTEdGcUVIRnpzdXI5?=
 =?utf-8?B?WEpyYk5MaGRESFRkcnBqdWFQMis2a1hzMmVrQVJ5MXBJK0ZCYTI5L2U1c3R1?=
 =?utf-8?B?aDdlN2ZMbkFlalIyblFIMGErOCszYm5PNUtJM1hoQ1h3TXhZeHNZZzFnUi94?=
 =?utf-8?B?M2ZIdlYzMVhvaEI2RkJXRWdFSmNJNnpCMjFJS3hnVGZCcm96VjBsM3lVeHlm?=
 =?utf-8?Q?grIKtY9whNV8bYzcIY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 950b0a8e-68eb-431d-8a96-08de73c82f95
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 17:14:36.3888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmoEOzW+6wf8FE2nw15sq6Kq0utEyGcrIqTQzmA9nu3HjMi2V2RJgF+STrXiaZu6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_091443_130501_37ED03B5 
X-CRM114-Status: UNSURE (   8.83  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjQgRmViIDIwMjYsIGF0IDEyOjA3LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKCj4+IERh
dmlkIEhpbGRlbmJyYW5kIChBcm0pIDxkYXZpZEBrZXJuZWwub3JnPiBoYXQgYW0gMjQuMDIuMjAy
NiAxMjowMCBDRVQgZ2VzY2hyaWViZW46Cj4+Cj4+Cj4+Cj4+Cj4+Cj4+IE9uIDIvMjQvMjYgMDk6
MzcsIFJvbiBFY29ub21vcyB3cm90ZToKPj4KPj4+IEknbSBnZXR0aW5nIGEgQlVHIGR1bXAgZHVy
aW5nIHNodXRkb3duIHdpdGggTGludXggdjcuMC1yYzEgb24gUklTQy1WLgo+Pj4KPj4+Cj4+Pgo+
Pj4gWyAgT0sgIF0gUmVhY2hlZCB0YXJnZXQgc2h1dGRvd24udGFyZ2V0IC0gU3lzdGVtIFNodXRk
b3duLgo+Pj4KPj4+IFsgIE9LICBdIFJlYWNoZWQgdGFyZ2V0IGZpbmFsLnRhcmdldCAtIExhdGUg
U2h1dGRvd24gU2VydmljZXMuCj4+Pgo+Pj4gWyAgT0sgIF0gRmluaXNoZWQgc3lzdGVtZC1yZWJv
b3Quc2VydmljZSAtIFN5c3RlbSBSZWJvb3QuCj4+Pgo+Pj4gWyAgT0sgIF0gUmVhY2hlZCB0YXJn
ZXQgcmVib290LnRhcmdldCAtIFN5c3RlbSBSZWJvb3QuCj4+Pgo+Pj4gWyAgMTczLjk4NTI0OV0g
QlVHOiBCYWQgcGFnZSBzdGF0ZSBpbiBwcm9jZXNzIHNodXRkb3duICBwZm46Zjg4NTAKPj4+Cj4+
PiBbICAxNzMuOTg1MzExXSBwYWdlOiByZWZjb3VudDoxIG1hcGNvdW50OjAgbWFwcGluZzowMDAw
MDAwMDAwMDAwMDAwCj4+Pgo+Pj4gaW5kZXg6MHgwIHBmbjoweGY4ODUwCj4+Pgo+Pj4gWyAgMTcz
Ljk4NTMzNl0gZmxhZ3M6IDB4ZmZmZjgwMDAwMDAwMDAwKG5vZGU9MHx6b25lPTB8Cj4+Pgo+Pj4g
bGFzdGNwdXBpZD0weDFmZmZmKSBDTUEKPj4+Cj4+PiBbICAxNzMuOTg1MzY1XSByYXc6IDBmZmZm
ODAwMDAwMDAwMDAgZmZmZmZmYzUwMWUyMTQ0OCBmZmZmZmZjNjAwZjJhZTg4Cj4+Pgo+Pj4gMDAw
MDAwMDAwMDAwMDAwMAo+Pj4KPj4+IFsgIDE3My45ODUzODZdIHJhdzogMDAwMDAwMDAwMDAwMDAw
MCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAxZmZmZmZmZmYKPj4+Cj4+PiAwMDAwMDAwMDAwMDAw
MDAwCj4+Pgo+Pj4gWyAgMTczLjk4NTQwM10gcGFnZSBkdW1wZWQgYmVjYXVzZTogbm9uemVybyBf
cmVmY291bnQKPj4KPj4gU28sIHdlJ3JlIGZyZWVpbmcgc29tZXRoaW5nIGZyb20gQ01BIGluIGNt
YV9yZWxlYXNlKCkuCj4+Cj4+Cj4+Cj4+IEluIGNtYV9yZWxlYXNlKCkgd2UgaXRlcmF0ZSBhbGwg
cGFnZXMgdG8gZGVjcmVtZW50IHRoZWlyIHJlZmNvdW50Cj4+Cj4+Cj4+Cj4+IFZNX1dBUk5fT04o
IXB1dF9wYWdlX3Rlc3R6ZXJvKHBmbl90b19wYWdlKHBmbikpKTsKPj4KPj4KPj4KPj4gSSB3b3Vs
ZCBleHBlY3QgdGhhdCB0aGlzIHdvdWxkIGZpcmUgYWxyZWFkeSBpZiB0aGVyZSBpcyBzdGlsbCBh
IHBhZ2UKPj4KPj4gcmVmZXJlbmNlZC4KPj4KPj4KPj4KPj4gQXJlIHlvdSBydW5uaW5nIHdpdGgg
Q09ORklHX0RFQlVHX1ZNPXkgPwo+Pgo+Pgo+Pgo+Pgo+Pgo+PiAtLQo+Pgo+PiBDaGVlcnMsCj4+
Cj4+Cj4+Cj4+IERhdmlkCj4KPiBUaGlua2luZyBhZ2FpbiB3aXRob3V0IG15IGNvbXB1dGVyIGF0
IGhhbmQg4oCmIGlzbuKAmHQgdGhlIGNhbGwgY29tcGxldGVseSBvcHRpbWl6ZWQgb3V0IHdpdGhv
dXQgQ09ORklHX0RFQlVHX1ZNPwo+Cj4KPgo+IEF0IGxlYXN0IHRoYXTigJlzIHdoYXQgSSByZW1l
bWJlci4KClJpZ2h0LiBXaXRob3V0IENPTkZJR19ERUJVR19WTT15LCBWTV9XQVJOX09OKCFwdXRf
cGFnZV90ZXN0emVybyhwZm5fdG9fcGFnZShwZm4pKSkKYW5kIGlzX2NoZWNrX3BhZ2VzX2VuYWJs
ZWQoKSwgd2hpY2ggbGVhZHMgdG8gZnJlZV9wYWdlX2lzX2JhZCgp4oCZcwrigJxwYWdlIGR1bXBl
ZCBiZWNhdXNlOiBub256ZXJvIF9yZWZjb3VudOKAnSwgYXJlIGRpc2FibGVkLgoKSXQgc2VlbXMg
dG8gbWUgdGhhdCBzb21lb25lIGVsc2UgYnVtcCB0aGUgcGFnZSByZWZjb3VudCBiZXR3ZWVuClZN
X1dBUk5fT04oIXB1dF9wYWdlX3Rlc3R6ZXJvKHBmbl90b19wYWdlKHBmbikpKSBhbmQgZnJlZV9w
YWdlX2lzX2JhZCgpLgoKCkJlc3QgUmVnYXJkcywKWWFuLCBaaQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
