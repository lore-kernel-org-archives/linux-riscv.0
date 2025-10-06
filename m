Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25063CAC5B8
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Oct 2025 12:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ezuo4M2qoQh4DPPLt8cfd/pfP5z3sUiLvUEl+SCBgRg=; b=Y4P7q/2SysvvBc
	2Hinygko312IqDLqty4oYdR4L+NqrogCivsWUqY6Od6soZNehySe8NlPt/IlW9OwdJkpv+s++yZAZ
	qVPVkUz9noWOh4rw1uSQk76MCOMwfNYY93MmIdGNEZqPmQxahu1hToZn5FmU8R5QwIZLVXMV1otYY
	hxnlsVZX8ojPtXIao/a8SpH7QuQoTyo+Rnp/bmNShUu2lc3Q6+qIbDR5/k5sf6EKBtovgSfG+PSAl
	Ao60PZxXOOlecQbzDe9k9pIHeCXHxmvTI/HYeeVRwMal2ca4GE4lkn6i6ihKfUYaDo4wV7ZrLAxR+
	AClEUCivmfoYKHWpjeYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5kWg-00000000241-3L7J;
	Mon, 06 Oct 2025 12:41:14 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5kWe-0000000023f-1lVu
	for linux-riscv@lists.infradead.org;
	Mon, 06 Oct 2025 12:41:13 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-27c369f8986so48684425ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Oct 2025 05:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759754471; x=1760359271; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1q+VIFZwiIkYLeXafY/FJdneXiBfYWG4ku3gvwDgztM=;
        b=sXa45WUDpdS7V2gUF2ojSzkjodKs8/UzmRXIMhz7vVjaC3p/ka/1ZgOZGgBWKeq71l
         e+uCBVcZE4K0jg3R1WZnulWqPn+3VMS85vQydUrDwt+f4Wx2iV8VNnSjOBvAYZEfoVhf
         Ec7yJQBbMQFum/2SRmPZoFMAgm6W0CaouaQdKDFoCf68bwqjG7x50+Jwd+1HTFNdwssg
         GhJ7RZMj4tRNjki6wdV6C1fRy8uEdum7nSH6drdN8kUHtnQkyHPmebQYmRIZuq5kht57
         Z4yIrxOfq4zfxPULhOBKlKmnbfGlmDSghlEwQFxSq/lLvxhCxUrcNOy62KIMYeBLwbbP
         29ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759754471; x=1760359271;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1q+VIFZwiIkYLeXafY/FJdneXiBfYWG4ku3gvwDgztM=;
        b=NHXSX1+pv9a4/zLS3Em0locTjobNwvcMyu2atn7yrSPYknsrODSb4YRXiD0enhD9CM
         opiQdP6xrTU1jQQOJwrqniw8siQfVPCNfT0YpOd5euQc8779Y1MV6gB7unpo7gxYMDpU
         lKRu8z/tdzkRcr3LUcr2cBRJs0Gmd5Mbk0/sUfok5wTCXnpjSx426A/LT01WI/hqYFUb
         8K0gSIrT80UUW/CusF8C0DTcE5d6ci4rTYYBVeyyLQJhz+H2tgiAbi8Acrky/DWK0JHv
         8k6wSumXmHKFsPNxLPbtxGHzZcwa2uik4uWnyj0xtpNvV39TbjebrxxGlhpXJAwOzBJa
         lznw==
X-Forwarded-Encrypted: i=1; AJvYcCWsNkwNh6lAAeDIVFeH8DcEdemyT3y2QGRKySHAQUT5vtdtzVP1rWfU7p3wmYFW9Zz/YwPB8zvZt3H9IQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRKr1whHDDIF2mI64vWmhpsiAiFTu7VvXKdsfr5ZHq7jWV23ij
	TR5FhWlo1W9v2S3Y8WJjAke+J1/T6e5KMhqfQVs64TwLZrNWWn8y4F0Dog2eXPuvneBWHxdKv/G
	qqjLRP5xfjGaokcHvYt3KhMN/WzYYINq5TCoec0eWRQ==
X-Gm-Gg: ASbGnctQwVYg9WwCD9k5x2MuI6kdb3zuQ115s/9P5/opw8cKCuPxmQZamPjjY/PUIxq
	3/7pNhMzg4ih0r/Kcr0b63KvB51Nk8nM/k8xKSe4L2CQIbyrWAQo+eUUeRuxtyiWKBR/D3sgIev
	Elgi8ZJZ+X5QyczpcYYUKyKZ2x5C5wQPqXeWjmIOzZg+8bKxOtFw+XywKemjYBxsa97zBAgaAEf
	B6LgwDejrWOIlSgGobXdo9hrlyVF9pFAWR0e8W481CrF5Hd4kfnWxiZBlE0qsXD/xrlLUmI6BHp
	OCSJP2zkmRsIV83yHpFFBDKD
X-Google-Smtp-Source: AGHT+IGsLKBTasVAqEZ4v4KXBEfDfTM9A9ENdzksSzZ7BVLlJItKpXfKx4hZJPWcb6hfrOA5/IrXwYs5mVLZOS99Jts=
X-Received: by 2002:a17:903:238a:b0:28e:873d:91 with SMTP id
 d9443c01a7336-28e9a6563f0mr137927955ad.29.1759754471396; Mon, 06 Oct 2025
 05:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250918-mmp-pdma-simplify-dma-addressing-v1-1-5c2be2b85696@riscstar.com>
In-Reply-To: <20250918-mmp-pdma-simplify-dma-addressing-v1-1-5c2be2b85696@riscstar.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 6 Oct 2025 18:11:00 +0530
X-Gm-Features: AS18NWASLNw80j6ptJPPHIfrc8HYOqH-1LzEniT9J7aBBeWXoMD5tLZ1N6aS2Wg
Message-ID: <CA+G9fYsTz6WTetGeWn=NX0fyX_j6qRR9XA_ETmJiYWDfCwyHWg@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: mmp_pdma: fix DMA mask handling
To: Guodong Xu <guodong@riscstar.com>
Cc: Vinod Koul <vkoul@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Yixun Lan <dlan@gentoo.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, elder@riscstar.com, 
	Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_054112_628160_EE8BCF15 
X-CRM114-Status: GOOD (  14.89  )
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

On Thu, 18 Sept 2025 at 19:57, Guodong Xu <guodong@riscstar.com> wrote:
>
> The driver's existing logic for setting the DMA mask for "marvell,pdma-1.0"
> was flawed. It incorrectly relied on pdev->dev->coherent_dma_mask instead
> of declaring the hardware's fixed addressing capability. A cleaner and
> more correct approach is to define the mask directly based on the hardware
> limitations.
>
> The MMP/PXA PDMA controller is a 32-bit DMA engine. This is supported by
> datasheets and various dtsi files for PXA25x, PXA27x, PXA3xx, and MMP2,
> all of which are 32-bit systems.
>
> This patch simplifies the driver's logic by replacing the 'u64 dma_mask'
> field with a simpler 'u32 dma_width' to store the addressing capability
> in bits. The complex if/else block in probe() is then replaced with a
> single, clear call to dma_set_mask_and_coherent(). This sets a fixed
> 32-bit DMA mask for "marvell,pdma-1.0" and a 64-bit mask for
> "spacemit,k1-pdma," matching each device's hardware capabilities.
>
> Finally, this change also works around a specific build error encountered
> with clang-20 on x86_64 allyesconfig. The shift-count-overflow error is
> caused by a known clang compiler issue where the DMA_BIT_MASK(n) macro's
> ternary operator is not correctly evaluated in static initializers. By
> moving the macro's evaluation into the probe() function, the driver avoids
> this compiler bug.
>
> Fixes: 5cfe585d8624 ("dmaengine: mmp_pdma: Add SpacemiT K1 PDMA support with 64-bit addressing")
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Closes: https://lore.kernel.org/lkml/CA+G9fYsPcMfW-e_0_TRqu4cnwqOqYF3aJOeKUYk6Z4qRStdFvg@mail.gmail.com
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

Patch applied on top of Linux next-20251003 tag and build test pass.

Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

- Naresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
