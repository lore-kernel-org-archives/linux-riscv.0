Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3BD1099B37
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 20:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uts/74/bPPQwTQA31FNEaeNlvNz8DmI9Fh6AmYs65xs=; b=BdcSJWBpEdtahD
	rbMk/BVAXZhfc4xnWYrGQSgqZB24m5Arz/O7jAg+RCkZTec8OZNQY65zVcagCBi7cGfqO0mlvAFN0
	eWTLJX9hSkeJvXKnATFMifMG9VKiG3scCgDMQhjKv/G9uIjZMXR90CkEVZeS5RxUnrRSR7+8SdxYP
	mvFuwBw5IIJRrG4auStli29yIfkseafeNtp7aUvAurZqsOZOHCYnZ0pjNB5DaH9c66ZGwOTsU6cnG
	Rc8jNN8wYOPvMC/Ps7m+HM9Mudoj2vg1kqrChd+StnAk2HjVYnQHRctRVqA9U7om77uWcE01FkPi2
	/wSpZ3fva4WERCG9x3Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3g8J-0000000DXuG-3O5H;
	Fri, 20 Mar 2026 20:07:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3g8H-0000000DXu9-49VH
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 20:07:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4791660126;
	Fri, 20 Mar 2026 20:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E747C4CEF7;
	Fri, 20 Mar 2026 20:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774037265;
	bh=inZTQJe4zuAFmmL8Gqg6qde5cdu4bKf0//clHRq44X8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vNNeD3kxXp97fjr1kQd28JjQl4S+SsY66HXuj/Oqt6+DLoaqg9EPBqMQ4mdAkQCSS
	 O1BX3tOYcWeMc1UeP+/Z2y3Gz8J4f1+8kqV+fQQrkVaXm8YvPjRwVelq2Rukp5dEYU
	 bQe2WUEV1V0AIC2F4yK5Z57fQhBvdmSKDbYhj1Wo16NgLYZFAqU8bo2uFd5ktMFVNW
	 XhSx6JJRIFdIe5ESjiiOOBdHxKvrKHxnQ0p1Cqu4YSDf99tkVPt1HrhJOTpM/XMIHu
	 +o7EzYCrsZVco1V9HzDrOoDQNTDDQ4n4rxHiSa9+Setl3LAtQFiPSk4ro8PMwD90uv
	 MPe48Y7YieQhg==
Message-ID: <354b3e67-9bfb-4538-a865-695ebec6b433@kernel.org>
Date: Fri, 20 Mar 2026 21:07:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/10] gpu: nova-core: convert falcon registers to
 kernel register macro
To: John Hubbard <jhubbard@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20260320-b4-nova-register-v2-0-88fcf103e8d4@nvidia.com>
 <20260320-b4-nova-register-v2-8-88fcf103e8d4@nvidia.com>
 <8f9da1e2-fb86-4653-b702-333fc920af58@nvidia.com>
 <ba3c5689-5e34-4097-8823-c37a48a4f358@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <ba3c5689-5e34-4097-8823-c37a48a4f358@nvidia.com>
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

On 3/20/26 8:52 PM, John Hubbard wrote:
> On 3/20/26 10:38 AM, Joel Fernandes wrote:
>> Hi Alex,
>>
>> On 3/20/2026 8:19 AM, Alexandre Courbot wrote:
>>>      /// Reset the controller, select the falcon core, and wait for memory scrubbing to complete.
>>> @@ -616,9 +462,10 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
>>>          self.hal.select_core(self, bar)?;
>>>          self.hal.reset_wait_mem_scrubbing(bar)?;
>>>  
>>> -        regs::NV_PFALCON_FALCON_RM::default()
>>> -            .set_value(bar.read(regs::NV_PMC_BOOT_0).into())
>>> -            .write(bar, &E::ID);
>>> +        bar.write(
>>> +            WithBase::of::<E>(),
>>> +            regs::NV_PFALCON_FALCON_RM::from(bar.read(regs::NV_PMC_BOOT_0).into_raw()),
>>> +        );
>>>  
>>
>> Overall, I think the series is good improvement but I still feel this part is a
>> step back in readability, and we should come up with something better. I don't
>> think there's any chance anyone can memorize this syntax.
> 
> I must reluctantly (because I know this conversation has gone very
> long, across so many versions) agree. That .write() statement is just
> brutal, and we will be relying on AI in order to even figure it out,
> I fear.
> 
> I'd hoped that there were other, simpler forms to express this,
> is that not the case here?

I mean, it is barely different from the above, except for the
WithBase::of::<E>() argument instead of &E::ID.

It becomes much more readable if you break it down (which is what we should
probably do):

	let boot0 = bar.read(regs::NV_PMC_BOOT_0).into_raw();

	bar.write(WithBase::of::<E>(), regs::NV_PFALCON_FALCON_RM::from(boot0));

For other cases where we read a register and write the same register we will
have a way in the future that can omit WithBase::of::<E>() entirely, see also my
reply in [1].

I want to expand write_reg() to also be able to handle variable offset
registers, e.g.:

	let reg = bar.read_reg(regs::NV_PFALCON_FALCON_RM::of::<E>());

	// modify reg

	bar.write_reg(reg);

[1] https://lore.kernel.org/all/DH0XBLXZD81K.22SWIZ1ZAOW1@kernel.org/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
