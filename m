Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9527EECAAD8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 05:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ewrABuMtslF/Wc6iabEfcNyQLOmuT4Aa5gqd1quiR7M=; b=rXk1Og2OtkEvXZ
	dRVKpmzdS4Rs/JMVxmHcaYLXfQqLemd+rhYqZCRJ/b81gi9kohUzQ6GqM6wmd48cTDsStigVptC/B
	5sEY35xB9fG3BwJch0rKP/rpuHbfZ8z48tkvUHSfYlydPTzC9Ila6QQTeVh2LOZE16zbmK6Iq3tna
	PMgNqqq5qFLjy1IFtAlWA8MJdZ0D8WMZfyf4/q5uBfkUKfXkPmVuQ7MmsP06pD3ijsT+myWFXx5s6
	kNroYO6MQr3ji9CULQdeRBcetp3Hdqmbh2oFyBen70iifJ//vWQ07QbfIpDR9BOGr93mUs/CK4h/u
	+8Lrrk4y/YXH9xYqR5KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ3SZ-007ser-Bk; Fri, 16 Sep 2022 05:00:15 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ3SV-007sRY-Lj
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 05:00:13 +0000
Received: by mail-io1-xd2d.google.com with SMTP id n81so16179921iod.6
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 22:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=bKygYTvjEKEBNRDEZXtXhWOlX6vaC0+Zex0fl1XbnPM=;
        b=KdBA4v3rOunzK+xLcSfGxBleQsAtiSTGZL0tORFMd3++nYFpDWNddKTsqUuyJf3BlE
         ifNY+cdNWSRdaKNV8Qoa/E+QBydloOXbCb2VNScGF77lGfomWyRfvd6TZ64kBnIHw4dA
         g+VOEkGTt2/hll1aSSYQj/9RsP/OK7TyAjSjkVGMpcR/JNb9A3CbBATOoQppYLL2p2Y/
         RnOluBNDBURgp7WsnGcPV7/1noAuRq8dKSlckYudptGIB1E4paip4RMsHuvRxm/qM+NI
         e4b0qfC1pfIP42wqoJb/8TQxOtXwu7jMWysVP0gf26ocTuFUqATDt4XcajESRBJIRhE6
         LMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=bKygYTvjEKEBNRDEZXtXhWOlX6vaC0+Zex0fl1XbnPM=;
        b=Jt02NgUvsuPrnQIzFTnqljvu5mqqzEALhIMBw4jWFCUpH3g7+tr44WNehAK/wSH8Pw
         CoGAubLhCxo05SXI++7nM+6cgKKp6awEjj1nojvCnvqC9LSZG2cYKdmJGgzWQRhw1oKR
         52CXh6Q1zRarXQyxB47oRXj2TRwn1blzp0uz+O9uSWu2SrQlP0WzLeFxUy5OfVp/YcjO
         hz5FAclhz6jR8XdyeBttcxc2EFaOm1ub+BSUkH0pnX04QHu9GEED5AqEOdozj2O44OLe
         pCwHY1CgEiw02krmmazX4g0+q+lrvP32uEIcnJH8vn8NC1lSObEPMQ/VnMVygsktvCfJ
         Kk9Q==
X-Gm-Message-State: ACrzQf1tkgCwv1nzn+76SScy3IIF1LAM+hfKB8INmyrNkcc/PP5TU40g
	f/fxcrar+wcKy1f21bDPs+gMoCsQZmBKDzKZQPUGoA==
X-Google-Smtp-Source: AMsMyM72+hfnNGiGlXYNaeL/WF4pHIiV2cNC/m/eAyzLyDzNpIxf0SFv0Yllm7X3h9SB+d/xdsbVCo+5CXj9LMrDnoE=
X-Received: by 2002:a05:6602:2e0e:b0:684:e4f9:734a with SMTP id
 o14-20020a0566022e0e00b00684e4f9734amr1223608iow.200.1663304409492; Thu, 15
 Sep 2022 22:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220908110404.186725-1-apatel@ventanamicro.com>
In-Reply-To: <20220908110404.186725-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 16 Sep 2022 10:29:57 +0530
Message-ID: <CAAhSdy1RVVq28h3FtbmToTOZJKPza4t-uFLVV2Uotj3DUrAEHw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Change the SBI specification version to v1.0
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_220011_763562_BB67AA47 
X-CRM114-Status: GOOD (  14.91  )
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

On Thu, Sep 8, 2022 at 4:34 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The SBI v1.0 specificaiton is functionally same as SBI v0.3
> specification except that SBI v1.0 specification went through
> the full RISC-V International ratification process.
>
> Let us change the SBI specification version to v1.0.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

I have queued this patch for 6.1

Thanks,
Anup

> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index 26a446a34057..d4e3e600beef 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -11,8 +11,8 @@
>
>  #define KVM_SBI_IMPID 3
>
> -#define KVM_SBI_VERSION_MAJOR 0
> -#define KVM_SBI_VERSION_MINOR 3
> +#define KVM_SBI_VERSION_MAJOR 1
> +#define KVM_SBI_VERSION_MINOR 0
>
>  struct kvm_vcpu_sbi_extension {
>         unsigned long extid_start;
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
