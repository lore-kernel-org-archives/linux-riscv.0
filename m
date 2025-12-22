Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFCAE674B2
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 14:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bP4GqYx7GNUaRYcaWBRgwPiXs72KLRH/Ozlm2R16FT8=; b=AdTSnEWmLz6+KR
	FA19rRSdRPI84mpVs2UfGFuNWDiNu8n4/sYGD31KTjuOcQexHsOYXh8fh4klFiq+HjCh9c9Br/RAD
	9O0aDtlXbQKPc9iYChs2C3d8GyE3XLIUTYmjklKW2LtlTe1/yHQuu4JP+DOdU6y6mRZNqSMH8stCG
	L7nFJGrkzEPGpYWgNyz2FS8JP+D2pz5B7kpoKNUtgJeSm39LNZBvU57sbVrIfKm5pL5AEsUNmB3Y6
	/lE9nwRSWEMe+OW1gLU/Ztx4Ag/zTvSqfPX1DVs+3PAAK4KI9zy+qvGPDtc2aEPDtK0W7+WWneFhs
	49IgSvXDJIxZipECiA4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXgnK-0000000DrlD-2TZv;
	Mon, 22 Dec 2025 14:21:54 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXgnI-0000000Drko-3reJ
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 14:21:54 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766413299; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dSJA3frU6QuloPJJDWgkZ6o1bJd9LXPMPFMfvnII4R3z4ppxhQHfsbXfnJ75hZdquAOUQmDkfs9/UqpqSqsY6zE8E0gKxAQDpZSY+HS0+51R3f6q4gVaLo9GE6CBmge35G/KeQ6zB4/kiYkPKbuFlT18rvsC+jcUA5yAUeE0Mb4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766413299; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=a9KrdtA4sTPYPLeGS9oWNYHBt1scy7mdbGzi7GGj4R4=; 
	b=CwE0Vd7HAzfAJJGN3Fo4IUd8X9+79ZVriSQu2cBXMgB9WFJDn3ADQj7OE1FILJPbubUQsGTWJoLXGqMC1cDtyHO2h7jdgnueKP3AYqygV0M2n40PBzYhD6F2KAZVMEbsIxYqIAKmce3QnF1u6tpwxDVIyGDoGfg5Pq/HdrcFj2s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766413299;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=a9KrdtA4sTPYPLeGS9oWNYHBt1scy7mdbGzi7GGj4R4=;
	b=DCvWmjBy68tXZW/QwbdL7dV6gfGYITgZbzVws93gdr0fl4UloTTJU4+WSuP028e+
	bfDLsJcEq33TfuLT9FUB+bfOOkg+79ZNnOU8VsnNYY2/53H2kZipnVZy6aYLOMr2YV0
	z9/MB4UPC8DO6kE/iCy6AgfDEy9Tull5TJwmWwGA=
Received: by mx.zohomail.com with SMTPS id 1766413298347127.09238611384126;
	Mon, 22 Dec 2025 06:21:38 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] drivers: pwm: replace `kernel::c_str!` with C-Strings
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251222-cstr-pwm-v1-1-e8916d976f8d@gmail.com>
Date: Mon, 22 Dec 2025 11:21:21 -0300
Cc: Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 linux-riscv@lists.infradead.org,
 linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 Tamir Duberstein <tamird@gmail.com>
Message-Id: <607D76B0-1A8A-4A62-A961-14796A7FD31E@collabora.com>
References: <20251222-cstr-pwm-v1-1-e8916d976f8d@gmail.com>
To: Tamir Duberstein <tamird@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_062153_037854_6D55A738 
X-CRM114-Status: GOOD (  13.84  )
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



> On 22 Dec 2025, at 09:24, Tamir Duberstein <tamird@kernel.org> wrote:
> 
> From: Tamir Duberstein <tamird@gmail.com>
> 
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> drivers/pwm/pwm_th1520.rs | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
> index e3b7e77356fc..8ae8f852ec02 100644
> --- a/drivers/pwm/pwm_th1520.rs
> +++ b/drivers/pwm/pwm_th1520.rs
> @@ -22,7 +22,6 @@
> 
> use core::ops::Deref;
> use kernel::{
> -    c_str,
>     clk::Clk,
>     device::{Bound, Core, Device},
>     devres,
> @@ -327,7 +326,7 @@ fn drop(self: Pin<&mut Self>) {
>     OF_TABLE,
>     MODULE_OF_TABLE,
>     <Th1520PwmPlatformDriver as platform::Driver>::IdInfo,
> -    [(of::DeviceId::new(c_str!("thead,th1520-pwm")), ())]
> +    [(of::DeviceId::new(c"thead,th1520-pwm"), ())]
> );
> 
> impl platform::Driver for Th1520PwmPlatformDriver {
> 
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251222-cstr-pwm-c9b9a4701157
> 
> Best regards,
> --  
> Tamir Duberstein <tamird@gmail.com>
> 
> 

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
