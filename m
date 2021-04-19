Return-Path: <SRS0=YGcN=JQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3373EC433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 11:24:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBAFC61157
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 11:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBAFC61157
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=He4WT34wP1DPgMiUpB6ve3mFTYqAMB8o1MGbhPgLhxo=; b=R06iIt7cd318PoCW6gS4Hhgfi
	BCkV3Ep1vsWLGHEX1hKQ6jG3mw4Vxh0pEgi7RTyCzERnd9dKiG/0cJMCsFgVDGnoWshUkpiNTovXu
	HT+15uc0YwJAY7RR7eNeNWtK+JtIA0B9PqZkbljLUUwkPOK0o4zJw6BfP2g4zwNekOjtHOGmqGQDa
	7w++ypf8qMWCGmPFOhGSrkwpfmmnoILelY/99E9ZKAJFKxr4VY1aAvIwL8TIy9vnHdCob06cqixjQ
	45MOeoaFx1hlScr2ftloIxc6KsZa3ME2OZa6jOFtx8l0i44phgWDgw1ReS5AnzHlSoEyyGquo6b8V
	xH2X97AqA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYS0M-009l7R-Sn; Mon, 19 Apr 2021 11:23:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYS0C-009l66-KQ; Mon, 19 Apr 2021 11:23:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=8kRAoc0QBubKYge5PVOcpXOSqRAXAMW8YeZW9/WtJU8=; b=Q4iGwzjsJleF1GjQOjyti4BwEQ
 kMflgbMlKiSgpC29OgqfVgGrZttP1HwPBGt8N93ehv3ya+xnOskH/kBy+D0N5vT5yUe/+g1v9z/Ma
 Cp4tIDAseOedgjInQg5yHqOEvZbooQDFHeYs8Sryde6A4fQ5slcDMthytLKrH2OJz/4qJDzam9eBn
 p6bjarnH+CdB1hRK/wAvjCp96Ow2EiDF9/3ydKwZwqane+/kvenBjEPU7O5eAiYLGTdXKzhzt0PGo
 DvZtg4i6iUXZmGxEIMN7nGJNjQ60ITQJypATNUfusbk15xxeHMt+n9rKsreyAJad/2eA7Z5Mlaiyn
 rBuUX32A==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lYRza-00Dec0-Ty; Mon, 19 Apr 2021 11:23:12 +0000
Date: Mon, 19 Apr 2021 12:23:02 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
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
 Yury Norov <yury.norov@gmail.com>, linux-api@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, kernel test robot <oliver.sang@intel.com>
Subject: Re: [PATCH] secretmem: optimize page_is_secretmem()
Message-ID: <20210419112302.GX2531743@casper.infradead.org>
References: <20210419084218.7466-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210419084218.7466-1-rppt@kernel.org>
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

On Mon, Apr 19, 2021 at 11:42:18AM +0300, Mike Rapoport wrote:
> The perf profile of the test indicated that the regression is caused by
> page_is_secretmem() called from gup_pte_range() (inlined by gup_pgd_range):

Uhh ... you're calling it in the wrong place!

                VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
                page = pte_page(pte);

                if (page_is_secretmem(page))
                        goto pte_unmap;

                head = try_grab_compound_head(page, 1, flags);
                if (!head)
                        goto pte_unmap;

So you're calling page_is_secretmem() on a struct page without having
a refcount on it.  That is definitely not allowed.  secretmem seems to
be full of these kinds of races; I know this isn't the first one I've
seen in it.  I don't think this patchset is ready for this merge window.

With that fixed, you'll have a head page that you can use for testing,
which means you don't need to test PageCompound() (because you know the
page isn't PageTail), you can just test PageHead().

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
