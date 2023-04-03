Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2097FC76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 11:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R6Qx6OYdk5VTTwejt31299YYkXmGglcauNaOlV2fnJ0=; b=AE/KaQF7/pPlCv
	F1VSvDL2gouqhr1esg/Y8ejPrSf+9j6KPqBIcVKXev6xpQy7ddvmHBIncHM4VFo6aARLfyoT1cDYR
	H0neMXWOyb9c+vYoFvGywv4nafjwNfORvfO1ofqlVXExPQMvIYYdZeC5umYWR+L7Jvnx5tPE+BwAW
	Y8xIeVOajFm+F3XwgxZwuicuhcFh5dzi0zdT/VZ5F4YOCbout87ocybSv6vQOCT3T3B6ITh7MhS0p
	lrnVujMGJOC1KBtyKeu/mrsQWKfxTPw1rIeq2XVye9qe2fAmOxijqizFZ8OjcUCeIjOGOWPs4W/re
	2N4qyci1NLku/If8ajsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjIPE-00F8nq-19;
	Mon, 03 Apr 2023 11:31:24 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjIPB-00F8mi-0s
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 11:31:22 +0000
Received: by mail-ed1-x532.google.com with SMTP id i5so116193834eda.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Apr 2023 04:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680521479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YcQcHVUeSM2zYODLoqIXNbDNYCp1LquQUGBod5NxxrU=;
        b=MUH+FkWmhAqp+d3dxhf5ilxC49HG89GtfiPt2fXx77t1/qlF2PBIozQ2Xscb9oA9NU
         4OhAXKGsLYPeCr8ROMQncNiUKbgXDYYheKx4FNRAJ9fjScAtvGqcPqHry8IWwCQGC3nd
         dlKxn1D1iD39GAHilOpgg4xWPpYAiymSjoiF9NxP2UbqPmVWNN75O6JEawXhRdmfXX8z
         RTvzQj/GHdXGJkDx6/kSS3ZzFAZFlW+zMTFKFrGoW8gJiR3sBZqhBlEDz/EAYd+MDIP8
         fN8Gqfk9gK5RavABiGawEBeMY9X4SRXQGUVEyaEz8pzfN770Nst4eUT/qmX9uruuirZI
         8nnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680521479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcQcHVUeSM2zYODLoqIXNbDNYCp1LquQUGBod5NxxrU=;
        b=GJgpGCCQC3eFk5MDa1lDnNZz2fZbp6xD6E6m0A+ixyPMk3UxqMeRY3KoKyLJsciF0g
         UCdHtiFGSKjNyr92/6UQMGoWflImNMfTVo3anR732yYibQW3DSvi5hG09Fr4Z0/NmHXQ
         afV2P2l5eCLloeeafHDatX+finGo1j2Vrp2VSk3MMBnySw4c9zAmhYwYfaekldhe9C+D
         BxfdsbG3uf8ts1wu6Q9RLdgP5F3AK4/8dZ0kGUmdnO+W/ISM+GvUphHZsIKHU0RWfxie
         gGjc0BHWFsPDDgC955enoFty15Y9OhhXa2TcpqkdMQQvGcfOGpeG3cDovJHzyJYLA63M
         uIig==
X-Gm-Message-State: AAQBX9eT1Ufg9ZdnW1HPJmnDLTeTpFAamrkDcn2RkdcbJgl/zugn01cO
	FxGYrV0tWTIbKkmi6QYu8a8g6w==
X-Google-Smtp-Source: AKy350bks61W66k0lSbPXddI6pPorUDq+Ko8KS9lP2tr7b73279KTPnmSiWqrjFY+j5WQFvL71DmGQ==
X-Received: by 2002:a17:906:8a41:b0:92b:6f92:7705 with SMTP id gx1-20020a1709068a4100b0092b6f927705mr31534625ejc.40.1680521479131;
        Mon, 03 Apr 2023 04:31:19 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id b17-20020a170906491100b008e57b5e0ce9sm4387728ejq.108.2023.04.03.04.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 04:31:18 -0700 (PDT)
Date: Mon, 3 Apr 2023 13:31:18 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/8] RISC-V: KVM: Add ONE_REG interface for AIA CSRs
Message-ID: <osrpjiywxtkgxb5i6mfvxzfrzrnjv75uqzvlu3fouo4mqsktgj@blcmyjt3twqg>
References: <20230403093310.2271142-1-apatel@ventanamicro.com>
 <20230403093310.2271142-7-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230403093310.2271142-7-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_043121_335863_05402DAE 
X-CRM114-Status: GOOD (  15.12  )
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

On Mon, Apr 03, 2023 at 03:03:08PM +0530, Anup Patel wrote:
> We implement ONE_REG interface for AIA CSRs as a separate subtype
> under the CSR ONE_REG interface.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 8 ++++++++
>  arch/riscv/kvm/vcpu.c             | 8 ++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 182023dc9a51..cbc3e74fa670 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -79,6 +79,10 @@ struct kvm_riscv_csr {
>  	unsigned long scounteren;
>  };
>  
> +/* AIA CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> +struct kvm_riscv_aia_csr {
> +};
> +
>  /* TIMER registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
>  struct kvm_riscv_timer {
>  	__u64 frequency;
> @@ -107,6 +111,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
>  	KVM_RISCV_ISA_EXT_ZICBOM,
>  	KVM_RISCV_ISA_EXT_ZBB,

Looks like this patch is also based on "[PATCH] RISC-V: KVM: Allow Zbb
extension for Guest/VM"

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
