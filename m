Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2ECC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 16:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DumSTgGw4l+rZMLtpe3kiUliqo/+5A6aogLRtTy28FM=; b=Jz1CozfhIPdbw6
	jQssrWRbFZkNZTODXhbNi8uA5PxnWhuNragB7W5Ewp2jKsr38ERpa6TDU/wOKIOP/v855ekwj3Q1R
	pE0zo9uZ8v4JZ0JL4ycKgZafGDRJpSHmXBtt99ipQn+VEs9e64HzkRKFXSG1fu39bC5vbdeIme8zf
	PGAByVMhkBr0bNDaNHjgb/ALYYfgN0LHcaU7q3n80iMEbIeW1K53/bKzxqx8V6GqjA709aQgsm8XW
	BL8biFFxKMM9dSE7+t7DTeRp26v/QiI/E/B9xkPVOwS5t+MyYZJCYdKN/e7x1r9TLu1+yqaTp2MYE
	0YFDGwP0kaYTxC5HfcSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p58II-002wb8-TG; Tue, 13 Dec 2022 16:38:14 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p58IG-002wYu-QL
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 16:38:14 +0000
Received: by mail-ot1-f42.google.com with SMTP id db10-20020a0568306b0a00b0066d43e80118so191044otb.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 Dec 2022 08:38:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjI88ca8YV9FnmaROJGLMTJcQPCidHIJLaiq64mk2fw=;
        b=J0iSN14pu7J+bR3YVNiAQbmckzkcshi91phbNfaCR9pq86lat11ySX7paQoD2HQ27G
         2gjauoPg4z2WtfUP8kDetw2qHSHnK9Gu3eHhajzkTv6M30K+TtoI9jQCNG2Hqdui8gdo
         NvkJ1u4P2GI09msD0nCmVD+DlV1FiFRkKAiO3BC6KwI6cdvcvHbdDJcDesing/0GXl+r
         TGBuajY2ffDt9vq3yx9bdmGzF4OMdBtHmnSbwHob/8UqwD4dyuj57c5ybx4UikD2hlOu
         Dd+QkNNZ1GDczNPyN4vcTzDlGL3e88v/VxQ2+PPAdsJfJms/kIXHJBngqNeCaB0wpGdR
         L31w==
X-Gm-Message-State: ANoB5plnxi7w26nWcyxHctaqSjQM8oSi7ZxeX0NQy7emcs48/Rn1sP+9
	gOOc6/bZfn07nblTCYKf0w==
X-Google-Smtp-Source: AA0mqf6yiROdGm5NNVlBvSvfqyiQxqC2PPbW0NBL/ngLGZuGz3DsBVC5/iz0eZWQfegxhqTjTmY0Cw==
X-Received: by 2002:a9d:6006:0:b0:670:6246:8106 with SMTP id h6-20020a9d6006000000b0067062468106mr10467047otj.4.1670949490580;
        Tue, 13 Dec 2022 08:38:10 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y6-20020a056830208600b0066ea5d4f349sm1361066otq.18.2022.12.13.08.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 08:38:10 -0800 (PST)
Received: (nullmailer pid 2018850 invoked by uid 1000);
	Tue, 13 Dec 2022 16:38:09 -0000
Date: Tue, 13 Dec 2022 10:38:09 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v3] riscv: Use PUD/P4D/PGD pages for the linear mapping
Message-ID: <20221213163809.GA2016314-robh@kernel.org>
References: <20221213060204.27286-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221213060204.27286-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_083812_896959_A80EE495 
X-CRM114-Status: GOOD (  27.54  )
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

On Tue, Dec 13, 2022 at 07:02:04AM +0100, Alexandre Ghiti wrote:
> During the early page table creation, we used to set the mapping for
> PAGE_OFFSET to the kernel load address: but the kernel load address is
> always offseted by PMD_SIZE which makes it impossible to use PUD/P4D/PGD
> pages as this physical address is not aligned on PUD/P4D/PGD size (whereas
> PAGE_OFFSET is).
> 
> But actually we don't have to establish this mapping (ie set va_pa_offset)
> that early in the boot process because:
> 
> - first, setup_vm installs a temporary kernel mapping and among other
>   things, discovers the system memory,
> - then, setup_vm_final creates the final kernel mapping and takes
>   advantage of the discovered system memory to create the linear
>   mapping.
> 
> During the first phase, we don't know the start of the system memory and
> then until the second phase is finished, we can't use the linear mapping at
> all and phys_to_virt/virt_to_phys translations must not be used because it
> would result in a different translation from the 'real' one once the final
> mapping is installed.
> 
> So here we simply delay the initialization of va_pa_offset to after the
> system memory discovery. But to make sure noone uses the linear mapping
> before, we add some guard in the DEBUG_VIRTUAL config.
> 
> Finally we can use PUD/P4D/PGD hugepages when possible, which will result
> in a better TLB utilization.
> 
> Note that we rely on the firmware to protect itself using PMP.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
> 
> v3:
> - Change the comment about initrd_start VA conversion so that it fits
>   ARM64 and RISCV64 (and others in the future if needed), as suggested
>   by Rob
> 
> v2:
> - Add a comment on why RISCV64 does not need to set initrd_start/end that
>   early in the boot process, as asked by Rob
> 
> Note that this patch is rebased on top of:
> [PATCH v1 1/1] riscv: mm: call best_map_size many times during linear-mapping
> 
>  arch/riscv/include/asm/page.h | 16 ++++++++++++++++
>  arch/riscv/mm/init.c          | 25 +++++++++++++++++++------
>  arch/riscv/mm/physaddr.c      | 16 ++++++++++++++++
>  drivers/of/fdt.c              | 11 ++++++-----

Acked-by: Rob Herring <robh@kernel.org> # DT bits

>  4 files changed, 57 insertions(+), 11 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
