Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE18FC27C76
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 13:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RMNoLbIgMU5aeF/3fWDZTYkWhrKQ4UpllIfMV1kxeKk=; b=TQ8RhOC0Mi4Xjl
	ec04I+XMRVisCDxtSS8abfVsIBfJwy0qDaHQY4kpV27Vfx0/Fgq1/SFvNZ8eVftJYFdp58yVejKHW
	5ihJ2ltLZPN9PFodT4bz845cvXgpnl2be1NbVwclPX/VHpSh7aAv/FeDKyGptGCeq250X2bf1Br2F
	LflXVnhjBmNBPB+dgyP9u3TI4c6SL7uJBIVjKHYgW63fR3FWeeM1UnuicPg/VH3ODb8FX16JG0j5a
	gcoqLKMb/Zbbo92HAVpmvnPkZw2/EzvLwy3LYUWjFh22xFiPCnVbp/ZGRYUElPxvIIIiYscqXI5SN
	DXV67paaqPl8onA9gQeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLkwp-000BdS-7Y; Sat, 28 Jan 2023 13:08:47 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLkwj-000BcS-Fq
	for linux-riscv@lists.infradead.org; Sat, 28 Jan 2023 13:08:45 +0000
Received: by mail-ej1-x62c.google.com with SMTP id hx15so854865ejc.11
        for <linux-riscv@lists.infradead.org>; Sat, 28 Jan 2023 05:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3noSpr0qsbBjaPiHek7vXj61bnZWH4YDsV9fDm3w6bg=;
        b=GqoA0BWlnkv1+k7b2w6EFw+iRqLjZcbPObOdfLA1dW+gUzDn4hFyaV44TZTRFH/2TI
         ZzyZ3g/aod4fp4lN+/kWOa/68ecDddZXUuzTTvgOYSVQxXM9jMQ+EvRgPnZgqD+BqHPu
         fo8SftFGTNn4oTAmMO4Ayga2VN8WLakrSnTVYaEw/aB9Gtp5pEPEBFnx3ZxRLi87/Tbx
         metjDOan2qaYk2jOfOoYI90co/8m7UPb+xRW+fjo3VYRYnudZp9W7QdP5ks3+pFlCMl/
         UQDVWUGoj+Rl98SZJ5V325dEgLGPhHD+uMpJnup5o7/nZGVpEDuOUaR2GD4wWnSJwCfK
         V8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3noSpr0qsbBjaPiHek7vXj61bnZWH4YDsV9fDm3w6bg=;
        b=xvo3Hr6minApl84ZMLDnS1XeaeW/w4JUyqRi5BFd3fIuURxF343qvYD/1LglW71OVE
         avV1bVro+mLyi2I4xa9vPM9w3wYzg5OpMd0DXgFc7x7gO61LhgtSZjA6xMNE+NkOOMjb
         vwyl2qmN1ojp4OUOjowWpArVsuCc68ZI3NMODmUKcFFK4Myf0ke68asMRnWqPKV0RqTX
         DZNPpP8IG8M2R6VDcpitf14frhCFQdyYP7oXiDBFlGASNGiqO8JouO0lm28F1aKZxAbx
         ke3qBHhSi2Rn5JMlWcW7gog3LyR90wS0a2UMXBJ4oTbBxWdX5uRM2nx2L3lxP6qqvS87
         ntmQ==
X-Gm-Message-State: AO0yUKX3oANohJqs2OBDt/wGg0aQ+HL3DzpgmodGtnfWiRx8gU3NbpMC
	6rRaZQTyHszLn8TdsnACl5Q9UQ==
X-Google-Smtp-Source: AK7set9s1XJCixtX4cwHO6p5/3Vah0LIW8ZFX9u6X+W6Gu/3sSdtWRe1LeWRRkOlfiv8fDUoCSjdCw==
X-Received: by 2002:a17:906:a457:b0:878:66bc:2280 with SMTP id cb23-20020a170906a45700b0087866bc2280mr9834745ejb.12.1674911317574;
        Sat, 28 Jan 2023 05:08:37 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id n5-20020a1709061d0500b0084d420503a3sm3910116ejh.178.2023.01.28.05.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jan 2023 05:08:37 -0800 (PST)
Date: Sat, 28 Jan 2023 14:08:36 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] RISC-V: KVM: Fix privilege mode setting in
 kvm_riscv_vcpu_trap_redirect()
Message-ID: <20230128130836.4ujqmzfqlfpcekni@orel>
References: <20230128082847.3055316-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230128082847.3055316-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_050841_572538_E173D22D 
X-CRM114-Status: GOOD (  14.48  )
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

On Sat, Jan 28, 2023 at 01:58:46PM +0530, Anup Patel wrote:
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
>  	/* Set Guest PC to Guest exception vector */
>  	vcpu->arch.guest_context.sepc = csr_read(CSR_VSTVEC);
> +
> +	/* Set Guest privilege mode to supervisor */
> +	vcpu->arch.guest_context.sstatus |= SR_SPP;
>  }
>  
>  /*
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
