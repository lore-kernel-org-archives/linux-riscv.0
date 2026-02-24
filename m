Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24980F4BB60
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 17:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cueg9DkSpyvx8tpoJrY05+wdzmn6tYeXTqqzmhIBXPU=; b=IQCzIb4giwaY93
	pxRrA9KP3xCZnfc9T258ADd3SLvLxTux4L2NozbDPyHqzeaJqRIQwZRU+iZgkGPWX9jNJfZdsPRBS
	DwrCSYQvtgOiVPPcew/xd5LRSGZ6W1HDaIjaQX2+ZHP+X9DuVEY/UurGQjhQqfWnV2vaq4JwyaP1E
	JxdANbUslEMlXVegVqosg4IlV2BSYpmwcca2yXTp2W3+hjtSX11mFyG/tgbK6rmUYAcVroqkjxk6X
	BCmHEHmGn82GCPlzILNzR3Mu0prZ0cRdseDCdsiN8UBjlNI+l9AwhkpAopQ81Rgu0MFmBF9CKrcYJ
	hywn1RiY1jprLrathEUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuw2Z-00000002TYn-0qf7;
	Tue, 24 Feb 2026 17:17:43 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuw2X-00000002TYB-0ZGe
	for linux-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 17:17:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rsJ221TMYt/IplAC1MEqyq1XtIeiTkdT+biQBPzc4QmnER9SvpgJAZDAKc9DsDGGrI4nT5kf3RhfDQep7SPt2nKWBVd8Pqe+ANnpn9bcaRr74Ut7N0VBMTs7nYEFdYOeo/r3QMuGH+faDplgKlZcuLbCjdlP3SdUmxW7os6iUg9emLDKE3d7qECHyULX7KlqGQTa1TUEc8uBB/JFrLXUlj19KrDkXGXDSvSBAhx1pRGKKHn5um5MtZ8VvmhSs3x6i7tD7I72bgSAI3VIeFiCWyCLmfOFhl6j/H+oCfeiSvX5bd0yja08nbj3p1OpcY/2XOIAs4uXbipLcwjM0fSW+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uvfjp38n/FdC5fXRhGJKHM8e25Ollxx5cKJMGTpTias=;
 b=k9d//PnfPuASD+j1HTGGjcMkDsgBdC7gBXbtzk2sxlq7NgcKJGNnAzJpsQe9qPUz/WBUz0ymoehLkS//a/FT+BrzB97dwSKc1+HTPLoN4dYo/02NbfWLXIN/AewhoaSv+U1MLGdILB4IVzW+he74wCTOwKBPcOZe33i6GrUufSoDaQnQi77vPezY/FwsJhrIwyRyYnHRv/PNYAda1Mw3kPNPt1gZuiFCjYEq6ep54gvKigNque5XDHUH9b8lD7sna697CzSx97I4L4TW7lgmtzlmx/us73uU2aSw6dLDOmOSmlXilqZOrC2kHUwAoJ09Wy/UM3p1d9wdBvToUA2wog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvfjp38n/FdC5fXRhGJKHM8e25Ollxx5cKJMGTpTias=;
 b=KnAjfZe23Y5l6oMN+4TkcNBCOzntO6bhMCi+5oJzPhst5N0NdVB1dTEVnxtccpDMxhcgeHHpA/ZSADAR6/zLUdwdK8Zlwvsm4n0u95NnNIJjcBuHCjumlHbEiCw5inbcgz6Q7NEt7P+EhAuRrVw1ZTLbsrgYtboKDWoD5kYEDqlC0dSNyYaznCEZ8U01ALfLX93kM/GdPNrdwMAAU6lS0lXThJt+l7IwoI/xmcT0JsOlDALc3skyRM78kUvqbxn8c9F0T4QnM+/knytZE8WRo1Bb7E9rh16qadJx+LM3hIAXDrbp/bmdeyGV43IF3mBTSSn9A5gW1NqmZx9xKqmeog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CY8PR12MB7097.namprd12.prod.outlook.com (2603:10b6:930:51::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 17:17:26 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 17:17:26 +0000
From: Zi Yan <ziy@nvidia.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Ron Economos <re@w6rz.net>, wangkefeng.wang@huawei.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, jackmanb@google.com, jane.chu@oracle.com,
 hannes@cmpxchg.org, willy@infradead.org, muchun.song@linux.dev,
 osalvador@suse.de, sidhartha.kumar@oracle.com, vbabka@suse.cz,
 claudiu.beznea.uj@bp.renesas.com, Mark Brown <broonie@kernel.org>,
 akpm@linux-foundation.org, pjw@kernel.org
Subject: Re: mm: Regression with v7.0-rc1 on RISC-V
Date: Tue, 24 Feb 2026 12:17:20 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <1AB3E96B-F4CA-4B00-9078-2AC20A1A60DC@nvidia.com>
In-Reply-To: <78D36EC1-2596-448A-A939-0A1AC7B3D1BC@nvidia.com>
References: <1b17c38f-30d3-4bb4-a7e1-e74b19ada885@w6rz.net>
 <13b8d60d-1209-4650-9fa5-982381c53512@kernel.org>
 <1966378802.577797.1771952827516@app.mailbox.org>
 <78D36EC1-2596-448A-A939-0A1AC7B3D1BC@nvidia.com>
X-ClientProxiedBy: BY3PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:a03:217::9) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CY8PR12MB7097:EE_
X-MS-Office365-Filtering-Correlation-Id: 3816b643-4ac7-40d5-43af-08de73c894d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0U3NVNmYVFrME1QcW41S0dFRk5UNHZURDg0RXU2N3hUSWZtYkhWZkUrYnU3?=
 =?utf-8?B?bVJSNUo0UkJkVTVCRkIwVlBxT2h5YW16eVoxenFyYmlDeERhUzNudzgxUTVy?=
 =?utf-8?B?cVd2SC9lZDQzK1Q2Y1dJSXFjalFIYWF4dnFxWkxKcnFjSWU5L1phU1dGNXZU?=
 =?utf-8?B?Zk1OZGNrMms1cWk3Zmd2U3p5NlZDRHZ0U0t3ZkVFYjNDRmtPRTFDZy9IeEdp?=
 =?utf-8?B?MWZrVjhCWDBsMVpRckR4OE1BM2hkaWlHL253dnV0aXRTcUN3ZFRnNUVYZ1py?=
 =?utf-8?B?Z2J4RVI2R2EzSHJkRDBsZDZOYlc3QkJPM3Y5UFErVS9kNkY4RjV4SXVaa1BS?=
 =?utf-8?B?REtLQXN4dm9WQkJJWEhJWCtYUDFXclpKNENQNXU2Nk1malNySmZUaThLeHU3?=
 =?utf-8?B?UlRib09NNEI5ZmdYN2NkemhSNFFOSTNUNkV6cG9VRHR3a1VYZ3pRU016Rk1I?=
 =?utf-8?B?MWpQa0NEb25ianJ5RGNnVnlzWlNBZXlBV2g5VkVjSEhxVzgyWGZKb0JJUGdz?=
 =?utf-8?B?S3pZcFdyUDdKM2pVdjJvZ2VJNjVibUZPNjZlWXRDdE9UbTFCQ1o0a3luVEY1?=
 =?utf-8?B?blRBRFlJVEp2Lzdmd2V4NkRMUHh1dWQ5UEQrbkk2emFzWjBKUXFOSWZhRWl3?=
 =?utf-8?B?Y1V4NGI0UWM3TTZzdjdBRkZOMjhTRHpWVkoxWHpsNjBvRXNwblhKclZEVDVy?=
 =?utf-8?B?RmhhZXpoeVJmV3lvbDZyaFVlN2tNaDJQTHZDcDZyZHpDQUNWNk9hRkpzcG5X?=
 =?utf-8?B?T1hlWGNBa3JISGNWYlJvM09XNXQzY0xoblY1US90QzlZVnA2V3l3TjdVZk8z?=
 =?utf-8?B?ZndLNDJRMjd1dXVEZTNxcjNhT2ZhQ1c2Y0sxWVZwd2NHeVJ5cXUrS2gyaVlU?=
 =?utf-8?B?STQxOWhXWm9sYkNkU1FCZ1Fqc1IzZVJsMnhWSnJiaUhoY2k0bXlJTHhERUNl?=
 =?utf-8?B?U2VtWGlncXRJeEJnQktST1ZXWnQvV3B4bG0wMEd3WlFHbzBVYWNJUEpTamZU?=
 =?utf-8?B?NFNLeGJJeFBUQUNMV2ZSeVZ0S0NDVEV1NE0wQ2pEYTU5QzhnTnZmN0paMTR4?=
 =?utf-8?B?bmdaYWFBWDFaTHdzRmhsZHp3Rm9MUzM3SlhUcVZyY2RrRE8rU2FKZU1XSFJ5?=
 =?utf-8?B?TGNmTmZPR2NOTE9hNTRBYlR3MWhLcUlJTHltMWU5YjQ3Wm9BU2JBWXRUMy9K?=
 =?utf-8?B?NENqK05WdVhxSkRMWVN6NkcrZ0pKZ2w3UWNiR2ZITXl0SEZ2S1QzMVFpZk5O?=
 =?utf-8?B?S2lKRnZYQW02S1ptcTNEWUM4dWhReU05UDU5M2N3MEhjb043cGUrMFpacVR5?=
 =?utf-8?B?WHVvRzE5ODdFb2dxM085RGZ3R2NZS1RxL2xLd0xLTG9pTFprWWlQRWI0L2tj?=
 =?utf-8?B?TGVhWWFad1RPRUdrUEtKaWZCdTJETEkwUkk0a3NUU0tQVDlwb2NlMDcyQ3lI?=
 =?utf-8?B?S2R2YjFtYnN0OFhXOXJLT1ZUdXJvRnV2anp2WndsT1cxQUI1VmtNYlcwTTE1?=
 =?utf-8?B?aml2aGt2bmpTS2l4dVEzTkVKZ1M0WndZTmJmTHBPUlU0d3JONWJpRWJhNEdv?=
 =?utf-8?B?bm0ybTlmU044Q2x4L1FUK3VJdmgycnFaZHp3bTdNZmFDOXQzVnZFZG1rV3JK?=
 =?utf-8?B?OEJsc1JJNXVQVEJQVWIyM09hQVgveVczK1piVGxkdkVMYmNKcWZmLzVLL3pB?=
 =?utf-8?B?VkdqV3NXaVdhQUFJYzdGejI2cEN3dStLNkJCN2dUeEtSakNBZ0dTVGZ2aE1W?=
 =?utf-8?B?ZDBLQ1ZIRmFXVGprRjlmVURFektpdkV1dnEwKzB5L2JucWFSQm1ETUlUZnFz?=
 =?utf-8?B?ZjlyOEQ1N2prVlZFRzZnRTFpMnlMbzVQTXBrTWhzYnpNNTFjTERnYzVtOG1w?=
 =?utf-8?B?ZlIveXQzZU00a2NyRXVabUJkbkxJSjJMbzVNNW9XOW93emJWL2VzWXJyNURF?=
 =?utf-8?B?cm50UTlWQU5NbmRVSjZUbER4Z2dqbHlrZmdUWWd1UG0xZHA4dDhhRjllaDlL?=
 =?utf-8?B?cjJDYTB0SXJCTEo2aDVwOU5YVVZxcnJlbVdJZTNpN1VxSG1tUU9HZGJDRnl1?=
 =?utf-8?B?cDdBYlVRdFI5ZWVIU0xWb0ZxQWw4S2ZoOUNDUHFQNm9VblVXa2lycGlZN2lo?=
 =?utf-8?Q?/ymM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTFDS2hLNWgxeUlRNGxSTnJMUktLRzVBVDluMklEa05Odk1OblNrMEg0ME5l?=
 =?utf-8?B?RnlKdlVJc2dtcFZtOGtPY3BtdUJhL1JYTm9ONG05STZIRnh5Zy93bHB5ZlBv?=
 =?utf-8?B?V05PNHBiaW9VME1tSWV4VFMrcGZYWmYvaE8welRhZnc2TFBzSStKN0FJTVNa?=
 =?utf-8?B?bTZYUGJlUXNlekZGZHo3MEx5Nm5zdUpjK1hWL0RUNVMvbXljeHRtMmxjVUxD?=
 =?utf-8?B?UGZSU00rR2tmMTl3NWNFKzJVd0FKN1RQMXRBSlJzblNwSVZhMEFpWjhvc2p4?=
 =?utf-8?B?bHVacFFMbWFIOTc4NzZaMi9pZmVSV21LOVpsWHIxSGxRUWVDbnF3Wm5oeEVU?=
 =?utf-8?B?WG5zekhydHJBeXg1T28zaC9zcUFoTEdRNlh2WDJOT1FUdzl0NzZPRjJqbVI1?=
 =?utf-8?B?ejlGU1dxYXV0MHVjblpRY3pMRXZvV2w0WXhab0h3NWdobkIwK1d3eDJkZlV5?=
 =?utf-8?B?Wk5pK0N3Vzg2VkYzNEFPWERhQmhTeVdkS0ZySTVWemRqbUNIanZkTDlSZEpa?=
 =?utf-8?B?ZXNIazgzYUIzOVZ1ekZIVnh0akhiSkE0OUR0aDIwcXBKdFVlWHZVeUlVWWhk?=
 =?utf-8?B?eG5ob0tZS0lUQWZ6TGNjTmJzZ2FvY2hueHlnb2ZrRGQ0NUVjYUwrVTVaVEdq?=
 =?utf-8?B?SWJJVkVBOEllYkVnMHFtMUdIcVdhQTRKazNISUdxM2x4UTdwRUk3Q1JSdXNl?=
 =?utf-8?B?eUNiWHJ2bjhSMHFYVHJpVW5Nc2tHMkhuc1NDeVd5YnZncWhMMzBUanZYSjU4?=
 =?utf-8?B?eGUrS3JOYXNvSHNDWlZMUTZpckhkdjF3aHh1d1IzV3djTlhLZ2J5ZTBIMjRy?=
 =?utf-8?B?WW1Ec2pQdWVmL3cwTnRsTTkySnNhOTk4aWhmajdJd0F5YmcwNlhoL1dnQ3RG?=
 =?utf-8?B?cVVES3I1M2haY2luTVlIVUF4N09nakVsY0x1NHFNZzVSVlhyUnMwWUt4b3Jn?=
 =?utf-8?B?NlZJdE8wNXEwd3hIblF6dno1dlpYRnJyZGJ6TUNJWkpXOWg0MVhvd0hyYVRi?=
 =?utf-8?B?Q0UwNnJRcmtTM3IxbFpyNG92bFFObzNDbkpuVExXMllpVHZnWmZhZFI2L1Qr?=
 =?utf-8?B?cStQbmVNNGU1cERNd2sxZkMyQWR3UEdha1FyNitNZmZCVnl3YjQ0WUg4d0Za?=
 =?utf-8?B?anZZcld0eUdRak9hUDFnc3lHckVZNHZaS25ZTGVHSlhyTG1rMW9TTXNEeS9U?=
 =?utf-8?B?RUhra1lpY0lrb3dDOWFNeVZkMVZTYjEzMmx0eCtVcTV6NUV5VTFYRHZRSGZi?=
 =?utf-8?B?am94Q0pJQm0wZlFhNnk2OEpxRGVLekppaHFNR3F0ay9wSUx6VE1CUWlObitV?=
 =?utf-8?B?aFR2eHpub05HL0o2Vm05VU9vOEQyLzlMdTl5UzdDMis1RXBheloydnliaG5W?=
 =?utf-8?B?T0FZREhIZTM4MGIxTkt1ZFhiTElSVDJnVEdsQzlHZ3ZxVDFUa0hsWTRGUU9P?=
 =?utf-8?B?SVk1cXJKd1dlYlV2K0o3Y0p2TDlFa1psVE8xNFdhSFVGMmdJRDI2cktjZjNq?=
 =?utf-8?B?bnAzTGVnNmpIRGxSVjFvelp5YTNuTUJsWndKOWZ0OUxZeXhXM3ZmRHR4ak05?=
 =?utf-8?B?clc3eVpiZXZNdzF1U1E0MG1ScDgxMnRRYWVxNy8vNG1KeUlLNEIrb3R4c2x5?=
 =?utf-8?B?UlI5Z0pMTnkyU3VVWDVEcTZFcmFXQ0pLOGRObmRKeGYyNGZMQVdCVS9kN2Vp?=
 =?utf-8?B?V2JtenpXRi9JSlVsWnpPTzc5djRMa2hHYnlIVWRWbjVlS09wYkR0UzA4LzlY?=
 =?utf-8?B?ajA5NzMxYzJPdlVKVlZMMmYxOW9JTmIvbFBVbEdGQkp0UXFqaHFsTlRka2lq?=
 =?utf-8?B?Qlk3WWhnR1hRQ3hZNU5qbis3UGxPRzB6Nm81RWxaZWFMenVKeWVoNmdQVWY2?=
 =?utf-8?B?K1paZ2xveGlZQVJ2emNVcFFQUU1kY3g5Z0R5bTBxc1gxUnRSZ1pFVmpWNFAz?=
 =?utf-8?B?LzBRcTJ6cnJraXRJRlNCbHR3dzR3M012QXE3dG5EbTNZWGJuMkVmdStmd29D?=
 =?utf-8?B?RDBaL3gya2lBZzEzeitneGlJb1FYYUN5OHdReCt0YTNZSHlHTFJNMEg2bU9s?=
 =?utf-8?B?S2gzYVQ1VE13S20zbjM5TmR6YWlENytTenc2U0ZTZUFuSEZjQVpOZ3p1SUd0?=
 =?utf-8?B?MU9taTJzU3JEbDk2aExkNXNyRktDbWE0eE5NbDhGWlIzMGI2TUZiajNXQVp4?=
 =?utf-8?B?L3JUVjRxR3dGUStvYkZQSWk0cnl3cmI5SGtLc3R6Mkh5NHhVdGtHcEFXTFJJ?=
 =?utf-8?B?Um9Wd3ZXZGFiN3VrZjBVOEFDTlhFV0xpYzNaM3M3V3hNMWZQcTZzWmNUSDlC?=
 =?utf-8?B?cnJLOWplSGoxSzhoV3Y1ZHZWQkZUY3dXWTUzUWpBZHEwd0V1NHJnUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3816b643-4ac7-40d5-43af-08de73c894d4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 17:17:26.2100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IdlH5+rqiww3I5ScflpoLW6N3FTdiboLY03MNMu5TEzM4a9NYLB4s7y5rZeQRrOj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_091741_297662_82816A5B 
X-CRM114-Status: UNSURE (   9.54  )
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

T24gMjQgRmViIDIwMjYsIGF0IDEyOjE0LCBaaSBZYW4gd3JvdGU6Cgo+IE9uIDI0IEZlYiAyMDI2
LCBhdCAxMjowNywgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4KPj4+IERhdmlkIEhpbGRlbmJy
YW5kIChBcm0pIDxkYXZpZEBrZXJuZWwub3JnPiBoYXQgYW0gMjQuMDIuMjAyNiAxMjowMCBDRVQg
Z2VzY2hyaWViZW46Cj4+Pgo+Pj4KPj4+Cj4+Pgo+Pj4KPj4+IE9uIDIvMjQvMjYgMDk6MzcsIFJv
biBFY29ub21vcyB3cm90ZToKPj4+Cj4+Pj4gSSdtIGdldHRpbmcgYSBCVUcgZHVtcCBkdXJpbmcg
c2h1dGRvd24gd2l0aCBMaW51eCB2Ny4wLXJjMSBvbiBSSVNDLVYuCj4+Pj4KPj4+Pgo+Pj4+Cj4+
Pj4gWyAgT0sgIF0gUmVhY2hlZCB0YXJnZXQgc2h1dGRvd24udGFyZ2V0IC0gU3lzdGVtIFNodXRk
b3duLgo+Pj4+Cj4+Pj4gWyAgT0sgIF0gUmVhY2hlZCB0YXJnZXQgZmluYWwudGFyZ2V0IC0gTGF0
ZSBTaHV0ZG93biBTZXJ2aWNlcy4KPj4+Pgo+Pj4+IFsgIE9LICBdIEZpbmlzaGVkIHN5c3RlbWQt
cmVib290LnNlcnZpY2UgLSBTeXN0ZW0gUmVib290Lgo+Pj4+Cj4+Pj4gWyAgT0sgIF0gUmVhY2hl
ZCB0YXJnZXQgcmVib290LnRhcmdldCAtIFN5c3RlbSBSZWJvb3QuCj4+Pj4KPj4+PiBbICAxNzMu
OTg1MjQ5XSBCVUc6IEJhZCBwYWdlIHN0YXRlIGluIHByb2Nlc3Mgc2h1dGRvd24gIHBmbjpmODg1
MAo+Pj4+Cj4+Pj4gWyAgMTczLjk4NTMxMV0gcGFnZTogcmVmY291bnQ6MSBtYXBjb3VudDowIG1h
cHBpbmc6MDAwMDAwMDAwMDAwMDAwMAo+Pj4+Cj4+Pj4gaW5kZXg6MHgwIHBmbjoweGY4ODUwCj4+
Pj4KPj4+PiBbICAxNzMuOTg1MzM2XSBmbGFnczogMHhmZmZmODAwMDAwMDAwMDAobm9kZT0wfHpv
bmU9MHwKPj4+Pgo+Pj4+IGxhc3RjcHVwaWQ9MHgxZmZmZikgQ01BCj4+Pj4KPj4+PiBbICAxNzMu
OTg1MzY1XSByYXc6IDBmZmZmODAwMDAwMDAwMDAgZmZmZmZmYzUwMWUyMTQ0OCBmZmZmZmZjNjAw
ZjJhZTg4Cj4+Pj4KPj4+PiAwMDAwMDAwMDAwMDAwMDAwCj4+Pj4KPj4+PiBbICAxNzMuOTg1Mzg2
XSByYXc6IDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMWZmZmZmZmZm
Cj4+Pj4KPj4+PiAwMDAwMDAwMDAwMDAwMDAwCj4+Pj4KPj4+PiBbICAxNzMuOTg1NDAzXSBwYWdl
IGR1bXBlZCBiZWNhdXNlOiBub256ZXJvIF9yZWZjb3VudAo+Pj4KPj4+IFNvLCB3ZSdyZSBmcmVl
aW5nIHNvbWV0aGluZyBmcm9tIENNQSBpbiBjbWFfcmVsZWFzZSgpLgo+Pj4KPj4+Cj4+Pgo+Pj4g
SW4gY21hX3JlbGVhc2UoKSB3ZSBpdGVyYXRlIGFsbCBwYWdlcyB0byBkZWNyZW1lbnQgdGhlaXIg
cmVmY291bnQKPj4+Cj4+Pgo+Pj4KPj4+IFZNX1dBUk5fT04oIXB1dF9wYWdlX3Rlc3R6ZXJvKHBm
bl90b19wYWdlKHBmbikpKTsKPj4+Cj4+Pgo+Pj4KPj4+IEkgd291bGQgZXhwZWN0IHRoYXQgdGhp
cyB3b3VsZCBmaXJlIGFscmVhZHkgaWYgdGhlcmUgaXMgc3RpbGwgYSBwYWdlCj4+Pgo+Pj4gcmVm
ZXJlbmNlZC4KPj4+Cj4+Pgo+Pj4KPj4+IEFyZSB5b3UgcnVubmluZyB3aXRoIENPTkZJR19ERUJV
R19WTT15ID8KPj4+Cj4+Pgo+Pj4KPj4+Cj4+Pgo+Pj4gLS0KPj4+Cj4+PiBDaGVlcnMsCj4+Pgo+
Pj4KPj4+Cj4+PiBEYXZpZAo+Pgo+PiBUaGlua2luZyBhZ2FpbiB3aXRob3V0IG15IGNvbXB1dGVy
IGF0IGhhbmQg4oCmIGlzbuKAmHQgdGhlIGNhbGwgY29tcGxldGVseSBvcHRpbWl6ZWQgb3V0IHdp
dGhvdXQgQ09ORklHX0RFQlVHX1ZNPwo+Pgo+Pgo+Pgo+PiBBdCBsZWFzdCB0aGF04oCZcyB3aGF0
IEkgcmVtZW1iZXIuCj4KPiBSaWdodC4gV2l0aG91dCBDT05GSUdfREVCVUdfVk09eSwgVk1fV0FS
Tl9PTighcHV0X3BhZ2VfdGVzdHplcm8ocGZuX3RvX3BhZ2UocGZuKSkpCj4gYW5kIGlzX2NoZWNr
X3BhZ2VzX2VuYWJsZWQoKSwgd2hpY2ggbGVhZHMgdG8gZnJlZV9wYWdlX2lzX2JhZCgp4oCZcwo+
IOKAnHBhZ2UgZHVtcGVkIGJlY2F1c2U6IG5vbnplcm8gX3JlZmNvdW504oCdLCBhcmUgZGlzYWJs
ZWQuCj4KPiBJdCBzZWVtcyB0byBtZSB0aGF0IHNvbWVvbmUgZWxzZSBidW1wIHRoZSBwYWdlIHJl
ZmNvdW50IGJldHdlZW4KPiBWTV9XQVJOX09OKCFwdXRfcGFnZV90ZXN0emVybyhwZm5fdG9fcGFn
ZShwZm4pKSkgYW5kIGZyZWVfcGFnZV9pc19iYWQoKS4KPgoKTWVyZ2luZyBSb27igJlzIHJlcGx5
IGZyb20gYW5vdGhlciB0aHJlYWRbMV06CgrigJxTb21ldGhpbmcgc3RyYW5nZSBpcyBnb2luZyBv
bi4gSSBlbmFibGVkIENPTkZJR19ERUJVR19WTSBieSBpdHNlbGYgYW5kCnRoZSBpc3N1ZSB3ZW50
IGF3YXkuIExldCBtZSB0cnkgQ09ORklHX0RFQlVHX1BBR0VfUkVGLuKAnQoKTG9va3MgbGlrZSBz
b21ldGhpbmcgaXMgcmFjeSwgc2luY2UgaXQgaXMgcmVwcm9kdWNpYmxlIHJlbGlhYmx5LgoKWzFd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8zMGRkMWVmYy05YmQ5LTQ2NjQtOTk5ZS02MTBk
MTgxNjAwZjlAdzZyei5uZXQvCgpCZXN0IFJlZ2FyZHMsCllhbiwgWmkKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
