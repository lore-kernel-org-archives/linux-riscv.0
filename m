Return-Path: <SRS0=PCma=HN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DBCCC433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 11:30:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25B7964DF5
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 11:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25B7964DF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vEvgWHj2iYDejV0AWby7QXuxOaT593RZ5JToEHsUJfo=; b=fwD84vUGDsPIt4nT6ZV2+g00q
	PWFBNDjzqj9m1VQsj/FSgFZ+eQPF4UAqNEv0BdX+jV4tm1OwlpxvRYcbAX0+rguKCj295QkW+FPhY
	tUiQlZewZKB7r8wnvuIkLXdcFsU8I5hw2Z691X8/BK85ON6/QuZB+VQXfnbYYZV+Ap+YCRVXxmxAz
	xr0TGvGQnNHHEEPtiOU+4VfTyFAlGow8URYfi66nMO0ZY6WCzUe8lsbXWhbGGmuR2qsyJ/7SDR8PQ
	xdRivrVfJiFXIhoB4eajw/+0j/0S9v+QdP4cb2ZMmCTHsEoy+8RbnNaiLP/Op95EOKzvyLUB2xVAb
	V+cCmUb+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAAAk-00077E-5I; Thu, 11 Feb 2021 11:30:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAAAf-00074t-1E; Thu, 11 Feb 2021 11:30:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C89C601FF;
 Thu, 11 Feb 2021 11:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613043004;
 bh=JtJHuqvnhxNyM0cSP3Qe3tSMfjdJGVz3S+tERJXfo4M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PEXygoi6R9pVpb0NPj47+Ko3f1Ah21CxDjueYWnlQAO/uRVErOda0UIyi9V6v9rYs
 6NXsauRjapfptBwBvo70ls3AAnv08VDhhWUxi7yLuKhQOTQa31mGOOLAdVpQ8B16uZ
 SzyBJMAmkReTwWmxT4Tjvg8ZAL2HyRIawjk70IsH5WPDvqJ9dQdETycAuzkDATgNju
 gOL/aozy2VFMdzBaSlauwv+UBb82EKAQG3vL++P2TTqj9pWtgKqRk4VcEXI1wyFYG+
 5DJMf90zHF2E2ie9ZUU2VlL1vbBwnzXXk30WzSnRm7nZHI33uXE/tbEgH+TreMHc5x
 BblQZ8rwiMN2Q==
Date: Thu, 11 Feb 2021 13:29:46 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <20210211112946.GJ242749@kernel.org>
References: <YCEXMgXItY7xMbIS@dhcp22.suse.cz>
 <20210208212605.GX242749@kernel.org>
 <YCJMDBss8Qhha7g9@dhcp22.suse.cz>
 <20210209090938.GP299309@linux.ibm.com>
 <YCKLVzBR62+NtvyF@dhcp22.suse.cz>
 <20210211071319.GF242749@kernel.org>
 <YCTtSrCEvuBug2ap@dhcp22.suse.cz>
 <0d66baec-1898-987b-7eaf-68a015c027ff@redhat.com>
 <YCT6+9YW474IaKrm@dhcp22.suse.cz>
 <e7f1b5eb-a4c8-2772-6333-0a72c22b0c51@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e7f1b5eb-a4c8-2772-6333-0a72c22b0c51@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_063005_196657_4E909566 
X-CRM114-Status: GOOD (  15.82  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
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

On Thu, Feb 11, 2021 at 11:02:07AM +0100, David Hildenbrand wrote:
> 
> Another thought regarding "doesn't have _any_ backing storage"
> 
> What are the right semantics when it comes to memory accounting/commit?
> 
> As secretmem does not have
> a) any backing storage
> b) cannot go to swap
> 
> The MAP_NORESERVE vs. !MAP_NORESERVE handling gets a little unclear. Why
> "reserve swap space" if the allocations cannot ever go to swap? Sure, we
> want to "reserve physical memory", but in contrast to other users that can
> go to swap.
> 
> Of course, this is only relevant for MAP_PRIVATE secretmem mappings. Other
> MAP_SHARED assumes there is no need for reserving swap space as it can just
> go to the backing storage. (yeah, tmpfs/shmem is weird in that regard as
> well, but again, it's a bit different)

In that sense seceremem is as weird as tmpfs and it only allows MAP_SHARED.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
