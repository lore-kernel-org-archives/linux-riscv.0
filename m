Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA46109C027
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 14:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oxswlu8H2KzyjU1HJnSlvMVkpdAVsrCEpP4ISg1vbvI=; b=e2SWZ1mQeAKlFO
	f88zUMYb0p4FQDxjWaGeEU0O3nSzgvC2I0MMxSw+x22uLmSkQA9p5ZHWaUGWiWCouNcD+WhsNYqqx
	gev2bXEHh8R8pT61mjy8c0Bix9i0djI5fi/L3qeLqmdiT4wGY8sbkaQyLYt9OOyvTkJwTz//Z5wCW
	zneXipn37yY8Q4dsMXRnmhYXugFHWRIFuEeG65nGqWKg5q4ta94Ir+eoGLBe0ifWUl8w6Bmm9hXUW
	dY0hw663RxWUJoOHXlw2oJaa9S5+tPBDCpBgMWRdFDdUCh4mg5Srzf9AJ89OQY1DCpXLhia2w17z8
	tMDB4h0WpPXS0xiJtDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PVi-00000003ehK-28xd;
	Wed, 25 Mar 2026 14:47:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PVh-00000003efu-0q1h
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 14:47:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A0DC60120;
	Wed, 25 Mar 2026 14:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65550C19423;
	Wed, 25 Mar 2026 14:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774450024;
	bh=JCkHCcMSXx/SH5QNREKTXs5UKLFyI2shlYFECOVHDjw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ACjLKRP6WLjmtHAUiVk6vUGQ8g4pcVYEy+cfD27z5i5FCrB5GOMtjuxiETqZGCgBC
	 d7WcctHAiUWcUUH0ERJEgJurResU9IJTn70DfWakzVF8TcZzXgMyVys3czZLoFSyVZ
	 EswJzzA7lry0SJGZGFQEzstvRxVixw5fToPLZ/C+cYOezjapKPKKpx13a11n/YgoDI
	 KWKjJ1b0qrRBEV8DmQt7IVlQ+P9uodoaxf6qwcbamMy0hMu03dwZEZ4blK9ruguDmA
	 LtkP8FvODGMcg4Un5llA/s0xq3CAcOe3XWLleTs/061c61euupBDiL8CbW+uVt/+jO
	 Eo8K06CPUdqGw==
Message-ID: <f3db51e4-b175-4f0d-b6d5-30970a57c173@kernel.org>
Date: Wed, 25 Mar 2026 15:46:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/10] gpu: nova-core: convert registers to use the
 kernel register macro
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20260325-b4-nova-register-v4-0-bdf172f0f6ca@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260325-b4-nova-register-v4-0-bdf172f0f6ca@nvidia.com>
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

On 3/25/26 3:46 AM, Alexandre Courbot wrote:
> Alexandre Courbot (10):
>       gpu: nova-core: introduce `bounded_enum` macro
>       gpu: nova-core: convert PMC registers to kernel register macro
>       gpu: nova-core: convert PBUS registers to kernel register macro
>       gpu: nova-core: convert PFB registers to kernel register macro
>       gpu: nova-core: convert GC6 registers to kernel register macro
>       gpu: nova-core: convert FUSE registers to kernel register macro
>       gpu: nova-core: convert PDISP registers to kernel register macro
>       gpu: nova-core: convert falcon registers to kernel register macro
>       gpu: nova-core: remove `io::` qualifier to register macro invocations
>       Documentation: nova: remove register abstraction task

Acked-by: Danilo Krummrich <dakr@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
