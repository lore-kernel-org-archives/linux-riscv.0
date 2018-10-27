Return-Path: <SRS0=itc2=NH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 364EEC46475
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 27 Oct 2018 10:21:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4BCC20856
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 27 Oct 2018 10:21:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YxyEcYJY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ab1knh/8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4BCC20856
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SrWrwwAalg7+LAxjCAz6rcXSvM88hAsG9/x7m1A6xbA=; b=YxyEcYJYcaiPJM
	aDJlb7jJ0WsT65fepgkNpxFQK6a0CLld1eHMG+s1epwUJx3ecoWaxEQ9SsBF4x6pb85afBX5Fwk1u
	8zZzRCFxbJiOexN9Wbvm0ffoSNG0iZCOwSdP+kZbnZp8QxVbI40VGaNDcfnjeqzHjCeLf5aVfNkj1
	izZsOQGAM+lAmfWip66rLumyDgJoBekJt3wxDtirs3LVWbzQsqXdrruhFEa50dMufl6LDlFWr1+zj
	1yFBDjd2girmkTGWeku0cHZ5JVz7K2X4UOzzquNUal3W+q1EssZQucCKxeP8fo0p6EFhhZKwxhIaM
	CvLYDJFHTTzOhlbjH8lQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gGLic-0004AK-UG; Sat, 27 Oct 2018 10:21:22 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gGLiZ-00049B-Lz; Sat, 27 Oct 2018 10:21:21 +0000
Received: by mail-pl1-x644.google.com with SMTP id f10-v6so1632484plr.1;
 Sat, 27 Oct 2018 03:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ytoc7E/E+CDN+36oMCq4ib7UWrIKwi1XigueqliThJE=;
 b=ab1knh/8i2Gpv4Vxfi+YDSBKbX/LgufE79cYPr5GJEdQUVQbI970thsDIy0ZjV1q0k
 ZSfcWvh4GTM9Brshk9p+y4tQ9MlVv9xCOgRN+Mkl3IacQhaurmJjOF4ISMav3UWSPWT0
 QDI4JUUMAIPA35q0/cXsitIc3ySa7+/5ANkq6TLz2UHPpSbIN1fzgNHsIaIbSC3XX++1
 mylMnA2ff0XDd2sL+yXZDHQHXijLBXi1MJNMHNoE52RFFgyL7H1Hr53le1mRs/9vRlLJ
 8fln4V5coK7PbseEtgyE6znLwjAsimR/DLzPXzQyaRXpcBZcO/1WMqn8CO3ILrNZhl0z
 +0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ytoc7E/E+CDN+36oMCq4ib7UWrIKwi1XigueqliThJE=;
 b=Lq6+b47hD2UKD5ywqwdhGkXh8LUNa+nwrSz/DFQnMsCKUd3/2aVP3JhRdgr8DJrVFq
 QY3PDd1eVBjEDPDyz6Hzju8AWA97DWuyG+TiTXwbxTawT9uCOT4OeMwLKMxrzDI9pN5d
 chxmFtwDTwr/ipKf3Pig8COSMd343MPyd3RW38qlQjNqOYDPVSiEW9XT/Bk7p1HfPJ8F
 EQxFVxjGGQnlqDsYdciAi3spusH/OGLYBh3bQavDUn+Fp1PUDLovkNhJz4q4KkEvya/c
 np5okdsNh5zUhik772yScEdyr9OJesG2SlzK9WxuTwOF0KzCZPwSflqul0kz0YatWelw
 J0XA==
X-Gm-Message-State: AGRZ1gIWZfTod4M0+ajRgc8jjDi3Jz/QaI0tzSm540ro6WuMuXBQaWZZ
 wkZExGkErEkWuuddlDvbdaE=
X-Google-Smtp-Source: AJdET5dClbYQTLuFDbJ+0gDgS5/Hrs1bQO5PPuAbjI+vFXrDoU6PrAD4ZO8YmfARdAwQaa7m0KGriw==
X-Received: by 2002:a17:902:76c3:: with SMTP id
 j3-v6mr6882579plt.339.1540635667807; 
 Sat, 27 Oct 2018 03:21:07 -0700 (PDT)
Received: from localhost (14-202-194-140.static.tpgi.com.au. [14.202.194.140])
 by smtp.gmail.com with ESMTPSA id
 z129-v6sm17506690pfb.40.2018.10.27.03.21.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 27 Oct 2018 03:21:06 -0700 (PDT)
Date: Sat, 27 Oct 2018 21:21:02 +1100
From: Balbir Singh <bsingharora@gmail.com>
To: Joel Fernandes <joel@joelfernandes.org>
Subject: Re: [PATCH 2/4] mm: speed up mremap by 500x on large regions (v2)
Message-ID: <20181027102102.GO8537@350D>
References: <20181013013200.206928-1-joel@joelfernandes.org>
 <20181013013200.206928-3-joel@joelfernandes.org>
 <20181024101255.it4lptrjogalxbey@kshutemo-mobl1>
 <20181024115733.GN8537@350D>
 <20181025021350.GB13560@joelaf.mtv.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181025021350.GB13560@joelaf.mtv.corp.google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181027_032119_727705_4260A1AA 
X-CRM114-Status: GOOD (  13.30  )
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
Message-ID: <20181027102102.O2ptzsZ4d0L2bULaqg9d5uN7K4LqUSIQwKK4dOHSsHY@z>

On Wed, Oct 24, 2018 at 07:13:50PM -0700, Joel Fernandes wrote:
> On Wed, Oct 24, 2018 at 10:57:33PM +1100, Balbir Singh wrote:
> [...]
> > > > +		pmd_t pmd;
> > > > +
> > > > +		new_ptl = pmd_lockptr(mm, new_pmd);
> > 
> > 
> > Looks like this is largely inspired by move_huge_pmd(), I guess a lot of
> > the code applies, why not just reuse as much as possible? The same comments
> > w.r.t mmap_sem helping protect against lock order issues applies as well.
> 
> I thought about this and when I looked into it, it seemed there are subtle
> differences that make such sharing not worth it (or not possible).
>

Could you elaborate on them?

Thanks,
Balbir Singh. 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
