Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4568FFF886F
	for <linux-riscv@archiver.kernel.org>; Fri,  1 May 2026 02:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VUgGbRn1kLwPUdsUvgIxQG8/9OuuDedvT3yLlkXT83w=; b=HmyE6mqV6b19m3
	xEFgmMLnXR8rOMFVOhPwclD+rkonr9krtRUepe7PAtcEG0J/Y5jgDmBAXuGwTsdMYFcsuZf4GGWqZ
	OQsORWpkS3lJRjvaGAGWn2v6EWVMC/HjZdsDllH9rPzcYPaXSoPqiIZkb8XaXne13Dgg+aXYoLB+9
	fpjXtqVLi9j02d31Xf7TVyIlYNptOCBdiixSN01ZgHLVzYe3P6YeyMYoVgobCTJVkrvU91En6T2gq
	ND9e8V/axP/w4o02m7rEsPBNvFJWyyU48PEu04xZcsTw4MJe6Q1jfxAz51KAJmtm4Fq/q/MFBA5o5
	M+Awo4hxJff542CreGyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIdG4-00000006ErS-2Das;
	Fri, 01 May 2026 02:05:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIdG1-00000006Er9-3FUr
	for linux-riscv@lists.infradead.org;
	Fri, 01 May 2026 02:05:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D801A42A57;
	Fri,  1 May 2026 02:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA2FC2BCB3;
	Fri,  1 May 2026 02:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777601132;
	bh=FfNzHKCzWM5qOuj6/OdGw2uNcDY9IOAH0R6ZHmLTHvU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qQWN3kymasnI7PWAo8rAMcUZhcym3LANYUBJQpVw1+yvW+sF15UrwCcb1IQn0W6Bw
	 sLWdXAYoxCnhRvSSbH4LTutOWeKhIkfldRATJFXSNfnXp3v0Qb1qdWYkCcixMfyWM5
	 FwdfH3X4+iPL9kZPTIU88yqapPnYMutv11I2ZyQZ2V+H+vE4aCEKOTHpxlxH26oqGk
	 jvo8z1/XBDQHLzU8xug1ZJF1vfffhCLZdpzQ8WkwogwT25dJktSWyBkIUDB0GFV96w
	 FwFH80o1ZNEGqAuMzQcoZMyKBkeXLfhsMGVi2RZJieCU8SSw05VNYNQ/2oSjLyBvvo
	 5y55H4FLNeItw==
Date: Thu, 30 Apr 2026 20:05:23 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Michael Neuling <mikey@neuling.org>
cc: =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, 
    "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
    "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, 
    Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
    Aleksandar Rikalo <arikalo@gmail.com>, Alexandre Ghiti <alex@ghiti.fr>, 
    Andrew Jones <ajones@ventanamicro.com>, 
    Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
    David Hildenbrand <david@redhat.com>, 
    Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
    Guo Ren <guoren@kernel.org>, Junhui Liu <junhui.liu@pigmoral.tech>, 
    Kevin Brodsky <kevin.brodsky@arm.com>, Lorenzo Stoakes <ljs@kernel.org>, 
    Nam Cao <namcao@linutronix.de>, Oleg Nesterov <oleg@redhat.com>, 
    Oscar Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Paul Walmsley <pjw@kernel.org>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, 
    Raj Vishwanathan4 <rvishwanathan@mips.com>, linux-kernel@vger.kernel.org, 
    linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/5] riscv: ptrace: Fix register corruption in
 compat_riscv_gpr_set on error
In-Reply-To: <20260409091143.1348853-3-mikey@neuling.org>
Message-ID: <78b4e931-9ec7-14b6-1487-906652a65ce8@kernel.org>
References: <20260409091143.1348853-1-mikey@neuling.org> <20260409091143.1348853-3-mikey@neuling.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_190533_833990_C1297E1A 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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

Hi Mikey,

On Thu, 9 Apr 2026, Michael Neuling wrote:

> compat_riscv_gpr_set() calls cregs_to_regs() unconditionally, even when
> user_regset_copyin() fails. Since cregs is an uninitialized stack
> variable, a copyin failure causes uninitialized stack data to be written
> into the target task's pt_regs, corrupting its register state and
> potentially leaking kernel stack contents.
> 
> Only call cregs_to_regs() when user_regset_copyin() succeeds.
> 
> Fixes: 4608c15959 ("riscv: compat: ptrace: Add compat_arch_ptrace implement")
> Signed-off-by: Michael Neuling <mikey@neuling.org>
> Assisted-by: Cursor:claude-4.6-opus-high-thinking

Thanks.  I'm wondering if we have the same issue in 
compat_restore_sigcontext().  Care to add that to your patch if you agree?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
