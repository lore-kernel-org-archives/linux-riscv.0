Return-Path: <SRS0=X6bA=GR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF71BC433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 06:50:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91FC5239A1
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 06:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91FC5239A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=Z+Qd5FQPHGyLLsTokPPqA5IyCIQYVXnDIIJMC3fnBCc=; b=l3kJnqUU7RLroJclPTOYOcSLqI
	HiAcX9a++gnVWHw3kmcg58tDYKeQASSSxtK67CqEZ5MNBI2vVkav8HPFuWMocCpi8hQ5PoRmIgnvy
	9Uh0JgfRYuwvD8wpEfGrASnfds3BI06Eysx6zN6Dl/vEcqGdpIdd0BHc3oNwmmI/Gqp8LC51PIuqU
	qZvHgNm5TkY+GfM+u/DHoAn3BQMZqC63ed3+T9AXFJJ64x1sdEIxtQ/YLqv8uU8AjBzXAHgc1OsIt
	1Kva0HlM8dNU+GmqQYaWRxirDTS04hvN/LhCIj4oca8qhAzB/gMfn+NRSAemIYV7XprN2uyg6swjP
	HA4dxtNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzwSx-0007wX-NO; Thu, 14 Jan 2021 06:50:43 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzwSu-0007vn-O3
 for linux-riscv@lists.infradead.org; Thu, 14 Jan 2021 06:50:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610607961; x=1642143961;
 h=from:to:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=Say7I4sk83JIG76bMrqmtNLIhpJEVFvDxX4lvjgRioM=;
 b=gvbIg+1rh3w2sWxzcJnJP6KJO/Pv8TzrToJJzQ5HxU6x1gXdpzGLcGmS
 1D4Ag4SqqSMufWKrPmBd1VfLKKFOWWMfw66s9+pa9f0Rqcfr7R3B2AqKv
 l8PsHpmMzSlHCkehylpp723pBjFslKvzGhoVGKP9YNzssbvIJaa6wue5f
 9+cvglV+DkLvihqxFOthoq8dDXFS5GqMHSO8BTtYusPhBNnu1Ji+n6YRu
 ZyBP/mLbcHGsjKFaIxTW9UvGUx5E/uNUW4Zm2wtLZy+p3qoiUt1/681Bf
 dH/YIfnPjYH5IuHWsiB3oClpwybOqIbnTvs70QMyvqbcsk5KafgElUOSV Q==;
IronPort-SDR: fHD4P4BVpdV0DrBrpH9ZMKWyea3jRhMhJUyg7cqYXsbNS9q9VlYm22HJQzumAqu4k2fO0I9JX3
 psfVQ2nvxL+Q5oaWDnzT7mfRjZtQl0aAERZ5fcOvnsUNKyvo/hmcCWBAURt6wPfX350ASJhcaD
 uTeDpfJzcQ9hMk9wzP5aC1s8bHDF4V+Cb+gAAZMD1lmDgcFW/IABwHnL5DM+VGgiiP6WhM+4ps
 KhLKxKL+05Y8+v6Dzt7E9OyCv7/AzvKsj8VP5WEj0I0IM26sAoCuYIKJyx/cu+t/O9aV1j5g1W
 S0c=
X-IronPort-AV: E=Sophos;i="5.79,346,1602518400"; d="scan'208";a="261311015"
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
 by ob1.hgst.iphmx.com with ESMTP; 14 Jan 2021 15:05:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RTUmFBlzFCLy83C16o50ER9giOcv8qboglvf82A0lI6GuGETYRm5BHsxdcMGQP5VeNnea5J5CBs/trevOAn2nMF6DG83TMxKhUxRUTltCcUOgkBv9zQ8XknOXlkmygV2TrdQNLs/HwBBUvNisc0iYAshqZHDr1ZHCoGrKv7chn45X3bMZ0JqgJbVAawxmVf8I0CdNaa47QF/1zp8QXrsedPkFO2YfSAhjqkTAwlk1m5nqIHC08vCcSjD2XDPpNi0XOGRcqTps5KpRPvg9lkk5pwqvqzFn4FOa730AVOi9lccHOhGrQxzLXvHfQCAc4TE0fVnv8vFk3bpuITHjdYMsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZ7MW74Dvso3HQTlrACV6Qy9C0tBhgH/JsVqN8OEau0=;
 b=f4JVy4uuaig89MxLz8mjpqIGL/vadE+tHlWJ+LdZS6QTu22Z7hlki6Rex0COlj0aA4y7fDP0tAaNUboI6xvWoL9mKat6SHrejiJ6E8qBeD7ZsDQtaQgEbPAgpVmfMX+vtercAyD5OC6lp9XvZlQEtiTxCi3Yjf6aWl9dbj5Q65z5Q7Y+R2Ut4k01OmKJ/TlJHY3WRO1v69e3v6rwnt2vYtb2ac/spdn8XeVdiF2LA104HPPqv3VhzfKVmVZm7IVWcbqD0Sjtzh2tpNwtwc1qqpNp/pL8Xrg94YF05XM9A/bPMBB+6WPh8oqCbFiV482FP1dGdVCftVA82/QMnCxAmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZ7MW74Dvso3HQTlrACV6Qy9C0tBhgH/JsVqN8OEau0=;
 b=c31WwNTpjpb+CJrZ1OFu4BMKtb0SD/h1jRX7ape/3NVnBQ8Mmi5VFCjK/zrfaR0wR6gEyUL+MoAAo2WZ8y/ECBSsZkQHJUKQrAlTjfDe+3XySEQhQmw9O5XdXoUsL4s3qLAvhUeWfRXwy4dqexR7fQVik2SGPgtUU7Q67SiK4Y4=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4977.namprd04.prod.outlook.com (2603:10b6:208:5d::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 14 Jan
 2021 06:50:36 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%8]) with mapi id 15.20.3763.011; Thu, 14 Jan 2021
 06:50:36 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2] riscv: fix build failure with Canaan K210 SoC
Thread-Topic: [PATCH v2] riscv: fix build failure with Canaan K210 SoC
Thread-Index: AQHW6ZCgmg4pqNGJpUG8TQGkRYwf2g==
Date: Thu, 14 Jan 2021 06:50:36 +0000
Message-ID: <BL0PR04MB65148043472967F37CA27774E7A80@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210113094353.401690-1-damien.lemoal@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8c78:be0:63f5:4b05]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6d768d5e-b16a-41bf-4043-08d8b858b26e
x-ms-traffictypediagnostic: BL0PR04MB4977:
x-microsoft-antispam-prvs: <BL0PR04MB497730DFFBE84F412F4FFCD7E7A80@BL0PR04MB4977.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TA1dh+3oz7LuRj/VIy8LmS+w5t8h4iYEcXxkwjS12vxtTRI38D1a8tOfh7HIi6iTaiA6SEjlwzT2VI/0uHzdo43dDAx/yChevjNv02R9xfsgx3KMpa1BVDmdavT9h7REu5wNKFCrZY6dtqZEeXVJXGensj7RkksYe/QFx5PPSvu85gMT1LTojYMQRVVZH2quTIWCEnvJBio44RARRPl61JOlVJhVzQKyOQz/+34l8ty7IWsNF5GxYb6L3SDhHISbiIAQ6VTAL+Ya2HcqKZXbW/qCoVuuOMW4sdgvmlygPT6K6c2SZiI7v8ClRt/965NQpm9VM+jqzBCobXCM/58y8jlqCWcV/bw0f6fJfp5K9nbR2IQ36W5th68xxbWXDxWJQKGb3HzxA/Wr8lZYVf/Oow==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(6506007)(5660300002)(53546011)(66556008)(64756008)(91956017)(66476007)(71200400001)(76116006)(66446008)(8936002)(8676002)(316002)(86362001)(83380400001)(52536014)(55016002)(9686003)(2906002)(33656002)(7696005)(110136005)(66946007)(478600001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?11OyMN/y4YhdYRLF929Uz4I1CyvidEoM2ulcSiDhddz+SucuGpvKpFiMyydH?=
 =?us-ascii?Q?PDr46J8x0pqYKiMLIRKxqFOjPNbA53Z5GcfrVMW4YQ+b2lHjuJ2EUzhcWk30?=
 =?us-ascii?Q?jbTp8f/pWVkBEw9dDOccXjYYaAwlOL3kZI0Bzc0C+ZIhmmhrJ1OFemfUNIxv?=
 =?us-ascii?Q?j+ArJXCZg20NU6zZyiognrkAaE6DeDkxd9MRnvdQb3yY/dKfXLxcCmcUSBAK?=
 =?us-ascii?Q?exaT9hMwkz2/hcE8Yp9jhusl7Ou0dg0Dec0LAqYsKQ5prSSkvNtkPuGAenIX?=
 =?us-ascii?Q?iH2DeCb1CycLGvcn0Lf7qvf1h342zBbug8oRCGgnR/nwE3yvz+SYXLn3febx?=
 =?us-ascii?Q?DcCA6mDW6293UHLN15gI3CsJkYzimn1u5wJJYtUUASWB5Kb8qAl7XE9jcvLt?=
 =?us-ascii?Q?bZFsfUKmElfgh/DDEQx3+kVeE/Bl5ThG5EQQU0rSOTvzNj0+h4QjYcePoV4N?=
 =?us-ascii?Q?5mFM4R8JyBZsARD3OW7OdUtnuCbHIMa5HetIUVnhh14A3SGF4ZIulX26WAkI?=
 =?us-ascii?Q?vDLc8cs8H+13GrwQkfnxSuWEHqHAC9/BYtfoJhBxnpsR21JTDaX+HWEC2PAp?=
 =?us-ascii?Q?iGuP7hWyiPkDCOiUrX7K0W2ggQ9TchX0FG6f751QTkyKsDacLHgv8d/Yu4fg?=
 =?us-ascii?Q?GCeTs+wM9AR9x6ruXONN23RKhlPX4S30zQBHld+ZxwNvv+caNsWYRFrUtRma?=
 =?us-ascii?Q?Ixh9FQ1WCrgH+iJ9L/uxmRpJY1rHoMFxaz0sPC6pJBYX/WyOK+yHhKPNtkkz?=
 =?us-ascii?Q?m6PyM6cTY+aY0LPUUNfSuJyqAnctEeObCIO7d7AxT0v/2T2IYa8YOpI3M5FQ?=
 =?us-ascii?Q?ETi/DsJp+WuAIubdSFhLrmlhkH06qAbKIOXHQSxjWdcVq+Mkx39JWw1OkteH?=
 =?us-ascii?Q?tgjpOVecejyZI59BRaiFAgdeRfEtiVE0jNzTL4kThSQl5esB6xC9ji1j0VBp?=
 =?us-ascii?Q?V4ue5giTACIit6/0yiXyFeQYkdR7d/gghibiWC2m+ScABQjDN8voguVzHCBk?=
 =?us-ascii?Q?tm+BylZ+4HK16DYvczA4NSRw/OC7fe8JW17HCt+aga1qtbUTcxPWlvbwB1zD?=
 =?us-ascii?Q?bHVuXy0K?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d768d5e-b16a-41bf-4043-08d8b858b26e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2021 06:50:36.2052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WIpQL5piGloHnlWOagsHAFG6ENnkD4KVZIpjZAMRnHe4tYHg8ZvEVZKTJGN/Zob38qnuE6ZKrKnnUVEH2CrPmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4977
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_015041_150889_C6AF74F6 
X-CRM114-Status: GOOD (  16.13  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021/01/13 18:44, Damien Le Moal wrote:
> Fix riscv dts main Makefile to avoid build failures when
> CONFIG_SOC_CANAAN is selected but CONFIG_SOC_CANAAN_K210_DTB_BUILTIN is
> not set. In this case, the SoC device tree should not be built.
> Avoid the failure by changing the canaan subdir inclusion based on the
> CONFIG_SOC_CANAAN_K210_DTB_BUILTIN configuration option value instead
> of on the value of the CONFIG_SOC_CANAAN configuration option.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 3c54e3125dcd ("riscv: Use vendor name for K210 SoC support")
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
> Changes from v1:
> * Add missing CONFIG_ prefix to SOC_CANAAN_K210_DTB_BUILTIN option
> 
>  arch/riscv/boot/dts/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index 4da40691c55b..7ffd502e3e7b 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  subdir-y += sifive
> -subdir-$(CONFIG_SOC_CANAAN) += canaan
> +subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
>  
>  obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
> 

Palmer,

Ping ?
The kernel build robot is complaining...

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
