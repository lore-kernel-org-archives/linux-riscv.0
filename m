Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A9DC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Mar 2022 22:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vfJRD4dTq9qSnh3mXrYYGH2SedKkprvF6naS2Ol/i4A=; b=IeD5dzn7Vg5sgt
	fT1KvBBgS7imW+NL5gboruNxKEAyLOp5AP/weMw1sEcC3SjsWHYqi9VcW72vFk4K00LdrrE2OTgkn
	E5Ii5ESNN/G7Wxya33wEKXBtTkJpwCbDt9si4s8dXjexEVRS/j2B3pVoZd3qfthgOSysgcCuNYM4G
	5tN2IvsuABJ+8pcHl4gevpoIB4YhuUX6NK0z3rpVmW4cXerE0wnOuu1w++7vZzYAbwOc+9MHm8JO9
	XehBFVJWkDO5TbNllJhneIkhtvo3cHN7yH2TqWBAFjMP6qD/7NhzdfbrfK/hv9fdpfKlLbyHb2voh
	I9RVZ5fEEYipXFrk76CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYxb6-00AK7n-N1; Mon, 28 Mar 2022 22:12:24 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYxb3-00AK53-UO
 for linux-riscv@lists.infradead.org; Mon, 28 Mar 2022 22:12:23 +0000
Received: by mail-ej1-x62f.google.com with SMTP id qa43so31446221ejc.12
 for <linux-riscv@lists.infradead.org>; Mon, 28 Mar 2022 15:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+f5sHPzIyRA/MIuxJyTwVB4qA3W/MyALnESwv4ntqwI=;
 b=WTFv5UiDQYG6xE5yTybsKvbeJpeKOjrRBj9Dxr1y880o4uh3YSustFXzNJx8+RFbkf
 cvObHuLVEc3hHlLnQvT48ZeGBJZe/Lkl+rgHbce6fVPNF+Z9tjVs/oFk0vOSQUmdarFr
 QGBM1nRjcVEnRtVEoyXE6dX56ZD5+rDGcFuBwQZ7cf44dhsHg0ayY0PgmfSNXcF/Di1u
 X5k1FTX+ajHAThYDht5AxbtNpbcjq24P5ISLzLMjInoecEYBwjEagsaOt9WGPmmls6Nf
 oEYc24sfzDXjMv191Y009Vh5ZOh3aSwtUfW736JH+mtYkxV99isWQXfMi9Ml9xKNiITV
 xB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+f5sHPzIyRA/MIuxJyTwVB4qA3W/MyALnESwv4ntqwI=;
 b=yPXJRY8jCTVmVujRjg8hH2yOOpuljSw5Sgrwrwpc3ReyJVSUq2U6IhdU+bHX03Qc80
 dnPEVay7cgXlfzoNbW4GVk3XLZmeaCRnnGr6Jyr5YWg1mcIvrnaxdS+sFK9Tt+whtpRu
 aOLHoolunxShFPt0pZHZS//0Oa8Q/rPT7PxpV04z9ZwYTiXPgy2uYUq9s+7kTwtrP4wq
 TpnPVh2EoiKfT2zKum/vRKRaQF8HCiiBJfToaAxfLjeRv52dM/+RJ4DqR35im9tuHd6+
 /dQG4agUrH2ZcvhnYE04Nf1HX7Z66ECxERzM34wy3vGV4P6hhXyu7Kf0pqOzex7Muf4T
 De2g==
X-Gm-Message-State: AOAM5333ZzjusdAMnGVlQlA2m/QItKXmYO3MImBmnIJc5EmQorSm0KFQ
 UML4D6Mxv8eJp/cJChC2i77sT2X2NFUWjpI1g7GoVZogxJDnFw==
X-Google-Smtp-Source: ABdhPJxRk6LttYtk3D6Ak848ibfIBA9+kBv8Wa0FQFx4Em8F4rGAbvB7rtgf9Y5xENqqPfPRvlXqHKdzvmXy4Eh+8iU=
X-Received: by 2002:a17:907:9621:b0:6d7:355d:6da5 with SMTP id
 gb33-20020a170907962100b006d7355d6da5mr30577979ejc.195.1648505539301; Mon, 28
 Mar 2022 15:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220328220417.25675-1-rdunlap@infradead.org>
In-Reply-To: <20220328220417.25675-1-rdunlap@infradead.org>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 28 Mar 2022 15:12:08 -0700
Message-ID: <CAHBxVyHxRY2Ni7Do64cv2n2=WK9kkrkybZmb27UzCvRe7J09Xg@mail.gmail.com>
Subject: Re: [PATCH] riscv: cpu.c: don't use kernel-doc markers for comments
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kernel test robot <lkp@intel.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_151222_080509_ACDA4566 
X-CRM114-Status: GOOD (  16.62  )
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

On Mon, Mar 28, 2022 at 3:04 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Repair kernel-doc build warnings caused by using "/**" kernel-doc
> markers for comments that are not in kernel-doc format:
>
> cpu.c:89: warning: cannot understand function prototype: 'struct riscv_isa_ext_data isa_ext_arr[] = '
> cpu.c:114: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Atish Patra <atishp@rivosinc.com>
> Cc: Palmer Dabbelt <palmer@rivosinc.com>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> ---
>  arch/riscv/kernel/cpu.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> --- linux-next-20220328.orig/arch/riscv/kernel/cpu.c
> +++ linux-next-20220328/arch/riscv/kernel/cpu.c
> @@ -69,7 +69,7 @@ int riscv_of_parent_hartid(struct device
>                 .uprop = #UPROP,                                \
>                 .isa_ext_id = EXTID,                            \
>         }
> -/**
> +/*
>   * Here are the ordering rules of extension naming defined by RISC-V
>   * specification :
>   * 1. All extensions should be separated from other multi-letter extensions
> @@ -110,7 +110,7 @@ static void print_isa_ext(struct seq_fil
>         }
>  }
>
> -/**
> +/*
>   * These are the only valid base (single letter) ISA extensions as per the spec.
>   * It also specifies the canonical order in which it appears in the spec.
>   * Some of the extension may just be a place holder for now (B, K, P, J).

Thanks. I was just working on sending this patch after seeing the
kernel test report.
Reviewed-by: Atish Patra <atishp@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
