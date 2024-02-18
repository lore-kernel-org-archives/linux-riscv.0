Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F87C4829E
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Feb 2024 10:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WdfjTUcoWgExttwUaFzfH+4Bzl1ZWG/bKHAmdFcHnlw=; b=dQHSlnEklifGqr
	l6Y9Ee1pxZtdxyg3ArLocsTJ72g032ZYvNNzY8xBDMrUEKGUcR6vlQxPK5yP/bGh5i/tXkaDf/Z1t
	6qyiITmmG0HMl4RGZ/g/56lfPT0OlQm6xBww1RL3Qkl6IZZtgVq6eeOwVc+ED8o6gRMOBa0QyZuRJ
	819/WEc/1niPopY9QxGIzQR/k2abSPcVlA07t0W+vgYS8IhCpEbLwUy+3QBF7Pg2uCCdwdT8yaR4C
	NnNQ5Zt8VKd7nMFrjoBgugGvPrPfriAAlGQpVoPc0HQ2GnXAT9xVSRswl1Gdk1Fo27APDz3QqzZGt
	DFSzMp2nSGuUYTIo9Vjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbeGt-00000007UDU-0AFM;
	Sun, 18 Feb 2024 10:19:43 +0000
Received: from mail-bjschn02on20731.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::731] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbeGq-00000007U9L-1kO4
	for linux-riscv@lists.infradead.org;
	Sun, 18 Feb 2024 10:19:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+qYnbcpw3Hcrq2wl1V+ZiY+F4gLF8pUt1FS0rktEfaJdXWvgclqPmqJL+kUIY4u6iVHMkwDbYQZojf1yhUgF3WZNosDx5h72xuA2XRw75MUrPE7PAdlArJYHnm2Trwpjv6UJYkulv0aGtngP74dc5CUewrD5P677kxeI5OpRFQsXFN+8zYPKEaXUDZFpfVwYohzHTEMJcFy2lmVYrssEGVmzTHV60nbvPqTSiNN9Qh7KiCiPdDnhcPWX2Q2XuC2dpCg0nlMvlr+tRDYIXDEnZD+l8M9MKiGrhuhxIYlVCD1Mo8i0KCNzqkL8JbGgzOpo4uV0V27IA5njvNwZj7X0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3wPv+43oNHBW6nH51yVeP5rZGEMEmUbqVl4PTOt6gVc=;
 b=Q8FvgReBS+hsdnkJ4x9oxCWT+aEEpgZ6PkBR6AZ+S0TiG6cPw5AgdJgSF0bnU1tSh/4fVbQK3g0Y5eyr+6J+bELWqOusqjynLKswtg09lnevMzkwLsclZx+o4uR6/CaYwkgX7aZNLy5jNwEGj98BdlsBLeIavENmOOF2gxiEwPXW6kBr2+kwOXCDyUhp4qC5K/BH/k+7v6/wXXsk0R3DdUZH8NH1XqOiSXbMtQXmvDmq/s/VQCzAUhMwh8T2MyAAa/ozCjtq4I5DEALPqRcB3nGjEeVaFI1g2XTz09e5B1+6EX4uS2gkSfWGQ/+L/OB1Rr4B+0xItip/TV5kazrMXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0464.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.50; Sun, 18 Feb
 2024 10:19:33 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::5a5a:fa59:15fd:63dc]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::5a5a:fa59:15fd:63dc%3])
 with mapi id 15.20.7249.051; Sun, 18 Feb 2024 10:19:33 +0000
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
Subject: [PATCH v15 20/23] PCI: Add PCIE_RESET_CONFIG_DEVICE_WAIT_MS waiting time value
Date: Sun, 18 Feb 2024 18:19:18 +0800
Message-Id: <20240218101921.113528-5-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240218101921.113528-1-minda.chen@starfivetech.com>
References: <20240218101921.113528-1-minda.chen@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0010.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::21) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0464:EE_
X-MS-Office365-Filtering-Correlation-Id: b10fc9eb-a397-4543-27da-08dc306b19f6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HUdKA9AzBLNQkjbgL9DM+vmBYsZbpl8lQvMWgiChTfOpDagTk1NogdInkKew9hSuBbyseNzlpHPq8JaQpYjuet5iV8mjdW1Zmlk+CMcB9xhKuOsoka5WE64HSARIur8NRFMSD9j1Ruzko2m4jCfbEHA1Cb56/WGpsSI/cFE6+1+ONejr8Ziydk09mZz7G9d3r6Aii2si1xipijApM/s3EgVjRrv5YBwGAerQ/YegrqtP01T9L8qwqcjb2bQdMCWVfGwlWeGEQgh4ybLSAeEyIwamnt1BeZlGRgef8WZaD5ATBWlX3FUb4RJalXOk35p2n3TKLrrffjcpyxpavYhTJjpLphoh5FGFx/OBN/EWJQHIidvhyhYmfwEWreuGtS4laLZVRPkE3kJl4pD++9i6bsVt9xj0wOfsGNhn2Ytg6T+qVuJkTVnX9c8ysGb4LfUKAAGXtzS5XjLgpLvlNrm9mKjBOuoWmS4srFwtWuFzhtmBP+lvy80zi48xB0bYPQJoQdjHYhcf787VdfuAkAqUyKbjj5Wl9EDzK5n+0d2jNgmldExyb75iAqmASIpmGfNO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(366004)(346002)(136003)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(86362001)(83380400001)(40180700001)(40160700002)(38100700002)(36756003)(5660300002)(41320700001)(38350700005)(7416002)(2906002)(66946007)(4326008)(44832011)(54906003)(66476007)(41300700001)(8936002)(66556008)(8676002)(6666004)(52116002)(26005)(508600001)(110136005)(1076003)(107886003)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p4+s72JPOTrLhuJ2NJPaYQXRvLiHBoCCRoH2fO2zJACzD8j/ROJcmZ1oskbV?=
 =?us-ascii?Q?KxY09Crl8J2DdphQmt37qAFCr4OB3LQLIvXsLfQjYQYvvITAgPyHvRD1nWby?=
 =?us-ascii?Q?jnAdDTZ2HcTFIy+/ljsnLw/4ar1yXZF3SOG2JiGy3u68nM/YZ2wJDr+bveEv?=
 =?us-ascii?Q?Ihko3xPmlmjO2o9D25gukNcnkmDvbAuQm4uQjsR9LB3P7bjlRrIfYke72PXo?=
 =?us-ascii?Q?OcoO3pWCO+MBcNpU8hddHbCE4HLiYPnehCSCDmbAl7ogoDrCWg2/2+32xG8p?=
 =?us-ascii?Q?jWA7odmmuWlQl2WzUqg4lBr0cJHOTBIchgc+EtlY8RkPn7r/ZE1nD2/Q1ulS?=
 =?us-ascii?Q?6hZgq//RYDL6tAm4CZsJyu/Dmn5IPnEU44IdL2PdGtU1yXc8GMRInkvgFstN?=
 =?us-ascii?Q?dbsmhmSy+WZweXslQO757wt+4IvOcZpXFCtoC2G38RZkLeCQX+tQIPMXeD0U?=
 =?us-ascii?Q?w/E3Wr+b9AYw3KE2wRD94BJh7xYBd124OTjQ3TsdmU9d8CsLPGjJlUxgtzvv?=
 =?us-ascii?Q?Gr2jfy5xhyOVz5j4YnKPQof7gj6jRW4QRi8PzhDWoKykwJDf92fWHzxtOefV?=
 =?us-ascii?Q?AfHJe86YsZgPghQIH8X/xEIyr+YjVUZYfH+O2RHmgbOHtcXghvWJZJHx4Q5y?=
 =?us-ascii?Q?oWYtolZwUBWbDyTJ1yhH4s5eb4i4fLhg9nrQawWG/bDn+9o3dzlWvooloxH1?=
 =?us-ascii?Q?nGbU8HvVogJZny7+ibi9Zrq2r+v4vfrVU/IMi/yCOWs0eX3oaydrB/eqJyDL?=
 =?us-ascii?Q?lp+sJHSfypLnmOK6nGpPlyy8aasuQqANNA7ZOJi03ArlkQWSl5k3K2m0JFlj?=
 =?us-ascii?Q?abCgq2jyJbmdhromwomaCD+HkrfT7yAjNbBQlzhhJn4ww4OC1pBXQM4Ew3JY?=
 =?us-ascii?Q?EMtn+SsNzjA7852o/RYrDWsyc18IAGAaRGdFG96U6g3fBjTCca/iBOVVC+iS?=
 =?us-ascii?Q?obwRBE+fYP3B4HS+D9EeFVUfMQIDlziv2DN9HZy+R2boCiIeWzndQttR+zOk?=
 =?us-ascii?Q?+TyQ51mtdt/77Odk5+LyiQBc6dd2rpapTzs6AXAA44BI8AWYRQrdP1LjOOPo?=
 =?us-ascii?Q?A3JcZ9/QF5yReAI3aSCzuUIly4+aXgPLK6K2oyxmIAfqOYx26bb7omiGpG6J?=
 =?us-ascii?Q?sKZzxRQ9a46LalyNzDD3//FuFJjXTwrRy7s3rs6v0dTUITvocb6K/q1/hy1m?=
 =?us-ascii?Q?oTYRz/KBCzifFwnTwBOlyP1p+X+x5NklQK/DBLW2oVaCh67MMGzoIW88UbbU?=
 =?us-ascii?Q?Hr61IfWOKxh4DXcHCNl0KQSi41egPYGqyu/4qF+gq28njU55Dp6nSnhMfuYf?=
 =?us-ascii?Q?UeLjNm1NjDTzFoDQTBE0uBGRIpkCvb1WCb1TYRn61gBLozpvskLKK2idwAyI?=
 =?us-ascii?Q?eSJfPGRAk6iT84P0Gj3wt+GvOHODLxGXmK/RoOnDHO37DRQer6D4ahJ522fZ?=
 =?us-ascii?Q?JQgaFXTv59ZURR4YfMBOny18qaNR8m/auiUdVYa5B9DCVeX6GwbNIsHUhXrU?=
 =?us-ascii?Q?9vyJNFUjId13SLx9mwMYP8yVK7PfrFrIN8Cb6EC4oRsMqCVbVtP7dXgOAOnm?=
 =?us-ascii?Q?XCR4jKF57B5fHSuq0cx7iJ7vC5l649HsT3wJGYaBaiX0De9jptFrogbowon5?=
 =?us-ascii?Q?Bw=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b10fc9eb-a397-4543-27da-08dc306b19f6
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2024 10:19:33.5962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5bTzUOZxKGdAeZTUPWb0P7RgSHd+cic4bpwwwzDzFUQdmHmN0MBZs89x89x9HMoQNTg8z/uYkj+0NTmlOxpLMWYEIowvPYIHZvzvos8Yhfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0464
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_021940_538770_5C6CBB39 
X-CRM114-Status: UNSURE (   9.79  )
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
