Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C33D3CC8C
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 00:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tW+toNLs36joMOkQsnlo9w8DF2GoAL51kudNmCgbeyM=; b=H7vYn83Vd2l5n/dMON1HrGvRRZ
	eSPbAUuecXHLmR4EqQf4NpLzSamKRbKNodWM18QPjmunOt/5ZZQKA0GuckBVSFPXjM/lVi47ROBPb
	TvKW9lg+zsB4di4e4Mlfqcf3hJy7KSYy9JQoLnkGPQ04vfN65TInSjulIlBGrWiDFTRacvS87THba
	pthHaiUuk+8rNqYYruBjNf+yemcDjRLI8XSj8npL94t3qEGUAHA0IA2DWn1CvqbBdIo2oYOlDSI38
	mtPOmnZM/ARmssGFAHB9qYlAjlaVkGmL2CgKrCJ8e8VjudO+iJJpv5LkOjFRIxCVUU1tpZR6Rppxc
	18JjaPkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBaZ-0000000BIGr-2DgT;
	Thu, 15 Jan 2026 00:51:51 +0000
Received: from mail-southindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d408::] helo=MA0PR01CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBaX-0000000BIG1-1dsG
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 00:51:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHGDKH2wJdpxXAh9vZ/oep9KdB0C6mqF7/HRDUAreqjB6R1/h+8X4eiKyR4h8UP+0VQxhZjrUrTwZ2+xcu38n/lZXb9WtD6KtoJXKSgiU3qq2fiH/E8ZFX2npu92xYrLQgPdoq2BvNf2urdBVm056NuNuBCM9vc00oU4kIC/SWo3hj+gULzqVcpqen/c9KyF80w3P0FgfpV2UFL/6mXjs4A/zZ2CprkoACzMwWW2dif2A/d3L3Wg8zkmvrAn6GYxlpaHYaIEW7eAORoP38QFIlbvM7xIZC5xAmsd/SX7FsvmAkpjjekHCD+NBCe/VZz1FGhUqDZLT7q1PGg0hs0fMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AYdycqPfiYXV3HW+4pnzFLfFfGxshA855rH9cGpMAc=;
 b=rZUlDADn35HW892jrAYfMV5BqrotXrM2ZheIv66K4rwc80wHaEKFBOmkwWxngaxWLhk+u7+A0ZzRWm+Fz40djhN5fClt4NLKn+LU3urshDAob9qyHSSRPQB/pxkSKraikxE3usUUXO+2eCSq+HFARhQdgBEuO59UXNpGUOhjgyXAkjC+Ce/LkAeX5xrdSw+fdQP3yJQi4PuCPtTAt8IAolM9cSQButpyu+KC6U6uPy7A3+HDU+HbTD8wKGkfyCMDQDNq0T1FsLoqzwPglNKo7DWdg7LAGxmyAlWe8jqiF6C6xMOGRRb7+iy5S/3+XvG9rrtJDSiiLCyLhtjMxcZpIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AYdycqPfiYXV3HW+4pnzFLfFfGxshA855rH9cGpMAc=;
 b=jxGSJV+kR81AIim/y8jgC0lna+kQvS5U1al2cntLQQsBXUzGKwxd/d2eereNHaogPIbw/fYcDhA+H3KFizsdWlWQ73l0mSCi1sU4KIK1AXAWvbQq8qPUq0lOXbf/CwAsPnhesPt8ArHmbZUQwwS+byY/eOZq1PiPB/LOf0nIFIEKNWdXrSBSUMo8/W9tKt24h88t4+XfGr77PmPOTkTHFHnxPGvKqQfx/+CuKuv+2fpxT3N7LD/rcbs91V1R2u6BJH3vf8J8XiRXApDV8bgmDI+GiqWByq1f0W07uj2p0h7FGRaSl8oDYpIIOilpcePi0ZWuHCZpRt2e+8rEYS/+7w==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by PN1PPF74CDA26B3.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04:1::312) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 00:51:36 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 00:51:36 +0000
Message-ID: <MA5PR01MB125005D473397164E4C3735E9FE8CA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Thu, 15 Jan 2026 08:51:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: fix the node order of SG2042
 peripheral
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Han Gao <rabenda.cn@gmail.com>,
 Nutty Liu <liujingqi@lanxincomputing.com>,
 Thomas Gleixner <tglx@linutronix.de>, Zixian Zeng <sycamoremoon376@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20260113023828.790136-1-inochiama@gmail.com>
 <20260113023828.790136-2-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20260113023828.790136-2-inochiama@gmail.com>
X-ClientProxiedBy: TP0P295CA0021.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::12) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID: <1d55e60f-f0e8-4ac4-b200-96d8c820d30a@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|PN1PPF74CDA26B3:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c432765-7000-4fa9-51d5-08de53d03c4f
X-MS-Exchange-SLBlob-MailProps: dx7TrgQSB6d5vbofsfC/jnGJ+j4hG4ECHlPJk2Gov1qIsVJqkLYf9HbRtiPeCz/76mYf3EorSOKsrWLL4TgWyzDRzsN9mZaLN1RxtIKVu8Q10BnsWdfxIFsI2LkY/Cdi9hrUdWboCw75ZQlkABt/G79yOPPzz0HgrS2+XDpyKmuNP0F5UuMoGeS9h/veQjrVLfJFjH9cgqB+aPVJb+jlU3clF8ZVKPQs3PTzuYrpLJejtrMKPvfAkrRME/hPS9e6qq/LaBCZfi//QhK34J5FgGK/fytXPLq4/lzL0ymAAulxfZ4PFw/b1V4FaXVh0hGvHm+yJ43P4hrCIcRYx7wRWFjn4ERPsIJFzz9BlwZNsFpj8IXRRS7CCSJnHk8JJseM32FFFQjTLRDOP/4tY5/Vmhaqwj2HmuC+HW3kNLAQTyQ8Ob6eCy2irN/wW5TwJm/0eU/Cwujbc5GXbblp036nQj+4qJI4IBm1D4HMRoZ0VhsSJ5WcYjow+6mNRMnSDqJBhGA96IYRL+c/BeU3FnrzhZEKjO+JuyufTwTu3o4Oj5+dsgHFvj8qQkyz/O6xsfAfO+PmNRenS5NMjX77t3mmLrGCL9z84ObBhfljnpKjAHHsazjlh4KisAab+g3qUDU6yllG1Wzai3ps36U0Y/5sJQzEB4nmZJpApf8YeMdE3HFGmDOx3YQuLQwZJ7VoKvlDe6LyREq5G53NoRL+bY+3O2W9ms8wi9HPVfwJvwgnerjgZV9Ea6CWeMYp7Qv5t1ukhSwBfEa8iKk=
X-Microsoft-Antispam: BCL:0;ARA:14566002|15080799012|41001999006|461199028|19110799012|6090799003|8060799015|5072599009|23021999003|3412199025|440099028|52005399003|40105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0Y0VkNDNXVlS1BIKysyTWhoajFVS3NPZTZqZW8rTDlCQ3htRXRaUFZTNGt4?=
 =?utf-8?B?V0dOeWNOdzhDbVVnSUtOY2FPb1JxYVdpbDZWblduSjByb0EyU2gxRUxjVm9H?=
 =?utf-8?B?U00xU1NyaUNCU0tTeCs0a0k2V3p3VmtodUJDRmtHWktSbnlUTlg3WmtGSTQz?=
 =?utf-8?B?WWt4OFJpMWxWYzkremdzc0VNN0ZVRys1d2JzVERIcHd6aFpQOTZxTHVIKzlv?=
 =?utf-8?B?ekJVQmVxZlM2UW56amR6UEV1MFpqR2FoclZvY0RMbTRzUXRnbFZmTDFycklk?=
 =?utf-8?B?aUVPQW9qRHhMRjUzYktEWlFOeTFXak5XTWNhcmo5bFdoem1kcWdROGxjbWUy?=
 =?utf-8?B?dUJSekVDVlhHZU8rL1g4bWcxV0c4cGxoMWdkdFp2VlF1RGJxODdhMXRQemFX?=
 =?utf-8?B?anRIcmxIdCswU2hxU3hPSE04ZzBBdkJtdDl5VlZsRDFDWnVjWWVDS05INWFX?=
 =?utf-8?B?ckcvdWpkQldSU0RmQUh4UmE2ZFN1R1VvYzJCY0l2RUxFVmVneG5IWHBCWk9Q?=
 =?utf-8?B?cnBEdlpBVnhVYzB0Y3ZOblhsbkxrNXRnZUdxVjJkeG1RQkxDdmFsSXlWMjNu?=
 =?utf-8?B?eE9JMlJmM1NTeWlGRUE1clJNUUVDTGhTRXR0OHNOcjV6ZEtpOHRiYUVKMTlk?=
 =?utf-8?B?THJwRjBxSFpnMVpzL2UxandLNkpydTJ4WkVSZlJhWFFMTk8wNGlWbkxtb3BT?=
 =?utf-8?B?c3pUYUJuWWJjcnFIcklZYktsUzF6YVN0aVlCaDdQMUhnRXU1OTJ1MXZONWh1?=
 =?utf-8?B?S1dpZk9Sa3FrNTluMXdtaVlFWExMMGhzZ0NMQXIzR0pDSVp1QnE4Snd0RVo1?=
 =?utf-8?B?UVZVNEdveE5xV3RzOUw3ZHJHWGFoODBOVWJ3VVFyZVdHdEp0RlozS0cydGN0?=
 =?utf-8?B?MHkvMmUxZDk5cm96dUhvWkU0dk9XQk1zN3hCcC9QSlY5RDJubTFWL1BPb091?=
 =?utf-8?B?V1hqTmhiV1RCRlZibkRvWloyVDNNYi9NVnU4SWhUUzVXV0JxOUlscVY3TFRX?=
 =?utf-8?B?OWdQVWVESEpvU3J1MWJvM2dOcjEyU21Cd2FkRHRIZDk4Yk90eUV0dWtITVV6?=
 =?utf-8?B?WWpiMmZ3U2J3OHhBN05PZzVSNTRLTjVLakQwL0R6VThqbW1BejhVU3BKRjJm?=
 =?utf-8?B?Z0UvUy9BWVRVRVU4TWtUMmIvcCtxdWFxQVdMU00ySHpkUTgzNk8zZnNVUkd4?=
 =?utf-8?B?cEJ5cWkwaWp2cGg3RGdoajU4YjFiRVl2NDFjaTc5OEZHbGVkSE5WVE5ScW5U?=
 =?utf-8?B?eGZqbEZSTnBHQjBVYUJ6N3gyNW92QWhNVGFUMHhWM2JYMnhSdDRWbGhNYzhD?=
 =?utf-8?B?dUhkdVBjNHV2UjdhWHIvclNmODZabzRyb0UvZmRibUF5RjhoMWgyRm5WNVJV?=
 =?utf-8?B?TmpkNlhtNVJIZ25ONnhnRzF4VzZmRVplamVKSm0xN3hXMmllaDZKYzBnUTJY?=
 =?utf-8?B?czYwdTBLRk9tRWJwMzl6enJnSmVEeHNUMlRVM1JYU05QUTdZUy9ETnpweXkw?=
 =?utf-8?B?OW1FRXJ3TzF1c1dISjZZYzFsZ1I5dlJ0Nm9WNTZQSXhjSmh4TFpkVFpDNkRZ?=
 =?utf-8?B?dysxQU1nbGtWOTZRSW1qSXYyWkZoK1hPTVB4SytqT25Ld2ErVG5hcGJZZ3Q4?=
 =?utf-8?Q?oGjxrxX+/6SM7yOufED9tB5hsbFTTjgXYzsHP9ZJc4Uk=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3Z3NlJzM2t6b1JmUWZsUC9XQS9SYXp2RjJTNkw5VWxsZjUzdnVoY25GU0JC?=
 =?utf-8?B?UFV2Q3RpQndDc2R6L1dqYkpPQWVvOHg0U1M3WHdrWGsySzkvNDhJQjFmUEl0?=
 =?utf-8?B?RjA4L3UzRVdVSHllRlNTQ2x4M0RTSDBOUDU1ZVhNYkZ5ZVM4MTduYTI2TUZv?=
 =?utf-8?B?QVlRUGl1ZHIzQ1ptYmhXKy8vdHdHZFdXUG5ZeWV3bUIzeGl0RzNibXhIV2dx?=
 =?utf-8?B?dWtLc1F2MG42M3dvWmRxS1gzTlZ2UFYvdmFBc01CQU1JU0JaVlhIVEV4SnhD?=
 =?utf-8?B?Qmt6K3llNlNwYzNNYVhOaGcra0FCM0Y4ekx5Wm1qUGI2dFlXdE5wT3hER1Uw?=
 =?utf-8?B?SzRrUG5CQ0x4Tzk1TktER213VDB3MEdqb0EwOEd3V1puZHRlZHM2clRzV1gz?=
 =?utf-8?B?NytFeWV3YXNlcHM2S2pwV3V2NkdnQXBUVzNCdWhPQmJTSTcySUpnODRmSm40?=
 =?utf-8?B?R0k3S3ZyZUZkTm02bFNDRkxCdG9iZDc3SUJJOGVMZ0dBNDYvU3doM0NEbUI5?=
 =?utf-8?B?UlRSTytvcFhOTFBMK2tBZlJMVFlpQlgrSTJFRXdyMjM2UHN5UTNlbjQrRmJH?=
 =?utf-8?B?RTI5T2E4QlNBTEpMVHJwWFMwdndmRmZwZDY5UjNwaitjYmpNdnVZakdFbk52?=
 =?utf-8?B?eGY2Q3ByN1VlR1BlKys4R1E3UTRaeThOeWNEOE9rOTBwY3pBd2hOcW9kdENQ?=
 =?utf-8?B?bFM0aThVeW5LNkduS2lWaGxlOGdjTERMU3Z5aktvaXh5Tk5ocjRQekpQOGho?=
 =?utf-8?B?d28vT0FyVThPVE0vUEMxQnBXU09WZVd1YU1NdDlnNklyekFDMlVkejRORXBC?=
 =?utf-8?B?aTU1Z2lYZFkvTGR4aTB6ZGZGanZQM0ZKWHB3d09CdEdVNkR2VmIrV0xBeUI3?=
 =?utf-8?B?aC9tcHJrd1FObXllVG9zcStvV1F2UGRCWEFLamo2eUVaOEhxYzJNc0E3cGFv?=
 =?utf-8?B?Z2tMVHpBcDdxbmtpMkZDWVNGWDhaZ2dGZ1NwakFFcUlFNkVwOGRuMXNHMHBR?=
 =?utf-8?B?eHhpaWtXV3hQa3ZqWTZSZE1Ma0tuZWVIU1RuUXdlclFsY2FxbkFoT1FKbnZC?=
 =?utf-8?B?eU1FVi8xMCtaV3pLNjVCSFZwc2lFM2lnM0NuSDYxaE5oWkx2MWRyZUt2bk9h?=
 =?utf-8?B?ZktjTVFzWkJ0Ui9FS3YrYXlOcGljMFl2VSswczF3bVVQTGZnYS9tM1JYZjA3?=
 =?utf-8?B?SS93aWFzcDBLNXplMTVZNkFwRFZMNmVrSDZGdVhZaUNxTlA5RGk0cnV3UW9G?=
 =?utf-8?B?MS81T1J6RVhXdUprN0liMjZXUnEyN1JKM1cyVW9GeDN5YmpDcXgrRS9LVFpI?=
 =?utf-8?B?WmpxV0gvVDZGTlkrS1dlNzVtWXB5aDNtVGtBY3lKNC9hYWd3ajB4QTgvT2NL?=
 =?utf-8?B?ajZvYURab1ViclVQcDc3Qmw5K2dEUlZFUno1WmMyUVh1Z0YvOVY4NkU5Z0tJ?=
 =?utf-8?B?UHBISERrNmNEa0VXU0NHY3QwcE1IOHo0N2tCQUs5UUVIdEtqRjQwOER5b3px?=
 =?utf-8?B?LzZRbjRJOVdtaTEzWitRS1k0V1ZWbnRBejNIdDZQb3RydWdsZGRCbS9IUTJO?=
 =?utf-8?B?Y21nWUxibXNwTGMyTFRWWlVCMnBETXN6TWRnY2R4TGZRUUNJZjNLVlM2L3BO?=
 =?utf-8?B?Q2prSlJRbGl4M1VqUWozTkJ4TnA4bHluSnpvanJaWFc2Q2F2NEFiMGI1Q3Fn?=
 =?utf-8?B?VjFDTE5uUjQ5QkNxQnhpRVl3b0k3UmZWbWxLK0xYTTB4azlqNVJFOFFFTEdZ?=
 =?utf-8?B?QThDK2hyK25scVUvekhLWm5nT25US29EYnQ3eXlFMEcxYXBNVzZPYjVSQVFr?=
 =?utf-8?B?enVmVXp3RGlpYXdxSXJqMHJWZmJIa0NpQUZlVkVlTXQ3aHZxd2RoV1U4TzVs?=
 =?utf-8?B?MTIrZ3Mwb1RrYS9RNk1DYWdzb0JLRldsd3NaZnB4Mm1oMFhBVzcxa2d6SDdw?=
 =?utf-8?Q?17KtJhmwl6g9nGlWSE/eALpxuYAUUZg0?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c432765-7000-4fa9-51d5-08de53d03c4f
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 00:51:36.5486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PPF74CDA26B3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_165149_435686_BB655FCD 
X-CRM114-Status: UNSURE (   6.93  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 1/13/2026 10:38 AM, Inochi Amaoto wrote:
> In sg2042.dtsi, some peripheral device node does not follow the
> address order. Reorder them in ascending order by address.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   arch/riscv/boot/dts/sophgo/sg2042.dtsi | 176 ++++++++++++-------------
>   1 file changed, 88 insertions(+), 88 deletions(-)

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>

Thanks,

Chen

[......]



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
