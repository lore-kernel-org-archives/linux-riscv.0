Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7FCD3ABF4
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 21:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7iCNfJcoSxw1LayK8RHYClmJu3rQ+z0uMRPsePAL+9k=; b=f2ebCGpOUbkd98
	xj/ZqB4qrasLttCfwB8tb3QCTZq24beT9ibU77LbbMOWnQEBad4iRWuEWNHdyY75kkOPrNrjsS2D8
	3QkGbZZKtqWhbyYbNl/8IBmptGxYFTIJbM+ZxAKSkBCuKzJjlL1VxXgoP8uf94JuYoa+EudapHFFq
	o0Iu4uOpMa9f91aIAMbJALBnRCOJ0Sw8rBcUFbpk9MNELSgqZbcIX6toIGJCJQSbMsEBmO6a2cqSj
	UV5rFhSusC89txmN79LMGb2GEx7764c6On7DKive/xfAJyNIQULKToNlYvHzqK6uT3B9unpMEbewn
	7GmqIsmJn96bpe73QwIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcKg-00000001Q4W-3gmk;
	Mon, 11 Nov 2024 21:52:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcKe-00000001Q3i-1pcr
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 21:52:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 51F30A40BBC;
	Mon, 11 Nov 2024 21:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1604C4CECF;
	Mon, 11 Nov 2024 21:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731361943;
	bh=4gGY0BakKCULl1EI2o6BesQyxfC5cfKegCtI7RsK0Xo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s7DI2uWTRzBMis8GWa0zWTWnE0IX4lkODgsn+ZUirM+/6DIJHVSlfaxw/u5LCNXdX
	 yjvtnWzP7pdNBs8E3jy8G7k+ayEd5JI+xOaZ5VcRMsn6uehLPkQ+qRyxVSmVaTtCVj
	 l/umt6fk+5tiOtqSE4Vqq4xMgZ/gDqTEVg1HyiY4sPyfNUMyNv2KbCc7rgZKPSkPsm
	 Li27Q/BLdcO68ZlqBUzcdAiUttWxP66HjIC4/TwkXtHeRTB2pBRQ758ZWVLBC9ug7Q
	 GGlnyYH0T5lItmc/57NEm3n8DUbkuwKvyFVyPlO49jbhjFZtfxN2YXjXM1xXrjNOfZ
	 UrUBXGaVJre9g==
Date: Mon, 11 Nov 2024 15:52:20 -0600
From: Rob Herring <robh@kernel.org>
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	ycliang@andestech.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	peterlin@andestech.com, samuel.holland@sifive.com,
	conor.dooley@microchip.com, alexghiti@rivosinc.com,
	ruanjinjie@huawei.com, takakura@valinux.co.jp, conor+dt@kernel.org,
	jassisinghbrar@gmail.com, krzk+dt@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/4] riscv: export __cpuid_to_hartid_map
Message-ID: <20241111215220.GA1993016-robh@kernel.org>
References: <20241105183513.1358736-1-valentina.fernandezalanis@microchip.com>
 <20241105183513.1358736-3-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241105183513.1358736-3-valentina.fernandezalanis@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_135224_562551_4B98D4B1 
X-CRM114-Status: GOOD (  13.52  )
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

On Tue, Nov 05, 2024 at 06:35:11PM +0000, Valentina Fernandez wrote:
> EXPORT_SYMBOL_GPL() is missing for __cpuid_to_hartid_map array.
> Export this symbol to allow drivers compiled as modules to use
> cpuid_to_hartid_map().
> 
> Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
> ---
>  arch/riscv/kernel/smp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index c180a647a30e..d58b5e751286 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -43,6 +43,7 @@ enum ipi_message_type {
>  unsigned long __cpuid_to_hartid_map[NR_CPUS] __ro_after_init = {
>  	[0 ... NR_CPUS-1] = INVALID_HARTID
>  };
> +EXPORT_SYMBOL_GPL(__cpuid_to_hartid_map);

Why can't riscv implement cpu_logical_map() like other arches?

We really should have a common implementation too, but that's probably 
too much to ask I guess.

Rob


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
