Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D10C32771
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Sep 2022 09:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YGW62byY+Oyq2tBzkZ0nQIWhLWFUU8jZPO2CvlelIvY=; b=ujZxElm6eyBlqt
	5qHsX7AwZ4Emw6dQBEVaWv8Z4sxekQxulFCMNLsjzxrM8Gq/j3pftlXLUa7zQJyYg3SOsl4HdPqxh
	9lGaLMbT0lT+pRe9zj8G8IDTNn0vYCdpaps1Yoo6X80s/U3dIsJSCmlIKfiiW9bOngQ9rv9IAmD1Z
	3C3ms6JafbTLc+/3GQuWaHHJ55d4Mvy7oY6KWqTGrl4EwTO9jMPc61K+5yCZhynE4Gcs+TVrBkRPZ
	UfzSdRVzMgTvXeezuaB08MsR5nJwb6xom/OLrlH67RmyF/KGcOkrMSinWvgyDiYCMjPSX+/qIYcOF
	c2Gh3HNOmUzdxtGrmxsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ockNh-003cRL-Sl; Mon, 26 Sep 2022 09:26:29 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ockNb-003cLw-VO
	for linux-riscv@lists.infradead.org; Mon, 26 Sep 2022 09:26:26 +0000
Received: by mail-ej1-x62f.google.com with SMTP id l14so12711435eja.7
        for <linux-riscv@lists.infradead.org>; Mon, 26 Sep 2022 02:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=J3UU4PYtAjB1g3PssXvXc/IUOjQjV2cgzolyDJw2V2U=;
        b=HUMsdSM7O34xhKz3+uUjFdjwgQLsFZi8g9hEQ3KWP1nneKWXTOY++mtem6IumIzm1E
         rN7jdJ5gbGU3jnb5Jgt4cWXy6wdrTrFkd9DeYbrLu/wwOngypp1nW6z09aQ+Ci8/TArW
         JSTJRTPcBllPUAclderXeC+bYEnVmGSgNBRtjzM3bn/mTAba0I+jw5nLKoc+6WJpqxQl
         3sIkpiew4zs3N50BRkzQmPIuStXdGULdnXN0SYq1SofIkxZokcmUYbFMRsnNDrdrZIwc
         oDZqFqVk5uPf6fUxpRbbvYJDSjbzzt+wvRte8yGesagFwa2T4zaOdhHfsAoeIgxjQX0Q
         VjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=J3UU4PYtAjB1g3PssXvXc/IUOjQjV2cgzolyDJw2V2U=;
        b=JmLNH8oHMOXpMC9L8KNG6SuLlHrrol19HVq7QWf7svkCwQmtPURq4oFwB2ZUdM7Z42
         fq16tfoWG7aCAz1s4Sv9eMV373ppnDi0U92d+8S64NMP9Xugiq/zb/2PLCOUDhnvagK2
         4sNZotrFxLTRTpFDf6rkKj3/jsncx99h7678TrDK7UJ0z1C8aIHnfotiidSlNZh/AR2Z
         rUNeZHxR0jcFA0yf5uEdL6b6QyVWz/Y3l4h1+tgavpootOPOWeLDYovS3xn+MVdzxyp/
         Bjm+Be7MaQSrCScTRp3WEcA4vLFXYmYBsvzYuolD0NCl7bNtN366uAfZ76bXvFQbpDmN
         deqQ==
X-Gm-Message-State: ACrzQf2DBhxdFUXVDjaFVI21FaJJP01jnpjthOxjRkznKILwomYwvXE8
	/ZiWrX5wmLuZXnkwZTyQvUg7dHZ6/zMVYLPbouY3YryfSbg=
X-Google-Smtp-Source: AMsMyM6nYvmM7bgKe2ZHTZWdITKlc9t16p7/0EkfLlt/M4HtIz6DMRqspGRQkbdcaJ01qzhTwwGlLvgVWwXqIE3hdXk=
X-Received: by 2002:a17:907:2724:b0:780:1464:f8a1 with SMTP id
 d4-20020a170907272400b007801464f8a1mr18038467ejl.106.1664184379448; Mon, 26
 Sep 2022 02:26:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220919133719.230337-1-ajones@ventanamicro.com>
In-Reply-To: <20220919133719.230337-1-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 26 Sep 2022 14:56:05 +0530
Message-ID: <CAAhSdy3p69tFiS4V5PSWVws-=s+WihQ=DXfFawyG3L8bfQ3a4Q@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Make ISA ext mappings explicit
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	atishp@atishpatra.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_022624_015033_C2A4ABDC 
X-CRM114-Status: GOOD (  17.85  )
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

On Mon, Sep 19, 2022 at 7:07 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> While adding new extensions at the bottom of the array isn't hard to
> do, it's a pain to review in order to ensure we're not missing any.
> Also, resolving merge conflicts for multiple new ISA extensions can be
> error-prone. To make adding new mappings foolproof, explicitly assign
> the array elements. And, now that the order doesn't matter, we can
> alphabetize the extensions, so we do that too.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

I have queued this patch for Linux-6.1

Thanks,
Anup

> ---
>
> Applies to riscv_kvm_queue
>
>  arch/riscv/kvm/vcpu.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 0de0dd22e734..61fe1604e8ea 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -42,19 +42,22 @@ const struct kvm_stats_header kvm_vcpu_stats_header = {
>
>  #define KVM_RISCV_BASE_ISA_MASK                GENMASK(25, 0)
>
> +#define KVM_ISA_EXT_ARR(ext)           [KVM_RISCV_ISA_EXT_##ext] = RISCV_ISA_EXT_##ext
> +
>  /* Mapping between KVM ISA Extension ID & Host ISA extension ID */
>  static const unsigned long kvm_isa_ext_arr[] = {
> -       RISCV_ISA_EXT_a,
> -       RISCV_ISA_EXT_c,
> -       RISCV_ISA_EXT_d,
> -       RISCV_ISA_EXT_f,
> -       RISCV_ISA_EXT_h,
> -       RISCV_ISA_EXT_i,
> -       RISCV_ISA_EXT_m,
> -       RISCV_ISA_EXT_SVPBMT,
> -       RISCV_ISA_EXT_SSTC,
> -       RISCV_ISA_EXT_SVINVAL,
> -       RISCV_ISA_EXT_ZIHINTPAUSE,
> +       [KVM_RISCV_ISA_EXT_A] = RISCV_ISA_EXT_a,
> +       [KVM_RISCV_ISA_EXT_C] = RISCV_ISA_EXT_c,
> +       [KVM_RISCV_ISA_EXT_D] = RISCV_ISA_EXT_d,
> +       [KVM_RISCV_ISA_EXT_F] = RISCV_ISA_EXT_f,
> +       [KVM_RISCV_ISA_EXT_H] = RISCV_ISA_EXT_h,
> +       [KVM_RISCV_ISA_EXT_I] = RISCV_ISA_EXT_i,
> +       [KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_m,
> +
> +       KVM_ISA_EXT_ARR(SSTC),
> +       KVM_ISA_EXT_ARR(SVINVAL),
> +       KVM_ISA_EXT_ARR(SVPBMT),
> +       KVM_ISA_EXT_ARR(ZIHINTPAUSE),
>  };
>
>  static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
> --
> 2.37.3
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
