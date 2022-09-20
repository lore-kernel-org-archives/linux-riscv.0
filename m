Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7EFC6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 17:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tewKeaefPXjr8lCidDA+lknYz71B7q69pZomwAJbp2Q=; b=FMbE0O/1iJt2UO
	qf61/slZBVQu4oqLIVMoCkrTSBWdV/b9oslXuZH6OEpc2wGjNMihKNMcJ8nJdjPz9a5Z0mammDWL0
	mhpyWFZtGE9j9eZ1lmDMzbn0IBnCpi3QFc4knOmuGGsf4YOmzGd3UdG8FNmdT6P1zf3KM13B8nnkB
	GQL+vuFZVGCaGmQg99kSJnFuX+oC8fGbjDCTYRDgyz9Qx2z9gLxdfrLoXmB3BeOsou0HeCXDtXJYq
	xJFMBNXTuOp2Tm6hYmxlaZ3L97kPZkz/CMNRIsUiL2K8Ox1IdNtAV1Kd1nlr3zj1VYrPODZxrXkr/
	xa9lIeaXFyHMJDAwa2ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oagwM-005Oj2-Tw; Tue, 20 Sep 2022 17:21:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaguK-005NPx-SH
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 17:19:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 010C862074;
	Tue, 20 Sep 2022 17:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DA8C433D6;
	Tue, 20 Sep 2022 17:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663694378;
	bh=zlSe1PNjutO6a3x5QWBuP7AKklZ+nf71dTQ3Ma1wBRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bFMpPWjwbTYyYA0v0EiuKB4LQ8dbdPGjryIkesSQn8jbxukI79X3TaKUCcyfPr24g
	 TZRxxVeoQUmKffcWfye0QLOSz4TKONAQzqrt0OoBLKQ8GTkjkocoaGtqekNtpTu6fl
	 EDSXZGB6IQ3WgunzOyWb1jV1egI1918tf7QubbyBhD98RBQxy0Z94ybIPQozQCJUU8
	 PDSTm4xtRdbdlrEA1ociYCdPGYqafvz0SgiIO9g3ZA1ZwUaiEfqgUPZH0AzAZ9UhHS
	 whz/XiZQI24vidX/jkDhPY6GhplABFkmmkCIrCLey6B6AmaW3+YgwUi3wU8oZs5fvT
	 TQYe9KxHn1gAg==
Date: Tue, 20 Sep 2022 18:19:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] Documentation: RISC-V: Allow patches for
 non-standard behavior
Message-ID: <Yyn2Icf0GoDdtW1n@spud>
References: <20220920140138.27210-1-palmer@rivosinc.com>
 <20220920140138.27210-2-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220920140138.27210-2-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_101941_036950_B2A7DCB4 
X-CRM114-Status: GOOD (  33.30  )
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

On Tue, Sep 20, 2022 at 07:01:39AM -0700, Palmer Dabbelt wrote:
> The patch acceptance policy forbids accepting support for non-standard
> behavior.  This policy was written in order to both steer implementors
> towards the standards and to avoid

Commit message is cut off here.

> So let's just start taking code for vendor-defined extensions.

:)

> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> This was discussed at Plumbers, but as with any policy change it's
> important to make sure everyone has time to chime in.  I intend on
> letting this sit on the lists for a bit to make sure everyone has a
> chance to comment, but in practice we're already regularly violating
> these policies so I'm going to just keep going with the status-quo in
> the meantime.
> 
> I'm also still not quite sure how to write down the hardware
> requirement: the intent is to make this more or less in line with other
> kernel policies, with the added wrinkle that RISC-V is a bit more
> distributed than other systems and thus has more core functionality that
> is vendor-defined.  Hence the need to allow some code to go in earlier
> than a requirement for publicly-available hardware would allow.
> ---
>  Documentation/riscv/patch-acceptance.rst | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
> index 5da6f9b273d6..8087718556da 100644
> --- a/Documentation/riscv/patch-acceptance.rst
> +++ b/Documentation/riscv/patch-acceptance.rst
> @@ -30,6 +30,10 @@ to go through any review or ratification process by the RISC-V
>  Foundation.  To avoid the maintenance complexity and potential
>  performance impact of adding kernel code for implementor-specific
>  RISC-V extensions, we'll only accept patches for extensions that

> +have been officially frozen or ratified by the RISC-V Foundation, or
> +for extensions that have been implemented in hardware that is either
> +widely available or for which a timeline for availability has been
> +made public.  Hardware that does not meet its published timelines may
> +have support removed.  (Implementors, may, of course, maintain their
> +own Linux kernel trees containing code for any custom extensions that
> +they wish.)

As you know, I was there so I don't disagree with the sentiment of the
changes & as an employee of a vendor who wants to use a non-standard
extension I welcome the change.

Only comment I have is that the sentence has gotta kinda long. How about
a rephrasing/reworking to something like:
---8<---
To avoid the maintenance complexity and potential
performance impact of adding kernel code for implementor-specific
RISC-V extensions, we'll only accept patches for extensions that
either: 

- have been officially frozen or ratified by the RISC-V Foundation
- have been implemented in hardare that is publically available or has
  a timeline for availability that has been made public

Hardware that does not meet its published timelines may have support
removed. Implementers, may, of course, maintai their own Linux kernel
trees containing code for any custom extensions that they wish.
---8<---
I think breaking it up like that highlights the two distinct cases, but
maybe that's just me. The o spelling of implementer is in here too.
Again, am I missing some American English thing there?

I think the bit about the hardware is fair too. Gets the point across
and if someone's timelines slip all they have to do is publish the new
timelines...

Since my only comments were stylistic (modulo the potentially existing
spelling mistake) this looks good to me on an idealogical/policy level:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
