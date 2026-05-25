Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C80CD5BC9
	for <linux-riscv@archiver.kernel.org>; Mon, 25 May 2026 15:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R6v5MjKSDFIvHdCgfVTr3hUrivp0i+4HxZo0QrEzT2E=; b=gzvheKwt5Si/c2
	zAtyvvOHlbe+b3Gk9Bpm/jeK0DzUGKrPsTk4qye1i2mkrPzIw/KBebUMUQME41rP7eW+0BiVZ6783
	Xl6ioUhZvO8n2Nd8QFm04QOc3DNYOrfl5ud1GBsmrjUPiK78K9RzIgqETK83sZoH0UhY4B3Gaz45f
	fz5AqIwK87bUnugKOTbqy0HB5MBYcr0PRh8PB7iWyOgba0MRMOMrGtaV/72MOAkilQ4x0LZMQHQC6
	UsV0RsffZhE/O6G1lm+zCmrUlGVzFSr3Lnn7TMQ0nr7jmo+6yDY9NEvlwOce2HuJsCmswM7Hjxtp3
	ukWWtNBWiYXf1VmY1j+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRXaf-0000000HYz6-2CyD;
	Mon, 25 May 2026 15:51:41 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRXac-0000000HYyO-3m9W
	for linux-riscv@lists.infradead.org;
	Mon, 25 May 2026 15:51:40 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gPL365gBbz9tVg;
	Mon, 25 May 2026 17:51:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779724290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5RdoKRVA0x+8aY6CRCa2zCHTLS3bM8eE7lJ8vvT0HdQ=;
	b=Xtn6Tjah3hYLA/WGRvRXSLCa7rRkeRKodfO+c2pfCdDn3E5Dl4nwc3MLlcxUGNC5W/15ZG
	KdtGzKShoyCBeCRBX5O7yQ317VfoMzZOq2M5aw6ng6G9wSccgOve2GHwCbkQAPWxc5/kmF
	9B22dbd/3yeZt9dHOKDmXg2i0eI3GetzroqMxK35lFrJiRxq6Vbg7CogNZZ/KZNrR8MRzi
	/71ZdwR72XWeeF7W5JxbYoU8o5/DnckjUMT3yOwmXBTGbnYu7fYam9JvT9RBYMu+QkBmWm
	1ShmqQwhFHu/PS7eiYSncde5wu5U4L6OOJaPmgcfn+35+oOdKIT4o9LUcie55g==
Message-ID: <1f550af5b8d1fa2aaa9936d5b0010c156e0cb455.camel@mailbox.org>
Subject: Re: [PATCH RESEND] pwm: th1520: Remove requirement for
 mul_u64_u64_div_u64_roundup
From: Maurice Hieronymus <mhi@mailbox.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini	
 <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>,  Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=	
 <ukleinek@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng	
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross	 <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Mon, 25 May 2026 17:51:23 +0200
In-Reply-To: <8857fc45-b787-4661-b27b-8976e655f7c9@samsung.com>
References: <CGME20260525131112eucas1p1d7e4836f71c81686e1f71e4007e344ec@eucas1p1.samsung.com>
		<20260525-pwm-th1520-fix-v1-1-814e537c6812@mailbox.org>
	 <8857fc45-b787-4661-b27b-8976e655f7c9@samsung.com>
MIME-Version: 1.0
X-MBO-RS-ID: 8c55d0b8313bfffa87e
X-MBO-RS-META: owyy74by9dsuncukaxyh5xfh3b4yw1k4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_085139_079165_6C9E027B 
X-CRM114-Status: UNSURE (   9.33  )
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

On Mon, 2026-05-25 at 16:36 +0200, Michal Wilczynski wrote:
> 
> To move forward, we should fix this by implementing the proper
> generic
> 64-bit math helper in the Rust abstractions, rather than narrowing
> the
> types here. Are you open to looking into adding the Rust equivalent
> for
> mul_u64_u64_div_u64_roundup instead?

I would be definitely down, to help with that.

Before I start working on it, a couple of clarification questions.

Should I implement this as a thin FFI wrapper calling the C-Functions?
Or do you prefer to have a re-implementation in Rust.

Since mul_u64_u64_div_u64_roundup is a macro: Is it okay if this will
be a small Rust function or should it be a macro as well?

Thanks a lot,

Maurice

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
