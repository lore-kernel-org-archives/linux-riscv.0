Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D89D74EC2
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 13:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H26Y4Mw8wIsJsEg8eCJGHhiipC+bfXSA7yDrQYa2NQA=; b=KbUDF0FLKYoWFE
	r9tLxVaFQl7SvdaAIlF9FZ1MUZqlr3gRthrPuAIRiJDjnsYugQvkNcvHpujRHTuhj4/P60vnQ10j7
	r5teL0tGAMruGxHcgRV8CkQT1CwhF17Y8q+PQCRnw4WZTGb9dwyv59uCI5dLifKB8iCQUSG/bYWnO
	5G0Qn+bw7QQ/ZtS5xK1Afv6qz3pa5cJk+M3BK178L2hzSmGw0j/IR29dFZ7ZErAiEYU0/k4QZdXLL
	YGU37+9LWzlM8DlZMDapXtQyg4uDO6ACt2h+CCkOI70/nCRGhfHvIzbvSO5NbBTu+wY2G503M/a10
	3Mx5ooIA4lxDvvRzdIWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHae-00000008zNK-0EUA;
	Fri, 23 Jan 2026 13:52:45 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHab-00000008zMz-1m1s
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 13:52:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twBmXyY6xX/JIUsc9hHMFAZMvXNMh1j9jeQHieHWR6VRnMUSP/8Q8MTPx+EVsflBr0z4Xuz6Z+qR3+j9KssEA3+tOaRt9pduqFXw1810GZ6V+uxogUNmpo9aqUdQFw07XrVsclb6wdO9yI2OcAT89ZpOBr/Bc7HbxarAljNZm6IonHrWGSn0v1NtpYj+iFVfyyosfnDj05tUgng4eAqVZU2mFaHXECWNjEC2YQ+U6v8aEOE5ULLIMb5WgO4M4XAekPg2t2dO8MwVvqizA/q9JV6oXVML8k8/Wd4802ISBGr3v9sqnmMlcSEjsNtr07hNWfEV6zEYDgwG3tUSQ/tTew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eA/FcInmjUAOsz23obHdffYHN4lxv8ruFlRaePZ0A4o=;
 b=okdOfDkBKQaMo4wLjc+sV5TpB1gSLq7RP1KJtxK9BcOzi6q/5J/Ly/AR0LOWyq7FKoOJGO+amHtiZuHTl16IJddoWbzTZwRlixCvQmWXgCmwVxv3ioZHf7nx0UKC1iQOqM5X9EWm37DlFaon+ZDI8A6XnMp3AMHZSwcWOmpTbVKUW29+M3sksx4tJSVkXieggaG0MNmP0aV3h6XrvJ7P9bP92w59CecVh1E+T6w5dwB029HLD7tMZ2z5E3bzRq3t0dJ+qjAKakBjbTb5Y4mKHlJsUJzgJ3bMOYlxTAzq9Z8h04dlzlZRvm8XxPFjg/ncWVziFZ79gbkdjYqtBQkR1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eA/FcInmjUAOsz23obHdffYHN4lxv8ruFlRaePZ0A4o=;
 b=KcIIl/YGW6kLiBU86bLH8RAASBNRqgKlMACzR9jZxBDKi318RYAmgjqKfpPegjJveODLKyiCDuA4ZC9yYWR3MRZmlZHcpKP4sZgHxbaCaoSkCVManjGFzC5N0UfbqOi1woYhbmE6MXSP4dQio6K9FENDR835+l2Cs0tDz3a6iPR5z2CVf1CBCu4qXgH+1AewD3hC7ZRwiNv6kzjZl/EJBEIob370FKsIh5gc95WY+CuQDO1Rs5uTPdr2H7bLkKXohIqiFILrzrbKxKkvEBIU44SlYk6RFzjngQImIslQbgobFYxYrIqAfawhDPa0NiZ77OqQ7wqhzyygHsjqQ7YOTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA1PR12MB7592.namprd12.prod.outlook.com (2603:10b6:208:428::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 13:52:35 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 13:52:35 +0000
Date: Fri, 23 Jan 2026 09:52:34 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Vincent Chen <vincent.chen@sifive.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Will Deacon <will@kernel.org>, lihangjing@bytedance.com,
	Xu Lu <luxu.kernel@bytedance.com>, patches@lists.linux.dev,
	xieyongji@bytedance.com
Subject: Re: [PATCH v2 0/5] Convert riscv to use the generic iommu page table
Message-ID: <20260123135234.GW1134360@nvidia.com>
References: <0-v2-b11ebca8abb6+c096-iommu_pt_riscv_jgg@nvidia.com>
 <CABvJ_xiUK9BqUJS9-Sk1sS4vhVhyXN8P8NooZ0t_Zp7ycG0bAw@mail.gmail.com>
 <20260122153134.GO1134360@nvidia.com>
 <CABvJ_xgSbK3omxT7XGJ0N7oEva6dQAJwZxRhsBqi44BRNZ3G5Q@mail.gmail.com>
 <CABvJ_xhY_4ADOsVVbjhkBm8U1mKVOSwzKMfBw5mUsJe=kkUiLg@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CABvJ_xhY_4ADOsVVbjhkBm8U1mKVOSwzKMfBw5mUsJe=kkUiLg@mail.gmail.com>
X-ClientProxiedBy: IA1P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:464::15) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA1PR12MB7592:EE_
X-MS-Office365-Filtering-Correlation-Id: 3836d9e2-5d33-4e76-4260-08de5a86a99e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gr/xsQNx3kmy2W4TWkB6nlwmAfCuKobQzA4AT1db3uV/0Et1a2y+NZCMhB0z?=
 =?us-ascii?Q?5Xf20HmUZXJBJEjRuGJZF15XTaGrAVUyiqYrHGpWeLLfceBdut6X9Xox71qi?=
 =?us-ascii?Q?mSlRLjoMELEXKkv+TkIOiwiQ5tujp5K2p1drK7vYQ0b1XG5uCWY0FsezU5OC?=
 =?us-ascii?Q?dg/CBrLH/BWSyMmZBGU5Wvr5Sk7BIz8yQYZV2U3iBPTaZbqYR392LlS7cPOV?=
 =?us-ascii?Q?6xt0cVu2Qlem4sbh7ljDadNvpdXrzf0bXIR4wXZ8rkuQuP1AX2xSzhJVx0i2?=
 =?us-ascii?Q?16XezWsjt8a3YcXq+j9q33cMMA1s2CvfuMV9E2Mbf9vfN5/Ju3QBSiXzF51X?=
 =?us-ascii?Q?E5Fa0jqhd5sHtQVQNhTztKhfllA+56e5IRT8YKc/Sw46hyJzpI5i9mbB+J2x?=
 =?us-ascii?Q?xPyDZG3s9y473tyvjAOGkbcPl+noFOSwY7kFF+exFNrfPDWA9omgiWaa4zDY?=
 =?us-ascii?Q?JgecCg8henwdIcFpmo88/F+SaUVKO+BlvEBZw8Mdqzm2pNIIDzKVmoJjJhUO?=
 =?us-ascii?Q?vRvXPafLGCg3OHgnF6cJSXmyGkCGy9dzF9sp2ytN4e1euQ/soSXMQCmnsLKC?=
 =?us-ascii?Q?AMF38ppmDhQv5o5YrC5V4LS0GyyJUEOTXxesm7yM27nrFrgEmTQYAfH9sQIp?=
 =?us-ascii?Q?BkHUDCBo/xsK61UU/tEexO04QGlGzhOECJUV6M0qlRsMsJ9kvjurXIJY3S1x?=
 =?us-ascii?Q?hz0oShpw+mbZyyK/YP96R+XxUBIzo65cZDEdCU9mO0W8s1P9RP6OIHSAQSpX?=
 =?us-ascii?Q?fKeHGO0yaIRTLUR/w/h1LfO3dNgSApIILWDVebS1W74y/ukA4zDOMwo+PEcr?=
 =?us-ascii?Q?AcUfctbaEjGBqeCCP0oIVFKFkhwNOimcE4LQHGOrfz9E/jEp2wusv2cuZQl0?=
 =?us-ascii?Q?uLAIzi4t45zP/mB++/BCz0+iSjEMmn4bhC7eaS1YN+ktl6WgFekwthtghx0y?=
 =?us-ascii?Q?tSMHwPEnfMp530Xng+qLuWfZgEkDAvx7BinPTKUj/smLPTjBiwyVDYu6GfVH?=
 =?us-ascii?Q?5r0BuDd8AyXALAy065mEpTRU+t4Kdfj17prrbqAIy9sSFVlsDcFkjBn8ms2Z?=
 =?us-ascii?Q?RZcbp1Jt1jm38CxRKBuvyXWtLotdqVtiVWN/HemLD0BmMjZGgYL3TMDxOnuG?=
 =?us-ascii?Q?3ya+m62idD15ageylBVob6Zo79pnOJyRczA3gcXW69jf618HESmMptFj1Xte?=
 =?us-ascii?Q?qF+y4iErRMTq8rIEFsbYRu0bbG0qbg/xwkS2a5agyhuMHKNt3x2kr/aa5F4Y?=
 =?us-ascii?Q?3O79M3UQvplEuYQMimNznBtEJrqoZobfB1vgHRxX/0oK+Rp4UdtzwS8VNVsD?=
 =?us-ascii?Q?n2c78Zw42FsJfREPdKf8arHhUNf4os2uMD1uziR9wRWRDTxR9mEAtu6hRTE2?=
 =?us-ascii?Q?444V61sZXRXq3sbf4BbO9yNusL5fl/AF5dxHRbFpXIeF407RhZD4x7woCeyy?=
 =?us-ascii?Q?2xXRwa5KykZOccdFbe4O/S+Fuhza0UakIKEQZD2IyFApL1M7dgyLS4+NrCQb?=
 =?us-ascii?Q?oGv+VeuJcVOjBt0wsdM4j0LNXIN50XFhMFo36BVlj/6Y+vWsojWkEtwUCfB3?=
 =?us-ascii?Q?r0NOyTBfhSuNkD66Aks=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?phahryECw61g2tUdDWAQCsYl0id9HK1Fm7qsxN4Ou66VXlYkRgxErwNHCpA+?=
 =?us-ascii?Q?oRwhQ7uMBXoz4oPrM3BSdHHD9VyubL3k5uvnCL4AOJ7q/36TGuLkslPpKpHv?=
 =?us-ascii?Q?aVXLMVJzwIBOmXRv9lmuk+grPby2SaWRKKOXD3GEiMXx9Acf0fH1Y9MYVPIA?=
 =?us-ascii?Q?nKS2coVgGnFF/Lf/T5FoHT/q7I3GDbxVz7yLIky1dSE//uwWIHLfpdjVkYI/?=
 =?us-ascii?Q?AhNLJs7LjUETm3SKVVRwcyUp2c3+7HK/p65DsdXNp5HWJg5OwxZ+ReYkoLqs?=
 =?us-ascii?Q?tVwh0ZQhNitjcptBG1ZPRCSeYvQGLJ1g4hmRJOJtSezxHZniCacroOL9b6O8?=
 =?us-ascii?Q?ueaj7fszPy2oPtJPZGLHYsyiuE4jlpyAb+Fsv6RFi1vJKNiX2Gc8nklmzpJc?=
 =?us-ascii?Q?vSSj1/CpY2x1zEfw60wEgD9GJ+3bpqh9Us/pZA+XnW3rEwR9OjvBlJOc47ys?=
 =?us-ascii?Q?DQwgZ/hl7JH6WwLKdTV8trV9orTf509Dt83bmB8ca5SkgjwY4VmPZItBVxBX?=
 =?us-ascii?Q?56NQwsoQZeDrZK5E6aWKihlJDC517FVviHEhl3C9pADUJnkGfyaBEnlaeoeM?=
 =?us-ascii?Q?7naJVi4YIcs5z9c+OK3CIWIYGqUCazn3l1Ru4zkDspkMNhWRaWqNigdDUOWc?=
 =?us-ascii?Q?BFnql+E8kqS/TFSHbOLVCziimXrwbZ2HYgGCVrrDote55ncfAZLkiyh07PSs?=
 =?us-ascii?Q?yZ6c0hAWrJS0ZNjjNT5U94EpdZJjgLIzajybrrMbIZu8uqSJKTFdowhrr1lH?=
 =?us-ascii?Q?AhkIWHg1e8aOtiQbCfxzkK/rtkOVS3QKEjYmkHsbTsEySC1/EVqHDi/P5IVU?=
 =?us-ascii?Q?8N+2UiYQ+aB/zer0JX6X/Qy0LDLtET+Tw5YAYQuUKb6rq0iduV46rbvVIMnf?=
 =?us-ascii?Q?i/HIJN/7q5kqy5A78OmLhLvzN78junnLIJSCGCXfq6gxV1rOQZNzU2pAVr/A?=
 =?us-ascii?Q?OICJABjjfyC/2R+DP5IpDCt4nIjAUf2h/XPy1yBKJ4KF0l23z+2wgVx6Aw9/?=
 =?us-ascii?Q?4oIkIjpNIxHGycLsz+fDRnMBfTmI2TPsHwlwfFG3USgLOhOmh1MRP84NqxkO?=
 =?us-ascii?Q?YEYyBvpaN4PIRbC11Dhv0C+0ptrw9817zeO8XHelPKu4NGSu94jSMkbfRb7q?=
 =?us-ascii?Q?C4EMiruk5w5EySyy+o4a8HefFbKZQFFIy4lIRJMYTfkAcuoyXrBQb/pIP62H?=
 =?us-ascii?Q?Jk73amTDpG6oGzC9kcQDARFDudzaoSLEM5UwIoVEbkRH1/RkhsgrCVaeDcDh?=
 =?us-ascii?Q?+z6SibpFRIa4hOjfu4B6X4ds/nVqi0yc3If1hnq2/ol3P0/8gV+T6PCevQbl?=
 =?us-ascii?Q?FLivE2+RASlUkl5gOa7n2xujZc+/ALVh0UZUXEebz+xJ3rXPw/7DhUVXnOC6?=
 =?us-ascii?Q?il+zWeV4OA2xwJu54d1HCYrsZIQgGqXS4La+8RMepw3+nGTALgpqW2S4+68C?=
 =?us-ascii?Q?DYnClpAXSqhmvE614JYatvej67GYR4HNw7/i/S8uSa8Q89lcKBi3kFYyrhfi?=
 =?us-ascii?Q?wu5kf+dHErjUN6Ks3fodZGZP+42SCaJUm+BiPLe4ny5I0f2D2qcQd/b6oWxp?=
 =?us-ascii?Q?x1SrmtxXA1ZAVsdq5tPrM8X/8bk8gmyAytsVQ7fUmDuCuLQzD9uaiOAqwru5?=
 =?us-ascii?Q?AmgJFH3UazixHS7g+w1QqeHsOg7mwzmbv3iHNcpfswXNkMGy4gNkjEp7bFcW?=
 =?us-ascii?Q?i5Jt3EIv3rHksOcWvDa79Nb6JVjr0EpOecHN7/rSKrvwPz/ANJsSNxC95Gf3?=
 =?us-ascii?Q?AFcG5vAHQg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3836d9e2-5d33-4e76-4260-08de5a86a99e
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 13:52:35.2016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DLv5yO5buKXVUbKkFzxBj0xAHU2G1BFWIjeUAftE5/z3+5idYVGRLUWFU6MT4jIZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7592
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_055241_486353_4C9A3378 
X-CRM114-Status: UNSURE (   7.33  )
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

On Fri, Jan 23, 2026 at 08:29:01PM +0800, Vincent Chen wrote:

> With this codebase, the IOMMU group type is now correctly configured as
> DMA:
> 
>   # cat /sys/kernel/iommu_groups/0/type
>   DMA
>   # cat /sys/kernel/iommu_groups/1/type
>   DMA
> 
> I re-ran the iperf3 test in this environment, and the test passed
> successfully.

OK great thanks alot!

I'm surprised it doesn't say DMA-FQ, someone from RISCV may want to
investigate that, it is probably reducing performance..

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
