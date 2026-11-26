Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1290D606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 12:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zy5utAe8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mhzb80Ow
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8fwSWK6CF53NbkBYS7il0P3+A547IXupYBNO7B5ZMPU=; b=Zy5utAe8XAkPegAWHpiPY9kM/3
	aELFhBYsLrWPOySl1RBb9h+I+h82VTXj24yIoHLVK7nNusZiXNcdqTD1Mw/wjTLHGkajfytVPuWbu
	kYQPOvI0YIgzHsS9WEm4it2DNY9g/h2ndbRNSpP0YLWDluEEtSk6H68x6Aers/T16Y8cj7QQ1cSw+
	KDARh9meJruToTk1om+p1KYW0Yg7bqKq37mQX3NK5sm0tLp7fbP7VlDO0djVCaeaktjSCL+l7L21/
	fKAJdMhAkbtwJyryXa8kF6WvcW1H03UOErs/MZIX2DRRFp4qqxhqA2uXso8KQHlFretz6cymUvtft
	nXG77OPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWY9U-0000000D63o-2Wmj;
	Thu, 26 Nov 2026 12:00:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWY9T-0000000D63T-3y0L
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 12:00:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AFA5A411DF;
	Thu, 26 Nov 2026 12:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B3661F000C0;
	Thu, 26 Nov 2026 12:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795694435;
	bh=NeVecizEzCgloQzgLcrNc914RsWbWV3K83+bGSP1TQo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=mhzb80Ow8ANuEJkPFj8CzgJRVsIWYnVzXqd8oLrrsF8pvo8myS301oBZOA21us39/
	 RTyya+8j73ldZgTXDL0mYjlsPqyMgEJs74f0OaucbmNqKPci/aDTFtAcr1M1qbCR14
	 MOPvXqs2XjR0WwZqLrcFFLUU4bhgctc3al5iQwx48T676s0dL84mTltDZ5N2rXzYlt
	 8c4WXDXfeBldPJSs4GFUaSF9EeT12FgH5TB00VhLyoIs3g5kQ05xlxkFfFdsPxvisX
	 5rQMFoRcaRnUIlfWZ5HnVGyIkJOZIft00roBs9MjjIK4/0DyYfyDUwJGA04voSXclc
	 vD80/3hjou/rQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, fustini@kernel.org,
 guoren@kernel.org, ojeda@kernel.org, ukleinek@kernel.org, wefu@redhat.com
Cc: acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 boqun@kernel.org, chenhan0017.work@gmail.com, dakr@kernel.org,
 daniel.almeida@collabora.com, gary@garyguo.net,
 linux-riscv@lists.infradead.org, lossin@kernel.org,
 m.wilczynski@samsung.com, tamird@kernel.org, tmgross@umich.edu,
 work@onurozkan.dev, linux-pwm@vger.kernel.org,
 rust-for-linux@vger.kernel.org, FUJITA Tomonori
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v4 0/2] rust: add u64 division helpers and fix the
 pwm_th1520 32-bit build
In-Reply-To: <20261118224826.2491684-1-tomo@flapping.org>
References: <20261118224826.2491684-1-tomo@flapping.org>
Date: Thu, 26 Nov 2026 12:59:02 +0100
Message-ID: <87tsl3u7ll.fsf@t14s.mail-host-address-is-not-set>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

FUJITA Tomonori <tomo@flapping.org> writes:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> This series fixes the 32-bit build of the TH1520 PWM driver with
> COMPILE_TEST.
>
> Patch 1 adds a math module to the kernel crate with Rust versions of
> div64_u64() and DIV64_U64_ROUND_UP(). Patch 2 uses them in the driver.
>
> The driver only needs u64 by u64 division. It does not need a 128-bit
> intermediate value like mul_u64_u64_div_u64().
>
> Miguel, Uwe acked patch 2 and is fine with this series going through
> the Rust tree.
>
> chenhan's patch [1] also adds rust/kernel/math.rs, with signed
> division helpers. Both use the same module header, so whichever
> is applied later needs only a small rebase.
>
> Tested with the doctests on x86_64 and 32-bit ARM QEMU.
>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Best regards,
Andreas Hindborg




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
