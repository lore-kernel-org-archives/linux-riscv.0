Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C788606A338
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 15:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WZ5f6aMS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=N+oYAMGM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:References
	:In-Reply-To:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GVDfF29ar++vS5IuqDOCGWRtEV4XYnTKBM+cBUQ+D44=; b=WZ5f6aMSAloNAUaRrNrlrIvlX4
	FrfVbTxY68BTBeo8FFps0TlWNQ+nOgIJDuYdkOlBChEzsv9IR2G6VOZ+jkuQOrNG43FF1CrujI7KO
	sic5wouqvc6P99YjHymkHYyo6wun/sUkYtBwrAVED+pQTSJpufVK/lYjm7FG8yQieVi/+CUAIhs5z
	tlhgNxtfSvLqxyv35TrJILmk3H4TbsQMeMt7/heh4vjTQAfxxi8rhCEMhau2rNaGzaye/oWTa2Pcn
	9Ov9DaYJX6971RZKzK+kPx85/6aTSKccrq/DowlQFIXdwMJvalD6JQDycIqlx+rfMegsnuw7AAR3S
	dqZ1rWHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsvb-0000000DKLw-3X0t;
	Fri, 13 Nov 2026 15:10:59 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsvO-0000000DK6v-1l8Y;
	Fri, 13 Nov 2026 15:10:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYiYQkcfjxNbw8v8k1ukXBHlMTU3h1FKltcSY7X4E8U4daRFC8U+ogAZa+ed5qN/pZSdmnBz68FOVC3gW+TSjL4ND/0UeK+p0/kgAeHz2kdshxeQKq4hcKR5qz68kaMfA19UrFkRafM8/n57TQxXPkx0AbVYlGHb+bfPavTpSnITHo5VT8E6fe7rWLNZX6OZwh5Ny0gmoTem6L2K2URtAgiCnx+W6rqzJJqKYx77rwYsPD9IjA81S7aul5gVzCMqGQjf6/4PIEWFUcbujIy1BnARZ86wWyfFgiFa5TarQF9AZwKJs9Zy4LQJyY0wBU1m8QcCiwYJU/y9R0bDpItZSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dUFtuXkANDgq0Ml2JY4lYxOhaWil1YU6vUpP+fQCYY=;
 b=zEeRZ8xX5WjBXUN/0Dv18DRgejoDOkf6+3RENWR/eQ3XIBR7qjvaLwS9nsWkzs7WjlZpxt+E1VgyGcO35CYp/xWd/S53HkQfAUH6sWlrncy+wT/cFZV3Moy6za4KaXJSoAXmCbbBFGg7FfMzbbeMpXML79h+fOkCZFGgKLoi8C+H6dRAedj1GljyKK/UhtjgHJG9LVmT6m3SApbgcqfoIm1xqXzCrgZvh9yKQbI1ux5NQGtZYGwYPobzEOWO3fl/10YKu4eMTFt2OMDQqX6XV8lGoWBcUKFysT9CYSsasDX0kQXweowB3dEq01JxNOGVKR+cfV1Si3ljvIGR8Gs71g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dUFtuXkANDgq0Ml2JY4lYxOhaWil1YU6vUpP+fQCYY=;
 b=N+oYAMGMjzgXZ7fADg30mzg6yxkSs6UtIxz/dC3KYWpcD3lx8sZ9gdK0GZwv9nBoSIA5Du4cle8QXYPYMRGTh04RKg8wpeEpZRYKawYFhpfVBMtplEQkpeURwjJrT8nsM7y4ujqMRRZ3F3ksEPacCUTRXEOoST5xvQigKcdSqdoGjKK5hCrumpMpklvQm19RG0uBID0GV+tssCBEXK9I9qFjdSwdsLJ/ZIQUsE0W9PxDzeZXIxxJ+HktXGSl465MHV1CpA+MQhrp7bKK/875/V7W67oxuq40Pvpv/9wMMF+IQLskUcV27wOyxMZyumz/dUG8MYolooAV11KvtY5HrQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by LV3PR12MB9332.namprd12.prod.outlook.com
 (2603:10b6:408:20f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Fri, 13 Nov
 2026 15:10:31 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 15:10:31 +0000
Subject: Re: [PATCH v2 09/10] efi/zboot: Disentangle efi_remap_image() from
 efi_cache_sync_image()
From: Jason Gunthorpe <jgg@nvidia.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ard Biesheuvel <ardb@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, 
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
In-Reply-To: <20261110121731.2728824-21-ardb+git@google.com>
References: <20261110121731.2728824-12-ardb+git@google.com>
 <20261110121731.2728824-21-ardb+git@google.com>
Date: Fri, 13 Nov 2026 11:10:21 -0400
Message-Id: <179458262198.3625095.11219236938942762932.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: YT1PR01CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::9) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|LV3PR12MB9332:EE_
X-MS-Office365-Filtering-Correlation-Id: 272f9103-0e14-4d83-3530-08df41983ed1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|11063799006|4143699003|261102123227099003|261022115727099003|261022105027099003|261021121427099003|261028144727099003|261026140227099003|56012099006|261022075727099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: YS+KcpDJeW76+CvqkEXsmaUHrCouvGrWY2BY7iiwZ4hBq9lX8QYCoYSXbhO4FvkUYNzBoMsazQAQM7zJy0uQnmr/150cWpZJrWANYbeu063il9CYNRRHUPO8RgExVLGc8EdnwZ/t3alWys+wH482e9R6Ec50oiqfveQ2G0ENnsS73He/wtldOeXvsYCU14MZ9qBGcH+Wrj9yVU4TDsFTGFF60gytJ7buD69QTTgflCj9py50uY4kBcijkJMNi3lcBc4YhmQc9AOWs8shFhpAqVCA6GKuvH9t+wQZPNSlxOEIV+xKzmeNGriJOwU0nArNqX+CZV+jwvvfABWoeydrSKwYEqBDld9xsIvfz8cnh5xSMCcRrxX6bb43dNPcjvW+5XGZOWq/kjcPru9C5X5IC5whPTrggRf4LJpcLoqUC2L67jAaWapX4kO8gFuzYwooHb9G/jskf1X/Ok+3yzoJf9f5nIzzZ7ZCGFq/oDAMuo00lSrz1al2GQJRfq4YVkmMuLiqCiRHaXfkfjvKVBHV3jX/TUMqlwfTWN027HRmZ2fqIhJNeWW/hkbm92on/7uTV6sxGCVZo+IGMizJjMbS2IvkwoHA6SrkezKAnSuPyCQhHCemqM6jz31eA0DBNSqwVg98IAf70YsF2xKRA/gcT73YO7GAYxhuiSO9Th5DpXY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(11063799006)(4143699003)(261102123227099003)(261022115727099003)(261022105027099003)(261021121427099003)(261028144727099003)(261026140227099003)(56012099006)(261022075727099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1MrdFFjcHhIanRLdklnRGNhZEhNYm9wQWd6ei8wOExvRmh5Ym8rTXFuRm9w?=
 =?utf-8?B?QVVVZUpQLzV1bkxDUThzUFV6T25tMlUvUjd2ZmtFODBLQ2s2c0ovUVV4SFoz?=
 =?utf-8?B?MVpLVm9QTnE1Qi9ROTcvQlhWbkdaRlIzQjZlbFZEUGVxT1FnSXp3V1hGNERv?=
 =?utf-8?B?TUtacTdDM05rUjBmeDUrZFRuandMTiswa2ZhTDM2R2tVU09tWDM1R3RwYjJo?=
 =?utf-8?B?Y0lVdzlQNmE3M28wMGRFNG5QSEtYV2RLNFVqeW9Ld2FteS9hZS9mOCtFeXR6?=
 =?utf-8?B?TEYvYVF2VEhCdkp2aVM1MUM2YU9BUTBPcG16L0xjeGtWM0lhSi9HYkZCY1JE?=
 =?utf-8?B?MkRXQWxpa011SitzRmxNczJTUlN4NXBEUk5uREREeHNVNzBoc3dUbjRZN3p3?=
 =?utf-8?B?RjV5b0sxRkErUlhPbEFhMnFxSGxXaWxoNG12NzgwakVlbzlnT1hqVE9KRm1l?=
 =?utf-8?B?Vk9FVWxnR2UwV05idUt3b3Rac3lLTitKZEM4ZTJxdVRkd1Z3RWZ0VWVLaEFN?=
 =?utf-8?B?VGgweU9vYlE2bVdWUk5DbXdqSVBJS0RtWEI1YUxNRU9icXprQ1JwaFB3NmZ2?=
 =?utf-8?B?MVBRS1MrOXZ4ZjU3a0Z4cU9kenM5L2JrWm9CRTB0SW8vemo4ZkpXYzhQNSth?=
 =?utf-8?B?L2NseG9LamdrQVVuNHR1RGdQQUpGVlJScHFEbmxuRnpCYlFhSEZkUDljL09H?=
 =?utf-8?B?QmVJbXVsRU1TUHJsdXFnWlY2b3l5dlFrNVZUWjVxb1ZpaU1XckRXN3RDV3RT?=
 =?utf-8?B?OWo3ZHFWZGw2eHNxZ2VESS9IYTZ2TDJHWnJia25sSG5pa3dBUS9KV0xveCtT?=
 =?utf-8?B?Ukx6WVBlNW1JNEFXQ0IzWk1xMmlkcllLMEtBSVRoYUlHelE1QXUvNXYzQzll?=
 =?utf-8?B?SzZUbU1FVkJiSzZ3VTFxd21iUXhzd0pibzRNN2hGQUNtS0pLbjFuUXVWTFlU?=
 =?utf-8?B?ZjlIeFdmdlZUdG5LWHEyMHQ1bThTa1pXTmQ0THFDM1A3T1hRSzJVc3JGYUxL?=
 =?utf-8?B?WE5RcllQbEViTUY4UzVWVzFlRTNZWlNNN2tiRWplbFpNWUNJY3RwTFdXNUxa?=
 =?utf-8?B?QmtsZVUwcVgrUElRYVFIeFZkYVhBZkJ3Vk02YnQ5YXJrVE1zUVV3UDlpMUg4?=
 =?utf-8?B?UUh2QVVUdEthVkcyN2FzRHQrU3BPMFRKTlo2OWJxUFdmcy9UMnhuNFUzUzMz?=
 =?utf-8?B?c2VFQU1IaWd3ekF0RWdzWXNmR1ZkVDJPN29qdWNLNGRHQTlxNXpMN2ltZzJU?=
 =?utf-8?B?d01Hbjh6Mi9DTWJ4dkRTRk9tRnFJbm9iM0k5WmcvUVZIcHFOcmhIdkJnSjgz?=
 =?utf-8?B?RnJ2RjEwN05RdlBJQ0w1NExvSTdxRkFNczFCZTVmbnpKdjdmL3VwT3l1S3or?=
 =?utf-8?B?MVo5VUhNUXNSVzZFUWFZV3drU2VjNnh3dkNxSXlaTlJWTzZUTXcrZ2dFNm9T?=
 =?utf-8?B?ZGs0Y0tmZGUyeFNBNXp6anZseVNFN0ZxcnhGTEFYRmhkYnhjdmx2Y3lnTFEr?=
 =?utf-8?B?aEFmY2lYSVBVaVk4NEhNSkFkL3B2MHBXQWZ6cE9rTmNRV2NKT1dqM2xPTmNa?=
 =?utf-8?B?ZXd1TmFKNXJwL3hvS3ZNRmE3bkh4c1BiRkFtSWJaVENEdXFRU21aWXVCTlFU?=
 =?utf-8?B?NW5DZWVGdjV3ZEU4bDhzWmtHVXo2STdQbGFmdk40OTJsblBTQ1F3R2k0SjNr?=
 =?utf-8?B?QXllVm9acjhOcTN0TzZWajRwZlhPVWFrTEpHaUV3Uk5CTXVGb0F2TWcrSEph?=
 =?utf-8?B?VTVhSFhPK25kTjF2ekJMcFJnc29NcGw4dzZIejJvSkZuamtEYmRoYlU3ckp4?=
 =?utf-8?B?YVdEa0JHSy9uYmhyN2NXcytxbUZvSUQvbmgyTWdjOUxqZWtMUk9MTDh2dWFM?=
 =?utf-8?B?OE9zcDNpT0hPQ2dpZmRLaUVPVGwvdkxGVlpUV0NvV0lQYkFCOFVaQXJrTEc3?=
 =?utf-8?B?U2F2VFF0dTgyOXVadi9VMDN4RDI3SmpQR1JmNWRyaEROMU5WR2FkT3dRR0ZX?=
 =?utf-8?B?cERQb21vWjdXUVluZHFBSHdxRFJlcVpyUi9hejdDaVBGRG1tNDJOYWdUWXpJ?=
 =?utf-8?B?MkFzNmUzdHNDOTIxYmVBZkdVYnZLTWl0bjRBaDhQd1kvK0NHdVVCRnVTTWhK?=
 =?utf-8?B?QjNHVkRBa0xPOE52UmdtSlV6cmRWQWRHa1htTGZlRDE4QkhOR2JtTG5IZXd1?=
 =?utf-8?B?NDR2b1doUnhoQXN4Z3lRb3FEajJUNEg3YTNIMHVxZTIwOTJibVBWd3lMVlgr?=
 =?utf-8?B?TVB5K1NlSWUvUkZwbW9ubnJmV3lEcHNXbzVOY2N6OEJzZUF2Y2JVRnlzNCsv?=
 =?utf-8?Q?oJMPGoPTZpIte0Scrm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 272f9103-0e14-4d83-3530-08df41983ed1
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 15:10:25.5782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7ifIhsroaxtnsWC+7UcIZt5t9UIcuoNp7J8X9S8CnLg14BDmrzNPevfdK4DcwFd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9332
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_071046_465699_08C215AE 
X-CRM114-Status: UNSURE (   6.42  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 10 Nov 2026 13:17:41 +0100, Ard Biesheuvel <ardb+git@google.com> wrote:
> Refactor efi_cache_sync_image() so that it is not in charge of calling
> efi_remap_image(), which is really the wrong way around.
> 
> Instead, call efi_remap_image() from the primary zboot procedure, where
> it is more straight-forward to obtain the code size from the loaded
> image.
> 
> [...]

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

-- 
Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
