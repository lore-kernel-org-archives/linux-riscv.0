Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B361C636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 08:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cu1uO6igZK0ESIuUPofe4/sml5YM+vw76R9y1uJNWjE=; b=uWSONyfkO+xmOe
	BvwfcLHJclgI36yuCg6QmjYgPviWjrPLoXQR2O+Jxm/VYCZ1NyUc4rKJ1EuOJvUwxTDqrqOLMBaK0
	nqa4jz4/euNiZqODxVocomNYl9V71LqSpEapusc33I28LYHGjybbnHgNVfVpzwCVExX92Xu1glE+h
	GdO+5DWV4AvHhZhdMH+qfGbSoMu96QpjyNhB2xHMr4kv4NC89s+ouTTTtJAFmQCihXbvvRla+m0D7
	huVS7uaFf3K+3oKgLQdyFhXb26xI22B/luuN0byjpGuV0nqVng/yDd3J3cSqBBxR4Re9m+K1Dh9Fr
	nq5KcUxMAc1zHX26gRxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMmFH-006oKp-FZ; Tue, 31 Jan 2023 08:44:03 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMmDT-006nW8-ME
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 08:42:13 +0000
Received: by mail-pf1-x42c.google.com with SMTP id j20so3102970pfj.0
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 00:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QCf7Gk9CER9TWykUKPKE3uoStZNM4xMJ4HlA3aUUy/0=;
        b=PIGIv+QT6Tcw0pdKxDeDj70Nap7gwxtMtZ1HaWM625UXPMA5Hpbk7Z9His8VZC+5Gz
         QG8u3EG3stDN8xxsQ2nF1PfP85vwpSwLs3AqkxTC8BaWWRBPTmIbAFKZl6Hg4jgvFs5i
         mS1zfordJBrRShBB4GrTCJeolXPC3njm4kg0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QCf7Gk9CER9TWykUKPKE3uoStZNM4xMJ4HlA3aUUy/0=;
        b=drVk1sIj4jGYV0cqhsWGxdjzFb+L0TItQsMcoducrVZY/R4h7hXLniQzd2P5u3BjVN
         Su7PgAZR1CHJqRstiIjvG0mn8rt7s0bU2NGxOUXQf8AZixBQNDqsPj1oO/KLEvZ9yi3Z
         jjKM/Ov3WHe8j23M1+Db8klz7+735g2y5bGIZiAl69uwt+RGElH3sPiUCE6HQj9FOZj1
         rUEhMfY7zBWbzBJStnopO5YnvafcbZ8BJ5D6PO6FSxl1Tk32pKbmF4lYcee21T283ueo
         8RK96qMC28/lJkXSAhsnmh3VOFp7I8gd+SpFWsdSr3cqKKN+6jpA2s7lx1AdaBnvk8cG
         I+xg==
X-Gm-Message-State: AFqh2krc7cZ4U4n4AcNkqMZpZSsIGfW2hNrI5HEGV9IVlimGW6GenzJT
	A5sGlhtmlvkfFFOQuZkVVqEUAkv+7K0Clk3H8uif
X-Google-Smtp-Source: AMrXdXszFabjY+wcSz9JtpixIdGjJb0a3PP/mXva2CxGh2plpw5ZvmZWOtSfnd7Z4hwO6O/meJS7najdjrX6RAvJJs4=
X-Received: by 2002:a63:1011:0:b0:4c7:ef33:bbe1 with SMTP id
 f17-20020a631011000000b004c7ef33bbe1mr5876108pgl.73.1675154529449; Tue, 31
 Jan 2023 00:42:09 -0800 (PST)
MIME-Version: 1.0
References: <20230128082847.3055316-1-apatel@ventanamicro.com>
In-Reply-To: <20230128082847.3055316-1-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 31 Jan 2023 00:41:58 -0800
Message-ID: <CAOnJCUKQwKpEPYgTG7OQtRDsmHBPpLYLPg5v6XM7AZqsrYupRA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] RISC-V: KVM: Fix privilege mode setting in kvm_riscv_vcpu_trap_redirect()
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_004211_795159_B89A3232 
X-CRM114-Status: GOOD (  14.09  )
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

On Sat, Jan 28, 2023 at 12:28 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The kvm_riscv_vcpu_trap_redirect() should set guest privilege mode
> to supervisor mode because guest traps/interrupts are always handled
> in virtual supervisor mode.
>
> Fixes: 9f7013265112 ("RISC-V: KVM: Handle MMIO exits for VCPU")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_exit.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index c9f741ab26f5..af7c4bc07929 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -160,6 +160,9 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
>
>         /* Set Guest PC to Guest exception vector */
>         vcpu->arch.guest_context.sepc = csr_read(CSR_VSTVEC);
> +
> +       /* Set Guest privilege mode to supervisor */
> +       vcpu->arch.guest_context.sstatus |= SR_SPP;
>  }
>
>  /*
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
