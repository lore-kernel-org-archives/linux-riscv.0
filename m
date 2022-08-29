Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB809ECAAD2
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 08:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YEN0A5INFtbqvKKAQ0uU4G4mY+OtTGI16gusbmWCJO4=; b=UPS4EWkpEZhhnq
	qdzoIyDg1mOCkbvzvw3bXLcT/5px8uyLWn1pQykQLLDxO4Wp1n1NORZ3i49NSxZCmIvZ4rcFHOG0S
	Ts3kq0Sg4LDPlY92y27ZZQApcqb8KJn42zNJNZbd3g1B/MU5m2VEJGRbMVAhIoJp8xgMpS57u2S78
	GhnEpXU2EZD228Bce8Pkn9MlmBe7tS9b4wnV7mP2fzdge+NRdtlVVYR5rzGXXYNxIqNrahZRlLokd
	L1rQ21pVg6GYdTKL5EIajwNhiiEt0rv4kF8NjjYbCEZpjLandzb6PvIBw/gUYnX4KdiYcRpjRL4vt
	xOxeu4V/5dDYFVNYgnrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSa72-006BPG-Vh; Mon, 29 Aug 2022 08:27:17 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSa4N-0069YH-7Q
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 08:24:33 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-32a09b909f6so177933887b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Aug 2022 01:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=YPHIWOX2j4Thy92e9g+SOxrZzDKa/VoFDvQX9IM02Q0=;
        b=LLJn43kPMQL6fuG/Un8h1/tyLwxfoVF3QhiRENBT6jcSfQH+1BwXrdv0POEAgfYrt8
         TuvgZwLgODhG7/ZQZRYoPhqWSP4GBqf5A50NkGF18hurl8L1FAYXYzxa8YhSmwlY5lcP
         A+7l20SkRb5V81m11RKjHtTbmoWam4n47PUJiXRjV6Q7bnCLpBqio6O1ixoZiVsY0nOT
         1X+6ugXN9nVHs/iX4Rkw7InDhFIQeH/kgbwAba4iw7sibBxMnKclr4TEE5fJs9A+tBkJ
         vApvxXKQYwJcZ8SfLsPyqXEIbdnYKz3LhJFnPZGXg9EbqPvL7Pmp4Lkd+3vUoysReO3L
         Dt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=YPHIWOX2j4Thy92e9g+SOxrZzDKa/VoFDvQX9IM02Q0=;
        b=4VIdKPjt4oe6U8mfTVEJgY2OC0/VPjagJ8fAE5gZsA1/l7DbNrENsgKIXXXt5VQvS8
         ASBwYzmQ4xJCmJHs79+CsrWhbKSJkLT3RW+SybJ7jbprlurvtzqqsPyXsoQn4UgEGUWM
         l+b1MRdbD3CCe5cbJcbXyechjIvMpqX6mr4g32dZr+DMV8KS1nD4Thu2+2VcOz+pPV/f
         V4HftXNwhxElbxG/fCdt5UR/jGCY97KYH5CtoTbQplS1xVh1kNY33+6n/nC1lBmnFbgd
         j5b6OUjlcE73l4np3qKGW7u86xWvtXM8kHUhGD38Bsz482oyThnk8x8zrVVPc10dV9Sq
         GJjw==
X-Gm-Message-State: ACgBeo07M58omnvVqJEgH9J0S/SYPpAj8ZngUUlbGO5H8Q2fmvsFJ3s1
	aZDVwkjiCZRv/6spOELHQXgx/Kw0nSOXeEvslOTw3w==
X-Google-Smtp-Source: AA6agR43iFuWAJqgEnfEHFE5RxxlI+v8+Y/+POQSHkEXBl+x+VKgeCZf6Tjz5wvhB9r7HOhttvi+oD+9H2c+86DlhcI=
X-Received: by 2002:a25:d1c6:0:b0:695:d2c9:2ff0 with SMTP id
 i189-20020a25d1c6000000b00695d2c92ff0mr7237106ybg.442.1661761469116; Mon, 29
 Aug 2022 01:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220819140250.3892995-1-ajones@ventanamicro.com> <20220819140250.3892995-2-ajones@ventanamicro.com>
In-Reply-To: <20220819140250.3892995-2-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 29 Aug 2022 13:54:17 +0530
Message-ID: <CAAhSdy3C_4tNQ42XEtc+cHW-ArubPxoSEmmBnj2mCdYi04JHjg@mail.gmail.com>
Subject: Re: [PATCH 1/4] riscv: Add X register names to gpr-nums
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, mchitale@ventanamicro.com, heiko@sntech.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_012431_513620_40701D1D 
X-CRM114-Status: GOOD (  14.39  )
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

On Fri, Aug 19, 2022 at 7:32 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> When encoding instructions it's sometimes necessary to set a
> register field to a precise number. This is easiest to do using
> the x<num> naming.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/gpr-num.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/riscv/include/asm/gpr-num.h b/arch/riscv/include/asm/gpr-num.h
> index dfee2829fc7c..efeb5edf8a3a 100644
> --- a/arch/riscv/include/asm/gpr-num.h
> +++ b/arch/riscv/include/asm/gpr-num.h
> @@ -3,6 +3,11 @@
>  #define __ASM_GPR_NUM_H
>
>  #ifdef __ASSEMBLY__
> +
> +       .irp    num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
> +       .equ    .L__gpr_num_x\num, \num
> +       .endr
> +
>         .equ    .L__gpr_num_zero,       0
>         .equ    .L__gpr_num_ra,         1
>         .equ    .L__gpr_num_sp,         2
> @@ -39,6 +44,9 @@
>  #else /* __ASSEMBLY__ */
>
>  #define __DEFINE_ASM_GPR_NUMS                                  \
> +"      .irp    num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31\n" \
> +"      .equ    .L__gpr_num_x\\num, \\num\n"                    \
> +"      .endr\n"                                                \
>  "      .equ    .L__gpr_num_zero,       0\n"                    \
>  "      .equ    .L__gpr_num_ra,         1\n"                    \
>  "      .equ    .L__gpr_num_sp,         2\n"                    \
> --
> 2.37.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
