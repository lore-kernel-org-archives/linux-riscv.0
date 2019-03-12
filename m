Return-Path: <SRS0=5v1j=RQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UPPERCASE_50_75,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD20C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2019 10:17:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39B3F2087C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2019 10:17:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="entbYMaQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bz/OAN91";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="gvV/CeoF";
	dkim=neutral (0-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="CuRCk5ve"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39B3F2087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YMAEAxrN2f2RU886TggwJ0bjD6YNe6oKWQZOuBgv288=; b=entbYMaQ+R9tCz
	04+k+4PC4ZSLu+6Ni8+AurA23Z8K8QObdZqJWOY6vESONcvM9t3hap4lsmWoXBaSrhJaGoqHKYUdJ
	P+kaBNV+Q7s7eDKx/kFO4h/lN/3eZlXoFc3b1Vat+LZ5kIWvlcaH547DZ9VVEffVQtL+yIio8TbvK
	C3S3L91ORugXf0trl2ANBgALx3T5Zcu9nbN5SsrVCdQKUi8STQXX3PqmCE3DRdQY0DhSOO7nXWXoH
	iuQOsHrq78wt30bl+bNRtJ83r9PRkABFFuWbE1IMMI7zsmSaGWDw7Prk2/3iugskKb8hViy0V+mSC
	TXSV2C9Nwyds2UXylsHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h40x8-0003dl-DZ; Wed, 13 Mar 2019 10:17:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h40qv-0000lH-GK
 for linux-riscv@bombadil.infradead.org; Wed, 13 Mar 2019 10:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w5TIGr+xISzJZCK8B6VvVozLxUD4U89lHpLv+XA3rBM=; b=bz/OAN91oTxdx0Dip8epWrxnG1
 sHNtihkXWKpOLr+EIihxJ/t6RLfZdD5tqHN+hTdJvkktBVADm+Hl3TDmF5rd58+QTuhKfKSwWu8h1
 aofnsVrHHScSV1ECCYDuM2BdNyoLhjYomFI3i6nNF7yGZWpf6KuG644gfsyoExFMYr34790N2nxkS
 KuCOMs6FIiXXtEzAJB7eUcVI9yDvUElYs5imwwXsKv17mTGrvckfMwIR5UElZYlDXrfDF2QMlFQ9m
 bR7iX3Xv94k9qbdZih8YrXQHlIk74T6jr/Sy+LzD4FgLWfyfU6itGdWw5UsTExAPbH03KjFmpev4i
 Vslis3KA==;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3rie-0007bK-SY
 for linux-riscv@lists.infradead.org; Wed, 13 Mar 2019 00:26:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1552436765; x=1583972765;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w4dVKfN5ZmXiG15CA3JMTgfloONM1rxnpuZsSQQesj8=;
 b=gvV/CeoFyn49NCR6rwtqqJY3bosl4BRwog9JtJqPKI3Rqgc3CD7Zrxj2
 jIhjS2TSQndP9A97so9Yh1rHsmpcQybEoxYL40OCwmHoDg6FB0xPYGU9z
 wkNI56muvVJfO/4JyGkcluA1VNgTuJl8UQC2lOxJPeMuGfsqfEvfD4BRo
 qqqBk5J6fjgo4bLS6RAg+9k1ZzsS+o79Pus35gEFsSgVGGMqo04I7/2Y+
 83d3ySxBM1OhMiO20XozCUtimnF0GY3QJuvDZbpyulBuB0uEr7t0HfkP/
 KVk1of4c+DaF3CCMYRgZOkk+PoielqO9lc4unxdfL9++ouJdwmc6kGafG A==;
X-IronPort-AV: E=Sophos;i="5.58,471,1544457600"; d="scan'208";a="104620467"
Received: from mail-bl2nam02lp2055.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.55])
 by ob1.hgst.iphmx.com with ESMTP; 13 Mar 2019 06:08:17 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5TIGr+xISzJZCK8B6VvVozLxUD4U89lHpLv+XA3rBM=;
 b=CuRCk5veR7fi5DTP9gG1sn9LzaTziz8ablWOkyVWVJoCmriapYzglcbnadv3ebP28y5e18aA0H/ygTnsbrn6dpeGJslWPKcRypaAPEAdYGzvSrJqe9IzdSwypTPoPm0nO4CCtUuP19+9i/KKeizpLABOGT+1ysWtAF5lAIX4ctM=
Received: from DM6PR04MB6059.namprd04.prod.outlook.com (20.178.226.89) by
 DM6PR04MB4201.namprd04.prod.outlook.com (20.176.76.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.13; Tue, 12 Mar 2019 22:08:13 +0000
Received: from DM6PR04MB6059.namprd04.prod.outlook.com
 ([fe80::447:8360:6df9:c934]) by DM6PR04MB6059.namprd04.prod.outlook.com
 ([fe80::447:8360:6df9:c934%3]) with mapi id 15.20.1686.021; Tue, 12 Mar 2019
 22:08:12 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 1/3] RISC-V: Add separate defconfig for 32bit systems
Thread-Topic: [PATCH 1/3] RISC-V: Add separate defconfig for 32bit systems
Thread-Index: AQHU2SAVT5p6H2iYlEy5gQkEIbe7Lg==
Date: Tue, 12 Mar 2019 22:08:12 +0000
Message-ID: <20190312220752.128141-2-anup.patel@wdc.com>
References: <20190312220752.128141-1-anup.patel@wdc.com>
In-Reply-To: <20190312220752.128141-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:a03:180::41) To DM6PR04MB6059.namprd04.prod.outlook.com
 (2603:10b6:5:129::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d7d8031-3356-44d5-5765-08d6a73737e8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:DM6PR04MB4201; 
x-ms-traffictypediagnostic: DM6PR04MB4201:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <DM6PR04MB42013C034981305DFA78443F8D490@DM6PR04MB4201.namprd04.prod.outlook.com>
x-forefront-prvs: 09749A275C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(396003)(376002)(136003)(39860400002)(199004)(189003)(71200400001)(66574012)(478600001)(26005)(305945005)(106356001)(76176011)(7736002)(105586002)(72206003)(102836004)(6506007)(1076003)(386003)(71190400001)(66066001)(97736004)(36756003)(4326008)(5660300002)(14444005)(25786009)(186003)(14454004)(316002)(256004)(6116002)(53936002)(54906003)(99286004)(2906002)(110136005)(2171002)(8936002)(50226002)(486006)(446003)(476003)(11346002)(2616005)(44832011)(81156014)(6436002)(6512007)(8676002)(81166006)(68736007)(86362001)(52116002)(6486002)(3846002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB4201;
 H:DM6PR04MB6059.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6J7d3jd3Awp6C/miF4aRXwminj6CxNmn+OMip9D66zpN4E0jPTkhkUTIaQCpyeF1INGG1kG8OERmzet0aDKquxOFHdgzmcZP3OMtjtgARjcJZrkjuH3itG9RyQzJ3gBS23dNlWYAFVtUSYPnMkxoI/knG38UqsQ3M48/PTPvlWlOXTPk12IridRE9CuPMUb7glAS5kbLKa1ihtSSIPBovS6kO88+Yzu4wUAllVTezEAsBDATEC8d6YfYYoaT8gw0nf/Vc6uPSnjcqXKvdSpjMjOoqg0o70LQbTL9sfjCnxFRqF+/pOf9Gwg/tz18kCBntc9+MuB69x8MPEiWiL0IkEWdcTWgBzyCATAboKF65R/IIofRgd/u8rfMr3ojdSFWHSPjYEDS/UdEVFfMTTY3tY0pDycYHIFEYxGr4BB7gBY=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7d8031-3356-44d5-5765-08d6a73737e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2019 22:08:12.8141 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_002605_422838_E03423A6 
X-CRM114-Status: GOOD (  15.45  )
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
