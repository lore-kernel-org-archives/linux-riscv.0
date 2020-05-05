Return-Path: <SRS0=aSmP=6T=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C324C47254
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 May 2020 20:12:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 478E420735
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 May 2020 20:12:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bBO1yemA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pqbqjcp4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 478E420735
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ckZTDK9kcamEMmc1gATLi1RBCBlss05gWVQweLLzqLk=; b=bBO1yemAwPCeiD
	boF/8Yx8b/YwUz/Y1pGdRp2dTvL6gwK2m93zvmGRnkbZ9IhadSeNAaUmqTdbVb+yhmCF2bz4F4OvO
	wySmjsyxq7htgmFU64G81OPyEd+bLbpAUjEt00W1BSs73eTlQkXQTP7TtJO7FWI27ZqzliN9fR/v7
	0g3qfWCXuc+e/MWrfQKq87DhaQot/BfjoMe0GkXRaoWdG3/NuyL1J5aPSwQBF2SVvDMVr3o9HqsWP
	YIjhkQdvzUzjeQXXALHKuN0uhzcpgumDk4MskOPiaqz2o6tDHcJ0togDxVKp6PGSzFRgJex5W+XVT
	CnaAV24S9KoDTNLcBIKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jW3vN-0003YY-N1; Tue, 05 May 2020 20:12:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jW3vF-0003Pj-Gg; Tue, 05 May 2020 20:12:10 +0000
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 619D920721;
 Tue,  5 May 2020 20:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588709528;
 bh=iCXbhk1z7F/kDs/nVraqaeYgCyIHXWPhAh8/VhmA1Xc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Pqbqjcp4PnFOmgqIDXj+8Bjl6/5/ohqBUkYxBuWzwlincpqWy3FQ0xkMGyVHwccvX
 WM2WCc/TBYfgYOWauIGtOhNuO3kK/yFKTFM/3sVIa4qR6GQIMPYaJ7YCqa0w6CoXwz
 sir6b1/N/Bs7N2CIGHNBpBp9fd/ysavQ6VdHSk/Y=
Date: Tue, 5 May 2020 13:12:06 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 3/3] mm/hugetlb: Introduce HAVE_ARCH_CLEAR_HUGEPAGE_FLAGS
Message-Id: <20200505131206.bee7b103431bff077c2ca0cf@linux-foundation.org>
In-Reply-To: <21460cbc-8e9a-b956-5797-57b2e1df9fb1@arm.com>
References: <1586864670-21799-1-git-send-email-anshuman.khandual@arm.com>
 <1586864670-21799-4-git-send-email-anshuman.khandual@arm.com>
 <20200425175511.7a68efb5e2f4436fe0328c1d@linux-foundation.org>
 <87d37591-caa2-b82b-392a-3a29b2c7e9a6@arm.com>
 <20200425200124.20d0c75fcaef05d062d3667c@linux-foundation.org>
 <21460cbc-8e9a-b956-5797-57b2e1df9fb1@arm.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_131209_572223_4B962DDD 
X-CRM114-Status: GOOD (  12.84  )
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Fenghua Yu <fenghua.yu@intel.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 5 May 2020 08:21:34 +0530 Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> >>> static inline void arch_clear_hugepage_flags(struct page *page)
> >>> {
> >>> 	<some implementation>
> >>> }
> >>> #define arch_clear_hugepage_flags arch_clear_hugepage_flags
> >>>
> >>> It's a small difference - mainly to avoid adding two variables to the
> >>> overall namespace where one would do.
> >>
> >> Understood, will change and resend.
> > 
> > That's OK - I've queued up that fix.
> >
> 
> Hello Andrew,
> 
> I might not have searched all the relevant trees or might have just searched
> earlier than required. But I dont see these patches (or your proposed fixes)
> either in mmotm (2020-04-29-23-04) or in next-20200504. Wondering if you are
> waiting on a V2 for this series accommodating the changes you had proposed.

hm.  I think I must have got confused and thought you were referring to
a different patch.  Yes please, let's have v2.

