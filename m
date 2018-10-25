Return-Path: <SRS0=o0tQ=NF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6B0C46475
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Oct 2018 11:01:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72E142082E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Oct 2018 11:01:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N5mA7/ss";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=shutemov-name.20150623.gappssmtp.com header.i=@shutemov-name.20150623.gappssmtp.com header.b="uRVyPXCy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72E142082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nr3wFAOShNaeG2eGhUwP9rybOEl4qndvrD5hEMTas5E=; b=N5mA7/sspsRj8C
	+qMH2ygATp/U76O4p5dXXRQoTbd0yS+LqzdlN/eDAqLjy2HvTWzZZLgJjq26rdOCdlRa5PFGQQZrk
	UB7aVIUH8XHdCmXYZ9o4wfSf6Muzuu/tCh6faFSw2Ty5UuQT6iFMecrwS6UJT1zuIdRQ6s26xB0Sp
	HoplmTQze30G6frR/591GAJioPXhpdJq1aPqzA5xJy+RdKepEoaOFhJJAHqTGLJ9IMmjXMgpZSBeX
	MDDerJ/4sIByuYqRMJ5jg85DSmxx08Ky/9YVg6X5TvGN/f+Q80GJMJeUQ3FT2PqgOvnbxo+8q/srX
	VB352iQCtgx5yGwz9o6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFdOS-0002iC-Sj; Thu, 25 Oct 2018 11:01:36 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFdAd-0005JH-OJ
 for linux-riscv@lists.infradead.org; Thu, 25 Oct 2018 10:47:40 +0000
Received: by mail-pl1-x641.google.com with SMTP id t6-v6so3630651plo.9
 for <linux-riscv@lists.infradead.org>; Thu, 25 Oct 2018 03:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1R3A0ycONFuPhko1Zvw9OxjeXH19x+s87tjU9oKwfSw=;
 b=uRVyPXCyFw/vFJ9ptle4zloJMrol+XisBixqDteIGc2z2oG/f4Q8NfKA0B2gilh+Rr
 i+HTajUVnTgL+59CrAsNpIQzGw2bYTsOBSPmi9WVqroK585WsKPK4zT2IIvv2C6f23dJ
 F9grKSKsJ1P0XFYJA4GEnLgn3qb5En9KpzOMyEtJi1cliFP4s9dMdLlWGK2lC/PN9h34
 PzeoJEkp3NKRxc1VVfXDgfbweJjDPzw7KTQ0g9tXmzEx6xT3/YOHh00cgteTAphadXLE
 270H2CcukCX0575S0EAUXv7rBR5pp/bl8ZyBNwBfTku8pgy4LLUWuBo4TdiLZcu1G2r6
 ZGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1R3A0ycONFuPhko1Zvw9OxjeXH19x+s87tjU9oKwfSw=;
 b=ElW2jqwfie2K4MADhriF/KI2cgnfj5Svv+sB7MUVNN+zW5uWBNSFOrArh+GiZIJZj2
 MhnFcs8kRsXS9kFG/AHvGlT0l2vbUHrmcHGlFftORiMX5wxcjxtacY+p4oMUadrIWOjd
 ZQnEoEVRBSBuRESI4K+LX3L0M9fca7Mojg56o5geZAZNN+omyuIlxYtO3qyTM1OqYCBe
 H4oUMnV0qDPF57HjtXZkpgDfVN4MBIyDxGMdT3uLQ48VdBNe32f9oGSrvJ2pT4tShf+f
 /qh4kp2qbP1PbZOip3TBBBerEcWT9oabI7DQp21fNyKhYQ+7vIdGhWuCvW3PekFOoedR
 JvHQ==
X-Gm-Message-State: AGRZ1gKY96Sp+oYkgV0W2LzmpTbldY2bAw5NOwp6FOVY8+nPnVqbWyQ0
 /MhXpxAb08czv3kmK6kc5eHLMQ==
X-Google-Smtp-Source: AJdET5fRlG7zn7SaYzZpRZ5UT8n9qs5ABGZ7gGjpA2WzJPxYDI1NTaxmusE6kiTKMEVKRP5rq9c/Gw==
X-Received: by 2002:a17:902:8c86:: with SMTP id
 t6-v6mr1023260plo.55.1540464428285; 
 Thu, 25 Oct 2018 03:47:08 -0700 (PDT)
Received: from kshutemo-mobl1.localdomain ([192.55.54.41])
 by smtp.gmail.com with ESMTPSA id z22-v6sm8085935pgv.24.2018.10.25.03.47.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Oct 2018 03:47:07 -0700 (PDT)
Received: by kshutemo-mobl1.localdomain (Postfix, from userid 1000)
 id 722DF300225; Thu, 25 Oct 2018 13:47:03 +0300 (+03)
Date: Thu, 25 Oct 2018 13:47:03 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 1/4] treewide: remove unused address argument from
 pte_alloc functions (v2)
Message-ID: <20181025104703.esl6wxyg2ihe4zoc@kshutemo-mobl1>
References: <20181013013200.206928-1-joel@joelfernandes.org>
 <20181013013200.206928-2-joel@joelfernandes.org>
 <20181024083716.GN3109@worktop.c.hoisthospitality.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181024083716.GN3109@worktop.c.hoisthospitality.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181025_034719_907012_6F213D9A 
X-CRM114-Status: GOOD (  15.71  )
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
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, lokeshgidra@google.com,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 linux-riscv@lists.infradead.org, elfring@users.sourceforge.net,
 Jonas Bonn <jonas@southpole.se>, kvmarm@lists.cs.columbia.edu,
 dancol@google.com, Yoshinori Sato <ysato@users.sourceforge.jp>,
 sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
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
 nios2-dev@lists.rocketboards.org, Stafford Horne <shorne@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, Chris Zankel <chris@zankel.net>,
 Tony Luck <tony.luck@intel.com>, Richard Weinberger <richard@nod.at>,
 linux-parisc@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 pantin@google.com, linux-kernel@vger.kernel.org, minchan@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org,
 Ley Foon Tan <lftan@altera.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181025104703.HsxalDwn12Z0fHTKRWBj32oN9avRJStzS4Fm88vBZrA@z>

On Wed, Oct 24, 2018 at 10:37:16AM +0200, Peter Zijlstra wrote:
> On Fri, Oct 12, 2018 at 06:31:57PM -0700, Joel Fernandes (Google) wrote:
> > This series speeds up mremap(2) syscall by copying page tables at the
> > PMD level even for non-THP systems. There is concern that the extra
> > 'address' argument that mremap passes to pte_alloc may do something
> > subtle architecture related in the future that may make the scheme not
> > work.  Also we find that there is no point in passing the 'address' to
> > pte_alloc since its unused. So this patch therefore removes this
> > argument tree-wide resulting in a nice negative diff as well. Also
> > ensuring along the way that the enabled architectures do not do anything
> > funky with 'address' argument that goes unnoticed by the optimization.
> 
> Did you happen to look at the history of where that address argument
> came from? -- just being curious here. ISTR something vague about
> architectures having different paging structure for different memory
> ranges.

I see some archicetures (i.e. sparc and, I believe power) used the address
for coloring. It's not needed anymore. Page allocator and SL?B are good
enough now.

See 3c936465249f ("[SPARC64]: Kill pgtable quicklists and use SLAB.")

-- 
 Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
