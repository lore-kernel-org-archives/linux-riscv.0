Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2511CC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Mar 2022 03:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u2+lV/8memu5y+x3ZK5lVWW42XuKRCI+A2MOfjs7b5I=; b=yVxZUlpyetJYUo
	70xBgc9/Rvt8T6Z5sYx+gd0lu6VRpxG5q3ClBy66J02JToZQZTkV6+8qXap8Z2a4H8yytDiiUgyMF
	j72YGH+x3eTBMtwveH8F8shuxUCcCr6KB81FJP5m/HddCfpuZYUjMyJjwGbU2EgAx0v0iPdIWDW/e
	zeHj5uJLl3aW3M2duJMKiStIZwEZwzeUivx5+CrK0QbKc3LvCBbqv1PfSmlvGKgpBQXUnOuwrB0kr
	4iKwEwzF2dQxKLbDJ09/iDKX68JCAu5rS0bn4HskRUWIyS1TLQtbcs7beuD5slVUogw2bZO0L+8HM
	C45adbj3jdOsh94PVY/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV3Fk-000GNL-RD; Fri, 18 Mar 2022 03:26:12 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV3Fi-000GMU-Av
 for linux-riscv@lists.infradead.org; Fri, 18 Mar 2022 03:26:11 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 7-20020a05600c228700b00385fd860f49so4217410wmf.0
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 20:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CDuSjmRhr8MOV1rhbEGNhveI41ON6vxVElre6la9kK4=;
 b=gQPTka+LUuoi8LUTzV1fKgYIUHP3QdXLh7Rb+5kWyfTZdWiB6/SAIHDcj0/kSCEZgJ
 2gw+Z40Fyf5lKxwBcUFYZEjUrDgrbX879AxVss/Xj0uqEMfm90GbdI4SRvh2YkhQ1YNY
 P+9uCZE6nF6x4E/j3zI0lur7fFO058AYty+26RtTAelygMkaKxgtO5N41P/Tnz7hGsxA
 V3FBMhHMqKk8cWn93Da5qzFkwIyv0sG7VjFHpKYZ0Pv5PIMziBkMSQZJCYhEvwm5JFeZ
 BLkcSTw7m0760UWmBbWK4aj0MoYoXVKU4DqnDqeDRY0wKOkH0bAvhtb7pVWFU6LP9/Ha
 MNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CDuSjmRhr8MOV1rhbEGNhveI41ON6vxVElre6la9kK4=;
 b=x7pgpDktbd3WIOIbfaEjKFPDNaaFNKXF/x7aNGVSkAxaM18dxDzV0+7qcMl1xjxzLx
 mTEVZeyyYooKiHIEMHwT5MDOgXJ91Ht3mz8XXDu10NeThUwVjo8mbbzZRnAw62SaKZP8
 cKD6CxDSBPcSgkB6AICncBTkEqBvjXFfzjOmsGrf/T8uQ6Z0U479IS/eog6wKGKZIOgU
 4r+SNHeekEa1xzQTCjiOM4F05JoLGszDXJsqsp+drsmImjO9ok3to7zraLu8Ir1rYKhs
 c0YCA9ah5pWk/8r2g0/qvpIYVSltgiZ5ia+8hTICKKdo/VVMeQ3TiX+v/eKlQeSlXzFn
 2tGw==
X-Gm-Message-State: AOAM530nzURzDoa9nsnZFIZesSAy4B2qymTSxqcarJ7HaFiNU/VB7fgI
 uf1cXWTZYn9H/2gLAUimMTdqfcsnm95U5249v3IFrQ==
X-Google-Smtp-Source: ABdhPJyTHL26FWcH9VnnHBMM+mTieR7VP1cfwTA4HSK/6ggJqBpHpzhFEL9yEYep6RtE18lyOJhN+b6nTxldom/V5Y0=
X-Received: by 2002:a05:600c:3516:b0:389:f9aa:f821 with SMTP id
 h22-20020a05600c351600b00389f9aaf821mr14115817wmq.73.1647573967585; Thu, 17
 Mar 2022 20:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220304201020.810380-1-atishp@rivosinc.com>
 <20220304201020.810380-5-atishp@rivosinc.com>
In-Reply-To: <20220304201020.810380-5-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 18 Mar 2022 08:55:56 +0530
Message-ID: <CAAhSdy3bPuhqcZWpZpDP_DGiMEc97aMEjspum4K9k0D=24fYsg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/7] RISC-V: KVM: Remove 's' & 'u' as valid ISA
 extension
To: Atish Patra <atishp@rivosinc.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@atishpatra.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>, DTML <devicetree@vger.kernel.org>, 
 Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_202610_445432_A9DC5BC9 
X-CRM114-Status: GOOD (  15.31  )
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

On Sat, Mar 5, 2022 at 1:40 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> There are no ISA extension defined as 's' & 'u' in RISC-V specifications.
> The misa register defines 's' & 'u' bit as Supervisor/User privilege mode
> enabled. But it should not appear in the ISA extension in the device tree.
>
> Remove those from the allowed ISA extension for kvm.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Both PATCH4 and PATCH5, fix the "isa" config register of one_reg interface.

Can you send PATCH4 (i.e. this patch) and PATCH5 separately with the
"Fixes:" tag so that we can have these patches as RC fixes ?

Regards,
Anup


> ---
>  arch/riscv/kvm/vcpu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 624166004e36..3ae545e7b398 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -43,9 +43,7 @@ const struct kvm_stats_header kvm_vcpu_stats_header = {
>                                  riscv_isa_extension_mask(d) | \
>                                  riscv_isa_extension_mask(f) | \
>                                  riscv_isa_extension_mask(i) | \
> -                                riscv_isa_extension_mask(m) | \
> -                                riscv_isa_extension_mask(s) | \
> -                                riscv_isa_extension_mask(u))
> +                                riscv_isa_extension_mask(m))
>
>  static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
>  {
> --
> 2.30.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
