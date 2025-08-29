Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8536FC8303F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 04:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2HVlIddjr1hN60NQRyTzfblXAav8L6wJlXx2r3Btk9k=; b=VzX0O++weQ9mqz
	nBrCyMiM+3JwdR/5WXWSJnDLUp6NI+vGXc9ywBmte9rg/mdcD3sJ832RrxZ/5VHmaAdq2dKxFXOwH
	COHzlg/RGsbLwmyyggPhejmg6I2tkoMPiNhpqtsouZ+kQMFwJVMrjlO3YxXfge/V/4S1+odHhkTvC
	ktnE7jJcDS22kEZFblQv9Ub1y9eGH2UwGDgJBha1B4/3bhOniNMMtaKObdhEc1jV8xsxe3bu1onf+
	dL5QHMUjZQiM8FrOsgp6YfJ74rf1T4agd/vqzot2zfycN6+krimfQc36FpP0ahPl//Lhpz08D+n/B
	tWN/VSbkAxwtQHsqOmrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urqTZ-00000004IKM-461z;
	Fri, 29 Aug 2025 04:12:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urqTZ-00000004IJx-10d1
	for linux-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 04:12:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F3906013D;
	Fri, 29 Aug 2025 04:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D249BC4CEF0;
	Fri, 29 Aug 2025 04:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756440752;
	bh=z23qMv9asvIaS761OQWXOPAgAnhNOkI6v3mSvEeOaPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pGn5g/cE5aqZg9W0ikZ5FAAHGbXeLzt3/o5yo8xKISCuJa2T7X+RpbyKIKkMDPbqm
	 m142QHeg+CyWsBzbke8175jQD27SgmZDTyyeVXyhxWsioBPt/0xJQVg9VktSaM7Os7
	 2wU61n1n+XYluYDUeP5E94kXiF8luOOgcyZBdCg3WaAtMyifCZt2yEO3j7hqiWddYc
	 dmTYFg6Nlps1sh15O/Fatnsp5qCI6TUxrathV2utOFvwFFOGOjE9Z1wQgCr0ZOwtbY
	 alB8HCYx+dh+fVaP9NanxRsuC+rXh13tfxEO5A+R13XD8UGRUF1NCs5O6SlEhRXLqD
	 7QnKQhGoXYr/g==
Date: Thu, 28 Aug 2025 21:11:28 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Andy Polyakov <appro@cryptogams.org>
Subject: Re: [PATCH v2 2/3] lib/crypto: poly1305: Consolidate into single
 module
Message-ID: <20250829041128.GA67340@sol>
References: <20250824025736.148576-1-ebiggers@kernel.org>
 <20250824025736.148576-3-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250824025736.148576-3-ebiggers@kernel.org>
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

On Sat, Aug 23, 2025 at 10:57:35PM -0400, Eric Biggers wrote:
> +ifeq ($(CONFIG_MIPS),y)
> +libpoly1305-y += mips/poly1305-core.o
> +poly1305-perlasm-flavour-$(CONFIG_32BIT) := o32
> +poly1305-perlasm-flavour-$(CONFIG_64BIT) := 64
> +quiet_cmd_perlasm_poly1305 = PERLASM $@
> +      cmd_perlasm_poly1305 = $(PERL) $< $(poly1305-perlasm-flavour-y) $@
> +# Use if_changed instead of cmd, in case the flavour changed.
> +$(obj)/mips/poly1305-core.S: $(src)/mips/poly1305-mips.pl FORCE
> +	$(call if_changed,perlasm_poly1305)
> +endif

Sorry, I realized I still didn't get these build rules right.  It needs
the following to prevent mips/poly1305-core.S from always being built:

    targets += mips/poly1305-core.S

RISC-V version needs that too, in patch 3.  I'll fix it.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
