Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB8DCCD1BF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 22:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Mime-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DmzZEDAA5n4BxpD0/2I304YDZ1hcbmn/EfxBHx9OoMQ=; b=lb8EKFCr1Fe7eA
	/AVAFOb2uWOidD5hxJgYtVDaaR4FmMAbKX3hqXREY3gMOAnpcy5hiX2y+hLP2lOTsVLNNgrwXGhAo
	LB8vMwbBcGw7z01D2pWXvV5aWHkgWEUaFE0Xbvc52OzJtuFBkNOLt1kzSejKfShBQXxzyZFEmQd+D
	VYCU5F5BOLr4coovW9hM4wWgdUQfbHEbs1PTQpjJdXoPV5Q79iDHwfcUBOl6LYQOiPq49VUB7en0r
	ef8BZL+7WPjMxPeTmouFKmfhrwROAE1PxWUKbwRAEXneJAzs898PZ1bUBTlYlyui56s3HWtwddAki
	i1w2Qso5XZgxnDNk0xHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDsEl-0000000GkPf-0KIq;
	Tue, 28 Oct 2025 22:32:19 +0000
Received: from mx-out2.startmail.com ([2a02:22a0:bbb6:1d00::1002:2525])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDsEh-0000000GkOC-3oIT
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 22:32:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
	s=startmail1; t=1761690727;
	bh=7fbLf7dsMSEXsanBd+TOkS6hS7Yp+t45iWo2f3WKxDM=;
	h=Date:From:To:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To:From:Subject:To:Date:
	 Sender:Content-Type:Content-Transfer-Encoding:Content-Disposition:
	 Mime-Version:Reply-To:In-Reply-To:References:Message-Id:
	 List-Unsubscribe:List-Unsubscribe-Post:Autocrypt;
	b=PAXceexBW6LqhOQCKV/n049i6ibT84slkSt9i08v8LW32Z2f9A5yd1a+EVL1yDQoo
	 lVf6LgG5cE6CQqj8+ja7m+lBwcrjzlyo2mb/wvIu7U9AYOxS3Oz80MtS5pMCus/T58
	 KhdbY5jARLAt2G4kZBh4QrV7rRYS6gXXf3xSky79sfnJi01YjZUqVRsd79755pY3pG
	 w0JcbQ8jcA6vPcG66tGW/iAlMH0CD3MlN3+L4NSiltTgeSyE/+6PzVFnAbnKDaHKWp
	 zUAbRMOVMzTvfO1Ez9Ww/cOVYqKERTzCCY/V1pxAVbvXliNxq4g2hAqRH2Pd8+eqim
	 UU0kA/mCsPa3g==
Date: Tue, 28 Oct 2025 22:32:02 +0000
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
Subject: Re: [PATCH 1/4] rust: macros: Add support for 'imports_ns' to module!
Message-ID: <aQFEYmJ4K92NNjs5@archiso>
References: <20251028-pwm_fixes-v1-0-25a532d31998@samsung.com>
 <CGME20251028122316eucas1p2733987cd4c1eb8f83d6572d542e76d2a@eucas1p2.samsung.com>
 <20251028-pwm_fixes-v1-1-25a532d31998@samsung.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251028-pwm_fixes-v1-1-25a532d31998@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_153216_093981_F7683F56 
X-CRM114-Status: UNSURE (   4.72  )
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

On Tue, Oct 28, 2025 at 01:22:32PM +0100, Michal Wilczynski wrote:
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
