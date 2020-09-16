Return-Path: <SRS0=kUFi=CZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D179C43461
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 01:30:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECC9920936
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 01:30:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0d3tPlF7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="pedW1h8l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="Sg1nO8cG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECC9920936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=6e1zPqs6kb9IKqC+/EDF2wZicT7BnIRAQGetbmOMgfM=; b=0d3tPlF7bwT2mKp467VBcIuPx
	5b6Ne8zftpuzWzs3oSf0eiBBhYTf6OrQhaaRTSlnF+AKHntMavZ9vrdrLeNnR/D4ckpax2uIcv8+b
	jYmBHDGHdtWWqHD62jF5oAPnyzzZ/jAqy7A3ZbLBcFH0V2vd7zMgjOWVqHSRoEU5gIPSE9DGFm9uM
	NZSy+62McSw5bNn/IjUwveItCbIrW771PFCMrb7/wjQ+rp+T7kCjDGr8adc3M5Z3yh2uAuYvpYXoY
	67L88n16k9wrzjN7dQa38uPH66/omeVogUCUy6yyx8cFJbT0vc2Rvp5/hbR7efL8QpJO4zoxj55Da
	e0X19RRPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIMGn-0004Bl-Ja; Wed, 16 Sep 2020 01:30:01 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIMGj-0004Ar-Eb
 for linux-riscv@lists.infradead.org; Wed, 16 Sep 2020 01:29:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600219797; x=1631755797;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=wvu/L0UVCeqvnvuwCeIZNWmwzWlpxda5hNXHzuSGx70=;
 b=pedW1h8l22aawoEn3NKC8zUFZaYYZEbgdb/vxOEOxY9KbAntj1U65KmT
 c3UZKqCuem6VZ+In/Uxup/DLwRdydpCdTY4ujZrsxwfeFe6lr37JCSQe/
 E3sMZ9GCMVn73sPK2jUpaI4oryi/tTzMYh9eE8UaCdCEdRIiAvXoeE7uJ
 v9LLMefr0je7KfQVxFUDWBiVBtg5GMAXT6BoU1mnwmjbJARCvdTFw9h3G
 /KSRmC7TTpAJiERdVmj3HIlajViNqg+aIPTfecVnq2OHiifNBRwFgt+Bp
 ACr34y0e+rV9Sy19O+cuPqakMEH+VcI9B+tlbmWQFGpXUEe0NWTTnfoxW w==;
IronPort-SDR: jIwt6esXTVkfjbXpgKwwOkcxqxTj9eKiFjE8cPEsZnocfZQu9cqcuVhZ7RyLj+PIDWs/SBH6/Q
 9Zim1ouhkppmVXZGrdYNtRR7uatHVoAxtirnOyCACAraMwI/za8g37Ktydn5yqAhL9cH2AXnO1
 zWOmcKr91zm/4hPiOtRDnl2Hz5bxoOKK+GS5Y8CnnO4xl+xPg3AWshej3tYw/rLewYuVHwgBZG
 MEX4L1sFmgzxciefC9Ftg+CFNUsLeNS0SNxENHvIFoAGma14f8u/fW3BlU6Gga7CnXTpth4MBG
 PnY=
X-IronPort-AV: E=Sophos;i="5.76,430,1592841600"; d="scan'208";a="148709549"
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hgst.iphmx.com with ESMTP; 16 Sep 2020 09:29:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5ZVTLiH+D5jj8eeivqecnrsUcatSO3YtdKdnzd2SZTmdjt8PoBYRJw8QOqy3aD1cdt7B1ixcd8s2eCIvi+CtVAERdyxdFE443wHCa+0plieOf0zgJ+5hDcZlfYiDu1zqHF3nQX2z5f1e1twsM4Pbc5bv/84SEMEk9wZYyK6K8Q+f9bz4KELV8LLV6KcqDw5snEP5zEbdNZ9ncTbaMXifog50T2YCGSuFUykJxKzcL6JilIZ2sEcIvM/5hEcr+93DvJcPiJ4EaNIji1GedXWQcz/agGo+FDzr2OnpduIjcJp1ETdYQhCsibSJGz+7Fs0k1VjEk6Xx2ebmp5hiPDQmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jff0mOHhIg+QSpLvjGsCUruH4g/QX3USNI3l+rbWMXI=;
 b=SrOrfqAWsU1Az0NH9+ETqow1h0OtLVEhHlNyp7DepWJEkhoMpWM61JYw+MxRr/KcVBZrbIXQfM6cv5Jpv26VjmMecFRMDOzMP63Rr1q1OLrd0cbgW2jE7D7Jafm1MziNeaioRMANgeddhGGWiyAUPPmIfzV6N4xdVqHNoM1Vnh1FoPZfAsKbS4uHiWvSJFy9NDAwVoXIVJEDsDT2wEbNAC50qiTQnOUUu2dyuqyOTepfDf2TsDxRbY0RaJ8lOtLUU9KyrntvXqGK9kHwQQmtNTfALUtmDqk7E8QRkyP8rzvufdToQXs/zCGw6TinKe7atqnI1+txzkbxSxosalh75g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jff0mOHhIg+QSpLvjGsCUruH4g/QX3USNI3l+rbWMXI=;
 b=Sg1nO8cGqsHzsppCPNQe2b9ETNdjllBaOZuhpA7i0JbLDxfXpIQyY1DkTQUS/PbPp6WVRYu3wgpZJAbb+YiMfKP5UCn4KXNdzzjzCGGOPyXJChOJ4drtzY+anZv+SuI2Wq0NnfXt1/aKOUpcVDNoXe1Q5s8A3Zt+jR8RpkRZdhM=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR04MB0568.namprd04.prod.outlook.com (2603:10b6:903:b6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Wed, 16 Sep
 2020 01:29:52 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7%12]) with mapi id 15.20.3370.019; Wed, 16 Sep 2020
 01:29:52 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Atish Patra <atishp@atishpatra.org>
Subject: Re: [PATCH] riscv: Fix compilation warning
Thread-Topic: [PATCH] riscv: Fix compilation warning
Thread-Index: AQHWi5ijfMvRpAuExEmlFdRP+Kjr6A==
Date: Wed, 16 Sep 2020 01:29:52 +0000
Message-ID: <CY4PR04MB375179E27AE26DBD3ED0FF76E7210@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200915091631.84707-1-damien.lemoal@wdc.com>
 <CAOnJCU+5RqhOnLTkX0G7i0g3ZOr_iQzLTcbZDRkVRz=YixEUpA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: atishpatra.org; dkim=none (message not signed)
 header.d=none;atishpatra.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:b178:89b:b9c7:c5e0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 03c945b0-a847-4e03-7d24-08d859e0028a
x-ms-traffictypediagnostic: CY4PR04MB0568:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR04MB056838B328B869B905563DB1E7210@CY4PR04MB0568.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HsM7E+S+anXfEu4lVMwvePdZvi9a26bdi0UQEFZHGRc/h8FAQCEOpWgoyx6EcwzIA1QhHmlUkbSLpgwh5/ZxI22S38h/mAbUmFkkwZc3+XfMlsm3E7NoJKxnC9Q8fr+BS1Pw3EuBMpS8SrpM2JL2oFqKbroOu/z4rdsoGE0BwZAVj+UOAU4F9hgdPoSW5ZoZ7XvzA4L88cU+lBhuARisA167PEBdXTRCLJk6if01nOFmgmcHAwSPFN4Prxbp1MDBPmRJsZMquNxs6CtNPZSkOtqXDrxM2BnJ1vLYqYXJATDUWpR+2ykSQcHVTR1y4q96ZMLLD+ax30dxjBceQj1F/vnMt8VusKOAPNctAu0+RQODJXLmrP6DR1SRWLZigD7wpQ5QpLEzlBnsj8BdVzKYoVBOb6GeGtWkm9WhOzCyaRovu1KUTsPFZUJ2yBbz3zSi4he+qvO0BoQKjJNjXJmhvA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(7696005)(66476007)(64756008)(66556008)(52536014)(966005)(66446008)(5660300002)(76116006)(83380400001)(4326008)(91956017)(9686003)(55016002)(316002)(478600001)(8676002)(54906003)(33656002)(8936002)(186003)(86362001)(66946007)(53546011)(6506007)(71200400001)(2906002)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 1GOYDDYrh+cAyHFFsAr11OvPyTuqEUJ0ZJwnCPul4zPfwUnh6TwM4IpPFp7VAwrfuFjvggZfyVP8hTjo+hoYY6bE+1zOgPyApgg7eBZlf6rgbA59j0FF0tPtoes+WpomdsUsJbALnh1HKvJi/LhQ06hF7K+OJC9WzScPGjIwpAAZ5mXnkfB08yLWoJQbekKGengRFEG1L6ItlmnDUlSkAqZEntRvwtJ6Z2FjfQLvVfHWXDhB4pcGIGs//YRmekI2Nc7txNd5jCs1DhQ+Fxz4jmVrmssQD/LexSlgr4AZbyLBzb1zRCfoMJK+8KIW/jHDpwsWafCgs8R7wrJ4RmiATklaFnRK3qHQRzHHTzu2bDagTwqipeNWuICD+ta9tb6fWnobQPPSv7YebvS1d09mVX+Ij8xgByJJObMIvaZ3zbQrBro5nDXA7QES8ezHWIFo9bZz4RUlTCEhhae+tm8s+nWL1VmOaL8TK2Dwp1ccqTYbmvX8lq3SklwEHZbwF0H9HPPbJOyLTcDgI4EitDjpDtRwcKOgRXmYiCeRKAhW2zKXNbFBwhSLhv+CVHyLnWdajDxQl6u7fQfR5A9zPFi2GDLJV73rMgoh3LbrYHL+Ohx9H61Lx7tJuZTdi4fwYcr1WkcFBVCCAFbX4VRjuJ1Vqn0Z5Mq5cg7r9G1PFy+oLmsw3Fd0JPsgwSL6DIY065+TjvKyXTWH4vst9YAuEuUPYA==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c945b0-a847-4e03-7d24-08d859e0028a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2020 01:29:52.2822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SnKOFi9nZplwHIIiaUyJv6pO7bSwJeepIz39B6Kl1idAG+R2leXlFOGzJ0379eQIcWzl3rfMKqlU59ockvLDeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0568
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_212957_667916_AEEE9B84 
X-CRM114-Status: GOOD (  19.90  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/09/16 4:44, Atish Patra wrote:
> On Tue, Sep 15, 2020 at 2:16 AM Damien Le Moal <damien.lemoal@wdc.com> wr=
ote:
>>
>> Move the declaration of pt_ops under "#ifdef iCONFIG_MMU" to avoid the
>> compilation warning:
>>
>> arch/riscv/mm/init.c:44:28: warning: =91pt_ops=92 defined but not used
>> [-Wunused-variable]
>>    44 | static struct pt_alloc_ops pt_ops;
>>       |                            ^~~~~~
>>
>> with NO MMU builds (e.g. nommu_k210_defconfig).
>>
> =

> Thanks for the fix. pt_ops was added as a part of EFI series.
> I am planning to send v8 to include some more generic EFI changes.
> =

> Do you mind if I just include this fix in my series ?

Please feel free to integrate/squash this change in your series. No need fo=
r a
separate patch for just that. But: If your EFI series is not final, what is=
 it
doing on the for-next branch ???

Palmer,

What is going on here ? If Atish V7 series has problems and is not final, w=
hy is
it already in for-next ?

> =

>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>> ---
>>  arch/riscv/mm/init.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index 32e7258da9bb..c888c4470b34 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -41,8 +41,6 @@ struct pt_alloc_ops {
>>  #endif
>>  };
>>
>> -static struct pt_alloc_ops pt_ops;
>> -
>>  static void __init zone_sizes_init(void)
>>  {
>>         unsigned long max_zone_pfns[MAX_NR_ZONES] =3D { 0, };
>> @@ -214,6 +212,8 @@ void __init setup_bootmem(void)
>>  }
>>
>>  #ifdef CONFIG_MMU
>> +static struct pt_alloc_ops pt_ops;
>> +
>>  unsigned long va_pa_offset;
>>  EXPORT_SYMBOL(va_pa_offset);
>>  unsigned long pfn_base;
>> --
>> 2.26.2
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> =

> =

> =



-- =

Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
