Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCCCC19776
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 12:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o2nzLptRsSfHuclcY1EtmY9RYpUeY9keN4kUYc6An78=; b=Pj2OVNAEojyVSA
	a+q5Au3o3RXIHDsHDbFywWS6nyTeWxvX2To1MsEvEd8W+Ma7YW2Os39ecZAvK5STjFH1oHJq1a4n3
	euAjwdyER804csy9uNVW0WofbH92apVJ2FWcq0oU2N0X5jdFDFCX7JEShejzZJXVTyvqMdX0Cmer2
	ciKEzk/LT+czCz5ir7vrp7zNKgKI+kESnV52MJz+6lNjvWEVZZQ7tTKtBYYxcfn8TwBlxUZRtau/U
	lomtX89TiJDzRIDgwO6oa8bYe+2YHrxY22Y5HHXDTg4XcA0nTF6r5hUAlNH1qq3/qbpPTWoSrwtKc
	hZ3j0z4Tzpf2u/lGW8PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzdB-0000000AwDK-2RBX;
	Fri, 28 Feb 2025 12:38:17 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzd8-0000000AwBy-3I6B
	for linux-riscv@lists.infradead.org;
	Fri, 28 Feb 2025 12:38:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7BE0220578;
	Fri, 28 Feb 2025 12:38:09 +0000 (UTC)
Message-ID: <99529247-b489-4e10-afc8-3abe6fbd777e@ghiti.fr>
Date: Fri, 28 Feb 2025 13:38:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: mm: Don't use %pK through printk
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250217-restricted-pointers-riscv-v1-1-72a078076a76@linutronix.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250217-restricted-pointers-riscv-v1-1-72a078076a76@linutronix.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeltdegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepjeeiuedujeeikeevuedtgeeuhfekudeludegveehffefjedugeegudffgfeluefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeegrggvsgemugeifegumedvsgekheemvggttdgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeegrggvsgemugeifegumedvsgekheemvggttdgupdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeegrggvsgemugeifegumedvsgekheemvggttdgungdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepthhhohhmrghsrdifvghishhsshgthhhuhheslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrt
 ghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_043814_969523_0819E446 
X-CRM114-Status: GOOD (  11.91  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgVGhvbWFzLAoKT24gMTcvMDIvMjAyNSAwODozNywgVGhvbWFzIFdlacOfc2NodWggd3JvdGU6
Cj4gUmVzdHJpY3RlZCBwb2ludGVycyAoIiVwSyIpIGFyZSBub3QgbWVhbnQgdG8gYmUgdXNlZCB0
aHJvdWdoIHByaW50aygpLgo+IEl0IGNhbiB1bmludGVudGlvbmFsbHkgZXhwb3NlIHNlY3VyaXR5
IHNlbnNpdGl2ZSwgcmF3IHBvaW50ZXIgdmFsdWVzLgo+Cj4gVXNlIHJlZ3VsYXIgcG9pbnRlciBm
b3JtYXR0aW5nIGluc3RlYWQuCj4KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21s
LzIwMjUwMTEzMTcxNzMxLWRjMTBlM2MxLWRhNjQtNGFmMC1iNzY3LTdjNzA3MDQ2ODAyM0BsaW51
dHJvbml4LmRlLwo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vp
c3NzY2h1aEBsaW51dHJvbml4LmRlPgo+IC0tLQo+ICAgYXJjaC9yaXNjdi9tbS9waHlzYWRkci5j
IHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9waHlzYWRkci5jIGIvYXJjaC9yaXNjdi9t
bS9waHlzYWRkci5jCj4gaW5kZXggMTg3MDZmNDU3ZGE3ZWNmODQ1OTE1MTBlYTI2Nzg5ZjdhZTNl
OWFiZi4uNTU5ZDI5MWZhYzVjNjIyNzFhMGU3OTMzMjFjOTdiODdiZjRlMWIzYyAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L21tL3BoeXNhZGRyLmMKPiArKysgYi9hcmNoL3Jpc2N2L21tL3BoeXNh
ZGRyLmMKPiBAQCAtMTIsNyArMTIsNyBAQCBwaHlzX2FkZHJfdCBfX3ZpcnRfdG9fcGh5cyh1bnNp
Z25lZCBsb25nIHgpCj4gICAJICogQm91bmRhcnkgY2hlY2tpbmcgYWdpbnN0IHRoZSBrZXJuZWwg
bGluZWFyIG1hcHBpbmcgc3BhY2UuCj4gICAJICovCj4gICAJV0FSTighaXNfbGluZWFyX21hcHBp
bmcoeCkgJiYgIWlzX2tlcm5lbF9tYXBwaW5nKHgpLAo+IC0JICAgICAidmlydF90b19waHlzIHVz
ZWQgZm9yIG5vbi1saW5lYXIgYWRkcmVzczogJXBLICglcFMpXG4iLAo+ICsJICAgICAidmlydF90
b19waHlzIHVzZWQgZm9yIG5vbi1saW5lYXIgYWRkcmVzczogJXAgKCVwUylcbiIsCj4gICAJICAg
ICAodm9pZCAqKXgsICh2b2lkICopeCk7Cj4gICAKPiAgIAlyZXR1cm4gX192YV90b19wYV9ub2Rl
YnVnKHgpOwo+Cj4gLS0tCj4gYmFzZS1jb21taXQ6IDBhZDI1MDdkNWQ5M2YzOTYxOWZjNDIzNzJj
MzQ3ZDYwMDZiNjQzMTkKPiBjaGFuZ2UtaWQ6IDIwMjUwMjE3LXJlc3RyaWN0ZWQtcG9pbnRlcnMt
cmlzY3YtNjJjYTZkNWZiZjE0Cj4KPiBCZXN0IHJlZ2FyZHMsCgoKUmV2aWV3ZWQtYnk6IEFsZXhh
bmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KClRoYW5rcywKCkFsZXgKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
