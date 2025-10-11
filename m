Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D89CCD185
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Oct 2025 02:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3VbOGeLX0WSiIPUdWsl7yPfyfeAaeVTbNf6Hg8JJTk=; b=nvZG0dEMeW/wYjeIXtmlp5/TAn
	xcG1/faH59L3xihw030hyNmb46SN9znj61NrQ/Rs96qDSyu6P2r+SjbSdu6A8GGhNufqIY6TS/Jhl
	1pPM0OSEMHlyLc1ZX3vQWYEnTuwizyJ/sXOZOwhLOEi5WznYp6c0wvLpIoS5/6I6p6AAOYE7n2dA6
	ZIefJx6RV8cuPOfZRpfy25DLnYXGUPrHKsSsQNTcp+X3BBCYolS6lsMLDDZmNFkErKWm+/ltGktnI
	JXgwX9q2tAybF7InkpHpktOXEPJgGe83fxO6u+P8RHiqXxP3Fz0xBvxKPi1YjWGG4hn56QU+gFJMe
	pjh07OmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7PAb-00000009h1P-0n8v;
	Sat, 11 Oct 2025 02:17:17 +0000
Received: from mail-centralindiaazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d409::1] helo=PNZPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7PAY-00000009h11-2Md0
	for linux-riscv@lists.infradead.org;
	Sat, 11 Oct 2025 02:17:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHBSek20yDB2JyBROv9SVzt3Cipyo2hZHEjcb5VjIfr+Oi2BpnnZP0N+1Mh3Mviva8xoU1lBo1D2h5b8MYT8BpU29Bp9QeFzWuqyqoep3PcIFRTxRsRcyT46/yMmS11apvIBEHv6nTk7DJitApPutEy/EzU1TkOa6fgbh5bvzsZ0JuhmbsazhVt/ENRkIq8k0R47yfTvf6I4ulprXhPdiS+d2Z/7sahiksq9Sn/eYI+9usyeFt8X+H5HHRJ+YbHhFiyu+AvISHD9crLPZJVN9RaAr5bOlal75vaaT3L0s8Mq28Xon/A0UMYnib6gODw+Ld+La7qEVyFtyd40Tztysw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3AbeAAmH0cxnvpNFKHLRp/KHoz23KXUZgA1Vysod4E=;
 b=oHmvQx5cbdHHPDeWpVF9QK7E/pHI6UcnNcz/VP/gqJkBnmJUOKnIBaEJC/1QDjXEy5KhTuOZUNUcbgdSz1vpcnhnDsP142YPa0EljRGTfNgEr9we5uat4leF7+sr6siQYTquq909WBLCIubDXP6GxpkaD9QhvJR+Y8Yg/fZVG/v0xs3CWNykyPQzR19bo/N8tuGu3toipRwGlL5xQfE2Iv0GGaF2zppLJpo67mCsaOBwvdV5YCfYFJ8dfQ5YeyRDVClBVXTlxJss4bthDfaLlc6jCD7I37UnZi9GhRaQQfUqMc9okLMebwySceaS05N6W0t+96pc27Ytwx5InSEezA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3AbeAAmH0cxnvpNFKHLRp/KHoz23KXUZgA1Vysod4E=;
 b=ebUxo0uNSVcrmHbV38GHpoqnBX0eX+i4n8tiH47Hwcta98m6IOVzyNbbZZVvNXKKg5rPxxUpO109EJ2uqgJsExBco6z/LqLF9qBDy3zGR4Gp9ikOhoWjl4P+dpKUbMBU9sbocwgFynVRtripguTW3ELoeLFdpjl+4f0KEOdaJvxztzSh/bCAc1EVF99z4OdvYehZpSRsL0U2xIB3rLVYgG9sYxziMU+DPcfpMBf1oQ3F9J1wdtXgLOFx634hF7t56985HUrojoYnEDFMi71qnUr/9fm9rhxGBwYRB0tkDV28Psd0HkRlVnXzypEXG3ecXxpKhsa/4a0zViXKrRkBkA==
Received: from PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2f1::8)
 by MAZPR01MB7215.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:41::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Sat, 11 Oct
 2025 02:16:36 +0000
Received: from PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2e35:fc95:ee3:bf0f]) by PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2e35:fc95:ee3:bf0f%6]) with mapi id 15.20.9203.009; Sat, 11 Oct 2025
 02:16:36 +0000
Message-ID: <PN6PR01MB117179F3E93FF4EA3AEFAD0E9FEECA@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
Date: Sat, 11 Oct 2025 10:16:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add initial Milk-V Duo S board support
To: Joshua Milas <josh.milas@gmail.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, inochiama@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 alexander.sverdlin@gmail.com, rabenda.cn@gmail.com,
 thomas.bonnefille@bootlin.com, chao.wei@sophgo.com,
 liujingqi@lanxincomputing.com
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org
References: <20251011014811.28521-1-josh.milas@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20251011014811.28521-1-josh.milas@gmail.com>
X-ClientProxiedBy: TPYP295CA0057.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:8::8)
 To PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2f1::8)
X-Microsoft-Original-Message-ID: <f49d47d6-8b93-4d54-a128-7f5741413cd4@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN6PR01MB11717:EE_|MAZPR01MB7215:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eeaa133-0a7a-42e2-3108-08de086c32c6
X-Microsoft-Antispam: BCL:0;ARA:14566002|12121999013|15080799012|19110799012|23021999003|461199028|6090799003|8060799015|5072599009|1602099012|40105399003|53005399003|3412199025|10035399007|4302099013|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zk96RzZOWkZTMHc0T3FnWmY1a3Zha3ZZMzIxdjh4d0ZHR0YwTmlYVXArQnd2?=
 =?utf-8?B?bXZIbkFtek80NjZvTm9uaG94S0JLYjYxRDZHYXVyb1BWK3BkSk0xVlhkSGhP?=
 =?utf-8?B?UmtLWlo3M2lwZjVDdjRILzFiTSthMzRUeSswVlNFUlQ2RFFUYmh0MWJjZS9p?=
 =?utf-8?B?eW44Z2hSQURhN3AySisvQXhybHFNSTRCdHVaaUgrUkpabE54ek1UbW9PVEdk?=
 =?utf-8?B?QUhVZTdKd1k3bmdvYXdRS3czbVZYZHRkTGYrWHlvRS81WjhuejhRa0lpWWVq?=
 =?utf-8?B?UTdBNnhJOEY5eTduSjM3c0hKTVFmT1d0ckY1bDVMOXhnQW9pNGV5R3d4V0pB?=
 =?utf-8?B?U2dEY2hjQmhwa3kvL1FQN2ZDR1NBQlZyMkZvS2NHK3ViMyttM1dHb3h6WTBE?=
 =?utf-8?B?ZkFmTzJhVVpaLzB1UExsQkJ5SlRQd1VwTkdtSlorbmVhUUNtNFl5cnVlUklk?=
 =?utf-8?B?alZEajNqMzdwbGcrcmFtd2h5NitJSmxJbnpwNkNqVGE4OWl4emdyVCtxWXh2?=
 =?utf-8?B?eG0rWXBBV0tzL0lleWlJUlNnVWQzK3FSV24velY1V1ZHcVNTcmUwVGlvaXBD?=
 =?utf-8?B?QkxONHVjRU94R3ZLbnJZYXVGZEpCeW1GVVg1bHNOUkk3bE96VS9oTnBsOVNC?=
 =?utf-8?B?dWQvU2xUTEVla1pzdWJTMXhrWkFtWDlqNElRdmxtV0NOc25sV0Y1elRxMXVw?=
 =?utf-8?B?WUJDc3J0K0RPRERiQS9RU2xvMTczMzVSR1BaSGtJL1A2T0F2TDB2UzVta2c5?=
 =?utf-8?B?QUlQWXREOTRpTzkrMDF6ZGRvVlUrUjFGaERIajdGWGJyblBZRXd3Mlh3U0dw?=
 =?utf-8?B?Z0FNTlVWSFdKRE1tSFI1aGdyNms1UnZhRlB2bXE2UFpqa1BGWm1WdDFWSXlT?=
 =?utf-8?B?Qk4wL1N5Q0dXMVV5Tm5wL2VYSmdaYWZOUng4MXBFWjk2RVFoN3lWdllGeGs1?=
 =?utf-8?B?ZEZETjNkMFBpNHlFTkIrYzEyS1J1UEUxZTU5YUJ0aW5RUDRGUUdlY2pZcjlN?=
 =?utf-8?B?Y2RWS0pjdllLSGZ4a2Y2a0F0SDVKVnJxWHJpSmdtMytzWGR5czJ0Z1VBN1Ux?=
 =?utf-8?B?SnhOZlM4L1QxVjRScU5jM2pDVlU2Vm5ibjN5MFVpSWVsbDZTTE1YTUg5R2NK?=
 =?utf-8?B?VkJodGFTYWRYZWJKcjVWYWo1VHZBTkdnejZoM1JLeTIwdkNVaGpUcjNhd1g2?=
 =?utf-8?B?YWpNR2ZSSUwveFkyeUQyN0J6enVzWU83ZWFhMTREbHI2K1A5R2FqekZmY3Jz?=
 =?utf-8?B?OURXRjc0R1JsRVhhSWNzWlZWVUo1Mks1RDNmWWx0TGYzTG9LT3NHb05OMjk5?=
 =?utf-8?B?aE9tZk9sT3BrdVBkai82SHY2SXFyWGROWGxhQ08rRzl6ZHczWVNHTHFoN0Vm?=
 =?utf-8?B?UkxsT1ZXUWdSUWYvVFlwajRHdFpnYUIra05pbkcvTjkzVHNoRjBlSGpWME4v?=
 =?utf-8?B?STN5ZXNyWmFkUVkyNk1qbVp2VldBTThBVW1pVGgwbUtEWTlZUHcxQ3gvUkhy?=
 =?utf-8?B?dnJ3Y3ZSWk1KRVoxL1p2ZDdBWldUcXlFdVIwV2xSZ2o1MEU4YjhFb1dxZUx6?=
 =?utf-8?B?RFZqK05US0NwUDhKUmdISVFXL2IyZDJickFvdXZsbC83QjVLRHVoVG9wb1da?=
 =?utf-8?B?N3BwblZxanhxd3kzclRLcUZTVHhyRE1hcUdRY2FVeWxjY0lqWHRWVXE1dENN?=
 =?utf-8?B?TDduQW95SlpBYkRwVmFoRXZpVGpmMC9Sa1RNRVQ2WFp3M2NURWlVdVZSYmlR?=
 =?utf-8?Q?7iPBF4wgFEReyVpWGRnB6Fd0A7oH15yq2ttEK+C?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2svZTRQSDlsRVhJOXRrS2d0QUpOWC9xZGdTeGI2cUpla0dwaFk5emdPeTkr?=
 =?utf-8?B?bzQ3N2dUWjgzTFhpRm05ZlNvRnhOTjcvNEprbThlQ1NSNzVOZ1REc0svcll6?=
 =?utf-8?B?YTZmSktHYXgwRU1ZL1IvMkl2MDBpNkRCcW1PNzR5bm5Db0NZUXNxRThHMzdJ?=
 =?utf-8?B?MXZWNkxRT3BKTmYzL2lDNGszUmgzdEZjNUIzRk1kenJmQlplU0tnZ2JpY0RW?=
 =?utf-8?B?RHFMTkVjWk8xblpLZWh2V2dxVWpNM05ldW5DQkRUVGIxY2tOVGJqTjJ6cUxo?=
 =?utf-8?B?cXQ1bEg4MkxVUXVTcHQ1TmNkdzVjOGdXWFdJdW9yNkdrV2FkMk1ueFhqL0w5?=
 =?utf-8?B?Y2VQdHBXOGVHTWVocGxvRE9TSVduZnFIUjJSbzBhSVdiSkRtOWpHbFNyWW1w?=
 =?utf-8?B?b1dZMGxnSzZXY2ZkUFRrakFNem9INitaMlIzZDM2U0sxalJyUlFIaGF5eWF5?=
 =?utf-8?B?cGJiclVOWlFZZE5RcXo1bE5OUnpZTXNGS2YvTTNaOTZGMVNUWi80RUhLQTl4?=
 =?utf-8?B?a2svUHkrY1hiT1l5cWZiMitCb1hSMUZ1Z002WFBWYnJWOWc1WDdydG0vdmw0?=
 =?utf-8?B?emg3eXI3aDV4ZE52dStJRXZaaWFkRjRxNzVNZzVMbER1TWVIVFNMK1NQZEVy?=
 =?utf-8?B?WmplYU5UVWYzV3FkOFZVbVNLRElFcWxvbFkvd2dDR0c1Y2dPQTJDNmM1VE9H?=
 =?utf-8?B?d0RUNlR4d3NEK09kOW4xZ1dYYmFjYTM4d3JJZ1RwbWNOcFpiZElJMnNOUlU2?=
 =?utf-8?B?L3Mvb1ByOEpNdVYwajVoNlg1UWN0ZlhKamtpTSthTXJXZlhiVExDQ3V3S1pm?=
 =?utf-8?B?bmRYK2FrZTFHcW1VaHRQalArQWRMK0hKcFE1elhRanhzVmZOQmwxaE1GUUpE?=
 =?utf-8?B?UExsaU9HOUltdkJPWitPYnVTaWFCZHZ3VE02bEJUV1cwMTNLUCt3NzJUTXgv?=
 =?utf-8?B?bW1TaDJOd0puYzRWbDM4YlNzeHVCQVAvYkNheWxQTy80TVVLYlhlcG5USXFR?=
 =?utf-8?B?RVNqMCtqb1FaM3ErSnd6OC9yeXFwZzNodVVMSWVvNVRDVU14OHlwT2hWTE9j?=
 =?utf-8?B?aDJZVUlqajlKTmtkaGp1S3VDY21WWC8zRXAzcnNBL1I1aWcvMG0zUzlUM2t5?=
 =?utf-8?B?MmhxVmFyeExXNjJvY1FGOGVIbHNnSjVZaGZtUHdzV0pieWVJNFMzV3hnS082?=
 =?utf-8?B?SzVTbGNNd1RUSC9TeThzNXVDSUFpOWV0MTdBSzFmMGhtUS9BSmxqS0Ezakpv?=
 =?utf-8?B?R1hnMDd5MWNCRnJuSGg2eldIMXVBaG85QVZWUlUxbmxUb3NKYnRTM25JOENw?=
 =?utf-8?B?Vy9FTVQ3bkhFQ1lWMEVaNkJ3WHFkUHZxNitvMEs2SGU3aTBFUHFVWFd1OW5l?=
 =?utf-8?B?MmJWT2JzVHY0NjV1TjljenpPR2diRW5LN3MxZDMySVE2NUhydTdYckJMWUc5?=
 =?utf-8?B?bVNMa1VyazlXdCtlSVQzT3cxRjdFb3ZXdWhtSllzM3NrSlFLdG9leTAyZFJh?=
 =?utf-8?B?TTQyZEd2MDVyTVhTN1FUMlJXblN2bjd3RHNXcnRhNUFwUGRYaUpMWWlTcE9l?=
 =?utf-8?B?ZGFROGJLV0dxV3dYeUt4Wk1UNVNpTjYwK2pOcE1tQ3UwVWoxQkEyT2VFYU5v?=
 =?utf-8?B?L3hlaVFXaUczYXVsUkJRTlM2QXNlR0VKSXZEL2srQ1VjL0MrbUpuak9BSGNv?=
 =?utf-8?B?cUFEU01PRHdoRm56eXpZSEVkUUQ3OWpjUHZOZXRsUGM5RXI2YXU0UGN4dWQ0?=
 =?utf-8?Q?nrGAwm1Mi45ih4L3fF2f8ltZ28CvIzXT+X0HlSS?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eeaa133-0a7a-42e2-3108-08de086c32c6
X-MS-Exchange-CrossTenant-AuthSource: PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 02:16:33.8106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB7215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_191714_603178_61B7C8E5 
X-CRM114-Status: GOOD (  13.57  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi, Joshua,

You should add "v2" in the title of this patchset, pleaes run git 
format-patch with "-v 2".

Please do this in next v3.

Thanks,

Chen

On 10/11/2025 9:48 AM, Joshua Milas wrote:
> This adds an initial device tree for the Milk-V Duo S board
> with support for reading from the SD card and network over
> ethernet. This is continued work from Michael Opdenacker's
> v6 series [1] on the ARM64 and RISCV side. It has been tested
> with both ARM64 and RISCV64.
>
> ---
>
> v2
> - Made new entry in docs to avoid DTC check error
> - "Milk-V DuoS" -> "Milk-V Duo S"
> - Sorting of aliases
> - Added uart*, emmc, mdio, gmac0, i2c*, spi*, dmac, saradc
>    to device tree matching what is available on the pinout [2]
>    and available in the device tree includes
> - Removal of 'no-mmc' and 'no-sdio' for sdhci0 as it works
>    without
> - Added riscv device tree
>
> Link: https://lore.kernel.org/linux-riscv/20240421055710.143617-1-michael.opdenacker@bootlin.com/ [1]
> Link: https://milkv.io/duo-s/duos-pinout.webp [2]
>
> Joshua Milas (3):
>    dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
>    arm64: dts: sophgo: add initial Milk-V Duo S board support
>    riscv64: dts: sophgo: add initial Milk-V Duo S board support
>
>   .../bindings/soc/sophgo/sophgo.yaml           |   5 +
>   arch/arm64/boot/dts/sophgo/Makefile           |   1 +
>   .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 110 ++++++++++++++++++
>   arch/riscv/boot/dts/sophgo/Makefile           |   1 +
>   .../boot/dts/sophgo/cv1812h-milkv-duo-s.dts   | 110 ++++++++++++++++++
>   5 files changed, 227 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
>   create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h-milkv-duo-s.dts
>
>
> base-commit: 0251a1deaec78252cb311fc8305d3670bc5eee0e

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
