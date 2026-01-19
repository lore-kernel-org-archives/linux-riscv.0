Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88A0D29C30
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 14:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=erxfulKdfWnqyc+mulwufK2JOhM59vx/HNeIfnzmOn8=; b=InQHJq8uZ16xkY
	SzvHOtvowofzApSLJOdva8a/CuXyiiPjskL8WMz3UanW7fq+HKTbblBdHQbMg0syrfT2V13RpWwGt
	Eh4irGhHdZuFFIJ9wTrQc7cKCAmYzQbiChWaFEHtOoVxDhKQ3uqQD3SGjIgWwfIXG+SuYij7oLgAe
	Rz9qMj+fyA4PPX5hbexcT3p7KDmsz0Q3aFMMg9BYj8jR3iYg/sgcdRQqiSAb2Faj+JumujUGhUROw
	a85cHakUm792A2I8WvLAogZV47dErFgzJCiMsbXMweDml9THL8SIhvppNy5vvBcee7mcbEYH5w3Oj
	q64j2jwT3G+BJ0Nzsyzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqNl-00000002HK8-25K0;
	Mon, 19 Jan 2026 14:37:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqNg-00000002HJW-3mCq
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 14:37:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D1C841AD3;
	Mon, 19 Jan 2026 14:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64A4C116C6;
	Mon, 19 Jan 2026 14:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768833444;
	bh=CSTmPBA6jWnROZuwiJTIQySlhBcVu9NnVrQTCL3GAR4=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=g+EN7LOJd5DlifzhjK5E3WGKGFyat9PZSAr8WAdmz92XyVQwA0sE/+zXvsfHrjksQ
	 OzdVmrMR3A/aRfcu/3/a0yumSxnw0rPX+iBlowxF1yAGR8zh/F1xYC90p+YvxlsH3O
	 wMLpMieaxjyyQMQeCeBS1XOvZKPKITy9j2MgViu9ZHZow3Ud3u7Gv8+AziAiCXF8so
	 En3otoLhwMVyrfC6vukQRGMfXLyhBp3d5j6ey6aacwOFGcn+gDlSVGFgm1iS1mX6DW
	 e7vP5v4tJCpBSILrj/cOdTfMrqHDnqSUfdzt0XVst1ej3wx6AJUgrv8QMkU5OLUF5/
	 HWAhYAbPvnOuw==
Mime-Version: 1.0
Date: Mon, 19 Jan 2026 15:37:17 +0100
Message-Id: <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, "Viresh
 Kumar" <viresh.kumar@linaro.org>, "Maarten Lankhorst"
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
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat>
 <aW4lCfUyumOKRRJm@google.com>
 <518D8B09-B9A1-4DB4-85CD-37A2DD3D5FB1@collabora.com>
 <DFSLCI9U4NCW.2HI2UPUI7G134@kernel.org>
 <20260119-weightless-pelican-of-anger-190db0@houat>
In-Reply-To: <20260119-weightless-pelican-of-anger-190db0@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_063726_262243_499F0C76 
X-CRM114-Status: GOOD (  20.37  )
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

On Mon Jan 19, 2026 at 3:18 PM CET, Maxime Ripard wrote:
> On Mon, Jan 19, 2026 at 02:13:48PM +0100, Danilo Krummrich wrote:
>> On Mon Jan 19, 2026 at 1:54 PM CET, Daniel Almeida wrote:
>> >> On 19 Jan 2026, at 09:35, Alice Ryhl <aliceryhl@google.com> wrote:
>> >> I think that if you still want an API where you just call enable/disable
>> >> directly on it with no protection against unbalanced calls, then that
>> >> should be the special API. Probably called RawClk and functions marked
>> >> unsafe. Unbalanced calls seem really dangerous and use should not be
>> >> encouraged.
>> 
>> +1; and unless there is a use-case that requires otherwise, it should not even
>> be possible to do this at all -- at least for driver code.
>
> I mean, it's great, it's safe, etc. but it's also suboptimal from a PM
> perspective on many platforms. It's totally fine to provide nice, safe,
> ergonomic wrappers for the drivers that don't care (or can't, really),
> but treating a legitimate optimisation as something we should consider
> impossible to do is just weird to me.

I said that an unsafe API with potentially unbalanced calls is something we
should clearly avoid for drivers. This is *not* equivalent to "treating a
legitimate optimisation as something we should consider impossible".

If we discover use-cases where the current API doesn't work well, we can
invenstigate further.

>> > I think we should discourage RawClk if at all possible. But if the consensus
>> > is that we *really* need this easily-abused thing, I can provide a follow-up.
>> 
>> I think we should only do this if there are use-case with no alternative, so far
>> there haven't been any AFAIK.
>
> I don't really care about which alternative we come up with, but look at
> devm_regmap_init_mmio_clk for example. It is a valid use-case that
> already exists today, and has had for more than a decade at this point.

I don't see the issue with devm_regmap_init_mmio_clk()? It takes a reference
count of the clock and prepares it when called and unprepares the clk in drops
its reference in regmap_mmio_free_context() called from the devres callback.

That something we can easily do with the current API, no?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
