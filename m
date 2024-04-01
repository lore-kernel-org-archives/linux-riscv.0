Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BB7CD128A
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Apr 2024 15:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C69cfYlhVckZRmrMeQQ4W+qcOujun4O1MhOqgQdyD1s=; b=przmLRLyI7Sah+
	/HKzeFB+39SGTcnAt6ipPwE0jpIgKZ/ARhv60Zy9ocoGisL86MknZACkp8w3yC4OGXYhqPJDcsRjt
	Os7dSil7qKeFS9mFzk3hDkLxl9Srdp2b3PFg0dtM3NDl0aURvKqUg6CWOXuMd4l/XbCD74UgcKlSu
	egUCDe6U1LNBsadmF0fnluush3fUaZcEYuos480AusO7JMh6IXEd/foqiMcsEsEAjuRAI23rAHu6d
	EXy7XFzgphsnJ/PkUoAUJVGm5GkQkT7j8cuVRN2niQDqhbtaRIeqRB1fdmXgD81buFRV/y9wsIysh
	lUI+lM5r1K+keckz28xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrK2G-00000008Gie-0sWh;
	Mon, 01 Apr 2024 15:57:24 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrK2B-00000008Gfo-3Z3w;
	Mon, 01 Apr 2024 15:57:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9929FCE130B;
	Mon,  1 Apr 2024 15:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C86C433F1;
	Mon,  1 Apr 2024 15:57:13 +0000 (UTC)
Date: Mon, 1 Apr 2024 11:59:28 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Jiri Olsa
 <jolsa@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eddy Z <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, "David S.
 Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, Dave
 Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Quentin Monnet
 <quentin@isovalent.com>, bpf <bpf@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 linux-trace-kernel@vger.kernel.org, "open list:KERNEL SELFTEST FRAMEWORK"
 <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [External] Re: [PATCH bpf-next v2 1/9] bpf: tracing: add
 support to record and check the accessed args
Message-ID: <20240401115928.3d012be2@gandalf.local.home>
In-Reply-To: <CALz3k9j_RGqSMdN+GvbHEjRqMWYe4R9VNZRANG7jbfL_jVpoVg@mail.gmail.com>
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
	<20240311093526.1010158-2-dongmenglong.8@bytedance.com>
	<CAADnVQKQPS5NcvEouH4JqZ2fKgQAC+LtcwhX9iXYoiEkF_M94Q@mail.gmail.com>
	<CALz3k9i5G5wWi+rtvHPwVLOUAXVMCiU_8QUZs87TEYgR_0wpPA@mail.gmail.com>
	<CAADnVQJ_ZCzMmT1aBsNXEBFfYNSVBdBXmLocjR0PPEWtYQrQFw@mail.gmail.com>
	<CALz3k9icPePb0c4FE67q=u1U0hrePorN9gDpQrKTR_sXbLMfDA@mail.gmail.com>
	<CAADnVQLwgw8bQ7OHBbqLhcPJ2QpxiGw3fkMFur+2cjZpM_78oA@mail.gmail.com>
	<CALz3k9g9k7fEwdTZVLhrmGoXp8CE47Q+83r-AZDXrzzuR+CjVA@mail.gmail.com>
	<CAADnVQLHpi3J6cBJ0QBgCQ2aY6fWGnVvNGdfi3W-jmoa9d1eVQ@mail.gmail.com>
	<CALz3k9g-U8ih=ycJPRbyU9x_9cp00fNkU3PGQ6jP0WJ+=uKmqQ@mail.gmail.com>
	<CALz3k9jG5Jrqw=BGjt05yMkEF-1u909GbBYrV-02W0dQtm6KQQ@mail.gmail.com>
	<20240328111330.194dcbe5@gandalf.local.home>
	<CALz3k9idLX10+Gh18xWepwtgvp4VZ3zQfY4aoNXn0gCh8Fs_fA@mail.gmail.com>
	<20240330153722.65104301@gandalf.local.home>
	<CALz3k9j_RGqSMdN+GvbHEjRqMWYe4R9VNZRANG7jbfL_jVpoVg@mail.gmail.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_085720_270914_0F7CB09F 
X-CRM114-Status: GOOD (  20.70  )
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

T24gTW9uLCAxIEFwciAyMDI0IDEwOjI4OjE3ICswODAwCuaipum+meiRoyA8ZG9uZ21lbmdsb25n
LjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cgo+IE9uIFN1biwgTWFyIDMxLCAyMDI0IGF0IDM6MzTi
gK9BTSBTdGV2ZW4gUm9zdGVkdCA8cm9zdGVkdEBnb29kbWlzLm9yZz4gd3JvdGU6Cj4gPgo+ID4g
T24gU2F0LCAzMCBNYXIgMjAyNCAxMToxODoyOSArMDgwMAo+ID4g5qKm6b6Z6JGjIDxkb25nbWVu
Z2xvbmcuOEBieXRlZGFuY2UuY29tPiB3cm90ZToKPiA+ICAKPiA+ID4gPiBJZiB5b3UgcmVhbGx5
IHdhbnQgdG8gaGF2ZSB0aG91c2FuZHMgb2YgZnVuY3Rpb25zLCB3aHkgbm90IGp1c3QgcmVnaXN0
ZXIgaXQKPiA+ID4gPiB3aXRoIGZ0cmFjZSBpdHNlbGYuIEl0IHdpbGwgZ2l2ZSB5b3UgdGhlIGFy
Z3VtZW50cyB2aWEgdGhlIGZ0cmFjZV9yZWdzCj4gPiA+ID4gc3RydWN0dXJlLiBDYW4ndCB5b3Ug
anVzdCByZWdpc3RlciBhIHByb2dyYW0gYXMgdGhlIGNhbGxiYWNrPwo+ID4gPiA+ICAKPiA+ID4K
PiA+ID4gRW5ubi4uLkkgZG9uJ3QgdW5kZXJzdGFuZC4gVGhlIG1haW4gcHVycG9zZSBmb3IKPiA+
ID4gbWUgdG8gdXNlIFRSQUNJTkcgaXM6Cj4gPiA+Cj4gPiA+IDEuIHdlIGNhbiBkaXJlY3RseSBh
Y2Nlc3MgdGhlIG1lbW9yeSwgd2hpY2ggaXMgbW9yZQo+ID4gPiAgICBlZmZpY2llbnQuICAKPiA+
Cj4gPiBJJ20gbm90IHN1cmUgd2hhdCB5b3UgbWVhbiBieSB0aGUgYWJvdmUuIEFjY2VzcyB3aGF0
IG1lbW9yeT8KPiA+ICAKPiAKPiBXZSBuZWVkIHRvIHVzZSB0aGUgaGVscGVyIG9mIGJwZl9wcm9i
ZV9yZWFkX2tlcm5lbAo+IHdoZW4gd2UgcmVhZCAic2tiLT5zayIgaW4ga3Byb2JlLCBhbmQgdGhl
ICJza2IiIGlzIHRoZQo+IDFzdCBhcmcgaW4gaXBfcmN2KCkuIEFuZCB3ZSBjYW4gZGlyZWN0bHkg
cmVhZCAic2tiLT5zayIKPiBpbiB0cmFjaW5nLCB3aGljaCBpcyBtb3JlIGVmZmljaWVudC4gSXNu
J3QgaXQ/CgpJZiB5b3UgYWRkIGEgZnRyYWNlX29wcyBmdW5jdGlvbiBoYW5kbGVyIHRoYXQgY2Fs
bHMgYSBCUEYgcHJvZ3JhbSwgSSBkb24ndApzZWUgd2h5IHlvdSBjYW4ndCBqdXN0IGdpdmUgaXQg
dGhlIHBhcmFtZXRlcnMgaXQgbmVlZHMgaW5zdGVhZCBvZiB1c2luZyBicGYKaGVscGVycy4gSXQn
cyBubyBkaWZmZXJlbnQgdGhhbiB1c2luZyBhIHRyYW1wb2xpbmUgdG8gZG8gdGhlIHNhbWUgdGhp
bmcuCgotLSBTdGV2ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
