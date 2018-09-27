Return-Path: <SRS0=T2Hi=MJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BF5C43382
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Sep 2018 04:52:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7E3721570
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Sep 2018 04:52:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rgPYW6By"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7E3721570
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:In-Reply-To:MIME-Version:
	References:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WS26dVnAGW8B5dg2mKbNvhAVmW0UZ7y9ecg1NnhajFY=; b=rgPYW6ByTYQxY3
	gbLpCxwXxLU0EkQ2ADhpf+iPr48Mb7M4zEzUbrtBWgWQAf/g8Cp1g3zE2lpnc7jIiY6lllnO5nuiH
	ZPej/3GfqhT6BKa4ZLtqmPqfFbbJXf2YKROsgMkUEXje3MEIMtKNGO+nY7aC51LzuuhSVUwnreeI0
	VfsQ5yXzKwtNrLFL0I+xH4P0X8D3jt76JfgsWGsotkfaNZKKmrLdto+EesrrJwUE1kpPIx+q7NW8G
	1cOSwf5Hb9cZ9OGF59LdujE2dKswI1znqhtY4GUu1szPpYUD8wz0BZ42wesukQvLaA7j62QPrhRXS
	6zO7Apo5bgujTIzwidNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g5OHs-0006z8-Q6; Thu, 27 Sep 2018 04:52:28 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5OGf-0006tL-B8
 for linux-riscv@lists.infradead.org; Thu, 27 Sep 2018 04:51:18 +0000
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w8R4nPjS089430
 for <linux-riscv@lists.infradead.org>; Thu, 27 Sep 2018 00:50:41 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2mrmu881wf-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-riscv@lists.infradead.org>; Thu, 27 Sep 2018 00:50:41 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-riscv@lists.infradead.org> from <rppt@linux.vnet.ibm.com>;
 Thu, 27 Sep 2018 05:50:38 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 27 Sep 2018 05:50:27 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w8R4oQJu65470530
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 27 Sep 2018 04:50:26 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E5984C040;
 Thu, 27 Sep 2018 07:50:10 +0100 (BST)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15E3A4C059;
 Thu, 27 Sep 2018 07:50:06 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.204.81])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 27 Sep 2018 07:50:05 +0100 (BST)
Date: Thu, 27 Sep 2018 07:50:20 +0300
From: Mike Rapoport <rppt@linux.vnet.ibm.com>
To: Alexander Duyck <alexander.duyck@gmail.com>
Subject: Re: [PATCH 03/30] mm: remove CONFIG_HAVE_MEMBLOCK
References: <1536927045-23536-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1536927045-23536-4-git-send-email-rppt@linux.vnet.ibm.com>
 <CAKgT0UdP=78RsWHMxFu4PD8a3AhA3eNcG68Z_9aGY0vhOKf7xA@mail.gmail.com>
 <20180926183152.GA4597@rapoport-lnx>
 <CAKgT0UcC-GTtyPK9ynvj6r3YFqy8kE40iMJxzPowbNoXGf9iWg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKgT0UcC-GTtyPK9ynvj6r3YFqy8kE40iMJxzPowbNoXGf9iWg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 18092704-0012-0000-0000-000002AF2296
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18092704-0013-0000-0000-000020E33E60
Message-Id: <20180927045019.GA16740@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-27_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1809270051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180926_215113_543844_CD4075BC 
X-CRM114-Status: GOOD (  28.28  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-mips@linux-mips.org, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, palmer@sifive.com,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 linux-mm <linux-mm@kvack.org>, dalias@libc.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 jonas@southpole.se, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 mpe@ellerman.id.au, jejb@parisc-linux.org, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, msalter@redhat.com,
 mattst88@gmail.com, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, green.hu@gmail.com,
 nios2-dev@lists.rocketboards.org, Thomas Gleixner <tglx@linutronix.de>,
 gxt@pku.edu.cn, linux-arm-kernel@lists.infradead.org, chris@zankel.net,
 monstr@monstr.eu, Tony Luck <tony.luck@intel.com>,
 linux-parisc@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, fancer.lancer@gmail.com,
 rkuo@codeaurora.org, paul.burton@mips.com, vgupta@synopsys.com, richard@nod.at,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, lftan@altera.com,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180927045020.ZXc1O-Xos8n_STVcrAV0fm0Y8L71D78AWPeSmcDA25g@z>

On Wed, Sep 26, 2018 at 05:34:32PM -0700, Alexander Duyck wrote:
> On Wed, Sep 26, 2018 at 11:32 AM Mike Rapoport <rppt@linux.vnet.ibm.com> wrote:
> >
> > On Wed, Sep 26, 2018 at 09:58:41AM -0700, Alexander Duyck wrote:
> > > On Fri, Sep 14, 2018 at 5:11 AM Mike Rapoport <rppt@linux.vnet.ibm.com> wrote:
> > > >
> > > > All architecures use memblock for early memory management. There is no need
> > > > for the CONFIG_HAVE_MEMBLOCK configuration option.
> > > >
> > > > Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
> > >
> > > <snip>
> > >
> > > > diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> > > > index 5169205..4ae91fc 100644
> > > > --- a/include/linux/memblock.h
> > > > +++ b/include/linux/memblock.h
> > > > @@ -2,7 +2,6 @@
> > > >  #define _LINUX_MEMBLOCK_H
> > > >  #ifdef __KERNEL__
> > > >
> > > > -#ifdef CONFIG_HAVE_MEMBLOCK
> > > >  /*
> > > >   * Logical memory blocks.
> > > >   *
> > > > @@ -460,7 +459,6 @@ static inline phys_addr_t memblock_alloc(phys_addr_t size, phys_addr_t align)
> > > >  {
> > > >         return 0;
> > > >  }
> > > > -#endif /* CONFIG_HAVE_MEMBLOCK */
> > > >
> > > >  #endif /* __KERNEL__ */
> > >
> > > There was an #else above this section and I believe it and the code
> > > after it needs to be stripped as well.
> >
> > Right, I've already sent the fix [1] and it's in mmots.
> >
> > [1] https://lkml.org/lkml/2018/9/19/416
> >
> 
> Are you sure? The patch you reference appears to be for
> drivers/of/fdt.c, and the bit I pointed out here is in
> include/linux/memblock.h.

Ah, sorry. You are right, will fix. Thanks for spotting it!
 
> - Alex
> 

-- 
Sincerely yours,
Mike.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
