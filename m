Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D68C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 11:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sce9Jg6+hPh13ayepK9IhHP3zBZr96STusOCTJpdPD4=; b=wAmJ0Ta/4TwYGI
	AbMRw7UBfg7Li+fkqUYz+4QjPC0tS/0LngfCNYgIcja/18liPJhnfxfbSzG4KN2DcFa/vQ+fZG2Oi
	P+XaYQFB2/527744bpjvIHUavW4IZMnrgMvQLidT19SFsc0Qrmgio8qSp6PfMaJm3QcLrJCHe3If5
	F6ti/nRLGaK6uKTrd6AisnNiKwvEPU2NvaDFlrCtIQgce+R2Mf0i6ufPvG1BM2CDUb+4FFHL/S1H6
	ZzE+sThZf1GW0moEizBCSErPoUS2DHRbAhA13ybILCWrlZxr5d4jZJbGIlXwYiw0ZZU+yjGJ6Rml7
	L2wIBaf3q5ESnDDv4AKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAY3-0000000EUch-3AFg;
	Mon, 29 Jun 2026 11:53:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAY2-0000000EUcb-2wAm
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 11:53:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 174DE43B4F;
	Mon, 29 Jun 2026 11:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 094651F000E9;
	Mon, 29 Jun 2026 11:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782733990;
	bh=o6rZLVkG1sq/4BZGymOihUcF9tHkCw2+D/PK2hEwG9Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jueRmeAk+vbC5qNPeX7tO6jKvFV/8324+x1OLpRIWY5VzmyzuM8/i//ek8l97AVqo
	 sZbnaels3qxfAhXkWu/pJ2KzTSYYwaqU3C+KEhugzxx689ISrGPOjOQewMTFf3R0LF
	 Usz3lYMji97dSUZmXQIa7Lznx9pENW56MXhhg9H6oPuxkgvfMO707xAcSfDt6FY+ye
	 RQ+LtyuWQkSvCP6NjEcNsFlKUTo7X/D1Q4UXm5DGQdQ9v0yeFHQfJy0mGuu+ynwBU3
	 SBeo3z3iRLCkF/K3QESRbVtaDKyEoBRLbAnMnBS3nALw3jCIM6UGlk0LsF5F/I3m36
	 MrMDYquGQvcJw==
Message-ID: <a9f1b6a5-ccf5-4bb1-96a8-54a3ed8f3f81@kernel.org>
Date: Mon, 29 Jun 2026 13:53:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpu: nova-core: falcon: store bar and dev in falcon
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Tim Kovalenko <tim.kovalenko@proton.me>, Alice Ryhl
 <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, nova-gpu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, rust-for-linux@vger.kernel.org
References: <20260625-drm-bar-refactor-v2-1-9db6b890d92e@proton.me>
 <DJLIEZJL9ZS6.J2642U4G4CT4@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DJLIEZJL9ZS6.J2642U4G4CT4@nvidia.com>
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

On 6/29/26 1:51 PM, Alexandre Courbot wrote:
> Danilo, any objection?

Please do,

Acked-by: Danilo Krummrich <dakr@kernel.org>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
