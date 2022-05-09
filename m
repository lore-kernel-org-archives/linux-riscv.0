Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB45C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 05:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8xItOxNjBwIaz8V7MQfG3ziKAwc9NJFC7AGbm3SozMk=; b=o/+z99bkoI/1/a
	UZfRrssnuX7xyj3cBQ6iUa32NVZ/fO1TWcxPZmPBAZi6xvXX0+FglUr9iv4Z/YJViskQsHXCcnYqy
	+GDNc14ueFqp4Wn2vI9+bbMMRogbnu+W/RhotQ2heiZfQy3UgvH9UktqvAQofOD+VYwk0JhZORGY+
	Dd66FETWj285UC9w/veo8kvrLRDqlX/CZFqLRPyAsX7UWXnWvsCNBuH90pydkXnam+Wjei5O/KzPF
	OcLYhFmb+mZl20NmpcS9vxklGstYfXsrYjtudsGz4MbDmc40o26tCaA3ONQqOQwy8o6V6RoU3KHJc
	duvIjqMV5saoaohxoHSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnw1o-00CXFc-9q; Mon, 09 May 2022 05:33:52 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnw1l-00CXDa-99
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 05:33:50 +0000
Received: by mail-wr1-x430.google.com with SMTP id v12so17770495wrv.10
 for <linux-riscv@lists.infradead.org>; Sun, 08 May 2022 22:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PLUNZth0Gzu0RXkdCxlC7YsvIKkko3pZWci/8TjWfsg=;
 b=1fEjcPA9ZwqimNLicimZh7D54btJlReV6ttUi5sPPHZnlucnlayki28FnMUzJ/QL9Y
 M3c5KF+PPpNktxtj878OD+pC4SkuQy2P6dLZQYUe2Cujk0Gb7K/0i0a8L3+IV/hrdY4w
 clL8WGuArZLzgWuOlj6y5KUXWtm0lP97uo8OZdfkDmwLMoLvksx9f6ufrBVKNZkXmh5d
 nyuQNHzTw/00jpMFdO8AU/V3rp4KrVfb5sHGTxhTXdr+wSJhwyUxsMYI6zF73msEMXuS
 oNnwgVMaQmo1HLNVjh1tA9fH8g64Xjq73hzz8gXkMiEDk3tyUN8wHgrRYsJh1psS5+Rt
 GXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PLUNZth0Gzu0RXkdCxlC7YsvIKkko3pZWci/8TjWfsg=;
 b=pNCs7XG9mQf2JZ+weZ9fBi9yZzV2Bnu01v/slIAqB0IOFoGTskSPOoOQ9ubjt/+JF6
 xOMQt21cP+Eq3oKfQFBNPfcg0GFHRINWtLd2hYucYw2FbtTVelUax4I0RyHnSc0fvhcO
 1NMqFnON25CxHBZEYnnA7uZNY8aBKdXWLO3KfUk/8HSv1TkY7VdkIyxkqF+78S0nemR5
 UuawiFw5QIGegtLDr+crKsYGjWXLaIEUpeO5befJTXei5fqVkrEKasHV202auKqGGNdW
 eQnEoGOlEQWPB4mCCY5el0213DNAuyj71ycGKISIxGKlGi7CixtJoYEa2VoMUuKgC/s8
 ra9A==
X-Gm-Message-State: AOAM530DN9SNeQuE3rKQkRd5/D3qSusMfu0iI0kmUXAoc4WY+f3/twvV
 xyHP1Z8OiwucjivDSo04UPul6C0Es1TcDWWGDCgE0g==
X-Google-Smtp-Source: ABdhPJwm5HiGVrJo6H6A2ZwkRwo0cXAPq+C8yDH3Ar/UxfL9RCxY1/yZPp8l+hlWdvpp1E/Vv7lPAPz1K2H2BhU6/ug=
X-Received: by 2002:a05:6000:12d1:b0:20a:d901:3828 with SMTP id
 l17-20020a05600012d100b0020ad9013828mr11892146wrx.313.1652074425312; Sun, 08
 May 2022 22:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220420112450.155624-1-apatel@ventanamicro.com>
 <20220420112450.155624-6-apatel@ventanamicro.com>
 <CAOnJCU+yd7hqauHRYwnPqNKEgfy5FK06ezR64aH0Hm2AcNNadw@mail.gmail.com>
In-Reply-To: <CAOnJCU+yd7hqauHRYwnPqNKEgfy5FK06ezR64aH0Hm2AcNNadw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 May 2022 11:03:34 +0530
Message-ID: <CAAhSdy1vwQ6BmjzvSuJHc8V37U78PPjGS19+XEQHHqE1=nQRpg@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] RISC-V: KVM: Reduce KVM_MAX_VCPUS value
To: Atish Patra <atishp@atishpatra.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, KVM General <kvm@vger.kernel.org>,
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_223349_347395_16DCF810 
X-CRM114-Status: GOOD (  19.51  )
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

On Wed, May 4, 2022 at 7:45 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Wed, Apr 20, 2022 at 4:25 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > Currently, the KVM_MAX_VCPUS value is 16384 for RV64 and 128
> > for RV32.
> >
> > The KVM_MAX_VCPUS value is too high for RV64 and too low for
> > RV32 compared to other architectures (e.g. x86 sets it to 1024
> > and ARM64 sets it to 512). The too high value of KVM_MAX_VCPUS
> > on RV64 also leads to VCPU mask on stack consuming 2KB.
> >
> > We set KVM_MAX_VCPUS to 1024 for both RV64 and RV32 to be
> > aligned other architectures.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/kvm_host.h | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> > index 806f74dc0bfc..61d8b40e3d82 100644
> > --- a/arch/riscv/include/asm/kvm_host.h
> > +++ b/arch/riscv/include/asm/kvm_host.h
> > @@ -16,8 +16,7 @@
> >  #include <asm/kvm_vcpu_fp.h>
> >  #include <asm/kvm_vcpu_timer.h>
> >
> > -#define KVM_MAX_VCPUS                  \
> > -       ((HGATP_VMID_MASK >> HGATP_VMID_SHIFT) + 1)
> > +#define KVM_MAX_VCPUS                  1024
> >
> >  #define KVM_HALT_POLL_NS_DEFAULT       500000
> >
> > --
> > 2.25.1
> >
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Queued this patch for 5.19

Thanks,
Anup

>
> --
> Regards,
> Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
