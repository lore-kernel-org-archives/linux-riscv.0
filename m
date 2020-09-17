Return-Path: <SRS0=KFrn=C2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F62C43461
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 05:46:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B283E206C9
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 05:46:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2ysmQWcn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbKl9UWP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B283E206C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wa7Mubmhzt+odseTS2Z1+5qjYcrkwmN/KMmwBRYHf1E=; b=2ysmQWcnHoO863PfDPj4C338v
	02NQk1lgH4cISFzfCayDz8RoecVgsYMCXRqlPk9nztSeheSMgtIvTr1tPprmh1pKnXEXBJLPBU860
	11jFVxRTk8k+Os0rWGxWC7bfpaH4VzGb1WwsEbvHu4jDD96y0Kbg++sXDol1ecj8j1YMdG064pOv1
	G7sEA9ne9RKAeiIsb+ex4e67S7blO5iQa2RGfvKphu4Vl63ItwlceIFKRfoWBMG79gZGiPXuTIoZB
	CYMb9bz9ZdwpZ7dPEsLEC65YC358CyMi5UdYGUAx5MEraKcQ/mhVI81BiAnWG/iK5hFSA9T2LAvpY
	Mgdij5Unw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kImkb-0000ij-5Z; Thu, 17 Sep 2020 05:46:33 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kImkV-0000gN-Sh; Thu, 17 Sep 2020 05:46:28 +0000
Received: by mail-oi1-x244.google.com with SMTP id u126so1096913oif.13;
 Wed, 16 Sep 2020 22:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=03zgBdOmJo+1h1F3YVTbbY3y6xnSeDHzXEapmphTwIw=;
 b=bbKl9UWPeRhmTphLackrhk80UEzUzcPTNe72QmMk7/fs5a/LxCxtV+mb6MSWQFVDmC
 F22yt5hvhiNFb2j/gFnw8yxBQviOrz2mlbiqk83dwMA7AkjqITFQd1eVdq1X39tqelCL
 VQYLiT8PHgFrLapRSXmMmT+MgfubVdogkhnR8iaU9CBQieW2dO0skkpZLwguhZi/JnBV
 GroqbGpDUZEjnODXLPHpOPwc0N7/cjNeafIH1QgpKVpeU6uH1eY/RuZkMDyTnjr9U7fb
 tviHseO3/70GTW4fSLc2vk/vqzCFhAHroNAVb0ANnf+lzN+TxeDA/upoZku1GEWDb8D1
 7Ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=03zgBdOmJo+1h1F3YVTbbY3y6xnSeDHzXEapmphTwIw=;
 b=UBxB+Ade4lVbb/rhM6KVkbZvXJI6FXI6pYPmFGdP36SxrGs/Ey3gBJeNiAFi4vCbgr
 mwsa0C9P59WiVYKnyhm/IL5575zQHxak0Xk3vUNFV367UgNtEbnk/ig9fexlVqk5/ZJS
 hFIoqxyFC+G3v8oDAwBVgpuFEa01lmbKN8eYW8y0rhK6E8GvoZTYnDmy79/8vmfbj6H+
 gL+MWYgFD83Lt3fDzJZvQxHX2QyWjT/gFmEOdlIPNCimaG0UdXY1qjj5PfuBNpZYWot5
 cYydqL6YzFqWjRg9jkpqx+WSX+H7xAcF5Amgqjhrs4L/0f9IndZiIoaL80cPP3jIZiYn
 iJng==
X-Gm-Message-State: AOAM532S56wH74tomTuT4sg/4VzaOWagy14GNKNJJeYBNUodRI9lj+Dw
 +EuzRbls+5oU6EGY6XR3U9xmzPc1GuLRHXo9mc8=
X-Google-Smtp-Source: ABdhPJzQezUvckVK0wvtjtSXJuH78/qLicEZ94e9jzpjFRfX1+eKqEzksVrp0ORp5rdZVfo95r94sEe5o2dL6iEln5E=
X-Received: by 2002:a54:458f:: with SMTP id z15mr3791761oib.148.1600321584018; 
 Wed, 16 Sep 2020 22:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200916073539.3552-1-rppt@kernel.org>
 <20200916162020.0d68c2bd6711024cfcaa8bd7@linux-foundation.org>
In-Reply-To: <20200916162020.0d68c2bd6711024cfcaa8bd7@linux-foundation.org>
From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Date: Thu, 17 Sep 2020 07:46:12 +0200
Message-ID: <CAKgNAkiSRDoZWKkBLB03X_knOeoeKVTy2oLmMopZ5vK8UZSAPg@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] mm: introduce memfd_secret system call to create
 "secret" memory areas
To: Andrew Morton <akpm@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_014627_935824_8D884539 
X-CRM114-Status: GOOD (  17.76  )
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
Reply-To: mtk.manpages@gmail.com
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Linux-MM <linux-mm@kvack.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>,
 linux-arch <linux-arch@vger.kernel.org>, Tycho Andersen <tycho@tycho.ws>,
 linux-nvdimm@lists.01.org, Will Deacon <will@kernel.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Linux API <linux-api@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 17 Sep 2020 at 01:20, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Wed, 16 Sep 2020 10:35:34 +0300 Mike Rapoport <rppt@kernel.org> wrote:
>
> > This is an implementation of "secret" mappings backed by a file descriptor.
> > I've dropped the boot time reservation patch for now as it is not strictly
> > required for the basic usage and can be easily added later either with or
> > without CMA.
>
> It seems early days for this, especially as regards reviewer buyin.
> But I'll toss it in there to get it some additional testing.
>
> A test suite in tools/testging/selftests/ would be helpful, especially
> for arch maintainers.
>
> I assume that user-facing manpage alterations are planned?

I was just about to write a mail into this thread when I saw this :-).

So far, I don't think I saw a manual page patch. Mike, how about it?

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
