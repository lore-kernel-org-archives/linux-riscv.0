Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A535606A327
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 00:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MLc9yALp;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VGjGdgln
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b0QOrnINWkMfdg1Q2I7vpeyT4OnLoaZDF4KJjiMQsX8=; b=MLc9yALpSyaUSwktazbglMKdw8
	iIQikdBzOMVBnqvPxE7Ki8pbaOGi7MkbGFQdXoQYErlrkJpgxylsHPAoQQ6/DiRVnq/WlcZnwDu58
	hHUTRiITWqzmLkGaAbpbXzw1/lfiCii9/H4IVmZk69uqgJg4uerxPK3w5uMe66gmGHR0/I/4rRImK
	J149Bgz4rvVSvibvGLGzfmGy6/YtjVpWv5OO92a61H8HjGMTjWdiZlQK+6RQOoYqP6aaG6RTtxt5z
	nhhUicRYCQpXuahSlyoUtr51lFrek7ljOHaIqX5pqtVyzA/Ujb4Z7ENEaSdSHcUSiZt9fYrIvAoDa
	7qwX5uhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQvsW-00000005HQ3-28KL;
	Wed, 11 Nov 2026 00:07:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQvsV-00000005HPx-45Uf
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 00:07:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4CCB243E44;
	Wed, 11 Nov 2026 00:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E42C1F0089F;
	Wed, 11 Nov 2026 00:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794355671;
	bh=uknRy7rJYSLugVW3qLuvx8E313F1JtrelCZFK1iUw/0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=VGjGdglnnCzw/lV9+vNGh6SpzKTjeBL+x4s31LVapLykY9ZpoVvUJegEC4roYEMIU
	 LFRTPEIHkhWLWdyqblh5/NhnEzos+XrkwK/WRDCZlQLTnd311ZRz2j1k6Ncxo7znvG
	 Hty14k0HzRZdnJTg1xT83+9gRE8KsafLCljXEQzrqFFHdjGNOk1QbpVKePLAOeKE0p
	 EP8kDCygzVt8TcqWQb+kUEeDhmxQPGTm8sfm15whArtLpmN0EYSK1EUS+SyMJa12lq
	 cYTiL1ySKYRL79SMg5pu0ACx0EFBivYtiawpH4UyH/ToD7jn2QjegUXSbXn+kn92sm
	 HdgH83fBbFfCQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>, Anup Patel
 <anup@brainfault.org>, Radu Rendec <radu@rendec.net>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, =?utf-8?B?Qmo=?=
 =?utf-8?B?w7ZybiBUw7ZwZWw=?=
 <bjorn@rivosinc.com>
Cc: Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH v2 1/2] irqchip/riscv-aplic: Use handle_edge_irq() for
 edge-triggered MSI sources
In-Reply-To: <20261110-aplic-affinity-fix-v2-1-6c143b8b4e8c@linux.dev>
References: <20261110-aplic-affinity-fix-v2-0-6c143b8b4e8c@linux.dev>
 <20261110-aplic-affinity-fix-v2-1-6c143b8b4e8c@linux.dev>
Date: Wed, 11 Nov 2026 01:07:47 +0100
Message-ID: <87ik24telo.ffs@fw13>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10 2026 at 12:06, Troy Mitchell wrote:
> In MSI mode, all APLIC interrupts are handled by handle_fasteoi_irq().
> For an edge-triggered source the APLIC forwards each edge as an MSI and
> keeps no state after that, so an edge which the CPU side drops is lost.
> After an affinity change, the next MSI can arrive on the new CPU while
> the previous one is still being handled on the old CPU, and
> handle_fasteoi_irq() then drops it.
>
> The fasteoi flow also never calls irq_ack(), which is where IMSIC applies
> an affinity change that was deferred while a previous vector move was in
> flight. Such a change stays pending, and later affinity changes of the
> interrupt only update the pending mask.
>
> Use handle_edge_irq() for edge-triggered sources. It acknowledges the
> interrupt before invoking the handler. If the interrupt is still in
> progress on the previous target CPU, it either waits for it to complete
> or marks it pending so that the handler runs again.
>
> Fixes: ca8df97fe679 ("irqchip/riscv-aplic: Add support for MSI-mode")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Not that I care at all about showing up in some made up git-tag metrics,
but in general it's a matter of courtesy to point out that the solution
to the problem was suggested by someone else, no?

> +	/*
> +	 * Edge-triggered sources are fire and forget, so they must be
> +	 * acknowledged before the handler runs. The edge flow handler also
> +	 * replays an interrupt which arrives while the previous one is
> +	 * still being handled on another CPU after an affinity change.
> +	 */
> +	if (type & IRQ_TYPE_EDGE_BOTH)
> +		irq_set_chip_handler_name_locked(d, irq_data_get_irq_chip(d),
> +						 handle_edge_irq, "edge");
> +	else
> +		irq_set_chip_handler_name_locked(d, irq_data_get_irq_chip(d),
> +						 handle_fasteoi_irq, "fasteoi");
> +

  https://docs.kernel.org/process/maintainer-tip.html#bracket-rules

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
