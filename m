Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11D4CD8C9F
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 10:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v5Cp2wHY2IOX1UHmYOk2koZa709V7W/H47GBAJBtpkk=; b=tAVMcxTo8GGpN0
	PlBF0iaaJJjMQ0EgnxwdQ9GEkKa3fsYXRh2vb9kY1lZcJaQpZNZ/w18hHMhSF4g148qjDTBZzbeVI
	GU5ghSyUMRsfBGMcuIztJFhYhaf4LuVQVwok90hKYcnCpYZ28H0MOodFxnsD8UNvT3LWM5bgcg2+b
	cjONsPSshX6GfmdD4ssbEMBlTr+HABkft5PyBqpHHt6Oe+ITch88xFZq711ysklxQtU5gmxEYmUod
	D5eD9GqLadDx2YSnwBZXfx4feoJjRLl7Bg80OaePuKSqH0kiO3fmHNI3/tOSze60L6vI2H1Z69DKZ
	DvXaijPjMLeaKS4qsbVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWuU-00000003HPi-39g5;
	Mon, 08 Jun 2026 10:08:46 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWuQ-00000003HOn-3lxJ
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 10:08:44 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260608100839euoutp01b218a62022c82a532507a923165811f7~3EzpzERKn2057420574euoutp01I
	for <linux-riscv@lists.infradead.org>; Mon,  8 Jun 2026 10:08:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260608100839euoutp01b218a62022c82a532507a923165811f7~3EzpzERKn2057420574euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1780913319;
	bh=ScX6tmH+TYFIA4SdeDcX5TAQpdwZEO/9NVN1KgaB3hw=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=cLoF5su3stWT+hb6nfTtHwBwrrKHZLRDbQwUroh5t+iFCfiCUD0Z8tIlOkamuIlxG
	 qeOHzEJ58YbyS317GkjyofK7fQ13HHHwF0legf9LOkfvpwVI1TCV7BT/w9fiu/TkE8
	 lOCBfrOUmSVswJYFE8RtOExm4LjdPdpKByrpZFPY=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260608100839eucas1p26efb0e1085dba36943f16284a4fee98b~3EzpgqhjL2726127261eucas1p2t;
	Mon,  8 Jun 2026 10:08:39 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260608100838eusmtip2364ad82459e2916175d35315bdcac074~3EzoopYD61119811198eusmtip2K;
	Mon,  8 Jun 2026 10:08:38 +0000 (GMT)
Message-ID: <2c036c0e-8246-4e55-90b0-97ba8ef46115@samsung.com>
Date: Mon, 8 Jun 2026 12:08:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pwm: th1520: Lock clock rate with
 clk_rate_exclusive_get
To: Maurice Hieronymus <mhi@mailbox.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda
	<ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Drew Fustini
	<fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-pwm@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20260605-rate-exclusive-get-th1520-v2-2-695640bf7249@mailbox.org>
X-CMS-MailID: 20260608100839eucas1p26efb0e1085dba36943f16284a4fee98b
X-Msg-Generator: CA
X-RootMTR: 20260605070115eucas1p14ef31f75a9597be42bda6c6597fc7e38
X-EPHeader: CA
X-CMS-RootMailID: 20260605070115eucas1p14ef31f75a9597be42bda6c6597fc7e38
References: <20260605-rate-exclusive-get-th1520-v2-0-695640bf7249@mailbox.org>
	<CGME20260605070115eucas1p14ef31f75a9597be42bda6c6597fc7e38@eucas1p1.samsung.com>
	<20260605-rate-exclusive-get-th1520-v2-2-695640bf7249@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_030843_404490_EED81479 
X-CRM114-Status: GOOD (  10.39  )
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



On 6/5/26 09:00, Maurice Hieronymus wrote:
> The driver derives period and duty cycle from the clock rate read at
> probe, so a later rate change would silently miscompute waveforms.
> Switch to the new ExclusiveClk wrapper to hold the rate for the lifetime
> of the driver data and drop the corresponding TODO.
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
> ---
>  drivers/pwm/pwm_th1520.rs | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 

Reviewed-by: Michal Wilczynski <m.wilczynski@samsung.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
