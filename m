Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6135FCAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 20:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J31GuwYFQgRFr0AkjDnTt2oNntThsG54Kl761n0srRs=; b=hC8k+Fjcm1qSA8
	gPaxwZ+o3I0eV3uND2TnNEtbqxNwB+45XxZW6GCuf8TNQd6QjwCudNomgOBgC1NbJex5TJdGQkEw6
	z+BEJRuaa0eoUJKondYhz1Zuk8s1AxUTI2d9kvZvjlS+R5u+JLdJOmTd8Uv86Y4+fvcYP/jbhoqTN
	IrlfJL8LzOuRHfT+MtOsYscn/YlBwk78k0zF+0qBmvTqU0mebWGIvga6YLuZ/Wo8vGWhwoGJzNUeo
	1wzimXOY6LI/FdSEpJU/mm5c1tnHHBDd/fXAEmdyMNC3KqDXBSmEdkr5oJzmZcXr4YdGF+GMl/VWf
	TcmuxhnoCg/Mu+6W8FYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nZx-0000000BVFH-262A;
	Mon, 22 Sep 2025 20:56:09 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nZv-0000000BVDT-0VnF
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 20:56:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=jTITD6AqcMH7I4efM2QUzxpq1SEchTC2JyIB8KNcP3s=; b=zTFazuRagiSCFpA7BjEy+F9z+7
	xorCtoro1E1Qowdv2szUU75S01WCI8Ui9TdwXR1+0vMlXgJsaqeNgJ6pYn0jVTHt3VQFHCMAWtsy9
	VFkNTqiM37jjzMTx/t4vIfp0sNDt0p7vc4D127wgpV8mo5vLG7/f3gAeBRA+ijqS4wJ+zdbnAiHCv
	3izLhwuKH2XuIaWNo+scyvq8DP/ExzgTqJtnZRG+8uISfoowz22bLj86Ssyp4AVH18S6Yurg7gcHL
	Cw73IF9hH0UVO4AsYZ4YZ3AuV1YQSXyTjLcthQqiOcqEdOauWsduGBfEZ47A/3MJ5Z8kaLjHP2YrS
	Ztkp7ztg==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v0nZo-00AlVU-25;
	Mon, 22 Sep 2025 22:56:00 +0200
Date: Mon, 22 Sep 2025 22:56:00 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 3/6] i2c: spacemit: disable SDA glitch fix to avoid
 restart delay
Message-ID: <aNG34K6V-sFhX-g1@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
 <20250827-k1-i2c-atomic-v1-3-e59bea02d680@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250827-k1-i2c-atomic-v1-3-e59bea02d680@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_135607_159350_24B460C7 
X-CRM114-Status: GOOD (  21.89  )
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

On 2025-08-27 15:39, Troy Mitchell wrote:
> The K1 I2C controller has an SDA glitch fix that introduces a small
> delay on restart signals. While this feature can suppress glitches
> on SDA when SCL = 0, it also delays the restart signal, which may
> cause unexpected behavior in some transfers.
> 
> The glitch itself does not affect normal I2C operation, because
> the I2C specification allows SDA to change while SCL is low.
> 
> To ensure correct transmission for every message, we disable the
> SDA glitch fix by setting the RCR.SDA_GLITCH_NOFIX bit during
> initialization.
> 
> This guarantees that restarts are issued promptly without
> unintended delays.
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index d342752030d077953adf84a2886211de96e843c4..c1656b78f1681729ccc2ebca6e290259d14889d9 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -14,6 +14,7 @@
>  #define SPACEMIT_ICR		 0x0		/* Control register */
>  #define SPACEMIT_ISR		 0x4		/* Status register */
>  #define SPACEMIT_IDBR		 0xc		/* Data buffer register */
> +#define SPACEMIT_IRCR		 0x18		/* Reset cycle counter */
>  #define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */
>  
>  /* SPACEMIT_ICR register fields */
> @@ -76,6 +77,8 @@
>  					SPACEMIT_SR_GCAD | SPACEMIT_SR_IRF | SPACEMIT_SR_ITE | \
>  					SPACEMIT_SR_ALD)
>  
> +#define SPACEMIT_RCR_SDA_GLITCH_NOFIX		BIT(7)		/* bypass the SDA glitch fix */
> +

The datasheet seems to use FIX_BYPASS instead of NOFIX, but maybe you 
have chosen the later because it's shorter.

>  /* SPACEMIT_IBMR register fields */
>  #define SPACEMIT_BMR_SDA         BIT(0)		/* SDA line level */
>  #define SPACEMIT_BMR_SCL         BIT(1)		/* SCL line level */
> @@ -237,6 +240,14 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>  	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
>  
>  	writel(val, i2c->base + SPACEMIT_ICR);
> +
> +	/*
> +	 * The glitch fix in the K1 I2C controller introduces a delay
> +	 * on restart signals, so we disable the fix here.
> +	 */
> +	val = readl(i2c->base + SPACEMIT_IRCR);
> +	val |= SPACEMIT_RCR_SDA_GLITCH_NOFIX;
> +	writel(val, i2c->base + SPACEMIT_IRCR);
>  }
>  
>  static inline void

I trust you on the waveform captures, with that:

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
