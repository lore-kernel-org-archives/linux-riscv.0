Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81057C47258
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 01:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T1eY0CH1VR99vkHr9yYS8sPpww06a8lC20giYQJAq2Y=; b=NKEaTRNRl2rrlM
	CrwvyeUvHkCfEwTrNMHrx2ierWu10Rdfiw7IrrWffh7Zseqf0PMBrN7tWrP+uL7zuAaEZAypJJW75
	EJ/cekqPfsVtrN61vWSmu3x/+31JhC6/BvBdgKzPmWyIdkA6RgF82Lei9VIXamEMyeJoUzFKLAl6x
	W0lnNkOFdx2lO7Qpaq/hnaoHmO89myXK1R6p8AGb3JuWzHPzU8437Uu7DYfaAVmiZ6u18UyM/JPgx
	lYNauyU0VcLZSwnvkq6+1iFH3glTTkFI45JorWYy0QZF8ifTA91R1ZH3IKquL6FLXnt2dYvKlyK1g
	RmGCv74iBRD2bBUJ3Caw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUG2e-0000000Asxj-20uU;
	Mon, 29 Jan 2024 01:02:28 +0000
Received: from mail-bjschn02on2062e.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::62e] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUG2I-0000000Asez-08aI
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 01:02:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WxrF9/9m2PB/gfjwka9TrQLwkT+ORyx9gmq3b7O4ZvCXDgMzEkZf8Ogt7A1IgsxnqOFWYS+kjuESXALV2A+UVB4YsEEk4FTMipztzLt3l6M/JuadPaSPs+MATH3FfGCH0a1FpfyYEBrwPtpPiq1qbTTcPvpAnn8AmWo9jMVZUzEoWccQwOkJroSDn3ElQRCH2mrHEXRJwcsgwVKknDpsbF9DKLk/wUV8znj0yxj/PVLM20CtFAxD7JBtQTYV7NiWlAPZcthZ51CdkkwTOmpcPhJw4g/y94zqa3FmRzV2GbNddABzPXB3WZ1SuUAQJVKFEB/EDE4dFchqz6cPWh269w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qP2Vis3RtKbGjNEiaOaeGcLrec2A0EyTP5CqIfMTsdw=;
 b=mx0gLEWqaUHP8XDwaELUGun7f4JMflc5Gn1vCZeNuzbBUVGymGwkk1CVxmzYieFrxDZPrGaTY4xXrgiOg7fsLJHsu7Cav9h91eOxFfhb82o2xGMVp71Kc9uMogsegkq8QsC0W6bfG/SvaZ7r6Ole/q8Eym4Im1hf8b65GWjSRIMNBl+jBVD2X24eoBruwLzP5VyhiSJPvZqmJwhS170ttKw892bpJkezl3Z0rELiyYUGv9FyTDxxaIzzfMKoINjOJa0HI/gMePKGzw3loL3TDLNse+bwEaTqDEb6wRwivMrAi8lkErpp2eTTnGxUMJluC2a4DCPOxZcRuXmYssFN8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12) by BJXPR01MB0552.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:13::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Mon, 29 Jan
 2024 01:01:56 +0000
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 ([fe80::1ea1:19d5:efef:6fc6]) by
 BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn ([fe80::1ea1:19d5:efef:6fc6%4])
 with mapi id 15.20.7228.029; Mon, 29 Jan 2024 01:01:56 +0000
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
Subject: [PATCH v14,RESEND 20/22] PCI: Add PCIE_RESET_CONFIG_DEVICE_WAIT_MS waiting time value
Date: Mon, 29 Jan 2024 09:01:40 +0800
Message-Id: <20240129010142.3732-5-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240129010142.3732-1-minda.chen@starfivetech.com>
References: <20240129010142.3732-1-minda.chen@starfivetech.com>
X-ClientProxiedBy: SH0PR01CA0003.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::15) To BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJXPR01MB0855:EE_|BJXPR01MB0552:EE_
X-MS-Office365-Filtering-Correlation-Id: 88dc84b8-79df-4977-42c5-08dc2065e3e6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YbHjR+sc7i34CpQ2zI2ZOAe0s3hjmz+e+hym6hw8WnZJ9et21ToxdIUOoaK/yL9EqRKUml1VEXAMBvqwkN/1pHkqeNtaOnW7OVpDiL1bkQylEjm80YUgqMX074Du1kYXmGo8FCidG2fh4EqTPOO2rwFy75I+X8/eK8VYTDr/s+GN3apYFySaV5mjpMzbU8TLxcTlvCikTZIn5zyyILROebmZrID3iN2/tYP8FaIEvp4+NBON5sBwACFrvPP9ocxLoOcRBVSxQIvkCu/tlmL92qzcRMekUcOsf+Tovu/g9+nlShZV8X+uiLJM6bsT6V9t/sL5zHe2izqcbkRzzAAKWnJOrrShTfeYIMr2gSP9VXgsVJT2OyPg3QgnL6Q0YxfdVWu0R8QmimcwIqZB6kWwi7U2ktvy5ExtLrj0VUq/bN//p2+xVBt6kWdcqEABdPQVzuPKIZ9rRX0eHP/2HaaKwoT69xVEM6M+57hfVbXFgCKmej7ki2w+uACHUtFCHxGotbY4NGgimuo0+GC9nX2d9lt9fBqwBhirlJ1PADOJ00JTgEMO2NNpfrUXI02Cn4fU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(39830400003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(107886003)(2616005)(1076003)(41300700001)(26005)(41320700001)(40180700001)(40160700002)(38350700005)(508600001)(6666004)(83380400001)(54906003)(52116002)(36756003)(38100700002)(2906002)(66476007)(5660300002)(8936002)(86362001)(66946007)(110136005)(44832011)(4326008)(7416002)(8676002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IeHav3IBZf61OPSEXfVIzu7GPdrxrHMeFan3o4SWQbw+9KUfgaSDgFPZc8B5?=
 =?us-ascii?Q?XwP2x7igWuQUIbG00Wip6ZuKftOty4+L1h+tsz2EG9ka1Sy+gpfyt7DuVUlD?=
 =?us-ascii?Q?LFCXi2KWuFxfZj9WP1tSaLSnuS+PqY8gc4HhoLHkrlcmoDvM9KiUtPstGQxA?=
 =?us-ascii?Q?XYk892DVmckMQy7IrCHHRt3b9zoY0Iq6g5CulO4D1cdMFXPlfl4G9mJI65Ip?=
 =?us-ascii?Q?BtJjZ6Xomp3vvT+S7kIAJAijEPLyOLnh12WBvlvq2eIEDYXalSrEGXSfcmBv?=
 =?us-ascii?Q?d1k3as6xn1D0dpupdfnD3gFH7IT91cdEOgrzC7Yi1jH+B9vWWT5XPjQRUGiy?=
 =?us-ascii?Q?tRHtnorhVdptLzBfM+9/7oartHFLongQkdIbwhawLmSWx+IDJUZLHSueDelr?=
 =?us-ascii?Q?rdnW6d1sULeQEWUaI5/7DXwPDXWyv9TnORX0SExziJjwWMkJApUByCRHdo5l?=
 =?us-ascii?Q?N4x3xUyQoc+adg4EmKeoRbf+mWkddht/HdpdqgHWQDODbksljpoCRVf1VdxM?=
 =?us-ascii?Q?e4kzg1p++K0EWsRXrGfjGohDn8yo2jIfmyTgZRFzO3L/wVOXamRX2KPTplP/?=
 =?us-ascii?Q?ckZxQUCFOXxxiRLFFMGC7kfDGdSWVZZr2b/fk+86tPz5q2jVG3KsKaRRNWzw?=
 =?us-ascii?Q?66y7HCz+yFLARbVmh8EalYXCt3p9hPicOhpV4pkCt9d4nfKj4Cqai3eaSAQh?=
 =?us-ascii?Q?NSJyAAqe/VMjR/PExNCdElAtNmh7Qtzp1J9lqHhfEmt08GoHvmwN5Hch/jW6?=
 =?us-ascii?Q?WQ8nXgA8HcIKj2gPQCAsmOpWWhGWj5hKliD5q+ydm5Beuhg2wp/C9Wm5GTC5?=
 =?us-ascii?Q?zwAGXK/G6RuxFwmkI4JxO2UFncrYezsFOfHY0ZTh95RPFocEaaVmzG4hZp0i?=
 =?us-ascii?Q?0j69tKI6Acn9OnDKFEdMXYapTcGlIVKiap2XNjaOwSrTyJ7dQcq3zAsP3EhF?=
 =?us-ascii?Q?gXZTmPYkAuX5y3QH8omoA160CXf92OcPTEmh225SIDTxfNx5NVdkFMdbNP5X?=
 =?us-ascii?Q?fWRLR076bA43B4DYQCTQZ5YZYjahjyCMgMxFM2WAHu3Dfdi0KOVdUdw6njnt?=
 =?us-ascii?Q?3pwCThTqTIbcRcUZBA+W0f4R9t6aAHn588OmC64eAdkQZj8Fb6n11MPcPHRv?=
 =?us-ascii?Q?t9vKmLzPygpKuqnJWwRPF8+MQfm5xST9FXvi9WOlGlt8JQq2BEDjKsxPqsTf?=
 =?us-ascii?Q?HogUB8C7xsHyXFc0SPLCQO+bAlbcTmMSJuCfx59qxEz/WqFdcnBA9a2XLtsF?=
 =?us-ascii?Q?z3g74LoFQYEFmN9sAdQBrj1MG6T6Is/SUMfzQKF1A6/Rmv4XQ+ONybGT87eh?=
 =?us-ascii?Q?9aHi/wfP5xeZ3x6goHozBoeVYyR6tjNu5UZALKYZ3LxVYmu/pFU2npuPiVMQ?=
 =?us-ascii?Q?Y/OGjriwSdJA7Yb2/GejFYK1c+GK0s8WkX1xmd15yyfVyEAMk//7zMyXLutK?=
 =?us-ascii?Q?22pfH49D2Mn4ZlaJYgF6VeuwLKAWskHJ+qKN/ZwjqaA9iL4Oj4sqQ4MCDMg2?=
 =?us-ascii?Q?N6vHdWe5N6gr2F1zCT5IHnzXfd/4XOsDoDXI3RWiodQma0EButr1fl0uE951?=
 =?us-ascii?Q?mH3zjNfDBWhN7a6QOKUvj4bqmbb1WZiwluXB5cmFir88sDQJNJwikGasi1ZG?=
 =?us-ascii?Q?jQ=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88dc84b8-79df-4977-42c5-08dc2065e3e6
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 01:01:56.8445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OgZjEArD8s2KbjCFBFyjnKTjIVnRr6DMyOIkFOCUER0gqZ4Mf0M7ticWh6F8VDVWpRg6ylE5vPUSsKtsLW5zNeX4dgdlbIpfD2stVpBVcjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0552
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_170206_257594_D91D3945 
X-CRM114-Status: GOOD (  10.42  )
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
index 2336a8d1edab..bd38b3a69d8b 100644
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
