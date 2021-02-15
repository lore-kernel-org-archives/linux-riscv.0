Return-Path: <SRS0=EWPw=HR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3164DC433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Feb 2021 05:16:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9E906023B
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Feb 2021 05:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9E906023B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=7UoNM7pBEYqo0qUYNK3qz4+5g1WEO+hqP5/kKQb0Fvg=; b=NFyJ4h5HPtBS2Qy9sHRLWklpl
	gFCv2nwh6/54dUrbktPSDLnR0SZUDvpR1rz23JSjQfo+EGGpI5PZvwijNG2TWDFRD0mKE77wuJRVC
	NRX+hqQ4t2H7wEDNPyR9Hk1Z5GgbcCtg8vZde7etIws1+ntmZALziwweTezFxYJ7Yrtsplv3/EBVu
	NSw2mXYqx780Y+4GQTBwp4s3Nq7/36ODEifpbvgz4OoW6+YEQXF3tiPscnbAOuHNACRYJZMBVCX93
	MYKEwvnVxswjkgoF/j/li3rx5l4adnIw4TKHqhvNHf5U9lD8TcK21mpcDoiwyCiirsj7GbU4U5XQg
	TCJ47f29w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBWFP-0003gP-Ae; Mon, 15 Feb 2021 05:16:35 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBWFK-0003ey-CY
 for linux-riscv@lists.infradead.org; Mon, 15 Feb 2021 05:16:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1613366190; x=1644902190;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=D6bzCunSNiQ0Epr1GVkU5OL9OEwUlk3iP7B/RVp7fc4=;
 b=C6Cvl6c+JDC+Gw+YsRn6ikZUJTYJoxGHq3Io3tJoPF6S6ofMqxq8vFqe
 7wJi7wYn3luZyTgxrmTAF+iD1q0nwMDWW3nd3cLySRe53Ks0AS9+G1oG6
 1CQ31nTYZWiuONfUWyWEubNbdCDoy8/6Oqq3/b+I430yOwqVt0H5aFO1o
 an7AiBZRn3a/hs6r2g5dn/l2JYyFwuQY7WPBo0rad2+4PF/16yoGb1YS0
 xCdV0Te3lZnPmKgkhTvZ04zKgUBpLRpukJP3qtLYAiOcE4j4Zn75UcYRD
 it/SKVcj+q4Xk1/Gyi78LalB/rGBM+OZRrAd4Akr8D0mXDhv+dGBdt9UH w==;
IronPort-SDR: 05Wskx26yFN892XkzY+zRl/DCAHJLFb40TRpGeRd7dyTLgZXVriCObjhv5MXpJJWsXQDbYT+jO
 FhZFZ71Uw7ungknVpKS07Nlhv20q6fwggrFnYftjbqfGsUu6mEz7Wr+sMA7iBW/aSlGLQTk8qT
 uJUFhyi129C2VNUgpEbb2mAVGGCPrJCc0+gy6QO7noe1lLA9ztCQEH/Boh9gR67NZFKroGKrrT
 YO4Or2hDObvTocfxTIFHJRGzED3abz63KSagK27KnYwQiCvrrM8JftFnJI/OXC2FTQqCFX6IbP
 UrU=
X-IronPort-AV: E=Sophos;i="5.81,179,1610380800"; d="scan'208";a="164442510"
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
 by ob1.hgst.iphmx.com with ESMTP; 15 Feb 2021 13:16:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdPpUckjuX8sYfi5IuG+LKIaTcYFcy3puigghRLwCALbAIReI62eqIgcT4LC1bvqM/rnQ5SVY0nJ7YaHbobAF2vbH3F+ebtRoMbP7IW1fhidHAfez8tl7cBln+2/HsPIwXfoWwYK8pW0gCGi7G7MGxi2no/zuL+IVh2oOy6+mG2jSBNGVOP7U1EBsg6xlYuTLtrD5jzH8/SaVyaWOCIxKzP+aEKyrK0ek8kRgF9j6hoWf2G/DpUo0VJiyvuKp8mq0mAntgfBzSoPBWrpfMk/oQxpa8cqOWaPKDVdYZMo2zn1wANhYgvYAd3EsWcXjoh3DY/4ih/+Q97H7X4OPMdbQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3+Y2PYEz8ZdLNa/f0N/B6lzCBnAz9BCv17kojjRn98=;
 b=JjaE/j4qcqSmrhER/3hMz+9Q3uWM+XHjeGMCuFYPimD8Piz8ZqT63kPZtHLiwIqpy8dIcr5zQaFNR1EMxbKdKy5JXju42bwGuVu8Cs3FNzT7iqTnpiuO9K+ySv5ATaf1BqGl/sSTQOyylmJSt5NqkbvoOAipeK281GQWE5ymcSDFLv1UPuUyx54ZkvKOns9PhCEffb/P8Chxgc+x1QxNH6i5VF9qAIVs7Nzen8XBeALy81uFaFK9neMKjTYVkeFoK1+RVo8BkMy/vXbtiXRaWPYMbEz87rtsepad7lL6Rqwk8oQ8Kq6MrVoVnvDfggQv5l1Ivuk2RoB9Pn7VH8ZsbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3+Y2PYEz8ZdLNa/f0N/B6lzCBnAz9BCv17kojjRn98=;
 b=WXAh4RXCo+e7xMr+xnWyvVlWaWzbwETxS5wdj0AJWlcVae63d9+iOQB81eBY4C1mPsDkjNv3b4LmPVUtOckzF3bFM1zcFcmHDRQtAn2MDlzUK6dfm5wLp4V1IF57y7nJoaO4yW+/p0mJ5Xs1HI0pAPdZymUZZoQ/GBPtvyMl40k=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6445.namprd04.prod.outlook.com (2603:10b6:208:1a2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Mon, 15 Feb
 2021 05:16:24 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%7]) with mapi id 15.20.3846.038; Mon, 15 Feb 2021
 05:16:24 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v19 00/17] RISC-V Kendryte K210 support improvements
Thread-Topic: [PATCH v19 00/17] RISC-V Kendryte K210 support improvements
Thread-Index: AQHW/2nyQe/49l3x+EOJmr/UBwS+7Q==
Date: Mon, 15 Feb 2021 05:16:24 +0000
Message-ID: <BL0PR04MB651402BC48E05E467AB130FDE7889@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210210050230.131281-1-damien.lemoal@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.182.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0841a25d-5dc9-4a4f-c396-08d8d170d6c1
x-ms-traffictypediagnostic: MN2PR04MB6445:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB6445C7BAB663FA5A1522AF2BE7889@MN2PR04MB6445.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ivgo4pSinJswrOIyn8hwzrzM3zHQ6eqvD3ZDU1nuauSqdi9gj7s6NctGNFASBDT04mpE0V2sWR+1QOifQhpT9fT4E6lULF8AEfempsJIZtbN3tL3QbGlcMrfU4T/RZ2pRzA7q5OZh/3BMY38pgI2cRawxnUISNDNYbN0Ym8UtR6/YKAjsoPjAY+F8XLcdo/9Lk/VHM3qX+EcSBIxWZgsFuoDhYH+vwxG/wMD8UsONOABYwM8lT5woTvHqqSppL4/YkGbbaU5nsxHDxIkwbwY1ZGjXgpQqqrnxf0+Y7POUobHZ9sJEZvyBlhO2+Af9KW2+hrPt9+K8UfBRdVoeWZBDOfiDu3khdGuVIv1owU8OvGAKrOiOeihkNtIiWnX4UEqGeQNBjy/RDtA2Rh8GyojL/xB7URzxQTvjytI4zsBQCzntsnuZ/Je5NqAw8FAeWFTmYrvtY7v9tKc4cSiY5o2628vmNRs8tILMybE6eOBolS2y4r7QQh21D8d/+nW5WYLtsx99F8523a2B0RfKivNrlL9TZ3Ma19ZXASCASCpe4/4MkEfOpLGfhMQhxN89hgjTYJumrwxQEq0fhiJhPFaH1MK1IGfTN1LOOs3Svn06Qphiac/ucJKI/ykWJsppWX7lgWVQCuRCZ9y8tkkSJUuZA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(30864003)(83380400001)(71200400001)(110136005)(54906003)(316002)(7696005)(8676002)(86362001)(2906002)(64756008)(66556008)(66476007)(91956017)(478600001)(186003)(52536014)(8936002)(9686003)(76116006)(66946007)(66446008)(26005)(33656002)(4326008)(5660300002)(55016002)(966005)(6506007)(53546011)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?yUfgek2/tJTabQU2watFIFTlgN77/pEDsVE5kxJcHM6i0F7C/JP47kmfW+RL?=
 =?us-ascii?Q?928dDLxucJstOp2BqI5DxnrLF3ovfwG5AMkqyVMmR7RFvCGvYb/f1PEycx/O?=
 =?us-ascii?Q?zf9x16tVCXt4oyIhNr3M1XyuMBCm87LBbx7V0KAxciGren6hToTcKjW0QURo?=
 =?us-ascii?Q?2b3JzMWHZ+Muh/egAh813zXDmFqS94rSNXpHSPmDsSd3g2pys/vnAPazCINR?=
 =?us-ascii?Q?e3dXIZMWnwL0aa8m0Q7eUdAtcwse42mflDaW6raDOEM4WCJ1FMh//I9lDOZE?=
 =?us-ascii?Q?p6qOdQXHlsEgEyMmCDEWVw5I+NHZCgTsd6Lvnp7ORcm7+xKUowif74aYRQza?=
 =?us-ascii?Q?NdiOoMledz6r0jiH7e0ukZRxu8Xpo077sfyw1IpE5cjwrPHcBEkZpv3HLtbh?=
 =?us-ascii?Q?CrDda/oC6kPSo8mI/PSPGcemIFedJlcij1AFK0nd+8xLi3qaQZwebjfC1zaa?=
 =?us-ascii?Q?VboNUKANPbtVIV3YuTELKeKu/5VyIiSnK1QBc3h+EO/9w0MwZkcNdbWebFGQ?=
 =?us-ascii?Q?y9b/kSNUdpwM6B+8PalaURmcA2c+p/5+ML1OeQ4bSqak5T0+owC1zx8cOaHG?=
 =?us-ascii?Q?+s5PbJfDiEqFKARmRWPkYOpM6EmwaaYMk+QqAqUihg0ulQ2qsBE+88Oc2FnS?=
 =?us-ascii?Q?ZHBguS2KwoKzLOi1OMtrpoS7qrzsrO2WdcO68rk+rI5RIFJtGaNpmYM0K4r0?=
 =?us-ascii?Q?kLH7qOF8iES7ImBIFgOekUlaF9qO9wwj+4kQJyFsRwQz0q0MsbMqtOKOosc+?=
 =?us-ascii?Q?3imBt5ppPUd8gS/GYIYjsAEoDN5dDoBzEhdNHXgUFSsO8tSand1DjSkVoRiT?=
 =?us-ascii?Q?coHrQe7uDjTHJLmbqLdbzwVz4huzZeQE4ri/0z0QkQC5I6AxXMzLOfStPOyF?=
 =?us-ascii?Q?dMgrWLYhUa4FQCL3XRlZOYa02Yh9GnO4JwojWgWUOh6tfijk+6I9cp7ykXHn?=
 =?us-ascii?Q?fCQaQDN13L01t0Dz+hIqPKQnutH2e9TUEbpZaSdsDpdI+L7s66Bzw4+9Qfr4?=
 =?us-ascii?Q?7PZAzGl2q41QtAXjK02qMg7o8RPodSp3+laOCbNA/C8i0TaTOJESZEX/RK92?=
 =?us-ascii?Q?Ie/5SD97fUbCAU2O826j8ulyWOlrvPRrt729GRDzAl5Bokes2bXVeFEKB0yD?=
 =?us-ascii?Q?NQdSNwc4jIISKSkpHRMr9Bfxai+tgtNlot0tGfWlUzOK6AtLPMoKCVDV7DYC?=
 =?us-ascii?Q?iA70HQBhn0iP0IMJ875F4BnalqUhq+cWmeb7yhMzNCWDthQ0vqS8KAlkEQCT?=
 =?us-ascii?Q?rRZzpDgzA5tzghwq+F0J4Q0biqxH9rj/cvNzLsGJQlRktqFTzDEZxo6NcjA+?=
 =?us-ascii?Q?2kupQ+aMAGOEtwPHflVyVf/Yj2eo1OOSGbOU8JN3kWCBog=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0841a25d-5dc9-4a4f-c396-08d8d170d6c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2021 05:16:24.1305 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: trTv4Ig9CeLtYtEpHQ71GGfvqkQ4qNdQODEXutZN+MgLXM3jEkviw4fbsj0yiDxkiDByHZNESaw8Owmj9c5ccA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210215_001630_885500_716604AB 
X-CRM114-Status: GOOD (  29.92  )
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
Cc: Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021/02/10 14:02, Damien Le Moal wrote:
> This series of patches improves support for boards based on the Canaan
> Kendryte K210 RISC-V dual core SoC. Minimal support for this SoC is
> already included in the kernel. These patches complete it, enabling
> support for most peripherals present on the SoC as well as introducing
> device trees for the various K210 boards available on the market today
> from SiPeed and Kendryte.
> 
> The patches here are the remaining patches not yet applied.
> 
> Patch 1 adds the SoC clock driver.
> 
> Patches 2 to 9 add and update device tree bindings documentation to
> document the K210 device tree files. In particular, patch 2 and 3
> define compatible strings used for the SoC CPU and for the K210 based
> boards supported.
> 
> Patches 10 to 15 update the existing K210 base device tree and add new
> device tree files for several K210 based boards: MAIX Bit, MAIXDUINO,
> MAIX Dock and MAIX Go boards from SiPeed and the KD233 development
> board from Canaan.
> 
> Finally the last two patches updates the k210 nommu defconfig to include
> the newly implemented drivers and provide a new default configuration
> file enabling SD card support.
> 
> A lot of the work on the device tree and on the K210 drivers come from
> the work by Sean Anderson for the U-Boot project support of the K210
> SoC. Sean also helped with debugging many aspects of the K210 support.
> 
> A tree with all patches applied is available here:
> https://github.com/damien-lemoal/linux, k210-sysctl-v32 branch.
> A demonstration of this series used on a SiPeed MAIX Dock
> board together with an I2C servo controller can be seen here:
> https://damien-lemoal.github.io/linux-robot-arm/#example
> 
> This tree was used to build userspace busybox environment image that is
> then copied onto an SD card formatted with ext2:
> https://github.com/damien-lemoal/buildroot
> Of note is that running this userspace environment requires a revert of
> commit 2217b982624680d19a80ebb4600d05c8586c4f96 introduced during the
> 5.9 development cycle. Without this revert, execution of the init
> process fails. A problem with the riscv port of elf2flt is suspected but
> not confirmed. I am now starting to investigate this problem.
> 
> Reviews and comments are as always much welcome.
> 
> Changes from v18:
> * Added review and ack tags
> * Addressed Stephen's comments on the clock driver:
>   - Moved MAINTAINER file update to new patch 0002
>   - Code style nits
>   - Use of __init declarations for k210_register_xxx() functions
>   - Use of of_clk_hw_register() instead of clk_hw_register()
>   - Removed the need for in0 clock name

Palmer,

Can we get this queued for 5.12 now that everything has been reviewed ? It can
stay in for-next for a week or so for build tests... I would really like to
avoid all this being again delayed a full cycle.
Thanks.


> 
> Changes from v17:
> * Removed teh nodes of unsupported devices with undocumented bindings
>   from the SoC k210.dtsi DTS file.
> 
> Changes from v16:
> * Rebased on rc7
> * Addressed Rob's comment on patch 7
> * Added review and ack tags.
> 
> Changes from v15:
> * Addressed Rob's comments on patches 4 and 5
> * Fixed patch 7 ngpios property
> * Added review and ack tags.
> 
> Changes from v14:
> * Fixed typo in patch 4
> * Added reviewed-by tags
> 
> Changes from v13:
> * Rebased on rc6
> * Removed FPIOA driver patch as it is already queued.
> 
> Changes from v12:
> * Addressed Rab's comments: keep SoC specific compatible string for DT
>   nodes reusing existing IP blocks (e.g. PLIC and CLINT).
> * Addressed dt-bindings schema file check warnings.
> 
> Changes from v11:
> * Addressed Stephen's comment on the clock driver
> * Fixed and added device tree bindings yaml files and fixed the device
>   tree files to fix all warnings generated by make dtbs_check
> * Rebased on riscv tree fixes + latest riscv for-next branches.
> 
> Changes from v10:
> * Rebased on riscv tree fixes+for-next branches. Patches already applied
>   to these branches were removed from this series.
> * Fixed the clock driver and pinctrl driver patch titles to indicate the
>   correct target sub-components.
> * Applied reviewed-by tags from Anup.
> 
> Changes from v9:
> * Added patch 6 to avoid DTS compilation errors after patch 9 is
>   applied and until patch 16 is applied.
> 
> Changes from v8:
> * Addressed Rob's comments on the sysctl driver bindings documentation
> * Fixed a typo in the fpios driver bindings documentation
> 
> Changes from v7:
> * Removed the __init annotation for the drivers reset, pinctrl and
>   sysctl drivers probe functions as suggested by Geert. Also removed
>   the __refdata annotation for the struct platform_driver variables of
>   these drivers.
> 
> Changes from v6:
> * Annotate struct platform_driver variables with __refdata to avoid
>   section mismatch compilation errors
> * Add empty sentinel entry to of_device_id tables of the sysctl, reset
>   and pinctrl drivers.
> 
> Changes from v5:
> * Addressed Philipp's comment on the reset controller driver
> * Added patch 6 to reduce the size of the clock driver patch
>   (now patch 12).
> 
> Changes from v4:
> * Simplified reset controller driver using of_xlate callback as
>   suggested by Philipp
> * Fixed compilation error when using other configs than one of the
>   nommu_k210 defconfigs.
> * Addressed most clock driver comments from Stephen.
> * Removed CONFIG_GPIO_SYSFS from defconfigs
> * Rebased on 5.10-rc7
> 
> Changes from V3:
> * Add one entry per driver in MAINTAINERS file
> 
> Changes from V2:
> * Add MAINTAINERS file entry for the SoC support, listing myself as
>   maintainer.
> * Removed use of postcore_initcall() for declaring the drivers, using
>   the regular builtin_platform_driver() instead.
> * Fixed fpio pinctrl driver bindings documentation as commented by
>   Geert: removed input-schmitt and added input-schmitt-disable, fixed
>   typo and added input-disable and output-disable.
> * Fixed device tree to have cs-gpios active low, as per the default, as
>   active high necessity was an artifact of the gpio level double
>   inversion bug fixed recently.
> * Removed CONFIG_VT from defconfigs to reduce the kernel image size as
>   suggested by Geert.
> 
> Changes from v1:
> * Improved DT bindings documentation
> * SPI and GPIO patches removed from this series (and being processed
>   directly through the relevant subsystems directly)
> * Improved device trees
> * Various cleanup and improvments of the drivers
> 
> Damien Le Moal (16):
>   clk: Add RISC-V Canaan Kendryte K210 clock driver
>   dt-bindings: add Canaan boards compatible strings
>   dt-bindings: update risc-v cpu properties
>   dt-bindings: update sifive plic compatible string
>   dt-bindings: update sifive clint compatible string
>   dt-bindings: update sifive uart compatible string
>   dt-bindings: fix sifive gpio properties
>   dt-bindings: add resets property to dw-apb-timer
>   riscv: Update Canaan Kendryte K210 device tree
>   riscv: Add SiPeed MAIX BiT board device tree
>   riscv: Add SiPeed MAIX DOCK board device tree
>   riscv: Add SiPeed MAIX GO board device tree
>   riscv: Add SiPeed MAIXDUINO board device tree
>   riscv: Add Kendryte KD233 board device tree
>   riscv: Update Canaan Kendryte K210 defconfig
>   riscv: Add Canaan Kendryte K210 SD card defconfig
> 
> Damien Le Moal (17):
>   clk: Add RISC-V Canaan Kendryte K210 clock driver
>   dt-bindings: update MAINTAINERS file
>   dt-bindings: add Canaan boards compatible strings
>   dt-bindings: update risc-v cpu properties
>   dt-bindings: update sifive plic compatible string
>   dt-bindings: update sifive clint compatible string
>   dt-bindings: update sifive uart compatible string
>   dt-bindings: fix sifive gpio properties
>   dt-bindings: add resets property to dw-apb-timer
>   riscv: Update Canaan Kendryte K210 device tree
>   riscv: Add SiPeed MAIX BiT board device tree
>   riscv: Add SiPeed MAIX DOCK board device tree
>   riscv: Add SiPeed MAIX GO board device tree
>   riscv: Add SiPeed MAIXDUINO board device tree
>   riscv: Add Kendryte KD233 board device tree
>   riscv: Update Canaan Kendryte K210 defconfig
>   riscv: Add Canaan Kendryte K210 SD card defconfig
> 
>  .../devicetree/bindings/gpio/sifive,gpio.yaml |   25 +-
>  .../sifive,plic-1.0.0.yaml                    |   13 +-
>  .../devicetree/bindings/riscv/canaan.yaml     |   47 +
>  .../devicetree/bindings/riscv/cpus.yaml       |    2 +
>  .../bindings/serial/sifive-serial.yaml        |    1 +
>  .../bindings/timer/sifive,clint.yaml          |   12 +-
>  .../bindings/timer/snps,dw-apb-timer.yaml     |    3 +
>  MAINTAINERS                                   |    1 +
>  arch/riscv/Kconfig.socs                       |    2 +-
>  arch/riscv/boot/dts/canaan/canaan_kd233.dts   |  172 +++
>  arch/riscv/boot/dts/canaan/k210.dts           |   23 -
>  arch/riscv/boot/dts/canaan/k210.dtsi          |  395 ++++++-
>  arch/riscv/boot/dts/canaan/k210_generic.dts   |   46 +
>  .../riscv/boot/dts/canaan/sipeed_maix_bit.dts |  229 ++++
>  .../boot/dts/canaan/sipeed_maix_dock.dts      |  231 ++++
>  arch/riscv/boot/dts/canaan/sipeed_maix_go.dts |  239 ++++
>  .../boot/dts/canaan/sipeed_maixduino.dts      |  204 ++++
>  arch/riscv/configs/nommu_k210_defconfig       |   44 +-
>  .../riscv/configs/nommu_k210_sdcard_defconfig |   92 ++
>  drivers/clk/Kconfig                           |    7 +
>  drivers/clk/Makefile                          |    1 +
>  drivers/clk/clk-k210.c                        | 1007 +++++++++++++++++
>  drivers/soc/canaan/Kconfig                    |   18 +-
>  drivers/soc/canaan/Makefile                   |    2 +-
>  drivers/soc/canaan/k210-sysctl.c              |  205 +---
>  include/dt-bindings/clock/k210-clk.h          |    1 -
>  include/soc/canaan/k210-sysctl.h              |    2 +
>  27 files changed, 2773 insertions(+), 251 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/riscv/canaan.yaml
>  create mode 100644 arch/riscv/boot/dts/canaan/canaan_kd233.dts
>  delete mode 100644 arch/riscv/boot/dts/canaan/k210.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_generic.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
>  create mode 100644 arch/riscv/configs/nommu_k210_sdcard_defconfig
>  create mode 100644 drivers/clk/clk-k210.c
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
