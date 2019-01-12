Return-Path: <SRS0=bvH1=PU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9427C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 12 Jan 2019 00:14:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8737920851
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 12 Jan 2019 00:14:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l3ZEtxjQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="rW4uujo5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="EJTBh6xL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8737920851
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ztj165SV4Ji/Ldf2oHHRFMWNl4U1UzpiOTnA+C9MTaA=; b=l3ZEtxjQxC/GSq
	eZjNYQ9LHA+mUSutWYTG0wn4zZUuF7hrfJ4YWB8caj80hHz61bVzpi/xJWiND/+TAfEJmMtIuzWO1
	I3YBa/N/wqV6iBihf4KUW7/slP2FBl4PDLW80t/gP/yNsvLkk+GC/YHRuKnPo/9tQfPpYHh/L9FOK
	8TxoTtwvxY4y951NV28cz8QDxwjicTC/Qk6gVYQjzyrI5zyLLCkQgnJQpx48ef+qyiaHGd0LKQ7iS
	nFnok07gEq4g7uMh6z01M8PIEp67ksBmzj6aY21Oi0n+63EQHFqrrQtBq8FFtD6MeEAOdRD0BlKq7
	Ftbcu4Wz065FxTwtF07Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gi6w9-0003tB-Rm; Sat, 12 Jan 2019 00:14:05 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gi6w7-0003sH-9M
 for linux-riscv@lists.infradead.org; Sat, 12 Jan 2019 00:14:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1547252043; x=1578788043;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=lVb5k/Qt1nVDygdtStjYDyPav21L0w/AtNqFGgrcjVE=;
 b=rW4uujo5FzyzA3ifpdUPf2SyacOom2soy6Upi/STWV4wINcp6gtgPpIK
 dbO8uCx1BEu4P17XU6VuG5NNlWP6vqTHJQxDqQ2MaXiI8OvCVlTiRvNwV
 ivZGf3xZVyGpUVzoxwQZ4N9YYh47N/P83w7RtqftKSSC6zVmAHyjgbmcG
 SvFaDV+CG3/AQtgQwjfolkmos32XKUj8f3/imd+XSOuf2tga8Hae94INE
 e8iU55Fv38Iw0ssUBmjvS+W/XVL72M4zdDBV50Hua8oAmJBEChItFc+vw
 dWcKl8AwPhSQTaBKqyI1+Mctydu78l1wEdVMYjeBeoztfksBJAndMFfvK Q==;
X-IronPort-AV: E=Sophos;i="5.56,467,1539619200"; d="scan'208";a="103535855"
Received: from mail-sn1nam02lp2057.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.57])
 by ob1.hgst.iphmx.com with ESMTP; 12 Jan 2019 08:13:57 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVb5k/Qt1nVDygdtStjYDyPav21L0w/AtNqFGgrcjVE=;
 b=EJTBh6xLNzXY7glGoS3o2JXbXoAvwP+ZPAGTXfQs0GdGwMwgdR8P6ttm/V4vgQK/t4xqlSSyWMiFkaPd3kUgWxl9CStwquQ8FQDvuIZCXQOLiXxMA8/KxfhyR4DSJqTFuI/vgTUcImDBv7gLPlRsc8S5LQLVrNt0D3NWcDYSE1s=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
 MWHPR04MB0481.namprd04.prod.outlook.com (10.173.48.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1516.14; Sat, 12 Jan 2019 00:13:56 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
 ([fe80::10e5:e75d:3272:2d33]) by MWHPR04MB0401.namprd04.prod.outlook.com
 ([fe80::10e5:e75d:3272:2d33%7]) with mapi id 15.20.1516.016; Sat, 12 Jan 2019
 00:13:55 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "palmer@sifive.com" <palmer@sifive.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3] RISC-V: defconfig: Enable Generic PCIE by default
Thread-Topic: [PATCH v3] RISC-V: defconfig: Enable Generic PCIE by default
Thread-Index: AQHUqgpOagOSSqCnS0mH6o+zJyJ+r6Wqw1MA
Date: Sat, 12 Jan 2019 00:13:55 +0000
Message-ID: <6f59c0101b53d70b4f9c63c156b59151d99d8034.camel@wdc.com>
References: <20190112000346.2620-1-alistair.francis@wdc.com>
In-Reply-To: <20190112000346.2620-1-alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Alistair.Francis@wdc.com; 
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0481;
 6:gDa9CZMfJTfmGAwXMrih+p3AlXVeRBqP8H9fM/yOHqf5oGx6KBjeEiorX46UN5xqFaw7GJdo4cWbGtFCFWiPX4jV1WnHjSbbDMEJX6i5sTarylL765PYe6g/hvEz23Y3AYzi2yDNUAs5/cGOOjL0YG5DNX6mtsXHw0zxT6jS0iiUyzCm3u4DhW/D+M5lA+bDwaa9gQtvEVYKOP8gqAvD6Qyir9PLtA9ZZCMkP0JWqRMhWEauWZAUQep0aAFtZLoBrc18CSoyVCQGSblSE/v6vRkU4PgvpNUQSCOwbBAE6MxH1WUHwIpMJs8T/LjjpQMvqOl1yFdMgX+w+u/qoq3OFRwd+GMLtkTfdnARQfIYt83IWEh1S22CXAPQ2WopyhfLbm6HcUGQ7UhK37SdyOr2lXnHMaegorpcxl/9eDyZOnX94+EcIpLbxZbs5LL9WjhbWw/epCFgGlijRn0Q0+Wnog==;
 5:mo4Vi6CvRfSRKrMz/vP2A/S2O+2vGgHVGAC/J4d+qBUfDOxL+E8PLTXuC2u/Iglwg5hhrwTjHPIVJ4qgfS/3bGSl1XzlrIuYMITGnN6kw9hQiYjiPi3ILcny5Ch/A8VDf7NTHsFFcM01KQ3YSN2RcPNWaXgZjLE4OVOK7BIZce3LJg8GHVjWYcv12B+qE1XSCsVEmhVCj1YOBZ8OCF52pg==;
 7:X9oMSZnsypyBt3e122ql5ZkJl28vQcVPijXDO/OvR/3xaIpQZxt+lTBnkXw/r54h0JMUTQNPO0DO1oBwiAwFXJjN7+6r8vdq9t1crSKxlN9rQu+Amt0LCZFbUCLNGlcJhCBOW7s+idmqfvj2mXQKNw==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 8f682d26-fb0d-49bc-81e8-08d67822d772
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR04MB0481; 
x-ms-traffictypediagnostic: MWHPR04MB0481:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0481358854E16B02D304A35490860@MWHPR04MB0481.namprd04.prod.outlook.com>
x-forefront-prvs: 0915875B28
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(396003)(376002)(346002)(136003)(199004)(189003)(110136005)(105586002)(68736007)(478600001)(106356001)(305945005)(118296001)(229853002)(6506007)(102836004)(26005)(486006)(2501003)(4326008)(72206003)(186003)(25786009)(6116002)(3846002)(2616005)(476003)(2906002)(76176011)(6246003)(14454004)(14444005)(256004)(11346002)(36756003)(66066001)(6512007)(97736004)(5660300001)(86362001)(6486002)(71190400001)(99286004)(316002)(71200400001)(7736002)(53936002)(446003)(6436002)(8936002)(81166006)(8676002)(81156014)(41533002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0481;
 H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sejnGhDEA8Axg8/9MgOmc18OdFK3Q6TFb9CM/shAITgOV8IGIj7AtMBF/8HQH6C63oaXmTyTLIFPp6b0GUTSEs61/gZbSi/2qpC8QNpmXeB3aMBl8oj10C+NsfTcOzvhHFD/CrqJIsw37GYfdEHZE2hbyKwFV9QbgTq9QDZTYiWAQpNlqgLgMLvYiIRE7rO+WEJs2f/9dzONrte6XgAahkIK5qVONoHs9kdUNFRmJiroR68RDwtQAPlJf46JWuQpZeu1+RtQVQXWnD3WfF1lQsh8O+dXTr69OtCvCE4kuu+lhAfDKTfY/SronEZAIknCiB/kAiLpLMHycEPHiKUMVeOv56Y96KOqH4Up1nk83JBcJ0MyXlz6w66oXG90PpXJOVMXpiHAr0DmH2y1h81tq4bhrrABIv9WHxte7ARUR+Q=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-ID: <3CC1A2CC90DB504EBE404388530AD8AC@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f682d26-fb0d-49bc-81e8-08d67822d772
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2019 00:13:55.6018 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190111_161403_449969_BEABB87E 
X-CRM114-Status: GOOD (  19.45  )
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 2019-01-12 at 00:03 +0000, Alistair Francis wrote:
> Enable generic PCIe by default in the RISC-V defconfig, this allows
> us
> to use QEMU's PCIe support out of the box.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  arch/riscv/configs/defconfig | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/configs/defconfig
> b/arch/riscv/configs/defconfig
> index f399659d3b8d..18b50bf41b67 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -14,6 +14,8 @@ CONFIG_EXPERT=y
>  CONFIG_BPF_SYSCALL=y
>  CONFIG_SMP=y
>  CONFIG_PCI=y
> +CONFIG_PCIEPORTBUS=y
> +CONFIG_PCI_HOST_GENERIC=y
>  CONFIG_PCIE_XILINX=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
> @@ -46,7 +48,6 @@ CONFIG_INPUT_MOUSEDEV=y
>  CONFIG_SERIAL_8250=y
>  CONFIG_SERIAL_8250_CONSOLE=y
>  CONFIG_SERIAL_OF_PLATFORM=y
> -CONFIG_SERIAL_EARLYCON_RISCV_SBI=y

Ah, this shouldn't be removed. Sorry for the spam, I'll send a v4.

Alistair

>  CONFIG_HVC_RISCV_SBI=y
>  # CONFIG_PTP_1588_CLOCK is not set
>  CONFIG_DRM=y
> @@ -63,7 +64,6 @@ CONFIG_USB_STORAGE=y
>  CONFIG_USB_UAS=y
>  CONFIG_VIRTIO_MMIO=y
>  CONFIG_SIFIVE_PLIC=y
> -CONFIG_RAS=y
>  CONFIG_EXT4_FS=y
>  CONFIG_EXT4_FS_POSIX_ACL=y
>  CONFIG_AUTOFS4_FS=y
> @@ -77,5 +77,6 @@ CONFIG_NFS_V4_1=y
>  CONFIG_NFS_V4_2=y
>  CONFIG_ROOT_NFS=y
>  CONFIG_CRYPTO_USER_API_HASH=y
> +CONFIG_CRYPTO_DEV_VIRTIO=y
>  CONFIG_PRINTK_TIME=y
>  # CONFIG_RCU_TRACE is not set
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
