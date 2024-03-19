Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8ABECD11C2
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 15:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJi3MipM+bz+4LGpguTr1k/ipqLw+PYUB8N/fCVIVMg=; b=1LqIZGuqGEffew
	uMzHDKAI91UG5ck6mKarARlXWZLVkffHaUMzVUXIx/9uqFLqEedg8t2f4Ddu/RzPXZ54b9OGlgAFN
	YH9uiqZTiADHhSRpRZSTmKe3lCXGCOpGuF3+o25G/6jQtfikhoJezWlVRM1KEEKjWGhsEnGQJiJHi
	COSm/uq0pjKgk2kmeKaDIKynYgezre7WyPNNzgsKhrcCN2wTw5MMVqg8821J79USBxqYVjR48WqJe
	0JBWaMSJacHEhQ77YaYTaoHEIXvWi9rMplmNwZnTZpPt1xwaK6M7FuDyZzec7DMY6gPzhwSmTKAAX
	Ek97Ot5naKXdVzxeRAGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmbpC-0000000DFJK-2dPz;
	Tue, 19 Mar 2024 15:56:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmbp9-0000000DFII-21wh;
	Tue, 19 Mar 2024 15:56:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9641E60F13;
	Tue, 19 Mar 2024 15:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A3ADC433C7;
	Tue, 19 Mar 2024 15:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710863782;
	bh=txdGx+DK7znFHGf/0tjjerKq64zYiimbR1qcsYKXEwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lfZms95528UbY5tS+DZlHXPvGdfzpILgEyRdEPXRU5/FevqAaYzJl8l/uYMo4T/5g
	 G0KyQQL1bDZ+4bh8Z2JpuF/vI2koqKVWwjHxmAAKVy1CXZGfnqxhj9vxhcyHNify9p
	 6Hssk2wpYQDvFdCUEoWvFulZMmMqWZKThqWCh/zrXHvbfWOIWk2Ra2Qk7Dx8CvPKAv
	 3IMLgBimgp08RRx/QskyZowU2DD05VdT+48IKH/xLbqpjBdhdIfUadK786BPq7ufGS
	 cnhAkC4Re/eeuHZ1CNF8nhxVApf/051Ax2LlqJjwZTl4ZLb9+SijLBMaboTC68D/uC
	 6Xibd+2/5wFSA==
Date: Tue, 19 Mar 2024 15:56:16 +0000
From: Will Deacon <will@kernel.org>
To: Conor Dooley <conor@kernel.org>, catalin.marinas@arm.com
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] perf: starfive: fix 64-bit only COMPILE_TEST condition
Message-ID: <20240319155616.GC2901@willie-the-truck>
References: <20240318-emphatic-rally-f177a4fe1bdc@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240318-emphatic-rally-f177a4fe1bdc@spud>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_085623_601275_5976B3B5 
X-CRM114-Status: GOOD (  19.75  )
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

On Mon, Mar 18, 2024 at 03:35:04PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> ARCH_STARFIVE is not restricted to 64-bit platforms, so while Will's
> addition of a 64-bit only condition satisfied the build robots doing
> COMPILE_TEST builds, Palmer ran into the same problems with writeq()
> being undefined during regular rv32 builds.
> 
> Promote the dependency on 64-bit to its own `depends on` so that the
> driver can never be included in 32-bit builds.
> 
> Reported-by: Palmer Dabbelt <palmer@rivosinc.com>
> Fixes: c2b24812f7bc ("perf: starfive: Add StarLink PMU support")
> Fixes: f0dbc6d0de38 ("perf: starfive: Only allow COMPILE_TEST for 64-bit architectures")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Will Deacon <will@kernel.org>
> CC: Mark Rutland <mark.rutland@arm.com>
> CC: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> CC: linux-arm-kernel@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> ---
>  drivers/perf/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
> index 5060e1f1ea10..7526a9e714fa 100644
> --- a/drivers/perf/Kconfig
> +++ b/drivers/perf/Kconfig
> @@ -87,7 +87,8 @@ config RISCV_PMU_SBI
>  	  filtering, counter configuration.
>  
>  config STARFIVE_STARLINK_PMU
> -	depends on ARCH_STARFIVE || (COMPILE_TEST && 64BIT)
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	depends on 64BIT
>  	bool "StarFive StarLink PMU"
>  	help
>  	   Provide support for StarLink Performance Monitor Unit.
> -- 
> 2.43.0


Thanks guys, I don't know what a starfive is so sorry for not spotting
this when I noticed the build failure on arm64.

Acked-by: Will Deacon <will@kernel.org>

Catalin -- please can you pick this into the arm64 fixes branch for -rc1?

Cheers,

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
