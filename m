Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F95C25B0E
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 23:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sJ6L7fWY9W9kRmy1eVARm/tT9ZRJtfbn0pX7AIByPG8=; b=eJj/ERc+yQ0BOD
	Sv7fCFNqmEX/Jhn6oNt+hSG0D339IaoYJ1JT6YONPw8kINeLKqtlHZsFzAP7JKSHLwEie8I7MxlnJ
	yORdCqEOnU8/4V/7QPMrRxufzMADHU/2jo5ouYEzZQaND1XOcY4QpOk+VnaBFzvQGpVCAcURaPNMf
	yKVBU2LrWySWsIO0AdqKkDDNg8y6/HqDm1DjE1wXRv7fTRszYT4yIhdWXy+B72vP6yebkXMsDBFxM
	DxRUmmi3fVIJ9aFObhJEq3kbU5GAEZGCTBlc5EDlYZDOc9b9CfsHOhc/X6I9WLqUB3xAArc5ri2Su
	5UFT16vKYned4Z2KNWcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO6CC-007vA5-9n; Tue, 16 Aug 2022 23:42:04 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO6C7-007v6b-Ss
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 23:42:02 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-3246910dac3so191126167b3.12
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 16:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=UsDhizeqwqVetBtxTd5HgodBbkJnkh0ltjiUgUI+jQ4=;
        b=eBj+LAIZ62qECAHcmP3MzWFxnZURvHv8xBaTPA9yWQL2s+EB1YgTU3/+kQeBWwmRX4
         RswZ//VgQSbEswbgw50nSq2LEt/BVop6aWiYsAWjKw/ebMc9WFzLYaeqXB30MTl3nYlW
         N2pS+kQHxAwkJs/FK/bkNr2tmDuoVi1gDZtuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=UsDhizeqwqVetBtxTd5HgodBbkJnkh0ltjiUgUI+jQ4=;
        b=jq6yY/wHuxaKJ0kDBTLx8rPzEoZ0V76EFScztt5v5Qsdm/Voc0VBdqvjlE3pFYjIsa
         6f3G352e/E2SaXZPb1t+ZAvougfW/70fxe6Bd6wbhxqnAQ7HfTouAFKszcPYls1pAXm/
         OSQi6L3icJPiLNJcWI5j4qYNtxBrIIQGlRNqaPEJoq4QuJwL63nDAmJMT0wPjCxqfPHx
         q6BTwPYe6RD3gysjB7hOCjEqaWOOsLWd4EhudMnYQnM74D9lcwEDk6T+utOgSTXNRgPU
         CcArc1nfmqlzH7uOxUICvq9u8o2t90U9UiIs/Uj3WJBkgYsWBtPFoIlXz1yvRRuRekGA
         3DTQ==
X-Gm-Message-State: ACgBeo1TUVNSv4ihk/yRvWdiAeI5VeE9RKfV4XmcfeYgQKL3fQLZiDF1
	j2YYkuFDA1wXbk3HXGWHs3J2kG5IsMLD41ZH89jF
X-Google-Smtp-Source: AA6agR6e03L1bMEBsFmMBs8EX268jro9wlTh48Fs2gowvF6cpJkq4naexopAUA5x6tZfKrUZltSZ2DYUgLPmzGJeGI8=
X-Received: by 2002:a25:37c1:0:b0:67d:5e63:3f70 with SMTP id
 e184-20020a2537c1000000b0067d5e633f70mr17792182yba.312.1660693317356; Tue, 16
 Aug 2022 16:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220816163058.3004536-1-ajones@ventanamicro.com>
In-Reply-To: <20220816163058.3004536-1-ajones@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 16 Aug 2022 16:41:46 -0700
Message-ID: <CAOnJCU+Gx44ESHWyku7Kb6u5QnzjXiZcat5XmVWjksdFpcQ6nA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Ensure isa-ext static keys are writable
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, daolu@rivosinc.com, jszhang@kernel.org, 
	palmer@dabbelt.com, Conor.Dooley@microchip.com, re@w6rz.net, 
	Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_164159_961357_7262A9DB 
X-CRM114-Status: GOOD (  17.54  )
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

On Tue, Aug 16, 2022 at 9:31 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> riscv_isa_ext_keys[] is an array of static keys used in the unified
> ISA extension framework. The keys added to this array may be used
> anywhere, including in modules. Ensure the keys remain writable by
> placing them in the data section.
>
> The need to change riscv_isa_ext_keys[]'s section was found when the
> kvm module started failing to load. Commit 8eb060e10185 ("arch/riscv:
> add Zihintpause support") adds a static branch check for a newly
> added isa-ext key to cpu_relax(), which kvm uses.
>
> Fixes: c360cbec3511 ("riscv: introduce unified static key mechanism for ISA extensions")
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 553d755483ed..3b5583db9d80 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -28,7 +28,7 @@ unsigned long elf_hwcap __read_mostly;
>  /* Host ISA bitmap */
>  static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
>
> -__ro_after_init DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
> +DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
>  EXPORT_SYMBOL(riscv_isa_ext_keys);
>
>  /**
> --
> 2.37.1
>
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

Thanks for the quick fix. Tested with kvm guests booting in Qemu.

Tested-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
