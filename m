Return-Path: <SRS0=LUeZ=A7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F10C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2020 19:17:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3AD222B4E
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2020 19:17:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SleB9y+O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3AD222B4E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECXx1hmAye6OEhbztWSyt1AYZ+Tg26KiHoUtrkcTuJY=; b=SleB9y+OjPtCYFokZNix58JZsP
	/w2jXUS/8CMRYkm5rnwlVU9w9uoERatpkiOz2jHUhtuPQNbDb1Nubhbdy5THWX2Z+0YESwPk3A5v1
	U1N8rfuNZN6Swst85zf3Y1bi9/ayQFihry5rQGGceh5iAoPt9sCR/WXfmlgd/c1zWbmA1om9G+xUC
	dPJOdFF1ypQQybWitlS3A3+lpBC46hoWN3ic2oMZbc8bT5wI7n1wCTdsAV8+aESkHiZ8F7Z8FG3U6
	S4g54sIlaKyXNlIwC2+UXbXsSXmjQTeTQJtmX+BfEYQqvo65BmMiILtGIx901WZ3/ZbJbzhis1P6s
	U0iB+S+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxbHm-00066W-Pw; Mon, 20 Jul 2020 19:17:14 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxbHh-00064i-8C; Mon, 20 Jul 2020 19:17:10 +0000
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06KJ3Kws110242; Mon, 20 Jul 2020 15:16:36 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32d5h7y11u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 15:16:36 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06KJ3QeO110872;
 Mon, 20 Jul 2020 15:16:35 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32d5h7y11c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 15:16:35 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06KJ6AQW029169;
 Mon, 20 Jul 2020 19:16:34 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 32brq90hx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 19:16:34 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06KJGWTR38207870
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jul 2020 19:16:32 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41D1D78064;
 Mon, 20 Jul 2020 19:16:32 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55DB078066;
 Mon, 20 Jul 2020 19:16:26 +0000 (GMT)
Received: from [153.66.254.194] (unknown [9.85.132.116])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Jul 2020 19:16:26 +0000 (GMT)
Message-ID: <1595272585.4554.28.camel@linux.ibm.com>
Subject: Re: [PATCH 3/6] mm: introduce secretmemfd system call to create
 "secret" memory areas
From: James Bottomley <jejb@linux.ibm.com>
To: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 20 Jul 2020 12:16:25 -0700
In-Reply-To: <CAK8P3a34kx4aAFY=-SBHX3suCLwxeZY7+YSRzct93YM_OFbSWA@mail.gmail.com>
References: <20200720092435.17469-1-rppt@kernel.org>
 <20200720092435.17469-4-rppt@kernel.org>
 <CAK8P3a0NyvRMqH7X0YNO5E6DGtvZXD5ZcD6Y6n7AkocufkMnHA@mail.gmail.com>
 <1595260305.4554.9.camel@linux.ibm.com>
 <CAK8P3a34kx4aAFY=-SBHX3suCLwxeZY7+YSRzct93YM_OFbSWA@mail.gmail.com>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-20_09:2020-07-20,
 2020-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 clxscore=1015 mlxscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007200128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_151709_452195_260246BF 
X-CRM114-Status: GOOD (  41.50  )
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
Reply-To: jejb@linux.ibm.com
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
 Ingo Molnar <mingo@redhat.com>, linaro-mm-sig@lists.linaro.org,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux API <linux-api@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 2020-07-20 at 20:08 +0200, Arnd Bergmann wrote:
> On Mon, Jul 20, 2020 at 5:52 PM James Bottomley <jejb@linux.ibm.com>
> wrote:
> > On Mon, 2020-07-20 at 13:30 +0200, Arnd Bergmann wrote:
> > 
> > I'll assume you mean the dmabuf userspace API?  Because the kernel
> > API is completely device exchange specific and wholly inappropriate
> > for this use case.
> > 
> > The user space API of dmabuf uses a pseudo-filesystem.  So you
> > mount the dmabuf file type (and by "you" I mean root because an
> > ordinary user doesn't have sufficient privilege).  This is
> > basically because every dmabuf is usable by any user who has
> > permissions.  This really isn't the initial interface we want for
> > secret memory because secret regions are supposed to be per process
> > and not shared (at least we don't want other tenants to see who's
> > using what).
> > 
> > Once you have the fd, you can seek to find the size, mmap, poll and
> > ioctl it.  The ioctls are all to do with memory synchronization (as
> > you'd expect from a device backed region) and the mmap is handled
> > by the dma_buf_ops, which is device specific.  Sizing is missing
> > because that's reported by the device not settable by the user.
> 
> I was mainly talking about the in-kernel interface that is used for
> sharing a buffer with hardware. Aside from the limited ioctls,
> anything in the kernel can decide on how it wants to export a dma_buf
> by calling dma_buf_export()/dma_buf_fd(), which is roughly what the
> new syscall does as well. Using dma_buf vs the proposed
> implementation for this is not a big difference in complexity.

I have thought about it, but haven't got much further:  We can't couple
to SGX without a huge break in the current simple userspace API (it
becomes complex because you'd have to enter the enclave each time you
want to use the memory, or put the whole process in the enclave, which
is a bit of a nightmare for simplicity), and we could only couple it to
SEV if the memory encryption engine would respond to PCID as well as
ASID, which it doesn't.

> The one thing that a dma_buf does is that it allows devices to
> do DMA on it. This is either something that can turn out to be
> useful later, or it is not. From the description, it sounded like
> the sharing might be useful, since we already have known use
> cases in which "secret" data is exchanged with a trusted execution
> environment using the dma-buf interface.

The current use case for private keys is that you take an encrypted
file (which would be the DMA coupled part) and you decrypt the contents
into the secret memory.  There might possibly be a DMA component later
where a HSM like device DMAs a key directly into your secret memory to
avoid exposure, but I wouldn't anticipate any need for anything beyond
the usual page cache API for that case (effectively this would behave
like an ordinary page cache page except that only the current process
would be able to touch the contents).

> If there is no way the data stored in this new secret memory area
> would relate to secret data in a TEE or some other hardware
> device, then I agree that dma-buf has no value.

Never say never, but current TEE designs tend to require full
confidentiality for the entire execution.  What we're probing is
whether we can improve security by doing an API that requires less than
full confidentiality for the process.  I think if the API proves useful
then we will get HW support for it, but it likely won't be in the
current TEE of today form.

> > What we want is the ability to get an fd, set the properties and
> > the size and mmap it.  This is pretty much a 100% overlap with the
> > memfd API and not much overlap with the dmabuf one, which is why I
> > don't think the interface is very well suited.
> 
> Does that mean you are suggesting to use additional flags on
> memfd_create() instead of a new system call?

Well, that was what the previous patch did.  I'm agnostic on the
mechanism for obtaining the fd: new syscall as this patch does or
extension to memfd like the old one did.  All I was saying is that once
you have the fd, the API you use on it is the same as the memfd API.

James


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
