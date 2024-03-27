Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EC2C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 01:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vyLfawp02+gX9P+W93HkTUgVMbRqgYnPpSY6mg6m17U=; b=Z/oaWKOXL2HnCR
	IetUkXE9ShBFiHDNaFjdYmwuNuGiW7XveJ6a+bW8WYlSzFd2or42thTv4OvbOt6vIP59ls2FaSfi7
	KPmIuvv6Eii4WtwAxG56etFzx8xi0B8gVeFE//q/Vp1dAxc1SN8Sqo4LQ1LYUSgV0h3ttIlqnfE08
	eMnDMY+82Z1Vvs+x5OFIixUQXxaRe9UtvQ8xcaOYNICii/f5dtc4Sp1ti2ZW1ndjUFz5TSPJR5rsT
	cPYVIhb4dTsOsXwOZmcaHeQ/XRPzMJ1knBNyHn5FH8hoZkBZPDwEiAXjvl6vgXVn3/oR/Ud2f6TSK
	ArNp1JS3zKRhiBJRMZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpIYT-000000078c6-0ARf;
	Wed, 27 Mar 2024 01:58:17 +0000
Received: from mail-bjschn02on20722.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::722] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpIYO-000000078Zt-3rQc;
	Wed, 27 Mar 2024 01:58:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+PQOM2pL51R/uS6lzRUWJbHRo4dai3pIpV3OOIQkF661SRiSL+RPqoEDkz/0ksjX9KpAOgtxOBp7Od720m3pWPE0gVqFBmLz3eIW+kNVXB0K4QSFTfMrAch/D8VSmdtF2YlonctwmXYP15QhwNKJSwCPIHgSi7eWyAWbWFLRnJiGVlOwQjTpcTH9vVUmP8hzlkLj0KBu2FKtu1fUurxeus32H4uCCTOkCayFwXMVKkFs07B7P1AaJOIaiGjYPyBLOEIuH77zjRBoDfZ2yg25tyXdAxlqKfPwhd1rIFTT9R1aw359J9YiXHJcCMDpcPsG1V6N9Q+BeWtl4TTkZsYwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKQkxDcvtl2Vv4vN1RK04Khe3CW1nTJMlaooL+jisJY=;
 b=HgM6fzElMAOk3IADLVD9MaOKWC9UDUJxR+LoI2LjQq68bGPGNGi1o94n26rQh3iE3u4tAyVU+P1t05RhTvSozi72W/0gTuJvwKmVpWVyiOWIvvFY/ZUuC8E+6kUPB4cBnax3byL/FUqbNQIg+T26DF2Wjfsp9gSZQKlGdoPCc94YkXwB4HHh8f0p+6pTh3azIk6qmcnZfIqtX6OqmhC4QlvReL0X7ZMaXtKdov/6L3QTM61WzS80vyCWx8gXeSFU/47A9n3e+HOdWeKDo09jujJTzjE8Db31O5Jx4Gd9Rz5zyow8nKsYpv3lLJsJ08zx8lddWzOXzF2YlMR/im13Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJSPR01MB0595.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:e::20) by BJSPR01MB0689.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 01:58:05 +0000
Received: from BJSPR01MB0595.CHNPR01.prod.partner.outlook.cn
 ([fe80::d0cf:5e2e:fd40:4aef]) by
 BJSPR01MB0595.CHNPR01.prod.partner.outlook.cn ([fe80::d0cf:5e2e:fd40:4aef%4])
 with mapi id 15.20.7409.031; Wed, 27 Mar 2024 01:58:05 +0000
From: Tan Chun Hau <chunhau.tan@starfivetech.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Simon Horman <horms@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andrew Halaney <ahalaney@redhat.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Russell King <rmk+kernel@armlinux.org.uk>
Cc: Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Jee Heng Sia <jeeheng.sia@starfivetech.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 0/1] Add StarFive JH8100 dwmac support
Date: Tue, 26 Mar 2024 18:57:49 -0700
Message-Id: <20240327015750.226349-1-chunhau.tan@starfivetech.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: NT0PR01CA0001.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::12) To BJSPR01MB0595.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:e::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJSPR01MB0595:EE_|BJSPR01MB0689:EE_
X-MS-Office365-Filtering-Correlation-Id: cb8e123c-bf1f-459f-f990-08dc4e0157ab
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: on3vgimkHLbf8+U5F+qytdCh4iq99DEfKWl102n2Tt4IPx08hh9j8NATyxWVbIy4n8xIMKiqv3Spa1tk8bTtNtqRdJ5fqjnx6IO1yQx8fCBS7QWHgtVPI+7G9Zxa4jXD65Epysulkcp3BRiaTKcgDw3XrlM7H9uV0NZOZk8iG6BiGdTEmfV5GhJgf2JVC5rByCzg/2gD+NxNf+MKbVchot2nJkar3YNo7XCU48K618zEYMbwg+3Xw2XZLKLhHIUoNzw5PYn5jusQc4FtERvkPshvFz8b65teK0VYXRP8f4Rucs/K3bY2IJa8korFEh4xxOZ5CmlLjbnN7LayRgK0nokmQ54ZCTXPEY8AaiB+vn9xFb8kDkUHSU8wJtb3Mh9xaPCiqpB9ua7UcaoHS69Tvx2adx2amydPJvrmPFliIK6dk78SoprUPTrDZp0rny+STkj9ugrsBTDUx+OHbyTT+14RFte4tys7q56xIvzHrbSDS727Akq8UdyQrN+YDpOyPAlTxCkvxAmMGs1g9B55KfCqyVpPr9cg87gtXYL18c3FJT0IS22hMYGsR5UkN5E2M6LiaHCpc8BchvtUpPDuOtjSg8g593o9zTIDHVUzn/YrFjRjYx3lIJhrfOCuxV4SVbt7nliEbjgthwSHrvE4Yg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0595.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(7416005)(366007)(1800799015)(52116005)(41320700004)(921011)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PIpq3JYcih+nyiZ2ABVEWarInpD63axC29Bt0uOhkhwWRa8/TL4QJaVtlyah?=
 =?us-ascii?Q?1OUJ1nEgvaRZz48cakaEmfVt0vDFpv9+EpjO1joVelYH5FAv9uLBuhsZZF14?=
 =?us-ascii?Q?Vrt9nSX0ThGBXW8Vi+CkzCkBhV5+/LwRPpc04cq09ohqIlwjv1NDo2IgRpVp?=
 =?us-ascii?Q?6xg/2vtwZEdBNcKuD1fvyO7wjKAXyc+fhGAR/DFaP9FAWBmyaVys974yLfy7?=
 =?us-ascii?Q?MuoFg8NcEFTO35CYxlAE827/iGZUHvoWy42hQMiaImnkMcvM6vdaDXY0hyWR?=
 =?us-ascii?Q?G1KTguq6gnH2dGVIw3BPtd1jR/fvrFAvZW/vhekD6aWN7hkf6JVL2+Cl1xh3?=
 =?us-ascii?Q?yHGmZWmIzjJyt3bhiPrObHBJwoTtZAM4QvlaFZ8iT74/25Ag0lcUcJUzyo2k?=
 =?us-ascii?Q?8GUgy4ui1RDG8wiP2IkeWt3Y7zEWhxlvxEiHLdUzl8XfalSc42T921B97i3p?=
 =?us-ascii?Q?ZA5kEwx1PykvVn0GPAehq+haRgc00xnrR6kC2rSb1WYVQku3Smoa4s2kv/Io?=
 =?us-ascii?Q?im+eq/K6J6KI81Uq7ok+01v53XhTirNGxyGEbH8xY4qSOdZjFQ1Ml+VII94E?=
 =?us-ascii?Q?uSh0GKsnuMTw3tjaDT7fKL7yjWinvFLnLU2+HjUnL8ihCH7pAindP6YP3nzB?=
 =?us-ascii?Q?INSd+PE0vkNklLOprp6FrfL84xoHWE/1XMPWeLPYEB5lU2AfUiKpRMzem80w?=
 =?us-ascii?Q?kmehTVRvVC7ZzaFoP6W1ZBgwncW4BC7kV6mm0IeVrUCtAz7glEqpH0Zn90k2?=
 =?us-ascii?Q?ENf+GRTU87WxKdMLeEhY05HHzCmz5B0DyBl2xE87G84x/Seabg+Sl0QpB8u+?=
 =?us-ascii?Q?tpkP4rMW+nHNHJSenutOk5PLc3ct6L7/S2iD6hOnpFGl7ve23nzxXBK9/n0R?=
 =?us-ascii?Q?j6RACVylvvETgsdbdAS5xZd6t5qOpQOPkBmvk6AcI1UIy1WD86uIYPYUa5iG?=
 =?us-ascii?Q?picejmq7qQxmLp3xjKfUxYeiJZT2G7xJN6k+DdIrFtxla4KAiy2CKryChD2R?=
 =?us-ascii?Q?UKdDVVtB753Lvl5mN7lVK25Ih0shCrHL+WSn8gQxzVogMpOfupYiXMd/Ct/b?=
 =?us-ascii?Q?jJak1YpWs8Jxsy9ZKbc+HVpq82ON6n8XrWIFiHTC25BHzsAE/2DP/rcdkYCi?=
 =?us-ascii?Q?kKZr6u0q5XVqjLVxYZfBTy2LuMSDDH4mJJdxXdVpXQXXa6bG9TLH1FxEEvM0?=
 =?us-ascii?Q?eH/fyhgMKSyh3l9/ZTIbYeS67ZRNWO/q+gxU2BvMGNPLklUfnJv8vr8CngXu?=
 =?us-ascii?Q?dn2+Xr9nWjsrD1yJCEtA/9aLKQ7CdfRv+0XgfkyrOofMTk8WaCtromvudJaU?=
 =?us-ascii?Q?aRVAb5w+wKpXtEc0RZOrocgta7XVxRxnHDI6JzRxjW1tqR9whNi8dHhuFBU/?=
 =?us-ascii?Q?CBKHRtMpguMDJtONtqVJKb/RikCh9u5tFH1zx3vkdiUa17b5hyfkWZzsKN/m?=
 =?us-ascii?Q?EcwTRk4t+dVR5psXEh81l0R37Ut3vDuS9ORFC9sm273XULQDcw1b5cHOe6Eh?=
 =?us-ascii?Q?mOSrevMH+ikwa3biS+WbVer2nhCrPOgR/68PLAPiNVCQrKu0FvP0W3cmvSsC?=
 =?us-ascii?Q?XEXH3+6k2o8+/NVGRTU/0jTIxa1tw8urwCTI/xkh3/FRmiKthEV+DgAkF68h?=
 =?us-ascii?Q?AA=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8e123c-bf1f-459f-f990-08dc4e0157ab
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0595.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 01:58:05.5001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pxU1Ln5CgAIkuHDZXt70M/Q3pAzIE5p4ZLjbZ7vVMBnDutEkiFbAWDiog8ioWEYBYYnaTqg/SxsdMKo4CIkD3ZQc8E+KoGsO+9RQtxmc2PY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0689
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_185813_103715_F5FE609B 
X-CRM114-Status: UNSURE (   7.71  )
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

Add StarFive JH8100 dwmac support.
The JH8100 dwmac shares the same driver code as the JH7110 dwmac
and has only one reset signal.
    
Please refer to below:
    
  JH8100: reset-names = "stmmaceth";
  JH7110: reset-names = "stmmaceth", "ahb";
  JH7100: reset-names = "ahb";
    
Example usage of JH8100 in the device tree:
    
gmac0: ethernet@16030000 {
        compatible = "starfive,jh8100-dwmac",
                     "starfive,jh7110-dwmac",
                     "snps,dwmac-5.20";
        ...
};

Changes in v5:
- Addressed duplicated interrupts and interrupt-names.

Tan Chun Hau (1):
  dt-bindings: net: starfive,jh7110-dwmac: Add StarFive JH8100 support

 .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
 .../bindings/net/starfive,jh7110-dwmac.yaml   | 29 +++++++++++++++----
 2 files changed, 25 insertions(+), 5 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
