Return-Path: <SRS0=o0tQ=NF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48591ECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Oct 2018 02:21:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14E1020831
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Oct 2018 02:21:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KZT8NOoP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="WhUgko4o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14E1020831
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EfeZUgFZwQdTN8jH5b328WfdZRb6f/yQDGvj2u+QMwc=; b=KZT8NOoPxKA0Om
	O3X5ilOQvkTtY6e5bDqmFS/0welTRJ1Mp11UxzNaihLiGCDJ3TDOMTXXeGO9LxbGSGC2uHPklFjEL
	493vBqZb4rlTvrxTVgeNkUWyLLQmRZE/4F9qvFD1rk38QRFY5p9Pus+PI/+7MleDWx8ZcVxfawxtB
	vHc/VpgrvZfA1FcOq8OB5AngIcv5qKL6FnMg54eXWWEr0e3HV2mpjNGWsM+0jRSrOpXRdgtjMzRMm
	QhCu03NfVULeI1yXWPYSlE6jkufNFK5QeAC768BUscmdW8U2uSKe4ojpY+M7b4zgzesEGzTXR5TY9
	YC4jc76D8AtXdRD1KSyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFVHF-0004xl-DS; Thu, 25 Oct 2018 02:21:37 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFVHA-0004vr-Mv
 for linux-riscv@lists.infradead.org; Thu, 25 Oct 2018 02:21:34 +0000
Received: by mail-pf1-x441.google.com with SMTP id r64-v6so3378612pfb.13
 for <linux-riscv@lists.infradead.org>; Wed, 24 Oct 2018 19:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=a3qWVWJhvBgQDe8YRsbgtRjpHQfuWQV3NPWrQqOgjm0=;
 b=WhUgko4o5JcJhUwoWI8kPjvkrH9YQTvlMUDHtdL2JJ5mCTuig+Mqt2sFNrTVhmJSgZ
 34O62c+REJyhBfJwS4DhKcn3WHO4O/TKsj/DlxdzkUHTNLB9x+bJAzgHPxnnVjbdI5DC
 PQKlOZe6+0JIfKGXqhkPj1W7WBMfDG+7PFQCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=a3qWVWJhvBgQDe8YRsbgtRjpHQfuWQV3NPWrQqOgjm0=;
 b=RVuGtZUZjAjsBiknU1r/5+JI783uyabm2SnK70ARAuo7Bz+rpKn+TEnwRCYry3M8Zn
 t1ROiFi/Z4H9uto5x0nkJP/hKEQVN3w3EtnGgjaptfLuLDLglD37T3EwgVJlxj1hI6bk
 5OyPS0jC6vkyv+Vg6zg/4RMb0fvbsDuU5jjulLspBY2kKtASWsWHpKnHkiryXRLlabvo
 OTcZ4Dcm3oC0az/zGNOCgD0diWjidLja1bKkhX6krn9DCRK4+g9dvroBE6wCjuj+OTcz
 pje94727h7xVBkJEgKy8lrvoTN7Zhq0+mdbUHQh+lzn2/GAerQJs2bnKTDEEjw1YJrzW
 amaA==
X-Gm-Message-State: AGRZ1gLVg5z1sxinD3vWXQrrmX6W6QtRsHrW73RSv0b3Q7UtvYCK+qfj
 JoQ/eto5pnE28p8KfGZ8LPeOww==
X-Google-Smtp-Source: AJdET5fQ846491taIkpUacXcNZHbPUwGXEdQnQATNy2W0qACW8LZiE3r2xKx5hJLJ1WKuWwXbkkY2Q==
X-Received: by 2002:a63:88c7:: with SMTP id l190mr4758613pgd.110.1540434081712; 
 Wed, 24 Oct 2018 19:21:21 -0700 (PDT)
Received: from localhost ([2620:0:1000:1601:3aef:314f:b9ea:889f])
 by smtp.gmail.com with ESMTPSA id 11-v6sm8041192pfs.108.2018.10.24.19.21.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Oct 2018 19:21:20 -0700 (PDT)
Date: Wed, 24 Oct 2018 19:21:19 -0700
From: Joel Fernandes <joel@joelfernandes.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 1/4] treewide: remove unused address argument from
 pte_alloc functions (v2)
Message-ID: <20181025022119.GC13560@joelaf.mtv.corp.google.com>
References: <20181013013200.206928-1-joel@joelfernandes.org>
 <20181013013200.206928-2-joel@joelfernandes.org>
 <20181024083716.GN3109@worktop.c.hoisthospitality.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181024083716.GN3109@worktop.c.hoisthospitality.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181024_192132_766949_CCB8E897 
X-CRM114-Status: GOOD (  16.23  )
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
 nios2-dev@lists.rocketboards.org, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Chris Zankel <chris@zankel.net>, Tony Luck <tony.luck@intel.com>,
 Richard Weinberger <richard@nod.at>, linux-parisc@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, pantin@google.com,
 linux-kernel@vger.kernel.org, minchan@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org,
 Ley Foon Tan <lftan@altera.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181025022119.P8NT-w9Gw8MITWQ_-2BwU1ouM1ykU1ILLk-y-_YPYIA@z>

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

I didn't happen to do that analysis but from code analysis, no architecutre
is using it. Since its unused in the kernel, may be such architectures don't
exist or were removed, so we don't need to bother? Could you share more about
your concern with the removal of this argument?

thanks,

 - Joel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
