Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123D5C4321E
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 21:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fI1nzwWgFHouK47WJ+CEPHVu6xrTiG8Doi55B9XHu4c=; b=dlvxc6qB8DUk/y
	rNaCMJSlYGxNHN4sP1KrCDF7wGelseJJJ1+ThNDIiL1Lhn9oV3SuFP5AkUw9AjHIF1qcG8vu5i9p5
	D5JYf1VFqO8t2RcUhEhTQWKKHYWs+OHi5DyzyNccApctaTyso7IAoY8SvAMsgICVn1M3Y5IzQJsix
	4IGPkWbg7HdnVoBS/dfRMXi75sZU16r5I9j6pd1TOXmLrddzIGe36a0c6vOMcH9E0C1vuUUD2Xhcv
	diDO5jtq0x/0REEYnWxoXE1TyBm+7hXIv2LmBj05/FGAAMSKgUc2BoPGtwdVWNdjaCUEopd4G570w
	oCUgQnj71J8F7D+uPcwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozlLs-004S6u-71; Mon, 28 Nov 2022 21:07:44 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozlLo-004S4a-9c
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 21:07:42 +0000
Received: by mail-oi1-x234.google.com with SMTP id r76so13011863oie.13
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 13:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p0FNGgIcUuNCpA9Y9gi862KOUxRRENxcyaW7zlUvyPA=;
        b=Ky5DoOUUHPMkVp410wTsY19+tvY84MsUuCl1ggQXdgoTqVd3RdraVJzY8pKA5NpZ0l
         WCZSFSi4hv43yLLNYUJTMT9HqifM8M39izGYtApDIN4Nk5frsZ/bpF6qKuycefNgGk8z
         afeY2nsROdYu49kDMdApsnjQVKROVaQCnP3oA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p0FNGgIcUuNCpA9Y9gi862KOUxRRENxcyaW7zlUvyPA=;
        b=DxTVPPaY97DO62sE+8fOQFNIEJ3qenmxXQ3qgDLQtxU6kikU8PpzORXZIK/nIyuTo3
         AgmnG+8HHUgQthNCycsu/lTuclAAYDRbyMjkA3q267SY2goXugWpuJApDRNeQUeiSPaj
         mnEz2wdY21qWY8RMHgBYysSFdViVCItF50ksJcxbWcljfy1zqY0NMm1mpIiuNqVXiqR5
         TWHqgflYWmOZnGJDF2923G4Dmt8XeOUrNH2gj2giyffR5OEbOO/bTR59YqIKz66hihbG
         M0I5zM/GeGE39F+qvC+iCKUChtNsy6/x5ElQ+MzeGCXMu59RMihKfNT/hxsmwcRSo0xE
         RPgQ==
X-Gm-Message-State: ANoB5pljJViQaY1hVUIBZGrLXPH+/qO0z4I6CLm6A/4FsXX0um5yFi1T
	7CtBVVlYMrKKdxOavj6LEihX90metW+XGGhOFf01
X-Google-Smtp-Source: AA0mqf60qCnqGEvcePSoSgN8ZuI9R5R/l1ZJ2jFT3sjZ21drA4GBHWvJy3Gx9s0n0FFCxp8tEBghJjjk+vdZIRCeIpM=
X-Received: by 2002:a05:6808:a90:b0:35b:aa33:425a with SMTP id
 q16-20020a0568080a9000b0035baa33425amr4727887oij.181.1669669658557; Mon, 28
 Nov 2022 13:07:38 -0800 (PST)
MIME-Version: 1.0
References: <20221128161424.608889-1-apatel@ventanamicro.com> <20221128161424.608889-7-apatel@ventanamicro.com>
In-Reply-To: <20221128161424.608889-7-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 28 Nov 2022 13:07:27 -0800
Message-ID: <CAOnJCUJ6b5=e=k19q0Q51Gptgw_QSr_989cN8q0xoBN+yq=Mmw@mail.gmail.com>
Subject: Re: [PATCH 6/9] RISC-V: Export sbi_get_mvendorid() and friends
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_130740_381298_EA4F6DBF 
X-CRM114-Status: GOOD (  12.42  )
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

On Mon, Nov 28, 2022 at 8:14 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The sbi_get_mvendorid(), sbi_get_marchid(), and sbi_get_mimpid()
> can be used by KVM module so let us export these functions.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kernel/sbi.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 775d3322b422..5c87db8fdff2 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -627,16 +627,19 @@ long sbi_get_mvendorid(void)
>  {
>         return __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
>  }
> +EXPORT_SYMBOL_GPL(sbi_get_mvendorid);
>
>  long sbi_get_marchid(void)
>  {
>         return __sbi_base_ecall(SBI_EXT_BASE_GET_MARCHID);
>  }
> +EXPORT_SYMBOL_GPL(sbi_get_marchid);
>
>  long sbi_get_mimpid(void)
>  {
>         return __sbi_base_ecall(SBI_EXT_BASE_GET_MIMPID);
>  }
> +EXPORT_SYMBOL_GPL(sbi_get_mimpid);
>
>  static void sbi_send_cpumask_ipi(const struct cpumask *target)
>  {
> --
> 2.34.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
