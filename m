Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E0BD715EA
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jan 2026 13:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wn/lkR8u4c21zdrNVr8bnjJnIzUTc63dx2ol44MoDRE=; b=Km4n6Ta7bGYcRi
	mL0AWipfxU6VXKvHccrHPCEYNE+LkxXTE5nXc9hUTtEX9naOEvYyqspCGWUxRi2QkHOLRalvWqsa9
	9OFmfowTIzvx+9jM8jjyMNgOz2+puI8beTo5s7VxWmUiXKuEO89SRgvsz7JBzjot/gerK6Nz0G5gx
	bqzPF+Dr3S1nHD2RPQigcdZ4ognMvC7oRsIjzpVBP9KLju0fiTJivO1qhyyi0RLXYYOaa99IYUZ4E
	t5jNlC02x0ZbYD6JyRaTy8vM9VmkN9gJQ597OO+UJkeVU/FCiGs2uHeXo0SojtIcMOJiI8twRDkyi
	gQAvU7EbiRGO0D8vOg8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjdhw-0000000AHsd-2ZLZ;
	Sat, 24 Jan 2026 13:29:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjdhu-0000000AHsJ-1YUC
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jan 2026 13:29:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 32EA0406E9;
	Sat, 24 Jan 2026 13:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 147B8C116D0;
	Sat, 24 Jan 2026 13:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769261381;
	bh=WuVDWxE1MFEQyWLSNVYwC/Xc2H589TKTJgLy9InRQRE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Gb9UBnZF4xTb1ngAYRQHI1osVNTq+aL4eNcHF65vr8h5CXhWhXaM2CUodyUBucK11
	 TulrjPZbuFBIAU5Z+mDUjKTgVqYfcJDD0D5SzhinpNaoVOCyooCLRXQlLd8c+ghTkb
	 zIMoIbUJQx3bEoD4ZQ+w4h026BNrn8Af3gBMuOPrJ2JT4ipRFPOCT6J/kFpdrVYjkh
	 muJfeJ26j/ONbnOfW3xupkVidZ/FiUnY7lwb/PAPjnPYsgULHgJcxooYkysgoKQMlr
	 3oGXjs8s/ET3a59SvVou/4b0/0RshlbGJ92jjCRMUc7nepczA42KADvlOd+KE5QNy6
	 B/ooxyTeWyKCw==
Mime-Version: 1.0
Date: Sat, 24 Jan 2026 14:29:34 +0100
Message-Id: <DFWUTANX4HBS.QIN5BJPI5MAO@kernel.org>
Subject: Re: [PATCH v2 7/8] gpu: nova-core: remove redundant `.as_ref()` for
 `dev_*` print
Cc: "Gary Guo" <gary@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Lyude Paul" <lyude@redhat.com>,
 "John Hubbard" <jhubbard@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-riscv@lists.infradead.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260123175854.176735-1-gary@kernel.org>
 <20260123175854.176735-7-gary@kernel.org>
 <DFWUC9ZS6CCU.3HPTNAO7CU41S@nvidia.com>
In-Reply-To: <DFWUC9ZS6CCU.3HPTNAO7CU41S@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_052942_435114_0B3F9FC1 
X-CRM114-Status: UNSURE (   5.37  )
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

On Sat Jan 24, 2026 at 2:07 PM CET, Alexandre Courbot wrote:
> On Sat Jan 24, 2026 at 2:58 AM JST, Gary Guo wrote:
>> From: Gary Guo <gary@garyguo.net>
>>
>> This is now handled by the macro itself.
>>
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>

We should take this through drm-rust in the next cycle to avoid conflicts.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
