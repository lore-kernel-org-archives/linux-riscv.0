Return-Path: <SRS0=4zRh=PS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B8A8C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 10 Jan 2019 19:35:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39A4F206B7
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 10 Jan 2019 19:35:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hdha7xUy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Lr+A6tDJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="k43M47s3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39A4F206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UPtHxQdadlAxpMylWTwgg3eP/Cdac9TJ8Fs0kKhaCnQ=; b=Hdha7xUy7dpTLe
	c7I1JuSSKuGt8x6ts4+LJID/6pLlFra/7pdNcIZgDdKw8GP2a2TmANWddriaMBtglsMQuZsrr/lut
	vEYwMVQzTKG9QAbnC5G6mWBqQL4qeVzJuOjKrcXlt4LH5dKwMydr0Q9Nd1U8euONHHfl1oYEHvjWu
	9SaoJzL2+uCIKr/ExWLsAAUepa4qmz5XzO5aY6S5zgpK1n4OwDTR2LgK+qE7PtAvzjTaRdDVtZdF5
	d/M4DT1+IqTQY+Kos7DOtEugH8ZwrlEAgSqoETzUYKqT3WVQ/WAmQxEdRKNfvWgkvu2ORkkDfyB/d
	4fsrOUraHhz2VhQsoD6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghg6f-0006DI-S5; Thu, 10 Jan 2019 19:35:09 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghg6c-0005Fz-Aj
 for linux-riscv@lists.infradead.org; Thu, 10 Jan 2019 19:35:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1547148906; x=1578684906;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=xWfXdR8cj8M6IYzTCPeOEHg30o/1S7nr9XrrH552yPM=;
 b=Lr+A6tDJxg9T2YqnxUvsG/QYRuWi/vI8IOyNCefmNgj4gHwQ3rtgJ60+
 5F/QCvTabEf4oElNnU3+5Y7KLCF00N0VpHgEiiiSAz0FOZLreI+yupJ2f
 Gg5/zd0rT54NvgsdihSutRZdJxCSDHOiaS69gqVBNWqGVm5/QJqN4EOh/
 taWGFis3Gowba2RbQSsROPL73sA0entW4EJtj7TS7AdjNDxRPqo+Bwq5M
 nnhPKuaEf4VuhYF6vow7IiBkK6qvvGl8gI3+GdX57V/UoeEiwReSi1eai
 K2w0p5zFwd0FdmjuPgqqptHlLfc4OqoLPx5UrX4CBU60ilDAdayvoNrXK A==;
X-IronPort-AV: E=Sophos;i="5.56,462,1539619200"; d="scan'208";a="203370719"
Received: from mail-co1nam04lp2054.outbound.protection.outlook.com (HELO
 NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.54])
 by ob1.hgst.iphmx.com with ESMTP; 11 Jan 2019 03:35:02 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWfXdR8cj8M6IYzTCPeOEHg30o/1S7nr9XrrH552yPM=;
 b=k43M47s3gZ6UqQpSXxh3QZHGY1HN+pVHaeQyJoo748oIXERfQud4gmAKG94jMRYSEIP41iKPxaey9rmtE9LYK+YILdGfL6blTzM4lZyqqQ0LS6a0S5kGgyfdbM/jC093sIfcYABKngjhdGZ5mkAMjLVqY5R267nJL25zhaiHUQQ=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
 MWHPR04MB0254.namprd04.prod.outlook.com (10.169.202.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1516.14; Thu, 10 Jan 2019 19:35:01 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
 ([fe80::10e5:e75d:3272:2d33]) by MWHPR04MB0401.namprd04.prod.outlook.com
 ([fe80::10e5:e75d:3272:2d33%7]) with mapi id 15.20.1516.016; Thu, 10 Jan 2019
 19:35:01 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "Palmpalmer@sifive.com" <Palmpalmer@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: [PATCH v2] RISC-V: defconfig: Enable Generic PCIE by default
Thread-Topic: [PATCH v2] RISC-V: defconfig: Enable Generic PCIE by default
Thread-Index: AQHUqRuTleyE8WgISUO+ZqOMFa8nvQ==
Date: Thu, 10 Jan 2019 19:35:01 +0000
Message-ID: <20190110193451.29016-1-alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR11CA0098.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::39) To MWHPR04MB0401.namprd04.prod.outlook.com
 (2603:10b6:300:70::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0254;
 6:3Nn/JmX1XAtOTV9xjPzNHba0cqWtPBIZGD7iJaTeZfUmyWBI1FC26VsmnTVS4OXtirWKyr+EX5XMsQxnEsHuHl7nRkBcgxpZz/x7NaLe//8f2hXedd3pm1KTEmB8h+IAurfRvVXQ/f4QR95fRjfyTxbwVcuSGjP2bMh8kQlkHgwVgv2wdwHfg+6CSERmz8FYXJy5rPhUYKvLTl1baOTlrazOhAPavuB1jRXp+1qBLhqTQ9uvwvm7P1q6mJW0V2ZLVhBR8z5c9ukkWrlUS0DUgYyzFD1yIJkVFlscFuTEtcwJv1Bajf+RI8wHO47WjYRxayDepmVIuJRF8po3V9AZtlP7aFPr7LM8IbMzTnd68kpTrD4o4C+KuIgL39wUYQVGyxPtMtM6uk3CeBQQXEdbe6mx2pMZC+dIppH3Gba2XgMubSVDxUVuZSbiEwb8fQyvpy1S7ipl3qazs1BLpMfLkw==;
 5:5SyPEnuRXy0LpkyBCF344B4MgEWqSmg0oeNztgWBUziqCwuBF7iiUyQ/B/yaXU2y5+CXKAceG7iRBwxGizr7xR6OBvqsY/rrgyTxS0TAyxoZfr7hjsjrbhOYgr7s1AvfHg80w5454Pbz7BGJ98EuV6j3qtV234WSMlUADPIMmPRwVlnmc7liHb36TJlmT55ewhOG5afvw2l/2mrMCGpLfg==;
 7:+SDVKGjmtcKsnUZq1/EcPnPjtLYBk1DTGMngmIpyqm92O2wGE1DByikhC84l3SR1lVXd6d3w0zsJ4f3UVXqwLs//Uj2oYKRJ+6QRBtjgKcx3TRKNq1BNV4NQJXlXW/oEB4/il9PyoVHcj80iAq5l8A==
x-ms-office365-filtering-correlation-id: 32cb042b-a586-40fa-40c3-08d67732b643
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR04MB0254; 
x-ms-traffictypediagnostic: MWHPR04MB0254:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0254DAFA52E8F90398EB67EB90840@MWHPR04MB0254.namprd04.prod.outlook.com>
x-forefront-prvs: 0913EA1D60
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(346002)(396003)(366004)(376002)(136003)(39860400002)(199004)(189003)(4326008)(386003)(2616005)(476003)(5660300001)(6512007)(256004)(68736007)(102836004)(6436002)(53936002)(6506007)(66066001)(50226002)(26005)(186003)(6346003)(36756003)(305945005)(7736002)(486006)(52116002)(44832011)(81166006)(81156014)(99286004)(8676002)(72206003)(316002)(8936002)(106356001)(3846002)(105586002)(478600001)(14454004)(97736004)(54906003)(110136005)(2501003)(71190400001)(1076003)(71200400001)(86362001)(6116002)(25786009)(4744005)(6486002)(2906002)(41533002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0254;
 H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: foRCaqCyT0qzs8Vx+itwq27j1QE9mAlOVSLL41HurfAIwcu2nSm+5kS3OrDvOR2ulr/KR2+hSOkDrP2Rl0OhZDcrn13kfrccvu0FXg6phNpHfF+RytQDxOHUFtRATPTxpaEJqLgNFwKpc/IZUReAgnrcfuyZYW8CTOlT9ovZUkBXGwduvtXZxFQtNCim0Mc+vS/CG28QiEYS7mpeGyIC5jKFApqvpKSbyu8AvkbyP/yb1AmO6uiW3H8q+1AGksrkey3unLtCIegeOSCwt+2joDNQkhXkabNzn8cwXMcwV5EKWJboEGbaicEhpu+yPMgco7oKAOAEZr21yzFY2FA8B2haZ8G1pnWFANY+h8QGWSSU7mMd8saWg5bxvyvOI0THrl+8rMak7/unRC5psYksEoX2FQ2RnEO1fMuwKo0qRlPrDzu4w2cS4RjGKwZK5PJCPldkJQ87Fo0K4Ukhi5D2Kw==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32cb042b-a586-40fa-40c3-08d67732b643
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2019 19:35:01.2727 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0254
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_113506_838549_F0D9C154 
X-CRM114-Status: GOOD (  13.79  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Enable generic PCIe by default in the RISC-V defconfig, this allows us
to use QEMU's PCIe support out of the box.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 arch/riscv/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index f399659d3b8d..ccfd3f05223c 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -14,6 +14,8 @@ CONFIG_EXPERT=y
 CONFIG_BPF_SYSCALL=y
 CONFIG_SMP=y
 CONFIG_PCI=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_PCI_HOST_GENERIC=y
 CONFIG_PCIE_XILINX=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
@@ -77,5 +79,6 @@ CONFIG_NFS_V4_1=y
 CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
 CONFIG_CRYPTO_USER_API_HASH=y
+CONFIG_CRYPTO_DEV_VIRTIO=y
 CONFIG_PRINTK_TIME=y
 # CONFIG_RCU_TRACE is not set
-- 
2.19.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
