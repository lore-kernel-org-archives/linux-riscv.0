Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3BAFA373D
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Nov 2022 10:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XQoIcfMPB0g9EXHVlIBdJK/ox8R4NyF+MbBW8QLV4v8=; b=A0sBzy56H/XUOs
	N9sU9efq+1Kl1LqEHBeQBiwnwv+kCDjnmJn9vbNzEYGIsDbaV5Lj6+DPbAah7uRetuhI+IKO5GW7H
	UKTr48Z5cvH13hc0RE2sgHXIJx3A4YXjLKxPimU5jSucfrLS6gOM1uViYRky0EmGiNLXB/U24PKlr
	ivjPLlYmxRSBbApNmleToPGQQgHfulyXK758bPPR6/mFSMiwHFYFdfx/nJZSlEMZQJToCn+/6hFVm
	JQcS5tphnncn8SOahrjHX0wFX5JhWynzay8G223qqRnIaIC/5WrMLq9jr+wH8lmLfEjPaItEvv+No
	svxSrGgH92Sxm4rrurlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opoT1-00431M-Rd; Tue, 01 Nov 2022 10:25:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opoSy-0042yU-W5
	for linux-riscv@lists.infradead.org; Tue, 01 Nov 2022 10:25:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A289BB81B24;
	Tue,  1 Nov 2022 10:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05363C433D6;
	Tue,  1 Nov 2022 10:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667298354;
	bh=wuKVljKjoo7CAAmKnvqimj5ML/p0XtMG3b5AT3FNiUY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LxemJVvdkhMX7mQG7YrD7OhJTl018mDRPPfuNier9VdFZq706+whpaX5vkhxs3RgO
	 MW5qG6mHDBbeXex0HU7hCbmqx4qr1Y2f/NiZoPzkZF780j9kmCqxmpqVHi6m6dMoS6
	 VTmHWKZQIHkir6qQtrH69BvaSuchdSWItHMjOSoOklExu/VJ8cBkNIXUV8PCOmSl+v
	 Ikz80ACkSpSqcDtKrZRgfz0TTmdhT2WdT7Pi8QyTK3B8Pt9HMeUPhJXqXNH3QS7WFs
	 PdnrQDRm/eyQtWsmfLSJ/4XUkby64XZRV2mBVkuidUb34gbCsEN3KVs+pl0Vk3opb7
	 kTA4oWvf3QSfQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, Alexandre Ghiti
 <alexandre.ghiti@canonical.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: riscv: Document the sv57 VM layout
In-Reply-To: <Y2Dg5fYVfhoJmOX3@debian.me>
References: <20221031180230.1420544-1-bjorn@kernel.org>
 <Y2Dg5fYVfhoJmOX3@debian.me>
Date: Tue, 01 Nov 2022 11:25:51 +0100
Message-ID: <87zgdbt1hs.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_032557_194639_71DC09A6 
X-CRM114-Status: UNSURE (   7.07  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QmFnYXMgU2FuamF5YSA8YmFnYXNkb3RtZUBnbWFpbC5jb20+IHdyaXRlczoKCj4gVGhlIG1lbW9y
eSBsYXlvdXQgZmlndXJlIGFib3ZlIHNob3VsZCBoYXZlIGJlZW4gaW4gdGFibGUgZm9ybWF0IChp
dCBpcwo+IHdyaXR0ZW4gYXMgc3VjaCwgaXNuJ3QgaXQ/KToKCkknbSBub3Qgc3VyZSwgZ2l2ZW4g
dGhlICI6OiIgKHZlcmJhdGltKSBmb3IgdGhlIG90aGVyIHRhYmxlcy4gSSBmb2xsb3dlZAp0aGUg
dmVyYmF0aW0gbGF5b3V0IG9mIHRoZSBwcmV2aW91cyBzdlhYIGxheW91dCBkZXNjcmlwdGlvbnMu
Cgo+IEhvd2V2ZXIsIGZvciBjb25zaXN0ZW5jeSwgb3RoZXIgc2ltaWxhciBmaWd1cmVzIHNob3Vs
ZCBhbHNvIGJlIGNvbnZlcnRlZAo+IHRvIHRhYmxlcyAoYXMgc2VwYXJhdGUgcGF0Y2gpLgoKWWVz
LCB0aGF0IGNhbiBiZSBkb25lIGFzIGZvbGxvdy11cCBwYXRjaGVzIChhbmQgYWxzbyBhZGQgU1Yz
MikuCgoKQmrDtnJuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
