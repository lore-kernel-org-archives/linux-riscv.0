Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C254ACCD1BF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 22:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Mime-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lwKi71bYqwX96CZ0UayWuaGmrf9S3kdiU/5UF9Lirbo=; b=Qfvfm5dE9qUrlR
	6MPoOO1gnQZ8e76Sx+NmJVSCF2q5RsGHu5d6FGiT0r5UiKpw64Wr+hSF3To5lqORhQyAu/KotUFRY
	FY+ImRVyMCggR+BhFwSkoFD0Jt4hEXbE/QwCFUWSRGIU/LRHeZpNMHIe8YDS0NnUB56VmseXtli3Z
	+ZQwj4j1Hm/8OhriR2tr7oLas/rlwlcVXGkaH5LKoQGUMdlD9xGT+kr00cfH9Yj8mnzPnVP8GCFYj
	iVwJqsCWyF9GdRRor6GEvF6zhlBi5iC86TihLJ3iNSdh9Re7oZVg2MXH3NgqYXLNOfRQcgAYHdTzj
	vd1Iwlh7ojLlfimnH+Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDsFv-0000000Gkbp-3Otv;
	Tue, 28 Oct 2025 22:33:31 +0000
Received: from mx-out1.startmail.com ([145.131.90.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDsFs-0000000Gkb8-351z
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 22:33:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
	s=startmail1; t=1761690806;
	bh=QCCjj+Bv1j9K1+3pbIl8HC5LywrZOmPqTcduG1Q9lno=;
	h=Date:From:To:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To:From:Subject:To:Date:
	 Sender:Content-Type:Content-Transfer-Encoding:Content-Disposition:
	 Mime-Version:Reply-To:In-Reply-To:References:Message-Id:
	 List-Unsubscribe:List-Unsubscribe-Post:Autocrypt;
	b=Cs1tT7Z7oqYz673T1j+H2kSAZtLnPBkiY1oTpQWWuQ7yq4IVypcdjiWCfA2oferx0
	 CQQL9lDUo63CrQxSn0jRDAoztNTHc66ektVfok9BemqnfNzPAWiO7PSDI5c1j7k+v0
	 k3epdvwjngDLRpI9ldiaiHr1phMQsS9xE+TNoHJIMeh7I5leAudMTM5Y5qhdaAHBQ/
	 Gw7+hmRJKwxgnj7S9lnUHkCOuy2NpVbEGSR1kAD59rF1kkKXVWz0IJE1u8Kc5n69Qj
	 1vLqKBQFGUoHuCw7DZxG4ZfBeV8f6JGvJV74O5+Zx6oatB4XJuwiXM5x1HQTFCs5Ko
	 BF4ilnO96Jt+Q==
Date: Tue, 28 Oct 2025 22:33:23 +0000
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
Subject: Re: [PATCH 3/4] pwm: th1520: Use module_pwm_platform_driver! macro
Message-ID: <aQFEs_5HI_cFQhtO@archiso>
References: <20251028-pwm_fixes-v1-0-25a532d31998@samsung.com>
 <CGME20251028122318eucas1p17161f0e1f2281c868688e8a4cc3d8f68@eucas1p1.samsung.com>
 <20251028-pwm_fixes-v1-3-25a532d31998@samsung.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251028-pwm_fixes-v1-3-25a532d31998@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_153329_408960_ADD66440 
X-CRM114-Status: UNSURE (   3.99  )
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
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
