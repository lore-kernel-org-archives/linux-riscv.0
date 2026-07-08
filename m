Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A131FC43458
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 07:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJ0NQbNuelctGk/bRrrybxKEy+JCHH3iiZjFv/g9hhk=; b=hevexM+pIX9/2O
	Xn2KjWqLARnK0c7W1LwmSv2QNddMYLN4eQZvu6ApzO1DMFiMRqb/DFhfItFDKZCK4IA8H7xzMvWwO
	Pm8biVkkHDPuz20XrYrb/4gZfKEF6B05nEedVrQyzqVcCe08jLwubdFVEi0xx3KgdPbB9PaTkeYEc
	d55MNd2iMNMOFC+nunh6ychQvZzltZL5PCwf83KT61cAqTg5EZt4sBMvnHqD6Z3dUv+oAPpgyKYkg
	nC6eyD742pbHurLyjGbecbg+XdhFViwNxEnNeD3nuHCcQZW/q+Kn8sEwi40p6NOrEhJ3wl4pGfxK2
	u9GsBWPRf1pSNe0ngGow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMsa-0000000GWWZ-13aj;
	Wed, 08 Jul 2026 07:39:36 +0000
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163] helo=luna.linkmauve.fr)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMsW-0000000GWW4-3UpG
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 07:39:34 +0000
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 1183CF40CC8; Wed, 08 Jul 2026 09:39:25 +0200 (CEST)
Date: Wed, 8 Jul 2026 09:39:25 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Guru Das Srinagesh <linux@gurudas.dev>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] pwm: th1520: use vertical import style
Message-ID: <ak3-rU3IRYaLTCC5@luna>
References: <20260705-pwm-rust-vert-imp-v1-1-753dbbfc6061@gurudas.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260705-pwm-rust-vert-imp-v1-1-753dbbfc6061@gurudas.dev>
Jabber-ID: linkmauve@linkmauve.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_003933_020410_72D6B8BA 
X-CRM114-Status: GOOD (  15.55  )
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

On Sun, Jul 05, 2026 at 07:52:05PM -0700, Guru Das Srinagesh wrote:
> Convert `use` imports to vertical layout for better readability and
> maintainability.
> 
> Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>
> ---
> Came across a recent commit bc58905eb07 ("samples: rust_misc_device: use
> vertical import style") and found a few more locations that could
> benefit from this cleanup. No functional changes.
> 
> Separating out patches per-subsystem as per the review feedback in [0].
> 
> Tested via:
> 
>     $ make LLVM=1 rustfmtcheck || echo "fail"
>     $
> 
> [0]: https://lore.kernel.org/lkml/20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev/
> ---
>  drivers/pwm/pwm_th1520.rs | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
> index 3e3fa51ccef9..2a3b107157ac 100644
> --- a/drivers/pwm/pwm_th1520.rs
> +++ b/drivers/pwm/pwm_th1520.rs
> @@ -23,15 +23,21 @@
>  use core::ops::Deref;
>  use kernel::{
>      clk::Clk,
> -    device::{Bound, Core, Device},
> +    device::{
> +        Bound,
> +        Core,
> +        Device, //
> +    },
>      devres,
>      io::{
>          mem::IoMem,
>          Io, //
>      },
> -    of, platform,
> +    of,
> +    platform, //

Same here, you just need the empty comment after time, not the one after
platform.

>      prelude::*,
> -    pwm, time,
> +    pwm,
> +    time, //
>  };
>  
>  const TH1520_MAX_PWM_NUM: u32 = 6;
> 
> ---
> base-commit: 1a4920940ebfd8d907858abd8f8dd09b13752946
> change-id: 20260705-pwm-rust-vert-imp-59a3d18bd0cf
> 
> Best regards,
> --  
> Guru Das Srinagesh <linux@gurudas.dev>
> 
> 

-- 
Link Mauve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
