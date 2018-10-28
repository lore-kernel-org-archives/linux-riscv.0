Return-Path: <SRS0=e+QJ=NI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED698C2BC61
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 28 Oct 2018 22:40:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8021020664
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 28 Oct 2018 22:40:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u0K+rmhk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzlz7jFW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8021020664
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I0Jm5wJo2+NPoK56UIIAsfMSsZ5ac8j085F/7bF3atU=; b=u0K+rmhkxxLre5
	z/Xi6V3j/RokBD/0YdwNvqVuUvz8xav2XzSVJw2jETvpNJizjR00c5iDrDB5EWvrk+pmk6zhPJ+pN
	tuLrObJcH411bdzDQu7jrqZDjA2zwM/2ukhpu2/ZyJyBnB4aG6ko9u1OFDH9xR/dLdwxqN2qZ7Cz2
	NVpSc94T/OzgH0Mwsf7BWLhZfHwg6NkCMlYCjcS3owPt6QaFyqimCVPKy5L5gIrMKjIGhvE3pMW15
	XigLymCQe1/22cSmgjUmqYIDhNFwIJHwH4F8vstAgB5OtdlOorBHndJ3Actvv9zdTPnUFEIj50Ltl
	kNP9PzlEolphGTEtGhEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gGtjk-0007fB-Aj; Sun, 28 Oct 2018 22:40:48 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gGtjG-00074P-HD; Sun, 28 Oct 2018 22:40:20 +0000
Received: by mail-pg1-x544.google.com with SMTP id n10-v6so2918360pgv.10;
 Sun, 28 Oct 2018 15:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GFtksEV3l5eq+mnfMA1OwOjA0oBp/IcRdRQ8wGi247I=;
 b=hzlz7jFWANzmnQYBfUjAY47ntJv9ruGodd92q7E4yeWjWXy4EZl6bPRcEO0kKVxcET
 8l/LxbyoIEOMIv2Qws7VhhdBdB2WSqhVRO2xFO6BoL6UVCnvmAbklAgUnFIPczbls2XR
 8t+tWl9FODh8azBtSJSVtOJ8ASXQGH4rOt//srkRKwJB3n5TPhA7eLFTkuIKOx//Tn6i
 wCdbM58gxJCZ3Wya+Xx9knz+xP1bKelI2gOlUgbKzh9xt2GwpzMnGwoSI1DVJtDgp4Fn
 d+gXcEV0Ha0CDx7RrL2gR1D2FtTk3tSVbj1J8r71HdedlxSopPgWOCsGk19JAS3kF9ps
 MWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GFtksEV3l5eq+mnfMA1OwOjA0oBp/IcRdRQ8wGi247I=;
 b=OJCX2XELqG2+GNJ91kYO3ny+9wM3TJCzF6uklam92qKkxO4NPQvMXDpWFX7pN0n1u9
 K3Vs1dTTVoXn82VTqPz7xE7ScsjBUgpfRqWP92wQPaCTq8KOXOKu1qQEcTX0CfsCtcdN
 ZyXXYOx8H2cEksHmewgw9LmFGKzo9KlskJ+Osjwa6tHjfuXNY5ojq1RCBzsHtMrI46tS
 WcmgPQAhIhvmM637ptPNysUm4B1W06RcSXM432Mv7G5m+8yX708bJnO8XnDdROG0N1UV
 64TdBHR97Exa3/wDhYT/jGrXLgE11e99y7Z+Uuj/Xmh2kYxBClGuWGjREyiy34BHIgRb
 nXjQ==
X-Gm-Message-State: AGRZ1gJFtK8NHE+AuQV9h+Zgu0pXjbgJDMST71s8EII4QFQ72NpEswE+
 QAk67jMcFvxwcVy9j/BQYic=
X-Google-Smtp-Source: AJdET5fu0DqTEYAGDBSaxsVyd0K3i3CEEiTSqETAuxd4rlFGA5L/e1X97o5DIUSGPTfJJWdGWN6dQw==
X-Received: by 2002:a63:181:: with SMTP id
 123-v6mr11570471pgb.149.1540766407194; 
 Sun, 28 Oct 2018 15:40:07 -0700 (PDT)
Received: from localhost (14-202-194-140.static.tpgi.com.au. [14.202.194.140])
 by smtp.gmail.com with ESMTPSA id
 t4-v6sm19146464pfb.44.2018.10.28.15.40.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 28 Oct 2018 15:40:05 -0700 (PDT)
Date: Mon, 29 Oct 2018 09:40:02 +1100
From: Balbir Singh <bsingharora@gmail.com>
To: Joel Fernandes <joel@joelfernandes.org>
Subject: Re: [PATCH 2/4] mm: speed up mremap by 500x on large regions (v2)
Message-ID: <20181028224002.GA16399@350D>
References: <20181013013200.206928-1-joel@joelfernandes.org>
 <20181013013200.206928-3-joel@joelfernandes.org>
 <20181024101255.it4lptrjogalxbey@kshutemo-mobl1>
 <20181024115733.GN8537@350D>
 <20181025021350.GB13560@joelaf.mtv.corp.google.com>
 <20181027102102.GO8537@350D>
 <20181027193917.GA51131@joelaf.mtv.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181027193917.GA51131@joelaf.mtv.corp.google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181028_154018_596339_E33E1A99 
X-CRM114-Status: GOOD (  21.31  )
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
 kvmarm@lists.cs.columbia.edu, dancol@google.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-xtensa@linux-xtensa.org,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 hughd@google.com, "James E.J. Bottomley" <jejb@parisc-linux.org>,
 kasan-dev@googlegroups.com, anton.ivanov@kot-begemot.co.uk,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, Sam Creasey <sammy@sammy.net>,
 Fenghua Yu <fenghua.yu@intel.com>, linux-s390@vger.kernel.org,
 Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Julia Lawall <Julia.Lawall@lip6.fr>, linux-m68k@lists.linux-m68k.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 nios2-dev@lists.rocketboards.org, "Kirill A. Shutemov" <kirill@shutemov.name>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Chris Zankel <chris@zankel.net>, Tony Luck <tony.luck@intel.com>,
 Richard Weinberger <richard@nod.at>, linux-parisc@vger.kernel.org,
 pantin@google.com, Max Filippov <jcmvbkbc@gmail.com>,
 linux-kernel@vger.kernel.org, minchan@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org,
 Ley Foon Tan <lftan@altera.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181028224002.bj7p6usBUufQZP9EoitB7ccw5P7wp0Sr_JroyOJbxTY@z>

On Sat, Oct 27, 2018 at 12:39:17PM -0700, Joel Fernandes wrote:
> Hi Balbir,
> 
> On Sat, Oct 27, 2018 at 09:21:02PM +1100, Balbir Singh wrote:
> > On Wed, Oct 24, 2018 at 07:13:50PM -0700, Joel Fernandes wrote:
> > > On Wed, Oct 24, 2018 at 10:57:33PM +1100, Balbir Singh wrote:
> > > [...]
> > > > > > +		pmd_t pmd;
> > > > > > +
> > > > > > +		new_ptl = pmd_lockptr(mm, new_pmd);
> > > > 
> > > > 
> > > > Looks like this is largely inspired by move_huge_pmd(), I guess a lot of
> > > > the code applies, why not just reuse as much as possible? The same comments
> > > > w.r.t mmap_sem helping protect against lock order issues applies as well.
> > > 
> > > I thought about this and when I looked into it, it seemed there are subtle
> > > differences that make such sharing not worth it (or not possible).
> > >
> > 
> > Could you elaborate on them?
> 
> The move_huge_page function is defined only for CONFIG_TRANSPARENT_HUGEPAGE
> so we cannot reuse it to begin with, since we have it disabled on our
> systems. I am not sure if it is a good idea to split that out and refactor it
> for reuse especially since our case is quite simple compared to huge pages.
> 
> There are also a couple of subtle differences between the move_normal_pmd and
> the move_huge_pmd. Atleast 2 of them are:
> 
> 1. We don't concern ourself with the PMD dirty bit, since the pages being
> moved are normal pages and at the soft-dirty bit accounting is at the PTE
> level, since we are not moving PTEs, we don't need to do that.
> 
> 2. The locking is simpler as Kirill pointed, pmd_lock cannot fail however
> __pmd_trans_huge_lock can.
> 
> I feel it is not super useful to refactor move_huge_pmd to support our case
> especially since move_normal_pmd is quite small, so IMHO the benefit of code
> reuse isn't there very much.
>

My big concern is that any bug fixes will need to monitor both paths.
Do you see a big overhead in checking the soft dirty bit? The locking is
a little different. Having said that, I am not strictly opposed to the
extra code, just concerned about missing fixes/updates as we find them.
 
> Do let me know your thoughts and thanks for your interest in this.
> 
>

Balbir Singh. 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
