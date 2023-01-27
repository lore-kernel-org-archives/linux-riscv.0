Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF218C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 13:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tSAotlIHVX7zFET+lWCuwbvxW5ZwQYleIbxH5UNdjk4=; b=UJgNR/L0PAcHi3
	9+KUhqbooK7dFh+PWPyld/owFWq7GIlpdOC+hEjL8UVDmYmBQo2aWmHBAmsDd7FoWQCmXDaNwlwIJ
	xr4QC6ObQnZ2wpFZsrK68BYfA+iH1L+5KEDdLnNJzgM+wT8cLSbAus7P6sFwmwt9RRC28428rAOoP
	k7Ry979tFnOFovd7tq7Njs6PLZwPQsCmC71QoP3Ooxl/qsBC4VAOI2Ofmg97sc+x/qv6tfS2WIlP2
	ilN+h6Mw3pA2EbWBNdiggVDWr5zlx8gmFmHpG74WZhuFCGZAsYDldTelrUKu15OHqvW60UxNc0o1o
	12JFQ0sDChILhJzer93Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOMK-00EpCL-N2; Fri, 27 Jan 2023 13:01:36 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLNUE-00EOix-MO
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 12:05:44 +0000
Received: by mail-wm1-x32b.google.com with SMTP id j36-20020a05600c1c2400b003dc39cb9c33so930502wms.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 04:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=49P4rU1OzCSfjhkjXu4Djle+ur0lA/pLRqdrOGEuDgQ=;
        b=RpNA9MFp0CVU4HeiQyETkfPOMTkObZr4wIbIXq7wmA6CTp03Z8EAd2089ySge5EERH
         ZjZ9fN0BmIlhq0yDS6k/3Mm5XMV7qOsZ2EMRJSauB5sMxm96GgMjMYN+v4tLHl1E8Zvh
         AmjTYt6adeiFzgPF4HnIH0BnzbEaLjScnhM8mtCqKSru6M0DdXIJsoc77IL+VpgMRyX0
         mf0TpKlnmi4l8EHyv1ltaU5Dn8DNprra0RhdTMm5KcgGUuesLhhDPj7OBapsAbxBKEij
         5+sO6qHjE5iY/nqcJRr2q14Ye3qc2t/nP2LnXHfMf0V+jeRAMbdzEn8rN78D8z+kvn3t
         4kGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49P4rU1OzCSfjhkjXu4Djle+ur0lA/pLRqdrOGEuDgQ=;
        b=Tq5DxoO30MUWWRKGm+arbC3VJYuUaBgNTDMlSbC2ZMPBU6a70KKPQncNj5z1dM6QFZ
         dLQ2kzcNYeCmn3pLZS12o2m9NPWomAJ8CFfQchsgmwzLFPR1s7gP8+I5EGmlqjLnphuh
         y4rr97ghWcJ2E6+JdfX3VdTzuAoWIloslCJTltWx6hft8CKmtqbzq/6wXPOON/z9shk7
         ERmZ+xZFSPY1WUc0s/8pxywXSGazzXzmDyeKL/tX88CZcPfDWqsgimJTysyyycHR7eLM
         trGCIHi7daQFlqVMo+5VE4tF/vg4UT5iABmjfLwFM7GMHqc4C7QR0vN0v4fk1Ig11oXQ
         jUHQ==
X-Gm-Message-State: AFqh2ko4f12r2fY4lApYbtnDQM6KGEiR61nZ+tyP3KKq4h6LaYoHBkZx
	Ls36oMO3SHq5PCy8K8DtgUCUjYzYzm6f2CZ3
X-Google-Smtp-Source: AMrXdXs5aFUhbmFjfKKDdPy0q2p6XQ4Qc5rB9l6xXkdXza417yI4JKDkS8vG3qPezgNlK6cM1LBxIw==
X-Received: by 2002:a05:600c:3488:b0:3d2:370b:97f4 with SMTP id a8-20020a05600c348800b003d2370b97f4mr47051577wmq.16.1674821140277;
        Fri, 27 Jan 2023 04:05:40 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id p8-20020a05600c05c800b003c65c9a36dfsm4010664wmd.48.2023.01.27.04.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 04:05:39 -0800 (PST)
Date: Fri, 27 Jan 2023 13:05:39 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Redirect illegal instruction traps to
 guest
Message-ID: <20230127120539.nzbdoli7ahmenjmx@orel>
References: <20230127112934.2749592-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230127112934.2749592-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_040542_785893_0C420F4A 
X-CRM114-Status: GOOD (  18.25  )
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

On Fri, Jan 27, 2023 at 04:59:34PM +0530, Anup Patel wrote:
> From: Andy Chiu <andy.chiu@sifive.com>
> 
> The M-mode redirects an unhandled illegal instruction trap back
> to S-mode. However, KVM running in HS-mode terminates the VS-mode
> software when it receives illegal instruction trap. Instead, KVM
> should redirect the illegal instruction trap back to VS-mode, and
> let VS-mode trap handler decide the next step. This futher allows
> guest kernel to implement on-demand enabling of vector extension
> for a guest user space process upon first-use.
> 
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_exit.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index c9f741ab26f5..4ea101a73d8b 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -160,6 +160,9 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
>  
>  	/* Set Guest PC to Guest exception vector */
>  	vcpu->arch.guest_context.sepc = csr_read(CSR_VSTVEC);
> +
> +	/* Set Guest privilege mode to supervisor */
> +	vcpu->arch.guest_context.sstatus |= SR_SPP;

This could/should be a separate fix patch, right?

>  }
>  
>  /*
> @@ -179,6 +182,12 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  	ret = -EFAULT;
>  	run->exit_reason = KVM_EXIT_UNKNOWN;
>  	switch (trap->scause) {
> +	case EXC_INST_ILLEGAL:
> +		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV) {
> +			kvm_riscv_vcpu_trap_redirect(vcpu, trap);
> +			ret = 1;
> +		}
> +		break;
>  	case EXC_VIRTUAL_INST_FAULT:
>  		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
>  			ret = kvm_riscv_vcpu_virtual_insn(vcpu, run, trap);
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
