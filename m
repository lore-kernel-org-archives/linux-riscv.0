Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAC1CCD184
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 01:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XTumVmJlKQX8LKwgCiR95HxLjXuvHRjKbzVoO13MoQE=; b=lzYAm+6el4ONeJ
	yQ8wmGHgSC3VQfvvTQtRDyJ60jDhjMVpxxhAGmr34cLU9XKROGXz4ATn2ZGJCA6GZwWu5ZCQCKW4Z
	O03wlqONyYd3FhEE45WND22uxwG6XGmmszRcBPSwx24S0dV3tHQeMPGvNt9I5tzPEPMvtl0VffOZe
	e57e+2yKgQy1f3I+G42Gs1h65C7lYy4dHXjRUjWd7/Fx3FKf5hNkUNXYQB26pUeG/kIwLazc/PAAS
	av+KT9k9JBCsry/7tWnRc9qUFyqp5+dd6oJ7NZnmLTJpgcDaKbvcpyMGBoGy5l9zLdDUyStcZcI4D
	zqIjGaYO7I2zyOQeL9QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v87aG-0000000C3yI-3ZsI;
	Mon, 13 Oct 2025 01:42:44 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v87aE-0000000C3xx-2oXz
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 01:42:43 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-43f696ebf8eso817797b6e.0
        for <linux-riscv@lists.infradead.org>; Sun, 12 Oct 2025 18:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760319761; x=1760924561; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XZPY89QcCW1ODY+qCZOoE3O7xE8AabOtvINBloElcoI=;
        b=nRm+1MBJFtkpKb3Km63d1+GTfw8LvCtsdiIt/eyJNYMCSxAR83HbkjesCmPo8XFJ0e
         9TCbPbWh7/UAKuLy4zURvZSTLJcyvesDQM0LYgs3pwE9QNu/or+gguzvgBEhGOorE4Lu
         VyyySMxpoiOSHWmHN1OyUrIy8sB1Ts7nnDqvkPNxtpRAvd8g/sWCSeyBkIophZVbeqso
         5tqCFLsOPpxcuQVJLW90ipyI004Dn+WWdk7MByF50UgOPvMOuAYlP/kPbNAwxRZGVr8t
         XEBVkFkSW62uCF/DstDHaKVwjxEnmAGoyJABQAkTlU4IZKYTQVB5GmSrX2aVZ7pU0avN
         E9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760319761; x=1760924561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZPY89QcCW1ODY+qCZOoE3O7xE8AabOtvINBloElcoI=;
        b=VhMJAQbHcXsdVToc9rq4HyNMUY3dj+Mrm271bIjo0Bw0pfjUQ1Cvj2gMvmmwkDt9sq
         AMMAUwQlKI5PlMmN+XJsANK3Fx3GgxR4d23yT2otD0FbUNaWPNzipgSp82qcN9WptrvE
         tKosJOimMKe10xocHNGoe1PVO/14Nd4xum8GniYI+ZUWXZrXslSwmu9tE0dvVWtBk925
         9NcVrX3DWwjGyndKannx2V26TjTkCuzivjP5Z0NdSD3uOjVODz7zqG8K1xAHMnD1qNJK
         W6uIdpV3RG6zYn1O5x2Ny1GLqEeppt2QKGZBdYl1n1GSr8LrdY4PqoraAInUf+0nPpFL
         ZLOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmwPevqYtCTDQAV2cJxKGQNI+6KbKfZxWvt65ZZPsdsC2zHUUdNa+lKlaQdCk4lOeTlpW0Rvr8ms/INQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTzuxA8Tv285LS4FmM8zJExFjoWLL7mooCJB4JKzwSPqB/bKBJ
	3ROuMp9I4IsBqI7DZ4P7zVTs7kRma+U0CUE/uZaBtI9QRycMwQJpCApVmhFMxXM9Tzmeez7Dd6Q
	aMR4h69US7FZYj+F6rNOoAE09B22YIGU=
X-Gm-Gg: ASbGncv7vZNGQiP7AU/giSUkMJ8n2GGs3sNiAtDyylBEFKI2Rkl+UU0GwS+7SqFaHnj
	AbxvL2OdyVdz7jkUm/rvsHmw4tjT46bcEzxOSdUNtM0IcTEQP03bpT9kTYnhvhpzspkF5wZ/XU8
	gsTpsTF6EuRkeLZwpUsUtwNSBeYb9VRRnFBuxV93DFo0Kf5WHY+EajMWdg7MTtgFSE3oLj2mnHk
	7XxbjMbdzzusJgzGkhXb+C6
X-Google-Smtp-Source: AGHT+IHYP3dibH/f1x2CaUF5Y5qltN0GZfOBX7majkaJVuTomgK3AWbTQB+oXo1Tc7gUg4HY3nLwGt47mmcXZ0kFDMQ=
X-Received: by 2002:a05:6808:6ec7:b0:441:8f74:e7f with SMTP id
 5614622812f47-4418f741aeamr5973198b6e.57.1760319761263; Sun, 12 Oct 2025
 18:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250718072711.3865118-1-zhangchunyan@iscas.ac.cn>
 <20250718072711.3865118-6-zhangchunyan@iscas.ac.cn> <00a97b26-0269-4c07-99b9-33bb759067f5@ghiti.fr>
In-Reply-To: <00a97b26-0269-4c07-99b9-33bb759067f5@ghiti.fr>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Mon, 13 Oct 2025 09:42:05 +0800
X-Gm-Features: AS18NWAl8D98G1NQ5dYcpQkVO0Vnz4Q2Mr7ADFdoZHPtKW0Eo0sci0K7w0wIY68
Message-ID: <CAAfSe-umv64D011cjxPJEc0dBK29Xa4u6m1T=-THZ+V=a3f+JA@mail.gmail.com>
Subject: Re: [PATCH V3 5/5] raid6: test: Add support for RISC-V
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Charlie Jenkins <charlie@rivosinc.com>, Song Liu <song@kernel.org>, Yu Kuai <yukuai3@huawei.com>, 
	linux-riscv@lists.infradead.org, linux-raid@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_184242_713686_3061EB15 
X-CRM114-Status: GOOD (  17.03  )
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

On Fri, 18 Jul 2025 at 22:09, Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> Hi Chunyan,
>
> On 7/18/25 09:27, Chunyan Zhang wrote:
> > From: Chunyan Zhang <zhang.lyra@gmail.com>
> >
> > Add RISC-V code to be compiled to allow the userspace raid6test program
> > to be built and run on RISC-V.
> >
> > Signed-off-by: Chunyan Zhang <zhang.lyra@gmail.com>
> > ---
> >   lib/raid6/test/Makefile | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> >
> > diff --git a/lib/raid6/test/Makefile b/lib/raid6/test/Makefile
> > index 8f2dd2210ba8..09bbe2b14cce 100644
> > --- a/lib/raid6/test/Makefile
> > +++ b/lib/raid6/test/Makefile
> > @@ -35,6 +35,11 @@ ifeq ($(ARCH),aarch64)
> >           HAS_NEON = yes
> >   endif
> >
> > +ifeq ($(findstring riscv,$(ARCH)),riscv)
> > +        CFLAGS += -I../../../arch/riscv/include -DCONFIG_RISCV=1
> > +        HAS_RVV = yes
> > +endif
> > +
> >   ifeq ($(findstring ppc,$(ARCH)),ppc)
> >           CFLAGS += -I../../../arch/powerpc/include
> >           HAS_ALTIVEC := $(shell printf '$(pound)include <altivec.h>\nvector int a;\n' |\
> > @@ -63,6 +68,9 @@ else ifeq ($(HAS_ALTIVEC),yes)
> >                   vpermxor1.o vpermxor2.o vpermxor4.o vpermxor8.o
> >   else ifeq ($(ARCH),loongarch64)
> >           OBJS += loongarch_simd.o recov_loongarch_simd.o
> > +else ifeq ($(HAS_RVV),yes)
> > +        OBJS   += rvv.o recov_rvv.o
> > +        CFLAGS += -DCONFIG_RISCV_ISA_V=1
> >   endif
> >
> >   .c.o:
>
>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>
> Thanks for the new version, I'll take that for 6.17,

I noticed patch 1-2 are in 6.18-rc1, patch 3-5 haven't got merged, not
sure if there's some other plan for these patches.

Thanks,
Chunyan

> Alex
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
