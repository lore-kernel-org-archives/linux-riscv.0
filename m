Return-Path: <SRS0=LUeZ=A7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9915DC433E1
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2020 14:21:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67DC620B1F
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2020 14:21:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x/n7rt3w";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XQFs0H8a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67DC620B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UZrqmlSn4DS+AjASVaTRosLl4xGqFJaomAFPNnfYmo8=; b=x/n7rt3wqFlCflG3Unfi96cSh
	pvmsPCI8yIZfB1QBWD9idgYu1K+4xm0dVeUR7RjoLER0OTqPrAMeduuo6TbZQAUjUyEyxdPet1lk0
	MtpMTe8AzJW69enZtNgFgGCc9CfIGgQRaLN+udMwt2QTzxcTARWuRfgQb/roPr+reTCD4Eno9xhGO
	+qwzqhrUdA2sNQXIYZMPUJiXBv78Bs9yoRRMiosAbjUnHcMy4q6CiL314MBd6EMwhSmXOfgu867Ih
	vMbMaW3BO9di3AZC/l3xhAx++8nf5GYo67hazHpNq2/wOS+rQ721hfpv8ap3dOjvwFZOq9n26p83d
	MXdGNyxig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxWfL-0002Y5-VO; Mon, 20 Jul 2020 14:21:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxWfF-0002VR-Po; Mon, 20 Jul 2020 14:21:11 +0000
Received: from kernel.org (unknown [87.71.40.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 268A520B1F;
 Mon, 20 Jul 2020 14:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595254869;
 bh=HLsnWapSZr1TpttXIYrQQDMJGrH8nj1rqvBMPrAFCRE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XQFs0H8abPDZJviZX+5bTqQNawGqmx/pBTGly2VfVP90WSpMzcMHYQaTLQ4IRVWLD
 k/TvI13Gi+NhRKv0vTnOIb6rS5YvbMFxFB2Z5aBUzsuJsDlzLpFqI8rMGY5I1SWibn
 SqtW927tzctc+7dbf6a1ky5SigWZ7PMcfQCFsoO4=
Date: Mon, 20 Jul 2020 17:20:53 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/6] mm: introduce secretmemfd system call to create
 "secret" memory areas
Message-ID: <20200720142053.GC8593@kernel.org>
References: <20200720092435.17469-1-rppt@kernel.org>
 <20200720092435.17469-4-rppt@kernel.org>
 <CAK8P3a0NyvRMqH7X0YNO5E6DGtvZXD5ZcD6Y6n7AkocufkMnHA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0NyvRMqH7X0YNO5E6DGtvZXD5ZcD6Y6n7AkocufkMnHA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_102110_025788_8955352B 
X-CRM114-Status: GOOD (  25.40  )
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Linux-MM <linux-mm@kvack.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Dan Williams <dan.j.williams@intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 linux-arch <linux-arch@vger.kernel.org>, Tycho Andersen <tycho@tycho.ws>,
 linux-nvdimm@lists.01.org, Will Deacon <will@kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 linaro-mm-sig@lists.linaro.org, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux API <linux-api@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 20, 2020 at 01:30:13PM +0200, Arnd Bergmann wrote:
> On Mon, Jul 20, 2020 at 11:25 AM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > From: Mike Rapoport <rppt@linux.ibm.com>
> >
> > Introduce "secretmemfd" system call with the ability to create memory areas
> > visible only in the context of the owning process and not mapped not only
> > to other processes but in the kernel page tables as well.
> >
> > The user will create a file descriptor using the secretmemfd system call
> > where flags supplied as a parameter to this system call will define the
> > desired protection mode for the memory associated with that file
> > descriptor. Currently there are two protection modes:
> >
> > * exclusive - the memory area is unmapped from the kernel direct map and it
> >               is present only in the page tables of the owning mm.
> > * uncached  - the memory area is present only in the page tables of the
> >               owning mm and it is mapped there as uncached.
> >
> > For instance, the following example will create an uncached mapping (error
> > handling is omitted):
> >
> >         fd = secretmemfd(SECRETMEM_UNCACHED);
> >         ftruncate(fd, MAP_SIZE);
> >         ptr = mmap(NULL, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED,
> >                    fd, 0);
> >
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> 
> I wonder if this should be more closely related to dmabuf file
> descriptors, which
> are already used for a similar purpose: sharing access to secret memory areas
> that are not visible to the OS but can be shared with hardware through device
> drivers that can import a dmabuf file descriptor.

TBH, I didn't think about dmabuf, but my undestanding is that is this
case memory areas are not visible to the OS because they are on device
memory rather than normal RAM and when dmabuf is backed by the normal
RAM, the memory is visible to the OS.

Did I miss anything?


>       Arnd

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
