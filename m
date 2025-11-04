Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762CDCCFA04
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 19:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yDTKW+Q8C4Fm2Uc9FtoJP1JaSj9PdjJw7VS2ea5HUJU=; b=4DnnEL2CUuItEv
	G9WrtzKimSkH1LbMTK+obMdWVfbpsqCK1CtIXYb07jqTp8PKJYm3XfrDh9rXZWh2AIhUyjxQCj+xB
	ekWZU5JyZklVH/UxIhdx/kRRw3fByhv3jNPf6zzYlzE6T/bdKfrr9e3ZlanWtuS8nZk45QuMwSqJS
	T4uBz1yPairv47/e2BA3MwURcuZBCvDFsmELDZXXqhWVnJnimYo8mqpoRD0fkkURS/KPLaRtTGEJz
	WXeAhVnO1fPpm4oHdn8miLUOOxjdIsF56fkvMwtmNA4S3aLpBuGeAWBb9OEPgYgG2nLhWjz37z8sS
	Zyr/WSlml41P/KeVj9tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGMH8-0000000CS3c-4ASz;
	Tue, 04 Nov 2025 19:01:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGMH7-0000000CS2g-0arf
	for linux-riscv@bombadil.infradead.org;
	Tue, 04 Nov 2025 19:01:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=kXqswN7hPvva7PQ1a9IqhdwTclZAlneKzYGlqm+YL3c=; b=a9NKE/EAfc1yOpN/81Znyh98f5
	OJccZUrsbUNay7HSZQ2z5JYD7KpBgNPhnEXOYCr7uA5a2d9RoqNdvQy5USj9g8/8l2rjagUqtZM2k
	1bEOttZvLHGuR8XdStUz6IAk/pO2gU4424a1cU6u7xRxIc9dCc+KREH1Z7cfgiGgQmB7RiRsaeJLw
	J+xqv4KO5MytV1EtG3JKw+KIig+M81JwwNtTHy8EilFU2209LAzHHmwolmmw2EzKRvgq5TRCP+814
	qe+nkNyYSwFKUgzor8vPz4uXUk3n0dYgPfMEXjZEejL6yKlCk4kYJfEpxUBWXz7dgSNbQ3Vp1uJ7+
	V5akjVjw==;
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLPM-00000000gOm-2D5p
	for linux-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 18:05:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/u06k6I4L7Gv6SiSTNSv8wvXlGEI1p4ZOml8WXAdq1NLYMM+OysjvZht29kfXnLxzBvoE8KB/V0OAWTGABeYmD6JCQEEgt5mKK3PE2bcVaV+zKTI1Xlu0VYyoj6HhqxD+yqPAkYNfLSgMw46g2ZdPZoM2dDYA+1IwXqBDc/54BheNaE9FUZWwcS40uv0DhMHOsfsEt3y0wGIyCaaNjcRBmRZRDEbuFFwtPvA24J7XClM6oKVlFsXmKy6+4A2fdLJFqVyisnQPe9fOVxCJb97iDjugCzvzwuU2JGhxbjvgrRcC5CnEzXxpZ8sLrFnKQ3DMBBJ4IkD99z6vb8I3BoMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXqswN7hPvva7PQ1a9IqhdwTclZAlneKzYGlqm+YL3c=;
 b=NvUZ675gZpa6ihHS6442Mjw/gbZKhtD/QUmUhxr+1YnS2TCbhUZfK6TnGvNkQ6wugqqbwJmfYgqcI6mbIjbHd7uKUjvy2RNQWkbhCg/q79BHX1/BNwR2oH6VpxTbmHwOBFIa89tK1AMfkPtuO1PGd1pTJ78NF5+hb/ZbktcwScMrQsqpsUEa4sEIuEk3yX+YPY2668kN8hvaUowON+VqX35dQS52kOt1WoZ4oSc7LjvIV2cXSPk8w5NSxBz1VktKZuK8/3/W8WyyJl/rdRPS+2Co1RpCIVj33JgfWPt0Q0bXhwun5wT0dE+1Up8e4dQO8s4VGwKhYmQog1dA0QG11g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXqswN7hPvva7PQ1a9IqhdwTclZAlneKzYGlqm+YL3c=;
 b=QYIYAblRn4PB7uwVWnA5epeNBCbcjQC0ML06fnkUNG86CuSpcL+EjGRI02vTf4fMW6ygSjQ5A1z70IYDexWGD9m59tIjvOPz5AAedsLdly3UHv4C6yNrQW/1d0IbT7wxmFPWjkiZ9iuYpSbfu844j3JJjhLrRGWjbncZLWh+WkhGnlhnjU0TISkqr4JFrJUFlhRS3GJQg+5jZvrg/fFFrfLVEkMwSUZzn3cXMQ7LRIcOCa3la2qZxXwCHGaKdNF9d8EU3p67ig+qx73bpGWaFHxi7frpu/nps0LfVTxx3F2KyrG1AhcCvBqgdN4I+rFtsyZNezTx9isVEBT2muVMbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by MW6PR12MB7071.namprd12.prod.outlook.com (2603:10b6:303:238::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Tue, 4 Nov
 2025 19:00:47 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 19:00:47 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Will Deacon <will@kernel.org>
Cc: lihangjing@bytedance.com,
	Xu Lu <luxu.kernel@bytedance.com>,
	patches@lists.linux.dev,
	xieyongji@bytedance.com
Subject: [PATCH 0/5] Convert riscv to use the generic iommu page table
Date: Tue,  4 Nov 2025 15:00:39 -0400
Message-ID: <0-v1-d3317b0ee398+50-iommu_pt_riscv_jgg@nvidia.com>
X-ClientProxiedBy: BLAPR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:208:335::16) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|MW6PR12MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb15095-58d9-4783-3e97-08de1bd4762b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+KccLInYmYVoJnehkbOjaShH3nBe2RNuhGMwAPcTHWycjJloWArm19c06Xot?=
 =?us-ascii?Q?Kg+Igrvn2O/lUy5KTDE9NkrD0R/7u1M4nYvprW3ncAEfKhb82D8tZOk4Yygv?=
 =?us-ascii?Q?8PLjBxfAHJ0jzZM1xt9gDSH4CSPxg8S2CKB+3hUBLTJYsGG+bQPI+LNIJa6H?=
 =?us-ascii?Q?TKw2eyKdrLlLXgfoSfpST11Wjkbo4vJauZXjbH7Ia4VFaHjw0s8RQUJdrUx8?=
 =?us-ascii?Q?/JwT4h5L/ZZ1/dK0hlTliZuHDgRg+UdSopsMlQWzvoxPnHU43byNmBzZs5c+?=
 =?us-ascii?Q?9otuc9M+zSudLLAWwoYBhOBNH++QJBwlyc929g0E9g0PtcD8p60pQNzckGXD?=
 =?us-ascii?Q?+B1fkXBJf0DXusDwCiyS2tEpTlNp06l8HinZ2goniI04dxFrlostgvezdGow?=
 =?us-ascii?Q?is+s4QqE8QVUTTCD7Z+Uj6bdS2Plqhahvt7rVSskYYUNcoVEu7SQxK3nsiP1?=
 =?us-ascii?Q?QKcFpavCanaAjUNp+ILEnonqn/Qm0OTS4uqwMCf2HKs9kImEC43wtxWL/8wc?=
 =?us-ascii?Q?9yeJ/BaYI5ogMzRKGLMB3XNjyLg/A0LwEHiA6KFAX65lCR5GdRMB9ENnIZLD?=
 =?us-ascii?Q?o7Q9q95z+O6lVDUHK4Oc3VOOmdXmOhC3PrP985rCwJjd4H2+jEMaZ8iIsW/L?=
 =?us-ascii?Q?9krGZhXTXDWNLpJyMDftgXhrcmQob8K0Ze7u7JwD7cq/R4nLLTLeO4Qb9taV?=
 =?us-ascii?Q?pWlfjL6Yd5Dy0S1CfTEysXLvnTOgRa6wA2OlsTIEfw9OYyBwnpNpO0pnodQc?=
 =?us-ascii?Q?A5OBSmS2F98t6ZBZwmeKec41xIfEae4DPaLJLbyhHTsvt8TVCPgPps1+uLjd?=
 =?us-ascii?Q?BfnwN7wEZZLLyLf/pSDl7BXaZsMGqNpFsyoehYSbUX5nQy88G+y7zRWbPq/m?=
 =?us-ascii?Q?8lCADGUstrKoEF7Bs8GnpZlRraxtGoSFtTsZwRKle5thZLsNLlPNiRoq3gj8?=
 =?us-ascii?Q?KTAqC624KJmaXFInzF0fIXWagkXCnoub5Kr6XSVhaqsd9l0JkJYERIDsD8zU?=
 =?us-ascii?Q?/q1eMPM25nZumO7IbmdF7NL7A190FjJXkuf3LW1RcgYzuBTTPc5pdXaIzQ9E?=
 =?us-ascii?Q?Blrjwl0j+tQ+4FwIGC6TmX2sft3f98Hr3lifNXxSMJaykDzpqNWQ9mBvFu6p?=
 =?us-ascii?Q?Jg5DPyo2mGRZWVvlTLK3r2hPYSI2U4E8vxg7DL7bkL2i26s3tLj8i+rnyCiA?=
 =?us-ascii?Q?vTgt2RD9vwEoZnVvxUpbBb8BS5AifGYcu2qInGPSyOz7ttlXsW+4BjNZdgV+?=
 =?us-ascii?Q?l53CPuVR1TCAEQc4FsGFF/GO6ZIDu1WzFDM9BHs/LQVc/TPsgpeTxFc8a0nS?=
 =?us-ascii?Q?ExpipCOuW3fnDtn4WmmPmqJ9Fll/E+c7I9hPh7LpqpWntnUx1zbhfzaOcipe?=
 =?us-ascii?Q?O+8PoygffqTzMWOO5SrXKL6dQSEJdSCpYkGRgHdK+/X9m2KRYUEFJlI6GREX?=
 =?us-ascii?Q?scJTRU47P9KwnyaynF4/UPB9x6y+3TmIPfnGbJFF/FK0nWDakzFhYnGtgY8v?=
 =?us-ascii?Q?MbRNHv+HvfE4ZtdURb4+iJpsmWDVgTUsuBLb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3613.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4I9srdpJ0rheLXTk3IT250UPe7TUfA70AcbsvJDOanw4eVZWSUpTIdzXO4BL?=
 =?us-ascii?Q?vHDXYeMtGlgFRmcINS3rPfVxciSNNvyjR8vCl4jSjs6jelPmmQJWaExzeyyZ?=
 =?us-ascii?Q?MbqR31r86t5esLnGlDSP4/tOyMh63M4bVv23RYGi+bwzTU/Uds/WHbMp0r7J?=
 =?us-ascii?Q?oSaoeSmsPWemeg2bMc6ScUhAUR+CutSTfclw/FqLuasrPfao2V1NBTFOiLwR?=
 =?us-ascii?Q?n4x2TzzkS7e+RbzjpzgJJR50G+EDztAm6EUNlJUJNlAWJPnY8rfOqBJZo+pQ?=
 =?us-ascii?Q?aCMFJqBdBJeFhriYepqrikMT1sl4hIHjz/yNMJcA2UlNLIsf8rNJqRV6paTB?=
 =?us-ascii?Q?vUNpQke6AwwlXoLsOSbo5DAWiOC6kYEL5hxdhY1TMuEnfKDLrmgfMUVhR3zR?=
 =?us-ascii?Q?tcxW5OnnnMIIWAtIvNSzG5/HJXCLFrilzVsT35rsvjMtNLVWdfAHbNK21FpI?=
 =?us-ascii?Q?R4xgc3P3PGtnf+f3xtN4FqY6EHspLaKJzw9RjT9vMaYXG+dvj75ADwYw54PJ?=
 =?us-ascii?Q?u9hOOtiowW0TMvpEnl283iDPlPXLB1QlfMdOnhFfTebYAeltyVG1Rv3FvOai?=
 =?us-ascii?Q?bGlWybWm3/SAJA9VT1oNoUFkLoCv4i+TlYBjKlHxtdcG5ZnwxQjKZG9nnKkW?=
 =?us-ascii?Q?m3q8QtZE3YGTyxcV1suJ229rTDIHFb47Fv1N1CnFZAevxvoh2X2wnRoHvstt?=
 =?us-ascii?Q?oR8oQFKVSCsEvTXV0Zt8fY1NczDcKKDu0Zy9x2DFX8TxS6JOZ0oRnIsvSPdH?=
 =?us-ascii?Q?znQL8tuqlKtczNgNGTEi59HhMhgA+z2gfI17JkbZT6q1EZZgKeotRnSt8Eau?=
 =?us-ascii?Q?XaSNA40lW1YV6mfFeMoYrRPixkJQ9F56DG3IYX7zoD2Aeyk2DHPi6vR2esVc?=
 =?us-ascii?Q?gcxCZv5e2/pBkVgHIs2THJ2L2uc7fdXQqwNATg2zJEKNr+C4eMEBavasQT8H?=
 =?us-ascii?Q?zyGyET/y4w92POkCvUYM9Pa5TMuHcnWZVEnlfPA2SycofvyyKOhukboeMLD+?=
 =?us-ascii?Q?n3AMxBFn5fukpGKTsrv2V18zNBFzODTGRLN2MfT6yOGd0D9GMQjCrYWWQYCf?=
 =?us-ascii?Q?/LJ2Ef0ChPM0QBXBkIzB9mzi14H7mufSVsF9fF+myLcC4ejNKzWoZRlV/G/8?=
 =?us-ascii?Q?m8cTuC10LapIo+GPNW9FAjJE93zbTNAWQ0vXrTJE4wa1nuyKsUmPTX+XwB6h?=
 =?us-ascii?Q?hgyl04PVLxsKePtLqCtYHFowsSr9FWd1iAd9ZAhYr8pRC0u06f6hLpQfARW1?=
 =?us-ascii?Q?utV6nSPQyfpd3BXFKf1X6RXyurzggOR3yMoL3/UmD0VzltkAcVnhHePek5oK?=
 =?us-ascii?Q?S7m1S/D1k1vAiRtrGuVX1l4Pu7AuN+C9yD9IbOPTOdq4fof3PEJ4Ccg7AUTE?=
 =?us-ascii?Q?oCeD6FkZOdZfZRGbvyVaUQUB+uZOk8A1YZi6d3sfY2VBINgZzV+aZTZDmxFX?=
 =?us-ascii?Q?vD1QztJhFBWyHtVxbzPjGdfcLMlnmXxZsa8N5qURJGYb3COFtdA1xtyf+dxN?=
 =?us-ascii?Q?V6Tbole4QsKBSDOT3uzswIREbIcT0n7+vzmqc8yX7F488tmesaqzu2DxCC9T?=
 =?us-ascii?Q?RhfHuJhdMkdzMR5L1lk=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb15095-58d9-4783-3e97-08de1bd4762b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 19:00:46.3572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lmrsIvyeWRsi2rys52uCQmBD4ZNxjG38GvpSzbrzJ8tCRhaQ48pQH1WtbvA/e5zV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_180528_640533_54F535E5 
X-CRM114-Status: GOOD (  13.71  )
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

[ It looks like the precursor series will be merged, along with VTD. If
someone from riscv can test and review this it can likely go this cycle
too. I couldn't even slightly test it. ]

This is a fairly straightforward conversion of the RISC-V iommu driver to
use the generic iommu page table code.

It brings support for SVNAPOT which is a 64K contiguous page. Otherwise
it should not change the behavior.

The series disables SADE as the dirty tracking support is not implemented
in the driver and should be done somewhat differently. The generic code
gets further along though this does not include the format implementation
of read and clear dirty.

The format implementation should be able to support the 32 bit option, but
this does not enable the iommu implementation as there seems to be no user
today.

It looks like RISCV could support the DYNAMIC_TOP option. It would require
some additional work on the core side to interact safely with SIGN_EXTEND.

This is on github: https://github.com/jgunthorpe/linux/commits/iommu_pt_riscv

Jason Gunthorpe (5):
  iommupt: Add the RISC-V page table format
  iommu/riscv: Disable SADE
  iommu/riscv: Use the generic iommu page table
  iommu/riscv: Enable SVNAPOT support for contiguous ptes
  iommu/riscv: Allow RISC_VIOMMU to COMPILE_TEST

 drivers/iommu/generic_pt/.kunitconfig        |   1 +
 drivers/iommu/generic_pt/Kconfig             |  11 +
 drivers/iommu/generic_pt/fmt/Makefile        |   2 +
 drivers/iommu/generic_pt/fmt/defs_riscv.h    |  29 ++
 drivers/iommu/generic_pt/fmt/iommu_riscv64.c |  11 +
 drivers/iommu/generic_pt/fmt/riscv.h         | 313 +++++++++++++++++++
 drivers/iommu/riscv/Kconfig                  |   8 +-
 drivers/iommu/riscv/iommu-bits.h             |   4 +-
 drivers/iommu/riscv/iommu.c                  | 302 +++---------------
 include/linux/generic_pt/common.h            |  15 +
 include/linux/generic_pt/iommu.h             |  11 +
 11 files changed, 446 insertions(+), 261 deletions(-)
 create mode 100644 drivers/iommu/generic_pt/fmt/defs_riscv.h
 create mode 100644 drivers/iommu/generic_pt/fmt/iommu_riscv64.c
 create mode 100644 drivers/iommu/generic_pt/fmt/riscv.h


base-commit: 8c955dfc1d4934202c404591e6f7d1b45fd83d96
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
