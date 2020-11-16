Return-Path: <SRS0=N5Fz=EW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271D0C4742C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 07:30:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7919D2225E
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 07:30:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lvrRRri5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="NGaiW5FY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="hV/mgd7u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7919D2225E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=AYY3F5hVl0MpkhNwJ1fVCVHnlKKRTi90EJNEpHH2n6I=; b=lvrRRri55pxRvyTRjWK15MqmZ
	bCXZ1C9byTQuIRTtBgAs7db2F/uxiBv8BEhsZSwshplX/LnYWXt/3TVcI03Nm1VbKGi7Tb1/Y9Nm5
	45Q37QVFnaMXBrNu65yx7/36A5yjF68JQSYHV2n+Oi+LVe4XH7yuA8nlmGFjk5UMkcykHZieDD3Bp
	HWRJG24ouXJjyEV9pEeUn0WCnO7PKSHfyNcwczzA30O88E+cxfYwXqUwKoeUjWEYYHpJ0nrAn7NG8
	Y8SSMmNd9IQ5dLqw/nLALMwDRTMPPJ+fADcFKSUOiavnAakL/e4mHIKwUKvHzazQbPh8KUDfFlzat
	JTqQM2Img==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keYy0-0003XR-M4; Mon, 16 Nov 2020 07:30:24 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keYxy-0003Wb-BC
 for linux-riscv@lists.infradead.org; Mon, 16 Nov 2020 07:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605511822; x=1637047822;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=5s6m3+5cKorud4hvOKGw2M4voIDwlbvKBc4MEnLUCH8=;
 b=NGaiW5FY46CG3HcVd92DFhLwsWAt6j1zFGgHvy0ar7fHIqIzIL66GIvm
 3npd+wesUkAhJvEO5Pedv/1pBh7/LlS+BCEmI72CviT5OP1sWsf9f1EZf
 0ifuDXEo5NrVkF0L40Ox5O96ZFVjkijr8G0T7VwtWTgYbWeq2oOypTWEz
 FvbhEoUw0FxTDrPehxJTEOOILS5hG051luszvKQFuCC1AXVAkgdRLNv4+
 6YrR7WBOo64yY459kgYGTO8EaXvhKDy17zH/EK/Ex4cTK56nmEXE3r0TZ
 8t5NWwCAaOiKwt2sPtPJaMmps51CiAqUR5ufd/S1jKaCa6k9vtm4jbHZ3 w==;
IronPort-SDR: 56bidZ+eddAUv5Bv51InOWiXrwUmXyZwrGX+zmAgYr3mgoOydVx5FnbBp/LRkO6yRN/g9gVscw
 lazg9Xr1XfnzWdWD8iQdlW07Fta0bghy9aUtohAI3ihEB2Mm7mD+Qn5+D4JfpeRxhMCdqYyiur
 cSuGbC85o1buleJ3ypGOEzxdBLNxrmag16h8Pk+ekK9R8LurrRGyAnvEqULqab5ChVVNpfWUmt
 7U4U4EfX8CXbSthIc6vF5rutLbeWF3GuV63nnLVbXrPxnm3+sSk81ocPlKQYfSpaUpS533140X
 Edc=
X-IronPort-AV: E=Sophos;i="5.77,481,1596470400"; d="scan'208";a="153884117"
Received: from mail-sn1nam02lp2057.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.57])
 by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2020 15:30:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKOj05tS3AjIjd7/agXB+LJzUrwJz0MGBKYPTGfXScvpzQ+Uh+AoHv+mSvG+wLL8ivkuKL5Glg7wbu32u1dESLfL0sdu4TYULfON92Efd9VZJI+qC0qEHL08+CZlOKH6Rn6qsbta4tKQdeyWN51nP8Cn/OAW+2Ny3DsZQbspbIyOradm3NwtRemWWQJ0L0VfsxJzbEbHROjVq564QHGjz+0Hhv5F5nRlozY9X0IJg4Y5ZLQKHXIgYmjRT9MXsLJKMNySvNvc/wq9y5PcRlbf11IX5vCEa/0Gb4ya7SBu6kG52LZUmeIsdLbHjAZlRvlNAeLKEjgDCx4zPwVO91wW9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dm5BP9cs5U9SJuW4Su2hatMSrNWX8hkNdSkd/v65KM=;
 b=khHySzODjq4tVoWlslXBrtfcVAXCbAsvywuWE6Ja2mWPnyaCyiWqOftemvPCDuIwEMAkOJndMigxyFgxy3BbMZ73aC5zz+BLJ9cECZE+1qElqKbo2uabYQ/rdArdisyLbc+8M6onX3dwgTv7DfzOPypQgR5I7tE72s7pbfxdhPt8n3FUBbbsRfyhVTdb+zvbn+QRoscH4ZIculDHEJ6mcJLPcRd7sCWCEQsf9qL/KbX8Kfvzic11Tm4KLnHFXhT+ApTE17lBYphf8ELwq2OrLu5Xkp9j3r5q96abu+x/LlZXbTR9hTocarryNmKJK+OIoBtwhK0vKyTMviahAxEoFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dm5BP9cs5U9SJuW4Su2hatMSrNWX8hkNdSkd/v65KM=;
 b=hV/mgd7u7Rn9nMVpA+H9OS6BuX+tuxXRkSoMYotr7cMBkdNIoBQ8lfYQFbwwT7Vc2c8NfxyamgqEnYWVOtXZQnrgohY8V0BPlZrZ+7F1ULmrO8g+wRmwRDYmr3QDNIKZNTMJpBDQH4kKDgjRt1q6PQsy/3yLoYM8fXbijK1ykvc=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4451.namprd04.prod.outlook.com (2603:10b6:208:43::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Mon, 16 Nov
 2020 07:30:15 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.034; Mon, 16 Nov 2020
 07:30:15 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH 01/32] of: Fix property supplier parsing
Thread-Topic: [PATCH 01/32] of: Fix property supplier parsing
Thread-Index: AQHWtN4FpvYZREsvUk2FACZw1wMGRA==
Date: Mon, 16 Nov 2020 07:30:15 +0000
Message-ID: <BL0PR04MB6514880A6977E605D38D68BEE7E30@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-2-damien.lemoal@wdc.com>
 <CAHp75VfvUZ6h+JGCUQ65i7qFsugvbd3n=aCprgvp=geRSpQEhQ@mail.gmail.com>
 <20201109174450.myombn5skpj5wcxh@mobilestation>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.182.55]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c574ff1a-c0ed-479a-11ca-08d88a01765a
x-ms-traffictypediagnostic: BL0PR04MB4451:
x-microsoft-antispam-prvs: <BL0PR04MB4451FFC9081436C8D99E7EC3E7E30@BL0PR04MB4451.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uL8wQBF34R3LL+8iwxaiaOyCDllnPlAK1cF2oJW1pnpx9jfigxRnE+B8vraspc2Xk5fORtaQLXyzo7Y6RHP7Gcy62k4P0Hpvd9y/IiLdrcJcvxM5mEV6jr8MTF5WOLivSrbzXpKdIx2cs5MQHdnCfPV6giW7WoDjkAbU1KmAxWd6eU/Aq5mofNEU7YBKzsIQ62AIMdCCuLaG1Imlm5W+iZI1zAr46rel5GrzuTXH22QSoA+uHlhTAA8JWDD6PDR1jghLQy+eZMSjS36YJ/3JnKt5KC+YORBseJ1apCoZWleyt21JKOYqH2RyjVGmzfuC+KXSVYiZLTrMt1on5FsOug==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(6916009)(53546011)(4326008)(7696005)(83380400001)(186003)(26005)(6506007)(52536014)(9686003)(478600001)(5660300002)(316002)(55016002)(54906003)(66946007)(66446008)(66476007)(86362001)(2906002)(8676002)(8936002)(76116006)(66556008)(64756008)(91956017)(33656002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: r45iw7P1n+wq74p1+Na2EMfUoD2GpUiyT1uA1Vfyed0P59+FzwSuhlNLGHUKoXlaBNB9uFp03bMgsZLWfx6ZiI6qrZlEb/V1OxB143ABKdjbdQ85jhQ5pt6fND3GPxMZjB8VGk9uDHbcMnBJeOVcYhql9+vFRgfw0FLE9lM4VRM5H1x/9h5B8E+eUHbu1BEz8caURGLHluHrygZV/eiE+x9KqhCoBZaEdgHZL+pjoagr7yF2S90bZkXncQiXY1aEy7G2aOU7IEnbVtCrm5YrOeesUhrJ1wyBVNLnzol++81DhRYjFWwBVCIMk/owctLex8FZUnM6tvUu2hnfvtnXDCohpk2J1K3RYcIFw3QZrMW6HGyCsT36Fzyy72xa2xRNCCYYf/ADuqboK7RgUsEDrQfrmG6WtkGsokPP7VlOteEKv3zH+0saGKKNhk0GfkX4gJJvnygQ1Xq+ETlZTf4hBsaQS+iqSn7Q/usmg5q+c/bZv6VHBbvEcKU76Uapj/RsiooSmhinNkKLnmBD8mPzXyfmsJiW60CfcvuOYrrqLmyQZMnDnNmipYe9zdN+AM5jNzKbzBRbbQJQMtckAShBmtvjtZy0aY5UOEaY+CRAtXvO2n0Da+TJKqFsvIDIVRFEvO8zQqlS2zoB2mFJqQDbBg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c574ff1a-c0ed-479a-11ca-08d88a01765a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2020 07:30:15.6686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cncInH0B0C6ooVX5ERT22xfLVjGzvKY0uGtB6XmAIC2GjGsdpcT8oM0y8q1FFbsvnRo6stsTNITHy9a839HHyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4451
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_023022_513967_C84FD842 
X-CRM114-Status: GOOD (  23.34  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Anderson <seanga2@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/11/10 2:45, Serge Semin wrote:
> Hello Andy,
> 
> On Mon, Nov 09, 2020 at 05:14:21PM +0200, Andy Shevchenko wrote:
>> On Sat, Nov 7, 2020 at 10:14 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>>
>>> @@ -1308,7 +1308,6 @@ DEFINE_SIMPLE_PROP(pinctrl7, "pinctrl-7", NULL)
>>>  DEFINE_SIMPLE_PROP(pinctrl8, "pinctrl-8", NULL)
>>>  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
>>>  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
>>> -DEFINE_SUFFIX_PROP(gpios, "-gpios", "#gpio-cells")
>>
>> Sorry, but the above doesn't sound right to me.
>> It's a generic code and you may imagine how many systems you broke by
>> this change.
> 
> Damien replaced the macro above with the code below (your removed it from your
> message):
> 
> +static struct device_node *parse_gpios(struct device_node *np,
> +                                      const char *prop_name, int index)
> +{
> +       /*
> +        * Quirck for the DesignWare gpio-dwapb GPIO driver which defines
> +        * the "snps,nr-gpios" property to indicate the total number of GPIOs
> +        * available. As this conflict with "xx-gpios" reference properties,
> +        * ignore it.
> +        */
> +       if (strcmp(prop_name, "snps,nr-gpios") == 0)
> +               return NULL;
> +
> +       return parse_suffix_prop_cells(np, prop_name, index,
> +                                      "-gpios", "#gpio-cells");
> +}
> 
> So AFAICS removing the macro shouldn't cause any problem.
> 
> My concern was whether the quirk has been really needed. As I said the
> "snps,nr-gpios" property has been marked as deprecated in favor of the standard
> "ngpios" one. Due to the problem noted by Damien any deprecated property
> utilization will cause the DW APB SSI DT-nodes probe malfunction. That
> though implicitly but is supposed to encourage people to provide fixes for
> the dts-files with the deprecated property replaced with "ngpios".
> 
> On the other hand an encouragement based on breaking the kernel doesn't seem a
> good solution. So as I see it either we should accept the solution provided by
> Damien, or replace it with a series of fixes for all dts-es with DW APB SSI
> DT-node defined. I suggest to hear the OF-subsystem maintainers out what
> solution would they prefer.

As Rob mentioned, there are still a lot of DTS out there using "snps,nr-gpios",
so I think the fix is needed, albeit with an added warning as Rob suggested so
that board maintainers can notice and update their DT. And I can send a patch
for the DW gpio apb driver to first try the default "ngpios" property, and if it
is not defined, fallback to the legacy "snps,nr-gpios". With that, these new
RISC-V boards will not add another use case of the deprecated "snsps,nr-gpios".
Does that sound like a good plan ?


> 
> -Sergey
> 
>>
>> -- 
>> With Best Regards,
>> Andy Shevchenko
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
