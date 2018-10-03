Return-Path: <SRS0=xmLI=MP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC651C00449
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Oct 2018 17:34:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B088E2089F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Oct 2018 17:34:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IY4oipXW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="I796YQCK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="iAjcXZoV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B088E2089F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zZc7h4dLYMsWkqBRjpbU0g1W3PlBmM55z249vguUmr8=; b=IY4oipXWZ7ALwh
	gXu8CvQwVQ9VdCZwIT9JZdYp8e//ghhzrRuFQ0uNMx76RpIK6OtYuyNRetDLI56oDxSb9g67uxB64
	+7FK6coHXsad+AymFoW3dwS7bgO9aFIhtyKjZYA1weSDNx0fn5Qx4p7Og6U0QhR3TewYjaBQhQlWK
	f4ECaVOyPnlR6OTyfswboWG18gEDWZec3Y+the68uh1ozVttr5BAam505ahLpIvqGyxaOWzwL7xLN
	5OKAlHoCU0ubKSobzbLxIc9Dykp66ewT1kPB81yLw5fdFlgo+TsZS8vQsOIBFLiJDV2nfd631Ys6v
	U7okrVPC+MlEPPAWRXfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7l2j-0007T1-8s; Wed, 03 Oct 2018 17:34:37 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7l2d-0007Kx-0M
 for linux-riscv@lists.infradead.org; Wed, 03 Oct 2018 17:34:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1538588072; x=1570124072;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=EKnHMnPYgR82DW6aHrYMBodrGRAnDrF6Vl7VHeWXPp8=;
 b=I796YQCKelx81TslqOWwCu8dhthhs1IgJgaUftLmaVSxBL8Ok2LFhgnI
 6tAKbuguK9ffnvU+vNdDD7IGEQQ/OJnUybAiXwn/1JlI33/eDZWFw23jh
 oS7pC25Rlj/12txhe5duf0prU8TeNrflJKVnUzdZugLr0cmaOGe7ULOxO
 wooeD/Pe6SgC60RwIA5TG1qqdtyScL1ALpD2+UTQZJqFyBgR6p8h6OZc0
 9iwfZG/TED+BhZwJAjf+5PZK6gxYDSmi/va15LHkUpKyq1slPTlb3Fiu2
 XvEK6dk29tsdJsNCFt6BZm5ia44OQRAj5rP9Vs2H9g3MjzjJY0sE6i4B9 w==;
X-IronPort-AV: E=Sophos;i="5.54,336,1534780800"; d="scan'208";a="92819997"
Received: from mail-co1nam03lp0022.outbound.protection.outlook.com (HELO
 NAM03-CO1-obe.outbound.protection.outlook.com) ([216.32.181.22])
 by ob1.hgst.iphmx.com with ESMTP; 04 Oct 2018 01:34:19 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKnHMnPYgR82DW6aHrYMBodrGRAnDrF6Vl7VHeWXPp8=;
 b=iAjcXZoVlHykk7sLSf/Fz4gohBvwhKt1vIWwCESpjDYyoQZvmc+Q1ZC0Shvl4OfPJusTSeGGcVBAXnIcD4eL5s4dhcXXbpMcq+SwG9B9usGqUy8bmYWDQZlff/ZXHwP2BmEXJkjfXPSqcfh76tBBAtojDxjgmnJj91gy9JkUuJ0=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
 MWHPR04MB0177.namprd04.prod.outlook.com (10.169.201.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1207.21; Wed, 3 Oct 2018 17:34:16 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
 ([fe80::f94c:102e:8dce:7c02]) by MWHPR04MB0401.namprd04.prod.outlook.com
 ([fe80::f94c:102e:8dce:7c02%6]) with mapi id 15.20.1185.026; Wed, 3 Oct 2018
 17:34:16 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "palmer@sifive.com" <palmer@sifive.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: VirtIO GPU in QEMU
Thread-Topic: VirtIO GPU in QEMU
Thread-Index: AQHUWn/CXY3CVhNHL02I7UNmIKu0X6UNyZyA
Date: Wed, 3 Oct 2018 17:34:16 +0000
Message-ID: <df1aafdfdad87b7febd3de63b308a8073ea51a4c.camel@wdc.com>
References: <mhng-e8ffbf9d-9789-4256-b808-6b6bc1a17647@palmer-si-x1c4>
In-Reply-To: <mhng-e8ffbf9d-9789-4256-b808-6b6bc1a17647@palmer-si-x1c4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-1.fc28) 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Alistair.Francis@wdc.com; 
x-originating-ip: [2601:646:8e00:dca:6bcc:38b1:fed7:e746]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0177;
 6:+GP3vZcPoiQ1LYDhiuvbaLSXqD/4Q82ejErUxc/mcQSDZLbQUwlD7V1e2CgFQA3dwHGzbiNn5DWDfJ4DzCIs97Wzcok9ZVBgqzeIYfxLIMK6jsZ907R4cKlnQ6SUFIQMAES4Gy2CMJll34jHPJl9Cy//b1stiYp2iq7y6L8J/u67cQWxZ/hgsZmOxhsWjqq7RBCmWB/dn8fMFgp/Yi8WXpcZlnGSIWMSeQrkK9bu7zGV+BzADvgrucjioCOxZucDrG9kniqjoo6cDdXdEofbXsUqLtHflZOVbIQw+SMETK1yBAdRPjM/vyVTdPIgPt0GqA3MPszcotjaDp0wCmxU+Fq2HRRnfUrKk+mLGYiOVFnzyEvHbsSXp/bQj3GH8EgPfbIVHo4pfJIOP4aLO6gV2VYyoNyK7q5WN+q51vL7h4nO16l5jQEalUbji4UfdAsjW5Yxj45Sg917SovVd6xkDA==;
 5:xUygmBX8dSyDBX8VRh9hiG3zP0d9z+jihlJ6392dInbPQ4jRYvpN5BCcgeqD+Btt571nLMgQblWVv40wJCM6fVCY+/71gQwCSrKmfNtK7E0NqL0hz6qZ/mjJCMkrvd2yHLv9S2qT9YP3sb2974rJIXbZNmltcTnKoENtv7N5ico=;
 7:s1LdmqIyybCgsE2wneVKYs07GI1GXkJj7AU12KPbfHiWgDjuuWj31KCx3w8JKwUT71e0/JIQzuJLcvw9zw8AChcVzqZmD73FVK+n+e7DdaRnfdcvKwingI2qMdtn2Y1kQe10GZr11yZO201N80LHmp88ONXqqAtTXutkQvw0Xpb4kjziK9cXQrQSISpWHSmD7ihMF8jQeCdUTTzOMcVye8w/24IdJXvBmS26QYvrEmQ175xYBIhyReUtIVAgLUYG
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 93f71b59-8e36-4e38-0539-08d62956719a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR04MB0177; 
x-ms-traffictypediagnostic: MWHPR04MB0177:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB01772D1DDB0A21904B9D326990E90@MWHPR04MB0177.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(21532816269658);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231355)(944501410)(52105095)(10201501046)(3002001)(6055026)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051);
 SRVR:MWHPR04MB0177; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0177; 
x-forefront-prvs: 0814A2C7A3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(39860400002)(136003)(396003)(346002)(165144002)(189003)(199004)(99286004)(3480700004)(256004)(50226002)(105586002)(36756003)(14444005)(76176011)(25786009)(486006)(316002)(81156014)(8676002)(8936002)(2616005)(476003)(81166006)(118296001)(46003)(446003)(102836004)(68736007)(106356001)(11346002)(110136005)(186003)(478600001)(86362001)(6116002)(14454004)(7736002)(305945005)(72206003)(2906002)(71200400001)(71190400001)(97736004)(6512007)(6436002)(6246003)(5660300001)(6506007)(53936002)(2900100001)(6486002)(229853002)(5250100002)(2501003)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0177;
 H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: YavYJLM/tBzkXmqi8nGaopRuulAS120HQFLOB/ISfyJzyHpFys5dZ0f4WobEEUFpWosQARFUB5BMH8ep+JSzAMvUiM0ZpRFFRKgTlDlAgF/Hbl60uwS1S0xDi5qercn4SJ08BZfCnOLoUHJRm6qHAYlhWPvEmiTm5N6N8pe5oD3iFhgrHacA758FQjhEzWis5/fDWYG1F26gGmtiDMxQg+jOP7ukyvEcFfeDGUIbQOT6951jdcs3CS83hHIhsuBHC7SnNltdxiB91B1T10OfFBDnjngCj606IxKMnjdrRVFxo3lSyWqfKuc8M0VLDOUQAIWhrP+CzybHPbqHDITCVXBnI/dePQ0aaX3GUhu+gGQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-ID: <CE1DB884B4284D4692E97885099F69F0@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f71b59-8e36-4e38-0539-08d62956719a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2018 17:34:16.7237 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181003_103431_175166_832154C4 
X-CRM114-Status: GOOD (  27.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181003173416.gTTgmzIhhZbGeSjn14LHAehhlLnKbUZKJBayM69RPJs@z>

On Tue, 2018-10-02 at 11:43 -0700, Palmer Dabbelt wrote:
> Alistair recently (maybe 6 weeks ago) posted some patches to the QEMU
> mailing 
> list to enable support for VirtIO GPU devices on the RISC-V virt
> machine in 
> QEMU.  I've been excited to try these out for a while and finally got
> around to 
> in this morning.  I'm using QEMU master with his patches applied
> 
>     * 3db98f2e2f8d - (HEAD -> vga) hw/riscv/virt: Connect a VirtIO
> net PCIe device (2 hours ago) <Alistair Francis>
>     * 2542422da056 - hw/riscv/sifive_u: Connect the Xilinx PCIe (2
> hours ago) <Alistair Francis>
>     * 8bf2bc25d2ec - riscv: Enable VGA and PCIE_VGA (2 hours ago)
> <Alistair Francis>
>     * 7e872529c291 - hw/riscv/virt: Connect the gpex PCIe (2 hours
> ago) <Alistair Francis>
>     * ac38103d897b - hw/riscv/virt: Increase the number of interrupts
> (2 hours ago) <Alistair Francis>
>     *   3892f1f1a963 - (origin/master, origin/HEAD, master) Merge
> remote-tracking branch 'remotes/dgibson/tags/libfdt-20181002' into
> staging (10 hours ago) <Peter Maydell>
>     |\
>     | * 0b001b3094bc - Update dtc/libfdt submodule to v1.4.7 (15
> hours ago) <David Gibson>
>     * |   8f09da690f84 - Merge remote-tracking branch
> 'remotes/xtensa/tags/20181001-xtensa' into staging (11 hours ago)
> <Peter Maydell>
> 
> and on the kernel side I'm using 4.19-rc5.  After twiddling some
> QEMU 
> command-line options, I've ended up with
> 
>     ./riscv64-softmmu/qemu-system-riscv64 -machine virt -smp 2 -m 2G
> -kernel /home/palmer/work/riscv/riscv-pk/build/bbl -object rng-
> random,filename=/dev/urandom,id=rng0 -device virtio-rng-
> device,rng=rng0 -append "console=ttyS0 ro root=/dev/vda" -device
> virtio-blk-device,drive=hd0 -drive file=stage4-
> disk.img,format=raw,id=hd0 -device virtio-net-device,netdev=usernet
> -netdev user,id=usernet,hostfwd=tcp::10000-:22 -device virtio-gpu

This doesn't look right, this is what I use (with the latest patches):

./qemu-system-riscv64  -drive file=/scratch/alistair/yocto/oe-
master/build/tmp-glibc/deploy/images/freedom-u540/core-image-minimal-
freedom-u540.ext4,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 
-show-cursor  -machine virt  -m 2G -serial mon:stdio -serial null
-kernel /scratch/alistair/yocto/oe-master/build/tmp-
glibc/deploy/images/freedom-u540/bbl -append 'root=/dev/vda rw
highres=off  mem=2G ip=dhcp' -device bochs-display -display sdl

Also make sure QEMU is commpiled with SDL support.

> 
> and the following diff from 4.19-rc5's kernel defconfig (which
> appears to be 
> mostly noise)

I tested it with the 4.15 kernel, I didn't have any luck the one time I
tried a newer kernel, but I didn't try too hard.

> 
>     $ diff -u defconfig arch/riscv/configs/defconfig 
>     --- defconfig	2018-10-02 11:39:47.831328320 -0700
>     +++ arch/riscv/configs/defconfig	2018-09-28 16:29:21.682511931
> -0700
>     @@ -1,3 +1,6 @@
>     +CONFIG_SMP=y
>     +CONFIG_PCI=y
>     +CONFIG_PCIE_XILINX=y
>      CONFIG_SYSVIPC=y
>      CONFIG_POSIX_MQUEUE=y
>      CONFIG_IKCONFIG=y
>     @@ -8,17 +11,10 @@
>      CONFIG_CGROUP_BPF=y
>      CONFIG_NAMESPACES=y
>      CONFIG_USER_NS=y
>     -CONFIG_CHECKPOINT_RESTORE=y
>      CONFIG_BLK_DEV_INITRD=y
>      CONFIG_EXPERT=y
>     +CONFIG_CHECKPOINT_RESTORE=y
>      CONFIG_BPF_SYSCALL=y
>     -CONFIG_SMP=y
>     -CONFIG_PCI=y
>     -CONFIG_PCIEPORTBUS=y
>     -CONFIG_PCI_HOST_GENERIC=y
>     -CONFIG_PCIE_XILINX=y
>     -CONFIG_MODULES=y
>     -CONFIG_MODULE_UNLOAD=y
>      CONFIG_NET=y
>      CONFIG_PACKET=y
>      CONFIG_UNIX=y
>     @@ -52,8 +48,6 @@
>      # CONFIG_PTP_1588_CLOCK is not set
>      CONFIG_DRM=y
>      CONFIG_DRM_RADEON=y
>     -CONFIG_DRM_VGEM=y
>     -CONFIG_DRM_VIRTIO_GPU=y
>      CONFIG_FRAMEBUFFER_CONSOLE=y
>      CONFIG_USB=y
>      CONFIG_USB_XHCI_HCD=y
>     @@ -64,11 +58,8 @@
>      CONFIG_USB_OHCI_HCD_PLATFORM=y
>      CONFIG_USB_STORAGE=y
>      CONFIG_USB_UAS=y
>     -CONFIG_VIRTIO_PCI=y
>     -CONFIG_VIRTIO_BALLOON=y
>     -CONFIG_VIRTIO_INPUT=y
>      CONFIG_VIRTIO_MMIO=y
>     -CONFIG_SIFIVE_PLIC=y
>     +CONFIG_RAS=y
>      CONFIG_EXT4_FS=y
>      CONFIG_EXT4_FS_POSIX_ACL=y
>      CONFIG_AUTOFS4_FS=y
>     @@ -81,5 +72,8 @@
>      CONFIG_NFS_V4_1=y
>      CONFIG_NFS_V4_2=y
>      CONFIG_ROOT_NFS=y
>     -CONFIG_CRYPTO_USER_API_HASH=y
>      # CONFIG_RCU_TRACE is not set
>     +CONFIG_CRYPTO_USER_API_HASH=y
>     +CONFIG_MODULES=y
>     +CONFIG_MODULE_UNLOAD=y
>     +CONFIG_SIFIVE_PLIC=y
> 
> I can finally get to the point where I see "*ERROR Failed setting up
> TTM BO 
> subsystem", which cascades into an error probing the virtio_gpu
> device.
> 
> I was wondering if anyone else has tried these patches?

I'm out of the office at the moment, but when I get back later this
week I'll retest my patches rebased on master and send a new version.

I'll test with both the 4.15 and the 4.19 kernel and let you know.

Hopefully then someone can review my patches and we can have them
merged :)

Alistair

> 
> Time permitting I'll take a look, but no promises...
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
