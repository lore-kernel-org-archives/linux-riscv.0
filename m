Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080A5C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 May 2022 14:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YvfR5F5cLxZd5Qt4iSUmYDQMvGOwXwqZnzfiC4HpiPo=; b=GtBt04plIWzkF/
	7N6T+qTMon7wPtWMuzS2zgSoJVLyvejkMJlJoytbqhrrsZ1Pt6oy0K7Y8mDSUVoPDS9AG2OZymRCT
	Y2TRnCe4Us7juf0kxkIkD+yHfn/cXc6RvBiHhUhPS+dgA2O1TqiWPcATfWjJp8XDgB0u/xraxMze1
	HwxG5WDoj35WD1D7zy/8AqIj7A1Tx/FW0JHVA0AQ6oAgZmYJ1RJd3e81i1R2zvDyiLQYjXmu23diE
	GXuy8/VJ1NCZV4Oay5MH4nbMg/dSzlrK+2i5cTp8zUFo3YUwZg/0f/Rma66FTPqs8FMbMKSpel1Ea
	kY5zFp6E2AfojJt0UlYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nubLd-000Nig-3z; Fri, 27 May 2022 14:53:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nubLY-000NgF-7K
	for linux-riscv@lists.infradead.org; Fri, 27 May 2022 14:53:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653663227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uLEQbfXieXddbws3ZtMPUo3kSGjUH1tIUFKal4fFd0k=;
	b=SeNX6b8k+F4q0ZPmb2CiC64bjwrSr3DJ1LFhsKBfuMXTSGiQ4r7tQMs8TASxPx56UR68yI
	YA5VBrakf6uaWdsGIR9UIvH6h2PBUu/ltDSBMTs93Roo2XnqoaYNIlFaC6SyVXDM6lUp3I
	bAxjFdzi6erzWuPNyBxXgDstwwDdTKQ=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-9i8ZP9Y7MaG8OLMp95P3lw-1; Fri, 27 May 2022 10:53:44 -0400
X-MC-Unique: 9i8ZP9Y7MaG8OLMp95P3lw-1
Received: by mail-io1-f71.google.com with SMTP id l9-20020a5e8809000000b0065e534ca51dso2893780ioj.17
        for <linux-riscv@lists.infradead.org>; Fri, 27 May 2022 07:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uLEQbfXieXddbws3ZtMPUo3kSGjUH1tIUFKal4fFd0k=;
        b=4m+c5NmTCSuan5QFbCbti/E1z5c8piOy8k8D/yKSldEFnoWSmnXnQ6utmgJP4RAAnw
         dPVysnViHbf1hJYar+KIzNQb0TIaf/D1h6GjaskK2KqniGN5BYj6ygWLzb+kEvXvLDrv
         JuoIbZaugsUcq5ebytqsLVYUQwqI3xuFPROhUDkWpb64fS28nB7z36MfPhodYjX1/a+M
         KIcEHSnlFlgcOVsCRu0u9B/bs/PC1VQ3PrN4cQSUCuUtUmK0Jvy0IJEQJhhMNCdvQeyc
         uXbeNz5OltSlCYCy4OgVUF4eZt8VNQP8hUfmZb99dsa4W4VSyaAS+mLCdNqudwQ8Wudc
         7BZQ==
X-Gm-Message-State: AOAM530HLHJEOkKPrwP9pmU+bg1Vxf9juCJTlwexJEZQpJIeSMx8Rsoz
	BWTTWTpQtqsr0PvdxIGJIdHhg5PqqZpKS0uwPzYqf7+eud/HbUKXoD/jx7lv+SIJ7hYrNc1PqTl
	uCYH/e1Ieq3iRnO/q6EjAS6AmSe4P
X-Received: by 2002:a05:6e02:1a61:b0:2cf:8a90:7396 with SMTP id w1-20020a056e021a6100b002cf8a907396mr22761898ilv.256.1653663223381;
        Fri, 27 May 2022 07:53:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxG97+4KBIU6l93iytV0+qRm43dQQLHa2a/K8HbhfEtxo7G4J9rDpss95rHRYaCYZkQNmDyjQ==
X-Received: by 2002:a05:6e02:1a61:b0:2cf:8a90:7396 with SMTP id w1-20020a056e021a6100b002cf8a907396mr22761868ilv.256.1653663222806;
        Fri, 27 May 2022 07:53:42 -0700 (PDT)
Received: from xz-m1.local (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
        by smtp.gmail.com with ESMTPSA id d6-20020a023f06000000b00330efaf1161sm596380jaa.148.2022.05.27.07.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 07:53:42 -0700 (PDT)
Date: Fri, 27 May 2022 10:53:36 -0400
From: Peter Xu <peterx@redhat.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Richard Henderson <rth@twiddle.net>,
	David Hildenbrand <david@redhat.com>,
	Matt Turner <mattst88@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Michal Simek <monstr@monstr.eu>,
	Russell King <linux@armlinux.org.uk>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	linux-riscv@lists.infradead.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jonas Bonn <jonas@southpole.se>, Will Deacon <will@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	openrisc@lists.librecores.org, linux-s390@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>, linux-m68k@lists.linux-m68k.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>, Chris Zankel <chris@zankel.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Alistair Popple <apopple@nvidia.com>, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
	Thomas Gleixner <tglx@linutronix.de>, sparclinux@vger.kernel.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Stafford Horne <shorne@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Mackerras <paulus@samba.org>,
	linux-arm-kernel@lists.infradead.org,
	Sven Schnelle <svens@linux.ibm.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-xtensa@linux-xtensa.org, Nicholas Piggin <npiggin@gmail.com>,
	linux-sh@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
	Borislav Petkov <bp@alien8.de>, linux-mips@vger.kernel.org,
	Max Filippov <jcmvbkbc@gmail.com>, Helge Deller <deller@gmx.de>,
	Vineet Gupta <vgupta@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-um@lists.infradead.org, linux-alpha@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-ia64@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dinh Nguyen <dinguyen@kernel.org>, Guo Ren <guoren@kernel.org>,
	linux-snps-arc@lists.infradead.org, Hugh Dickins <hughd@google.com>,
	Rich Felker <dalias@libc.org>, Andy Lutomirski <luto@kernel.org>,
	Richard Weinberger <richard@nod.at>, linuxppc-dev@lists.ozlabs.org,
	Brian Cain <bcain@quicinc.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	linux-parisc@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH v3] mm: Avoid unnecessary page fault retires on shared
 memory types
Message-ID: <YpDl8IM0FF6GeJ4B@xz-m1.local>
References: <20220524234531.1949-1-peterx@redhat.com>
 <YpCsBwFArieTpvg2@gmail.com>
MIME-Version: 1.0
In-Reply-To: <YpCsBwFArieTpvg2@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_075348_370450_B736A63E 
X-CRM114-Status: GOOD (  26.77  )
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

On Fri, May 27, 2022 at 12:46:31PM +0200, Ingo Molnar wrote:
> 
> * Peter Xu <peterx@redhat.com> wrote:
> 
> > This patch provides a ~12% perf boost on my aarch64 test VM with a simple
> > program sequentially dirtying 400MB shmem file being mmap()ed and these are
> > the time it needs:
> >
> >   Before: 650.980 ms (+-1.94%)
> >   After:  569.396 ms (+-1.38%)
> 
> Nice!
> 
> >  arch/x86/mm/fault.c           |  4 ++++
> 
> Reviewed-by: Ingo Molnar <mingo@kernel.org>
> 
> Minor comment typo:
> 
> > +		/*
> > +		 * We should do the same as VM_FAULT_RETRY, but let's not
> > +		 * return -EBUSY since that's not reflecting the reality on
> > +		 * what has happened - we've just fully completed a page
> > +		 * fault, with the mmap lock released.  Use -EAGAIN to show
> > +		 * that we want to take the mmap lock _again_.
> > +		 */
> 
> s/reflecting the reality on what has happened
>  /reflecting the reality of what has happened

Will fix.

> 
> >  	ret = handle_mm_fault(vma, address, fault_flags, NULL);
> > +
> > +	if (ret & VM_FAULT_COMPLETED) {
> > +		/*
> > +		 * NOTE: it's a pity that we need to retake the lock here
> > +		 * to pair with the unlock() in the callers. Ideally we
> > +		 * could tell the callers so they do not need to unlock.
> > +		 */
> > +		mmap_read_lock(mm);
> > +		*unlocked = true;
> > +		return 0;
> 
> Indeed that's a pity - I guess more performance could be gained here, 
> especially in highly parallel threaded workloads?

Yes I think so.

The patch avoids the page fault retry, including the mmap lock/unlock side.
Now if we retake the lock for fixup_user_fault() we still safe time for
pgtable walks but the lock overhead will be somehow kept, just with smaller
critical sections.

Some fixup_user_fault() callers won't be affected as long as unlocked==NULL
is passed - e.g. the futex code path (fault_in_user_writeable).  After all
they never needed to retake the lock before/after this patch.

It's about the other callers, and they may need some more touch-ups case by
case.  Examples are follow_fault_pfn() in vfio and hva_to_pfn_remapped() in
KVM: both of them returns -EAGAIN when *unlocked==true.  We need to teach
them to know "*unlocked==true" does not necessarily mean a retry attempt.

I think I can look into them if this patch can be accepted as a follow up.

Thanks for taking a look!

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
