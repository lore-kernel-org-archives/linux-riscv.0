Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2C7D3CC9E
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 01:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZtuFcElWB7bNU7Sru7bxiNUbYyfNiiU74rbBjwG7BYg=; b=Z6WfpWddVtoSQl
	bVlYRNZFVJGtv/ieC/Xy8ReRS01RgJOgL0xLSbKNBDxmWI2BAgpfp+J+wvgkwgFR9JJCS8TfrC9ON
	SjwTyYPPkU/igxLzv57jR6W5bZ4UkS7FS1gnm5RVJfxNu4X6WzpoRI9/wqL7JAibDG+kbEitpKir7
	X0oZGuK0n44jPuhKWhrENFcp1W3qYnNvO7FXsCGDEFt8LVlqp7nt0nF0Xh2eS2xrQMoi4K8a3n/Ob
	3+q2jDxkrNpmwS5O12CITgrhBiOughAsk/zro1nhB/T3+7aUkQd5cKeOv2qmdBAJLO7OtfvMq+GyE
	qfcThBseAKlGhVSZKsZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgCTC-0000000BRqY-2QzE;
	Thu, 15 Jan 2026 01:48:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgCTA-0000000BRqH-3FM9;
	Thu, 15 Jan 2026 01:48:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D867B60140;
	Thu, 15 Jan 2026 01:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A94FDC4CEF7;
	Thu, 15 Jan 2026 01:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768441695;
	bh=7HNAeMi2T/uDNpYQR9hHBVD/6+a8rzClGOYvvjwq8mw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KKjxxgi6pkvKqpGcosBI0OO8t4PlI3ToyT8DxeRAibOyZcKZmMUn/aXHm8KH1sRgr
	 5PgKnvrT0BuIUgLQ5a+/Xb/fZZYz89v/P6e0Hsh4CaZNLnZEZDhuMMilx8PYmo+yUF
	 nj7eXPBxh/Aa9qWVn2KMyX/zPzpSnamQQ2irxg6R5uVTEgVzS0+di5gpEwz5dsSVdV
	 QlgNGwsPb+J//L/F8DHXiJjq6DuYhCO90S+i5pErzyn7Aq1u54wGIfye2ooOYIlo5i
	 6K3mt5fk5GZ/K326+yXLPIzCB6fbaQAou8qL3lZXh4hwCwpPrx67C1ZPhZvlnn+jLt
	 33n9zp5e8gVjg==
Date: Wed, 14 Jan 2026 18:48:13 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
    Arnd Bergmann <arnd@arndb.de>
cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
    Peter Xu <peterx@redhat.com>, Oscar Salvador <osalvador@suse.de>, 
    Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH RESEND v2] asm-generic: Remove pud_user() from
 pgtable-nopmd.h
In-Reply-To: <61ef32ebc3ea2e926de2bebecf3b5c3a10989fca.1767720453.git.chleroy@kernel.org>
Message-ID: <d7d3d58e-8b48-ddca-1afd-d2181b2872c3@kernel.org>
References: <61ef32ebc3ea2e926de2bebecf3b5c3a10989fca.1767720453.git.chleroy@kernel.org>
MIME-Version: 1.0
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

Hi Arnd,

On Tue, 6 Jan 2026, Christophe Leroy (CS GROUP) wrote:

> Commit 2c8a81dc0cc5 ("riscv/mm: fix two page table check related
> issues") added pud_user() in include/asm-generic/pgtable-nopmd.h
> 
> But pud_user() only exists on ARM64 and RISCV and is not expected
> by any part of MM.
> 
> Add the missing definition in arch/riscv/include/asm/pgtable-32.h
> and remove it from asm-generic/pgtable-nopmd.h
> 
> A stub pud_user() is also required for ARM64 after
> commit ed928a3402d8 ("arm64/mm: fix page table check compile
> error for CONFIG_PGTABLE_LEVELS=2")
> 
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com> # riscv
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> ---
> Who should take this patch ? I expected it to be merged by Arnd as asm-generic maintainer but this is the second time I resend.
> 
> Should the patch go via riscv tree instead as the undue pud_user() was initialy introduced by riscv ?
> 
> v2: Change ARM64 pud_user macro to pud_user(pud)

This one looks like it should go upstream through you?

If you'd prefer arch/riscv to pick it up, let us know.


thanks,

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
