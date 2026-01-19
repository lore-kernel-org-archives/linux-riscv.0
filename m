Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830FCD29C27
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 13:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sgPrdujt2BhGAERbXM87cvXAdHi/zBu144ftQ55kCVA=; b=Q/2LdB/+VMaEaw
	1OtQKHm0XtsEUo+oFQC62sk5LnTM3HO+VwDPZrQbm+kzuNWoer+QUbJQVLw5JMf+fiqW/s2uYntmC
	2ol71KI/bhvXhg3a00IyzMbgiKgQ8YbK9BdJE9R6oqdA+wC0W8gVtpvKFYaGdDWy+Ruf5mAYF3yNd
	4W8dUpE6gVopq0Xxyk4baliD/DME7Wfu0WwvCZJZ++9DbYpM6SCJAyziWU4qKVTs+nBfYPNTlGWPG
	neh/u21CC1Cojsz7h/nouVtsw+yhMxfKtvTzXDnfDsq1NohCiA/APaZKaKPrNo2caHnvZ4r0vg/VG
	uCf9YUDfISlFWOeeCjyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhp51-000000028oc-3DvB;
	Mon, 19 Jan 2026 13:14:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhp50-000000028oU-2IjY
	for linux-riscv@bombadil.infradead.org;
	Mon, 19 Jan 2026 13:14:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+CgZWcmNGygQjfD27T+jBsRojt6pw3uvENO+XS4NxvM=; b=qcK7jqfKIiKVetg/GYrRQIXBFc
	8qCpC3U6PjdtGvonvWaU/nDATxgtRmMkv4+HOBqSA/fEbXVD/8gJHrS5GXhSGjwMVfOv3FYruKFTm
	TtFB1lzz33lUeBi1bqE0N1ZoMC3z0Ps3xFMxP1mhBJcU47MnFKXrRWaa0a/4WUQdzyxA3PO4/CUvc
	ZavIrYFzVPlTWe5cHY/YBSqi9qmFtB3CcTVkIhk/utlFljcrmi64wtOd9rXuFI5r5OFFEHU/88swk
	/gq+rgLPIM9GRCje2pgu9Eq405UXuxEwM71z+1rz0aiqyVwFsjCKkfY80XRYWchDsgASBRSn4CjpU
	UfXkNc1g==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhp4x-0000000C9Du-2P94
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 13:14:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E0324090E;
	Mon, 19 Jan 2026 13:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1A7C116C6;
	Mon, 19 Jan 2026 13:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768828435;
	bh=+CgZWcmNGygQjfD27T+jBsRojt6pw3uvENO+XS4NxvM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=XXNWw6OBkSaH02cWAwZjvJOZJZXBsqeN2f6csk5pLRwKU5shzpE2NsU3v9YEDJPsH
	 HxcwDQK7tfuapzHJdyV+rrcU0+Zk3kVTeosGsJkNUBJx435U7ra+OcGeR+pY8ZKOQ9
	 8TxtniuuKmJqYxSO1/7NavnefBHny0TvTF+OOQHEdgAimnSmdAqtcpBm8PucbDJIPf
	 9WiKs0Lota3kNRR8lNBq1JsrnWksFx/gDG9myqT+rW7Gd+EjT9DDu/Fabd0IcdQZyb
	 ENN4Eoo2lb4iuTU98WnZi+/J3/RPgApwF0FqMzEtPGu+zO7NKR7n0dGkPsaRXw1whH
	 gO9xFz8YVSIrg==
Mime-Version: 1.0
Date: Mon, 19 Jan 2026 14:13:48 +0100
Message-Id: <DFSLCI9U4NCW.2HI2UPUI7G134@kernel.org>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "Viresh
 Kumar" <viresh.kumar@linaro.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Drew Fustini" <fustini@kernel.org>, "Guo Ren"
 <guoren@kernel.org>, "Fu Wei" <wefu@redhat.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-riscv@lists.infradead.org>,
 <linux-pwm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat>
 <aW4lCfUyumOKRRJm@google.com>
 <518D8B09-B9A1-4DB4-85CD-37A2DD3D5FB1@collabora.com>
In-Reply-To: <518D8B09-B9A1-4DB4-85CD-37A2DD3D5FB1@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_131359_808281_FE88753E 
X-CRM114-Status: UNSURE (   9.26  )
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

On Mon Jan 19, 2026 at 1:54 PM CET, Daniel Almeida wrote:
>> On 19 Jan 2026, at 09:35, Alice Ryhl <aliceryhl@google.com> wrote:
>> I think that if you still want an API where you just call enable/disable
>> directly on it with no protection against unbalanced calls, then that
>> should be the special API. Probably called RawClk and functions marked
>> unsafe. Unbalanced calls seem really dangerous and use should not be
>> encouraged.

+1; and unless there is a use-case that requires otherwise, it should not even
be possible to do this at all -- at least for driver code.

> I think we should discourage RawClk if at all possible. But if the consensus
> is that we *really* need this easily-abused thing, I can provide a follow-up.

I think we should only do this if there are use-case with no alternative, so far
there haven't been any AFAIK.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
