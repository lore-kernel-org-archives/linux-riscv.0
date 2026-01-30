Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F031D49C97
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 23:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uEGAz8P3yflpMxC16dNGRo9ulcVpGhCnPl1cjXDY+Kg=; b=GF/fbc87qgdIAL
	4jmdZCjk9ZIcOLL3cbdW6twFtBxC1i6rRoRKBL7oo7LPWzDH/E0xAtrAe5VpNRv65LER8cEVvLPz6
	PslCco+ngrMDiL2k29sdeBBL+uGfsiXhrpIDG1rVB9Bm9Bvo0LqoNaP+PypADjFFY+N/89rP0B/og
	gQsHY096xzKMnCYlLNDPpWKAWJd1rfBTSXFNqpSkPh4DxqNl1q/zKFK8Y8+muNtZ38fdOy21ChQr4
	rRkrRL/K73ONV9KTEn4us6r04GhwQgQ6ily09W6jLvxJqPDvpbi+jhlTtEtsYfk4iNUyD9JBLpgW5
	//s2SisWRFYXV1xzekvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlyD0-000000027F4-1y99;
	Fri, 30 Jan 2026 23:47:26 +0000
Received: from mail-southcentralusazon11013050.outbound.protection.outlook.com ([40.93.196.50] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlyCy-000000027Ej-0OxB
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jan 2026 23:47:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r60jfiiuVnJX2FPFzSaVGvb1KQkdO5T99hTiQL0FDT/NjPVVSEy9nA3fpaXsbejZOCnYnosFv2a9A97TgjFWLbuTgwu61lvSFNTmANHLYQZo+nV4qcegkPSLA24/3U1Y6PUl58wed3QZoLk3Zh2w44UPoctpVoEORBohb/Vs4VFDmA9wY/SQVkQcnyz2k1jiTGuDO301YQ5suhsHjGzdppL9AtwJn90o70cAWECIlWVvyhobGvP8MdI1atwPST9a43QVdxYwlU/cB8ymZJaAVGjUTt/ZrXJerH7UOuFqDLRr48J0v/vZoicAsR3DvSewIXMtZkuhk+mrxzDR8sWYww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3EY914/cEmmqi95JFrOM88gcmMYtzdkjAwsKabqLi8=;
 b=I2ML072ajhOJpNEkY/Gw77MjIwGdgTZC2RQEKU1+FF5K/lYeepNWrRPkZuSg1n5RVRSEFaFOl4kHdwMQKdkXW/cvZJvd3Hb1c2eBZisqGK9KhyLdYrkz+EK7s++5Xjyd22tnLHDWI7F7qxv/8RHL2MTrgJTcpJvHYihE0rp4LiP2c6SYGiFVQqrT+V4njI/75DYRtnormkKUYaYSbyhIj2GvIz4/kJTfClcg2ogC5Stq2GZUi4PCQqoaxqy0ylf+PgwiIX7oSNjDFFg1C+tKwcHDVJO7zC9vhuBnTFb8tuG2c5v5FVx6AI6hV3BpuijH+sEozF8adAAJ9ir/pVL1Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3EY914/cEmmqi95JFrOM88gcmMYtzdkjAwsKabqLi8=;
 b=cSJP4HjfrO+ulWC+VeghBx+DPv4Ld2ep7VufZLJTM1C8Vjsqa/DEqO8CSMgWvbx56wvmbZMduT9Y8Qxe8bxPLkiTA4a1P4PHoL0h2R8ff8ipuEYDdwpQ07J9BKgxvPVXOP1yU/CqfsJCyjYv7PTbh1yx0dKO49r/o+WB1abD6z4q3iamIzGRivFs+5N7AoPWCyyQAuMOCayW/Id6S0AKQbuLH3G8Itk1Fmz2Q1fciA2FzRGptH0r5Rj/sjJTW5D0bJZlv3Ifp+4VWlgEv97olDQzFN4YmmdNqUIumSEtLFrMjBXkOhTdq/+GQZxaoiIE+mWpG2GugfCsttE6UmrKuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 23:47:19 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 23:47:19 +0000
Date: Fri, 30 Jan 2026 19:47:18 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Will Deacon <will@kernel.org>, lihangjing@bytedance.com,
	Xu Lu <luxu.kernel@bytedance.com>, patches@lists.linux.dev,
	xieyongji@bytedance.com
Subject: Re: [PATCH v2 1/5] iommupt: Add the RISC-V page table format
Message-ID: <20260130234718.GL2223369@nvidia.com>
References: <0-v2-b11ebca8abb6+c096-iommu_pt_riscv_jgg@nvidia.com>
 <1-v2-b11ebca8abb6+c096-iommu_pt_riscv_jgg@nvidia.com>
 <hay56yg2plriyehsvy6zbyaptf6xvnj65zzvurllvpar6gyklr@i4cb6zenwap6>
Content-Disposition: inline
In-Reply-To: <hay56yg2plriyehsvy6zbyaptf6xvnj65zzvurllvpar6gyklr@i4cb6zenwap6>
X-ClientProxiedBy: MN2PR17CA0031.namprd17.prod.outlook.com
 (2603:10b6:208:15e::44) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MN0PR12MB5716:EE_
X-MS-Office365-Filtering-Correlation-Id: 96e14fc0-dabb-4681-cef3-08de6059e7fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Mr1ffQCLpcL0DRBZLlKlZSX8RVkXXZMj5veGF1OAPeIeAKxuJEb+LsKm2eZU?=
 =?us-ascii?Q?19CzKsDNLyZG0EVVMStrPdS+kUNtSlvpNtpSU4unxYvc2z6YzgTEQSQLfKyH?=
 =?us-ascii?Q?iI5n2JDhEpr4Bjf7q/tXjU6ZyKfW17b2HDSDlB1qw7KJdl6dAeLtyKO9Iuai?=
 =?us-ascii?Q?h3Nam4x59w7kSc/7XL3QoucVbAl7ohRqDzqGiCcYk1pipQvcPNBcVY3eV41D?=
 =?us-ascii?Q?cm0RiJgnx9g0ePYwFoiAZPZ6228y4tXxSPRDv1aqJq3c73PDtr/sWU7t2gGu?=
 =?us-ascii?Q?5PT2uw0rgkwf0KT2YV+w3hNI1iAXTc5z8LIzC5tRWN2lnPsDc+Cl+6fXTosD?=
 =?us-ascii?Q?+Omo4dKGuP5FaJ5BCqKaCJHrvdC36bcRabWXtW9zvT5IUdPnyAzftk3DLWSI?=
 =?us-ascii?Q?myAq0Yzp5kQQmAss0qfSYGNrKlVtEMBH7meimajLvqTM5nurZLW+W+6tqAxt?=
 =?us-ascii?Q?Etwqt4JCV0kUiGBs5NLgH9cGfjFZSQ0722yvnUFZnbwSj4brdghrCagC3H/3?=
 =?us-ascii?Q?qgZUtxfjUX4rG8q4O1H3LU0wmLr2NnWjo1p7DxRENlAkWNKbUlq4pJAOh5PD?=
 =?us-ascii?Q?APIC+slkTBiRszCc1AgDwZRadM2SEgoDJpWINWYZ0hE8xFCJJrQYQv6qd/2h?=
 =?us-ascii?Q?dAVR0jbEXtrYI10bFhuw9zVmnrJ82XTBjWcNV6Xd+bXl739x7gMmvZGn75CW?=
 =?us-ascii?Q?wncx3x1fSHfkn9M2vn2ZuQYXaP9uAqCoZjGaR7vxmpexMtqQtiuUicw/Eyz8?=
 =?us-ascii?Q?MQbQuNwOdFyuFojqdBsa88pam+8OkGblKKkWGhDQookAcaGmJkPPP0iG2yov?=
 =?us-ascii?Q?KkaD48SRvswOVOSTb/7wdJzgaWmM1ztyodrOvKadijvx6Ry1ut6iJh+EQ5yl?=
 =?us-ascii?Q?tN3MS41WRZdwS1SdBwSkMDiDBrNNweDNQD3rbReahGh3zDVBILrt1uo9h47a?=
 =?us-ascii?Q?DliIqEGozuFCM+PT7RizYZc77C50BdTgcz4Q5O/fF+mnYrcFI0KPhDgVUrgs?=
 =?us-ascii?Q?G3qOqaJ1iiDy7gdgOoyVAT91eZhjCgEF7vC3jIvRFVymmAONAoYgeo5EI8/E?=
 =?us-ascii?Q?T1YaGVEDRWF5bD0ghnKrbKdW6kWdn0GHW5/8t9pUXb37GBFNfDvl70/WsasA?=
 =?us-ascii?Q?IKgOePE5o1tJaYXrCHZsUxB7Z7blDuWW0stsKnhMRUHoTmHHSX5qwhDCRWDP?=
 =?us-ascii?Q?XwdRKAJfXg7h/X1jMnhmGrKtBkU4Pxpy88J8g7xxpg+8izq7XEd9g9IuzXVO?=
 =?us-ascii?Q?juibYsxXrK0evNZDUhL+Hy1xXDRdaGIf+O7Qzxx0jUj+oB6PYcllUvNO5Zrf?=
 =?us-ascii?Q?Z1SNZ83byctjod/N3pzOAxXvTBLvffFMjf0DtBsC6Epi6NJAYVvqn/fZr4cv?=
 =?us-ascii?Q?7udnhSwJxf62prw4/TSLqJtP94UI7pL1n9D1dLdhKSKsckpZl+vVOe6sWAnd?=
 =?us-ascii?Q?eYuF7k/FuwiEsoSNk2hSbxdvF3+7fWBL2b3FUViARf0fE3Z+kKx6X3ROx9wt?=
 =?us-ascii?Q?YmcVHMqPPgoKzWVYCfG7Pz5zrnUZnHQk7gXm/UIvD7DzHjIglmhPY1ShDe1q?=
 =?us-ascii?Q?Eu11AKaRU/1qAPQvYx0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5+1ESZQAcCq0eUyITfg6PjsyRIdalPQk727aP3PNUWsqWlmlUf28gv64pM3U?=
 =?us-ascii?Q?NoMdz7KUmJ9TELLm+VR9aj66tneMBE5bgc0BlbHpe5TlqCkI1IVBsOaqr16I?=
 =?us-ascii?Q?G/KlPb6fnMhhm6u8xvNfTaMu9mGTaFlBtJGaq/Ld4XO1+xv/546CXvXCMFZS?=
 =?us-ascii?Q?i4Hki/icVimpHXCV4EfhLnbvJngS9lEqsvYhTcH03aVhOlrO9OE5JGSyPYBd?=
 =?us-ascii?Q?rpoD8pKQ2Mdbzk/CGOc4hx7B8Isx4OJOdwySHleKLZHWJO3oJrhL/H1GtkPM?=
 =?us-ascii?Q?TtQjiax/E3diyjukl7jR2i1IGXwXnTxJWz4kiKyohPlTK9xlJ3TFBUVYWtfX?=
 =?us-ascii?Q?QhqBrpV7hNoXv0RHT/zVeHPkW80WGh7usqMCzICKphSVDW6mMF2JxPILspHt?=
 =?us-ascii?Q?ZCr2GpaWkGU25N1WGzb02BmM8nhtX8f0b+3EXDt4IwSYgza7UrymFZWqAZS+?=
 =?us-ascii?Q?7u8ezu+GoDUn+hx1DcsaQQ+VxNN3F/ujMh2deAjNDk1Dl4SjUPeb99LjXboA?=
 =?us-ascii?Q?eEsyIO5DbNMjkxpot3s1leouzZdTXSu6hVdtIvFo96y4+FWIRGxXGycV3pZY?=
 =?us-ascii?Q?qkPjfajSYzHJinysjyUPiJ5ThBWU1VJPAiEraMu8JXBhJi4He/9OFhbx6XwC?=
 =?us-ascii?Q?hwT8BTbWpnMa3OMyTOfVPyakJglBilj2/DsbrSgLVBPDDuhi6j030fHQmW8B?=
 =?us-ascii?Q?djqnPNoxLDWruAUyRWvntlHmwlVfXdusNDPZe9auJiDbkMUiLXltQRWN28Bz?=
 =?us-ascii?Q?NkLtvbhTu5LnHUKs719FgnkgNyX12r1OPb9MDqdWkHwCytCNu1/4QrFyGZxL?=
 =?us-ascii?Q?vR9vUSSecm00ASXzIfpCZROYrO7E/ZGAA702zPTDAsPT+LchfCJlegcSAEA6?=
 =?us-ascii?Q?APj54fc8KdU7AcSFfVmTreobofa++iaknVJ0swlKARcd3BG8fq1nnawdviCa?=
 =?us-ascii?Q?VLlKtDQ17dzn9/MORYRtSHsB7QZxBLnoNeU95kL/a8fkf0Z8AN2nvCwwugmY?=
 =?us-ascii?Q?JPElGQukCRirnRiZ1M0kZTxe74vz8HrUhxZRcNnP5RAxtT/dxK65Kqn1cINy?=
 =?us-ascii?Q?xXPPEFMU2Ltrlkldse8eeAu2j0DMpzSYwOkS59xPuH8qASMQ6xmOIvK9hUWN?=
 =?us-ascii?Q?WgpFqe1GzLNf+JCJfR6IU5JxcuBNrno+4TTSj1MDBLo9Qwn16jBl52QcW+pn?=
 =?us-ascii?Q?nvHqoo7wj4MSXn8YIxVFBa4UXr8iLpD2zqVchqZd1NzsWMAUqmLmZdOAcP2h?=
 =?us-ascii?Q?jcBL74sGrysr79YJBf0583qBbRxEA8+rqtsAS5SU8xHbwmoEBeSMaGg0PVti?=
 =?us-ascii?Q?ckd5rp3w2r+pwZ5JjoU3uyb4gOqujLsB6RvYjNZCGJqV4Ldzz9aHctRyXJL/?=
 =?us-ascii?Q?3mmX+xejd8mDAbLxNQVxmD8mNaYRQXy0hnhiMS/aVO0B+WvIEcGan4v4zsJ0?=
 =?us-ascii?Q?DWb6/8xJHsH0k9Iv6TbQ3EBIK6oeD/81i2vCXNv5TO1rDV0TFqtri7ucMfxe?=
 =?us-ascii?Q?CtLhcSxwfedCTTgpez7nnrvWilv4TX08d+zsORgN+eEAw7qj142nuSYwU96Z?=
 =?us-ascii?Q?dP8nz50bdiHTTn73d7gouEEDh3pJ221S3R/5B8l71z2TlrLjuOtjpiA3n8oW?=
 =?us-ascii?Q?EQiMgwedQhCkbAvo47tTacibgTiEesBm2rRVqI3X8s3yxudUULjnk/+lDNfw?=
 =?us-ascii?Q?f+SERwh5U9qb5eDS62CWxKnD4hsmzaVgCsSfpzHoDoES3LQ9jaWlYhHJxxY4?=
 =?us-ascii?Q?8wZn+pU04g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e14fc0-dabb-4681-cef3-08de6059e7fd
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 23:47:19.5822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYepWnFrs+YM3Uy3lr3BBmbcaGzv6BzPvzbmXqrTraFFQyeIInyQcs2N5YeHpdF1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_154724_139964_A2D8BE6A 
X-CRM114-Status: GOOD (  11.42  )
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

On Fri, Jan 30, 2026 at 01:21:27PM -0600, Andrew Jones wrote:
> > +config IOMMU_PT_RISCV64
> > +       tristate "IOMMU page table for RISC-V 64 bit Sv57/Sv48/Sv39"
> > +	depends on !GENERIC_ATOMIC64 # for cmpxchg64
> > +	help
> > +	  iommu_domain implementation for RISC-V 64 bit 3/4/5 level page table.
> > +	  It supports 4K/2M/1G/512G/256T page sizes and can decode a sign
> > +	  extended portion of the 64 bit IOVA space.
> > +
> >  	  Selected automatically by an IOMMU driver that uses this format.
> 
> I assume we want to keep this 'Selected automatically...' line in the help
> text of IOMMU_PT_VTDSS too, so it should be duplicated here.

Yeah, it is a rebasing error

Thanks,
Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
