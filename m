Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABB6CCF9E5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 12:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GJsdHLAFvmAPZwoes76zVRSVt5nnPgSX6Ex+gpYt698=; b=L/BbCcUDAdUpYg
	HG3Ov+d/M6exOOrWgX+j2pDoOTsFNZhybj++AmFDvMvNzfupzBKV2uUYB/M7zjErsB1W09y84nVnN
	TvcH7y0+XQ7vPxBKxr7HSA4nfBAUEHvZzkEtb05dWIUT52GRRe1PNMD4535fGwD8ESMqwbwgndxXE
	STOa0uVm3DnHe54Pm9SY5Lswus+oM74py0ibCVNfXWTn68kBjaxu3RvqurZ/fDEHW+JwgAE4VwmMp
	nuFK94KT81EtHrZZNK+LmjV7qqcldm/CBno168QP1nXfhuBUPLraGfMcNNxuPpu+0sVE0n5wL/zjS
	V8Z34cNXYQEGSlvIRJ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMoJ-0000000Dxx0-2l6w;
	Mon, 27 Oct 2025 12:58:55 +0000
Received: from mail-westus2azon11012046.outbound.protection.outlook.com ([52.101.48.46] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMoG-0000000DxwC-2BMF
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 12:58:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yomiQSUGHAcTYWrP+NOqLBU2sPl6R+JSbHZMeN+f9VAWgl2cUPoOFMaw2/fyGrGrEfTGFV0yT1N693aLucYF7JjwHzj6XohibGcJLCBH/wcXkQN0RdjcatrJ7Lwk99sPDoS68GH6NU4zk3QOyl52sjXJHI3+nmCMmXq6geQ+vL4f+2xCjrJlSAcGn71WSOIZnlvN6b+SGkn34zfBm67dTC0yWVTU+t8ShjQ7/eCuq2ce6LD0cJDcP5PKdD1YVOzeahaBDdsS7yiEdk1Bnnaqpijw4n/Wa4uBaHv2JAio8G1Wtxv1O2XBs6Ey3D+QW6MiQi/rjvikyzL+CFnVNtHjkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuhnVnExQxAohyXiZL2EsV8bgeJO43P9Bsc5t9PK52Y=;
 b=dEqel94WtNnYWL89FnFvPpmoXyGubJFY1ByEeaEYkYxnDstgK50e6O+iVx8ZRT/xcniK9aeKoYYmtvW7vCfVJnL3vss7Qtyf8Y/p9jRM9yiXSYejoFlYrDeBgk+RAnAnEB4zw8UzTgUMfqltUGY7/qvQq3p5emqGfBSgx5TDL6XO39eBpWcwuV9U92KrgUjGWaTqmE/hDyF2gNtj1wi75K18jUBAYhJbagI5ZCRilhyrOQXkQzF1fNSr0OtYV3EuMl5F+mvHAxn4yL3cqMzDBq5p6a1lTXZrKWWBFnsR1Gh2Si4ev7m/6oasqemEvO9Uka6DUFdExeo/hC69Pr6TxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuhnVnExQxAohyXiZL2EsV8bgeJO43P9Bsc5t9PK52Y=;
 b=T2YjSzOtlCpeM4B4zL5gDizxx+5ULdcpeE5olEjzqicbHMuFO0KyXqypNzVEb6x9NJ66UCe7+w9poAu9sZgSuZsxhdIXCSbU2p16HjqFtamYGBFL6IT0Mw86jRtzsKHeGqZ09aWN9l6+1FWJIocCkKN+i3CIPn0JBeqJNr9LbHXk9wI0/2tL+HSTsQ+nQaNVKGgl4hZlMwPg8qFyFVg4v8OqLK0cHtwMmBxUxCX/S8CKS1pvh6stpDGo+XTd7xVs7zwB/U/24EaJnHF4vw7+Zu79xFjKXAPMUYRIQKO+PNPRUiSrvDDzqdYnJqLZDUrucWsdbyx/Q7t0n5hWjst3nA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by DS2PR12MB9797.namprd12.prod.outlook.com (2603:10b6:8:2ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 12:58:47 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 12:58:47 +0000
Date: Mon, 27 Oct 2025 09:58:45 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
	Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev, Bill Wendling <morbo@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Shuah Khan <shuah@kernel.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Will Deacon <will@kernel.org>, Alexey Kardashevskiy <aik@amd.com>,
	Alejandro Jimenez <alejandro.j.jimenez@oracle.com>,
	James Gowans <jgowans@amazon.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Michael Roth <michael.roth@amd.com>, patches@lists.linux.dev
Subject: Re: [PATCH v7 03/15] iommupt: Add the basic structure of the iommu
 implementation
Message-ID: <20251027125845.GB896317@nvidia.com>
References: <0-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
 <3-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
 <CA+CK2bC5=rb1C6i5yMad_tG9JpbYYgSRxAX-vhYctuoLvcQbWg@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CA+CK2bC5=rb1C6i5yMad_tG9JpbYYgSRxAX-vhYctuoLvcQbWg@mail.gmail.com>
X-ClientProxiedBy: BN9PR03CA0687.namprd03.prod.outlook.com
 (2603:10b6:408:10e::32) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|DS2PR12MB9797:EE_
X-MS-Office365-Filtering-Correlation-Id: bb400feb-1b96-4295-2cc7-08de15589108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1BYS1pPY2doTEFORkJpUnl6eWU2aEdEcWhBaWczY1NHVUFFYmJ0aHhkcHJH?=
 =?utf-8?B?OFl2bEp1VVFoRncrYVpQbXBQVHVNaXJ0MlEreFBIVW85Ukxsb2MwNGVTU0lq?=
 =?utf-8?B?WHVIcm9VdUQ1Q0tmNjVWb1hKQkRqS2cwTFRKSDJpWjlTZ21hTHdHSTFhMVox?=
 =?utf-8?B?bWNNNG5YTFRRNGUyM1NmcmdzZlltWko4SjdFdzEzNnRLZHNKYnJpSk02eTVk?=
 =?utf-8?B?T3U2WkFxLzBFM1JtRnFDNUVvU1RJY0dlMEV3RytBOXVrU3lybzdYOWJOWkhu?=
 =?utf-8?B?NDF4aDl3RXA5ekx0Sm9VS3hGcG94aFBGc2xjWXBtd1hPVmlKc0NVUzlKVU9k?=
 =?utf-8?B?eDRLMG5ST1dBVVoyRGlxQ2JYdjZqQVFHMy8yY1NqV0lnWDRJWmc1VUpVb0dP?=
 =?utf-8?B?ZUZ3cm1pcjZnTWo5dkliMFhkOUpZdWNsR1E0QVlSVmtIZFQvM2QzdGlmM0tL?=
 =?utf-8?B?UmRTdTJQZS9iQUhsUDNTSVZKYkVtR2lnczB1eU8vS2dWclVXNllVbnYrSnRz?=
 =?utf-8?B?TXY3QnlqQTZrT2tyeGowdENMWHZPZFZPcTJYVHR6VVBiY0VxQU91bHI5TGpQ?=
 =?utf-8?B?eUxiNzZldVhmbXY2RnE2elNJV2dabTFmdnphRjQzRStpcVF3ay9Kd0FCbEdO?=
 =?utf-8?B?Q1JYOE5iMkNkM29taEh4Mi9NakM3K0lVZGs1d0Q5NUx4SGgwTS9PTzZYVGVS?=
 =?utf-8?B?N1ZxZm45bGZoL3lheEhRSURjOTloUDJPbnhBbXZwOE55cG0rTGJjbTFQWW5E?=
 =?utf-8?B?clVOSEhpczc4VFdMK05HZ0NCYytodkZUSWZmcS9oQWdSS3pXM0M3MlN4VEtV?=
 =?utf-8?B?SXMzaVdUYUkwQjdxMTFJOFFKUkNDTUpaR2dUOEdsZDBucWE4K0xRcnR4ZEtG?=
 =?utf-8?B?ZzVZeW1aMTdxM2dQVkU0bmZISENJZElkZFI1NStsSml5QTlqNVQ1bXE0SW80?=
 =?utf-8?B?VkdURTNWL2tIZTNrS29FTmFuRFpNSUlmbEd5alBFbUYyWStXa1hJRHM0YWhP?=
 =?utf-8?B?cm5pMFFJZ3ErK01TZUFaM2RsSGpUd3dFMjU3Y3E4MElNTHlSbEZxYTVRdmNK?=
 =?utf-8?B?bXI3aStTOWlQSkpCRGd5dkhwRjhlek9maWt0aHY3eEhFNVpvSXFpZ1B3OVpD?=
 =?utf-8?B?eG45K3k4OElwRktxN2ZkQmZTNFN2RGZpZVViNzJwOG5ZZ0dKSHRuSTFmaXpB?=
 =?utf-8?B?U1lSU3NUK0ZmamNPcTJ3eHAyMXVsVUMwempJbmhpblo3eWJoT096cDlrcHhE?=
 =?utf-8?B?Tm9jY0RkWjlVV0xNUnFjcVIxTjNTNHNMS1UwdmlNeEN4RHFaZFJydVc0SWtw?=
 =?utf-8?B?YjdBSUpGNlJvYXhCZ3E3Yk1uaEk5UTZLa2dIVnVmY01OYUZ1Z3J2RHd3NEpC?=
 =?utf-8?B?TVBEUmxkZFZrQmE5ZitpV1ZpU2tNWjd0eUZIRGhORzI4TUhEM2dPeER4dGtN?=
 =?utf-8?B?NmFWS04xK1JoWVFxQVI5Y1B5UjQyNGJ0RW1jSC9zeXkxaEV4ZDY4Z1psdlVW?=
 =?utf-8?B?b1A5aXRSZlBhTTZjREFFS3dsQm44a3VPSVdVa3NLcG42dlViOTUxSEZJajJv?=
 =?utf-8?B?OC9PTGwxRzBIUld5OVYzcUwwUFhrcmk3eGkwb04wOEYybkR5clBkNnpxRlZ1?=
 =?utf-8?B?M1VvL3JoWGZPSWpmRUdFSnZ3a3k2SmEzMFluUTY1eGFGbXlPS2RsZ0FmUVpi?=
 =?utf-8?B?bGVwY05uUmVFdjQ2WjhUQlY4SXZzemRIM0J5M2h0ODJ0UGFaTWZKd09EZDdY?=
 =?utf-8?B?dWhMZkliV1Fod1JSazd5d2JNS2UrMG93VWNHN1Q3SGc4YmltcHo1WWs3eENP?=
 =?utf-8?B?ckQ3U0VXT1ZQZmlFMEFMZkFoQll1MWNDK2lyZDF3QWxqTUZPdTNQMUhqOUxl?=
 =?utf-8?B?Tm90bDJkTmFkVDQ2andaeGtudlNLSk9oeXFib3g2TXJWbTA2WXk2ODJRaklj?=
 =?utf-8?Q?F26JgqmOow0XfFLOrPlukw5McrQj7VRh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3613.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTlLRmJvemY1Q0o4c2ZhSk5SVVNJWXM0OUd3dTJPWGMzOHAveVZ2dmxMM3Aw?=
 =?utf-8?B?R2RmUWZGY3VYNlBibnNwVEJjWmZtYWVKcEwveHdQMW9zbUE3S1NDN3h3QzB5?=
 =?utf-8?B?aUJWbXU1NDFmN0VVeVZDamxZVWtGMy9Sc3BFemdVVVpGclhOOWZEMEI4QTFz?=
 =?utf-8?B?bS80endDdUpjQU5GUDJkdDNMU1dVUWNock5MbDA5Nk9YVEJQVWdiM2F1cFZw?=
 =?utf-8?B?aTF1b1F6TEx6MkpDeEh0UkNsMGZ6NjVEU3ZCdlhoVGQvZ2c3MjFGQ05uSXJI?=
 =?utf-8?B?aWYvZk0xRTFOWWZaL0VabnIybFUzZytianYyQmdsTS9HRGtpemg0bTFLOVJ3?=
 =?utf-8?B?NkwxL0dvOExyWUdLMTZRc1YrUmxVbzlBTkRpemQ0cXhBY1dFeG5sS3Zrc0Ur?=
 =?utf-8?B?VEhLcG9BM3hFMUNuWFdlN05SSmdwSlVDZGRhR2s4WU9jN2UvakJ3TC82YlRZ?=
 =?utf-8?B?aWo3TEVyYkpCNmdTaVJqTHppcTVUa055SWh6Wi9yaUswZDVSbjdMR2FEVHVu?=
 =?utf-8?B?M0dNOTNPSm15ZGx3dGIxcWdzWTBsMVFCcDl3MTgrbjdkaWJ5SVZZVjg5Ritu?=
 =?utf-8?B?akl0bmhkSkFZalJyNnFkNGYzK2JsRUlCQkJ6Q2FkRVhXTEh1SFRra284ODEv?=
 =?utf-8?B?T0dKOEpnS211YmF5VG1waXEwYjMrSnI1ckROUElva0I1d2F2TzhoRXlOdWp3?=
 =?utf-8?B?b0V5dTBMVFkvbTFEMWJCUmE5RmFKOUNjakNsMFFZaURQaGVSNE5BTUZVRzRO?=
 =?utf-8?B?Z3cyT2llcU1GT1N3YkJvSzhHNTJLejRvem1jZEx3WnMyTW9MSU52RldYek5U?=
 =?utf-8?B?TUNUeFluZVd0RjNWbHoxMHZBRU94aytQYUYwb2dia01SR3Q0bFpRekhySm95?=
 =?utf-8?B?bFpPMWFUS25aSXB3eVVqcHhrTk9zOS9sOFVPdHVaaXRMWUxaM3NPLy8yTjdB?=
 =?utf-8?B?UXdxUXdXT3lRMWlFZjB2VmVzekFKWmR2Q3lNOHZqMTBRd0E2VGdxOXJ4Rmps?=
 =?utf-8?B?bDNMZ3BFcWdZK0dZSm8rL1RCT0kxOWozZDhFZm5pbnRGcXlQM0JmZ1h3eVF0?=
 =?utf-8?B?WTg1aTQvck1ITzFucHBJRitwVDl6Q2pvNG5FaWdrazEzeFo2cDN0S3NFOVJM?=
 =?utf-8?B?OXJRclpTOTJ5U1Rja1VOYXI3dDB2UG1YOUJKVlBFSzJ5VEVMMmNwbDU5STlL?=
 =?utf-8?B?YXcvd2tndFpGbUdUdHVJTW5lVzFYeVpRUXlaNjMzKzgxdnhucE9XSmZxMWpE?=
 =?utf-8?B?SG1XdDM0RWVZek1SQjlGdHpWOVNOaE5ZSjRrbVhHdENKc09lYVpjdlBxQnVu?=
 =?utf-8?B?c0tIM3REWkRzaGFhbnBYcDQrUzJEZ1NlckpYeW5uNnIzL3RGZ0UzOVI5UFk3?=
 =?utf-8?B?bW1uekkrSzV2YUtrSWd0UWxzZzg2NVREYWZiWGtCYzVPNmIyNkhzQTgzbWJu?=
 =?utf-8?B?MThmMWwvTFo0Y3pIVzExbnE3TTBGcTdDS3Q0UGgzNmJodTJ5bVZnRnF4Q3NP?=
 =?utf-8?B?VkxoUjBPekFlTFRIQk5OMk1oSUVvZXB1RkZQdjZ1U1lZTVJHVEY4OTlLdllo?=
 =?utf-8?B?SWtScDhqcEtVaTFiRzlBQU1RRm1wRW5GaXk4eC8zWDVqTGlvVjdjOUE0cGIy?=
 =?utf-8?B?c3RIY29MbE9NVzd2WllEMWlGUUVTeGR0MndtcFVzTVVXN3J3OTJFdnNDc29y?=
 =?utf-8?B?Y0Noby9sQloyRkZ5cGc1Z3NyRTQzZzh6ZFJtWi9GTmZ2a3dYeUZqT0N4Q0dp?=
 =?utf-8?B?QkNIRC8xUmN0eVFtQ3ZLbjIyV1VHSGVOY3I4c0pFODlkZGZsRVlLUXpUNnlw?=
 =?utf-8?B?R0djdmNKTVNUc0pvdXJMcFBxYmNUZ3k5aDFtOTlPWkxXTzlpWHpzc29DdTBC?=
 =?utf-8?B?KytWcUhnRWZtSFdDbytyaVZlZFBNWHZjWUxRbXU3Wk5RWnpjWC9lWFZPNi9B?=
 =?utf-8?B?NFVDcUdJOEtlak15U1RNeHNHMHpWcjVDOFNHbVJXVmZGUDJsMlNHRFZFalpy?=
 =?utf-8?B?WDh0UU4vN1NQdkRkL1JRWUcvUVQ3WXVBV3BmbEtOaU1zTjJiT0k0aC9MbUF2?=
 =?utf-8?B?d2JVcEo5cExtUUhIK0ZDNmF6YmlBRVAyNFVVQTNvTW9kQkFzakhjSGdPUkc0?=
 =?utf-8?Q?MBRM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb400feb-1b96-4295-2cc7-08de15589108
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 12:58:46.9329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +yHimX5bRyYIP7thpH9WUm6vSewx8h7g0mmta+MQqfq3Abp53iL2f6goYu75dMxG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9797
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_055852_558727_6012BB5C 
X-CRM114-Status: GOOD (  19.71  )
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

T24gU2F0LCBPY3QgMjUsIDIwMjUgYXQgMTE6MjQ6MjVBTSAtMDQwMCwgUGFzaGEgVGF0YXNoaW4g
d3JvdGU6Cj4gT24gVGh1LCBPY3QgMjMsIDIwMjUgYXQgMjoyMeKAr1BNIEphc29uIEd1bnRob3Jw
ZSA8amdnQG52aWRpYS5jb20+IHdyb3RlOgo+ID4KPiA+IFRoZSBleGlzdGluZyBJT01NVSBwYWdl
IHRhYmxlIGltcGxlbWVudGF0aW9ucyBkdXBsaWNhdGUgYWxsIG9mIHRoZSB3b3JraW5nCj4gPiBh
bGdvcml0aG1zIGZvciBlYWNoIGZvcm1hdC4gQnkgdXNpbmcgdGhlIGdlbmVyaWMgcGFnZSB0YWJs
ZSBBUEkgYSBzaW5nbGUgQwo+ID4gdmVyc2lvbiBvZiB0aGUgSU9NTVUgYWxnb3JpdGhtcyBjYW4g
YmUgY3JlYXRlZCBhbmQgcmUtdXNlZCBmb3IgYWxsIG9mIHRoZQo+ID4gZGlmZmVyZW50IGZvcm1h
dHMgdXNlZCBpbiB0aGUgZHJpdmVycy4gVGhlIGltcGxlbWVudGF0aW9uIHdpbGwgcHJvdmlkZSBh
Cj4gPiBzaW5nbGUgQyB2ZXJzaW9uIG9mIHRoZSBpb21tdSBkb21haW4gb3BlcmF0aW9uczogaW92
YV90b19waHlzLCBtYXAsIHVubWFwLAo+ID4gYW5kIHJlYWRfYW5kX2NsZWFyX2RpcnR5Lgo+ID4K
PiA+IEZ1cnRoZXIsIGFkZGluZyBuZXcgYWxnb3JpdGhtcyBhbmQgdGVjaG5pcXVlcyBiZWNvbWVz
IGVhc3kgdG8gZG8gYWNyb3NzCj4gPiB0aGUgZW50aXJlIGZsZWV0IG9mIGRyaXZlcnMgYW5kIGZv
cm1hdHMuCj4gCj4gSXQgaXMgYW4gZW5hYmxlciBmb3IgY3Jvc3MtYXJjaCBwYWdlX3RhYmxlX2No
ZWNrIGZvciBJT01NVS4gVGhlcmUgaXMKPiBhbHNvIGEgbG9uZy1zdGFuZGluZyBpc3N1ZSB3aGVy
ZSBQVCBwYWdlcyBhcmUgbm90IGZyZWVkIG9uIHVubWFwLAo+IGxlYWRpbmcgdG8gc3Vic3RhbnRp
YWwgb3ZlcmhlYWQgb24gc29tZSBjb25maWd1cmF0aW9ucywgZXNwZWNpYWxseQo+IHdoZXJlIElP
VkEgaXMgY3ljbGVkIHRocm91Z2ggZm9yIHNlY3VyaXR5IHB1cnBvc2VzIChhcyBpdCB3YXMgZG9u
ZSBpbgo+IG91ciBlbnZpcm9ubWVudCkuIEhhdmluZyBhIHNpbmdsZSwgc29saWQgZml4IGZvciB0
aGlzIGlzc3VlIHRoYXQKPiBhZmZlY3RzIGFsbCBhcmNoZXMgaXMgdmVyeSBtdWNoIGRlc2lyYWJs
ZS4KClllcywgSSBoYXZlIGEgc2ltcGxlIGxvdyBjb3N0IHBsYW4gdG8gZml4IHRoZSBQTUQvZXRj
IHVuZnJlZWluZwpwcm9ibGVtLCBhdCBsZWFzdCBmb3IgaW9tbXVmZC4KCkluIGlvbW11ZmQgdGhl
cmUgaXMgYW4gaW50ZXJ2YWwgdHJlZSBvZiBJT1ZBIHVzZWQgaW4gdGhlCmlvbW11X2RvbWFpbi4g
V2hlbiBhIHJhbmdlIG9mIElPVkEgaXMgcmVtb3ZlZCBmcm9tIHRoZSBpbnRlcnZhbCB0cmVlCml0
IGNhbiBiZSBub3JtYWxseSB1bm1hcHBlZC4gaW9tbXVmZCBjYW4gdGhlbiBjb21wdXRlIHRoZSBl
bXB0eSBzcGFuLAp0aGlzIGlzIHRoZSBlbmQgb2YgdGhlIHByaW9yIHBvcHVsYXRlZCByYW5nZSB0
aWxsIHRoZSBzdGFydCBvZiB0aGUKbmV4dCBwb3B1bGF0ZWQgcmFuZ2UgYW5kIGRvIGEgY2xlYW5p
bmcgb3BlcmF0aW9uIG9uIHRoZSBpb21tdSBkb21haW4Kd2l0aCB0aGF0IHJhbmdlLgoKQ2xlYW5p
bmcgd2lsbCBmcmVlIGFueSB0YWJsZSBsZXZlbHMgdGhhdCBhcmUgZnVsbHkgaW5jbHVkZWQgaW4g
dGhlCmVtcHR5IHNwYW4uIGNsZWFuaW5nIHdpbGwgcnVuIHVuZGVyIHRoZSBzYW1lICdyYW5nZS1s
b2NrZWQnIHJ1bGVzIGFzCm1hcC91bm1hcC9pb3ZhX3RvX3BoeXMuCgpUaGlzIGNsZWFuaW5nIGFs
Z29yaXRobSBpcyBhbHJlYWR5IHVzZWQgYXMgcGFydCBvZiBtYXAsIGl0IGp1c3QgbmVlZHMKdG8g
YmUgZXhwb3NlZCBhcyBhbiBpbmRlcGVuZGVudCBvcC4KClRoYW5rcywKSmFzb24KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
