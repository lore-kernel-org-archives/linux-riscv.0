Return-Path: <SRS0=uLWX=IY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6023C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 07:47:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B7CA61A32
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 07:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B7CA61A32
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=xBoAIaLrFeyDrQAxRZEoJ1pMg6FflXqQvZtvyn2whyI=; b=IRgJUsFHeCmHoekayYaw9SHiN
	cOGfaA20IWuBNcDrSj/UfI+i+e+JChh0QlCUjpQkvmGyZC/1pEmVVmKTvHbqZ2fFE8Xuzk1H3WXEK
	3rbfntko2Ag1F9renZ+qgJxBVshXU6T0sEthcdd4zEfWS/1NIVpW23oEfXSOg92XZSavI1zSwQzdT
	Q0ULA9NoApRmBoDU4R3VTjF0Zz26mg+TICm8pmjR9gii+K2gCghXI8pVO9Q6XnBDz+fpB4P9p3qbv
	fCl0nbITj6IRA1KKqs86eauk9IEH8CSC/XRy3RvSWLKGWZCx1nAUi9F33/LcirW6x6xmE3nL8Q3Nv
	Fetp6l//A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPhC2-002ypT-J5; Fri, 26 Mar 2021 07:47:42 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPhBx-002yoS-IB
 for linux-riscv@lists.infradead.org; Fri, 26 Mar 2021 07:47:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616744857; x=1648280857;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=h4p2jxvYCsfJoT+kVXMvTOCkZgGwTia/AoibRNrIwkQ=;
 b=gxvg0+xFcigegFjQBJvAmNuLeeynRR+NhtO5IbUvPM3J0UbnO66ueQg0
 lvX5c4+g/akgRFjSHIP65BYotkemy8PpDDJIIo8KeB1QeA6sWd7XT2a7z
 8E2GjhG1QZWn2fI8gTGhvl1X/rWn8WNBuVtfQZMXIknvfTt1fH2LwvtXb
 iHBi6KC9yOc09+7sxx8SgAM8Y6CZcFtbACO+5kvaFeGfFIhph9tMpnW/V
 584TE6cNIm59ilkNyY9ZfKXtwct2lk9ZqL2BLp8Y91ahAf4/oiQqoYmj0
 SdstC7flj9LXFK3uUyHmIKjIGkiUxrXsgoYVAS4GIomWZNaV0SGYghJf0 Q==;
IronPort-SDR: Wjjs8hVngIiXK+dMsd675HgoOjSh5KlDPgFbMyXDtz/e9SsUb9vZFlYhLzei9G+CA6eWb/5Svp
 aWmFTCGCZkNo/eiN92q3pEqoTshstqhsIgxCM0Xz4l2OJOvcdTazd/rJVGfU7cHAn4CJ+NbOg5
 Et4oP+rACEwjq2+Krhzrw0VHRoEiwylWMIVF8BOivMeOMCN8vGjk8O3m8g60r15N2MD8Pxv9eR
 FSQ89TBa8ZV+sq04e+400gcqd6tP4nvYp6rtRzvTdEp9FVR4LoTE+A5D/6tkOq4OthsT5K5qtw
 8ig=
X-IronPort-AV: E=Sophos;i="5.81,279,1610380800"; d="scan'208";a="163064259"
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hgst.iphmx.com with ESMTP; 26 Mar 2021 15:47:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4K/S3GUTGV+SQW31mRexyPt8ytJVKFe5hE0b7ckI/Uw8yiMJP1ERh/V2ATsHajnjHdTXX0/uCajnzVEzZTcyv5XcfHUlcBkXMWLeYk+kEhfY+n2FBOEonA9nzprX9OKgd1h2XxjCbdbwrDw9rfehxDzUvQD9CXssMuRIiMBsKsIACEOJAJkMz/gqN8Nt2R34y8gvLVhRpTL5rWYAGjqWAAiUnwewSSzmWyHPJ6cMFEs9FpSpCOcTA3biOeDadTLeScf3BMdkgd1gdoCopkR7nNScqAt23hW8c0Ir6tREG9IVgKqOIMQXgc0qZUnaMvGoXBMyF8cQWk6ed9i/a8pGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYmBaW02JHkmfAAKIvFJ/K2pJF79zbdFymWoDa9Batc=;
 b=kKy9Wsc9tZ5Vhs1M7SwPF4ZnwTpz2s2Ks4cDYua8SoWAB60eLfAMDqCellhUpXf+UDl//gCxaO+Us8CFQ8YjjppczxBBs7ekeB8CFlJw7qKo+8E2tG/wijcTzPCTFgXg/brMTT8cYwKztWOWYvJThezzp+/k9NgwA7D27AzrEMnDcIHi9XM15lNRcVdRjO3J5RGA5DpVXDCdBkMQPAoxd/Vhfi/IVHRnXetCJd4e/caOYomw6lXj4yYLoeRUeQcY29EsfVyDngx6cmLw3WFcq8xMjkpGHEM5T54KeaQ7RVsFBQ0aCqV/jzUFDGGqZtkjYKGIOZp/FLFFHfdBePpgGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYmBaW02JHkmfAAKIvFJ/K2pJF79zbdFymWoDa9Batc=;
 b=c8n718Ssqb2TVj/Dj4GC/kOBCULcgJl7S8BporMq8sk3oLV8QzUYKJfe/Cy+/4MoeoFWAk54TDok+0+9VONciRkRs7GbT/lWsS52ht9gnxycvpEHGI8fEPs3UzA3VBuYLKLH+uGl4+t2dFweLb0F4S8CBU0y85UrYDIKXupzr+o=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6538.namprd04.prod.outlook.com (2603:10b6:610:35::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Fri, 26 Mar
 2021 07:47:29 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::1c4d:48a6:b00a:1ce5]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::1c4d:48a6:b00a:1ce5%3]) with mapi id 15.20.3977.024; Fri, 26 Mar 2021
 07:47:28 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Zheng Yongjun <zhengyongjun3@huawei.com>, Linus Walleij
 <linus.walleij@linaro.org>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Hulk
 Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] pinctrl: Remove duplicated include from
 pinctrl-k210.c
Thread-Topic: [PATCH -next] pinctrl: Remove duplicated include from
 pinctrl-k210.c
Thread-Index: AQHXIgoRlHFMK+uZcU2ly2i2YremGQ==
Date: Fri, 26 Mar 2021 07:47:28 +0000
Message-ID: <CH2PR04MB65220AFC59558EC54B9FFE4FE7619@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20210326064804.3262477-1-zhengyongjun3@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8539:9440:76cc:73ac]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: efd2f01d-87fa-4dbd-c550-08d8f02b67dc
x-ms-traffictypediagnostic: CH2PR04MB6538:
x-microsoft-antispam-prvs: <CH2PR04MB6538FD8CE7475B537DBA49B8E7619@CH2PR04MB6538.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4o4WJZWmIsr/MQ30Q3KyHZ7UhNKy4eTCV7PCYA2B9518UM5PmncRjdimYzp1ynNK3UhPprm09Njt0BbwjEBZkvvNIYCYy6Fl0LShrMgV2LFUKRJ44v3NDnsbStnz6Jiy1Oibvdq0D1PcI1PUBNaqLzDdX9d3SJlOxmh6pkHGEEIXzevIFHrRtkU/FkOlWfbxc7Unejg6/OdtsywyV7qG+C/MGIymoeoy757VK6zm58meH1BjO2Qk3api3RzVuD4pynIc6NeDRGDQhKlbYsm85X5aLADKxEF0UabcBhitD7CI9RnEiNiKWv/w6w7PiabRrkPYoMEk/jeXKBrn0+CQ63kEfgWlWmlt43QlGXYxU7W+mH24hUSx7+jXr6WZ6quCl9NnUDK5J/YUNTFF/5Sz6P/E8kEsX+BeVklcBglMnxCOCO9zr/pPXVwYvcXp42izrABgXLUo6Vnl/2OdfWQvVc5Sbwqi2/56cBKizfQ+ljpqfQexfR5FpaXnHu74qK6rLIwRjq9FdjHpgt8uSFeKqTlzM0Jc5zGvVk+8Xg6oPF5bgYhJ2tIZhaZi6DDq2R/Ztleb7YHgFAP7uQB3sFoMfAMLtIIdvmymcMfpSh64EAs0hhOaAiT2sETvywGp3YDVT3JeNFDzbPxMtyCDSgm8CIHyDNOkTH0qA1x1abSwEzo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(6506007)(53546011)(9686003)(186003)(83380400001)(7696005)(54906003)(5660300002)(55016002)(4326008)(52536014)(38100700001)(66446008)(71200400001)(2906002)(4744005)(33656002)(66556008)(8676002)(316002)(8936002)(86362001)(478600001)(66476007)(76116006)(110136005)(91956017)(64756008)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?EwyLMDElTq/MysmuF7sYbjeZb4Zd+wzMGA2JzTF7Lx2Cs1LsBHJykjVuOV1T?=
 =?us-ascii?Q?4SfR4qt63M5zQuHYNcFBM020mZSf1CareYoxwmC/fVYKmvVPcAo/bKrfiItl?=
 =?us-ascii?Q?Mfx2J0nRnFbaS0XRVGAfvZBPvd/36SE/x87OXkuQo2lkfNEoAzRz9+4PMXuS?=
 =?us-ascii?Q?rPQD+LUhpGpObBaY6Gkj3X1oBnAhzOS1W6UBUXzSV67aI0xb1NwiisAm4dCF?=
 =?us-ascii?Q?vDyeT10BuyrkuBCfpUqnS8HF6CWbHlRqhYG1IZG5PYpM6w85nn358+L2WIzz?=
 =?us-ascii?Q?ZzFAiOH2FwIZ+b1dvxVEkdYwvkBEfKiAoLSN1cCRUpK9qpvVxXyiLGoLZI7F?=
 =?us-ascii?Q?dfVVDoi7MmVCf8yxdg19CCzzqG9psCf2qWxFWya4kMyJDqYXUbBZt8xUbRmF?=
 =?us-ascii?Q?Qce/eAR0WY1Nv4nCQzkhVypX3wDusFejAEjxaDrgZnHxTS/BatTDy2+wfz6X?=
 =?us-ascii?Q?EgZg2N+HiQ38Aq+y3yZwzuFCEtgt+P9fsmfvaAgD0CYPJvmO1Ov9O3076RWB?=
 =?us-ascii?Q?qb11rYV2KSkFLj1KJ49jxhabaWEuGWUvfSBz9+8LIfAjBbCdRtNIDeYMXVVY?=
 =?us-ascii?Q?ad6lNRoDB4vTK5cpfVk4kkQIX3SqNvnd8EEGrYJ8HQvf0hFARx+5f3TDH/Cu?=
 =?us-ascii?Q?nqAAzmbMT1+DYUX9XChhSLv3Wm4dWjdRVqSHczeUAiO4dppkZb/oJFR0lbFU?=
 =?us-ascii?Q?r6NkKuC44rhWaki1ur/3TVbv630ICw9lpVnB7AB2pfGcYHCyzVdII50hjUHk?=
 =?us-ascii?Q?vtNr8RADeo8i+ozjTgIveW+CodrDsA2ZxHgb2rvU3VOj+AEFA58HOLStlIxa?=
 =?us-ascii?Q?o9DjzIW2WI2DXP3SDGs2lywZHCX8a+dIZuGc0XYsj+cYSsI2knw1Xz5BEhmp?=
 =?us-ascii?Q?ARdlbYvmLMLUVFfrLidqOFLdC4jxbctRdd0MGm1V4aJ5Aoh33VzIJB/fAMPQ?=
 =?us-ascii?Q?j41P68c8nOVgNuzGNmmEJv+UAp+AQyxZ0Q/wnACXKLsmyh4PiCkS2MaNZjf2?=
 =?us-ascii?Q?BE/ohZ3Vk5qu5mJExkISH9fzEc8prBBg5sGlgp3qZHNSJEkvh1WoVRcX8J75?=
 =?us-ascii?Q?QM5ZKSfLDejtO9V/Z8TMgvE0y35Hcr3n2FqslnRDJorEjg+9l9eJE9vtXhQT?=
 =?us-ascii?Q?+veXiEKUMX7y6HwczVd+I8FmkM3cJX0q1NU2VkPYD/wMnNrubz5074OJicvv?=
 =?us-ascii?Q?oFCMEQLKsrycyK6gh3dCFJhkOt69yEuBicE+tVb+p7BdgfBu4NHB21mwUhFf?=
 =?us-ascii?Q?BPoH6sTuDrSm+4u7cshgswAHKSh/3o1+p5+4XtZzOIrYQbtPXeDoJpuS5TyU?=
 =?us-ascii?Q?UnXNAqws25UZkd9N1iNUyJHgPTC+Mx4kZx2pkJsVnvNuvI4gvSUYxI/PFKGD?=
 =?us-ascii?Q?HdEkv0nrYgIqTntjFOACNi35IMEBfU4qcgDOX8TxqgtpQxyEvw=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efd2f01d-87fa-4dbd-c550-08d8f02b67dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2021 07:47:28.8462 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uu+IIWeJj41eNgZe83v0By7N1eO4BCevEzyGXfSjB5iTLVniBjkb9Is678GThKqeJKysA7kEPy0diowJMZnIvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6538
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_074738_292538_85F0859E 
X-CRM114-Status: GOOD (  11.30  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
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

On 2021/03/26 15:34, Zheng Yongjun wrote:
> Remove duplicated include.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/pinctrl/pinctrl-k210.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
> index 8a733cf77ba0..f831526d06ff 100644
> --- a/drivers/pinctrl/pinctrl-k210.c
> +++ b/drivers/pinctrl/pinctrl-k210.c
> @@ -15,7 +15,6 @@
>  #include <linux/pinctrl/pinmux.h>
>  #include <linux/pinctrl/pinconf.h>
>  #include <linux/pinctrl/pinconf-generic.h>
> -#include <linux/io.h>
>  
>  #include <dt-bindings/pinctrl/k210-fpioa.h>

Linus already queued a similar patch...


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
