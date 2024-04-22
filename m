Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBB4C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 00:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rm4phvv7/opY5uwNzkD2azzL3Kb7mUllGef+TW/n5xc=; b=PYilvkAdHjiQag
	CfGkgC5hgICoQb3oyXPqEHfW+ZMyhVFaDJNqtnZfsKMfdq2b8v5QZ2/FbvG7JnKBLwY9mdcRun8b0
	b9yYcvnqQz2Ck6YIOsNgX5nH612MCNfc4LHyAxatddISVLWMtWXcTxSPdNCfCUJXi/UDLfxiv6VUC
	bp3XKi17/mb71xwteultByjA0xVvdlmHxG0iYsxRAlfIL82Yy3pQ7F/CcZlyo2vNqD5mpBLy9StFv
	o7RDR9ODQ3M9wq3Pffqx3whlTiGL8OrVAJYBvaxvh/ONX8u75TT1vxYQurr/yNumNmOuPQriYuNrA
	tOhQteR3zkZKJEzjNv6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryhao-0000000BbEV-29qQ;
	Mon, 22 Apr 2024 00:31:34 +0000
Received: from mail-mw2nam10olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2c12::801] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryhal-0000000BbCU-0Y2J
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 00:31:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q36mW1YPwwI4VIo5HtB7bJ9jOqwiiZg6l/PjwZUAEF3IwDS5JG+aaVdnWt5Mc7SFJrelG6KEb51XjRLzt52QKh2N/TX4QLyBXMc+HrmMxQoWlCcwKZyoEXLNlDqR6Wx3r/eHTY+KxhKjabcHSU4eyyOa5M15GB1YoAxrwpffn0Lk3px5XGxaKFXJ41fGQyTO3moN6lmhjBLJuVeu7rkO+QGjVIgO2Ka6bWCHWRw86Mb66W6NKtvmXQVXKnb0iok/UhGtZT3laQT0+YrlMtk41cbxEX+PMWujkvS1p8Uyrha8q6allKvjFhfSpl20ajKBWuXDo9jWp43eBKVSI4hI4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0xRZ8BrmlGVbFeid+npKTTGEYGC/q84JSmTeCULW4o=;
 b=R+1zTv2qEJ/mVo0NYJ2xg1YNlsv07E8P5bBEHXAzSHfOjTsDOWpdqysxwm2wQB+eOc5lc8O0dnHVsY492y2RRSF8AiDWRR3GIC2hF2P5LBwfgnDB3LB7WDQSQmuEVw4NVyKZQODcVMB8Rjzl5CzL0B/MCz8dj9Sh75JnqAbohSuehgSqDpKsSI7JcyScc2gEQQuNH0UrZJvZ1lSGDup4IxKe1/PGnfw4WVPXbj9lfYgkw2DGO7UJ+eBYCNfFyN/v6sRWYaQDJETobJeoKMuwQnuGE1bBIrMe5Hz96Klk4LQn9jRcZNAJP8H+cGK4Q+5PeBENoCCpYU5NdjE0NKQtVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0xRZ8BrmlGVbFeid+npKTTGEYGC/q84JSmTeCULW4o=;
 b=eq2uVjLlMwQW4WGHbSUzhPbmLJH/4OLcPAEbeXEKLvhk15IE8x3wCf4VHfOflYDcH8hCySryqSGhOarXkHevd0WAFBH/O6s8bLGrFUCgJVwuBV4Br0LTFSJdJC3DxXwv0sq0zCE0vWXwZ7DMkWpdd6hLl83qhdn1kqw6vMLGb6AuL7Mnfj1guZBMetsHumLpGbm4+7aw/iNmxpfg9lUyUDbAuVsv2rink01T+Af/Jywhf3/hKufg22cG+EK2f15ZgSiooxzFNioeXKOY/2JEyaJPwM+0brJA4F5rTiujEi3feM+7zEtg72YULjhnD2OLe+F15H0emDH0rwsYHt4wyQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CY5PR20MB4974.namprd20.prod.outlook.com (2603:10b6:930:3a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 00:31:21 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819%2]) with mapi id 15.20.7472.044; Mon, 22 Apr 2024
 00:31:20 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: use real clock for sdhci
Date: Mon, 22 Apr 2024 08:31:46 +0800
Message-ID: <IA1PR20MB49530361A95A5CF2453BFFE1BB122@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <IA1PR20MB4953CA5D46EA8913B130D502BB052@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953CA5D46EA8913B130D502BB052@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [9s/7bB0ZkuNDwtK0GIDZXSuMGur5nXkdn2eL0OfR0tI=]
X-ClientProxiedBy: TYCP286CA0192.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::18) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <171374587875.63774.10181712288386461900.b4-ty@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CY5PR20MB4974:EE_
X-MS-Office365-Filtering-Correlation-Id: 861b1e34-c6a3-40ae-1da7-08dc62638841
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4GjASG+DoXl0dNrMNeXyB0J8ymOCkj3d10UYBDqPPkCd1+cH2dLcAyXApuOerQQtncCA617o9xhlKe7X9U7piZwQOJHBxl1XGkPF1TovIBdRB3KVbFho7wOdWiaeqIJrLpVUarWDGbhyleK+SllJOMCxAtYy+o5rLUr+vvVde6A9l7C1ObvtPyZyWxgyzGjggDXgwHqGC0zaC+RZo64f5YY/am+jOwc8Z/rYbNH5my/aKTpkzVTYGu+nvPdJKJIlsMi6miqtTLeB1rvrMwNL3D/XDoZ8p0tvDjRhst34k7JHF0/R6lwZmH9O9sTdyQc6Van74f/nOldq5NVac/8fnr+3W+7dKKJlOKZM2rBbtspV4w1plHi5dvu9U3wGLaiQcvvNxs4mYbdEz847ADSndRXSgfT0CLFLbVp2s+i/8oeXaNlOVBECFEeERHAyTzwnVzErhjSdG2eUaUVwIWvefJ3w5EKj1De/Hja3EQOZ+86nXSL0mmBe22cmZUjW9T567mIgmnG7OWQwoYbSbIKX80KW9T5FbKJ/IcVZ/L3Kf7b47IYzlMJc8SPBJ+1AogeHAcWVRWTbFTSII0A0nFF+IRS9jE7DM3rOCqvaWxKVo/8MtcyrN94oZrDyiLJrbLhMqYSpyFB/8zZGMIsl7/nwU56pXBNVI2gJjRzsfaDv7+s/VIDkRFnVlkcj8MjEoqXn
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU5mOUdGbk9JTDFXR1BOSW5PSFJsT3ZHMGhlYkxhWFZOL0lRZkNWQ1k4Mi9n?=
 =?utf-8?B?V0dWR3hVWVlndElPRVpwM3NzZ080QkJRdzd5dWdlUytuTG9JSk5RVzR1Tjlu?=
 =?utf-8?B?NzV3Nm5HdXlQQWxkU1EyakdFcUxJWWs5VVE0NERjOW5POG1mdGxndGIyRDky?=
 =?utf-8?B?ZFpwbituS3E2RmIzKzRHa3FCM2IrZjdOSXV1Rm1HUjVscHlibHorOC90Y0dP?=
 =?utf-8?B?blc1bzNNcEZQdlhaUXpjbVJxeXRXZTJ6UzdvM25yNHVjbmNPVVR3Y3Aycm50?=
 =?utf-8?B?ckZVcnNHVHFXcmJQcGdwenNpeFlPTmR5cGluM0FRN0VKMEJ0VFp2L3hqeWpt?=
 =?utf-8?B?Y1NFTktITUl5czZYUGpWdHQ3NHZpNHpZbG8wdnBaeldEN0hrTi8wM1VKdFdw?=
 =?utf-8?B?aURYdDUyWkRHMmF4L1FSTVpud2FwMDhENlVlQzJDeG9HOGY3VG0wVGcwUHFP?=
 =?utf-8?B?b3c1NnFBM240UGttUTZNajdVZy9rMUp0eWY2RVRqOUtXOW9aVjZZcGRZd0Zu?=
 =?utf-8?B?cmRualBmL3l4ZlRkRHVaNnAxOU5DZFBoWXRldi9xR014KzgyR1NHenhNNC9q?=
 =?utf-8?B?SCsreElMWDRBTUd0MzFsZ0lJNnVheVM5R2xSbEtubEw3RjZzRFp0bGpRUjJB?=
 =?utf-8?B?RkN6QkNhM1hoQk1GclplNTRHQlZUQUJIRWZnSkExeUhPQ1YzdVlaSzRCc2tK?=
 =?utf-8?B?LzBCa25JNkdXVmZ0dDF0QW14M1FoWHF1VUdLSkNrbVBtMFh3RHgrcEJpTmZq?=
 =?utf-8?B?d0YzdytrY21VZXRjK0tWdllWcWVDaUVnbmJJZFFoVk5VblBKMkppT1R3Ykh1?=
 =?utf-8?B?Y3FCNnI3dEdXNkUvL0hDdGJHM2Q5VWdMUTB2VnhMT1lRaEc0dGlIZ2JlQ3M0?=
 =?utf-8?B?UHk3d2Zib0s3akJUSEVTalFxRlN1WEFhbEtNa0lVZmhzaE4zRGl5K0k1Q0V1?=
 =?utf-8?B?bEdPQXJnUnFYckdRSWRFaDNGczArK2xJeDhhRFRvaExIQnVYd1NSZUVtdHYy?=
 =?utf-8?B?S3dSRkZwdTJZd0pRRWJlNnNtMUk0MDAvWlhRLzdadTdWa1Z6L0JOM0V3WDNK?=
 =?utf-8?B?cU1XS09ndnUxOHJ3UEkvUlpoS2JTQmJKcFlzTXJlZW1mUVJiVHp4a2tqdVVG?=
 =?utf-8?B?ck81R00ydjdXL25COW82anl0WWJiQmZGTkI5NmxqY05hbHlpQjE5TXJNbk05?=
 =?utf-8?B?Q0ZOcGt6TFgwMkE5R2x2MUErSU5MTFA3L294QWxPcWZNWFRBSTF0Sjd2bWo3?=
 =?utf-8?B?ME9Ga0NnVThhKzQ5eTJVS2lUSWlhRGZnNHVpaXJoUE9Demk5ZXArb3NNMHgw?=
 =?utf-8?B?SVJDNy83cUtUZy9MUHh1ajFyWXpUaFczUkVjay9lbmp2K0VUWnZIKzFLRDlm?=
 =?utf-8?B?L2tUQWhJT0QzdXU2NGhGZUx6SU5Ja1g4eEZZaGpwUHErWWhTalJHNkttUFpQ?=
 =?utf-8?B?VWlLdFd3enZaV3JvRllQRmRDSWRpTCtKVWc5NURtZVhhUmhTUFJlMU1YMFZt?=
 =?utf-8?B?NXB0TVJKRFAxL3lOT2xjeGx5MFFabVZQckM3YlpJVFJCZ25icW5IVVhJU1E5?=
 =?utf-8?B?VVFiTmpSOTlwNy80RVJUdzZGZit4eTNkNDc1ZXVuYjYzczdXOW9KL3MvOXlH?=
 =?utf-8?B?V09wQ3l2bGJhc0hyaEJ4ZVV4MmR3aTVBTkdENUZRTjNyM1pWekNRVVhzaTRv?=
 =?utf-8?Q?pGoPQXWOwgT07J5q0GVb?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 861b1e34-c6a3-40ae-1da7-08dc62638841
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 00:31:20.9000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR20MB4974
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_173131_276841_BF07635F 
X-CRM114-Status: UNSURE (   5.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 11 Apr 2024 20:21:35 +0800, Inochi Amaoto wrote:
> As the clk patch is merged, Use real clocks for sdhci0.
> 
> 

Applied to sophgo/for-next, thanks!

[1/1] riscv: dts: sophgo: use real clock for sdhci
      https://github.com/sophgo/linux/commit/886776ca23f2433eb69c0f95e0abadb7dfffd789

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
