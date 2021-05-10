Return-Path: <SRS0=SpZ8=KF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4563FC433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 18:07:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA7BA611C2
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 18:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA7BA611C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lSwHjPL/TC6kHDzQZ8THn1KOBi7HRg3C5nkmUwIBQ84=; b=pwhMz2ZNTmXjJp0MaZUYSkIjl
	gr3nY0yP0IlhhsUZQeom7dKW/62g9KkG0QBYoQU8ah9ZQuNIh1oY+BvsP0TilTAr/6WVO//+0NH4f
	D4kWXElgcQ+PL8OadGXdjTh+XH4HQN42ShlNfOWJ9IMiV5FGREDvyEgjHAIDFWSNtTj5xxeBE0tJw
	5NOrJeZPyIDmVfhGsm1CwutClG6CpwHlGqgUpWcTFtTk/J2oltshJZcPiOZrtfBucSiOj9fLh88Qn
	fYphAYVnoBSYiI1rrHe3GaebMfRLxAIkkVYVXEJgjaFKM8EwaaOqFRzPkgFnVI8U5TdWNPYLjW+Pb
	c/fLBA1AQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgAJp-00FNC7-1d; Mon, 10 May 2021 18:07:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgAEv-00FLQZ-Lp; Mon, 10 May 2021 18:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xhav0xQf8agzp74kTM0eUH6phHhw97YHXoKC+IoUVmk=; b=WDtsewvoLm5KP1TLYIuMB+4/Hc
 HBm59VDzgk7YdJlKJQQaPDYNrrjSMIZCeMTQxJ4i/2iFXf7yRrtpyLU1qFeAZ0e8dz+fG2qB7aoGW
 68nFwbzSrSVxjSOUZuTu/dDcDHWvcrPIzMNAr8suRm6lYt+fJSmTvqqAViqeoN0hZu8/s+TkF4GMf
 RXKzWERDniVLb1Jw17HejfipjfNzeVYdeFJ8ir9/0QiMqzzvWU7YefQ9IJedUJcexgs4zClK67q/6
 y19+A6Iah9UZFfY+L2Y7tZpG4RLkHxvTrj4gxU2TVUTskJTPspNCIOwZvZjAi6kYFzEY5hciKQisg
 RK5Gbo1A==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgAEp-009179-WF; Mon, 10 May 2021 18:02:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94CA1614A5;
 Mon, 10 May 2021 18:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620669758;
 bh=n42L871tHZ441F87A/b+CutETfOOFwkObERFP9A3pdA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jAVU4p1uzu94ulPZBeoZfk4s2+0oKep8O35dEH9B3XGOnfBOez0cqT9O/YPNWcq7K
 T7jehq1COHzvQk562M5QFEuz58iBsW6GnwPXjhA/cVyTt1N3jxE15rCZgZHKILMpn/
 j2uFJ1Qhe2ksUV0APrDOdlb2LHSBV6/yEmdkTakyE7eMIf2Gd3PEcDYmfuilpYxdEE
 J2LthyZVJKGF4qAs0eL5J6Nek5zNOrWq6FoOABkHN+M7vDleC7VZQX3j2kIx/+Qboo
 1/WODQxulH/sCuGBwe0ku+eYg7lCepVzxRaMSgvNWQxZ05b1ox+NqaPNhK7RwoJCp7
 a38PA1z3yoBmQ==
Date: Mon, 10 May 2021 21:02:21 +0300
From: Mike Rapoport <rppt@kernel.org>
To: James Bottomley <jejb@linux.ibm.com>
Cc: Kees Cook <keescook@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
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
Message-ID: <YJl1LQvQuxxfGRnJ@kernel.org>
References: <20210303162209.8609-1-rppt@kernel.org>
 <20210505120806.abfd4ee657ccabf2f221a0eb@linux-foundation.org>
 <de27bfae0f4fdcbb0bb4ad17ec5aeffcd774c44b.camel@linux.ibm.com>
 <202105060916.ECDEC21@keescook>
 <9e1953a1412fad06a9f7988a280d2d9a74ab0464.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e1953a1412fad06a9f7988a280d2d9a74ab0464.camel@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_110240_081334_42DCC49C 
X-CRM114-Status: GOOD (  16.18  )
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
> 
> > What's happening with O_CLOEXEC in this code? I don't see that
> > mentioned in the cover letter either. Why is it disallowed? That
> > seems a strange limitation for something trying to avoid leaking
> > secrets into other processes.
> 
> I actually thought we forced it, so I'll let Mike address this.  I
> think allowing it is great, so the secret memory isn't inherited by
> children, but I can see use cases where a process would want its child
> to inherit the secrets.

We do not enforce O_CLOEXEC, but if the user explicitly requested O_CLOEXEC
it would be passed to get_unused_fd_flags().

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
