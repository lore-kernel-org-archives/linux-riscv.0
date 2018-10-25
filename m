Return-Path: <SRS0=o0tQ=NF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15450ECDE46
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Oct 2018 02:14:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D80E620831
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Oct 2018 02:14:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dh4ntNaz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="q/q3QTdA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D80E620831
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eJZafYCCOqNMKynkKUimr6REzy9aADeo4cSXwV7sshg=; b=Dh4ntNazsyIEDd
	5MvwuzwPW8S7O2xYUx8CAC6FgCa4U7i8ENjOwCPHcBQw0GdMGsiZmFmWCoU06LwEkqsO5PzuLpnd4
	pDvmiYVhi05vShSdALOulZb/RZ+2pnRUnpb9+KPoakPAnuP4Fecy0+ppjm82nlIIGaLbzO5qYDbJw
	nNRPAD9sbW5Kyx+wPTy/Puw5BqIlI6ayYSI2bl4Ninb4+VxShHfQuZv+0yFuJ3pLI+3L5RNMFi2yw
	AePLag+r96k2sZDnRYxB90BEOsh065cTTnzxUNRbSMkaxZIpV7ScqilO7euEqTzx7sL/lmu64nCsC
	qKjMF5cTgWdKcWTx85jA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFV9z-00021O-9B; Thu, 25 Oct 2018 02:14:07 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFV9u-0001zN-Rh
 for linux-riscv@lists.infradead.org; Thu, 25 Oct 2018 02:14:04 +0000
Received: by mail-pf1-x441.google.com with SMTP id c25-v6so3384403pfe.6
 for <linux-riscv@lists.infradead.org>; Wed, 24 Oct 2018 19:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5CbWcmgaWhK69oh2DEOguVgA2uKl1YpKoqaGwtGwge8=;
 b=q/q3QTdACzUlPpDQMN1kjcezMfcsn0Yv6fXB6ODPHDCxjW91L/KWd7ad+HnYMhVDLK
 4w8FEyzAp+rB09Si8JZs7MJE9NTlxjm6PO3Hk2MpIdxGl6P2KagjiLkUB/ExO2oGujpm
 CSZTqm0K2zOVm+Foil/VJrYg2JhZozpJsR9l8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5CbWcmgaWhK69oh2DEOguVgA2uKl1YpKoqaGwtGwge8=;
 b=OXWLbrzjJrnY8nO9D+qOemii1hMSEvatMAfKnTwdiy4msQoDhMKqrkK6CM8TT2MSZq
 NU84uz6C1toBVvbpwmjbrF7go17hhKGloelIQKkQrTFb0+C/q05TdV+4TH3yLAlNevxy
 NhYJLid2+MjBaowJp7gQe5Cm08WFqqelS3UhM5FK8jBVzfCADqEe60MCqHo4Ax5T6QOh
 M/SeBsj4GD2SokKC8yO06KvSw2kpMqxDRAreRwt2tsIIylbUsCZf1kbEFrRy1y0IFseA
 v6TnavV/jf+1KvXzYahJuzWYHqDVtWIkUMip+SZcFX+328U9aJDrXFUIVe7QcBR1nT1T
 l+6w==
X-Gm-Message-State: AGRZ1gJzjwziCmRcreuj3HzTLrro33xNmaLAgmJW5U1+KzQ4MQdAX1EF
 wxz/VhwLHxXlOZI2xj/fV4HCpQ==
X-Google-Smtp-Source: AJdET5dpMwn85VnY2OpxFWBdTBIZT6WEknqSNasg/mS3JU0dLY8ImJjZVFsNiBwxQlcm8wQ3lAxw+Q==
X-Received: by 2002:a63:441f:: with SMTP id
 r31-v6mr4853133pga.60.1540433632120; 
 Wed, 24 Oct 2018 19:13:52 -0700 (PDT)
Received: from localhost ([2620:0:1000:1601:3aef:314f:b9ea:889f])
 by smtp.gmail.com with ESMTPSA id 73-v6sm774464pft.178.2018.10.24.19.13.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Oct 2018 19:13:50 -0700 (PDT)
Date: Wed, 24 Oct 2018 19:13:50 -0700
From: Joel Fernandes <joel@joelfernandes.org>
To: Balbir Singh <bsingharora@gmail.com>
Subject: Re: [PATCH 2/4] mm: speed up mremap by 500x on large regions (v2)
Message-ID: <20181025021350.GB13560@joelaf.mtv.corp.google.com>
References: <20181013013200.206928-1-joel@joelfernandes.org>
 <20181013013200.206928-3-joel@joelfernandes.org>
 <20181024101255.it4lptrjogalxbey@kshutemo-mobl1>
 <20181024115733.GN8537@350D>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181024115733.GN8537@350D>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181024_191402_901218_B317E1EA 
X-CRM114-Status: GOOD (  11.97  )
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
Message-ID: <20181025021350.tNFzjl1tJSGtbW-24iEFrcUzz5XSNvXMCBMvzzstol0@z>

On Wed, Oct 24, 2018 at 10:57:33PM +1100, Balbir Singh wrote:
[...]
> > > +		pmd_t pmd;
> > > +
> > > +		new_ptl = pmd_lockptr(mm, new_pmd);
> 
> 
> Looks like this is largely inspired by move_huge_pmd(), I guess a lot of
> the code applies, why not just reuse as much as possible? The same comments
> w.r.t mmap_sem helping protect against lock order issues applies as well.

I thought about this and when I looked into it, it seemed there are subtle
differences that make such sharing not worth it (or not possible).

 - Joel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
