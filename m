Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F75ACA0EED
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 01:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JoXz3ip2FmDYWPjgm/qQIhR7bRhW8gx230/h/FrQzss=; b=X13jhdtvJ8wyDn
	DBZZKC2k2ZH/MoDcPiQgJGjAzIXdQ3rbkmAyqCocJlvPtOGmKgIGcyqKP4fxeXU57limh8IM0QsVd
	dCdmGJ1QnT7Vn3/WRRpNQ2SYvXWo9Ytr3ink2LxvY3AlWyLH00S824H2/E1Lt42l/0vn46IUZ2X/V
	DTtjxeLz7P6wpvFjpahxdBcNB1WhWBOPe+l8PIWCzoVOY4gqUs4Vlx8kIpn41TjAQmE3d3VXoISQd
	HOVntA/z4wXKSpN5b7awE6iRIM70Jbf8pqYQfaGw/8wUkQUJrPg1Y1hUqfknXkk1aDe5gJKdKTkDN
	DeCJm0IbFS73wWc0Gk8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uotjQ-0000000FN6c-0jG9;
	Thu, 21 Aug 2025 01:04:44 +0000
Received: from mail-43171.protonmail.ch ([185.70.43.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopUn-0000000EqJ5-1lGn
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 20:33:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
	s=protonmail3; t=1755721995; x=1755981195;
	bh=t7NXEEuVH/wrVVp48tGTzSJA0b9aGiHDJRGZakt3E5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FMcI4mfXJHsguwdIMwtmxDEsuImO9BKJY1sTBvFWRZA8yZrY6Kgbq0nhIkluiecMy
	 BkPqodDUdDqZ6Mh1og6ovUQ2SjBhcshD01eYmtcwRiUhZrRCpgb2t9pky3woeyUVTh
	 6CeHQXAEjtIVgllaM1rRFlCJzbFtCVIBERIyal/YhR0p1XXN4tTmaWJ0qmuD6tP6Ua
	 uW82YfbpsCWg2ppoMyavvHRP/mcs91bzWD8g3dW3qg04pIuNK1Aed5mkrA1EqK3HXA
	 AkhrgcQ81t2xssUOH+6aNVboWNRk26I4rJw0/QDdFpJDfBYOpch1cSSvZqbnklLw24
	 S64ApfpVDUw0w==
X-Pm-Submission-Id: 4c6dST1yHnz2ScP7
Date: Wed, 20 Aug 2025 20:30:57 +0000
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
Subject: Re: [PATCH v14 1/7] pwm: Export `pwmchip_release` for external use
Message-ID: <aKYwgQBt62PyCEd9@archiso>
References: <20250820-rust-next-pwm-working-fan-for-sending-v14-0-df2191621429@samsung.com>
 <CGME20250820083541eucas1p2ad7d78418576b8bc8cbddd8efe83bbe9@eucas1p2.samsung.com>
 <20250820-rust-next-pwm-working-fan-for-sending-v14-1-df2191621429@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250820-rust-next-pwm-working-fan-for-sending-v14-1-df2191621429@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_133322_089324_6A416F47 
X-CRM114-Status: GOOD (  17.93  )
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

On Wed, Aug 20, 2025 at 10:35:36AM +0200, Michal Wilczynski wrote:
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

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
