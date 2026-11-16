Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373C3606A32A
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 18:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4Gf9TA4z;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FBVFZfRR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:References
	:In-Reply-To:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U2bWHPqNqMZs9AO09l13QyhQweLJ2lMRFxi7+YO9dCA=; b=4Gf9TA4zSNkRMUQvW+DiMxkFCr
	FLDv66BSNJWIJyvmmxIVjmkfTY8jtFk1Vpi0pjHeW1eLqlb0+5BifCuD56bScio3ZOhwxg6ee1V+L
	3VfOuZ4FzFIrFqgs0ih8SN5GvuViccuUlzxKbtYCZ+vDsXLXfA5lOJDTdK8g6Mv5ECGBRkYw54TYD
	b1hLpWY0B8AC0kogXnlezDHge5WIJE68iNFCRRAr1jWGqx7+EmVPJLCvKVxiAkwWU/iLEtyrJizK/
	jBSj1R9q490Azv4YGi6AFBGtqvJMMA+PuGUDH8IMzkIPRMetV5msklLF2cgwndjuyO6p8SIuToIwR
	wSwjneuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1p1-00000003eQu-0Me3;
	Mon, 16 Nov 2026 18:52:55 +0000
Received: from mail-westus3azon11012035.outbound.protection.outlook.com ([40.107.209.35] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1oh-00000003e6U-3o51;
	Mon, 16 Nov 2026 18:52:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RjogHxDV0ZGnP2pFa9EIt2U8b1AUTmimc1NoomE94Q90JL5LfD3Qg2gV91D75a3QoDHi5Sgv8XepEjLeVWkQh1JaOKJgzlqy+OHJvS+eVQPwHGqjdOy+RR3yb5YYQNT2JMrN2n/mOBRxfvYA1NwKKD/EApVMW1ChpzsdiJLLDXU+KWh47kprPJ0oswbaddzHFQIYguZLvoIe5uyohYxkLjKBNP15j0yGLahEfPdU7ZhNI6lFOfEDrft4s3+3KkmvVMfW0nniP8dY0IQb9tq8Ok+V2dhuU0podl8TlOLzqhyVDFw8Hd21ecvTT+Nf1eiPvhu+fES7nZr6zWT21qaZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6yecPDtufTq4Mu2eP3dRypUzgJIVKs0db6NkdIPF9l8=;
 b=s2ktuwRQ69rBweXfAtlDvwPzFEhc+DsVvpC4d2eF2KpyZ8QM+ah3fcROOp8oqAPtNTP57+9X8+Q0t9T1I2oQ/Meg2wnfaxIj59fev6UadOMcMvQjIYjjJkNyHuhHQzpWsztXlDYNzTNX1dhxiRHFSQwcy/5LiGGIj1Ox8MXs2dkmNy9b6G/Wp2IxeoQYmD4/CvSgtPqEDOBmx4ma235IVtN62CpqadvafUD4txW8CweCb+NcGOAiSUgG4iDm/3TTPn9iic3rDgbUdt5uqYFq42xP+JpCVCwffsxaUv+AwZjoNGnz5vZlAH6/zBq1GKBi16o99e3RZ78lwW17dbMXMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6yecPDtufTq4Mu2eP3dRypUzgJIVKs0db6NkdIPF9l8=;
 b=FBVFZfRRFvooxONIpDl18IFlbJgUUE7I726PAOY2htBnjaHQ6eWbIUcDahwikFvn4D+RZEx/laOuzsUp1zrGoTf8Eqs2E/XxVQui9N2QuBXAGzqIeYRTUib9HhfeQOfsu7ReWkPWIbHPVpG6ltoOyF2+yfQnMiKuUrltGc1uZayDxzLQ3RyR32kiWqOIweeYvusfQRjIFWD8m+AKUViAV4AaUxZalXWFkfjK2tHS3GaiG4OWrn5Ld5p5CmwfGvF9nPrAwYsSKwop0r0RulGgbmSpHtkXrVsYwxwPQP+nBa3AQ/chXroO/dDtwgzRNxuyXdNkqaYZOncEGXi/fJFPHw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by IA1PR12MB9062.namprd12.prod.outlook.com
 (2603:10b6:208:3aa::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 18:52:25 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 18:52:25 +0000
Subject: Re: [PATCH v3 10/15] efi/libstub: riscv: Use struct efi_image_info
 to access image properties
From: Jason Gunthorpe <jgg@nvidia.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ard Biesheuvel <ardb@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, 
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
In-Reply-To: <20261116142618.1687025-27-ardb+git@google.com>
References: <20261116142618.1687025-17-ardb+git@google.com>
 <20261116142618.1687025-27-ardb+git@google.com>
Date: Mon, 16 Nov 2026 14:52:15 -0400
Message-Id: <179485513574.2274641.11188144066364939755.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: BN9PR03CA0597.namprd03.prod.outlook.com
 (2603:10b6:408:10d::32) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|IA1PR12MB9062:EE_
X-MS-Office365-Filtering-Correlation-Id: 2005bcc8-a669-4b24-6b07-08df4412bf04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|22082099003|18002099003|11063799006|4143699003|56012099006|261102123227099003|261022115727099003|261022075727099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: /RspeYJ6BZnXoRsAs+A/jEsXtJ1zBwi+bu/seoatzIK1XaEwy+VdUQ2C+tRxudwzpQhxPXq9zybENOBeitozcveAOqI1/bkC0vcFtIdsS19cJ81uabfjJ1TRhKsblABnKTot+H1rWsXJzscald9M45MtmLt2eE/VoUzZqs98Q5JhpaBHLZcEAReQpnO0NeE8wXpBM7hFZM99l6SrNztoQe5zfD4U/Fo8ZF9G5p3HFZR1qo4Y8xBJCrN90x4zJwog9MIWl9kYY+PXw9Qaz4dQlsMy+Ta0VJv1ZSORXZgcScyVsDQHm8lqW6+X3XJdYMTYpXQuEHvEfwbQ2bnbSxS6XjZ+cvlNqCsYpVUUOcvsf0zgeNY8/NpY+CHeQuOFY4BRQB5ZheAYn/YcU7SqYt/NrvO6mIjDqKoojRcMRoI2sTAMIJn+mVGRLKkX3YACY1UAGUfAEB/8b+g8QJJ6Gbrywn/ygR2XpDA/811xkmJhGAoNa2YcmUEBET6dnGikLLhGSlY0qi3d2zYEt3VSiyEFVpHLt881rJsd4I4OsrltxXw8UitX1eJ1+U6J1smdn+ylWpjrCGDYlk20BWQ+rmvIW2dA8137Vv/zVyN49i40p6qxc70BiLGmjN34Y3wCs7Q/TIcKRM9OMhiY3pGeiUtgvcfD7d0FCImOmRPfUfaNIt8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(261102123227099003)(261022115727099003)(261022075727099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1cvTzFUTEJ0NFhqYUNOZTJZSkZlL1pSUXkwZHhXOS9IbW16V09GMU1zUlpD?=
 =?utf-8?B?SmlvZFhtb0xUT05MNUQ0R25ZdEFNeGhZRU5MMXNQSEZmK1o2eXE2aCtvTm1K?=
 =?utf-8?B?bGQrc3dYYk12OWc0VG51VTJXNDRRcWtPVTUwQzNjaVprOTFRcVU0bE1Sakc3?=
 =?utf-8?B?Q0Q0a3pRNG16MDMweGhlNnBDRWgyRHlBSlBCZ0Jlbmg2VHpEMFRnVk5qZ3ht?=
 =?utf-8?B?dVA1OXpHTGQ3ZUh4Zk1ySXN4T1orNWRaaGVoeHRRakxkcHNseWVUMy9sNXF1?=
 =?utf-8?B?aVBrcmcvS3dJQnRzWGJPTjBwRkEyOXRrN0pKMjUwTGVidDl5YWN5d1A2NVJ1?=
 =?utf-8?B?YVhUaVhKWGZaRGtnRWdoUGxvYk1raTFEQW12Z2d1Y1d5Z295ejVWUDAwMGxY?=
 =?utf-8?B?MTNQZFUxWHdLRnpkQTJ0cSswS29pVHBRL1o4Mkxzcm1WUVl5NU15YXJMMDFh?=
 =?utf-8?B?YTRyRTBmdXR3LzRYdEdjOVNkck5mbFR2Q2grSDBuQi80L09pZ1ZZSkM2ZUsz?=
 =?utf-8?B?SXhiUk0yVzhXZllPTUo2aHIvVWZhVnpUVWNNdXgxOG9maWRBNXBYdkRQNjY4?=
 =?utf-8?B?ZEQ4Nlh4TGdQUS9zTGJGWGYrbENYRVVDTkVsSWJETzdoVW1heFRqeVRSYTFv?=
 =?utf-8?B?aU5rdzRnVjRpS1BzWDRCZ3E5Z0RXb1dJV3pRKy9oYm5Pbm0vbWtKbUUyaml1?=
 =?utf-8?B?cjlxQU5KeHJETlBIcG95UkJzWEpJcHZDRHhTMFF1VUlBbWZHdEFrUm04TVJm?=
 =?utf-8?B?ZE05N0MxQmt3ZFl1UTE1c3FEOTlrd1ErZkxGK3ptaFpiY0UrWXg4b2hma0tM?=
 =?utf-8?B?NjVheHlNUTNGTEpoTUxCVytOc2tzOFVjUlVwaEUxeGhNUFNmVjc1ZmhWMm5u?=
 =?utf-8?B?WFhVRmx6Nkl4UnF2RVhiZ2dpdVFkZzVBR3JFT2NWM1lFMHpUOTUrSHgwMXN2?=
 =?utf-8?B?YTgwNDFnYWtHQXFnbUpkZzA2QUtzTk5TQjhvd1dvc1pNbGNsOHZlL2R6ODZ2?=
 =?utf-8?B?bWpvRklQMTFIeU9YM0FxZ0YzQWY4a21HSVBsTVFSRjRkUm5jcnJ2TThqaWZq?=
 =?utf-8?B?b1B1WDBFSE5laTJlOGltRXVEWGIxczdnNUN4OTczVEhNNlE0dERMVDJVTjRw?=
 =?utf-8?B?TTZIVXA1eG9UNDY2SXJzenM3T2VNVEYwYlFzOVBaVDVwZ3pYdWVYWlY1a0VK?=
 =?utf-8?B?aVVVM3VKM0hoWVE3ZzlLVHhWR2FOb0hiQlpIT0JreFNrZ1NXVW5tUG9ZbnBW?=
 =?utf-8?B?Q3dENm92NlNQYzRlUFhkZ2dxaG1UYlpVdFZNMi9MbURHcHNQSGkvQStVNCt1?=
 =?utf-8?B?Q0dsVkR5VVhQZTFqWTl2UDZnY0t4YkdMdmg1d1NyN2tqSUZBbU1WVVI5dU5D?=
 =?utf-8?B?NjE5RnZER0dHYSs2d2RtMmVFZlRURU1DUjljdUJxSndiMmFoUW5KdUtrQSs1?=
 =?utf-8?B?NlBuQXN2VEIzOXduR3p5bDRaaXFCSFpZTjdidFErenhsSGUxSkJqZUY4Tjhh?=
 =?utf-8?B?N3FSUHhsMmV0dmIrT2lLOFdmRmRURGVyR1JoenlHMkNHaE5iNG5WU1A1RmhZ?=
 =?utf-8?B?TFgzV2xkRnYzSHRVcW9SQ0xqZG5WcTEwSHVZK2t3ZEZ6SG8vcmpRdjl4ZnRl?=
 =?utf-8?B?aDNqd2x2VUJqd0hBMmNrWWN3T21oK0NSZHlYalZSMjBPWHRvZnlJaU80VDdP?=
 =?utf-8?B?NUozT2h6Q2VmZEdtRjkzcjJYb1pZY3BPOGE1QlBWNVk1d0I3Wkh4VTVVdXdx?=
 =?utf-8?B?emdGN3E1UTJCL3h6VElRQVJVU1UrMzVVMHdZMExzYVVoVUpYNGlkMWNEMEpr?=
 =?utf-8?B?aTdZVFdLYTAySE5pR3ZRaWRheDBRZWJIUkFweTVzclRFUmgwcHo2V0tUQWhq?=
 =?utf-8?B?SjRDYWx2dE9DUnlJY3luUWRVVVgxR21yUklCclorVkRnUlRxNmFud1MwVWxk?=
 =?utf-8?B?eXg1TGVSOWNrUnk0SEFoUUhYUDE3QnNqZzQ2bUxsOEc4ekFpblM5YmlIZVJX?=
 =?utf-8?B?Z0VMYnNzM0d6aWNvUHlBZWJQWGNTN1ZvMVcxL2hqd1VCUUdqUlRMMUh5WjZt?=
 =?utf-8?B?SHpvUVRoaThFeitBWWRaRlN0alZFUnJFN3prRWErM0dvOW5kaWtDZ3RHdGlm?=
 =?utf-8?B?V2JjVVMxUXZHNEw1N3Jmd0dzaGhYQm9aZ0puZkhoUm9HTUtFLzljckhlOGRj?=
 =?utf-8?B?K1E3SEJiNzl0OExkakprdmdYdFNFaitGZmYyY2prdW8vQVMrWDRwVnkrU2R3?=
 =?utf-8?B?RnUyb3lnZ3MvbkVCUHBVQW1DelpsbDhWWkxjcW15a01naTF0UEtlakJyaXl1?=
 =?utf-8?Q?fX3kLPrCNXdyvPky21?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2005bcc8-a669-4b24-6b07-08df4412bf04
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 18:52:21.6216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gnqa/Q4h6lQCnKkYl6o5yBef+IbrVlPUT2q3PlHRPHcxV1X2O3ZU8hfPPNSHQmQX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_105235_964495_B2171C57 
X-CRM114-Status: UNSURE (   6.77  )
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

On Mon, 16 Nov 2026 15:26:29 +0100, Ard Biesheuvel <ardb+git@google.com> wrote:
> Instead of exposing individual symbols to the EFI stub explicitly via
> the linker script, use the generic struct efi_image_info, which accesses
> the original symbols via PC-relative references from the stub itself.
> 
> This improves code reuse across architectures, and makes it easier to
> add new references in a generic manner.
> 
> [...]

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

-- 
Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
