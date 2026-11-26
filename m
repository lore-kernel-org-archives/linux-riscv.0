Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF385606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 16:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iBXmGeVz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kvzGya/S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EQHSsyin4jarGIVz7SrbXQCqSMSj2NhZtizdb620b4A=; b=iBXmGeVzm/w4F6CT8JnuDBMuqr
	903VFBw0xkTH1V+cpPwcdDjsSrfpzpfmafQrOP2guJIBJbu0a88T64DzWccGSE7AjWJ2j/f5qavJj
	1DcBNzEVjjLpUtziYdBA8xSkehYLKXIv5ES/2mohgN12b0QthawTADtyLK5yU+huqW39cknwe9qQZ
	mOE7b9Rp6jMqZYqgtQcRy1A9zZNloxCFdLPWH3y15CJqqmbOhse79i31dkQqOgTTAP5O6C4qTWbDP
	FA0du71mz0dBPM+rHxIHDiEILXf+rdLcoepJ8MI3lnTzVR9hZdKdqGWRnSvgooEta5oyFirVaLgwM
	wVbp9pzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcPs-0000000DvP4-05RM;
	Thu, 26 Nov 2026 16:33:48 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcPl-0000000DvKF-16oq
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 16:33:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INS02Ie7g55EMxYdAw95e7ObPlNIWZWKZetg7a3bsm+pDKCR1yxE/185aM4F4CEpjW64qv5DQy/bSDGCd3aiQPIi9xaVQaDg5SaleouwyD3M5AC0kFPy8RmN6gmqhIoWQtIBtXWuU/IsQ8JKor4m6XBGtXfs3r7W4faRUL2iq3JwIi9/2mjDvC8bxNjEraHHtpsuVc/Wdepe7t1Y+Wp6sljUlnBl4gDCCInYhjQYJpSI30RYzwDRoqdqWnvgbuwzV6ZYIgiTsWM5q6eQKxNoDlbCjFwe9M5kZvG7gkJZz/1LbCOR4RUQPAOuOVK+SLUDXBM03jAe1ZsajQZ5GfIzMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7soUBChG2eorH8MaKZzLxtkNhLd/s6s3Ma6CXM0wbKc=;
 b=k1XxXAr4o4WbzY9GMnMEx9T/Zvb6pvRbeV3mjRU2ZYI6dkpVvzE47wuJt97n4KGO5kJOcPF5tZOniSVzMJQc7ogdwir0W3IiB8Sc5A0DS9nx6624qus/YGXmi+axcNNuqCClLjHSeNCPhR311dve43lwwKcDRwMYpy+Y2Ycy1ofx+559yUa0bE94pFKNudqItklZF7DmmfbqrFeOXIEM7scHpXny+ekKbpPGp8hyO/i7y1q5EaHKw2T5HTX2zDTG8Lu0ppTarYjylelXqGtSN1VYBDgwAKSKJydxEGO/hBIBhxAch5Esl9FtSem3y88n0BE5pZZLsuTlt7+dowIYHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7soUBChG2eorH8MaKZzLxtkNhLd/s6s3Ma6CXM0wbKc=;
 b=kvzGya/SYoRcPeYwTibnHEzV0DPzm98lv1NUqGJ1KC09FBs5BEALaTK1SZDkjDOxHPWXkt/MQtWpSRiM+uLMqxwaeJEoJYQz6/QWHXeq/YJXqqng5hcEXh/dKqlQxbLMnqkDIc90kCVS0UpDJDHWERUAK1v1STsDkZdUy8hO0GlSxQLyShCL/hxtp1ZbrHeY+amRzkxvt3JwRyMaoTtq312Kdozt27EbhI6cytnXFiHGKapszeL7/J5Ff3nBQv/ZDC9UVabV2umc2Xk84rGZDPOKDoAT1zSdANuhD5TFhbNpK+nZVKS+Qwd6vVBHJ3zuiyKlBkON8tYooKcUBEawkw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by DBBPR04MB8009.eurprd04.prod.outlook.com
 (2603:10a6:10:1ef::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 16:33:37 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 16:33:36 +0000
From: marouene.boubakri@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radu Rendec <radu@rendec.net>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Subject: [PATCH v2 8/8] riscv: defconfig: enable OpenHW Group CVA6 APU support
Date: Thu, 26 Nov 2026 17:46:32 +0100
Message-Id: <20261126164632.978624-9-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
References: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
X-ClientProxiedBy: PH7PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:510:339::24) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|DBBPR04MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: 063e69e3-ae44-4af7-ae6f-08df4bdb04f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|19092799006|10067099003|56012099006|11063799006|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: o6McgzDB7OD/1ykkx7/GDeM34Ui7c1kZcODTJ4nxdrNltqVaiD2adqEhXGdWTdf0CMkGruOlF3V1FI6HkQfaLokRU+Qj8I/bQvE8B0/9dzVaTYJItMd/eKbj0aiPRSIVSYHX7M1GCB7EkmUUbezID2dfWkm2JmMMT5DLVVQ0JEaG30nJDg9CQgZVwR3psO9vA0tF6mrRN6RsWkIlulE9ZA8KTWgUzDhPHhMgYdq5SLSRy6VVgM9px5dziDt0uYKq+BpHW9SuF5f7yPFUAxim8jSqp/fEhk2o0GCE1CkZSoOXiE/zETD8SHBcvgnrmIhfvBsQHfLnuk8gYFe7srCUf7cMHkODY/K7By46e9Fx1bVz56GR8DEErzuAiH0BeyV6g5uPn7VuWpGv/HE9SVRBl/zXUzX5rtsqgVo1NiuKTjIl3ASdHmvSzTJx5I5eacRYXCu6FiqfhBb9DYwcs6o1UsaCIHRibkDfkP2YU/EO6ktisA77e66Na7eC11SwqG16TAc3SMh/a8/B2PoGnFKvd7FQbgE3iZojsoXbYJyujmYQluVLZeHtj9SwZg5rmI8l9iLXo2HY8UiR75W7H38SYyrbu8WtRpvEtAkH1DoHCzhAZdvDpsMeY8cJYv6IvycBO71do38/DZ2TAMGgfzm5553G9L6D0GiEdACsCaMWx9M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(19092799006)(10067099003)(56012099006)(11063799006)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U62xplFZjnwIGVTibgfNvuYGoxZkOWGhi/eptGnXhFcTiUNXO8OL9lUYr0kj?=
 =?us-ascii?Q?UHE5lErVKTcGXyk+07nBlcgM16OIoSFITnxMByYscrNmkkbQ8K27bh0yjwJQ?=
 =?us-ascii?Q?pJcRbavRl49roDp8yM6NvClEs6h5Jht8w2wyjvV/fVFwJ9KKtfD4huDWWiNJ?=
 =?us-ascii?Q?HVLi6HYadkrLchx4vIyltzehqMMbvltTF8kZPnqZMKjwwKKwJcqJlU4QhAY5?=
 =?us-ascii?Q?HJv9oQ4TITpXnybvNnlHOVh+l0h7QCZXLOR6+XtEUldm7EtVMUrOPmmAROvN?=
 =?us-ascii?Q?8MVkPQLeAlVQAEddqWPt2jeUFJgfCjNCPLOMVbnhe6oMpm1Dsbf55kJWqyyl?=
 =?us-ascii?Q?ix91ildugBnRdbGm1IKgdRaYjrlIJjgCh6FfNFcg3OkYr/QmeSc5Q8gPGuPr?=
 =?us-ascii?Q?Xu0/h4nzMpXPqn5E1oQY+qy+lXphE+nrsCl1AIpioVg32IQqnd1BGrOJyDos?=
 =?us-ascii?Q?FN9tJbWvZKdT7bNOb3CxyQHHLNfq+Np8uS16UMwOjhV3c5S2cbzbcl0MXxl+?=
 =?us-ascii?Q?0XlC4mwx/PviFSt6t3wBOLYrGJOs0CHPOeck+FL7VmQivj/gl1h7B+fS+g7o?=
 =?us-ascii?Q?jVQSXjd3eDq1pBBrmPGqVK1nSoVhaqK7NO3UQtWmHfBxj0lTXvMgxH3Y8LhM?=
 =?us-ascii?Q?38whjzG20g5BHG8F7oJYQbSwfdXVVgFnnD2Bq7asclNL1BzZD7tUY2byrFv5?=
 =?us-ascii?Q?xIYoT7TnC0KGt7/PBpymzGnqiLQSNPOS+CemWz0jg4ggOUwOTDi6unDgNMkY?=
 =?us-ascii?Q?Ry1ycO81Bxta+mvz4MqLx25UkbfDZI7ECN1obWvYe4KNOaQwUZsLn92s/KN4?=
 =?us-ascii?Q?bSs5nNOAxRgZaqMuhE5cyJLOj9wSfAfiLQkOa7z/oKk+LNZL1FqDGMq/14KS?=
 =?us-ascii?Q?dWbaqSUv9EKwWdO7aVjVFjpp/buyxnvvvfaUVtlPebhsQOr1MHVSqem8gFAg?=
 =?us-ascii?Q?jvai1MBQT5rlOVLHYkh9ZEPOZ2RS+YKmTjeJOibCzjr89FWnZRPkMT5ixZ3x?=
 =?us-ascii?Q?Z1pAnrpj1qAKPQcM2snxLdgPBX5hNY0pYjZa8wadzEaB3rtbQiCHmUGz8QQq?=
 =?us-ascii?Q?sK1LkY16kdJAeSBE8UQsIOEYHdKBuvxY5SYM+CkTexh4r469hymIqL0/363c?=
 =?us-ascii?Q?OhSy3cxTImio659SNOzCWr9f7daKZSDIwYOFiV+EanAjGq6rWWaGlLU0OWfA?=
 =?us-ascii?Q?qM/KN5Dk3LzEOYAgtnc2xIhTEyQCNI5TfbixtvIjptgTJ03XG2lMqkrnB+T2?=
 =?us-ascii?Q?k8oWmlaFl4wGpoapcQ+DlLbuIeaDbCcEfn/f7za5Au2NeMTlpRV4dQ4PtWSy?=
 =?us-ascii?Q?m3xpXxwyg81Q3M2Fuy0BinK5lUrCwCjG2pRG4jKzF19Bzzhqe9t/n87sUFOc?=
 =?us-ascii?Q?0IItzOwlOF3//acu49GcpCuq9E/2pRXRqx69r2+G2OL8sjaOnGhFVLNBXLQ8?=
 =?us-ascii?Q?Eeyxs3b0MwYrqVEukXH7t6cG8ARAIw6+VwIQTRxb1SpqPzkvzREwjqRgrFAT?=
 =?us-ascii?Q?Cb5kFaryk2FAV6EGXN1wTFREvy9cZIOJvFSAdOm+QlldAB0P6biUoAbVRcUN?=
 =?us-ascii?Q?F+vnSDzQnSB1p5ywLidQyD7vo7LFmT8L440SQ3jLE8k+5v+Tl8xCQqg1Ow/s?=
 =?us-ascii?Q?WGAOSKSDxC2YD1cjCCyr+lRAOV8q41TW+pAYITK+6lf2yIK1k9nGnXwGXQMd?=
 =?us-ascii?Q?e9F+GHiqp75QCEDt2Y2QpYe46YiBR1iWSMxObx5SNjVlXloBHlKbAiqB+tsE?=
 =?us-ascii?Q?Zin8T4DdOTw2zjV58mZ5jtvycZ8tdq86bgJU06G2WzMLvnxVlOywGl8RXb2j?=
X-MS-Exchange-AntiSpam-MessageData-1: Rlg8dOJFfKVn6Q==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 063e69e3-ae44-4af7-ae6f-08df4bdb04f8
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:33:36.5973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1eHH1ZrrcpCcZr3ck1pi22BPVx1mDunm1fM9WwMgN1sDnG4DrgKKA0OEn/x43LGyVhRzOzL2l/uRjjZAnVMqFwC3ym8j/gBWIAhX9iGv2Q0XNduDsz0t78FOzLE0RK3L07bTe4UX/HPFhsexAXQ6Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_083344_824726_3ABA6C74 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

Enable ARCH_OPENHWGROUP so the CVA6 APU device trees are built, and the
Xilinx SPI and GPIO drivers used by the SD card slot and the LEDs on the
Digilent Genesys 2.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
---
 arch/riscv/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d55..ed495eb8ad 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -26,6 +26,7 @@ CONFIG_ARCH_ANDES=y
 CONFIG_ARCH_ANLOGIC=y
 CONFIG_ARCH_ESWIN=y
 CONFIG_ARCH_MICROCHIP=y
+CONFIG_ARCH_OPENHWGROUP=y
 CONFIG_ARCH_SIFIVE=y
 CONFIG_ARCH_SOPHGO=y
 CONFIG_ARCH_SPACEMIT=y
@@ -166,6 +167,7 @@ CONFIG_SPI_FSL_QUADSPI=m
 CONFIG_SPI_PL022=m
 CONFIG_SPI_SIFIVE=y
 CONFIG_SPI_SUN6I=y
+CONFIG_SPI_XILINX=y
 # CONFIG_PTP_1588_CLOCK is not set
 CONFIG_PINCTRL_TH1520=y
 CONFIG_PINCTRL_SOPHGO_CV1800B=y
@@ -175,6 +177,7 @@ CONFIG_PINCTRL_SOPHGO_SG2002=y
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_SIFIVE=y
 CONFIG_GPIO_SPACEMIT_K1=y
+CONFIG_GPIO_XILINX=y
 CONFIG_GPIO_PCA953X=m
 CONFIG_GPIO_PCA953X_IRQ=y
 CONFIG_POWER_RESET_GPIO_RESTART=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
