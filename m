Return-Path: <SRS0=PCma=HN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2757C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 08:40:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A74F464E01
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 08:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A74F464E01
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Jk5rN9QIL5x+JDxDPSTN0ABymKPritoP5cSXnYFCuEQ=; b=cjMNwCgWnEszkwoxJyOSdRuRV
	CfV99oCNkISLry7fyYUWWd3pVaxH+TBX+Lpx/YGb4fDhUTRwGXUS5aqodgpiefl6nT5Rl1CK18jPs
	yBQnsTqlSSo63eXi8oKOhkX+jxizK3VlKzxKISHyZeU/6kxKHwmHuOzHlZgtqRr1wliDeQhQYytIN
	Bz7xy+KBfWaX10iOajLd1kZBbH2e5hcamAQRYk/KjY3lB1eRLX/xW+GMHx6Oqojettm0aMN5Lpijm
	K+3RwD5UxJV2BKOrMxNzcRLsiW+WP2LeXBb80OV9ug4ImKToH5UnekUnND56CteFpIp4307akRqVN
	kKi0nhWYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lA7Vt-0002WE-7f; Thu, 11 Feb 2021 08:39:49 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lA7Vl-0002Ub-Tm; Thu, 11 Feb 2021 08:39:42 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1613032781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yBq3iw3Hxf5kl5qFk9wqJn0npOtP/MF9I3GQgQJS4pk=;
 b=u961p/CVGwFkVGfzw2vxHz/DcUNkZOUsf1lthOsGgL6mzdvVuiB6SuvgEKE7XlfMey/5G0
 1xCda7eopAWyYPkO03tmFVZjkKh/uPhEA4bdAQF0mz9hK2L7xX/997Rt4ZchBs+DBDQuoF
 YHCF391jUf7tv4cSybYQ6okEIBckLRU=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BFF9DAE36;
 Thu, 11 Feb 2021 08:39:40 +0000 (UTC)
Date: Thu, 11 Feb 2021 09:39:38 +0100
From: Michal Hocko <mhocko@suse.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <YCTtSrCEvuBug2ap@dhcp22.suse.cz>
References: <20210208084920.2884-1-rppt@kernel.org>
 <20210208084920.2884-8-rppt@kernel.org>
 <YCEXMgXItY7xMbIS@dhcp22.suse.cz>
 <20210208212605.GX242749@kernel.org>
 <YCJMDBss8Qhha7g9@dhcp22.suse.cz>
 <20210209090938.GP299309@linux.ibm.com>
 <YCKLVzBR62+NtvyF@dhcp22.suse.cz>
 <20210211071319.GF242749@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210211071319.GF242749@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_033942_215880_20491425 
X-CRM114-Status: GOOD (  30.79  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu 11-02-21 09:13:19, Mike Rapoport wrote:
> On Tue, Feb 09, 2021 at 02:17:11PM +0100, Michal Hocko wrote:
> > On Tue 09-02-21 11:09:38, Mike Rapoport wrote:
[...]
> > > Citing my older email:
> > > 
> > >     I've hesitated whether to continue to use new flags to memfd_create() or to
> > >     add a new system call and I've decided to use a new system call after I've
> > >     started to look into man pages update. There would have been two completely
> > >     independent descriptions and I think it would have been very confusing.
> > 
> > Could you elaborate? Unmapping from the kernel address space can work
> > both for sealed or hugetlb memfds, no? Those features are completely
> > orthogonal AFAICS. With a dedicated syscall you will need to introduce
> > this functionality on top if that is required. Have you considered that?
> > I mean hugetlb pages are used to back guest memory very often. Is this
> > something that will be a secret memory usecase?
> > 
> > Please be really specific when giving arguments to back a new syscall
> > decision.
> 
> Isn't "syscalls have completely independent description" specific enough?

No, it's not as you can see from questions I've had above. More on that
below.

> We are talking about API here, not the implementation details whether
> secretmem supports large pages or not.
> 
> The purpose of memfd_create() is to create a file-like access to memory.
> The purpose of memfd_secret() is to create a way to access memory hidden
> from the kernel.
> 
> I don't think overloading memfd_create() with the secretmem flags because
> they happen to return a file descriptor will be better for users, but
> rather will be more confusing.

This is quite a subjective conclusion. I could very well argue that it
would be much better to have a single syscall to get a fd backed memory
with spedific requirements (sealing, unmapping from the kernel address
space). Neither of us would be clearly right or wrong. A more important
point is a future extensibility and usability, though. So let's just
think of few usecases I have outlined above. Is it unrealistic to expect
that secret memory should be sealable? What about hugetlb? Because if
the answer is no then a new API is a clear win as the combination of
flags would never work and then we would just suffer from the syscall 
multiplexing without much gain. On the other hand if combination of the
functionality is to be expected then you will have to jam it into
memfd_create and copy the interface likely causing more confusion. See
what I mean?

I by no means do not insist one way or the other but from what I have
seen so far I have a feeling that the interface hasn't been thought
through enough. Sure you have landed with fd based approach and that
seems fair. But how to get that fd seems to still have some gaps IMHO.
-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
