Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D44CA5FA1
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 10:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZF7JIu/D30Z5uBddPjIKW8p4Biz3JxkjqO2oCKyg6Q4=; b=wIjLsyGKXddTY1
	HxZxDDvXaERr0qUk7K689pZ2nO0UnykK6SSEDMEKhpZDie7WNYcOYNfwdDsoPxi9f3Mlz9Fu1qScR
	4Zs+n+Ug9DZmpkzBzCBf5x+FrzQxDBLITxgaeCLf4uLliVvv57UAzhTlXyarrXWcE8DJ0lNwNlCOl
	yVPSa0NKedApUF+Cw5oOpkGKo6gm34gG7mj0LhXGHUoBAL3/MsjBySHBQIf/RHSmaPTEfOL4AERlC
	7ysOIVNekqDCzLm9RwzfUok7zOW+SX1TOxqRxQF3iTBuKW4MI7CnF8v9ZjwkfCGyzDuGSiQhplB/s
	iTEWyAi+akuwOnbcJKPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBV11-000000039Hg-3S8O;
	Tue, 29 Sep 2026 10:24:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBV10-000000039HS-2dYV
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 10:24:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C815860008;
	Tue, 29 Sep 2026 10:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A762E1F000FF;
	Tue, 29 Sep 2026 10:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790677489;
	bh=/rVf2O0JTYEDoiN4Nj8RRj7N07I8m7kIhRk3ZpRZQ1U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=O0q+RSs6UKkSaApvmLoshdgcx5DZay6ngjqP9DtodZsZz3fvpCyRHGbrY/J5TnOSP
	 pyVub8gEh+3jOm5HLVlm9vNt4KGPJJ8scJIn09zV5ERklhiOLAVGMY22yY+uSwWsf/
	 Tw2eWKEzHzM+W9g1YA009r7d5d1vh59sUPsvBFVh632pNKdarRUyZJfQkkM+Bca0NM
	 Da1ByzSwJqKKdsBG0ns7+WMA62WH1k7sZP+dcGPPBHqhEUXq7KwUKN1wtd8JIf6mNr
	 9EW6xtjWHsoTbhGhSXbwG6u4X7u5dhz3dkE01tYCiG7vZbtTYkaEkOAAPdhTTzYvT1
	 50hMxzRWlYL8g==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, ojeda@kernel.org,
 fustini@kernel.org, guoren@kernel.org, wefu@redhat.com
Cc: acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 gary@garyguo.net, lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu,
 work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 linux-riscv@lists.infradead.org, FUJITA Tomonori
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1] pwm: th1520: Fix 32-bit build with COMPILE_TEST
In-Reply-To: <20260929095612.1072417-1-tomo@flapping.org>
References: <8Hw8rFOzHELmQvD7ZIatk1FJqh39-AbzNppa9asPFp0Cp9gFzcQ7zs_34jnuQGt5ukgNPqz0yxdaIyT2SHtACA==@protonmail.internalid>
 <20260929095612.1072417-1-tomo@flapping.org>
Date: Tue, 29 Sep 2026 12:24:38 +0200
Message-ID: <875wzotkwp.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
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

"FUJITA Tomonori" <tomo@flapping.org> writes:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Fix the following build error on 32-bit ARM with COMPILE_TEST:
>
>   ERROR: modpost: drivers/pwm/pwm_th1520.ko: symbol '__aeabi_uldivmod' undefined!
>
> The driver divides u64 values when it converts between nanoseconds and
> clock cycles. On 32-bit ARM, these divisions are compiled to calls to
> __aeabi_uldivmod, which the kernel does not provide.
>
> he TH1520 is a 64-bit RISC-V SoC, so the driver is only used on
> 64-bit kernels. There is no point in compile testing it on 32-bit.
> Limit COMPILE_TEST to 64BIT instead of changing the arithmetic to use
> the div64 helpers.
>
> Fixes: 3c180003dffb ("pwm: th1520: Fix missing Kconfig dependencies")
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Best regards,
Andreas Hindborg



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
