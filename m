Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871ABC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 10:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VWDaOUFTCic8vfqNteedasuwcuPnGi9eL5lwp9iZDPU=; b=AFPRathFTFiN67
	vHRGSlLO+ckLqmrWbHv/sZzNReiZJep24sM0hWOWcIK/v9e8zpYnLZXRei/GcoMarM73SQJZOZ+l8
	XQPyb1kBhwdox5dyxGQP9w+yyVBqrjYXt9AnztA6DzthcNrXGbelIA/itnt5RYk3WXymP1ogo5xQd
	VF7FtjCpCmtxRvznbX8+XX2j3wtfDtMOempaev0WLOcrUCVkMeZYo7hBWxsgxq0qIHC4nrqRLWKew
	JRZvcxJsn2IGcOgawduOP04Pcq+qPxfhmB33+JKTFN+UUxdAGggLsLEzF1nMS6+uV48sLvAIvXa6L
	L1k8KXc9aYBmvQcAvoHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOcw5-00BQkT-Ki; Mon, 28 Feb 2022 10:07:21 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOcw3-00BQjf-0D
 for linux-riscv@lists.infradead.org; Mon, 28 Feb 2022 10:07:20 +0000
Received: by mail-wr1-x42b.google.com with SMTP id j17so14602301wrc.0
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 02:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AnO7RJd7lIaXKXrGVfiV/DsRScB6mJSjgNzjp2pSS5E=;
 b=7c66SOwY/5D6ac4Gr2dhD7c1d55xW30W4PtBtluMV01alcTFMgytmQio0L2BKqun4w
 9qH8cgBStRaEJQx4YfunkHdz5E8/LsW9HkXkoQH7wGtqB03DUnGqMJnDmgvcCmVzZR5b
 SgWCEUZr/tWTN2o25v+mtJyA/uYE3BAFJAoDNP54vZurfkR5WHIlwfxaXZQMIskQkrvx
 uAQNcDzTR/KrwuPJS+7cE5KZxeusc/zHFEAYEQMldl1iYfM43jQf0GUbFJsIk7QDfEIW
 /N6ezzl5t1Dg+dkPm9LLIkS/fPinvJzH7luFkXXqFoAvrlIfeP+yoTV6cv1MS6jeOb6y
 rL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AnO7RJd7lIaXKXrGVfiV/DsRScB6mJSjgNzjp2pSS5E=;
 b=n8z82HFqs9NFpZ1cdVchlQqpcdCzIfwhrX/RSRD5rG2W74XheX1kxuytN9YKzrMPzo
 gzlKhRwOcam5+P0dn4y/hoYEs1S2M7xVV9dWuUDmkMLaR0SPxpzEY0yYTBEmo4IiTxg9
 bLMtsOEGRf+G5q6vkwbF1Y7f79qf3FFYZ0mreNWz+oI81ySI3rEDfDVpeJxEt7N5+d+S
 PTc+k7FPFyG3qd9VQXt1kWIJxC91CZcglASswPJMNsRiH/iXF1mykR4YVYi/A+goVToB
 q2ruWcDKcb/+bd0GLiM6o7fANdoX9E7n4VJtTgtzJC1B6EC8E9SFAbTlbY/ULj4c2Bdc
 d9kw==
X-Gm-Message-State: AOAM530HcaGBCRZxJXaxCjI0Q7CEPq22kvHgQIGw8U90NimPyucipA23
 5BVap5rk+AzURd+Bc90ShllBttD/lvWbsV8L8Gvu6+NnuSCE2vlm
X-Google-Smtp-Source: ABdhPJzcGby9txMNpnM6dDB+1i4WYHtXQh75bUgyPwWul1vT2RSidk/YaPKfHpG9CYxWtJkWG2MX2nBdMjrmuQpOAWg=
X-Received: by 2002:adf:b645:0:b0:1e3:bab:7594 with SMTP id
 i5-20020adfb645000000b001e30bab7594mr15213752wre.346.1646042837663; Mon, 28
 Feb 2022 02:07:17 -0800 (PST)
MIME-Version: 1.0
References: <20220222204811.2281949-1-atishp@rivosinc.com>
 <20220222204811.2281949-6-atishp@rivosinc.com>
In-Reply-To: <20220222204811.2281949-6-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Feb 2022 15:36:59 +0530
Message-ID: <CAAhSdy0Vzdx0y5Kt7JWq6QFRR4OO5Ea5PNF=pN3Nu0Q28r+CNA@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] RISC-V: Do no continue isa string parsing without
 correct XLEN
To: Atish Patra <atishp@rivosinc.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>, DTML <devicetree@vger.kernel.org>, 
 Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_020719_073178_37F86E8B 
X-CRM114-Status: GOOD (  16.64  )
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

On Wed, Feb 23, 2022 at 2:18 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> The isa string should begin with either rv64 or rv32. Otherwise, it is
> an incorrect isa string. Currently, the string parsing continues even if
> it doesnot begin with current XLEN.
>
> Fix this by checking if it found "rv64" or "rv32" in the beginning.
>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kernel/cpufeature.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index c6693873e95c..f3a4b0619aa0 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -84,6 +84,7 @@ void __init riscv_fill_hwcap(void)
>         for_each_of_cpu_node(node) {
>                 unsigned long this_hwcap = 0;
>                 DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
> +               const char *temp;
>
>                 if (riscv_of_processor_hartid(node) < 0)
>                         continue;
> @@ -93,6 +94,7 @@ void __init riscv_fill_hwcap(void)
>                         continue;
>                 }
>
> +               temp = isa;
>  #if IS_ENABLED(CONFIG_32BIT)
>                 if (!strncmp(isa, "rv32", 4))
>                         isa += 4;
> @@ -100,6 +102,9 @@ void __init riscv_fill_hwcap(void)
>                 if (!strncmp(isa, "rv64", 4))
>                         isa += 4;
>  #endif
> +               /* The riscv,isa DT property must start with rv64 or rv32 */
> +               if (temp == isa)
> +                       continue;
>                 bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
>                 for (; *isa; ++isa) {
>                         const char *ext = isa++;
> --
> 2.30.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
