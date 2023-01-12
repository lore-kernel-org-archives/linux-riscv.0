Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5E1C54EBC
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 15:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1pyphpQm6I8MVJRbcJ5zQPFh9+81f+Ur5nFCDZ1BQ0=; b=uiuER+l69+L8Tg
	krcw3Drx47AFUfwwGehIGKRUkDk1Tt+svUunt6MhnkAa0/U8AgGykedephFpslCC7Wc4eSkoupLsJ
	gxpXqne3o+cAnknNCI9aphXbjQDGViWtiPLVOntnjyu2pqObQz5bUvHEkaBx+a3JzLHFtQO+yuDP/
	6VKDzgzjof4On19wZPDD6BltRA5TXHOQm0YKsgxZX+9j+Wix+aTtY4XRuiSeSS4CoUBgW9EkkM5bw
	FX7IjLnlpEKsXRgNfyh66ZdQDfXOabU/dvaCS5IZRg3q0a7/7VP7Abz8pym8qgKHf0lQzEfHe8dzU
	9r05TPwNmCf6O+YR57ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFznN-00Fjnd-A1; Thu, 12 Jan 2023 15:47:13 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFznJ-00FjlB-Nq
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 15:47:11 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 18so27368063edw.7
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jan 2023 07:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=touwoPoiYZf0HhlEwi8bPQAghKKkIn4o576UC3VAJig=;
        b=Y7UoxZEpqnNjH0C9dutC6Y5LH1YueEA7ar7GIXTHlsjyRJ1sQpJtfyBFGYZZ0+I62Z
         9eTjvcW9vrhwTGHfni2BokqqH/0aQEat3j0uzP2TfbaEwjeBuOGoDCUQlmeA4FkZ+ewt
         meVWwzqwaN/2To9Bls79seggrsSl5K8RyhUL27PyWuJ7fUbMscS7CW5OERw9WTa/Ze99
         R99lWv2BngR25eDhMzpt4vvtuXuNlya7pJ998yVIWOjpAq9szC6mqV6DYPWlsR0D0SYu
         ysMrm5D/chxmdZmDr6sOiiMJjeqm0JXxL9A2SAW52cz4uN1tcoaqzvnuI1zyPOuRC9Gy
         BNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=touwoPoiYZf0HhlEwi8bPQAghKKkIn4o576UC3VAJig=;
        b=ANtp3pKsCgK8fAyP0/cmes2NsyXSHKHOzCe/pcCgwZ7Twkjp1xvwKra6mHDjcZPeL1
         lIJjye0JZaD6b2gN+rOgs+KhoMRbrEALnMnMx+JZnUyESua27dr7qKuczdwhBxyPXBgR
         rfJcDYe0ET8heth1+2h5v3ywoS6mv7fwvQ0brhwTaHOyRbnok/Ps2nUCobG9kWTD97AC
         QH56X6dmEO62+U5RcNKTZ+r9Eli3DU5djvSrTa54uyPLHhtx8iHGfGSqviROKosSruEZ
         DumeKxzvHwwxe/Vq7UzSxxXvmgilzqm+EMPQRo0gee2Fxtoovaqq/OgP9JgIXMtWGGCv
         pbfA==
X-Gm-Message-State: AFqh2ko0xQZ8aU/JQZY58+M45RcwDyfFVtMepIsGm9uqOQAS9Ig4S8T4
	BWnxnGdgjqeC3LPPpsQENJcmSg==
X-Google-Smtp-Source: AMrXdXssM3QKtx3x/hfO1hFv0f1b7bDY5i5kFJO302k1BGtRn7sQ9lO5PV+s3tuqXmOqb6biVLRgvw==
X-Received: by 2002:a05:6402:d55:b0:499:c294:77b6 with SMTP id ec21-20020a0564020d5500b00499c29477b6mr9702559edb.9.1673538426017;
        Thu, 12 Jan 2023 07:47:06 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id fd7-20020a056402388700b00483dd234ac6sm7119348edb.96.2023.01.12.07.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 07:47:05 -0800 (PST)
Date: Thu, 12 Jan 2023 16:47:04 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Eric Lin <eric.lin@sifive.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 08/11] RISC-V: KVM: Disable all hpmcounter access for
 VS/VU mode
Message-ID: <20230112154704.x6ml27hnsxh25my2@orel>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
 <20221215170046.2010255-9-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221215170046.2010255-9-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_074709_797714_402CED2D 
X-CRM114-Status: GOOD (  17.10  )
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

On Thu, Dec 15, 2022 at 09:00:43AM -0800, Atish Patra wrote:
> Any guest must not get access to any hpmcounter including cycle/instret
> without any checks. We achieve that by disabling all the bits except TM
> bit in hcountern.

hcounteren

> 
> However, instret and cycle access for guest userspace can be enabled
> upon explicit request (via ONE REG) or on first trap from VU mode
> to maintain ABI requirement in the future. This patch doesn't support
> that as ONE REG inteface is not settled yet.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/kvm/main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index 58c5489..9c2efd3 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -49,7 +49,8 @@ int kvm_arch_hardware_enable(void)
>  	hideleg |= (1UL << IRQ_VS_EXT);
>  	csr_write(CSR_HIDELEG, hideleg);
>  
> -	csr_write(CSR_HCOUNTEREN, -1UL);
> +	/* VS should access only TM bit. Everything else should trap */

s/TM bit/the time counter/

> +	csr_write(CSR_HCOUNTEREN, 0x02);
>  
>  	csr_write(CSR_HVIP, 0);
>  
> -- 
> 2.25.1
> 

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
