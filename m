Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9C9FF6E8C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 08:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mz16xf1aUSPn1A3sBwZeCcn6ESibdCFk+a3Cx8zLt44=; b=WDmFZICSZfBaJA
	15KH/gJLJqwdDLsZ5VzaRklWv1au1RSgWcbnXhf+QFJKtIgk75d1JYvLJs89imsnfQQy7+36h56w9
	zRocfZNTWmxVXLFl9Zi+WeGnqbGKfqw894OWbYbdwH8GrE37FStmehiEcvZVgNgKfv1kjeU32X6p8
	DlXeG7QJxIJYaxdlerGd9AwYuFeOiyjDphQGciIdrdE0OlWteX58eF5E/r/EaDc/1wDa79TbQsFab
	ai7FMgQDQLqL/D6LUZqPrLCFSVrPzW3glewTm/pIeMu54OgmkWHeYxsKaFa+hJwD2Amyeg4Eykka5
	Jr6nzZvrQo/E96cuYH9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2mTF-0000000842I-0TMH;
	Wed, 18 Mar 2026 08:41:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2mTD-0000000841v-1ssZ
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 08:41:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2728441AC7;
	Wed, 18 Mar 2026 08:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E5EC19421;
	Wed, 18 Mar 2026 08:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773823298;
	bh=+62640ndgmB0fxa4E8/v1FxPgm+qfLhMw4xeTHEgCIw=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Z80NK9BBHxfWwqonBX+UXpIKUsLR2L71IFFtubmXx0yLtd458fdbShLLNggVK3K3x
	 VwABdaYitfQoL6OsaJ0mqN/4ISj9wuSp+28+CIjm1Je6orxxGGGD7AYNRH8yjoBSEy
	 x35MOCyRNws37gm9xejnrkF2UQiHAOsoMbTB3Dr9YqUEbtfYulgCckkP/BGIML5glt
	 +YOU1u/DYUW9AK3qi92TxX913oFeBlgC1TvjO/M1TLWlnCoYhd5RR5PuXq4Le4fMwI
	 RGx8NngYq5yRlPTa4SAZSOlx7jigqbZr7K3KTLGhlI95PZuIJAfe7amC4lIhOcPHa2
	 GJckLKDvSSjrw==
Mime-Version: 1.0
Date: Wed, 18 Mar 2026 09:41:33 +0100
Message-Id: <DH5RVNK0TCQG.3E2K1WC03CBXM@kernel.org>
Cc: <linux-riscv@lists.infradead.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 "Mark Brown" <broonie@kernel.org>
Subject: Re: [PATCH] pwm: th1520: fix `CLIPPY=1` warning
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Drew Fustini" <fustini@kernel.org>,
 "Guo Ren" <guoren@kernel.org>, "Fu Wei" <wefu@redhat.com>
X-Mailer: aerc 0.21.0
References: <20260121183719.71659-1-ojeda@kernel.org>
In-Reply-To: <20260121183719.71659-1-ojeda@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_014139_525526_DE5D30D5 
X-CRM114-Status: GOOD (  13.96  )
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

Just encountered this during my testing, could we get this picked up please?

Cheers,
Benno

> ---
> It would be nice to clean this up, so that Mark may start enforcing it
> in linux-next -- thanks!
>
> Completely untested, so please beware. Also, I am not sure if I am
> missing something here, since saturation arithmetic is already used
> a few lines below already.
>
> Cc: Mark Brown <broonie@kernel.org>
>
>  drivers/pwm/pwm_th1520.rs | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
