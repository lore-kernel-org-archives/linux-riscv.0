Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5595C88E6F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 16:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gwm/iZgNJDAeiis1jpEx1RPEIuQS+SHkDj6xHl4oGG4=; b=woFBT+7sx2vy62
	9eUYVRBoSqF7Gm/bENm92s9+8Q71v0yurmD3fpTWYxINN+Qu6qP5JijeZioJ/q8as6LUUzGJcdb5T
	/4ISHF2hz5wMSYjsER2bm+XJ3JBf1qqHvxTtFkRA+DMQuvHXp6GyVnjcCSSEZF1lknSXieEQ6d8b+
	rfwp1Ki0EODyaeHqEDpdgCQLRmfQq0zmmvj+9S33tfCSFRS1UCArEggy0GDqaYwQf09zTU7NEMa3V
	ZBV5hvUHpsZk0jZDeBj0/VN6vHlaK4KhgrzBabbpi5dT4th3+MkJZcWAH1sQH6TvBasliibTgFJ1c
	wfnmX/7cx9+kvCr6suwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x69i4-00000004JTr-25tZ;
	Mon, 14 Sep 2026 16:39:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x69i0-00000004JT0-18PD;
	Mon, 14 Sep 2026 16:39:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C217043CFB;
	Mon, 14 Sep 2026 16:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95FC81F000FF;
	Mon, 14 Sep 2026 16:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789403947;
	bh=6HknANauAYpVcDvBFdOVBRdba2wd0Jbv9VXA9ZYdWMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R+rUjGKaNHhSbqlLKdbClzYWSNwn1aEsQuvVk58BCumZX6GbEWMaIx5uiDdhiDJk0
	 CD8l4tUwyV0dfl7lYL/pp8M2/85iWUUrATBrPwvdN98jny/BsxFlUDHmd6RVkKbA8c
	 rHT0ej6apJWOsPBsmxukBs9nofdf/DXyMUVvKecCAtXFzCAxBU+RflJPLgxINonQg1
	 qvXyn5f6Egdss0OEP8YDQ8eTTzxMIDEylhOixJFUjLsODvG79PX6X/zTv8nDo4erjB
	 wT94jYd9C3CoJzIoOYyYCWa1cKK05r6F9hCnpeFnOkm4QaEqaCij52+70o31wKbG2p
	 nMZUUzm/z2qDQ==
Date: Mon, 14 Sep 2026 09:39:07 -0700
From: Kees Cook <kees@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexey Gladkov <legion@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 21/21] kbuild: use pigz for gzip compression if
 available
Message-ID: <202609140844.FA7E848A@keescook>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-21-39817ec5db23@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260914-build-speedup-v2-21-39817ec5db23@kernel.org>
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

T24gTW9uLCBTZXAgMTQsIDIwMjYgYXQgMTA6MjI6MjBBTSArMDEwMCwgTG9yZW56byBTdG9ha2Vz
IChBUk0pIHdyb3RlOgo+IE9uIGEgMTI4LWNvcmUgVGhyZWFkcmlwcGVyLCBnemlwIC05IG9mIGEg
MzYgTWlCIHg4Ni02NCB2bWxpbnV4LmJpbiB0YWtlcwo+IDEuNnMsIGFuZCB3aXRoIHBpZ3ogaXQg
dGFrZXMgMC4wOXMsIHNvIHRoZSBwZXJmb3JtYW5jZSBpbmNyZWFzZSBpcwo+IHNpZ25pZmljYW50
LgoKTmVhdCEgSSB3YW5uYSBnbyBsZWFybiBob3cgcGlneiBhY2NvbXBsaXNoZXMgdGhpcyAtLSBJ
IHRob3VnaHQgdGhlCnByb2JsZW0gd2l0aCBnemlwIHdhcyBhIGNvbW1vbiBsb29rdXAgdGFibGUu
IEFueXdheS4uLgoKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2tidWlsZC9yZXByb2R1Y2libGUtYnVp
bGRzLnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24va2J1aWxkL3JlcHJvZHVjaWJsZS1idWlsZHMu
cnN0Cj4gQEAgLTc2LDYgKzc2LDIyIEBAIGluY2x1ZGUgZ2VuZXJhdGVkIGZpbGVzLiAgWW91IHNo
b3VsZCBlbnN1cmUgdGhlIHNvdXJjZSB0cmVlIGlzCj4gIHByaXN0aW5lIGJ5IHJ1bm5pbmcgYGBt
YWtlIG1ycHJvcGVyYGAgb3IgYGBnaXQgY2xlYW4gLWQgLWYgLXhgYCBiZWZvcmUKPiAgYnVpbGRp
bmcgYSBzb3VyY2UgcGFja2FnZS4KPiAgCj4gK0NvbXByZXNzaW9uIHRvb2xzCj4gKy0tLS0tLS0t
LS0tLS0tLS0tCj4gKwo+ICtUaGUgY29tcHJlc3NlZCBrZXJuZWwgaW1hZ2UsIGNvbXByZXNzZWQg
bW9kdWxlcyBhbmQgcGFja2FnZXMgYXJlIHByb2R1Y2VkCj4gK3VzaW5nIHRoZSBwcm9ncmFtIG5h
bWVkIGJ5IHRoZSBtYWtlIHZhcmlhYmxlIGBgS0daSVBgYCAoZGVzY3JpYmVkIGluCj4gK0RvY3Vt
ZW50YXRpb24va2J1aWxkL2tidWlsZC5yc3QpLgo+ICsKPiArSXQgZGVmYXVsdHMgdG8gYGBwaWd6
YGAgaWYgaW5zdGFsbGVkIChhIHBhcmFsbGVsIGltcGxlbWVudGF0aW9uIG9mIGd6aXApLAo+ICtv
ciBgYGd6aXBgYCBvdGhlcndpc2UuCj4gKwo+ICtUaGUgZ2VuZXJhdGVkIG91dHB1dCBiZXR3ZWVu
IHR3byBpbnZvY2F0aW9ucyBvZiBpZGVudGljYWwgYnVpbGRzIHdpdGgKPiArZWl0aGVyIG9mIHRo
ZSBkZWZhdWx0IHRvb2xzIHdpbGwgYmUgYnl0ZS1mb3ItYnl0ZSBlcXVpdmFsZW50Lgo+ICsKPiAr
SG93ZXZlciwgZm9yIHJlcHJvZHVjaWJsZSBidWlsZHMsIGVuc3VyZSB0aGUgc2FtZSB0b29sIGlz
IHVzZWQgb24gYWxsIGJ1aWxkCj4gK2hvc3RzLCBhcyBkaWZmZXJlbnQgdG9vbHMgbWF5IGdlbmVy
YXRlIGRpZmZlcmVudCBvdXRwdXQgZnJvbSBvbmUgYW5vdGhlci4KPiArCj4gIE1vZHVsZSBzaWdu
aW5nCj4gIC0tLS0tLS0tLS0tLS0tCj4gIAoKVGhpcyBkb2MgdXBkYXRlIHNlZW1zIHRvdGFsbHkg
dW5uZWVkZWQ/IEhhdmluZyB0aGUgc2FtZSBidWlsZCB0b29scyBmb3IgUkIKaXMgYWxyZWFkeSBh
IGtub3duIHJlcXVpcmVtZW50LiBJIGRvbid0IHRoaW5rIGFueXRoaW5nIG5ldyBpcyBhZGRlZCBo
ZXJlPwoKPiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQo+IGluZGV4IDc5MGVmMjNj
NWU4YS4uMzhjMGNkYzlmNTkxIDEwMDY0NAo+IC0tLSBhL01ha2VmaWxlCj4gKysrIGIvTWFrZWZp
bGUKPiBAQCAtNTYxLDcgKzU2MSw3IEBAIFBFUkwJCT0gcGVybAo+ICBQWVRIT04zCQk9IHB5dGhv
bjMKPiAgQ0hFQ0sJCT0gc3BhcnNlCj4gIEJBU0gJCT0gYmFzaAo+IC1LR1pJUAkJPSBnemlwCj4g
K0tHWklQCQk6PSAkKGlmICQoc2hlbGwgY29tbWFuZCAtdiBwaWd6IDI+L2Rldi9udWxsKSxwaWd6
LGd6aXApCgpJIHRoaW5rIHRoZSBtb3JlIGlkaW9tYXRpYyB3YXkgdG8gZG8gdGhpcyBpczoKCktH
WklQIDo9ICQoY2FsbCB0cnktcnVuLGNvbW1hbmQgLXYgcGlneixwaWd6LGd6aXApCgpIb3dldmVy
LCBwYXJhbGxlbGlzbSBuZWVkcyB0byBiZSBzZXQuIFdlIGNhbid0IGxldCBpdCBlYXQgYWxsIENQ
VXM6IGl0Cm5lZWRzIHRvIHJlc3BlY3QgdGhlIC1qIG1ha2Ugb3B0aW9uIChhbmQgbWFrZSBpdHMg
Q1BVIHJlc2VydmF0aW9uIGtub3duCnRvICJtYWtlIiksIHdoaWNoIHdlIGFscmVhZHkgaGF2ZSBh
IHNvbHV0aW9uIGZvciBpbgpzY3JpcHRzL2pvYnNlcnZlci1leGVjLgoKSG93ZXZlciwgSSB3b3Vs
ZCBhY3R1YWxseSBhcmd1ZSB0aGF0IGdpdmVuIHN1Y2ggYW4gaW1wcm92ZW1lbnQgd2Ugc2hvdWxk
IGp1c3QKbWFrZSBwaWd6IGV4cGxpY2l0bHkgcmVxdWlyZWQgYW5kIG5vdCBvcHRpb25hbC4gSXQg
aXMgcGFja2FnZWQgZXZlcnl3aGVyZToKCiAg4pSCIERlYmlhbiAvIFVidW50dSAgICAgICAgICAg
ICAg4pSCIOKchSAgICAgICAgICDilIIgcGlneiAobWFpbikKICDilIIgRmVkb3JhICAgICAgICAg
ICAgICAgICAgICAgICDilIIg4pyFICAgICAgICAgIOKUgiBwaWd6IDIuOCAoY3VycmVudCkKICDi
lIIgUkhFTCAvIENlbnRPUyAvIFJvY2t5IC8gQWxtYSDilIIg4pyFIHZpYSBFUEVMIOKUgiBwaWd6
IOKAlCBub3QgaW4gYmFzZS9BcHBTdHJlYW0KICDilIIgb3BlblNVU0UgLyBTTEUgICAgICAgICAg
ICAgICDilIIg4pyFICAgICAgICAgIOKUgiBwaWd6CiAg4pSCIEFyY2ggTGludXggICAgICAgICAg
ICAgICAgICAg4pSCIOKchSAgICAgICAgICDilIIgcGlneiAoZXh0cmEpCiAg4pSCIEFscGluZSAg
ICAgICAgICAgICAgICAgICAgICAg4pSCIOKchSAgICAgICAgICDilIIgcGlnegogIOKUgiBHZW50
b28gICAgICAgICAgICAgICAgICAgICAgIOKUgiDinIUgICAgICAgICAg4pSCIGFwcC1hcmNoL3Bp
Z3ogMi44CgpPbmx5IFJIRUwgYXBwZWFycyBhIGxpdHRsZSBnbGl0Y2h5LCBidXQgbGlrZWx5IHRo
ZXkgd291bGQgdHJpdmlhbGx5IG1vdmUKaXQgdG8gYmFzZSBzaW5jZSBpdCdzIGFscmVhZHkgcGFj
a2FnZWQsIGJ1dCBvZmYgaW4gRVBFTC4KClNvLCBJIHdvdWxkIHNheSB0aGF0IHBpZ3ogd291bGQg
YmUgYmVzdCBydW4gYXMgc29tZXRoaW5nIGxpa2U6CgogIEtHWklQIDo9ICQoUFlUSE9OMykgJChh
YnNfc3JjdHJlZSkvc2NyaXB0cy9qb2JzZXJ2ZXItZXhlYyAkKGFic19zcmN0cmVlKS9zY3JpcHRz
L3BhcmFsbGVsLXBpZ3oKCndpdGggc2NyaXB0cy9wYXJhbGxlbC1waWd6IGJlaW5nIHNvbWV0aGlu
ZyBsaWtlOgoKCSMhL2Jpbi9zaAoJZXhlYyBwaWd6IC1wICR7UEFSQUxMRUxJU006LTF9ICIkQCIK
Cj4gLS0tIGEvc2NyaXB0cy9NYWtlZmlsZS5tb2RpbnN0Cj4gKysrIGIvc2NyaXB0cy9NYWtlZmls
ZS5tb2RpbnN0Cj4gQEAgLTE0NSw4ICsxNDUsMTAgQEAgZW5kaWYKPiAgIwo+ICAjIENvbXByZXNz
aW9uCj4gICMKPiArIyBNb2R1bGVzIGFyZSBjb21wcmVzc2VkIGluIHBhcmFsbGVsIGJ5IG1ha2Ug
aXRzZWxmLCBzbyBrZWVwIHRoZSBjb21wcmVzc29yCj4gKyMgc2luZ2xlLXRocmVhZGVkIHdoZW4g
aXQgaXMgcGlnei4KPiAgcXVpZXRfY21kX2d6aXAgPSBHWklQICAgICRACj4gLSAgICAgIGNtZF9n
emlwID0gJChLR1pJUCkgLW4gLWYgJDwKPiArICAgICAgY21kX2d6aXAgPSAkKEtHWklQKSAkKGlm
ICQoZmlsdGVyIHBpZ3osJChub3RkaXIgJChmaXJzdHdvcmQgJChLR1pJUCkpKSksLXAgMSkgLW4g
LWYgJDwKPiAgcXVpZXRfY21kX3h6ID0gWFogICAgICAkQAoKVGhlbiB0aGlzIGNvdWxkIGJlOgoK
CWNtZF9nemlwID0gU0lOR0xFX1RIUkVBREVEPTEgJChLR1pJUCkgLW4gLWYgJDwKCmFuZCB3ZSBw
YXRjaCBzY3JpcHRzL2pvYnNlcnZlci1leGVjOgoKZGlmZiAtLWdpdCBhL3NjcmlwdHMvam9ic2Vy
dmVyLWV4ZWMgYi9zY3JpcHRzL2pvYnNlcnZlci1leGVjCmluZGV4IDIxYjMxOWU2YzlhNS4uOGI5
NTMxNDhlZTlmIDEwMDc1NQotLS0gYS9zY3JpcHRzL2pvYnNlcnZlci1leGVjCisrKyBiL3Njcmlw
dHMvam9ic2VydmVyLWV4ZWMKQEAgLTUsNiArNSw3IEBACiBEZXRlcm1pbmVzIGhvdyBtYW55IHBh
cmFsbGVsIHRhc2tzICJtYWtlIiBpcyBleHBlY3RpbmcsIGFzIGl0IGlzCiBub3QgZXhwb3NlZCB2
aWEgYW55IHNwZWNpYWwgdmFyaWFibGVzLCByZXNlcnZlcyB0aGVtIGFsbCwgcnVucyBhIHN1YnBy
b2Nlc3MKIHdpdGggUEFSQUxMRUxJU00gZW52aXJvbm1lbnQgdmFyaWFibGUgc2V0LCBhbmQgcmVs
ZWFzZXMgdGhlIGpvYnMgYmFjayBhZ2Fpbi4KK0lmIFNJTkdMRV9USFJFQURFRCBpcyBzZXQsIG5v
dGhpbmcgaXMgcmVzZXJ2ZWQgYW5kIFBBUkFMTEVMSVNNIGlzIDEuCiAKIFNlZToKICAgICBodHRw
czovL3d3dy5nbnUub3JnL3NvZnR3YXJlL21ha2UvbWFudWFsL2h0bWxfbm9kZS9QT1NJWC1Kb2Jz
ZXJ2ZXIuaHRtbCNQT1NJWC1Kb2JzZXJ2ZXIKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYi9weXRob24v
am9ic2VydmVyLnB5IGIvdG9vbHMvbGliL3B5dGhvbi9qb2JzZXJ2ZXIucHkKaW5kZXggMGIxZmZk
ZjlmN2EzLi5mYzM4YzUwMjBiMjIgMTAwNzU1Ci0tLSBhL3Rvb2xzL2xpYi9weXRob24vam9ic2Vy
dmVyLnB5CisrKyBiL3Rvb2xzL2xpYi9weXRob24vam9ic2VydmVyLnB5CkBAIC0yOSw2ICsyOSwx
MSBAQCAkY2xhaW0gY2hpbGQgdG8gZG8gdGhlIGFjdHVhbCB3b3JrLgogVGhlIGVuZCBnb2FsIGhl
cmUgaXMgdG8ga2VlcCB0aGUgdG90YWwgbnVtYmVyIG9mIGJ1aWxkIHRhc2tzIHVuZGVyIHRoZQog
bGltaXQgZXN0YWJsaXNoZWQgYnkgdGhlIGluaXRpYWwgYGBtYWtlIC1qJG5fcHJvY2BgIGNhbGwu
CiAKK1NldHRpbmcgdGhlIGBgU0lOR0xFX1RIUkVBREVEYGAgZW52aXJvbm1lbnQgdmFyaWFibGUg
c2tpcHMgdGhlIHJlc2VydmF0aW9uCitlbnRpcmVseSBhbmQgcnVucyB0aGUgY29tbWFuZCB3aXRo
IGBgUEFSQUxMRUxJU009MWBgLiBUaGlzIGlzIG1lYW50IGZvciBjYWxsZXJzCit0aGF0IHJ1biBt
YW55IHNob3J0IGNvbW1hbmRzIGluIHBhcmFsbGVsIHRoZW1zZWx2ZXMsIHdoZXJlIGVhY2ggb25l
IHNob3VsZCB1c2UKK29ubHkgdGhlIGpvYiBzbG90IGl0IGFscmVhZHkgaG9sZHMuCisKIFNlZToK
ICAgICBodHRwczovL3d3dy5nbnUub3JnL3NvZnR3YXJlL21ha2UvbWFudWFsL2h0bWxfbm9kZS9Q
T1NJWC1Kb2JzZXJ2ZXIuaHRtbCNQT1NJWC1Kb2JzZXJ2ZXIKICIiIgpAQCAtNjgsNiArNzMsMTMg
QEAgY2xhc3MgSm9ic2VydmVyRXhlYzoKICAgICAgICAgc2VsZi5pc19vcGVuID0gVHJ1ZSAgIyBX
ZSBvbmx5IHRyeSBvbmNlCiAgICAgICAgIHNlbGYuY2xhaW0gPSBOb25lCiAgICAgICAgICMKKyAg
ICAgICAgIyBTSU5HTEVfVEhSRUFERUQgYXNrcyBmb3Igbm8gcmVzZXJ2YXRpb24gYXQgYWxsOiB0
aGUgY29tbWFuZCBydW5zCisgICAgICAgICMgd2l0aCBQQVJBTExFTElTTT0xLCB1c2luZyBvbmx5
IHRoZSBzbG90IGl0cyBjYWxsZXIgYWxyZWFkeSBob2xkcy4KKyAgICAgICAgIworICAgICAgICBp
ZiBvcy5lbnZpcm9uLmdldCgnU0lOR0xFX1RIUkVBREVEJyk6CisgICAgICAgICAgICBzZWxmLmNs
YWltID0gMQorICAgICAgICAgICAgcmV0dXJuCisgICAgICAgICMKICAgICAgICAgIyBDaGVjayB0
aGUgbWFrZSBmbGFncyBmb3IgIi0tam9ic2VydmVyPVIsVyIKICAgICAgICAgIyBOb3RlIHRoYXQg
R05VIE1ha2UgaGFzIHVzZWQgLS1qb2JzZXJ2ZXItZmRzIGFuZCAtLWpvYnNlcnZlci1hdXRoCiAg
ICAgICAgICMgc28gdGhpcyBoYW5kbGVzIGFsbCBvZiB0aGVtLgoKLS0gCktlZXMgQ29vawoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
