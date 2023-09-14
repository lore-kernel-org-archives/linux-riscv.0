Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB28EDE998
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 08:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ifh662jlvVpQR0sUDxtBsOqSJ72iSdNuQ+MGT10/HXA=; b=f2k31fLIGO/72B
	SQ3SJoc3rhipBO9XV1npKJmKZZA2dn8wrObSHgAfH21OOUjslO5/9/FG1796ecGr9cFaasZshh7yk
	PNlaL2V04kPyJuSbi+v1Uxvrg4gsTvHLTw3gwxZMEWbRXwWwRAwkNU5miKw7p4l46AAtiZTrwcFtX
	Ozb/VnU47j2YBFOAP3geWpDiQ+lDrJS9xCcUbpjDGK0z1tbHBe4EXXtPcZjiyfq+jEA7OyKl0kobz
	HuEyNESWpdnLDz+wAqVC4jNoag6XIbLGeOdD0PlVOgXSNzeL6MAd93UC2ARq1+ji7sY2yMCYEjeD/
	P1ukLxFL/OO546+bxm5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgi5G-007ktC-0p;
	Thu, 14 Sep 2023 08:52:22 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgi5D-007krP-0t
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 08:52:20 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31adc5c899fso592686f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 01:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694681535; x=1695286335; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lMUcG5dET7EFobfbAHbzg2lwyOfsWQ8F2tpkEXeY8DY=;
        b=Jo+9z/w9R5Me5YO2t/D+iVFKNEaFPsEEK33zCdeU1JntRBK33fSha8CgXXuxFjxjoa
         2Ut6F0ZIZh7azrbOtk7drzHcI3G2bFerrsYxEXTM+CUHj2GIyygFz9/wfEfOdaQrs1S7
         EmwOoMRZ6GFu5U/MVZ9n8Ug2ynb/NkUV5fhfl/0BxDeaZF1AlPEsvOofdt0mKfFtgRZ3
         Jn1gZWOp6ouuzNNPnY/tjrHp/w+2xXVb12lTejAsAnkwD1ZKhHUDg8UmWuW7mSkDC+j6
         FgfU8PY+eDG7aC1YtU+Gtih3wowG9bM5g8G1lEnc0JL8H0iuYpRJUdn7Rus54d3y4bx7
         YAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694681535; x=1695286335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMUcG5dET7EFobfbAHbzg2lwyOfsWQ8F2tpkEXeY8DY=;
        b=jAv4xCZXf0zV6mA4FuGsIzLCLRPkQLNr2HVSyyOhp39DFH0ETC5bck0JtQZedPO5+5
         DwwUtGy9IOtDKMWm3dnUqJc64wpVBfaQLbfXCfStqozw2u2MR435ee3pxDbklYAC40CK
         esTPldCB0QXvH6ORFWhwNikhJTdVSaXauo4UCJClF8Fo/WFg9k6yRp1Di0FRnNKmj9mA
         3MJmmMzjbWweRyNfZ/1c+Eq0G/Qhdpd/sio3YqBH5fgqsO8IVqV2+AsDiO9vIfvYmLku
         mph4evuGMv0KrZXjROvxz9Jq8Wa+wRfZgfyDQpHSTi3olyRI2OHm/ZO0ueVWTt6UN1dU
         AuQA==
X-Gm-Message-State: AOJu0Ywu2C5wjGCPqfVIgzx27s9kStO5zWBgwJ87EZaprghgfsDIc7HX
	aImaJ18tCZUjZklgpilt+vmYFQ==
X-Google-Smtp-Source: AGHT+IF/71ROIOoJExJf8FEqPIRkV7f1W6lv97o8MVa7W5dAed2t55G5dPLBGqXoAtZVnyXGa4aJ8Q==
X-Received: by 2002:a5d:4f88:0:b0:319:83e4:bbbf with SMTP id d8-20020a5d4f88000000b0031983e4bbbfmr4097683wru.20.1694681535355;
        Thu, 14 Sep 2023 01:52:15 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id r8-20020a5d4e48000000b0031ad2f9269dsm1137143wrt.40.2023.09.14.01.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 01:52:14 -0700 (PDT)
Date: Thu, 14 Sep 2023 10:52:08 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Peter Xu <peterx@redhat.com>, Vipin Sharma <vipinsh@google.com>, 
	David Matlack <dmatlack@google.com>, Colton Lewis <coltonlewis@google.com>, 
	Aaron Lewis <aaronlewis@google.com>, Thomas Huth <thuth@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v3 5/9] KVM: riscv: selftests: Switch to use macro from
 csr.h
Message-ID: <20230914-18bfe93b679e290188e70307@orel>
References: <cover.1694421911.git.haibo1.xu@intel.com>
 <6cdda82518977c67004ee01a767bc67962352c13.1694421911.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6cdda82518977c67004ee01a767bc67962352c13.1694421911.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_015219_314712_E04EA18C 
X-CRM114-Status: GOOD (  14.40  )
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

On Thu, Sep 14, 2023 at 09:36:59AM +0800, Haibo Xu wrote:
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/testing/selftests/kvm/include/riscv/processor.h | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index 5b62a3d2aa9b..67766baed4f7 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -8,6 +8,7 @@
>  #define SELFTEST_KVM_PROCESSOR_H
>  
>  #include "kvm_util.h"
> +#include <asm/csr.h>
>  #include <linux/stringify.h>

nit: Usually we try to keep the order of our includes separated into five
categories, listed below, where each category is sorted alphabetically. Of
course any dependencies the includes have on each other need to be
considered too.

<library-includes-without-a-subdir>
<library-includes-with-subdir>
<linux/...>
<asm/...>
"local-includes"

>  
>  static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t idx,
> @@ -95,13 +96,6 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t idx,
>  #define PGTBL_PAGE_SIZE				PGTBL_L0_BLOCK_SIZE
>  #define PGTBL_PAGE_SIZE_SHIFT			PGTBL_L0_BLOCK_SHIFT
>  
> -#define SATP_PPN				_AC(0x00000FFFFFFFFFFF, UL)
> -#define SATP_MODE_39				_AC(0x8000000000000000, UL)
> -#define SATP_MODE_48				_AC(0x9000000000000000, UL)
> -#define SATP_ASID_BITS				16
> -#define SATP_ASID_SHIFT				44
> -#define SATP_ASID_MASK				_AC(0xFFFF, UL)
> -
>  #define SBI_EXT_EXPERIMENTAL_START		0x08000000
>  #define SBI_EXT_EXPERIMENTAL_END		0x08FFFFFF
>  
> -- 
> 2.34.1
>

Assuming the CONFIG_64BIT patch will come before this, then

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
