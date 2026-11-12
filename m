Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16E0606A321
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 04:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0O2B3DSQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kqhr12Mt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Je32Bbuw9obEIQqnXo1aFMYh3Bn1RMTNJg6mO1VLKzg=; b=0O2B3DSQmq3S45sMnR7qn263qt
	qn2yguX/6oZPzSlr3lTlAdHV7QML3bbWcFP/n0T5QQc47M/HDgt22eDTBVZQm8RXfS7VmQXTS58Gu
	yaUUEMmn14dXQBV8OMOPUH4BglHH8zKZRjJtRRJT6W7ttMsOuyCbtKQSpP0JodY67i5eJhadeE2wl
	cX7CInTJv96PAYa2NaDn/V+zjLtmnc16I7AMugCVzWo3WzsbWD1ex68yZ/v4gzo2mi5MAO5gs5614
	XHRa8LZ5OxoaGl/7WomehNm6AmAMrxsl8YgDDhMWH+unagruWzORO3dF9rTjOd9zdeBrtboHlsizs
	KRUg/euQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRMqX-00000008i5N-27MD;
	Thu, 12 Nov 2026 04:55:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRMqT-00000008i50-1Jbw;
	Thu, 12 Nov 2026 04:55:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A354745AD1;
	Thu, 12 Nov 2026 04:55:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D8501F00A05;
	Thu, 12 Nov 2026 04:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794459332;
	bh=f6DiOKeltQeZ7TB+jtdmAXbFdrOValtxf9JywtD8Mbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kqhr12MtulG4W3Vc40BFXJtR0kQMtkn1mqf98BGsC4FszMgVRPpUN92TefGOGvpZV
	 I8L67cCs2G66T+YINMKUjD2x6g6E9OhPOPrIMTo6KHNB703QJ2HAT8yiAl0WQLjg1T
	 szZmTQD7/klIr5UIaaXM+2HgcQVgeK5fpRP+zErU6uDJO4HPJbjW/apy1ZYpBMAdlJ
	 2RtXhHRTRBFGYJjqC8b3P6Pxvp14yzWR0gjW1S3fCte+hq7LGKKwSRzT2g/b1czpZR
	 +6wSryMNVkJ9hkrBarxUSWOovh0+MPpz0ecB+E/uiOaZsSItVxmn/TKaznO32pCcmi
	 /o/YTkQkzRGlQ==
Date: Thu, 12 Nov 2026 12:35:18 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/3] riscv: Align section markers with other archs
Message-ID: <avVCBs57OqqH7kVI@xhacker>
References: <20261111164345.4059964-5-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261111164345.4059964-5-ardb+git@google.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 05:43:46PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Patch #3 of this series was sent out as part of a EFI series [0] that
> implements generic support for carrying image info data inside the stub,
> and after Sashiko found another related issue, I decided to break it out
> into this series. IOW, patch #3 is a resend.
> 
> The point of these changes is to harmonize all architectures that
> support EFI in terms of the section markers, so that generic zboot code
> can refer to them without arch specific #ifdefs. Other generic tools
> probably benefit from this too. 
> 
> If the maintainers are onboard with this, kindly put it on a stable
> topic branch so I can refer to it from the EFI tree.
> 
> [0] https://lore.kernel.org/all/20261110121731.2728824-12-ardb+git@google.com/
> 
> Cc: Paul Walmsley <pjw@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Alexandre Ghiti <alex@ghiti.fr>
> Cc: linux-riscv@lists.infradead.org

For the series:

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

> 
> Ard Biesheuvel (3):
>   riscv: Use _stext not _text to denote the start of kernel code
>   riscv: Make _text point to the start of the kernel image
>   riscv: Rename __init_text_end to __inittext_end like other archs
> 
>  arch/riscv/include/asm/sections.h         | 2 +-
>  arch/riscv/kernel/image-vars.h            | 2 +-
>  arch/riscv/kernel/setup.c                 | 2 +-
>  arch/riscv/kernel/vmlinux.lds.S           | 6 +++---
>  drivers/firmware/efi/libstub/riscv-stub.c | 2 +-
>  5 files changed, 7 insertions(+), 7 deletions(-)
> 
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 
> 2.56.0.611.g1030f0b940-goog
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
