Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D2ECA0EFC
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 02:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9khSla2HCpt9Xip/7qgu8nrUDnGDYuFmtY4XYaFfdYg=; b=09GQY2W4iE1OZ4
	8DF0C67UXVM5IHzry3BnBTndCnvZ+VCfDw+SU3Oj4P71IGjPp2SxGfHOVA+12bC0AEYS86w9vi6/x
	2TPs3qTZbp8a3e07bfjvjJAFZM2WBineOVD8B6w6QY/PKeiZYj5i4YZirZKkrS2yOteJwClTXCyCv
	ORkZDdy/gmtuxbxmDrOx6eqzPI/Xq2hZVk+Y+8PFY1AMGdlgFO/ygEvdUzV0ajAC4lz3s7YRQzaup
	ipuxRQ5JQDhoCcDs1/RxmW3FFB+EO3fkVZEX1AbkuTFHH0jTyARAInt55/T2FSsB4nO8512Wd9c65
	6APEAVV8tP2t2RsmYPeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upHNL-00000001GBf-1LT2;
	Fri, 22 Aug 2025 02:19:31 +0000
Received: from mail-dm6nam12on2061a.outbound.protection.outlook.com ([2a01:111:f403:2417::61a] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upCEj-00000000YL2-1Dfz;
	Thu, 21 Aug 2025 20:50:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jv29gyhlOqIKKyjdfIcLQNUfbs9KIV1UFSQyNWGXSIBWpZldM1H4/wDaRF4ae/Ed1TwLToDCXNfUQ9VQs/penAl5HrRctja9rWBtof3UkQaosmPKp5mqDEKkuDGs5+FL/aC9nHUyS7Nloun5SCu5dE6M7CabyTksBKM8xA3iSuxl8t2lF+peTS1mdhpX2DzUhiQYwn+rHXw2s0KOpNRWXp3HrvRJslyik5REDhmbWx+9hZ6aVe5S67wlGvrjlQM2m5w2GvPvv9sb+Uj2JFMHnPQCvMOTmHzzy6v35utj8SjsNzwAp8lb92mQX04b01StywQy/Oc8Kg09OB2ig2dkwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UaWqCGDDt5NRP8J/pjy+dv/ZQBY9IHdb/gV+gM5l51w=;
 b=cnfM1TOtZUeug6Onyt7JadcSZzBY3jjAXM2wKUYg2BV7EOjz+odooel56nQz1CYsGfJpykRAqRwvyegHZKe7R5QL5vuxPlMZdcGJ9udSOB+NJVlbN0hgUY4swVaiXiJaG9rlnCqAkvFiGvP4CJUfmjVhR5n09wE+pdZMijtCUe3kxjsEQ06T0PLLGyFT0xIxJjjjx5lR6/CA0tXIZsecg4AAkI6WY7ac+DHj6l4HHbfbwHJeHTOBVvK+ST536tillvdNAAVVtU6jVfYHJ37SPP6ml2mb33ATTlLtTlZLasGiB6fvn++8HdUOben87Rr3bKQ4Yyu7P8sI5BgoA/rDpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UaWqCGDDt5NRP8J/pjy+dv/ZQBY9IHdb/gV+gM5l51w=;
 b=RashZiWuQQTrTNdUeRetwwr1v94biX+dudHhS6rcKorCUg6E59+6tRyp/a0tROPo/hd9l9wSSLVfBKZOYgX48jfwPGcdXIJ+P4gnbJj6AQ7cEvfO5d/4O9PWfIeIaeC1J+cvV1ks/NiNkX2lMvA9CaYEnKdOlnuBxYynAqyoIouBAoI9IknRVnVVpvEu0QLzdy7ZKbh8q8nKwkKw4trNfZhIqaF90LrU+li9+HXVHyELbgk+dbNcqBrUva//VPga6RA1/CaXX0dB5si4EBh7GDBJ601ZS0/MD5VLXSQLMzx9GrHm9EZN6Kh7SG9IxXNmgIdoUD03frUbk+RD1rivhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM3PR12MB9435.namprd12.prod.outlook.com (2603:10b6:0:40::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.24; Thu, 21 Aug 2025 20:50:09 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%6]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 20:50:08 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, virtualization@lists.linux.dev,
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org
Subject: Re: [PATCH RFC 12/35] mm: limit folio/compound page sizes in
 problematic kernel configs
Date: Thu, 21 Aug 2025 16:50:03 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <48255144-572E-4BB9-BBA0-D446DCBA8D75@nvidia.com>
In-Reply-To: <835b776a-4e15-4821-a601-1470807373a1@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-13-david@redhat.com>
 <FFF22E91-6CA5-4C8F-92DE-89C22DB3EAD7@nvidia.com>
 <835b776a-4e15-4821-a601-1470807373a1@redhat.com>
X-ClientProxiedBy: BN9PR03CA0555.namprd03.prod.outlook.com
 (2603:10b6:408:138::20) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM3PR12MB9435:EE_
X-MS-Office365-Filtering-Correlation-Id: 798f03e6-9387-4c08-378b-08dde0f45099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blpVVnViT2VFRTJHY2UzdEVidGRGdmdHeGVCY1hUN0cxSHVSalB1Yjl1UDQz?=
 =?utf-8?B?NS9Ea2lYZFNwanVmUnJVUnRLQWgxUWNtL3doRnB4ek9iRFFHS3dyVmt0aFdY?=
 =?utf-8?B?eHdaZjZvQ1lPTDhMWDRiUFBEa2xVUW1QVXpXVjhQdFp4QUlmRG5VZzh3S0Uy?=
 =?utf-8?B?STF6YjFKSVpvRW5Va1RQMS9lNmtlVTZsTHdSM1hURmtyTE5UMTdnSDZ5Wnpy?=
 =?utf-8?B?blJaZld1ckJDYlg4SDdFNzRveEE4UVFFdjE3MDBXMkcrWE1JMW9wSHNPMFFa?=
 =?utf-8?B?WmM5TXRQNk1YK2xDdjZnTjhJczdGbnVqakprMXlrUGhWOTBPU3pqR3pJSElP?=
 =?utf-8?B?UmJiY0lZOWZnRlZNWnV4TGE1dzdnaFlSc2liK1hUQVpnMjBmcHVMeWVKb2hj?=
 =?utf-8?B?STNUd1ZzNHo4Ujg2NzBYZ1RtNU5ya1NvcFZtUTArOEJSVDE3eFlTa3JCUWJ4?=
 =?utf-8?B?OUZKRmdGQ0lnTWVmWnZiV29GbnV5MWJWcE9XTUN4L0RJYXpkblRrL3hOKzBr?=
 =?utf-8?B?Ny91N1NCUHFsYUtibnJRYlRCaVQ3a3JWNnJ0NzRmTkNwRk15eU5kcFVpMVZI?=
 =?utf-8?B?dGlOYTIxMjdWYnZPZ0RPa3VYd3h1cklUL1YvTjRaTkxSTG1oRnZVSk5WY1ZI?=
 =?utf-8?B?aVZKOGlWaXJZdGdNbVdPY3Y1bHlaRjR1Tmp2K1lXY1J5VUhwZFc3VWxDN091?=
 =?utf-8?B?d2hhRXNhRG5qNW9mckhuK2xUUUp1VXhwdnF2VEp4b05SVitjYlVQNjhYOWt6?=
 =?utf-8?B?Rml1Q25yMEpJUitORzYxRlhzWHpaNXRtNklxTmlybkd4Uyt6WVpHNnZ2Q2R3?=
 =?utf-8?B?dlFtbjJKcU03U3drbGhodUlEQzJ2V2tNRzhVZUpZOWpzQzNrSm5obG5aY3ZT?=
 =?utf-8?B?dWlVMjhCNmNDanFSVGZXYmNjajlqcXJScS9LVVhiQlllVjFUL3B0T09qdTFM?=
 =?utf-8?B?SEJLMlBxODMyc0FSR3pxMXZVOFF0dm1oNzJ1WEJCV3dBSzhZTHducUVVZWxi?=
 =?utf-8?B?TUtEVTRDNU4vSHREMm9KOGVvdjRiWEJMSXUxME96WURNRk5iVWhOTGkwN0RS?=
 =?utf-8?B?b0o5U1p6UitOKzdCb2hzL09lOENkWEN2OW5KaEF6T1N3Q2pHajJZK205MGQv?=
 =?utf-8?B?b0RvT1hRVi9TZU9HUTRmcVhHdkZjaTVLTHpEN1JiS0NWQytiOVdUM1F5MnQ2?=
 =?utf-8?B?ZGZUbUphNHNvQzBMZi9EUU9CTC84MTNWOW5tL1FZSWpRbDFlNVc1cjJFdTk5?=
 =?utf-8?B?dGJMS2FmV3BDSzVFZkZ4SEdrZmhYVGJXUWF1YUdHYWRzd3k2T1NkMEwvQ3FL?=
 =?utf-8?B?YnQ4ek5Ob1NZdENMQ0U0N3ZibWgrWDRRZzVwRE5YNElBTmwzQmFwSHkxRkpy?=
 =?utf-8?B?NWRPdW9IZ0FXN1ZLeDlYYmdPa2QxcWhBKzh5N1RQZ281aVBPSUZtb3hadVVv?=
 =?utf-8?B?VXFXSy9IbmROWUlwdngrUGxRTGhueEZHMWdyY0phTjBIbzFWNjNHcGZ0Rk5z?=
 =?utf-8?B?Yk5ETkk1bU45VzMwWXdnVm9HbG5ncHFOa0hZaUh0TDcyTnUrQklTUWFSb0o5?=
 =?utf-8?B?VzNEbmgrL1BkdnVBOHZheTJtdS9pcHNJQlI3YVI5V21XSGNvcElsek9kWVNx?=
 =?utf-8?B?eHRHcURlVXUyUmNVcFFCaUlrRHN1dllqblROL2FFK2lZTVRlUmxmUTEvNk5y?=
 =?utf-8?B?TkVvdU1wSGlraFM4emJtalVGWmZZNkRiaFZxQTVJTTkxc2p0WGN5VElWbUxG?=
 =?utf-8?B?MzJPb3A1TEdGb2F1bWJyMXRwVnhSMkhBclRsZ1JZYkdGZUplTkxvdWcyRG41?=
 =?utf-8?B?TmdFNmRDQUMzcEF6dVJvWWEvSjc2Q09YSERDS2loZXN0OXFlTU5PczVLZ1Yv?=
 =?utf-8?B?Z0g4WHF1Y2JCUHpsTHFpc24yOWxNc1VMcVE4Y0NoMTllQWpqdThSUXpraEMv?=
 =?utf-8?Q?4apbzu0c0LM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1IrUlBQd3ZJN3doVzh1WHFsdHE0TXI1aXBITGJ6QlFpNWljNUx3Nk9FRng0?=
 =?utf-8?B?aStjSjh3V2RFNVBDK1JCclBPR3JFZUNYNlVYSjZaOVVZZVZQOFNCTmpQb1Y1?=
 =?utf-8?B?b3E3VVltRmV3emV5TTdaTzZDK0MxNHN0b0ppZXRGNkRBNkZEaXBKNW5JZGNv?=
 =?utf-8?B?VUVoclJlNFVMNGFDQ0c5ZXN5bkZLL2ZNaldyZ2UxWjViaVA2VlNtbjJRT2hU?=
 =?utf-8?B?ejNZaExVNTI4MTRTSkp5THlHS3VSRjF1dmhwbjdhMUZsOVJZVVkvS0JGcUQw?=
 =?utf-8?B?NlhDZkttQTd5L283RXdodVVIQjlNMnFPcWJnTnFvUXBnbXJ4ekRmMVpQL0lh?=
 =?utf-8?B?ZEZWcURYa1o4NUxndU56bW12VGl3aWtrdS9ENmdmTk41dTcwRDlSUC8xUWRJ?=
 =?utf-8?B?dmR1bktQSkNvaDhEMWlPQ3NiMXFhS0tiUmJvL3h5V01na1kreS8ydWNKTUpn?=
 =?utf-8?B?MDZZeGJkRXlOc1hYcVhCVjVYVzFIQm1HQUIyMmtNTVZaN3M5MlJqRFg3bXlL?=
 =?utf-8?B?c1poVk9ObENVMTVmM28wZjlFMmxyZXE2R25zNllPeWpHdFMveXp4TTd5ZEoz?=
 =?utf-8?B?eEpla0JMbHczcm1SdTJtbmJPMUhZbW8vT2xTUTZ5YmpxeXhqNnppRVNpZGhz?=
 =?utf-8?B?YjIzWHIwcjhFZUdXbnZIZVBKNHFtYURZVW9JeW45RERMYlRiQ3lYNXYxTCsx?=
 =?utf-8?B?b3lXT1BQWS9sV1BTMmhBS0FOUXcrd3Z1ZVF0YWJVenBkd25kbEFsbXhPc3VZ?=
 =?utf-8?B?OUM5V21PdGllZERPNWExSkRhd3drZ29rbE1MTHlUTGVZVXBuNmxyUitCWkpR?=
 =?utf-8?B?MmVGeUZSUm1WUm5YVUUxZDNnRlNkYVBLQm9LbE1VaEdIb0VRbXZoLzZ2dGl1?=
 =?utf-8?B?UnlqQzlkLzVXc3MzRnE1SzRUaERWMnFqNEd3Y2VaWWF3WmN1ajh2Q1UyZ1R1?=
 =?utf-8?B?UlIySUtabXJkS1JjeU8yd2VlbHF3YmZ3ejJpTHZlN2NmcWtFTXNPa0Z5Q0lJ?=
 =?utf-8?B?TEZpeHlsYXd2djRWZHRRUmJGaHVrZUZTcG52dUJ1SzU4RkpsYXF4UGdxa1Bu?=
 =?utf-8?B?RitNZUo5L0FZV1J6ZUhTdnRlbDluV2dsVzVFL0s4Zm9ZZXM2cHpOS0JuWkpZ?=
 =?utf-8?B?M0ZwWlRmeVI0UTdIYWk0cy85dTl5NXlycGY3L1JvUnBLZkhpZ1Q1MkNWZkpz?=
 =?utf-8?B?WFVRYytIUHU1aC91U2p4bEd2bE1hWi80NXVnclVYLyszVEJDOWtacnA0cm5S?=
 =?utf-8?B?cys3NjEvWUZWQUZFY1k4Ty9vTkNmZFpXb2c3a2J6RDVKb2lvVjY5OU9uRnll?=
 =?utf-8?B?TCtPVGhENythQVVPY3hLUXlsdk5YaXY3N2F0Y0gxVmFpSTh2b291QjZQMDhL?=
 =?utf-8?B?VWZzNklpamI3ODJ6bkFRcnpXMURua000T3IvNE4wRWFZaERvWnV0a21wTWRH?=
 =?utf-8?B?bksweWJhaGNZbzFYbmc4bHNGZ0Exd0JJTTBOOWFJSTg2WUtRWVY1LzdLTE5R?=
 =?utf-8?B?Y3dqL3E3QnVWdkpaaEpJVHVNMUluVG52VGdPaTJ2N0RXYVpKTHJDZmk1WUc5?=
 =?utf-8?B?eTZOZnpyajZNSTRiQ0R1dW9hSm04Mm1rNHNNSTl4TmdyNFJLZjQ3amRKWmZt?=
 =?utf-8?B?SkRDNWhFdjNRekVHMkNXTkRIRVZXSTlNdFJ1VWw4eDREWDllRlpGWEh6eFRn?=
 =?utf-8?B?MzBmb1VIenpueE1QTmViMS9zV0pETzJoVG03VlZsQkpUR2wrMkZSb2hGanpB?=
 =?utf-8?B?SGQ1bGtNM3cvVEpsNGpNNmNLajdWTnRKWnkvU1UrQVlta1V0WmlWZ0t1Zm5H?=
 =?utf-8?B?aEtBZ09VVUxPWjZIMDhTaHhHSmZxaWdpUFkxejhQY3pYNzJPOHl1MTAya1lV?=
 =?utf-8?B?TkxDRGlTRlZGbzJ6d0tvREo4S3h4TDl2L1l6Nm45cmp1OFdwdjkzbzE0YUJn?=
 =?utf-8?B?SDRFb1ZWeFY5NmhGSjJYZXlaTDBqSVZxeHlaSFh6SXFra2RwZGJOQUJZeXJP?=
 =?utf-8?B?VWwwWHU3UGRMWDRZNk9PS2k3NTJ1V0Z4aGJWb3RuWEg0Ylp3eDcyVzcxYis4?=
 =?utf-8?B?bjQ5ejB5YVdDcEdIc1huWW80VDJrUmFvVmwxdVUvUGwwTE5XQmoxQU5UU2ts?=
 =?utf-8?Q?OBaHOVWx/XOkY1ARdNpqCjSge?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 798f03e6-9387-4c08-378b-08dde0f45099
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:50:08.6453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhJuMMb4pbThoj+r21f25Vc8mAIEZlC0BqgQnnYV4xGZX3QP6F4rd7r06mjsOxf8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9435
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_135017_361139_DDFCE15A 
X-CRM114-Status: GOOD (  15.30  )
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

T24gMjEgQXVnIDIwMjUsIGF0IDE2OjQ5LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKCj4gT24g
MjEuMDguMjUgMjI6NDYsIFppIFlhbiB3cm90ZToKPj4gT24gMjEgQXVnIDIwMjUsIGF0IDE2OjA2
LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4KPj4+IExldCdzIGxpbWl0IHRoZSBtYXhpbXVt
IGZvbGlvIHNpemUgaW4gcHJvYmxlbWF0aWMga2VybmVsIGNvbmZpZyB3aGVyZQo+Pj4gdGhlIG1l
bW1hcCBpcyBhbGxvY2F0ZWQgcGVyIG1lbW9yeSBzZWN0aW9uIChTUEFSU0VNRU0gd2l0aG91dAo+
Pj4gU1BBUlNFTUVNX1ZNRU1NQVApIHRvIGEgc2luZ2xlIG1lbW9yeSBzZWN0aW9uLgo+Pj4KPj4+
IEN1cnJlbnRseSwgb25seSBhIHNpbmdsZSBhcmNoaXRlY3R1cmVzIHN1cHBvcnRzIEFSQ0hfSEFT
X0dJR0FOVElDX1BBR0UKPj4+IGJ1dCBub3QgU1BBUlNFTUVNX1ZNRU1NQVA6IHNoLgo+Pj4KPj4+
IEZvcnR1bmF0ZWx5LCB0aGUgYmlnZ2VzdCBodWdldGxiIHNpemUgc2ggc3VwcG9ydHMgaXMgNjQg
TWlCCj4+PiAoSFVHRVRMQl9QQUdFX1NJWkVfNjRNQikgYW5kIHRoZSBzZWN0aW9uIHNpemUgaXMg
YXQgbGVhc3QgNjQgTWlCCj4+PiAoU0VDVElPTl9TSVpFX0JJVFMgPT0gMjYpLCBzbyB0aGVpciB1
c2UgY2FzZSBpcyBub3QgZGVncmFkZWQuCj4+Pgo+Pj4gQXMgZm9saW9zIGFuZCBtZW1vcnkgc2Vj
dGlvbnMgYXJlIG5hdHVyYWxseSBhbGlnbmVkIHRvIHRoZWlyIG9yZGVyLTIgc2l6ZQo+Pj4gaW4g
bWVtb3J5LCBjb25zZXF1ZW50bHkgYSBzaW5nbGUgZm9saW8gY2FuIG5vIGxvbmdlciBzcGFuIG11
bHRpcGxlIG1lbW9yeQo+Pj4gc2VjdGlvbnMgb24gdGhlc2UgcHJvYmxlbWF0aWMga2VybmVsIGNv
bmZpZ3MuCj4+Pgo+Pj4gbnRoX3BhZ2UoKSBpcyBubyBsb25nZXIgcmVxdWlyZWQgd2hlbiBvcGVy
YXRpbmcgd2l0aGluIGEgc2luZ2xlIGNvbXBvdW5kCj4+PiBwYWdlIC8gZm9saW8uCj4+Pgo+Pj4g
U2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+Cj4+PiAt
LS0KPj4+ICAgaW5jbHVkZS9saW51eC9tbS5oIHwgMjIgKysrKysrKysrKysrKysrKysrLS0tLQo+
Pj4gICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4+
Cj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tbS5oIGIvaW5jbHVkZS9saW51eC9tbS5o
Cj4+PiBpbmRleCA3NzczN2NiZjIyMTZhLi40OGE5ODVlMTdlZjRlIDEwMDY0NAo+Pj4gLS0tIGEv
aW5jbHVkZS9saW51eC9tbS5oCj4+PiArKysgYi9pbmNsdWRlL2xpbnV4L21tLmgKPj4+IEBAIC0y
MDUzLDExICsyMDUzLDI1IEBAIHN0YXRpYyBpbmxpbmUgbG9uZyBmb2xpb19ucl9wYWdlcyhjb25z
dCBzdHJ1Y3QgZm9saW8gKmZvbGlvKQo+Pj4gICAJcmV0dXJuIGZvbGlvX2xhcmdlX25yX3BhZ2Vz
KGZvbGlvKTsKPj4+ICAgfQo+Pj4KPj4+IC0vKiBPbmx5IGh1Z2V0bGJmcyBjYW4gYWxsb2NhdGUg
Zm9saW9zIGxhcmdlciB0aGFuIE1BWF9PUkRFUiAqLwo+Pj4gLSNpZmRlZiBDT05GSUdfQVJDSF9I
QVNfR0lHQU5USUNfUEFHRQo+Pj4gLSNkZWZpbmUgTUFYX0ZPTElPX09SREVSCQlQVURfT1JERVIK
Pj4+IC0jZWxzZQo+Pj4gKyNpZiAhZGVmaW5lZChDT05GSUdfQVJDSF9IQVNfR0lHQU5USUNfUEFH
RSkKPj4+ICsvKgo+Pj4gKyAqIFdlIGRvbid0IGV4cGVjdCBhbnkgZm9saW9zIHRoYXQgZXhjZWVk
IGJ1ZGR5IHNpemVzIChhbmQgY29uc2VxdWVudGx5Cj4+PiArICogbWVtb3J5IHNlY3Rpb25zKS4K
Pj4+ICsgKi8KPj4+ICAgI2RlZmluZSBNQVhfRk9MSU9fT1JERVIJCU1BWF9QQUdFX09SREVSCj4+
PiArI2VsaWYgZGVmaW5lZChDT05GSUdfU1BBUlNFTUVNKSAmJiAhZGVmaW5lZChDT05GSUdfU1BB
UlNFTUVNX1ZNRU1NQVApCj4+PiArLyoKPj4+ICsgKiBPbmx5IHBhZ2VzIHdpdGhpbiBhIHNpbmds
ZSBtZW1vcnkgc2VjdGlvbiBhcmUgZ3VhcmFudGVlZCB0byBiZQo+Pj4gKyAqIGNvbnRpZ3VvdXMu
IEJ5IGxpbWl0aW5nIGZvbGlvcyB0byBhIHNpbmdsZSBtZW1vcnkgc2VjdGlvbiwgYWxsIGZvbGlv
Cj4+PiArICogcGFnZXMgYXJlIGd1YXJhbnRlZWQgdG8gYmUgY29udGlndW91cy4KPj4+ICsgKi8K
Pj4+ICsjZGVmaW5lIE1BWF9GT0xJT19PUkRFUgkJUEZOX1NFQ1RJT05fU0hJRlQKPj4+ICsjZWxz
ZQo+Pj4gKy8qCj4+PiArICogVGhlcmUgaXMgbm8gcmVhbCBsaW1pdCBvbiB0aGUgZm9saW8gc2l6
ZS4gV2UgbGltaXQgdGhlbSB0byB0aGUgbWF4aW11bSB3ZQo+Pj4gKyAqIGN1cnJlbnRseSBleHBl
Y3QuCj4+Cj4+IFRoZSBjb21tZW50IGFib3V0IGh1Z2V0bGJmcyBpcyBoZWxwZnVsIGhlcmUsIHNp
bmNlIHRoZSBvdGhlciBmb2xpb3MgYXJlIHN0aWxsCj4+IGxpbWl0ZWQgYnkgYnVkZHkgYWxsb2Nh
dG9y4oCZcyBNQVhfT1JERVIuCj4KPiBZZWFoLCBidXQgdGhlIG9sZCBjb21tZW50IHdhcyB3cm9u
ZyAodGhlcmUgaXMgREFYKS4KPgo+IEkgY2FuIGFkZCBoZXJlICJjdXJyZW50bHkgZXhwZWN0IChl
LmcuLCBodWdldGxmcywgZGF4KS4iCgpTb3VuZHMgZ29vZC4KCkJlc3QgUmVnYXJkcywKWWFuLCBa
aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
