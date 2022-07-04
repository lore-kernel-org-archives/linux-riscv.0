Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CCDC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 09:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T4L4u1l/BYNFYtAfuPKhF87RReVsSF16jviV6ppG5cQ=; b=jKc8evNrdIoiB6
	7OPB3/tE1Du3lYXTwMCr7/jKmUN0KoVCJi9EatBiEhHBFk6abOyacP4B9P2gZr1fzwjD4PJan73SC
	3noVUsypm5Jm+MSjBjks4FGa82QIJs43V37BtwPiP3RcfgASYzw8Mc7f7GEiHptqqdke3pbRr3Fu1
	LD2lrAJghQJehu8yIkUqP4f0Wj+j9uTh88bo8g6qP3XDgshjwUGIedbMwwZ+uWo+j8JJ2nNqQ/qTn
	tjrXgXxA5c44kQHoKPDwHcxwOGysj5CrduuAmGneBX04GZ+6njEzgW2VwmKrvPPb4P10tm3X1+fde
	MyMbA7pcyMhmyIqAvY4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8IVb-006WRL-Om; Mon, 04 Jul 2022 09:36:47 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8IVZ-006WOl-1A
	for linux-riscv@lists.infradead.org; Mon, 04 Jul 2022 09:36:46 +0000
Received: by mail-wr1-x42d.google.com with SMTP id f2so7231704wrr.6
        for <linux-riscv@lists.infradead.org>; Mon, 04 Jul 2022 02:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q0TyLnReruI9Wm2732Ut83Y4mOFAKXfOkqxOXkTD/V8=;
        b=G1fWW/mpQ2bdGFNaIsSiqulbH86dbUIEM5HWmUU6f/ZgCaOYpV7OCKHesOvaS9YNmj
         AdoUT51LYOQeWxO1vgRknFPkdXOIRzDq9asQ6ILdueOBVe9dWBnLnmBn7PT0ilhPkr4W
         P1Qzki/cxPelPhc7+oB/wvESNGlC2E44VlUHGd/T0p2S93V/7425dJclQ78s+iuJRzac
         hRkYG82SWkWehe9nCNcbagVvjAOcOsMQb+U7fTN3GTJ+43Qg/OfpSY0lptPVgp2liJU7
         CpSfGwAJkXHzzvOA06buA/Ljk7zlp+vV1Rfqoj6monK5miuZwezvA2bqHNPEp9aGRkXi
         HVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q0TyLnReruI9Wm2732Ut83Y4mOFAKXfOkqxOXkTD/V8=;
        b=J8xOWZ00//xGvhuNAou5wXXop5pchtuj8xMv09/czUUK4PGuTmdJ1ifPboTgdQwoTY
         0pJTd1IexZXzgr2zY7lXeKVOd0nKh9Wrr6c4aAROCaIlsIdEyxPbbSMIFXfI3ZnRoNj3
         NxZYf03NH5jDbWUsUnoBiHBJbsIXVW7mfuNcVZQ9fCfyjCBRPHutNvx7BVPJ0PsWKbYl
         JEuzX+WcFx7KbXs8yMJsL3Lk1ZpS0mcOmRh/Y7D85B/SuGRCn+T9jaagmMTV+eTVA2nv
         s7t0wHO7h4DTv/XwvyrT8Z+tVFXaW6F9uGdviC7x1Qp4hH/yRWGZGfXnp2CmUQjuOkV6
         OyxQ==
X-Gm-Message-State: AJIora/KvPrOb+GF4ccsFED00uYppARKmkuI0mY3OXuGXgzNgMttiFJZ
	lVSYhoclhntY/mfHOeuG5/Z+XeSh5JK6USAnmPsaXA==
X-Google-Smtp-Source: AGRyM1txqFZ6XRw/gt33s19FIVnrJxgWXkN0MbkEtqzXTHsDz8SglQyeVKVBcetRPdHeC3qf3WE112AyqnLV4QHet+M=
X-Received: by 2002:a5d:6b09:0:b0:21d:554f:b466 with SMTP id
 v9-20020a5d6b09000000b0021d554fb466mr11247084wrw.86.1656927400543; Mon, 04
 Jul 2022 02:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220615104025.941382-1-apatel@ventanamicro.com>
In-Reply-To: <20220615104025.941382-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 4 Jul 2022 15:06:28 +0530
Message-ID: <CAAhSdy3gmnqB6La125i2hdVh6eNiwqG6saqz4RTTYF=2Gqo6cA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Improve instruction and CSR emulation in KVM RISC-V
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_023645_109320_B84471B5 
X-CRM114-Status: GOOD (  14.43  )
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

On Wed, Jun 15, 2022 at 4:10 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Currently, the instruction emulation for MMIO traps and Virtual instruction
> traps co-exist with general VCPU exit handling. The instruction and CSR
> emulation will grow with upcoming SBI PMU, AIA, and Nested virtualization
> in KVM RISC-V. In addition, we also need a mechanism to allow user-space
> emulate certain CSRs under certain situation (example, host has AIA support
> but user-space does not wants to use in-kernel AIA IMSIC and APLIC support).
>
> This series improves instruction and CSR emulation in KVM RISC-V to make
> it extensible based on above.
>
> These patches can also be found in riscv_kvm_csr_v2 branch at:
> https://github.com/avpatel/linux.git
>
> Changes since v1:
>  - Added a switch-case in PATCH3 to process MMIO, CSR, and SBI returned
>    from user-space
>  - Removed hard-coding in PATCH3 for determining type of CSR instruction
>
> Anup Patel (3):
>   RISC-V: KVM: Factor-out instruction emulation into separate sources
>   RISC-V: KVM: Add extensible system instruction emulation framework
>   RISC-V: KVM: Add extensible CSR emulation framework

I have queued this series for 5.20

Thanks,
Anup

>
>  arch/riscv/include/asm/kvm_host.h           |  16 +-
>  arch/riscv/include/asm/kvm_vcpu_insn.h      |  48 ++
>  arch/riscv/kvm/Makefile                     |   1 +
>  arch/riscv/kvm/vcpu.c                       |  34 +-
>  arch/riscv/kvm/vcpu_exit.c                  | 490 +----------------
>  arch/riscv/kvm/{vcpu_exit.c => vcpu_insn.c} | 563 +++++++++++---------
>  include/uapi/linux/kvm.h                    |   8 +
>  7 files changed, 392 insertions(+), 768 deletions(-)
>  create mode 100644 arch/riscv/include/asm/kvm_vcpu_insn.h
>  copy arch/riscv/kvm/{vcpu_exit.c => vcpu_insn.c} (63%)
>
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
