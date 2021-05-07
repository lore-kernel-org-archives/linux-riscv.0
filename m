Return-Path: <SRS0=6bm6=KC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BB3C433B4
	for <linux-riscv@archiver.kernel.org>; Fri,  7 May 2021 23:58:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 282B860FEA
	for <linux-riscv@archiver.kernel.org>; Fri,  7 May 2021 23:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 282B860FEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Yt4KWfJLNbZNEJYCD1DnLh05rJRqFsJm9M3DVM4nSDY=; b=pTelBhfpHdiIgNA/mA+Bmv/ip
	Ne5ZEG+sQnKtiVntuekNvq3BHt37SVQObO6XcWUN9F36a0h6J1C+yQ4sh0+EVRMMEYsKT3aOaccfO
	8MjIZI55V2FfFnDiUd0PDkZ1eQPWvr52SgtaNSymGhyHsucqavywRw1zeICODgB16zv6PoPDedjV9
	whZXk5MkisQ1VJd/0H/izzcVTdPZA/ndhSxgYwWHltPZp5Kt6UOm1RntMxzbEkFJMEmJNfgTHx6st
	YydIrsJExuFmOOrN6t5RyROZfkpsJCY+DM/o0NnF3YugM38jR4SMekQlgqwhu96fDruzxM5gNDPiZ
	tSZfinAow==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lfAMA-008KQy-Gq; Fri, 07 May 2021 23:58:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfAM8-008KQR-3G
 for linux-riscv@desiato.infradead.org; Fri, 07 May 2021 23:58:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=2iQQvEB0+fCpb/rAB5HWawShZb8qZlIcaFuxaSL0oes=; b=aVLjTz8JZ6kCexCmLaCnogZSA6
 TEQc5GRhf2Ihg2NCxHvv4EgQLlQ22x5gA/1umB+UDUO5qo8lcNzarX1kUUNkSC9ojp4ifoMYp0/JC
 pLn+PgYy+oFx9mxRQlDjQViKXkuqowRQtwaw6T6gZ2CUTt1oOb4MpXd1Dt5RsmLlHi/zNSQmG7T6h
 fnVTEAQMHGiKCPCBXX/KU6RWzh1JntbP1FBhGpbK/6NcwJbgqT518Onnfk0Qa7REdW3WjsIzvv14q
 FG+XUHkZ/zwoetJELiOQKsAKjW0Zkp37Qb9hbJZ8iI5UW9tEneiJeMOpan7hdme4Gq4ksAAl7ODmM
 2vvbEzxg==;
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfAM5-007GR4-Cn
 for linux-riscv@lists.infradead.org; Fri, 07 May 2021 23:58:02 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 l10-20020a17090a850ab0290155b06f6267so6343397pjn.5
 for <linux-riscv@lists.infradead.org>; Fri, 07 May 2021 16:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2iQQvEB0+fCpb/rAB5HWawShZb8qZlIcaFuxaSL0oes=;
 b=EqhSZy45d2y8OQQwraWGhlD9n54vClwPwSn7UuK9xZviJIBJseEIUX0aF36GebrTNP
 3Y9esEq2VEVMdpYAd+09juu7yIqSSNYhNNt+rVs1po+n6QlJ3kc6cbxhUV5wUfFprLGx
 TjvIY1CeOIbcMr4b7WQIEnR9bfI+n///RODlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2iQQvEB0+fCpb/rAB5HWawShZb8qZlIcaFuxaSL0oes=;
 b=KLA4IH+3CirHHrJIThR5ifpxIbNjs+lEs4PxDeCu7hPMI+fHHnbvqpove8FEAMrMXb
 VpLvQEhKypUvZ4L3qtoCmuLE7YaYpFybKUkncex7GSNOsnjLmkurg1zCDK3hNxMpGuKG
 khaE/cHoC/l/NHfedcFNWLR3kLc6Elh/CN4P1hlLPM6qqnD6DhhkPN+BbOyPCwlW8wvx
 ofdB9rJIkOwo/gJfYVC0R0tPuaXUxYmYbpycJ2d9dLywUjFm1GtpehJgNf+y4bIVrId+
 W3GtR69qpi3cHhe1cCtN25aP9PNGM25mp3qSwnxy7Ebmm+VYZJxWxE89my6NBiiMWInM
 Ltjg==
X-Gm-Message-State: AOAM533uEg7TjqjsDSJqjf5KdwnNxLdR8j5TNUmQVs0SI4Eaj2dwVQus
 48FO+xZ7kvDl5VItM2RQ9OuyBw==
X-Google-Smtp-Source: ABdhPJwW5et97Z//abVIXmo2gBu5V8/Vzg230KpxBawys34RoMW6n/H4x7d7dTWApKrw1+7V8ZstIg==
X-Received: by 2002:a17:902:ff09:b029:ed:3b29:ff43 with SMTP id
 f9-20020a170902ff09b02900ed3b29ff43mr12583115plj.14.1620431878548; 
 Fri, 07 May 2021 16:57:58 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id ha14sm5011198pjb.40.2021.05.07.16.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 16:57:56 -0700 (PDT)
Date: Fri, 7 May 2021 16:57:55 -0700
From: Kees Cook <keescook@chromium.org>
To: James Bottomley <jejb@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>,
 Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roman Gushchin <guro@fb.com>, Shakeel Butt <shakeelb@google.com>,
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Tycho Andersen <tycho@tycho.ws>, Will Deacon <will@kernel.org>,
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v18 0/9] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <202105071620.E834B1FA92@keescook>
References: <20210303162209.8609-1-rppt@kernel.org>
 <20210505120806.abfd4ee657ccabf2f221a0eb@linux-foundation.org>
 <de27bfae0f4fdcbb0bb4ad17ec5aeffcd774c44b.camel@linux.ibm.com>
 <202105060916.ECDEC21@keescook>
 <9e1953a1412fad06a9f7988a280d2d9a74ab0464.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e1953a1412fad06a9f7988a280d2d9a74ab0464.camel@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_165801_488173_7F7BC6D8 
X-CRM114-Status: GOOD (  28.28  )
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

On Thu, May 06, 2021 at 11:47:47AM -0700, James Bottomley wrote:
> On Thu, 2021-05-06 at 10:33 -0700, Kees Cook wrote:
> > On Thu, May 06, 2021 at 08:26:41AM -0700, James Bottomley wrote:
> [...]
> > > > I think that a very complete description of the threats which
> > > > this feature addresses would be helpful.  
> > > 
> > > It's designed to protect against three different threats:
> > > 
> > >    1. Detection of user secret memory mismanagement
> > 
> > I would say "cross-process secret userspace memory exposures" (via a
> > number of common interfaces by blocking it at the GUP level).
> > 
> > >    2. significant protection against privilege escalation
> > 
> > I don't see how this series protects against privilege escalation.
> > (It protects against exfiltration.) Maybe you mean include this in
> > the first bullet point (i.e. "cross-process secret userspace memory
> > exposures, even in the face of privileged processes")?
> 
> It doesn't prevent privilege escalation from happening in the first
> place, but once the escalation has happened it protects against
> exfiltration by the newly minted root attacker.

So, after thinking a bit more about this, I don't think there is
protection here against privileged execution. This feature kind of helps
against cross-process read/write attempts, but it doesn't help with
sufficiently privileged (i.e. ptraced) execution, since we can just ask
the process itself to do the reading:

$ gdb ./memfd_secret
...
ready: 0x7ffff7ffb000
Breakpoint 1, ...
(gdb) compile code unsigned long addr = 0x7ffff7ffb000UL; printf("%016lx\n", *((unsigned long *)addr));
55555555555555555

And since process_vm_readv() requires PTRACE_ATTACH, there's very little
difference in effort between process_vm_readv() and the above.

So, what other paths through GUP exist that aren't covered by
PTRACE_ATTACH? And if none, then should this actually just be done by
setting the process undumpable? (This is already what things like gnupg
do.)

So, the user-space side of this doesn't seem to really help. The kernel
side protection is interesting for kernel read/write flaws, though, in
the sense that the process is likely not being attacked from "current",
so a kernel-side attack would need to either walk the page tables and
create new ones, or spawn a new userspace process to do the ptracing.

So, while I like the idea of this stuff, and I see how it provides
certain coverages, I'm curious to learn more about the threat model to
make sure it's actually providing meaningful hurdles to attacks.

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
