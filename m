Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C35C47DA9
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 01:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c7JVvuVtgon2IgqtcHN8IuKGLMpaEgLVVznr1K9K8uU=; b=0ghqzdMXljAkN9
	ruYxWX2N4XJn1afaKg0n2eMTSbDQ+9HxW9ITkvfCNQ2X3xo8g3oiX5ZVLUJsA+C1lFzlZNqf6IKHE
	IBYlqXU3FfsKySybjtJIxxHAVQLMdoFRREPot2U7wvS9k/kEesGQDERZMrfhQOoYI0qIprM49TGdV
	JEWoSF/I7N6xi7Y3dOoTicM6+hf/nP4fwmwhtVY6JjQok8QfyBtf1eqyC9oABRXSPADi0TDnUnnHP
	lneB+GW7HZQ39nst2v84BaeFfEqvqYbQGfiUOvjoIaEShanC5ww+Q7X3lbO/HqI2qsOX1F+owRAyv
	UQFNFIlsjxoaU+/hI23g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUG1I-0000000As3N-42Av;
	Mon, 29 Jan 2024 01:01:04 +0000
Received: from mail-bjschn02on20617.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::617] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUG0l-0000000ArXr-3k0N
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 01:00:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkOjHvzxO7w2jvpgdfoZlmviGz60hMBnVDuKinrExfQWAk2G+EdiQz8lN1rP2kYKYdgAaR0SVNtKZ5jnOFNleFWcqlN9/GiO2yECTHPog97fqtZkU3Q+xX4v4fbOrbvTGLwO2YgmRU0dXXC1T9OCuD4yg0ZadJ0Hf1wWi8aTw928/r/7s7PuJglXPS5onQYQm+XNKY7d7cLLgV8sijpYznHdMOQZyqp8ArKAFb4MDdXU+3s6VnH0I3ec09ZbAJxppXLRH39WQGr+kDHMMSDeI5CDobLpktEPAUA+DsuzOb8rJ/TktVHv/3PhksLi2AhwusiNw6Ac18Fh7k7wUZppuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=loSF85QfSFsTWg1Z4YTdJt2rwA9n7SE/EKB3f4Wn2eA=;
 b=FpYMDZKVprkMyTcdsTr8MxJlYuF4MWQcVB5VGFoy8cSevmBTWCdyyzSLn+y1AVB7fFlmslUzo8FVNXmL7ltgQxkUMOoNmt8UIs1qVeqfNLQvohi/oN9OyYQqS+OTlLJUe/e0+hSBwbsLQSpGifZzXjnmuZ8uRwPO0qsoep81XmuA7yoKt7kvQba0iJIWWfef5AnxBiygFYUzusiRSpttaXO01O0uzfuEBuz4NTZ6kkrBoW40jatzvjKuLAMEBzQP6+5Filxpe0GX2Oc5DpHvGOcuNbw345Y4tHyDbD07VSDMSIeT4uNQBH+YLLOsxwPwXa75NgFDKO1dCj9gUPixHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12) by BJXPR01MB0552.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:13::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Mon, 29 Jan
 2024 01:00:21 +0000
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 ([fe80::1ea1:19d5:efef:6fc6]) by
 BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn ([fe80::1ea1:19d5:efef:6fc6%4])
 with mapi id 15.20.7228.029; Mon, 29 Jan 2024 01:00:21 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>,
	Minda Chen <minda.chen@starfivetech.com>
Subject: [PATCH v14,RESEND 13/22] PCI: microchip: Add INTx and MSI event num to struct plda_event
Date: Mon, 29 Jan 2024 08:59:58 +0800
Message-Id: <20240129005958.3613-12-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240129005958.3613-1-minda.chen@starfivetech.com>
References: <20240129005958.3613-1-minda.chen@starfivetech.com>
X-ClientProxiedBy: SHXPR01CA0010.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::19) To BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJXPR01MB0855:EE_|BJXPR01MB0552:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b6c131f-776f-462f-76da-08dc2065ab28
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pIMkIlWw45Er7GEFnqxSMHOTtoU2Nawjek8h2fIQ9HdUn3slOhojXC69y3DaNbH0HlJYm0mlf3pt313zXOyVUFntGSu+o2ke1vsoXF2YZN9INRsI5OvwhLRytSFDxIO562GxivFCIGBEwM4srtQR0c7hoYjRE/nQBd42tHiKZBcQl5mZ1TMn5H6wALcTvyA/w6vPfrDd26l7RcHZC87HvyLej0c2F5I+A99/9IsuiGCh9JvXgIAOEmNtLKocfZDu10AhpQRAfjbWj4r1fJG4dTV5YqSSQcpCsFhoSULqqOCSKJGlJeAaYELfAwBdKLTV9aFzvJ9Q/0xTcCTjetq2a0iJDeYgMmLOaBGC1l/wvrDGWYQ2tKQKwlk9vzIqabliPYqCZTxW6U+7p3X3j0qrCXeWaO3vpfs7w0UOKK9QdVl+5eeefraPMddjRzjCgLE+4QPrHrzkRpaeg8VVUr9dRbScd/IsVjaQ8kqmXeYGBVbRDw+pZcjAPqKniAP003OiicdYtw/l93aYbluM5BjsKafcAVKUr747EqlVzjWb2RLt0fMSibv2wgLqoRU6P7VZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(39830400003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(107886003)(2616005)(1076003)(41300700001)(26005)(41320700001)(40180700001)(40160700002)(38350700005)(508600001)(6666004)(83380400001)(54906003)(52116002)(36756003)(38100700002)(2906002)(66476007)(5660300002)(8936002)(86362001)(66946007)(110136005)(44832011)(4326008)(7416002)(8676002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XP0gpC9AKx0cezZwnbE0TkvquSaYxDkYExgeiDql++vTWs2+fWDBW4PSRhkb?=
 =?us-ascii?Q?3yUDLAGR7i2SFORdDW2EiBHEZcH7zZJQaiqaPnbyZVx1o2mn4g30dMZFUqK0?=
 =?us-ascii?Q?8OjLuusfimoR06gUlJJ3x4DVqNyMT+WktJXeG8teHYO5SZbeNxPCFi+oSP+3?=
 =?us-ascii?Q?OKSvuiTCMztLl5A7egCqCn4T6+ggdq3pCA8K+FoRb91vO64dw0VmIVfhQXBg?=
 =?us-ascii?Q?DT2VP+mrAa3WfL74W3Jx6JNCqbPFwUp5mje9v4yv2E3CS2oStHwU7Vbyk7AG?=
 =?us-ascii?Q?YvLmAy9/y0uEcCO1gy1sBbXda0WU/5+XEYsH4WC3Z+y0lmEULbwD5tH5Gt62?=
 =?us-ascii?Q?OGznnvU6agluhe23x59AsCsuTlinMQcJsiTGlT9e6Qg19cDf194mZFogrlm2?=
 =?us-ascii?Q?SpGfBDS2KIY5NysvNmkLG+nARML0a+0zT0ie1ezlfqJ4UfcjUXq9mxwusfuq?=
 =?us-ascii?Q?KQfMR7mMxW3k1Rz2JkWh4vdplSqKe8uA2vOaTV6SWwc6IJGy1DGhtrLOVNSS?=
 =?us-ascii?Q?wVHXN47e3TY84VdorBS4aKVo3VWpcvUHXwIsBHMxlwZtYHz8wnCzWloAF8qQ?=
 =?us-ascii?Q?cyr1ZbEhBiS7EKJJMDqXLJ5ogX2mkSwN5Qxt6Mv5kRrVyRRKQCAIP2y+fJD4?=
 =?us-ascii?Q?QwSnbF4HVGaWrOO5hfmYtdKY7h3aL6nJp9sWrYBBnWZ9s6wu1LW9YwXV2B4T?=
 =?us-ascii?Q?A4zkaZjQY6FrSH+tDK4W9fxGBHYhzsQvyNUuyT/Cs2V6391xfdzR7Hw4kYKa?=
 =?us-ascii?Q?06zh4XiddKrZCxMu1qZfS1LQDU6MHIGsFe3YL4hU9SFYpT+k6b948lzkd9kU?=
 =?us-ascii?Q?gSGGwvNhdCh4BbrVwFSGLfFGjZ67Yph3Qkt8d392JooJW2CTJtvRbyj6EZyN?=
 =?us-ascii?Q?CJuL19bltYJdlL6QYU3lgsItkih6PK2SUnMLJO80g1+tgio+G7kjf2Xqdi67?=
 =?us-ascii?Q?kAO/u44Y9qmnJt8I02Le20y9c87CiyrgWfDoyaC3AYscoWkcg0ZwEqn38WHy?=
 =?us-ascii?Q?Is/CIPK7u5STz77Ai+cGUYMTDHkto6SOfjbnT8iJvsbPvsGgtAnM/yjkNwrY?=
 =?us-ascii?Q?sPKnbm7BFLRDWMP4B5ndWBcWSbV8Rwjuza2GhSq1S67vWYVtlJU1KmaxGwJa?=
 =?us-ascii?Q?u+ebIeWoLK2TR8PPHyazvOHRzlid8F6vK3NlEoE50NkuKgfMCV3/G3FNy7BF?=
 =?us-ascii?Q?zlK7/W9IBJXdoQMg6QzWmCC7mVNKBV99XUeDmDvwOgCQdtzv52+ESxD+iYjk?=
 =?us-ascii?Q?K7G5N6OXPufhLnm55b9VVZRjt6k8qftbpfCk3duXZTRljkxs86IG0lB2Hv/m?=
 =?us-ascii?Q?JdV6XrcjnRuxAGvFobd+hWw4+5A1R4KQ/tJxGcg1ch0epJPeH871OpHjAeHA?=
 =?us-ascii?Q?N9WrpeUXJ4CokmjKLPBNyo0dIfdTuE8vTPEMbrua6c7W+TvzGETCrwuQUq0/?=
 =?us-ascii?Q?A3o86W+LcIB3x1JYZpqHR1IH3LKLC90isSqHj0g8jGhq02RauEsttwhSfqII?=
 =?us-ascii?Q?wsR/LSanJth9AIKPUYZD3V+xGw4BP8nQNYILZYe1tCtTYofAbKfeoI0JSkPu?=
 =?us-ascii?Q?wi5CL7MCaDzPhBzwnPhl6KRVHfwuJZtvAssV568dAwmswuIA2Qlwd58EfHxg?=
 =?us-ascii?Q?KA=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b6c131f-776f-462f-76da-08dc2065ab28
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 01:00:21.6270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kfi1utL1CC6nfncxpkyiEIv7Up7WFufHzo1P8Y4QLBk27gz3hTx3B9aBxmDkcZqRtiXE6bEN5gVy8Eaoqk9c7PS2OuDE7X99iMIps/d7XYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0552
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_170032_116929_9AE02704 
X-CRM114-Status: GOOD (  11.36  )
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

The INTx and MSI interrupt event num is different in Microchip and
StarFive platform.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pci/controller/plda/pcie-microchip-host.c | 6 ++++--
 drivers/pci/controller/plda/pcie-plda.h           | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/pci/controller/plda/pcie-microchip-host.c
index bf5ce33ee275..8a51d3aa7e88 100644
--- a/drivers/pci/controller/plda/pcie-microchip-host.c
+++ b/drivers/pci/controller/plda/pcie-microchip-host.c
@@ -817,6 +817,8 @@ static int mc_request_event_irq(struct plda_pcie_rp *plda, int event_irq,
 
 static const struct plda_event mc_event = {
 	.request_event_irq = mc_request_event_irq,
+	.intx_event        = EVENT_LOCAL_PM_MSI_INT_INTX,
+	.msi_event         = EVENT_LOCAL_PM_MSI_INT_MSI,
 };
 
 static int plda_pcie_init_irq_domains(struct plda_pcie_rp *port)
@@ -960,7 +962,7 @@ static int plda_init_interrupts(struct platform_device *pdev,
 	}
 
 	intx_irq = irq_create_mapping(port->event_domain,
-				      EVENT_LOCAL_PM_MSI_INT_INTX);
+				      event->intx_event);
 	if (!intx_irq) {
 		dev_err(dev, "failed to map INTx interrupt\n");
 		return -ENXIO;
@@ -970,7 +972,7 @@ static int plda_init_interrupts(struct platform_device *pdev,
 	irq_set_chained_handler_and_data(intx_irq, plda_handle_intx, port);
 
 	msi_irq = irq_create_mapping(port->event_domain,
-				     EVENT_LOCAL_PM_MSI_INT_MSI);
+				     event->msi_event);
 	if (!msi_irq)
 		return -ENXIO;
 
diff --git a/drivers/pci/controller/plda/pcie-plda.h b/drivers/pci/controller/plda/pcie-plda.h
index 935686bba837..89172ce18237 100644
--- a/drivers/pci/controller/plda/pcie-plda.h
+++ b/drivers/pci/controller/plda/pcie-plda.h
@@ -130,6 +130,8 @@ struct plda_pcie_rp {
 struct plda_event {
 	int (*request_event_irq)(struct plda_pcie_rp *pcie,
 				 int event_irq, int event);
+	int intx_event;
+	int msi_event;
 };
 
 void plda_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
