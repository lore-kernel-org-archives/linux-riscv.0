Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441F4C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 07:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RyEVlt2dEeOhrtgTT4BseedsTV+4UEMgATfM9LxAZik=; b=KxK3/uY3PIxvJd
	gWSIcOLJs6Yp1JXVmLwT+2JpB9uSX32LPzQzf2jyuOV+yOz/M94zdiXn9E1Xvgjo9CeBQ/sIn0wZT
	aCHyH/ISFFZeMGbA85wSS9xfMA9GbfIi9PKUK6hrY8ZnbUf+lY1psYBZUwftS6l262Tv1a9T/E+qt
	i/EfxslLa+6jxfoXg/3UuMi7lo6MOoMe3Td7TOQoAOCd+gRPB0qDm1GAsh2gsFOS5WQkpMRFLw7Ab
	iUGxvgi3sKvzCSGxSHm/k27yck7PLfHL7pVVO+jpPpt3l8FYRXQmGiAL58BN7jHgBNpKnboOtaLew
	xPJI/VFKBWcpUyZV4H3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh50t-007r7F-6A; Wed, 20 Apr 2022 07:44:35 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh50F-007qhB-K1
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 07:43:57 +0000
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2ebf4b91212so9070477b3.8
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 00:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4rECfG0J0jcZuxwrgwhg30CvDbd+wKJQrKHF5lEEWz8=;
 b=JJ84zEuWmJdIZ7TstEV8XP6tov0sYCEo450P8hEILZNpuvqlc8LvmWDw8vMK9BIzyx
 p80wG38wyBCDllGZ8kRIEVtDhjYvl5nJhws3qJnrkrbECz8bby3fQzPYKA5RPVLCLzfJ
 eni5YMWY7Iu1XUrIumWZfAM5TinCUnaEoTBPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4rECfG0J0jcZuxwrgwhg30CvDbd+wKJQrKHF5lEEWz8=;
 b=5S4Aw3tgwVBl4I3lAD+N742QyIUM9HPu2x4IaGbSPA5zj32kkMF72orw4LbAAKSHWb
 57Pp+xe1/+AS3QJ363j1kYF8OoEej+r4BzDBArzZUA5+zzT7w1Dkl7xHXiKyby4DXqie
 q/7GEhji/lgy14AQfGV5QdWlxs8rbo3nceo/AKhmzjykYZbLOX9dlBsRsfmKYvhyjnrB
 ivz1Vyu9Yu6lgdXk3m4ZBXf/RK/2UkjZT7Vjb4ztGg4s80pQPDoKO7V1CWyDKoXlfpUu
 nFJksVikPdxsoGG1A/Vz/KpcdVNztK9hf+IVGVXHYT3B5w4eAMI7hOvbZMU+IiuiTGwZ
 Wmjg==
X-Gm-Message-State: AOAM532S+c0pZPaVTuCE1eHgJuDxC2Sz49PWFojp1rt2i8tOPdw6aHdB
 cH/IQx+42Z0W0RAaOMtV8TJ22e2PShU8BbJqnky2
X-Google-Smtp-Source: ABdhPJwC6ND2mFoDrO8/LZH+VaOdsYNDA7F6jKsenEvyVuoe+DYFot+AtDlzxrI+mCwBEaCI0C4EwGHyNVH1lr+kPjQ=
X-Received: by 2002:a81:5285:0:b0:2ec:471:e745 with SMTP id
 g127-20020a815285000000b002ec0471e745mr19863668ywb.443.1650440633909; Wed, 20
 Apr 2022 00:43:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220420013258.3639264-1-atishp@rivosinc.com>
 <20220420013258.3639264-2-atishp@rivosinc.com>
In-Reply-To: <20220420013258.3639264-2-atishp@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 20 Apr 2022 00:43:43 -0700
Message-ID: <CAOnJCU+r8KhhQP-LZN+oGGCDkdQt9ZbF+LCTtZWY8r=qwmSOng@mail.gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: KVM: Remove 's' & 'u' as valid ISA extension
To: Atish Patra <atishp@rivosinc.com>
Cc: KVM General <kvm@vger.kernel.org>, Anup Patel <anup@brainfault.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree <devicetree@vger.kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_004355_730807_36F6F5B5 
X-CRM114-Status: GOOD (  17.04  )
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

On Tue, Apr 19, 2022 at 6:33 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> There are no ISA extension defined as 's' & 'u' in RISC-V specifications.
> The misa register defines 's' & 'u' bit as Supervisor/User privilege mode
> enabled. But it should not appear in the ISA extension in the device tree.
>
> Remove those from the allowed ISA extension for kvm.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/kvm/vcpu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 6785aef4cbd4..2e25a7b83a1b 100644
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
> 2.25.1
>

Sorry. Forgot to add the fixes tag.

Fixes: a33c72faf2d7 (RISC-V: KVM: Implement VCPU create, init and
destroy functions)

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
