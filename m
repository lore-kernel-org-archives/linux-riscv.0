Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE36CA0FF6
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Sep 2023 00:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=phBe/bRCZEKpOFkTtWYGMTr0N5dP74KZnEY/fhHuACY=; b=oDzoWseJM8yE1J
	u+10gdk97NMsT01ERp8XhYZ8yi/qAcIl62alv6zrSFUOfcAyRVSyZDZvDXXl6m0Ss1A/4KaJUEzBR
	ob0FCGY6n21PXVcOJ1sCgQ1rhy9A36j76PHaTy9WKOnaVY94QTuRK3uFZNYTifM7OQPGFSm+0D9sH
	GpLbfai/iRMpHRB/H4/LanoogUMYYnOgdFw40vSdGLvzQrLXcgtiGi0T77IihzHWWPMLZW9OC/5Bq
	DuUH7iEeVuNm4i4Hgr73cXg4wFGJ/SuSf6d+C3qF2wx7q+D6X3VUbVeZ69SkzskxQjB50/d4tZ995
	vIUS+2xhvGSskJwAIZWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcEnK-000alE-0b;
	Sat, 02 Sep 2023 00:47:22 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qcEnF-000akT-32;
	Sat, 02 Sep 2023 00:47:17 +0000
Message-ID: <13203808-f765-76f9-2cb2-c3657edb14c7@infradead.org>
Date: Fri, 1 Sep 2023 17:47:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] riscv: Kconfig.errata: Add dependency for RISCV_SBI in
 ERRATA_ANDES config
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor.dooley@microchip.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 kernel test robot <lkp@intel.com>
References: <20230901110320.312674-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <c9da6ffe-7a58-1efa-f625-41d73346d6a2@infradead.org>
 <CA+V-a8tyUpgDSBrpHBBfWfie4xnR7iKCZben3U5dX1puFu3_1A@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CA+V-a8tyUpgDSBrpHBBfWfie4xnR7iKCZben3U5dX1puFu3_1A@mail.gmail.com>
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

SGksClRoYW5rcyBmb3IgeW91ciBoZWxwLgoKT24gOS8xLzIzIDE0OjEyLCBMYWQsIFByYWJoYWth
ciB3cm90ZToKPiBIaSBSYW5keSwKPiAKPiBPbiBGcmksIFNlcCAxLCAyMDIzIGF0IDk6MjfigK9Q
TSBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4+Cj4+IEhpLAo+
Pgo+PiBPbiA5LzEvMjMgMDQ6MDMsIFByYWJoYWthciB3cm90ZToKPj4+IEZyb206IExhZCBQcmFi
aGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPj4+Cj4+PiBB
bmRlcyBlcnJhdGEgdXNlcyBzYmlfZWNhbGxsKCkgd2hpY2ggaXMgb25seSBhdmFpbGFibGUgaWYg
UklTQ1ZfU0JJIGlzCj4+PiBlbmFibGVkLiBTbyBhZGQgYW4gZGVwZW5kZW5jeSBmb3IgUklTQ1Zf
U0JJIGluIEVSUkFUQV9BTkRFUyBjb25maWcgdG8KPj4+IGF2b2lkIGFueSBidWlsZCBmYWlsdXJl
cy4KPj4+Cj4+PiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+
Cj4+PiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyMzA4
MzExNjEwLmVjNmJtMkc4LWxrcEBpbnRlbC5jb20vCj4+PiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJh
Ymhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4+PiAtLS0K
Pj4+ICBhcmNoL3Jpc2N2L0tjb25maWcuZXJyYXRhIHwgMiArLQo+Pj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L0tjb25maWcuZXJyYXRhIGIvYXJjaC9yaXNjdi9LY29uZmlnLmVycmF0YQo+Pj4gaW5k
ZXggYmVlNWQ4Mzg3NjNiLi41NjZiY2VmZWFiNTAgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2
L0tjb25maWcuZXJyYXRhCj4+PiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcuZXJyYXRhCj4+PiBA
QCAtMiw3ICsyLDcgQEAgbWVudSAiQ1BVIGVycmF0YSBzZWxlY3Rpb24iCj4+Pgo+Pj4gIGNvbmZp
ZyBFUlJBVEFfQU5ERVMKPj4+ICAgICAgIGJvb2wgIkFuZGVzIEFYNDVNUCBlcnJhdGEiCj4+PiAt
ICAgICBkZXBlbmRzIG9uIFJJU0NWX0FMVEVSTkFUSVZFCj4+PiArICAgICBkZXBlbmRzIG9uIFJJ
U0NWX0FMVEVSTkFUSVZFICYmIFJJU0NWX1NCSQo+Pj4gICAgICAgaGVscAo+Pj4gICAgICAgICBB
bGwgQW5kZXMgZXJyYXRhIEtjb25maWcgZGVwZW5kIG9uIHRoaXMgS2NvbmZpZy4gRGlzYWJsaW5n
Cj4+PiAgICAgICAgIHRoaXMgS2NvbmZpZyB3aWxsIGRpc2FibGUgYWxsIEFuZGVzIGVycmF0YS4g
UGxlYXNlIHNheSAiWSIKPj4KPj4KPj4gSSdtIHN0aWxsIHNlZWluZyBidWlsZCB3YXJuaW5ncy9l
cnJvcnMgYWZ0ZXIgYXBwbHlpbmcgYWxsIDMgUklTQy1WCj4+IEtjb25maWcgcGF0Y2hlcyBmcm9t
IHRvZGF5ICgyMDIzIFNFUCAwMSkuCj4+Cj4+IFdBUk5JTkc6IHVubWV0IGRpcmVjdCBkZXBlbmRl
bmNpZXMgZGV0ZWN0ZWQgZm9yIEVSUkFUQV9BTkRFUwo+PiAgIERlcGVuZHMgb24gW25dOiBSSVND
Vl9BTFRFUk5BVElWRSBbPXldICYmIFJJU0NWX1NCSSBbPW5dCj4+ICAgU2VsZWN0ZWQgYnkgW3ld
Ogo+PiAgIC0gQVJDSF9SOUEwN0cwNDMgWz15XSAmJiBTT0NfUkVORVNBUyBbPXldICYmIFJJU0NW
IFs9eV0KPj4KPj4gLi4vYXJjaC9yaXNjdi9lcnJhdGEvYW5kZXMvZXJyYXRhLmM6IEluIGZ1bmN0
aW9uICdheDQ1bXBfaW9jcF9zd193b3JrYXJvdW5kJzoKPj4gLi4vYXJjaC9yaXNjdi9lcnJhdGEv
YW5kZXMvZXJyYXRhLmM6Mjk6MjM6IGVycm9yOiBzdG9yYWdlIHNpemUgb2YgJ3JldCcgaXNuJ3Qg
a25vd24KPj4gICAgMjkgfCAgICAgICAgIHN0cnVjdCBzYmlyZXQgcmV0Owo+PiAgICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICBefn4KPj4gLi4vYXJjaC9yaXNjdi9lcnJhdGEvYW5kZXMvZXJy
YXRhLmM6MzU6MTU6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnc2Jp
X2VjYWxsJyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPj4gICAgMzUg
fCAgICAgICAgIHJldCA9IHNiaV9lY2FsbChBTkRFU1RFQ0hfU0JJX0VYVF9BTkRFUywgQU5ERVNf
U0JJX0VYVF9JT0NQX1NXX1dPUktBUk9VTkQsCj4+ICAgICAgIHwgICAgICAgICAgICAgICBefn5+
fn5+fn4KPj4gLi4vYXJjaC9yaXNjdi9lcnJhdGEvYW5kZXMvZXJyYXRhLmM6Mjk6MjM6IHdhcm5p
bmc6IHVudXNlZCB2YXJpYWJsZSAncmV0JyBbLVd1bnVzZWQtdmFyaWFibGVdCj4+ICAgIDI5IHwg
ICAgICAgICBzdHJ1Y3Qgc2JpcmV0IHJldDsKPj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgXn5+Cj4+Cj4+IEFSQ0hfUjlBMDdHMDQzIGluIGRyaXZlcnMvc29jL3JlbmVzYXMvS2NvbmZp
ZyBzZWxlY3RzIEVSUkFUQV9BTkRFUyBhbmQKPj4gRVJSQVRBX0FOREVTX0NNTyBldmVuIHRob3Vn
aCBSSVNDVl9TQkkgaXMgbm90IHNldC9lbmFibGVkLgo+Pgo+IAo+IFlvdSBuZWVkIHRvIGFwcGx5
IHBhdGNoIFsxXSBhc3dlbGwuCj4gCj4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cHJvamVjdC9saW51eC1yaXNjdi9wYXRjaC8yMDIzMDkwMTExMDkzNi4zMTMxNzEtMS1wcmFiaGFr
YXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20vCgpJIHRlc3RlZCB0aGUgZmFpbGluZyBi
dWlsZHMgdGhhdCBJIGhhZCAtIGFmdGVyIGFwcGx5aW5nIGFsbCA0IHBhdGNoZXMgb25seSwKbm90
IGVhY2ggcGF0Y2ggc2VwYXJhdGVseS4KCklmIHRoYXQgaXMgc2F0aXNmYWN0b3J5LCB5b3UgY2Fu
IGFkZApUZXN0ZWQtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgoKVGhh
bmtzLgotLSAKflJhbmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
