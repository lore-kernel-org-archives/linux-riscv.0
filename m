Return-Path: <SRS0=wsUA=OK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E389C04EB9
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  1 Dec 2018 10:23:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C65A2054F
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  1 Dec 2018 10:23:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tUjDSF3t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oaVBFGWU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C65A2054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jjEqnTiGZCHOatcU8coA5ImLewkN8JoUFgV4UvATaNc=; b=tUjDSF3tjUmoVN
	99Pv4xtOPZHS3rreGpErzfESpy+UZidixAEbXF6vjOPDIO5SV/YuJexK7XR0WSOmyITconC8VQAvV
	TU83914FJIUOGkuhLCQprSFCyMt+KiTIC/JnLlX1k/uZ2iE3OTX4cItlW8xAJtthpbZ5rfI2Kedm+
	dMQ9lq4vFOlumusovtq1ak07EiMJdkkh6bM2DK2gcGtbZ/U66s7eQ49J5WJDZDnTeBTD6/HCgyDhS
	L+l12ByOqN3ZNoIOtMy10qjW1WuDFloBM+V8g4DiOxTEwP4VBSa37bN4pYMvzmeUfQKK5F2Zcz4cP
	KTQx8ZbpjpFOLacFY35Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gT2R1-0001Le-Hn; Sat, 01 Dec 2018 10:23:39 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gT2R0-0001LT-5Q
 for linux-riscv@bombadil.infradead.org; Sat, 01 Dec 2018 10:23:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1FFgPVAO7Lt9Fh8J3PvOFj46zw8MbZmEcShngNchViY=; b=oaVBFGWUpH9s2IMuDXcCntD95
 Yq65Kq26e+CXiQpRY+mNrVEHE2BqEuF7dQQowk86365BHNJ07oh1me625Kx7eSa7MdXjtzenWNb5y
 kg/olW5jCo8KNc4E5X9M9TDVkOvmtc2ktem2MuecKS8H9s2Rkf4iTPP07VZlTqtYdbRBhp0z0vD2d
 PApvKSRV6veog1DgZuTXWOOR9lGvQ0t/StRrnO28ho1XgUPKEvNwc57O1tQnDyGG5As6P8nxToB5B
 f7gnVct3r0yOOnkRYlLfd+pbXSeJ0xxaHEKWrQ2g/VRlLY11VDfAEBcw+RT2bZOxJEo3blaG44UJx
 WKHxPQG/w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gT2Qu-00023O-Fo; Sat, 01 Dec 2018 10:23:32 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 476512029FD58; Sat,  1 Dec 2018 11:23:29 +0100 (CET)
Date: Sat, 1 Dec 2018 11:23:29 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Andrea Parri <andrea.parri@amarulasolutions.com>
Subject: Re: [PATCH] riscv, atomic: Add #define's for the
 atomic_{cmp,}xchg_*() variants
Message-ID: <20181201102329.GD11614@hirez.programming.kicks-ass.net>
References: <20181201000156.5366-1-andrea.parri@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181201000156.5366-1-andrea.parri@amarulasolutions.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Boqun Feng <boqun.feng@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Dec 01, 2018 at 01:01:56AM +0100, Andrea Parri wrote:
> If an architecture does not define the atomic_{cmp,}xchg_*() variants,
> the generic implementation defaults them to the fully-ordered version.
> 
> riscv's had its own variants since "the beginning", but it never told
> (#define-d these for) the generic implementation: it is time to do so.
> 
> Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Boqun Feng <boqun.feng@gmail.com>

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

> ---
>  arch/riscv/include/asm/atomic.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
> index c452359c9cb8a..93826771b616a 100644
> --- a/arch/riscv/include/asm/atomic.h
> +++ b/arch/riscv/include/asm/atomic.h
> @@ -303,6 +303,15 @@ c_t atomic##prefix##_cmpxchg(atomic##prefix##_t *v, c_t o, c_t n)	\
>  
>  ATOMIC_OPS()
>  
> +#define atomic_xchg_relaxed atomic_xchg_relaxed
> +#define atomic_xchg_acquire atomic_xchg_acquire
> +#define atomic_xchg_release atomic_xchg_release
> +#define atomic_xchg atomic_xchg
> +#define atomic_cmpxchg_relaxed atomic_cmpxchg_relaxed
> +#define atomic_cmpxchg_acquire atomic_cmpxchg_acquire
> +#define atomic_cmpxchg_release atomic_cmpxchg_release
> +#define atomic_cmpxchg atomic_cmpxchg
> +
>  #undef ATOMIC_OPS
>  #undef ATOMIC_OP
>  
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
