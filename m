Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0138DEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 11:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idYWCPo6z2sC39X9uhxT6/DT+9fk3J0NVnlGKti66JE=; b=0Mb1xNdP1j9w8r
	5t+m0/ll3ZHcZhcUX4I1z0MgWiSQ6JNFDoaQsUnY/FFxTiO6Qvk786YTEIH+X3ZTTvD9xlcWP1a54
	KKWq5HDUyPWb0eYTZ9CmHz4Bs6cxu4LWf/1JYIufYYNjBYUdqRSE3qfM1ANE8NRuz5Nr7sXvN7bhy
	zjqtqshZ8RHDlf/cX+7Xy0yMsn5vDyjA7kfE2eeglbwI2EA1k2IVFP6h5PaLV29hTKZ1cMKamdWsb
	MAKXj4H/fk3kb7pLYnwsDMi0m3opfulnvIDBS1GUUUHlCHi5IMMPRzkN8R7egxTq5srjV8UYcvnfg
	VSDo1UEQllJkji/SsgSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJums-0038RT-2X;
	Thu, 13 Jul 2023 11:47:10 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJump-0038Op-29
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 11:47:09 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fb7b2e3dacso1092343e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 04:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689248823; x=1691840823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QkC/3t6yahhwYAX2k86ggdtjKfFNk+a6lEAlP8/kgtI=;
        b=XAKsv4MoO/pKibEQ1G2CxsRmfD4VxbDZYvIirjY6OXu8ih4sjnTABAP2qIo5bTi/QD
         SHFBqh/cuCdWLLorn87tm9mdBEO3tFDBINMZBhaRv/sSKTWvZQ00GwJG0l0DVPQ5etLW
         pUrf64TZuPnwMe1Xadtq7tOKmmCJeuzF94VxWwrJ6lPrTBNevvDfLzBfGsl3vm5yud/9
         xGls/5rypS0CrWc0LgHmAZy8sKQPiD5bVYStR5VB9s9ab6xeWbUqrqLfBGGLsnWb0UzF
         ekNn1bl8z9lJGkYkNLyHscniyNBZij/Xj9bKz/r0y+lJRLguC1gcAx33nnZW8phrdHtU
         CUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689248823; x=1691840823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkC/3t6yahhwYAX2k86ggdtjKfFNk+a6lEAlP8/kgtI=;
        b=TrCkotrPFcu+35uHEbFuQkgQejWvDOy+0p2Eln+M135YPD8/8hV8RN++bN3bGvuPS8
         R1j+DwMZ8FMTHyg4NMHtUXERkAFG3AaAaV8GyHQxTjFTf87mNHrVk8LYbly28AGC8hgh
         aWhzhDQT2uSASqGHL09YF3N9M4fmpKKjMhETKd+/s251wv0w8SjO1zudZkJtRyomu/JO
         OaPp67/I324aKx6ctRe9PPpMqX7ftGXR36Q/BTto4RxBmlnIj8p9sHQ7AvnPih2LtUBL
         sAGKCqbPR+WyrWnV7RLixRo5OI9IgpCFZiARW6Gp6hPy/rpnT3itKUW280yzkhkhQGue
         DzgA==
X-Gm-Message-State: ABy/qLZB+QW9g++e0X1kLP6qdbsj5AwpVn8i+DuTYbhSDO+oKG8pk8rX
	wUOPCH4ZaKQYaT3W5znKx6QfNQ==
X-Google-Smtp-Source: APBJJlF6RRZg1uMcOi0ji+OK2OsaBE+8f5isAdIDj2SLfzUC25uBdhHZhXHCZHvkywy8/uPhboxaTA==
X-Received: by 2002:a05:6512:4002:b0:4f9:69e9:4fa6 with SMTP id br2-20020a056512400200b004f969e94fa6mr1149012lfb.23.1689248823117;
        Thu, 13 Jul 2023 04:47:03 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id y26-20020a056402135a00b0051e0c0d0a8bsm4166887edw.7.2023.07.13.04.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 04:47:02 -0700 (PDT)
Date: Thu, 13 Jul 2023 13:47:01 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Heiko Stuebner <heiko@sntech.de>, 
	Samuel Ortiz <sameo@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] RISC-V: KVM: Sort ISA extensions alphabetically in
 ONE_REG interface
Message-ID: <20230713-8e31c6213e0d7359898b7c17@orel>
References: <20230712161047.1764756-1-apatel@ventanamicro.com>
 <20230712161047.1764756-6-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230712161047.1764756-6-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_044707_701119_09EA6BF4 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jul 12, 2023 at 09:40:45PM +0530, Anup Patel wrote:
> Let us sort isa extensions alphabetically in kvm_isa_ext_arr[] and
> kvm_riscv_vcpu_isa_disable_allowed() so that future insertions are
> more predictable.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_onereg.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
