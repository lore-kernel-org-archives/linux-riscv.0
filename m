Return-Path: <SRS0=NLGL=RY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 383A1C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2019 09:47:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 082FC218D4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2019 09:47:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eOG4xDyD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="kCJe2lQJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="GrKb2FLf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 082FC218D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YMAEAxrN2f2RU886TggwJ0bjD6YNe6oKWQZOuBgv288=; b=eOG4xDyDlRrpay
	dFkv+NWV5g4HuxK34h1uK5qJ/WU2gChLlghs2PzXG5w3oGRc8eOaaNObYfg9k/HAUzWUcHPb4nd2r
	vyGh+ydWdq8AcyFV9p+F3E9tPMW6E0+nyLMM+hEw1suEbM68X7cvFQ4fYFosSSvsvM2mdCND2M+I3
	Ixt4LJJvpszHOCukjPIFpNw9vVEKjycUmVdk/16Fln58r8mXf9IZ/Gf6dj7R/RPwCerQ3BhR+BzI7
	eXmSPPN4L5WEhaqB/LFVqiSn9VNW0D2rqKWYM9uyl/KTIKoV0MaiE85D7NbjKh7CfT9+BUR++AFqo
	Vw2edIF8wzfDVEUsm+rw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6uIg-0007f1-DA; Thu, 21 Mar 2019 09:47:50 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6uIc-0007bS-5R
 for linux-riscv@lists.infradead.org; Thu, 21 Mar 2019 09:47:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553161666; x=1584697666;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w4dVKfN5ZmXiG15CA3JMTgfloONM1rxnpuZsSQQesj8=;
 b=kCJe2lQJ/RLl7qf+kwWFGLw/7aj++3pDeA5oH0EtCB+dKaeJjzUr57bd
 sgzLds4Ek0s18o2MTeeRYyj8lFZSOmyGD+vnn/8QFkRkTBPpyFxolGB6o
 eGeuTkF8Ao6Y4/EJo0S/4s97uIn1XPceBzGh3Z+zeeAULAAnr2v/xsLfD
 0X04ulh2cx5FqetUitUFgmKpEak0EIpAJl1b4cnNG9+xQLeS0q5RkQ5Bi
 FfFtKLASxbSN6YmGzeOrG3vsC0qin0NVkRF5qwv0gvmA7uKpU2w6rwKKM
 0iuDvXNczX/tab2y6ddfsMwH5b420Zy66NHgKfWt3Uc0+cbKn1HWooEzD Q==;
X-IronPort-AV: E=Sophos;i="5.60,252,1549900800"; d="scan'208";a="105647550"
Received: from mail-by2nam05lp2050.outbound.protection.outlook.com (HELO
 NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.50])
 by ob1.hgst.iphmx.com with ESMTP; 21 Mar 2019 17:47:46 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5TIGr+xISzJZCK8B6VvVozLxUD4U89lHpLv+XA3rBM=;
 b=GrKb2FLfO2z/qnl3SiaNik/Vdi+taUNTwrp1gd4PDJtqWA0LkSRsXn9u0kDtf6ggr1A9HsS5AbTPdjaK8+xcnRWOhJFWLpay5Ynj+Q1QrWMiZNX4lgxvDVYSGGqGl163l2TGNL2woVbhoOQ4qdEhhnmOEq1CI7jDqPC4H9YbIDo=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5757.namprd04.prod.outlook.com (20.179.21.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.14; Thu, 21 Mar 2019 09:47:43 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::d197:7b59:7e0d:e819]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::d197:7b59:7e0d:e819%4]) with mapi id 15.20.1730.013; Thu, 21 Mar 2019
 09:47:43 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2 1/5] RISC-V: Add separate defconfig for 32bit systems
Thread-Topic: [PATCH v2 1/5] RISC-V: Add separate defconfig for 32bit systems
Thread-Index: AQHU38shr0lS/xpi+k6cJOWF2UHeng==
Date: Thu, 21 Mar 2019 09:47:43 +0000
Message-ID: <20190321094710.16552-2-anup.patel@wdc.com>
References: <20190321094710.16552-1-anup.patel@wdc.com>
In-Reply-To: <20190321094710.16552-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PN1PR0101CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:e::23) To MN2PR04MB6061.namprd04.prod.outlook.com
 (2603:10b6:208:d8::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [106.51.18.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0b75087-114d-4b85-8c30-08d6ade243b2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:MN2PR04MB5757; 
x-ms-traffictypediagnostic: MN2PR04MB5757:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB5757835F9CF3F5B3E90C18438D420@MN2PR04MB5757.namprd04.prod.outlook.com>
x-forefront-prvs: 0983EAD6B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(376002)(346002)(136003)(366004)(396003)(189003)(199004)(54906003)(1076003)(68736007)(110136005)(316002)(6436002)(81166006)(2906002)(78486014)(8936002)(66574012)(5660300002)(25786009)(50226002)(6486002)(52116002)(102836004)(6506007)(36756003)(386003)(26005)(9456002)(186003)(76176011)(97736004)(99286004)(11346002)(446003)(476003)(486006)(2616005)(44832011)(81156014)(105586002)(14454004)(4326008)(72206003)(14444005)(106356001)(256004)(86362001)(55236004)(6512007)(71190400001)(7736002)(71200400001)(66066001)(3846002)(478600001)(305945005)(6116002)(53936002)(2171002)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5757;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sxwMIfO2PXIXFu6EtTE7ykI1eJjQ7nvhWI8oxWMXqp+8A5BWa4IjpbK/f7K/ZFPetbOboS04BFRC/YWIIhAZplAypWhr02j+nEWsuz4vKbeZuHSLnWIHawegHsuGQKv23cMrFRD1h7lBSmZzF6hmxSYdLTcnbLiqeGlw6q86kzJs5gxghsmi4s6+mxW36chHWA6ZUDYsNE3oCOOtPUElKJO9k1quo34L+veY8xV2B5+6RPHyZQTzJQ5Pihbnp0Qce7arCYJFMN7SDqCs/FTzPoHbznJCRuvorHJ/nDw7EaHVIhzVHGJzj6n5d0j4p84YOtoxW0Bx1EJo++G0dg6gr6nvOGgMlBxueVpfpWk+0pirsxFeGMqZZQ76qVvsP3jVTfp08ZKqQPBMwMOGs7oi5wyQTVoukXA86sANCgEQofA=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b75087-114d-4b85-8c30-08d6ade243b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2019 09:47:43.2514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5757
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_024746_274585_5397E511 
X-CRM114-Status: GOOD (  14.58  )
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
Cc: Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patch adds rv32_defconfig for 32bit systems. The only
difference between rv32_defconfig and defconfig is that
rv32_defconfig has  CONFIG_ARCH_RV32I=y.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/configs/rv32_defconfig | 84 +++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 arch/riscv/configs/rv32_defconfig

diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
new file mode 100644
index 000000000000..1a911ed8e772
--- /dev/null
+++ b/arch/riscv/configs/rv32_defconfig
@@ -0,0 +1,84 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_CGROUPS=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_CFS_BANDWIDTH=y
+CONFIG_CGROUP_BPF=y
+CONFIG_NAMESPACES=y
+CONFIG_USER_NS=y
+CONFIG_CHECKPOINT_RESTORE=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_EXPERT=y
+CONFIG_BPF_SYSCALL=y
+CONFIG_ARCH_RV32I=y
+CONFIG_SMP=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
+CONFIG_NETLINK_DIAG=y
+CONFIG_PCI=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_PCI_HOST_GENERIC=y
+CONFIG_PCIE_XILINX=y
+CONFIG_DEVTMPFS=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_BLK_DEV_SR=y
+CONFIG_ATA=y
+CONFIG_SATA_AHCI=y
+CONFIG_SATA_AHCI_PLATFORM=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_MACB=y
+CONFIG_E1000E=y
+CONFIG_R8169=y
+CONFIG_MICROSEMI_PHY=y
+CONFIG_INPUT_MOUSEDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
+CONFIG_HVC_RISCV_SBI=y
+# CONFIG_PTP_1588_CLOCK is not set
+CONFIG_DRM=y
+CONFIG_DRM_RADEON=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_USB=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_XHCI_PLATFORM=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_HCD_PLATFORM=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_OHCI_HCD_PLATFORM=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_UAS=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_SIFIVE_PLIC=y
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+CONFIG_AUTOFS4_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V4=y
+CONFIG_NFS_V4_1=y
+CONFIG_NFS_V4_2=y
+CONFIG_ROOT_NFS=y
+CONFIG_CRYPTO_USER_API_HASH=y
+CONFIG_CRYPTO_DEV_VIRTIO=y
+CONFIG_PRINTK_TIME=y
+# CONFIG_RCU_TRACE is not set
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
