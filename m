Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4483C67861
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 12:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iI0Mg45GXWbhkYPY4N6BkNrBxNM2L7MkvgZEhqtKlz8=; b=Y06SrEQybab4Wm
	UiJpVer+NB3wq+RX2j9OhZnF791eIFVrHMTGyf4Flp3mFtfhp5FfCIPhRcosWYptOfewlFGkyNGdq
	/pMFN+0fe3k2SxKxiyeaGbbh0BAx47/R/9T41ZePO84TTCcnlvQKOu42rOHXgMLmtP1bbUVRfiyNp
	u5lPvfx/HYnAB67ZJBa/EGf2yXNi7q3qnkHs+x/9XJBp7cKJFkB3z8ZsyPCgYp/8xuRxIBcAEV4WW
	489LJRSV/St/6S8QLsrWObG9EIW1zAgr83SQRD3OY6u1LRa7/XALaMYK1d9CuIOY92CLSJ+oBe4I2
	Lk9qOgmKMFdyFa5MtewA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruAcG-00000001vX1-0Xeu;
	Tue, 09 Apr 2024 12:30:20 +0000
Received: from mail-co1nam11olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2c16::800] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruAcC-00000001vVo-2K9W
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 12:30:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQ8ppOoGzWkcGieCAE4C/L0RFl1rEYh6ncqIHJuNaJ9QkmttTe/pPktIVc0YKQUyC6xJrRjIqTvr3U+/zbG9w2n6qhBe/7EAq1eAwUMywAJnaozr9MoBv0ruLKYNhyJiSyWJK+wCtKNI5zIEqi1Yzif+qtm1CIZNj6d7IKn1J2B2bzOZviM3lDhVRlDT5UXpl/ngUA2q5pArt0uJvAbtMjOulAB8yGB7LMGBvalFtAtLz3DWto5B38QG6uGSlaqUYf4FVtTnAZzaL7trLnwFg2qI2CGWhcyiJ72CG6Mn0CR89oAYwtRyvw4zT9uCDjclU9WxmLoIR8Ntyjzpm2nWQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AuJF5EMOuf8ejSmiesQFpO5UCeuehdqeLU2GEf9h2pg=;
 b=WtYu+i/EihZaFaYE94VkGmMFSDsSx6Y2A9lvlMnKLBrvm2y6e0zn8zz5bcbs4hydl2eHgTa2k6nzlYttDYg6D0JhwWP/zkGhGt0+JJmQihg+TmoQgzicy9FeBxBSr8iIB9m8t5OFOBMKB9yhBVRUHQ4/sVvEDiIjWoGVeprBE8uMmCJnFeoTqJEBAtZ7MLEZRj/N2mRBHlOGXbhRoHmr80Ymi2ZRw8iJmBVo4qEmiM0KJGZKTthASnOsUNntNbEBu2aK7CDkxflmqkjx8VUOG82MMuUgqPb1UVMKYENVNNKHFATVAS23gsh+mdU1tywyi/OmXMPQIdUVspQ2nmLTiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AuJF5EMOuf8ejSmiesQFpO5UCeuehdqeLU2GEf9h2pg=;
 b=gvHfaFp7wzYJUMmOc6LF0JIfvesnn5uYV0wrEh4DjRXol9ycBIxJaw+m1NnjUa3wjhUauQKpwRCAwCheLmBs3sFOTq7+QhuiFA5QD+LQ0VEocPs5G9k2wCp5jMqnXr/nQAL/7InJDq9UayEY7qDZM+6iKudIIFN1KL+DuA4zA/oXsn6s1zucabdjmDuBpD8iA15nieKH7u9Ft0yKL6cE5Iv1AGl6raltllpyIkj0frueYlHKdfkQSCm+/O7dnkfxEpiE+wZniDEA/NtbuU1uS+9bZyeOjsuA/U6EIS56uqgflcVqYJfUxJlHZTUfY6FiJWmxrkcNf8EL3g0AOy1CYw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DM4PR20MB5728.namprd20.prod.outlook.com (2603:10b6:8:104::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 12:30:08 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819%2]) with mapi id 15.20.7409.042; Tue, 9 Apr 2024
 12:30:08 +0000
Date: Tue, 9 Apr 2024 20:30:26 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: michael.opdenacker@bootlin.com, Inochi Amaoto <inochiama@outlook.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: add initial Milk-V Duo S board
 device tree
Message-ID: <IA1PR20MB49534DC28F291E319FC0130CBB072@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <20240409064504.4010353-1-michael.opdenacker@bootlin.com>
 <IA1PR20MB49532A8D4294ADCE0C33A654BB072@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240409-prevent-deepness-2d22bf009b16@spud>
 <IA1PR20MB49534E00CAE29D24F7D7E718BB072@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Disposition: inline
In-Reply-To: <IA1PR20MB49534E00CAE29D24F7D7E718BB072@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [CwIu38956w3+lQGOnNczl+GRmV73qJ3yYIlm/RdREtU=]
X-ClientProxiedBy: TYAPR01CA0230.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::26) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <mx6frhxuvzu7a3pbqdqgkgpstlxjedxcczxfwkfd5agkgostcd@s56xzbriytsb>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DM4PR20MB5728:EE_
X-MS-Office365-Filtering-Correlation-Id: 15deeec3-2cc8-4729-7b0b-08dc5890cb16
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tgAeT7rWJaO2QvVZvAf4VXEZvj6e2HzlNWRdms8Rx2xygsxwhGGx8LE4GgkTAIshDeYx3eELoEeBV62SzUEwxsRQR5Rmu90G9aY87xhzFCdpwE5FtVRXaCr/TGEjdUqAwicyKV8Gm2qrPwaJU6TIsWQCly+edDW9+jVkmS1Jai/PUdALcDH1myxRIxNpnC09oGsmJb8pJb2KF02sEFEyvnL2RWbUyCRBoUmJHxdU1AP5edKmvk4ao2dktl7oKG4WRaB58L0qs/ImCLC3rdMcURFNpk9CDkwC/ETp55aEbj2/L/tTjzbb1R9ZJk89QHTe93vNPg+2kHzN4WaB/0tl//Qy1LGMAgZcXFTE0OjZNYMTJIXZYz6bd/Bl9kHfRGTaxgIEvj5BiWiEFKGQ/3Z1mcnZzOBILdEt55PyEsHkN0wH8JyOiOpp9oaUrHuOhexEB9UlaOG4JoEMnZPOHVqHTH3Wvg6JME76IqOf3tY1KJyGz5u7S227Xedm5/qr2enFZfTqslBQgw4ycKhe9WosIFdngleaOtA8U9yaRcmb4cNpmUkN/0aXbKTTt2pYwIiI6cESQPoXbVxcyZ1jg23aqfU/5atmY/iNnSkS7E+dkFMqAK0NQZodVmb7SVtoEgbiOrZy4mJgDLh17C0/+Vt0FHiPvg8hWNOvztGrhDaUo/R9eioJE+EdXJjcTL+aJyb9eScxzfzlzXPCY00/2wSfYQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jtoLpXHcebI4JOebWFe4KUywlRLkDGDpBOgYLVJ7QN3hvBlWta+ag2dNQKOz?=
 =?us-ascii?Q?MHCLXdvew9Gq3NCOMWDvKRD1RYIxVFeUVNEisXFt+zthaT4g0bkTr0tF3Pcs?=
 =?us-ascii?Q?o1vKzKxv9B+b7tuuX8ll3ALVKxRlAHCv9r/q+7b12xZ5fdhJJ//ZTPjzPlDp?=
 =?us-ascii?Q?27+tugSRjbe80FnkRhOe4TnigQ44/BdTutfft9EXMcthg3b2yXll1CDqFzup?=
 =?us-ascii?Q?iWC/TKLigZMeawxjrotsNhVr27kjo9yS5HY9iW1rQAo8bnGMvlgnccRUG0dB?=
 =?us-ascii?Q?8fkHgHuY77nnBW0eyoSjVWZUAGcLuNMkvxopQYPer/+bfIsz6RHohlOa8nac?=
 =?us-ascii?Q?d5WPLplVsvaviKujQoEACSVCpx0IS+OgLeLRYjFen92ZClJgAmZIbf9Go3Fy?=
 =?us-ascii?Q?jSc5TJpwZyfOmFBb0paYxCv8J0OEXIRjRnLR4D/PW9Mnxab2cnPpouLZuRAh?=
 =?us-ascii?Q?3gmU3aHFsgIDgnQMmIDxdchqk7Uz1KI2GKfKMlPRJJt8FMXHOrRgk9pVICTc?=
 =?us-ascii?Q?3STf2cqLmdUqOtXASAoiwm2080nzS2JX28cIkrZFgXTq14vNT9FE1GC4YDYC?=
 =?us-ascii?Q?23HErSqSIsthcVnCB/3SoF1H/nOinJcFwItuslVJkkBXcI/uGjJwUuswjIsH?=
 =?us-ascii?Q?tHEbKFN7mUdPPOGAtYAaQdSOVOPljo0dp+JJ3d9rYq5U/9BotfkGncFxlVk/?=
 =?us-ascii?Q?SUDZ32m194PesfuOjW+4svnH10jTIb2gMpdd5QxiU0k4sdy8AENlOYYX6Db7?=
 =?us-ascii?Q?dyFo6NZYU+SPmBONjF9tmuJ3E1f+UtWOJJkJuJFy1UXGTc3YZhO153v/gysO?=
 =?us-ascii?Q?9EjMqj0/cCs0vk7FZKZnU9fXCNEZ2ElWUsiHSdWjiyq7IWW4bKd9YWxAa20c?=
 =?us-ascii?Q?Uhv8lmGyNjyHPOfJzRVrcItKc71VR7XKN6qHs6JZsuz59ZQx9PW/5moBPy0w?=
 =?us-ascii?Q?zw4PXrnGHGEL+9Lk7PTf3xPWeNniOPanrczbZlliiP+Lpn0O/GHI8XkBcXE/?=
 =?us-ascii?Q?mAkjXtmbjXByxsbyvgdbb9KDCrFeLd2aCCP2EbwhGZWs3hTvSV366ajgF7u6?=
 =?us-ascii?Q?dIOMz4H6a9kzXjPG9V155hcQQUAll8aKnNS4RA50Kjx8AsK7u1yO5DiwuQko?=
 =?us-ascii?Q?k/4HJTdWEJ5C9cgeRGRT868wFQbi5jBGLP4L7aT9/5JBZFWVtfnZrTyfnUE+?=
 =?us-ascii?Q?kz/JK46DqCF+luZxZyaBdMILRlb2GC2P3Y5GzHNJEDMLqxsLVGL4eHv+yZpU?=
 =?us-ascii?Q?TeMaO9DijFqHp0Jw9OE0?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15deeec3-2cc8-4729-7b0b-08dc5890cb16
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 12:30:08.7844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR20MB5728
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_053016_641114_FE87E262 
X-CRM114-Status: GOOD (  21.50  )
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

On Tue, Apr 09, 2024 at 08:27:59PM +0800, Inochi Amaoto wrote:
> On Tue, Apr 09, 2024 at 01:13:32PM +0100, Conor Dooley wrote:
> > On Tue, Apr 09, 2024 at 03:17:35PM +0800, Inochi Amaoto wrote:
> > > On Tue, Apr 09, 2024 at 08:45:04AM +0200, michael.opdenacker@bootlin.com wrote:
> > > > From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > > > 
> > > > This adds initial support for the Milk-V Duo S board
> > > > (https://milkv.io/duo-s), enabling the serial port and
> > > > read-only SD card support, allowing to boot Linux to the
> > > > command line.
> > > > 
> > > 
> > > Hi Michael,
> > > 
> > > I think your patch losts the board binding and have wrong compatiable. 
> > > Also, the SD can have rw support with proper property. See link [1] 
> > > (need 'disable-wp').
> > 
> > [1] doesn't go anywhere useful.
> > 
> 
> This is my fault, I copied the wrong url. The right patch is
> https://lore.kernel.org/r/20240217144826.3944-1-jszhang@kernel.org.
> 

FYI, Michael. This is the right url for sdhci dts. The previous 
is wrong.

> > > I suggest you resubmitting this patch after applying clk patchs. 
> > > This could reduce some unnecessary change. For now, you can just 
> > > use the dts for huashan-pi (with changed memory size).
> > 
> > Why would using patched huashan-pi dts be more suitable than carrying
> > a local patch for duo-s devicetree? What am I missing?
> > 
> > Cheers,
> > Conor.
> > 
> > > 
> > > [1]: https://lore.kernel.org/linux-riscv/IA1PR20MB4953B158F6F575840F3D4267BB7D2@IA1PR20MB4953.namprd20.prod.outlook.com/
> 
> I think you miss nothing. Using huashan-pi dts as a temporary 
> solution is just because they are both CV181X series. Since
> only a few peripherals are supported, it is also OK to use duo 
> dts with local change. They're not significantly different.
> This is also the reason I did not prepare any patch for the 
> new board. (such as lichee RV NANO, duo 256).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
