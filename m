Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E910C7EE26
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 16:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4jbuzeGq/7uwb42It5jE74PTLoUyAFBMGLJNk10SHSQ=; b=UlTj85E8ex/b0Y
	bb3+Sp1ySeWXg0dF7PEW2v5CMDtgBkNwHg3VG1scFcwduZbWbf6DTnlRH2YMI36Ba1aK1Eqds56cd
	FCRZ5zNpH63uTTJZIGhwAwArfp2/qkJxDwvAXOQAF6OUMF50x9j588z8onW8YzjXuwbkGuPjB2RJY
	KhwAizN578kzbbvdCbTRPLdxHKfk6OuEpLrqs4a95Pge/av6YLoJ/tWXn2EiweOouXdQeo6onEIor
	NmHfCvfSWjDdKIBXdA7E0Tw/t6YgKlm+XIkFgEadzr6gY2R8AQBn/QhTFxzPS0fj3cqDXnN6VDfAj
	p2Hw0YfGD6+tWG1aU+LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px9Ks-009OIB-2o;
	Thu, 11 May 2023 16:40:10 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px9Kq-009OGJ-1X
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 16:40:09 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f42711865eso33909905e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 09:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683823207; x=1686415207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rWPj+0MEcU+bJjFDLtiKhJORofVGXZE+QDk7KaJWG9E=;
        b=UuPFreN/sIyZvma3z9Xm6KxNZFcbh1TpDfsITGLUWBCWA6T4xHCFr5HuwlelWhANsc
         GODLbDYWSkjxpw1FlGH7zBZhqQl+PBnoza0HREbOpZD4TA496u22UD6bDXXczi7KYVpl
         vUHL3f5x4AXj97duCDa1dgEYjprlWsVyV+SBIS6xrVMPSwQcsV6kK8n5uf0FR6XnIuc4
         bHtcnz/0qP1iI3PLzgpdryNpdPYlDZbySxQcLGTnHTgtAXoWs5v1mwmzllg9a6m64GLt
         EJC3fIG+NQH/j+vTbDoa5wKLgeATWhDm4OwK78ppk49kTcq7mfR/nc2WNPwoATtQv89M
         LAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683823207; x=1686415207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rWPj+0MEcU+bJjFDLtiKhJORofVGXZE+QDk7KaJWG9E=;
        b=NXyKJYzxYRXH4b1r+2xdX5FIuZCps4OJC/sxtNJ8tKjmgjt8ykkgvpv5hOfQKzjVIu
         HJaSdpxDoaAxDJymq/ABusPrvJrTq/qrZJkPShdVhOkAqewMXbzqlXa8AqbkKeo9S/NC
         6Kq9k4J06PJ35DsQqPn8HyBgnUB95UhA+vxqfy10eGYFIdc5QzjS889Z/N/A8UtK2aLI
         EUDe96HY4L5VB3FalX1LsU4wIdArAPGgxrYY/7fBG0Xp316O8kFT78qnmUPFFJpq2WbS
         mZ7nJsm/B12PgknYKdB/uS2rSiAIdsa45RnoxOoIrDIaNNAPAafKy2JL94C2hZsRmkfA
         nGGg==
X-Gm-Message-State: AC+VfDxtaETlF5h/TZze/9cddMjon/HJ4IGQ91MbguqrrHVPB2vjsBeU
	UtiNDfyCdeuyvpmm6v8+HTfmDA==
X-Google-Smtp-Source: ACHHUZ5lIBereKcBnZpJKQGjLGzbXt7Ys+TI95CPzIw7E6x8cqi52/zghFhzklOdZznlq63vKEcQWg==
X-Received: by 2002:a1c:f20a:0:b0:3f1:819d:d050 with SMTP id s10-20020a1cf20a000000b003f1819dd050mr15055961wmc.37.1683823206802;
        Thu, 11 May 2023 09:40:06 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id 12-20020a05600c020c00b003f4b6bcbd8bsm4941659wmi.31.2023.05.11.09.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 09:40:06 -0700 (PDT)
Date: Thu, 11 May 2023 18:40:05 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: kvm: Add KVM_GET_REG_LIST API support
Message-ID: <20230511-d0a207eebb30fc88de875e4f@orel>
References: <cover.1683791148.git.haibo1.xu@intel.com>
 <921fc2e1a91887170e277acb1b52df57480a5736.1683791148.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <921fc2e1a91887170e277acb1b52df57480a5736.1683791148.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_094008_519510_A0A55179 
X-CRM114-Status: GOOD (  16.85  )
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

On Thu, May 11, 2023 at 05:22:48PM +0800, Haibo Xu wrote:
> KVM_GET_REG_LIST API will return all registers that are available to
> KVM_GET/SET_ONE_REG APIs. It's very useful to identify some platform
> regression issue during VM migration.
> 
> Since this API was already supported on arm64, it'd be straightforward
> to enable it on riscv with similar code structure.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  Documentation/virt/kvm/api.rst |   2 +-
>  arch/riscv/kvm/vcpu.c          | 346 +++++++++++++++++++++++++++++++++
>  2 files changed, 347 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index add067793b90..280e89abd004 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -3499,7 +3499,7 @@ VCPU matching underlying host.
>  ---------------------
>  
>  :Capability: basic
> -:Architectures: arm64, mips
> +:Architectures: arm64, mips, riscv
>  :Type: vcpu ioctl
>  :Parameters: struct kvm_reg_list (in/out)
>  :Returns: 0 on success; -1 on error
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 8bd9f2a8a0b9..fb8834e4fa15 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -657,6 +657,334 @@ static int kvm_riscv_vcpu_set_reg_isa_ext(struct kvm_vcpu *vcpu,
>  	return 0;
>  }
>  
> +static inline unsigned long num_config_regs(void)
> +{
> +	return sizeof(struct kvm_riscv_config) / sizeof(unsigned long);

We can't assume all config registers are present. For example,
zicbom and zicboz block size registers are only present when their
respective extensions are available.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
