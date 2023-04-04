Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E870C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 16:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G/wxw0wEoHfKKk+VkTdosMaCS+7koJSRYpugtJVjojo=; b=c9O7RkbKiSkwV6
	dLm7IuX3IL4m72Ai3CZM3mI6ZQK0zJPL/hUN9id9MYELuVjulggN2n20fkKp8NWCpdD9kj7GW/6Ap
	StnHCOoEO+tM1ArwxKKEnxQO3p+gJN3WEH15Vo4WykW+blyhJdAxVPyqiKhLoZRsGgHfOr4uu/2JM
	FeBCWaOwOLVIe6Sdh9eNp6qlC6a5gDdmDvvPvM1MHh8ylbTbf9c+VXWoon+ysdPRq2D9nfi6sZioo
	OtHAZaNcoEojbQAjPQcW6FEGpI4KbUJHGE+NXTY620YAcWNn+PUdDqLWAx7d7Ch6hFafN+pqpyIbR
	0loJuersZBYG1C81v6DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjTL-002C0B-0e;
	Tue, 04 Apr 2023 16:25:27 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjTI-002BxC-1B
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 16:25:25 +0000
Received: by mail-wm1-x335.google.com with SMTP id n9-20020a05600c4f8900b003f05f617f3cso1319671wmq.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 09:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680625519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vDk7Rc1+MlWExgJcsOHL4y40vJ5PAjWrSI2Xt0WKM8M=;
        b=nQmO0GuiV4QZBXRBbBMVzHtFmDIyOn0ZbA7ZCuVmg0mv0cUepkPjSrAMNOpshj4BQp
         uVIU+3z9FXhDrft53jJNC6siocV4dlmMcVjeN25d04FW33B4WtxzJG4xtxPom9gW+q0C
         EOLNRuMKERDowqBWYXxK8Ib3xiLC+1boADcxBpk5ArAczCiOCFCoW/r6j5P5fnrClZNm
         SQYupR9ilY0F2FaWhkognZ4y4Cvy5s5m31k0ojG0ZYijw9MvCLzUmz492LIINCFTk8VZ
         TyWv+j7e0tmWrM+rVzOat6C/HAPjcxc2gMv7kr1BvKzOLbfvm7aM8mSi+B4KRmnkDK66
         KQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680625519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDk7Rc1+MlWExgJcsOHL4y40vJ5PAjWrSI2Xt0WKM8M=;
        b=iNjraDp8MHsbbfrg1OvJ57xQRdCpw43DVNhcCf8NMCG2NkrNdtGN2ov/w5S7IKxsnz
         o7i2dTHBAOUJ/49woL1k1HfX0k7GbuPcl0kmRSwWjl61APjgnAa0qnySLaiVJp1VF+pv
         WIQIR56lZLdqHtGv2A1tUwaHl7RgfznH5grq8Cyqw5TbOl8skPE7ofl18X9mHmrNXVQB
         J+o7LMf3vefK3fN10PUQfFMjNMQylynTuwnQFlU5mgtZrsYqxZUdfs+eKgZz/S8ywK+h
         kdkK221SLJT7i50iQ1xKj9apP4MP25rkr9WsBQ+V6uv7n2dFndT15kOijhpIJySTITXT
         wifA==
X-Gm-Message-State: AAQBX9cpEXjfTHuXsvEBKNWchS0f/sLLCmTADZBvqjB8CZuGhWEo/hvB
	PccSr2ZaCEJiuERPZ+PUrqXbaw==
X-Google-Smtp-Source: AKy350ZEVfY7T7MI9PiLLjjET7sb4Iy02pa7upxW8SfHLpRHBZOevNEEwY0yifqPndAiXwKpzG87Hw==
X-Received: by 2002:a7b:cd94:0:b0:3ee:5bd8:d537 with SMTP id y20-20020a7bcd94000000b003ee5bd8d537mr2409858wmj.5.1680625518762;
        Tue, 04 Apr 2023 09:25:18 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id w18-20020a1cf612000000b003ee58e8c971sm15589813wmc.14.2023.04.04.09.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 09:25:18 -0700 (PDT)
Date: Tue, 4 Apr 2023 18:25:17 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/9] RISC-V: KVM: Use bitmap for irqs_pending and
 irqs_pending_mask
Message-ID: <6dvutvobx754xdbbfw4ociyxuay6fqjwm3vxdp5dmsyefypvzs@ydxl65hjdwt2>
References: <20230404153452.2405681-1-apatel@ventanamicro.com>
 <20230404153452.2405681-8-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404153452.2405681-8-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_092524_402311_885F43F2 
X-CRM114-Status: GOOD (  10.50  )
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

On Tue, Apr 04, 2023 at 09:04:50PM +0530, Anup Patel wrote:
> To support 64 VCPU local interrupts on RV32 host, we should use
> bitmap for irqs_pending and irqs_pending_mask in struct kvm_vcpu_arch.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_host.h |  7 ++--
>  arch/riscv/kvm/vcpu.c             | 53 ++++++++++++++++++++-----------
>  2 files changed, 38 insertions(+), 22 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
