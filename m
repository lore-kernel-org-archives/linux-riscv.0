Return-Path: <SRS0=UO3w=LM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30538C48BDF
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jun 2021 12:40:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 001FF613EB
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jun 2021 12:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 001FF613EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jjj6rDsRmaLuoyBUSUO0Rg8grSAcR+0a9PVJsurtOFI=; b=p4w2CRATyQ0aae
	YgQF0dpSe9JBVOnUhVu4uMSiDXU3HCBJeIib+No8Vt50BD/iLSvJNQ447fJ4G5wVCN1ORCNR1Ueeh
	XJsiqym3xZUbwyucbAbk3T/akjnCw9SyGDKyKUT43quwObpPdAnrkyXWV7WjGUcmHr83cDmY1i1cq
	EzR+Y5IQbrjgP+nS5xkIz9byx1I5veMXS28E3yOLq4sqIQsv9KHJmVeCI6l9z+lY7nmXwiJ+16DmK
	BN0wpS8H6DOLw+4uob/PGNJIOBz7LLIqW5ZdU5Ufg0t5H6G2rvtUDRP8CO2zZW6DCi8CmbkQdS7i6
	EDEMzo62qMxAxfalIWcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luDmr-00E30m-N4; Fri, 18 Jun 2021 12:39:53 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luDmn-00E2t8-O8
 for linux-riscv@lists.infradead.org; Fri, 18 Jun 2021 12:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1624019989; x=1655555989;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cUtAcaxw/vl0L7G+naf+CU6xYedTJ1g2K7BxRCZLed8=;
 b=F9sLsJ+an5zT0kSuJIHX5bFz7VXFliCAd0RJe6WHNGeBkOY9bRWr+iWx
 FeJU64u5lMOY/EXdWyl3fIMUYavzQ6BtnhajkHGpTFkO5wmCplLh2DR2o
 gOYODW2dYolRylOT8tNT7dE9j53Is58caIUIWPLx87tPSppFW5Woul12Q
 0Qk3vSXzWSqOlxjF6RzqQDjx1Qh6Ixv48VEJAm1b2aixcXD8CqlwI3bxf
 tUrW7mQlYrUYzFZSbSnIPPVEq4TYfyu0fp0eEmi+z+EDMePdUaFvSGX19
 6X1xtjk9h3XqmO0WOeBBqX0Xgy4hqRKt1OuunI0LbLsd04qMwizDTbPdE w==;
IronPort-SDR: iY1qiU+xtlS1neT9oKGzwOwm7OUxQBEtpGZ5GOBsG+4GkIvx2Crn6+l2J0P/4DA+8isPqtsdeP
 d5QDuTDl9hBfgYcI39rXzkmHBv9v90wmYfFlfviqZMDW+1yz4GVzLAImHJH5LLDUqmuSs7cd3w
 kmQWoMZbx2dwZX4PtTy47V/FK1Qmy9oa8hI9KrkKsDYj5r2f6hjcQrBX+pPmO0FhsP4Z7dCGcR
 7A71PXoaXekXliU0EAf8zMckP9GD2RYuPXewTjuQSrIutS7lQfPSaUNTxwFl9efPFRl/cJhgpO
 Wnc=
X-IronPort-AV: E=Sophos;i="5.83,283,1616428800"; d="scan'208";a="283779322"
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jun 2021 20:39:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bz6FkcnczkV7IgC46VxQgQo9HkiffE2/i8NTmOX532G0jTt1ffzJVT/CP7E6xl3BOMWINsdhVTpyE63nD2EYYaLXAAIt8f9sQzGs1OD3ilBTiplpPYdKk/98oC2aJNZywXQkXd/rS2c3moRNln6wAwUykJdk6qSskNA8d6I0d7aC9xlysgQj/13XJcRYofuzSHDVd4pVdfBnniw2eZXuErRazRVEq+mpSz2wuJtZW/Fkb25R4KkoZ20ubH2VXDMrkOJxGg8aHPLmgJnD1eAwad/VQAte35WELuhCOWFY24QEi0dR0987IccRCO0c/2ufGpbKZyBtisEMib/oJrt7Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hw13Y/8BtpEkFPeNtQEZL8+MiHxYwXx0UYW802EEfj8=;
 b=OwDhNnISFndDKHLC+UXtKt/sPfzpGTN9JjL0x1CbCkl4PIHhEhhYyU/nQEh3KKTmrNnwAQvc/RCb+NRYXB5tRUNZs96EsqZUtYYUULAW+XFnDfL00V1xxpOgJ2pOsxJoX1vRDdkbaad3p4fHoL0hgKQ3qihFumPLfr3S04exFIL82dpjOOp7uFR14dIxhNdePQKlJdv6RlTEwhpuFlI3Z4o9GEQpxZteSQVfsTJQcWCYtgay77xdeEa0oVXIO88XrntnIa31xD13kLVFL4oBSd5qG5i1A2AJ24VKB9qQWhvl0y6b74Z95DYo0PqxsFzszvnIjDYsKalhyubwcMx4YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hw13Y/8BtpEkFPeNtQEZL8+MiHxYwXx0UYW802EEfj8=;
 b=XR33oPpjSRdlbauBt1nMCBFvav5N9P8SMg9VCcnSFGXAiYimgXdwMJa9T0FHQlz84vlAb5iY2mv2JFM/j0jRL/iP/fmgrHbAcA1TPVdlZP7JQEUFJY02iZxLBbkyx5wZIVBetyIoJftbCmEZmcLl1MqRmT4XH9v3MQnSho8WDwQ=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7843.namprd04.prod.outlook.com (2603:10b6:5:35f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 18 Jun
 2021 12:39:48 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8%9]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 12:39:48 +0000
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
 Anup Patel <anup.patel@wdc.com>
Subject: [RFC PATCH v2 07/11] irqchip: Add ACLINT software interrupt driver
Date: Fri, 18 Jun 2021 18:08:47 +0530
Message-Id: <20210618123851.1344518-8-anup.patel@wdc.com>
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
 Transport; Fri, 18 Jun 2021 12:39:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 059d1cd1-ee09-4f08-6d03-08d9325628ca
X-MS-TrafficTypeDiagnostic: CO6PR04MB7843:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB78431458CF6406CF54CE2CD58D0D9@CO6PR04MB7843.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qYceKsp0Ytuo2w6GCtR9FUs8Lz5M3i+01TFh3A37wnRuN9COpu2uYSn4pYlbOxP+9r45HsuuS5dkmJKIOJiMvfg9OWRvbu7tqtKgmkoxKjLYoxER3p5LNdd9q/X9gNIuJrMmCW0eu9dVEZq1CB7y7ruCxU384kjBiPsGnxrbVhxctZMST+kODvxf4xyttvbpNKbFeGQdJf/f4JQc/V45L69oatgdpVNtZWKe0FSoQsHGAtqFnbh6FVxjhgqVNXOxD4QiBcZdbjluL0kh0oldnZPi2rsKqq5KxCZ73wTC+EKBkpmZB/1D5NC7+rCklXYi5qD5gXKxL/CiTpeh23+rHujAPuvkqyEuRC8nhqtnqknuNb+5JSGpLzcmbqFlDE9nvwbmHb6ZGzkrhiqJO8qBtPRxSpHURxKK0EDhrWXrg0/+ML+3IdDaQyOdfaZPfUomrybvWbokW69IQgf5it2ENr9EsKui2x9XtMPjmVFrucxNDlrf73Jmrf+nxFb1AvlTvOlsRmv12TySrsGyXr1kxBfFxcHa5nwYNdvjM6GRoCGTPeR/B3zTuJFa0rDv1XCb1/scbGVTTZJuVEFCsYLJlUGhgtjc8f0MZa6HsDvscQJqZqE7qnsOO0gANQHUigru+O3DwhYi42NCS+GyDuQLqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(376002)(136003)(39850400004)(83380400001)(316002)(4326008)(16526019)(186003)(110136005)(54906003)(52116002)(26005)(55016002)(2616005)(956004)(2906002)(5660300002)(7416002)(478600001)(38100700002)(38350700002)(8676002)(66556008)(8886007)(44832011)(86362001)(8936002)(36756003)(1076003)(66476007)(66946007)(7696005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BwsX+XoR/fXHw6JRW8nFx7KNUfJcVChXPiVH7nwYP216R0EuTV7bP3bLuCea?=
 =?us-ascii?Q?iiVfoF2LLpba1mKVaLMDuqiYFwIVo+XseEbiL8EAvbe2vwGXYpuSdxgN3PbE?=
 =?us-ascii?Q?ioVGHA4EAZxnvDd7dz+C7mCPfo/2spJt4uDwV+6OCgMpvm1oQcAQpXJ5kAAf?=
 =?us-ascii?Q?Y7aGbNUUY3oCiGFx/5Wapp4rnCKrutwlOmFp2nKS8xyeyUDQTea8lMFDqzw2?=
 =?us-ascii?Q?4d9PQi86mbihrWVi1vg8csw74cU2UnqM9QCfXkjhJWWpR+CGXZZpkOTY6JHX?=
 =?us-ascii?Q?4N2ziN5cDrVMxYMyxqD9A6ish09ylnZ3xNK4qk2eTHPOE2Zc+TMimnUg2vL0?=
 =?us-ascii?Q?0FBhpagDajudacS6Tcf574Do2w6AdRftW/p49ep+fbJtHigbMGfIbLFDHPOq?=
 =?us-ascii?Q?pKnZrr3xfqwws8PMGGlODhsLhSYFxmo3uFDuSSV7G5qrYyzW7xlW2NfSGZat?=
 =?us-ascii?Q?8cipvo+nWgA1vbFe9/I4MLkxbvtzUhhdbdvnJqzn5rgF4sKsaI3G7UWvHBrh?=
 =?us-ascii?Q?ojf1ir4lXl1sV/x5Fn9knLofEsompsEyhK3rpUrYMq/YaWkTx4vk77ERoizU?=
 =?us-ascii?Q?v/lM/GX0BTJuJmKpITc1u8aONy91nXlXXKZWgDUnVYFlijayqOv2S8DCaCxS?=
 =?us-ascii?Q?6WaXaS+PJYswql/G4zzs1zv+Wt+Bz0GhWcJGQV4sXacqnKyQBiuVT5ZQh6cp?=
 =?us-ascii?Q?Pj6to112kk2SCkjzg4yo2AuIPWhB+SfJpxFBHhxtQEL9sBZd8DNk5rOiDxS2?=
 =?us-ascii?Q?ZaPIB73UolvnAdlTy6FyZFic7wI9Gz0L7th4HvcwXAo7ABy+laIZ8WstC0ET?=
 =?us-ascii?Q?Tmw2bVrBiHYi+4iVUN4ixKxCia/5NwHLBQM7dmatcdzPZXDK4rdNe3pMLcjE?=
 =?us-ascii?Q?1/FmK6Hhw4sgNyLuoTtEHSYDIePh2lo5/JpEAX5Vg8UXJfEmUMdiWSlmHQz/?=
 =?us-ascii?Q?lbA8rihFKHsjJZNh2y+KUZ/fJ8NklnkmkrHC4Y0Snmf7n8avnNSbmpRBJ7zO?=
 =?us-ascii?Q?XahIS+mgBHElqs4cpYlHI/PWSKuigvU3/LJRYCHpqrtmzV48dAkbsgpHLGc0?=
 =?us-ascii?Q?6zdqbIUTUiChM/XXfEUMfTJdpNxItENzu7uZTlyEPxatX5TjjEGZnLmbm8Ft?=
 =?us-ascii?Q?7AMJ6rrlpCEluMJldc1gFx2kaOrbJ7OPmik9HtQ2J989mqRjuQ831Jwk8YSa?=
 =?us-ascii?Q?uQye/xy1OhWIVxp/+dz943aLCSSpVNuCCO//cW6YQ+8E7mFhLQFBx4sD6y5v?=
 =?us-ascii?Q?oGphfjNQSYseti36RrFHDlL7qmjNF/C+7IR7I6O2hkaR9nnRQwnk0McwxXsG?=
 =?us-ascii?Q?dy/K5Fk/ERJhWQkVTiN7RwMP?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 059d1cd1-ee09-4f08-6d03-08d9325628ca
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 12:39:48.3761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYA2fAHlhjjMlfbrE2+Lg64/qhrI6rRV47dW78Y7G4teLNicFcuxZq/fBYoFWivrFFQe/6BBq2AfIGX1XpQZ3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7843
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_053949_847313_12A64AF8 
X-CRM114-Status: GOOD (  26.23  )
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

The RISC-V ACLINT provides MSWI and SSWI devices for M-mode and
S-mode software interrupts respectively. We add irqchip driver
which provide IPI operations based on ACLINT [M|S]SWI devices
to the Linux RISC-V kernel.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 drivers/irqchip/Kconfig          |  11 ++
 drivers/irqchip/Makefile         |   1 +
 drivers/irqchip/irq-aclint-swi.c | 271 +++++++++++++++++++++++++++++++
 3 files changed, 283 insertions(+)
 create mode 100644 drivers/irqchip/irq-aclint-swi.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 62543a4eccc0..2010d493b03b 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -508,6 +508,17 @@ config RISCV_INTC
 
 	   If you don't know what to do here, say Y.
 
+config RISCV_ACLINT_SWI
+	bool "RISC-V Advanced Core Local Interruptor Software Interrupts"
+	depends on RISCV
+	help
+	   This enables support for software interrupts using the Advanced
+	   Core Local Interruptor (ACLINT) found in RISC-V systems.  The
+	   RISC-V ACLINT provides devices for inter-process interrupt and
+	   timer functionality.
+
+	   If you don't know what to do here, say Y.
+
 config SIFIVE_PLIC
 	bool "SiFive Platform-Level Interrupt Controller"
 	depends on RISCV
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index f88cbf36a9d2..a6edf6733c1d 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -97,6 +97,7 @@ obj-$(CONFIG_QCOM_PDC)			+= qcom-pdc.o
 obj-$(CONFIG_CSKY_MPINTC)		+= irq-csky-mpintc.o
 obj-$(CONFIG_CSKY_APB_INTC)		+= irq-csky-apb-intc.o
 obj-$(CONFIG_RISCV_INTC)		+= irq-riscv-intc.o
+obj-$(CONFIG_RISCV_ACLINT_SWI)		+= irq-aclint-swi.o
 obj-$(CONFIG_SIFIVE_PLIC)		+= irq-sifive-plic.o
 obj-$(CONFIG_IMX_IRQSTEER)		+= irq-imx-irqsteer.o
 obj-$(CONFIG_IMX_INTMUX)		+= irq-imx-intmux.o
diff --git a/drivers/irqchip/irq-aclint-swi.c b/drivers/irqchip/irq-aclint-swi.c
new file mode 100644
index 000000000000..a31a7fc504d1
--- /dev/null
+++ b/drivers/irqchip/irq-aclint-swi.c
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Western Digital Corporation or its affiliates.
+ */
+
+#define pr_fmt(fmt) "aclint-swi: " fmt
+#include <linux/cpu.h>
+#include <linux/cpumask.h>
+#include <linux/io.h>
+#include <linux/init.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/smp.h>
+
+struct aclint_swi {
+	void __iomem *sip_reg;
+	unsigned long bits;
+};
+
+static int aclint_swi_parent_irq __ro_after_init;
+static struct irq_domain *aclint_swi_domain __ro_after_init;
+static DEFINE_PER_CPU(struct aclint_swi, aclint_swis);
+
+static void aclint_swi_dummy_mask_unmask(struct irq_data *d)
+{
+}
+
+static void aclint_swi_send_mask(struct irq_data *d,
+				  const struct cpumask *mask)
+{
+	int cpu;
+	struct aclint_swi *swi;
+
+	/* Barrier before doing atomic bit update to IPI bits */
+	smp_mb__before_atomic();
+
+	for_each_cpu(cpu, mask) {
+		swi = per_cpu_ptr(&aclint_swis, cpu);
+		set_bit(d->hwirq, &swi->bits);
+		writel(1, swi->sip_reg);
+	}
+
+	/* Barrier after doing atomic bit update to IPI bits */
+	smp_mb__after_atomic();
+}
+
+static struct irq_chip aclint_swi_chip = {
+	.name = "RISC-V ACLINT SWI",
+	.irq_mask	= aclint_swi_dummy_mask_unmask,
+	.irq_unmask	= aclint_swi_dummy_mask_unmask,
+	.ipi_send_mask	= aclint_swi_send_mask,
+};
+
+static int aclint_swi_domain_map(struct irq_domain *d, unsigned int irq,
+				 irq_hw_number_t hwirq)
+{
+	irq_set_percpu_devid(irq);
+	irq_domain_set_info(d, irq, hwirq, &aclint_swi_chip, d->host_data,
+			    handle_percpu_devid_irq, NULL, NULL);
+
+	return 0;
+}
+
+static int aclint_swi_domain_alloc(struct irq_domain *d, unsigned int virq,
+				   unsigned int nr_irqs, void *arg)
+{
+	int i, ret;
+	irq_hw_number_t hwirq;
+	unsigned int type = IRQ_TYPE_NONE;
+	struct irq_fwspec *fwspec = arg;
+
+	ret = irq_domain_translate_onecell(d, fwspec, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < nr_irqs; i++) {
+		ret = aclint_swi_domain_map(d, virq + i, hwirq + i);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct irq_domain_ops aclint_swi_domain_ops = {
+	.translate	= irq_domain_translate_onecell,
+	.alloc		= aclint_swi_domain_alloc,
+	.free		= irq_domain_free_irqs_top,
+};
+
+static void aclint_swi_handle_irq(struct irq_desc *desc)
+{
+	int irq;
+	unsigned long irqs;
+	irq_hw_number_t hwirq;
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct aclint_swi *swi = this_cpu_ptr(&aclint_swis);
+
+	chained_irq_enter(chip, desc);
+
+	writel(0, swi->sip_reg);
+
+	while (true) {
+		/* Order bit clearing and data access. */
+		mb();
+
+		irqs = xchg(&swi->bits, 0);
+		if (!irqs)
+			goto done;
+
+		for (hwirq = 0; hwirq < BITS_PER_LONG; hwirq++) {
+			if (!(BIT(hwirq) & irqs))
+				continue;
+
+			irq = irq_find_mapping(aclint_swi_domain, hwirq);
+			if (unlikely(irq <= 0))
+				pr_warn_ratelimited(
+					"can't find mapping for hwirq %lu\n",
+					hwirq);
+			else
+				generic_handle_irq(irq);
+		}
+	}
+
+done:
+	chained_irq_exit(chip, desc);
+}
+
+static int aclint_swi_dying_cpu(unsigned int cpu)
+{
+	disable_percpu_irq(aclint_swi_parent_irq);
+	return 0;
+}
+
+static int aclint_swi_starting_cpu(unsigned int cpu)
+{
+	enable_percpu_irq(aclint_swi_parent_irq,
+			  irq_get_trigger_type(aclint_swi_parent_irq));
+	return 0;
+}
+
+static int __init aclint_swi_set_virq(void)
+{
+	int virq;
+	struct irq_fwspec ipi = {
+		.fwnode		= aclint_swi_domain->fwnode,
+		.param_count	= 1,
+		.param[0]	= 0,
+	};
+
+	virq = __irq_domain_alloc_irqs(aclint_swi_domain, -1, BITS_PER_LONG,
+				       NUMA_NO_NODE, &ipi,
+				       false, NULL);
+	if (virq <= 0) {
+		pr_err("unable to alloc IRQs from SBI IPI IRQ domain\n");
+		return -ENOMEM;
+	}
+
+	riscv_ipi_set_virq_range(virq, BITS_PER_LONG, true);
+
+	return 0;
+}
+
+static int __init aclint_swi_domain_init(struct device_node *node)
+{
+	/*
+	 * We can have multiple ACLINT SWI devices but we only need
+	 * one IRQ domain for providing per-HART (or per-CPU) IPIs.
+	 */
+	if (aclint_swi_domain)
+		return 0;
+
+	aclint_swi_domain = irq_domain_add_linear(node, BITS_PER_LONG,
+						&aclint_swi_domain_ops, NULL);
+	if (!aclint_swi_domain) {
+		pr_err("unable to add ACLINT SWI IRQ domain\n");
+		return -ENOMEM;
+	}
+
+	return aclint_swi_set_virq();
+}
+
+static int __init aclint_swi_init(struct device_node *node,
+				  struct device_node *parent)
+{
+	int rc;
+	void __iomem *base;
+	struct aclint_swi *swi;
+	u32 i, nr_irqs, nr_cpus = 0;
+
+	/* Map the registers */
+	base = of_iomap(node, 0);
+	if (!base) {
+		pr_err("%pOFP: could not map registers\n", node);
+		return -ENODEV;
+	}
+
+	/* Iterarte over each target CPU connected with this ACLINT */
+	nr_irqs = of_irq_count(node);
+	for (i = 0; i < nr_irqs; i++) {
+		struct of_phandle_args parent;
+		int cpu, hartid;
+
+		if (of_irq_parse_one(node, i, &parent)) {
+			pr_err("%pOFP: failed to parse irq %d.\n",
+			       node, i);
+			continue;
+		}
+
+		if (parent.args[0] != RV_IRQ_SOFT) {
+			pr_err("%pOFP: invalid irq %d (hwirq %d)\n",
+			       node, i, parent.args[0]);
+			continue;
+		}
+
+		hartid = riscv_of_parent_hartid(parent.np);
+		if (hartid < 0) {
+			pr_warn("failed to parse hart ID for irq %d.\n", i);
+			continue;
+		}
+
+		cpu = riscv_hartid_to_cpuid(hartid);
+		if (cpu < 0) {
+			pr_warn("Invalid cpuid for irq %d\n", i);
+			continue;
+		}
+
+		/* Find parent domain and register chained handler */
+		if (!aclint_swi_parent_irq && irq_find_host(parent.np)) {
+			aclint_swi_parent_irq = irq_of_parse_and_map(node, i);
+			if (aclint_swi_parent_irq) {
+				irq_set_chained_handler(aclint_swi_parent_irq,
+							aclint_swi_handle_irq);
+				cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+					"irqchip/riscv/aclint-swi:starting",
+					aclint_swi_starting_cpu,
+					aclint_swi_dying_cpu);
+			}
+		}
+
+		swi = per_cpu_ptr(&aclint_swis, cpu);
+		swi->sip_reg = base + i * sizeof(u32);
+		writel(0, swi->sip_reg);
+
+		nr_cpus++;
+	}
+
+	/* Create the IPI domain for ACLINT SWI device */
+	rc = aclint_swi_domain_init(node);
+	if (rc)
+		return rc;
+
+	/* Announce the ACLINT SWI device */
+	pr_info("%pOFP: providing IPIs for %d CPUs\n", node, nr_cpus);
+
+	return 0;
+}
+
+#ifdef CONFIG_RISCV_M_MODE
+IRQCHIP_DECLARE(riscv_aclint_swi, "riscv,clint0", aclint_swi_init);
+IRQCHIP_DECLARE(riscv_aclint_swi1, "sifive,clint0", aclint_swi_init);
+IRQCHIP_DECLARE(riscv_aclint_swi2, "riscv,aclint-mswi", aclint_swi_init);
+#else
+IRQCHIP_DECLARE(riscv_aclint_swi, "riscv,aclint-sswi", aclint_swi_init);
+#endif
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
