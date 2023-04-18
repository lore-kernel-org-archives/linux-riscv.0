Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166DFC6FD18
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 15:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g3zICihvDsddJNzmMnzaTc/sf56U+jma7oJShN1jKSw=; b=iGfJCCEO1ZeffS
	7tx5cFOGMd2/t9r/jbBYuF/RvspmbhN68kJMQ/xPJN2y4Tx5YWpxSA/I1sTSdQAm2uVOZnP6ZZ3Nq
	/+C1opSCNZpAB+4iUmvMPoYlfqR8DCSty6liRP4CXN9SU1sR8iklURO3gozDLRyj7En7QGA+CzMTz
	S5vbALBbgCXV16sY15tqk+LPdqXcCkklR9uTKUeA2BPGwUr42/frj0y+ZXMg30NFL3O7ByetCtLy3
	UxeQ5Q0LUt1tmj1kFkFE8iKQbmOkE8OgNJ05vlBigOX9VovDEAU+UMjAF7lvy4+cjPdFYUowKQe+D
	xwpWyUOgNoygrpgDAK+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pomrL-002WSr-09;
	Tue, 18 Apr 2023 15:03:07 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pomrH-002WQe-1M
	for linux-riscv@lists.infradead.org;
	Tue, 18 Apr 2023 15:03:04 +0000
Received: by mail-ej1-x634.google.com with SMTP id xi5so73982659ejb.13
        for <linux-riscv@lists.infradead.org>; Tue, 18 Apr 2023 08:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1681830179; x=1684422179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eGjicJYh31cK/BzEcNTDnxEWlOaJ3534uI99hwaIMVo=;
        b=dskV/5fmTBnuPXg8dBbwRM2jLIuB5HSspB+M35Au08MsAjD1QDLO4dePsRtCagOSkp
         j0AVSz8ihvO5jlimsrNfECSWNP+sy0kyTKWXXZu+xYbVQgpEQ+J/JnFakqLvWa10+LKt
         5LGVmjFMDGwVXn9KxcYPk10J1QmOolsKq+Y9W51VZoCfbOULOmXjQVh6GLNMF2isypVB
         d5yF0l6+xoKeXEh95053nEbKb9qHOyY+2v4H43S0uO8nAwjwngOFWD0NIx+apXbklBmP
         +/dDfNRRTxlzD1XwfIRzo6BJgRNuEULW0ucxXH76xXJMHCfYGI4bVmZ6j8db0dKtKDyE
         Rn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681830179; x=1684422179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGjicJYh31cK/BzEcNTDnxEWlOaJ3534uI99hwaIMVo=;
        b=gTH7y8zFZbVW5nj77axQL/mPTCb9W11rbs4df961plKoHoVf8dgLPE/48YRqru+qky
         z7hq/KZf8nkLCYgjyR500jDzBkC4cRZP5OcwH4I+rVTsvDJwfzAmiUOxyQQpMkjI8rCJ
         0cG3KzEb97XMrLENKf6k9/jQfUxIwkSCnEJkFM0Uk792iUVXOtk6Wc7ir9+sOMniBiwx
         m8BDolWb2NB4uRIKZqFnAsFQQSrLTmp/WHr6o9ShEqHjcgcBlgYVUWu0HLIZUrTUHJSN
         HIV7k2SnFIC0Gcnjv/X/cebO9E5pYCVSzImfGx9/xn0Z+OiJR2QTfK72yzH28JPTIkGQ
         3EYQ==
X-Gm-Message-State: AAQBX9cnDdPF4qaa4MgI6UBy3X0MSjPyCuMpvOU3dyBXvl0Wcl5hE45B
	E/0Co+KTVzAQ75qLwpx2W/ba3Q==
X-Google-Smtp-Source: AKy350aArc0ZHsPFZsb2XaItpfCxJdWy6iOn8pitaahBEwUw0ddE2TaksuGLfOLXkECUqylpgzKCYw==
X-Received: by 2002:a17:907:6d24:b0:94f:3980:bf87 with SMTP id sa36-20020a1709076d2400b0094f3980bf87mr10489381ejc.43.1681830178676;
        Tue, 18 Apr 2023 08:02:58 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id i7-20020a170906698700b0094a9eb7598esm8050623ejr.120.2023.04.18.08.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 08:02:58 -0700 (PDT)
Date: Tue, 18 Apr 2023 17:02:57 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: kvm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH kvmtool 1/2] riscv: add mvendorid/marchid/mimpid to sync
 kvm_riscv_config
Message-ID: <vnnhy5z6bvqxf7q4njqturux3bsqwjrrxgzbv5fklf5swg5ws7@rkvh6ds7qzef>
References: <20230418142241.1456070-1-ben.dooks@codethink.co.uk>
 <20230418142241.1456070-2-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230418142241.1456070-2-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_080303_462178_DE09E8A3 
X-CRM114-Status: GOOD (  18.10  )
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

On Tue, Apr 18, 2023 at 03:22:40PM +0100, Ben Dooks wrote:
> Add the ONE_REG for the mvendorid/marchid/mimpid from the kernel
> commit 6ebbdecff6ae00557a52539287b681641f4f0d33, to ensure the
> struct is in sync with newer kernels for adding zicboz.
> 
> Ref: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/id=6ebbdecff6ae00557a52539287b681641f4f0d33
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  riscv/include/asm/kvm.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/riscv/include/asm/kvm.h b/riscv/include/asm/kvm.h
> index 8985ff2..92af6f3 100644
> --- a/riscv/include/asm/kvm.h
> +++ b/riscv/include/asm/kvm.h
> @@ -49,6 +49,9 @@ struct kvm_sregs {
>  struct kvm_riscv_config {
>  	unsigned long isa;
>  	unsigned long zicbom_block_size;
> +	unsigned long mvendorid;
> +	unsigned long marchid;
> +	unsigned long mimpid;
>  };
>  
>  /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> -- 
> 2.39.2
>

These should get updated with a proper header update using
util/update_headers.sh

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
