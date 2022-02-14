Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02805C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 10:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2FufQPkV+vL6mvVx+62anhtYAm5bNJPrUBV8E4627Os=; b=kmFN99GJPqHILP
	vgGAXxBOVvm6mDiY4lpZyb4SpWwBCitkl4XsfZkmorACTUjXBF5yq8Q7AQ2eQpRovEmwCKSPlLJkM
	Xe9qiSlTL7lL/TCux1/yUeT0TMM182TAkqcG66JykhXBFD6eSYKhOc+aTW247MlZnFXlDc9i1H+R2
	gMZGSpX9FeSYGkqpRXOXKomKccytizpEhxY7wzXAq8EGKBW/b3UzolaUvYmK1KMI91Ge8MuyJyPUT
	iwln21S/0uKJXbTaysUl6ko66QQ6vmFfbAz27fQpDEkA0y0OCyxM8Rg41GZHCzkqBYW6vNwBn86rC
	gGw95GcpiVAPsYjuB/pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJYzv-00EdK0-BC; Mon, 14 Feb 2022 10:54:23 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJY34-00ELvG-VA; Mon, 14 Feb 2022 09:53:36 +0000
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21E803Wp016262; 
 Mon, 14 Feb 2022 09:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=DsNmjSHticmC1pAG1ErE4wFkPS88YyqO6VEKTMmKaQ0=;
 b=Uk65lxTnlWAxj3+A169KNOum6WcLbN7pI8oTmxisQHgzRUwSI4Fq7+WbsaYjLXEf+qx6
 1cWJVvvr5EkAlH4LQDMjcGHPAhLr2Im0MeBpQHA4VnOtGwv+mpx6Lt1mLZ9qr/5IdMo5
 6xNVeEE0VDNTowWNMTBKU90TmegLKGy9Di3eOg1q6xG1pnGepAY5/0anFR+xoWWjL2vv
 khVPzWphA/bJNrN0DPqhnE7dHzktwY/J4UlTCVPsrMn01PTmM5Bd/LlyQFM4aRJb7lBN
 GQRm7XFhG+HnxdekDmsHbGadUS4uYwE1ZDvsJ6TR7qqMggz3oLaceQVUDrm+gpx85cav ZA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e6thxf5vd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 09:53:22 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21E9p8fX007354;
 Mon, 14 Feb 2022 09:53:21 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e6thxf5us-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 09:53:21 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21E9halr029231;
 Mon, 14 Feb 2022 09:53:19 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3e645jbnes-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 09:53:19 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21E9gvqf38994182
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 09:42:58 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2693D5204F;
 Mon, 14 Feb 2022 09:53:16 +0000 (GMT)
Received: from sig-9-145-84-135.uk.ibm.com (unknown [9.145.84.135])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5EFB85206B;
 Mon, 14 Feb 2022 09:53:14 +0000 (GMT)
Message-ID: <6caad65b6229e8e01ce4e125a40f8c1ad2007d39.camel@linux.ibm.com>
Subject: Re: [PATCH] parport_pc: Also enable driver for PCI systems
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sudip Mukherjee
 <sudipm.mukherjee@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Jeff Dike <jdike@addtoit.com>, Richard Weinberger
 <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Chris
 Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org
Date: Mon, 14 Feb 2022 10:53:13 +0100
In-Reply-To: <alpine.DEB.2.21.2202140917540.34636@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2202122313460.34636@angie.orcam.me.uk>
 <CAMuHMdW-utcFzCZTgqONjxs=U662nF0=aBQu7Zi7FBQouwiA3g@mail.gmail.com>
 <e5ec2e3be2e70e690bd9112bd23297d05a2993e6.camel@linux.ibm.com>
 <alpine.DEB.2.21.2202140917540.34636@angie.orcam.me.uk>
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sa9z-6Pqwjl221V-INKoEOYV98uYRQhM
X-Proofpoint-ORIG-GUID: YQquexsItY657nTmxfIzzQy8ETd2_kD7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_02,2022-02-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=874 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_015335_298487_FBF716C3 
X-CRM114-Status: GOOD (  22.87  )
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

On Mon, 2022-02-14 at 09:21 +0000, Maciej W. Rozycki wrote:
> On Mon, 14 Feb 2022, Niklas Schnelle wrote:
> 
> > > > --- linux-macro.orig/drivers/parport/Kconfig
> > > > +++ linux-macro/drivers/parport/Kconfig
> > > > @@ -42,7 +42,7 @@ if PARPORT
> > > > 
> > > >  config PARPORT_PC
> > > >         tristate "PC-style hardware"
> > > > -       depends on ARCH_MIGHT_HAVE_PC_PARPORT
> > > > +       depends on ARCH_MIGHT_HAVE_PC_PARPORT || PCI
> > 
> > This would allow selecting PARPORT_PC on s390 e.g. for allyesconfig and
> > randconfig and like POWER9 we definitely do not support I/O port
> > access.
> 
>  I guess we'll have to stop it with !S390 then short-term.  I don't think 
> an issue with s390 should be blocking all the other platforms that can use 
> these drivers just fine.  I'll post v2 with that installed if you agree.
> 
>   Maciej

Though a bit ugly that sounds fine by me. Thanks.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
