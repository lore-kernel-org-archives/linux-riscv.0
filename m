Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE3EC43458
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2026 20:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Mime-Version:To:
	From:Subject:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+v8nLqI8TL4U16lzFKqDSb7Ll9qRV1N8Gn0IaP1GlSU=; b=rzHeW5QQ0uxQVV
	x/ITZVFftBmZNidRdOG+3Qo7GF4/X5AMkHSZR3XiAcAJ5CPiA2OyMuxNceVn5xWe16pH12kL1VQv2
	eGDTFF8jEqdJpdW4mc/XnIDebifUhxO1i9DhYsS6OjTv+z1TKxWDinM/IlBOMQN7DMsdxcGu8cjzp
	7F2AlkbS+0As2/ztY/T8raJK+tGDh7yjVG5sdNmNYTuQdFuOhcf403Z1CTcuo/UF7yYyTzJ5Pmsm3
	LvKEEYkp86FtBKoGDNHkW8ERsbkD4hy9WSfkY+NsT7GBQsx50raIu39BG79NWIR7ClWTmbzc+3pQr
	pZMYiL/wRyDNCvIdWSBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdvuW-0000000DMNj-0qCf;
	Sun, 28 Jun 2026 20:15:24 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdvuT-0000000DMNO-44Z3
	for linux-riscv@lists.infradead.org;
	Sun, 28 Jun 2026 20:15:23 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gpLHj4Yd2z9tG4;
	Sun, 28 Jun 2026 22:15:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782677713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R/88b3Etn343+GIDtpFPjDNRJuj4pU0CEfjCs57vTBs=;
	b=Ual3UC4Js0TCa/WK4fHeOAYPBx+3AzL6AtrRcYPBb+6XjddRjnDz2dHARDHaa0A8usrgWq
	UlqkzZkfaT9Te/6iu3TyoDuJ36VK1RC4wu0Mii4rV7OqJGe3cxda+cihess5EnOfaqwnPa
	S4N6nfD2wjX5Isca7xkkldkvCkVNqK+V6ST8PTIr3w++mV8OOARDHQ/Cu0+SkWC9xVJu71
	N40tErCU/7FLeY28rPFgBMeDz3iTcf7juQFZIc2+KIp5vRfT8d9GUAmedu71E7WD/UyzaU
	vxfNE4OxjVD7uIpe9z42f9ukFQ+ksqoP5rfmnrP+Dn81cLo43+AfIE0V6Pti/g==
Date: Sun, 28 Jun 2026 22:15:02 +0200
Message-Id: <DJKYI6S4MUVP.3RZTF8FDRILYV@mailbox.org>
Cc: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-riscv@lists.infradead.org>,
 <linux-pwm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Boris Brezillon"
 <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 1/3] rust: clk: use the type-state pattern
From: "Maurice" <mhi@mailbox.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Drew
 Fustini" <fustini@kernel.org>, "Guo Ren" <guoren@kernel.org>, "Fu Wei"
 <wefu@redhat.com>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Michal Wilczynski" <m.wilczynski@samsung.com>, "Brian Masney"
 <bmasney@redhat.com>, "Boqun Feng" <boqun@kernel.org>
Mime-Version: 1.0
References: <20260618-clk-type-state-v4-0-8be082786080@collabora.com>
 <20260618-clk-type-state-v4-1-8be082786080@collabora.com>
In-Reply-To: <20260618-clk-type-state-v4-1-8be082786080@collabora.com>
X-MBO-RS-META: 3u353mzh5e8kn59xdxsaheg4i3j17fjp
X-MBO-RS-ID: ebde9567693c9bedc44
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_131522_182502_DB437D62 
X-CRM114-Status: UNSURE (   6.36  )
X-CRM114-Notice: Please train this message.
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

On Thu Jun 18, 2026 at 5:46 AM CEST, Daniel Almeida wrote:

> +        /// Behaves the same as [`Self::get`], except when there is no clock
> +        /// producer. In this case, instead of returning [`ENOENT`], it returns
> +        /// a dummy [`Clk`].
> +        #[inline]
> +        pub fn get_optional(dev: &Device<Bound>, name: Option<&CStr>) -> Result<Clk<Prepared>> {
> +            Clk::<Unprepared>::get_optional(dev, name)?
> +                .prepare()
> +                .map_err(|error| error.error)
> +        }
> +
> +        /// Attempts to convert the [`Clk`] to an [`Unprepared`] state.
>          ///
> -        /// [`clk_disable`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_disable
> +        /// Equivalent to the kernel's [`clk_unprepare`] API.
Missing definition of `clk_unprepare`.

Best,

Maurice

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
