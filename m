Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF70C83F2C
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 13:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bO7Tw7j2DkNcXvn4arAIgdgYJbmAej2UBrC7h8wbFBc=; b=A4W2ntoMo48HD/
	2F+JHLAr3DWQMFmMdWm7Bdce3MxFMF5ILO9tjaxdWRgUU4YgpUcmufePzHTuvPzywajA0vuLYyHFV
	26F1YocZpGgvL9aG/+H10BfFRjJlbI5x5LnES6h1mk1u2S7govmS5sglx1/F0BOOKejMsaeFD0Oj+
	Gy7qEzdmel+cDs6smVxtJRUxQEMFejunj8NSlGsvectid9kHWYIzi+mOu+6TpK5BnhN2oHa4pzI8o
	05/H+BIw+j5jKjmiJxqHQCo4RXjpPmyW/kVgG0w1gQTKMhR8182UkKy2hdjhQg8UTpCbhDxCUkfyh
	iDQQ8Ift3vHA2NL+eUuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qd9g4-004C5E-35;
	Mon, 04 Sep 2023 13:31:40 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qd9g2-004C3z-1f
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 13:31:39 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9a5dff9d2d9so221124166b.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Sep 2023 06:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693834294; x=1694439094; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hCYvspyPAR7BQTyfNQLsPOWKxV3J1BTko++dNnBZlmc=;
        b=bZzG3Z3eaHGAbTZxdtM/Y9lgqeaimKq1hk8Y/XRWE+BFJO2yUVBJtR+rJ3GDQvq/ml
         pp9U9LL6ECWwQ/YjZGxwd+87JMTXvrMdphb0BNMmEj3IunapOLyd1whfIFzolTxWi1jp
         1xOEoXjox9blYufhQyln/LTqq2SIhXFwBtgPkI+3l6I3tCV+0F+M9h9oD49N4RVX1Wbu
         EHUurTnVSliQi27PhG48LFRSbWi841zpTSXdGAL0C/OhJ4MsVotm8RdnLaPHLbZW6uQD
         72U404YNDM17mF3JG/FB1x5r7XM8gE+3h8dF5eT+ZjeDLHgNG9lpNDr988xEHGxLaZWH
         23vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693834294; x=1694439094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCYvspyPAR7BQTyfNQLsPOWKxV3J1BTko++dNnBZlmc=;
        b=jDARisgYDPAOmkYE7mo6s/6I7HfNdu87+9IHfk3Dz1Q4M810fUvK2531GQ1pFsxD6m
         +Q8/T2AlTGRumvgci7/D4EsuAor8PrJemYE1Ty5e+on97ieim6mwJgoSR/E691Ij2YZK
         JuJWLqVV5/bAxGZmfrakuoqin2QSnpNRnl00P1kMa1G3zG5FXrgbN/AWI9WuVK+X2ep+
         QiKEHtHAlw9I3VX7F8aoM1bbVVu02kKUTELUi/E3HqzIr04bj9baampY5Y8zEx2Sh3Ct
         9LPo9VW3wUo+4K1Wo7Qv+1Sn6MoFb2CapizBiFvSNPtYsj5CtGTxfHpKE5mCGIOLvNWO
         SWzg==
X-Gm-Message-State: AOJu0YwdXwGfLJSPDr/uTac34UGN6Wq2yUZpOFAUeuTmFqUzp122Na/m
	SoaL6T9z3ocNaH/i4S1JJ/SIxg==
X-Google-Smtp-Source: AGHT+IGtFqpzjt6uSaukx7aodEb/54kI1XEGaEwgvvmfQYwT0ivCYh8vhE7uW3lVgPNl4aIYuhjmcA==
X-Received: by 2002:a17:907:7808:b0:9a5:d095:a8e1 with SMTP id la8-20020a170907780800b009a5d095a8e1mr6644948ejc.11.1693834294609;
        Mon, 04 Sep 2023 06:31:34 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id m21-20020a1709060d9500b0099bc2d1429csm6167078eji.72.2023.09.04.06.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 06:31:34 -0700 (PDT)
Date: Mon, 4 Sep 2023 15:31:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, wchen <waylingii@gmail.com>, 
	Greentime Hu <greentime.hu@sifive.com>, Sean Christopherson <seanjc@google.com>, 
	Ricardo Koller <ricarkol@google.com>, Vishal Annapurve <vannapurve@google.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Aaron Lewis <aaronlewis@google.com>, 
	David Matlack <dmatlack@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Jim Mattson <jmattson@google.com>, 
	Vipin Sharma <vipinsh@google.com>, Maxim Levitsky <mlevitsk@redhat.com>, 
	Peter Gonda <pgonda@google.com>, Like Xu <likexu@tencent.com>, 
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, Michal Luczaj <mhal@rbox.co>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/8] KVM: riscv: selftests: Switch to use macro from
 csr.h
Message-ID: <20230904-d35320b23119ee97737e8a74@orel>
References: <cover.1693659382.git.haibo1.xu@intel.com>
 <ee4e518cbed9ff4210b74a22c5af21c410fab85d.1693659382.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ee4e518cbed9ff4210b74a22c5af21c410fab85d.1693659382.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_063138_556315_28A460A5 
X-CRM114-Status: GOOD (  13.64  )
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

On Sat, Sep 02, 2023 at 08:59:26PM +0800, Haibo Xu wrote:
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/testing/selftests/kvm/include/riscv/processor.h | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index 5b62a3d2aa9b..6810c887fadc 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -8,6 +8,7 @@
>  #define SELFTEST_KVM_PROCESSOR_H
>  
>  #include "kvm_util.h"
> +#include <asm/csr.h>
>  #include <linux/stringify.h>
>  
>  static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t idx,
> @@ -95,12 +96,8 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t idx,
>  #define PGTBL_PAGE_SIZE				PGTBL_L0_BLOCK_SIZE
>  #define PGTBL_PAGE_SIZE_SHIFT			PGTBL_L0_BLOCK_SHIFT
>  
> -#define SATP_PPN				_AC(0x00000FFFFFFFFFFF, UL)
>  #define SATP_MODE_39				_AC(0x8000000000000000, UL)
>  #define SATP_MODE_48				_AC(0x9000000000000000, UL)

SATP_MODE_39/48 are also in csr.h

> -#define SATP_ASID_BITS				16
> -#define SATP_ASID_SHIFT				44
> -#define SATP_ASID_MASK				_AC(0xFFFF, UL)
>  
>  #define SBI_EXT_EXPERIMENTAL_START		0x08000000
>  #define SBI_EXT_EXPERIMENTAL_END		0x08FFFFFF
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
