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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D59C48BE8
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jun 2021 12:40:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B56461369
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jun 2021 12:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B56461369
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L6yvGf7bpjKyCyfVlle0rDe3DWBSVJxynrrloLnKVBo=; b=MZUgZvfTdCbPab
	V1Ob23pgNSNs0DqHZnMPmBTZKuNZFEeDYn+zxp4KA/JJS4rJ2PT6zA6LMNbx2uL5emdrOJYhzEPOd
	vKFioh0Vgn3vp5O+ClSknDRczYqf0Zpfro2n4CBXrpv3cjyJYbs/HlgPS6v8E58X1p5EzyZ+/84GG
	LA27Hm7qN+30NL+Is4W2JZt+CgN60C/DDgtDmKFHSJOPn0qFHQVW9Y611OML3PAa/9qL520jDHu8H
	sikvpyhgRSB9b4P9vFs2aaK1xhOTolQ53/fD2OSyA/2JO9/9c9NGTohLitLqqGktu2icFxXWTCCkI
	xURwC/knfMGo5JBTECrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luDmu-00E32h-MK; Fri, 18 Jun 2021 12:39:56 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luDmr-00E2t8-Ro
 for linux-riscv@lists.infradead.org; Fri, 18 Jun 2021 12:39:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1624019993; x=1655555993;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4QGixAxKfNfJ45oOm9bBDY2BI90ypMJcRJGpkQd0iZw=;
 b=re9Klrx0YCQslGrUc5YQ0doENuqDTJUKd9cD5KApSnrIYwZGTNoa9rpj
 4WOr4R9CgA96ivJ9Wn39K4BfsJsXAFKAS4f6gAfnUUe2z+JesFeAKFQKs
 o7X1cAqzfGjcOsRZz3MJTfTJLSL1HB3LaRHELnFwF+e8oLCQ/3Cz9NGR+
 /tS6N5ZLbz643Tx5chWyLUpuDJ3++nA5JlRrIWssF5hAVfruVSyG5rX3D
 MfZapmbztZ3SV3nX3WhpxFnBVCBb+b/XuAncNJKRK5Jd4dIErBy1v7BOW
 PjZ7gUi/oKOexH9Y1QH3aeanoSWcvyL1IrxP/jeqQBtuoesKYmZ7Yr07L g==;
IronPort-SDR: wacPq2NrmilYmMla+WFyBheiHOmyCUhxi3Fyu2YLYAq+2TwW0YmFw9wyTMBmfElBzFk/9BMqU+
 bw7Z9ExDOEL/RW/I+4eKFYv1FiNxKmrwzrBVbM0NIoEwf8Sv4bLQDMb9KegvvzDZRJ7VIfi+wZ
 NnTcTJSlDfB0+BesTolLni9iPIfkjGwLliw1ugF10cwn6XJp3aKr9WO8ShpJ09QvCk+JadT+Ro
 ut4w5WLPp6WzBo1rw20WqXJX/tYv4zOGwB9oRR84jIyjeV0OXcWO9izrR4HZ7piBk9DJF0tQsw
 UbY=
X-IronPort-AV: E=Sophos;i="5.83,283,1616428800"; d="scan'208";a="283779327"
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jun 2021 20:39:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUo1OV7LdlGAMJyeKTpCfIqOOq3njnY3etNkmetTcepMl4Yo+tHDCFKf8xep0FZWv3yfkyjL3D8C44JHcIfYwWnGlOvIYWDsDurf6IUltXoOyXb0WWVgC14pQ9wjT7srhiiBH35oB7Tq9KHnrh+b7isATYj6OK5M5KH3eWQ6evEPHhfOL7ViWKBZ0sl7KcpTjBt2hDGUSTt6ikHkutrcBh/GVaSoFZUyPTm3QTQuRZNGpVtG5ckgIHY/hWREQPZ26CnMp1FqNB12e76sFfIRyHUo+cuQFGDL9qGjZZoiJsH8ZSEvx0dgCbpAMtnMS8nTKwd8mwj29wde81cIlOJLmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5sZWcSj5FMDDPI6oxiWpnILTTE5i3vqneR1JZHSCf0=;
 b=hiIQd6MRWU96hWmDIwEYC3WcLuyiIpChtiqiQEWh+CdJNY6HZUGE/KrvNvplCtMhQEK1rpAcsgU0Ai3vvE+9DBnEInFPa8Qt4y14OYBILu3bZG/anh8Gi31yBAE1Ci/0a0ocjeJY6HNkr3H2t4PqHpRzb9OSXJedLbs+wFsLHZWcy5ghz78FCQUg4EJcsQxMs1CKQzTKwOIR7oI9TRrvG7hJ4pKXISvsBv5S5Ox5iTLkonrSTF2AS+kOtNQFCKuAsMJNZk8oMCEgWcEZwJdljOGywcq+mLa1t0MOj+7GL597r09zrOK5qvwb2G6430qY4xS0FlMrEZquGWaU/hS+RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5sZWcSj5FMDDPI6oxiWpnILTTE5i3vqneR1JZHSCf0=;
 b=WApAtmEh8lnmf6D+W1BpnKAEofaL2E00R8qRFgae1AAsIBDFXTGPz1ukaIcuMKxgNmhsd8JnQYysZIZFnH8jsF90rekej321Ywsw0Ui5dExdP2iuRKHFc/d1OfHwWZtqQjzPsV5un3Yv+jQRBrWzLiJaNtEF7VOivh4AwhgcLbA=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7843.namprd04.prod.outlook.com (2603:10b6:5:35f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 18 Jun
 2021 12:39:52 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8%9]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 12:39:52 +0000
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
Subject: [RFC PATCH v2 08/11] RISC-V: Select ACLINT SWI driver for virt machine
Date: Fri, 18 Jun 2021 18:08:48 +0530
Message-Id: <20210618123851.1344518-9-anup.patel@wdc.com>
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
 Transport; Fri, 18 Jun 2021 12:39:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da6f73b4-b84f-47cf-1b35-08d932562b36
X-MS-TrafficTypeDiagnostic: CO6PR04MB7843:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB78438480F900182B4DC528428D0D9@CO6PR04MB7843.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JHZhdiTymeYXcNScs7MOWxLmFEdswu81nLg/Iwqk/+gNuL8fv05AuvtWFQoc/hk26rtD2x9ieoLDzTThQzom6c+nd9xhTi5CGzrY2IcWbvi8R630aFhGAmUranyymLgWjqTvyO1DogJVUgf0wp6x/B3g95wLFYeAEy3SUT6fHpW1aaFZ3H7FVZUUqf++WEZ2JCtm5RF9C6cVWJ0pOz3JSupt86aYhQIpgqXczKQcGEq4+h8oyvr2mpyXEEFGw/pDPo/+wElD8ACP+UvGg+EUStJoeN8hR2gW4YJss6CYx5cDkXA6TFYVnNJzQf9qE3U+zLMFL4Jq6cK6QFHJ2vkqYG1rWCLaDCa35HC3xpVtJZGa41lnRd7t6zxJnprjhUm4r4UFVWHf676o6UVOwM80EC8PQkjpYyJvXxjzJ+5F+iBarg/EhOwd9PK9ZwYkCuIfLhXuOj7OR+McjUOxLZ78AGhsROWfNiactoWqRW1yWfcRw8VcrR33e32/fGCpbgS0EhVwtipG69nZ6VXyGtOGmUzFtqV9xup0zCVHyfPbdY9fcIpT1WwVfgTQLFb8N6DAoLwOORitsN1KXMT3i3MmvdBWWaqPJRqTQHv3c9UWrMtVAWG4F+bxVkqflpRPTjmZbnrJR+cVEH1lv4uw1R/Wsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(316002)(4326008)(16526019)(186003)(110136005)(54906003)(52116002)(26005)(55016002)(2616005)(956004)(2906002)(5660300002)(4744005)(7416002)(478600001)(38100700002)(38350700002)(8676002)(66556008)(8886007)(44832011)(86362001)(8936002)(36756003)(1076003)(66476007)(66946007)(7696005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cpEtKf6qgOoSlbVisfQyRT1WX53uRhBco/AI99X2+HqU3IacU6/WkC+fr1cR?=
 =?us-ascii?Q?wQVZYshz8jX0MfBtGYtnVH+VtSA1hmNJMd8B+bfkUHRXtIKYTnQKDeNnCUhm?=
 =?us-ascii?Q?731uat1TMlOsqij60nReMj3+anF1+WXj7etngpqg9qhdv8DC369bToBkbS7S?=
 =?us-ascii?Q?r9cIaGQMppNYdaWHrXD9znSs+C3R8R3XpOfQRAoTc2YJFAiqHGFSbJgLJvYR?=
 =?us-ascii?Q?O/Huk1TfAMNbcO2OWuqNsY4gDZLx//BdelVUqucyuufDQFBY2YyIrA7a1pbw?=
 =?us-ascii?Q?onBBuT89JMCOVlb01BlE9MinQkdoZssDYA6fx5HsKbNu73feYPFeLFJYiEiu?=
 =?us-ascii?Q?fY2zCujyxAxUX53IS+S2+eXa7T35VTgxCZYBrGH56KxbKgsCKSnC2vs7l7Ok?=
 =?us-ascii?Q?jJnEUlEVZt+CI8KD8aYUbRlWmhRQY41uyrBLkqp1yrmLKmWddckGc7FtoN7H?=
 =?us-ascii?Q?HPVfWRXf2SdTHx7ByPIivL9Dp95pyrCSBV8Vnx4yVtmVn+HFYtX5CneTqtm4?=
 =?us-ascii?Q?JWmEsM8JopbYLhk6cJlBC4nHoOW3tWJBQ5aNx2vpNPJuKWOqlZvvgzLIJfSx?=
 =?us-ascii?Q?rF788KYPkkEbXCdk6mKOj1K3shCdaI5Y9SpL1vPJNaRNlcanIUCVpPz7jc1X?=
 =?us-ascii?Q?MeQIZcHk/O1lkHnrR2srwuSRSexIzmS5Hk/EbQdT0UHIsfzkvhBMb/6HfUXP?=
 =?us-ascii?Q?aWMJ9OG7pf+Uk96hJghJKWS96gERRedrKOKLlYkYm/0d/lYdcr5Ajl0rbZX+?=
 =?us-ascii?Q?bemOuSpYETlFlnaANBhxnVBn7mKsv/P+tKlm851gq+s0PgXyL71kPvC3lGp3?=
 =?us-ascii?Q?ML7K1vlyirsfxAGpvsx1YhS2B9ERMsCR2ovWvR9dtQ67PSUOmIL5HSd7yzIG?=
 =?us-ascii?Q?eOAc3TNMN60b0c7irMMmSiDoNleX0XYJU6iwwBWRrqjELAAbkseEuRQjHnbZ?=
 =?us-ascii?Q?09KcS7uHCTo5yAtiY0wmI7lM5OyKgkBdplVXZU0EwybiSbQmpRwmz0xIB4mu?=
 =?us-ascii?Q?LRaCDlevcVIs9XZ5s+i4GBRx3oXSOkGkPP/EhXC2RSKLelpG/u4hJU26n3rh?=
 =?us-ascii?Q?aXR2zaVi0Qblie7/wmf0nBKzxHrX4jQYWQoaHfeefuoiSysqSr1Be6vordxS?=
 =?us-ascii?Q?AMp0me7ZJ1qX2E5HX8/Hb3RaLiaClnrXDTix4C5tFStuWhjbqGPtworul+mJ?=
 =?us-ascii?Q?Mdox4e7iiw0o2s0wB0sgNg4Ja2grzPHI4htDxLt/694nB/sqttC7jczCD632?=
 =?us-ascii?Q?V+rKdtHnPdx/ZOsI/LMV57k1dFmT9wAhcqgQkK+BnUTANHpbH4IZJPyBjwUo?=
 =?us-ascii?Q?/vB8bkEO+TjbOokt5FXPtmAK?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da6f73b4-b84f-47cf-1b35-08d932562b36
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 12:39:52.6175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/zigNe4xzbwdgT1jrR1dinUG4yjXmpnQzNflKK2i58t6aB66ZQWm0SkkbCqe42YTtRBqxPR0X1Wk3h/athp9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7843
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_053953_957906_4D423292 
X-CRM114-Status: GOOD (  10.57  )
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
index ed963761fbd2..2687a0902ec4 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -27,6 +27,7 @@ config SOC_VIRT
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
