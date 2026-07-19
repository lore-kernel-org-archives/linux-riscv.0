Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6AAC44512
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jul 2026 08:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K10qZHVFR0GrAU3U/jGBkSwK3rxIHkp6hZis9TPWi4w=; b=QYUIZqkeAh0900
	/7FU3H6r96QJknYSPzKQ/qkQvrwmUrmzDTS+CznbDR8Ss/dIW/XjTlpjhfjdcSdIVwuqZYrWEFGyw
	bfoVplSxrZeAaFBjS4tlNGEufvCRYQSAlVRUPesAZFWYhBy03Dbhflh6uOiUP+EC0UBpNINXGk/49
	cytsJQKWIJ1ZjQM/s4i6bTGMuuwX3H/LaTJrCwPGt+YVcrpbS+sAGFjU5Ny2joRyOCtVurVSt8Svp
	fHVziNULzi8Nhn+MydsOum0KDrDc5+wxgS+pOeXeBSUvbgCkQWz6nwLtw0oR1w1SNmwgBj++0ZvmW
	LFOOh8+hPTM6cLYLci/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlMq7-00000004qe9-044Z;
	Sun, 19 Jul 2026 08:25:35 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlMq4-00000004qdl-1ddU
	for linux-riscv@lists.infradead.org;
	Sun, 19 Jul 2026 08:25:33 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784449530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rEnW/e+RKzLt9EfbGK/0wxdDq4P4WKLWbwpchEhe1mE=;
	b=SHUft1GhCVHdMbIR3QWfvD3qSxt72PCmV/komRq2ou/7Vj8FR+GRe3yGwPBfrle0zL/PNU
	I2U2AXEiC8U+Uv5+gDWbG/+a1bqrIZHPmPKlXE6OF8msM8R9ndDfLhh0SPHZotXR6IEugD
	VrgkHaACWxUfSYwRbdVp3Ns5bdisJx9cGf1oEflyVQ4YEzEkRth9bH+CpNG0XN8ADXrukV
	LcnC6P0PRGGnMnWTvS6GFu4BGnURlKeBgP3NrkElElYndwf7TvGj0vyoDylzY2gZoRVLE4
	iJDlC0l0UfpsusZaIzNCgsO+oD/cxo2+2xf1WGu/+ZoOSU2ytgvMAfp31skWiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784449530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rEnW/e+RKzLt9EfbGK/0wxdDq4P4WKLWbwpchEhe1mE=;
	b=sKwsVbAUjaiyENqnR7mtr1tris7IgHx4mW2UTTom0ul0aVS+iw7am6sJRE46xj5Wrqu/7H
	GWC2gzS+NLDnbbDw==
To: Xiaofeng Yuan <xiaofengmian@163.com>, pjw@kernel.org
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 broonie@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Xiaofeng Yuan <xiaofengmian@163.com>
Subject: Re: [PATCH v2 2/2] riscv: patch: skip fixmap mapping when kernel
 text is already writable
In-Reply-To: <20260719081037.5749-3-xiaofengmian@163.com>
References: <20260719081037.5749-1-xiaofengmian@163.com>
 <20260719081037.5749-3-xiaofengmian@163.com>
Date: Sun, 19 Jul 2026 10:25:28 +0200
Message-ID: <87h5lv75dz.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_012532_596612_A248318E 
X-CRM114-Status: GOOD (  11.61  )
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

Xiaofeng Yuan <xiaofengmian@163.com> writes:

> ...
>
> Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>

Also missing commit description.

> ---
>  arch/riscv/kernel/patch.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 16b243376f..b6e8e1e83e 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -44,7 +44,8 @@ static __always_inline void *patch_map(void *addr, const unsigned int fixmap)
>  	uintptr_t uintaddr = (uintptr_t) addr;
>  	phys_addr_t phys;
>  
> -	if (core_kernel_text(uintaddr) || is_kernel_exittext(uintaddr)) {
> +	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) &&
> +	    (core_kernel_text(uintaddr) || is_kernel_exittext(uintaddr))) {
>  		phys = __pa_symbol(addr);
>  	} else if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX)) {
>  		struct page *page = vmalloc_to_page(addr);

Probably cleaner to have

if (!IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
	return addr;

at the beginning of this function. And get rid of
CONFIG_STRICT_MODULE_RWX for the rest.

But looks functionally correct to me.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
