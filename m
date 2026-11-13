Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FA7606A8AF
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 19:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B+IQxEMp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=P1kouxgN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mNJT/C7FbBxG5sNdncAjgXY3U7y2pESdbXoDbepgEZ8=; b=B+IQxEMpWssEy1evT6uwhnw1fw
	2CbcV5qFUgbDO2QeiWrjZTh4JMlZBlDY2yxh43tJMh8hDLDAn+BWtNK405FMrqJcsCD0FUI9p8Uem
	evn5I0ijy+no9w/KonPCv3K7x5fdRQ/ldcAbRkwEJiq5LW+JYZ/uD7jr78YA0b0z8Zdl+GdU5ihzn
	XtLyM9J/OJrJtO6x9Gr1aV5J2c8oHlHSTsT4j9BNVPzoEo+iwRng3iugREhCghNvtqT+os3ICAbzT
	kNfDOKXn234Djkd6ptzvmGfxirl4eQTw65mTt+2SS4GP3XWA93dcEu7Y/2nEulnHWGdQaXdVQwbOj
	7jtVpakQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxMd-0000000EIgv-3Z7Q;
	Fri, 13 Nov 2026 19:55:11 +0000
Received: from mail-centralusazon11011038.outbound.protection.outlook.com ([52.101.62.38] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxMa-0000000EIg4-2Ndx;
	Fri, 13 Nov 2026 19:55:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTXUepWh90pdGz0X8W6XFJ45xx+ZuxuRTFdKLbZmo5rxk+hBfGE/JPfW2Mmpptx23ivbEUl0YQLFlAxRzWrRG2tmroJUmEAkb2aqCOjZDrOzjl5Ghpdky2looV3++HmHChvPTD8ic60uJ3HdPG4PjydxzY/TygY8DSaMq+6WVvyXJIER3cPz9+e9Zf/yjP9DTq3Uoj4hf45z5QdiB/NZrXhsi5swVHRxYnp+gitnUnK3OmP3bIZ9uRRf0BI4+dpQmq8sJiwqi9Fl6sEDroTYZrkriJnyogu+tLjqpIW0XY27+KF9lt8ija7WhcYD/xAaiUxEDzmvJhgnhSUreBrPoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIFWvmEfID6OzHOehPoUiLjYZvjUuULUz+IitQD9khg=;
 b=CKaj+gkOrKh4kx5HF+XNyQJqJAS2P/gPF6qd4gRT/OCQI9LBqnmcIDYgXH1c/4K6qbyAZgs5MZNVuL/lgykExDG9cJQBndgHScHbW83YivkEOAxgVTWf1AGyADngK0CXwDKjuuPRAJhO60/GOzWvO+jgypN4QkirVvHkovxyTdE/8XwzsnXT/6Uy3wJzARHPzRd6keySRbPFUpISzPln1nd4OT5JA14SqM0yXvTV5u3fIxT/4xRAi3/DMfSSCgy5LLVoRjvkUBZCEim/eFslWvMJuRPRALzv4HaouKrnLn6tapb0FnNLr8yrxKj6HkbXuw4eObaOcEHIhEJ79+Tnfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIFWvmEfID6OzHOehPoUiLjYZvjUuULUz+IitQD9khg=;
 b=P1kouxgNNCvkthHXt6Xbn9pdUcZudnR6k/Y6/n5cHNgyYywcndBuESgAv8zHJCbqahcnDDN3MmYs9lcfie5fcEH4xjWdezNfygISfLYAil1J8PWvKxdoCGQpUH1nMiW7HZtV4tDJwgYd+a/0kLWuDbU63DEQuDwuFaVw6K6jXxAozDukI5rGGl+Zya8Iq5cctM9c+lmdiA963QQ7MRsqXEJXzE94gq8fpuqe2NFDbiCF+ADfsuSR/fDzVBC03wK029fz3SmL1q+C9+ddOQ3qu5TmK9UJa537P5LgiFqdYIR6ZpkzZEdFqbrdNv/aP/4bvY3p1mrsqD0TJ55FPn1Urg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by SA0PR12MB4493.namprd12.prod.outlook.com
 (2603:10b6:806:72::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 19:51:33 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 19:51:33 +0000
Date: Fri, 13 Nov 2026 15:51:32 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-efi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 04/10] efi/libstub: Capture loaded image information
 in struct efi_image_info
Message-ID: <20261113195132.GA386258@nvidia.com>
References: <20261110121731.2728824-12-ardb+git@google.com>
 <20261110121731.2728824-16-ardb+git@google.com>
 <179458262195.3625095.6692761412463057203.b4-review@b4>
 <274609cc-2c17-4bde-bcf3-f309655f0594@app.fastmail.com>
Content-Disposition: inline
In-Reply-To: <274609cc-2c17-4bde-bcf3-f309655f0594@app.fastmail.com>
X-ClientProxiedBy: YT1PR01CA0105.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::14) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|SA0PR12MB4493:EE_
X-MS-Office365-Filtering-Correlation-Id: 71b9ec4c-0746-4aae-b97a-08df41bf84c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|22082099003|18002099003|5023799004|11063799006|56012099006|261021135927099003|10067099003|4143699003|261102123227099003|261026140227099003|261026121527099003|261022105027099003|261028144727099003|261022075727099003|261021121427099003|261022115727099003;
X-Microsoft-Antispam-Message-Info: UgRON4HSeX0ZK8luz6ff5Q3C7ECMwQyu9n98YjN85FO2f/szpsPuUwdWaM1ry/hazmN+F74Y+4S0qfRAq7JbvfjuVIPOMP9DQ5/HoRJGSnHa7dZ8rArMBGeF8Sd078w4usek0Y3VWmNgWMR4Y3nQcOwJOgqS0Mjq2ZpzSjH335qULLiUYt9+D1SgG396DQOvTqCBwbmJRJu5mEjQoRXS97azQ/Y2LaJmAFL6ItZNaO30f6HkOI9+ALquyh1L6Bh7Ihz6VgDQte1houqaytickDSY1fUlbuNzLXwipiFjOoHebLqYcAvwdfXiHqJt5mzFszOiBCnCsaOsqOFhdgss5fCSf/3yTocvqFtx5nzA2Yl4D12eoRk45NqFcaDD4eX7sqOvzdIBjuiPzxNeylzwiMQmiretzZJYvZ18x0RN7wCIpaLyT/8iQ9dDsmGAxGDxf1gNSJahRBHLKDOclr5Ay3Y2s+VibEVViIfDoRfkmdgRkW2ge4NmgyHpd2uCBMtraiZ7mMniMVNlBuNrXLCOl3gIbE8XLh+aOLA91dKcoHhuZAV6fkp8ViaE8ZQWztVtYoZvCmLvLP4TUnr2dMoAkgcm2bTil122u68Ds3ZrnUCP4PdvD1AIy7edyYCJRZgVzmCAKpp+eJ7FqWgGjvaIl0dwkOQhSMpt7Bmrm0FWVAA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(22082099003)(18002099003)(5023799004)(11063799006)(56012099006)(261021135927099003)(10067099003)(4143699003)(261102123227099003)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261022075727099003)(261021121427099003)(261022115727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6/IR1Xz+/Nh1/5FRa3MnwZViXXcfwfw+6RjuvH2bZCfbRMVcFYHq0wyfzyYV?=
 =?us-ascii?Q?dWKrzdmDdeGcefKkdXLFiDMkQ2oI9+1fiORiGnLwu9n3HJXngVsXnkuUpnBk?=
 =?us-ascii?Q?brhASD1QGf4zrAZsLJ15rr7rGx1zN50hzPk/iafv3zPN2h2VWFypS2nA9/GA?=
 =?us-ascii?Q?cA5lW4ZOVqaPZ4Iy6tIWl016cLe0MIfC7i2CZEZLOt3ThntGcIDguU9hcsAm?=
 =?us-ascii?Q?L4TCTQnGNcy1fm40p07S0y+dwoOvi6I3Jf7EkWJF8w6SC/KdKIP0vsM2w05a?=
 =?us-ascii?Q?qgPGTnMd0OJy73ayGoMZoGrmC/5LjPQk7F6eU9QXiXQudIq8/Z7Bv8DF7WSS?=
 =?us-ascii?Q?CPoUu7df2H0K3+KZk6wkYJNUERi28LBAHiijcqVwQLlU706dTc0mDK58uxDI?=
 =?us-ascii?Q?8zeMBa0fR0Y7oogFqRbxH2+mxq719DQplFqWVAnTy81GhzikIEh1+TwNMcVf?=
 =?us-ascii?Q?iMBGQ8PjR+YBIqAEnV8waz2QAaz1rMI1dD+/A2oGCI0hRrjE+xwC4+w+CGGo?=
 =?us-ascii?Q?I6ddooifmlaGMfoHupmqv4rxLlYtpsxw6kaotFm4vf4jdiVxWFcKIl1fhuxK?=
 =?us-ascii?Q?IebfIErgDVCxNVC/fo4qMWYT6O0q2uodjZfaXNSkWqPChGg+FebiivZUUZ4s?=
 =?us-ascii?Q?D/iIGvfvA+zIkJRENFB2j9T1oTmcI5d5j26A21NrCP9S8lBtzWrp/Ob829pN?=
 =?us-ascii?Q?wGFaw1J3bCHc/+CmKeX+v4qgzdMPvOo/DhJEoIFt8u9cscdvE4FzVfUgYOiN?=
 =?us-ascii?Q?5kzGeC/s7xzwRgbqYygqPDYfhtgUFyPN3PBFXL4X5k56bdVU3aK0o1f/t25i?=
 =?us-ascii?Q?tnv3XcyWlcdDd2GcEP+xpRM+KgHjvCgHFCWZZan8cs+BAgi71mRFTmXvUsoT?=
 =?us-ascii?Q?Af4I5MONYd4S+XFQDu3OgN+2o4H2BlnHTRePdcT/N2AMrA76h1pXYo1kYxH6?=
 =?us-ascii?Q?0+YhJJZ5dnq6m7OetdYpJzf2igsIW5CgUQUWjk/ij3/TwxBDyw4b92CxbSqL?=
 =?us-ascii?Q?pudnVWQXe/28Ww2diGsp1q34ICArds+qWxB0iLGP3p6MEOmoye4tCVXpCUyg?=
 =?us-ascii?Q?HrjAybVarRn0M+TDMCHQM8BO1Rqhy/EpdDUR7CBCSMsTIgN0rBY1M8v7k/NO?=
 =?us-ascii?Q?PawNVe/ypJZueK7PIyB5sBN4NqBwZYVB9RMVhiXPg8wL6PdfLqCmUVMXzB1g?=
 =?us-ascii?Q?lFdpJbFN8rUMh0d2l/pDazLsZuqzfSn1Q2+Tv4WqJ3qSfyNsw88FMEXApBjL?=
 =?us-ascii?Q?spxQf54rR3HcbwcffMznAWW7PAf8TdraPCHsoSU4UlQu3AgdaRAI9adnQdh0?=
 =?us-ascii?Q?5nq2Eww5BhCjebsuN0oM9mq5CO8imo0dADjNbEiKHxcdUNLpyNNSpXpc8eAc?=
 =?us-ascii?Q?+yZUxKH6Ebq0B/3LYt0vwBDpkDgIurA67lgh7d/NjqhVGVP+mFUblW15DEaR?=
 =?us-ascii?Q?GlW5wXc5rCWG/8sdks9L5ItdS4EZ6noRH57U06y0vrgZvhN8224oYpHndikG?=
 =?us-ascii?Q?YRjEiTjMuL8BoSNl/FZJ5GKCW4aw30ioKoVpl6WpdC6tQeCsxuaLfSQ6zmsf?=
 =?us-ascii?Q?C9bWyqUmAZmteQ3epsJVJkMpEC6gO8rdVovagdQjqg7ISzzGjZf6OPZDVfbP?=
 =?us-ascii?Q?HeHsFzNvWvXar290iJTTOg/6qB/kDBTQBR/ot7UXj0RwPbytT2OSd1Yxuw7/?=
 =?us-ascii?Q?hZAFhGzGhCiW1slCjFgLQF6lp7bKi4Ow/JAheNRk0AQVphnF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b9ec4c-0746-4aae-b97a-08df41bf84c4
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 19:51:33.2967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JgHtakeya+NEvGlp+eQNqJg29deL0l+6U4wSbaMYMxyy+07oVMYYost5vmWpwE0I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4493
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_115509_307363_66B06C98 
X-CRM114-Status: GOOD (  18.93  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 05:15:29PM +0100, Ard Biesheuvel wrote:
> 
> On Fri, 13 Nov 2026, at 16:10, Jason Gunthorpe wrote:
> > You could do the same by passing image_base and image_info everywhere,
> > but that seems less nice.
> >
> 
> I'd prefer to handle this by adding another offset, and an API to update
> it after moving the image. That way, the EFI stub code can still grab the
> info struct pointer without threading it through the API, while it will
> always remain valid.

I did draft threading it throughout the API and it was a net
improvement, IMHO. There wasn't much and it removed __weak function
shenanigans because info is always available and you can just always
jump to entry even for zboot.

But yeah, you can adjust the function to return the corrected version
too.

> > The code could consistently use the offset_to_ptr() macro if the label was
> > included in the macro?
> > 
> >   #define REL_REF(sym)	0: .long	sym - 0b
> >
> > It would make the efistub_kernel_ptr() simpler, and the three size
> > calculations would look like:
> >
> > 	return efistub_kernel_ptr(image_info, __inittext_end) - 
> > 	       efistub_kernel_ptr(image_info, _text);
> >
> 
> Again, probably cleaner to just refer to the copy of the struct once
> it exists.

Well, we need pointers, like for entry, so as long as there is some
way to get them that always works I'm fine.

Converting directly from image_info without the image_base argument
was convenient..

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
