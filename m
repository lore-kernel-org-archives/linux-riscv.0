Return-Path: <SRS0=W42x=NR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A8CEC32789
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 04:36:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36FA920818
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 04:36:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I8oG6b5J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="vFP1Hs1w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36FA920818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WrqEOx9KW/BOUnSCakzuX9NeEJvlu3jdzzsQyZhIYJ8=; b=I8oG6b5Jtimn7j
	2eWNFiFSi6nH66rLNH/PCKypf0Eiz2CIeKwmMjI/AYj2q8CxCuUv83Ms1v36Uy3dDKQLm7MjD0RD5
	Jjqeq6CQoaIWnRwuj2f/390Dt0o9vOp5Tr+AmRn2nrsaZZuus0nJGSW8ftgRgSSPJj6vp6X4umXbw
	2iusA1KOgo/numLkPYgj+mM3xTwbABCpztA3DFOOqJqABjV2tANfWeoLBMvo1dH370s2VrQKTSl3R
	v+8vCx7+BMb15eXGOn9UnCdwAcjIMpZaeEK6AaQSA06z9dK6u3d9mNalVBWUFPh2o2wiYl7AQfLmH
	h6RC7E7HRk3dLM3UqzzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJt6A-0006wZ-Dh; Tue, 06 Nov 2018 04:36:18 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJt67-0006vF-9Z
 for linux-riscv@lists.infradead.org; Tue, 06 Nov 2018 04:36:17 +0000
Received: by mail-pg1-x543.google.com with SMTP id z10so3361776pgp.7
 for <linux-riscv@lists.infradead.org>; Mon, 05 Nov 2018 20:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2ZO7f7AbR0Q/Tv9r9GFR6EhQOtVlvtqVzi+kHQIwd6Q=;
 b=vFP1Hs1wYQcIlWGzK/RquQm7mPiYOK37zkYc9g7HM5f1UakBrd0LproiSxWxB+J+cw
 LwUgBiOgB/Mof2uCb5M7ypmLMYM7sa/OYV8c2R4EJZNkyEzkll/fFaiA1VN/bVpLQDnv
 N2x7os/SUx/84UCqqI0dyLJ344I+8ENkn6mEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2ZO7f7AbR0Q/Tv9r9GFR6EhQOtVlvtqVzi+kHQIwd6Q=;
 b=egObMjl92saLh/683OMGGpxsk/PBmHI57kpsh2AquxRrk89cpNX6PdrXnINBiHRRtv
 PBiodZlAJOHQyZGBvSjCO9tAQAWyD7kHgos4j6nyP0SE4rpbp3iSLaeNxmMfkIgwjPVe
 9tFlOsIDuSrxP9L+9PbhMpdiIgu2OmT6krjMpX2PHQJ/XPc+ZBYgCRKm+ov/6tZCY42Q
 /Z6RL2RUTcf6DZVYWJajxWGqIbwLBRxbqVxKHtJ3ZLsOgFDY/qmlDhdQaxJQ3n26hNXc
 Hv6zuX6D4LvoCKbRyHqgaIx6CqL0ChOOXtTvB1Cv36fM6O7GnhZlr41KczlXSCSPUmZF
 ZNqA==
X-Gm-Message-State: AGRZ1gKW16mtnPUlyGE5W5WMMNqc1Ca5ni0C0va43trT1xVS2ya8O8AK
 uSvx7cw1q8UNIQbzdmEjrrafDA==
X-Google-Smtp-Source: AJdET5ecnHmWHapBSfgQDaRa+d8XuLQo3dJlBpesDCXVYTiF4QhB2rt8xq4tK8y9MBGhfwYqJFpEjQ==
X-Received: by 2002:a63:5ec6:: with SMTP id
 s189mr21579640pgb.357.1541478962566; 
 Mon, 05 Nov 2018 20:36:02 -0800 (PST)
Received: from localhost ([2620:0:1000:1601:3aef:314f:b9ea:889f])
 by smtp.gmail.com with ESMTPSA id c87-v6sm43985294pfe.93.2018.11.05.20.36.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 05 Nov 2018 20:36:01 -0800 (PST)
Date: Mon, 5 Nov 2018 20:36:00 -0800
From: Joel Fernandes <joel@joelfernandes.org>
To: William Kucharski <william.kucharski@oracle.com>
Subject: Re: [PATCH -next 0/3] Add support for fast mremap
Message-ID: <20181106043600.GB139199@google.com>
References: <20181103040041.7085-1-joelaf@google.com>
 <6886607.O3ZT5bM3Cy@blindfold>
 <e1d039a5-9c83-b9b9-98b5-d39bc48f04e0@kot-begemot.co.uk>
 <20181103183208.GA56850@google.com>
 <D6FB3C15-A8C1-4694-A434-A7489F590E05@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D6FB3C15-A8C1-4694-A434-A7489F590E05@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181105_203615_331809_1368D738 
X-CRM114-Status: GOOD (  21.94  )
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
Cc: linux-mips@linux-mips.org, linux-m68k@vger.kernel.org,
 Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, lokeshgidra@google.com,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, elfring@users.sourceforge.net,
 Jonas Bonn <jonas@southpole.se>, kvmarm@lists.cs.columbia.edu,
 dancol@google.com, linux-ia64@vge.kvack.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-xtensa@linux-xtensa.org,
 Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>,
 r.kernel.org@lithops.sigma-star.at, hughd@google.com,
 "James E.J. Bottomley" <jejb@parisc-linux.org>, kasan-dev@googlegroups.com,
 Anton Ivanov <anton.ivanov@kot-begemot.co.uk>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, Sam Creasey <sammy@sammy.net>,
 Fenghua Yu <fenghua.yu@intel.com>, linux-s390@vger.kernel.org,
 Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Julia Lawall <Julia.Lawall@lip6.fr>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, nios2-dev@lists.rocketboards.org,
 "Kirill A. Shutemov" <kirill@shutemov.name>, Stafford Horne <shorne@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, Chris Zankel <chris@zankel.net>,
 Tony Luck <tony.luck@intel.com>, linux-parisc@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, pantin@google.com,
 LKML <linux-kernel@vger.kernel.org>, minchan@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org,
 Ley Foon Tan <lftan@altera.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181106043600.3rZQz24C_x8Ju6aSPg_gbIZdyaiTEHH8pNu3muGmygA@z>

On Sun, Nov 04, 2018 at 12:56:48AM -0600, William Kucharski wrote:
> 
> 
> > On Nov 3, 2018, at 12:32 PM, Joel Fernandes <joel@joelfernandes.org> wrote:
> > 
> > Looks like more architectures don't define set_pmd_at. I am thinking the
> > easiest way forward is to just do the following, instead of defining
> > set_pmd_at for every architecture that doesn't care about it. Thoughts?
> > 
> > diff --git a/mm/mremap.c b/mm/mremap.c
> > index 7cf6b0943090..31ad64dcdae6 100644
> > --- a/mm/mremap.c
> > +++ b/mm/mremap.c
> > @@ -281,7 +281,8 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
> > 			split_huge_pmd(vma, old_pmd, old_addr);
> > 			if (pmd_trans_unstable(old_pmd))
> > 				continue;
> > -		} else if (extent == PMD_SIZE && IS_ENABLED(CONFIG_HAVE_MOVE_PMD)) {
> > +		} else if (extent == PMD_SIZE) {
> > +#ifdef CONFIG_HAVE_MOVE_PMD
> > 			/*
> > 			 * If the extent is PMD-sized, try to speed the move by
> > 			 * moving at the PMD level if possible.
> > @@ -296,6 +297,7 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
> > 				drop_rmap_locks(vma);
> > 			if (moved)
> > 				continue;
> > +#endif
> > 		}
> > 
> > 		if (pte_alloc(new_vma->vm_mm, new_pmd))
> > 
> 
> That seems reasonable as there are going to be a lot of architectures that never have
> mappings at the PMD level.

Ok, I will do it like this and resend.

> Have you thought about what might be needed to extend this paradigm to be able to
> perform remaps at the PUD level, given many architectures already support PUD-mapped
> pages?
> 

I have thought about this. I believe it is doable in the future. Off the top
I don't see an issue doing it, and it will also reduce the number of flushes.

thanks,

- Joel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
