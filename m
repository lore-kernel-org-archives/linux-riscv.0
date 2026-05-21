Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736E1CD5BAF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 21:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F0dAkPJm3kytRkq5OUigm0EmcCV4LQo68Di91HZGNyA=; b=nIXNGragJrX8U9
	MBbZWGxHV2fFg4xi/mVVRG3c9G6Bx0UMLHqGR//1RdJczVbNQlm/krg/qUvqOfhxpJC+rur2+iNx4
	xS6YIxJZkKBrS+8+3/piiZOLE+LJI8oEAYSqvxDmWkp04l5usxr8uuC/ATvcj2Ntwg+BxNgCB2aw6
	+WSNZ1xzM26t8HcSQmqqZh7lgT0f7oluIrQR9pzO7/iqYNrNVdvS4aC1IX6LJCslRVFo91NGs5k/Z
	loWikWk/OYPpOhE41Md19QIcRueLw0k9zPLLqXKezlPZZIj4GW6myjd4DQ6HczV7tlh0RnhUwkL7x
	v0iHURYjdN1UtYNoKm/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQBP6-00000009Awo-0VL4;
	Thu, 21 May 2026 21:58:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQBP2-00000009Avu-493J
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 21:58:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F2D1642B60;
	Thu, 21 May 2026 21:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF0A1F000E9;
	Thu, 21 May 2026 21:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779400683;
	bh=8WE6if+wLI2gYZBQrnON+xs9MINnS1FYTnSN4CJZVRE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=lc8pWsbiUfhFAMONJASMWyilul+V42F7RTYLrdDD52xZdOn+Ye4Mr7pGGZ4xWOQns
	 WVtk21KqlPPKkKSes/IPPFrRn2spoZPOqU4ok3fqJn5Uca8oIB+xWQErjJZOke1hEF
	 fSNrLbJxPw+5TN1G3Z8Z9b0SJyjlMAu053XNHscjX9TzkzeLR3TIvSwKK0UOeZwSXC
	 o0bfN5Ydqfx1MvXcJMotUMfR/7e4CXwiEDZT2UTnWj+PVFsZ8EIxhLcayLxb+Sq8Hn
	 8S5QvpX2ktyi0iRqrFwZnsPAU18zCNitfHV+l2qZl5NPoCQqljOEJj/MWpYCcAxJq+
	 21ZOGVlTHH00A==
Date: Thu, 21 May 2026 15:57:59 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Marco Elver <elver@google.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Implement _THIS_IP_ using inline asm
In-Reply-To: <20260521000436.3931067-1-elver@google.com>
Message-ID: <c860d9bf-2e02-ca67-ca8e-c120dc72cb54@kernel.org>
References: <20260521000436.3931067-1-elver@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_145805_052040_40497531 
X-CRM114-Status: GOOD (  10.69  )
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

On Thu, 21 May 2026, Marco Elver wrote:

> Both GCC [1] and Clang [2] consider the generic version of _THIS_IP_ to
> be broken:
> 
>         #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
> 
> In particular, the address of a label is only expected to be used with a
> computed goto.
> 
> While the generic version more or less works today, it is known to be
> brittle and may break with current and future optimizations. For
> example, Clang -O2 always returns 1 when this function is inlined:
> 
>         static inline unsigned long get_ip(void)
>         { return ({ __label__ __here; __here: (unsigned long)&&__here; }); }
> 
> Fix it by overriding _THIS_IP_ in <asm/linkage.h> (which is included by
> <linux/instruction_pointer.h>) using an architecture-specific inline asm
> version. Additionally, avoiding taking the address of a label prevents
> compilers from emitting spurious indirect branch targets (e.g. ENDBR or
> BTI) under control-flow integrity schemes.
> 
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071 [1]
> Link: https://github.com/llvm/llvm-project/issues/138272 [2]
> Signed-off-by: Marco Elver <elver@google.com>

Thanks, queued for v7.2.

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
