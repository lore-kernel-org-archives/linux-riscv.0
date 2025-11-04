Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D97DCCF9E3
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 19:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jP+RmbXCxN+hADeE464dnXqpvnBuX+6qszl6Brjth/c=; b=fqBQziyd+be0nN
	yBWbHRw9bRkSCsx1bGIk9Pf21FSP2TNApaWybm26pqFZ2Rb2z2wlQ7UhkmgC70Z+b48QjQMN4BUub
	uWGzco3orKzrCH8zPStL5h6gCVtBbsdZWVL0MmD7fU773vv6QzhgdxAVjapx3hKAz8G505r34hOC1
	2r+1nHLCMWWyj94FfCQyjMPicp/h6g/45g7BneTd6Hqz0Fp4CShlILhwB3YkS1T8+42xhgb/CC40J
	hY4jQNGww0pGz7fIu2JD16MwzEyiORAW103UyVvTICmAEJdRrn6z8bNP6y5+V5PRa4T14jXBFOqNr
	NAfFv+2c4l8Y+qdSkYxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGMHA-0000000CS4t-2XZZ;
	Tue, 04 Nov 2025 19:01:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGMH9-0000000CS3Y-1drg
	for linux-riscv@bombadil.infradead.org;
	Tue, 04 Nov 2025 19:01:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TbuaTkV6fGzsyCu0VssFd3iB+xPzFeN7pE8YGL65phc=; b=DyrRwoN6fQ88t12inLwGpcPqQJ
	ey06kg4Gffd8oFhsmohsUdDIYXeiZMbbn6QLs8dmsmREMz4I5mcibBPpMmR4eHYZ0MPocLNH7Q9Ai
	/0RRN/tdxXIShMkeiapblJgW+G0gdWCH75JigUFUvaTF4LFPcZf51+kLFeXciddZYXB0WbyNGamHD
	nzQuFquK7autxlcH+mrW2yDLO5jXnkqmm9l6YHrZ48VC8LD5F6jdIHKCj287H8QBZx1FNvU3inSLh
	5jI5gWNBIA15VC4+2d9PUY3SH4Fl7soLoPEfokPsCnEhG2eSzLJL/hma2D6s7DR6Wd0kSArIW0muI
	6tpLl7NA==;
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLPP-00000000gOm-07V0
	for linux-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 18:05:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=giTpZEh+wfjuqibzgbPW5clumft2jHtvbr0rNGM5IJmeKDGQ/matCsQdMRjBn7ebp7q2JuTAfryIQxhsGh+yViB8XhLWBJKGQiq9XwHHeK8Xla6aJhQA1tU2zqasOSmc6qtci7wJLiDdDpMIr2fDk/qJ9VGceAfbeQrViWgDerUKmY5Q3WPH5CXNIbODW/mW6IH8+wNzLWUcFxryofWJcDi49eZJ3eDGmE4T/1T2xKQ0Vi3qQka8QzitDjJuUXwAE1R7aeJscWnn7NBTY4n6Gk0Jtp70IDmzbOn4XbSLRqgqclxd9QzW/amIqeqHHlZWAi+0MqceNea74mgU7dcjZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbuaTkV6fGzsyCu0VssFd3iB+xPzFeN7pE8YGL65phc=;
 b=gCh6DfogV59Cj5b8cfV30u2tcxmGAn4C0HGYZiIH4gx1Lu7LlMpD8MgDqtx5NNC1OiNhG0AYCZsHwwOa0LwJCZJfcz/Sbn4bUKRzAnB1VRKDjJOCY3gRdj/4n9abXHcyTtrdayv92MNbUjg3z4+NSChHAUUVUBn1G7oSfJ7nGaGmyr7f02cbHvUpV6RSYUoYzCiEs1gn8L6S4ARtsmlUq0nb5IYNVd2AI30AsMd/7xUJs7uy1g5aRGhDXU6GkHgfDrdWFBy/mIrq2GyMNSBiHuFHhpwl/+RO+1HebyZHBmcRSj+/cjF5HpTJ6W66R/fSeT0CjIv1mo3OslhIoP4scw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbuaTkV6fGzsyCu0VssFd3iB+xPzFeN7pE8YGL65phc=;
 b=sYYmPc3+HiaEDWagX4vxWXiVw3HYifgKBL7z8pxzcb9i+yYxgNQqekfP7ohlLMgfXXXhJEM+iCojr6wGCIjHClIQOfmfyBY8r9O0TqwvIvOH8C1Bfc4o4Y7RwxW/FWdwHWGpDBrYUdO7wiwBfNKB3yIhPwHR2qi9uWGFBHT3ju8RcvN/ZitGK0I985ZkUbxrV8tm8g4izNhgQlQF6CP9lYvj2YMHxhb7wPQWBO+fCBGE6xQynA+5bd71nSyao7IdGUbvt8liym7rhRZCatRJWQ8aI6XZE5QKqNbBcKRqM9SHR+rlPXdJiy6IrVTxz/tiQCYxcIAi9kFpZ03E5QU7xA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by MW6PR12MB7071.namprd12.prod.outlook.com (2603:10b6:303:238::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Tue, 4 Nov
 2025 19:00:48 +0000
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
Subject: [PATCH 4/5] iommu/riscv: Enable SVNAPOT support for contiguous ptes
Date: Tue,  4 Nov 2025 15:00:43 -0400
Message-ID: <4-v1-d3317b0ee398+50-iommu_pt_riscv_jgg@nvidia.com>
In-Reply-To: <0-v1-d3317b0ee398+50-iommu_pt_riscv_jgg@nvidia.com>
References: 
X-ClientProxiedBy: BN9PR03CA0324.namprd03.prod.outlook.com
 (2603:10b6:408:112::29) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|MW6PR12MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d0d9ce5-16dd-40aa-dd66-08de1bd4762f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mH4sU1dToeA3lQhXlI6u1Th2DcTZXI00W1CqOvBnf0z95URkDMN9GUZSIErQ?=
 =?us-ascii?Q?G4MHVnyEqnyqoqX2e/0BK+HpVZYNAhqiva3Isx0DGVrDPdy6e/X3y3HUbS4G?=
 =?us-ascii?Q?obDNxhDH+zbwi8vcG/Zno6cVRRgGE5MEKbFzrcpACNXQtPHF54Q2auE8npsQ?=
 =?us-ascii?Q?+P9r+DF6kj2vuDbCBKYZ5/aDna/3ex3jDuXNo55QcXeE8yJrgHHJHS4jXgrZ?=
 =?us-ascii?Q?nGmIbya5+zAY1NrdQIhyk7Y9p4X4hIfb0NvMQz4Ij3jJmLTfUzDKGSn7XYcv?=
 =?us-ascii?Q?VCpBUzUm9Aqlx+z7x28yhblnVCQ6M1/cX1dwlUP1FxKQjBi3KyJNt8v51eRu?=
 =?us-ascii?Q?6/cX8OQ1t+/bw8Xx8ufd53JP2u0ROo23m+SdUdZp8Oqty+pJqCP3iPYtoRAU?=
 =?us-ascii?Q?3s4UiEn8KUNqaPp+ak7cf5kA2zaRhHhgdimxn9E6fdljOjsGoasSrH19XztF?=
 =?us-ascii?Q?yaWlEgWPTNk7rbFEe6rcy3eGRa+sUXA7gFowiK7uHEGHLFWeemT25lI7d6uI?=
 =?us-ascii?Q?pWet/b00ew5ekyouSBx9uskhvzVPPbXAirWCHtncpKnnl1T7EawnTAcNGe3c?=
 =?us-ascii?Q?auQWJ2I/NzisY92GmNL3N56bjuJghv4t3MQS3ndyAULe199q5itmg/TZhUd4?=
 =?us-ascii?Q?b1jc3/84dFh+F/piIgiNYXHkI9nYpiLj3UKOUr9+LBsYRRbu557jdRfRx9xa?=
 =?us-ascii?Q?HcnW8yIs6XmQwuVRuGXN53RaWrHp0GCDS8v+cZofhYyOOFaI9GGGXb+Goivi?=
 =?us-ascii?Q?2VyzlCRWCyQQ4SGCmL8A266cmGXpCu6UnkX+IwRbmeGwtJBxSB/C4mwQGgbR?=
 =?us-ascii?Q?VD2NOgyFfbWDeimxCHzyGyH6iJlYGphxEeZTHEGB4jPxaIQNOSOa7L/ax0om?=
 =?us-ascii?Q?Qcv5gQ3VOftIVI/nXfdujIBvIkOxxCXA5NfblrNGA23JGLHU9wB/nZHA7syl?=
 =?us-ascii?Q?aM2gJIoPqzJie+VHWKw0s0oouTwHdL8JutSg7nQbGotD8yEacEswCYsj5gvd?=
 =?us-ascii?Q?1kz/3v7BzvbyoPMzrdcpx9MP1xlFvoJUyokmOLcHe/D3cpozCCL25x48uXcJ?=
 =?us-ascii?Q?ppk1Di8/UqST2LFa/jDX5To+6dB90cqA9uXI0vsmS4XRyHreQuO8YBDr5RCL?=
 =?us-ascii?Q?GQeB+mHGAyr19J2dfr92/UcQkWmrB7kuheNJ2hV2N6i/8TYhe4pqK7RzH9VK?=
 =?us-ascii?Q?OI6cKGD4RcNSfUxPCtk8fmOOU9khRh302mKz3SkjsSmBAXUKYAZtjsCbqmm6?=
 =?us-ascii?Q?gkpX6ZG1noGi8nffIcRO0s5oRs50ry+w11diccpM9CwBgtA19IVIt8P+noAR?=
 =?us-ascii?Q?+zMbenfDWq6OVmHmISywx/RG8uCRGQDC6TjCMYTMGXUj9PKCI4m2r852oadd?=
 =?us-ascii?Q?vT+gW4g/eLU+zKaiIk9k+48lDKIRs5T5CYZJpQJ9qE003fLk0koXMxyqdOij?=
 =?us-ascii?Q?cNmAi31a90fHa0Tz7eLbjLt+Yk49W/g98Kgyu7AxB9hN4dvankbCDVoNPLI7?=
 =?us-ascii?Q?KVPCpH+Mxnhc4HY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3613.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UOvPRNM6iDh/TCq/YgPHgYqthQNnyt6Tdi0yiseF3wLRNGSDfpoDg2qOVX4V?=
 =?us-ascii?Q?p8g0yfga64wWPX3gWZPGfGsycFzgJkPeAv6OeP8qOUzCMQ1aiGFcfYiuNWW4?=
 =?us-ascii?Q?somlMFQuWtUgt8MAlnldJsx1u5Zwri5ZW9q7f8uSjmBxc3aqn+pjBN0emuen?=
 =?us-ascii?Q?BU1XfiHu5LN5J0oK8pFsAWr3DTSgu/kdd1qQSUuKgw9xb0clnBehK49IHqC/?=
 =?us-ascii?Q?7IXlJ4w7x9RSAZ33dcbVWG8PDBTI1T2lQBN18NYItWJb9X/tjnnXxapc5cxC?=
 =?us-ascii?Q?evFxt/5jk9pmDn5ms8r3kah3L4Sv93Ccp9YH/+vKpJnudPlQd2ASw2KUb5B7?=
 =?us-ascii?Q?nyz9Xgqn/eVtmjd+twpukeNFXi4cZZKnJFv/XxTPUzBUoUP1ZQKWwScvcBTW?=
 =?us-ascii?Q?ZBOq1nA2av/anLiVCAc0ctO5RRDMugGGCVDBOqIRnSiaQfBZW0MT2Dy1Zzr1?=
 =?us-ascii?Q?26ciIbDKkPdCkMN0fUyixyyoDZhXdojXF13yV1Z8lXOy3/RP4GrQRC7fyvnV?=
 =?us-ascii?Q?If6d01Ydh7JOu6MN0XcyMq6mpajzAN05gFZjuaaJpkEXnhR8iGS+GoSGAikO?=
 =?us-ascii?Q?yGGRFnqwBjbbuuT9SbHH7P5d7X1LFW5aZPmyzYB0078Nwms9Vj4fo35Ksaae?=
 =?us-ascii?Q?SZnwqvGtFBKrtWUDfpTYNmVrLXkhpkuh7EftrpdRdl0u6GLa2fDiu0sYSAlG?=
 =?us-ascii?Q?f23DNuU/KIw/LMOhAjrl309SWOOjvPvChLuq5MKrp5ssDGnUICgtom8h0T0L?=
 =?us-ascii?Q?Z6k6s3MWdThlun/KWTDjkhqWd9lhu44mbrg4UluvUo3rb4UILquJWoKSCkg6?=
 =?us-ascii?Q?6aR8EQzXyl3rBTDLW2+iKA4oqwxZ3Ox94vTQUyw66dsL+nx43ThF/5xWuc/E?=
 =?us-ascii?Q?THhoT9uM6fC/too4M5/I1xv04rVqu9M1OeCpe7nawDgw8YFHEUN9dHhpQzDu?=
 =?us-ascii?Q?VURDjqqE0BHNFhpBpwAs2gczMzfX0NvkZqB3ph6bYwd6kkOorxnHPgZDxYT7?=
 =?us-ascii?Q?Bhfu0llVnVH23CvVFxBbq87dGnUm3i21PlORfEQKaSJljEcW5Etcx36UZe4z?=
 =?us-ascii?Q?cPmpcYdt88aV/GhckzTdIJVaH6vsgTXkkao9WNXLV1u3JXCr4qX4D64vgLEl?=
 =?us-ascii?Q?jGc20qrXGvpS7Y51gJPlR4ipYTBIaUldMteJV6ZwezmTrM3SCm+GyrZMIlKK?=
 =?us-ascii?Q?Z/hIn96XrCpILQzhOoX4r6xNP/Zd8JkpVCt4RcKsFpzdBqizzLO2PShRLUg/?=
 =?us-ascii?Q?yBzNl8tAztP45N5MjdnQ8ACeQESMdonBCfgpfwwH1gT20S1JdboDsW+5GtML?=
 =?us-ascii?Q?y8Q8wi5tLT5F3IKMLEd0egpYIIS4hAxjKb4E6XAaDkDvNTjvXiGq7tLFoQ+0?=
 =?us-ascii?Q?JC3yA1qZCTnQSjkdnS3syGjRHYqxu1VxibOPDRmb8EFuqNAM3n5c4cfhBFv6?=
 =?us-ascii?Q?U4envhjwAeHAuL6xDZPz/Yg4gSkQaMxHQNhyx4FqIS37XVCp7QCU8ox6Xhlc?=
 =?us-ascii?Q?YMV40vHdZQyS85HY4+crTIwoSni6TaT3+bO4f6HtJrbWHs3GEhI9weOgN79e?=
 =?us-ascii?Q?iyC/CeQwoRxSZ0JKpHY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0d9ce5-16dd-40aa-dd66-08de1bd4762f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 19:00:46.4148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +0RBS0n0fXZnW0SzOss6DLFxo5nAGlOpbi37H7lQv0It5+iS5I+ez3pkKXmNLJNO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_180531_167501_AA835BB3 
X-CRM114-Status: UNSURE (   8.52  )
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

This turns on a 64k page size. The "RISC-V IOMMU Architecture
Specification" states:

  6.4 IOMMU capabilities
  [..]
  IOMMU implementations must support the Svnapot standard extension for
  NAPOT Translation Contiguity.

So just switch it on unconditionally.

Cc: Xu Lu <luxu.kernel@bytedance.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/riscv/iommu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 8fe0031f6cb665..014de227e6123f 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1184,8 +1184,13 @@ static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
 
 	INIT_LIST_HEAD_RCU(&domain->bonds);
 	spin_lock_init(&domain->lock);
+	/*
+	 * 6.4 IOMMU capabilities [..] IOMMU implementations must support the
+	 * Svnapot standard extension for NAPOT Translation Contiguity.
+	 */
 	cfg.common.features = BIT(PT_FEAT_SIGN_EXTEND) |
-			      BIT(PT_FEAT_FLUSH_RANGE);
+			      BIT(PT_FEAT_FLUSH_RANGE) |
+			      BIT(PT_FEAT_RSICV_SVNAPOT_64K);
 	domain->riscvpt.iommu.nid = dev_to_node(iommu->dev);
 	domain->domain.ops = &riscv_iommu_paging_domain_ops;
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
