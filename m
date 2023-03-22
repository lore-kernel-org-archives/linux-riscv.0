Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80376C6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 00:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5d2mD5V4P9iHLjjZ4FVglpu1EtfhWhv7Zt+fbtoirAc=; b=HvuehBj9Z6TAfG
	28m6CuDUDxTJMz52Z8ngZv9g4jYi+zLuQ74wbjwPM2TgjE/TUiw6O+Zkq/hfBJA1uUqA1BoMQr4Cv
	IdEq0nehGhny7b4MMUeFhVoiTulB7esA9QWJeAgY6Jp1ckv4m1Z/SdEvXUmIRkgvyFzxglX/HT2pX
	FNhBoQ0BJnOhnkKqyP4gXEUyPuDI+aePp5x6Txg3HYo80aa/0eauyLr5Rd5fxWM6367PBRvmR+MAW
	j0KUfA4U5ESVC8d97zc1tBZBgTmg6b3TmzomtDnQ9x0jiww5wyem+37PR3HvE9p4Ye2S57s0aWRvy
	AaZPwna9zXqnMr8yE1wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pembe-00EBi6-0b;
	Wed, 22 Mar 2023 00:45:34 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pembY-00EBhC-0S
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 00:45:32 +0000
Received: by mail-ed1-x536.google.com with SMTP id r11so66646025edd.5
        for <linux-riscv@lists.infradead.org>; Tue, 21 Mar 2023 17:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679445924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rrtn8nmTpdpmlgteuK1+I9kCTEi3WBSapYh/Vb77bok=;
        b=byK8LLM6Upd0ucfmY5rzV6fLRbFET4jIy4zbN8NR5m1gKP77vuNvuDkdOKd8ZI3Qqc
         iqD0YuSza6ysoEmpJL4gHn7YQjuz90GB2xWLQG1tmWeD6hns/e8dswyXhMY8QmzBQwIg
         94R/q1AQJmwk8vCEMMxNntOg/y0Wya1WpMY2jFoMeI4rCJ8OChlfbQAbrz5zXkAZK1Vh
         OVkBK928Oa1N0EMMgWURQkBbSZkFlGAjepXoRbZ2MeCrR4f1t/pR6dMg1MlV5fHDYGme
         OZfWjwRiJuuvU/gDo6qPROGaT7yF+NcSp5nfTW7O1k6emNIYQ4lwwvEZB0pmD0A0NkUz
         Nmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679445924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrtn8nmTpdpmlgteuK1+I9kCTEi3WBSapYh/Vb77bok=;
        b=PKtI50g4ozNw03rpOY0RjTdOX+w0YrJU0eJcAVtQBWKpexKTQYbW5xOosFNViZRSfW
         Z0CPAFyd3GN0wZK02C9yaq2TUZoKsIe5gCpfLp9fc7fXxl7FKuy3ISvwtumMfixddW7u
         DXB2Uf6uiKZia0n0HIGmSrKbL/t8W7BhMbK24URznKDM7qi7e0gVwxM14s+ii89dOKDr
         IBeikx3tU73YxlvcKGYpjO3lfjWb8AAzzfLq/tng82uQ4zx+mtI/cMomhmaKEx5O4XoH
         FmMiIwIYssLsl4Y/WnjwQWDUTUIADh3xZ4srVspRdhz/qySuYP2SK/nLu3r+9DBbVx1s
         hQFA==
X-Gm-Message-State: AO0yUKVoqkgk7UcvdxT8ugD1aA9DyrTXillz0RXrpyoypYeTa/y56OLc
	hpgRjlqz0DjmzAhTf0x9MYk=
X-Google-Smtp-Source: AK7set9+toSZFFbOheWMw08WFtHuw2LBGIYFjBR36MoXWEw//iln1ImIgpEqD5zQkjHozI7eOTQi5g==
X-Received: by 2002:a17:906:b115:b0:8b1:76ca:f228 with SMTP id u21-20020a170906b11500b008b176caf228mr4968055ejy.39.1679445922119;
        Tue, 21 Mar 2023 17:45:22 -0700 (PDT)
Received: from andrea (93-41-0-79.ip79.fastwebnet.it. [93.41.0.79])
        by smtp.gmail.com with ESMTPSA id u24-20020a17090657d800b00934823127c8sm3249365ejr.78.2023.03.21.17.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 17:45:21 -0700 (PDT)
Date: Wed, 22 Mar 2023 01:45:14 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND RFC PATCH v2 1/6] riscv/cmpxchg: Deduplicate cmpxchg()
 asm functions
Message-ID: <ZBpPms0PGv4sWR1Y@andrea>
References: <20230321074249.2221674-1-leobras@redhat.com>
 <20230321074249.2221674-2-leobras@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230321074249.2221674-2-leobras@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_174530_742017_5411C839 
X-CRM114-Status: GOOD (  13.10  )
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

On Tue, Mar 21, 2023 at 04:42:44AM -0300, Leonardo Bras wrote:
> In this header every cmpxchg define (_relaxed, _acquire, _release,
> vanilla) contain it's own asm file, both for 4-byte variables an 8-byte
> variables, on a total of 8 versions of mostly the same asm.
> 
> This is usually bad, as it means any change may be done in up to 8
> different places.
> 
> Unify those versions by creating a new define with enough parameters to
> generate any version of the previous 8.
> 
> (This did not cause any change in generated asm)
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  arch/riscv/include/asm/cmpxchg.h | 102 ++++++++-----------------------
>  1 file changed, 24 insertions(+), 78 deletions(-)

Diff looks nice,


> +#define ___cmpxchg(lr_sfx, sc_sfx, prepend, append)			\
> +{									\
> +	__asm__ __volatile__ (						\
> +		prepend							\
> +		"0:	lr" lr_sfx " %0, %2\n"				\
> +		"	bne  %0, %z3, 1f\n"				\
> +		"	sc" sc_sfx " %1, %z4, %2\n"			\
> +		"	bnez %1, 0b\n"					\
> +		append							\
> +		"1:\n"							\
> +		: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)		\
> +		: "rJ" ((long)__old), "rJ" (__new)			\
> +		: "memory");						\
> +}

Though I'm not really a fan of macros depending on local variables with
"magic" names, can this be avoided?

Thanks,
  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
