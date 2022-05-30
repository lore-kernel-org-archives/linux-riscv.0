Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625B2C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 30 May 2022 18:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5c63FcTPDguGJ2H844myCGtYOwjPt3y2gra7bkhlyz8=; b=DeiUl4oIkp8csY
	RaQWhFRdiU4bY4iXj5QvsbaockCc+nwik2BxE4HjeftgpynmZ8/Dgv+8QZMxSJYV6UbJ28k33iO5Y
	oO9zPNrGxB/6Fcd8pW1e+Ejl1rY+Wgw1jizbPxNeQlCePCilg4WYOdxyOWBx8CqAX7A0lt7i0FHEo
	AjwvibkPt5PwSA4Ak8/s5sgDpRKXnnVuMlBmYRHCs7lAIH/RFcK60lnbs4lSM6m/asf+U5Vvz9KHx
	Lw6pLy+fI5fOwDXc16B/V7lNKS5ptLg7XQQg1kfHJg0E7nFzIzRW1hxeBrxm5rtjO8YFbIaYvuOK1
	DFLd/GEKitmfYy15Z0uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvk9A-007rHz-Bv; Mon, 30 May 2022 18:29:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvk96-007rFO-FD
	for linux-riscv@lists.infradead.org; Mon, 30 May 2022 18:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653935378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+ALrzFnb0YEuDamJlOSrZjOy/DY+2J0hn9MNRn5A9C4=;
	b=MWCMyyjKq+nRsU1/E2gQwxH46wgLGr/ocdisVFG0vLsWPtOiumnskJ2064A5WnrOgrTAZJ
	2gtTHxcY1TmLno+4FOSlws0frcW0tkSZ2i9Y3zUw043tBhAPIixFMz3pBN4P9KZ/7bnoN7
	MMNOZpVOn2ePwNiCaXI2tfxkHSc9+EI=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-ijJtm6A0P4KnDqXof7VRjA-1; Mon, 30 May 2022 14:29:37 -0400
X-MC-Unique: ijJtm6A0P4KnDqXof7VRjA-1
Received: by mail-il1-f197.google.com with SMTP id r9-20020a92cd89000000b002d16798b3cfso8753437ilb.22
        for <linux-riscv@lists.infradead.org>; Mon, 30 May 2022 11:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+ALrzFnb0YEuDamJlOSrZjOy/DY+2J0hn9MNRn5A9C4=;
        b=cKUHatRgr44zw3XqOBF2syvuVWvQWCi46JgKVbGFjK2AYaPdx7hzIIunH9RWdc7Izw
         8URnwJxn4Uqoylivp3s9soXTirp6kWW4YMEe20WfbAPlhQP4u7uaTri04rkgFYGMSQHc
         sW8Y5BkKVAQE9WQ03TkcY/tWmB+DvbhF1/2zGzIT4vrITUlrWZpdEycuD8SI1AlwXVUW
         BGcDG62pV9sMWeMvNISw8ym2oAm5UlApdERUTqfxuh1cD7Sy/B4Opsd/AtLvMn9cusKd
         i9a003Sw+dlaPN7fZxZSTgltC3hgPP/jeNY+QerQpr+ic262MCwPDcoldvZ3mY4CSaR/
         bdEg==
X-Gm-Message-State: AOAM530TpUw/mVSp8rzn7GEcVwiUiTrZPKMQR+PDsFCgSFF4C/PY5lAv
	CJn4+/AH2vj1L4mVVn7yNOp5gtp394iQUQIfg7iRk4IZAzz2ES6kBoKtcF6ERw0aTQAvyjWdi6U
	WSLybcm44v1N2FQvJ4/R6BBVAQvdk
X-Received: by 2002:a92:d785:0:b0:2d1:7ce6:b834 with SMTP id d5-20020a92d785000000b002d17ce6b834mr25171907iln.207.1653935377088;
        Mon, 30 May 2022 11:29:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3wrc9ZuPCRdn+Dbnr8a7+sDY/SXALiOk3qZ3Cm9Rs8SSVa+bj9UHR0EABkWjwoIvWxsPXBw==
X-Received: by 2002:a92:d785:0:b0:2d1:7ce6:b834 with SMTP id d5-20020a92d785000000b002d17ce6b834mr25171841iln.207.1653935376794;
        Mon, 30 May 2022 11:29:36 -0700 (PDT)
Received: from xz-m1.local (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
        by smtp.gmail.com with ESMTPSA id cn9-20020a0566383a0900b003313b7a5731sm183095jab.178.2022.05.30.11.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 11:29:36 -0700 (PDT)
Date: Mon, 30 May 2022 14:29:31 -0400
From: Peter Xu <peterx@redhat.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Will Deacon <will@kernel.org>, Matt Turner <mattst88@gmail.com>,
	linux-s390@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Brian Cain <bcain@quicinc.com>, Borislav Petkov <bp@alien8.de>,
	linux-alpha@vger.kernel.org, Alistair Popple <apopple@nvidia.com>,
	Jonas Bonn <jonas@southpole.se>,
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	linux-snps-arc@lists.infradead.org,
	Vineet Gupta <vgupta@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Rich Felker <dalias@libc.org>, sparclinux@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	David Hildenbrand <david@redhat.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
	Richard Henderson <rth@twiddle.net>, Guo Ren <guoren@kernel.org>,
	linux-parisc@vger.kernel.org,
	Andrea Arcangeli <aarcange@redhat.com>,
	Helge Deller <deller@gmx.de>, Al Viro <viro@zeniv.linux.org.uk>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-um@lists.infradead.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	openrisc@lists.librecores.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-hexagon@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
	Stafford Horne <shorne@gmail.com>, linux-csky@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, linux-mips@vger.kernel.org,
	Paul Mackerras <paulus@samba.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"David S . Miller" <davem@davemloft.net>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Hugh Dickins <hughd@google.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-riscv@lists.infradead.org, Max Filippov <jcmvbkbc@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
	x86@kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Richard Weinberger <richard@nod.at>, Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v4] mm: Avoid unnecessary page fault retires on shared
 memory types
Message-ID: <YpUNC6iGrZRlWMyA@xz-m1.local>
References: <20220527193936.30678-1-peterx@redhat.com>
 <YpPYkzbrQmy4FjrI@osiris>
 <33fd4731-9765-d78b-bdc3-f8243c98e81f@linux.ibm.com>
 <YpToVpjXmdFqGOpY@xz-m1.local>
 <YpTqNKMTt8PoA41n@xz-m1.local>
 <YpT443jVZtM6p9OD@osiris>
MIME-Version: 1.0
In-Reply-To: <YpT443jVZtM6p9OD@osiris>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_112940_694016_0389941F 
X-CRM114-Status: GOOD (  24.41  )
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

On Mon, May 30, 2022 at 07:03:31PM +0200, Heiko Carstens wrote:
> On Mon, May 30, 2022 at 12:00:52PM -0400, Peter Xu wrote:
> > On Mon, May 30, 2022 at 11:52:54AM -0400, Peter Xu wrote:
> > > On Mon, May 30, 2022 at 11:35:10AM +0200, Christian Borntraeger wrote:
> > > > > diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
> > > > > index 4608cc962ecf..e1d40ca341b7 100644
> > > > > --- a/arch/s390/mm/fault.c
> > > > > +++ b/arch/s390/mm/fault.c
> > > > > @@ -436,12 +436,11 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
> > > > >   	/* The fault is fully completed (including releasing mmap lock) */
> > > > >   	if (fault & VM_FAULT_COMPLETED) {
> > > > > -		/*
> > > > > -		 * Gmap will need the mmap lock again, so retake it.  TODO:
> > > > > -		 * only conditionally take the lock when CONFIG_PGSTE set.
> > > > > -		 */
> > > > > -		mmap_read_lock(mm);
> > > > > -		goto out_gmap;
> > > > > +		if (gmap) {
> > > > > +			mmap_read_lock(mm);
> > > > > +			goto out_gmap;
> > > > > +		}
> 			fault = 0;  <----
> > > > > +		goto out;
> > 
> > Hmm, right after I replied I found "goto out" could be problematic, since
> > all s390 callers of do_exception() will assume it an error condition (side
> > note: "goto out_gmap" contains one step to clear "fault" to 0).  I'll
> > replace this with "return 0" instead if it looks good to both of you.
> > 
> > I'll wait for a confirmation before reposting.  Thanks,
> 
> Right, that was stupid. Thanks for double checking!
> 
> However could you please add "fault = 0" just in front of the goto out
> like above? I'd like to avoid having returns and gotos mixed.

Sure thing.

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
