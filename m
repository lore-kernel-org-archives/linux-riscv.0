Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB74DC433F1
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 16:39:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77B9A2065E
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 16:39:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T+8y4zZG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="V7roVDVF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="lrJh82VU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77B9A2065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BUYw+RVgL+NOg2Nskg17K/9Q7yGO5NLHWQE2e1CP8e8=; b=T+8y4zZGnwQIB8dPK1MbKC6hA
	GHSL8owaNyc09yw9dU7yY/eVZYJy/NyhfbZ94K46bj4hzcXSJeSAVyug54U3Ea4FlmsM2UctBqtAw
	DQmIax1Tvps8AY3P33CLjEyKfdTgVVSw6iMpLVM0AV5ZMxoX7jcjsL4DHcGP7mYsHsm8Y+j+G2SUu
	JbxNvA6wGsds4rOclT9a8i0rhS+dkERp3wxMbzrVfs2m0VYdoeu9xrneadYvEVEQaPrIPeJit/iUa
	UUi4JhQiQIpeOZ3ALmPJlxx9LRnRv7jEJz3gt9HHpUpIjWDac3gGbC5i+e3pcYW14Q43c7kcnyGfY
	qHPYrZm3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw6up-0002Ua-RP; Thu, 16 Jul 2020 16:39:23 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw6um-0002TX-N3
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 16:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594917561; x=1626453561;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=OcT87+KFhM8Fpo0DLDw7uMuG9bFsqRUrpQF9g4gDOFY=;
 b=V7roVDVF+9/OH5u2alePZZFIY1SPL4FEVSMOgimo8yO15dqyzdX9Y5Q4
 lQ1shf9VEagVE+JbyFp5UPl5ICeK3gZA95vPf1+5IPA1hG0aHqV6mc/UO
 5CcRWuNtNZ5e1GKvmLGlqM1FgfqEaJwkRVYniqRS8hLlom+kxw/YXQSf/
 l5wOjmWoiXZPar83iTh/hQQs15Gx6H1iQBDH0ai4Vw50zWQibUqTEFS6C
 8p4H9G7cUuTP/NV/cZIkNYnqq2Py8P1/I8D7SWY2LPMVsXnK/aVMYub8+
 63EY6tu+vAsIVk2J5cYbUrAuiVBjwET3tA0mrt3un2Zp1qBIKOFOAo6AS w==;
IronPort-SDR: 689afsba7GCAuecGE+bExElv38LYDx0WkMt1pTjM3EiIwSOm8A06FfZjCuSbwB8+ehQHRAYt3C
 93S6V1iSATwlSG9pClnT6550yeW/BUEy/tQL4RRU9DkrmhN2x3mjZ94NHcKQbi+AQE4zkSIuy1
 tsgeYfnzrdwhO/pFU+rs+ItQ8HgereZEu7NpcZ/G3jYDyZfX4P7tSDeWGkpf4D3KEH1ng0Dp4n
 hO1GOt+F0+TAfK6BT8NIq4rzE/IJfW/26Y7g3DlTLqpjbfFXhcPl2mq0YNiA8qPYMGwT4GgabX
 sTc=
X-IronPort-AV: E=Sophos;i="5.75,360,1589212800"; d="scan'208";a="146930596"
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hgst.iphmx.com with ESMTP; 17 Jul 2020 00:39:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sy3GrUfZ0PLXr9B6isP3faha/2qv/t5U/5JaSNT+Tq5gOm5tYADV1Q+P2TZDwJQq3xDiI7hA0EltdwGAge9XPRfFGSr8510pYrsompWj78eh8gZxpxZSGwpGv0raA2kwnHaVC25VdAxrCv6LI4NLae+V3PY1u3T77MMam0r8cIXTCrrfH/8eO6Tn9gcE51PW+ojaRPwj96IOb1aOMmSf7q68c4XSh7kiyTQunG8xF4fag1hccUn21JKB0h8F0yfKwAAPpIgwVmnr9OlrJAp5DwWCcYG6sIrZ1ecB34bVw1ieXR0s+2mypm45h8cpC5VNFGQYudoiacW1rFj6jd6ipA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcT87+KFhM8Fpo0DLDw7uMuG9bFsqRUrpQF9g4gDOFY=;
 b=gsZf0KPwbx4bEeObpxPdbXQrCOZs7YfJqeHWkrs+RlqQAMHfnh7JjP7qyk+E4tBaCmK6Erwcd9q1tjCTFtpSt6m40sF5s6K3YGugu7t7XxZtKPGn71j4pdtVBT6P4/miT5lLk/YkQWPZQ4ft9M9HvVpYtMlLxLEb2dVOnaQIPUizaZ9vadZmlAxmkf8XS/gpqNTzmc+z4XVg+qSJoE0FNDfG2JaAHU1fq7WTD6m1COaJQ0zDsa1OuezzaCdql/LhSFW7ckKxJsimBOthv3MOMhABeUsk9u9GYW4Lr1cu9OHSWn3JhvOHIJxIZNvhYqvGZ3uUtJjC4ELF4NAQD05HVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcT87+KFhM8Fpo0DLDw7uMuG9bFsqRUrpQF9g4gDOFY=;
 b=lrJh82VUBKaJ12ilYBR9m3P0yU1CCdqy9Jw1ZMuMjp8Chhe0h9t+1nmBsAGVM1WHFm6lKvOLrspklu/CR3qHHjxR4QcYR7gTt/Kid7vUBWOB8bcFeu4kWiNpgz+9jNCXHErJK4zoBdGAnrX3wOzc9IdBy2Pq4GMMcIWxCHErjoY=
Received: from BY5PR04MB6882.namprd04.prod.outlook.com (2603:10b6:a03:21b::19)
 by BYAPR04MB4711.namprd04.prod.outlook.com (2603:10b6:a03:14::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Thu, 16 Jul
 2020 16:39:15 +0000
Received: from BY5PR04MB6882.namprd04.prod.outlook.com
 ([fe80::5d51:59b1:8272:23fa]) by BY5PR04MB6882.namprd04.prod.outlook.com
 ([fe80::5d51:59b1:8272:23fa%7]) with mapi id 15.20.3174.026; Thu, 16 Jul 2020
 16:39:15 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Add SiFive drivers to rv32_defconfig
Thread-Topic: [PATCH] riscv: Add SiFive drivers to rv32_defconfig
Thread-Index: AQHWWys+Ht+QHg1RAUqvDfDsT6qM+qkKZkIA
Date: Thu, 16 Jul 2020 16:39:15 +0000
Message-ID: <edca7c9e9a8934fc66d09c7056e92a6aa7f0d645.camel@wdc.com>
References: <1594874393-23620-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1594874393-23620-1-git-send-email-bmeng.cn@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3 
authentication-results: sifive.com; dkim=none (message not signed)
 header.d=none;sifive.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2601:646:8e00:37b2:f615:7f83:6835:448a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3fa6677a-abe0-48f6-2025-08d829a6c72f
x-ms-traffictypediagnostic: BYAPR04MB4711:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB471105F46F1AE49B43440C4F907F0@BYAPR04MB4711.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mkz7kSjcArtS1ZgztJRgfArI8a6zLyfClAUjiR+kK/5rIRAy07O7MkkQdPxzDETfvK/ZgRa+TZqkDaNAaXI60aW/T+jO1SR5v5LTY9LsVWNuRePxjQVXypCl/YEL4n4xSL4AAaDGseo8E4qeEo59zWw+67gMTYXIyi1AtSDUIVflzPZjlmZ4FSq4TpCFdq1Hq+oBdx85VeegRjNUMla1wFLQftP9qoF06IWjFIFEgaU58aoXlpyRm32ChtspvGrPryWQtE2/+bCgWW15sWRJrZeRkfCInBUIU+19gg4STMG541J8yTiD839QaKKv0Wtpg/R6Bs+Cta3/E/nrG64xIA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6882.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(6029001)(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(8936002)(8676002)(186003)(316002)(4326008)(6486002)(6512007)(83380400001)(110136005)(36756003)(71200400001)(66946007)(2906002)(86362001)(66556008)(64756008)(5660300002)(478600001)(6506007)(66476007)(66446008)(2616005)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 3qhO+oE9JbO4/fzvqGFlDc2HHmKz77hGchRpzwy6CFf7hcLIEAY19bgoIgsaMMSVGPcmU7TVpmEVDA3A1blLbLFZfWIXn5W8xY8aK8k4Mp9fUEDeexa/ta5QEOtz9EgZzJ6mSSapXeD6xUbpOVWuur/AlTdsLQiGuQJrI1gdMc18JIh21WtO1UEEOnuMYXyfC2dX9hdsXIysNogeN6T2ShblDWe6sQxzCAqwrih4WFn93UTpZCe/ndt6Js8lYerd3KUuBYUeBCSBzNb4vNQpA/pumtVHkUlw+dTbEQ1UjPIlp9VZX6hqoXxLm4WUw1NDVlCOIHGZJQMUFkI21TuMvlMT+WQRNlfNrbfHhlR5N5wu74JAf03DIMkhl8WZ4vrwjemnPFkVpjiPYNQBHsI+ofaP2uh6IAYM+rE75CPWW6n+m904VvHrnN2+Vg2QYjVbtDGtkHdboB4n8sbQ+qQHDgWbw1PWZqQN69/9pqXjad2gi2doL2m7oTbGkcxAFq/IVR5ukcxL641X/QxakgOssLzyiwXVRDrqwyLH3ZW6ZtRfL1Mw6m1UcsHunFnZQcLR
Content-ID: <075FE95E888DA74D9D31303055259EF9@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6882.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa6677a-abe0-48f6-2025-08d829a6c72f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2020 16:39:15.4506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tyBRyXIkQTaRmZW/PkxEGq8+VV8Y+DZv1UfLtpTU67hUMbNJf7H49oICAcMEaoyTq6j5RBe9KXlPRmRlLyV4GrKqnDQlN1FsiA8d+TAAD+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4711
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_123920_997210_9F21E7E3 
X-CRM114-Status: GOOD (  16.29  )
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
Cc: "bin.meng@windriver.com" <bin.meng@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 2020-07-15 at 21:39 -0700, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> This adds SiFive drivers to rv32_defconfig, to keep in sync with the
> 64-bit config. This is useful when testing 32-bit kernel with QEMU
> 'sifive_u' 32-bit machine.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> 
>  arch/riscv/configs/rv32_defconfig | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/configs/rv32_defconfig
> b/arch/riscv/configs/rv32_defconfig
> index 05bbf52..8759501 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -14,6 +14,7 @@ CONFIG_CHECKPOINT_RESTORE=y
>  CONFIG_BLK_DEV_INITRD=y
>  CONFIG_EXPERT=y
>  CONFIG_BPF_SYSCALL=y
> +CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
>  CONFIG_ARCH_RV32I=y
>  CONFIG_SMP=y
> @@ -61,6 +62,8 @@ CONFIG_HVC_RISCV_SBI=y
>  CONFIG_VIRTIO_CONSOLE=y
>  CONFIG_HW_RANDOM=y
>  CONFIG_HW_RANDOM_VIRTIO=y
> +CONFIG_SPI=y
> +CONFIG_SPI_SIFIVE=y
>  # CONFIG_PTP_1588_CLOCK is not set
>  CONFIG_POWER_RESET=y
>  CONFIG_DRM=y
> @@ -76,6 +79,8 @@ CONFIG_USB_OHCI_HCD=y
>  CONFIG_USB_OHCI_HCD_PLATFORM=y
>  CONFIG_USB_STORAGE=y
>  CONFIG_USB_UAS=y
> +CONFIG_MMC=y
> +CONFIG_MMC_SPI=y
>  CONFIG_RTC_CLASS=y
>  CONFIG_VIRTIO_PCI=y
>  CONFIG_VIRTIO_BALLOON=y
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
