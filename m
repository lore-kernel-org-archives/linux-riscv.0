Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDF5C5AC82
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 09:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pI4IFd8zrrDXF2EmcyOYEWb7VP8wCQgn6Q28GJOHKQo=; b=f6SYAf2pdCZxXJ
	HnrABw7H/dC8g3M71x+MhLl+wm7I6oPlNwI7XTumnIS0Eyps+MoDIcDR63qpQOnlGFDm1cG/X8bfu
	iGzpSjBLoIBFBRrzPcz9DxKwJizO0QuQYk2HVnCSlBORx20vkSJRN6Z0E27SRehX4jf7JNQmWOAp/
	l0vXpiXfgFRtGGdR2MYxIOINpK6CvTIo0cnQ8mu1JNtaLpHY60ppshZMFiqIh0tE63fnayyMmb2Y0
	MzRUN7gkR7S+t4w7sFlSjFGOzC9YizHgD6k8KX5Atmxoo2Pw6IPd7q4XWL+ujLTUq58dux/AG0tqj
	Dw/mu3/lcIsq8i6rKkDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMWB-0000000BQL4-1vNC;
	Mon, 10 Aug 2026 09:42:03 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMW7-0000000BQKV-3RfB
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 09:42:02 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260810094154euoutp01f7d7ba3c13f27604320a18c0ac6060fd~KaFSXeIpJ1876218762euoutp01F
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 09:41:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260810094154euoutp01f7d7ba3c13f27604320a18c0ac6060fd~KaFSXeIpJ1876218762euoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1786354914;
	bh=AmOptGmSSwb48Q3nQS4iFyaNRaAar+3mAWyPKqr/PZc=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=ble4axPczDpJRsTJenkxPmIfVecz+JLi0iHpAR4YcF2TnitaLf9xU89sxJ2AwaBgZ
	 /JMG0I5RUxNOgAqqlbGedKylHLO58WWFx6CUtasFjhL8YGvVKF90lp9KTw8buQj1wm
	 QuYm6V7Vke4seybUzDddIxlxx2jCaqqmquQ/kQvs=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260810094154eucas1p14114a0cb677a4b4da96242f50cae88c0~KaFR42qow0110201102eucas1p1u;
	Mon, 10 Aug 2026 09:41:54 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260810094153eusmtip22c92126836a048d2e2c83409f520ae1c~KaFQzzhe_0770707707eusmtip2n;
	Mon, 10 Aug 2026 09:41:53 +0000 (GMT)
Message-ID: <7418f71a-cf53-4641-bdf3-e967e776b0a8@samsung.com>
Date: Mon, 10 Aug 2026 11:41:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pwm: th1520: use vertical import style
To: Guru Das Srinagesh <linux@gurudas.dev>, Link Mauve
	<linkmauve@linkmauve.fr>, Drew Fustini <fustini@kernel.org>, Guo Ren
	<guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Miguel Ojeda
	<ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel
	Almeida <daniel.almeida@collabora.com>, Tamir Duberstein
	<tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, Nathan Chancellor
	<nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20260721-pwm-rust-vert-imp-v2-1-9f91547f5e07@gurudas.dev>
X-CMS-MailID: 20260810094154eucas1p14114a0cb677a4b4da96242f50cae88c0
X-Msg-Generator: CA
X-RootMTR: 20260721074943eucas1p20eaf6768a8a3db90d29a9d45746554ab
X-EPHeader: CA
X-CMS-RootMailID: 20260721074943eucas1p20eaf6768a8a3db90d29a9d45746554ab
References: <CGME20260721074943eucas1p20eaf6768a8a3db90d29a9d45746554ab@eucas1p2.samsung.com>
	<20260721-pwm-rust-vert-imp-v2-1-9f91547f5e07@gurudas.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_024200_326967_F0B93E11 
X-CRM114-Status: UNSURE (   6.51  )
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

Hi,

On 7/21/26 09:49, Guru Das Srinagesh wrote:
> Convert `use` imports to vertical layout for better readability and
> maintainability.
> 
> Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>
> ---
> Came across a recent commit bc58905eb07 ("samples: rust_misc_device: use
> vertical import style") and found a few more locations that could
> benefit from this cleanup. No functional changes.
> 
> Separating out patches per-subsystem as per the review feedback in [0].
> 
> Tested via:
> 
>     $ make LLVM=1 rustfmtcheck || echo "fail"
>     $
> 
> [0]: https://lore.kernel.org/lkml/20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev/
> ---

Looks good to me,

Reviewed-by: Michal Wilczynski <m.wilczynski@samsung.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
