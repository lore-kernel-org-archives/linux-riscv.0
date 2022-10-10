Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284EBC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Oct 2022 18:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=1TFjXM5YHqHFdmwyc9I0dX1eOck3ygz/75yFvaa3Iy8=; b=HkoBG9ygrHifrt
	6eu3R3NW+io3Vh0OF3jBShYbj3NYJhj8vycSLt+YxVMApqZrT26LaF4FVVa3+7b2X+LgGf4ZAvrAL
	Uj1TX/Gj+GXQoY4uCjNRmAVJXpLN8V27MFhMSlDmB6fcPJlTZzJ3f1AxUJUamI7hj7kKVgchJqeHY
	SFn3CaoXA+3R5OWL+LkL/bbOHJRaRQWG2Kf8Pke7SSn514xgbbCZeMyK/DbB1TcIrX5oXeGMRZ2v+
	+xEJGdZx0YFQqxQbEXi2+JnJ//MpLouqErAChRsF9DPZTxX2/iJdcXRaQ9W9fkNy/g50GSfNQXJYS
	X35q6g8b+mwLgdH81/pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohxde-001ol5-Gz; Mon, 10 Oct 2022 18:36:30 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohxda-001okA-Dm
	for linux-riscv@lists.infradead.org; Mon, 10 Oct 2022 18:36:28 +0000
Received: by mail-pf1-x42c.google.com with SMTP id 204so11448913pfx.10
        for <linux-riscv@lists.infradead.org>; Mon, 10 Oct 2022 11:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jLF+jy/JMs04OPPgXFCH09CiQEEQ4xWiy74TizUTI/4=;
        b=xBwcDeJbxB8drHApp0dHPkDyKcb6FnYUttk6IvtWZb9eqXJ1f8ThNS2fHFa5K4KL4B
         tNqE2EprvzTJSWdew0PvfxcDfaIXeC5Bt2ADNbuiPby33sVERhh/MT4tKDmFk+ET14F8
         OCGV3289wbDq4dl/Wsw/d/rSux24unpjlGOEqoPVq8ii9fyVhkY6R3C09t26WpHojg07
         /y6+/ZYud63ZGr8T1mtwJZB8TcAsD9Fn+lFQJKteUnAO0vlHKe+0/FCf6hrHUd7VBEN0
         uK87FdpEPI40iWJOXIwxP+NQtfuYzyIwApwsdjUkdae+I8vBIxGkBXwGG/GEx5b1dRdT
         PJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jLF+jy/JMs04OPPgXFCH09CiQEEQ4xWiy74TizUTI/4=;
        b=JZSRVg1W5xBW1u1zSI2+ZV1RLHXAQ4xgOhWvQ/SAPov4qOmSJp9vG+KHMLxN9oGx7b
         Ue++ubaXO0/GZWekyERvQrYY2F/qjU3NSxzIQRFmh3QjcVGlkHDXJVKDdYyKVjAWAtxU
         S+qr+jOpAo2uyUQ+GQcWfFZgqK7wxeEC0Wc5G7YCwHqrF3pViMlVlAzueBqlDA/fKHgY
         tTDUgvmEUWIGv2zNsGZrrdiIJCG7qdNViFYqPV7Ga0g/AJ8HRKVrw83PzIPouIkhenud
         YbiyPazQkMwFrK65VJp05EOTgtneFFl3pcDbob4VtLf6vDNLHXAsTX2fwbY7SetLeq/0
         JpQQ==
X-Gm-Message-State: ACrzQf2EfJJW9USDaoHkEv+h9+ZlEIhVBfB+/X3gvrZLoKVk5AWZN3AW
	4jx2f7PIqONou3IUSj+Tu803Mg==
X-Google-Smtp-Source: AMsMyM6/EUHIRjjpqj7F74YSE9Zb4JqLhw4NUgkgrwoxxHPgvCAXCPqZfykY6jKSrxge08clocOXAA==
X-Received: by 2002:aa7:9614:0:b0:562:b07b:ad62 with SMTP id q20-20020aa79614000000b00562b07bad62mr20497524pfg.79.1665426985274;
        Mon, 10 Oct 2022 11:36:25 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id d1-20020aa797a1000000b00562362dbbc1sm7270895pfq.157.2022.10.10.11.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 11:36:24 -0700 (PDT)
Date: Mon, 10 Oct 2022 11:36:24 -0700 (PDT)
X-Google-Original-Date: Mon, 10 Oct 2022 11:34:18 PDT (-0700)
Subject: Re: [PATCH] RISC-V: KVM: Fix compilation without RISCV_ISA_ZICBOM
In-Reply-To: <20221010094029.1579672-1-ajones@ventanamicro.com>
CC: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
  anup@brainfault.org, atishp@atishpatra.org, conor.dooley@microchip.com, vernon2gm@gmail.com,
  lkp@intel.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ajones@ventanamicro.com
Message-ID: <mhng-62a2d3c7-f08d-4f40-862c-4d4f09a6150a@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_113626_706362_965C2937 
X-CRM114-Status: GOOD (  18.00  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 10 Oct 2022 02:40:29 PDT (-0700), ajones@ventanamicro.com wrote:
> Fix undefined reference of riscv_cbom_block_size when compiling KVM
> without RISCV_ISA_ZICBOM. Note, RISCV_ISA_ZICBOM is a sufficient
> guard as it selects RISCV_DMA_NONCOHERENT, which is needed to compile
> dma-noncoherent.c (which is the file where riscv_cbom_block_size and
> its initializer live).
>
> Fixes: afd5dde9a186 ("RISC-V: KVM: Provide UAPI for Zicbom block size")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index a032c4f0d600..e4453caba728 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -265,11 +265,13 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
>  	case KVM_REG_RISCV_CONFIG_REG(isa):
>  		reg_val = vcpu->arch.isa[0] & KVM_RISCV_BASE_ISA_MASK;
>  		break;
> +#ifdef CONFIG_RISCV_ISA_ZICBOM
>  	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
>  		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOM))
>  			return -EINVAL;
>  		reg_val = riscv_cbom_block_size;
>  		break;
> +#endif
>  	default:
>  		return -EINVAL;
>  	}

Thanks, looks like this is tripping up the kernelci builds too: 
https://linux.kernelci.org/build/id/6343b37c6fd2dcbb5dcab5f3/logs/ .  
This symbol is actually a bit odd, as we don't actually just use it 
under Zicbom because of the T-Head stuff.  Looks like that's generically 
broken, though, so IMO we need something like this

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 6cb7d96ad9c7..fba86fa3a628 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -5,6 +5,9 @@

 #include <asm/cacheflush.h>

+unsigned int riscv_cbom_block_size;
+EXPORT_SYMBOL(riscv_cbom_block_size);
+
 #ifdef CONFIG_SMP

 #include <asm/sbi.h>
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index e3f9bdf47c5f..33d21ace0971 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -12,7 +12,6 @@
 #include <linux/of_device.h>
 #include <asm/cacheflush.h>

-unsigned int riscv_cbom_block_size;
 static bool noncoherent_supported;

 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,

which should be

Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing").

We might also want the ifdef for KVM, as that would allow us to build KVM that
doesn't support these VCPU configurations, but that's sort of a different
question.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
