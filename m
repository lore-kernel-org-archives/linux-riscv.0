Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03328EC01C9
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 11:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vOGv0IkzwWeyosY7TebCdHfkruNlC3Zle3WlKeMbjxI=; b=ESpnH661hYFzr9
	kqYzT7iXu7R8ooDDcw7IEXfUd1pZGRu2uRn2dufsjg+5UBHnWoBuxqXTdONqXS8yUGApeq5dhh5hT
	kDQhiURxS9qkrb2ETGKeISDWQ7FJCfuCdBZfXYombDngwcDQOlemAi3qrU9HHROZgOLs6ZjMpKl7h
	qIKTyE3UawPz7WwUHNmNFps8Mu6UkSvpEmzLKYs+yQdibFEFkZuijgGzHArK/pS9d2d6akDjtmHkG
	bmPrQsjqX3SD8FMrkQr9wCzeXfaBVavZTOamTtd/202ry3JO78r3mNjUgkUH8OQ/o55lB/bWumDTZ
	C4OVQ6NB5jrizGuAHILQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dMQ-0000000GcIU-3EbA;
	Mon, 23 Mar 2026 11:22:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dMO-0000000GcI6-2b4n
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 11:22:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B02CE43CC2;
	Mon, 23 Mar 2026 11:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5093C4CEF7;
	Mon, 23 Mar 2026 11:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774264934;
	bh=go8U1XtnO0q6YRwkROqXDA629zNBZ7J7tyDxLbpQpm8=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=qganW63irxdnYI/+eikR1+lCUs8AqhHmM7rj2xJHEBn+59kLGkqSVYmZiDkVFBS95
	 cmca6THQy2FnHPFS6cd554eS7tXPqtyoq+Iv3eVHl927FQnLZpEbA8CkANFeInLSN6
	 RuoeDnlgp1nC1oswGglYZYIK46KcpyfG6JKX2fiL1PGSCToSmAqpdZGgACYfxF2l+M
	 1+YTwyn6WkWFVkSkcolOY7LdkYFaZzT+VPhU6dxKAlwk5xTsW2trRRUYXc85CgYshV
	 jKb3EVvd3uZQqa9qG75HZiv/dPoSAztGvEQthdpFZuU1Bk13gxytjEkUsuUPxnJhZ0
	 mQ23uAIOgGpgw==
Mime-Version: 1.0
Date: Mon, 23 Mar 2026 12:22:08 +0100
Message-Id: <DHA4FBLCHNG0.3D8IVG2GFQRLP@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 07/10] gpu: nova-core: falcon: introduce
 `bounded_enum` macro
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
References: <20260323-b4-nova-register-v3-0-ae2486ecef1b@nvidia.com>
 <20260323-b4-nova-register-v3-7-ae2486ecef1b@nvidia.com>
In-Reply-To: <20260323-b4-nova-register-v3-7-ae2486ecef1b@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_042216_679451_7E3BE55A 
X-CRM114-Status: GOOD (  11.10  )
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
> Introduce a powered-up version of our ad-hoc `impl_from_enum_to_u8`
> macro that allows the definition of an enum type associated to a
> `Bounded` of a given width, and provides the `From` and `TryFrom`
> implementations required to use that enum as a register field member.
>
> The next patch will make use of it to convert all falcon registers to
> the kernel register macro.
>
> The macro is unused in this patch: it is introduced ahead-of-time to
> avoid diff mingling in the next patch that would make it difficult to
> review.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs | 82 +++++++++++++++++++++++++++++++++++++++++

Why does this live in falcon.rs?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
