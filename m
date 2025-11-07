Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761A3CCF9F8
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 09:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1yADIjWNw3Gt5WEHxzY4eYbN0SXczk2IzTVzSMEI66g=; b=sgVxu8q1Gwmhhp
	ouhd0PxVQU+a7cbhx2h1zj2hveF1SifsxeUnm8xEmzJwL0P6muxzWP/vKwcJP5XriEEBFfrFcw1fd
	2ItdB2qxoavBs4xKdN6Cs3vcV3MX2RlXkcHzKPwaiCl8rZY2SsTshWvzjF8WIMnlSBBrsOwi244lZ
	FA32qJZa5UYtq3z/yALFolFM+w3GV0vumgSOE6KikS/H2uhTo71OZU6/9+2E4KKVWd9OItImcg2Su
	HMJzZSzjYff/wY2Ts9xP3Nb519tRFh5eloLMRt4TVZDJ7CDZmb/zAow+VMrHmDgY1+yBc60PWmXSW
	j0ZhmTvGVuhFzlszTR3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJCK-0000000H1de-2e8a;
	Fri, 07 Nov 2025 09:56:01 +0000
Received: from mail-bjschn02on20710.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::710] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJCI-0000000H1bs-0BBl
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 09:55:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmMXpj9j/KG9Yhg/0KLKoDH1t7FkITpURFlis7Ai8qWGp77vtowgCWVwTs8KyAUfqIlePEDzU3EdCHyC/P+ZSFTfMxLI+Wi9evyx/fqUrBqLt6k5O4zSH9RNLH90YkfcSnJyU0f6/xNDtp4lUNertXrncnPOqV1nAHuS+7uHdlj64py7eh8M1t4InvbnqKA0qhJrrZ0pN0/VnS/hqxkTYbHgZXFZ+yI3Njs1ieSrhdPzuDxACqxy0VQmQ3lY9CCX0RyInhtDdvVNa5kD9fHdAqruwM9byhsUhKBcXSfHM9CP+lrr99CfAPF2Nu/U155HcqrSmp6zWiPsV0JpaMoAfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8n6SNZWksjhK85foVY53SEeSHR7VcGkpy74cVogcqo=;
 b=Qx6QHNPSm80RhhvhhE5OjaFfBc0vrGlhqX4KYoXpem9RE1kNnP18gY6FV+18fv2wW/w4ub48iG69/6BM0BQnZ/WXnlb6lR3aAQiAx5Lbpkx1t/F6ESNugkilHBhfglgeu7Tmopm+X8DSjeF5tXwEszp4IE8Dpz2CZUlptugojd5nX8uIyK0CdbN/ulD1tjLtw9vNKDOkZ7PmlikpPEvoBxX9g5vJtSNg7+R5+3sYXTUyUza7hyqHni2d+7g5rHzv77cJwh5J14WjN+5CmnzabUlY3aM2WcJx7ATxRsgtQvELgABE3y7Qa1WwCwdp+tPBkN66iabdaPQ5V4ph+GFoUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1305.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 09:55:44 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 09:55:44 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	E Shattow <e@freeshell.de>
Cc: Hal Feng <hal.feng@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] riscv: dts: starfive: jh711x-common: Move out some nodes to jh7110 common dtsi
Date: Fri,  7 Nov 2025 17:55:27 +0800
Message-ID: <20251107095530.114775-6-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20251107095530.114775-1-hal.feng@starfivetech.com>
References: <20251107095530.114775-1-hal.feng@starfivetech.com>
X-ClientProxiedBy: ZQ0PR01CA0014.CHNPR01.prod.partner.outlook.cn (10.2.0.83)
 To ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn (10.2.1.78)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1305:EE_
X-MS-Office365-Filtering-Correlation-Id: a92e3628-0ecd-4e25-84ae-08de1de3d13f
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|52116014|1800799024|41320700013|38350700014|921020;
X-Microsoft-Antispam-Message-Info: xobX1KTHuJgyWxGT9ZARs9M8zecmGOSRiD9Rce5lyMel6YpRBXdpsfJZcFg8IGE7YUV28HHbJVBJ4n7NpE9iRb3X7l65XQmuIDF7xbqI6hvaQUp0OPknf1iSIK9AvkzrTbGiNyhkblQfd/N78KzHmrsPEdjpHpR+QKia2IzsxCo8La5plyadS1W9D8fW74ZKR8yYKd/t13ciU3WgmYxGDD1TtOpz03v/+3bYGqKutR2Mzk4EwG4V8NKkJK9h2/CzYnyyg9V1YYPh6UOEZXjeCqISwCybxQaMsX2ViMRNaSEibqKDYWd6k0U8TtYpUYRut1a0jnufio8BhRFTLYn8sJcsk0rV9sAMvKhh1oH4wCPs/zfQNPsyrKhofOBVunQP43qt06Am+zJC8TRok1aEumDxHcfbkbT8OIDzrykPh5YPRIsU4m445FYcQ1/A0I+Jv4X0eHg0tFqETb9ZQVdXy1BPW94brwACL7ADeQnpnoW+oT1NXvm+6Qlvj8U7nLxUBtnh9DknhMpzDNyLSLBpnhvODvYczoUDJM9ZeGdEF0V0q+FozeKSmRGX5NpCUjndL3g3xpA1NjzUy4IJXAkP7Es6S5GbcmeGw0aYCT9DULo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(1800799024)(41320700013)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D68cgW3twNC6nf1BHuReoeS23fkaumCUalM04UgcyDQi4xon/oCMKQufravO?=
 =?us-ascii?Q?Co9RjMZlJTJFGvJGtKThOKLY/XNPp+V3zaxesHlEugrP5tBrFEoXThIoJM0d?=
 =?us-ascii?Q?bJgwWU8hlIZu6ZGjz4TIDqMlaK4Rp/aBKfdV+HJnm4kBXGHUhcI3K9RX8eig?=
 =?us-ascii?Q?YXJdWqK9N2aKU9BMvVWqPk77tcq/Dr9fx2nohqvuiHOurHazDJdjQigEz9vF?=
 =?us-ascii?Q?Sfvgem69zadAbQ05tN0nqIBDJ/HA+kXhHtJz8xpdZMXXoxwML+AayLsey3bU?=
 =?us-ascii?Q?RWOv+t1mKxaz5dZSDn+FgjWL2+s7KuELjxp5XN/5rOsw7/X9cKIzyISC0J9P?=
 =?us-ascii?Q?mIRnc78EdOhjr1s7XuDL1nkbmDc6Zq+K3JyQA++UY69q172aYBofeXBufNhN?=
 =?us-ascii?Q?jsVuZPWw4EFzlAW9hJzHGtmRwELBV1NhSSikA0YI52ru5ZHK4ep1cbYzKM3M?=
 =?us-ascii?Q?dpvESmqRYgkEGQG5Q8wDsX5BblLvGCRy2kQ6qM7yHHnVERSuMDXwJJHjeud1?=
 =?us-ascii?Q?/iUgQ/TGWLOnH3vmebDB2JQJ1eeCXBLqocfZ0z0S3fqhAil+gmvgIZPbSie+?=
 =?us-ascii?Q?IWZ+6hb3wAy628raeLNhFo2g94FRLPhPr1/ENNfh5eL57D6MWK/nPvw0kPbo?=
 =?us-ascii?Q?B54DFEY8rkO0+AfXVh9EyCHfKCZd067T5+oQX8F/JsWcBD8i4VeGC/6R1AK6?=
 =?us-ascii?Q?V1F6ccNgQTb8Wm4o/Zzu1suCA2AyXzSWwEONwtkEFiga0xLmL4Vbamo08pcD?=
 =?us-ascii?Q?+AybZqFoIMFPNiifOjQp7Al+89V+LYWc/3cvf2sEEgdBKutEWeP76tIwq3xU?=
 =?us-ascii?Q?a5+ntaEqgeQp+M5U3mtM36c+xx6qiWQ7Nd4j08hTk4B8xMckjFZ+9PMceX13?=
 =?us-ascii?Q?gWimkrGtd7o07bpGLVtjcPts9Em/LyttxgSUkxKbKUUwjNvkI9oGi1XROyzh?=
 =?us-ascii?Q?K/gu1brpuO5yx2vfmR09rHXcSJ2oUGLM0qcfq+SZQSAL95YqNHuzlVZrg+cJ?=
 =?us-ascii?Q?rbcCOOghIKjcud/1c7S5ZP8To10cW4FmXbO7UbBZTT12pgcPWLpFsQ+o+XG2?=
 =?us-ascii?Q?inJS8Hho1iCT+BrbhAhbX8pnUsNwNdX69sG7WVnV84S6ca4ujKRSFHasLLoe?=
 =?us-ascii?Q?wLR5fBLCICpwt/I0pfNHCAkQUG/xx/MfR9kY1AwlmRRMQTjm7nGPU4oFJR2s?=
 =?us-ascii?Q?QzuNhYzAP8grIu671cU12G3frKVLwPNXk8CWbrbNDm5HC16z8Av4jVdaFUko?=
 =?us-ascii?Q?j6u9EHG3qGQaP7wtetzZsp8unpUtc4UXbnthySYRc8opn/mIv7bK3vF/ic4U?=
 =?us-ascii?Q?C3BWNSdsJHY9FuUrxWhkyOp7lMrljUvoHvdsLsc5sSiAg5/zQ51XeS6YGNA9?=
 =?us-ascii?Q?lCnSv1fXeNL1MxticbEV42EsfbM+8XIi7/5cAKDXG5qMKcl5Rw1tgjqqFI0M?=
 =?us-ascii?Q?xFWvAOHsqOT6q3IL8+1vysIRSf4rxf59agqsTyQqzx0WtUQu3jp9g6HeyUod?=
 =?us-ascii?Q?1NAEGnhX+HS05SZycbpzgLpi8okJ9ProLthP3/NitGkTrO+VvBkPKDvBbF3A?=
 =?us-ascii?Q?vGNdNrqrjk0cy+F6yqt8jygTLXYiuVVPRZfeZzcFDSepuodHk39pgRBerDM3?=
 =?us-ascii?Q?2w=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a92e3628-0ecd-4e25-84ae-08de1de3d13f
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 09:55:43.9724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1j19WGXGnUBZ5eBZc8ax2cB2Xzl2dK/2JZmeMeOpO21I8RyVnXmOSC0azVkhZ55WKag48WKIGryMfWx2x5Xz8mcwmloqtDMFJp8kZVq7K8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1305
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_015558_081946_B29966BD 
X-CRM114-Status: UNSURE (   9.92  )
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

Some nodes in this file are not used by the upcoming VisionFive 2 Lite
board. Move them to the jh7110 common dtsi to prepare for adding the
new VisionFive 2 Lite device tree.

Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 14 ++++++++++++++
 arch/riscv/boot/dts/starfive/jh711x-common.dtsi |  8 --------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index dd5805ef70a1..cdc362b8d58b 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -25,3 +25,17 @@ opp-1500000000 {
 		opp-microvolt = <1040000>;
 	};
 };
+
+&mmc0 {
+	cap-mmc-highspeed;
+	cap-mmc-hw-reset;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&emmc_vdd>;
+};
+
+&mmc1 {
+	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
+	disable-wp;
+};
diff --git a/arch/riscv/boot/dts/starfive/jh711x-common.dtsi b/arch/riscv/boot/dts/starfive/jh711x-common.dtsi
index 809274625615..42b8f60725fb 100644
--- a/arch/riscv/boot/dts/starfive/jh711x-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh711x-common.dtsi
@@ -281,14 +281,8 @@ &mmc0 {
 	assigned-clock-rates = <50000000>;
 	bus-width = <8>;
 	bootph-pre-ram;
-	cap-mmc-highspeed;
-	mmc-ddr-1_8v;
-	mmc-hs200-1_8v;
-	cap-mmc-hw-reset;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc0_pins>;
-	vmmc-supply = <&vcc_3v3>;
-	vqmmc-supply = <&emmc_vdd>;
 	status = "okay";
 };
 
@@ -298,8 +292,6 @@ &mmc1 {
 	assigned-clock-rates = <50000000>;
 	bus-width = <4>;
 	bootph-pre-ram;
-	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
-	disable-wp;
 	cap-sd-highspeed;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc1_pins>;
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
