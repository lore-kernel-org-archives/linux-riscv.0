Return-Path: <SRS0=LzlR=MY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2BDC6783C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 16:37:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F09C620835
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 16:37:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gKVGTLD0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="Yx6iiDOE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F09C620835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NpBGDlZFHvJ5JvGrtlsk2b42cc+0kIc8spxoCNKkkVI=; b=gKVGTLD0tVG4FN
	VCPiojPKFTFyodvjZS2jqbGM1N1kTtLf/z8kwdo5KlYJxN+D3F9T/WGzeMWWafUHLsbLvjzaZ0ct/
	SIpYWHtNBtuOrA0jehRTY5lJhKf/z4DmVLmQOKb7RaQEtGnUAre4UzhjrTM6T5bRb33OnNgyoWKrp
	TTKwTeNJbOdg4caTuPPejY6TGPHOaiWAG6LnvN6F9vsxmaVp9yOB7esqkRhuVdbdHP3yYaRE+nhcZ
	cALvp/UIkg2NEJygHauLO0w1nHn7/35/uDE+esnLvLyRSLPNeSrj+rHTC6VcMvQIV8FqwUzUS0G2n
	vfiM4XZUWpYagr4u8iqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gB0Ra-0007PI-OC; Fri, 12 Oct 2018 16:37:42 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gB0RW-0007N4-OF
 for linux-riscv@lists.infradead.org; Fri, 12 Oct 2018 16:37:40 +0000
Received: by mail-pl1-x642.google.com with SMTP id 30-v6so6168443plb.10
 for <linux-riscv@lists.infradead.org>; Fri, 12 Oct 2018 09:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VgdWRAThwj2EMLbo8sWAHSsutcajwriCEy/dGs8kimQ=;
 b=Yx6iiDOE4GgwJ3wrxDhjF1xivdsbBDEqc8xx5jdpyDJvE+qpLgMgy/KhjSsAuHRJyU
 rjgnlYO7tlrGv1G+TaKr5XDehCpd8eZLTAEwubNcKxLRAX6QLsDFm2lImHS78o7KxLhe
 EhZiy+H+FVvSEtNaG63pU9KzeTWvu1FrWLelY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VgdWRAThwj2EMLbo8sWAHSsutcajwriCEy/dGs8kimQ=;
 b=Gv+1wHpVgZE7p9VoYM+fVSLrOgtZPGc0nCdRa1QIXWilKY2KMH82VyG9S/QwQPjChK
 CFotuak0D6QPph0KU1h2xyPPXd6fGYRKCtbOoMTlNyChmQOE3Ca3T3aaV1otzM6dTE7J
 p45zbBUPYCVdC0mHnAEZhUFgbSeL2FeZnJNq9NrGMoI84W1J2Z1EYZrSu3mtWwqziqL3
 DfEl68V3IUe59debvZYdgKreiQyxW0wCY8Syf8MKhhyUiJ9vPNVX1JhUDTVc4FVc4nAY
 n6Bmh/ynvF7HFfISHcSxbdN8rymQHaz5zM+sgJAWl3VTdR1TZeqEUgrD6kAciuLiC9wu
 ZaaQ==
X-Gm-Message-State: ABuFfohLU4TVK8ng/sMJxa7IDfYfmss0CiC0c9SWYTboE4hoavfVc5qx
 7sY2KF7CloyZJr4s8XsXtcPw3Q==
X-Google-Smtp-Source: ACcGV62jUKQ08v22v3vIhXoVq3Rc/sYsS1RW7mhnmQmf8WDFV0RfxpB6QhVx3k79ViRK/oHHNtygsQ==
X-Received: by 2002:a17:902:8205:: with SMTP id
 x5-v6mr6704330pln.55.1539362247706; 
 Fri, 12 Oct 2018 09:37:27 -0700 (PDT)
Received: from localhost ([2620:0:1000:1601:3aef:314f:b9ea:889f])
 by smtp.gmail.com with ESMTPSA id k77-v6sm5032857pfg.1.2018.10.12.09.37.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 12 Oct 2018 09:37:26 -0700 (PDT)
Date: Fri, 12 Oct 2018 09:37:25 -0700
From: Joel Fernandes <joel@joelfernandes.org>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v2 1/2] treewide: remove unused address argument from
 pte_alloc functions
Message-ID: <20181012163725.GB223066@joelaf.mtv.corp.google.com>
References: <20181012013756.11285-1-joel@joelfernandes.org>
 <20181012110906.fpfttp4nhvsr2ps7@kshutemo-mobl1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181012110906.fpfttp4nhvsr2ps7@kshutemo-mobl1>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181012_093738_794251_99C15037 
X-CRM114-Status: GOOD (  13.50  )
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
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, lokeshgidra@google.com,
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
Message-ID: <20181012163725.Xno5Tg4aiVFVpQ_zX0ck9EIGf1yBPLactGUoJsshMvc@z>

On Fri, Oct 12, 2018 at 02:09:06PM +0300, Kirill A. Shutemov wrote:
> On Thu, Oct 11, 2018 at 06:37:55PM -0700, Joel Fernandes (Google) wrote:
> > diff --git a/arch/m68k/include/asm/mcf_pgalloc.h b/arch/m68k/include/asm/mcf_pgalloc.h
> > index 12fe700632f4..4399d712f6db 100644
> > --- a/arch/m68k/include/asm/mcf_pgalloc.h
> > +++ b/arch/m68k/include/asm/mcf_pgalloc.h
> > @@ -12,8 +12,7 @@ extern inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
> >  
> >  extern const char bad_pmd_string[];
> >  
> > -extern inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm,
> > -	unsigned long address)
> > +extern inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
> >  {
> >  	unsigned long page = __get_free_page(GFP_DMA);
> >  
> > @@ -32,8 +31,6 @@ extern inline pmd_t *pmd_alloc_kernel(pgd_t *pgd, unsigned long address)
> >  #define pmd_alloc_one_fast(mm, address) ({ BUG(); ((pmd_t *)1); })
> >  #define pmd_alloc_one(mm, address)      ({ BUG(); ((pmd_t *)2); })
> >  
> > -#define pte_alloc_one_fast(mm, addr) pte_alloc_one(mm, addr)
> > -
> 
> I believe this was one done manually, right?
> Please explicitely state everthing you did on not of sematic patch

Ok, I can update the changelog with that information next time I send it.
This is the only thing I didn't mention in the changelog since it was a
trivial unused function deletion.. but I mentioned everything else..

And sir, you are one thorough reviewer! ;-)

 - Joel

[..]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
