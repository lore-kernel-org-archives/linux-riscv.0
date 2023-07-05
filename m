Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35068EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 11:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lBFwgcWfBWUteCL09+mT/4t2svu8r3ojJr48HJxKW4E=; b=ofjksBhhM5MjUX
	/T+PDYiLKhRVEsXtwwy+Gl04e505RYJ2iTfOX0pJdBVOw5LOSrtOsO8cL1Wgo74juk+8X7wdPQImq
	NAl5rpw1jiKMPr6lhE8gQduubK0ntiWUWc8+rPQnf6UM/rwPoVCfBTFtfOn6BZQGLSSGR/JysXLK6
	/gqlJPN6xyF8vAzOpgXwTwy7rLqmyqI3xL5oIcwL4WdQP+zFBlSxnpzMt9nrOFkkp017NQEKNZGbv
	b1luBUz+3TANMtneaUWc1x6JuuFZ9Cx26ebRh4Yh7nBtxezf9o7YzFxvRsulhM4n7ycL6fX9YTJFM
	IzDXdbhLwQAycuZsglgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH0be-00FiFS-2p;
	Wed, 05 Jul 2023 11:23:34 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH0bb-00FiEJ-1K
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 11:23:33 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51dec0b6fecso6440604a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 04:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688556208; x=1691148208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xA/qaMbHKwRygDBA+A7l+wNTXn1VIUtXd+MMJlcZoPs=;
        b=RxtN66EXvK1UdpnUB6GlfkKYwDCe3kDQm0VHIggdXvMpLASsNNfrxPF69BUvuE6i1X
         95wL8H0nJkeDYIo+WUFcdIrhlxsu7krHR8HAglFELcE4wCdAbMxGnKOIcTBnVfAf0RtY
         RdSkhtyWQlE/zn06eXiXAAvW2kB0Tp5eCQ7aGe/Tv6erJqFSKH07bB6rRsLE6uFI40/E
         Uv4UJAbV2lPgQmUP9qxok7ny57ADsL1iX602YISVjVSKiwkRZsVJXe/emNrjF8KriTbl
         1S/MYgXs2eGw2ftO19bkL9Alzs04pQAXwnxQz53xaDBFcztxJx3TccIpgodMCo2I3yhv
         tYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688556208; x=1691148208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xA/qaMbHKwRygDBA+A7l+wNTXn1VIUtXd+MMJlcZoPs=;
        b=EHerC0Wc4Ja60JaNmN9WlZAY16J4kpzEi1XN/kMF+eH9ykOxcEr0MaXcFFXRTwbFCV
         ekjTCe8d68HqknQBDWk48ri8bkWRO4bKsTKIP0+WaHAFE6xc+Bi4cCohrgKc0vhFd/gV
         JlX2VQcOf0Mv9i5dg8gJFBFoVrqj2m2WyKrvJAVDK4LsvIYP1/li2/5vTyszBHD9fjAM
         mDfS/DMOaU24HKmw5eG08kHhU1tqSwjCp69RJLGT/NuwUvehafldg2epCh30qda1WZbi
         n6y0K4N6LXMz3peRMPji/eIQkUyMOHDul3ecSwwgPyWLKQvOwCNAYEKzV6zm3v48KgKw
         Fc6g==
X-Gm-Message-State: ABy/qLYBW50CH3d/E2qN/gMqAqYbEax+8zx8lQ+7+KlU0M9lfcv6jpHN
	bADINI9yX3U3dAWhNtvG4mAyHw==
X-Google-Smtp-Source: APBJJlHGIZGlXvvsL9dPyHZ5H34Xzcud9b7fqfoE9i8f/lsxGG2kBQb1eUF8SV5MNfpbpxVHZasx5g==
X-Received: by 2002:aa7:d8d2:0:b0:51e:16ae:b6d7 with SMTP id k18-20020aa7d8d2000000b0051e16aeb6d7mr5326095eds.33.1688556208398;
        Wed, 05 Jul 2023 04:23:28 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id bo17-20020a0564020b3100b0051e0c0d0a8bsm4667101edb.7.2023.07.05.04.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 04:23:27 -0700 (PDT)
Date: Wed, 5 Jul 2023 13:23:26 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, anup@brainfault.org, atishp@atishpatra.org
Subject: Re: [PATCH] RISC-V: KVM: provide UAPI for host SATP mode
Message-ID: <20230705-8af7caeededf1b02f0a08d64@orel>
References: <20230705091535.237765-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230705091535.237765-1-dbarboza@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_042331_476841_7E2AB153 
X-CRM114-Status: GOOD (  23.73  )
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

On Wed, Jul 05, 2023 at 06:15:35AM -0300, Daniel Henrique Barboza wrote:
> KVM userspaces need to be aware of the host SATP to allow them to
> advertise it back to the guest OS.
> 
> Since this information is used to build the guest FDT we can't wait for
> the SATP reg to be readable. We just need to read the SATP mode, thus
> we can use the existing 'satp_mode' global that represents the SATP reg
> with MODE set and both ASID and PPN cleared. E.g. for a 32 bit host
> running with sv32 satp_mode is 0x80000000, for a 64 bit host running
> sv57 satp_mode is 0xa000000000000000, and so on.
> 
> Add a new userspace virtual config register 'satp_mode' to allow
> userspace to read the current SATP mode the host is using with
> GET_ONE_REG API before spinning the vcpu.
> 
> 'satp_mode' can't be changed via KVM, so SET_ONE_REG is allowed as long
> as userspace writes the existing 'satp_mode'.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  arch/riscv/include/asm/csr.h      | 2 ++
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu.c             | 7 +++++++
>  3 files changed, 10 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index b6acb7ed115f..be6e5c305e5b 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -46,6 +46,7 @@
>  #ifndef CONFIG_64BIT
>  #define SATP_PPN	_AC(0x003FFFFF, UL)
>  #define SATP_MODE_32	_AC(0x80000000, UL)
> +#define SATP_MODE_SHIFT	31
>  #define SATP_ASID_BITS	9
>  #define SATP_ASID_SHIFT	22
>  #define SATP_ASID_MASK	_AC(0x1FF, UL)
> @@ -54,6 +55,7 @@
>  #define SATP_MODE_39	_AC(0x8000000000000000, UL)
>  #define SATP_MODE_48	_AC(0x9000000000000000, UL)
>  #define SATP_MODE_57	_AC(0xa000000000000000, UL)
> +#define SATP_MODE_SHIFT	60
>  #define SATP_ASID_BITS	16
>  #define SATP_ASID_SHIFT	44
>  #define SATP_ASID_MASK	_AC(0xFFFF, UL)
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index f92790c9481a..0493c078e64e 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -54,6 +54,7 @@ struct kvm_riscv_config {
>  	unsigned long marchid;
>  	unsigned long mimpid;
>  	unsigned long zicboz_block_size;
> +	unsigned long satp_mode;
>  };
>  
>  /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 8bd9f2a8a0b9..b31acf923802 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -313,6 +313,9 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
>  	case KVM_REG_RISCV_CONFIG_REG(mimpid):
>  		reg_val = vcpu->arch.mimpid;
>  		break;
> +	case KVM_REG_RISCV_CONFIG_REG(satp_mode):
> +		reg_val = satp_mode >> SATP_MODE_SHIFT;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -395,6 +398,10 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
>  		else
>  			return -EBUSY;
>  		break;
> +	case KVM_REG_RISCV_CONFIG_REG(satp_mode):
> +		if (reg_val != (satp_mode >> SATP_MODE_SHIFT))
> +			return -EINVAL;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> -- 
> 2.41.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
