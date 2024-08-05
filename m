Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244E5C3DA64
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 02:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oz+eLAhAho7kaYDeSd4VM/rMdlqMgVybxz0zbkVPQHo=; b=vn7HsHxumgcmPH
	nacb6tWOL7kD8D8uzlziwYiZ3x+6Zr4KVZ/2XzSYbp8tDrwKScJ3oOtgPBjRLosPzk2lW+QXRkbP8
	WBwActeBRY9YS3HuS+49GfQraxkN84Lf1UcikKO+OABV7+kLmU+wJcB8AcQW45tfO1f0pC+xbJl9F
	5pWM46jQ3s4aSna6Y0RaPg0hA+oa9q8Hnd4jIZxOn2fcaxKSa4g9Xtf4YDURWOLI4+5CykaroC1un
	Uf/Trtsu+zBQzl/GgN3Js6y2lgc7wCip1MNKIGMaQDUFWAS+UMtHb8vWgo5WVKZGopXsSy5RoRmrO
	yq6BHrzL1ksIZdV3uxEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sanMm-0000000ENTV-2soc;
	Mon, 05 Aug 2024 02:22:32 +0000
Received: from mail-mw2nam10olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2c12::800] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sanMj-0000000ENS7-1zKU
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 02:22:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qnwko1Oj6lPbekyRqAHlljTRLUitEAZ+JI6Jtm4PLtCmlQcpEHxTebm+hm66SD5attrp0bGUR8KwxP1lZAvWsXxSMJI7mk1+Q9EfohiB9Tw6Ubip+tJ935WeO2m/89wiFb/p1HceJfSgX2M1OI7mJQlSZpqXJk4OR+X0DtoDqLBfRXqcrYKY31Db2p06En8CqXZYWgGvOQeW87aBVa0WhETieVYbIgz/E7nrZ8WWCl3yPXfsi9p8VJoEavepPxjkNWDP0iJB5kYZG/KXMtSHMZE/CLpg/PAKaWc/4i25TcYAehfMiYnVr4LSmFH1+ofuAjDb1AWiCPrpBprHeCCvBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TmtcRHCTGTFHD9ZgIf08U+rPDJ3cCn76gjvz5l8kkJo=;
 b=llGqEetAdKQjC0X8ez/VReEwoOgi5v7xKL4B+0gAT/Ol8QqNuvL1dcua55upJ7NzgnPJSINI0ATm2p85JLU8RM3Lk4JndA4esR4sWSEfXXwXEMKdIkTaqtOTiditgC401di1rxc/HrFSDIzJ28bEaFiROv7fZbOJLPztmrb9nGk07gnhZz0zSP3m05l0KP8BWKMVnxS82+RqBqhQ1wq/V4ZQKzwxG2m6S1hTI11mFQujUWbBuQg/7yIWi6ss+txx+dyASdtOOOkwl7pQZ4FORRsulwtcEFm7rIG3CFHFuRXPsSqWJFgJgLmmxBSufFv2kktgudoiMLpLEEgTYvhmFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmtcRHCTGTFHD9ZgIf08U+rPDJ3cCn76gjvz5l8kkJo=;
 b=GZ+/1BCtkyQGx5dziC2onBavb48Hbe5rUx9zOqypQ7jYfmN62oO2vejOnM5He43AcW6swPHklQz1Egq9DY+l2k9Q219LdpwX/IgRtQDp+bAmKdZNs7WVCkpaFjy7z3E+iafZl2eQF70VaepCkWk6r+FSpb926OG1Ab+AJg8PYymrWWScuukT7iDR74VKDGDINvVjUJ3wqYKw1fFLGo1jZdmhMuBwIChHvmXRbgHVMBMXnCvXR+OkjLdZXbaDgD73JscCVElgttL481PqBCxT5pTIXM02s4UJjkeB5nbsKTUr8dRVrASXFDV77vOjFFxQE6DZUhdpHBAzjtVbXIEq8w==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DM4PR20MB4702.namprd20.prod.outlook.com (2603:10b6:8:ab::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 02:22:14 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 02:22:14 +0000
Date: Mon, 5 Aug 2024 10:21:35 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, Jinyu Tang <tangjinyu@tinylab.org>, 
	Hal Feng <hal.feng@starfivetech.com>, Yangyu Chen <cyy@cyyself.name>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v9 4/4] riscv: defconfig: Enable MCU support for SG2042
Message-ID: <IA1PR20MB495318BAD08E97F0F3AA2672BBBE2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495337877FFC8D787A045C15BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49530E505BAEC8F92B19F37FBBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
 <MA0P287MB2822C3C5AC61D2A91542C33EFEBE2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Content-Disposition: inline
In-Reply-To: <MA0P287MB2822C3C5AC61D2A91542C33EFEBE2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-TMN: [A386TxwYciR+eOBqbuGSLIVZVDvuUPc4vZMEjKgu+t8=]
X-ClientProxiedBy: TYAPR01CA0139.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::31) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <t6ink2cn6ykpjh4gvh4nlsvpvqzljktl3yjfuihdojrn6iu7io@t6hd6oght6h2>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DM4PR20MB4702:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ef26e09-0083-45f0-592e-08dcb4f56b84
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799003|461199028|5072599009|8060799006|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: nSrFeLc6IF7x+85Y3XIA2AsfhffSAPpSktgVPIXjVpGd4P6/aLO90CmZbYE2/70ArKNifMLg0/ohQ5nQxOSh5w0IK2W2taTfxFUNhGdPaSSDEhKmfbwWljEwMtifyewVSZU9oxVISmL6MKwcNtycRlpxIBcBwRKxx4kH3xjpJ19a91qiMEMdlP4hU+C5F/m4/goq5oVl8QIv8oWiSCq/J6CoebQqMTh8ctA0mhO8I4U9n9C36pVgAJ2eUHeuz3xOKysIC8aM8mzcDJRQLp76rhmQna8kt8yx4SnfdbQAIDStoDRpLzY8VFiF3BoBtTY2nRVFUP/XUh6t85EwsHBVDsIxqNzpHZn0XoQLEwhIWGh0sSjClJHPDQJRzwRnrSTTAsrurdIF7aTl0SFmIu9YNzLJr5kpvvFU5uFo6/VY2LTGjX/jSxHSjba/4jneTBfz6GiWUgfbDKufuGSKc8j711QvhPUm33VcVomPEHA7fZAKJdgcPUnc7bKvIVyqDnN3hhNkROuxXIslFUOhdi/0WDNM5oLGi5atMB2NNbRLzL9+Nxd5QE698EyXKCEsDxRfnnbhPsg7jzM6n2Yqy1s0h5fANxtzJFr2cLw+dwlP8XtugMcEUysCePEQY9vrrx2xhR6o2PvT1aYItwLYakl6BILJKZGNezPu68hfWMsqO7YlAv17pHNBYW6j0zY5dmuKxUEoog38izvYKMQ+4dYRdQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dw4Qyp5ZLVmS0WqT0LKCG8z6hxEq4C0HMUocIYTVJTgHcqk42aC/DMyK9kVR?=
 =?us-ascii?Q?E73GHqePIHaQTSFc0NfsNGV1wXzRYbiJdBvq8fmBCatPVrXyiSKBaevycRLW?=
 =?us-ascii?Q?35/8RLWAApQ4rhUX+HjN9493e8aso0M9ZnLxhuewD5AMxIMLFfB34xIf9dTY?=
 =?us-ascii?Q?Xjc0TsTrBP/LL7wurXxFCZJTuLyKdcCUJOiNcBTNLTE/QPq4HiRx45TN/kvU?=
 =?us-ascii?Q?CmY5FkwbghR17ZeoRs+NQEcCMpKCYUK0qLZWWMfZrTa0fqx9lI/i3WUXBP1D?=
 =?us-ascii?Q?E8XRwdoZ94uadOpAsfOtdTIkOYFqiF3E2Xi8Zr49XxcCsaN7t77UcYlD6NJH?=
 =?us-ascii?Q?5cKD95E5bFjY4k2trxHJxi//nfeqLKaLgDr46XPQBcuebZLIxrbJna552BwG?=
 =?us-ascii?Q?qF6Sb1KNmKBm0q2s/GlBq6YlUMbSLhdOtkLk8RAC8dC6+x3/ZJL4Wh2fnVyN?=
 =?us-ascii?Q?/g3RX3ulbyEU0ry74cYyFHjZl96W73eJIQTfJsLs82x/ukxHOklN4S488j83?=
 =?us-ascii?Q?ujiL6tBFV3FNoCfitxbg7lMpmNu8jvL2IWV6wJ2IRRx4SAHdrTynetrf4IG+?=
 =?us-ascii?Q?XSSvULMHz45MOr/cPVw3o3WY6x4A2i+d64pcYhH8OzO86Q7SZkqyDJ4jj/Qf?=
 =?us-ascii?Q?3CaXl57tPtj9s+3yC3NjJ+Zj7LGUU90kuwv6zvANcz+9cy3Ty3yCOY7+US//?=
 =?us-ascii?Q?KNshdhdi/rqhxhkegWE9SyOPH/JRa21uzmpulNtGde1pzBzrovlloQNHeOcI?=
 =?us-ascii?Q?wwF9UmA/ujfo9gc/yqHm42hxgNdT7mIbStxIi67l4n6gmKwlHSb/xBOQU7FL?=
 =?us-ascii?Q?q/sBxElf9h+wE4eNzVwQ+kdnFenpLsb+C7lVz/Borbc6gACqVn51Pp3MNwU2?=
 =?us-ascii?Q?M5cvEQ9eI0I/Mz3V67Jac8+Iuqny5ALjj4S4gY6/I8QYpfzsPOVvRyfybzcN?=
 =?us-ascii?Q?OUOkT12O7KPSMC38AfyjWfb/BuALsMV5QtPviQVlnHkKAkYBcpW8u/miGZUg?=
 =?us-ascii?Q?sEfkDiNPn0WgOx28HA05MkgfbK8bCwla0M41RanI2lHXNrBfxxkGAruFxegc?=
 =?us-ascii?Q?0GmO/ppjxKVXr4smgdQR2Pe30mref4snb506xX9wqYbFdpuO6pz0s0/uC8Wd?=
 =?us-ascii?Q?pEaIa6KF7uoVlfC/xaywvpB5XGr5N2VqqypLQatwEUDRinomdvbRX/gFqyFE?=
 =?us-ascii?Q?KigEdx3XsOXCl3/UTK7Ip/YO/9kr02T01A0hXt1M5ygOlj/FoDo7cxUrkpC1?=
 =?us-ascii?Q?X+HNuxCYA6ZV9Swj9TFv?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef26e09-0083-45f0-592e-08dcb4f56b84
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 02:22:14.5605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR20MB4702
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240804_192229_540944_AC679D2F 
X-CRM114-Status: GOOD (  15.44  )
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

On Mon, Aug 05, 2024 at 09:31:24AM GMT, Chen Wang wrote:
> Why this patch change the dts?
> 

My fault, this should be merged into the previous patch.

Regards,
Inochi

> On 2024/8/2 20:38, Inochi Amaoto wrote:
> > Enable MCU driver for SG2042 to provide thermal and reboot support.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> > Tested-by: Chen Wang <unicorn_wang@outlook.com>
> > Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> > ---
> >   arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 2 +-
> >   arch/riscv/configs/defconfig                        | 1 +
> >   2 files changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> > index 8b8fdf6243d4..76375e25a495 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> > +++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> > @@ -67,7 +67,7 @@ soc_active3: soc-active3 {
> >   				};
> >   				soc_hot: soc-hot {
> > -					temperature = <85000>;
> > +					temperature = <80000>;
> >   					hysteresis = <5000>;
> >   					type = "hot";
> >   				};
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index 0d678325444f..a0f346301df6 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -170,6 +170,7 @@ CONFIG_SPI_SUN6I=y
> >   CONFIG_GPIO_SIFIVE=y
> >   CONFIG_POWER_RESET_GPIO_RESTART=y
> >   CONFIG_SENSORS_SFCTEMP=m
> > +CONFIG_SENSORS_SG2042_MCU=y
> >   CONFIG_CPU_THERMAL=y
> >   CONFIG_DEVFREQ_THERMAL=y
> >   CONFIG_RZG2L_THERMAL=y

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
