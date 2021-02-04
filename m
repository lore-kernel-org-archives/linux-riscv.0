Return-Path: <SRS0=a4kH=HG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3036BC433DB
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 11:32:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7C7F64F4A
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 11:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7C7F64F4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jVBrBwIWFV0I3yH6+N363XsmX9kwDd/6IidAO1N02Ow=; b=TtMqMcUmqCISrHAEGvU9gSauI
	z1LCr2pUJTOqLyYJ183I//aIfS1/S61dtmIGY3HsL5vNx5R9YEDh+qiNY+kTLLYtui2bu+C0WAQIK
	P6RQxiLYoPfzUHtC1WDDOjaDFfBjppixoeGWNEo6K5sGodmRbbLZ8eGvC0v2AF/hfqollC2mR4oWw
	f8NKOS3Ins41l2hvwN9ma8tyfAsnCY0vPmHCBEHvY9nZnwbR+ZaYJPRWfPodVtNtRH63O5iYztpfr
	Z3p17Jqp3r5KoalBjov7ifErRlbevMfop2IWaXHmTJvBMzzRTxdW1zv5VULO7JSsYVeknBTkT14fI
	g19cH23SA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7crs-0003RO-CU; Thu, 04 Feb 2021 11:32:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7crk-0003P3-L5; Thu, 04 Feb 2021 11:32:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B8D5A64F43;
 Thu,  4 Feb 2021 11:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612438323;
 bh=2YjywL5SDoEOedQJhLkpDYn35JOZkPUsSSTuGmTvbGc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kfyPb2gRQK0VJ0bG96IqzhK4wj3EQuLqLz846zpApxcBwm6WX5CtQsTqXRtAiettV
 Besll6N47ziUztkxZ9uvbAsAManAgkDNtO1dfWhHGfCVtc763gwDqZuV/PJHM4amXe
 NzZHR6+dZdeHxPTLxYHYjwbMQNb3w6QbyNiepEAxlD0e9d57gxLWScwoHeMOz0zzxT
 Vme4kodJtOqIlDuUlby8EOucFxgZASr9qI2lvWzc7i6T1yxSrrhOjO19hjpFL65gQr
 YqgO9vVlRT1CTjfaXTK0DGlZqxa/k2Qn7Vs36jPxV0PXtDTyFjDcxi+38fcdf2VRVr
 ganUhejqO/Vig==
Date: Thu, 4 Feb 2021 13:31:45 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v16 07/11] secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <20210204113145.GR242749@kernel.org>
References: <6653288a-dd02-f9de-ef6a-e8d567d71d53@redhat.com>
 <YBlUXdwV93xMIff6@dhcp22.suse.cz>
 <211f0214-1868-a5be-9428-7acfc3b73993@redhat.com>
 <YBlgCl8MQuuII22w@dhcp22.suse.cz>
 <d4fe580a-ef0e-e13f-9ee4-16fb8b6d65dd@redhat.com>
 <YBlicIupOyPF9f3D@dhcp22.suse.cz>
 <95625b83-f7e2-b27a-2b99-d231338047fb@redhat.com>
 <20210202181546.GO242749@kernel.org>
 <f26a17366194880d58e67d10cb5d7d7fdf2f3c19.camel@linux.ibm.com>
 <YBqSejZ3XbUKFudR@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YBqSejZ3XbUKFudR@dhcp22.suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_063204_973759_A4DC0D61 
X-CRM114-Status: GOOD (  25.97  )
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

On Wed, Feb 03, 2021 at 01:09:30PM +0100, Michal Hocko wrote:
> On Tue 02-02-21 10:55:40, James Bottomley wrote:
> > On Tue, 2021-02-02 at 20:15 +0200, Mike Rapoport wrote:
> > > On Tue, Feb 02, 2021 at 03:34:29PM +0100, David Hildenbrand wrote:
> > > > On 02.02.21 15:32, Michal Hocko wrote:
> > 
> > Well the safest security statement is that we never expose the data to
> > the kernel because it's a very clean security statement and easy to
> > enforce. It's also the easiest threat model to analyse.   Once we do
> > start exposing the secret to the kernel it alters the threat profile
> > and the analysis and obviously potentially provides the ROP gadget to
> > an attacker to do the same. Instinct tells me that the loss of
> > security doesn't really make up for the ability to swap or migrate but
> > if there were a case for doing the latter, it would have to be a
> > security policy of the user (i.e. a user should be able to decide their
> > data is too sensitive to expose to the kernel).
> 
> The security/threat model should be documented in the changelog as
> well. I am not a security expert but I would tend to agree that not
> allowing even temporal mapping for data copying (in the kernel) is the
> most robust approach. Whether that is generally necessary for users I do
> not know.
> 
> From the API POV I think it makes sense to have two
> modes. NEVER_MAP_IN_KERNEL which would imply no migrateability, no
> copy_{from,to}_user, no gup or any other way for the kernel to access
> content of the memory. Maybe even zero the content on the last unmap to
> never allow any data leak. ALLOW_TEMPORARY would unmap the page from
> the direct mapping but it would still allow temporary mappings for
> data copying inside the kernel (thus allow CoW, copy*user, migration).
> Which one should be default and which an opt-in I do not know. A less
> restrictive mode to be default and the more restrictive an opt-in via
> flags makes a lot of sense to me though.

The default is already NEVER_MAP_IN_KERNEL, so there is no explicit flag
for this. ALLOW_TEMPORARY should be opt-in, IMHO, and we can add it on top
later on.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
