Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48732CCD1BF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 10:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6/l4AeLFC+D1qP3kt87UfIJZAWOl6EoIEMFD7l2cSF4=; b=HkhnGmXlRK8P4P
	qbKlDMpGCQ/09x2PSyYcsBKOT84tKj50PAmmbNQEQjuX0PiB6ZzduHrEcJBDE40tleF1qdakBs0ia
	gGYM6SnvYv8bRoPLJintk0dL5Kc/IhVMBMKz6kRdgzR2jCiNH2ixVBSkWMQD+qcK6Va0a33JRItQA
	7Yh+1fsUk49Km4f6J+tTKRDEyyN5Epfc+WmIDtJK8+iGajEGr3BKLHN+w+QYlijbN3Fk0LMBAzmUn
	jLXQLxB1lP5pTpsJvqRN3n0infOiEJoZtEgIPlvhcAFGU/vO9rCHWA3hbPSeKJemplLsEiemg3UIq
	gDOEUjXouAIfF1iL6q+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgdc-0000000FiVG-3Kvr;
	Tue, 28 Oct 2025 10:09:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgdZ-0000000FiUu-0dX2
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 10:09:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD0AF4450F;
	Tue, 28 Oct 2025 10:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52031C4CEE7;
	Tue, 28 Oct 2025 10:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761646147;
	bh=6kNXKXkNNZS7lISKkrrbAtTK05DhAr6N4veKjlqS9es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DME/ZmMHqQrihdz2PW4W/jIpRBor6dFlx1Duk5bKqqFoKA2KQfnbdL+CQDP0BUNmS
	 xBR0lHPrzkmCz9RKNQT8rVq7bFeB0pXvV6gfJnNXXYhxrBb67dSLyrJ/iuJrNBZP3O
	 UOwDhzW3Gl4F6o9CmYDHHEKGcusVLDCPWqR8Mo/7DWHrlwO0UPe0y+QKWkz/ktHLCb
	 bos6xzvlO05nqf0KKYy2HUsNc1W3IkshKPW73P7U2Lr1kZ8w/EFZcSMnM04OGKXxTX
	 9+8QL/rd3P33pqyHXMJaM7hP/+Ff81M7i7+LVGLEL0ZFnF8AvCo0XXS7zeskWhDHH8
	 pgc1p/UCagY9g==
Date: Tue, 28 Oct 2025 10:08:58 +0000
From: Drew Fustini <fustini@kernel.org>
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
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, Elle Rhumsaa <elle@weathered-steel.dev>
Subject: Re: [PATCH v16 6/7] riscv: dts: thead: Add PWM controller node
Message-ID: <aQCWOridtd0MsG4q@gen8>
References: <20251016-rust-next-pwm-working-fan-for-sending-v16-0-a5df2405d2bd@samsung.com>
 <CGME20251016133822eucas1p15e605481cd324276ec87ab596e1527e8@eucas1p1.samsung.com>
 <20251016-rust-next-pwm-working-fan-for-sending-v16-6-a5df2405d2bd@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251016-rust-next-pwm-working-fan-for-sending-v16-6-a5df2405d2bd@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_030909_237356_82970ECF 
X-CRM114-Status: UNSURE (   6.98  )
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

On Thu, Oct 16, 2025 at 03:38:06PM +0200, Michal Wilczynski wrote:
> Add the Device Tree node for the T-HEAD TH1520 SoC's PWM controller.
> 
> Reviewed-by: Drew Fustini <fustini@kernel.org>
> Tested-by: Drew Fustini <fustini@kernel.org>
> Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to thead-dt-for-next, thanks!

-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
