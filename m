Return-Path: <SRS0=bvH1=PU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CF1C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 12 Jan 2019 00:04:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FAE920872
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 12 Jan 2019 00:04:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UV9sKXGj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="XxszA7w5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="GqvCjt9I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FAE920872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8nU9CRMP6RvE+88e10JzMwj/Crpn18rBznx+Obmwlgc=; b=UV9sKXGjGnpKZa
	SMWLq94o9dOFQ9B3dVbaweqqUT+qgZpiZoNLiJfNutdiPkFChCeHRLcb+HG/bCQnvF9dQUS9se9zP
	PFyeLTsA4JvyOk5mmlksCcoFF5yw7zVbizRgs4fGY0Y2wM/qSr46ZdGKUwoztuUzk2BCV29hnVJ0Q
	Ybfca2n9Ro/cuEtEPUpUF7klif2X1eDc2kscVXJkiqMl/MfL2vESdYQhp7Ha0sdlhpIkAL6HQWhor
	IFfRWkLeWkWWDkUkYL2eF+rOsJL5mbmj5XpQTimdn7KBc5R7Vun8jDg5ZRMZJxrWfDO7bTh9g1+0n
	LQE5uWuyps06dCQUdwDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gi6mR-0000hA-9R; Sat, 12 Jan 2019 00:04:03 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gi6mO-0000gL-Eu
 for linux-riscv@lists.infradead.org; Sat, 12 Jan 2019 00:04:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1547251440; x=1578787440;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=sbzZyhLG1cFsUvTEoMEEnrxvThquA43GN5D98AUS0eE=;
 b=XxszA7w55LmjIInULXtce6lTfdoLFndoKeeH4trfE5t7w5PZ6jSA19T/
 CAVyumv1mcc6uwDDzIU/qfJj7cPA1lXB1sAPasTgeWxBHk1yp3uIhAqrw
 kDvZCRVRmlL481qsmgpO6cimNW3hyhN77Lhjxc7oI/Sz/tJ1gCEJHNTPY
 bs37lG24ltOben6hyGMyn/TE8VYLFMu0HY8+DGh05LpClG/4Kj+Y0t0Om
 0MJ5qY4rlqnQzzFbxz8dhASt6ngnOg8mch4R+BmRdWED/GhybS1UkYcfe
 ouJojWGVsEHDrzZDzKUvcTfpqwgTnmKLhmHt/4kjhKCF5MsiNJcDyndA2 g==;
X-IronPort-AV: E=Sophos;i="5.56,467,1539619200"; d="scan'208";a="100378219"
Received: from mail-sn1nam04lp2057.outbound.protection.outlook.com (HELO
 NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.57])
 by ob1.hgst.iphmx.com with ESMTP; 12 Jan 2019 08:03:56 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbzZyhLG1cFsUvTEoMEEnrxvThquA43GN5D98AUS0eE=;
 b=GqvCjt9Ivw8GBAOQtg8eRsfBAvFTAyVIk/Qdg03S3r0Jp8uO1kaNdoCcXJt0RYnu271QCIh80B5qEDnrtGxtW8ENxmjVxLHTPf5y6B4c/uVnTKHTcgvcVR/urz3v/v5Z5NOYujQgQyB85MFA1PJOdZC/cDeT5B0wH73SBrVCVXA=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
 MWHPR04MB3760.namprd04.prod.outlook.com (10.172.169.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1516.15; Sat, 12 Jan 2019 00:03:55 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
 ([fe80::10e5:e75d:3272:2d33]) by MWHPR04MB0401.namprd04.prod.outlook.com
 ([fe80::10e5:e75d:3272:2d33%7]) with mapi id 15.20.1516.016; Sat, 12 Jan 2019
 00:03:55 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "palmer@sifive.com" <palmer@sifive.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: [PATCH v3] RISC-V: defconfig: Enable Generic PCIE by default
Thread-Topic: [PATCH v3] RISC-V: defconfig: Enable Generic PCIE by default
Thread-Index: AQHUqgpOagOSSqCnS0mH6o+zJyJ+rw==
Date: Sat, 12 Jan 2019 00:03:55 +0000
Message-ID: <20190112000346.2620-1-alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR02CA0025.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::38) To MWHPR04MB0401.namprd04.prod.outlook.com
 (2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB3760;
 6:57swrGS5MS6XuCFEWs309qOIzaadPrXGK0P/QE9dHF3pjWWuQLk2aOx8UOB/PMZjAl11KPjDCDXqgVnlmgMOop3u6N831QEj9YsIIbtEIbuCGfFyes6dTcHFvnzpjeGY93fghY9WUaEzL9fq/Y7a/2HUL26qSEzWUl836z68CIpesVP3Ux8xW8+YlXJNijiKvpXC7MdNULHBZVRLtS+45F8PHzNSluRwmDtvrnuu9w2S6Yl8s/keDrzVHWQylUnarybUChPs8MKUdmI+7bDRXC4OYwjdIg7yn6l/2SLn3ZMbnERhUxzZYE3uhM+eBSfNw4RRtwO/1FYAeXGgIhUW/9ctQGqZMou6Fg6Ncu1nS8fFv7exaxWIKLbaok4qjPab3JNOyfowFefXE1jB84Rg9MCyviMA7e5Ylbj6xTrR0mO68d+zP/qMVTJnioYhn5nYWpttkORX74EocG02f74Pvg==;
 5:iG+RJFkfZM4CPLoIJ0jIJu9Y4uvSEC4vDPUwwZk9YggIm7svHKcSD7ZxtItu8hcQlWqkhkZ+3+nnwnOjc3bcaL2pINfaw2XkeTnc6OYHS6Cb5yTWj7QloWzbkvWeUtixNtu47RRceGSJk4eIDU39UDIrxg7tCu1I2T0s87y3WBy3iuvamYIdbgBNcNiKT6U7GcCvGZzWsMQLFdyWy8sG7g==;
 7:YE0UUdfxKDBmAF+B3QlQ0WOdN20ZJLiWR3NEEuOJ8+UJACG4LQy49FXAMDWT6FfGS5hbXw8rSnFaaHj857iFY5gLab5vNqCGqH9KkA4o44xTNbqmyvdipDeD/MYUuGAqkSnAtRZXRpBpZRLcfS49lg==
x-ms-office365-filtering-correlation-id: 26891470-91a6-4de8-08d3-08d67821712d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR04MB3760; 
x-ms-traffictypediagnostic: MWHPR04MB3760:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB3760169B610AD553AF05B1EB90860@MWHPR04MB3760.namprd04.prod.outlook.com>
x-forefront-prvs: 0915875B28
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(396003)(346002)(39860400002)(136003)(189003)(199004)(3846002)(6506007)(386003)(52116002)(6486002)(6436002)(5660300001)(110136005)(316002)(54906003)(305945005)(1076003)(7736002)(2501003)(2906002)(8936002)(66066001)(26005)(186003)(81156014)(102836004)(81166006)(8676002)(50226002)(99286004)(97736004)(256004)(2616005)(476003)(68736007)(14444005)(106356001)(72206003)(105586002)(14454004)(25786009)(478600001)(36756003)(486006)(4326008)(71200400001)(71190400001)(6116002)(53936002)(6512007)(44832011)(86362001)(41533002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB3760;
 H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 734i2DzHWSNrdWgndfgnbGej59l6kkt5HJ4QMZfrcC7vdV4JDCqF1gDLULWWmVbIP6ChriNjWmW0amHoukPsGLRthxL0s47gp54wxR88UbYWJBYCzqXEtV4CK7xX0zt8M1xmGeDU8sr3E9+Zk2PmMUCLKKyGM6g9sCRtfwqxc6x3B/uAxpAKOQ5VhM3eXI2v3/Ra4J7g6STb/kCgtb4dKSBCA2n+qF3z02PygmdrT0qPTllyeKyJT9JxnpeFaDA/54ysnlN97PQ3zc5LtaCHqvdkbpznv7FRCrVUgJUwlfbNwIlZREw5sSuHf99GHoTN5HpWlJECymnBN7XqCtynPiQYLF4pZUWGEP6Ocvv+a2Uw6J+jJ1zU4DGrnQt4NeLjCD5EherMHKD0SF4Bf0l7qgEX/hTA9K8/Eft61EtES2U=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26891470-91a6-4de8-08d3-08d67821712d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2019 00:03:55.3549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB3760
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190111_160400_566111_4459717B 
X-CRM114-Status: GOOD (  15.25  )
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
 arch/riscv/configs/defconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index f399659d3b8d..18b50bf41b67 100644
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
@@ -46,7 +48,6 @@ CONFIG_INPUT_MOUSEDEV=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
-CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
 CONFIG_HVC_RISCV_SBI=y
 # CONFIG_PTP_1588_CLOCK is not set
 CONFIG_DRM=y
@@ -63,7 +64,6 @@ CONFIG_USB_STORAGE=y
 CONFIG_USB_UAS=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_SIFIVE_PLIC=y
-CONFIG_RAS=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_AUTOFS4_FS=y
@@ -77,5 +77,6 @@ CONFIG_NFS_V4_1=y
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
