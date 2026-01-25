Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A097E63CAA
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jan 2026 16:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3vhsuMjnqSuQ/WF1tp4J7bW4JMshYWiTlDlhYE3Bt28=; b=XvFBbSSMURGVG0
	7HPniW6uq3MTBP5SVNMaJuFmHTSvIzQPB43rkn8ST9UATyk0zZ/LTaewPHyVK2p0egQTyN+DdlDXt
	UQ2mcw/M7x4r7eGgrteoRYOKs+E7oghdAZg8Q1v15dqUM8fGwfIHJ6TloIkUbzaOv9vgLs9e8janK
	Dqz019+luw1yKIvvWKUGWaOXbQKZYzYTgMiUh2v4ogNt6+C+dUSi8F9sd1HhLQnTBJoPDZCr6pPdF
	chn3BCDBVnBEDDFj8VkpzGsQDm2x7u4yz3yyzI+vI8fcrSlP3qUt87PjyFt5hDiHF3PWK+am/efPW
	6bWYgv9HcCqNqPJpZ9hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk2uQ-0000000BJO2-1lMX;
	Sun, 25 Jan 2026 16:24:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk2uO-0000000BJNg-1lhL
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jan 2026 16:24:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D7DFE4432C;
	Sun, 25 Jan 2026 16:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5CFCC19421;
	Sun, 25 Jan 2026 16:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769358254;
	bh=ycA5EltIhnabz00h9MF8AHHKTe8fgalYZeTr/jXsIec=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=SNLDxMUlqpIuN+Y2dp1BrLMk1hPp86Kd+FhnDVnheZYQ09yWxjXjEP747u7oTjdfh
	 ml5QylurT0nieKUjTS4eX73bUtPYC7EIEU6FwywXlmE4x1ujT4hu09COCec3EiEV6k
	 6peALI3FQ+vVbwmCyfR4Dn5/FmD8xtRSjKqPh8EsXR6XyY7WKc3u8lvbrDM3/NLZJU
	 3qAvaDH4acQustGCr7awDz87O+8ipqVllzstJj3fOrQ4uhTDLYgiwi8REmnRY8j4PR
	 t552p4hqvDO1Haj4oyleoNrA0OiM1Q8ng0ygz8nl1tAycCvf2XUexYt8qcKgrC7gv5
	 IwdOmIdGrTwQw==
Mime-Version: 1.0
Date: Sun, 25 Jan 2026 17:24:10 +0100
Message-Id: <DFXT5IV4DC34.1EQKKD6KP56H@kernel.org>
Subject: Re: [PATCH] pwm: th1520: fix `CLIPPY=1` warning
Cc: "Drew Fustini" <fustini@kernel.org>, "Guo Ren" <guoren@kernel.org>, "Fu
 Wei" <wefu@redhat.com>, <linux-riscv@lists.infradead.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "Mark Brown" <broonie@kernel.org>
To: "Miguel Ojeda" <ojeda@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260121183719.71659-1-ojeda@kernel.org>
In-Reply-To: <20260121183719.71659-1-ojeda@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_082416_548245_7B82FFCB 
X-CRM114-Status: GOOD (  10.19  )
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

On Wed Jan 21, 2026 at 7:37 PM CET, Miguel Ojeda wrote:
> The Rust kernel code should be kept `CLIPPY=1`-clean [1].
>
> Clippy reports:
>
>     error: this pattern reimplements `Option::unwrap_or`
>       --> drivers/pwm/pwm_th1520.rs:64:5
>        |
>     64 | /     (match ns.checked_mul(rate_hz) {
>     65 | |         Some(product) => product,
>     66 | |         None => u64::MAX,
>     67 | |     }) / NSEC_PER_SEC_U64
>        | |______^ help: replace with: `ns.checked_mul(rate_hz).unwrap_or(u64::MAX)`
>        |
>        = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.92.0/index.html#manual_unwrap_or
>        = note: `-D clippy::manual-unwrap-or` implied by `-D warnings`
>        = help: to override `-D warnings` add `#[allow(clippy::manual_unwrap_or)]`
>
> Applying the suggestion then triggers:
>
>     error: manual saturating arithmetic
>       --> drivers/pwm/pwm_th1520.rs:64:5
>        |
>     64 |     ns.checked_mul(rate_hz).unwrap_or(u64::MAX) / NSEC_PER_SEC_U64
>        |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: consider using `saturating_mul`: `ns.saturating_mul(rate_hz)`
>        |
>        = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.92.0/index.html#manual_saturating_arithmetic
>        = note: `-D clippy::manual-saturating-arithmetic` implied by `-D warnings`
>        = help: to override `-D warnings` add `#[allow(clippy::manual_saturating_arithmetic)]`
>
> Thus fix it by using saturating arithmatic, which simplifies the code
> as well.
>
> Link: https://rust-for-linux.com/contributing#submit-checklist-addendum [1]
> Fixes: e03724aac758 ("pwm: Add Rust driver for T-HEAD TH1520 SoC")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> It would be nice to clean this up, so that Mark may start enforcing it
> in linux-next -- thanks!

Indeed, the patch itself LGTM.

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
