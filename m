Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A620C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 11:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PCvmmhDf3OzxfF5W+2+s1pUcv3GpzQ2xvBaoT9N5ElI=; b=MN1tenY6mdLCUR
	WKjem4E6OCuCcYqU3ATNV9mWtdTIP0uvI3DVM/PNzYgvhnTP4dLfEeEubfJVn9l/EYKHLTxHBji8u
	XBEbquE3QPF1EInSju7eLEb8Y2oKA7bjG2Uwm7O5InuOqHCK8XB1tcjl7DnJOI2fpB7WPiGHgcFDx
	xcXJZ9deuhhJjdgZsLfv/F4QW9zI82Bo5x4B2495iO1BUWWaO5jzHgWathu63juIRdXx5tSUle2vC
	XvcVNopEhZvOpm5nSJ+O0yl6yG2nQDm0ni5qeSBFAuQFOjNC2iBLQD+wAAqwV72jmXsTO16B4xkfL
	ygnZVeiBVrLeS5xNCarA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKIlE-006nhr-2w; Wed, 16 Feb 2022 11:46:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKIlB-006ngw-Bi
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 11:46:14 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nKIl4-00076X-4g; Wed, 16 Feb 2022 12:46:06 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 5/6] RISC-V: Do no continue isa string parsing without
 correct XLEN
Date: Wed, 16 Feb 2022 12:46:05 +0100
Message-ID: <3202369.D2aLoNIhS8@diego>
In-Reply-To: <20220216002911.1219593-6-atishp@rivosinc.com>
References: <20220216002911.1219593-1-atishp@rivosinc.com>
 <20220216002911.1219593-6-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_034613_442437_32B3007B 
X-CRM114-Status: GOOD (  19.83  )
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

Am Mittwoch, 16. Februar 2022, 01:29:10 CET schrieb Atish Patra:
> The isa string should begin with either rv64 or rv32. Otherwise, it is
> an incorrect isa string. Currently, the string parsing continues even if
> it doesnot begin with current XLEN.
> 
> Fix this by checking if it found "rv64" or "rv32" in the beginning.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 59c70c104256..cb9c9e0aab31 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -84,6 +84,7 @@ void __init riscv_fill_hwcap(void)
>  	for_each_of_cpu_node(node) {
>  		unsigned long this_hwcap = 0;
>  		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
> +		const char *temp;
>  
>  		if (riscv_of_processor_hartid(node) < 0)
>  			continue;
> @@ -93,6 +94,7 @@ void __init riscv_fill_hwcap(void)
>  			continue;
>  		}
>  
> +		temp = isa;
>  #if IS_ENABLED(CONFIG_32BIT)
>  		if (!strncmp(isa, "rv32", 4))
>  			isa += 4;
> @@ -100,6 +102,9 @@ void __init riscv_fill_hwcap(void)
>  		if (!strncmp(isa, "rv64", 4))
>  			isa += 4;
>  #endif
> +		/* The riscv,isa DT property must start with rv64 or rv32 */
> +		if (temp == isa)
> +			continue;

hmm, should (and can) this create some warning about the ignored
malformed ISA string?

Otherwise
Tested-by: Heiko Stuebner <heiko@sntech.de>

>  		bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
>  		for (; *isa; ++isa) {
>  			const char *ext = isa++;
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
