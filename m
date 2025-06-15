Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95383C61CE8
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Jun 2025 14:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OWa69lvRwNFVbLQcuiF+uBRvyP/yUpH/8WfGPjMc95E=; b=IUWUHFZEWsov3L
	L6Ve+WimhJqnlFVdqN8iOYJ2rOyy2aq8aIX7s1REbuG2Kh1anJLlk7cbHjXNJ6Kk42uZaCsHMG8Dw
	T/yOypl3FKl6aLs7MuihEESoCWEjDYvwELatkWffK+n0eX4aBhz79wr4TfWCRZeON7IeNdhHcbBX9
	uZjddtfynMrkxdFAykHKMTVjGkykNmPz3F/xkt7ySNW+d6FDDNAAxalVUjrhJhGi9r+N1PxxONnAD
	+84z9Bdtuf0PFb9fSxlX2jy7tkQRZ0iVD6gWnhD3SxfAmh4cgAxQFdXhf8Och/K3QD3hz0HK+9IK2
	d++tGZHIdedHCwOUJSrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQnug-00000002Xfb-3oz3;
	Sun, 15 Jun 2025 14:00:46 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQnud-00000002Xer-2bTa;
	Sun, 15 Jun 2025 14:00:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7A6B205B1;
	Sun, 15 Jun 2025 14:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749996037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YxXS5lj0DrF49L/g0V9R5FkVyXH9S7gR1QjB4hu3uuE=;
	b=A7TiUfOZSoNCNlpd3feyEIMq7JweNSA26Ki+asH1Rd/WvFZi6wU8mGFvLOiyagoFjwL8JL
	xo9M58/kDnjnSORKMzRqxzrCLgPAGB8Bu5MzN3EMIYoY6aN+6oHKGrYFTIO3qN/Pw67h/B
	IMc2jyqqF5WnGXYgwIPTBVuwK7QfL9I9ZUJ6sI7veC8g4rtStWZ/IVP4WS757EaSs2cq3B
	2xNCG4rBNC84HJC/1B3ddFVbvd1E5riocXBoJdq4moXdkt4MuVYmrwo0+OjTp/wdmH6h4R
	eSQhByt4F2xarijNXWHhMAAbmtcVLzvls0lGIxnTZz73uWzR5oqhqzM6rTospw==
Mime-Version: 1.0
Date: Sun, 15 Jun 2025 16:00:30 +0200
Message-Id: <DAN5THWRO6KS.XXZ00IOTQZH9@bootlin.com>
Cc: "Peter Zijlstra" <peterz@infradead.org>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>,
 "Eduard Zingerman" <eddyz87@gmail.com>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "John Fastabend"
 <john.fastabend@gmail.com>, "KP Singh" <kpsingh@kernel.org>, "Stanislav
 Fomichev" <sdf@fomichev.me>, "Hao Luo" <haoluo@google.com>, "Jiri Olsa"
 <jolsa@kernel.org>, "David S. Miller" <davem@davemloft.net>, "David Ahern"
 <dsahern@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar"
 <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, "X86 ML" <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Menglong Dong" <imagedong@tencent.com>,
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, "Pu Lehui"
 <pulehui@huawei.com>, "Puranjay Mohan" <puranjay@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Ilya Leoshkevich" <iii@linux.ibm.com>, "Heiko
 Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>, "Christian Borntraeger"
 <borntraeger@linux.ibm.com>, "Sven Schnelle" <svens@linux.ibm.com>, "Hari
 Bathini" <hbathini@linux.ibm.com>, "Christophe Leroy"
 <christophe.leroy@csgroup.eu>, "Naveen N Rao" <naveen@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>, "Nicholas Piggin" <npiggin@gmail.com>, "Mykola
 Lysenko" <mykolal@fb.com>, "Shuah Khan" <shuah@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, <ebpf@linuxfoundation.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Bastien Curutchet"
 <bastien.curutchet@bootlin.com>, "Network Development"
 <netdev@vger.kernel.org>, "bpf" <bpf@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@rivosinc.com>, "linux-riscv" <linux-riscv@lists.infradead.org>,
 "linux-s390" <linux-s390@vger.kernel.org>, "ppc-dev"
 <linuxppc-dev@lists.ozlabs.org>, "open list:KERNEL SELFTEST FRAMEWORK"
 <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel"
 <linux-arm-kernel@lists.infradead.org>, "dwarves" <dwarves@vger.kernel.org>
Subject: Re: [PATCH bpf 2/7] bpf/x86: prevent trampoline attachment when
 args location on stack is uncertain
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com> <20250613-deny_trampoline_structs_on_stack-v1-2-5be9211768c3@bootlin.com> <20250613081150.GJ2273038@noisy.programming.kicks-ass.net> <DAL9GRMH74F4.2IV0HN0NGU65X@bootlin.com> <20250613083232.GL2273038@noisy.programming.kicks-ass.net> <DALA5WYA04OG.1283TZDOVLBPS@bootlin.com> <CAADnVQ+sj9XhscN9PdmTzjVa7Eif21noAUH3y1K6x5bWcL-5pg@mail.gmail.com>
In-Reply-To: <CAADnVQ+sj9XhscN9PdmTzjVa7Eif21noAUH3y1K6x5bWcL-5pg@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvfeekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteekleehffevvedvudfhueelffeugfdtveefvdfguefgffehtdekleetheelleffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemsgehvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmegshegvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedtpdhrtghpthhtoheprghlvgigvghirdhsthgrrhhovhhoihhtohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghstheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnhhivghlsehiohhgvggrrhgso
 higrdhnvghtpdhrtghpthhtoheprghnughrihhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghrthhinhdrlhgruheslhhinhhugidruggvvhdprhgtphhtthhopegvugguhiiikeejsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhonhhgsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_070044_274183_FDFDEC6B 
X-CRM114-Status: GOOD (  34.86  )
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

T24gU2F0IEp1biAxNCwgMjAyNSBhdCAxMjozNSBBTSBDRVNULCBBbGV4ZWkgU3Rhcm92b2l0b3Yg
d3JvdGU6Cj4gT24gRnJpLCBKdW4gMTMsIDIwMjUgYXQgMTo1OeKAr0FNIEFsZXhpcyBMb3Rob3LD
qQo+IDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIEZyaSBKdW4g
MTMsIDIwMjUgYXQgMTA6MzIgQU0gQ0VTVCwgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6Cj4+ID4gT24g
RnJpLCBKdW4gMTMsIDIwMjUgYXQgMTA6MjY6MzdBTSArMDIwMCwgQWxleGlzIExvdGhvcsOpIHdy
b3RlOgoKWy4uLl0KCj4+IElmIEkgbmVlZCB0byByZXNwaW4sIEknbGwgcmV3cml0ZSB0aGUgY29t
bWl0IG1lc3NhZ2UgdG8gaW5jbHVkZSB0aGUgZGV0YWlscwo+PiBhYm92ZS4KPgo+IE5vIG5lZWQg
dG8gcmVzcGluLiBUaGUgY292ZXIgbGV0dGVyIGlzIHF1aXRlIGRldGFpbGVkIGFscmVhZHkuCj4K
PiBCdXQgbG9va2luZyBhdCB0aGUgcGF0Y2ggYW5kIHRoaXMgdGhyZWFkIEkgdGhpbmsgd2UgbmVl
ZCB0byBhZ3JlZQo+IG9uIHRoZSBsb25nIHRlcm0gYXBwcm9hY2ggdG8gQlRGLCBzaW5jZSBwZW9w
bGUgYXNzdW1lIHRoYXQKPiBpdCdzIGEgbW9yZSBjb21wYWN0IGR3YXJmIGFuZCBhbnkgbWlzc2lu
ZyBpbmZvcm1hdGlvbgo+IHNob3VsZCBiZSBhZGRlZCB0byBpdC4KPiBMaWtlIGluIHRoaXMgY2Fz
ZSBzcGVjaWFsIGFsaWdubWVudCBjYXNlIGFuZCBwYWNrZWQgYXR0cmlidXRlcwo+IGFyZSBub3Qg
ZXhwcmVzc2VkIGluIEJURiBhbmQgSSBiZWxpZXZlIHRoZXkgc2hvdWxkIG5vdCBiZS4KPiBCVEYg
aXMgbm90IGEgZGVidWcgZm9ybWF0IGFuZCBub3QgYSBzdWJzdGl0dXRlIGZvciBkd2FyZi4KPiBU
aGVyZSBpcyBubyBnb2FsIHRvIGV4cHJlc3MgZXZlcnl0aGluZyBwb3NzaWJsZSBpbiBDLgo+IEl0
J3MgbWluaW1hbCwgYmVjYXVzZSBCVEYgaXMgX3ByYWN0aWNhbF8gZGVzY3JpcHRpb24gb2YKPiB0
eXBlcyBhbmQgZGF0YSBwcmVzZW50IGluIHRoZSBrZXJuZWwuCj4gSSBkb24ndCB0aGluayB0aGUg
c3BlY2lhbCBjYXNlIG9mIHBhY2tpbmcgYW5kIGFsaWdubWVudCBleGlzdHMKPiBpbiB0aGUga2Vy
bmVsIHRvZGF5LCBzbyB0aGUgY3VycmVudCBmb3JtYXQgaXMgc3VmZmljaWVudC4KPiBJdCBkb2Vz
bid0IG1pc3MgYW55dGhpbmcuCj4gSSB0aGluayB3ZSBtYWRlIGFybTY0IEpJVCB1bm5lY2Vzc2Fy
eSByZXN0cmljdGl2ZSBhbmQgbm93IGNvbnNpZGVyaW5nCj4gdG8gbWFrZSBhbGwgb3RoZXIgSklU
cyByZXN0cmljdGl2ZSB0b28gZm9yIGh5cG90aGV0aWNhbCBjYXNlCj4gb2Ygc29tZSBmdXR1cmUg
a2VybmVsIGZ1bmN0aW9ucy4KPiBJIGZlZWwgd2UncmUgZ29pbmcgaW4gdGhlIHdyb25nIGRpcmVj
dGlvbi4KPiBJbnN0ZWFkIHdlIHNob3VsZCB0ZWFjaCBwYWhvbGUgdG8gc2FuaXRpemUgQlRGIHdo
ZXJlIGZ1bmN0aW9ucwo+IGFyZSB1c2luZyB0aGlzIGZhbmN5IGFsaWdubWVudCBhbmQgcGFja2Vk
IHN0cnVjdHMuCj4gcGFob2xlIGNhbiBzZWUgaXQgaW4gZHdhcmYgYW5kIGNhbiBza2lwIGVtaXR0
aW5nIEJURiBmb3Igc3VjaAo+IGZ1bmN0aW9ucy4gVGhlbiB0aGUga2VybmVsIEpJVHMgb24gYWxs
IGFyY2hpdGVjdHVyZXMgd29uJ3QgZXZlbgo+IHNlZSBzdWNoIGNhc2VzLgo+Cj4gVGhlIGlzc3Vl
IHdhcyBpbml0aWFsbHkgZGlzY292ZXJlZCBieSBhIHNlbGZ0ZXN0Ogo+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2JwZi8yMDI1MDQxMS1tYW55X2FyZ3NfYXJtNjQtdjEtMy0wYTMyZmU3MjMzOWVA
Ym9vdGxpbi5jb20vCj4gdGhhdCBhdHRlbXB0ZWQgdG8gc3VwcG9ydCB0aGVzZSB0d28gdHlwZXM6
Cj4gK3N0cnVjdCBicGZfdGVzdG1vZF9zdHJ1Y3RfYXJnXzQgewo+ICsgX191NjQgYTsKPiArIF9f
dTY0IGI7Cj4gK307Cj4gKwo+ICtzdHJ1Y3QgYnBmX3Rlc3Rtb2Rfc3RydWN0X2FyZ181IHsKPiAr
IF9faW50MTI4IGE7Cj4gK307Cj4KPiBUaGUgZm9ybWVyIGlzIHByZXNlbnQgaW4gdGhlIGtlcm5l
bC4gSXQncyBtb3JlIG9yIGxlc3Mgc29ja3B0cl90LAo+IGFuZCBwZW9wbGUgd2FudCB0byBhY2Nl
c3MgaXQgZm9yIG9ic2VydmFiaWxpdHkgaW4gdHJhY2luZy4KPiBUaGUgbGF0dGVyIGRvZXNuJ3Qg
ZXhpc3QgaW4gdGhlIGtlcm5lbCBhbmQgd2UgY2Fubm90IHJlcHJlc2VudAo+IGl0IHByb3Blcmx5
IGluIEJURiB3aXRob3V0IGxvc2luZyBhbGlnbm1lbnQuCj4KPiBTbyBJIHRoaW5rIHdlIHNob3Vs
ZCBnbyBiYWNrIHRvIHRoYXQgc2VyaWVzOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2JwZi8y
MDI1MDQxMS1tYW55X2FyZ3NfYXJtNjQtdjEtMC0wYTMyZmU3MjMzOWVAYm9vdGxpbi5jb20vCj4K
PiByZW1vdmUgX19pbnQxMjggc2VsZnRlc3QsIGJ1dCBhbHNvIHRlYWNoIHBhaG9sZQo+IHRvIHJl
Y29nbml6ZSB0eXBlcyB0aGF0IGNhbm5vdCBiZSByZXByZXNlbnRlZCBpbiBCVEYgYW5kCj4gZG9u
J3QgZW1pdCB0aGVtIGVpdGhlciBpbnRvIHZtbGludXggb3IgaW4ga2VybmVsIG1vZHVsZQo+IChs
aWtlIGluIHRoaXMgY2FzZSBpdCB3YXMgYnBmX3Rlc3Rtb2Qua28pCj4gSSB0aGluayB0aGF0IHdv
dWxkIGJlIGEgYmV0dGVyIHBhdGggZm9yd2FyZCBhbGlnbmVkCj4gd2l0aCB0aGUgbG9uZyB0ZXJt
IGdvYWwgb2YgQlRGLgo+Cj4gQW5kIGJlZm9yZSBwZW9wbGUgYXNrLi4uIHBhaG9sZSBpcyBhIHRy
dXN0ZWQgY29tcG9uZW50IG9mIHRoZSBidWlsZAo+IHN5c3RlbS4gV2UgdHJ1c3QgaXQganVzdCBh
cyB3ZSB0cnVzdCBnY2MsIGNsYW5nLCBsaW5rZXIsIG9ianRvb2wuCgpTbyBpZiBJIHVuZGVyc3Rh
bmQgY29ycmVjdGx5IHlvdXIgcG9pbnQsIGl0IHdvdWxkIGJlIGJldHRlciB0byBqdXN0IG1vdmUg
b3V0CnRob3NlIGNvbnN0cmFpbnRzIGZyb20gdGhlIEpJVCBjb21waWxlcnMsIGFuZCBqdXN0IG5v
dCByZXByZXNlbnQgdGhvc2Ugc3BlY2lhbApjYXNlcyBpbiBCVEYsIHNvIHRoYXQgaXQgYmVjb21l
cyBpbXBvc3NpYmxlIHRvIGhvb2sgcHJvZ3JhbXMgb24gdGhvc2UgZnVuY3Rpb25zLApzaW5jZSB0
aGV5IGFyZSBub3QgZXZlbnQgcHJlc2VudCBpbiBCVEYgaW5mby4KQW5kIHNvOgotIGNhbmNlbCB0
aGlzIHNlcmllcwotIHJldmVydCB0aGUgc21hbGwgQVJNNjQgY2hlY2sgYWJvdXQgc3RydWN0IHBh
c3NlZCBvbiBzdGFjawotIHVwZGF0ZSBwYWhvbGUgdG8gbWFrZSBzdXJlIHRoYXQgaXQgZG9lcyBu
b3QgZW5jb2RlIGluZm8gYWJvdXQgdGhpcyBzcGVjaWZpYwogIGtpbmQgb2YgZnVuY3Rpb25zLgoK
SSBzdGlsbCBleHBlY3Qgc29tZSBjaGFsbGVuZ2VzIHdpdGggdGhpcy4gQUZBSVUgcGFob2xlIHVz
ZXMgRFdBUkYgdG8gZ2VuZXJhdGUKQlRGLCBhbmQgZGlzY3Vzc2lvbnMgaW4gWzFdIGhpZ2hsaWdo
dGVkIHRoZSBmYWN0IHRoYXQgdGhlIGF0dHJpYnV0ZXMgYWx0ZXJpbmcKdGhlIHN0cnVjdHMgYWxp
Z25tZW50IGFyZSBub3QgcmVsaWFibHkgZW5jb2RlZCBpbiBEV0FSRi4gTWF5YmUgcGFob2xlIGNh
bgoiZ3Vlc3MiIGlmIGEgc3RydWN0IGhhcyBiZWVuIGFsdGVyZWQsIGJ5IGRvaW5nIHNvbWV0aGlu
ZyBsaWtlCmJ0Zl9pc19zdHJ1Y3RfcGFja2VkIGluIGxpYmJwZiA/IEFzIEFuZHJpaSBtZW50aW9u
ZWQgaW4gWzJdLCBpdCBtYXkgbm90IGJlCmFibGUgdG8gY292ZXIgYWxsIGNhc2VzLCBidXQgdGhh
dCBjb3VsZCAgYmUgYSBzdGFydC4gSWYgdGhhdCdzIGluZGVlZCB0aGUKZGVzaXJlZCBkaXJlY3Rp
b24sIEkgY2FuIHRha2UgYSBmdXJ0aGVyIGxvb2sgYXQgdGhpcy4KCisgQ0MgZHdhcnZlcyBNTAoK
QWxleGlzCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnBmLzlhMmJhMGFkLWIzNGQtNDJm
OC04OWE2LWQ5YTQ0ZjAwN2JkY0BsaW51eC5kZXYvClsyXSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9icGYvQ0FFZjRCelpITVl5R0RaNGM0ZU5YRzdGbT1lY3hDQ2JLaEtiUVRiQ2p2V21LdGR3dkJ3
QG1haWwuZ21haWwuY29tLwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
