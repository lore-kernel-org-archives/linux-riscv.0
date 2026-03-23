Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A557EC01CB
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 11:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hEgqbF2WZd/AoIF6PIH+xIj/RlEv+7LE+lpuPdGuMEc=; b=fd0a8h5T+IFnzv
	GMu8u+kmY/crhyHlyALTxrIfScpK1r1cesjBPQjmHo2o1Wl0TanLadG5qBUnHMIgu1JSWsgoCslBq
	qKjLvyK5fSizRVEeq+xEvTJ+f6s3WmhHxvSP70M/xarxF3LMYJGvI07F6HZfmzUPbXKOGnvejfN59
	4f2uoIbktvTY4FbjsHrhVXa4UVqYCYRN2Lj0VcXDGw4dMXfaWW9mHihlZh9UbPqXle2sHIkJwQCSQ
	q6YQ5pCtLi6sXOalWhjPWXTFLyTmAP54PYKiSp2i/HUQ2gg7rrHEdZoi7YuflIHWUe49C4/Db0aJa
	5gNWi4hQ9BYmRFY2NbaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dLe-0000000GcDl-1GZM;
	Mon, 23 Mar 2026 11:21:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dLd-0000000GcDc-0kJr
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 11:21:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D1F4600AC;
	Mon, 23 Mar 2026 11:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757F6C4CEF7;
	Mon, 23 Mar 2026 11:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774264888;
	bh=ms8SURZjK2TNwnwC4VHjTeboaZrJo14MJa9t1jjQSjU=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=rzIblu2Mx3mzCx8Tb95ri9WGjs4az9ufrC9qOTQnVXrj3zkA2lMOi8JOO7ZA97dsK
	 XjtcZbe1nzWnGGqDCdSZ8O+x/Ga6Uew9vi35dPTkuO519tM2PN5zwfZvAUKjFUrB7Y
	 jPfJkZifwjdtkbPB4wcQ/Zgo2pJJhvdVA6yS77iXSgp3PD7Ek80DKss7VksuXGsjGL
	 9WL2aqabOgIdUfAXsc2vN+bhAjYcPRPJRaqS06fjMq0dBQSkCkXY5wIX2kHit9zy4q
	 aBFFp1JttHtoR7K/nwbikiWLCSQkiY7e9bXLNOs9lWwBXFifVsYno4PNWJNIwYKD8c
	 TyU7RO7URnWZQ==
Mime-Version: 1.0
Date: Mon, 23 Mar 2026 12:21:21 +0100
Message-Id: <DHA4EQAOO8QW.3AFGNJZFQX6N7@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-doc@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 01/10] gpu: nova-core: convert PMC registers to
 kernel register macro
References: <20260323-b4-nova-register-v3-0-ae2486ecef1b@nvidia.com>
 <20260323-b4-nova-register-v3-1-ae2486ecef1b@nvidia.com>
In-Reply-To: <20260323-b4-nova-register-v3-1-ae2486ecef1b@nvidia.com>
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

On Mon Mar 23, 2026 at 12:07 PM CET, Alexandre Courbot wrote:
> -impl TryFrom<u8> for Architecture {
> +impl TryFrom<Bounded<u32, 6>> for Architecture {
>      type Error = Error;
>  
> -    fn try_from(value: u8) -> Result<Self> {
> -        match value {
> +    fn try_from(value: Bounded<u32, 6>) -> Result<Self> {
> +        match u8::from(value) {
>              0x16 => Ok(Self::Turing),
>              0x17 => Ok(Self::Ampere),
>              0x19 => Ok(Self::Ada),
> @@ -155,23 +151,26 @@ fn try_from(value: u8) -> Result<Self> {
>      }
>  }
>  
> -impl From<Architecture> for u8 {
> +impl From<Architecture> for Bounded<u32, 6> {
>      fn from(value: Architecture) -> Self {
> -        // CAST: `Architecture` is `repr(u8)`, so this cast is always lossless.
> -        value as u8
> +        match value {
> +            Architecture::Turing => Bounded::<u32, _>::new::<0x16>(),
> +            Architecture::Ampere => Bounded::<u32, _>::new::<0x17>(),
> +            Architecture::Ada => Bounded::<u32, _>::new::<0x19>(),
> +        }
>      }
>  }

Can this use bounded_enum!()?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
