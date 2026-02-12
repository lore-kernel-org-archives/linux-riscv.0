Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00004EB48EB
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Feb 2026 09:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jyso2rOupqYhIqW62mlF7WLYbKdD9GlweImkTMP14tc=; b=C9dDp7qUqwJFQY
	uA8l7tTW0nm6cSLspbdzZd7cXI5PRjGst3iQTa5Gz/WOq9O14C3uqJjfTtoBJAIzSDAhYjshoV8kp
	D0VrAgmySJVFC4DVv2zVwlI2/lFYyhWnzT6VnkkmRct3Ld1Qj5r4H+OHRdssEOzStA+CxwsXC0GhU
	quHskDg2lqPwnfYjKZl2k19h4gEN1wqIaxe2VVt/Y512mfz8ollVahwChJUHtYhpy8MHvEBdXlWY2
	/lXCPYhjasmxXc2PlvzdQZFPo27435XEjxJfF14BX5cNAvDKvDc7/A2FByu8aKsPLOobcl/5kZr93
	ypArT5wsV5SX1vn+2S9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqSv0-00000001pQs-1xOi;
	Thu, 12 Feb 2026 09:23:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqSuy-00000001pQl-1h4L
	for linux-riscv@lists.infradead.org;
	Thu, 12 Feb 2026 09:23:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C68460010;
	Thu, 12 Feb 2026 09:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A151BC19424;
	Thu, 12 Feb 2026 09:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770888203;
	bh=Bd0vkkESwpTKZrM6Vj4/m5riIZawL87UTsB4+AHYnNg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=tu8+kgNTsI25fjEIsePbpW59UwxIvafjlf1pasP2zMu512PKeIgPylM/1OArUzV6T
	 vf/ycxcTeVizc6s4S3CnGwKJS4UDfVhHqOj4BHC3HIVQdyfjr3HbQTM+iPghBAGWsc
	 vUIzJH4quJs90SP6wD5GFiadmkJlIRKdmOjuYZx0KcOjryG0S5fq4+lhH3yrEEHP8n
	 WoFhQqjaPatTkRju6OnjsCIWDVehxF8EiDB8nrUdvlRm5PNubZV6+hPXWC4wtMYwqf
	 DeYNpb4bIDz8lByRQXpC/fVg8EmZfmZozq0mNVeOGBi5y/RK+4jkixgwHk15ZDoYK5
	 r0Q42I2WSLPXg==
Mime-Version: 1.0
Date: Thu, 12 Feb 2026 10:23:16 +0100
Message-Id: <DGCVH2B2OSFR.1C912TO7G7DGL@kernel.org>
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
To: "Maxime Ripard" <mripard@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
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
In-Reply-To: <20260212-obedient-faithful-koel-d8aaf6@houat>
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

On Thu Feb 12, 2026 at 8:59 AM CET, Maxime Ripard wrote:
> On Wed, Feb 11, 2026 at 05:47:09PM +0100, Danilo Krummrich wrote:
>> On Wed Feb 11, 2026 at 5:37 PM CET, Maxime Ripard wrote:
>> > I do think we can find a compromise though. Miguel suggested for example
>> > to make the current enable/prepare/disable/unprepare function unsafe,
>> > and that's totally reasonable to me.
>> >
>> > Then we can implement the "managed" clock version on that unsafe API,
>> 
>> What do you mean with "managed" clock? Do you mean devres managed? If so, I
>> don't think there is any reason to switch to the unsafe API to be able to
>> implement devres managed APIs (see also [1]).
>> 
>> [1] https://lore.kernel.org/all/DFVW9MS5YLON.CVJDBYQKJ0P6@kernel.org/
>
> By that, I mean what Daniel has been proposing to achieve with this series.
>
>> > and we would end up with a "raw", unsafe, version kind of equivalent to
>> > the one we have today, and where callers would have to justify why their
>> > usage of the API is actually safe, or the new, managed, variant that is
>> > safe and can be easily used by most drivers.
>> >
>> > And we can call these RawClk vs Clk, or Clk vs ManagedClk, or whatever.
>> >
>> > How does that sound?
>> 
>> What about we just wait until we have a user that really requires an unsafe API
>> for some reason? And if it never appears, even better. :)
>
> It works *today*.
>
> And the "oh but driver is using the API" is kind of ironic in the
> context of the Rust bindings which have globally been in that situation
> for years. You can't argue it both ways.

I can't remember ever advocating for merging code that does not have at least a
user in prospect.

> Either way, I'm not sure what the point of that submission was if you
> will just dismiss diverging opinions, including attempts to compromise.

Sorry -- I'm a bit confused here, since I did not submit this code.

I'm also not dismissing your opinion; I just have a different one.

In particular, I don't think we need an unsafe API until we see a concrete
example where the proposed safe API does not work (and no other safe API would
work either).

Framing a difference in opinion as "dismissing diverging opinions" doesn't feel
fair to me.

> Do whatever you want, but it's really hard to root for you some times.

I'm starting to wonder if the mail is addressed to me in the first place.

Thanks,
Danilo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
