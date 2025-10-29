Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5180DCCF9EA
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 01:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pPfY+mxDWoHf1R7MvgpCLJ6QPm8+EA+nQTjvWCCIdTM=; b=JEx7hQVF4moqd9
	uCPwJylAZ9pJUYAkTLVkpLv590LzCdKyeSFOSUMrrUv/Ur7H7VumfMqjt+n66T5k+UzbfpYKL+b8m
	as200JtP0ldQRnUyNCG7X9ZiYkRwQ+XnY+qYWAjx9fliZ2t0W9hCARB22il970Voa5z3M5dYpiRvm
	ihQyyZdg9c+NNI6w5jVwxdeMTXrJUV0VEtQoqSx3PCy5otGKIiDytI7sX3JIZUZygu1K941whqtQm
	1ktVsSp9pj8s03y08Xulr4DoGR+/DbKm9D8sKIkfh76K701/bB1vBgvUDHlWDNfS/ZUZN2SKbiW8A
	dQF23WuSUIknct58LEJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDuXp-0000000GtLY-0Ozi;
	Wed, 29 Oct 2025 01:00:09 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDuXl-0000000GtKN-2NJM
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 01:00:07 +0000
Date: Wed, 29 Oct 2025 08:59:49 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761699600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=axfy//ogFDe/yGbFMo1sZMCFPL+4baIeWWIdu2LpDI8=;
	b=C+uHI4yJrnTWHNX09+K4A6XEe9JSPPUru03wyNSgVfHv61E7wLAa4TZ331QLDUnPoQ1P6E
	VjUIg4YW3JXeZ4EO+p4elnyhBy5vg944BCDQMdxymYkrakt5HKwr3RRDjZBvBZO2zy4wqQ
	Odu3Jg8x6KTSeZ3PTZpwj1+hNJQKZC4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Troy Mitchell <troy.mitchell@linux.dev>
To: Michal Wilczynski <m.wilczynski@samsung.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Troy Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH 3/4] pwm: th1520: Use module_pwm_platform_driver! macro
Message-ID: <aQFnBYc7C-nQslJ9@kernel.org>
References: <20251028-pwm_fixes-v1-0-25a532d31998@samsung.com>
 <CGME20251028122318eucas1p17161f0e1f2281c868688e8a4cc3d8f68@eucas1p1.samsung.com>
 <20251028-pwm_fixes-v1-3-25a532d31998@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251028-pwm_fixes-v1-3-25a532d31998@samsung.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_180005_971672_575C7BC8 
X-CRM114-Status: UNSURE (   7.63  )
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

On Tue, Oct 28, 2025 at 01:22:34PM +0100, Michal Wilczynski wrote:
> The `pwm_th1520` Rust driver calls C functions from the `PWM` namespace,
> triggering `modpost` warnings due to missing namespace import
> declarations in its `.modinfo` section.
> 
> Fix these warnings and simplify the module declaration by switching from
> the generic `kernel::module_platform_driver!` macro to the newly
> introduced PWM-specific `kernel::module_pwm_platform_driver!` macro.
> The new macro automatically handles the required `imports_ns: ["PWM"]`
> declaration.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
