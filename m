Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50531EE3686
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Feb 2026 14:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:Subject:From:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Q1nvU79FvU0m8ZrV7MAGKm+U1WwccIDXAjJvCU7uyc=; b=m6ZotAuD0Vevg9
	LXpxhmZa1Fvq1EaPTROzCS8LdnNmPJJC6IIYNtMc7R691vU6MtJ9YTa5XYFSGXt2V5WH4/J1TsEz8
	4OZQbCHQFbZ96OqzfS4QQNxqts2NOFDtNvubVPx2rp6IPFjWkPsBLxBqbD117QbzfwDfbI42S52vc
	NYlNWMVdhW5kRkEjr2MBQjZnEzXL+/+5r1G4l7TUSgAec/SlN1dHwq3lxTEQ2kLOgVJhSxXTWizuh
	T6ii/TsJ9tfhnx2P+UVOAVbm8hlPn5Eq1pXNzmGb+HKmEkHWkreYw/eZ7ixvOrEeqtSx3hpiE14b+
	NRlyu2SRUbS/xLfaYgIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqXGI-00000002Aua-1moL;
	Thu, 12 Feb 2026 14:01:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqXGF-00000002AuF-325n
	for linux-riscv@lists.infradead.org;
	Thu, 12 Feb 2026 14:01:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 00DEB42BA0;
	Thu, 12 Feb 2026 14:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 816CDC4CEF7;
	Thu, 12 Feb 2026 14:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770904898;
	bh=q255LW2NGXZnwgvkPm1VB5LcqPE0iLSjOErv9KPVwLg=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=IhB2vmVh93ZzFpYfLyXgfCB1XI973SeOPjXHCjdMvT2tc/eMxFyIfieVCzaYm9z17
	 phvUwl525/GGPCwGxxssIVFbsLg9YhPKbEE3Q8vslSuE05Ax1ZJpEJPzzXHKmhnDjz
	 GnNQ/5wPMCZA72tf8pP0BZ818qNi1T/mtVUVSj99ln+pejsM4nmFLFGEZLZffsvtb8
	 D1hs/Pcb5sezJw9Zk+jcqSLGODjIaeyrlE3lG7EIw7afLqgzfunbQPgLoxpUamwnjH
	 wYtae+6pWDPbVZD80Fzzap5GAkaWR8AxZZWF6V0PBAZT/zqdZ+13TP1yt0RK5k96Bo
	 sxC/eW4sbF2Zg==
Mime-Version: 1.0
Date: Thu, 12 Feb 2026 15:01:31 +0100
Message-Id: <DGD1E42JOSQ3.28RPL84IP5R9I@kernel.org>
To: "Maxime Ripard" <mripard@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
Cc: "Boris Brezillon" <boris.brezillon@collabora.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Viresh Kumar"
 <viresh.kumar@linaro.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Drew Fustini" <fustini@kernel.org>, "Guo Ren"
 <guoren@kernel.org>, "Fu Wei" <wefu@redhat.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-riscv@lists.infradead.org>,
 <linux-pwm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
References: <20260119-weightless-pelican-of-anger-190db0@houat>
 <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org>
 <20260122-majestic-masterful-jaguarundi-d0abde@houat>
 <2F3D3A40-6EF9-46FC-A769-E5A3AAF67E65@collabora.com>
 <20260204-nickel-seal-of-poetry-8fdefb@houat>
 <91A92D84-1F2E-45F3-82EC-6A97D32E2A78@collabora.com>
 <20260204-angelic-vermilion-beagle-fd1507@houat>
 <20260209105047.693f2515@fedora>
 <20260211-flawless-feathered-boar-0b87ad@houat>
 <DGCAAE4YEDLO.299F5M641E90B@kernel.org>
 <20260212-obedient-faithful-koel-d8aaf6@houat>
 <DGCVH2B2OSFR.1C912TO7G7DGL@kernel.org>
In-Reply-To: <DGCVH2B2OSFR.1C912TO7G7DGL@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_060139_791137_F9E3DFE0 
X-CRM114-Status: UNSURE (   7.61  )
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

On Thu Feb 12, 2026 at 10:23 AM CET, Danilo Krummrich wrote:
> In particular, I don't think we need an unsafe API until we see a concrete
> example where the proposed safe API does not work (and no other safe API would
> work either).

One additional note for clarification, I'm not saying that I'm against an unsafe
API if it is necessary.

In fact, I have added an unsafe API for drivers myself with the dma::Device
trait [1]. This was not an easy decision and I discussed this back and forth
with a lot of people and, unfortunately, we had to come to the conclusion that
any attempt to make this safe from the Rust side of things would cause
unreasonable overhead and can't be considered an overall improvement.

But as I said, I am convinced that need clear evidence that an unsafe API is
actually needed and that there is no reasonable alternative.

[1] https://rust.docs.kernel.org/kernel/dma/trait.Device.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
