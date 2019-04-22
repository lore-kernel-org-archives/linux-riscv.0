Return-Path: <SRS0=GwCz=SY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EACFDC282E3
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2019 19:56:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B82CE204EC
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2019 19:56:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZdR2FA79"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B82CE204EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ja+vm6iICUOhODaF1tjN9BbWVp6Ig8QWHywf3ceqsns=; b=ZdR2FA79Hk57/N
	wXs14FsxZFQX4ztRTCd5X2ImJlxcc/N7nU1jah5Q3qhJlmN6VuOkO2iHtRLlSVOM6ky8WoBSVKmfO
	xlPwi/d//1LYSW1v2Vjz7iUicMb61WkGLI2RlnQRZTFMxn1r+8qBLsmScGNZ+hUfVxBM71cB7M33A
	ND3pP+9Osz8gMlgCDXpvDtcq2qqHZYfNRF8r9YzU25e/4vjDAJkniOOh4+09JuIrWSEGuz2dSWTVg
	0RdJih0jAHIGQ7CaWtXWWT480aRynKoRLjL8XzsinTTAR2DjzqCSZaAhiyZzufQDT9+iuYFBpQFR2
	KD+3QHC8DrtWlZjAy+9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIf37-00019u-FS; Mon, 22 Apr 2019 19:56:21 +0000
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIf2y-00011F-K9; Mon, 22 Apr 2019 19:56:14 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 7ABF068AFE; Mon, 22 Apr 2019 21:55:57 +0200 (CEST)
Date: Mon, 22 Apr 2019 21:55:56 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v3 04/11] arm64, mm: Move generic mmap layout functions
 to mm
Message-ID: <20190422195556.GD2224@lst.de>
References: <20190417052247.17809-1-alex@ghiti.fr>
 <20190417052247.17809-5-alex@ghiti.fr>
 <CAGXu5j+NV7nfQ044kvsqqSrWpuXH5J6aZEbvg7YpxyBFjdAHyw@mail.gmail.com>
 <fd2b02b3-5872-ccf6-9f52-53f692fba02d@ghiti.fr>
 <CAGXu5j+NkQ+nwRShuKeHMwuy6++3x0QMS9djE=wUzUUtAkVf3g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGXu5j+NkQ+nwRShuKeHMwuy6++3x0QMS9djE=wUzUUtAkVf3g@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190422_125612_813798_A8DD0411 
X-CRM114-Status: GOOD (  15.45  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alex Ghiti <alex@ghiti.fr>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>,
 Ralf Baechle <ralf@linux-mips.org>, LKML <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Linux-MM <linux-mm@kvack.org>,
 Paul Burton <paul.burton@mips.com>, linux-riscv@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, James Hogan <jhogan@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mips@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 18, 2019 at 09:19:18AM -0500, Kees Cook wrote:
> On Thu, Apr 18, 2019 at 12:55 AM Alex Ghiti <alex@ghiti.fr> wrote:
> > Regarding the help text, I agree that it does not seem to be frequent to
> > place
> > comment above config like that, I'll let Christoph and you decide what's
> > best. And I'll
> > add the possibility for the arch to define its own STACK_RND_MASK.
> 
> Yeah, I think it's very helpful to spell out the requirements for new
> architectures with these kinds of features in the help text (see
> SECCOMP_FILTER for example).

Spelling out the requirements sounds useful.  Abusing the help text
for an option for which no help text can be displayed it pointless.
Just make it a comment as Alex did in this patch, which makes whole
lot more sense.

> > Actually, I had to add those ifdefs for mmap_rnd_compat_bits, not
> > is_compat_task.
> 
> Oh! In that case, use CONFIG_HAVE_ARCH_MMAP_RND_BITS. :) Actually,
> what would be maybe cleaner would be to add mmap_rnd_bits_min/max
> consts set to 0 for the non-CONFIG_HAVE_ARCH_MMAP_RND_BITS case at the
> top of mm/mmap.c.

Lets do that in a second step.  The current series is already big
enough and a major improvement, even if there is much more to clean
up in this area still left.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
