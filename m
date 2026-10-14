Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB04BCC6B1A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 11:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dwPkiw5+GGj1FCUmBUzwG2+ab4g5wxCOvOwTouul+vQ=; b=xFDQA0r5Q95d5K
	4kPIQn6IEPB0f+vtn9jk1M3EJoGCkPbndTqmv807O1yCT2zz1CPI3QHimnDWVhxdZCc4BGcqBwqgU
	4vxbhZplGrBJnF0CM3oDXXUuFp9mDKhOrKFxzAUk9lNGU603UG68UAGxya7z5dSxdaanuUxLC4K/Q
	T9VYAbovAWvZwRLCzXTfqdPztW2JEOXxydTHt+loOI85kFtADsTLzaDv8wE7jtPolLGjFEw4hm5Sq
	ccL+LPqb9xocR0JoEMWZa9P+FV+tJYEQr2yJ9W2D9RSe0fEmaYaVxIgie5C+Z0v36FG7Mzj4ERSp9
	rZ93ajPLKRbQpMVOcdrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwnQ-0000000FHZq-1V4M;
	Wed, 14 Oct 2026 11:05:20 +0000
Received: from mail-bjschn02on20731.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::731] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwnI-0000000FHYD-2ngw
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 11:05:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nG6eoJvs2LaTZYoaExTnz8cRyphhe55/2XOSxlSe/vEA6WAObzPi3HZOQk2npxfFKN21CIYrXop28o//xQz2P0R0x0231KB+q/qPx+BEbhKlh2HZkBUu9zuFADWLQy+HoyBSbMfvxZ/t/+WjvuEG7QI4PbuaBpBu6tFLtvMjd/Uo1X6Mx6TCSDBA4tAqsoVGoz+KsqOXEnk58jbyacmHlKakbrcTa/Ax/atCllnrguig92r1HbNiCU7TgwP1f0iT2gkR3IKsfqn5mUFeJeVC8xcsQJTujYVvUbD6iCjq2SnclggsSph6IeNzVFNlNMl8SrfyI5fimvQZBXQrVHT90A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQ9Mywn1kT/3bNZ+rFNUWsnn9aJRdcaschXCQkYFCJo=;
 b=FxTRNMLlNVy2Hw1RqF4U088NPMf5OuqoTmQQ/pI1uPOzPuW5gc9QkVHWd0fgy9CCqNBDL6lDsq6oZssmEwYxEIEq6dTYc9WzXyuA3z0g879sl5DjxA5yYcPaMRIhPP+4fIr1sZVXIyjiYzpH+XxlDlwpDmmvf7Dbaf6kVd8WtW8zdYGYk16iT+RBcKz9e2jw5BeEx4q9zdJq3Jc5ACd7qsY5UM207DctPWXwh9tdxON10nSh7qwACh5QywPxhj7C/dD7m2bRB3zXR1mIHMDYeP+afbWkdIY+w+HRsDc8gch46ROC+Kqd+qtBVa/dD6dAfltRJEVIH5vhmSsW7wjf8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::10) by NT0PR01MB1069.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 11:04:37 +0000
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 ([fe80::be4a:d29e:5188:b37e]) by
 NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn ([fe80::be4a:d29e:5188:b37e%3])
 with mapi id 15.21.0522.012; Wed, 14 Oct 2026 11:04:37 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Hal Feng <hal.feng@starfivetech.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v23 1/2] dt-bindings: pwm: opencores: Update compatibles, examples and maintainers
Date: Wed, 14 Oct 2026 19:04:28 +0800
Message-ID: <20261014110429.52762-2-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20261014110429.52762-1-hal.feng@starfivetech.com>
References: <20261014110429.52762-1-hal.feng@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::16) To NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1102:EE_|NT0PR01MB1069:EE_
X-MS-Office365-Filtering-Correlation-Id: 24f99af6-a1d3-4a8b-da6a-08df29e2efb3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|52116014|23010399003|38350700014|56012099006|261009223027099003|260925022911599003|260925021911599003|260925021311599003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: rOcoBZsFtSLAuRTLLIlVZpL7r2veUd7g1Y7VSeXD8Tos46axOcKt6PDgQqcF210ePQoJ7/Ly1noZIlDbUmDW8iodW+8hvBRug+Ys4dR286TsTClLjYSkkq0og5ufi9Q4VqsOf6JJ99deAqtC1LiL9yUHXgzaR5INWBzY43lD8j7RynqilZxgmph0jM7z1gkWkCt5MWmvEpXjo221RW7e6yQOYg0zFc8jmlklfs1Un7QzVlVogxrwT9IWQnPzGWDRd+L+9AB77WrI6xIfvPbd4cLPbVSr0jPrKfYdJS9uMZLwgiDG4a6GqtESib6tpFIJXCjOVRn4bR0l+qT0JVpYjrUzSFrfC7gHu9NqB9j2jGiBeQAR34e+ft3kFrfRFpMbwlmYMp0AhSbsVsKzwubTVWbNMAFByEReN8c5FbajFT8a43nnegKnammeeJ1VCyxuzhwu1naiRtwID628Lw4RPYDJ58U0BHZHzocosvTqGoZdlAoXnJ0xPs3VeDJMNRWqfvtff3WeNFnlPELjo7f+p/+I3nF/vzS3XzgHH/b6drnheMs/7X5HcoAtXzB3asJe
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(52116014)(23010399003)(38350700014)(56012099006)(261009223027099003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jXXyO8FwDkUH+Xt4BzdPGQeMNhUfAvvJQN/dNtJxZYUvt7qL3c0YzdE6/ue+?=
 =?us-ascii?Q?G0NYEmNXbC6T6LQm7QOY52LmE0fB5/2fCds2pVFkraXJpXzZJtp7vFlWZjIC?=
 =?us-ascii?Q?CJFRuuMRa4FyokGqojNk4OdRG6ImkhquNYYIAqzAk47xnhz67KESJ+SiCEIo?=
 =?us-ascii?Q?reNJGIlyHZ60AlB2VMk72k51BMU4ngn8st/5SLH9iQ4KVrE/vCNeRFRZjkPw?=
 =?us-ascii?Q?GnZ00un6Q61qm17GXowepgKo4g4GLaf77Ln+ATYncUwm3jGFDCRMNTSGAJty?=
 =?us-ascii?Q?F9s389BNh9wOtc7SVTXrSwUzfoboLXO43iSs3Yceq37A8Ybg71h/vaC4FxRe?=
 =?us-ascii?Q?iVQCziEnDbNnZFLVZkWruyEHw/QtSsJayhlmFca6R/S1ZlJTjSyGqyDgrowg?=
 =?us-ascii?Q?+k8dwMfvMkQro8NT7kZ+wJtu0aCF65UTsw7AhG6Vran66FXy1U3AtlDKiO9x?=
 =?us-ascii?Q?Z4+kfkM9eBpe9OgBl0Vakx0t3zirGTqCACtEhv9K3BUCRspWXxnfUwTErUca?=
 =?us-ascii?Q?pTCIoNQzYEsl7CWb+F7qPVWshch/GrxRnGeNAPAsERuCHTHlekM4usElUDhz?=
 =?us-ascii?Q?s9wk30gOU1oRNfppCvSdF1aXTMFXjzmEqTh800Oc4tqA45A6qHFEPVNCoj1r?=
 =?us-ascii?Q?3gbvNwyFuhG1ekkWEWPi6R4fXiZy0gD/OLDhQr6fUNUccyqPOkL2s6RiPyBS?=
 =?us-ascii?Q?pCw+pv+ofIzLIOfH+lg1jQjhqcb/nAm6QZTk1ezARmURDHFh5djK+9EmT6wy?=
 =?us-ascii?Q?z2rfdc/aWDrqHigUJvtEqsb/GXe1CggTW7KeOfjq0kbNrKlZblxf6MKM0V1S?=
 =?us-ascii?Q?NL/1i6JD+ow5nIFpzyB6ESqdBh2VYY7hsN/c1GxKE19b2Ky8RgbmLXTI5WT6?=
 =?us-ascii?Q?jLLUM8PlneptKwTWCq63cFK2MLddLCqgcjc9ZKXu2OCv39wnq3Ka2uB/knvC?=
 =?us-ascii?Q?BRsxRCkAHMxKA6rS21ZX72O6pPpVsyi227KKz1F3LGMes+kYPBXp+6xnc4uR?=
 =?us-ascii?Q?ATkBiPqrEamJv5MaQ+wjo+nNjrcqInP/x4hGdF3PYn519qPmv4hO1CtZkS1K?=
 =?us-ascii?Q?3+eV9sHg8+Y1tvsL5M7FL2DL0L1f8EXG8bnzd/TREVqdC3jJez6ONNow7ASB?=
 =?us-ascii?Q?PPrcDtAKrgB45Eno/P9zoobe9wROjpok5WtZ+l5j/8PtBaVGH3sO5tnNW6DS?=
 =?us-ascii?Q?SEsBKta2kx6gni1yMojFyh1aM8SmWfGpN3PojCuvrKmTsh5QT0v1cCMnUqBK?=
 =?us-ascii?Q?NizrrBX+KZ/hl8QUUDF+pzUqTo4o81rONLpBgBE+RKCWa/44HGWdrd0v3hz7?=
 =?us-ascii?Q?VsGDmCzgokF7iRg09/bFZJrX4wRsbE0NzrcIQulzLszDagBinShdSG6JtFJZ?=
 =?us-ascii?Q?YdROSHqCBIIHxAF4wCKFv0MssZLvybKX5hUlwViAdD/08uX5ugTlb0Fhe6Px?=
 =?us-ascii?Q?LHgpU407IEihXwvRUJnnr3t22/HKmqYFFqWl/eZE7GMjq5/oM9u11Zwi1Td6?=
 =?us-ascii?Q?QCp3FmwSAJrXYHg7DhdQVqqr3edTSW36JcsrVAignkAQn3KcuHH++NjPcMDe?=
 =?us-ascii?Q?2+RdhsX7aRK4iWKSh/UyvlP5x3eHjz9Wd2grwEQjSvoBlAvoE39XMtp1qcEv?=
 =?us-ascii?Q?WKe130gFX/JuU5wF98UrHrpIovPhM77GiN2hJYZxCJzs/xxeC1Tz6B8KbOT3?=
 =?us-ascii?Q?qOi5wWj+9efm/jGTzvmOcdDijZgA0y4/t4i3l9dAIxbnrJmH/5+vrJDiXS5T?=
 =?us-ascii?Q?Dx/fByyoZ9GUivJLn/y8B94iYoyHC6Q=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f99af6-a1d3-4a8b-da6a-08df29e2efb3
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 11:04:37.2040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZkA92ncod+9gpa4aZBPPQCkP5+a0lsu2s2ceYFHF4DsEM4TgkURjvWhkxMgLB/hViEidvbTX/Cr5ZialSITiFdS7RxM8qweeh+HQdPjWlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_040512_735181_E802D08C 
X-CRM114-Status: UNSURE (   9.93  )
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

Remove the jh8100 compatible since the JH8100 SoC has been canceled and
will not be released.

Change the register size in examples to 0x10, since an OpenCores PTC IP
has only 4 32-bit registers: CNTR, HRC, LRC and CTRL.

I will maintain this pwm module in place of William.

Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Fixes: 2529085831b0 ("dt-bindings: pwm: Add bindings for OpenCores PWM Controller")
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 Documentation/devicetree/bindings/pwm/opencores,pwm.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml b/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
index 52a59d245cdb..b15468f97b59 100644
--- a/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: OpenCores PWM controller
 
 maintainers:
-  - William Qiu <william.qiu@starfivetech.com>
+  - Hal Feng <hal.feng@starfivetech.com>
 
 description:
   The OpenCores PTC ip core contains a PWM controller. When operating in PWM
@@ -23,7 +23,6 @@ properties:
       - enum:
           - starfive,jh7100-pwm
           - starfive,jh7110-pwm
-          - starfive,jh8100-pwm
       - const: opencores,pwm-v1
 
   reg:
@@ -49,7 +48,7 @@ examples:
   - |
     pwm@12490000 {
         compatible = "starfive,jh7110-pwm", "opencores,pwm-v1";
-        reg = <0x12490000 0x10000>;
+        reg = <0x12490000 0x10>;
         clocks = <&clkgen 181>;
         resets = <&rstgen 109>;
         #pwm-cells = <3>;
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
