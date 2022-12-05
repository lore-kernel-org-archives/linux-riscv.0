Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B590C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 00:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f162ljdduEALIXiZwfpv2CahAXzrfftyonc+uEQzIWo=; b=GxSbR2WsQfmB2L
	5KRHtkXFLOwL7jpLWwOprh+b9Bq4OgyCJ5phkXK0r7vp98Ni6wB+6PSD+tWfQ/lUk+ayn5qksW0AZ
	msa2wm4llnfUuIGBnU7QeBpaG9HEss9pq1ygTTZCEkr6RuWmbtivYa2rTnu6AylcL0gf83gmDdwb9
	8DGj6BL69Uj0fLISO0S1abIn99dn5ZhSeVr0Og7njwh3+WhyUHLU1VNnYeB+Vji8RVQQtsnfqJ3TT
	SKeqNzHuRUaI6h02FmMI62h+4c2KbtI4eUZ1hb5c3jYXreMTYjfkxsDPTKMXAbJJc5hgK1WRiIsf+
	+RYbtW+yjRPvBa2uuMjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1zin-00C6d7-Nf; Mon, 05 Dec 2022 00:52:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1zik-00C6bt-4q; Mon, 05 Dec 2022 00:52:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1A39560F34;
	Mon,  5 Dec 2022 00:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01904C43149;
	Mon,  5 Dec 2022 00:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670201552;
	bh=s/KjoeG/YvGoR0oEAgkt8KtClqhFUTJq63bmI6YsBPo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DB96bUJs3Isb440r3EfnERuQmgW5O3C+1x/y6sDwhL4H72xIu7vCPKAcAbl/fCaSO
	 t7zEQ85F0AIxOIZZmU9r6hHdSKG6Hx11o4eOIiGKmtrDCUbme0M/t5uXdXIbpZgGFZ
	 Si4lU5uDFGOvB58VpoMji1S+UlG36uJeQu06sAkdgf6te/jcCgno7NPPUJSj20U8li
	 6aTwr8rF4wSzMPk7uTGJ9apsM7JGh8C2P39XAPfmiCiodKfY8OGIlcu6O8eAPVyYTc
	 JpASeONvHVa+dLmY7F/H62pg/7z3cGkBUiq2e1bTlmxnY6JxGPIFdLRXQ+UvRPiRve
	 Soe7L0GdXn/+g==
Received: by mail-ej1-f46.google.com with SMTP id td2so24170518ejc.5;
        Sun, 04 Dec 2022 16:52:31 -0800 (PST)
X-Gm-Message-State: ANoB5plFGeIsBYe4Ru+1mpM/E3VXIHMY7P6CtCP/lz7ESV2OewK6bCfr
	9mEOTp1baVuURZlktTF49xkGTjkKC6XqRLmL4vk=
X-Google-Smtp-Source: AA0mqf6u3mfU1nSek+u3koHoY/aoUcux+SiCgRRELDXAjku/7GldOJ01M1jUGx1KmiiWZPp1QZaKXwpErigUqf5MuRM=
X-Received: by 2002:a17:906:ee2:b0:78d:3f96:b7aa with SMTP id
 x2-20020a1709060ee200b0078d3f96b7aamr52877797eji.74.1670201550218; Sun, 04
 Dec 2022 16:52:30 -0800 (PST)
MIME-Version: 1.0
References: <20221204174632.3677-1-jszhang@kernel.org> <20221204174632.3677-12-jszhang@kernel.org>
In-Reply-To: <20221204174632.3677-12-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 5 Dec 2022 08:52:18 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSBdJ53BDB5kXmh5y9cMZOmoVHqN6mhuNFqMB07E_T64g@mail.gmail.com>
Message-ID: <CAJF2gTSBdJ53BDB5kXmh5y9cMZOmoVHqN6mhuNFqMB07E_T64g@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] riscv: cpu_relax: switch to riscv_has_extension_likely()
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Heiko Stuebner <heiko@sntech.de>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_165234_249126_29FD0960 
X-CRM114-Status: GOOD (  16.94  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Mon, Dec 5, 2022 at 1:57 AM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> Switch cpu_relax() from statich branch to the new helper
> riscv_has_extension_likely()
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/include/asm/vdso/processor.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/vdso/processor.h b/arch/riscv/include/asm/vdso/processor.h
> index fa70cfe507aa..edf0e25e43d1 100644
> --- a/arch/riscv/include/asm/vdso/processor.h
> +++ b/arch/riscv/include/asm/vdso/processor.h
> @@ -10,7 +10,7 @@
>
>  static inline void cpu_relax(void)
>  {
> -       if (!static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_ZIHINTPAUSE])) {
> +       if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZIHINTPAUSE)) {
>  #ifdef __riscv_muldiv
>                 int dummy;
>                 /* In lieu of a halt instruction, induce a long-latency stall. */
> --
> 2.37.2
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
