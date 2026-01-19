Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE3BD2ECF3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 21:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BxgsuAakULMlbM7Z7DobuVm8lagQhvHFRT1bGiz3h5I=; b=1svUgrhooPzoKb
	ZTqnmyDU4UK1gsnCrBhucnCox3IsDyiY9aUnzNzNTybADtE/AIilujNPhTIeXXZiFNPv14xiCrCzS
	uQBUdaMrFdzr6GAnyNaed5K7TcBEElpKQeMv/kcpkNKW7oW2N5D5+2QxyHCHDjM5BxFY0ZaFHgYEp
	rstP8MMKU/oU7KVg4g/r95Su6p7tocyfObjE2+PBWbFeq0XY+5S0XNVZOPgScH86pFTHcHMg91T6T
	ORcQnsVz7bcUuJynPedu1CEPweGESgBWU2ngfq0F6MPU3Slw6C5BmtbGlZOZOPgMw8atMrba6jwbc
	WGboFk9S9R83MzlHNWBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhx4u-00000002uq0-1ra0;
	Mon, 19 Jan 2026 21:46:28 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhx4Y-00000002upX-23rK
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 21:46:20 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260119214559euoutp018ccee4720aed9a9033248702da5931ff~MQAiWcUUw0782507825euoutp01F
	for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 21:45:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260119214559euoutp018ccee4720aed9a9033248702da5931ff~MQAiWcUUw0782507825euoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1768859159;
	bh=FiwIk5BBQQ9iPckGkn5Dt7hTifYvLcVxHD5dU0pMV5E=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Q9Xf8fbQ6xVsysLFDwsjw9red5LNE/4dOsmM6sweOLApnZwCpBccB68wd3WMnXddC
	 0sstwB7PMcjsb9GbEeeM3X8TzuvpDxJe9fT4KrkQ3dvNZa7JCTxLNeKutAEUPGONtT
	 YvPWGiPdsR2VcrU0fvTXCArpfNsRUtHtHYRWY64g=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260119214557eucas1p2a32532504042480c2809f13589fc9127~MQAhG-1kc1870218702eucas1p2W;
	Mon, 19 Jan 2026 21:45:57 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260119214556eusmtip2baec3b17eba8b350eca229f32831d134~MQAgH2fip0752007520eusmtip22;
	Mon, 19 Jan 2026 21:45:56 +0000 (GMT)
Message-ID: <90657b83-1cff-4c7d-adde-9b560c2be7c2@samsung.com>
Date: Mon, 19 Jan 2026 22:45:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] pwm: th1520: remove impl Send/Sync for
 Th1520PwmDriverData
To: Alice Ryhl <aliceryhl@google.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
	<lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross
	<tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida
	<daniel.almeida@collabora.com>, linux-clk@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20260113-clk-send-sync-v4-3-712bc7d94a79@google.com>
X-CMS-MailID: 20260119214557eucas1p2a32532504042480c2809f13589fc9127
X-Msg-Generator: CA
X-RootMTR: 20260113151335eucas1p157cd966c5f0f4e477fb11272810a0ae8
X-EPHeader: CA
X-CMS-RootMailID: 20260113151335eucas1p157cd966c5f0f4e477fb11272810a0ae8
References: <20260113-clk-send-sync-v4-0-712bc7d94a79@google.com>
	<CGME20260113151335eucas1p157cd966c5f0f4e477fb11272810a0ae8@eucas1p1.samsung.com>
	<20260113-clk-send-sync-v4-3-712bc7d94a79@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_134607_926473_7879E056 
X-CRM114-Status: GOOD (  19.59  )
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



On 1/13/26 16:12, Alice Ryhl wrote:
> Now that clk implements Send and Sync, we no longer need to manually
> implement these traits for Th1520PwmDriverData. Thus remove the
> implementations.
> 
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Cc: linux-riscv@lists.infradead.org
> ---
>  drivers/pwm/pwm_th1520.rs | 15 ---------------
>  1 file changed, 15 deletions(-)
> 
> diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
> index e3b7e77356fc2492077c519073e861beb3e44df9..043dc4dbc6232020195c7b73fad302bbb69652df 100644
> --- a/drivers/pwm/pwm_th1520.rs
> +++ b/drivers/pwm/pwm_th1520.rs
> @@ -97,21 +97,6 @@ struct Th1520PwmDriverData {
>      clk: Clk,
>  }
>  
> -// This `unsafe` implementation is a temporary necessity because the underlying `kernel::clk::Clk`
> -// type does not yet expose `Send` and `Sync` implementations. This block should be removed
> -// as soon as the clock abstraction provides these guarantees directly.
> -// TODO: Remove those unsafe impl's when Clk will support them itself.
> -
> -// SAFETY: The `devres` framework requires the driver's private data to be `Send` and `Sync`.
> -// We can guarantee this because the PWM core synchronizes all callbacks, preventing concurrent
> -// access to the contained `iomem` and `clk` resources.
> -unsafe impl Send for Th1520PwmDriverData {}
> -
> -// SAFETY: The same reasoning applies as for `Send`. The PWM core's synchronization
> -// guarantees that it is safe for multiple threads to have shared access (`&self`)
> -// to the driver data during callbacks.
> -unsafe impl Sync for Th1520PwmDriverData {}
> -
>  impl pwm::PwmOps for Th1520PwmDriverData {
>      type WfHw = Th1520WfHw;
>  
> 

I thought this was already merged :-).

Reviewed-by: Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
