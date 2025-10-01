Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C838CAC5BB
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 20:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Mime-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q0CFH9Uv4AeNmAU9ZwJhfxQMgArQNRDbhbj8jOzKPgc=; b=JuoJiZY+ATMyqs
	05pShbmchuuq9E6FNea5kZyztrBoVQBGjId/dYb0bt5Qt9o3VvDkDpEy+iziJ+KsDlLzEEQ1g4Z8P
	eFOX2cnme7lLhDAz7NQstNRt+Nn61vUQQocbPuhw4q1HA1YKO3QnNaVJm1FTaM7suogu/mSFQR26e
	S8k9u22cIp+2PbHs3Rhrjq5o6ZfLOzj1YDFPfLT/DPduyPKNPpFEXuVEGMAyRjM5T217bdxMHPJrp
	vSAWCheBnrRh9+WRJH0dNG3jq0Cfx5+xHzt5mLgsQyV6N0eheQ3+zwCFcHAI7Rbd6I8lJ3SmVkRzo
	FDrPQWmfhs8Ka9i8EWfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43nL-00000008wWD-3CE1;
	Wed, 01 Oct 2025 20:51:27 +0000
Received: from mx-out1.startmail.com ([145.131.90.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43nJ-00000008wVO-0s8U
	for linux-riscv@lists.infradead.org;
	Wed, 01 Oct 2025 20:51:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
	s=startmail1; t=1759351881;
	bh=QbcGgb5EQSRVJLoUkXO4xyhEsG9J13OKh/OXOofe7G8=;
	h=Date:From:To:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To:From:Subject:To:Date:
	 Sender:Content-Type:Content-Transfer-Encoding:Content-Disposition:
	 Mime-Version:Reply-To:In-Reply-To:References:Message-Id:
	 List-Unsubscribe:List-Unsubscribe-Post:Autocrypt;
	b=ImUQ+auCIzrbzgelzjZy/hT/6tYbxImGUQmh64wCOdKDUl20Co1kP7cTJ9lhFDrbR
	 qQ4QZlSxRPKLJxwjRAbiuePe78ERBtTjj3yUHwpj56F9g4Lcw7rD1f4TPANFVG6jzA
	 F8rvWj2+w96g7boCQZFbxZUGtuIibAjiT8peB42+PcniofccflsEr6bINEsaBUNBqe
	 +VCQyDAPoOkVF6bO0L4BKQEtA7NcZZXU1+GXhmBxJrgTAIP/l2WYOWAw2drtpyeLBx
	 ZsINN8ZnA3JZrn9ueU0l92T0EVFjY1yF5FNaIT+VMSk6FtfjKRBYPfKM8y5CggJ8Dg
	 fI1MewDrYAc9w==
Date: Wed, 1 Oct 2025 20:51:16 +0000
From: Elle Rhumsaa <elle@weathered-steel.dev>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Benno Lossin <lossin@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Drew Fustini <fustini@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v15 1/7] pwm: Export `pwmchip_release` for external use
Message-ID: <aN2T-IZKQfqcd7I4@archiso>
References: <20250930-rust-next-pwm-working-fan-for-sending-v15-0-5661c3090877@samsung.com>
 <CGME20250930122730eucas1p11afe23eee92daac1023a826768b1f92d@eucas1p1.samsung.com>
 <20250930-rust-next-pwm-working-fan-for-sending-v15-1-5661c3090877@samsung.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250930-rust-next-pwm-working-fan-for-sending-v15-1-5661c3090877@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_135125_402337_17B2D438 
X-CRM114-Status: GOOD (  18.25  )
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

On Tue, Sep 30, 2025 at 02:20:32PM +0200, Michal Wilczynski wrote:
> The upcoming Rust abstraction layer for the PWM subsystem uses a custom
> `dev->release` handler to safely manage the lifetime of its driver
> data.
> 
> To prevent leaking the memory of the `struct pwm_chip` (allocated by
> `pwmchip_alloc`), this custom handler must also call the original
> `pwmchip_release` function to complete the cleanup.
> 
> Make `pwmchip_release` a global, exported function so that it can be
> called from the Rust FFI bridge. This involves removing the `static`
> keyword, adding a prototype to the public header, and exporting the
> symbol.
> 
> Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/pwm/core.c  | 3 ++-
>  include/linux/pwm.h | 6 ++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> index 0d66376a83ec350e0c3718959f4d794efd71595a..a33da3dff608fdff91251e5fd07b0dbd295be022 100644
> --- a/drivers/pwm/core.c
> +++ b/drivers/pwm/core.c
> @@ -1600,12 +1600,13 @@ void pwmchip_put(struct pwm_chip *chip)
>  }
>  EXPORT_SYMBOL_GPL(pwmchip_put);
>  
> -static void pwmchip_release(struct device *pwmchip_dev)
> +void pwmchip_release(struct device *pwmchip_dev)
>  {
>  	struct pwm_chip *chip = pwmchip_from_dev(pwmchip_dev);
>  
>  	kfree(chip);
>  }
> +EXPORT_SYMBOL_GPL(pwmchip_release);
>  
>  struct pwm_chip *pwmchip_alloc(struct device *parent, unsigned int npwm, size_t sizeof_priv)
>  {
> diff --git a/include/linux/pwm.h b/include/linux/pwm.h
> index 8cafc483db53addf95591d1ac74287532c0fa0ee..d86061024b52172edf3845bf9252a966f120e365 100644
> --- a/include/linux/pwm.h
> +++ b/include/linux/pwm.h
> @@ -485,6 +485,12 @@ int __pwmchip_add(struct pwm_chip *chip, struct module *owner);
>  #define pwmchip_add(chip) __pwmchip_add(chip, THIS_MODULE)
>  void pwmchip_remove(struct pwm_chip *chip);
>  
> +/*
> + * For FFI wrapper use only:
> + * The Rust PWM abstraction needs this to properly free the pwm_chip.
> + */
> +void pwmchip_release(struct device *dev);
> +
>  int __devm_pwmchip_add(struct device *dev, struct pwm_chip *chip, struct module *owner);
>  #define devm_pwmchip_add(dev, chip) __devm_pwmchip_add(dev, chip, THIS_MODULE)
>  
> 
> -- 
> 2.34.1
> 

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
