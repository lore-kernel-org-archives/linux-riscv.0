Return-Path: <SRS0=zS8+=NV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3382C4320E
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Aug 2021 04:18:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84E1C60F6C
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Aug 2021 04:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84E1C60F6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u34ZkbS0Uh7Y0gK9n/tHy11gNwhFHeO6LA37EsxCGLw=; b=M8VWPntFLIaMDQ
	bqTsE91bZF2Yp7zo3lppDJM+BCUzmFWfjEwffOHY0Tv/BP+x0AO/7fq+RsSVmNiEhR+Sx6xGHSxFM
	lvN8Mq3deyh8t+B3jEXfxRvyiytzNlE5CqvantDtOtk0vGk1jWqrAplZUqBcNePksX+xNcDgFBolP
	Uyk0kdIaxRjKXXKLS+QVPUDgiN8tkz1+/JegDCeSL8STFCsb4PWk3gB4c182xugHkQGHeOBmNq+El
	Ro40aGaiPS0+7JHloZduRQTAHnyVfvCHZZ9Eh4JS1sbQR/lHkuuw/MIoid77CM+qU/4GbY78b4LJZ
	Oi7RVIvbh1N7x79iG4kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKYkn-00GOYW-2p; Mon, 30 Aug 2021 04:18:37 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKYkh-00GOVH-Iq
 for linux-riscv@lists.infradead.org; Mon, 30 Aug 2021 04:18:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630297111; x=1661833111;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=A0RiadUwWBnN6qLQ6baUXXxCN+i01fbrXSIW3KEH9u4=;
 b=PYZ3fWRNwMQGC0Za+ZPwwLiJ1442TEjVAIEYU/fIXJPLL7fKU37+8Rvs
 xk6TvsGTaPkNNLW88nW7SOcpzkh1zrjHMFE+0moU1tIACx62efYH3eV7l
 Rk6s+SZll4fwysp6dMUPLkxawU/no6DZDfQRAQUtYUH8dp4XQB6rle4W1
 OO6rUEqkPagkUwL1uMDVbB1X6/kcfixOuoCk8cHacCbogTQ/FwAREASm3
 26mv3UR3I+mvJrnvX4v50RJhJnMsWUagibcYoGveCrNOV35bdiMrhe/5v
 mQMXpjdbJtzCW36y6Ijlza39Ay7SQ29OgfwnZ4EnQu5b5FPS9rjvVYfd8 A==;
X-IronPort-AV: E=Sophos;i="5.84,362,1620662400"; d="scan'208";a="177841344"
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2021 12:18:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUGI1i10X1BMUjREGThwhm9qm/r8d1W2XkhYEKLawk8HWwAmnXnm+dV9u+xr3nQlwzy///qyC1GwWcI305NmAC5bfhkT/JLMMeMaj5J14+HcqR9Jb5ksh9ChcVoc2hsgnkUBPH6tKuohbTv906HuaPJl34W177ULiJIt1TyRhT7nTrljE2tMZQFkyMWv/PeTyAChzw9m/o2cU3XfUL+uVzlj2tSfdixFRdEZ/NmsySAI9fkvJhRFkiWl1CeA3meBJdadi5qZZTAa/myrA1GPqhd1W9zsKgbUPnM79MX/MBVO7aK0OHEgiDL0Up7k2NZVtf+plApawEkAh1gT504cOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIiEX1BGg/RPcL4NTR0Io5dK6z9osq7SQaNwyA2Tmeg=;
 b=eVjnioVrMfDya6SwM4EiJS1uF0Dg/V11qZfd2c9iL1sx0WTtH3Hbdht+KGADQ3vcKRVHsfxpmfIDrH+igJcWq+5xQfUQJWC/unBxJJ6pooUcGqL3aFKHSQ/2RX4lVLsOnxuqHRrI7WAdoZeTqG88XEQmXuW/Y6TS2oW2Zp/V+bFdCZWa/xRjTKPQJTZ9rHsAwJeAqC16XEnMkzIm1ApXRkOIJh6GSeXDyAbSNO8Px1hsRu6PD7sxSjBXvtzuU9gumslz5Jk/BQvMUL0okdQ9oJ96nNzr1YLv+syZN76PIKv7bd+5DpiN2sSVfFSsGslb2eTLm7HlR68qn9rJIxihvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIiEX1BGg/RPcL4NTR0Io5dK6z9osq7SQaNwyA2Tmeg=;
 b=yj4/q9VyAnhjRR1V32RDHpWFzggHXNnjzIlkm0ube5S6hhWnkBdlkYQvt6JbTtmT19K55aaRzy9zMcosOc1R2Bzqb1Ydd3b8rtgk6DpwO2sCaIDKuIo3lZ1TO6sCpMm6zLzhAOvGZIeRXEwg7lv02mu2nAYLlbOGKqf0IrX7+qM=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from SJ0PR04MB7821.namprd04.prod.outlook.com (2603:10b6:a03:3ac::8)
 by SJ0PR04MB7870.namprd04.prod.outlook.com (2603:10b6:a03:37e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Mon, 30 Aug
 2021 04:18:28 +0000
Received: from SJ0PR04MB7821.namprd04.prod.outlook.com
 ([fe80::545a:34f7:53c5:6514]) by SJ0PR04MB7821.namprd04.prod.outlook.com
 ([fe80::545a:34f7:53c5:6514%8]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 04:18:28 +0000
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
Subject: [RFC PATCH v3 08/11] RISC-V: Select ACLINT SWI driver for virt machine
Date: Mon, 30 Aug 2021 09:47:26 +0530
Message-Id: <20210830041729.237252-9-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830041729.237252-1-anup.patel@wdc.com>
References: <20210830041729.237252-1-anup.patel@wdc.com>
X-ClientProxiedBy: MA1PR0101CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:21::12) To SJ0PR04MB7821.namprd04.prod.outlook.com
 (2603:10b6:a03:3ac::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.179.63.14) by
 MA1PR0101CA0002.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Mon, 30 Aug 2021 04:18:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b176fd73-5e3e-4077-5d29-08d96b6d3795
X-MS-TrafficTypeDiagnostic: SJ0PR04MB7870:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR04MB7870F82A5CD058D8862CD2408DCB9@SJ0PR04MB7870.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XJd2jrA6oCdps8mZdbeychFGo1XbVGs0eiqX1i8brr6rdMYxich3zxPtn+aVu0z41vQ23sZCDiBWC98y/Yn4PBU1tAJ9izz5mSv4H/K+xsbz5xy509ziBTOvm//EdtkjhC0+SH6f84cz/lRaZ1smw6VcfeSGDLHSc5Qfwi5eRlUKkPAdYKfToCuO/EOQKpFEwpnLEV5Be3HgxXIIm0yWlsjis2JgQ8IvB8YI86TPllDHwblWXIVk1/9VxBjm2rHgMSRA2gyHf8vl3s4PBXoHrVx9KORmq43UaVXeQxHn4feyLAWlQmjvwPjFyDP+pn1C3i5Jvzx6HZ6ulqewMqDsAAcOGQ8iEH7fvScpjSQY8u/5z8HL90DAznVBVgIf8ZYKqnFccAknLe0N0W5z3h9nTB1Er8bfNDLVEYq1+0VqkJoctW9Xerf3iAvzHO5cbN4pDjF+N/Ludkxa//Dct1O9GF/zQDtfkjZ5YgJ6Xzj6F8y5r0CEXLjg/37gBImLbEWj4HdRLhZedFPVBLmexF80FHi/G1y/8CkQInrTsmt/oBAMC4QCEeeN0RgUIewHKaE3fZezJCuDdCMib1/lkCCpdMw1LP37E1+6Em9yes++IBZeXGOLNCLWr84vqc46/FNLnLKZ9XkU6BtQhKUr2Tz0Lnu5yFwfqU9rBbqBqvRs1z7bw0ijC829NR8URzzRznUe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB7821.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(55016002)(110136005)(66556008)(66476007)(54906003)(8936002)(7696005)(52116002)(956004)(316002)(66946007)(2616005)(44832011)(8676002)(2906002)(8886007)(5660300002)(186003)(86362001)(478600001)(7416002)(4326008)(38350700002)(38100700002)(26005)(4744005)(36756003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vnvf2BJqoTbMNCQWhPIlxU60WQCriDqDvc38cI+DDDua9oAGUkkEsHRENH4X?=
 =?us-ascii?Q?AKjTeqkaFaNEr8+9U4fB22/PJc/3pPo3nUb4D6rx3khkwJyAq5JoXx2PW//5?=
 =?us-ascii?Q?f7v2184ObnpYtg0EQBc/W//ROSoER6GtrI07v/XMK2X4pI37S+3FyWgrGaXg?=
 =?us-ascii?Q?6GJPUevK+19hk8rGKAnpavrHZCfxEW9OVuMPIBDqmNIy62oLnG4c5HgKv5V2?=
 =?us-ascii?Q?0b6kTC6f2bKe9TLDZoh/hVN0THPPY/IdMSO7HM+eLa/WxxFIBl3XUeE4MaDK?=
 =?us-ascii?Q?T6De3JPLeZloRMG+t0Ggt4iUAtGj0FCMKbnr3PQ0WKScj+i+WXduDnKqkZzY?=
 =?us-ascii?Q?ZIsiJRrS+57/EMSkz0iYhFKZXkncuEepBQPhH0JWmyuoej0JabKATNBYmkks?=
 =?us-ascii?Q?EuO27vdmw7tWzuJ4VsfaYPtkzTXT1fWSXelmLAiUox1JPscvP3cFbUxbSSJi?=
 =?us-ascii?Q?FOiuRGODawr/zOpfUHKqrZT2DqDySGACrw/SevY+LD4YtuuaRJD00YWQjdxn?=
 =?us-ascii?Q?6XvOfHSOre9shg16kzBLA+dct6cb0VNdz+k7iO2wf95YauPygQs+/FcFXucv?=
 =?us-ascii?Q?xNrgdWdtkSG+h3EL1X6rjnLg/Nj2Jx+nASNfvLegm5XvBd1wicjwKSPDgkqD?=
 =?us-ascii?Q?5BtdrsfhoeKwfyEaVg6wOUe/wQ1prl+56UK0kPN9DUYqVYNJw+L58Fp/6McK?=
 =?us-ascii?Q?vvjS+h5mi0+W1rbJSfeDRTX9XVy87MtgEMU+vdiuHJlFQmGnPhAWLweK34HU?=
 =?us-ascii?Q?owcYHruXUmbtLc9nugehV0ZZQuj74afoMZK2T6rwQT2us/fKsILF6qzUlA7j?=
 =?us-ascii?Q?WW6DgW2+7Z6MYC2Ku8dBDSQmWZhqwSWP+rFjf+8qH8g0Y5Giqb2o95/j+XlE?=
 =?us-ascii?Q?oBl2tIFJMLo4Bk7gMEL2b8m5yr5B8Ut4EjdTAjgfqfzHiuLVt4zOQRncXVye?=
 =?us-ascii?Q?D2L87RCfnKQRpKtHHZyzLwqepMlWa3jx+nx3028ur3kIglnYSuCPHy230Q3q?=
 =?us-ascii?Q?HHAQqFDZgDwx7Vn0GnpdAqLxtogp6ASgkIohbkoTGhXutS8CWE9H3BxVCpHM?=
 =?us-ascii?Q?apuB1ZUXc4H7IuUoRZgniY7DHcSHZj84yv+dQx5daar8Js0eVV3m3uMgajUf?=
 =?us-ascii?Q?lOoPXE7B11fF/Yx7YYl054hTr6KvoS8whFD5o+Pr01dLDvkKajOKdx9H3Jib?=
 =?us-ascii?Q?DuVYJNEVSZGoWofk74YKwGUqlTsxkJCXSWioSGBLnbXB/Eqqqxr+QGO4ShKk?=
 =?us-ascii?Q?R3viTR/LHEkNM4TjFnHhzm5DBE3T7VapqFTBjJbaVyptbCzbK9UJELSnlR47?=
 =?us-ascii?Q?wzDb3RW4ZFnm+54+a2Btzj7T?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b176fd73-5e3e-4077-5d29-08d96b6d3795
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB7821.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 04:18:28.1611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9PJ6JJ9blRM8DFM0r62QRPx/DyTnVB3x79aQ6zaTbBedBkwoZTZEzYKpTYZn3IaiiuGTCN6WLLEffExXILlZow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7870
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210829_211831_726625_19D5D65A 
X-CRM114-Status: GOOD (  10.64  )
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

The QEMU virt machine has provision to emulate ACLINT SWI device
for supervisor-mode so let's select corresponding driver from
SOC_VIRT kconfig option.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 arch/riscv/Kconfig.socs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 30676ebb16eb..651da2ed93bc 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -28,6 +28,7 @@ config SOC_VIRT
 	select GOLDFISH
 	select RTC_DRV_GOLDFISH if RTC_CLASS
 	select SIFIVE_PLIC
+	select RISCV_ACLINT_SWI
 	help
 	  This enables support for QEMU Virt Machine.
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
