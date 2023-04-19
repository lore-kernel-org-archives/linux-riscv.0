Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2A2C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 14:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=MUSjTlH259eL/MXcjOW5jyIacESSHgnNU108jNWCL6w=; b=qoy+opnw6vIDjHF0R/h7wA07iG
	u4V91C9O4W+NYaUsBrbII+4ixQuZN2eO6SWLv/EawO6MHMkZ5ZYxzQjY6dw0KgkxbqIA5AFudztkY
	T+PrOBnNQ8l8pSWadZQXi8edyKv2UBLTdkK1tfz+wrUtNA/Wakl96zBtLquo/fZ6ncaRB2n2oF3oB
	ZeIDcFcJUlUqaU4RK7X+oXOfJ2nEZ3IOgRTkromKgyN+ALA1z5UUDDS6t1nrncBj+ih4hpAjmRy4j
	psV1AP37n5MDS2LgSLw0VGAcJFOpGGZ4/24vv4/IXqegEosD3G+ZXMuuy4HFM0Z8ZVQPZurC06c/q
	+p2VzpLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8hz-005e3M-2a;
	Wed, 19 Apr 2023 14:22:55 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8hw-005dza-3A
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 14:22:54 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-63d2ba63dddso1793933b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 07:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1681914172; x=1684506172;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvT99d3vu2s9u2HdXHuOsCskK0/5VChFq+aBcaoQwKM=;
        b=eJ51Lyhme8n3XB+0k6fcBFov9PY8/EUmTR8+nuSaGr7xBsijqIoLjwhsLzVxYH/nx0
         wauVowtfzqnaLMg0Md06tjLXI3lWkSGzsXedNOsMpQwkDCNvEtBTyQ19M/Yyo6D06BSV
         XNjXn0CGdLZl3nFWqDjNax+yB6CXLq01SwKNwyDS36uGnLYxQFXzNQuK/+7hScqPlZwX
         z+agJw/VCIGMUixwVDzm2XMnLSn8GR3DsnMXY+jrQCfbr9O1Le1uXDKTi2rYkt7oJ2Ce
         tyNNGrxSj0L54sdbIeiSTDtndMc3YiWnjyxMJLeRw/TsNRHsyFeDM9KNzzDNKUVPs4Et
         pKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681914172; x=1684506172;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvT99d3vu2s9u2HdXHuOsCskK0/5VChFq+aBcaoQwKM=;
        b=MPoLtoSwJqfDPtQnp8gy6av23hj9Zui1UIiabbtp1Gofkhr+X5fINaXlkSexBlGnG7
         +QWDJ1BPNe64UNXDIEDcrTvky67cps1eVZmWtrq6EhxR7bigj4eLolGlaM0YrWULVmgt
         QJgWAF3jREIC0QXP+zDpRs92hDd/g/l2z/CYAnPl5Cnr9SuH4uAtW7ZMt2EwClgw283J
         Gpci3B4eJy1+XvEeTcUJzfpJR/tcUDp7iZIpFIFnzG0ofaUygHIiCI7MRnH3zblFk+YW
         H8jjWGUwe28GvprT2Hmz2nNZ87cce9T/ikUJr/qkRpBrQSH5bXRA3uFcCNIN+ze6EpEJ
         yzDQ==
X-Gm-Message-State: AAQBX9fSBM+YVHl75iLYrWeGPjWQ+apa8bUI83SAtGNdhrvOR39Gjjhi
	r7cih+Cnh1DfSque6S0pMNOvPA==
X-Google-Smtp-Source: AKy350YgrN7zbaEKFT5DU1qrct74Wsi9a0WokbCy4dVCW0VXg9H7v3lPwT87yJxbljWHRWpRpF5B0Q==
X-Received: by 2002:a05:6a00:130a:b0:63b:859f:f094 with SMTP id j10-20020a056a00130a00b0063b859ff094mr4002975pfu.20.1681914171995;
        Wed, 19 Apr 2023 07:22:51 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id d2-20020a63d642000000b005140ce70582sm10431557pgj.44.2023.04.19.07.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 07:22:51 -0700 (PDT)
Date: Wed, 19 Apr 2023 07:22:51 -0700 (PDT)
X-Google-Original-Date: Wed, 19 Apr 2023 07:22:44 PDT (-0700)
Subject: Re: [PATCH 09/21] riscv: dma-mapping: skip invalidation before bidirectional DMA
In-Reply-To: <20230327121317.4081816-10-arnd@kernel.org>
CC: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, vgupta@kernel.org,
  linux@armlinux.org.uk, neil.armstrong@linaro.org, linus.walleij@linaro.org,
  Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, guoren@kernel.org, bcain@quicinc.com,
  geert@linux-m68k.org, monstr@monstr.eu, tsbogend@alpha.franken.de, dinguyen@kernel.org,
  shorne@gmail.com, deller@gmx.de, mpe@ellerman.id.au, christophe.leroy@csgroup.eu,
  Paul Walmsley <paul.walmsley@sifive.com>, dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net,
  jcmvbkbc@gmail.com, Christoph Hellwig <hch@lst.de>, robin.murphy@arm.com,
  prabhakar.mahadev-lad.rj@bp.renesas.com, Conor Dooley <conor.dooley@microchip.com>, linux-snps-arc@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io, linux-csky@vger.kernel.org,
  linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
  linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
  linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
  linux-xtensa@linux-xtensa.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: arnd@kernel.org
Message-ID: <mhng-7529cf5a-4397-456f-b610-faa619d4faca@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_072253_020109_46E2AFBA 
X-CRM114-Status: GOOD (  19.66  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 27 Mar 2023 05:13:05 PDT (-0700), arnd@kernel.org wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> For a DMA_BIDIRECTIONAL transfer, the caches have to be cleaned
> first to let the device see data written by the CPU, and invalidated
> after the transfer to let the CPU see data written by the device.
>
> riscv also invalidates the caches before the transfer, which does
> not appear to serve any purpose.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/riscv/mm/dma-noncoherent.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index 640f4c496d26..69c80b2155a1 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -25,7 +25,7 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>  		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
>  		break;
>  	case DMA_BIDIRECTIONAL:
> -		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
>  		break;
>  	default:
>  		break;

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
