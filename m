Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92F1606A322
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 11:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lyAeTnjK;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=QOsdKTOv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9R9odl75bA86+2xfIEoGoOXPI7laid9IA1emQ2UXhU0=; b=lyAeTnjKHOAj6AdAmOT27crZ8s
	tlvGvqhGUaq4MF7aGFHTSqJ35WCpXfLjfn8j3znQwrKvo/U4ozAbpov6errgeMh2KFvtfDC6nyBD9
	SU1R5QfOp4NRSqs74EFuSoSvuZOESt91nAjcmOqe6ZPk2Phg5u6jYoiwLJ6swAp0u3H1svwkGUuMJ
	cKNFZqC/ZqG2PttLyCfWmVxneUpuYnw3Cfo68K/yy7++PsJ0TuLL5fijcI1nqrUkYrpIhlXHhWL9q
	JIZbp5Z+z0NigbuBr7jTllNl4PmM625rCeKnU9zWFO7WUh+qF9r2VLcggxWvBFNT9xwN2MrzB8lkn
	yGO5v20w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNdx-00000000XGA-3dTc;
	Mon, 09 Nov 2026 11:34:33 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNdu-00000000XFX-2D6P
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 11:34:32 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261109113425euoutp01bea5cae00f6d43583748bfd8414d2c34~mXUgIdsbc2413424134euoutp01d
	for <linux-riscv@lists.infradead.org>; Mon,  9 Nov 2026 11:34:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261109113425euoutp01bea5cae00f6d43583748bfd8414d2c34~mXUgIdsbc2413424134euoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794224065;
	bh=cMSBSauqbPIE/ZS7qOVOkPsVpLXl08SzTSg0ECffbco=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=QOsdKTOvcEXJjFIVPtBXVB7EkA7Ikgde4s4uRTLilHEFAE/r/EC+evymPeqfY/VPN
	 nQ1TKx2DddFAJNF45VwroaRECbJSigX+8a/jHR8cAivTxUYaCtehmY36ryp3+VnBwN
	 ZRcqoTptiZleuWijLhncsvJm3oLfP9aT/qkTwSTM=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261109113424eucas1p108cb7261add005a44da39d455ce78c8b~mXUfeJBUJ1552515525eucas1p1e;
	Mon,  9 Nov 2026 11:34:24 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261109113423eusmtip1f076461a2dfd87689abe6a70506e3d63~mXUeio9gN1550415504eusmtip1U;
	Mon,  9 Nov 2026 11:34:23 +0000 (GMT)
Message-ID: <529993dc-343e-40ff-af88-aa1a91cab25f@samsung.com>
Date: Mon, 9 Nov 2026 12:34:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] rust: pwm: track the owner module when registering
 `Chip`
To: Priya Bala Govindasamy <pgovind2@uci.edu>, fustini@kernel.org,
	guoren@kernel.org, wefu@redhat.com, ukleinek@kernel.org
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com,
	work@onurozkan.dev, elle@weathered-steel.dev,
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, ardalan@uci.edu, zhiyunq@cs.ucr.edu,
	dzueck@uci.edu
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <f9cf8f0d897f22888134b2b17f1b0f86bcda311a.1793150685.git.pgovind2@uci.edu>
X-CMS-MailID: 20261109113424eucas1p108cb7261add005a44da39d455ce78c8b
X-Msg-Generator: CA
X-RootMTR: 20261028222851eucas1p160ae9a88fe903d5947ab6b7a75078ced
X-EPHeader: CA
X-CMS-RootMailID: 20261028222851eucas1p160ae9a88fe903d5947ab6b7a75078ced
References: <cover.1793150685.git.pgovind2@uci.edu>
	<CGME20261028222851eucas1p160ae9a88fe903d5947ab6b7a75078ced@eucas1p1.samsung.com>
	<f9cf8f0d897f22888134b2b17f1b0f86bcda311a.1793150685.git.pgovind2@uci.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_033431_180376_621E11D5 
X-CRM114-Status: GOOD (  23.12  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 10/28/26 23:28, Priya Bala Govindasamy wrote:
> `UnregisteredChip::register` calls the C function `__pwmchip_add`
> to register a PWM chip with the PWM core.
> `__pwmchip_add` documents that its `owner` argument is supposed to
> be `THIS_MODULE`, but `UnregisteredChip::register` passes
> `core::ptr::null_mut()`. This is acceptable for built-in drivers.
> 
> However, for loadable drivers, registering the chip with a null owner
> prevents the PWM core from taking a reference to the owner module when
> a PWM is requested or its character device is opened.
> This means that the owner module can be unloaded while references to the
> chip remain. This can lead to use-after-free and
> kernel panic.
> 
> Fix this by marking PwmOps as a `#[vtable]` trait so each implementation
> exposes its actual OwnerModule, then pass that to `__pwmchip_add()`.
> 
> Fixes: d8046cd50879 ("rust: pwm: Add complete abstraction layer")
> Reported-by: Dylan Zueck <dzueck@uci.edu>
> Assisted-by: LLM
> Signed-off-by: Priya Bala Govindasamy <pgovind2@uci.edu>
> ---
>  drivers/pwm/pwm_th1520.rs |  1 +
>  rust/kernel/pwm.rs        | 11 +++++++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
> index 728993998446..6a1f4219d6fa 100644
> --- a/drivers/pwm/pwm_th1520.rs
> +++ b/drivers/pwm/pwm_th1520.rs
> @@ -94,6 +94,7 @@ struct Th1520PwmDriverData {
>      clk: Clk,
>  }
>  
> +#[vtable]
>  impl pwm::PwmOps for Th1520PwmDriverData {
>      type WfHw = Th1520WfHw;
>  
> diff --git a/rust/kernel/pwm.rs b/rust/kernel/pwm.rs
> index 8aa47304bec3..ae7b449d67e4 100644
> --- a/rust/kernel/pwm.rs
> +++ b/rust/kernel/pwm.rs
> @@ -12,6 +12,7 @@
>      device::{self, Bound},
>      devres,
>      error::{self, to_result},
> +    module::this_module,
>      prelude::*,
>      sync::aref::{ARef, AlwaysRefCounted},
>      types::Opaque, //
> @@ -175,6 +176,7 @@ pub struct RoundedWaveform<WfHw> {
>  }
>  
>  /// Trait defining the operations for a PWM driver.
> +#[vtable]
>  pub trait PwmOps: 'static + Send + Sync + Sized {
>      /// The driver-specific hardware representation of a waveform.
>      ///
> @@ -673,9 +675,14 @@ impl<T: PwmOps> UnregisteredChip<'_, T> {
>      pub fn register(self) -> Result<ARef<Chip<T>>> {
>          let c_chip_ptr = self.chip.as_raw();
>  
> -        // SAFETY: `c_chip_ptr` points to a valid chip with its ops initialized.
> +        let owner = this_module::<T::OwnerModule>().as_ptr();
> +
> +        // SAFETY:
> +        // - `c_chip_ptr` points to a valid chip with its ops initialized.
> +        // - `owner` is the module implementing `PwmOps`. It is null for a built-in
> +        //   implementation or a valid module pointer for a loadable implementation.
>          // `__pwmchip_add` is the C function to register the chip with the PWM core.
> -        to_result(unsafe { bindings::__pwmchip_add(c_chip_ptr, core::ptr::null_mut()) })?;
> +        to_result(unsafe { bindings::__pwmchip_add(c_chip_ptr, owner) })?;
>  
>          let registration = Registration {
>              chip: ARef::clone(&self.chip),

I have managed to reproduce this issue and can confirm it's fixing the
problem.

Code wise seems OK.

Reviewed-by: Michal Wilczynski <m.wilczynski@samsung.com>
Tested-by: Michal Wilczynski <m.wilczynski@samsung.com>

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
