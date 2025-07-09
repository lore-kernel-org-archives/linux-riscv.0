Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2F3C83F12
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 19:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jxtHj1A/Fg0wki42deZ1GoitNHpCYkbfn2Jif7ZPip4=; b=yCXlbmJXJPS/wl
	RuRIMiR++wm/jDHaoldzLt1A9COnVyBmKihcTpNiqfc9bn7WFw0RIN1d7b7KKtkw/7hZrAOzqFfql
	mQmfD6vDK8xOeBwYencBB+kpCBNcwM0IV97n15mngr8aqjvnJRyxYnzH+h3GHDdAjh+lHit8L5/Cf
	DxymwnkIvXyGQiWa45ZsdlaOYDfKaXuCF50tSdcNtRO9IS5PrQEYdSg/SDyR83HrMkCXVaGJwPGcL
	Y9uXHRfenkCrAZkyREA1NikHtXuMVB/DIuzh87dkNfyc3tIuO73dublraDTVfroQD1ji2jXb0fKc5
	/dXciJgfLbe6KU3jSXbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZaFi-00000009g7a-2iPe;
	Wed, 09 Jul 2025 19:14:46 +0000
Received: from smtprelay0012.hostedemail.com ([216.40.44.12] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXvW-00000009LFN-1y9f
	for linux-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 16:45:47 +0000
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id DF2F157E1F;
	Wed,  9 Jul 2025 16:45:40 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf01.hostedemail.com (Postfix) with ESMTPA id 0C5A460011;
	Wed,  9 Jul 2025 16:45:37 +0000 (UTC)
Date: Wed, 9 Jul 2025 12:45:36 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: alexghiti@rivosinc.com, mhiramat@kernel.org, Mark Rutland
 <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, rabenda.cn@gmail.com,
 wangruikang@iscas.ac.cn, ziyao@disroot.org
Subject: Re: [PATCH] riscv: ftrace: Properly acquire text_mutex to fix a
 race condition
Message-ID: <20250709124536.4ce3a90b@batman.local.home>
In-Reply-To: <mhng-6AFAE150-B97C-493D-9699-545AABAC78FD@palmerdabbelt-mac>
References: <20250708-alex-fixes-v1-1-5b008d3f4d0c@rivosinc.com>
	<mhng-6AFAE150-B97C-493D-9699-545AABAC78FD@palmerdabbelt-mac>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Stat-Signature: dbppecj37pgrgr3u6b58j3g43t3z69f5
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 0C5A460011
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18UUMhmi698+5oz7ltzhrraposOL8pK02w=
X-HE-Tag: 1752079537-42978
X-HE-Meta: U2FsdGVkX180JxbK93sOvlUDnb3OvLcohVzegobLEKocfOHmrAVGuLey7IEzNeauoVjMkrt8/FPTHMUlZRq0i/F3+H4KTwAsMbeus86KcB6dVwleMtJsfRmSAQDi5IKFYul6PZw7fYTZGkG1L60CJlkZz7d8Ep9nH3I6Oa45sv+5Clu+5c3wwnOIFlaH/dPFGCf/P9vkD2R/PoRW2AZikTv6zjr+lbizAuKNUSyrLJUTKmVTAPcdrR2I4Ih/zqHz9YqD65NPVkLdw2fE5CkvO2aoRGoxYNXduZ0GLyurW0IW2WS+7nOGLUF/0eHmu0mQLslKniVrItLW1dzjlikxFw9JkaJ/+W6fbrf79PNu6lldwbDO+vm+/pDBAYnyZbRVgKRK/GFqUXqrhLJSIoYGIAU89mjquIGM6P+8LfTJJdQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_094546_570321_45FC503D 
X-CRM114-Status: GOOD (  10.84  )
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

On Wed, 09 Jul 2025 07:12:47 -0700 (PDT)
Palmer Dabbelt <palmer@dabbelt.com> wrote:

> >  #ifdef CONFIG_DYNAMIC_FTRACE
> > +void ftrace_arch_code_modify_prepare(void)
> > +{
> > +	mutex_lock(&text_mutex);
> > +}
> > +
> > +void ftrace_arch_code_modify_post_process(void)
> > +{
> > +	mutex_unlock(&text_mutex);
> > +}  
> 
> IIRC there's a reason we don't do it this way, we had (or had tried to) 
> have it before.  It's been a while, though, and I'm just having some a 
> coffee so may I'm just wrong...

Yes, because it caused issues with stop machine[1], but if you are no
longer using stop machine, this should be what you should do now.

[1] https://lore.kernel.org/all/20220310045454.672097-1-changbin.du@gmail.com/

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
