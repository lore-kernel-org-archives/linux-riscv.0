Return-Path: <SRS0=a4kH=HG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE93C433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 09:59:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD1EC64DDB
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 09:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD1EC64DDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hZ5BKFWIwQ50inOhKWrwoZgspTPv0MS152ar2N4vmlQ=; b=dQKeHhfluE+CNNS1Gk4WvEYsw
	cNc6AHTjQlwPIAZ4oOU/CfT31hhQWo1rKibrIr2PZD0vCoc3l6LjCWbO/e5C+5SuHOIZTRn8fh7PD
	RPWbKWfI9ZR1odq0w64TFOUfMdhWg6sM2Li9aIGhjBO/HfNiPswpvx/txOYNEyglni8t2AQh7RLTC
	EHZMG9tiPCRIsBGAb6x5A+OUYl2ME+PvytOn1GNEHLt1qgWiEjIuH2MKbOghkx7LFpCrnYGzavAP6
	JoTYul1PFkhuFqBiJn+owvi0pVdpBgHGXUNt4OozoL+NCJVJnpijWU4elKyWuYJnpRx6m3M5d1Hin
	wl3KdmlVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7bQ0-0003Iu-Lu; Thu, 04 Feb 2021 09:59:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7bPu-0003Gp-Qh; Thu, 04 Feb 2021 09:59:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A884364F46;
 Thu,  4 Feb 2021 09:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612432752;
 bh=Zelq6D4XZGDuPo70kYTJJgaDbDwK093nuyMe02isfTI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fZFn4SNNNsHZIThixqTd5WKR7HGKRGMdU+ddKY4VdNoOwSQ9sODqK3VgxpKL2A56s
 4I3o8KBCJHtLjeKmCDkWXpGpYpGakfGQfRhSVgtlpOrfdQ5QAi0R3o4gjlXj7MIvFC
 Ql/7xPdKgGPYgPgsAFnGZRVBP1GrMxNjIdlhLDg3vtnKQVC0uVe1NaVVXvOSxEagFl
 5y6xdti/3JckXFJOMvgjQwfxD24nH4jVxSXiirTWWQrL2Wdx2stjQ2AChARA3yWjIv
 HiCcrNO6+HU6R5Uv0EPl7S1u0uczvREvOdVTv98bo0LM7TPjMzx3LQFogyEOGejvpC
 DeRySER1corJA==
Date: Thu, 4 Feb 2021 11:58:55 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v16 07/11] secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <20210204095855.GQ242749@kernel.org>
References: <20210128092259.GB242749@kernel.org>
 <YBK1kqL7JA7NePBQ@dhcp22.suse.cz>
 <73738cda43236b5ac2714e228af362b67a712f5d.camel@linux.ibm.com>
 <YBPF8ETGBHUzxaZR@dhcp22.suse.cz>
 <6de6b9f9c2d28eecc494e7db6ffbedc262317e11.camel@linux.ibm.com>
 <YBkcyQsky2scjEcP@dhcp22.suse.cz>
 <20210202124857.GN242749@kernel.org>
 <YBlTMqjB06aqyGbT@dhcp22.suse.cz>
 <20210202191040.GP242749@kernel.org>
 <YBpo9mC5feVQ0mpG@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YBpo9mC5feVQ0mpG@dhcp22.suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_045915_027119_46414CE4 
X-CRM114-Status: GOOD (  17.94  )
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

On Wed, Feb 03, 2021 at 10:12:22AM +0100, Michal Hocko wrote:
> On Tue 02-02-21 21:10:40, Mike Rapoport wrote:
> >   
> > Let me reiterate to make sure I don't misread your suggestion.
> > 
> > If we make secretmem an opt-in feature with, e.g. kernel parameter, the
> > pooling of large pages is unnecessary. In this case there is no limited
> > resource we need to protect because secretmem will allocate page by page.
> 
> Yes.
> 
> > Since there is no limited resource, we don't need special permissions
> > to access secretmem so we can move forward with a system call that creates
> > a mmapable file descriptor and save the hassle of a chardev.
> 
> Yes, I assume you implicitly assume mlock rlimit here.

Yes.

> Also memcg accounting should be in place. 

Right, without pools memcg accounting is no different from other
unevictable files.

> Wrt to the specific syscall, please document why existing interfaces are
> not a good fit as well. It would be also great to describe interaction
> with mlock itself (I assume the two to be incompatible - mlock will fail
> on and mlockall will ignore it).

The interaction with mlock() belongs more to the man page, but I don't mind
adding this to changelog as well.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
