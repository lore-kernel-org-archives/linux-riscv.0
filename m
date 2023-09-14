Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04679EDE98F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 08:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V2JXPOKSNq6+jRL+incGlXUMwpB8/TfIG/AABU4wnW4=; b=JQcAWilbOwDWhW
	guMpy9CwrM/0Y8+iH6K3SfXqqQyGKPxnkFId8358eBkGmWJsAmOuWnQgzep4mbJsigFgfVK/krV5U
	J4anyMOcF2K3zQxRwctyPjyXNEk4EcshoGAGMSIO11AKDH6UilRUU16dLKkBVR+qGPfNd7X5aZNTj
	Zds/pDKrhsLnFlZEeE+X+bxm56fWZug5WLL7X++mBcYAqE0jME7FjgSfC2Dg3wV36FwnWD7FhBPkF
	snZ/+/aL1HPBrC44M2r5J9aKhAZr3xkvcks1l2J+uxv0ytK5dc9uiO0/Mf6RsGctNj19EhfwLvtxr
	fZ6TVHWCeW3t8G4fo/+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qghUM-007g8S-2N;
	Thu, 14 Sep 2023 08:14:14 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qghUJ-007g61-0F
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 08:14:13 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40472c3faadso2370725e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 01:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694679247; x=1695284047; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FRr1rkGuTrUN4Y1UZo1LPGic4r7SXTmbnAZytMBynRY=;
        b=gf/OUg9eiOrVAZ5ueOcscV6y80eV6/hfdC9MQovkIm37hIxKlTB4rCBk7t2rscamQW
         iZZ8RU2aRD1pmjBrFvxxLlOOowP6OCOfhOVXmbBNus4KD9N0HVzQZLluepXfEi5/yDc7
         LuzOv5gSRin28lL5p2GoyuUu2UyByLVaZPnY9eHQITRJoyRmQj/72cPQFJ/x1ZBouKFb
         cynX0kk0BDAzmpLUmyFFwRV/eX39yl8jSNkRwuLDaZcrJel3Wizj7OrqXu6f71nLDR39
         m7HmcXp2RAkJyfoplIqVWfc8XylhWHlUfAxNmrTSEMMWNrequHxbixCLywzbJomrXvuK
         7zXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694679247; x=1695284047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRr1rkGuTrUN4Y1UZo1LPGic4r7SXTmbnAZytMBynRY=;
        b=Jvn3RtgSV4ccc+gtRWuylG0RzkN4tTcMJn1LSNOh1EJmwAcpRQNIGSYGEL4UB0d/08
         I1LfYl8/6+EpyVGX5giIOgstgHAt0MsJEBJ0WJ5ILYPwm1d9jI9goOx/clbao+f0tWdj
         uQOPJkkOauFUHvRKPMf98YhtWimMaOKme4mYzaA5BPcPgOsHrWxOTzORDP85y2xTTJ0C
         IEuzwGtBXFelwf/zvgKenCNcg5fxduwNLh5N0MhSR75UgE5qeUcyX0PPMGmD1AvURxDt
         mkVgWSMC+8wTdyWd5uWMyYX4YWweeFrSBNaTrhj9sZJcdVkRZ4UEfjxT+UV6IQHDkUY5
         Wo6A==
X-Gm-Message-State: AOJu0YydPTLNLHJF2nVRxwuQV7mzWWqpCnsL/KKbdEcVidz+RygLnGfz
	3pEokyT6iC2Sy5d169JSC6Nokw==
X-Google-Smtp-Source: AGHT+IGh6/pw8AhCYNH7FiOWterqGvoWGNUkgu/EnsrVKnj5h5ttR15SiMKATB3tNhotsC22ECVYdA==
X-Received: by 2002:a05:600c:cc:b0:3fe:1db2:5179 with SMTP id u12-20020a05600c00cc00b003fe1db25179mr3955293wmm.19.1694679247084;
        Thu, 14 Sep 2023 01:14:07 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id p6-20020a7bcc86000000b003fbdbd0a7desm4074945wma.27.2023.09.14.01.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 01:14:06 -0700 (PDT)
Date: Thu, 14 Sep 2023 10:14:05 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Vipin Sharma <vipinsh@google.com>, 
	David Matlack <dmatlack@google.com>, Thomas Huth <thuth@redhat.com>, 
	Aaron Lewis <aaronlewis@google.com>, Colton Lewis <coltonlewis@google.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v3 4/9] tools: riscv: Add header file csr.h
Message-ID: <20230914-90a562a03985a9a97afd953a@orel>
References: <cover.1694421911.git.haibo1.xu@intel.com>
 <119c9d06d64b7e4932c5f74a05af1e769cbe7da6.1694421911.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <119c9d06d64b7e4932c5f74a05af1e769cbe7da6.1694421911.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_011411_112796_30794D0D 
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

On Thu, Sep 14, 2023 at 09:36:58AM +0800, Haibo Xu wrote:
> Borrow the csr definitions and operations from kernel's
> arch/riscv/include/asm/csr.h to tools/ for riscv. Since
> only 64bit was supported for RISC-V KVM selftests, add
> CONFIG_64BIT definition in kvm/Makefile to ensure only
> 64bit registers were available in csr.h.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  tools/arch/riscv/include/asm/csr.h   | 521 +++++++++++++++++++++++++++
>  tools/testing/selftests/kvm/Makefile |   3 +
>  2 files changed, 524 insertions(+)
>  create mode 100644 tools/arch/riscv/include/asm/csr.h
> 
> diff --git a/tools/arch/riscv/include/asm/csr.h b/tools/arch/riscv/include/asm/csr.h
> new file mode 100644
> index 000000000000..4e86c82aacbd
> --- /dev/null
> +++ b/tools/arch/riscv/include/asm/csr.h
...
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> index 0102a0297b84..89ecee2fdb73 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -222,6 +222,9 @@ CFLAGS += -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99 \
>  ifeq ($(ARCH),s390)
>  	CFLAGS += -march=z10
>  endif
> +ifeq ($(ARCH),riscv)
> +	CFLAGS += -DCONFIG_64BIT
> +endif

This should be a separate patch, since the "import csr.h to tools" should
be completely separate from anything else. Also, all architectures that
KVM selftests supports are 64-bit, so, as another completely separate
patch, I think we should just add CONFIG_64BIT to CFLAGS for all builds,
especially since there's a chance some of the includes the other
architectures are using may need it. Of course we'll need sign-off and
testing from the other arch maintainers.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
