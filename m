Return-Path: <SRS0=UO3w=LM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C35FC48BDF
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jun 2021 12:40:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38186613EB
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jun 2021 12:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38186613EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rlA4a9vxOwKcMRBo4W3SeS+n6d6SIhxD/2esPH77tE4=; b=bxj6YOJtIaoKJl
	6aCztSvILo5D1uMZSi39sZ3UL0zrd5887B69tRhMA0GTku4Kf4nfEi6f6gJcNwKPUqvLbEASdkVky
	bXUP3MWpgo1iepTNUbDe19fYl9ixN9Mjq0Lx+IQu2S8bQv/FHEsFdiMELmkR2ouXgJI0xrk4Jfn8l
	s64mEXtY4B7nnCZyOeWN9feDLiZZVV3iXHo+x14snSrbR9YSARFBb1ZTv2MckRepJjdLnclB67Dqu
	9s108dBi70zv0xzQQp194wXvrbtvGJwCXX3T6SLid1VPST0ef+0pOtsZr03fLBnLSXdivaO/70WNW
	CMYDyfvn6kK3lxaFd1Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luDnF-00E3FZ-L8; Fri, 18 Jun 2021 12:40:17 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luDn6-00E37h-4u
 for linux-riscv@lists.infradead.org; Fri, 18 Jun 2021 12:40:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1624020008; x=1655556008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FFdHgE65d6xE3WMahp4Y2C3ro4roHF+HqCp6R7Oi+uQ=;
 b=BDdBp2Td4VwawfkUMLz/SrTs1F8AUp4/0hHsbmqYELtx2uJqzJuhL/m8
 kKjN76C7zg4up0wNuLHk4Tad2kkrulbJgrWomUoTwyZqPIv5D2vYDClar
 2w3K4LGseldA2WSxYtVnbJdy9FnRdi3iPkbQVQm1qeCyp5zYL+hU1CzDu
 dvB4CMgyhAuxgv8rh/n7HcoLVeCU9bpOD6JywSbNUsnyPfqqbqrLe3IYU
 RCignZ6VW3fVsmhkwe9K46YKcMLQxTI8XSxp3eajRTjUD2XEQ+luwaLAh
 1wpn906ZhlJ3yQNzGAgmCxlwMvzH0PbU3+KuPCey1Z8js7GKGt4dvx7pQ Q==;
IronPort-SDR: 6zxXcZFJqd05cS/oC9pvffpkVopS8u7iNTuygCEXKJxahB4j/0HLP0RI3i16VZIr5RMdqQr76P
 r+Eg44UsPymzH2kzzmAr984AOYlqIv7rIzaEbGaaQa5o2MtjvWhQlU3gANODXq5r9vtgs7W8uF
 ExhZ81CDXpoEP5cHIgV3Rf+j5cr07aZ7HztyKW7YgZvPmymZdjab8s5l/PUAZgIpAzL0vSOiTG
 3pDtYOeBOGeT2sdZBNN+aOhgv8cxaVv8FDnqV497mYOenjC9LVllYMbfHjQ+flCsjxPfq5bKO+
 BvY=
X-IronPort-AV: E=Sophos;i="5.83,283,1616428800"; d="scan'208";a="171563537"
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jun 2021 20:40:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+hXOC7pbxTkSHEGpIFb4tPuQCkiHKm9dPt4etEwxIWsZPsfdXBEkYrSmLKEdThFj0yWkvUVTU8WxLUWSZRkQR/UsBje05Vvra929hhMC/lALnyoEb2y3AmUHvtSpgkthF7p/AqImKdYSl+aBtFe4dqIuydIBrzGuv+uQz/wMkxiT3esj44N5Jfttq7Zsw6K93FqRuh3c9JFafY2gBTUNjHdo6OIqLXhCMX4C0HIXq++sa9nYkLVuU47oG2qZt0qXqSXnf+5LF3967Oy9+Te5wX4SVUOkeXM0ojd/NwhMrA0lm1PYBG3f+WFJJtSe0KnW5qxfJy7U26ZtN5ZGpCJVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OypQkUVR/xjQ8A+WMYYGD/8cT1GOvzv98X+yQzCzZg=;
 b=lo1Ja6Pv/khsN26xaM4RxiTwTSrzA1sRe5SbgtNUq3JCyagBvcmLR2qxB0jo8ucVMT9hIjQFEi9x4VvTaWsXG/MuaHbFP+GZjlEOD+UOpbIqfyDCIxDevmzzKaYuAJYPPIQiW8++LQ3m8KFzLK1NpN8ZNtFUt+Z6S4AfkqS5MsQ6etdP8eRLwrVKRjzQ7Te5WTEGX9zjZ7+xA/Z65hMxhgTO11JcpvaKrugZY+jxYnaSqJFp5YCE2YrS0Kx9/R6r0MVm+k6O6vBUDFasJYI+Yd5zdap0Udu9oXHFGFz2w9B4cAd1TfznWGZzYz2O1T+1XEAMgi0wU9wqnhRJi4a6Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OypQkUVR/xjQ8A+WMYYGD/8cT1GOvzv98X+yQzCzZg=;
 b=wFSYLm9TlQT9M5dSme6XGv4wm8V/NVVtDgycIuKWN7MEFpVP4seAKhToSPEZN+EYQT0U3SMIr5WHE6cycppxj6uHuX6vy0T4MGeRRRCjgwDcKEWor+50I+BflNxJQ8kDloVdXcR4+1HopaJ7SGRx+6DmR4XVrnpBVgJ2nEAhHEI=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7857.namprd04.prod.outlook.com (2603:10b6:5:35f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 18 Jun
 2021 12:40:05 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8%9]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 12:40:05 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Anup Patel <anup.patel@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [RFC PATCH v2 11/11] MAINTAINERS: Add entry for RISC-V ACLINT drivers
Date: Fri, 18 Jun 2021 18:08:51 +0530
Message-Id: <20210618123851.1344518-12-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618123851.1344518-1-anup.patel@wdc.com>
References: <20210618123851.1344518-1-anup.patel@wdc.com>
X-Originating-IP: [122.171.164.186]
X-ClientProxiedBy: MA1PR0101CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::11) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.171.164.186) by
 MA1PR0101CA0025.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:22::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15 via Frontend
 Transport; Fri, 18 Jun 2021 12:40:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f76cb02-4edf-4366-4dd8-08d9325632f8
X-MS-TrafficTypeDiagnostic: CO6PR04MB7857:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB78570017DD8B6EC6BABE4FA98D0D9@CO6PR04MB7857.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UYy6Z45KZoPujCXZhn4WNTydC2l+cDthEop+aKA/RoYlvfx9mdhC5aGiRtY4JFOo2B4wFXTa98Cl5KjWIIvRNdtUp4VulvK0TTWIKPlqgXZPvyrW45jItaSVXetd5xKxwvvnavD/GjbHYCkh5FeIyQKIul2WWY510OZtRXBO9C5PkkMwtXgWQrwT1UWgtW6K9/dL5yfVzUd0ZJdooepQoIYBvV6xncUUQnmmmKhh+bEIn5F4+RognveJRaYuk+GoZQrl9rz4SABZVahjRRnwo8SwwdzfC0bZrldmYTg+P8Jtm+Ecd0/BPt2AbTzVOWod4r6TYIe3E+y8pe9q9kYpNtPlU0K1scbHaXUYIPSpoNKtSRSXH2072iyhBxU7kKWIvFV8tMJ5fq0p+1Pu9RSDO0HWTI7dz1w5FIPR+MWjjRxPgDvwamAG4aRGUxGNmgmEfNsbRuE/EBTvrbi7MMOezbLQiUQoZoBLV8nUCot3xsUyNtHYsblxzCg3wCYnpgo3z7XhelqDkLWUpx0sx6LYQ70BtcsCQFbdYUr3GEzr3786mx057DZgS7D91kEQc/J3TM1GRh5JHq1A1mp+VCjw0+LbAwxDtjk0KQO4sOiPdnTtI3+pQUKK5yaZWgfnxvUShO2R3zYyoijDGCAI2hfatA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(39850400004)(376002)(136003)(956004)(2906002)(478600001)(316002)(86362001)(52116002)(8936002)(44832011)(2616005)(4744005)(8676002)(4326008)(186003)(36756003)(5660300002)(55016002)(83380400001)(6666004)(7416002)(7696005)(110136005)(66556008)(54906003)(66476007)(66946007)(8886007)(38100700002)(1076003)(38350700002)(26005)(16526019);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5rGINAQK7R9gcSkLMVD7cT8cia+Ct4cIDncaTfA3QgcUdFaUXzGXdRuw/iL2?=
 =?us-ascii?Q?dXFxBobfO9TnosbGWdxhhBOX4FYgPE9LnQoMyjl61pL522Pu8kYvj27JMQIE?=
 =?us-ascii?Q?EIxFYUE3CvzVWjbC8tfttgCVGdpoZevne151EQyyR0nj+gEOOyAw1eKQ5k6F?=
 =?us-ascii?Q?vX4/eEy9tCDC7LI1TXmqrOiJg/hEQU3xHMURQWIIiVWRc5vhj3VJYdd2Eybw?=
 =?us-ascii?Q?CLSjA9aBlUO0GFa7oF7IdZloX5Q322O9f/b3ynzEgQr2DAdRkPz9n/P880fm?=
 =?us-ascii?Q?H8FFDg4Y9d/kz57RX6Sc5/2LVYulvR9/um4XDSPJg9qpxdjZPEQAjPZW9TDb?=
 =?us-ascii?Q?iH5G25Qn7ho5nlJShDPRQUconcen9wnOKUPtr9UM6fPGqdJlak3XqrXn3JOa?=
 =?us-ascii?Q?7zoXK9aQoVBQ/VJW0BBtMFZhls3JKgIQ9+xJHIgqoUpwPfKe42x6PhLsq2YE?=
 =?us-ascii?Q?6KMQw2Dv1jGXua/PshjxhmeWDuzgBQ80YTvmHl0Ph/T5TOBX0qaSZ33CfNmI?=
 =?us-ascii?Q?LdGhkTt1/5x6yCsdXgo2tdN6sBBQyEBGErvO76VIlEXjBZak4Kljg9fH9hia?=
 =?us-ascii?Q?lpUOp5sJb1R2wZF0LfJ8wlO5/ouKpjLtvIYhJeBFNSA5EGMsNN33nbnWM6dA?=
 =?us-ascii?Q?HOboA12JeP3Ms7nvD+YN4oRTT1Zi4fPJ6b2qE5O+F7EhyNbcWu9M5o9ylchb?=
 =?us-ascii?Q?b60YSeZjGsxqJRvReMaOyV+EWEZXPJYHR2Es89EeJNGSMyI/bPEKgB7qS2Pf?=
 =?us-ascii?Q?e1K62ypBGbjKviBL5pbHOOMON/2IY/+fdWctrcD4WrpNH42WlYXXkOYw0sac?=
 =?us-ascii?Q?NVFY8i5o7h/nrVYvzDU9XWbNHKlbg6zVOjLZ5gF38mstFnDVtdYLnUdNL71j?=
 =?us-ascii?Q?vdVqBHKAeW5I7Kp2oVDYzGjI38SThCsAxG3hR2FumJH6fL5317qSikHgIvOj?=
 =?us-ascii?Q?sxwRv8FBYKBzOtNxBjZkzjbVcfq9L2WOHKzL4JmyCkypl3sI1u8Getu+onls?=
 =?us-ascii?Q?x3kHCht5hi+ysjp6hm+88lcywjAVLpcBDSkHB1P36OkvrmTpRUyE2MwZ87H9?=
 =?us-ascii?Q?BOeJPsiub+8zRbC/IjhSIUEuQIIruhaWQ2/IvdHZJZGbZABtsmZQEQqyzMUG?=
 =?us-ascii?Q?1TA1aFInLSJwOL5bVoddETIvwetS7sm0qD4Zu4upRu2DLz+B6WSH+OfsC7Yz?=
 =?us-ascii?Q?nT7NTM0KYJsTC2PJucF0jpUTyz29N84oPtCa40fgDbhwDEC5Yn9OjR69TIr6?=
 =?us-ascii?Q?v7h8RJPXXxAVrgjaiNcMyTQqSXWfg0lnQkclCMg9SirjY3SMPUOh3Jwu8ip/?=
 =?us-ascii?Q?M/cGImowN+i5GVW9ZuK80n0q?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f76cb02-4edf-4366-4dd8-08d9325632f8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 12:40:05.6511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MPqPyTXm5DynaCM0jNgaJHoT7s8ccWDIeWx/wDYLI1IUwrW9ugpFybcyDNnYLGKoz7LQNkc6l7+ogUDB6QVXgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7857
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_054008_329125_DCCBB1E3 
X-CRM114-Status: GOOD (  10.53  )
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

Add myself as maintainer for RISC-V ACLINT drivers.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bc0ceef87b73..64a5ee2fb20c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15693,6 +15693,15 @@ S:	Maintained
 F:	drivers/mtd/nand/raw/r852.c
 F:	drivers/mtd/nand/raw/r852.h
 
+RISC-V ACLINT DRIVERS
+M:	Anup Patel <anup.patel@wdc.com>
+L:	linux-riscv@lists.infradead.org
+S:	Supported
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
+F:	Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
+F:	drivers/clocksource/timer-clint.c
+F:	drivers/irqchip/irq-aclint-swi.c
+
 RISC-V ARCHITECTURE
 M:	Paul Walmsley <paul.walmsley@sifive.com>
 M:	Palmer Dabbelt <palmer@dabbelt.com>
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
