Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEA2C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 08:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LBw/9zyCKhjACz3uVLJ5Af3J38UKNEJdieQCn2Mgk64=; b=xHqfd4OG+KRG7w
	Cq5pstyIUvcEZ7N1xnuN/g37158nXPlQCtRgGtIBU2oPhT6lgn3xOFKy5KS7zb9rJn9N8t/MyjE0M
	5QgQDfdz6+R1MNDneiOF9tTQ73Vt8CCar1ojb2uhWFAdNqOKE8eiu+BgHtupLuKRx9KxJMcmi/jDI
	cFXF5a67nS7rKEeKiar26BxhVCQ0YktOin/h0WCslaDcYlanaWSjrhbfLvSKX9W8fhrMo3Rod5uuk
	UFy7h2pTxzNsCktncnHCOnrkDN+tN4sqkYZjDgdpJZne22rx57E0VHGy63yJkD+EwYm6I2fsrNOgE
	L442RNc0MPlC9JLMUrVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh5zN-00893G-Ck; Wed, 20 Apr 2022 08:47:05 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh5zJ-00891v-Pe
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 08:47:04 +0000
Received: by mail-lj1-x235.google.com with SMTP id q22so1087028ljh.10
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 01:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JjwgVR25fOpo94MrJPZVArRITLkolD2RuuKCBdYhNzY=;
 b=RZ+ikrgo+BjsNGw26e+go2LbMbf96IPh2LW4clRqX8E2MnxFpzoFF8JiPsOQv5xAy7
 NZwc3XyJEvUe8gJ/3QsBAwWl/Di4ditGXZ6zJTARZOj8GMVpycdsO8rAu0uK4/a+DbgB
 Pbc20OzJRVV3LjHumKVHbdWO1V6a0/Bfa1EtfsUob3C/viSfnSxaxBCKnNmLEbR23NfM
 9NSe+IOUfKbNfsd/vL5KRU9w6TSEzm+Z4oxXnCjyldFCHQ4HcQgS30evggmpLC9WprTh
 /4X0G38pPFj0fV0e8yHy1xg8HJds0Rk4riqcssz5CwJD7TmiQb4l3dUJO6ZpSlCyvgVw
 O7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JjwgVR25fOpo94MrJPZVArRITLkolD2RuuKCBdYhNzY=;
 b=AtyEvPQRML2DrMDMzmBVJEb0Posrbo2ScWlt23gtsQ5HtI+jvezIAmnv7pM+fk2vTw
 nS2aZzxgMuYADA4HRcP3CsLdX7TqD9AYE/lnWuir5Ct22YK42U8fHwko1QvqvR45AA99
 P/EsT71L7kIj0B8VKw7yNnRbD5aGFof7rWSKfptaSNQ3W6zl9TZyw+LqkcssrB+P7S6F
 nPPF37FMI5PpERlrGoqUq5sREmByvvwVyC52W49ZtdpFMH21U+KzvyqrfPZrfH1iP6fY
 xlnPWbNieiIxrpUVpzMOeNWOMi7yAKhY49L3PrkRSweSCrcvmNp2AXagh/6OgQxpZ9WT
 RolA==
X-Gm-Message-State: AOAM533vw8oriXTwvmDj+ZZT0zKzJobWp0r3imW6MNgPS/0nVb3j31c0
 VfiuexUwlHeHS2Wpksqko5lanfF9uELwJOXb9cu6mA==
X-Google-Smtp-Source: ABdhPJz+h1GX4XLudNgrwSIEdojpi93OmucwSzatZwTI4giwColnNsRBurf+uc0IKVn49/2aHe9h3XLzaMebnRm9LS4=
X-Received: by 2002:a05:651c:1784:b0:24b:ce8:528a with SMTP id
 bn4-20020a05651c178400b0024b0ce8528amr12675701ljb.364.1650444417868; Wed, 20
 Apr 2022 01:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220420013258.3639264-1-atishp@rivosinc.com>
 <20220420013258.3639264-2-atishp@rivosinc.com>
 <CAOnJCU+r8KhhQP-LZN+oGGCDkdQt9ZbF+LCTtZWY8r=qwmSOng@mail.gmail.com>
In-Reply-To: <CAOnJCU+r8KhhQP-LZN+oGGCDkdQt9ZbF+LCTtZWY8r=qwmSOng@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 20 Apr 2022 14:16:45 +0530
Message-ID: <CAK9=C2WHwRLyRHw4AVFpZcYJsDdGwaza_cpQsaMz-4qVamc+VQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: KVM: Remove 's' & 'u' as valid ISA extension
To: Atish Patra <atishp@atishpatra.org>
Cc: Atish Patra <atishp@rivosinc.com>, KVM General <kvm@vger.kernel.org>, 
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 devicetree <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_014701_880887_98E51692 
X-CRM114-Status: GOOD (  20.00  )
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

On Wed, Apr 20, 2022 at 1:14 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Tue, Apr 19, 2022 at 6:33 PM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > There are no ISA extension defined as 's' & 'u' in RISC-V specifications.
> > The misa register defines 's' & 'u' bit as Supervisor/User privilege mode
> > enabled. But it should not appear in the ISA extension in the device tree.
> >
> > Remove those from the allowed ISA extension for kvm.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/kvm/vcpu.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index 6785aef4cbd4..2e25a7b83a1b 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -43,9 +43,7 @@ const struct kvm_stats_header kvm_vcpu_stats_header = {
> >                                  riscv_isa_extension_mask(d) | \
> >                                  riscv_isa_extension_mask(f) | \
> >                                  riscv_isa_extension_mask(i) | \
> > -                                riscv_isa_extension_mask(m) | \
> > -                                riscv_isa_extension_mask(s) | \
> > -                                riscv_isa_extension_mask(u))
> > +                                riscv_isa_extension_mask(m))
> >
> >  static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
> >  {
> > --
> > 2.25.1
> >
>
> Sorry. Forgot to add the fixes tag.
>
> Fixes: a33c72faf2d7 (RISC-V: KVM: Implement VCPU create, init and
> destroy functions)

I have queued this for fixes.

Thanks,
Anup

>
> --
> Regards,
> Atish
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
