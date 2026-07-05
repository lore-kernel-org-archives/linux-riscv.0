Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EA1C43458
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 01:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lLBiHdTxAmoSt1ykIWIjA4/mAoH8wBSsHnYEzPE5Ayc=; b=GQ7fcbAz8RtxVi
	Hre0ySQ0lYlI0G9Q+q29930mGnLL+ZpLT90xr/mG/U5oCKVQSWskKU2GIp7KuT18Q1hKR3LCJruW+
	ymL1icpmVHdGD3GVW/mfMBDLeeCoFbKsckbvOIMTmB2rClPHO5zLUQLldIXG8AiRp0C7JvXy0kOkl
	2PLfmZsvlCZZ6H4QFP3CbGM9BEmyYrYHbrRstjBqYWjef47yi1XubbTlMXZzaYKm6RmWeJSySyLIu
	mHMTPTUh47ikpK3FPH8Afadhx8Zph67IZYgISP4FBPAQWwxmxoxkRiSw2uY3Xz6/wOlVYfmR2ntef
	mv+b+5yz5imPZ0m3RtiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgBFF-00000008szG-1xX5;
	Sun, 05 Jul 2026 01:02:05 +0000
Received: from out-06.smtp.spacemail.com ([66.29.159.77])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgBFC-00000008syq-1zXN
	for linux-riscv@lists.infradead.org;
	Sun, 05 Jul 2026 01:02:04 +0000
Received: from gurudas.dev (107-194-158-19.lightspeed.sntcca.sbcglobal.net [107.194.158.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4gt8Mn0CXjz6tkM;
	Sun, 05 Jul 2026 01:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gurudas.dev;
	s=spacemail; t=1783213318;
	bh=2qJqLI5cYmY6XssOjT5mS6RQt8tME0zYaMT/RBuKHhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gxzDANV1JQoWbSrlTIw2Hbb83lUzmrjW19c3OZvI3lIFLUx0NWjORGAdcrfZ4Iy1r
	 8iyC/nftZCN6RsgyVPXhGqT3xB7lKhDTIYvv4mPgt23HneL2vlZdPZGvj5/AKk5Pfp
	 wZfKzZkjQvogs3VONlJW1oADetqYF+Z1IsjAZyW86GXa/ntxYiqBXIBTcI8TBWs5qC
	 6LphD9AsDF1QQyi7SDc//YsSj4N4PrmToDXekNK0bsPhGwCiGJIgQfdhGPqBLM/i3q
	 aiuUXbswiQh086BPfvu9FQvRyd8BtJCb/XDmrMZaTKsgOjTHbYsMvyE/xBsne6r0RG
	 gHli7e1+IvGdA==
Date: Sat, 4 Jul 2026 18:01:55 -0700
From: Guru Das Srinagesh <linux@gurudas.dev>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Jens Axboe <axboe@kernel.dk>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	driver-core@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-block@vger.kernel.org, netdev@vger.kernel.org,
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/7] cpufreq: rcpufreq_dt: use vertical import style
Message-ID: <akmtA7EbVBdhRAOq@gurudas.dev>
Mail-Followup-To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Jens Axboe <axboe@kernel.dk>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	driver-core@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-block@vger.kernel.org, netdev@vger.kernel.org,
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
References: <20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev>
 <20260628-b4-rust-vertical-imports-v1-3-98bc71d4810b@gurudas.dev>
 <f0ed588a-6cfb-4079-a2fe-7c14f1b42727@oss.qualcomm.com>
 <CANiq72=SQK7pd-fj+4MOb=E6=R-DHCcLcuCvN=us2E5o7Rcy2A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANiq72=SQK7pd-fj+4MOb=E6=R-DHCcLcuCvN=us2E5o7Rcy2A@mail.gmail.com>
X-Envelope-From: linux@gurudas.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_180202_669963_CF5EAD86 
X-CRM114-Status: GOOD (  17.59  )
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

T24gVHVlLCBKdW4gMzAsIDIwMjYgYXQgMTA6MzU6MDBBTSArMDIwMCwgTWlndWVsIE9qZWRhIHdy
b3RlOgo+IE9uIE1vbiwgSnVuIDI5LCAyMDI2IGF0IDI6NDPigK9QTSBaaG9uZ3FpdSBIYW4KPiA8
emhvbmdxaXUuaGFuQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+ID4KPiA+IElmIHRoZSBwcmVm
ZXJyZWQgc3R5bGUgaXMgdG8gcGxhY2UgZWFjaCBpbXBvcnRlZCBpdGVtIG9uIGl0cyBvd24gbGlu
ZSwKPiA+IHNob3VsZG4ndCBpbXBvcnRzIHN1Y2ggYXMKPiA+Cj4gPiAgICAgIGNwdSwgY3B1ZnJl
cSwKPiA+Cj4gPiBiZSBmb3JtYXR0ZWQgc2ltaWxhcmx5IGFzIHdlbGw/Cj4gCj4gSW5kZWVkLCBn
b29kIGV5ZXMuCj4gCj4gVG8gZG8gd2hhdCB3ZSB3YW50LCBgcnVzdGZtdGAgbmVlZHMgdGhlIGAv
L2AgYXQgdGhlIGVuZCBvZiB0aGF0IGxldmVsCj4gdG9vIChpbiB0aGUgZnV0dXJlLCBpdCB3aWxs
IGJlIHdpdGhvdXQgdGhlIGAvL2ApLCBpLmUuIHRoZSBwYXRjaAo+IHByb2JhYmx5IHBhc3NlcyBg
cnVzdGZtdGNoZWNrYCwgYnV0IGl0IHN0aWxsIG5lZWRzIHRvIHNwbGl0IHRoYXQgbGluZQo+IGFu
ZCBhZGQgdGhlIG90aGVyIGAvL2AuCgpIaSBaaG9uZ3FpdSwgTWlndWVsOgoKWWVzLCBJIGRpZCBy
dW4gYG1ha2UgTExWTT0xIHJ1c3RmbXRjaGVja2AgYW5kIGl0IHBhc3NlZCBvbiB0aGlzIHNlcmll
cy4gSSB3aWxsIGZpeAp0aGUgbWlzc2VkIG9uZXMgaW4gdjIuCgpXaGlsZSBpbnZlc3RpZ2F0aW5n
IHRoaXMsIEkgZm91bmQgdGhhdCB0aGF0IGFkZGluZyB0aGlzIGNvbmZpZyBgaW1wb3J0c19sYXlv
dXQgPQoiVmVydGljYWwiYCB0byB0aGUgcnVzdGZtdCBvcHRpb25zIHdvdWxkIGZpeCBhbGwgdGhl
IGltcG9ydHMgYXV0b21hdGljYWxseSwgaW5jbHVkaW5nCnRoZSBvbmVzIEkgbWlzc2VkLiBJIHJh
biBpdCBsb2NhbGx5IG9uIHRoZSBmaWxlcyB0b3VjaGVkIGluIHRoaXMgc2VyaWVzIHVzaW5nIHJ1
c3RmbXQKbmlnaHRseSBhbmQgaXQgY29ycmVjdGx5IGZpeGVkIHRoZSBpbXBvcnRzIGFzIGRlc2ly
ZWQ6CgogICAgcnVzdHVwIHJ1biBuaWdodGx5IHJ1c3RmbXQgLS11bnN0YWJsZS1mZWF0dXJlcyBc
CiAgICAgIC0tY29uZmlnICJpbXBvcnRzX2xheW91dD1WZXJ0aWNhbCIgXAogICAgICAtLWNvbmZp
Zy1wYXRoIC5ydXN0Zm10LnRvbWwgPGZpbGU+CgpCdXQgdW5mb3J0dW5hdGVseSwgc2luY2UgYGlt
cG9ydHNfbGF5b3V0YCBpcyBhbiB1bnN0YWJsZSBvcHRpb24gY3VycmVudGx5IFsxXSwgaXQKY2Fu
bm90IGJlIHVzZWQgc3RyYWlnaHRhd2F5LgoKSG93ZXZlciwgLnJ1c3RmbXQudG9tbCBhbHJlYWR5
IGhhcyBhIHNlY3Rpb24gb2YgY29tbWVudGVkLW91dCB1bnN0YWJsZSBvcHRpb25zIGtlcHQKYXMg
YSByZWZlcmVuY2UgZm9yIHdoZW4gdGhleSBzdGFiaWxpemUuIFdvdWxkIGl0IG1ha2Ugc2Vuc2Ug
dG8gYWRkIGAjaW1wb3J0c19sYXlvdXQgPQoiVmVydGljYWwiYCB0aGVyZT8gSWYgc28sIEkgY2Fu
IGluY2x1ZGUgaXQgaW4gdjIuCgpbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9ydXN0LWxhbmcvcnVz
dGZtdC9pc3N1ZXMvMzM2MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
