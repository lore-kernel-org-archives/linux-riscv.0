Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA49C4321E
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 21:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tL86P+i1fWYiFLef5MxsFmqZ9sAIwOmltG6VJchkL4s=; b=agpBj1JgFqqLIo
	vShEfdwCBtD6OOOPJuDwdx7oTI2HAVzp6LEa3GMLhV+0dL06SPZV3iKlFLJ/IBENUTuLKh3oS5cRp
	eKCYzu2tqmS3KjX/4t2WtSHV+KYmgahw2x3ZTZvTPymor/3UbTj6Ez/uM8x6LIYRY2aEXsP+ZgtWA
	JV3lLYSPtEx1BoKzsWICbjPN32f/WCDWMY0KGisg6y+OWACbCcN+Zq9S/uS6mBy8rKMjFh/DG+np6
	S0iMb/eDnqDKdCpMndEYRD7naZjRlT6NVJGVG7DtR2/5I5fqwLS0kZs2EAX5RcE8B88z+TI7Kppcn
	Q2imyS9h0euVANNTw8Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozlIJ-004QXd-CT; Mon, 28 Nov 2022 21:04:03 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozlIF-004QVy-TH
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 21:04:02 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46-20020a9d0631000000b00666823da25fso7848918otn.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 13:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ND1tOqB0oBTvRxF9O3G4bI9whp4Sthfh8GG8dmfGdQk=;
        b=AcU82FtIdY53Q+r2FwFa06LoIYwX4kW/YFLPokX/T/Jgx8JyDOGBajrSH4qRbaEqY9
         ekvjrt3h+35Vnj/bLz7TPZjEdspoLd+8lIRKp4bUn3qU7lOez/OJ62caDsa79DoQdqQt
         JeW3/R5NkEcFg3FNheUJ7FEOXfxxWa+SwUQ/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ND1tOqB0oBTvRxF9O3G4bI9whp4Sthfh8GG8dmfGdQk=;
        b=xCrB/RYTg/XxO/D0OYz8RcRuZnafJs7Hl+XefXZ+9r2sfyX9sEU1evWay1n/yXcB6c
         lBWtyuINkclquKIfP/i/JWQ2/gNqjOVbb/5nX6sm/3g1v/i8U0AhlWaZnJ7AzGhhRldE
         TRqVGHQiL/1+8GyJCAb5Ezmkd85A1JkPCnbvoREjnXvovIhNFvMopM4DZA0ID6WWn7lU
         aUe712v97AQqKGPuV4gnBqs+QMSo8boExoTqUvQTQkE35JYfkC1AlWneZaGL2oIrr+Ca
         RWYryFwyFQ8rSR5LKbg3oiyjobqja5Dc42kwKozTUUT4YQ3dH9WopxXgOFCQn4VcoipK
         L8nw==
X-Gm-Message-State: ANoB5pncZieJv3zTnYvNSVYqLvOGTryPKLLVKrPzzbGJp1B38QF4IJgJ
	qmNORemVWSXB8xeciHiei5hfTQWgJKwRDaorKk8Kjzt4Uw==
X-Google-Smtp-Source: AA0mqf5gBKJg1tXLYyD7tEB8qdO8Vhv8Bt5iOOXz+gzCY+TAeVcPVtinX0bdDrwSvAsh+98qBlffz/W9tkMlevYpNss=
X-Received: by 2002:a9d:4812:0:b0:66d:1e19:684b with SMTP id
 c18-20020a9d4812000000b0066d1e19684bmr27369484otf.44.1669669437312; Mon, 28
 Nov 2022 13:03:57 -0800 (PST)
MIME-Version: 1.0
References: <20221128161424.608889-1-apatel@ventanamicro.com> <20221128161424.608889-2-apatel@ventanamicro.com>
In-Reply-To: <20221128161424.608889-2-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 28 Nov 2022 13:03:46 -0800
Message-ID: <CAOnJCUL4oNd8vN9s2zxvDGzUOmZDtDzSYHsBfGeyBv9BSxrtTw@mail.gmail.com>
Subject: Re: [PATCH 1/9] RISC-V: KVM: Fix reg_val check in kvm_riscv_vcpu_set_reg_config()
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_130359_961896_B414DA5E 
X-CRM114-Status: GOOD (  17.45  )
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

On Mon, Nov 28, 2022 at 8:14 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The reg_val check in kvm_riscv_vcpu_set_reg_config() should only
> be done for isa config register.
>
> Fixes: 9bfd900beeec ("RISC-V: KVM: Improve ISA extension by using a bitmap")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 17d5b3f8c2ee..982a3f5e7130 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -296,12 +296,15 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
>         if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
>                 return -EFAULT;
>
> -       /* This ONE REG interface is only defined for single letter extensions */
> -       if (fls(reg_val) >= RISCV_ISA_EXT_BASE)
> -               return -EINVAL;
> -
>         switch (reg_num) {
>         case KVM_REG_RISCV_CONFIG_REG(isa):
> +               /*
> +                * This ONE REG interface is only defined for
> +                * single letter extensions.
> +                */
> +               if (fls(reg_val) >= RISCV_ISA_EXT_BASE)
> +                       return -EINVAL;
> +
>                 if (!vcpu->arch.ran_atleast_once) {
>                         /* Ignore the enable/disable request for certain extensions */
>                         for (i = 0; i < RISCV_ISA_EXT_BASE; i++) {
> --
> 2.34.1
>


Reviewed-by: Atish Patra <atishp@rivosinc.com>
-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
