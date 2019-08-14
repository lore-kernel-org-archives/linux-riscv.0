Return-Path: <SRS0=pZSk=WK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A98DC0650F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2019 03:29:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68BE120679
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2019 03:29:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UzkdRJ3f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68BE120679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pEAYwPTycKbwWbx9PgkVxmW3kAf8tz0vrQlH8xiVoy0=; b=UzkdRJ3fVFck4E
	LvLqAO+u0NNlGBUXQQchk6TEcFXX3rrZz6bCIPR2Ra2t5eSvA35+zK+wo0iTzhk93FiG0a71//8qT
	KsQZ6jSuBIjI42iW63JEaB9Jzk+X8QVUkI8rrqBT3FBZNRpqvtwqYnoieRd1dD2iyX8loCgNpPZiv
	9Nb1he++7ri20FKOi7gUSXfZu+QIWnJsMntwjOu1o1WF93tdVJfG/Sy4mqrA5vM7jB4U49L3w/ytV
	8xF9AuoxlDgxvRPL9YvPy3iKC8DABbDVMz/DzHhxnmeDdHoMKX/3CJTfbidofacGOTI31YJMBQ3d1
	xf2IiB5bs3RAJd6gMA0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxjy8-0005F5-WD; Wed, 14 Aug 2019 03:29:01 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxjy4-0005EJ-Ks
 for linux-riscv@lists.infradead.org; Wed, 14 Aug 2019 03:28:58 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id x7E3G38F041472;
 Wed, 14 Aug 2019 11:16:03 +0800 (GMT-8)
 (envelope-from nickhu@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Wed, 14 Aug 2019
 11:27:32 +0800
Date: Wed, 14 Aug 2019 11:27:33 +0800
From: Nick Hu <nickhu@andestech.com>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 1/2] riscv: Add memmove string operation.
Message-ID: <20190814032732.GA8989@andestech.com>
References: <mhng-ba92c635-7087-4783-baa5-2a111e0e2710@palmer-si-x1e>
 <alpine.DEB.2.21.9999.1908131921180.19217@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1908131921180.19217@viisi.sifive.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com x7E3G38F041472
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_202856_943948_C1352FFD 
X-CRM114-Status: GOOD (  18.80  )
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
Cc: =?utf-8?B?6Zui6IG3Wm9uZyBab25nLVhpYW4gTGko5p2O5a6X5oayKQ==?=
 <zong@andestech.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 Alan Quey-Liang =?utf-8?B?S2FvKOmrmOmtgeiJryk=?= <alankao@andestech.com>,
 Atish Patra <Atish.Patra@wdc.com>, Greg KH <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
 Christoph Hellwig <hch@infradead.org>,
 "alexios.zavras@intel.com" <alexios.zavras@intel.com>,
 Anup Patel <Anup.Patel@wdc.com>, "glider@google.com" <glider@google.com>,
 "green.hu@gmail.com" <green.hu@gmail.com>,
 "aryabinin@virtuozzo.com" <aryabinin@virtuozzo.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "deanbo422@gmail.com" <deanbo422@gmail.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "dvyukov@google.com" <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 14, 2019 at 10:22:15AM +0800, Paul Walmsley wrote:
> On Tue, 13 Aug 2019, Palmer Dabbelt wrote:
> 
> > On Mon, 12 Aug 2019 08:04:46 PDT (-0700), Christoph Hellwig wrote:
> > > On Wed, Aug 07, 2019 at 03:19:14PM +0800, Nick Hu wrote:
> > > > There are some features which need this string operation for compilation,
> > > > like KASAN. So the purpose of this porting is for the features like KASAN
> > > > which cannot be compiled without it.
> > > > 
> > > > KASAN's string operations would replace the original string operations and
> > > > call for the architecture defined string operations. Since we don't have
> > > > this in current kernel, this patch provides the implementation.
> > > > 
> > > > This porting refers to the 'arch/nds32/lib/memmove.S'.
> > > 
> > > This looks sensible to me, although my stringop asm is rather rusty,
> > > so just an ack and not a real review-by:
> > > 
> > > Acked-by: Christoph Hellwig <hch@lst.de>
> > 
> > FWIW, we just write this in C everywhere else and rely on the compiler to
> > unroll the loops.  I always prefer C to assembly when possible, so I'd prefer
> > if we just adopt the string code from newlib.  We have a RISC-V-specific
> > memcpy in there, but just use the generic memmove.
> > 
> > Maybe the best bet here would be to adopt the newlib memcpy/memmove as generic
> > Linux functions?  They're both in C so they should be fine, and they both look
> > faster than what's in lib/string.c.  Then everyone would benefit and we don't
> > need this tricky RISC-V assembly.  Also, from the look of it the newlib code
> > is faster because the inner loop is unrolled.
> 
> There's a generic memmove implementation in the kernel already:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/string.h#n362
> 
> Nick, could you tell us more about why the generic memmove() isn't 
> suitable?
> 
> 
> - Paul

Hi Paul,

KASAN has its own string operations(memcpy/memmove/memset) because it needs to
hook some code to check memory region. It would undefined the original string
operations and called the string operations with the prefix '__'. But the
generic string operations didn't declare with the prefix. Other archs with
KASAN support like arm64 and xtensa all have their own string operations and
defined with the prefix.

Nick

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
