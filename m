Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C98CD4F24
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 16:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2D4d7wCDd+d228Sd8UEjWeFG1Zzag95YXmvbWnrlACU=; b=yqdp0dNyrye//t
	B+7oZdY6inu7Zx48xOBxLM2qDf88XeST7F+crdqrEgl+F0Zl6J158d9hR/eiu7ZY9uE8soJwD4SnN
	j+PnKcvOjXIdqkamt93oNIW7ZEDXCkVBuugU3stwLsmgTfqoghWU7uCMbsHJiYROOBr7VRMwvo5Gp
	XE6sZ7ia0+GI6x9DE21j/JHyx+3vQfckeXIeGzHcBb6tAq+sNRnucorPnTEFCnulBAA7aycKKRLpv
	BjybloGUiEfZ3yagqa5VnORiSOu2KdN/Fsan8qQdFtr1ZcGHxdxDYWIR9U8/b1QkSWUCCK+9AKV5t
	ToERFyy4Z6ORSTMJrV7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMq31-0000000HNPk-3a0t;
	Tue, 12 May 2026 16:33:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMq30-0000000HNPP-0j4G
	for linux-riscv@bombadil.infradead.org;
	Tue, 12 May 2026 16:33:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=COC+vjb+n47aoQHwQ0IPgV/T6LXS9mg8VLfJAvvfT9M=; b=Bvb0+kyjUDK5JjWCcISvUtpDb4
	KXLJAyCn6O7k+WXWLoTVb6I8jfaC9CtCim3y6NnM/GiEl1ot65BJ1M5kpfgfo5HuXLbeSzoRAzoIv
	HBEo7PiA5ujg8ywabyap5yfOVV8+K0QitcWAeW86zP+senigkB/Tk7dK7IM38fkDqS+R6K/uA3iQR
	f5k5ybsbtO+ptCv+Vf6bNZf8codwbP/cSoRhhfQ0egrzuTHj3aLB7CNjk7ylMAl4nNWcUk8d2vrKL
	MHdFZ8PPSiDqrt6Wc99NfTRcIcapj42caPYxIT5rgpEWJF3ucTdGGXyyKlmVCCxFNbWPZlBvj9g8F
	HL/BiofQ==;
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMq2w-0000000FLVa-2Ziu
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 16:33:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqnO4kuoI240rvaUbgh8X/4PzqQX8+4GexfLL6vq3xgoD7z0ANi8yluB9H+u+QTp/7WSkJ0uN7LAKqmQIGTRyiHcpXWe5W0o0kp2K5FEQU1a0Vkeu83WbWHhz5VHHEg8OXC1XkK81NfL7jUz6Dr/9+OUYCLwkj5CzBtYmKVZTJvB1DSsQsjV+s5M0A8ru4ZdLJa7y+mLVz1MNSiYan9XRkOsJ5Kl/rcPEHbLtePc/FAs4FcGEkNcIoBK7J4VgHsxailueSnbWHOqbbIyL3bVbRSO+TcgIYXGst2sI91VHksLoePqXXxojBKku5ATrcwMNtMTgImzrbkYbXFUrz+Iyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COC+vjb+n47aoQHwQ0IPgV/T6LXS9mg8VLfJAvvfT9M=;
 b=hoic9dIWrc2ySKNBpnFfJHm2VWBetagA+YgtN60+UM80zJ0xmZy4Kd3zn6t0hK/kTAZ4i23K9c/sCAs1EiF/BBfoXiRXFEyOgbLSgqQh7t6XmZdM+vqIG+c2jOp/5XRGNiW4f/lceZYg8mrXIc1oxa/l8zx4hu5CMqQ0teBBe1+2TxNwC1ApnZ+kfQYf9ej+9+tCGECaGLdDLd0q1G0vm+PigkYpbSRmWxk5f2758oe6OV2sEPw3pTlK5xGvMFHl8TENYLCfGBB/eyf45IU2VzLAsB3VQtJMsIWRycSE8Kl09ShjCA3QhgmBysUIFc0V25wL1Ni3wS7ScEf6Kwr46A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COC+vjb+n47aoQHwQ0IPgV/T6LXS9mg8VLfJAvvfT9M=;
 b=H39CSFlZfzD3+ZfDkhxMl+c6MR7Womly40CoqIccGC+dzSGYiyJInOXcqQSQYpSXj5Jqu9Fm1vNgVKG4zqi5sG6yHyBwqfte8Jv7W/acRlkUR9agCKVT811J6Mq1smKcSp9qgz8X8dH/D674ujUL8Q2lCfPfyNmH9qA3Q3q7oAFTnZ5aq26S9ScG6ZbO7pF4eysidR1KIvAnbjTlTC62Ci/D9Rj0RdyCdtEHK4qua6juMtnw1MvP4wghNhVRz9ybyIS9uTmMJT42BXy3vyjnm3zVlNUcXb9+aq30Fp5uzVE/ncBKJ1qgfFeAj4W2OG4Gm0Xr8+K1H9a801RcQKNpAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY1PR12MB9601.namprd12.prod.outlook.com (2603:10b6:930:107::16)
 by CY1PR12MB9584.namprd12.prod.outlook.com (2603:10b6:930:fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Tue, 12 May
 2026 16:33:15 +0000
Received: from CY1PR12MB9601.namprd12.prod.outlook.com
 ([fe80::cd76:b497:475f:4de3]) by CY1PR12MB9601.namprd12.prod.outlook.com
 ([fe80::cd76:b497:475f:4de3%5]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 16:33:15 +0000
Date: Tue, 12 May 2026 13:33:13 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, tjeznach@rivosinc.com,
	joro@8bytes.org, will@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, anup@brainfault.org
Subject: Re: [PATCH 1/2] iommu/riscv: Map IMSIC addresses for paging domains
Message-ID: <20260512163313.GC7655@nvidia.com>
References: <20260508212339.381933-1-andrew.jones@oss.qualcomm.com>
 <20260508212339.381933-2-andrew.jones@oss.qualcomm.com>
 <20260512133854.GA9129@nvidia.com>
 <eiikdvzbjffmsnejcsmpv34ljo5afurz2m7g4do6jxrrpkhnes@dsfruyaccvkh>
Content-Disposition: inline
In-Reply-To: <eiikdvzbjffmsnejcsmpv34ljo5afurz2m7g4do6jxrrpkhnes@dsfruyaccvkh>
X-ClientProxiedBy: IA4P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::14) To CY1PR12MB9601.namprd12.prod.outlook.com
 (2603:10b6:930:107::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9601:EE_|CY1PR12MB9584:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f0cadc8-e623-4afa-6290-08deb0442a7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|56012099003|18002099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info: QlmuiXpPyWOK1KNTi9KHn5StmF1QotIwDjq5r9nrtog4qJlbDanNrLH5tmS0FbPdIP/oWF1G1FhibzCNxA6I8bd+jVjmIHs1rIV4Dcmub15cbDt/GONBPmY6CgfKetkBnZ9YDjxsuZz4HqMEedaDuODbcyXL6Z1Q2SQ2ShmK05eUciRI/LO5w+PVTfLEcnnH8kR+H7BXJGtNvhn8llU0uzWaeVbMgZLd4VvrkoBgh7ZB5eYKMQ+Y2vlujvHO8gKvxrO21aBTNhxNWEaMpiHvXhDDFOUJsUP3DtIoasOFiewHaoEiEWMOAl+C22AXfKz8VhYkNZOGWgk52RewDESCYsrnwazhonlYTEwhuPLN7mcH3u7Avlnj059IFAfRlJ/7AE2yCsfYXv5weYimjazd6OlaTCOkyiASPqOkGlnvBlDwfzsBpVISvVs4X/cqwj6zIpJIvMHG/+xl66HLeUJF5Weq1PSCP6Ltw464vRvieutqu1c+3JXP7aZwnX6TfCN+Z3lTM7rd9P0zICaILoN6oTX5TWbW+jfjUyxMg2HnR/zcdIHkfTdyWaVMP3r9gf2Q6WNlFXvfdSzfdJPD0UOzZyrF54MadsCTnNBnFAVXBG0v8xxs+DIbxYxEYwgmmeMCuMIoK1IQm96i6yyooKZW5bzAWsNrfkXrEHBNPvBe4t5IqsizxIrsdW2zospzUyLT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9601.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?18aaJN5SZu5gLVWHLcmUTmgsdJnSQjHBJ3sOTQqnrW1MT5WtudJzuFFw5nX2?=
 =?us-ascii?Q?E5JMneQQZE3VlDB+re6lMnUfvjTIG2XgNSaLQZM4dDKjy0NkbcAv42kBgNkX?=
 =?us-ascii?Q?iWi9ZNQukTUe3hJZ+Hgw131lkxRTSLW6Am9eBGjlagjqCKvyR8h1D6BL4/l/?=
 =?us-ascii?Q?DYb/M5VTon4+fXBGTadmukwDlbManWlTxNfO7ewv6e0YyFACK2tFvq7dHVmP?=
 =?us-ascii?Q?REB7BA4kbrv5lCtXncWAOhlBjiKgoJTDC6cmyF6NLooJHJ+mQxAJbz8MW1p+?=
 =?us-ascii?Q?YFIi518fnyrge1xEagD216iZ20cyh80ntjM+c5LtK6HuPgh4CLYi3QTJxfcS?=
 =?us-ascii?Q?HOUGR5sTNQiM8ILyntTpznOqS1nym8LcrUTdQKwVy3lVljyx1tVypO4Xkcgi?=
 =?us-ascii?Q?6FSNDGRqzepbW77kWIDUCb/WzXCQX4dWhJLLIQgIWzz25eCG5Znr4mnersaR?=
 =?us-ascii?Q?8QeDaUKCZf5qHK7TLMw2ppnGqbwEQa10HON5wBltc59lr/xp7fPjCkAPvKhm?=
 =?us-ascii?Q?KwKi0BShITga4w0U7YpjL4JLMJ0Lr6bbLx0zVutGUFX3XIJs/MF6+eMoDztE?=
 =?us-ascii?Q?qH2SPYBs6iAt7yiQUnOBFY2gE4/byCb/rA3OlaxRDvfrXRtM67+XDXzyyggZ?=
 =?us-ascii?Q?GaDnQ3L201i68qxBNZCi/BZe+Hjqq98sOpbUBJuT9P8w75rRyS4Q6iZ4SHHq?=
 =?us-ascii?Q?vvUjmlBUaZgiFxC6rD2ZZSMeydqNK0yCH8NrNOmcFh6yPxv/sYVOs7ho4qqn?=
 =?us-ascii?Q?jKWSlhtkvqKgL0839Zt0qpB7+kF6x4ZvoeX0quVHetlMhwIEgDztPKMa3ZbY?=
 =?us-ascii?Q?VsbheQrNGFmntlWWMGnhBy68DovIafhbvyay98A+q4X8d/qv6txdb+Mu5c7u?=
 =?us-ascii?Q?ZumxDpLlOpDhfIfgXHTzn2rgT4M+UugkWuLSJcD95JHj13K1IErJ15A3bTIq?=
 =?us-ascii?Q?cho8u2TAaM1QRAV6E1U//9ZHcgpYSLC7mR/3FGCiKWTeurHjlsEnr2cT4o2S?=
 =?us-ascii?Q?1B/O66ddPWtBDwkfH+hedzHJGy82+PuO43Apgli0UDZRcX0zws9b2sWRg8fn?=
 =?us-ascii?Q?92pAwi4WMpgbf7QgFF7L3Zk+Dw96a4djYT9OzTowDPMcDhxre9h4LFxGvns4?=
 =?us-ascii?Q?EzxuiTCpe66RJVG8vQiVQ3XCyyGBA/GYESyYwezkMzJhykLIYQvwIX39hANJ?=
 =?us-ascii?Q?zcFmH6klFhoigMu0/gHqorNMfE/7sccRM+YFIltb6cDUvTArlz985dzFV7F5?=
 =?us-ascii?Q?cVaVP7YbWy29dPcxeLLerIR5Xd9BbGljVpE2UzFqW0dW50CWIpz3NVu7LX4a?=
 =?us-ascii?Q?G34zIpN9P2Hi77RpWu6MvA9+l7dywBJt7SgF2NR2zvJgQsFKSGpJD3CPy/7m?=
 =?us-ascii?Q?OtYaGTaCZq+BBQZ5o5sNOPDfHZWbf8q0eqimpXJDSM1bYHqH1CtGLyQ6NvU7?=
 =?us-ascii?Q?bQZ4KPedtBY6Y/PG5cOMpUIu+M2foO0CwFOoj7Eb33mbFyLzFyUS78/EFNss?=
 =?us-ascii?Q?kXkLMoYhIVkuoOEJA7sFRpOfi9V406K83ioAjis8VSOOjpAGfi9wBUGxrQ+3?=
 =?us-ascii?Q?1pU8lagIvKyuzHFlTZjiuqXrw9TJgwkQRs3WmF0cuL6AqalSJEjj8C2YAN+Q?=
 =?us-ascii?Q?KLe/nZ0igKE6E68e62iYa+UmD+cm9JgCbMEE5ozZJ1fknKRucya0HiQb4Kdk?=
 =?us-ascii?Q?JVxTuxfY7QliZXSelsd83dX4hIyM7/Z21N1iZ+l/UqphvuZ7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0cadc8-e623-4afa-6290-08deb0442a7d
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9601.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 16:33:15.2159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lq+Y78k05PyTMOpZnYWm3Ynn8vkWEmuMv+39xVOmMKDhyLKsRRb/V6Up93EuIGU6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9584
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_173327_094952_1A95A94E 
X-CRM114-Status: GOOD (  26.39  )
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

On Tue, May 12, 2026 at 11:22:46AM -0500, Andrew Jones wrote:
> > > +		/*
> > > +		 * The device always writes to the host physical IMSIC address, so install
> > > +		 * identity mappings directly. Use IOMMU_RESV_DIRECT_RELAXABLE instead of
> > > +		 * IOMMU_RESV_DIRECT since these 1:1 mappings are not required for assigned
> > > +		 * devices.
> > 
> > Oh? Why not?
> 
> Hi Jason,
> 
> I should change the comment above to be stronger. 'not required' sounds
> like a choice is being made, but guest devices must not have mappings to
> host IMSICs - that would break their isolation.

VFIO is more that virtualization and it is certainly required to have
these mapping to operate interrupts in normal non virtualization VFIO
cases.

> RISC-V AIA has the concept of guest interrupt files. Assigned devices must
> write the addresses of those interrupt files to deliver MSIs to guest
> IMSICs (virtual IMSICs). Also, the VMM can map the virtual IMSICs where it
> likes, which will not necessarily be the same addresses the host IMSICs
> use. We need the irqbypass series I'm working on for guests, not these
> direct mappings.

I remember going over this and it was decided it couldn't do the MSI
security so it was in trouble..

And mapping the virtual IMSICs is problematic too, ARM has the same
issue with its ITS page that we never solved.

The proper comment is using IOMMU_RESV_DIRECT_RELAXABLE causes
interrupts to be unavailable to VFIO in the normal ways which I think
is not acceptable for an IOMMU driver.

> > > +		reg = iommu_alloc_resv_region(local->msi_pa, IMSIC_MMIO_PAGE_SZ,
> > > +					      IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO,
> > > +					      IOMMU_RESV_DIRECT_RELAXABLE, GFP_KERNEL);
> > > +		if (reg)
> > > +			list_add_tail(&reg->list, head);
> > 
> > This seems like quite a hack, the ARM was seems much better, the
> > interrupt controller should be using the iommu_dma_prepare_msi() path
> > to obtain an appropriately translated MSI address for the aperture.
> 
> The difference between ARM and RISC-V is that on RISC-V each CPU has an
> IMSIC and the device will target any one of them, depending on its current
> affinity (i.e. the MSI target changes with irq-set-affinity). ARM has a
> single doorbell address which has a single IOVA->PA mapping created for
> it that never changes. The ITS manages everything, including affinity
> changes. Even when I get an IR irqdomain posted that implements
> irq-set-affinity to help further isolate devices on the host, we'll still
> want get_resv to pre-create these direct mappings since we can't
> create/alloc them at irq-set-affinity time which runs in atomic context.

You'd have to use the iommu_dma_prepare_msi() path to pre-create all
the IMSIC mappings when the IRQ is first attached.

The reserved regions were supposed to come from FW. The API path to
connect the irq driver to the iommu is through
iommu_dma_prepare_msi().

If you mix them up like this then your VFIO is broken.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
