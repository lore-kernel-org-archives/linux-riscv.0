Return-Path: <SRS0=jXit=RM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MISSING_HEADERS,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EAAC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  9 Mar 2019 02:22:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A25B20857
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  9 Mar 2019 02:22:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fKSWtUam";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="idXhYXwf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A25B20857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:From:Reply-To:To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6yXRfP92nPGdR6F80MxIbLcVup48Ewh27jGiABYMbZs=; b=fKSWtUamyI7tt/
	Ey4Kcwz07ApaGi4SM8ncoV0VT3W//fYYLyug1kSG0oM5qsEZb4+qDV77qpr9hK8OeCAvqeEUXcdm8
	YDEzbdGwj3437PvajD6/kqio4iqbh4E+Eo2yUWkTkLTVooIjJwNzqsrnJcl/aaFUpJ5X2JHyeejZM
	tM6+iRwclv1SGHLs/XEd26JNw7iQX9Vk+Ld4Et46DYHuvO7Pb2plpYKeusYs7LbAS0dl+wjdiJUxY
	wHKkdQz5ZhKHoKxb8uEb6XV//AyaePErZhY4yCHPtp1jrX/pfsgcGJcnkH005SjuY3rY744DjuoFG
	FQ9LcydF593ribmOPeJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2Rcx-0001lL-L3; Sat, 09 Mar 2019 02:22:19 +0000
Received: from mail-eopbgr100102.outbound.protection.outlook.com
 ([40.107.10.102] helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2Rcu-0001ky-8P
 for linux-riscv@lists.infradead.org; Sat, 09 Mar 2019 02:22:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HJ6jmrRLh648vjVrF2PR85RqhEqRRKnu7X6KnVU0sA=;
 b=idXhYXwfNzQhlFGnusEN8zPqeNbO8Yl/mLUdK/7nMwXZkwLgFu7Et5GUUdxwj4tAt4IZvqOWwoQG90tnXIo5k/qit+5liKGm1uQeOjbLTfL+QicKuO1DSv8HefMaqE+jYCmvEVJ6V1BKeqBrYQwUoy0m5FoVE4GCcqA6NDvzv5w=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB0174.GBRP265.PROD.OUTLOOK.COM (10.166.99.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.18; Sat, 9 Mar 2019 02:22:13 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1686.019; Sat, 9 Mar 2019
 02:22:13 +0000
From: Gary Guo <gary@garyguo.net>
Subject: RE: [PATCH v2 4/4] riscv: rewrite tlb flush for performance
Thread-Topic: [PATCH v2 4/4] riscv: rewrite tlb flush for performance
Thread-Index: AQHU1d5vRDLalg67e0mBr2jahRUw7aYCkW3Q
Date: Sat, 9 Mar 2019 02:22:12 +0000
Message-ID: <LO2P265MB0847B9B3B14D80941BC39938D64E0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
References: <cover.1552069700.git.gary@garyguo.net>
 <33588efb3909a4d699a952f93c26ea2f3c8bfdc4.1552069700.git.gary@garyguo.net>
In-Reply-To: <33588efb3909a4d699a952f93c26ea2f3c8bfdc4.1552069700.git.gary@garyguo.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-originating-ip: [82.14.254.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a54774fc-35b3-4111-d8ad-08d6a4360a7a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(5600127)(711020)(4605104)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB0174; 
x-ms-traffictypediagnostic: LO2P265MB0174:
x-microsoft-exchange-diagnostics: =?us-ascii?Q?1; LO2P265MB0174;
 23:zl7hQbFUCxibjkkRv0WwzqeGyP9T64/RtehTzIgOG?=
 =?us-ascii?Q?ypzgkxon77FjBETNAX5h8O6wSjsDEm+mztrw9Oe4/LHdfl0hLaOqfmguI8FN?=
 =?us-ascii?Q?psdHoE1ddjJITSVS8bV1Ohu77XjCTSpSglsbdnHQfdugE7U4pEUBmB94IxDa?=
 =?us-ascii?Q?2x54c8gs+fShCnyee4SZjmDPywPskwnm4LVxg7BV3uSb7XLLKqpaZcJZO4Zn?=
 =?us-ascii?Q?PkPWt312pXu1Zi0fol1a5kg1aOOZQ1CeNEVtd2u4MYRnY77t+Hm45OXtv0vY?=
 =?us-ascii?Q?Y3KOs44HPjh8Vsa0q1UR7HTiKeC+lWnidnn2LD0JTTmz3CsvKvhm4t38X3aX?=
 =?us-ascii?Q?KVljWn07VKWMBJ6d+dW/yeYRWawm+dyOM6VJhSKktd8MEXuQhl2hScV6F2xR?=
 =?us-ascii?Q?BpEB+zUnlyslhGkUFsxRfFRFZMy7MT8oXdTwtzrkvrkELVveBlKCqkl5jd0G?=
 =?us-ascii?Q?7vHOyUpfZY03aCKgISPKMQhrZEtDrcJeTD4Us8R/KnqHXUCDDhvhh4eZIbs+?=
 =?us-ascii?Q?PDXQx2COsTjexlEaBUR1O5Pzzu367Pely2lFbMDvn3YX+8Eu/Pi7BllnSgCN?=
 =?us-ascii?Q?QNIHwWR3lB0VqbLydg2Ggpi2ky2+7un9wqu7zsqT7ZqHeuxboW2isVvhJbgk?=
 =?us-ascii?Q?4ErQXpSqNy5UXnEaAWxBKTfh5+tzL6Mh6ru/XVKfnq4P0Egs+wZyPWFlSb86?=
 =?us-ascii?Q?eild4HMMgwRSIL233gd7lTg7tgcHU+TOsWJ4HJbdzCEc39yrff6WOS6a4kIY?=
 =?us-ascii?Q?DpWFyJ/2XERwlJkHSkXaQVZP1ezQBM5nb3mz6JninMksyLZ3uWTJQF/d6jkA?=
 =?us-ascii?Q?NXZeZt/PGndOUojYsdJS7DvP8L85PVLfSn7Pih6Ind2VdOgy2DA1d6WvdtdP?=
 =?us-ascii?Q?w7mtjRABsjUrzZ3tAMTDC6qSFEkhOPIBff2VinbMAn9v398KZMWKZ29oZ9pO?=
 =?us-ascii?Q?EEWNGcVGuUUq/uHak38kcY9r1wHvAfDsT9XPRIUYbKBe9E0mGwb4vtdlTmRC?=
 =?us-ascii?Q?Cbh/P79mzoE3x4qhPUdviCdDXCQ3UGivJbcTsaVvU5B3YYqiUgwz/s2HP/MO?=
 =?us-ascii?Q?ohYTHgZlAb0fouQ4nyqqZ/Y3SacUTbYNAScmIdgBtkTKg76A+b02WcejWcix?=
 =?us-ascii?Q?J3pdtpn4fVKPYggnp8GGLblQyB+w1YceM0taoXRbBN6tLHVFEbJMg75vNXXb?=
 =?us-ascii?Q?Z+PLL8QiOaUbJrFVdohbWnRMha3436ZQA8SDw3OuLGM3TfyERzpfwY3go9Qf?=
 =?us-ascii?Q?LXJ4zHRb98fvOYAEIA=3D?=
x-microsoft-antispam-prvs: <LO2P265MB0174319FF0F94F102840DD5CD64E0@LO2P265MB0174.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0971922F40
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(376002)(346002)(136003)(39830400003)(189003)(199004)(316002)(3846002)(6116002)(76176011)(446003)(7696005)(6506007)(102836004)(476003)(11346002)(4326008)(54906003)(99286004)(2906002)(1671002)(8676002)(25786009)(81156014)(81166006)(68736007)(508600001)(14454004)(59246006)(66066001)(7736002)(55016002)(4744005)(9686003)(5660300002)(8936002)(305945005)(6436002)(33656002)(6246003)(106356001)(256004)(53936002)(109986005)(71200400001)(71190400001)(97736004)(186003)(74316002)(26005)(486006)(86362001)(229853002)(105586002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB0174;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uVMWzj2C1euogCNlWPwlUOJNeuhE10be4qrzIQ2cwCJen1w8rVJsfRZT3Xu1kPEXA3llWufUaAesGeTh/q2B6NELaTNXBKhCk1ogcjRu8N9DiTm6KrBjfV86Z/BrcnJlFfdbEHlRRpsGYxpVWyvcDY5P4asdV2AOhraBV6Umr5uPW8YZp1II4Y6k0W1f07k8x0VsJwIfEnM2rGF1I/Svao4EiSWpK596rCjZTCDaTg1ugy20OaaDFtVPunkuJ4iwgaSaqm0vNpd5kUDYlTeet48S4ZSSBXvrNs6RSCFPXdyUu09b85aGfFIz7z9PPic031JV+a53mmJG+wjBjHE7wAVW9Ot+bovo5Je9abDhvkptDwAEdbsKboTAjkwAV5SvZDl6p1qR++uwTqge2qJ2mHl/IWeVsMVQ8WTv6oXUrqc=
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a54774fc-35b3-4111-d8ad-08d6a4360a7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2019 02:22:13.0085 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB0174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190308_182216_345710_41CF13C5 
X-CRM114-Status: UNSURE (   7.22  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Just realised that __setup has been deprecated in favour of early_param.
I'll incorporate it in v3 of the patch.

> +
> +static int __init setup_tlbi_max_ops(char *str) {
> +	int value = 0;
> +
> +	get_option(&str, &value);
> +
> +	/*
> +	 * This value cannot be greater or equal to PTRS_PER_PTE, as we need
> +	 * to full flush for any non-leaf page table change. The value has also
> +	 * be at least 1.
> +	 */
> +	if (value >= PTRS_PER_PTE || value < 1)
> +		return 0;
> +
> +	tlbi_range_threshold = value * PAGE_SIZE;
> +	return 1;
> +}
> +__setup("tlbi_max_ops=", setup_tlbi_max_ops);
> +


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
