Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A553ECE9D5F
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 15:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jGlfQ/imfyX6X85hMxuLRU4HGfZPQpQsRZnbAfZwZC8=; b=fnMTcEE+SakPwIRxvEJOcyGR9w
	Ms6krBsEFejmG8yyl3n64ZflO4u8QirEStz9PhHEW0Zqsvm+XOuDFLZEim+7SEAxfQrB5bEG7dSsm
	ho0i/Te7StjH1Hv41RloXL4eocrc/lgOFI2UYphMZKAUBMSvfjV2CSZuZpTOO2yLodBqOffG9Gu8o
	u1Ifmk1YkG4Mqnp9+bJU/W+70irZDawJffzVIcY1SDn07q53fMlNEoCgWklbUfBTMU72FIYkQXpWS
	r71J5mBVfBFn1aNhoCnGskPxcS4DWcwxODJYRcJIonvKc1VIdt9K4pPDHZjUjEWXWhK7+CCbCta00
	wKldjwtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd95G-0000000DPqV-2KpD;
	Tue, 06 Jan 2026 15:34:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd95E-0000000DPqP-3qSJ
	for linux-riscv@bombadil.infradead.org;
	Tue, 06 Jan 2026 15:34:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0CwJGzBM1E8ri+kRmRyW2xfXcT658Kad967AHkOoGTc=; b=GpnPl1NeIa1hctWMIVFdo2ThN3
	kTQKnGWY1KmdoAiKD8dXbtf7srAATwHKXlTzXYIUxEyuGxxeIfRNRgIDVSUzsG61Ygd9rUu+vtDb0
	PDgIa8wfqw9El9A0j7DQPKRAHQmvdNOW8YFexYp2tyXSTXgNbm2QL9KL4/SvwmARFN5Wa98MLq7PT
	fnP+9xKCXOxmn5/JgjDGODLp/S+h+eo+0qIUJN4v273b6UhOGlyAMpEC+wsIN702yDgAfpVZsRM2L
	3ZKBWLKtzUKGbSZYTr3fTskUJh/ZiKEbnFCuk2LcwX4/aUWJclFf885ftxgG8/02GgG1IeBtDoDmj
	D2QFEqlA==;
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd95B-00000009yOm-3E09
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 15:34:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shhGZWTNXlwhI+MWW/ygK5Ty9OQoppK3WnbcLplCY4bJMugnVz99pBQpfT6niYme9L142jecy2ks8UhN/yl43qDv0ZAmQHred8cnFdjvQsg6XtbVksJBh3SHGJCHzKScynjvzkrJ6zXmeL6V8fuaqNZ4h1ZUWQHGkG5D8k+KURFPdBE2+MYu8qKfND/B47lggCAe6HHbbjtikVNrKELzAj4hnBTaFrDKZZR7FR50REz3gjl5avDFsFjvdBA+LHpiP2dQATJD94T5Akb8m18greEyodixiqlRQ1j4zdMd8aIZlLw3AjHR+PcnhMwfizEztsMfqgk6U4V2pPtVV7aBOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CwJGzBM1E8ri+kRmRyW2xfXcT658Kad967AHkOoGTc=;
 b=EF5peQcfpjQwzuWyz6QBBZ+8bMr4ph5Sn+buVXRsuU4u3qVBOyxSkF/RggrwqyaQaIoACO0bd6m1nR8mBeBlIRLqOvRRCWCVCehbZ3NzY+MbDUYaXoNQdZDUWW/hQhCtJlyjcDUPL/S51V4fawQaAEUULzjwvwpnl45tDlH0LDuXtYr3VGVQivYwKVs9+VhUpwOnRseqAKJ2DsMHnrs18bXbYRbtTwNq2EwVjFRY9Y+pZEN9oHIIimfj6GBRyMYDAg/L/mKMss03VOLRQUzAzvvR6uVmFcmlZL1j2t5ofI5D1VRaAfQkIhzxQfGhrCN9SuaYP8mc9KVousflur6qNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CwJGzBM1E8ri+kRmRyW2xfXcT658Kad967AHkOoGTc=;
 b=NAPqAlvqvD1G+OIBjVaSEjIp2tJS71NkJG0fKHqyobwatVn35Uc1zFcVo+u9WPFllAfykmkfPJqCAta7J4YeeGVe4jiURMJwTrBAk9ePknq5Q22cHaWH+u1JdbnMQwJnjkcJBRiHJ1xSqr4+9JMxKWwqyhpBOp2wxWNFoQrICIg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BN7PPF0D942FA9A.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6c7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Tue, 6 Jan
 2026 15:34:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9499.002; Tue, 6 Jan 2026
 15:34:17 +0000
Message-ID: <b4fc76aa-290b-4cdf-aff7-30ccc9cb1f44@amd.com>
Date: Tue, 6 Jan 2026 16:34:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon: bypass no_64bit_msi with new msi64 parameter
To: Vivian Wang <wangruikang@iscas.ac.cn>, Arnd Bergmann <arnd@arndb.de>,
 Han Gao <gaohan@iscas.ac.cn>, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev
References: <20251220163338.3852399-1-gaohan@iscas.ac.cn>
 <e86b823f-5e83-4105-8e4d-1db141d088a4@app.fastmail.com>
 <2ab9f73d-ef7b-40b3-b2bb-650f83ac236f@amd.com>
 <5ea0ff13-04b3-4b2a-80e2-4f87146d00d5@iscas.ac.cn>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5ea0ff13-04b3-4b2a-80e2-4f87146d00d5@iscas.ac.cn>
X-ClientProxiedBy: FR4P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BN7PPF0D942FA9A:EE_
X-MS-Office365-Filtering-Correlation-Id: fad671ce-fa6c-4428-3754-08de4d390e0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjQxSm4zTjB4Yi82VEFvM3ZNcE5OTXZYdnpxa1RPWGcySFlpOXVsOHpFVnFo?=
 =?utf-8?B?QzBreEJMOHBMMDRBdld4aW13NDJPMVdnSFNuV0dsUVVTMkRyM01TaVBxcjRX?=
 =?utf-8?B?aE9XdWV0TkQ1NTN1bGVWQlBra2pBSWtYQXNmYklrbmhUV1ZyRFRyTUNzSjVX?=
 =?utf-8?B?M0F0VTdXczl4SXd5UFdxeVFOSlVpQnhGdTBnVkdLdmovSFBRTzU0L2hyUWJM?=
 =?utf-8?B?aEVpbkhPOXRtNFpsVndmT0N3bmoydW81NEJIb0xLNTA3UTNsWkVxRHg4N3B3?=
 =?utf-8?B?Rm1jblg2UWFXSWtXRlBCSHBUVVhyMzZ2cFJqVUsveGZ3a2tCL0tWdCtpVm1T?=
 =?utf-8?B?c1JrZld6Q1lPZGc0RG15cEczeVpPOCtXMGx5RUZGc0h4UkdleS8zK2xxVEJh?=
 =?utf-8?B?THdMT1VpUUlwK3pWZllaUy9sd3NDNSsraE1INVpXZTROUXdYMURlVmljTlpH?=
 =?utf-8?B?Y2ZVMmFhaUJXQ3NoQmdpblRVVFNwSVJNelY3TmRHVHJDT0J1U0J2TThaTFJu?=
 =?utf-8?B?RnpCOXF3aTJwdzEzY3lNRVcyR0hkeXJyOHNQayt3bmJaUEJhcVdvWUgxdGhH?=
 =?utf-8?B?N1c5MzFEZldBSVNZWFJMWk9qSDhPcjRNRTdFakhPOHhzc2xRTUlCQzc0WnlQ?=
 =?utf-8?B?Q1kvUHZraUJDM3pKTU9XaU0zVFZkVnBLcmhMbWhsVUNTQ2JaR0FrUExpRzUz?=
 =?utf-8?B?YVR2enY5d1FocTZqbGp0TzRyS2FGY2czdWczb0hxcW9vMElORm9yeTVPQjds?=
 =?utf-8?B?anlUNlZ6dFNWRU9xWXl6SThpUGNXdmlncGtMMDU0d2FJaUJFOTJ4Q3kzTUQx?=
 =?utf-8?B?R0wxNWw1YlpkbTBXQlR4NnJQZEx3QUdWaGQ4V3VGTE1qNU9kLzVFb0hMenM4?=
 =?utf-8?B?WWNpSmxDRnVPL3FjZGtsS05YSm12YVVGLzIzOGRrdFg3N2xOeHdVc2ZtNDBC?=
 =?utf-8?B?REszK0MzalNVY0ExM1hTQmFSRFVHOUVUQ0o4dmtTb1NLakZrZkVMN0RlU1Uy?=
 =?utf-8?B?Y2hZNGpwSit5QmJVaUJxNnQwbDlwd1BBVTRlUlQ3SWFpNkxyVHNjU2NYUEhY?=
 =?utf-8?B?allhaC9mMndlVnQrZFFRZk50TGRxNEhjTmpNUGh3OXpqTmpNOUQ3b25PMGJ4?=
 =?utf-8?B?Wk0yZWc4WjBSTGZHeGRLVVQ4Tk00TWIrbVZjcVlnOExDbDRXOEtGbjNpalg1?=
 =?utf-8?B?eHJxbVlKSG1rNjV5bWc3SkUvZXRqQXhHNzBaOXhZS1lmUlJPOUxsWTl2NVZI?=
 =?utf-8?B?SlZXd2hxUnpWc0tKeU1JRVR5TWVwVXRlU1hoeWhBcmVJdC9mbG14ZG8yc25N?=
 =?utf-8?B?R2hBY3FUTGptTmozMEpneVlpQWN1UW5xUWRsWmJIeTA3bVZYeEJ5clI4Tjls?=
 =?utf-8?B?ck5YdlpPaW5ZNGppMnNMb2pKTmlsRGt2RjJvZFRzMFhXMFgwOFhuTTZzdjRS?=
 =?utf-8?B?am1XUGVneTRQL3FHY2xmdmVUM2E5dE0xY1RhVEV2K2FGcHcrTTYvZTB3L1lF?=
 =?utf-8?B?ZXh6Z1hzYVFESWN6L3d0aGtJZEJhL2tIZ0MyQzV1YklOcWd2ajA4dnhud2hB?=
 =?utf-8?B?ck5ieDZJZ1p0TU5CRko3YXVzVEN5MXVoRE5PbGpsM3NWeDlUand2d1drUTNQ?=
 =?utf-8?B?NERtTVUyUEUvbWdsenlBZlFSeVFwNGZwTmpVdWoxdnVPM1ZxMzBiWE1ObTYr?=
 =?utf-8?B?aXk5Z2RpaElmK3RqM3RBWUtxWndtOUNNbjlRWUhDTGFJeTBveVAyVW83UUxr?=
 =?utf-8?B?bm1GYWlKV0NrZHBjaXV2c3BVSUlKVVlNSFR5UUlMMm8wS0loaU5yUC9tR0JF?=
 =?utf-8?B?OTZCZXJNcXB0ZlNGWHl3ZkFvNkEvU2c3TjNEN25xVjdEZXV4REgyRTN2Yi90?=
 =?utf-8?B?aXREaHZkd0xSSVBiNVJUSUlSUk0yME1TN1hyOWxiOStYc0ZReTZkT1lqSmFV?=
 =?utf-8?B?MFRSTnZoYUR5QVY2QnZtRjcxb2lEQ1BpUTJvOVlQYS80QUZ2Vkh5YzBWRnZ0?=
 =?utf-8?B?Mkw4bzQ2K1ZXcUpKVStFN2lLQnZELzJrYm9zR0RIWEN6MzJTZWx4eVRzMmdF?=
 =?utf-8?Q?YmYDAP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmsxcTdSN0hZbUJ5ZHVqVGV6V0FCMUx4eFNja2RrZzNFOHBxQ2RHRFBHY1Av?=
 =?utf-8?B?Skw3d1dEYWgzMEtCTVRlVW9sb3NHVkd1UGZYRStMU1FqY2VzaFZjbldZQUpC?=
 =?utf-8?B?Nk5nRGRMMSswdzZFbnVxM3ErZGFxTW1JaVBManlaSG9ac3F5SE9RL3l1VXF0?=
 =?utf-8?B?Q1M5aFA2bGU5cG53c3U5a1hFQ1lqUVFlSWl2RFB0RjVjNjlQaTBQaSszNVJa?=
 =?utf-8?B?TXhoLzdETjh4b0VFbW52TGVpSUFJUFFkQTM4T1QvcjQ2NjN4bnNLNGdzUU5p?=
 =?utf-8?B?QTMxa2t4YzZLVmNqUFY3cTA5emdPSlZvZE1tSm1XK0ZLZUlFN1k3bk4wb3JN?=
 =?utf-8?B?Sy9NcktBLzczS0Q3dTBoRmZxNzBqZ3E5ejZ2dmFmYnpjWEsvc0hmYVBlSkE4?=
 =?utf-8?B?RCsxQnVER1h3dnZncUN0dVpSYjhvaUdoV0RRdWVQU3oxN0dndVl3SHVlYlJO?=
 =?utf-8?B?SlQ5MG84aVdCRFJyUlgySHFyMzZ1VDhvblJTdnRmSEtiRmFJcDBYSkdoY25l?=
 =?utf-8?B?VzBPV0E3aXlrcG1SelkwQmFYQkFPZWkyZjNRWUFqdXIyNHF5bVQ4YkdwWk9Y?=
 =?utf-8?B?L3JKejR5cnpPalBUb2orc05Ncmd6Sno5Y05VL2cyOHBGREwrTUt4Z2pCa09z?=
 =?utf-8?B?NEpvRlhCMlY4WVg2WHV3MlJ2QytES015enBteWJROGZ1WStaVnJVN25VNmtn?=
 =?utf-8?B?Y2tKbXdsOXF0WmFYRTN5VURCRVc0Mm9RRzlaOUxmOXBHNzRJN0tRc1pXSS9z?=
 =?utf-8?B?S3lXVlhtTkkraVhNUDhHTlVFaWtHeHBFNjh5WXVYRVhvRDlVTDMxRkcrc2JX?=
 =?utf-8?B?Tlo2Z1gwRDdEd2JtREoyYWZ3aGh4REhlblE1c3d5M2JEcXpKNmFoL29HY1U4?=
 =?utf-8?B?NHp3bFMzQW50M1dxcWo0VnNBZ2dmaDdSYmlzRVlLaWlURE1WWnJsNmZ5czBk?=
 =?utf-8?B?T2VMN2MrSCswWDIxMmM2QmVrb25GdHVwcElTTFptdHJ4R0RJdXpZbzJLQy96?=
 =?utf-8?B?VkNYWWRiT1RNMndwSWV4dkRyUXpueEp0NXBOSjJJS09xOXdPcGg3NGxJYlI1?=
 =?utf-8?B?R2xGNElicGNZM3FRdFNvSUJFVExsOHZDZndHVUw0WVova1plcW9xVWYxOGFS?=
 =?utf-8?B?dXdRM1J2U0MyUVFyRndSNmlkeHRPcGVjVmRXMFhCRzY5WkREejFJbDliMXFr?=
 =?utf-8?B?VlhjWlN3Vk5hTUhXT2dHZXc3WnorWEprS1N6c1EyRDZRbnpOR3B1eWdXcGJS?=
 =?utf-8?B?ZEk1NG5nRXdGL2JUOXh6WllwdXc2SkM0MGhsWjIrUmV0Z09WYkI3K0lJQ2dU?=
 =?utf-8?B?WVgvazVlR2N5bHE3LzFpVDIwL0RQZ1VCSUtITEx0ckc3SHBhVHdKeTBKNlIz?=
 =?utf-8?B?RWRBK0E3WkwxcjlxdUdYV3U2RUNHUjFoOFZ4SDltMXJxb2hoZFRrMDk4N1oy?=
 =?utf-8?B?MGdFd1JLOE1iQTdXZS9VNk9XT0Nxd3NITmc0VG9xQnpWVy82YitiaUNySHAr?=
 =?utf-8?B?R2xJeG5PLzBqWGU0NE5IWWVCR3Z5M0VGUXFjZS9ld2FMUVlDUHBud1JIcDBv?=
 =?utf-8?B?Q1B0MzlLWUZiYXNLVStsdWpvYmpkeVo1M2Y4clJoSU1DajlYSDNxQzU5eDBW?=
 =?utf-8?B?MmthTXN4Z3Y3bUQrR1E1aDVxMmZ3eXFHTzJ5T2U2NjgvWlRwUnd1eE9Ga2w4?=
 =?utf-8?B?TmtOdEE5OWQ1QnNTd2lKRFYrQkN5SFROa1lORlRPVm9MalFWRUc4NTNRMTZ5?=
 =?utf-8?B?TFdjbTkxUnZkdEtxZHRPNTZqdkFxWGxFdVplbGJBUmtmOHdQUzJVdE9KSEZO?=
 =?utf-8?B?dlpBVzRBWnpUMWJvNmlKOEFST2NWMUJkclJEdHZKMHJ6OUZIQlVxRXFRNEtz?=
 =?utf-8?B?Zlkxb2IzUmlDVWE3c2FHWXJpbDREUkE5L1krWmkydE9RTkVJQVdWeUlHSm1x?=
 =?utf-8?B?VFFqOWlVMjRiQkw3SjdyWXVLSGdHUnZRVFRTdzBqajVIY0tIMjVtWkZaeWQx?=
 =?utf-8?B?VzJIS210VFZEMVRzVjV2bERLRzBDcUN4cnFtU2pqWFowM0ZpcnBTRkJ0SFp3?=
 =?utf-8?B?eklZYmJiZWtaYitaeHl3LzJDWWZHeG1peDBSektrYlEyaTI0TThNSXF4ZDVM?=
 =?utf-8?B?YWptUkhEeVlGUDZhWWg0T0Y3SzNLUCtwb0pseGI3d2VXY3l4NDZJb1ZweUpp?=
 =?utf-8?B?cXk2dExUMDJxVmQyNGNRU1N5Y09KTjFOQmVYckFHYjZGUDI0ek1pYUdKY1BL?=
 =?utf-8?B?RytDd0FycVVMZFJlSUtJVTVZWFphT3ZHZGpkRTluRGo4YU1vWW9xVlRLSWh3?=
 =?utf-8?Q?d42qpTT22qmHSK7QjV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fad671ce-fa6c-4428-3754-08de4d390e0a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 15:34:17.8577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phWRe0D5R8H0m1lA/bTqXk6TkvhxTrxVxI0aJqJMzrJBbaID08YgI+4P0xKOnz1F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF0D942FA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_153453_882631_507B91EE 
X-CRM114-Status: GOOD (  24.18  )
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

SGkgVml2aWFuLAoKYWRkaW5nIEJqb3JuIGFzIHdlbGwuCgpPbiAxMi8yMy8yNSAxNjozMSwgVml2
aWFuIFdhbmcgd3JvdGU6Cj4gSGkgQ2hyaXN0aWFuLAo+IAo+IEkgaGF2ZSBhIHF1ZXN0aW9uIGFi
b3V0IHRoaXMgNDAtYml0IHJlc3RyaWN0aW9uLgo+IAo+IE9uIDEyLzIzLzI1IDIyOjU1LCBDaHJp
c3RpYW4gS8O2bmlnIHdyb3RlOgo+PiBPbiAxMi8yMi8yNSAyMjozMiwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPj4+IE9uIFNhdCwgRGVjIDIwLCAyMDI1LCBhdCAxNzozMywgSGFuIEdhbyB3cm90ZToK
Pj4+IFsuLi5dCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X2lycV9rbXMuYyAKPj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2lycV9rbXMu
Ywo+Pj4+IGluZGV4IDk5NjEyNTFiNDRiYS4uNjJlYjVhNjk2OGZmIDEwMDY0NAo+Pj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2lycV9rbXMuYwo+Pj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2lycV9rbXMuYwo+Pj4+IEBAIC0yNTAsNyArMjUwLDcg
QEAgc3RhdGljIGJvb2wgcmFkZW9uX21zaV9vayhzdHJ1Y3QgcmFkZW9uX2RldmljZSAKPj4+PiAq
cmRldikKPj4+PiAgCSAqIG9mIGFkZHJlc3MgZm9yICI2NC1iaXQiIE1TSXMgd2hpY2ggYnJlYWtz
IG9uIHNvbWUgcGxhdGZvcm1zLCAKPj4+PiBub3RhYmx5Cj4+Pj4gIAkgKiBJQk0gUE9XRVIgc2Vy
dmVycywgc28gd2UgbGltaXQgdGhlbQo+Pj4+ICAJICovCj4+Pj4gLQlpZiAocmRldi0+ZmFtaWx5
IDwgQ0hJUF9CT05BSVJFKSB7Cj4+Pj4gKwlpZiAocmRldi0+ZmFtaWx5IDwgQ0hJUF9CT05BSVJF
ICYmICFyYWRlb25fbXNpNjQpIHsKPj4+PiAgCQlkZXZfaW5mbyhyZGV2LT5kZXYsICJyYWRlb246
IE1TSSBsaW1pdGVkIHRvIDMyLWJpdFxuIik7Cj4+Pj4gIAkJcmRldi0+cGRldi0+bm9fNjRiaXRf
bXNpID0gMTsKPj4+IEFjY29yZGluZyB0byB0aGUgY29tbWVudCBhYm92ZSBpdCwgdGhlIGRldmlj
ZSBjYW4gYXBwYXJlbnRseQo+Pj4gZG8gNDAtYml0IGFkZHJlc3NpbmcgYnV0IG5vdCB1c2UgdGhl
IGVudGlyZSA2NC1iaXQgc3BhY2UuCj4+Pgo+Pj4gSSBhc3N1bWUgdGhlIFNHMjA0MiBjaGlwIGhh
cyB0aGUgaXJxY2hpcCBzb21ld2hlcmUgYWJvdmUgdGhlCj4+PiAzMi1iaXQgbGluZSBidXQgYmVs
b3cgdGhlIDQwLWJpdCBsaW5lLCBzbyBpdCBlbmRzIHVwIHdvcmtpbmcuCj4+Pgo+Pj4gSSB3b25k
ZXIgaWYgdGhlIG1zaV92ZXJpZnlfZW50cmllcygpIGZ1bmN0aW9uIHNob3VsZCBjaGVjawo+Pj4g
YWdhaW5zdCBkZXYtPmNvaGVyZW50X2RtYV9tYXNrIGluc3RlYWQgb2YgY2hlY2tpbmcgdGhlCj4+
PiB1cHBlciAzMiBiaXRzIGZvciBiZWluZyBub256ZXJvLCB0aGF0IHByb2JhYmx5IGdpdmVzIHlv
dQo+Pj4gdGhlIGRlc2lyZWQgYmVoYXZpb3IuCj4+IEFnYWluIGNvbXBsZXRlbHkgYWdyZWUsIHRo
YXQgc291bmRzIGxpa2UgYSBwbGFuIHRvIG1lLgo+Pgo+PiBJSVJDIHRoZSBtb2RpZmllZCBjb2Rl
IGhlcmUgaXMgYmFzaWNhbGx5IGp1c3QgYSB3b3JrYXJvdW5kIGJlY2F1c2UgdGhlIE1TSSBjb250
cm9sIGR3b3JkIG9uIG9sZGVyIHJhZGVvbiBIVyB3YXMgbm90IHNldHVwIGNvcnJlY3RseS4KPiAK
PiBEb2VzIHRoaXMgbWVhbiB0aGF0IG9uIEJvbmFpcmUgYW5kIG9ud2FyZHMsIE1TSSBjYW4gcmVh
Y2ggZnVsbCA2NC1iaXQKPiBzcGFjZSwgd2hpbGUgRE1BIHN0aWxsIG9ubHkgZG9lcyA0MC1iaXQ/
Cj4gKGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2RldmljZS5jIHNldHMgRE1BIG1hc2sg
dG8gYXQgbW9zdCA0MCBiaXRzLikKCkkgbmVlZCB0byBkb3VibGUgY2hlY2sgd2l0aCB0aGUgSFcg
Z3V5cyBhbmQvb3IgZG9jdW1lbnRhdGlvbiwgYnV0IEkgZG9uJ3QgdGhpbmsgc28uCgpBcyBmYXIg
YXMgSSBrbm93IHRoZSBidXMgaW50ZXJmYWNlIG9mIHRoZSBIVyBjYW4gb25seSBoYW5kbGUgNDBi
aXRzIG9mIGFkZHJlc3Mgc3BhY2UuIExhdGVyIEhXIGdlbmVyYXRpb25zIGV4dGVuZCB0aGF0IHRv
IDQ0IG9yIDQ4Yml0cywgYnV0IG5ldmVyIHRoZSBmdWxsIDY0Yml0cy4KCkkgY291bGQgYmUgdGhh
dCB0aGUgaW50ZXJydXB0IGhhbmRsZXIgYmxvY2sgZm9yIHRoZSBNU0kgZnVuY3Rpb25hbGl0eSBo
YXMgYSBzcGVjaWFsIGhhbmRsaW5nLCBidXQgSSBzdHJvbmdseSBkb3VidCB0aGF0LgoKPiAKPiBJ
ZiBzbywgY2hlY2tpbmcgY29oZXJlbnRfZG1hX21hc2sgd291bGQgYmUgd3JvbmcgZm9yIHRob3Nl
IGRldmljZXMuCj4gCj4gRG8geW91IHRoaW5rIG1heWJlIGl0IHdvdWxkIGJlIHNhZmVyIHRvIGlu
dHJvZHVjZSBhIG1zaV9hZGRyX21hc2sgZm9yCj4gb2NjYXNpb25zIGxpa2UgdGhlc2U/IFdlIGNh
biBoYXZlIG1zaV9hZGRyX21hc2sgPSBETUFfQklUX01BU0soNDApIGZvcgo+IHByZS1Cb25haXJl
LCBhbmQgdGhlbiB0aGUgcHBjIFBDSSBzdHVmZiBjYW4gY2hlY2sgdGhlIG1hc2sgYW5kIHNlZSBp
Zgo+IGl0J3MgdXNhYmxlLiBQcm9iYWJseSBzb21ldGhpbmcgc2ltaWxhciBmb3IgaGRhLgoKVGhh
dCBzb3VuZHMgbGlrZSBpdCB3b3VsZCBiZSByYXRoZXIgY2xlYW4sIGJ1dCBpdCBtaWdodCBiZSBv
dmVya2lsbC4KCkFzIGZhciBhcyBJIGtub3cgd2UgaGF2ZSBleGFjdGx5IG9uZSBQQ0llIGRldmlj
ZSAodGhlIHByZS1Cb25haXJlIEhXIGdlbmVyYXRpb24pIHdoaWNoIG1lc3NlZCB1cCB0aGUgYml0
IGluIHRoZSBNU0kgZGVzY3JpcHRvciBhbmQgc28gY2FuIG9ubHkgZG8gMzJiaXQgTVNJIHdoaWxl
IHRoZSByZXN0IG9mIHRoZSBkZXZpY2UgY2FuIGRvIDY0Yml0IGFjY2Vzc2VzLgoKQSBnb29kIHBh
cnQgb2YgdGhlIGNvbmZ1c2lvbiBpcyBjb21lcyBiZWNhdXNlIHRoZSBQQ0llIHNwZWMgaXMgYSBi
aXQgdW5zcGVjaWZpYyB3aGF0IHRoYXQgNjRiaXQgc3VwcG9ydCBhY3R1YWxseSBtZWFucy4gVGhl
IG9yaWdpbmFsIGludGVudCB3YXMgcHJvYmFibHkgdG8gaW5kaWNhdGUgNjRiaXQgYWRkcmVzcyBz
cGFjZSBzdXBwb3J0IHRvIG9wZXJhdGluZyBzeXN0ZW1zLgoKQnV0IGluIHJlYWxpdHkgZGV2aWNl
cyBvbmx5IGluZGljYXRlIHRoYXQgdGhleSBjYW4gaXNzdWUgNjRiaXQgcmVhZCBhbmQgd3JpdGUg
cmVxdWVzdHMgYnV0IGNhbiBvbmx5IGhhbmRsZSA0MC80NC80OCBvciA1NyBiaXQgYWRkcmVzc2Vz
LgoKSXQncyBhIGJpdCBtZXNzZWQgdXAgYnV0IHRoYXQncyB3aGF0IGl0IGlzLgoKUmVnYXJkcywK
Q2hyaXN0aWFuLgoKPiAKPiBWaXZpYW4gImRyYW1mb3JldmVyIiBXYW5nCj4gCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
