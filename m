Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FDFCE79AE
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 07:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xgZs+CicWWcUv/lcNyblQ8leDiyFFaF4jU7Qh+cyCKY=; b=mI/jBQaDtAH0uo
	7pxBeZqgLOqXhAupvDYxKrtqo49o12hmXBCeGuAVfS4HWiXvOaFsTTOZzq2JNKkz7z0gnbp/HeCNY
	8V3KO42EeslV9nv7QUsgM0h/sJdgZalxVNAyZZk9rZPEQPd7x2WsP3NIgAsdWoQ82P7X2vPbDXfrn
	5iXnjf7tL1znwXsN+yYQpqYtC93FrIRogZ1I29dwQpxnk+9jKcBppWYhwCv4qbbXZ6qYloL0FBtP6
	HgZ6GY0zoVp+8NyiKLJCLXFCtAv+xlsSqUrDUNIMSRKUxqJoDwaBsXJxak20Azwg+RGh2aoCo4L4y
	SSjS6fBnfKX2XYcxxF2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiryV-002BZv-2F;
	Wed, 20 Sep 2023 07:50:19 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiryT-002BYn-2U
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 07:50:19 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-31f71b25a99so6423932f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 00:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695196213; x=1695801013; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v7CkeCjzvtAvF0BFc3WkolXtUPqkPIzEOcb2KkTPFs0=;
        b=lAD6BOdPTrfq+zBDVrI85O5X3scSR5yt/vfo/cQ/4xOO5wrTgteVTYnt3EQpLceqH3
         pr1M/8CZwXEs5HxUYlWsgOvBLZvdrYk0C6HKEvNEHfvDAUEEdHTfMbLl3WQH6BD8fnP/
         r0ZergdvdsvU6DA6ma1/bLed+RbbxOfCYM8YF2hzRQuirfQngGIsurcoQC51Gb0ffKqI
         jzrkKXfvf+S5ay4P5jHtFFwaVk6ChRkKtiK+sZu4Sn23GF2L4u274a8Stud2EJFFHUfF
         febaczLZlxT3AkuzgnYyxLnB1dqXSeyKbRBWL2l+kLwPYbS4Hf5boU5frxOdrEbBGHZK
         bOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695196213; x=1695801013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7CkeCjzvtAvF0BFc3WkolXtUPqkPIzEOcb2KkTPFs0=;
        b=j697vw1RQWto7g3A7FiSQXXOsIAW4dZ69lj8obtUi+T7BxplxZ9qVAez9kdz0AXxEi
         oNhhUBN6Nx4+KDDb51eEAthBs3q1SUD3DdkRKE9qFAvN4HOGYsW4fcTC1MnDRByB+oAx
         2MttnRtHua6wr+aFKGUtFbTPUt9t8pCSpMn06MbUNEpzBImDgIj1qLNBmA2Hi454eM1k
         tway05QT8iyjUb/9zKmel20Zb8eZRmrgm+FJJycT9paHP+Lhxkft3Qvi38on1B5BDsfp
         jYA/zUS6Xkj9cLasqopZx057kNTu4XQitZlwU2naWN/amAjv4T9viGswhDNxMX9brtt3
         zNAg==
X-Gm-Message-State: AOJu0Yw8K8A7sV8jWiryiwMx9JN/fqy5o2jvoy/Pzrh45gqn2CTAXzyD
	ZyznvrnNfUbPlr6KI0OWrVIq9Q==
X-Google-Smtp-Source: AGHT+IGw1VBQZO24lqLlXFGTfo8W9hy1BjDwhuuXt9Rrtc78ra8pQJSm+b20JrGdyY74TJahcGWzCA==
X-Received: by 2002:adf:d0c8:0:b0:31f:d8b3:ea06 with SMTP id z8-20020adfd0c8000000b0031fd8b3ea06mr1576992wrh.0.1695196213173;
        Wed, 20 Sep 2023 00:50:13 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id z8-20020a056000110800b0031f9bdb79dasm17647528wrw.61.2023.09.20.00.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 00:50:12 -0700 (PDT)
Date: Wed, 20 Sep 2023 09:50:12 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Shuah Khan <shuah@kernel.org>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 5/7] KVM: riscv: selftests: Add senvcfg register to
 get-reg-list test
Message-ID: <20230920-a6e56a81b36f95d115efceff@orel>
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
 <20230919035343.1399389-6-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230919035343.1399389-6-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_005017_812613_CE3EA28F 
X-CRM114-Status: GOOD (  16.01  )
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

On Tue, Sep 19, 2023 at 09:23:41AM +0530, Anup Patel wrote:
> We have a new senvcfg register in the general CSR ONE_REG interface
> so let us add it to get-reg-list test.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 85907c86b835..0928c35470ae 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -209,6 +209,8 @@ static const char *general_csr_id_to_str(__u64 reg_off)
>  		return RISCV_CSR_GENERAL(satp);
>  	case KVM_REG_RISCV_CSR_REG(scounteren):
>  		return RISCV_CSR_GENERAL(scounteren);
> +	case KVM_REG_RISCV_CSR_REG(senvcfg):
> +		return RISCV_CSR_GENERAL(senvcfg);
>  	}
>  
>  	TEST_FAIL("Unknown general csr reg: 0x%llx", reg_off);
> @@ -532,6 +534,7 @@ static __u64 base_regs[] = {
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_GENERAL | KVM_REG_RISCV_CSR_REG(sip),
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_GENERAL | KVM_REG_RISCV_CSR_REG(satp),
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_GENERAL | KVM_REG_RISCV_CSR_REG(scounteren),
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_GENERAL | KVM_REG_RISCV_CSR_REG(senvcfg),
>  	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(frequency),
>  	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(time),
>  	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(compare),
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
