Return-Path: <SRS0=bXEr=XU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D12C432C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2019 06:38:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1415A21D7E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2019 06:38:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pj6yyV6H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="XSjmnaeu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="eC9gvFia"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1415A21D7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J1loplkfqyr1DFs8iwzUMUMxRaK3iMFWq0vwhNjPg9E=; b=pj6yyV6H3kMQHb
	AXItoS4YpDLgpoWIY/a1OZG6Nr+qFt+J/WxjO50Wed8tnlwvPGYD7ZTt1wH6BcBVVrlIxPbaCcPVY
	hFSmPeiXudExPIV/Fp1vVKnvUA4LeWSAwpFep2vlhFVBP+adp5SD+TAHC+8EQFw06DPWKlYH1W0Nb
	PzEfArZyJojL4xAR1jGD42Q9SiEjLebf5UnOtc4jb2GKJKRf7jvPc0ojeJPDQ6buez5qW9w4sP9yR
	0SmfouvA21MyQxG5DY4HUTN+sUx8R9QVTZs14XBZJsJf9O6lzpZkds8PDlsdYFbP/yP9EOVojJnPM
	J5hrpGoGixxKNFaYegug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iD0w4-0000Qv-P9; Wed, 25 Sep 2019 06:38:00 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iD0w2-0000Pl-IK
 for linux-riscv@lists.infradead.org; Wed, 25 Sep 2019 06:37:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1569393478; x=1600929478;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lhYrBTBq2egGX1OOcWrwphEU8l/wLkuuQx2ZEWmt9EQ=;
 b=XSjmnaeu7HOJQI+TdLjqtp4hJb6IAdyXJJxTCzSsJ/5vQXFOnwJf01rS
 4NgjUTdqWz/kQ9QoAH4SjJ81Gp6TnfQzOZEBk8jiZ/LUFYZZ/OD90oZ5y
 1Jml15hhojklSpkqsHuqoivfLnxrzlxSoy7C7os1v3TQJKjLlvIQ+Z0jU
 xXR7Bgjv0LTbo9U5U3H/G0Th/bSXhUxGjib7vMMzHvdGn24Z04ElkGT4i
 SX5qEXSKK9iEkA6F1IOl117+G9wC4BWe4YrVxF645yWWsYzWUtbHXqn/e
 fA2jXJnou/bq+yW/sK7qy6c71tzFqeBzqAaxEIT0l0hZU754JEK76Vthv Q==;
IronPort-SDR: A7H1rnhHixT67nqfqbvJ5s5l8+qjW0tGajiv2OzG5gYB65bk9ziytL7RzSta9xDMsmfQBPWKe5
 zdP6wU7BThnIjbCv0MddH4qDZdF2qnkYrulaDtKRltgwhw9hXwINx6Q0atYkXRyMaELy+jRKF8
 GMUtUYhZBJ2arCwn6rMgRz9D+5QqQpa4dBwvYtRBh+ICxdIfp+tk2gmq2b2d7/iOjYLT3tnrrE
 x5h7tFHKW1pFzd1nfE2uzgl9TkdBdpWVB2P9xewUzatubMicv3VHrVCNmpVvfXPeX9pGxMHtL9
 izE=
X-IronPort-AV: E=Sophos;i="5.64,546,1559491200"; d="scan'208";a="120615895"
Received: from mail-by2nam05lp2051.outbound.protection.outlook.com (HELO
 NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.51])
 by ob1.hgst.iphmx.com with ESMTP; 25 Sep 2019 14:37:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwSKbNrrYbRXNP34IdBxxCMeVhKQCLde7uTsNJqxmuQNJwR4QSh8QY6P9ZjF437nvFBHhuLhaXeLFXp75NmoCk1S/PdS+cvNcwY0eRPSr9RTkKuG8FBmwnr+Ov10iinFS4hwDbQY4cXYuFumvZmDGcCT33TMXk63c/a4QNDVqR/IM4lUe7GrVdWHBPRClubW1vJ/1/xZ7g6jaEDB2DC/oxs+p2p56tD/d2iq/exaRFF4gUhtLbc7W2Q+bueako19js30k6JIoQXiTBYzPGe7ildpyZBc1zXyBtHupP1tVupYlPr5gmsrGaKtkrZpMnjUCrDbz5mDO9QcQypRyKiiZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5C4MZtddMJ3sz5pW6f8tfJmf+yERU4Ov6Zkco0bOHY=;
 b=QjGFn5Hu71z+hAtXD///O2+ZleeWc+zJwVV1+6U5xqNremvKT4xmNQd5DCgQqj4Bm3Hg0YVQKy/yXowOZZj9+uo5qGuvPT4XRi/tTdzi7GDuiWPe0TLjVTspVyHpc73yBjdUVTObRe/boAgHqv1dt/msAB/27pPA+mTZA3KeJtK/Gq0kLDMqMNX+uDL34VbA69Yaad1P/wDyEZUhtwOvFz2tO51il9HR8N76xW/n/nCdWvfPyCT8nepeayJofnOvDujKHvzaQG+6t2evbXfrdmAb9mmd7dXJNrffXG65oXz5buyq1FJL8OPfLOrSX2kXEb0UZxta+LfatnU0tKDKlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5C4MZtddMJ3sz5pW6f8tfJmf+yERU4Ov6Zkco0bOHY=;
 b=eC9gvFiaDxGNUPs50PyNxDFWQqA/ghNej0G5WSPn9bZQlSTwZaKSoAW9azAcFJVwDf+dRVjdvvxUew1sfUatvEw1dIyCNBEhP/Du+94brpKGLkcheKdba77VkYhxQSngn+MP2eR0umBrQHXb2qzraZ1MfCwAwPPSapXDguoVjLY=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5712.namprd04.prod.outlook.com (20.179.21.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 06:37:56 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::e1a5:8de2:c3b1:3fb0]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::e1a5:8de2:c3b1:3fb0%7]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 06:37:56 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Roman Kiryanov <rkir@google.com>
Subject: [PATCH v2 1/2] platform: goldfish: Allow goldfish drivers for archs
 with IOMEM and DMA
Thread-Topic: [PATCH v2 1/2] platform: goldfish: Allow goldfish drivers for
 archs with IOMEM and DMA
Thread-Index: AQHVc2vEBuR2IBmS6k2Zv0u/swnkxA==
Date: Wed, 25 Sep 2019 06:37:56 +0000
Message-ID: <20190925063706.56175-2-anup.patel@wdc.com>
References: <20190925063706.56175-1-anup.patel@wdc.com>
In-Reply-To: <20190925063706.56175-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MAXPR0101CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::25) To MN2PR04MB6061.namprd04.prod.outlook.com
 (2603:10b6:208:d8::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [199.255.44.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d775f95c-2550-476f-8fe6-08d74182e61c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR04MB5712; 
x-ms-traffictypediagnostic: MN2PR04MB5712:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB5712ED64013AC9D23AB0C4078D870@MN2PR04MB5712.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(39860400002)(366004)(396003)(136003)(346002)(199004)(189003)(71200400001)(2171002)(76176011)(4326008)(386003)(6506007)(476003)(54906003)(3846002)(6116002)(110136005)(81166006)(486006)(99286004)(102836004)(81156014)(1076003)(316002)(2616005)(11346002)(8676002)(7736002)(50226002)(6512007)(26005)(6486002)(5660300002)(4744005)(186003)(86362001)(305945005)(2906002)(44832011)(256004)(36756003)(71190400001)(446003)(66066001)(66946007)(66476007)(66556008)(64756008)(66446008)(6436002)(14454004)(25786009)(478600001)(52116002)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5712;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xixYsQVPF/xrrZ+x5ev1KEwdOwhKHZBFHjRKPbp5GYh7Ctm4AsNf/xGO1MSzhTyp1AhT51VRzfU0cHKqo6SMlCeZ2MXwOSeptLvSyGzlCrrqQnHcSn2hVYSZrRjjB305zfLpj/KmHXt1OmNTuHvSJgLF9uGa1iGynpwMgJvAoww8BREXyYMU0i58wPBaRGFWoll4/17TswNONilhbdFwS+KxtMGo4+MQ2WtOVTC/2o0/YL6FaDEroZvUQVEQdfl3lxisGqLUugZdR/FLvVXEc5CY37gvsNbctAohPMRpgl1FOUcyrv8FlZgbOVe8837PAQhcMo1hwB3mWcUT6PkyTjiquDFN0WNhU8EpzICE58+op9Kllm7sBSKCxqXdcOn6D+IgumosW++X0mLz5Q7ngp1HXEpI1i6XBrizEYhC2OM=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d775f95c-2550-476f-8fe6-08d74182e61c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 06:37:56.5096 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KIbwotOTbcptCsOPm3jEa8ktYIXtr8s0wE0hN990av10Gv2w6leKUmOm/4YTj8Uosa/eZCCiIFT2hOCtCHMZHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5712
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190924_233758_641124_9F35FDAF 
X-CRM114-Status: GOOD (  15.04  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <anup@brainfault.org>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

We don't need explicit dependency of Goldfish kconfig option on various
architectures. Instead, the Goldfish kconfig option should only depend
on HAS_IOMEM and HAS_DMA which is sufficient for all Goldfish devices.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 drivers/platform/goldfish/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/goldfish/Kconfig b/drivers/platform/goldfish/Kconfig
index 77b35df3a801..f3d09b1631e3 100644
--- a/drivers/platform/goldfish/Kconfig
+++ b/drivers/platform/goldfish/Kconfig
@@ -1,8 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig GOLDFISH
 	bool "Platform support for Goldfish virtual devices"
-	depends on X86_32 || X86_64 || ARM || ARM64 || MIPS
-	depends on HAS_IOMEM
+	depends on HAS_IOMEM && HAS_DMA
 	help
 	  Say Y here to get to see options for the Goldfish virtual platform.
 	  This option alone does not add any kernel code.
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
