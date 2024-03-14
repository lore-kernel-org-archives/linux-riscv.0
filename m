Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DA1C54E58
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 02:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UMdclsmCmcO2PmoZ05MXCF40GUTcTPDwAEw8Kd1FnPs=; b=QA20IM4kJ4wumb
	HUW6Eq1t6sWbQ9vAvN4DLgWvzh2kfN1fY4QB0CcGlKo50SSU4tmd2Bf7XhDpG59bohP5Xm08VPT9v
	90hmu4D03EsFNJ/erbmTlv0LhJ8BqaHAzHeSC/hhgbe9R3e7pTtDLYomtfrWp3q1iFYxfmxEaX71g
	qZk1dvuJiQPFYsjzVA+W5M5QQ06muHRX7aFhqnEZ5CMqgBCoULm2esseS0wVcl52TG+aWu5Gmfq7p
	4KLASko4/ZvyCuO8Uml6rs+dpZ2DnruAbB2I0wd//72BQWv4iMIU3ESlxgb0FcfnVMBAYZ/aVufzN
	aMOOQ14Xfi2SHTgh0Y1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkagH-0000000CfHw-0a64;
	Thu, 14 Mar 2024 02:18:53 +0000
Received: from mail-sh0chn02on2070d.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::70d] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkagA-0000000CfCo-1ptD
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 02:18:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeRyNiAN5uiZBCcZ1a7cffZMhr0Zkfcz+Xk+oJ5mzeViLFEhVA2aZUg3kBcVIKwP2ovKRRrZMZ15w5psdNT5n+tlFSVfjmRrOX/T3w5ar4yeuyWar+oqLJ0sl03rtTnpIY4b+lcnv3UysMh42j9Yd7WiuManO9Rs213wx/vzkxKZbQCG3jOwjO+TvFIaaGiDddNIfzJ6l0O7H5Sj69Vmb+kMPrxWxg+qo1Mai9QUdgZYHNQgpgRh6azm1+kl+dAGFPriFXWX1jknIFkvmWzJCIIUcP7YJlgxY+KbNkCm+9m5GmRi1Zpmrj8ll9vI00/jRh3LhxIXBQinFIcuWpMWVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwLiPWQwcgK6rSvSVwieAp2WWhrt2spZRSv/c2OuFS4=;
 b=Ma5BD0mFUzY6/bgzDCNwz25Qcyc/KRS4aJX50OfjIGv9YhKv810HMbmAkeoz82DW1ff7xIr5ewTzI3jknJQCWeNskOlhAdcbcKgw/yw2bmvQVZNWa6a+IHO+l5fDWnKLrSSTWwPqW0Vl93RJJk2T8w6MnClhQYohP38z5/7qpGTYUvuv4BRN6a9shsUpXUJh1xL+TEc4n0z/N8XmrgKZJICl8fYVNR2hKuPzwlfQKSgrh0fg7VZN8haoXiSo0ya22Lh1nWl6O0jvmmZKB+D20qUuXBtDzA5u7um/60Y6qZKYKHBleSRZUw3+ni5fGX3Y6NYEtK0WiS84Osq5a6FFzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550::13) by ZQ0PR01MB0951.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.44; Thu, 14 Mar
 2024 02:18:39 +0000
Received: from ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn
 ([fe80::142:2325:a426:2bfa]) by ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn
 ([fe80::142:2325:a426:2bfa%6]) with mapi id 15.20.7386.016; Thu, 14 Mar 2024
 02:18:38 +0000
From: Kevin Xie <kevin.xie@starfivetech.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>
CC: Minda Chen <minda.chen@starfivetech.com>, Conor Dooley <conor@kernel.org>,
	"kw@linux.com" <kw@linux.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "daire.mcnamara@microchip.com"
	<daire.mcnamara@microchip.com>, "emil.renner.berthing@canonical.com"
	<emil.renner.berthing@canonical.com>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, Mason Huo <mason.huo@starfivetech.com>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v15,RESEND 22/23] PCI: starfive: Offload the NVMe timeout
 workaround to host drivers.
Thread-Topic: [PATCH v15,RESEND 22/23] PCI: starfive: Offload the NVMe timeout
 workaround to host drivers.
Thread-Index: AQHaaWi+d9assvQENEqJ5rz8wQxEZrEhb4yAgAZ7cgCAAW1+gIANQI1Q
Date: Thu, 14 Mar 2024 02:18:38 +0000
Message-ID: <ZQ0PR01MB0981BC562E837B232B419AC28229A@ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn>
References: <ZeCd+xqE6x2ZFtJN@lpieralisi>
 <mhng-87e7ef5a-d60b-4057-960d-41bc901b6c7f@palmer-ri-x1c9>
 <ZedAn8IC+Mpm4Sqz@lpieralisi>
In-Reply-To: <ZedAn8IC+Mpm4Sqz@lpieralisi>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB0981:EE_|ZQ0PR01MB0951:EE_
x-ms-office365-filtering-correlation-id: 2f929a8b-40aa-430c-e8a8-08dc43cd0f96
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zWfr/2+ym2W9ngOrFASO0n5amEC/afW57Zbo78L5dBjOEuS6q+4NW0Zes6H3qHZhZLdpXHmG262ZQLsRwtMpmtiqchpBDmKGTMhSDEohhgy2g1ezctwSx4BDWBWZ4O23P//AmmEb444efluoRG7Smfao2t86pW8UE/iRuhDSd80tOONIwaxSOs1kOcNWq0xND+jpep+XWmLKzq4oSrVVrsR9jhOBNjo2zq8pKLvJAwtOS+zm+9pvBxdxN2kS47pl7XAAVcOWf3mBua3HSf6bS2ArXQiGc790ImdvYjPH1w9oieXZtUYE6XU8uPWVZn0K+LQjq032ju0qpEaU5vmbIt1f6uJGiJOnCHDOUHDtFgA8n4KYXtklbT3nak2mmelEW6kEQKjqmi48QHaQyNz+czayc3Jmcnr1G5CdeMJNpP5Fip5JlhrfVbIsgiTbvrSdl3fxQQfFLV/mgLrwUto/uGXQN4F/kTYGZFsO/x4n8wgcVoBLA2qlYH/rcPaPcB13lTeWOIEfr4aucNiL3Y0fVnGOIVkWJ3pshpLvu55UZkUCjwjrgfHiXHvMfOPkHouX3qKV4A5cpGJbubKmOlcrtRwW/29cWuia3uiCveixVKZeG2HEZQP5s99CJzfkIrH4
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(41320700004)(7416005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rMyDIno4Duk50p10/MIH4SfhsN2BpkdY4jBw1gD+3fgDXkhnf7YH/ptqP5ka?=
 =?us-ascii?Q?7qczLu/NepfyGLt3uaAfluUIJXOWaa88k0DjDUGVXYTh0yHkXUXR1HxjnwTm?=
 =?us-ascii?Q?EKIsEMdRIezS24Y6n/alcIiOVbxpPmsaphw4KyTfa3Ck5M7Uu03lVZx4GYx+?=
 =?us-ascii?Q?zFhXs901LgS8oGWSW+c5n4ygKALvc1ycUCUrV40/g6rUmtLzxj6MdC22OBJq?=
 =?us-ascii?Q?R0kv8fH1zeGqceXWUg0RXTJrcMggiYMYMWrDjNydxNicuWWxABPedU9LtCFP?=
 =?us-ascii?Q?u6ZcsroPsA8440CtrcANj0pIM3CrkEO02xjVBIWuO1tyXbk3wFB/CH8mx7BY?=
 =?us-ascii?Q?y6B/n/N2NJ8qJfnw1AOzvAKfXqsPffT1HBI56QynIrIwZsQ2v3D/Aue1oTB6?=
 =?us-ascii?Q?+ggzex+SxzW1NNyjyxoxQA5FvzrD6AuE6WJnEpG3glg/AHXTNreW88XjTtHz?=
 =?us-ascii?Q?ZBykfEdIO+b142vYNOSLLF62oJo+fM2YsmPyUcBfOrbdseqpmKDZ+GhgbXlE?=
 =?us-ascii?Q?/+MHggiF42gpwtsIgWY77icJxecIKD4DdCAr+OM0uRAEMA5gmF12s/NE/TSP?=
 =?us-ascii?Q?GwWsLRNKt1doGca5i7a6yqvRANcc1iFsPpAH+w6sEwy36Sj9oYLm0u7LzN3T?=
 =?us-ascii?Q?2M2bMOAKOQ70NAUjw5w9U93eXIqHguwoex8aHYYw/pNvqEqn2nBRp5E77gJm?=
 =?us-ascii?Q?8Fa5VxFGNqowyJMdM7Ij18djOQ3J7fxGxQDIDvSLUOJT67McxuSS+i58Fp4i?=
 =?us-ascii?Q?/7jkVzlokFcJ6SW4g/b1QVV2Xk4chIONRd6vn3kR+sIPHO/yCR6CHhkTEkEW?=
 =?us-ascii?Q?33wpYUUo8twIexVjnvZKa/wAV1skpAh16LGxiY+hhWmVFQZ8jfybDC/bRf8b?=
 =?us-ascii?Q?sif0gpZvt75ddv5GiDVHRXjvrhq4HJKUpgq0+VN/aKWZct6TW6MgTWme/v9g?=
 =?us-ascii?Q?5rmxgvlG4KHaH4Ptlq7pagJoVZnhn2ZzV7D9tUo/ClcFM97THdwWsQqmro3Q?=
 =?us-ascii?Q?aditfftYmDdshDUfswRjfy1hDB9c/rF1Fi4GrGWPuel25SjRpl0qxI+UWty5?=
 =?us-ascii?Q?SuYiqTvdDmMApO7PmjYoXxg8vI1J+NFovUNZtJ18ruy+qwTXbB8bL+y/CGF+?=
 =?us-ascii?Q?Mp4PyXfFxWVSuLDBFRHuuaeR+nWQ4cukCMD+Ams504rDQRyc6Az824Fi5uRb?=
 =?us-ascii?Q?KFp9uYvXWktv7ZD/PGQC0jreUvT6yyX2r5c2zk959jXgTTpiY0p37Fagsmgo?=
 =?us-ascii?Q?td/y9ddebnOlGCOwamujgfiRdQ9YJfQFAkAaZhVk4c9CQShyPW88GMMpg2sI?=
 =?us-ascii?Q?FC2B1roCbHqBRZzkYZOh325TZmHAetL2O/Hm3XyRk7v8w2rapu8Gd/zB74+B?=
 =?us-ascii?Q?9uftRnF00qxdV3Ey3EBRZCQvpFAB2EJ62eFj3LbS0/rcb9OsYKNCsUjR56mc?=
 =?us-ascii?Q?3h7giALZ7tgR/OLFdOccAnEZHxIJFa61AT/TuSp6Z1zt5A0FcDcs6GKLPK95?=
 =?us-ascii?Q?AiSOyXqd35dGWfXsIZMFkYp1Pn8UCyDH2UJTtOozeUAqLOoVBIb9YhSuwIGm?=
 =?us-ascii?Q?S1zt+swcTyDj0CHGndhJizXVPXk+AcuVjxIWMx37?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f929a8b-40aa-430c-e8a8-08dc43cd0f96
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2024 02:18:38.8619
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AShm9DQ4Zs94PD+i5SEh0WnLPwQhxqfZtEU7OctnurZ9zg/7wJ8Od56gMpZbS4kOXobL08+jZ8EAAgITtFLm2Kx03iNfE3c5zlNCbdQ+tpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB0951
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_191846_790465_58C9137F 
X-CRM114-Status: GOOD (  51.94  )
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

> Re: [PATCH v15,RESEND 22/23] PCI: starfive: Offload the NVMe timeout
> workaround to host drivers.
> 
> On Mon, Mar 04, 2024 at 10:08:06AM -0800, Palmer Dabbelt wrote:
> > On Thu, 29 Feb 2024 07:08:43 PST (-0800), lpieralisi@kernel.org wrote:
> > > On Tue, Feb 27, 2024 at 06:35:21PM +0800, Minda Chen wrote:
> > > > From: Kevin Xie <kevin.xie@starfivetech.com>
> > > >
> > > > As the Starfive JH7110 hardware can't keep two inbound post write
> > > > in order all the time, such as MSI messages and NVMe completions.
> > > > If the NVMe completion update later than the MSI, an NVMe IRQ handle
> will miss.
> > >
> > > Please explain what the problem is and what "NVMe completions" means
> > > given that you are talking about posted writes.

Sorry, we made a casual conclusion here.
Not any two of inbound post requests can`t be kept in order in JH7110 SoC, 
the only one case we found is NVMe completions with MSI interrupts.
To be more precise, they are the pending status in nvme_completion struct and
nvme_irq handler in nvme/host/pci.c.

We have shown the original workaround patch before:
https://lore.kernel.org/lkml/CAJM55Z9HtBSyCq7rDEDFdw644pOWCKJfPqhmi3SD1x6p3g2SLQ@mail.gmail.com/
We put it in our github branch and works fine for a long time.
Looking forward to better advices from someone familiar with NVMe drivers.

> > >
> > > If you have a link to an erratum write-up it would certainly help.
> >

That`s not a certain hardware issue with existing erratum, and we are doing
more investigation for it in these days.

The next version we will skip this workaround patch, and then summit separate
patch (with erratum) for the fix after more debug on the issue.

> > I think we really need to see that errata document.  Our formal memory
> > model doesn't account for device interactions so it's possible there's
> > just some arch fence we can make stronger in order to get things
> > ordered again -- we've had similar problems with some other RISC-V
> > chips, and while it ends up being slow at least it's correct.
> >
> > > This looks completely broken to me, if the controller can't
> > > guarantee PCIe transactions ordering it is toast, there is not even
> > > a point considering mainline merging.
> >
> > I wouldn't be at all surprised if that's the case.  Without some
> > concrete ISA mechanisms here we're sort of just stuck hoping the SOC
> > vendors do the right thing, which is always terrifying.
> >
> > I'm not really a PCIe person so this is all a bit vague, but IIRC we
> > had a bunch of possible PCIe ordering violations in the SiFive memory
> > system back when I was there and we never really got a scheme for
> > making sure things were correct.
> >
> > So I think we really do need to see that errata document to know
> > what's possible here.  Folks have been able to come up with clever
> > solutions to these problems before, maybe we'll get lucky again.
> >
> > > > As a workaround, we will wait a while before going to the generic
> > > > handle here.
> > > >
> > > > Verified with NVMe SSD, USB SSD, R8169 NIC.
> > > > The performance are stable and even higher after this patch.
> > >
> > > I assume this is a joke even though it does not make me laugh.
> >
> > So you're new to RISC-V, then?  It gets way worse than this ;)
> 
> To me this is just a PCI controller driver, arch does not matter.
> 
> What annoyed me is that we really can't state that this patch improves
> performance, sorry, the patch itself is not acceptable, let's try not to rub it in :)
> 

I'm sorry, the description here is confusing too.
The performance is compared with the version that hasn't been fixed.
It is reasonable that we can get stable performance when NVMe SSD works
without any timeouts, but that doesn't means it can improve the performance
for any other platform.

Thank you for your comments, Lorenzo & Palmer.
Kevin.

> Please post an erratum write-up and we shall see what can be done.
> 
> Thanks,
> Lorenzo
> 
> > > Thanks,
> > > Lorenzo
> > >
> > > >
> > > > Signed-off-by: Kevin Xie <kevin.xie@starfivetech.com>
> > > > Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> > > > ---
> > > >  drivers/pci/controller/plda/pcie-plda-host.c | 12 ++++++++++++
> > > >  drivers/pci/controller/plda/pcie-plda.h      |  1 +
> > > >  drivers/pci/controller/plda/pcie-starfive.c  |  1 +
> > > >  3 files changed, 14 insertions(+)
> > > >
> > > > diff --git a/drivers/pci/controller/plda/pcie-plda-host.c
> > > > b/drivers/pci/controller/plda/pcie-plda-host.c
> > > > index a18923d7cea6..9e077ddf45c0 100644
> > > > --- a/drivers/pci/controller/plda/pcie-plda-host.c
> > > > +++ b/drivers/pci/controller/plda/pcie-plda-host.c
> > > > @@ -13,6 +13,7 @@
> > > >  #include <linux/msi.h>
> > > >  #include <linux/pci_regs.h>
> > > >  #include <linux/pci-ecam.h>
> > > > +#include <linux/delay.h>
> > > >
> > > >  #include "pcie-plda.h"
> > > >
> > > > @@ -44,6 +45,17 @@ static void plda_handle_msi(struct irq_desc *desc)
> > > >  			       bridge_base_addr + ISTATUS_LOCAL);
> > > >  		status = readl_relaxed(bridge_base_addr + ISTATUS_MSI);
> > > >  		for_each_set_bit(bit, &status, msi->num_vectors) {
> > > > +			/*
> > > > +			 * As the Starfive JH7110 hardware can't keep two
> > > > +			 * inbound post write in order all the time, such as
> > > > +			 * MSI messages and NVMe completions.
> > > > +			 * If the NVMe completion update later than the MSI,
> > > > +			 * an NVMe IRQ handle will miss.
> > > > +			 * As a workaround, we will wait a while before
> > > > +			 * going to the generic handle here.
> > > > +			 */
> > > > +			if (port->msi_quirk_delay_us)
> > > > +				udelay(port->msi_quirk_delay_us);
> > > >  			ret = generic_handle_domain_irq(msi->dev_domain, bit);
> > > >  			if (ret)
> > > >  				dev_err_ratelimited(dev, "bad MSI IRQ %d\n", diff --git
> > > > a/drivers/pci/controller/plda/pcie-plda.h
> > > > b/drivers/pci/controller/plda/pcie-plda.h
> > > > index 04e385758a2f..feccf285dfe8 100644
> > > > --- a/drivers/pci/controller/plda/pcie-plda.h
> > > > +++ b/drivers/pci/controller/plda/pcie-plda.h
> > > > @@ -186,6 +186,7 @@ struct plda_pcie_rp {
> > > >  	int msi_irq;
> > > >  	int intx_irq;
> > > >  	int num_events;
> > > > +	u16 msi_quirk_delay_us;
> > > >  };
> > > >
> > > >  struct plda_event {
> > > > diff --git a/drivers/pci/controller/plda/pcie-starfive.c
> > > > b/drivers/pci/controller/plda/pcie-starfive.c
> > > > index 9bb9f0e29565..5cfc30572b7f 100644
> > > > --- a/drivers/pci/controller/plda/pcie-starfive.c
> > > > +++ b/drivers/pci/controller/plda/pcie-starfive.c
> > > > @@ -391,6 +391,7 @@ static int starfive_pcie_probe(struct
> > > > platform_device *pdev)
> > > >
> > > >  	plda->host_ops = &sf_host_ops;
> > > >  	plda->num_events = PLDA_MAX_EVENT_NUM;
> > > > +	plda->msi_quirk_delay_us = 1;
> > > >  	/* mask doorbell event */
> > > >  	plda->events_bitmap = GENMASK(PLDA_INT_EVENT_NUM - 1, 0)
> > > >  			     & ~BIT(PLDA_AXI_DOORBELL)
> > > > --
> > > > 2.17.1
> > > >
> > > >
> > > > _______________________________________________
> > > > linux-riscv mailing list
> > > > linux-riscv@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
