Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08535CCD1BF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 07:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BFeJ0v39/0rpSOqtZZ/jO/tSHyxO1BlPK3XqEJW8gCY=; b=d0aFY7GTpDNu1B
	2/AeXwSIkZh2dVxW972P/O4UfoyEvxOBJi247QmJmAFDZSKdLWdedIjoYE9Kf1pHOt5mCUynFCV6A
	io6jpYf9eGhjRgdtBrjNqAT+yi8chX+1rXUHiV++XzlovM8l7K4rh3NF5wv83Lta+cb7hjnnsaAT8
	FBzvMbiF7KPUogHaM1NjP2QNh3B8cwKcZyF+8fzFpcQcO2HBj7JuNxhiiW0QPRe+wTTiPzM1ITqqq
	jFT2sck4wmNqZAjfkvIKZf/krpwWruHVN52xKsx1RqtVCPhk1rz/WLZIkp69G0rwz05V3hEto/Ie8
	osqqSt3OgRpGMXg3eRyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCYUh-0000000B4EC-3Beg;
	Sat, 25 Oct 2025 07:15:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCYUf-0000000B4Dq-2heR
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 07:15:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 95DA2417F2;
	Sat, 25 Oct 2025 07:15:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1AD2C4CEF5;
	Sat, 25 Oct 2025 07:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761376516;
	bh=xk5wGA7YzQyhSJOIloUEEN8B+/4+jX+OfkebTt5KUMc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Dtqs4k+YJTg9+aS8n9Jcy4T8TIFIOS/BNLwX7RDyLLVGGN3o2Fwr2wC8fFu06Tqdv
	 0UDFWO+wkzdNoWt4yTE1fecwekaZCO8cauqXIvH3AtKtprRqOA50XSeO0vwVHNyWHi
	 2bU8ra7Za+A7xDuWNgIsPgGish/PiydgCr4Muqy5hO0sMlV7gA0iyWq80AiLB60PND
	 wkNmWqjiTBnCsj/U0O22jiXIMpDpN047NAxdigGmt+mY4A91/4gqnsVvCX32s9+wgk
	 UHtPf60PecjW6KemZqOT+0fiw3Mb+hRO4dQs+tHEjAiaUDPrXTDif6dGb89NHOTSkZ
	 H1hqh1/yoLguA==
Date: Sat, 25 Oct 2025 01:15:12 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Josephine Pfeiffer <hi@josie.lol>
cc: pjw@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
    aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] riscv: ptdump: use seq_puts() in pt_dump_seq_puts()
 macro
In-Reply-To: <20251019140711.63664-1-hi@josie.lol>
Message-ID: <ab17be2e-202e-e34e-21f8-c865aff4024f@kernel.org>
References: <2eaeaa69-b2cf-3a3a-0239-2aefcaa836aa@kernel.org> <20251019140711.63664-1-hi@josie.lol>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_001517_724271_F0190EAB 
X-CRM114-Status: GOOD (  24.89  )
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

On Sun, 19 Oct 2025, Josephine Pfeiffer wrote:

> On Sat, 18 Oct 2025, Paul Walmsley wrote:
> 
> > Hard to accept that it's a performance issue.  But I think you're right
> > that generating a newline should be done with seq_puts().
> 
> Fair point. I'll drop that from the commit message.
> 
> > A better fix would seem to be to just get rid of pt_dump_seq_puts().  It's
> > only used once in arch/riscv.
> >
> > Taking a broader view, both pt_dump_seq_puts() and pt_dump_seq_printf()
> > look completely pointless.  Is there any argument for keeping them?
> 
> Good question. I investigated the git history and current usage:
> 
> The macros were introduced in commit ae5d1cf358a5 ("arm64: dump: Make the
> page table dumping seq_file optional") to support passing NULL for the
> seq_file parameter. This is used by ptdump_check_wx() for CONFIG_DEBUG_WX,
> where the kernel walks page tables to check for writable+executable pages
> without outputting anything to userspace.
> 
> All four architectures use this pattern in ptdump_check_wx():
> 
>   arch/arm64/mm/ptdump.c:341:         .seq = NULL,
>   arch/arm/mm/dump.c:456:             .seq = NULL,
>   arch/riscv/mm/ptdump.c:378:         .seq = NULL,
>   arch/s390/mm/dump_pagetables.c:197: .seq = NULL,
> 
> However, you're right that the utility of these macros varies:
> 
> Usage of pt_dump_seq_puts():
> - arm64: 1 use
> - ARM: 0 uses
> - riscv: 1 use
> - s390: 3 uses
> 
> Note: ARM defines pt_dump_seq_puts() but never uses it - that macro
> could be removed entirely.
> 
> Usage of pt_dump_seq_printf():
> - arm64: 6 uses
> - ARM: 7 uses
> - riscv: 6 uses
> - s390: 5 uses
> 
> For RISC-V specifically, I agree the single use of pt_dump_seq_puts()
> could be replaced with an inline conditional. For pt_dump_seq_printf(),
> the macro does save some repetition (6 uses vs 1 macro definition).
> 
> pt_dump_seq_printf() could also be questioned - removing it means 20+
> inline conditionals across all architectures. I focused on the minimal
> fix, but happy to tackle the larger refactor if preferred.
> 
> Would you prefer:
> 
> Option A) Remove pt_dump_seq_puts() entirely from riscv and replace the
> single use with:
>   if (st->seq)
>     seq_puts(st->seq, "\n");
> 
> Option B) Keep the macro for consistency with other architectures, but
> fix the bug
> 
> I'm happy to send a v2 with either approach. If Option A, I could also
> propose similar cleanups for arm64 (1 use) as a follow-up.

Thanks for investigating further.  I just queued your original patch; I 
think that's the simplest way forward.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
