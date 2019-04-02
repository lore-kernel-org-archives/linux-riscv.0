Return-Path: <SRS0=a8/2=SE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FD9C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2019 10:15:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7477B2082C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2019 10:15:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Egaz5Xxd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7477B2082C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:In-Reply-To:MIME-Version:
	References:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EMwSijh8sAZxJGy0tLV/iv06B+j71UEJt4gsMfCB2tU=; b=Egaz5Xxd+SoLRh
	v5JIQE6yrMyCUR/UdseowAX1BmZ58LPKDu1GJ+TOQmmYRHSzY48OIKyKv+0GkUy0BspPfGsi+oikb
	GgDYy+RQRx85maWMOe55mX6V44AXVPZbVbfz1IMInAVbQDnE6yOQYliHJq2JDy/lGWC5DqkqoV5+3
	WMTXOpYICCNR4vemO9MFeMZ3DcgzU5WOzd89a4tBE+59+TTtoKQ3ZoeXgiGuAVT0GeOi4wcPLso2y
	4Wk3ckA+4/O6VZb50P7TicxgWknFmzR4nFMb+Vpizb3qr4viIn0hb9yKqQzn2Qv+nZbY7qM6TsxYt
	ws/jtjtTgCBZnTtXzvMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBGRh-0003bn-GD; Tue, 02 Apr 2019 10:15:09 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBGRd-00031b-Um
 for linux-riscv@lists.infradead.org; Tue, 02 Apr 2019 10:15:07 +0000
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x32A9mvf090122
 for <linux-riscv@lists.infradead.org>; Tue, 2 Apr 2019 06:15:03 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rm5382vru-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2019 06:15:03 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-riscv@lists.infradead.org> from <rppt@linux.ibm.com>;
 Tue, 2 Apr 2019 11:15:00 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 2 Apr 2019 11:14:58 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x32AEv3W44105754
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Apr 2019 10:14:57 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B5BA42042;
 Tue,  2 Apr 2019 10:14:57 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89FDA42041;
 Tue,  2 Apr 2019 10:14:56 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.8.112])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  2 Apr 2019 10:14:56 +0000 (GMT)
Date: Tue, 2 Apr 2019 13:14:54 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH] RISC-V: Fix Maximum Physical Memory 2GiB option for
 64bit systems
References: <20190402055902.14017-1-anup.patel@wdc.com>
 <20190402083456.GA2153@rapoport-lnx>
 <CAAhSdy1ZFW1zAqc-7904SOse-tWKOmpY3dCHb5Xe6U6KNno_JQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy1ZFW1zAqc-7904SOse-tWKOmpY3dCHb5Xe6U6KNno_JQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19040210-0028-0000-0000-0000035C4B7D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19040210-0029-0000-0000-0000241B4F3C
Message-Id: <20190402101454.GB2153@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-02_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904020071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_031506_111902_381E2930 
X-CRM114-Status: GOOD (  31.06  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Apr 02, 2019 at 03:00:02PM +0530, Anup Patel wrote:
> On Tue, Apr 2, 2019 at 2:05 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
> >
> > On Tue, Apr 02, 2019 at 06:02:38AM +0000, Anup Patel wrote:
> > > The Maximum Physical Memory 2GiB option for 64bit systems is currently
> > > broken because kernel hangs at boot-time when this option is enabled
> > > and the underlying system has more than 2GiB memory.
> > >
> > > This issue can be easily reproduced on SiFive Unleashed board where
> > > we have 8GiB of memory.
> > >
> > > This patch fixes above issue by reserving unusable memory region in
> > > setup_bootmem().
> > >
> > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > ---
> > >  arch/riscv/mm/init.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > > index 5fd8c922e1c2..6b063f20a9d0 100644
> > > --- a/arch/riscv/mm/init.c
> > > +++ b/arch/riscv/mm/init.c
> > > @@ -121,6 +121,14 @@ void __init setup_bootmem(void)
> > >                        */
> > >                       memblock_reserve(reg->base, vmlinux_end - reg->base);
> > >                       mem_size = min(reg->size, (phys_addr_t)-PAGE_OFFSET);
> > > +
> > > +                     /*
> > > +                      * Reserve from the end of usable area to the end of
> > > +                      * region
> > > +                      */
> > > +                     if ((reg->base + mem_size) < end)
> > > +                             memblock_reserve(reg->base + mem_size,
> > > +                                              end - reg->base - mem_size);
> >
> > The memory above MAXPHYSMEM should not be reserved. It should be either
> > removed from memblock with memblock_remove or not added at the first place.
> >
> > Frankly, I fail to understand the logic behind setting PAGE_OFFSET to
> > MAXPHYSMEM and then using PAGE_OFFSET as the limit for accessible physical
> > memory. Still, as it is there, you can set MAX_MEMBLOCK_ADDR=PAGE_OFFSET in
> > arch/riscv/include/page.h and then early_init_dt_add_memory_arch() will
> > simply ignore the memory above PAGE_OFFSET.
> 
> Little explanation about current code ...
> 
> The current code, assumes PAGE_OFFSET to have value such that
> upper-bits are 1s lower bits are 0s.
> For example,
> 0xc0000000 (32bit),
> 0xffffffff80000000 (64bit), and
> 0xffffffe000000000 (64bit)
> 
> For above PAGE_OFFSET values, -PAGE_OFFSET is size of virtual
> address space and maximum supported physical memory is also
> -PAGE_OFFSET hence MAXPHYMEM is tied with -PAGE_OFFSET.

Right, but I what I don't understand is *why* PAGE_OFFSET is used as the
maximal supported physical address.
 
> If we try to force some arbitrary PAGE_OFFSET then things break.

Apparently they will :)
 
> Regards,
> Anup
> 

-- 
Sincerely yours,
Mike.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
