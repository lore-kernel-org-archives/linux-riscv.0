Return-Path: <SRS0=LzlR=MY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5343C6783C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 16:47:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC91F20659
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 16:47:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qdl/+I5s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="KQEzQQFk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC91F20659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5HaYAyoWv48myR0VPnGU0Gem/1qC4FfFysukIafcNzM=; b=Qdl/+I5soUqWfz
	5s1rtk/1We6UDpNEuRVej49IgK+g7d+kF83TLCkqPL3X16Qv1v6BgrQkGiWCr6a6MsyLS0cnFE3nu
	8WwVUi2BLVuqjjguHvsYsrFiSp0S9u4jY0uSNql/gU5o7yMB+hd+JZPumn24Me93ZiYmRRNXaLjwR
	oWwngsoI+TZr0G+JQ37uduyf9VzYN3qc0n6cGt3vIfjOeDObIcgyvXGqJZ4HAZ2h7eLLZfIa/N6Y0
	DJGPevcGCzC/ttb7W316AKUyuUgQ7Zd03SNrJbQwfZUODAsjoBdfGt829CsHY75+jDliSjRspvFuB
	msTmpls8i1MpuBsRAUNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gB0ap-00034z-9R; Fri, 12 Oct 2018 16:47:15 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gB0aY-0002zH-Eo
 for linux-riscv@lists.infradead.org; Fri, 12 Oct 2018 16:47:11 +0000
Received: by mail-pg1-x542.google.com with SMTP id y18-v6so6117672pge.0
 for <linux-riscv@lists.infradead.org>; Fri, 12 Oct 2018 09:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Umti8berIQqjm65Zoyf/w3JloUMrJhwZUXe+Y2BsWdc=;
 b=KQEzQQFkI6jyKow9cNxsGELIJZyLx1I8uGjB/QnyLtJkOtbntdWVJwS8u0cqFmWoK2
 Zbax90aSm2shdb707DdFjVreJBouZPwsGgrwGCldaGV6mLKNDvduyzCfqgYYC5kplbyd
 Z9GrlBVjP7KcXBEbZpZjy43C4pR8q7gp8Lu8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Umti8berIQqjm65Zoyf/w3JloUMrJhwZUXe+Y2BsWdc=;
 b=R6K18YKANvFdhkvUNYbdGcYUZ1xKlxO51dlcjBk/bRdIYo464tZCiyD/cJGX2Y2Oms
 E3CvRcRALcbFH+JzYn9fQOF1F/C9v9Rfu97ngXNQ+GrDKtyMgyGqPIp4iRFa/2O+rkp/
 /q11PKVs/QmUMBAXWy8QWik42RoeOd38/UjIcQH7JevGVihhSOT1loL4zt5IHCzc6HIS
 l+HUDqCTuerWrvTgVNLsHjAWR2WlXyK0nIS/7qQvD9/0ZSJZ++gU8OLhQfExgUN8gTKV
 FXslscLMJBVpt7Qt3kVqfHBwzSyF9J1r2yRy08BynjyuIROKI+Jd9mBwXTra8K71FjzK
 JPRQ==
X-Gm-Message-State: ABuFfoiLGKZzu2BWtsgAYXRAJ/b+5ndvUWTxIWhN67D/fqAPgqLxfk2z
 jBcJKLIW5kH4f1dEmFSDKJK+Ag==
X-Google-Smtp-Source: ACcGV609gsys33zC1Yow1z87yTnxpouPc78UFZGuqi9n2/9mNvSopecla0EDsZWt+bvQnXlM2xKVdQ==
X-Received: by 2002:a63:991a:: with SMTP id
 d26-v6mr6276510pge.434.1539362807192; 
 Fri, 12 Oct 2018 09:46:47 -0700 (PDT)
Received: from localhost ([2620:0:1000:1601:3aef:314f:b9ea:889f])
 by smtp.gmail.com with ESMTPSA id g62-v6sm3310692pgc.22.2018.10.12.09.46.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 12 Oct 2018 09:46:45 -0700 (PDT)
Date: Fri, 12 Oct 2018 09:46:44 -0700
From: Joel Fernandes <joel@joelfernandes.org>
To: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH v2 1/2] treewide: remove unused address argument from
 pte_alloc functions
Message-ID: <20181012164644.GC223066@joelaf.mtv.corp.google.com>
References: <20181012013756.11285-1-joel@joelfernandes.org>
 <594fc952-5e87-3162-b2f9-963479d16eb3@kot-begemot.co.uk>
 <20181012163433.GA223066@joelaf.mtv.corp.google.com>
 <alpine.DEB.2.20.1810121838180.4366@hadrien>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1810121838180.4366@hadrien>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181012_094658_547333_3F9DF097 
X-CRM114-Status: GOOD (  11.96  )
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
 Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, lokeshgidra@google.com,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 elfring@users.sourceforge.net, Jonas Bonn <jonas@southpole.se>,
 linux-s390@vger.kernel.org, dancol@google.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 hughd@google.com, "James E.J. Bottomley" <jejb@parisc-linux.org>,
 kasan-dev@googlegroups.com, Anton Ivanov <anton.ivanov@kot-begemot.co.uk>,
 Ingo Molnar <mingo@redhat.com>, kvmarm@lists.cs.columbia.edu,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, Sam Creasey <sammy@sammy.net>,
 linux-xtensa@linux-xtensa.org, Jeff Dike <jdike@addtoit.com>,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 kirill@shutemov.name, Stafford Horne <shorne@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>, Tony Luck <tony.luck@intel.com>,
 linux-parisc@vger.kernel.org, pantin@google.com, linux-kernel@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, minchan@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Richard Weinberger <richard@nod.at>,
 nios2-dev@lists.rocketboards.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Ley Foon Tan <lftan@altera.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181012164644.o38Spr-YeM28b_FsVwIVvseCr0qBCKm4sequEC42SoI@z>

On Fri, Oct 12, 2018 at 06:38:57PM +0200, Julia Lawall wrote:
> > I wrote something like this as below but it failed to compile, Julia any
> > suggestions on how to express this?
> >
> > @pte_alloc_func_proto depends on patch exists@
> > type T1, T2, T3, T4;
> > identifier fn =~
> > "^(__pte_alloc|pte_alloc_one|pte_alloc|__pte_alloc_kernel|pte_alloc_one_kernel)$";
> > @@
> >
> > (
> > - T3 fn(T1, T2);
> > + T3 fn(T1);
> > |
> > - T3 fn(T1, T2, T4);
> > + T3 fn(T1, T2);
> > )
> 
> What goes wrong?  It seems fine to me.

Weird it seems working now. I could swear 5 minutes ago it wasn't and I did
give a unique rule name. Don't know what I missed.

Anyway, thank you for all the quick responses and the help!

- Joel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
