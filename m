Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C20E9B268
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 14:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fwOmYZiUOxaqXbNGMwuA/xfwsErwsQuJNuyBgjp4a4w=; b=xgNIPUkKIOcXuU
	ivf7oe2effqhDOdzTpwDPM30ptsfnMhK7ZWJDd9HNQtgqYPjsTbj7vLHEJm7rIQEFJqrUlEwoyvwC
	3H5GcWXkiQMCgSRpfRJcOL/FiiEzTMqZb6truA/vJv6HQaxWF20vBZH1+QZ13A2jbzwwyCwMH6UJW
	NOwhNwjGJDpwlOijhSP5NaQsTZDZQncOhpa25qmqlRVrhx45/nJqLCWrZ+YQhjNAnt3rc2lPsIm2X
	dS3KxoQ7AXroQpRcC8U5SojrViMJRpOwHIfv9mONrgK9dxUuSv1QUdyIkojMTDGTMvAcwLyJeUXdb
	db2Pmadw5yAM3pJ9sJGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutEM-00000002Biv-2O65;
	Tue, 24 Feb 2026 14:17:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutEL-00000002Big-0Qii
	for linux-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 14:17:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 037E36132D;
	Tue, 24 Feb 2026 14:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B305DC116D0;
	Tue, 24 Feb 2026 14:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771942659;
	bh=Ziv04o8VS9rUdSlEFBgCvXLaRDO3rJ1KOplJuFr+R3o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NPIVlNzVNNLKePtVD8OMqcBXS4ijT8gmOwyQMlsShZ60i4guSCKn00B9XsUgur9EU
	 bKFD6I1oxgNJynT2CefMnhAVv7YGyow6GJCk4YhDzaEaQ2q9NCP29iJeNXrCHjj1xc
	 y5g/NSRRwvL2Zpe+VVz/Yfjz3fM7BDxg9fwJ1YZMfETQIz2/bCCBNJ3vcpZPiuMAlM
	 CEN+n/qtJxRqNWHanNZ/3Z77xDfSOr9ipGTlnpUiITN5aWWlBYR4fP89IG7knk8Vbh
	 EmZMfyZkkOLeZRiitJF4fdjOJ1kW8IyPmJthvNcEhcFnCS/6GBlmlTWP+SNrM5QOoA
	 iF8v9kwT5ajLA==
Message-ID: <a354777f-6275-4b81-90b8-45268db22ffa@kernel.org>
Date: Tue, 24 Feb 2026 15:17:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] gpu: nova-core: remove redundant `.as_ref()` for
 `dev_*` print
To: Gary Guo <gary@garyguo.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Alexandre Courbot <acourbot@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, Lyude Paul <lyude@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Timur Tabi <ttabi@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org
References: <20260123175854.176735-1-gary@kernel.org>
 <20260123175854.176735-7-gary@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260123175854.176735-7-gary@kernel.org>
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

On 1/23/26 6:58 PM, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> This is now handled by the macro itself.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to drm-rust-next, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
