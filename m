Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473AEECE564
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Sep 2024 12:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e9uP0L9dOG8q1opa2mVz6ken4zdY8Pgd+VDmGGU7OWM=; b=O9Hbn0idt1Tnnd
	stCCHvlmW7Uf2zxfzot2o+YDjRYkZ0yZYVE9dSytdgUGq65ux8P6hiv4BXcvSFrPFzRzXtVGJFO6Y
	0lo3d0OlqHCsb1U1naATnF+nQhrbQencNCo17YzT6YQav8E+6srOREpSvgR3gen8G3DsERKOJybu4
	0IReU7x/9RB6QrYis+wYAenU5WxwRPOaj72ntkha+HqqFr2mT2BakBciV/p/4nvLUOFryB2bR2u1J
	ViC3R+tb+Hwc7MACanCXkToJUfhzuh/mFn1BOLgkK1k2m53B2y+doI4Km4B7Qy40eXZooEBz2UbmA
	8XSxloSn7C1JjbUM3rgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snzge-00000005UgE-1alc;
	Tue, 10 Sep 2024 12:09:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snzgd-00000005Ufz-01zG
	for linux-riscv@bombadil.infradead.org;
	Tue, 10 Sep 2024 12:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9kHgTK/9vX8CzIAkCyaso50L3XpXJ4RvID7MN19mSyM=; b=ozU1wp9rbLItDXOMxbFrpOoqHr
	V9casmBXW0ONrS269G6sSNnHrBON2PuPH6R4XRT+y8EDOefFmGR2Tq/Pmsb6hg+INXma9qm/A6oct
	1kvJf/8xE8AmmwjNp+fVGZCfwbSai8j+hoNO9oaIkCIQVoMV0kckmhVmqx/aaW8eCEz12QHhVP1Cr
	AmZ39j4we/ipTTPuRIeyWcrhvLYAc8yqlZtCXYREJKljFcZCE2bjZDtu3s3AB/2udxS9EfGW4XyBW
	ieVG72AgwzGLyzDBSUjN39czOxtQuL10UQjQ7DYHC7nUEjyxeR1H1PQPGP+AtWiehCW2DFYJSprIj
	UxdFz8uQ==;
Received: from mail-bn8nam12olkn20821.outbound.protection.outlook.com ([2a01:111:f403:2c18::821] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1snzgZ-00000000pPV-0xwb
	for linux-riscv@lists.infradead.org;
	Tue, 10 Sep 2024 12:09:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XGTjBZkZO0XHkXMeaNMdtpplMn1FRmqWPwWNz22/TL1/j24aBJKdBLl5gWT3BQiL1sJYZtvLkph/J87A1KlQYISyvYfIwZPl9hM55EfPEX0mpimLXqcFz+D0Ydk5rdIoxutSgL9E8A+7V1fHC4JOOGpuA4vHQIFnUwIbIY7yHaWGQu9nMzouBYAuG0lMCjvQXdUh+GuJBeUbvS64u2K/VByA2if+KM49fb/YyWSH2Dce4KoMGvW2H1LUnWP/L+LPvJMnbIpJYv/7Re1O2LCs7O5VdYLj2QN8RdXzwekp4fWu9Qweu0OzVo6g2zg1uVu9TrV+0jD2yqHBo/RKuyTwZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kHgTK/9vX8CzIAkCyaso50L3XpXJ4RvID7MN19mSyM=;
 b=M3Tomfjen3UVQoI9sLV0kmoKedTFojOfGX4A2GHfAbO03rSTdWApP2DSlCivGk/iFLgEtZuP0CsZ6yQIjQZipg+xHrf7L78rl19UX2F9WWU1GZlNR8sAZGf6U8GPscnr5kDsMLeFoh6/DBoU9IHIq7kgmEz/Lm0zDeYJNEPTt0M/Fluquk2zFWRFqxqcwHYSk37N/JI985LQF/BKzVMwUMNcXs66ThOoVKYU3QjGIo0cXPw0uBW9l/x+UBv9d1pugHHBKxwMqCzj7sz6UUQk0F8bCsOJz+kmMUFK59u6GEgs8/ENorYwCKPOyNiFsan/MCZ0iGhTEOf6uacr5adtLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kHgTK/9vX8CzIAkCyaso50L3XpXJ4RvID7MN19mSyM=;
 b=OaVIx6w7UiD0i+LL9Jnhn+FoY5n/0JwP/sq5DMqqPGI/cCAt6pAk0W1S1GrCEd3wkChnjGGLuIgkWgjZaijVdVlxMd0u4xt1t/PiP6rx2T0eaql/LMFj3TtAXXDELftBFiAQ1je/5WhT2dGS58uv6/ROG3TRDdcw1lhq4LuGc/S7C0I+v4Mi4+gKzrHB/t2P8yMtNCKRCuPDlkBcPyxiyx1Mbasi7MHq582mw0AOxLusuu7g3LHuJx0FbtYfWdEzMVaucMM4U3nfzhIsWwfHrkzSozrnsL7AAmcRonrXF4Vgx1Lx+TdpJrcSD6i6NrS6KO1/sXjCl3jI9I6tq5RGMQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by IA0PR20MB5658.namprd20.prod.outlook.com (2603:10b6:208:43c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 12:09:18 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7939.017; Tue, 10 Sep 2024
 12:09:18 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/2] riscv: sophgo: Add pinctrl support for CV1800 series SoC
Date: Tue, 10 Sep 2024 20:08:02 +0800
Message-ID: <IA1PR20MB495301A1A08224486DD0239BBB9A2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <IA1PR20MB49538E389C866882FAF35B8CBB992@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49538E389C866882FAF35B8CBB992@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [zUey2GpE5HzI2XN0YNUk+XFkAW/fmGzg8LX0yQyMHYE=]
X-ClientProxiedBy: TYCPR01CA0051.jpnprd01.prod.outlook.com
 (2603:1096:405:2::15) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <172597007255.997162.8447593891786696370.b4-ty@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|IA0PR20MB5658:EE_
X-MS-Office365-Filtering-Correlation-Id: ac2e7e44-c61c-4e26-3f88-08dcd1916582
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|15080799006|8060799006|19110799003|5072599009|6090799003|4302099013|3412199025|440099028|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info: sAS5MEwuu7RtLcyxzsevG2a6ReEWb0Dvc4ovx+NKDsSxUrObaTi99YT4GgvqFcZOMg/AKdaUU/I7EEe9zbQRkEKwt4HTkQuAIPrcIQt3zxAbJ4sJbKKINA2BwtRExHzyS6NmeCpZvMCLxv9QnSF6Tfb8kcC4pps36pObUK2zu4Hx3zd9Fzlb13dwL1JDFNG5GVQW8/JxRwDAGbKRckJuf39t2Sdcw56ei3OkPRdjYEkd67WjAjXVGvGpvO8f8/1gn665drxA0/gX23ZC17Er18nXvYhf+jHFQBeI6UPkJOUiTmXsIDv/xauVoXHdnVKmhoATBDPEcCuMv+sDOsy6TMrNTexm4Xvldj4h5cMYVnd2SK/5yEiH/VFi+YIhLb46va/8vcK+P/Kw+ISwshPEgr/DVxMjyBLPAZJsm/sf+4nP5q2YFVmTewXPtuqTpXB0Zo9qkG5QInf+Xw5sgLrldRAv7e3owpypnZiVikowxrTMzwDEpnqfLQHjUtFOlhoCyo7hW7eL0N3hwSRjUWENhzSpXBwUHaghN54eSBtwXK7aK+aZ0l7ZSSHldZM9yrT4xgswJu6mfRLFCc6G8DYb74xWsY3oD3kI6pD1Ja2qzYm7CQxE8KnwPr2MyFPlNWnLmBm1bSnldUxXBfLkfmqlrcK4xSncK2tfCyyO7A1lVXfoNTwkawmZjobEx3QWo0DDOMNnuD7jzgjbMZ5yz5GuIqhMntP4QGuXZHIiH9lGPrz0wh8zGLFcPdu+ZZKE5JvALSOJTPu5N7f7LACZJcVftGS39NN1Mx45zU5G4Qre69jhmXwnh4qT3SuQUAMn4oaEUz/bMYcdRi8rqFJ0nk1IefZg474VPcZKw8PwZ9HF53lwC7zKf5SwzzkMAZvrHq+m
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2laTVl0MVI5TEVmRWNFK3VmVGJ4bFpMcXJtanhFRERCeXl3dXhYOEF2VHpP?=
 =?utf-8?B?OWVMY2JtVlQ1OXVBTVJ6SUVlNnJoREJXK0FENTZYV1dpV1puR3R0U0R4VU5R?=
 =?utf-8?B?cXRFMGI0SlhCYWZyYWk5Mkt4Rk9uYkJvT0N1S3ROZFNZL1JKblp6c25wdmlt?=
 =?utf-8?B?UEY1enNOZC9nZ0pMczZ3K3hicWJJbmZxZkR5Nkpjc1ZpZnpPaXF4L2pCL0FJ?=
 =?utf-8?B?S0VSM1hNUnFWQ3pyM25WbWVmcFZqM2NHVlRsNXJlc0k1TTJBSDA3c0cwd1Jk?=
 =?utf-8?B?YTNvSkFUZmVpQnhHdWlmVUM4dEdDbWxRTmsxRWh3ajY2V1R3a0NpNEhKRjhG?=
 =?utf-8?B?NmJXeVpUSTRpQ040ZWRXaURLYlhwcGFwWXgxYVpuZDBDUkhUSXlQM1ZCTGxy?=
 =?utf-8?B?cVZrQ3Y1bFlxdFRjcWtVSWprVEN5VTVZK3JDdllWVlErUWR4aDFrK0lDckhX?=
 =?utf-8?B?VVg5eXJGZEt4V0oyeU1LdzdYdFVaUzMySllwcGtzYURSNTI1bVJCOUQ1cEtv?=
 =?utf-8?B?dVF6Vk9hWGdLUE1pVjVtQ3BKREtwYThKVDdLYU1PRmpNcDh2WWtZazZRZ2s5?=
 =?utf-8?B?NVRnb3hxYkQyZWl2alIvVkF6L2I2NUpWTldnM3g2UjN2OUdKdzM2U1NWcWh4?=
 =?utf-8?B?OHRuZC8vblBDNXNMNlVsWmJNNEFSNUdIQ3ROQUVnc0N4MlRNWWxUU1NjcTRy?=
 =?utf-8?B?aHVHek5abUxwTXA4cERGSTBjeWxCd3ByVExFMjA4bEpVL252T0JDUUx5WHpU?=
 =?utf-8?B?R2VnWXdld2w5OWw2VmNBaEoyWnY1Q28xMzZmRDl4dllzOEFUc0ZTdDNNdFJG?=
 =?utf-8?B?M0s5ZGFEK1RmUnFlQVhLWC9MZEZEeFpKRkEwdlVhSlpRei9VMk9pQlBkRTY3?=
 =?utf-8?B?b2tTZ3poK3JZK056WXVuS0VsS3JZNm9Wc0NPcC9CQmswdU1uTDNDdXpidnl3?=
 =?utf-8?B?TGVycVduWDZZQlhycTZPaDlQZzdFSHppN2VOQWhvWUdOcjlYME0zSWZvSVMr?=
 =?utf-8?B?dVYzN210VUJxbXMvNzFOOEpqTVg1cStDT2tjdVhhd2JzRTRYelVxaCtMZXdn?=
 =?utf-8?B?Y1pVTFJ3Nk5UcFVLaDIvamRNWEVTcldaWTNhazhzeGJoZ2NubXkzcWhBbnRM?=
 =?utf-8?B?ajFXaFEzWG1BQkt6VVVEcnBRWnFlN2NOUFl0dWYzNUFTQ2d6YUYxSWcrVWlL?=
 =?utf-8?B?ZDR0SE9sUncybmYwV2lyRFhFbmUwNHorc2FhSFZlMGQ5c0s0YzRLaW5YTHly?=
 =?utf-8?B?VHhlbDcxQm5GZ25Bd2xERnY4YVFqSHVRdUpUeXM5MHprZEtSRzdGQlJFNXpl?=
 =?utf-8?B?bVkwTFU1a0dWbStrZmRBTHJyeUw3NGNiR1hOd3YzenZUR2xOekRIaWorTWJk?=
 =?utf-8?B?cHA4WThvV0g3Z2l4d1V5cHk3aU5iWWVtZTlVZk9DTTlMcEhwMHMveWc1Ly9i?=
 =?utf-8?B?TnZNcFJNVDNacUd2ZWF1WDkwbG5QZVFOdm1zOWlMNFRVaEVMUHNtcURrR0hW?=
 =?utf-8?B?VmRLbkZJUGpJL2N0TElvcXJSNitrNU9PVVNLV1pQaUJNNGlyYlNsdno2T00z?=
 =?utf-8?B?L2lINlZGZ2cvNUQwaHAvSlI1alh1VW9BazIvVkFycVJWNjBGblVsbTRaem5I?=
 =?utf-8?B?QkpjSlVqTlJDT1FYRWc5VVg2WnFiOS9GNVRkYlc5N1JjbVVOdWVxWGdJQ28r?=
 =?utf-8?Q?6+wpmRiTKjuXPDISgP9Q?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2e7e44-c61c-4e26-3f88-08dcd1916582
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 12:09:18.5594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR20MB5658
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_130931_479012_F4E4C4B6 
X-CRM114-Status: UNSURE (   9.76  )
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

On Tue, 10 Sep 2024 06:34:27 +0800, Inochi Amaoto wrote:
> Add basic pinctrl driver for Sophgo CV1800 series SoCs.
> This patch series aims to replace the previous patch from Jisheng [1].
> Since the pinctrl of cv1800 has nested mux and its pin definination
> is discrete, it is not suitable to use "pinctrl-single" to cover the
> pinctrl device.
> 
> This patch require another patch [2] that provides standard attribute
> "input-schmitt-microvolt"
> 
> [...]

Applied to for-next, thanks!

[1/2] riscv: dts: sophgo: cv1800b: add pinctrl support
      https://github.com/sophgo/linux/commit/f093225b6ca367e632fb962671965906eaa08e8e
[2/2] riscv: dts: sophgo: cv1812h: add pinctrl support
      https://github.com/sophgo/linux/commit/4ea8511c034b203136234649baed2093efdd7504

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
