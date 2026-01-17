Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8A3C9830E
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 01:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z5QZNybBrXpG2EplgxzMVr/zI9bsJvsV7Kc7aiU4/wE=; b=eZBDwTmSYb0Jwr
	Xnh7srVOVVBUQxn4vgUIAob+xx0Agdo3eg9qRorGb0QM5nM0KzaRI9fCurf3du9ChfvVctGLkoFZt
	fuAvcfcvT3vogYgej3x9eC103fWdtUZpkANb4t4t46r6d/QsUF81RT3U/D4jWO4G3qFTYrECCyLFR
	ZW+HZTrxjMY40txEFWDbLl07fkRbmMbb25kds5TeSe+u0YFpEGsGRtyhi399Z07+IlNYhGsXGAWTw
	U8yb8IgLUspWtguYLelkkqlle6xgtgVr0G7Qtg85l6OsLFW2vXBjwvxiz77/0KA6QROunpejnjvem
	Vdcdu6CJZlVyxuceeO8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgvSG-0000000F6gB-49Os;
	Sat, 17 Jan 2026 01:50:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgvSF-0000000F6g4-1vvF
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 01:50:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 87AE060127;
	Sat, 17 Jan 2026 01:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16477C116C6;
	Sat, 17 Jan 2026 01:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768614618;
	bh=HHh9ZV1eeKj6Trg9Xh2+VW3se7+1zby2EC8XLucq688=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AWypVmm5pwqFAv2V3e/333t+Ir+t/lcrorNRjhvzfDOryD1wRmvKvyk3SKQIbNMaQ
	 1vnVtpJohJKIarJxJpFEd1AwRsHxFzX2k+7DM7/aRtoBJI9WeSsvwQIiJ7J3INHr8p
	 cyu6TK5x3KS+4OP+iYvFATB/+KQHX4qAteNgH+sDEUcI+IXN4z6qXAnr/zx/JpBEhH
	 C9yfNm2E07VcrvDv2vi0diAE1cqloKcYLgGQGVuisLacwr6bV/ShKrPcRP1pxgCG4c
	 HhX/YR4NoSpSnTcCcoFAbiT2jVxgC9+bnX8ezrGRnjNH1lQ9XhclKsa0I23ODWM1tt
	 1ivln/KfkzNgw==
Date: Fri, 16 Jan 2026 18:50:14 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>
cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
    Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
    Gary Guo <gary@garyguo.net>, Paul Walmsley <pjw@kernel.org>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Yury Norov <yury.norov@gmail.com>, 
    Rasmus Villemoes <linux@rasmusvillemoes.dk>, Chao-ying Fu <cfu@mips.com>, 
    Aleksandar Rikalo <arikalo@gmail.com>, 
    Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
    linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
    torvalds@linux-foundation.org, olof@lixom.net
Subject: Re: [PATCH] riscv: support CPUs having only "zalrsc" but no
 "zaamo"
In-Reply-To: <20260114072552.731974-1-vladimir.kondratiev@mobileye.com>
Message-ID: <8afa0702-4d30-86e2-5afb-a7c113a92dec@kernel.org>
References: <20260114072552.731974-1-vladimir.kondratiev@mobileye.com>
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

Hi,

On Wed, 14 Jan 2026, Vladimir Kondratiev wrote:

> riscv have 3 instruction set extensions related to atomic operations:
> - "zaamo": atomic instructions like AMOADD
> - "zalrsc": LR and SC instructions
> - "a" that is "zaamo" + "zalrsc"
> 
> Historically, "a" was first, and Linux was relying on "a";
> then "zaamo"/"zalrsc" was introduced. It is possible to implement
> most atomic operations with either AMO or LR/SC. AMO if more efficient
> however more complex flows are possible with LR/SC only.
> 
> Platforms supporting only part of atomics starting to appear.
> Notable is MIPS P8700 CPU [1] having only "zalrsc".

Are there any others?

Are development boards available yet for these kinds of designs?

> CPU reports ISA extensions supported in the "riscv,isa-extensions"
> property of the CPU OF node. Platform supporting "zalrsc" only should
> report "zalrsc" but no "a" in this property.
> 
> For the early stages of execution, before alternatives applied,
> (ex: head.S) CPUs having no "zaamo" extension rely on firmware
> emulating AMO through "invalid instruction" trap to the M-mode.
> 
> Speed-up the rest of execution using ALTERNATIVE,
> replacing AMO versions with LR/SC ones
> 
> Implementation is generic, inspired by the patch [2]
> by developers listed below, implementing similar patch as errata
> for the MIPS P8700 CPU

This doesn't look like an erratum.  The designers of this core just chose 
not to implement A support in this CPU, and that's why that AMO_II bit 
exists in the mipsconfig6 register, correct?

> [1] https://mips.com/products/hardware/p8700/
> [2] https://lore.kernel.org/all/20251014-p8700-zalrsc-v3-1-9d81bd8093e0@htecgroup.com/
> 
> Suggested-by: Chao-ying Fu <cfu@mips.com>
> Suggested-by: Aleksandar Rikalo <arikalo@gmail.com>
> Suggested-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

I guess the proposal here is for the upstream kernel community to weaken 
our A support requirement to support these special cores that only support 
LR/SC?  

If so, I suppose the question is, should anyone in the upstream kernel 
community care about this case?  It wouldn't be enough for the kernel 
alone to support this.  A special userspace would also be needed.

This looks like a variant of the big-endian issue discussed earlier, 
 
  https://lore.kernel.org/linux-riscv/CAHk-=wgfpswvq0TypePyjv3dofO5YaUC_fSd_MjzY7jogCUnCg@mail.gmail.com/

If we take these changes, it increases the complexity of the upstream 
kernel, and increases our testing matrix as maintainers (and, in theory, 
for any patch submitters, who should theoretically be testing their work 
on the configurations that we support).  It's not clear what the gain 
would be for the broader community.  As maintainers, we're already 
considering stripping out other code that doesn't seem to have significant 
community support, like no-MMU, for similar reasons.

On the other hand, if boards with Zalrsc-only cores seemed popular in the 
marketplace, and some sort of support existed in common userspaces, such 
that we could be sure that there was some sort of commitment to maintain 
this across the entire ecosystem, the discussion could be more favorable, 
I guess?

Palmer might have some other thoughts here.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
