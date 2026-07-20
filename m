Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6253EC44520
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 19:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nDlm/x12WO64MsoQZmt3vLUONdev6q4FTL6awEKRcKg=; b=lo6sfjkPmgt5ra
	tGjpm2E/nai0luhDG6aRoXOpyLCL4wPmFBW38i24xGknKO7n5OifwUM3h/sKQGI3jtMjKFOPyeaDh
	0grxfzcI4gLy46UPTG256tghvVWI8GspJ9xwBihCtrYJHAImXfzLE+73671BoMl1sS5JamkZm2maA
	vbAQPS/mawbPCPj3yJ00HpWCdAkeG1VJjYWBeDZwYAv6j/QPHAX57jDRvTYwRHGZMQaVVcz8e4+IO
	epSaW3GMQEMweRlkUr3EJrqfKeqei5tV0hfV8tnCeVz+pr/XY9wqNaTsyhqgwAXpH6Aok8M8T2+su
	M237EqpRo+sPc0CCYdrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltIk-00000007ikU-3OzR;
	Mon, 20 Jul 2026 19:05:18 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltIg-00000007iiW-1yqe
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 19:05:17 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ceed7018c8so46861565ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2026 12:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784574313; x=1785179113; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kPMaiKQm/Lrn2+15jJw1Tz84+egEdnjBHflNkHpDaxg=;
        b=UBo88U6OuaWJQo6wbNNQ4fEK8ht2MGh+8erPQ84WnrqKZA+8H3CRCwDhlB62gTMYPY
         VOkNyFnTnSjyZvzIfhDtyUYbDXIJL5RSwrO+cpO+1EEGY8jGn7+Ti9sGZBNaD+v/ZHx1
         DZY3j9t47Te9h/1khdN5HVZEfa0qWhe2xvQNIMzm+F+m07vOeISvMPMXqtstC8y4uLdQ
         pr8BK2AcQyjasdHbcmMyfQSDX4BVUViACqIlaqNA/5Z3gCk53obhll91zqr2rIj/8N5B
         oGGwE3GHlXgHbUp8WIPPi8qOOTqFmK7JUCCq7sN6nxpav8tuR9sDLrCzHmwCLY7UtExv
         /xwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784574313; x=1785179113;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPMaiKQm/Lrn2+15jJw1Tz84+egEdnjBHflNkHpDaxg=;
        b=AV9wx6NsL3HYNUWCjRPJONkj2QV8ww+dCRs/LkJUlrMJoyTKDj/EQcS/lBywIrTBG5
         cUED95s4s24o/ADguDSwJk2bh5udx0OEY2HHmsJKDorQuCGxwt/lfsAjrqW7Viz4Oinx
         p4yh7tZaNkllCTlUQMyrskJgrpGpGuQLL9kAD7lcS4XGHmmkvS6q7JmBFYrqoqtmGp6X
         /S/Wn9XwC5D2AGQPbPNR3ybUfvL1p4jS5G3wNPyVKj4DB1BBon4o6HK4+q+79PSyD2Ol
         2F9DgV0wQRUC6jM8P+wY/IQZG4KjwKRYlw/yvfm3tA2dNkljZkesBliEyWM25NowEpJu
         UNAw==
X-Forwarded-Encrypted: i=1; AHgh+RrzeYlFXnmu6C4c3aq9V0sE0LK3x3UJC7I8Rrxh1C5V3qmDO8TKcXf3hx96ho6hKFQoEI32RyZkc4MoMw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+RJlhIh6we3jGdrC2/+zTaL9g3NUc9VltuEFnVJNZsRWhWW4w
	7iW0ECd2RaMMLg7B4QarI/pC8nqKpHZdgSwwprZ9GP2VnabOZJKlKrkW
X-Gm-Gg: AR+sD10z+Rb8k3MZT+AzlKWXt+QxNI/hPDqRsNWw3+lx745lPtkfbLb5ju1Ojhu5rAO
	Sb56IXxeApmo3aDz5MK9u8K0Fj7vtD7FMxz1ulRJBqXIzAGK6dlZDa7+gfduyGVPJZcqwxVozMu
	nmhmWz2w4qcIhgNXCW+hjN/CoeFm99Z28y9JCmMMyjr5cmJuwkgZfIF1fBibcW8NI/5gsGyEXiZ
	dbmJJe32ZlcZ2rBF/4JbK7fMC0Gs/pZ+muw0JvWCr8T1C9Q6u6xffhJr3A+WAqBG/FT95yNPxyQ
	+U0AGT5nvt38UGLt6n6mcutR99B9zOX6QyHGAXmQd+Xf7h+9FUM/GmVCO1NHiufiKvYaSN8njw0
	VS/BiCggLBSFp40kU6NylJp5ooMtRJxypFHEdM/0Diw9w516EBf9D3qElo/C8mHOsri/boKLpMo
	ouzHPgbmnGmwgf1b2jXpfLBBUbW/KY5GN90g==
X-Received: by 2002:a17:902:f681:b0:2ca:3e3f:4956 with SMTP id d9443c01a7336-2cf34a35445mr164591015ad.44.1784574312756;
        Mon, 20 Jul 2026 12:05:12 -0700 (PDT)
Received: from fedora ([2601:644:937c:6c90:6d4e:7b2d:4a39:fb0c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f73esm60735085ad.16.2026.07.20.12.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:05:11 -0700 (PDT)
Date: Mon, 20 Jul 2026 12:05:08 -0700
From: Vishal Moola <vishal.moola@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	linux-s390@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>, sparclinux@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-um@lists.infradead.org, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ning Sun <ning.sun@intel.com>, x86@kernel.org,
	tboot-devel@lists.sourceforge.net, Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	linux-efi@vger.kernel.org, Alistair Popple <apopple@nvidia.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH 14/22] mm: set page table page type when allocated
Message-ID: <al5xZHiFwatn518I@fedora>
References: <20260714-remove_pgtable_cdtor-v1-0-44be8a7685d7@arm.com>
 <20260714-remove_pgtable_cdtor-v1-14-44be8a7685d7@arm.com>
 <alZSwAM4pwmMOeaD@fedora>
 <f3afa5df-73f3-49da-87a6-d75eb5f3610f@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f3afa5df-73f3-49da-87a6-d75eb5f3610f@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_120514_518105_56FF3FD7 
X-CRM114-Status: GOOD (  27.02  )
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

On Thu, Jul 16, 2026 at 11:49:31AM +0200, Kevin Brodsky wrote:
> On 14/07/2026 17:16, Vishal Moola wrote:
> > On Tue, Jul 14, 2026 at 03:04:03PM +0100, Kevin Brodsky wrote:
> >> As a step towards removing pagetable ctor/dtor calls for kernel
> >> mm's, move the page type updates from the ctor/dtor to
> >> pagetable_{alloc,free}.
> > Thanks for doing this patchset.
> 
> Thanks for suggesting it :) It's turning out to be quite a bit more
> involved than I expected though! (There are multiple cases where we call
> the ctor/dtor without using pagetable_{alloc,free}, see my reply to the
> cover letter.)
> 
> > We should switch over from __folio_set_pgtable() to __SetPagePgtable()
> > in this patch. Ptdescs and folios should be treated as distinctly
> > independent of each other.
> 
> I sure remember the previous discussion, but my reading of your comments
> [1] is that we cannot really change this as long as pagetable_alloc()
> can be called with order > 0, right? Multiple archs still rely on that.

Kinda...

The concern was about callers accessing tail pages directly for that
information. Using the folio API ensures that we always look into the
head page.

Since we're now doing it at allocation time, we know we always have the
head page, so it's fine.

The dtor/free should be more questionable because the underlying api
uses virt_to_page() which could look at a tail page... oopsie. I
haven't seen any reports tied to it so its probably fine (the
setting/clearing has been using the folio API since ptdescs).

We can say thats a happy accident that makes distinguishing ptdescs
and folios easier :)

> > Eventually, we want to replace the memcg accounting as well, but
> > there's no existing API for that right now. Lets leave that as is for
> > now; this patchset is big enough already ;)
> 
> Yep, looks like there was an attempt to improve this but it had to be
> reverted [2].
> 
> - Kevin
> 
> [1] https://lore.kernel.org/all/aha321ndGSdReBJR@fedora/
> [2]
> https://lore.kernel.org/all/20260225002434.2953895-1-axelrasmussen@google.com/
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
