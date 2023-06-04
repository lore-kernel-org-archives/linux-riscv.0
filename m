Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E25C7EE23
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 21:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6hAiI2tVlFxTIxrJO5Ds8CY96iA1a147w5X4IH/Pdbs=; b=PDH3f+9a1QinGx
	zUSY3XPBqGhukX+f/9gdjk4kEcrnjrEHv3VGIv8BdmfFUeFa0cPs+r9DzDLfJKORQXy8fRjmyifp6
	2BU5Z/hxP6SmvS6uA9euhMshoZ6sgduq6OPIlVFltigFVF30W/m/wMPYhKB1KM7ZGQivEflYKpnT6
	o/SjXU6HUCiPh6cFpGhEssf2mbZ/m3iPj1gahzFvHhrTcjsJOvVCbRQPJszbtvoy6r88ZMp2KFZtW
	g6lRunH7/jBQJUmrOrv9lBYQgFvPmPkI4VwN9CYvNHjRsOqaMB/0XAvFu27GRY/e/yOJZhibXyCQv
	ydqfjXjdlKz1+w0IdMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5vSV-00DBVq-38;
	Sun, 04 Jun 2023 21:40:19 +0000
Received: from out-28.mta0.migadu.com ([2001:41d0:1004:224b::1c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5vSR-00DBRt-3A
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jun 2023 21:40:17 +0000
Date: Sun, 4 Jun 2023 17:40:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1685914810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Et8ABs17Zkfn2mGnERyKGLy92viAhCiNpbl07PFjtnE=;
	b=lJmPSA5rKs24/0LEEceFQVOeSXhUoE0+fis7PHaMYfcE2LZdC95JDmW0A61ctvzkYppcPe
	W9mzvDnQ++G15OC4MG7fFAFeLDHkLYUk7wWialJK1ki4sRZ8GoqzW1U3lBIfZIfX0tb2f2
	f+19wUtFVDPjGlYI9R+Uk+lqqtnlv4Q=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Song Liu <song@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Mike Rapoport <rppt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Russell King <linux@armlinux.org.uk>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, netdev@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Puranjay Mohan <puranjay12@gmail.com>
Subject: Re: [PATCH 00/13] mm: jit/text allocator
Message-ID: <ZH0EseWI9F1n9yJx@moria.home.lan>
References: <20230601101257.530867-1-rppt@kernel.org>
 <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
 <ZHjgIH3aX9dCvVZc@moria.home.lan>
 <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
 <CAPhsuW7Euczff_KB70nuH=Hhf2EYHAf=xiQR7mFqVfByhD34XA@mail.gmail.com>
 <ZHzRxE5V6YzGVsHy@moria.home.lan>
 <CAPhsuW7iEDa44jxc_7Cj4KnVhtct-UTO2JtVK-U7o2ynn2iX8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPhsuW7iEDa44jxc_7Cj4KnVhtct-UTO2JtVK-U7o2ynn2iX8Q@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_144016_294456_E213700E 
X-CRM114-Status: GOOD (  20.18  )
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

T24gU3VuLCBKdW4gMDQsIDIwMjMgYXQgMDI6MjI6MzBQTSAtMDcwMCwgU29uZyBMaXUgd3JvdGU6
Cj4gT24gU3VuLCBKdW4gNCwgMjAyMyBhdCAxMTowMuKAr0FNIEtlbnQgT3ZlcnN0cmVldAo+IDxr
ZW50Lm92ZXJzdHJlZXRAbGludXguZGV2PiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIEp1biAwMiwg
MjAyMyBhdCAxMToyMDo1OEFNIC0wNzAwLCBTb25nIExpdSB3cm90ZToKPiA+ID4gSUlVQywgYXJt
NjQgdXNlcyBWTUFMTE9DIGFkZHJlc3Mgc3BhY2UgZm9yIEJQRiBwcm9ncmFtcy4gVGhlIHJlYXNv
bgo+ID4gPiBpcyBlYWNoIEJQRiBwcm9ncmFtIHVzZXMgYXQgbGVhc3QgNjRrQiAob25lIHBhZ2Up
IG91dCBvZiB0aGUgMTI4TUIKPiA+ID4gYWRkcmVzcyBzcGFjZS4gUHVyYW5qYXkgTW9oYW4gKEND
J2VkKSBpcyB3b3JraW5nIG9uIGVuYWJsaW5nCj4gPiA+IGJwZl9wcm9nX3BhY2sgZm9yIGFybTY0
LiBPbmNlIHRoaXMgd29yayBpcyBkb25lLCBtdWx0aXBsZSBCUEYgcHJvZ3JhbXMKPiA+ID4gd2ls
bCBiZSBhYmxlIHRvIHNoYXJlIGEgcGFnZS4gV2lsbCB0aGlzIGltcHJvdmVtZW50IHJlbW92ZSB0
aGUgbmVlZCB0bwo+ID4gPiBzcGVjaWZ5IGEgZGlmZmVyZW50IGFkZHJlc3MgcmFuZ2UgZm9yIEJQ
RiBwcm9ncmFtcz8KPiA+Cj4gPiBDYW4gd2UgcGxlYXNlIHN0b3Agd29ya2luZyBvbiBCUEYgc3Bl
Y2lmaWMgc3ViIHBhZ2UgYWxsb2NhdGlvbiBhbmQgZm9jdXMKPiA+IG9uIGRvaW5nIHRoaXMgaW4g
bW0vPyBUaGlzIG5ldmVyIHNob3VsZCBoYXZlIGJlZW4gaW4gQlBGIGluIHRoZSBmaXJzdAo+ID4g
cGxhY2UuCj4gCj4gVGhhdCB3b3JrIGlzIG1vc3RseSBpbmRlcGVuZGVudCBvZiB0aGUgYWxsb2Nh
dG9yIHdvcmsgd2UgYXJlIGRpc2N1c3NpbmcgaGVyZS4KPiBUaGUgZ29hbCBQdXJhbmpheSdzIHdv
cmsgaXMgdG8gZW5hYmxlIHRoZSBhcm02NCBCUEYgSklUIGVuZ2luZSB0byB1c2UgYQo+IFJPWCBh
bGxvY2F0b3IuIFRoZSBhbGxvY2F0b3IgY291bGQgYmUgdGhlIGJwZl9wcm9nX3BhY2sgYWxsb2Nh
dG9yLCBvciBqaXRhbGxvYywKPiBvciBtb2R1bGVfYWxsb2NfdHlwZS4gUHVyYW5qYXkgaXMgdXNp
bmcgYnBmX3Byb2dfYWxsb2MgZm9yIG5vdy4gQnV0IG9uY2UKPiBqaXRhbGxvYyBvciBtb2R1bGVf
YWxsb2NfdHlwZSAoZWl0aGVyIG9uZSkgaXMgbWVyZ2VkLCB3ZSB3aWxsIG1pZ3JhdGUgQlBGCj4g
SklUIGVuZ2luZXMgKHg4Nl82NCBhbmQgYXJtNjQpIHRvIHRoZSBuZXcgYWxsb2NhdG9yIGFuZCB0
aGVuIHRlYXIgZG93bgo+IGJwZl9wcm9nX3BhY2suCj4gCj4gRG9lcyB0aGlzIG1ha2Ugc2Vuc2U/
CgpZZWFoLCBhcyBsb25nIGFzIHRoYXQncyB0aGUgcGxhbi4gTWF5YmUgb25lIG9mIHlvdSBjb3Vs
ZCB0ZWxsIHVzIHdoYXQKaXNzdWVzIHdlcmUgcHJldmVudGluZyBwcm9nX3BhY2sgZnJvbSBiZWlu
ZyB1c2VkIGluIHRoZSBmaXJzdCBwbGFjZSwgaXQKbWlnaHQgYmUgcmVsZXZhbnQgLSB0aGlzIGlz
IHRoZSB0aW1lIHRvIGdldCB0aGUgbmV3IGFsbG9jYXRvciBBUEkgcmlnaHQuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
