Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA3FC67861
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 01:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P7i6/DnwlXi68r7MQnCX02RiTbESXwxObU6wJEs829U=; b=HRK2yaVaC5taIg
	7tVA34SfCV/OUIvkH2G2ZifHW9WcVZCYoje6Nein80dAvK90LUs5gAjIi8Ac4HnKGhVECgxnBA5qi
	mR+IOXaP7LQlD/JEe8bu1aiRDlqBRm1m3Q6u4da46HP/LhpvwKDeieFURm5rohH0WkGbalHMDEzW2
	oot48fS0R7OExmqqljMz5D/SFZfR2LS7IzEd8wRAc/+4zadhH3I5tRojncZFScOLsNz+OANNjCrz9
	WEjvAwaPyLXcLSvjvgk5CgplDLAvsiyra96ZzqO/o9R6tUFxN9nn9vVT5xYgV4Iio/NQle54kLYCV
	GMsNE66yUzNgirtWrShw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruMhQ-00000004air-0sjp;
	Wed, 10 Apr 2024 01:24:28 +0000
Received: from mail-dm6nam12olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2c17::800] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruMhM-00000004aiA-3PUe
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 01:24:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGmJ3t52ohmWj5j7Rx+Le/K1cukhdM9V3Lb9xULshSpGk6IBIDWJ+VH1CCQONu3Cc82OA3OpiPppVBSzjNpRSh49DceIfuMzu93T2EyTItabBhOqW/3eirCGxJOoBo3glh9ycsaPiix4WqUtrrFVndhAe0ab4I+CwHI6WS9kcpqXp7wou7PFMLCyG33QGdRv5O+OXUlbsWvJiK5pq1AxeSddeF7prKtIP2tmFUnXxFZr9FDKy1BAXlIjgA6vOMq7LJlc0Kc+I3xQk41Py2ju+yBavXMZfiXwNYfW2wIRMZzYH6IUfmNla8M+FOwmtAHJFZosxyEJpyQEzDgITnGq7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T44g8AHBGuFENO2m3qvbFbglPR/RDtB+7o+0boEXPW0=;
 b=kozAhQTBwkt4KrGLfGl9EdzjE2YWlofp6Ypj/+dKLOPrwl8JW6s9cHp3GDLqUxtRjCmx6KrtiIwSEHIbvaxXBQcQlzYiIej71qmVEh8YEzpuNfq9db48NSXF2ZqCLc/I0PyKIQgPc00X1zzm9URWafAPthRxd/hmYWNFSEd0KotPTNk06IN0xn6fafDF94uGbUfgtQ2NUeQqg9l4iV24vqK8RAcsHqReCuF/2Z7wCCjpMCGVRWhLJx0iq/gJp/7feBSxlyO+PnHiy21mbVIrJ8x/cKN1YwoDqd3p5NFg3WYknIcDb0MTP5X0IZI/IAm7Z/Xthj4rzBijMc+YMsHzSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T44g8AHBGuFENO2m3qvbFbglPR/RDtB+7o+0boEXPW0=;
 b=TA9/P6Jk+6s4ZEX6EIF1pg5G9whiRKjRibUxZIj1rU3pdArSeziD8/3u3Sqd4NnM6oFXDT+QEyroiPQDFwv4nRVsYLZDBQVvuv9bmVGhf0mmnTYvHAt0hNpZ2nPkIBgejbOIpiy0THtLxkPwF5WANVTnlzFxuokZy3KyO3KvmndOnwfsC7wDL4sZ3PX5vR+dO23vEPrvPEQaR/VfoMsvzdCMWLTEnlJ4kVLhAHtXvJRiRxlktzhkxSuIQGl5UENP8IalWunnv0A+77sZ2d7SPygop3Xn2Sb1eGbjdIekt9g+wXmHM/qB5Zyh9XITXpNbWsdoWiKxBPTn2OgNPesoTg==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CYYPR20MB6833.namprd20.prod.outlook.com (2603:10b6:930:c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 01:24:22 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819%2]) with mapi id 15.20.7409.042; Wed, 10 Apr 2024
 01:24:22 +0000
Date: Wed, 10 Apr 2024 09:24:40 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: add initial Milk-V Duo S board
 device tree
Message-ID: <IA1PR20MB4953CA04D33EA0C7902DFA3ABB062@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <20240409064504.4010353-1-michael.opdenacker@bootlin.com>
 <IA1PR20MB49532A8D4294ADCE0C33A654BB072@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240409-prevent-deepness-2d22bf009b16@spud>
 <IA1PR20MB49534E00CAE29D24F7D7E718BB072@IA1PR20MB4953.namprd20.prod.outlook.com>
 <1514d28a-5e96-4531-a972-894e41902efa@bootlin.com>
Content-Disposition: inline
In-Reply-To: <1514d28a-5e96-4531-a972-894e41902efa@bootlin.com>
X-TMN: [D+XplsmcBk96I1Sg42bG9XKOBn96rYjHPO5NGWMUfjY=]
X-ClientProxiedBy: PU1PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:803:29::29) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <kjn6rbyz4cn475hrb5vxafusvlg7lbrvh5yxatoeyatccdsobl@5qj7rgyv57qp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CYYPR20MB6833:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a48ff0d-5d79-4fe1-d5f9-08dc58fcf3a8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: etRvX8sVduCZ17x7fvvRwFyG+cGzlTajq3hdOGj9/Xk2Z01JnhddhxKDr0z9RdwIW5tCk7hi7Shbt4677/jR7lGoSGt8NJtAat5EARrgNeMuqROQFTp/p8zsLnAvET/1RvUDxOg8mi5WbUctWJDtV24OD4BTCXfrc0P8LZYoUTQoJEJJOHBNzHX1CkluXjwwWrShDJU5X9KAKsdJ3syHrRRReuv0XBdA4328lIVq1jGLCPekcE7GiNjTseVvDHh3IRFLoFsel95WdBjW8JSr8qnb9hN6ADwYtzdZWAkD2s6n/zalC/iNXktO3GgTj+VEe+IiFvn39yC2PuYfRQT+X8iXVJryTZMJtWtjzrQcYvAOtw/LLrrgucX6Q75bQZhOSDUPsgpmRusG/9KI+8+hFkwK5I/m60AJsHk9vpem01nC288UXbNeCnFYPIhvJfykzJ+uQ8/vxeDT+kBhDUDKm5VHV3ISUumzCDp5+YBuZcrGgDGBTEt6SVZ9IaD3VC+5JKkHneTAD2pTDIceAJVJ8MgBWzAcN99l7EopTr3BeUGkVBJZX0LTPnInyEwNw3HGcSfsERx7L7xrmJAGS/ZJGvb35stlH6aLlVcBMOF7FFAZ2plykNLfHtIExjANW2Ln7vGuvo72E7dpv1ywPaViMaXobUnMJUycoCJEWY0uOajQPYqoxSf2NP0o7CKD1CUo
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1pkM4q/OvzPyPdCJtGFGcPTnfSBvryZatmnaMjTJ3HPFiudoobGeAnb7NyDp?=
 =?us-ascii?Q?7j87rrCXmZyCFZQEfRg6hRdeblItb6drceGS0cKQSVUnVUPm7PsJ2fM6ZQZS?=
 =?us-ascii?Q?tn96GVTEvJKoa7D57KD+yfuD8Qu/oHmrh3MxNRHo7qUFLeJXRtkyrqsL/wKZ?=
 =?us-ascii?Q?j1BHMasInBsnm9Tfz7yCxK2dNhLwxbteOMeFFuq9BQqFKScQ5k2eEQa5FSHT?=
 =?us-ascii?Q?+ScGUeHJ0isqoCcvCLZLx8SK63c3UmjtunVEoQfN8T+jbv4hyQ7fTARj6Iak?=
 =?us-ascii?Q?UokZiAPlCOcmaH8k70vCIg9cIvgURiFPBKwzHyZtXXReno0A/narFqIelORq?=
 =?us-ascii?Q?1uZMMt0Wk9E2i2ji2uqN/5EmjgGmJzW0mCkP+lJ+ZwxKgsr0uXHUmKzw2S43?=
 =?us-ascii?Q?gVilc9fa4un70gli3e5Xx9zB67zcwavQJGAMZ7QSj0IkaE7hh4knjEGKnQ1C?=
 =?us-ascii?Q?B1pFAmZR7Ee2whoKwdel+uRpVc8r6l+9WYFQMdsg6/nr+/IX50vmUUPtPL3p?=
 =?us-ascii?Q?TDGvJj49xpyfmWkkVheNw4vzkaICPVNWzLVf6L0uF0iUjVmxkjoUajfOi1l4?=
 =?us-ascii?Q?TflEOwRE5d2rebo+QSd+jrJjytphw0Gx39+Q9ugSNCFL7HVyFFB14gg+kDrP?=
 =?us-ascii?Q?Ay8bg5XxobeScAroiXUxvwx7yud0zzMPA4VR8BUDQd02O3IElMxGq6JQuwqc?=
 =?us-ascii?Q?k+Jod0WpNEzCgQ1SD5b73+jmPocYLLl8JW2ohK9Y/oMWu5aa1ACvfymnPzNG?=
 =?us-ascii?Q?NDYy+NIZuHMfZJkw/kZDdCEYJwB0aVu09gt4+vc+Dj2IZSr9eVggYiet1ojk?=
 =?us-ascii?Q?wI2iZW7Ad4qo+3eploC1rF1gIQJ3xXb6RnITlNkR7ZP9/CfkZe+XuNoPHQS9?=
 =?us-ascii?Q?Oca0HxlAS2FUspoaEwQlh8ka3QVdP8W1DXbd7umMsjJ0mOqilnI2WnzRanLy?=
 =?us-ascii?Q?vC6urWZ2oEQEFnEroJ/iYaTRnxBWgKb17iOWJ859nx/sIdAlOOvkZoF9XYuk?=
 =?us-ascii?Q?WgPQfcmteROcayzHUfq3lv0jWP48LQi2DkBQUWsYuNONroV+n+R71QwPUNZr?=
 =?us-ascii?Q?U5VDX3tw+OtCOzrlQmZBNIKMYSjvDky7RbxQr1cpy1hPKoVH22yBg7ep7vDK?=
 =?us-ascii?Q?iVD2EzGajxI6E4McmzgIWAMH58oNcXoMF1Iq3LTeHoPyPUWSZqaYr6TOt6c5?=
 =?us-ascii?Q?ruAN2hqa7Y/efudnyGvIyLxACl0uywF1hVek7Fh4lZGqmO99BESKfEQWSKJM?=
 =?us-ascii?Q?88e+6gAuNbgJUKy2teJC?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a48ff0d-5d79-4fe1-d5f9-08dc58fcf3a8
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 01:24:22.4137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR20MB6833
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_182424_883853_8C5CC908 
X-CRM114-Status: GOOD (  20.82  )
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

On Tue, Apr 09, 2024 at 03:08:17PM +0200, Michael Opdenacker wrote:
> Hi Inochi
> 
> On 4/9/24 at 14:27, Inochi Amaoto wrote:
> > On Tue, Apr 09, 2024 at 01:13:32PM +0100, Conor Dooley wrote:
> > > On Tue, Apr 09, 2024 at 03:17:35PM +0800, Inochi Amaoto wrote:
> > > > On Tue, Apr 09, 2024 at 08:45:04AM +0200, michael.opdenacker@bootlin.com wrote:
> > > > > From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > > > > 
> > > > > This adds initial support for the Milk-V Duo S board
> > > > > (https://milkv.io/duo-s), enabling the serial port and
> > > > > read-only SD card support, allowing to boot Linux to the
> > > > > command line.
> > > > > 
> > > > Hi Michael,
> > > > 
> > > > I think your patch losts the board binding and have wrong compatiable.
> > > > Also, the SD can have rw support with proper property. See link [1]
> > > > (need 'disable-wp').
> > > [1] doesn't go anywhere useful.
> > > 
> > This is my fault, I copied the wrong url. The right patch is
> > https://lore.kernel.org/r/20240217144826.3944-1-jszhang@kernel.org.
> 
> 
> No problem, I found out.
> I confirm that using the "disable-wp;" property does the trick to make the
> MMC writable.
> 
> However, it wasn't mentioned in the above URL...
> 
> By the way, do I really need those under &sdhci0?
> 
> + bus-width = <4>; + no-1-8-v; + no-mmc; + no-sdio;
> 
> My board looks happy so far without them ;-)

FYI, Jisheng. Could you share some suggestions?

> Thanks again for your help
> Cheers
> Michael.
> 
> -- 
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
