Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC45CAC5B8
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 00:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9EytT05eqekgC4fVB4rRHkFRUzXCDjU+A150jrVNb3A=; b=Yx3/Uh8xJfwroF
	MrXhZGuNC5DojiQD6gLbhJX37DZgL3ic+1RTTEugoP3HEtumEOnDBColYBpLpDB5s+cUPnQjIjh2Z
	UUPXnx78yWqfmMneeqX0M9ju0gBS/fXstInRUx5txfIof9jrgWLa1H7GyYSVCbj1H+Z1+mkeu3Dcz
	jFDoSJHwhH471chOQOt4PLcpw9oYIazKQ1HaTF41v/Y7rHG+ZdjlmPzP2JIFlpTgSRR5knZvwzXIz
	7FyL8LuS0Z4cdDIFjqVnFaqjSEbCh0KpKN1ukUBkAkb4GxmmXQblGncmF2cjVwqFIpCGqO0EZQXX1
	W5PSOyhqabOXx6F1LQsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3kHT-00000006PL0-3Jdj;
	Wed, 01 Oct 2025 00:01:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3kHS-00000006PKi-1FBm
	for linux-riscv@lists.infradead.org;
	Wed, 01 Oct 2025 00:01:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B446A60519;
	Wed,  1 Oct 2025 00:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E64C4CEF0;
	Wed,  1 Oct 2025 00:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759276873;
	bh=OS51U7OU5GJ0yf/o9GaQhMdAvaYjkphStJrxtY7XLnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AdK7wDUhqAanqU5rG9sXWDlEBCTU3CexIcGMHyiKw0YKz/JijEWlO59/TSW74OgXD
	 BZlO5Nwdwd/OIoyB68U8hG11JOyLJWTOyVPrhFiiTvLnzJMKJ5o+9YXZH5CCkBWqO5
	 OmQKto6Kx3VWX/IvEa+ea8whSIqr1PJoxOMrV61jzV3UmYA1mYlWy1alF+PvBeHccX
	 Pj0L3iNJzg86fdKGykOFi6+p0bpWvrhhkOmrmuIgNQ/DnJZLPpEsFbcV5kzcjc34RE
	 pTFSuiN+m9sEa3haCPGUtFrJuQRDoKqWJednXnht0UBdX3QSCmpDeLvw0fbBUmzwkz
	 d8aqFwpcOLxpw==
Date: Tue, 30 Sep 2025 17:01:11 -0700
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
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Elle Rhumsaa <elle@weathered-steel.dev>
Subject: Re: [PATCH v15 5/7] dt-bindings: pwm: thead: Add T-HEAD TH1520 PWM
 controller
Message-ID: <aNxvR5eNAB3NKbtT@x1>
References: <20250930-rust-next-pwm-working-fan-for-sending-v15-0-5661c3090877@samsung.com>
 <CGME20250930122735eucas1p1c49ed11a4a48155c123ead6aec4b64a2@eucas1p1.samsung.com>
 <20250930-rust-next-pwm-working-fan-for-sending-v15-5-5661c3090877@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250930-rust-next-pwm-working-fan-for-sending-v15-5-5661c3090877@samsung.com>
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

On Tue, Sep 30, 2025 at 02:20:36PM +0200, Michal Wilczynski wrote:
> Add the Device Tree binding documentation for the T-HEAD
> TH1520 SoC PWM controller.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: Drew Fustini <fustini@kernel.org>

Minor comment: if you do end doing another rev for other reasons, then
please remove the Tested-by and use this instead:

Acked-by: Drew Fustini <fustini@kernel.org>

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
