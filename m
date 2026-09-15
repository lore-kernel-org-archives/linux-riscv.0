Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF48C88E7D
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 18:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2gutP94vAvWb9px8UKBk+rLTrPF90OuBpoOJplmJ0vE=; b=bDYcm3pMPnHs/ymWuzxz9tsa/h
	FvFbfoReMGi5pm20jv81iBkSjmfQZWX8HewXBqMyEbB6czVdQ85oAb7rmcX0nWMZQUr+St6CGky74
	7chfmQuHO4nL2e1ngU0doS2oVi8hYKOtO4VngAl+TnkEiaPD5SEpq+04hSdscbzR7ljRMVsnbVEnr
	9wpUxTafzqEmCDRvz5pkkDKrVwdTadSQKJ3iDN8CXyqPDLdHMUjNwTKMi+p6PXsQZpDhP0x1F4xgn
	gj6Zg2HWWqJ53Hg57jhnMSSxJxP7aLpA7k/UFaj63ys5SE3FQP5UHsS/OS1gniZOhImmOfzsmS5GB
	+4fPA2fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XVZ-00000007gtV-0TMg;
	Tue, 15 Sep 2026 18:03:53 +0000
Received: from flow-b8-smtp.messagingengine.com ([202.12.124.143])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XVV-00000007gsh-3AEA;
	Tue, 15 Sep 2026 18:03:51 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.stl.internal (Postfix) with ESMTP id 5358A1300085;
	Tue, 15 Sep 2026 14:03:43 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 15 Sep 2026 14:03:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789495422;
	 x=1789502622; bh=M+18z9TRevaxtOpUOsKP4yasoi0N4a+EiZHqRi1jYdY=; b=
	U4sf78++DYavqgGlejlEwUXoEqhIsCFB/2NyMKaj1PndBkbO10J1TMqWCQzUYQ9k
	CTbm52mBhfYJSzo7pJnhLJi2SRLdZ/DVdPmXmQb1D3hIh8EpSvsDulGT6hQvUFIl
	s0XDhlwy8JxTxnRPbwZ8jQBUc/hT3IDcWw2vdOWMrVTXA9ZLM45kBy2fOChmGOqv
	0+L20OS6Ia1ohb1HeKO1C98ue8KmLWJK5lQn+jdj5x6oU046t+BwxkTtESnJG923
	Lu2frFKww9pEJwXwyFRjRWXBSJW2faQu3PiYgYk4lGG/swolQik/CSxOyRbDqKzZ
	5i/cSlA0RTVVNA5vyJ1UPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789495422; x=
	1789502622; bh=M+18z9TRevaxtOpUOsKP4yasoi0N4a+EiZHqRi1jYdY=; b=o
	q9Ixf7yRpyn6OvcbGl5rXjJFa1njovmQxMYA4/EkJhzjD+maxV5GG3ba19SaW++G
	QOs6J0Fa/LV1lhtIdMIv5u3xcXBUQ/BkWbwv2PwZIHlLdfK4i2AUGu8CtspgtS8c
	EWbgkgpdTYWZOz/tN4VFpLBiz9bx7j7kSMWM1k6IOH5QrWdbjh9m+DsvGh3OX/+q
	Taj+DrKSfg4H32xe+YDJe5XD6ZR2tm8J04XsaAu0J35LGaavhJOritpYkOeAJ783
	j8NjM0zLLgbkFuWyOYBUo5LLRpGC7dSHRYUJ8wIUxD2UbwvDMvzzE9DiB6DFOo42
	tzIy3NobehRhziIOFHhPA==
X-ME-Sender: <xms:cYipailbmg0-tN27ofHkhd07IO9gZOWNIOQrLQ9DCYqzmFuBBSchdw>
    <xme:cYipakp6-uuZN1YnstpXkrEp_5StGTOJ0BtK_HxcCa3-ZFjlPC2cZMGQDppbVG_uA
    JTnyuDh-VT8k9QjS8W0fkX0MgtjMGCzioAvPHVpm5r0ohPlZ5ZtiQ>
X-ME-Proxy-Cause: dmFkZTFLubBmkF9VxUXZctMrdWBp2PvxU3vddrDMSNApH/C34f5Jo4vGvSjFWGqcIiCAm3
    t2jJUO6j4wP3lQHA6L91qY+aXHlhV17TaNSiKSTmW0xstZgu79Dl5jU03KzK1s2YlOJo/3
    wa4j2nKMRel037MnTHQ8te/M/aE7zD4CsPrI9tQLPGUChDom3CR70v4zVmv3gD6zyRZry/
    fxHOTxmp3YVEprGwCEBNhJAcVk1vsP7wwArzoSgdgEFZ4vL9ELlAkcVUbdVwjHtuSZqaWP
    AWe9eJ3y4fgUpnZHio/2j2aSBhv/10jGSapZIF0QaWlVDG6ssnreMapOlCHyUWq6kttutf
    oDo7WlKZ5fFrKrT5By2389BEZwy+E2RhGE3phrfshauQuSZFgNJgWkijQF179i664QRgP6
    LWCHtGbyIntI8ToE6NC1nHUqRV3n/l7uF4Eg8HGHeMFuBET58m59Ywkhe67LY7fOzyBVcI
    2Q7BJAsK3NiPZYa+Jk7vj6XEdScnNdAgzPbI5zWgH6tlyIhnXAgIix0rQDdHElBplOBVyO
    ekn2oaLCLvIcziLphnqNFkN6LJXV4JahCtpz7G1bwv76eoWQ39SAfPB6eTwfYtTu3wFAkR
    34zZQJYlvXiTbuPfeqaj/5YlnP92Hdkc8ppMPu1ilrNf3/OICLnd/8+gehrQ
X-ME-Proxy: <xmx:eIipatwHmU1_ouWm4I4RW_lK9XEMTS_CpIwSlkIYf8iZURXKG1MQPg>
    <xmx:eIiparsReeDpWZOQeMc6tmSPPtMQx5IHt8-Vd8XR-iDUaNV_5h26nQ>
    <xmx:eIipaucVS9uDmW_RRTNLCtqQ-2PAstNP4U_wVoGhtDrwlfy64or6jg>
    <xmx:eIipajGS1AnUEw8rJ-AJ0f-ObcOldpUsOc-p5zmlPVGDO0QxR48S1A>
    <xmx:foipaoajkqxqQ1sWqPi4SzqugSxTjUav0JGVACWsRKXejYebtAmyZxYQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 2D5C132A0081; Tue, 15 Sep 2026 14:03:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ArHA-gVR6p-N
Date: Tue, 15 Sep 2026 20:02:38 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nick Desaulniers" <ndesaulniers@google.com>,
 "Kees Cook" <kees@kernel.org>
Cc: "Lorenzo Stoakes" <ljs@kernel.org>,
 "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Alexey Gladkov" <legion@kernel.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Ard Biesheuvel" <ardb@kernel.org>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
 "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Benno Lossin" <lossin@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Jonathan Corbet" <corbet@lwn.net>,
 "Randy Dunlap" <rdunlap@infradead.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 "Jens Axboe" <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Message-Id: <90006ad1-73df-4bd0-a434-61875edd5bb9@app.fastmail.com>
In-Reply-To: <CAKwvOdmgeyqivO4pVa=30XDWpXvdRzBR8f13rfuPzDx=LJ1Tsw@mail.gmail.com>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-21-39817ec5db23@kernel.org>
 <202609140844.FA7E848A@keescook> <aqk9gakQhxToLnDI@gremlin>
 <202609150955.A51C9F7A20@keescook>
 <CAKwvOdmgeyqivO4pVa=30XDWpXvdRzBR8f13rfuPzDx=LJ1Tsw@mail.gmail.com>
Subject: Re: [PATCH v2 21/21] kbuild: use pigz for gzip compression if available
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_110350_099672_E85C55E1 
X-CRM114-Status: GOOD (  12.87  )
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

T24gVHVlLCBTZXAgMTUsIDIwMjYsIGF0IDE5OjQ3LCBOaWNrIERlc2F1bG5pZXJzIHdyb3RlOgo+
IE9uIFR1ZSwgU2VwIDE1LCAyMDI2IGF0IDEwOjMx4oCvQU0gS2VlcyBDb29rIDxrZWVzQGtlcm5l
bC5vcmc+IHdyb3RlOgo+PiBPbiBUdWUsIFNlcCAxNSwgMjAyNiBhdCAwMzozMDo0M1BNICswMTAw
LCBMb3JlbnpvIFN0b2FrZXMgKEFSTSkgd3JvdGU6Cj4+IGEpCj4+IE15IG1haW4gY29uY2VybiBp
cyB0aGUgbGFjayBvZiByZXNwZWN0aW5nIHRoZSAtaiBtYWtlIGFyZ3VtZW50LiBJbiBteQo+PiBt
aW5kLCB0aGlzIGlzIGEgYmxvY2tlciwgYmVjYXVzZSBpdCBtZWFucyBhIGJ1aWxkIHdpbGwgbm93
IF9hbHdheXNfIHNwaW4KPj4gdXAgbWF4IENQVXMgKG5vdCB3aGF0IC1qIGhhcyBsaW1pdGVkIGl0
IHRvKSwgYW5kIGZvciBDSXMsIHNoYXJlZCBjb21wdXRlCj4+IHN5c3RlbXMsIG9yIHdoYXRldmVy
LCB0aGlzIHZpb2xhdGVzIHRoZSByZXF1ZXN0ZWQgcGFyYWxsZWxpc20gbGV2ZWwuIEZvcgo+PiBl
eGFtcGxlLCBpZiBJJ20gZG9pbmcgYSBsb25nLXJ1bm5pbmcgQ29jY2luZWxsZSByZXBsYWNlbWVu
dCBpbiBvbmUgdHJlZQo+PiAod2hpY2ggdXNlcyBoYWxmIHRoZSBDUFVzKSwgYW55IGJ1aWxkcyBJ
IGxhdW5jaCBJJ20gYXNraW5nIGZvciB0aGUgb3RoZXIKPj4gaGFsZiBvZiBteSBDUFVzIHRvIGJl
IHVzZWQgc28gdGhleSBkb24ndCB0aHJhc2ggbXkgY2FjaGUuCj4+Cj4+IFRoaXMgaXMgdGhlIGtp
bmQgb2YgIndoeSBhcmUgYWxsIHRoZSBDUFVzIHNwaW5uaW5nIHVwPyIgcXVlc3Rpb24gSQo+PiBo
ZWxwZWQgdHJhY2sgZG93biB3aXRoIGNvbW1pdCA1MWU0NmM3YTQwMDcgKCJkb2NzLCBwYXJhbGxl
bGlzbTogUmVhcnJhbmdlCj4+IGhvdyBqb2JzZXJ2ZXIgcmVzZXJ2YXRpb25zIGFyZSBtYWRlIikg
Zm9yZXZlciBhZ28uCj4KPiBQYXJzZSAtaiBmcm9tIE1BS0VGTEFHUyAoaHR0cHM6Ly9zdGFja292
ZXJmbG93LmNvbS9hLzc2NTE3ODg2KSwKPiBmb3J3YXJkIGl0IHRvIHBpZ3o/CgpUaGF0IHN0aWxs
IGhhcyBhIHBvdGVudGlhbCBPKG7CsikgcHJvYmxlbTogaWYgb25lIGJ1aWxkcyBOIGtlcm5lbHMK
d2l0aCBhIHRvcC1sZXZlbCBqb2JzZXJ2ZXIgb24gTiBDUFVzLCBhbmQgdGhleSBhbGwgdGFrZSB0
aGUgc2FtZQphbW91bnQgb2YgdGltZSwgeW91IGVuZCB1cCB3aXRoIE4gcGlneiBwcm9jZXNzZXMg
ZWFjaCB0cnlpbmcgdG8gdXNlCk4gY3B1cyBhdCB0aGUgc2FtZSB0aW1lLiBJZGVhbGx5IHdlJ2Qg
dXNlIHRoZSBlcXVpdmFsZW50IG9mCi1mbHRvPWF1dG8gaW4gdGhlIGNvbXBpbGVyLCB3aGljaCBy
ZXNwZWN0cyBqb2JzZXJ2ZXIgc2V0dGluZ3MsCmJ1dCBJIGRvbid0IHRoaW5rIHBpZ3ogc3VwcG9y
dHMgdGhpcyBhdCB0aGUgbW9tZW50LgoKICAgICAgQXJuZAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
