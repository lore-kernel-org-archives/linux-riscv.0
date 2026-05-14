Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14010CD4846
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 04:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ptKzeuz3efuKKbBit2FoLgQq83i7cyyaBt+G8cfzBw=; b=ELJwFqrgC0TnkB
	P4wz8zOg013/Wkhv1CD8MALzMBYowkzheyBxN8qGhcd9q21w+IUQjpBNuRzYK4gBpfg0KHIdbkVFi
	ZDy3cnLy6FLAvQdedZBwuqW7Fq2/z9Vr7f8+2iFYcWs8OzDezG7A/DRNVxPXp2VzV9dCaUw2wU6As
	u/HtsFeH7/YCbuLxiAx4B3MhHDE1a3z9VEz47kuDWAyK/t3p5MvPcJ9toMmWzqBdCYNVUbW0cWP1k
	xneJPK3Iv+kl+Z0smlqxJBzUBm/eriVdPJwsjxLTNsglb1V5/r3ZmPqTNiW8K6jZvs6iu+jmgbdY5
	1BjepjUqeW+avW22BGpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNNiq-00000004Xhv-2ark;
	Thu, 14 May 2026 04:30:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNNin-00000004XhO-19j9
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 04:30:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 87F36444FE;
	Thu, 14 May 2026 04:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF15EC2BCB7;
	Thu, 14 May 2026 04:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778733052;
	bh=ixvoQlegkcO1L+9UtwK7CT8sYtpgRASkPGBszMTMo7I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AkdJkhlMp0kLrTIe8rwFvCjghzPLyk2+L2KHXtg+8pmpVG0KciPQyL8gnuP1D3xr1
	 B4iDW/FX2mN3VtJS7YszimvQl7w1+b0w6jHB1sVU2+AxvZHPyrybEboeYwoE1aCleq
	 /a6MhV6IWgbS8mo8FZZN25BlOoyVqcq1lJo1HV+VieLH/9fj4Lc/YftlsQdct0w54r
	 mXuNk75zaiwc55wIySIQhKlKto8cUyI897HuC3lDIuuLurFrf46ERsNo5/IUyoJV9S
	 LuE7qyjgFZrim1UmR/4f3wCDCyfEZJ7WPp2kuvnP1CqTy4aWeHIpEDpfR0rYUtJR6B
	 YTJJXB1iHvbWQ==
Date: Wed, 13 May 2026 22:30:50 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
cc: =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
    Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
    Songsong Zhang <U2FsdGVkX1@gmail.com>
Subject: Re: [PATCH v2] riscv: misaligned: Make enabling delegation depend
 on NONPORTABLE
In-Reply-To: <20260401-riscv-misaligned-dont-delegate-v2-1-5014a288c097@iscas.ac.cn>
Message-ID: <ed77660c-84d2-ce2f-3b21-01a3309ed997@kernel.org>
References: <20260401-riscv-misaligned-dont-delegate-v2-1-5014a288c097@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_213053_791350_C5A3A11D 
X-CRM114-Status: GOOD (  11.44  )
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

On Wed, 1 Apr 2026, Vivian Wang wrote:

> The unaligned access emulation code in Linux has various deficiencies.
> For example, it doesn't emulate vector instructions [1] [2], and doesn't
> emulate KVM guest accesses. Therefore, requesting misaligned exception
> delegation with SBI FWFT actually regresses vector instructions' and KVM
> guests' behavior.
> 
> Until Linux can handle it properly, guard these sbi_fwft_set() calls
> behind RISCV_SBI_FWFT_DELEGATE_MISALIGNED, which in turn depends on
> NONPORTABLE. Those who are sure that this wouldn't be a problem can
> enable this option, perhaps getting better performance.
> 
> The rest of the existing code proceeds as before, except as if
> SBI_FWFT_MISALIGNED_EXC_DELEG is not available, to handle any remaining
> address misaligned exceptions on a best-effort basis. The KVM SBI FWFT
> implementation is also not touched, but it is disabled if the firmware
> emulates unaligned accesses.
> 
> Cc: stable@vger.kernel.org
> Fixes: cf5a8abc6560 ("riscv: misaligned: request misaligned exception from SBI")
> Reported-by: Songsong Zhang <U2FsdGVkX1@gmail.com> # KVM
> Link: https://lore.kernel.org/linux-riscv/38ce44c1-08cf-4e3f-8ade-20da224f529c@iscas.ac.cn/ [1]
> Link: https://lore.kernel.org/linux-riscv/b3cfcdac-0337-4db0-a611-258f2868855f@iscas.ac.cn/ [2]
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

Thanks, queued for v7.1-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
