Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C9DC25B5F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 May 2024 05:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wOZh7aSuEX6uI2tSQ2GaoVXiYhqXrTdNGFNxUIf8RsA=; b=J5GyfS7YGo9uzP
	yEcwTqn4+Vxd3LgfB+ZI9S1I3Khl/llPKduBqJW2qtP6XMuvQJloKp/31P/5BgETx65gQpxJVdx8i
	0VlSyI/FHGPMZ3K3NQXNc9hv0MsrM/AlvyiRgq5yy/gi9nEasRlpxXP4H2f8jdUiNO1SCAou6FWm9
	2ZeoOMkAcuRHZu6nl/Fyf44pyVAT0jQ3D8//PCuS1ssonhLaQZpeoQTNtXmH7FFul5SdrIYdo6bk9
	OLk7sOrFZPtnXan45bgVHK/jztp67OvY9MLrzIs/CtdV5A6DiFpix+o1R6BGKWC7sadklx2xVYo9H
	3ZjUwm7mSbz+4Wwm1CZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6NyV-0000000Bhtv-3miY;
	Mon, 13 May 2024 05:11:47 +0000
Received: from smtp-190f.mail.infomaniak.ch ([2001:1600:7:10::190f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6NyS-0000000Bht6-0XyZ
	for linux-riscv@lists.infradead.org;
	Mon, 13 May 2024 05:11:46 +0000
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Vd6zD72sYzBRV;
	Mon, 13 May 2024 07:11:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1715577096;
	bh=NzaTA4RcapZkISmaHLv46iIYK7VaukIA9ZguF6MFZZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hw3En7ijFCwNJoThQiowXkrUxCT44rzwcTmIeGAxmMKpeUBmBD1BLh+85VHxhgwc7
	 JBbg/rqFfZCDo0dPtfgcvOHScY8qdox00AoYekCDtfXJcIcsUmdc+pInQOE27YE5Ni
	 +P34v4BDOwCSyvCB1aryA/Skhpq3+1VxUbfjd74w=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4Vd6z94yx1zHTv;
	Mon, 13 May 2024 07:11:33 +0200 (CEST)
Date: Mon, 13 May 2024 07:11:31 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Edward Liaw <edliaw@google.com>
Cc: shuah@kernel.org, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	Christian Brauner <brauner@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v3 27/68] selftests/landlock: Drop define _GNU_SOURCE
Message-ID: <20240513.wo9coof8Dae4@digikod.net>
References: <20240509200022.253089-1-edliaw@google.com>
 <20240509200022.253089-28-edliaw@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240509200022.253089-28-edliaw@google.com>
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240512_221144_616135_F1B6FF9A 
X-CRM114-Status: GOOD (  13.05  )
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

T24gVGh1LCBNYXkgMDksIDIwMjQgYXQgMDc6NTg6MTlQTSArMDAwMCwgRWR3YXJkIExpYXcgd3Jv
dGU6Cj4gX0dOVV9TT1VSQ0UgaXMgcHJvdmlkZWQgYnkgbGliLm1rLCBzbyBpdCBzaG91bGQgYmUg
ZHJvcHBlZCB0byBwcmV2ZW50Cj4gcmVkZWZpbml0aW9uIHdhcm5pbmdzLgo+IAo+IEZpeGVzOiA4
MDkyMTYyMzM1NTUgKCJzZWxmdGVzdHMvaGFybmVzczogcmVtb3ZlIHVzZSBvZiBMSU5FX01BWCIp
Cj4gUmV2aWV3ZWQtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KPiBSZXZp
ZXdlZC1ieTogTXVoYW1tYWQgVXNhbWEgQW5qdW0gPHVzYW1hLmFuanVtQGNvbGxhYm9yYS5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogRWR3YXJkIExpYXcgPGVkbGlhd0Bnb29nbGUuY29tPgoKUGxlYXNl
IG9ubHkgcmVtb3ZlIGxpbmVzIHdpdGggX0dOVV9TT1VSQ0UsIG5vdCB0aGUgZW1wdHkgbGluZXMu
ICBJIHRoaW5rCml0IHdvdWxkIGJlIGJldHRlciB0byBub3QgY2hhbmdlIHN1Y2ggc3R5bGUgY2hv
aWNlIGZvciBvdGhlciBzdWJzeXN0ZW1zCnRvby4KV2l0aCB0aGlzIGNoYW5nZSBmb3IgdGhlIExh
bmRsb2NrIHNlbGZ0ZXN0czoKQWNrZWQtYnk6IE1pY2thw6tsIFNhbGHDvG4gPG1pY0BkaWdpa29k
Lm5ldD4KCj4gLS0tCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xhbmRsb2NrL2Jhc2VfdGVz
dC5jICAgfCAyIC0tCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xhbmRsb2NrL2ZzX3Rlc3Qu
YyAgICAgfCAyIC0tCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xhbmRsb2NrL25ldF90ZXN0
LmMgICAgfCAyIC0tCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xhbmRsb2NrL3B0cmFjZV90
ZXN0LmMgfCAyIC0tCj4gIDQgZmlsZXMgY2hhbmdlZCwgOCBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbGFuZGxvY2svYmFzZV90ZXN0LmMgYi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sYW5kbG9jay9iYXNlX3Rlc3QuYwo+IGluZGV4IDNjMWU5
ZjM1YjUzMS4uYzg2ZTZmODdiMzk4IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2xhbmRsb2NrL2Jhc2VfdGVzdC5jCj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
bGFuZGxvY2svYmFzZV90ZXN0LmMKPiBAQCAtNSw4ICs1LDYgQEAKPiAgICogQ29weXJpZ2h0IMKp
IDIwMTctMjAyMCBNaWNrYcOrbCBTYWxhw7xuIDxtaWNAZGlnaWtvZC5uZXQ+Cj4gICAqIENvcHly
aWdodCDCqSAyMDE5LTIwMjAgQU5TU0kKPiAgICovCj4gLQo+IC0jZGVmaW5lIF9HTlVfU09VUkNF
Cj4gICNpbmNsdWRlIDxlcnJuby5oPgo+ICAjaW5jbHVkZSA8ZmNudGwuaD4KPiAgI2luY2x1ZGUg
PGxpbnV4L2xhbmRsb2NrLmg+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2xhbmRsb2NrL2ZzX3Rlc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xhbmRsb2NrL2Zz
X3Rlc3QuYwo+IGluZGV4IDZiNWE5ZmY4OGMzZC4uZWVjMGQ5YTQ0ZDUwIDEwMDY0NAo+IC0tLSBh
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xhbmRsb2NrL2ZzX3Rlc3QuYwo+ICsrKyBiL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2xhbmRsb2NrL2ZzX3Rlc3QuYwo+IEBAIC02LDggKzYsNiBAQAo+
ICAgKiBDb3B5cmlnaHQgwqkgMjAyMCBBTlNTSQo+ICAgKiBDb3B5cmlnaHQgwqkgMjAyMC0yMDIy
IE1pY3Jvc29mdCBDb3Jwb3JhdGlvbgo+ICAgKi8KPiAtCj4gLSNkZWZpbmUgX0dOVV9TT1VSQ0UK
PiAgI2luY2x1ZGUgPGFzbS90ZXJtYml0cy5oPgo+ICAjaW5jbHVkZSA8ZmNudGwuaD4KPiAgI2lu
Y2x1ZGUgPGxpYmdlbi5oPgo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9s
YW5kbG9jay9uZXRfdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbGFuZGxvY2svbmV0
X3Rlc3QuYwo+IGluZGV4IGYyMWNmYmJjMzYzOC4uZWVkMDQwYWRjYmFjIDEwMDY0NAo+IC0tLSBh
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xhbmRsb2NrL25ldF90ZXN0LmMKPiArKysgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9sYW5kbG9jay9uZXRfdGVzdC5jCj4gQEAgLTUsOCArNSw2IEBA
Cj4gICAqIENvcHlyaWdodCDCqSAyMDIyLTIwMjMgSHVhd2VpIFRlY2guIENvLiwgTHRkLgo+ICAg
KiBDb3B5cmlnaHQgwqkgMjAyMyBNaWNyb3NvZnQgQ29ycG9yYXRpb24KPiAgICovCj4gLQo+IC0j
ZGVmaW5lIF9HTlVfU09VUkNFCj4gICNpbmNsdWRlIDxhcnBhL2luZXQuaD4KPiAgI2luY2x1ZGUg
PGVycm5vLmg+Cj4gICNpbmNsdWRlIDxmY250bC5oPgo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9sYW5kbG9jay9wdHJhY2VfdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvbGFuZGxvY2svcHRyYWNlX3Rlc3QuYwo+IGluZGV4IGExOWRiNGQwYjNiZC4uYzgzMWU2
ZDAzYjAyIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xhbmRsb2NrL3B0
cmFjZV90ZXN0LmMKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sYW5kbG9jay9wdHJh
Y2VfdGVzdC5jCj4gQEAgLTUsOCArNSw2IEBACj4gICAqIENvcHlyaWdodCDCqSAyMDE3LTIwMjAg
TWlja2HDq2wgU2FsYcO8biA8bWljQGRpZ2lrb2QubmV0Pgo+ICAgKiBDb3B5cmlnaHQgwqkgMjAx
OS0yMDIwIEFOU1NJCj4gICAqLwo+IC0KPiAtI2RlZmluZSBfR05VX1NPVVJDRQo+ICAjaW5jbHVk
ZSA8ZXJybm8uaD4KPiAgI2luY2x1ZGUgPGZjbnRsLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9sYW5k
bG9jay5oPgo+IC0tIAo+IDIuNDUuMC4xMTguZzdmZTI5Yzk4ZDctZ29vZwo+IAo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
