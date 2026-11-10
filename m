Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFE8606B1B8
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 13:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OsJRBEj8;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WyC44ss1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qIR5lGPx97HE9/wWVF1WHeY1MiMsWTJpbTGZvhNuuSk=; b=OsJRBEj8O4LMopnwzkeFLFpYMf
	GML5tOd+Y1/WwoUBhrtdQA5FYrY2PdaB9DTMPFVlwty9msbGofjJALf+nK+0BR55lng+/9HonSFVS
	kuRQZAK0A/Ikzd7GVzQ2tHgkbvjwV+VQojQQhvpFzuvv/cDmG7B0pVSFdEHuAKJEgyg0GJOHWU64E
	nbl2Sfp29awdihupZPLnZymq1Aj234KWXOXa5KT54IYHz2u2i2CUvUqlFlX1z41fi8eFOwHoxtVNI
	76XRGvnONw0UOmxtWKvAR0AR3wkqeLfqlWyNK3eD3COSQhmA382cLai8SBGS1nQd9S156D8aKZxhI
	QNwpY5qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlic-000000040hw-0ZQj;
	Tue, 10 Nov 2026 13:16:58 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQliW-000000040cx-0JOy;
	Tue, 10 Nov 2026 13:16:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUIgH0wdVpZN9NgqOLnQ+459BKfT1U7aBIGufVKRrRH8yVmia9o9yS3AZrKo7L92tbzi2yAOhesKMv7iWHqGxra7F4IPoqC64KdtXJu+yljhPFhvDrXDH7VHylvSeJZe7MKZOnCp+lZpQOaofFQXzO8kx9TSDW+TvV0smnDWw7aHhXuLPiNbb2gYdY01xMz67BpQqpWpGuDT1G/6HZ0+wAu1ThYQpLfqQzr0L8x3/tBbdmBbayJhWT8y0n73rLqrdhi+oZyurv1NzlveWG4/CiRd4mQ7w4gkPTPwpySCOSzsk0EwpOOHtdeJNiQYNU+ggWYYrWWNjatYIsz2V74Uhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onY2dKb/JEx23sNcFE+2RQgwcyQ5QH9HBpOM2+e2U9g=;
 b=yHW7KC3M1AFhM69ggq7enE2l8PP+VA8w89dp6t3qLK3TU3XZ54U1cu8IHTA2dELxtZjDSNDi9Wi6SG5wE/W9/VcE8dRL4H9IKZJFTLOHsrEpgvD83GwG2HVzBRWYYoyyn5bQJLIOPbm+kRxhMM3rnEGRwm85/W+XZqo5KU816jrLt75VzQZt41ppVTI0D2g5rr7H5wMKRgpMcEFzCb2zyOOjKMyhNmbj3pUImq+B4mVnoc/3XcKXa6pxF7WQkcUCwD0+IFdAqWw6hMF8Q1JonaC+F46bl4gMiHfreiX6vi/4I8rSXsc5GcAxkKxNd9LAlqDtTi/W1h5I1vC7zPf7WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onY2dKb/JEx23sNcFE+2RQgwcyQ5QH9HBpOM2+e2U9g=;
 b=WyC44ss1Oa0NrXTlsIGd/R0nS0bJtps4bGxDiu8DG0nrHIoOtY7h3pkGzDEkBpAjtxlzlSoX4EIgjMEWitv6jrUgLx9uHmWeS1t4BE+ONPeW65lEkHCKBcQxSYVQGMFQJPp4Da0aQq6FS39nTd4EgPSg03TtvUw03qboUylQYXo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by MW4PR12MB6729.namprd12.prod.outlook.com (2603:10b6:303:1ed::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 13:16:44 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 13:16:44 +0000
Message-ID: <57e9010f-93e0-4212-8464-3c577f8533c1@amd.com>
Date: Tue, 10 Nov 2026 14:16:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] reset: zynq: Use regmap_test_bits in
 zynq_reset_status
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Damien Le Moal <dlemoal@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261109-reset-regmap-test-bits-v2-0-c886689bb85e@pengutronix.de>
 <20261109-reset-regmap-test-bits-v2-7-c886689bb85e@pengutronix.de>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20261109-reset-regmap-test-bits-v2-7-c886689bb85e@pengutronix.de>
X-ClientProxiedBy: VI1P190CA0001.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::14) To IA4PR12MB9788.namprd12.prod.outlook.com
 (2603:10b6:208:5d5::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|MW4PR12MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: 634ac026-1cde-43c5-6f83-08df3f2cddab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|4143699003|56012099006|11063799006|22082099003|18002099003|10067099003|261009223027099003|261102123227099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: uR634d7uEV78KNnyzmNJn3CkRVaooLEcdygzLUajXg9+c5eKCjWOynwA4qfrsRIaWZjKR1vRaYY+P+RULWDYX2XSEFJoH3GiS3pP0X6KxwoDIvjt2H2KvDAYEspWZmvnViZ5ghYks8BHGzXDP+5OXGY0mmqew1vOpFgnu7VxVDx91QXAB+Q2GIuHYFhMQhqM6OfBgZtE1tVk6zzVbj8JEljE8XRsCIc1YAZWLFbZG0AVlgkAE9COaiL2SkZKasq6E479o217EYXXY65COIqmDU8AMkChXVLvXQXsN87J5qsRuKKFqw//QwSe0De74xc/geYiMrLo9yVQcyx1YuyHvfSuezETsVWlIX3cjTL55UTeXIZjJAaPpWdSt8JdNw0fUqzqpnhCbg5CO9fxYZPs66N3krJUKYzD1US4SUVWLsuDESsp7pdUZfvVXPZYFpajRzf7FfARP35apXtXdJSUEC27/OwKA4vp68s049eL1o0VwvOJs0pnec3GOXgutyCKr0VtigMjlBexbWxC4RbBl0+ocVFCitYW/KqyTcHqAvCIjbmveKXthzyscDKzzwAFH3RHQ/iz28jEiFWcxBw8hDL4WIk5Qw9C66MvSlAl/C3AKIVjz77TqGWC1Ls4y+wD1SS0OhUAkbEBUSM4uJjExoOfYCYzZIWgn1YuQDryKTA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(10067099003)(261009223027099003)(261102123227099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3pCSFYyWklNbDJibllXQTIrREx5QjVQaWROWUE4NENGSmN0OW1xNDNNNFho?=
 =?utf-8?B?QVZjN0p2Wk1QTVBjNE5SVXNDaG5kRHI5UUNTR0ZkZnVPWWFWVkpucCtMRWhM?=
 =?utf-8?B?TG5kdlVJOGJqMjRwUHJ0TmVXRStXamRtcWhXSWVnU2tTQmd1czA2VDNLSjY4?=
 =?utf-8?B?L1k5RzA1RkhyajkydVJBRnA4bG5keHlwZWhOdXJqN045MU5DS0J2M0dOQk9K?=
 =?utf-8?B?TVR6aFVVaUVGRlRaa0IwcU5LZ3NTOVVCTE55aXJzUFVVMzlDYnlRajhMU0JI?=
 =?utf-8?B?WEk5VWg0YlhPR0M2bVI5L05vS0JkQndSSE9yMk4wOEEyeGRBTGMzWmwyRFZ3?=
 =?utf-8?B?Wm8wSHZJNHFkV1BtelhWdWdWMWxMU3JjZTRkVndXMUptNThyTXRGK0dCNFBu?=
 =?utf-8?B?K0tzTEtJZHBtT3VJZ0RvNElBQVNPcWNVdUZHL1VDNnFDdGtodGtwcWZrd3VO?=
 =?utf-8?B?YjZMeUd6a3FVb1g2Q25YKzMvWFJ3Q0diNmNIUm5WcGdJclJldEpPMkRmbmN4?=
 =?utf-8?B?ZDZZRUhlbGVPV01uNVduK1gweWNrR2N1ZHlKa0tDOUpaTUYyOGU5T1ZLR0Ru?=
 =?utf-8?B?TkNyUmRXZnJiM2ZKemJPeVpEYVlKZWx4SFo5OENUQWdndjJaMjBwbU5EaGZr?=
 =?utf-8?B?anhmZkt0OU1WRUN3MHFia3AvR1E2MzZNMUd5RWsrNlVrdnRpZ3ZhRjA0Tnpw?=
 =?utf-8?B?Y0NITWVqbFJkVlZrMzhERzZBYVl3OEk2WWZsbUpYS2hpTVppaE1McjdxbytV?=
 =?utf-8?B?bDBDVE5aVTlYV3pKNFFzS1U2NVQyeUlva3JWOTlaWTNyNDJnNlFSb2FoVTda?=
 =?utf-8?B?Zm5iMCtNa1lmdXZaUHJsQ0s1WlV2Nmh6RVpEUDRyanhaZTI4a04zN2M5ZC95?=
 =?utf-8?B?OTBrVDM3a3JPOVZMV3hXQ0JpRDBUVmdybWpPUzhtSG1wSjZSV2xTOTZsYlRz?=
 =?utf-8?B?dE8rajVjOFR1VjRHNXZweFpVVVdkemVrakNJVkg4SE05MGxEREFKKzFKa0Q1?=
 =?utf-8?B?MlBHblA1Y1ZGcFkyTy9XV09oOWZEMTFUVmk2aVdZZTYrQ05NYVpxK2o5RTRO?=
 =?utf-8?B?WCtOajZkVEpMWlJpbDRGWE1KMUNvMzFmMzFBU1k3SDNxZ2tMZjBJczJGUTIv?=
 =?utf-8?B?aXZXWkVmamlhM25rV0x4YWxmNU40MEpwL0ZvWS9aTjlsSTBMWXhZck5vdDBO?=
 =?utf-8?B?bUZvYWM2TkczaGZpQzhvVkFwTFVxVitGQXFsMVRqb0c5VXhMUEtFVnBDSUh1?=
 =?utf-8?B?STYzcytkUVNTeVRCcjJENXNPSXJqQU85Q25qbnRJNFNLUlVidWtsdnl1bzda?=
 =?utf-8?B?djZPdGI5c0FxditqRlBLazFtKzgxY0IxNWhkK25VTmtjTFFGNldCQ1BJbnVm?=
 =?utf-8?B?bWFSdjdOTEovMTBBT29zWlZxdXZJT2F3eFVIMDVMK2hybWJDZzBuRkhkVXp5?=
 =?utf-8?B?S3hRODMwbk9PTlA5S1l0YmREVWdjK0ZZd2ZwWWJmdmZ5elE2cUVISnNqTE9H?=
 =?utf-8?B?YVBUM2VFUi9XVmNwZXhudkVRQTJmdm53NmhXdXkweVA3MjVoRWUzSHJPb2J3?=
 =?utf-8?B?WEZXcWdVTTJvRnpnYlZMTWMrWi8xQTBWYmFlbjMrSWcrR1BhNHp1Z0crNDVG?=
 =?utf-8?B?N3VxM2MvdmtNUkxZdDFXVktSYkxwSHBVNkRiTnBoT1BiaFA2TDIrN3U1ZDNY?=
 =?utf-8?B?cUxDbE0rZ1pvakxkTmJMS2hhWXRZRThiSUdaU1BLaWcxa3hqa0IrL2RCdTNH?=
 =?utf-8?B?Zlo0aWkvRmZPdVpCbDBZa1BmaXhzVDZ0dlQzUDZxcjZRUjc0aGZZY3dWK0hH?=
 =?utf-8?B?Z0RNWWhROGN4L1RxNFdjcFZaVHByVDJmSWhIQUs1RDB2dzhEVGh6WmNNQjZV?=
 =?utf-8?B?STZRSWpkMmlOak9FYmhETjVOSFNidGlFQm9iZ0xHUUZ3djJMN3JMNkdtM2lE?=
 =?utf-8?B?UTNXeFZ0bTZwY0Y1dkhrREtsblZMZnJCVzNjSk1Dbm9OK0ppYTZMVnZPMWZa?=
 =?utf-8?B?azVYdUowY0phSWlESVFNcDJlU0svUkJ1c0xNZFY0bGFGSE56TGxVcUV6YWpv?=
 =?utf-8?B?dURwZG5VbnphWUlWS3cyQzlFMzRhdS9vSTZyZitQT01WbGhJMU5KODhUOHBE?=
 =?utf-8?B?cnF2L1F6aEt2b25vMkY1cUZuc1FxMWg4S284VUUwYjhMNnNydFluUkRQalNU?=
 =?utf-8?B?Zk1STnlMNXR6Z2NPZHRaY1p4QWV5cWl5Nk1DNDZJZzQ5L25tTDdrOU9lWkw3?=
 =?utf-8?B?RmZFR2FaRFpFOGFvNzdzb0kzelRHUHd2RU5DNHhaRmJ0YU91cjJzb2JBd0NH?=
 =?utf-8?B?L3VRYWZOWDZQOUFpNmZVNC95NTFETEh6SElFMmorSnZzdXNLQXZOdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 634ac026-1cde-43c5-6f83-08df3f2cddab
X-MS-Exchange-CrossTenant-AuthSource: IA4PR12MB9788.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 13:16:44.4347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3IBoiwW9A1wBuY0IkyA+Wn0cTkVf1i3PN9Brqv222ur347kHIimdb0FCLQIjdB2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6729
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_051652_308040_E6660803 
X-CRM114-Status: GOOD (  13.47  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/9/26 17:50, Philipp Zabel wrote:
> Simplify zynq_reset_status() by using regmap_test_bits().
> No functional change.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>   drivers/reset/reset-zynq.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/reset/reset-zynq.c b/drivers/reset/reset-zynq.c
> index 688b512882ec..b7a0445aafcf 100644
> --- a/drivers/reset/reset-zynq.c
> +++ b/drivers/reset/reset-zynq.c
> @@ -67,17 +67,11 @@ static int zynq_reset_status(struct reset_controller_dev *rcdev,
>   
>   	int bank = id / BITS_PER_LONG;
>   	int offset = id % BITS_PER_LONG;
> -	int ret;
> -	u32 reg;
>   
>   	pr_debug("%s: %s reset bank %u offset %u\n", KBUILD_MODNAME, __func__,
>   		 bank, offset);
>   
> -	ret = regmap_read(priv->slcr, priv->offset + (bank * 4), &reg);
> -	if (ret)
> -		return ret;
> -
> -	return !!(reg & BIT(offset));
> +	return regmap_test_bits(priv->slcr, priv->offset + (bank * 4), BIT(offset));
>   }
>   
>   static const struct reset_control_ops zynq_reset_ops = {
> 

Tested-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
