Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2840C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 30 May 2022 15:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FLSRw1Jy++u138uHmR+3/vsNjIJLD69ZFMJsI3B6u+8=; b=YblrE10HFRvBhU
	8TZaFFOq3SGIioV0VAIzeuVV1E40a1IDloa+T5lT+HZw1wrV3rViN9OHgooRhLMeJqgRejoRWPhgU
	GutQAurfpSXmNhD6ynMJ/dU/pDIhrgQINScS0A2DZslsX0shEt2ZZnzN+UnUzZSkLCGkej1M1IXqV
	RQ8zjMDdmCYkmilMSfv0miLfhXeQrDCLldVQgYLLl9S00d/muWkj9QKxg9DRXeKtT6kHAeQvdxy7P
	oTswHaDQDHKDgmoBNA2z3Kb7KIZBav0Sm8a1pSxSWFzPatstfM+/WQxPDRhy2jJ30/d9dUIVqneTE
	Cfedp/kt79o0GF4MPdKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvhhe-007Z7m-5V; Mon, 30 May 2022 15:53:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvhhZ-007Z2r-BO
	for linux-riscv@lists.infradead.org; Mon, 30 May 2022 15:53:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653925984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bDYue/Afd3VGZHzU7tYF7qy5xBeBUpqe85rLuoAiRcE=;
	b=YgN3kgKJ0UzknAvHl1zBxccmG3i56sV4QgvUX4eJf0Ld94UI/B3rzQ+H9H9r71ucRytUDE
	7td1PYJ+GkbJCAOJz8RObrIYqARuP487sIlHwkitK2SZiJRk2NlllsX+0KBKmdVkbl9XRx
	SSAPhGUN1SgEKW0W6OTaMjFD1JgioAg=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-ySAo21r4NCO45E4MPq8UVA-1; Mon, 30 May 2022 11:53:01 -0400
X-MC-Unique: ySAo21r4NCO45E4MPq8UVA-1
Received: by mail-io1-f69.google.com with SMTP id l67-20020a6b3e46000000b00660b8c61a31so5682839ioa.0
        for <linux-riscv@lists.infradead.org>; Mon, 30 May 2022 08:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bDYue/Afd3VGZHzU7tYF7qy5xBeBUpqe85rLuoAiRcE=;
        b=UCnq0Uc51eCYOPoIW1QhnsaR/eGRhxU/dWiO4aM4NExT60bhFmgmx3B999FMt9aMJN
         uYXmb04uD2GVLUpTaviUX4VWD2gHU8ddxlC7KwBb1uhn3EqYheUXnBU7Hm5ZQp/Afmnf
         EJ3MfKOzKgn9QaKyiY0tNPfpj8Cs3Mr4aYGmvAZZP8o5UowOG6eNOs/JtPbhywA7wYE+
         upWKbwH0ffwkRCoQxi+u3pJVbgSoQgbnFqFx101dwMs4kYor6iAnpxzVCiRLHG8GtYyC
         HLfwRU7GJN7aKRXbwEm+KM5PZ+86cswl2VMBDJoJepiTkjk4rDRZzRlSyEXCwrn6HB8t
         fzMg==
X-Gm-Message-State: AOAM531dmLk0acV1h5k304vniEgX7l1MEkXz4WKgfQTIDR3IGnRrQ2s0
	W5hBRTDVdpebmYUWRH1G1N4UEMAzSFb8OekW+4zBvt6cO/qJFyyxhWJLt2JtdAFSjDYqT1UJf19
	EWAQzp0pVPepdLeWJiC7yv/rk7ait
X-Received: by 2002:a5d:9cc8:0:b0:663:2899:4b8 with SMTP id w8-20020a5d9cc8000000b00663289904b8mr16857397iow.192.1653925980597;
        Mon, 30 May 2022 08:53:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKQIoyyqGc41UCjMUnObS0GZ5Lh8IPSVLY8KDGIOa5YRMfMwdzANPXLWIG/1E7oUnwvcvO1w==
X-Received: by 2002:a5d:9cc8:0:b0:663:2899:4b8 with SMTP id w8-20020a5d9cc8000000b00663289904b8mr16857337iow.192.1653925980357;
        Mon, 30 May 2022 08:53:00 -0700 (PDT)
Received: from xz-m1.local (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
        by smtp.gmail.com with ESMTPSA id 66-20020a021d45000000b0032e75bfe344sm2781109jaj.171.2022.05.30.08.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 08:52:59 -0700 (PDT)
Date: Mon, 30 May 2022 11:52:54 -0400
From: Peter Xu <peterx@redhat.com>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Will Deacon <will@kernel.org>,
	Matt Turner <mattst88@gmail.com>, linux-s390@vger.kernel.org,
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
Message-ID: <YpToVpjXmdFqGOpY@xz-m1.local>
References: <20220527193936.30678-1-peterx@redhat.com>
 <YpPYkzbrQmy4FjrI@osiris>
 <33fd4731-9765-d78b-bdc3-f8243c98e81f@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <33fd4731-9765-d78b-bdc3-f8243c98e81f@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_085305_812881_F9BE956B 
X-CRM114-Status: GOOD (  20.65  )
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

On Mon, May 30, 2022 at 11:35:10AM +0200, Christian Borntraeger wrote:
> 
> 
> Am 29.05.22 um 22:33 schrieb Heiko Carstens:
> [...]
> > 
> > Guess the patch below on top of your patch is what we want.
> > Just for clarification: if gmap is not NULL then the process is a kvm
> > process. So, depending on the workload, this optimization makes sense.
> > 
> > diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
> > index 4608cc962ecf..e1d40ca341b7 100644
> > --- a/arch/s390/mm/fault.c
> > +++ b/arch/s390/mm/fault.c
> > @@ -436,12 +436,11 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
> >   	/* The fault is fully completed (including releasing mmap lock) */
> >   	if (fault & VM_FAULT_COMPLETED) {
> > -		/*
> > -		 * Gmap will need the mmap lock again, so retake it.  TODO:
> > -		 * only conditionally take the lock when CONFIG_PGSTE set.
> > -		 */
> > -		mmap_read_lock(mm);
> > -		goto out_gmap;
> > +		if (gmap) {
> > +			mmap_read_lock(mm);
> > +			goto out_gmap;
> > +		}
> > +		goto out;
> 
> Yes, that makes sense. With that
> 
> Acked-by: Christian Borntraeger <borntraeger@linux.ibm.com>

Looks sane, thanks Heiko, Christian.  I'll cook another one.

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
