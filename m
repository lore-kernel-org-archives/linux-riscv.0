Return-Path: <SRS0=LzlR=MY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02901C6783C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 12:51:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3F5C20865
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 12:51:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WgCCUW2o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="cuTpq2Kx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3F5C20865
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vv2q5RPaYPxtHiea9/6H/fBzubHa4ecZNCUi7DMg2uU=; b=WgCCUW2oUxWx7W
	ly+vx/sRnG1/et19eARJWJwvyjqTlqTpjgaDnnKR39wd6FQDSRsyEQ+ae8NqBSf59rynxKFx+Unel
	eg+TOJtkJDbiSjmoj8E8HrxvAo1RswvhIvmSA3dOfHe1rjMwZwMwfn1inrKiWR9ZOMS+3H93zN6lo
	cG5N9Dswg58F8fY0+7T2I0L0oZy5NCn/0fKnEZOOeKCeXqM71xEdm6EwaX6/XnNy67OANc/LstGaP
	9EyYB1KzojNlfjW6Wfod9Dkj6ruiYHmV7Gp67RZe52l6eXEIlML6XxO4y9FGLHzuEPjaK5stxCixy
	ajZT1YzL0RnvHELlHlJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gAwuG-0007Ei-J9; Fri, 12 Oct 2018 12:51:04 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAwuD-0007Bq-52
 for linux-riscv@lists.infradead.org; Fri, 12 Oct 2018 12:51:02 +0000
Received: by mail-pl1-x643.google.com with SMTP id y15-v6so5901740plr.12
 for <linux-riscv@lists.infradead.org>; Fri, 12 Oct 2018 05:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QKN0QLgWMdeaFShuOKgUCdS+KZEgqTytMiliL2mzgC0=;
 b=cuTpq2KxjzFREjuReJCgXoTtmsf4MapPO/GKTB1jBLxsEEu2m7M7ZkvRB6q79tS5tz
 O6mqiraSPEsjDSeGINirN/8v2zV5PUlYs/7NG0sKTsmNtz6ADZ+8u7AlqnAMULoHIM7r
 c98gGt3pHgL5ok5lR90IVL9Vuy1e12CI4gJLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QKN0QLgWMdeaFShuOKgUCdS+KZEgqTytMiliL2mzgC0=;
 b=YNnEHYh3Ul34MG/pcpnkeJP9EDE5Mz5QKnVxBOR2La5tWr+NMgJrHcL4d/aqe1+5lN
 UP4uonXgDuGDAdmgZz0+7rsJoQIjazhdde1FpDGGSI4pcKBv1dn6CLMjw7PtLPh82MIH
 nEEe9kcHueLqN9pHMqAB9jsViDR/XJigi/v6XCp4PuMhuUl/tF9B2j6E7jKofT28M1iP
 xluhLseEFOXXQLIUyNK1P0q1Q2Y9DZCKJias3oGtPgst945XD7ZJjYTpipvL6vbEicjc
 zZMKMaZyj8xFIPwaZHoqw1nGdKfc0anMHXoiwK2k+AvvNj3st38a7Q2IdD4SYh3elOkm
 tW4A==
X-Gm-Message-State: ABuFfogteHAXeh2Q/Qp2XX2CEiBlTn/lrklQ92mf79Jr/lOK3omDbMN0
 mpz/edBjJkb90jgRp61mmuhZWg==
X-Google-Smtp-Source: ACcGV62U4sAceqM+O5tNywkqcriJ8B2EehkajcnFr0AxLQ8/wmf9zrWd7Nv4vm7gsM8YPAJpgdeQnw==
X-Received: by 2002:a17:902:22a:: with SMTP id
 39-v6mr5923316plc.267.1539348649157; 
 Fri, 12 Oct 2018 05:50:49 -0700 (PDT)
Received: from localhost ([2620:0:1000:1601:3aef:314f:b9ea:889f])
 by smtp.gmail.com with ESMTPSA id z11-v6sm4395226pfg.85.2018.10.12.05.50.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 12 Oct 2018 05:50:47 -0700 (PDT)
Date: Fri, 12 Oct 2018 05:50:46 -0700
From: Joel Fernandes <joel@joelfernandes.org>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v2 2/2] mm: speed up mremap by 500x on large regions
Message-ID: <20181012125046.GA170912@joelaf.mtv.corp.google.com>
References: <20181012013756.11285-1-joel@joelfernandes.org>
 <20181012013756.11285-2-joel@joelfernandes.org>
 <20181012113056.gxhcbrqyu7k7xnyv@kshutemo-mobl1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181012113056.gxhcbrqyu7k7xnyv@kshutemo-mobl1>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181012_055101_252810_47A68266 
X-CRM114-Status: GOOD (  21.59  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-mips@linux-mips.org, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 mhocko@kernel.org, linux-mm@kvack.org, lokeshgidra@google.com,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 elfring@users.sourceforge.net, Jonas Bonn <jonas@southpole.se>,
 linux-s390@vger.kernel.org, dancol@google.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-xtensa@linux-xtensa.org,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 hughd@google.com, "James E.J. Bottomley" <jejb@parisc-linux.org>,
 kasan-dev@googlegroups.com, kvmarm@lists.cs.columbia.edu,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, Sam Creasey <sammy@sammy.net>,
 Fenghua Yu <fenghua.yu@intel.com>, Jeff Dike <jdike@addtoit.com>,
 linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Julia Lawall <Julia.Lawall@lip6.fr>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, nios2-dev@lists.rocketboards.org,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Tony Luck <tony.luck@intel.com>, Richard Weinberger <richard@nod.at>,
 linux-parisc@vger.kernel.org, pantin@google.com,
 Max Filippov <jcmvbkbc@gmail.com>, linux-kernel@vger.kernel.org,
 minchan@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-alpha@vger.kernel.org, Ley Foon Tan <lftan@altera.com>,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181012125046.iGPOKn32GQOAwBVfMHSCtSwyddI009imh2cE6lYglAA@z>

On Fri, Oct 12, 2018 at 02:30:56PM +0300, Kirill A. Shutemov wrote:
> On Thu, Oct 11, 2018 at 06:37:56PM -0700, Joel Fernandes (Google) wrote:
> > Android needs to mremap large regions of memory during memory management
> > related operations. The mremap system call can be really slow if THP is
> > not enabled. The bottleneck is move_page_tables, which is copying each
> > pte at a time, and can be really slow across a large map. Turning on THP
> > may not be a viable option, and is not for us. This patch speeds up the
> > performance for non-THP system by copying at the PMD level when possible.
> > 
> > The speed up is three orders of magnitude. On a 1GB mremap, the mremap
> > completion times drops from 160-250 millesconds to 380-400 microseconds.
> > 
> > Before:
> > Total mremap time for 1GB data: 242321014 nanoseconds.
> > Total mremap time for 1GB data: 196842467 nanoseconds.
> > Total mremap time for 1GB data: 167051162 nanoseconds.
> > 
> > After:
> > Total mremap time for 1GB data: 385781 nanoseconds.
> > Total mremap time for 1GB data: 388959 nanoseconds.
> > Total mremap time for 1GB data: 402813 nanoseconds.
> > 
> > Incase THP is enabled, the optimization is skipped. I also flush the
> > tlb every time we do this optimization since I couldn't find a way to
> > determine if the low-level PTEs are dirty. It is seen that the cost of
> > doing so is not much compared the improvement, on both x86-64 and arm64.
> 
> I looked into the code more and noticed move_pte() helper called from
> move_ptes(). It changes PTE entry to suite new address.
> 
> It is only defined in non-trivial way on Sparc. I don't know much about
> Sparc and it's hard for me to say if the optimization will break anything
> there.

Sparc's move_pte seems to be flushing the D-cache to prevent aliasing. It is
not modifying the PTE itself AFAICS:

#ifdef DCACHE_ALIASING_POSSIBLE
#define __HAVE_ARCH_MOVE_PTE
#define move_pte(pte, prot, old_addr, new_addr)                         \
({                                                                      \
        pte_t newpte = (pte);                                           \
        if (tlb_type != hypervisor && pte_present(pte)) {               \
                unsigned long this_pfn = pte_pfn(pte);                  \
                                                                        \
                if (pfn_valid(this_pfn) &&                              \
                    (((old_addr) ^ (new_addr)) & (1 << 13)))            \
                        flush_dcache_page_all(current->mm,              \
                                              pfn_to_page(this_pfn));   \
        }                                                               \
        newpte;                                                         \
})
#endif

If its an issue, then how do transparent huge pages work on Sparc?  I don't
see the huge page code (move_huge_pages) during mremap doing anything special
for Sparc architecture when moving PMDs..

Also, do we not flush the caches from any path when we munmap address space?
We do call do_munmap on the old mapping from mremap after moving to the new one.

thanks,

 - Joel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
