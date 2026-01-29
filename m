Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC66D46C01
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 00:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k4WyKkvr4GqWvhEB+C3yqSOZHs5s7z6yaF9Gl7o0Nuc=; b=rkM4Gt7UR1Ndot
	Yh30P/osEq9MmaJVt9bq0x9Gy8no8KCFOpsZdoDHy1RdN/xMWqzolSt6ioF6kzvUMPQrLU0TtXXFa
	PDEVqOtvTTu2uKg6c2cV7VKBo68Uzlz/HU0gu7ZMXuH7AzpNhIrAecNVrHySffUxEJiJQRuDk/e1D
	X8IQEh46VzTnvpZ9JofhAovjOGJgfvYrYajHTmL+Zo+nkngeO8HKsUaK4HXYcN3IMjX5zPKRR6tWV
	zqRSBivmM/2dsRR6cN7Q+25JjLTYGyHd46DXRqu4mHhyIGNvStGX6zpa4v4f5pa3vYZnylqrK4KW0
	gbv57Mx1+BKdVLpI0Flg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFlr-0000000GxyD-3rSd;
	Thu, 29 Jan 2026 00:20:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFlq-0000000Gxy6-2crt
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 00:20:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71F7A6001A;
	Thu, 29 Jan 2026 00:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5174C4CEF1;
	Thu, 29 Jan 2026 00:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769646025;
	bh=Lpd9kC+1aougw4btdvzon7ENBBCLCGY+Jd5QG33v4yw=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=bJVinoa06mK4xDCvuVXnFC/HzeXb5E5HreC05Ge7Gbap+2Ww2i1UazpaSSuCwpbxX
	 prY4MV0AbboQIm7vAP+TP3ycwQ0JJMqBwzQqF/3LWLYE25Cvi/QLp3qZjaHPMubdAl
	 RHrTVZI5hWzMVTNqcYq4RSuckDQCz9eYgIceqaB9e5CsCzioNaOl2vsIjQb2x936Q5
	 yvt6K+CGz0VTgy45y+Wm1TbAEerZjmxQkMUQsCoI3qii5c+y9JlOI9R9aGW84ddTNl
	 6xA7u54/EFrClsJyDkB8/vijBmalgJ3b/wVJcQL1pQwZoK+tLWgF21G12W1J8RxAi3
	 fR/ne5i7l1Zsw==
Mime-Version: 1.0
Date: Thu, 29 Jan 2026 01:20:18 +0100
Message-Id: <DG0N5PNS1ZQ0.13WMT4XYDXNUS@kernel.org>
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
Subject: Re: [PATCH v2 1/5] gpu: nova-core: use checked arithmetic in FWSEC
 firmware parsing
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
 <20260126202305.2526618-2-joelagnelf@nvidia.com>
 <DG0607SU943F.1FDOPYPN38FCS@kernel.org>
 <259bdacf-d16e-4fff-9f6b-f860feb40aa8@nvidia.com>
In-Reply-To: <259bdacf-d16e-4fff-9f6b-f860feb40aa8@nvidia.com>
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

On Wed Jan 28, 2026 at 4:14 PM CET, Joel Fernandes wrote:
> On 1/28/2026 5:53 AM, Danilo Krummrich wrote:
>> On Mon Jan 26, 2026 at 9:23 PM CET, Joel Fernandes wrote:
>>> @@ -267,7 +264,12 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
>>>           let ucode = bios.fwsec_image().ucode(&desc)?;
>>>           let mut dma_object = DmaObject::from_data(dev, ucode)?;
>>>   
>>> -        let hdr_offset = usize::from_safe_cast(desc.imem_load_size() + desc.interface_offset());
>>> +        // Compute hdr_offset = imem_load_size + interface_offset.
>> 
>> I do get the idea behind those comments, but are we sure that's really a good
>> idea? How do we ensure to keep them up to date in case we have to change the
>> code?
>> 
>> If we really want this, I'd at least chose a common syntax, e.g.
>> 
>> 	// CALC: `imem_load_size + interface_offset`
>> 
>> without the variable name the resulting value is assigned to.
>> 
>> But I'd rather prefer to just drop those comments.
> The idea of adding these comments was to improve readability. However, I 
> can drop them in the v3, that's fine with me.

Yeah, that's why I wrote "I get the idea". :) But as I write above, I'm
concerned about the comments getting outdated or inconsistent over time.

Besides that, it more seems like something your favorite editor should help with
instead.

> Do you want me to wait for additional comments on this series, or should 
> I make the update and repost it?  Thanks,

As mentioned, I tend to think we should just drop them, but I'm happy to hear
some more opinions on this if any.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
