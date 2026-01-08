Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7A1D148BE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 07:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:References:In-Reply-To:
	Subject:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+50JNW1C3PYhYqbi621v4UajPS2Hn83Rfgp+V1uOyV8=; b=2s1ewgHj8583Q3
	7TU+J8mFc7WsGxGNm3NmGNJHVFryFd/QI7TKRJpxfz/GTAFJCyYQpF+KGFncKvRQWjiwD3ATZgqUh
	ehchYFGF8n1cQ6y8yqG0mOPpNR4o9WsUdd1l2ltE4PRVzodiOE85NQwJmocxw75TIDXK5zFewoion
	0lIXFw7A8l3W0ljeDhBjU3WL2P4pXoIvotXKQJj1qTpbdGN7SOjmKJQpsGlAz0iLDCvezD1sqq3Mc
	0YOQx6HUbKQ8OaOvNzktHgLJ6VpzGzJN4rCOIfh48pnsO7kltnzOs9604AsLDYxtcEpu5CE99Phk6
	Dw8g1ao4koD2q0Tcqsqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdkpm-0000000G9Uy-2pad;
	Thu, 08 Jan 2026 07:53:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdkpk-0000000G9U8-1qoC
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 07:53:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7BE906000A;
	Thu,  8 Jan 2026 07:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CA84C116C6;
	Thu,  8 Jan 2026 07:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767858807;
	bh=nDXnKNmAJw0ktNPTmlWu+Kn+sJ7O1F/SsAeUoE2v82g=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=OlN06fkJI0hxv93SXzC+CYpIP/kFOQcISMk2RWljUBx/d0ktBFoLB7U2Ba2WHU3AT
	 7xbOdIou+i8HnYwGPBLJxcKDDQfqyCK6jNuXRtrQTvVV8o6tlNvxCKEbX1Zsvk2w4e
	 t0BlUPrRHZSGiIH/xFeq1I7tWleZ01Vbtz3Q/L51bmRbIfR5p2Mj+D2yFFzQeH589f
	 cBNIM5g/4pyh2Yzbuy7yVwPQwRiXUm8RA9UipWoy8T+6vOC2i1D9qEaigqw5pqPsZ8
	 O/cQsxG/rnZKhGOtG45dyrVXFNITrxin/pU4T1VDYCulX2npFOb4zizxLsgkNFWXzt
	 bV6gZ5IN8YoEw==
Message-ID: <8bc73ccedec95c7054fb6e38e72d865a@kernel.org>
Date: Thu, 08 Jan 2026 07:53:22 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
Subject: Re: [PATCH v3 3/3] rust: clk: use 'kernel vertical style' for
 imports
In-Reply-To: <20260107-clk-type-state-v3-3-77d3e3ee59c2@collabora.com>
References: <20260107-clk-type-state-v3-3-77d3e3ee59c2@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, rust-for-linux@vger.kernel.org, "Alice
 Ryhl" <aliceryhl@google.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Benno
 Lossin" <lossin@kernel.org>, =?utf-8?b?QmrDtnJuIFJveSBCYXJvbg==?= <bjorn3_gh@protonmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Danilo Krummrich" <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Drew Fustini" <fustini@kernel.org>, "Fu Wei" <wefu@redhat.com>, "Gary
 Guo" <gary@garyguo.net>, "Guo Ren" <guoren@kernel.org>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "\"\\\"\\\\\\\"\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"Rafael
 J. Wysocki\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\"\\\\\\\"\\\"\"" <rafael@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Stephen Boyd" <sboyd@kernel.org>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Trevor Gross" <tmgross@umich.edu>,
 =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWc=?= <ukleinek@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 7 Jan 2026 12:09:54 -0300, Daniel Almeida wrote:
> Convert all imports to use the new import style. This will make it easier
> to land new changes in the future.
> 
> No change of functionality implied.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
