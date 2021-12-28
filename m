Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4BEC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 12:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8aRduZdiBtXMaEIid6bdkrvOSeJju/zuH2v4KiQWI9E=; b=3vyFbgKH677KLC
	wo6XRcKnhdLf4QR0t1VehFiOEcCxo8ru75vwVfp9ZjyrXQ/BcAR/RyKx2j+E6ZOirNyOPOla+QBAK
	z6+0dvhecBWbWsS8T1xSIV/nlOZfnHR6+5+iHVqp95F3bLw9sqR3Ml8Oo8xnyATLWXH+wuAJZ2cvN
	XvNe0Am3nozYrDD4SIsixRlqE1gzPm8kbNIcAttJBla89t6wH6HRQW+QY5qosBJVWqZNQNwnLt/ei
	1Jua65ZXkrXl8R3iQPKrqzg3+pHw7uf7wkWsosc4XeI6EV9Sj6Xm+nK+guEvxee9SEg3HNMakI9iw
	XVs0Jj0lNnt6eOOXcnCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2BMb-000sTn-GG; Tue, 28 Dec 2021 12:13:57 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2BMY-000sT6-FL
 for linux-riscv@lists.infradead.org; Tue, 28 Dec 2021 12:13:56 +0000
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BSC7Ux4021981; 
 Tue, 28 Dec 2021 12:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=rLpMJsYOSPIxUTZJ3DquDE1otn6Qi02ImTXn7iVPxwo=;
 b=qe5BaO2Q6j511PuFFiQNPgP/M+3R4S1ua8LmPYVpJ/kjL+V5Ws+C4sCPVO/k8WaBEWfZ
 jdzC/SUzS4jwbzRt96FyCEFSKTRbKR6L/Q6tGRU9avG5zK9MYJvztso1w9iQjnsD19RV
 3PQ8+nKGPclVmzD+Bp0DUNFqPeFUJSrku72ztfiSH36lrTKA+Bj8mhXW8fr54vl8Ev2x
 g23chObEjs055MnP9nVCM62uyOhJFIr6wxmanU6aHQ1qdA62dzoFQH+pYbX/UcTp9spU
 UsWqDIdq39fbhdzaCGMx5kQpZLHylizQvRDjzoscR58mbR0325Radjmx7qLhq0Hdsv0H zw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7vne7263-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Dec 2021 12:13:12 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BSC9wCG032723;
 Tue, 28 Dec 2021 12:13:11 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7vne724u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Dec 2021 12:13:10 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BSCCBoq014192;
 Tue, 28 Dec 2021 12:13:08 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3d5txar6yy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Dec 2021 12:13:08 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BSCD5eb47317312
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Dec 2021 12:13:05 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5259111C04A;
 Tue, 28 Dec 2021 12:13:05 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02CCC11C052;
 Tue, 28 Dec 2021 12:13:04 +0000 (GMT)
Received: from sig-9-145-12-118.uk.ibm.com (unknown [9.145.12.118])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 28 Dec 2021 12:13:03 +0000 (GMT)
Message-ID: <58e6aeaf78d093e7621cd589f69e68bab3b9c8aa.camel@linux.ibm.com>
Subject: Re: [RFC 05/32] char: impi, tpm: depend on HAS_IOPORT
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren
 <guoren@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Corey Minyard <minyard@acm.org>, Peter Huewe
 <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe
 <jgg@ziepe.ca>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-pci
 <linux-pci@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 linux-csky@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 linux-integrity <linux-integrity@vger.kernel.org>
Date: Tue, 28 Dec 2021 13:13:03 +0100
In-Reply-To: <CAMuHMdW2qsZZqE_hAchoD7_41ak8btTZb0UZE6DsXDehhT63fg@mail.gmail.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-6-schnelle@linux.ibm.com>
 <CAMuHMdW2qsZZqE_hAchoD7_41ak8btTZb0UZE6DsXDehhT63fg@mail.gmail.com>
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SREVe-Ue0gtTgAjeBLawwZn7tbKkuZc9
X-Proofpoint-GUID: 8RKn5vvFcRvEetmS5YBxkXh5NTpMa2on
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_07,2021-12-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112280055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_041354_677080_BFB49F00 
X-CRM114-Status: GOOD (  33.17  )
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

On Tue, 2021-12-28 at 11:17 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> Thanks for your patch!
> 
> On Mon, Dec 27, 2021 at 5:51 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> > In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
> > not being declared. We thus need to add this dependency and ifdef
> > sections of code using inb()/outb() as alternative access methods.
> > 
> > Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> > Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> > Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> > ---
> >  drivers/char/Kconfig             |  3 ++-
> 
> Your oneline-summary doesn't cover this file.

Thanks, I guess then I should go with "char: depend on HAS_IOPORT"

> 
> >  drivers/char/ipmi/Makefile       | 11 ++++-------
> >  drivers/char/ipmi/ipmi_si_intf.c |  3 ++-
> >  drivers/char/ipmi/ipmi_si_pci.c  |  3 +++
> >  drivers/char/tpm/Kconfig         |  1 +
> >  drivers/char/tpm/tpm_infineon.c  | 14 ++++++++++----
> >  drivers/char/tpm/tpm_tis_core.c  | 19 ++++++++-----------
> >  7 files changed, 30 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
> > index 740811893c57..3d046e364e53 100644
> > --- a/drivers/char/Kconfig
> > +++ b/drivers/char/Kconfig
> > @@ -33,6 +33,7 @@ config TTY_PRINTK_LEVEL
> >  config PRINTER
> >         tristate "Parallel printer support"
> >         depends on PARPORT
> > +       depends on HAS_IOPORT
> 
> Why? drivers/char/lp.c doesn't use I/O accessors, and should work with
> all parport drivers.

You're right that should work.

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
