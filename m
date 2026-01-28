Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E70ED35693
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 10:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2KixMafTszUlvN2PkjdbOXmGAJmpfYFkyyZg/67lNC8=; b=gK3LkorZU5z6ib
	Sb9Bn7SxUkx2q3T/LBy4JiifP0OqlNmJKWhxUOKI+H6szGjrX75RLipcQdFibYK0vE1ERLq2iiCA2
	gAFwIPweoCX/x7QFsZTT8XNEhDOrSLAYTgNr7AgAp3ZiF3JluSGlI+yFE1pTZVeaQgJqjnHj9aZhH
	fKMRA6pbtixBNJAHg6zRHMdUJOhmn1rMNgQwCIxI8JXigYY8n24IWlSmHOv9xgbaMQqF6q4q3mfKj
	Olt5DWdMOCw3L0f5eaMZJRGlhtnbAwHdLFFTzS88MuJYWnvhCPbkIOxoeuO3gpmSKtVpf9UYr4njE
	CNFu5UwKIqAhK9PWVWvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3BP-0000000FsNL-42XX;
	Wed, 28 Jan 2026 10:53:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3BN-0000000FsN1-3b10
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 10:53:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F17BD600AA;
	Wed, 28 Jan 2026 10:53:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1510AC2BCB0;
	Wed, 28 Jan 2026 10:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769597636;
	bh=VTLd7vd+WPNn7NR0v8u7rGagToa/9uYN3+K/raVxK/Q=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=MQQqeZn/PS82H2I0BiwGmgQ0Es/plFXiloDRMKmpxzUhvqPevwbL542+5QITNyZtU
	 up/j2BkdX6VCiLztlMVnpPhqwdy/BhsErmW0jHE2rVRNULmxfLtrZ0skQN27sluyP6
	 a95zFRg1votKHCV6STIz1NUYtanysA/u9krLZ7CX0hKyiG1PUn6ZE+vHeARq0xVehX
	 sXXnInrrgikf+WNsUYJqhwIlbS65UdHhXdx/hEwE5PHDMEkhzwm1W0tR/NgOwkhJwr
	 logbW9QpMlEbl5C2uoY/5E6fCXt1GBQDTD6BWIqUVTnykJkc0f/oEGVzYl63/LjXtF
	 wlaKiS7SLYHvg==
Mime-Version: 1.0
Date: Wed, 28 Jan 2026 11:53:48 +0100
Message-Id: <DG0607SU943F.1FDOPYPN38FCS@kernel.org>
Subject: Re: [PATCH v2 1/5] gpu: nova-core: use checked arithmetic in FWSEC
 firmware parsing
Cc: <linux-kernel@vger.kernel.org>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Dirk Behme" <dirk.behme@gmail.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-riscv@lists.infradead.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
 <20260126202305.2526618-2-joelagnelf@nvidia.com>
In-Reply-To: <20260126202305.2526618-2-joelagnelf@nvidia.com>
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

On Mon Jan 26, 2026 at 9:23 PM CET, Joel Fernandes wrote:
> @@ -267,7 +264,12 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
>          let ucode = bios.fwsec_image().ucode(&desc)?;
>          let mut dma_object = DmaObject::from_data(dev, ucode)?;
>  
> -        let hdr_offset = usize::from_safe_cast(desc.imem_load_size() + desc.interface_offset());
> +        // Compute hdr_offset = imem_load_size + interface_offset.

I do get the idea behind those comments, but are we sure that's really a good
idea? How do we ensure to keep them up to date in case we have to change the
code?

If we really want this, I'd at least chose a common syntax, e.g.

	// CALC: `imem_load_size + interface_offset`

without the variable name the resulting value is assigned to.

But I'd rather prefer to just drop those comments.

> +        let hdr_offset = desc
> +            .imem_load_size()
> +            .checked_add(desc.interface_offset())
> +            .map(usize::from_safe_cast)
> +            .ok_or(EINVAL)?;
>          // SAFETY: we have exclusive access to `dma_object`.
>          let hdr: &FalconAppifHdrV1 = unsafe { transmute(&dma_object, hdr_offset) }?;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
