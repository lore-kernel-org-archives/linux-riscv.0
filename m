Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561FDD10F58
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 15:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dOEwJ4/uq7NBNtLSBIbl9ai+d2x3WZjo1zqlN/VTWtE=; b=FWQH22nLSegj7Q
	jqCSeOLaAFZ7QwgHJpfOnIJkv48S8CdKcQWNzB471lFWFla4cFGw2qlVpFNRKjfOxuPfFbMszExSH
	SjEf3W1P5Ta2KlEoOilEjcUdCUYPWkcu3WTeaC71eza8lQpPg8Cr5mDQW5J6a/wlvmhFU6fBc5RzD
	4SAl0IvEIYJA0Cr47+BckYFVAA7OkNjVRiAYIFAsiSxvQ3/IC6+SL04KHrRRxNuOHgXiM+lXjwHuv
	hIY78Nvn4qfzuJi+q08ZN9V8k6EmsJknBK97o24oloMWs1HbEPU73FTwPBoe0G85tAlUsSKNoo3+m
	Tettww0rTuAZY/glRUCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOH90-0000000FA2E-2CMq;
	Wed, 26 Nov 2025 15:09:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOH8y-0000000FA1i-2lDW
	for linux-riscv@bombadil.infradead.org;
	Wed, 26 Nov 2025 15:09:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6xf3Tq02HgNdnm3lXy/RDQaSECLaps5t36/8mRvb6Js=; b=PA2mkOS/g8uvyly0bJ0AknXbcU
	V29yDN4ignooAIfa5XZFptKbk8dpPfiKOgiAqKArJsT26G1ZYNK37OVLrMl7hG2Jy61c6XrL+LKNM
	/4jRQEmHq1pc/Tqi/Q24gtKBL6CFkP9QAxk8kTAcH9CP2EmvtLgvU5PKZVJju4hqzgVvj80YVOfFu
	VLyw/Gq1/PGxVIuE0b5swrFPn4Mo6ltXVz0zcSwGpeB3yol/iUq9nswyUXh3D2hoSOg2KJFENomlm
	QgtVfFal5bXRtsdRKbKCl4xW0GZn1XPyip6Y+jPAuni09m5SajqJHSe8EsUPNRt+mWrS6RwOx4QlC
	O37sGabg==;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGHK-00000008Dus-2smB
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 14:13:57 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQEuBx82502058;
	Wed, 26 Nov 2025 15:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=6xf3Tq02HgNdnm3lXy
	/RDQaSECLaps5t36/8mRvb6Js=; b=fo3WIKYLIe6qrzjpnRaww20MHyrIBpDx/r
	PI7d204/sADb28AKue9R0qALA4Kn1IAkbbKVxSweCzirfGrNf5zjV0AcmfASpGKL
	aCU7Jmwi3SduDggwgvF+W8M5td1hPeWDB0Z9kEdI2526tnjDFwpO57At5SonwFUL
	mi9/BfH04/h1jE7rxPf3MBFmwRCv1xN4OsIx/+aalNmc1ne41HKrROxmMYUG38Zc
	8rSBCQdUFibtAhWAUsVZh08D+FuE8Ot4FscUlg9iE9hWxD5Vxqn5aVfPgi7D8UxY
	AFYaL+M8WCtI4rjPGdlyabHvMPuYGXqMSnsm1XSHiHJjxgBXj52g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4ak7yhvdh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Nov 2025 15:08:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AQEhFA6018874;
	Wed, 26 Nov 2025 15:08:49 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011044.outbound.protection.outlook.com [52.101.62.44])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ak3mb3mj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Nov 2025 15:08:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTigQDNCNclYAKHy9M3wnMPyM6QD+0j/jjOKKanHhjFvLfotj2rOAOJkBVcnyRWlCZuBeUfBITr/Lzoq5Msq24149Wy9uOiVqC7BgTq+vDi44uOsfHeCfLH1xsgaqqIOORfsaPy3tq53nYbrqUd8ovYPRWctKS8wb7i3uqOpr0Et3qL+scM0uMyHqWrmpoM65hELlVQsD0mUHY+O8bVwD12uoq8GrPyqvOUlMTM7EWTI14tcL7sc2Vu36hKJ9DzOD2T9OY58VSKTdbJGns6TVK5XZfT8KeB6WoJ0iT0y47hYA+KWpWd3B6Du15f3JICFtjupdIea47yn2R30SkPSXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xf3Tq02HgNdnm3lXy/RDQaSECLaps5t36/8mRvb6Js=;
 b=xwNG9XYYAE80Lx0ogigLSaHklOKk/ndtZH0cfuUq+XZ94nfZXFCQ8B1WqWU8EhzCItxDOwgxtumd9JLiQqiMFINq4VB24H3PGuB0qKqdW1wZtE64VDv2MXb99gdYNfOy23YRTr3dKUR0TDd7pUuPS3o27uyIX7q5H6KvXAWxrAtY8ZBam72jAnHULtJeDbHqBxsBMOkwg61M7ucJcW00xodqUq0TtK3VOJGItcf67MOgh2i6NiZPu4pM7AyOwdOytokdboJfZAtYes6Agpcs+Ui28lkltazTqVvAe9iB1U/iPQHRJXBf6vdeWMK1TgoUfKXSV7WtIr5DsbqfN4IeNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xf3Tq02HgNdnm3lXy/RDQaSECLaps5t36/8mRvb6Js=;
 b=Da5TGbF98dpe64B2ySSQmN4teoTLtGiyTu66Mc0emaHYILOQk7PyVGoC25P9npcJfT6gytekYC2/pNAhfvte0UdCM/b4sDuWkDMJVt+5N3TL8kdzzwXD6CANv+gPN60e1Hcs2n34scLrNKAIDKxfxjnzx4KHtdwTJahHP7+D4bM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ2PR10MB7584.namprd10.prod.outlook.com (2603:10b6:a03:547::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 15:08:45 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 15:08:45 +0000
Date: Wed, 26 Nov 2025 15:08:43 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Wei Yang <richard.weiyang@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        linux-riscv@lists.infradead.org,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        devicetree@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
        linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
        Michal Hocko <mhocko@suse.com>, Conor Dooley <conor@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Rob Herring <robh+dt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 06/22] mm: Always use page table accessor functions
Message-ID: <37973e21-e8f4-4603-b93d-4e0b1b2499fa@lucifer.local>
References: <bc88d132-452a-42a1-9ee5-5407334d8aac@kernel.org>
 <df7d10ba-bb42-4ea1-8c5b-5db88a18eccb@kernel.org>
 <6bdf2b89-7768-4b90-b5e7-ff174196ea7b@lucifer.local>
 <71123d7a-641b-41df-b959-88e6c2a3a441@kernel.org>
 <c0818f5b-b8a1-4730-aa1d-df0f547a3d47@arm.com>
 <20251126134726.yrya5xxayfcde3kl@master>
 <ee5f5da3-8c6b-4381-aee8-b0fab56cbf83@arm.com>
 <6b966403-91e0-4f06-86a9-a4f7780b9557@kernel.org>
 <ab39d448-aa1c-4c93-8e2b-5d97a9c76af5@lucifer.local>
 <1ca9f99f-6266-47ca-8c94-1a9b9aaa717f@kernel.org>
Content-Disposition: inline
In-Reply-To: <1ca9f99f-6266-47ca-8c94-1a9b9aaa717f@kernel.org>
X-ClientProxiedBy: LO4P123CA0453.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::8) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ2PR10MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: fffb9957-9b90-4b11-e744-08de2cfdb1dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p0IlnY7J1zSscZGCF475UD1zkP5B+ADX92ZfVFtH7oKlx/N6b95JwiNAjDPI?=
 =?us-ascii?Q?vE1rFW9cXjruJZEjglB2J1Sm5zLYmke1TY+0PFBrJ1vK337VIBbGeAUzL0bq?=
 =?us-ascii?Q?hqb7TM8s65HAFSmBUGnjY1PGiuR6Ld/5sEDtjDZjqXGtcMNyISLvkl4319g+?=
 =?us-ascii?Q?rmAEG/N05oGaVDjFwHgi5/4n6SAELXjU70sNLQq/4aSuDdZ+U/FmmaO30qwU?=
 =?us-ascii?Q?HbHPy8wVE3wtwZl8F0GEi2N4LGdjh2HwodekucSnRrNyYfo4VKmzlIjuzSeW?=
 =?us-ascii?Q?R8cOJRFUwG9yn0mh0u+RCDxKmUrdjbvgy/NthICbxPWil9XLCiRMnJUtPYqS?=
 =?us-ascii?Q?jajF/Jo7tzVgrX0iJ3ZFVz8hjJSUloRN0BYYXrN7MB6fUi1rO8hBq21qoOJo?=
 =?us-ascii?Q?UWKsWHmFPgGbH9dPrWSXbPR9MkrxxBzxh3Qf8cjE9irzWrGbjazIGxgkxyDw?=
 =?us-ascii?Q?f9AhuVG0hJRXPsxC3BNtfW7mWeZC8uX8KJiq+BCSWf1UM0qJidlhh4cvALb+?=
 =?us-ascii?Q?MLQXRZDSH3n9+VnqIkSryTUVHoV2l7NtNTitjaw/566mndLLKEPw4ainUGQH?=
 =?us-ascii?Q?/O7SQGBv3ZOnEgKZ3lPEw64k8YSUnDh5L70w5o+LEKTNWiaRFxd8xyPMnuNi?=
 =?us-ascii?Q?8lpYBgTC9nLX03EgzNSFFkta1bsf9SFRqPw5AEQRjnOuMCIAKWijdT2Bu/iC?=
 =?us-ascii?Q?wJVvWmtquI1j2M4XT+tq4XTXL9Gun/g837aQ3dAD0ruO7rqGaY5TAraAXod1?=
 =?us-ascii?Q?W8UZDKG7HYbhd5mc4eGJygACEd0pEiPq2nhZZCe5OI+ZeZaFkrlRz+vLNAjK?=
 =?us-ascii?Q?VWSDPXbXVWe/tRnZq6thGfhEc8XFaM1U+doJQMcqcpE+SL0/Oe1jClNFqS8S?=
 =?us-ascii?Q?VlkO1KopPmWwlbkdubcK1/wW5yPmeeEm5VxLidvmD5NcbufR2m44eOmR/zML?=
 =?us-ascii?Q?2LnfswHfYE3vqxM7/yQ9EEi8B3wV02JpI4NbgZ7TJVEEshLVGiof/XubzP+Y?=
 =?us-ascii?Q?rYn89OZvBes8fxBzo1iQ3CuhRwAm3kBgD9ljO+YTMykDZF+IMrFWvAGZps6W?=
 =?us-ascii?Q?JWCBly2Yawdy8Nqr1lr9ELCHOC2WxKV40CuIHcilD/v2co3EeWAPdUssMt8+?=
 =?us-ascii?Q?y/P6EfH46hWMF/eNdDYFoXJpYK7taUXimCfYcY+EvZJMUeKwj6YL3HDWQtM4?=
 =?us-ascii?Q?dwLwKAqmyvq6ny4TlEmI8P3VUvv977K5rkyLwvVwBwSzBih4hqUYJSmsJAH5?=
 =?us-ascii?Q?9R3hh4mJmqA+GzZ5Lvj8RJVF4B/So4bKfjq+nuN9Zwm8XJjdz8N2RRcjp8m3?=
 =?us-ascii?Q?UM5mfnZgEwAn4rOLEvdrdzlCgQ04oC8Gc319D4TEkDW5ruwYoq23lA/VyFWV?=
 =?us-ascii?Q?e8ZXFyWlhkZnl3hdrkqf9Xci4uxkcnCudvk5zgmIyTuMZH+DhMMyN7nb3pVt?=
 =?us-ascii?Q?DYvjllcgX806BnwlGp9cgoYQGXfcWBAdkgZTBcH/ng2K7bnz5dc0nA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KrLEeEVOpw96cZkhLkGhuMy2JsIsG6ye/gAvGzPfChiLy5ea1g9SAoiVYUBi?=
 =?us-ascii?Q?6BiIR47KwLLmOEjEqgCjMxIay4NXu9qZR7TvXm50G1hPUa1VAFFlxlITtEmb?=
 =?us-ascii?Q?q02fcnkye6y+HnPOSd7dn3BbS0iBHQCn55/Nn9Xu22poG+Gzr2gXm/wv2un7?=
 =?us-ascii?Q?0LDYH8woEo3kQRwLU/0Am+vgpyLeocldd6U0PWUg0EV/BSw2C1hoGVJoVNJZ?=
 =?us-ascii?Q?H/Eqqv/svTxQyGVYvCsOcfdZRJixJGzTOO0UP/QPR0sgkNLq7kjy0Yw3UH1n?=
 =?us-ascii?Q?g1p5xY3xxRk2QJNLkziFbvm+y2vyFJe/a8m0GH3llujpe2BZa75GhIw8vuL4?=
 =?us-ascii?Q?hTCy2LuPcj1NOIrX23cQ4Y5TfRvhT8Hq//CfVfcVbiEF4p52HCJN1MluJh9b?=
 =?us-ascii?Q?xZmXL6fqzdT2LJwxowJIg5n6kqOkHbG+tH7d4XflVkt2vB6CwJqXL1L1SS4U?=
 =?us-ascii?Q?xy63yU3tB9lTT4haQxZLk6rNYIX6Q9zaEfL75jN2QkjIb6FtJc6YZoGZt/zd?=
 =?us-ascii?Q?aF/w4+j5y7kOrNyBnIX0yp45k0Ib8fUhgjlZhLSxJt7Tj8OGPia+7BjNanWO?=
 =?us-ascii?Q?/3eCLnz8GIdW+PToRmRGFmkcFVCYAiaJXBWqdqNzwj+2NJJP2bt9xX+6UxYS?=
 =?us-ascii?Q?4ZCbz080bJtTnS603AZAaOyHORnFxA+BvLk+mpTGUPy5k+RZQnxgVI9y4lAQ?=
 =?us-ascii?Q?AN29HqCtEcELQXZjnsSxyEMw+HHSmOURGUGT1+reFM7GpBx/BX82GGUnw/pb?=
 =?us-ascii?Q?6foWWq6bchHX0j6YRTjDB6eGXASEuChcRTkcvoBWF8w2hWV7RDXtPqgCWj8V?=
 =?us-ascii?Q?kuDdkq6hxsia9QhuUIYrZ4zeZHIIGyBeewyliWJhKcsI4RUGN9kJYM+jIITH?=
 =?us-ascii?Q?KS6TOZBSqbagZkUlR8W0xXLZRWcMMAWXPhUXgJQzM+fExv3uWRA9vRp1wYXd?=
 =?us-ascii?Q?3Cd6uFt2XA2bybEU112pRazXb2745a/2lllk2qXahlVzdvuRhX+xdWfBYqLT?=
 =?us-ascii?Q?PD7hK222hSmxKNV87G9eP/ALbGPXs2IiHyVM73jKndozaSL9n8G/2WnX6a92?=
 =?us-ascii?Q?W8rKpt1V1O7lsaolnNfipvJdqCJlTsNHgMW0RCDIWnxj5tCMKW+cXa0v/G/x?=
 =?us-ascii?Q?dm0mEnALTr8jfUug1BgVLZUs8I4Wec/QkeoAwg+t5cVZOB2Vew/pf5D0Zjpc?=
 =?us-ascii?Q?cS0glr973Epa5bM3LpyQ8WJXqIRMgSWYzKEiJaxQeX0pUtD/YdN1bxvLCOqd?=
 =?us-ascii?Q?jldoX1rVLfuNKKs3ApOSIWrHgYltn3DJUFMdeGIrnRi8ZKMuxlWaxVP4Djj7?=
 =?us-ascii?Q?h3QtJybh9Nt+Xtjpj+2bUFUBaXH7ji0xv1Y2kdK4YAfZKLOW+ajY2PoAghzU?=
 =?us-ascii?Q?m/F011GGlFIGTzdRj8AGjStrGUOoQ71JW6tCbmfE9l/RcrtUFc+MRWGSCj40?=
 =?us-ascii?Q?bBaSu40QWGsOr7tTekWREFv6PHJlPztR9ZZv36qcTb6W/pjf8svugNqU+ta7?=
 =?us-ascii?Q?xtPPDuWLnTsVjE2C+oOiegtXmqDwFTm6hacJec/18SJaSMpR0BSPnj8QcB8w?=
 =?us-ascii?Q?qLgVZCq1O+ZgBezi+XwJPlqY/srxMgOIE7N6Ai+EWQlMTuQWPPE/Ay4GJz7J?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 21XWQOCJbqYbu4Fdn59CTSc+UW/w+G16qLEn9ngBf2zmWHYtvBVr0Kc4L657eVJGSAFtpbs61xCLfVezqktgrOJGAnJNTnQwEnfzISI+eVzspnVmRoxdYipw6Jn5wZq+NkRl3g9Lvko05UW6tGAKLnHIpzmoBuqek+JOuRHHYD5GFQeWKp7OxP0K+ABjPo+xXC0cJTx4ju5OiPjEVtV5KhHeneAiIm6VlLE1BUTTQnFYggsvAfTdARqa9Rr8HIIyqAfhiXu6ZQqE1HNFq+vIa3Ciq5KJRPfSj8lkP27cCGYIcnKKvhTRcsWyh/e0KzS0+lCW77BiLS5Lju1pPZ3YWTnlLnoI7qcWZDMWFd59lYGJ0rKJAlEiLBVw+IPeKX+EHq6No7+JzWvfFbJR1wdt9B/D7KLt0gDlHd8xZGLomIUGrkelVURNo0AZiMCRzN+XCAE1GE0PwK9Z96bzmlGVBShWDqP8KafvIskYXVVm/uWedZSAq9xa9RB02HZFWgy2wHSOh6ZG02vUtDgInybR+WiAygIxixBWzBnQU3emY3PSX9HWfgEPDcnKhPdOhqKXo/fuHJzer82IUSNNXAiYL4nqngTbpqL7ChUjaCRYy9A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fffb9957-9b90-4b11-e744-08de2cfdb1dc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 15:08:45.6875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EeR5f/hbg3/Sml+xMdZ8MgkHsV81uQA4T4mI1T/DmJChPy/8/NnSCINSQAOEN+UE9sajs59UhmPRJsjdl1xaeoEEawp1/uyH9B5JaVpkck8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7584
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511260124
X-Authority-Analysis: v=2.4 cv=L6AQguT8 c=1 sm=1 tr=0 ts=69271802 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JfrnYn6hAAAA:8 a=TCKqsOkPV5I5w9Wt-hoA:9 a=CjuIK1q_8ugA:10
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEyNCBTYWx0ZWRfX2denoswW02Aq
 IvREnZy00HVv89/wLZ7LFq4mK8OYdCGt/CnHSRtqWc7LYgS72LdQPJ/5cAmm/nslNOKye83yvbT
 aNkXmigZwvVozWP3ZWqrTL4fgOqpFdsDOtLIGOAR/9gcxnzmFU3LdLINLWjpyYzi2iV/Jtcajew
 A5ZtN1cf2muBuxZwyOVmFjKSP2pz1cbrtoji1IGgN1jQqst69d88k0haCFsdAt5EZ6+UNEuxaNO
 crpnGq/JTupOCdwiNGWSP7naxEJWDIPRM6cKPsQClNjg/5NcDvEqdYqEiHdqrEjps8r5s9vyzJ+
 uJMnhwQOIItKFqmN3eRsD+rGBkEkafZyWYyZ3kMRuiwYjaCcbyn7/A+poB9QH8Fn2/9bq5pmbIq
 dVPnOFdaVA6yavDFjyFSlnw7Zuujzg==
X-Proofpoint-ORIG-GUID: xh7EmHgtanNCB_eGPyM6gEWN3ntD2aVt
X-Proofpoint-GUID: xh7EmHgtanNCB_eGPyM6gEWN3ntD2aVt
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_141355_071314_1A485F74 
X-CRM114-Status: GOOD (  23.58  )
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

On Wed, Nov 26, 2025 at 03:56:13PM +0100, David Hildenbrand (Red Hat) wrote:
> On 11/26/25 15:52, Lorenzo Stoakes wrote:
> >
> > Would the pmdp_get() never get invoked then? Or otherwise wouldn't that end up
> > requiring a READ_ONCE() further up the stack?
>
> See my other reply, I think the pmdp_get() is required because all pud_*
> functions are just simple stubs.

OK, thought you were saying we should push further down the stack? Or up
depending on how you view these things :P as in READ_ONCE at leaf?

Anyway. I am now designating you the expert at this ;)

>
> >
> > >
> > > IOW, push the READ_ONCE() down to the lowest level so the previous ones
> > > (that will get essentially ignore?) will get folded into the last
> > > READ_ONCE()?
> > >
> > > But my head still hurts and I am focusing on something else concurrently :)
> >
> > Even if we could make this work, I don't love that there's some implicit
> > assumption there that could easily break later on.
> >
> > I'd rather we kept it as stupid/obvious as possible...
>
> Looking at include/asm-generic/pgtable-nopmd.h I am not sure we are talking
> about implicit assumptions here. It's kind-of the design that the pud_t
> values are dummies, so why shoul the pudp_get() give you any guarantees.
>
> At least that's my current understanding, which might be very flawed :)

I mean I'm waving my hands around like I'm working on an aircraft carrier here
so if you're _sure_ it's _absolutely_ safe then fine :)

In other words - well volunteered, sir ;)

>
> --
> Cheers
>
> David
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
