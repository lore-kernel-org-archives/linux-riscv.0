Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB93606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 04:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3GH3Tpsb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lmOXqYhc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fMMhkv3bzcXsTwqwcj6gBTz14xD6jCSoLe8AK+08j6s=; b=3GH3Tpsbo4hBRn5vkJlj+/FMNJ
	JWCIIYsDRjnwYtmeKVARCgOmkYlrIAPlC1H+5DFtqesoPaAKf+QEe0C/7AyUSH+kXf/3uCW+6wdgz
	C0rI0kk03z4DPuyK1owQb8mg+AZ11IZMCP4JMqoZXQxtujoesEYo5i/tegigIgXxyD4XQLC5KWa3x
	IxwuSgpV1wakSCwfxWEAdoxdQiC2A1wCB0/vNNV0ebaRso6x4LwX9JF0vTzx3gi09z6HlWrnsUwzG
	NsT9eFHUFxuyt7KfDlcazYirmX08lJ8OSaVUB39phJdGxt6mdACyT8X5rhdPWnqNl2YGyMjUV9DXY
	XE43SQ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQztj-00000005bqo-1qWR;
	Wed, 11 Nov 2026 04:25:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQzti-00000005bqi-0gtd
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 04:25:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C73142295;
	Wed, 11 Nov 2026 04:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF191F0093C;
	Wed, 11 Nov 2026 04:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794371121;
	bh=oKweGQhycEbUV8C/OPSbEA8FKAbj+kryDtYUDI12TnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lmOXqYhcenzcMHR7b3e3AcnQcTI2TRHhjxSHm9JA5+6qr7zFv+dRG5A7UoHsew4xc
	 /9EqUftKrURtymKx/AQdLJ6gMbF6pCirIosOQX3HWpc7ln4m3bh/m+KZtL29JSQiiQ
	 tYhfAFDVedHTWZN5Su7LBIHJ3Ox2UhOl+KlUseGN9D+gn/5sk6xdTAVCvEPKkpQ6tN
	 EIfjcftYqWg2qJb2jr685HOS6RYED6yJOsBt8rRjLqiG7PwGsD/iprdtOmuQOqOC0l
	 6Bk59eYHf9F3dMWQwIVx51Gs5E1XNxS3lhu0DRFhWj/77zEOVLp7EIuQJ+vai3t76r
	 IslBkfI3JLeAQ==
Date: Wed, 11 Nov 2026 12:05:08 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, mpe@oss.tenstorrent.com,
	andybnac@gmail.com, Anton Blanchard <antonb@tenstorrent.com>,
	Nicholas Piggin <npiggin@oss.tenstorrent.com>,
	dfustini@oss.tenstorrent.com, greentime.hu@sifive.com
Subject: Re: [PATCH v1] riscv: irqflags: Conditionally enable interrupts in
 arch_local_irq_restore()
Message-ID: <avPpdL_iZhiU4b08@xhacker>
References: <20261110225040.1146439-1-tchiu@tenstorrent.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261110225040.1146439-1-tchiu@tenstorrent.com>
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

On Tue, Nov 10, 2026 at 04:50:38PM -0600, Andy Chiu wrote:
> From: Anton Blanchard <antonb@tenstorrent.com>
> 
> The Tenstorrent Ascalon core has an optimization that reduces pipeline
> synchronisation for immediate writes of SIE. This optimization does not
> work with register-based CSR writes, which occur when restoring flags in
> arch_local_irq_restore().
> 
> Refactor arch_local_irq_restore() to conditionally call
> arch_local_irq_enable() only when saved flags indicate interrupts were
> enabled.
> 
> On a simple nginx benchmark serving a small static HTML file this patch
> improves performance by 4%.
> 
> Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
> Co-developed-by: Nicholas Piggin <npiggin@oss.tenstorrent.com>
> Signed-off-by: Nicholas Piggin <npiggin@oss.tenstorrent.com>
> Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

> ---
>  arch/riscv/include/asm/irqflags.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/irqflags.h b/arch/riscv/include/asm/irqflags.h
> index 6fd8cbfcfcc7..5b1bca17bdc4 100644
> --- a/arch/riscv/include/asm/irqflags.h
> +++ b/arch/riscv/include/asm/irqflags.h
> @@ -48,7 +48,8 @@ static inline int arch_irqs_disabled(void)
>  /* set interrupt enabled status */
>  static inline void arch_local_irq_restore(unsigned long flags)
>  {
> -	csr_set(CSR_STATUS, flags & SR_IE);
> +	if (!arch_irqs_disabled_flags(flags))
> +		arch_local_irq_enable();
>  }
>  
>  #endif /* _ASM_RISCV_IRQFLAGS_H */
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 
> 2.43.0
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
