Return-Path: <SRS0=Jr9t=KL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1B1C433ED
	for <linux-riscv@archiver.kernel.org>; Sun, 16 May 2021 07:14:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 619E361151
	for <linux-riscv@archiver.kernel.org>; Sun, 16 May 2021 07:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 619E361151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HTZ+8SS3R6iRGZmo3UPgfF5VJNuQFrUBBQf3BFtytMY=; b=fjqRStvrl+RBaQHczEUBCAj3o
	LYSkywVFJRNObXoc8bAa+c+Jop2bkf7LM/X/9bn2hDi0ldHCW9zeEOG+8SB5UJ2WpIrk0iCT62yD4
	ddU4nqA1UrEIEqBea0Sa3/gRkPX9NYYSBGA3i8L8UDOqy/QwHaArvybOQ3pctRxbWAHcydiKhXrCH
	vh7FH8Jntzbh0OPSLMg/7zu0xYs9uJux4IyNX1q2DEniP/x7EK+CV0qN6KyRbX5UNjM14Sw711UiJ
	P2qTxrSMiQU/iQ7jRAGduGe05unJtTg07XMrNY4PstT8KQk7fyD7QCZrlH+TwJzT+egvxi9Mj1j4E
	dhoOwreZg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liAyP-00Blrx-U4; Sun, 16 May 2021 07:14:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liAyA-00Blr5-1D; Sun, 16 May 2021 07:13:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=PhEusfgRMLvTWx896cxh+zJZeE5NaJMhzTB7kYoPAaw=; b=JCiM8F+8WyF9Z/Ro0yPmjH5WU2
 whPDpzmRvJpN7OUfU1UzQjWfb2k+clwXVHnZZgUF+PwnMihndUsMqPl+ExdklI7BFYOGczk5jIJTq
 s4afEblcAjqnCld1R6qoDbs+IoQ+YLwhG4Xw9Cz6DaaNVor9GS9Q9OLeIcUHhTWdVYA3AkO+7Xt7f
 vbDS9XXyQtk2ilZCmY+ffChYasxaEH8GzleMSqT+RhlIaAKa2+Brfmb2Sfif6rP0pvNnJ2LXkCSxu
 iEdIB9CfzB9U/kjLbtDQMO+/OM8crJgcbDS2Sk+t4zbrthOKCnzSPYFPiJVhtup/3ZaqiPFwwjqt7
 xM72Yv8g==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liAy7-00CnpN-GP; Sun, 16 May 2021 07:13:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE3C96115C;
 Sun, 16 May 2021 07:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621149218;
 bh=IoT9uozjOozDjgXpC4P6jXJSumTP/QNdfBTNGYn48Go=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UJGadq3iWVyp6JiaaARzML2nDhD/6cxgoukhLb//Cm1oiKYNlw2vGT6JTI7JDXvj2
 sv01qcX7qz1P0swA1iAeer1zfo0u8w0FM+2xjAKXq5nty+4U8NND5Zd35VzjSdgPvo
 tDXqQy0wo5sGVwSrA1ulFuVwtCplNbJ71DrU3dWxVebC/bnfBzEDBPZgIZbVXfd0Sk
 QuBjs82K5fBUBM1+e1y5/3sAud3EurnH6Q3/XujCr4AuuRXHMRs0y7nWOwkAisAJxZ
 RIgDFv5dORgRpVXtvZRRsIItfRvWQyJQI2ZhrWK1iaupqJoRD9qzvTr0ixi2Std5XI
 RjQV7hOfflMCg==
Date: Sun, 16 May 2021 10:13:19 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Hagen Paul Pfeifer <hagen@jauu.net>, Ingo Molnar <mingo@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Kees Cook <keescook@chromium.org>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>,
 Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roman Gushchin <guro@fb.com>, Shakeel Butt <shakeelb@google.com>,
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Tycho Andersen <tycho@tycho.ws>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, linux-api@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-riscv@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH v19 3/8] set_memory: allow set_direct_map_*_noflush() for
 multiple pages
Message-ID: <YKDGD0k990bBCEGG@kernel.org>
References: <20210513184734.29317-1-rppt@kernel.org>
 <20210513184734.29317-4-rppt@kernel.org>
 <858e5561-bc7d-4ce1-5cb8-3c333199d52a@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <858e5561-bc7d-4ce1-5cb8-3c333199d52a@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210516_001343_586792_F65AF756 
X-CRM114-Status: GOOD (  13.74  )
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

On Fri, May 14, 2021 at 10:43:29AM +0200, David Hildenbrand wrote:
> On 13.05.21 20:47, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > The underlying implementations of set_direct_map_invalid_noflush() and
> > set_direct_map_default_noflush() allow updating multiple contiguous pages
> > at once.
> > 
> > Add numpages parameter to set_direct_map_*_noflush() to expose this
> > ability with these APIs.
> 
> AFAIKs, your patch #5 right now only calls it with 1 page, do we need this
> change at all? Feels like a leftover from older versions to me where we
> could have had more than a single page.

Right, will drop it. 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
