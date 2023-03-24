Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5291C6FD1C
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 10:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hmHlhTA4lYzFummlZ0B9NIkFQOCr105ZExxsd5CgvkQ=; b=2SedK6SIDAJj2v
	9p8df8ov/rR1oDUaJv45N4HI5O+bmaQNQtHmPOhfCojpQgAcLAUeLZBKVruJ9aqrCMVwI7zE3ix/D
	ThCoVLTK2z3mXA7wqEjirZBFqmlQ3zIMz4wVjv1pgmELZJS5Hr0cM3RAaEEc9Fla5MmHzSLGLwKME
	YpkT/iq4UrYC2O4j3X1NctcU2dKP8/dPd7xndFM3yGCVxt1GTqH27YLQhXuVwasOkvG04ym7lMV33
	Xz4hj2QwfW65Emm2olQ6HMVEikHfSnm9abgwb/LXTkFfYo+bL7/qIWEqa6GkDDH/b1Fb3+eWCotHt
	egBhkABvziojiPBzfBCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfekt-004AzS-1H;
	Fri, 24 Mar 2023 10:34:43 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfekq-004AyY-1p
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 10:34:42 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 55EDD100004;
	Fri, 24 Mar 2023 10:34:27 +0000 (UTC)
Message-ID: <877d03e1-b00b-7863-6104-21b42bc63711@ghiti.fr>
Date: Fri, 24 Mar 2023 11:34:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 1/3] riscv: Introduce CONFIG_RELOCATABLE
Content-Language: en-US
To: Nick Desaulniers <ndesaulniers@google.com>, =?UTF-8?B?QmrDtnJuIFTDtnBl?=
 =?UTF-8?Q?l?= <bjorn@kernel.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, nathan@kernel.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <20230215143626.453491-1-alexghiti@rivosinc.com>
 <20230215143626.453491-2-alexghiti@rivosinc.com>
 <4a6fc7a3-9697-a49b-0941-97f32194b0d7@ghiti.fr>
 <877cw7dphf.fsf@all.your.base.are.belong.to.us>
 <CAKwvOdk0Lr-9gt0xAKvkcwA53+Wy8oeYQo1RJ7XH-LKCCURQCQ@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAKwvOdk0Lr-9gt0xAKvkcwA53+Wy8oeYQo1RJ7XH-LKCCURQCQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_033441_174542_A4651319 
X-CRM114-Status: GOOD (  15.44  )
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

SGkgTmljaywKCk9uIDMvMjIvMjMgMTk6MjUsIE5pY2sgRGVzYXVsbmllcnMgd3JvdGU6Cj4gT24g
RnJpLCBGZWIgMjQsIDIwMjMgYXQgNzo1OOKAr0FNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5l
bC5vcmc+IHdyb3RlOgo+PiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+IHdyaXRlczoK
Pj4KPj4+ICtjYyBsaW51eC1rYnVpbGQsIGxsdm0sIE5hdGhhbiwgTmljawo+Pj4KPj4+IE9uIDIv
MTUvMjMgMTU6MzYsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPj4+PiBGcm9tOiBBbGV4YW5kcmUg
R2hpdGkgPGFsZXhAZ2hpdGkuZnI+Cj4+Pj4KPj4+IEkgdHJpZWQgYSBsb3Qgb2YgdGhpbmdzLCBi
dXQgSSBzdHJ1Z2dsZSB0byB1bmRlcnN0YW5kLCBkb2VzIGFueW9uZSBoYXZlCj4+PiBhbnkgaWRl
YT8gRllJLCB0aGUgc2FtZSBwcm9ibGVtIGhhcHBlbnMgd2l0aCBMTFZNLgo+IE9mZiB0aGUgdG9w
IG9mIG15IGhlYWQsIG5vIGlkZWEuCj4KPiAoTWF5YmUgYXMgYSBmb2xsb3cgdXAgdG8gdGhpcyBz
ZXJpZXMsIEkgd29uZGVyIGlmIHB1cnN1aW5nCj4gQVJDSF9IQVNfUkVMUiBmb3IgQVJDSD1yaXNj
diBpcyB3b3J0aHdoaWxlPykKCgpJSVVDLCB0aGUgZ29hbCBmb3IgdXNpbmcgUkVMUiBpcyB0byBy
ZWR1Y2UgdGhlIHNpemUgb2YgYSBrZXJuZWwgaW1hZ2U6IApyaWdodCBub3csIHRoaXMgaXMgbm90
IG15IHByaW9yaXR5LCBidXQgSSdsbCBhZGQgdGhhdCB0byBteSB0b2RvIGxpc3QgCmJlY2F1c2Ug
dGhhdCBtYXkgYmUgdXNlZnVsIHRvIGRpc3Ryb3MuCgoKPgo+PiBEb24ndCBhc2sgbWUgKndoeSos
IGJ1dCBhZGRpbmcgLS1lbWl0LXJlbG9jcyB0byB5b3VyIGxpbmtlciBmbGFncyBzb2x2ZXMKPj4g
InRoZSBOVUxMIC5yZWxhLmR5biIgYm90aCBmb3IgR0NDIGFuZCBMTFZNLgo+Pgo+PiBUaGUgZG93
bnNpZGUgaXMgdGhhdCB5b3UgZW5kIHVwIHdpdGggYSBidW5jaCBvZiAucmVsYSBjcnVmdCBpbiB5
b3VyCj4+IHZtbGludXguCj4gVGhlcmUgd2FzIGEgcGF0Y2gganVzdCB0aGlzIHdlZWsgdG8gdXNl
ICQoT0JKQ09QWSkgdG8gc3RyaXAgdGhlc2UgZnJvbQo+IHZtbGludXggKGZvciB4ODYpLiBMb29r
cyBsaWtlIHg4NiB1c2VzIC0tZW1pdC1yZWxvY3MgZm9yIEtBU0xSOgo+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xrbWwvMjAyMzAzMjAxMjEwMDYuNDg2My0xLXBldHIucGF2bHVAc3VzZS5jb20v
CgoKVGhhdCdzIG5pY2UsIHRoYXQgd291bGQgYmUgYW4gaW50ZXJlc3RpbmcgaW50ZXJtZWRpYXRl
IHN0ZXAgdW50aWwgd2UgCmZpbmQgdGhlIGlzc3VlIGhlcmUgYXMgSSBiZWxpZXZlIGl0IGlzIGlt
cG9ydGFudCB0byBoYXZlIHRoZSByZWxvY2F0aW9ucyAKaW4gdGhlIGluaXQgc2VjdGlvbiB0byBz
YXZlIG1lbW9yeS4KClRoYW5rcyBmb3IgeW91ciBhbnN3ZXIgTmljaywgcmVhbGx5IGFwcHJlY2lh
dGVkLAoKQWxleAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
