Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7193CA0EED
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 03:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uIfh5F5NveZBjjla//IGae7xEjZMD57NpW5uC2jvjDc=; b=QVIujODuaDZU/s
	/JOBJsioucP9XHQMq6R9LRUbPSZ+PgIpSUw7WIdQ6DzWebybWZAkAfjE1ZMkuU51VYVUMGeaV2MZ/
	Zvi8bEmrES4g5u5DOxa4YNjPZp0NVzcC7huBqpLRbLpAaY5X2oUZvq3JM1njGxm1kzhLi+mZXB6EQ
	c8RLyzmLo32Af80RcNuiDRaq+gJd1JYgnIFJpXgyN3bmZBbTvxzB5ZGd51fQ+TayfBdXhoH/gSE53
	m6jHFqi7HDR7hm6ZJ0cYCZaexJkxMllkfz3GWhxRfkrJstbNpsWEaX1/i7/IHm2JUFRk0dtiF+5AC
	TzRGlfhinkMo/izgLXfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIZv-00000001PPl-13mF;
	Fri, 22 Aug 2025 03:36:35 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDso-00000000kXt-1W9i
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 22:35:48 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250821223541euoutp01c0fa87733f675bea5433f8e0f4cf1e90~d6R0pm_LN1258912589euoutp01O
	for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 22:35:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250821223541euoutp01c0fa87733f675bea5433f8e0f4cf1e90~d6R0pm_LN1258912589euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755815741;
	bh=3i+hbzU8RFcDzVjqMTUidVYvZwJLP627miUufKiWjKc=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=EchqXJIdjhi1/Rw0fXBY4CmZy/EKm7bSiCYPGO6TfZECD3oYg/iML48fWFfMqa3I7
	 t2wIHPc19loWlcJZJcWdc/4W1E7qVDkq6Nq5nGrRRsmjeCZS1vxbybhe+tp0+ol05T
	 dxyzlS99qMR05oryn84X5fjsF8q8XCW5bIWMish4=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250821223540eucas1p2887283df2fcd024bb24a0034bebb99ce~d6Rzr2R6r0984009840eucas1p2k;
	Thu, 21 Aug 2025 22:35:40 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250821223539eusmtip2f1a4ec8a2273c2e74d641e183d0914e9~d6RynamBV3047330473eusmtip2H;
	Thu, 21 Aug 2025 22:35:38 +0000 (GMT)
Message-ID: <78ffebda-744b-4a1b-9676-82f46c2d29d1@samsung.com>
Date: Fri, 22 Aug 2025 00:35:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 3/7] rust: pwm: Add complete abstraction layer
To: Elle Rhumsaa <elle@weathered-steel.dev>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Guo Ren
	<guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
	Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
	Ghiti <alex@ghiti.fr>, Marek Szyprowski <m.szyprowski@samsung.com>, Benno
	Lossin <lossin@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Drew Fustini <fustini@kernel.org>, Daniel Almeida
	<daniel.almeida@collabora.com>, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <aKY58dUO0RsoOqGb@archiso>
X-CMS-MailID: 20250821223540eucas1p2887283df2fcd024bb24a0034bebb99ce
X-Msg-Generator: CA
X-RootMTR: 20250820083544eucas1p233f8b8f7d1c0b59acededa3572d632aa
X-EPHeader: CA
X-CMS-RootMailID: 20250820083544eucas1p233f8b8f7d1c0b59acededa3572d632aa
References: <20250820-rust-next-pwm-working-fan-for-sending-v14-0-df2191621429@samsung.com>
	<CGME20250820083544eucas1p233f8b8f7d1c0b59acededa3572d632aa@eucas1p2.samsung.com>
	<20250820-rust-next-pwm-working-fan-for-sending-v14-3-df2191621429@samsung.com>
	<aKY58dUO0RsoOqGb@archiso>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_153546_999384_D26E9B55 
X-CRM114-Status: GOOD (  16.80  )
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



On 8/20/25 23:11, Elle Rhumsaa wrote:

>> +/// Wrapper for a PWM device [`struct pwm_device`](srctree/include/linux/pwm.h).
>> +#[repr(transparent)]
>> +pub struct Device(Opaque<bindings::pwm_device>);
>> +
>> +impl Device {
>> +    /// Creates a reference to a [`Device`] from a valid C pointer.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// The caller must ensure that `ptr` is valid and remains valid for the lifetime of the
>> +    /// returned [`Device`] reference.
>> +    pub(crate) unsafe fn from_raw<'a>(ptr: *mut bindings::pwm_device) -> &'a Self {
>> +        // SAFETY: The safety requirements guarantee the validity of the dereference, while the
>> +        // `Device` type being transparent makes the cast ok.
>> +        unsafe { &*ptr.cast::<Self>() }
>> +    }
> 
> This looks like the only constructor for `Device`, and it has restricted
> visibility.
> 
> Would it be helpful to provide a doc-test here to show intended usage?
> 
> After looking at the C code, it looks like the raw `pwm_device` pointer
> is extracted from a `device` struct, or stored in an array of
> `pwm_device` pointers.
> 
> Is the intent that the `pwm_device` will always be allocated from C
> code? For example, is a `pub fn new() -> &'a Self`-style constructor
> not possible/desired?
> 

You're correct the intent is for pwm_device to be allocated and managed
by the C core. The Rust code only ever receives a raw pointer to an
existing device during callbacks.

For this reason, a public new() constructor isn't appropriate, and the
from_raw function is pub(crate) for use only by the FFI adapter. A
doc-test is also impractical since we can't create a valid pwm_device in
a test environment.

> Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
