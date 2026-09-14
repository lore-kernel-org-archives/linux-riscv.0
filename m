Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85538C88E72
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 16:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=di2T6awAh0f7GqkrqltBHa3goxsEb1xyvVzxkhLktOc=; b=JqKa1pINkIxh6+
	awXzyOllWSC5cH41kDO5+9AdzQX5mefEJevQFXvREYG5r5ETJP9w9Ho+umdaSoFb+uNmAB/8mb6TG
	Ace5TEJde+MgUIpH6XCcZjtY0ctiGsVv4u0DXUkDfB6ICnmb+wDTFBQezvWpGWw0ftDagezZslWyf
	7eEhuxFmCQXy9CRXCTxanYpTQO+Pf1KpArzSfufPGAfkZ2fBImP6UGlfotC/W7Rdy1mwo9JZSKVKl
	KQQW6MlBndLX/YuVfm6lj1Y3fiqY/lQA74K6pttPu7oIm8VZ0Qj2HMUipFArnfwWL8h2iVsYRV+xc
	eVCmgeKAkHDfI3g4Mrxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x69te-00000004Khh-1mQ8;
	Mon, 14 Sep 2026 16:51:10 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x69tZ-00000004KhH-0imz;
	Mon, 14 Sep 2026 16:51:06 +0000
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 68EGnuOe3963808
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 14 Sep 2026 09:49:57 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 68EGnuOe3963808
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026082801; t=1789404601;
	bh=chqvEsr84Q297eDSZWoD36RZB2nZvFGrsL9c2mf5qBQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=UPqg+1WX23h3Ki5DLrty1pJx1am44iqWHAyIVVRI9r5yZ0J2cNq/MctPf7fMKr0Nn
	 1YGB5OcBbL6YqDk32/y1VC1DUpsxdZaJ0ojSZhe8qeiGwSjiIFm7smQ4QJ9Yx8iTtq
	 wd3waGp1gGqIyiv10qjg0VAYZIm0gE18GeUOH4Gkf13htytTHq8YQMCf8LSqUnGWp4
	 nnKj/qVbZk1Hye5oVOx7+nQyO8rNnREqM0BHrOWHcL7tICPNAhTMCN0lVlRsV1u+cB
	 rC9NpgEtdZ5Cf1Ki4BlrNSpYuzW/XrLi2+rCMZx/UZOwL2EgCOj6sn9KaOggIsy0MH
	 wSEhy1WjEjh3g==
Date: Mon, 14 Sep 2026 09:49:50 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Kees Cook <kees@kernel.org>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
CC: Linus Torvalds <torvalds@linux-foundation.org>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>,
        Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
        =?ISO-8859-1?Q?Bj=F6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
        Danilo Krummrich <dakr@kernel.org>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Tamir Duberstein <tamird@kernel.org>,
        Alexandre Courbot <acourbot@nvidia.com>,
        =?ISO-8859-1?Q?Onur_=D6zkan?= <work@onurozkan.dev>,
        Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
        linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
        linux-hardening@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_21/21=5D_kbuild=3A_use_pi?=
 =?US-ASCII?Q?gz_for_gzip_compression_if_available?=
User-Agent: K-9 Mail for Android
In-Reply-To: <202609140844.FA7E848A@keescook>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org> <20260914-build-speedup-v2-21-39817ec5db23@kernel.org> <202609140844.FA7E848A@keescook>
Message-ID: <BCCCC1E7-25B7-4A8D-BDFC-D5D1FA295F6C@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_095105_239589_FE2ABCF8 
X-CRM114-Status: GOOD (  27.49  )
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

T24gU2VwdGVtYmVyIDE0LCAyMDI2IDk6Mzk6MDcgQU0gUERULCBLZWVzIENvb2sgPGtlZXNAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj5PbiBNb24sIFNlcCAxNCwgMjAyNiBhdCAxMDoyMjoyMEFNICswMTAw
LCBMb3JlbnpvIFN0b2FrZXMgKEFSTSkgd3JvdGU6Cj4+IE9uIGEgMTI4LWNvcmUgVGhyZWFkcmlw
cGVyLCBnemlwIC05IG9mIGEgMzYgTWlCIHg4Ni02NCB2bWxpbnV4LmJpbiB0YWtlcwo+PiAxLjZz
LCBhbmQgd2l0aCBwaWd6IGl0IHRha2VzIDAuMDlzLCBzbyB0aGUgcGVyZm9ybWFuY2UgaW5jcmVh
c2UgaXMKPj4gc2lnbmlmaWNhbnQuCj4KPk5lYXQhIEkgd2FubmEgZ28gbGVhcm4gaG93IHBpZ3og
YWNjb21wbGlzaGVzIHRoaXMgLS0gSSB0aG91Z2h0IHRoZQo+cHJvYmxlbSB3aXRoIGd6aXAgd2Fz
IGEgY29tbW9uIGxvb2t1cCB0YWJsZS4gQW55d2F5Li4uCj4KPj4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9rYnVpbGQvcmVwcm9kdWNpYmxlLWJ1aWxkcy5yc3QKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9r
YnVpbGQvcmVwcm9kdWNpYmxlLWJ1aWxkcy5yc3QKPj4gQEAgLTc2LDYgKzc2LDIyIEBAIGluY2x1
ZGUgZ2VuZXJhdGVkIGZpbGVzLiAgWW91IHNob3VsZCBlbnN1cmUgdGhlIHNvdXJjZSB0cmVlIGlz
Cj4+ICBwcmlzdGluZSBieSBydW5uaW5nIGBgbWFrZSBtcnByb3BlcmBgIG9yIGBgZ2l0IGNsZWFu
IC1kIC1mIC14YGAgYmVmb3JlCj4+ICBidWlsZGluZyBhIHNvdXJjZSBwYWNrYWdlLgo+PiAgCj4+
ICtDb21wcmVzc2lvbiB0b29scwo+PiArLS0tLS0tLS0tLS0tLS0tLS0KPj4gKwo+PiArVGhlIGNv
bXByZXNzZWQga2VybmVsIGltYWdlLCBjb21wcmVzc2VkIG1vZHVsZXMgYW5kIHBhY2thZ2VzIGFy
ZSBwcm9kdWNlZAo+PiArdXNpbmcgdGhlIHByb2dyYW0gbmFtZWQgYnkgdGhlIG1ha2UgdmFyaWFi
bGUgYGBLR1pJUGBgIChkZXNjcmliZWQgaW4KPj4gK0RvY3VtZW50YXRpb24va2J1aWxkL2tidWls
ZC5yc3QpLgo+PiArCj4+ICtJdCBkZWZhdWx0cyB0byBgYHBpZ3pgYCBpZiBpbnN0YWxsZWQgKGEg
cGFyYWxsZWwgaW1wbGVtZW50YXRpb24gb2YgZ3ppcCksCj4+ICtvciBgYGd6aXBgYCBvdGhlcndp
c2UuCj4+ICsKPj4gK1RoZSBnZW5lcmF0ZWQgb3V0cHV0IGJldHdlZW4gdHdvIGludm9jYXRpb25z
IG9mIGlkZW50aWNhbCBidWlsZHMgd2l0aAo+PiArZWl0aGVyIG9mIHRoZSBkZWZhdWx0IHRvb2xz
IHdpbGwgYmUgYnl0ZS1mb3ItYnl0ZSBlcXVpdmFsZW50Lgo+PiArCj4+ICtIb3dldmVyLCBmb3Ig
cmVwcm9kdWNpYmxlIGJ1aWxkcywgZW5zdXJlIHRoZSBzYW1lIHRvb2wgaXMgdXNlZCBvbiBhbGwg
YnVpbGQKPj4gK2hvc3RzLCBhcyBkaWZmZXJlbnQgdG9vbHMgbWF5IGdlbmVyYXRlIGRpZmZlcmVu
dCBvdXRwdXQgZnJvbSBvbmUgYW5vdGhlci4KPj4gKwo+PiAgTW9kdWxlIHNpZ25pbmcKPj4gIC0t
LS0tLS0tLS0tLS0tCj4+ICAKPgo+VGhpcyBkb2MgdXBkYXRlIHNlZW1zIHRvdGFsbHkgdW5uZWVk
ZWQ/IEhhdmluZyB0aGUgc2FtZSBidWlsZCB0b29scyBmb3IgUkIKPmlzIGFscmVhZHkgYSBrbm93
biByZXF1aXJlbWVudC4gSSBkb24ndCB0aGluayBhbnl0aGluZyBuZXcgaXMgYWRkZWQgaGVyZT8K
Pgo+PiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQo+PiBpbmRleCA3OTBlZjIzYzVl
OGEuLjM4YzBjZGM5ZjU5MSAxMDA2NDQKPj4gLS0tIGEvTWFrZWZpbGUKPj4gKysrIGIvTWFrZWZp
bGUKPj4gQEAgLTU2MSw3ICs1NjEsNyBAQCBQRVJMCQk9IHBlcmwKPj4gIFBZVEhPTjMJCT0gcHl0
aG9uMwo+PiAgQ0hFQ0sJCT0gc3BhcnNlCj4+ICBCQVNICQk9IGJhc2gKPj4gLUtHWklQCQk9IGd6
aXAKPj4gK0tHWklQCQk6PSAkKGlmICQoc2hlbGwgY29tbWFuZCAtdiBwaWd6IDI+L2Rldi9udWxs
KSxwaWd6LGd6aXApCj4KPkkgdGhpbmsgdGhlIG1vcmUgaWRpb21hdGljIHdheSB0byBkbyB0aGlz
IGlzOgo+Cj5LR1pJUCA6PSAkKGNhbGwgdHJ5LXJ1bixjb21tYW5kIC12IHBpZ3oscGlneixnemlw
KQo+Cj5Ib3dldmVyLCBwYXJhbGxlbGlzbSBuZWVkcyB0byBiZSBzZXQuIFdlIGNhbid0IGxldCBp
dCBlYXQgYWxsIENQVXM6IGl0Cj5uZWVkcyB0byByZXNwZWN0IHRoZSAtaiBtYWtlIG9wdGlvbiAo
YW5kIG1ha2UgaXRzIENQVSByZXNlcnZhdGlvbiBrbm93bgo+dG8gIm1ha2UiKSwgd2hpY2ggd2Ug
YWxyZWFkeSBoYXZlIGEgc29sdXRpb24gZm9yIGluCj5zY3JpcHRzL2pvYnNlcnZlci1leGVjLgo+
Cj5Ib3dldmVyLCBJIHdvdWxkIGFjdHVhbGx5IGFyZ3VlIHRoYXQgZ2l2ZW4gc3VjaCBhbiBpbXBy
b3ZlbWVudCB3ZSBzaG91bGQganVzdAo+bWFrZSBwaWd6IGV4cGxpY2l0bHkgcmVxdWlyZWQgYW5k
IG5vdCBvcHRpb25hbC4gSXQgaXMgcGFja2FnZWQgZXZlcnl3aGVyZToKPgo+ICDilIIgRGViaWFu
IC8gVWJ1bnR1ICAgICAgICAgICAgICDilIIg4pyFICAgICAgICAgIOKUgiBwaWd6IChtYWluKQo+
ICDilIIgRmVkb3JhICAgICAgICAgICAgICAgICAgICAgICDilIIg4pyFICAgICAgICAgIOKUgiBw
aWd6IDIuOCAoY3VycmVudCkKPiAg4pSCIFJIRUwgLyBDZW50T1MgLyBSb2NreSAvIEFsbWEg4pSC
IOKchSB2aWEgRVBFTCDilIIgcGlneiDigJQgbm90IGluIGJhc2UvQXBwU3RyZWFtCj4gIOKUgiBv
cGVuU1VTRSAvIFNMRSAgICAgICAgICAgICAgIOKUgiDinIUgICAgICAgICAg4pSCIHBpZ3oKPiAg
4pSCIEFyY2ggTGludXggICAgICAgICAgICAgICAgICAg4pSCIOKchSAgICAgICAgICDilIIgcGln
eiAoZXh0cmEpCj4gIOKUgiBBbHBpbmUgICAgICAgICAgICAgICAgICAgICAgIOKUgiDinIUgICAg
ICAgICAg4pSCIHBpZ3oKPiAg4pSCIEdlbnRvbyAgICAgICAgICAgICAgICAgICAgICAg4pSCIOKc
hSAgICAgICAgICDilIIgYXBwLWFyY2gvcGlneiAyLjgKPgo+T25seSBSSEVMIGFwcGVhcnMgYSBs
aXR0bGUgZ2xpdGNoeSwgYnV0IGxpa2VseSB0aGV5IHdvdWxkIHRyaXZpYWxseSBtb3ZlCj5pdCB0
byBiYXNlIHNpbmNlIGl0J3MgYWxyZWFkeSBwYWNrYWdlZCwgYnV0IG9mZiBpbiBFUEVMLgo+Cj5T
bywgSSB3b3VsZCBzYXkgdGhhdCBwaWd6IHdvdWxkIGJlIGJlc3QgcnVuIGFzIHNvbWV0aGluZyBs
aWtlOgo+Cj4gIEtHWklQIDo9ICQoUFlUSE9OMykgJChhYnNfc3JjdHJlZSkvc2NyaXB0cy9qb2Jz
ZXJ2ZXItZXhlYyAkKGFic19zcmN0cmVlKS9zY3JpcHRzL3BhcmFsbGVsLXBpZ3oKPgo+d2l0aCBz
Y3JpcHRzL3BhcmFsbGVsLXBpZ3ogYmVpbmcgc29tZXRoaW5nIGxpa2U6Cj4KPgkjIS9iaW4vc2gK
PglleGVjIHBpZ3ogLXAgJHtQQVJBTExFTElTTTotMX0gIiRAIgo+Cj4+IC0tLSBhL3NjcmlwdHMv
TWFrZWZpbGUubW9kaW5zdAo+PiArKysgYi9zY3JpcHRzL01ha2VmaWxlLm1vZGluc3QKPj4gQEAg
LTE0NSw4ICsxNDUsMTAgQEAgZW5kaWYKPj4gICMKPj4gICMgQ29tcHJlc3Npb24KPj4gICMKPj4g
KyMgTW9kdWxlcyBhcmUgY29tcHJlc3NlZCBpbiBwYXJhbGxlbCBieSBtYWtlIGl0c2VsZiwgc28g
a2VlcCB0aGUgY29tcHJlc3Nvcgo+PiArIyBzaW5nbGUtdGhyZWFkZWQgd2hlbiBpdCBpcyBwaWd6
Lgo+PiAgcXVpZXRfY21kX2d6aXAgPSBHWklQICAgICRACj4+IC0gICAgICBjbWRfZ3ppcCA9ICQo
S0daSVApIC1uIC1mICQ8Cj4+ICsgICAgICBjbWRfZ3ppcCA9ICQoS0daSVApICQoaWYgJChmaWx0
ZXIgcGlneiwkKG5vdGRpciAkKGZpcnN0d29yZCAkKEtHWklQKSkpKSwtcCAxKSAtbiAtZiAkPAo+
PiAgcXVpZXRfY21kX3h6ID0gWFogICAgICAkQAo+Cj5UaGVuIHRoaXMgY291bGQgYmU6Cj4KPglj
bWRfZ3ppcCA9IFNJTkdMRV9USFJFQURFRD0xICQoS0daSVApIC1uIC1mICQ8Cj4KPmFuZCB3ZSBw
YXRjaCBzY3JpcHRzL2pvYnNlcnZlci1leGVjOgo+Cj5kaWZmIC0tZ2l0IGEvc2NyaXB0cy9qb2Jz
ZXJ2ZXItZXhlYyBiL3NjcmlwdHMvam9ic2VydmVyLWV4ZWMKPmluZGV4IDIxYjMxOWU2YzlhNS4u
OGI5NTMxNDhlZTlmIDEwMDc1NQo+LS0tIGEvc2NyaXB0cy9qb2JzZXJ2ZXItZXhlYwo+KysrIGIv
c2NyaXB0cy9qb2JzZXJ2ZXItZXhlYwo+QEAgLTUsNiArNSw3IEBACj4gRGV0ZXJtaW5lcyBob3cg
bWFueSBwYXJhbGxlbCB0YXNrcyAibWFrZSIgaXMgZXhwZWN0aW5nLCBhcyBpdCBpcwo+IG5vdCBl
eHBvc2VkIHZpYSBhbnkgc3BlY2lhbCB2YXJpYWJsZXMsIHJlc2VydmVzIHRoZW0gYWxsLCBydW5z
IGEgc3VicHJvY2Vzcwo+IHdpdGggUEFSQUxMRUxJU00gZW52aXJvbm1lbnQgdmFyaWFibGUgc2V0
LCBhbmQgcmVsZWFzZXMgdGhlIGpvYnMgYmFjayBhZ2Fpbi4KPitJZiBTSU5HTEVfVEhSRUFERUQg
aXMgc2V0LCBub3RoaW5nIGlzIHJlc2VydmVkIGFuZCBQQVJBTExFTElTTSBpcyAxLgo+IAo+IFNl
ZToKPiAgICAgaHR0cHM6Ly93d3cuZ251Lm9yZy9zb2Z0d2FyZS9tYWtlL21hbnVhbC9odG1sX25v
ZGUvUE9TSVgtSm9ic2VydmVyLmh0bWwjUE9TSVgtSm9ic2VydmVyCj5kaWZmIC0tZ2l0IGEvdG9v
bHMvbGliL3B5dGhvbi9qb2JzZXJ2ZXIucHkgYi90b29scy9saWIvcHl0aG9uL2pvYnNlcnZlci5w
eQo+aW5kZXggMGIxZmZkZjlmN2EzLi5mYzM4YzUwMjBiMjIgMTAwNzU1Cj4tLS0gYS90b29scy9s
aWIvcHl0aG9uL2pvYnNlcnZlci5weQo+KysrIGIvdG9vbHMvbGliL3B5dGhvbi9qb2JzZXJ2ZXIu
cHkKPkBAIC0yOSw2ICsyOSwxMSBAQCAkY2xhaW0gY2hpbGQgdG8gZG8gdGhlIGFjdHVhbCB3b3Jr
Lgo+IFRoZSBlbmQgZ29hbCBoZXJlIGlzIHRvIGtlZXAgdGhlIHRvdGFsIG51bWJlciBvZiBidWls
ZCB0YXNrcyB1bmRlciB0aGUKPiBsaW1pdCBlc3RhYmxpc2hlZCBieSB0aGUgaW5pdGlhbCBgYG1h
a2UgLWokbl9wcm9jYGAgY2FsbC4KPiAKPitTZXR0aW5nIHRoZSBgYFNJTkdMRV9USFJFQURFRGBg
IGVudmlyb25tZW50IHZhcmlhYmxlIHNraXBzIHRoZSByZXNlcnZhdGlvbgo+K2VudGlyZWx5IGFu
ZCBydW5zIHRoZSBjb21tYW5kIHdpdGggYGBQQVJBTExFTElTTT0xYGAuIFRoaXMgaXMgbWVhbnQg
Zm9yIGNhbGxlcnMKPit0aGF0IHJ1biBtYW55IHNob3J0IGNvbW1hbmRzIGluIHBhcmFsbGVsIHRo
ZW1zZWx2ZXMsIHdoZXJlIGVhY2ggb25lIHNob3VsZCB1c2UKPitvbmx5IHRoZSBqb2Igc2xvdCBp
dCBhbHJlYWR5IGhvbGRzLgo+Kwo+IFNlZToKPiAgICAgaHR0cHM6Ly93d3cuZ251Lm9yZy9zb2Z0
d2FyZS9tYWtlL21hbnVhbC9odG1sX25vZGUvUE9TSVgtSm9ic2VydmVyLmh0bWwjUE9TSVgtSm9i
c2VydmVyCj4gIiIiCj5AQCAtNjgsNiArNzMsMTMgQEAgY2xhc3MgSm9ic2VydmVyRXhlYzoKPiAg
ICAgICAgIHNlbGYuaXNfb3BlbiA9IFRydWUgICMgV2Ugb25seSB0cnkgb25jZQo+ICAgICAgICAg
c2VsZi5jbGFpbSA9IE5vbmUKPiAgICAgICAgICMKPisgICAgICAgICMgU0lOR0xFX1RIUkVBREVE
IGFza3MgZm9yIG5vIHJlc2VydmF0aW9uIGF0IGFsbDogdGhlIGNvbW1hbmQgcnVucwo+KyAgICAg
ICAgIyB3aXRoIFBBUkFMTEVMSVNNPTEsIHVzaW5nIG9ubHkgdGhlIHNsb3QgaXRzIGNhbGxlciBh
bHJlYWR5IGhvbGRzLgo+KyAgICAgICAgIwo+KyAgICAgICAgaWYgb3MuZW52aXJvbi5nZXQoJ1NJ
TkdMRV9USFJFQURFRCcpOgo+KyAgICAgICAgICAgIHNlbGYuY2xhaW0gPSAxCj4rICAgICAgICAg
ICAgcmV0dXJuCj4rICAgICAgICAjCj4gICAgICAgICAjIENoZWNrIHRoZSBtYWtlIGZsYWdzIGZv
ciAiLS1qb2JzZXJ2ZXI9UixXIgo+ICAgICAgICAgIyBOb3RlIHRoYXQgR05VIE1ha2UgaGFzIHVz
ZWQgLS1qb2JzZXJ2ZXItZmRzIGFuZCAtLWpvYnNlcnZlci1hdXRoCj4gICAgICAgICAjIHNvIHRo
aXMgaGFuZGxlcyBhbGwgb2YgdGhlbS4KPgoKSWYgd2UgYXJlIGdvaW5nIHRvIGFkZCBkZXBlbmRl
bmNpZXMsIGNhbiB3ZSBhZGQgKmFueSogc2NyaXB0aW5nIGxhbmd1YWdlIHRoYXQgaXMgbGVzcyBz
dG9uZSB0YWJsZXQgdGhhbiBQT1NJWCBhd2s/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
