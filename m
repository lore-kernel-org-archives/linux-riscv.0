Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC67C54ED1
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 08:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wnc+2HtBfal9HDjNbM4aCkqAL6hLiveh19jkgR3sBAw=; b=i1k63KclIskBrx
	VfPILZ+z0I/oLzTCMedTfv2u1ie7dhZB2mSqFnjwCv/eHe0jy2kXN9wGUz8EizHabEsilZMks92L/
	5g4CzoHsrCD/d9hmYyw3lOCGK8l/K+0EsSFQ6sT0/aWfYtiUOFUpdSwLaf8AVqmr3FxVN3aOWBtj0
	u0YZil15ccsPefHrc+X/ruGHeN+x7GCsQdN8WsYy8pTdrGKCKkSOXylHyHq7+2HZFBmE/xiI40O99
	ava6ded//k3VBeC2RG0cASFOwbO4b2toFGKiptPU3nbrvWNa4zleNYfEKmvHsrJ3hw1RDVws5p70F
	a/zJBEaoRKYY8ww1DZ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJq5J-0000000AJkP-0Oy7;
	Tue, 27 May 2025 08:54:57 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJq5D-0000000AJiu-33sr
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 08:54:54 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250527085445euoutp01a9b072a23229ad6d72a81fbf765de599~DVmgqC9B40347303473euoutp01k
	for <linux-riscv@lists.infradead.org>; Tue, 27 May 2025 08:54:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250527085445euoutp01a9b072a23229ad6d72a81fbf765de599~DVmgqC9B40347303473euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1748336085;
	bh=YNWmGS5CMUNgwusCiMiRXuZnmCjMkDyxd0GsI2VazJQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=JfWEZ/DwFr/HpuY6L8CtkXw78pLFB92zehs/NA+Kg5p014u2tgYsbhxhiEFKym5OP
	 eIIweHXnQNBY8TCPT9AI85m99e/LXnt228fF4roIkCyAsUQhvyuGCapDUBhugriBYW
	 BSN7ACs2nsOWCy7UpB52cwLXqD8nAO5fy/mIgpMk=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250527085445eucas1p214ecce3d8b8769c58f3eab2b0b73df93~DVmgGT1os0889508895eucas1p28;
	Tue, 27 May 2025 08:54:45 +0000 (GMT)
Received: from [106.210.136.40] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250527085444eusmtip1bab9c1b6732e4f053faaa518fb79ee9b~DVmfOH2Pq0318603186eusmtip1l;
	Tue, 27 May 2025 08:54:44 +0000 (GMT)
Message-ID: <0dc42c81-a082-4fce-a447-32995b75f1c9@samsung.com>
Date: Tue, 27 May 2025 10:54:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/6] riscv: dts: thead: Add PVT node
To: Drew Fustini <drew@pdp7.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
	<benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice
	Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
	Krummrich <dakr@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski
	<m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Content-Language: pl
From: "Michal Wilczynski/Kernel (PLT) /SRPOL/Engineer/Samsung Electronics"
	<m.wilczynski@samsung.com>
In-Reply-To: <aDVxDJi0KkWXiPCK@x1>
X-CMS-MailID: 20250527085445eucas1p214ecce3d8b8769c58f3eab2b0b73df93
X-Msg-Generator: CA
X-RootMTR: 20250524211525eucas1p244963b69e0531c95a9052e4a7a1d1e01
X-EPHeader: CA
X-CMS-RootMailID: 20250524211525eucas1p244963b69e0531c95a9052e4a7a1d1e01
References: <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
	<CGME20250524211525eucas1p244963b69e0531c95a9052e4a7a1d1e01@eucas1p2.samsung.com>
	<20250524-rust-next-pwm-working-fan-for-sending-v1-5-bdd2d5094ff7@samsung.com>
	<aDVxDJi0KkWXiPCK@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_015452_345835_4C11F995 
X-CRM114-Status: GOOD (  18.53  )
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

ClcgZG5pdSAyNy4wNS4yMDI1IG/CoDEwOjAwLCBEcmV3IEZ1c3RpbmkgcGlzemU6Cj4gT24gU2F0
LCBNYXkgMjQsIDIwMjUgYXQgMTE6MTQ6NTlQTSArMDIwMCwgTWljaGFsIFdpbGN6eW5za2kgd3Jv
dGU6Cj4+IEFkZCBQVlQgRFQgbm9kZSBmb3IgdGhlcm1hbCBzZW5zb3IuCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IE1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+Cj4+IC0t
LQo+PiAgIGFyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kgfCAxMSArKysrKysr
KysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpIGIvYXJjaC9yaXNjdi9i
b290L2R0cy90aGVhZC90aDE1MjAuZHRzaQo+PiBpbmRleCBmMjRlMTJkNzI1OWZhYmNmYmRjMmRm
YTk2NmQ3NTlkYjA2Njg0YWI0Li5mYWY1YzNhYWYyMDliMjRjZDk5ZGRjMzc3YTg4ZTA4YThjY2Uy
NGZlIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNp
Cj4+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kKPj4gQEAgLTY0
OCw2ICs2NDgsMTcgQEAgcGFkY3RybF9hb3N5czogcGluY3RybEBmZmZmZjRhMDAwIHsKPj4gICAJ
CQl0aGVhZCxwYWQtZ3JvdXAgPSA8MT47Cj4+ICAgCQl9Owo+PiAgIAo+PiArCQlwdnQ6IHB2dEBm
ZmZmZjRlMDAwIHsKPj4gKwkJCWNvbXBhdGlibGUgPSAibW9vcnRlYyxtcjc1MjAzIjsKPj4gKwkJ
CXJlZyA9IDwweGZmIDB4ZmZmNGUwMDAgMHgwIDB4ODA+LAo+PiArCQkJICAgICAgPDB4ZmYgMHhm
ZmY0ZTA4MCAweDAgMHgxMDA+LAo+PiArCQkJICAgICAgPDB4ZmYgMHhmZmY0ZTE4MCAweDAgMHg2
ODA+LAo+PiArCQkJICAgICAgPDB4ZmYgMHhmZmY0ZTgwMCAweDAgMHg2MDA+Owo+PiArCQkJcmVn
LW5hbWVzID0gImNvbW1vbiIsICJ0cyIsICJwZCIsICJ2bSI7Cj4+ICsJCQljbG9ja3MgPSA8JmFv
bnN5c19jbGs+Owo+PiArCQkJI3RoZXJtYWwtc2Vuc29yLWNlbGxzID0gPDE+Owo+PiArCQl9Owo+
PiArCj4+ICAgCQlncGlvQGZmZmZmNTIwMDAgewo+PiAgIAkJCWNvbXBhdGlibGUgPSAic25wcyxk
dy1hcGItZ3BpbyI7Cj4+ICAgCQkJcmVnID0gPDB4ZmYgMHhmZmY1MjAwMCAweDAgMHgxMDAwPjsK
Pj4KPj4gLS0gCj4+IDIuMzQuMQo+Pgo+IEkgZm91bmQgdGhhdCBvbiBteSBscGk0YSB0aGF0IGJv
b3Qgd2hpbGUgaGFuZyBhZnRlciBhcHBseWluZyB0aGlzIHBhdGNoLgo+IEkgdGhpbmsgdGhhdCBp
dCBpcyByZWxhdGVkIHRvIGNsb2NrcyBhcyBib290IGZpbmlzaGVkIG9rYXkgd2hlbiB1c2luZwo+
IGNsa19pZ25vcmVfdW51c2VkIG9uIHRoZSBrZXJuZWwgY21kbGluZS4gRG8geW91IGhhcHBlbiBo
YXZlIHRoYXQgaW4geW91cgo+IGtlcm5lbCBjbWRsaW5lPwoKUmlnaHQgSSBoYWQgdGhhdCBvcHRp
b24gZW5hYmxlZCwgdGhhdCdzIHdoeSBJJ3ZlIG1pc3NlZCB0aGlzLiBUaGFua3MgZm9yCgpsZXR0
aW5nIG1lIGtub3cgISBJJ2xsIHJlbW92ZSB0aGlzIG9wdGlvbiBmb3IgZnV0dXJlIHRlc3Rpbmcu
Cgo+Cj4gSSBuZWVkIHRvIGludmVzdGlnYXRlIGZ1cnRoZXIgdG8gdW5kZXJzdGFuZCB3aGljaCBj
bG9ja3MgYXJlIGNhdXNpbmcgdGhlCj4gcHJvYmxlbS4KCgpObyBwcm9ibGVtIEkgY2FuIGxvb2sg
aW50byB0aGF0IGFzIHdlbGwsIG1vc3QgbGlrZWx5IHRvd2FyZHMgdGhlIGVuZAoKb2YgdGhlIHdl
ZWsgYXMgSSdtIHRyYXZlbGxpbmcgYW5kIGRvbid0IGhhdmUgYWNjZXNzIHRvIHRoZSBib2FyZC4K
Cgo+Cj4gVGhhbmtzLAo+IERyZXcKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
