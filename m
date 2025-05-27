Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EDAC54F30
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 13:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xnbfjdILpyGF7UXN4xgRYj3Bz/AJJUYGP0izJqry+j8=; b=DfWzlcS30m6Oxu
	cMDSknUmAXh4uiQDR/uVWE5TN7Wl8crTPJ9+04YNWmbrsW1lmCi0l12/TxH6i6evTRDHUzU4q+rXG
	YHkPBcSKh1emeQHIM+tyL7zMUkk2131L+Qvb9d11RC0qY03+1/+6PZE02Ao9a79rKJ52nyTRBTnjW
	rHo8AsA8RqA63P0oheU9ASrUw66JpPLsAot1oxuo8Jht/IMxMy/SgaliVuRaOGKKMbR4Hvw6VYFMl
	En5GnSWxP3npUdKKB+SF5jUfv/W9gr6UnbgzWmKN14m+LNRaSXx/lPLhus3dBDN/mrAmLor+VEezd
	5fJ4uWtzn+OzE8z7pR5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJtv3-0000000Akor-24Uq;
	Tue, 27 May 2025 13:00:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJtv2-0000000AkoR-130I
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 13:00:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7364861129;
	Tue, 27 May 2025 13:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92C6C4CEE9;
	Tue, 27 May 2025 13:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748350835;
	bh=rH0fS1EkuuKxnjq68htChxno+6ZqIneRHLz2oaYXSAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SCyiXWXF4GD5OzmsDdQm2QCmHs7Xi1pg9wMxuwnVVw/8vkuYASFSMMHdip77oyxSj
	 tG5te1IK4mq50ciNIrEYi85zEql1zCDdnDDVCGPt1CbiJ9Rs6eW8JrIErnzB21A8E+
	 q3uNIMmCP+OaD/aBHdF70fX0jjuiilWmXwyIK0MFA6Kt618+D5QeN/cAztiUxPldF1
	 I8rnRBcwKcXHPPD5xL2q9zLQ5KVR3eqODR82grqgqX2zRz9ZEyFGW9dLjjhOVvtaAo
	 IKypfo7BvCathejm9qT0X/ls7XOmb6/+Z2jz0gwXOb0ShLBLhgxULyVnX7LEIFYrop
	 h4+pKxO03RMJA==
Date: Tue, 27 May 2025 15:00:27 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: "Michal Wilczynski/Kernel (PLT) /SRPOL/Engineer/Samsung Electronics" <m.wilczynski@samsung.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 2/6] pwm: Add Rust driver for T-HEAD TH1520 SoC
Message-ID: <aDW3a1sjeWWfwaq8@cassiopeiae>
References: <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
 <CGME20250524211521eucas1p1929a51901c91d1a37e9f4c2da86ff7b0@eucas1p1.samsung.com>
 <20250524-rust-next-pwm-working-fan-for-sending-v1-2-bdd2d5094ff7@samsung.com>
 <aDMHEcpJn8nyJHFV@pollux.localdomain>
 <db8e34c9-daff-43d9-b79b-8ec1bc98a00f@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <db8e34c9-daff-43d9-b79b-8ec1bc98a00f@samsung.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, May 27, 2025 at 02:44:57PM +0200, Michal Wilczynski/Kernel (PLT) /S=
RPOL/Engineer/Samsung Electronics wrote:
> W dniu 25.05.2025 o=A014:03, Danilo Krummrich pisze:
> > On Sat, May 24, 2025 at 11:14:56PM +0200, Michal Wilczynski wrote:
> >> diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..4665e293e8d0bdc1a62a4e=
295cdaf4d47b3dd134
> >> --- /dev/null
> >> +++ b/drivers/pwm/pwm_th1520.rs
> >> @@ -0,0 +1,272 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +// Copyright (c) 2025 Samsung Electronics Co., Ltd.
> >> +// Author: Michal Wilczynski <m.wilczynski@samsung.com>
> >> +
> >> +//! Rust T-HEAD TH1520 PWM driver
> >> +use kernel::{c_st
> >> +
> >> +struct Th1520PwmChipData {
> >> +    clk: Clk,
> >> +    iomem: kernel::devres::Devres<IoMem<0>>,
> > Why IoMem<0>? If you put the expected memory region size for this chip =
instead
> > all your subsequent accesses can be iomem.write() / iomem.read() rather=
 than the
> > fallible try_{read,write}() variants.
> The size of the memory region is not known at the compile time. Instead =

> it's configured
> via Device Tree. I'm not sure why it should work differently in Rust ?

There are two sizes:

  (1) The size of the actual MMIO region, which comes from the device-tree.
  (2) The size of the MMIO region that the driver knows it requires to work.

Let's say your driver uses registers with the following offsets.

REG0_OFFSET =3D 0x0
REG1_OFFSET =3D 0x4
REG2_OFFSET =3D 0x100

This means that the size of (2) is 0x100 + width of REG2 (let's say 0x4), w=
hich
means that you can safely define your MMIO memory type as IoMem<0x104>.

If you subsequently call pdev.ioremap_resource_sized() it will fail on runt=
ime
if the MMIO region defined in the device-tree does not have a size of at le=
ast
0x104, i.e. (1) < (2). That's not a problem because if (1) < (2) your driver
can't work anyways.

In return, you can call the non-try variant of the read / write methods of
IoMem, which do boundary checks on compile time and hence are infallible.

Note that this does not prevent you to still call the try variants of read /
write in case you also have to deal with dynamic offsets that are not known=
 at
compile time.

I hope this helps.

- Danilo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
