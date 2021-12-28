Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A62C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 12:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1+VSBQUgwh+x3Q3keMaw0sA+i6/aKed9W1a4FJgcPQM=; b=QfP/qcgWqw59+9
	zDfVPdLAopMZLprXEyyX8numoo2dhbUQtutkG1VrB/wfaQlZkMgAiu7YQsFPfaokDZIMlMZ8BaysB
	vyHsXEWmWwt4hx8QqPP7ObDjYuVAhm2qwNMTr2hAgJVlyGrLl2mRae1hSIfRCv4AZevamCl3OYG8U
	AxsOFqPU1/rb55fc2UqVKBQI8nMUGFkN9OZpHsQoaJIPUNR+L4JhcDnkGnhKDxyj5PTHLDWf4cBAP
	nv0b121l3UpLs3VGRKEp6ZNwz0B3EofeZeb/AKEMBmR2ka+jBQdxVMwUNdxfI5Bfkctoq6c4JqLWr
	v0/mxyW3WstosDEJJKrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2Bwa-000vZd-Fq; Tue, 28 Dec 2021 12:51:08 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2BwW-000vZ8-4m
 for linux-riscv@lists.infradead.org; Tue, 28 Dec 2021 12:51:07 +0000
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BSBBFLU006881; 
 Tue, 28 Dec 2021 12:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=S9D+u4Ip4I3DBjLjBk+LwCkB9PjbH3pelWSRQrEW8/w=;
 b=NbZ04K3xdwOzDfMzPj/q6c59N2Tlbqq/XImIKWVeeEFE6p5jBCNwPm21PTxi8O7rHGiS
 WAyQVRG6KPXvEU1LwGswvlz7/cq68yu/iqMHS+dbrhcy1BFMPAaeTC/BDF7bzxS2FQm+
 4ZXne+e3M9KL9Ei0Ifghtamm6RfxHnSDECkOf4M7wj497iKQj9bMqHdLpq9V9bzeDBnn
 k2iDbyLnNKXxVj3mYQ3imzSZBOitKs8EaXUqD7BO0jf89Bx8ft9qd9ekzvq6JUT/mnRN
 NW4hdpHp/mqHuK//8cGusOOIi7d29eCiUlHYjKimkDrKTPK6xy8MvGoN9Q/om0z7BOJM Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d7tfbtcdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Dec 2021 12:50:27 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BSCmAqP015526;
 Tue, 28 Dec 2021 12:50:26 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d7tfbtcdb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Dec 2021 12:50:26 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BSCn5hw018678;
 Tue, 28 Dec 2021 12:50:24 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3d5tx9ge3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Dec 2021 12:50:24 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BSCoLL238207920
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Dec 2021 12:50:22 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDD19AE058;
 Tue, 28 Dec 2021 12:50:21 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7D04AE057;
 Tue, 28 Dec 2021 12:50:20 +0000 (GMT)
Received: from sig-9-145-12-118.uk.ibm.com (unknown [9.145.12.118])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 28 Dec 2021 12:50:20 +0000 (GMT)
Message-ID: <b21410ee32857b4913e4ba4595f9e8da299c501f.camel@linux.ibm.com>
Subject: Re: [RFC 12/32] iio: adc: Kconfig: add HAS_IOPORT dependencies
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren
 <guoren@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter
 Clausen <lars@metafoo.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>, linux-riscv
 <linux-riscv@lists.infradead.org>,
 linux-csky@vger.kernel.org, linux-iio@vger.kernel.org
Date: Tue, 28 Dec 2021 13:50:20 +0100
In-Reply-To: <CAMuHMdXDL6XXfohzJFTTV6tR=gg=bcCQq935eKUbNaNLHp9xiw@mail.gmail.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-13-schnelle@linux.ibm.com>
 <CAMuHMdXDL6XXfohzJFTTV6tR=gg=bcCQq935eKUbNaNLHp9xiw@mail.gmail.com>
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: adgjiWn0pQwLjbiOSK9NgIxPJZGoB2MQ
X-Proofpoint-GUID: VxcM2A5_A0B3RoIYwgqkHPDjJ1ThPxCG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_07,2021-12-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112280057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_045104_462427_ECB23B4B 
X-CRM114-Status: GOOD (  34.32  )
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

On Tue, 2021-12-28 at 11:32 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Mon, Dec 27, 2021 at 5:53 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> > In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
> > not being declared. We thus need to add HAS_IOPORT as dependency for
> > those drivers using them.
> > 
> > Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> > Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> > Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/iio/adc/Kconfig
> > +++ b/drivers/iio/adc/Kconfig
> > @@ -119,7 +119,7 @@ config AD7606
> > 
> >  config AD7606_IFACE_PARALLEL
> >         tristate "Analog Devices AD7606 ADC driver with parallel interface support"
> > -       depends on HAS_IOMEM
> > +       depends on HAS_IOPORT
> 
> While this driver uses ins[bw](), this seems unrelated to legacy
> I/O space, as the driver maps a MMIO region.  Probably different
> accessors should be used instead.

You're right on first glance it looks like a misuse of the ins[bw]()
accessors. I do wonder how that even works, if PCI_IOBASE is 0 it would
result in readsw()/readsb() with presumably the correct address but no
idea how this interacts witth x86's special I/O instructions.

> 
> Note that this driver has no in-tree users. Same for the SPI variant,
> but at least that one has modern json-schema DT bindings ;-)

Can't find any mention in the MAINTAINERS file either.

> 
> >         select AD7606
> >         help
> >           Say yes here to build parallel interface support for Analog Devices:
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
