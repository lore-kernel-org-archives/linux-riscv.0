Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B65EC61DA4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 07:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQmXA89yHwEuggYwuE9+Vjzy1j3c5BvnLImkhb3UUAs=; b=DMv+ypzyLu73ZC
	1XU5dR+INIyxgDRP3aFtEn2em5BctYF0yeidegnbHbqK2TaCxPUqYn7CYcsWdP7aeSJ5WhaHrrg60
	wEnZsR1vtXlVrC9urkFU1pjpe2moMvXPis10PsFgeUbdoJeK05UYTnmqYnx14/mSV/DurFp/o/xxJ
	1iEF4/bK7HJQA6n3oxcGtf29bvsD6aux7TpIu16Kf5fLwwpA04afuS9sYMyWq1JQtkQKOwR149/Dz
	TCtfPQBA8jUYsmt20X3sp6dXw0vqEjwx88+Y+JhJzzUscBNQRN6Eg4DucX+muisN+Al8ct3Xy2fPZ
	o7eNaZ0sRqR1b/jqKE7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqy5-000tfb-Qu; Fri, 03 Feb 2023 07:58:45 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqy3-000teM-0N
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 07:58:44 +0000
Received: by mail-pj1-x1030.google.com with SMTP id o16-20020a17090ad25000b00230759a8c06so1263247pjw.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 23:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i99J2pmlc+pek02YkZ8nESdE1CjXKdwjOkhiDfukAeg=;
        b=Sh7tY9cHfXBOFOW5S5uAlPN05R/xzTnAbB0mmbqndgniiu94FxnWuAaAm9qmIUSIkN
         qRCBTYVydLP5qCYUHgyPGxipO789g/iIFW6Owe6hqAS2uVMd5pTljfk7m0WZftpBpSFO
         Puk5N5xZ2lhclDBA8AHsmHwR0EgQL6/pS2x+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i99J2pmlc+pek02YkZ8nESdE1CjXKdwjOkhiDfukAeg=;
        b=zohPDU6SI1CMdQcIbdnnbkBVHyQsKDsIf1+hfJGc4jl9CooH2OVXZrb7gf+A7Psiue
         L8teOEun6/pbpikCsktkLp3leWZIvgpUFQ1VBdG7CIGi5NBd2Lkygs5/DfilRiRJ06IY
         lAA3ltUpuYN6k53Z9/as39JmXmJtpau8L8BpCFAUqmfTFNQDwcLa/USOStPcvutPdUkk
         Xo9V3FmZuCfINKUN8j4RFvX8Dmk5rh8F/oymKmzJs8bfLN7Zg0zbYTsSqwE/InM6zG43
         uVsLb+6j3/kDdZlS9zqzr1ovtCt854K50OkYp1sfl1pAtzXzZvyfhgr2mCtskSkQiaSD
         YLkQ==
X-Gm-Message-State: AO0yUKXdw5cTp4mWxXt/RN44EPuZts8pa5ci0AB5EqVmdFZAokqYZpC5
	tQP/aUskMJx7DxdWvIKu4sVCG6s07FK9x28FvQEV
X-Google-Smtp-Source: AK7set/LUCUS12AMHBelCxeNEkLPsGXsG7KXWdCQZPA6uBHaqE1ujJKSECijijC6oDwX24pxa4KylELSv345afb5ZkU=
X-Received: by 2002:a17:902:ecc1:b0:193:794:ba9 with SMTP id
 a1-20020a170902ecc100b0019307940ba9mr2238861plh.22.1675411121784; Thu, 02 Feb
 2023 23:58:41 -0800 (PST)
MIME-Version: 1.0
References: <20230203075232.274282-1-alexghiti@rivosinc.com> <20230203075232.274282-5-alexghiti@rivosinc.com>
In-Reply-To: <20230203075232.274282-5-alexghiti@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 2 Feb 2023 23:58:30 -0800
Message-ID: <CAOnJCUK==Ma=p0mLLRJBB=3qTyMOTbiDNVYSmXpJr0HCsZ8Kxw@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] riscv: Fix EFI stub usage of KASAN instrumented
 strcmp function
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-efi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_235843_197794_07E6D68F 
X-CRM114-Status: GOOD (  15.51  )
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

On Thu, Feb 2, 2023 at 11:56 PM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> The EFI stub must not use any KASAN instrumented code as the kernel
> proper did not initialize the thread pointer and the mapping for the
> KASAN shadow region.
>
> Avoid using the generic strcmp function, instead use the one in
> drivers/firmware/efi/libstub/string.c.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/riscv/kernel/image-vars.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
> index 7e2962ef73f9..15616155008c 100644
> --- a/arch/riscv/kernel/image-vars.h
> +++ b/arch/riscv/kernel/image-vars.h
> @@ -23,8 +23,6 @@
>   * linked at. The routines below are all implemented in assembler in a
>   * position independent manner
>   */
> -__efistub_strcmp               = strcmp;
> -
>  __efistub__start               = _start;
>  __efistub__start_kernel                = _start_kernel;
>  __efistub__end                 = _end;
> --
> 2.37.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
