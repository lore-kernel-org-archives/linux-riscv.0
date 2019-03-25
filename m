Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,UPPERCASE_50_75,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46014C10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 09:23:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 103452085A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 09:23:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pb9NH799";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="ML7jpMNr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="i0wrcs0t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 103452085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YMAEAxrN2f2RU886TggwJ0bjD6YNe6oKWQZOuBgv288=; b=Pb9NH799uSD0X+
	Df/aiUjYXDuiZm4rSCuakeX6xb2NWe9O40S8HfMBb2KzXo1OTJQLCPSbtF7ZBAdcfkvpGQDXIPGZ4
	CA5WJQ5eVkep1R6+xY4CA3BpDvjdSICD3jFQWsdH+5spK2SEUL1zOIcjmnNJeTO2gjy3GhqkAoguf
	ZAzsqlf6QdkuZ/edQRVzQBw3XF2AJuO3emjOiuBIrJDaaYa8tO7MlpHudvw7BxZZRZ9bTMTHsGmp0
	N3TpSbY0iQ2NblY7WL8dzB7mKDHrRMQwxgusOPH+6PWwY+DjFzUD450w9qEe0ccsWQ/jOaLOQ/D3G
	58hdGvTMEbQiWWGnzq3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8LpA-0002do-U9; Mon, 25 Mar 2019 09:23:20 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8Lp1-0002YH-KZ
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 09:23:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553505792; x=1585041792;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w4dVKfN5ZmXiG15CA3JMTgfloONM1rxnpuZsSQQesj8=;
 b=ML7jpMNrVXziIbwjLiFMH9/kK+suSKt8AhJqcTrxUbYahj3nHLBQ1Slu
 zEcOY3ShReqDhs5QIH84OlIjOx66A+eAFNCOJVHzdX21aRBovUoVve5Jr
 ZrRGW1KSY4CGnWVwsHYF2mXYyP/Wy1NrHX0+y+70LnwfO+bBJdSVfjKWO
 HR1oDzeMFSJhx7q8jrMnJNltvikegfBSI0AN9DytV+Cx85Wh7DXGevzKA
 MpNGclienYeD0FXUDnBWOn6Vd8n3rfQnRDNBexTFPdpU0mLsyD4V63PtL
 BpO9rQNWbDSO/32Ek/bz5lvrPnR8U3avlVjvTsYLyP0PlgY5r3hB1YT1I g==;
X-IronPort-AV: E=Sophos;i="5.60,256,1549900800"; d="scan'208";a="109204920"
Received: from mail-dm3nam05lp2059.outbound.protection.outlook.com (HELO
 NAM05-DM3-obe.outbound.protection.outlook.com) ([104.47.49.59])
 by ob1.hgst.iphmx.com with ESMTP; 25 Mar 2019 17:23:06 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5TIGr+xISzJZCK8B6VvVozLxUD4U89lHpLv+XA3rBM=;
 b=i0wrcs0tbrGk4qOt2TZDGyYluLaXxXZaQk1GgyxOvHf4CSDloLaZGIZH0b9pEYiEKlCSWyH67stXL6TKWG5tANcF7bjT65F529i/Hqx6l0pcBGsubJAA218hiDejdpw8eqqEaMHnXQUkJKQZmpAqonAndjlFRO2Svv+DRDIMzZs=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB6141.namprd04.prod.outlook.com (20.178.246.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.18; Mon, 25 Mar 2019 09:23:05 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::d197:7b59:7e0d:e819]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::d197:7b59:7e0d:e819%4]) with mapi id 15.20.1730.019; Mon, 25 Mar 2019
 09:23:05 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v3 1/4] RISC-V: Add separate defconfig for 32bit systems
Thread-Topic: [PATCH v3 1/4] RISC-V: Add separate defconfig for 32bit systems
Thread-Index: AQHU4uxZI+7Q/CZyAkSTA9/wBNCfkQ==
Date: Mon, 25 Mar 2019 09:23:05 +0000
Message-ID: <20190325092234.5451-2-anup.patel@wdc.com>
References: <20190325092234.5451-1-anup.patel@wdc.com>
In-Reply-To: <20190325092234.5451-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MAXPR0101CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::23) To MN2PR04MB6061.namprd04.prod.outlook.com
 (2603:10b6:208:d8::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [129.253.179.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c109fd0d-5db4-4cae-6e8e-08d6b1037c37
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:MN2PR04MB6141; 
x-ms-traffictypediagnostic: MN2PR04MB6141:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB614156FB5E8C04B293E529F78D5E0@MN2PR04MB6141.namprd04.prod.outlook.com>
x-forefront-prvs: 0987ACA2E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(346002)(39860400002)(396003)(366004)(199004)(189003)(68736007)(54906003)(66066001)(53936002)(446003)(110136005)(71200400001)(316002)(256004)(11346002)(1076003)(50226002)(25786009)(8936002)(86362001)(72206003)(14444005)(476003)(8676002)(3846002)(105586002)(5660300002)(4326008)(6512007)(305945005)(486006)(2906002)(478600001)(7736002)(106356001)(102836004)(81156014)(6116002)(99286004)(81166006)(76176011)(386003)(44832011)(6486002)(2171002)(2616005)(6506007)(66574012)(26005)(52116002)(6436002)(14454004)(97736004)(36756003)(71190400001)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB6141;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ukut514nvSaWzTQ/kcFDR+gGjDg3l2BfwwGWBvWAwH+a+OzW5GN1/b9dvjo5r9qv+I1Rak9dpJZYLfpOdXK+VyI76WOdxh4NdoY6AqoogMQiPzET+sMZFCjWkDfQ6bXE8uAZTgqYXLJ8lDwewAOxmI8ZPvyfZK3jgDhx1vj18kVpFvtWTmUQzIYfm4jeErqpj4nKdKukK8V6CO1pcKaiOpHRvLFuvIAzTfHRi9EmvmKLeiLS8nwxldQLIbFPXUjADeFmw5XzCPDvCT+67liT1w2NIMirT6Mjk3M3Oexe7Ad2OsQUSxlp4nXDVEs4/DrgqgNI/YZct7jbWb408ie9x6Y4eTXj5M/8TvprLlwoegsuOImoW/VDyzQRPr1FN+DUnNnxsrSBETvz+fSwhDX5XEm8bzLppdkLh/6erZZEin8=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c109fd0d-5db4-4cae-6e8e-08d6b1037c37
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2019 09:23:05.0402 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_022312_047322_C600D281 
X-CRM114-Status: GOOD (  13.55  )
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
