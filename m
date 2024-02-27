Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B958BC5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 10:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WdfjTUcoWgExttwUaFzfH+4Bzl1ZWG/bKHAmdFcHnlw=; b=Fr+Z+8DGmdmU0l
	dbu3bVAY4tVPKNB64VYtE9Zj0un61pPUXxsxPeTMRQqw1U9rKZ2PFCJYZTP9E5pV4kPI9YUfITXY2
	iv3KR5zIZda6+Famdwvxa3hkVpIfBXmTjyoLfYdlTAgBK19uUfaNsdqlS+DwnWyNCMIYnuiouyZWf
	XroLp4w/XHom+mZm7Rj1p9qJP/YFh+U47P0tcQ+rsUmd8JNmPsNDnVMq8mfkHhGjbpJAyuNWO2u5P
	o09ijSxp/ZYv3g+n0Ey0EcgkM7G4uewmvQlAfeijncF+kJ1qgzdTEqSOipU8uhyk6WGvZtHQor0iM
	Mo8j2f5OBO1hP67ULQAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reuow-00000004lm2-3b0K;
	Tue, 27 Feb 2024 10:36:22 +0000
Received: from mail-sh0chn02on2072e.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::72e] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reuoV-00000004lN4-0Ksv
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 10:35:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nj1kHTRpxPmINbOZ4mn7vb1pP9ZsgIWDwGroxl5KsFwmLIJQQFzFUlqn4gwt2CQDZPV1aabMfMgOmjAIbtTUCYAj9HG+65Kn4uRnX5AZGzEn5L994V93mihl7CDHuag52tDXaJR02/tUOBifSBeGhx9jTjjJMV9TOJNTpY2tWhgpIRE5H7C6zJCzXCYj1lprQmpwrenF02OAdiNQ5rdY/x4Byi4jOADrNz/7OAJURRzYwHN96S1hGsq+sW2OJqPpZ8zfn1YkMC7fi4+Rf3uVHWGUnL7V7pSkWfhguXTPpGzGrGOUA5oRPemBOAtI7256Z+XDIrS/4vbfaWY671/CHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3wPv+43oNHBW6nH51yVeP5rZGEMEmUbqVl4PTOt6gVc=;
 b=VlGC9ByS0/jrujB7Aj4Q6hbi8rztr5n8K+PSDb0frrUFyFE9/fMS8su4FfKbN0WqAobTUUKuzUFdxAGGDpFvuhFhJ7vMXG57ck1VDQo+XA0fIodkF/6p7kEGrhImyGxLV3eqLNt234UFETlI5fsOemciuOCvtRkku+4PYJmIw/eeHlCqGB9dEJ5TMEpG6Rqk7EytRv/GzWzN1640OxMoLDMsB4xLVmEme5HByZzzxRc2pjKACE+HVRYkjL/Hc758XrHjWq1le1ZNEzejJOa8hDRXncMB2MEJi7XJ6i+CdVJ84MbiesUFD5Esjaaz/rH7EbcQXb2tKvlZH0ZVWdSKAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.47; Tue, 27 Feb
 2024 10:35:50 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::5a5a:fa59:15fd:63dc]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::5a5a:fa59:15fd:63dc%3])
 with mapi id 15.20.7270.047; Tue, 27 Feb 2024 10:35:50 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
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
Subject: [PATCH v15,RESEND 20/23] PCI: Add PCIE_RESET_CONFIG_DEVICE_WAIT_MS waiting time value
Date: Tue, 27 Feb 2024 18:35:19 +0800
Message-Id: <20240227103522.80915-21-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240227103522.80915-1-minda.chen@starfivetech.com>
References: <20240227103522.80915-1-minda.chen@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0003.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::15) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_
X-MS-Office365-Filtering-Correlation-Id: f0dd42b7-71bc-47c7-0175-08dc377fddc8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tWRlu1mHIrPcUojBzeJHB02INJmoztLVf0UB+lXHoUhRoR1Yb0jFABJnBEnyyJRArW6JqmZJGWAduDX00tSaaOxnVQuOhky67u1a0f4Vm0dQd7ipsATQ1NmvRVi7jTE4PGp+RpAP+48I5H0x6r9lvFPEm+KL9ru2uUJDf/A/FZB6IA4qRiHG7mEScD1OpcTUAPoGe55x6LzfKAAbED7dw8gH11AdJdb6CqgYNa7El+Etd00AKqSzl451HPftOxxLRbcj2sRLeIdOhyptEM2iQZM4HTWy1vkDNKIXZlkarqeueAa6FG+0CyYCxK1yYuQI7VJLA4fZEZrbNBoP6Arwe830ozuD0k2v7ZabZtYygXH9nMAzl4b5iQA5DNMt3FA7Yo2kUeeLp3MQ8cEvgZQiV+wugJ/iTqOMA1rinyl4ho3NVaKrA1Ndi4RAtCLzN/YIhSXrhIdCycNDG+CGGPpzlFNmzFAuogHThkp0vWguJXZZHfZ6xDekDTbBpCa6Yu8W3WsCDeanJTlWTICRZTSysOaaDP/blXQHgVRnhOSTNZfKXPzUzb6vabI6L8c2rwqw+dfLdlJP3zJIkaJUm7xwOdV0JeRq7XqQRIfgIjR3AS1b7Hq6702ElyKWnGr39Gbr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TmQSoJ7NSorc3L6UUifVFCmVW0oHF+of4Lo5Y4irWW+Uxh8CnKtXCd7b1TKd?=
 =?us-ascii?Q?NLbIJYCfZnhPHPHylU50TVGkaYJjcWMs4qKIAwZPagNWgly5w2tmOFmjYn4p?=
 =?us-ascii?Q?qzV+xcGMbEREfufrs304Yg2zayZtUZnQAU5ULPDbBQtNR/AQPtNkhE9LmV/e?=
 =?us-ascii?Q?fWQO3R3n/dkXzZIFUao9ppJJJGCjs9Rt+k6iPPHP7JuaeSGdEcPpAmSER/8L?=
 =?us-ascii?Q?WoZBGhgvZy2jD61LPGrv9jdDgicGSQe3z59J6rexxhl6BE+7jRaRfv6fHKio?=
 =?us-ascii?Q?cVkJY18FVMCgOXUXIuydBX9ZA0qStsDMzKPlUGO5B7MASHUbm5B2MVLaiQwt?=
 =?us-ascii?Q?L6prob36U5yE9y1idqOVH1k4gWCnNGLYcWMPHzp90NcZWPKVdiK/GLNNbo/l?=
 =?us-ascii?Q?42R7xz+xQDU723ufB/ElOFUClaxHNXzcr+hsjC9PjLNlW9iH+qw3EqLQ9PKv?=
 =?us-ascii?Q?MvpRr9Z7mNeF2VccPND32NUDWRpGwjkhqoUuFOUag9pXv2gbS8laYzg5hyFh?=
 =?us-ascii?Q?nds6JTQbXh1s9lc+DiZ1/CAkd6Nz4amstueP/AXF/OTQDwTW3SCofU7Xt6rf?=
 =?us-ascii?Q?yyuF7Svftmn4lU/iu6TPa0q7FNA0iRWBfDwrNirubPfsibmMmE+sc0Pms1L9?=
 =?us-ascii?Q?5AcJvA5h0xuZSSbaowVQ213Pi5Ud4zledzLbRBT0lw5PGrYtP0wG37LFeE4W?=
 =?us-ascii?Q?/URz0551XfaG451x3jRygd3DHIiUbf4I+3cFNqY4g/cmEbwQOYLX4svJpzoJ?=
 =?us-ascii?Q?dnUhjJ9FUirpKcKaTSCefhQPgBhIFOCqJv69dvw0O20L04esYe3pSw4rO6RJ?=
 =?us-ascii?Q?XNBceRvut7UwhFgG20mdP0zs352PTEZjkCmhIBNYXFDenhBQb8Ww/MtSsZFe?=
 =?us-ascii?Q?9igT7PH7o/YbVAkLnpTfc3JGm3cEYhsniDg7gop+zhLIxWFsO+qrXQDPozQn?=
 =?us-ascii?Q?NHWWy34JJz4s0Lx2N6pbVyoPzJ/wzQCxp5e+yTjERkjIaNqH17TM0mZjLez+?=
 =?us-ascii?Q?Ml4nQPU4dpjsRP0kbpFf/QejWVNWsk6/WuwnzPJaWhaL9jwDrSGljttwtFPr?=
 =?us-ascii?Q?Ugtr29Ep52M/c0Yxop3P0nMIDTPegJdImlGMh51sIuo5vM9ayEKwA+qDOXco?=
 =?us-ascii?Q?0569h3aWOyLYGzbIyfCFGcwI6YIbx+u7Ut3ObhSMlZG2pbiKXaBhd8JGtMG6?=
 =?us-ascii?Q?aQ9jeW8WZyjBJnODoW0c7dqIAQrH0enS6P7uIv8ajQ0p6y3667VSvZviW/yJ?=
 =?us-ascii?Q?Pug1jpzdEuKIt6iGgp+D6Bmedw82mjJ+G0+6EzS7hJXoZ3CQ7DBtbjgck17q?=
 =?us-ascii?Q?lx9uNWRGYPGKaDFNq0TmNdGSK0cUhKAHV287VS3w70mF7QtUAH+F+jCIUHvY?=
 =?us-ascii?Q?5xUWHgz3aWcqqkdEvM60fhG4kLMubD3CnR2lc0jhhVKNutrvM4g1f4H1yf1A?=
 =?us-ascii?Q?f12yc7oWHvl1FsYCvMQCU//4IM6CrkubPCepJFLoWz1RRpkPAHoSzaXZm7Pl?=
 =?us-ascii?Q?cssjgpAWQ5OxALgx0IdUW98NCBdAnVBthYjJwy5FT0obsHl0uaHmR+k0bRH+?=
 =?us-ascii?Q?k3tTwc9uxvklSPDAD4WCxMADXF9ZyJuqGEwSSVXaYFrkXB1r8ITmnmHg5aaN?=
 =?us-ascii?Q?cQ=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0dd42b7-71bc-47c7-0175-08dc377fddc8
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 10:35:50.2259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JMCPZBpJ1y/uvTGVTb01n9gyox7E5stq5yXsw7lLU73o3Tz4ysqZZMnnNcOeQHESI0sfvjook23+kRHUE0ZwXqrr/PioFZhfIIcBFHvql/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_023555_407434_78A389F5 
X-CRM114-Status: GOOD (  10.55  )
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

From: Kevin Xie <kevin.xie@starfivetech.com>

Add the PCIE_RESET_CONFIG_DEVICE_WAIT_MS macro to define the minimum
waiting time between exit from a conventional reset and sending the
first configuration request to the device.

As described in PCI base specification r6.0, section 6.6.1 <Conventional
Reset>, there are two different use cases of the value:

   - "With a Downstream Port that does not support Link speeds greater
     than 5.0 GT/s, software must wait a minimum of 100 ms following exit
     from a Conventional Reset before sending a Configuration Request to
     the device immediately below that Port."

   - "With a Downstream Port that supports Link speeds greater than
     5.0 GT/s, software must wait a minimum of 100 ms after Link training
     completes before sending a Configuration Request to the device
     immediately below that Port."

Signed-off-by: Kevin Xie <kevin.xie@starfivetech.com>
Reviewed-by: Mason Huo <mason.huo@starfivetech.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pci.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index e9750b1b19ba..06d76439bcac 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -22,6 +22,22 @@
  */
 #define PCIE_PME_TO_L2_TIMEOUT_US	10000
 
+/*
+ * As described in PCI base specification r6.0, section 6.6.1 <Conventional
+ * Reset>, there are two different use cases of the value:
+ *
+ * - "With a Downstream Port that does not support Link speeds greater
+ *    than 5.0 GT/s, software must wait a minimum of 100 ms following exit
+ *    from a Conventional Reset before sending a Configuration Request to
+ *    the device immediately below that Port."
+ *
+ * - "With a Downstream Port that supports Link speeds greater than
+ *    5.0 GT/s, software must wait a minimum of 100 ms after Link training
+ *    completes before sending a Configuration Request to the device
+ *    immediately below that Port."
+ */
+#define PCIE_RESET_CONFIG_DEVICE_WAIT_MS	100
+
 extern const unsigned char pcie_link_speed[];
 extern bool pci_early_dump;
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
