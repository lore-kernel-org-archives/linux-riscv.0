Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6909C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Feb 2022 23:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sqHWlRx4e3ebdZmaiHoDHiwZQknnwmolUbPc0PJz9VA=; b=X63nrYk2Gscsuy
	92V4BQTt4JmrifbYjQrijjdkPokVdyDTKlgubmp2iSHH9hWb8wm/NNOgUXAGgsaKUlvKHoBAWe9bY
	Z97ITSdgSoJMCGNeHmN1+HLQAmRNZ4XAk1WtH0O7h860D19u8nPK0t/vTkzd0V5vLrzFaA6s0h8go
	hZJU+nQBfOj3F+/byf7Ilr2sxgCl7xjz7eEcls5mrovmXxRLoxU5phVZkXmSiWH5Dhu7NuRa9FmhR
	HK4vRAd4I57mPX5D512fcha7ndCAYwcN3VJdPV0JM/Rdp1NetvBEwH6f2dDmPPU+euf4puE1Zf+7k
	N9oItOL0r4qZzwzqsiUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMeyo-00BxVz-8l; Tue, 22 Feb 2022 23:54:02 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMeyl-00BxV7-OL
 for linux-riscv@lists.infradead.org; Tue, 22 Feb 2022 23:54:01 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id g6so23198301ybe.12
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 15:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dpzVG0KOz8Fj+NV1zL23tj2BFq6GNDaGLyfBrIVD5jE=;
 b=PyuvmgVYjrMy43NHY161nkmfLiq4r+5QP/M/Shz+icoZQO2uxkc4Db0hbBtw0ClTlS
 0IgWnqOrCbCQQqeGkcvjXv8uP+NGTHWtzINHx3f726Fw+ZpgNJYYmMntVgzMqG/lz0zO
 hC6O4gQkUYgxE7eBQgrN3fQuI8HquIa7HAgYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dpzVG0KOz8Fj+NV1zL23tj2BFq6GNDaGLyfBrIVD5jE=;
 b=mbpVyfHTXyEUa7+dyXTzooCmvSjBP04GQU28FY1PvJLv1vwACZVGM5MHMqLGTt9kB0
 XRr8BBzH1MxUvZep9udnFqJLBPGDz2UURm8tX/W5Fk+CBVwpprMOg01IO/zUtWbCxrzV
 Q2k8XwPe7lvmlitnHCO6o3e10yZlba+3W/4zOaqRiCRiU/z8lI37UamIvqfeTayDU1tI
 V7qu5Dbmts1kJdtMVMFotMd34dy/XsrBf/NAQcgeRxfks3zocFmZhsOZxpPv/xmcFEwF
 kJKVGuNJzYLLTEDJxIUo2O5MtcbScIA5gW2ZclTIsygbEu+1NKwVrxi7LIRU4MXeQCMw
 YQoQ==
X-Gm-Message-State: AOAM5334AJ2TgUdIELw1K4nJS82xVeQo+ITytbHPjyYeYbzcaq5qV6kS
 h0umNMAUTqXNOLyIoxrX50Dmu2O1jmIltSNAqyqM
X-Google-Smtp-Source: ABdhPJy6UzaGIddYbaCVbtXfioSbcvvSa1AporZq/9wCtEio4EIeXwWb/+d8dyiBe2FBgbDIAvz25JsnqNdgGunLs54=
X-Received: by 2002:a25:d294:0:b0:61d:9809:9917 with SMTP id
 j142-20020a25d294000000b0061d98099917mr25644565ybg.289.1645574038489; Tue, 22
 Feb 2022 15:53:58 -0800 (PST)
MIME-Version: 1.0
References: <20220201082227.361967-1-apatel@ventanamicro.com>
 <20220201082227.361967-2-apatel@ventanamicro.com>
In-Reply-To: <20220201082227.361967-2-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 22 Feb 2022 15:53:47 -0800
Message-ID: <CAOnJCUKKHVxRUA2kdrCRD3-q=DQWP=_gAJn8UovR3jXk3N-qOw@mail.gmail.com>
Subject: Re: [PATCH 1/6] RISC-V: KVM: Upgrade SBI spec version to v0.3
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_155359_875259_E2FB5AC7 
X-CRM114-Status: GOOD (  13.29  )
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

On Tue, Feb 1, 2022 at 12:23 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We upgrade SBI spec version implemented by KVM RISC-V to v0.3 so
> that Guest kernel can probe and use SBI extensions added by the
> SBI v0.3 specification.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index 76e4e17a3e00..04cd81f2ab5b 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -12,7 +12,7 @@
>  #define KVM_SBI_IMPID 3
>
>  #define KVM_SBI_VERSION_MAJOR 0
> -#define KVM_SBI_VERSION_MINOR 2
> +#define KVM_SBI_VERSION_MINOR 3
>
>  struct kvm_vcpu_sbi_extension {
>         unsigned long extid_start;
> --
> 2.25.1
>


Reviewed-by: Atish Patra <atishp@rivosinc.com>

--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
