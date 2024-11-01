Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2EFE6F06A
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 15:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1eXnkYt1MgVbjBEwIMSlAhm4FwlwW+jRMNbUb+PS5Q=; b=4Zu4ClMsYhF9yn
	A25h7Y+1y/VIBZUsRhYmBR2MhDT7PG8gzalr5M9vrYs+hChsCuLSYq3PGbrJaJ0PqEnvSmlB97/ro
	8ZNmEQJGTM3b65t5E9470o08quVFt5Mqh88ostiZgVsnjOUOJGgWauEn1k4LeJoLWInwYLYP8E5CE
	Ezc/DjQfqDN/jf6Q2Eb2cMzP29GPfNlQEZrYUvQ9F0qzv1WLYK49NX4I+1NGlW131ntTy6PoZIcun
	21vZp9Svj006RRFn/FM/xkuwxqa7AOY8NL7niUaKYJ7Cd/S97fhSyOpPLzB48LfPm1rdAwIMCQrUS
	HlZoV3S8w6mxV2gYBjxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tPl-00000007TtB-2IQh;
	Fri, 01 Nov 2024 15:18:18 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tPj-00000007TrU-18ng
	for linux-riscv@lists.infradead.org;
	Fri, 01 Nov 2024 15:18:16 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e7fb84f999so34749577b3.2
        for <linux-riscv@lists.infradead.org>; Fri, 01 Nov 2024 08:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730474293; x=1731079093; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=By0MMba+WbzG2cXuHlWeMQpST2oOpWmZSXA68XVHYo0=;
        b=Dw8c23o9cZAv+JoUjw+QPEQmxnFFIuHIohH1FtGIujhr/p5d4i+Fq7jAHNFcdG2ODv
         NtcgShOGDj5MNzb6EiiNMfJrW1VfA4V7YEQZLKjEGsypsbj4vijCxXkdNC9YsgstAC18
         gdEA8wE8Pt28Y2E+fMKHWPtkYYWQu8kzLO6Kq9FZPNjU4d5VJJsIkh4Ggy7tdwxLBuzy
         z4JUaDTQlabgoqH+r8Qq/7YtSmR/hC8POiIEt0b3oRPkBqTT6/SEjRTNQ8jlrL0evGQX
         Al/Oi/xywFK3Lg0MkgyCPWK2LuStdT+NZN6NUQVvd/dMF+B5o8Hc+HrMGE79q4reltWu
         P4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730474293; x=1731079093;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=By0MMba+WbzG2cXuHlWeMQpST2oOpWmZSXA68XVHYo0=;
        b=fkNUAfPmPLJcTTzpgMebkX9wF6xYg/lsnUEE08F4syFcAzk5LcrJaMrLAeQ1BWYA+g
         FF8SdTZxu837zA3hauFhWqPpf87Y0tx9PBH6v4L3mFnrCoIlf7zoAoBSIwtVNsha82NR
         wWRIqaAFP5xPwF3jK6FwyAB40Oh5XvpM7jtPNhYM11dIAQlUsjC57F15Ey307z0WJaRw
         vCTZ1x863w4Wepm7MyAeBB9DceMrfkX3MGAjqdPs8eADRt9PjLCOpEL9wUeTGVMPCza7
         FMUzqZ2qrD4pvA8xWvI2u1uRjV/SIf61ZCvsVx8OXv+QnOwkophmacAiQ7bhgIhQUn2S
         kvzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQx0dGa4cqiRZq7C1pb6cuulSm9ZE7+fSVuLnGppL6611J7L6v8B0BY0vLpabQNvIPQCD9aLm3Q/oEIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVyJKzaU4ZhlZFs1wqxtfVTODFaxIm0Zp3c30HbjSOiIUc0l0h
	SdIn+kBLvPiGGi9W0tCjSBh+1sISXk00moIilJLbiBsaW5+Z3hoVp5++HYGtYir337bSiFeXQp7
	BXw==
X-Google-Smtp-Source: AGHT+IFdnwVveoc9N/MGUlZwVqfEB7IUicwB9rrAOOy2FhtDeXiq05HGyssNX0DfJOP/ZgHAaQZXrEGcvIk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:6c8c:b0:6e3:1702:b3e6 with SMTP id
 00721157ae682-6ea64b8c450mr251257b3.4.1730474293279; Fri, 01 Nov 2024
 08:18:13 -0700 (PDT)
Date: Fri, 1 Nov 2024 08:18:11 -0700
In-Reply-To: <2233397c-f423-40e3-8546-728b50ce0489@amazon.com>
Mime-Version: 1.0
References: <27646c08-f724-49f7-9f45-d03bad500219@amazon.co.uk> <2233397c-f423-40e3-8546-728b50ce0489@amazon.com>
Message-ID: <ZyTxM7Po4v7VkmHO@google.com>
Subject: Re: [RFC PATCH v3 0/6] Direct Map Removal for guest_memfd
From: Sean Christopherson <seanjc@google.com>
To: Derek Manwaring <derekmn@amazon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_081815_334338_3B87C731 
X-CRM114-Status: GOOD (  26.15  )
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
Cc: jthoughton@google.com, luto@kernel.org, kvm@vger.kernel.org, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, kalyazin@amazon.com, svens@linux.ibm.com, linux-mm@kvack.org, pbonzini@redhat.com, linux-kselftest@vger.kernel.org, hpa@zytor.com, kernel@xen0n.name, shuah@kernel.org, agordeev@linux.ibm.com, linux-s390@vger.kernel.org, David Kaplan <david.kaplan@amd.com>, corbet@lwn.net, will@kernel.org, chenhuacai@kernel.org, linux-riscv@lists.infradead.org, mingo@redhat.com, tabba@google.com, mathieu.desnoyers@efficios.com, gerald.schaefer@linux.ibm.com, borntraeger@linux.ibm.com, roypat@amazon.co.uk, linux-trace-kernel@vger.kernel.org, jgowans@amazon.com, aou@eecs.berkeley.edu, gor@linux.ibm.com, hca@linux.ibm.com, rostedt@goodmis.org, ackerleytng@google.com, xmarcalx@amazon.com, bp@alien8.de, loongarch@lists.linux.dev, paul.walmsley@sifive.com, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, mhiramat@kernel.org, graf@amazon.com, vannapurve@google.com, rppt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

+David Kaplan

On Thu, Oct 31, 2024, Derek Manwaring wrote:
> On 2024-10-31 at 10:42+0000 Patrick Roy wrote:
> > On Thu, 2024-10-31 at 09:50 +0000, David Hildenbrand wrote:
> > > On 30.10.24 14:49, Patrick Roy wrote:
> > >> Most significantly, I've reduced the patch series to focus only on
> > >> direct map removal for guest_memfd for now, leaving the whole "how to do
> > >> non-CoCo VMs in guest_memfd" for later. If this separation is
> > >> acceptable, then I think I can drop the RFC tag in the next revision
> > >> (I've mainly kept it here because I'm not entirely sure what to do with
> > >> patches 3 and 4).
> > >
> > > Hi,
> > >
> > > keeping upcoming "shared and private memory in guest_memfd" in mind, I
> > > assume the focus would be to only remove the direct map for private memory?
> > >
> > > So in the current upstream state, you would only be removing the direct
> > > map for private memory, currently translating to "encrypted"/"protected"
> > > memory that is inaccessible either way already.
> > >
> > > Correct?
> >
> > Yea, with the upcomming "shared and private" stuff, I would expect the
> > the shared<->private conversions would call the routines from patch 3 to
> > restore direct map entries on private->shared, and zap them on
> > shared->private.
> >
> > But as you said, the current upstream state has no notion of "shared"
> > memory in guest_memfd, so everything is private and thus everything is
> > direct map removed (although it is indeed already inaccessible anyway
> > for TDX and friends. That's what makes this patch series a bit awkward
> > :( )
> 
> TDX and SEV encryption happens between the core and main memory, so
> cached guest data we're most concerned about for transient execution
> attacks isn't necessarily inaccessible.
> 
> I'd be interested what Intel, AMD, and other folks think on this, but I
> think direct map removal is worthwhile for CoCo cases as well.

Removal of the direct map entries for guest private PFNs likely won't affect the
ability of an attacker to glean information from the unencrypted data that's in
the CPU caches, at least not on x86.  Both TDX and SEV steal physical address
bit(s) for tagging encrypted memory, and unless things have changed on recent
AMD microarchitectures (I'm 99.9% certain Intel CPUs haven't changed), those stolen
address bits are propagated into the caches.  I.e. the encrypted and unencrypted
forms of a given PFN are actually two different physical addresses under the hood.

I don't actually know how SEV uses the stolen PA bits though.  I don't see how it
simply be the ASID, because IIUC, AMD CPUs allow for more unique SEV-capable ASIDs
than uniquely addressable PAs by the number of stolen bits.  But I would be very
surprised if the tag for the cache isn't guaranteed to be unique per encryption key.

David?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
