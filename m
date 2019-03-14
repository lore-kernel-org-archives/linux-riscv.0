Return-Path: <SRS0=jyaq=RR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,USER_AGENT_MUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C2CDC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2019 06:53:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2029217F5
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2019 06:53:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JACCrci1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2029217F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:In-Reply-To:MIME-Version:
	References:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i0bTWKBe71rr/kINH17cP5w22gPFsI4HfHKWAJuMIPk=; b=JACCrci1wDXfWX
	tc+4+zQF51TgaEVGke04qopanc/rg+PqoVkp/6PKMeZy5VHc9Ts3l1XYZuZqeaR4KNbGHLVXsQs4m
	JAcxyEpqU9IR1T4ZMl4CTyNegAw3wH+N7+78K4c5hy1LJ7MI1MvVX4A3HLiOMy9/nAn2Zr4D/MhLx
	wqfqiz2Uxyko6Ypb1/hoLXk6IBdD3llSj2xT98Yvj1ymS+iyagRjq/1Qub8o6P99tyXhHeEEibw4M
	ggjmI7D8iwz9l2GYqYmEzO1HXsg3jHgbUjvsMs5bH5UYvc40IQVVT2YkrdBxkSiuMSxedGNoytL8p
	HrVLBTakqlktjE8YXDew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4KF4-0008NY-Gk; Thu, 14 Mar 2019 06:53:26 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4KF1-0008N3-Ja
 for linux-riscv@lists.infradead.org; Thu, 14 Mar 2019 06:53:25 +0000
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2E6nFDa062880
 for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2019 02:53:22 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2r7gsqk0uu-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2019 02:53:21 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-riscv@lists.infradead.org> from <rppt@linux.ibm.com>;
 Thu, 14 Mar 2019 06:53:19 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 14 Mar 2019 06:53:14 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x2E6rEme22806776
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 14 Mar 2019 06:53:14 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC306A4040;
 Thu, 14 Mar 2019 06:53:13 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39914A405D;
 Thu, 14 Mar 2019 06:53:13 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.8.84])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 14 Mar 2019 06:53:13 +0000 (GMT)
Date: Thu, 14 Mar 2019 08:53:11 +0200
From: Mike Rapoport <rppt@linux.ibm.com>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH 3/3] RISC-V: Allow booting kernel from any 4KB aligned
 address
References: <20190312220752.128141-1-anup.patel@wdc.com>
 <20190312220752.128141-4-anup.patel@wdc.com>
 <20190313183121.GB28630@rapoport-lnx>
 <CAAhSdy1mrV2CakS0cfOY8F1B7uH_yXjO3W-CiMUcYonkRnVbeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy1mrV2CakS0cfOY8F1B7uH_yXjO3W-CiMUcYonkRnVbeQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19031406-0012-0000-0000-000003026CCF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19031406-0013-0000-0000-0000213995A9
Message-Id: <20190314065311.GC24380@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-14_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903140046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_235323_753679_E5E51C78 
X-CRM114-Status: GOOD (  36.60  )
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

On Thu, Mar 14, 2019 at 02:36:01AM +0530, Anup Patel wrote:
> On Thu, Mar 14, 2019 at 12:01 AM Mike Rapoport <rppt@linux.ibm.com> wrote:
> >
> > On Tue, Mar 12, 2019 at 10:08:22PM +0000, Anup Patel wrote:
> > > Currently, we have to boot RISCV64 kernel from a 2MB aligned physical
> > > address and RISCV32 kernel from a 4MB aligned physical address. This
> > > constraint is because initial pagetable setup (i.e. setup_vm()) maps
> > > entire RAM using hugepages (i.e. 2MB for 3-level pagetable and 4MB for
> > > 2-level pagetable).
> > >
> > > Further, the above booting contraint also results in memory wastage
> > > because if we boot kernel from some <xyz> address (which is not same as
> > > RAM start address) then RISCV kernel will map PAGE_OFFSET virtual address
> > > lineraly to <xyz> physical address and memory between RAM start and <xyz>
> > > will be reserved/unusable.
> > >
> > > For example, RISCV64 kernel booted from 0x80200000 will waste 2MB of RAM
> > > and RISCV32 kernel booted from 0x80400000 will waste 4MB of RAM.
> > >
> > > This patch re-writes the initial pagetable setup code to allow booting
> > > RISV32 and RISCV64 kernel from any 4KB (i.e. PAGE_SIZE) aligned address.
> > >
> > > To achieve this:
> > > 1. We map kernel, dtb and only some amount of RAM (few MBs) using 4KB
> > >    mappings in setup_vm() (called from head.S)
> > > 2. Once we reach paging_init() (called from setup_arch()) after
> > >    memblock setup, we map all available memory banks using 4KB
> > >    mappings and memblock APIs.
> >
> > I'm not really familiar with RISC-V, but my guess would be that you'd get
> > worse TLB performance with 4KB mappings. Not mentioning the amount of
> > memory required for the page table itself.
> 
> I agree we will see a hit in TLB performance due to 4KB mappings.
> 
> To address this we can create, 2MB (or 4MB on 32bit system) mappings
> whenever load_pa is aligned to it otherwise we prefer 4KB mappings. In other
> words, we create bigger mappings whenever possible and fallback to 4KB
> mappings when not possible.
> 
> This way if kernel is booted from 2MB (or 4MB) aligned address then we will
> see good TLB performance for kernel addresses. Also, users are still free to
> boot Linux RISC-V kernel from any 4KB aligned address.
> 
> Of course, we will have to document this as part of Linux RISC-V booting
> requirements under Documentation/ (which does not exist currently).
> 
> >
> > If the only goal is to utilize the physical memory below the kernel, it
> > simply should not be reserved at the first place, something like:
> 
> Well, our goal was two-fold:
> 
> 1. We wanted to unify boot-time alignment requirements for 32bit and
> 64bit RISC-V systems

Can't they both start from 4MB aligned address provided the memory below
the kernel can be freed?

> 2. Save memory by allowing users to place kernel just after the runtime
> firmware at starting of RAM.

If the firmware should be alive after kernel boot, it's memory is the only
part that should be reserved below the kernel. Otherwise, the entire region
<physical memory start> - <kernel start> can be free.

Using 4K pages for the swapper_pg_dir is quite a change and I'm not
convinced its really justified.
 
> >
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index b379a75..6301ced 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -108,6 +108,7 @@ void __init setup_bootmem(void)
> >         /* Find the memory region containing the kernel */
> >         for_each_memblock(memory, reg) {
> >                 phys_addr_t vmlinux_end = __pa(_end);
> > +               phys_addr_t vmlinux_start = __pa(start);
> >                 phys_addr_t end = reg->base + reg->size;
> >
> >                 if (reg->base <= vmlinux_end && vmlinux_end <= end) {
> > @@ -115,7 +116,8 @@ void __init setup_bootmem(void)
> >                          * Reserve from the start of the region to the end of
> >                          * the kernel
> >                          */
> > -                       memblock_reserve(reg->base, vmlinux_end - reg->base);
> > +                       memblock_reserve(vmlinux_start,
> > +                                        vmlinux_end - vmlinux_start);
> >                         mem_size = min(reg->size, (phys_addr_t)-PAGE_OFFSET);
> >                 }
> >         }
> 
> Thanks for above changes. I will include them in my next revision.
> 
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
