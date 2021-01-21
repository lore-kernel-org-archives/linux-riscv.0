Return-Path: <SRS0=hJrJ=GY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C5EC433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jan 2021 00:16:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D06E323718
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jan 2021 00:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D06E323718
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=PwSiXKuxw7p46a5CVcIIoeh0i74hWva+y6U6PNVFKK0=; b=ZSy3pc5uyw3NUYpyJQpQ0AJ3z
	SLKWMurUAfhHpDD2etpmenN0bNBfKeYOehsbDkqI1C5Ysd/ciCyfqOEO8IeonXuptuzQuu4+pL3/N
	lRe2hWvI/4NZ/L6e8CcL6Dc/jHs6mp7nfB9pU1RJj9nZUBTQKGJ4Sd6vvt52aJFX8Q4r0U3oImWdP
	w2VQRKRWgkiTashU/SuBF6ZN/OkzgsWJTK8fYAL2IgpDWk/qFwZ7CamcDfq7VvHV7xwiUZBt49ie5
	17zWN6I/60rvyp4aOC2MnYmffE1+KFeoMr2kuqlxLcH8SNGIZri8/mHui2HEreSof0KJiESJrmGss
	ObXttaDtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Ndy-00033l-MA; Thu, 21 Jan 2021 00:16:10 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Ndu-00032G-Ky
 for linux-riscv@lists.infradead.org; Thu, 21 Jan 2021 00:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1611188166; x=1642724166;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=PtLYrUpUDtnhds0JLM+y786Ec7PXyVEywKpe8rPMFdQ=;
 b=ehi5SMZk14Lky5cEUKG9ufVi8ArUhFTBLahFyp2k1xaDCVnl9SQRMFTJ
 cNoGzuvCR3h7mS/HuuaNqbJTUpI0W9+oniSqlLGe3UV6i9VRpwpMjkjy/
 4OF1EsQRE0PBLCx4KtjxMPiBuDunVn5OU2BwIqaBzkPBjuvYkubYGApd6
 /3jQgfJbYS1S4GOFFtOaUhCdoRFJtGn2BtJ4Kmn9UtYIfRpBJHGVzeLhN
 LaF05d/P4SzbeigJkjEbglXZosMFHFbIHXbJhcMbvrOVysM1gNDArix49
 lDSiAC7BcaAGIIwV39qvXZzchcyiu9cn5ceOcHLoWU4C5WfG+xx3ZdesZ g==;
IronPort-SDR: whae6OFFHH0WHoGiVWjQeWCPsED1zeYbS5aHUUnVO45G1g/WoVpbY+f59vn8YYWjI0z/DiJZ/l
 hUCgfKrL3N3mbpH4FAT4UNHmfQSejWttvD3ntb7J/FoUtLX9D/vmGbUkRhIZq/l8J0hQ6rYKvx
 v5Wk8rJtU+S2fiNO74//FFzRM58jgcCO3zt5/R3poL1B+AaQLkz+TlQqf42OgRgf6YDFdK8E4b
 GGUkAD9RYrjmCuy20qlKDvwD0X76ncO9eFQd92k1Cm20m9fMYHw9JiHfNvou169MmSd3GMPhRE
 T9E=
X-IronPort-AV: E=Sophos;i="5.79,362,1602518400"; d="scan'208";a="162383705"
Received: from mail-sn1nam02lp2056.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.56])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2021 08:15:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZCAz7qJrPilr8QqInWuDC1LSUcK9gX6WnoTz1aaBky7KQXfdZow61nELax1zq5HipsMqo8uERSl0C0b+OiK90W0jgSS6bV9kb7SzfPbnF7UpWz7A7yFCDDHFFVifrQPspBbVybgcTTQy5PayW6BzV1LwLmkxwNvF2wh6AtIhMG9Bs8xOrrDTwu8WroUcenDDj0a0CEAD/dSfZfsyRXkaaBVPCHK0G+JPCB6SNGHPTaUwiaDfoZ+NrPUNik6EWDVl9PHnzG5PgqCzppjWBxpuhN7wqpBpsHX66xRJs4dFfJzZKX6v2nUWf2cGYF7zdIxB+aN1/QRxU3R+IIgybIJOEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8V/xaMKZEzfYlI1xMG4skSBzyI+or3o76gTDP9v4dU=;
 b=lOnq5EcMAxK/P56lMIOfzRuzJfevKX0iU3RQs4UTpp1t0f0JNDZyQiYJp/PHjBCBhOjeEtUIyONoHD5Heis1km9XrdVj20MyXHUyPMqDpc8AhrRkbi79yI5scjkgXgM+tGjuHCUzvl50E38gpVKwvmmfZM+8AU4lp+8MOf90H1qVu7j+rzM1fxMjoq6dqPGs0pLk7wJvA7sLxam08EBC8yLCYUAmdhOrVHmYnnEz/qYxYl2pZcQR3mkMteJ2rlawrUWYXhj383c6mHXIJcXAnFyTLQYNqDpBsRNI7/TllqQ3jzXtEHe9hOmoI1QqtTTjrtDi5ACuNSW9srKsx7Rstg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8V/xaMKZEzfYlI1xMG4skSBzyI+or3o76gTDP9v4dU=;
 b=uos4KOjV+82lice56VgyDwauKuy/9bF0ta1Hz3rhp1Mk9dE34+uwwW7wJVEXDHA2adavy1PxbNHvEAdneJTTp5ki3WyUQcoPspTe1SCI+7u7+LqGWhUa/JgiGWy0hV7Ctnsw01RYaLzMY5e614G39LqAn28nKXw2g8oF0CC4568=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 21 Jan
 2021 00:15:54 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%8]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 00:15:54 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, "linus.walleij@linaro.org"
 <linus.walleij@linaro.org>
Subject: Re: [PATCH v11 02/10] pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA
 driver
Thread-Topic: [PATCH v11 02/10] pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA
 driver
Thread-Index: AQHW6H603OQs4bGY/kKjaT3KXrLhfA==
Date: Thu, 21 Jan 2021 00:15:54 +0000
Message-ID: <BL0PR04MB6514410C82DBB40E645112E1E7A10@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <mhng-8e7e9405-6528-4fec-8d2e-41eb7ec1362c@palmerdabbelt-glaptop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:b0d5:1d20:2559:58ed]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8bd1a2a9-9e46-4d44-cb03-08d8bda1b7f2
x-ms-traffictypediagnostic: BL0PR04MB6514:
x-microsoft-antispam-prvs: <BL0PR04MB6514F189A7520559798802D7E7A10@BL0PR04MB6514.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fqTdle3U/EpIxIgc79VE5YmoORcq+v7XCWAPc3Q7flFwCV21ktbfgB7p2otrLeIv8Klzx4LU18jvTCb7Ahsyw7OHui/UK0vkc8iu/nLo+W6dtmOmpUh0PrTQf5eUFea2buR5oR/23OKP+WP6NOlts04x1AGtKXj8t1fj9qexsYpHtT/eYAm/Q/ZIKtlI6L3JcsiF5RP/NOSgu9ua/vt0lBW7wb4WlXhazFIYkdW2ut41jJNbrZu9RE6pEH7vnv1bdBKC5QPyJCfOU8PfrFd4EW3XLkd6iy14o2usJqgIkTjQN+lQo6ltdVH7EYg+u7RL/VbNcNe5mVsLWKEn9zuMELN2D28F3lnUjDVS8Yn4WncwfphPOt750PpQzgqsvsxlyEFneVV8oaJSHVIhlE3XBJNMeio8XStcnUUelpLkhxSoupY3GUb/xGlUJfLt0a5waMFE3dQJcVP1K1V3OJU6Li8Px95IeUVb14U09zOvZH9yx56iemc6OACRwZzlRT6O83AqrWDVz2FX/6yH30hS1KRn2fQYMzRGgkcccJdeK6RbIC2eFtSe2wB2XmjyByfpgVXu+lfiJZo8vYvZ8kKEl0Lj/0C2BhAhxT6E+z4xrA0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(66446008)(186003)(55016002)(4326008)(9686003)(66556008)(33656002)(66946007)(966005)(91956017)(64756008)(66476007)(478600001)(8676002)(110136005)(7696005)(6506007)(316002)(54906003)(53546011)(8936002)(76116006)(71200400001)(2906002)(5660300002)(52536014)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Jwcm8Ih8u/PTmFbAgC495ARrKlGPSD3sCfShoKLStKT2Y3dYkRTNI+c4lRM4?=
 =?us-ascii?Q?ZwRFm0bo08gciqdbnJn8bzGq24JxlZoBq4M3AeLhxgQO5sfwb/rfzxGPVbXh?=
 =?us-ascii?Q?bRTH6hbWGbGSqpiu194K1Dw+R/N6n7GEtePN2z0HiImEtrV8fM06fYAlfSQb?=
 =?us-ascii?Q?wZlhuEksSJyathwpiJ3RimaGUSszTVjPS1H+zQrnewZYq7sa9jRxSiVmKf8k?=
 =?us-ascii?Q?ZAX+4V+lDZxH5SyoUBPrIsrJvNqMo5AYoaf8S8Kcy5kNvwyodiuwNMz4CvwM?=
 =?us-ascii?Q?tQjwXWBM71hq1FNUDlb/cEveol1wPvNk+5VUXuHp4hAC1v3S1mU6looM9CFB?=
 =?us-ascii?Q?r0IANlrZCLpImSY8asN8xXhyK9A//c1fQFlmB0GxxEqf+3poKxSyklT3Nsuh?=
 =?us-ascii?Q?WMnpLzsw/UXnYzJWhzL7SwK2TUbgV8Lomi3X34vyt7gcBYIarJEvf+e9TxUz?=
 =?us-ascii?Q?i5FKB8AbUmFQBqU7Nxtu1TGkj5IxfumHP5nuxQFbQ+L1B1O7dyjKFf2ISwA+?=
 =?us-ascii?Q?WV/wkdmeu0pAXynSOTZ+ERX8zPihP9YuEz3frMJTWqZrDw4JfkbEkGDkXDUG?=
 =?us-ascii?Q?lQdVmoL8Q7Vu5m5z5G+06nXbFMhl/Wjb1Liya/KEN5/gi9AHSUmMeCwEPQKV?=
 =?us-ascii?Q?adEVzmUtJrTqRfQC9iOAQwhp1+afeUf5IPH8CUZS1CqPY/gUYrHNFeGJNa9Z?=
 =?us-ascii?Q?MA6g5dKLmperSFzdtK4lzRVVevFXUMn85g2aONjI6oKHlX27HLZ+AwINmfMi?=
 =?us-ascii?Q?Qbj61CL458KJ77fcxUVual1xqES0XTszKnPsHtQ6kvKaPCh5S+c2Xuy/AcOC?=
 =?us-ascii?Q?qTm5eBPjMAH0OVI2e5mngoq//wJTTV8AqiZmsR8HmJSwCcoGoAd2qYJc/SGg?=
 =?us-ascii?Q?C1Qfk2ErOx1fNo7c7/8Y8QQpJ64ZptJ6sFzh6IOOxtPqqVB12rYByqA/8Fd7?=
 =?us-ascii?Q?Y3lhZfOAv6UKUbNxgzCBczJ7YrnskFPZ1n9be+W2iywGpSSZzQsX6k0YHzyf?=
 =?us-ascii?Q?qsYAcqVGMrOKnEDYX6ebTHgLkRMmQWX32n3qc5qPmuAmmR9sqE0KwqXVFugF?=
 =?us-ascii?Q?5644BB9R37dbQQCKYhauD3uIm6otcVJvVaAQLK3lIMEox+wdW4h4ZmFerRHY?=
 =?us-ascii?Q?TelWc4cjnlRt/Br8zmfQPtCoswSlRkQJFQ=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd1a2a9-9e46-4d44-cb03-08d8bda1b7f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2021 00:15:54.5296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BiyTlbrtUwY8GSCrr9yZyk39ILx8D9/Chwaxuyf57xKq7jwQlU++VgWIUhydNaI2OxvvPKatMARTb+/O1L4sSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB6514
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_191607_008102_CE2C4170 
X-CRM114-Status: GOOD (  13.86  )
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
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "seanga2@gmail.com" <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021/01/21 3:21, Palmer Dabbelt wrote:
> On Mon, 18 Jan 2021 05:33:05 PST (-0800), linus.walleij@linaro.org wrote:
>> Hi Damien,
>>
>> this looks all right to me.
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> Shall I apply just this one patch to the pinctrl tree?
> 
> That's fine with me.  The DT bindings are in riscv/for-next, maybe it's best to
> take those as well and I'll drop them?  I don't generally like to drop stuff
> from for-next, but that's probably better than having everything all mixed up.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/?h=for-next&id=ed3137edb31b86702511e7ad12b4abe8686b6805
> 
>> I think the line that touches arch/*/Kconfig should be dropped
>> then, that better go to the SoC tree.
> 
> I'm OK with you taking them along with my Ack, but if you don't want to that's
> fine.  Just LMK
> 
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Linus,

Please let me know which way you want to proceed. If you want to take the patch,
I will resend without the Kconfig change and move that change to another patch.

Thanks !

> 
>> Yours,
>> Linus Walleij
> 
> Thanks!
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
