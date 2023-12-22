Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE646C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 05:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HBBCLd8RaAfgykZquILpfnmMI/nq48ZP//q2eZbvHjY=; b=QLA3rkGKpzGrf9
	T46LDHw4zfDyMJQUzYlpEJ7/n6qPwdisOzR0fkmGR9drI6w+wj/UcKS0tJ6AxDJe53M7XvdwA4JGD
	QuG2rTd8Y352EoTAVhhW9B1uxVFwK4EvWYhV0GSWZSGPmd+JdEVVAhA+o5bsKse0RLQREv23FTvKI
	2ZBO/GvQQ4WRd9baHI1FmWk+H6M7ELfASV62YGmNEDZZ8BmZM5xdfYFLV+L+IhNtwD55TkAiaRuvX
	x9aFRJhWQglpFVyrfZvCR3UbUxQ2wku59cODSvdLbtODd8HZp0ls1f/COfSMFc3XaiYec1/s+qpKj
	MCWl4SjueXCrOZgutDxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGXhm-004veF-23;
	Fri, 22 Dec 2023 05:04:14 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGXhj-004vdf-2d
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 05:04:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 71295B8216A;
	Fri, 22 Dec 2023 05:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70588C433C8;
	Fri, 22 Dec 2023 05:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703221448;
	bh=q+FYm6cQEIsutbwAwEytF6Eg5VuS0ddDhi1Ombl5s9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YOt2YZlQ+xmRpHLj1toDmZoHJdAoZk86pfDaQMl4wB1nr4gqR2dbtnTovUR/EQfMc
	 fbY29i5kenMonsJ4FRNh3HoeNo/6e/wBRec5popMPubuqZ8Qm5+dGLjIkVyRudJ+gU
	 e02T6o/cJAEXChPKRpzT+FzEMATR+iqkhZBLara3zTmxicW8CNyfh7mXRDkQVB9mqz
	 wt69BT6h4Rske+FjNS8kQoigoVYZ89V4R8SNX1nLBlTA8jGxGaF4jCTqdHOfnEjHHw
	 gdDDsErpbBk+bxPeIXs481IT1eXcSQKmViZMh7Jyn4Lf8QcGxoPL5T57kJ3fCcOTDn
	 Hjg7EdOgszf+g==
Date: Thu, 21 Dec 2023 23:04:03 -0600
From: Eric Biggers <ebiggers@kernel.org>
To: Qingfang DENG <dqfext@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2 1/2] riscv: introduce RISCV_EFFICIENT_UNALIGNED_ACCESS
Message-ID: <20231222050403.GB52600@quark.localdomain>
References: <20231203135753.1575-2-jszhang@kernel.org>
 <20231203135753.1575-1-jszhang@kernel.org>
 <20231205083924.48933-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231205083924.48933-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_210412_007406_EABA506F 
X-CRM114-Status: GOOD (  10.18  )
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

On Tue, Dec 05, 2023 at 04:39:24PM +0800, Qingfang DENG wrote:
> Hi,
> 
> You may as well remove the -mstrict-align CFLAGS in the Makefile, if
> this option is enabled:
> 
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -108,7 +108,9 @@ KBUILD_AFLAGS_MODULE += $(call as-option,-Wa$(comma)-mno-relax)
>  # unaligned accesses.  While unaligned accesses are explicitly allowed in the
>  # RISC-V ISA, they're emulated by machine mode traps on all extant
>  # architectures.  It's faster to have GCC emit only aligned accesses.
> +ifneq ($(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS),y)
>  KBUILD_CFLAGS += $(call cc-option,-mstrict-align)
> +endif
>  

Agreed.  When CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y, we shouldn't use
-mstrict-align, so that the compiler can actually use unaligned memory accesses.

If I understand correctly, beyond the change requested above, people seem to be
happy with this patch.  Jisheng, can you resend it with the above feedback
addressed?  Thanks!

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
