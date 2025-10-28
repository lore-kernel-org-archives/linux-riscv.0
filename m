Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F50CCD1BF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 22:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Mime-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cHBl+Qt1lZHNRYcyHMgSQirdwrDejoc04m9RrCuJavw=; b=jp9iYo/p1tShHD
	n2RgltaHuZDhMSpp6R+mCp7siPHwABpISuxOPZwYpE9usIGi3h4tYkmobY4ozMi4KIJONLh5mqtza
	kZUn/R8nJFDUh8MmIpeKiHZqSwdkxvUCLtZppapizsRUuJ9hXKZkte9VTBjXRuCvoZxYvTdO7NvM1
	Soxj6AqpbYVIcE2CrYMUqk+uQVN54RfOURHojQsYEWVsSMuquW1fkXE9eXie5XV+BxvKplZpBph4V
	IThzr34LCai/tKxaRxRFeElUNTRkgqlpRBdcpvjqa4jTpKXdfUZOdwt9hxSc6aH55f796Ve5CzTOj
	p93h9KzZteuytcU1Bt4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDsGS-0000000Gkiw-0bYx;
	Tue, 28 Oct 2025 22:34:04 +0000
Received: from mx-out2.startmail.com ([2a02:22a0:bbb6:1d00::1002:2525])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDsGP-0000000Gki7-0YWC
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 22:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
	s=startmail1; t=1761690839;
	bh=iqa/oXvDIF1kSlE5Bx6xl2J/jyNf0x3ciXmOvj+Rd3A=;
	h=Date:From:To:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To:From:Subject:To:Date:
	 Sender:Content-Type:Content-Transfer-Encoding:Content-Disposition:
	 Mime-Version:Reply-To:In-Reply-To:References:Message-Id:
	 List-Unsubscribe:List-Unsubscribe-Post:Autocrypt;
	b=XbXNg3AhOOIFLo54iEz52G7QmxUUmeIgP8jTa9HTcEYpqOXWe3EcSUl78yixaI4Th
	 eT5FsrwrLq9hsZlWAcU/HgeRx4z8ZKOWn+QeDwixExEc7uwtRjPDvpZbo88dm+mpCa
	 4x2j+Hbhtxr9XnivGnyVZtRV1pwCAdo31HrcqZ1r+Rd4K0tFNzbMu/r0McvWrunmdT
	 l3r5kl5x8m9p6f5cwJqGU8m4eBeCDHnm9eOzNtOUm8zEbnqyaod+PkL3aVgKeDd6HQ
	 ZYVyOy4WSM+GeWr7sDkFH9rHbpaKO73bx53vzz6zl4nq3RSiidyEUGNTUor+uxvVJt
	 IFHV3YBbehi0g==
Date: Tue, 28 Oct 2025 22:33:56 +0000
From: Elle Rhumsaa <elle@weathered-steel.dev>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 4/4] pwm: th1520: Fix clippy warning for redundant struct
 field init
Message-ID: <aQFE1P_J1DqX4dNt@archiso>
References: <20251028-pwm_fixes-v1-0-25a532d31998@samsung.com>
 <CGME20251028122318eucas1p1863a8b44efe27c28a1bcf427d2855c00@eucas1p1.samsung.com>
 <20251028-pwm_fixes-v1-4-25a532d31998@samsung.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251028-pwm_fixes-v1-4-25a532d31998@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_153401_309977_7965449E 
X-CRM114-Status: UNSURE (   4.18  )
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

On Tue, Oct 28, 2025 at 01:22:35PM +0100, Michal Wilczynski wrote:
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
