Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BACEC0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 07:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=903KVIfx+dk2ZeyD9eWWgt0Y3SYowNpmi5utRK/AWfM=; b=UpdsdXQy1Liecr
	0HWVRImmiOfNLJilsptsz40sbUpDAjFLAAzhhqRozqlpYeRG60rZ8KxD+ZfeA3TmQSApOFAEm0ZeN
	Ce/dyLPQ6SEExcIS6gdIqwG7F1iwOir1WTNI1nVZHTL+GeqG2CGln1U/HJneYkGx9py4B+9LaexBI
	/nc7sY2vF1unfTUonUdbeB+MKBfhCv1+zfhGwwSRx6v9qlHeN8TMXJ/XGV9gMkazJk0f/WGrBicnl
	7e7Uz3kzyTvoe5obU8GiRIT+BJPrH7hT3U8IBjanDIPlpNuvAJ3EUZNgROjn+5Oi+tJ8EuQLSUXj1
	hskDjCY2qK8sxbDl69tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCZk-006cds-2r;
	Tue, 25 Jul 2023 07:35:20 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCZh-006ccS-2V
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 07:35:19 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-31759e6a4a1so1719379f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jul 2023 00:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690270515; x=1690875315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qy1+b1K519FpXkmyThSnFmRzN6pFlVKnNg610BuI7MA=;
        b=Y1Y741t+P9RDREXrYmfmRP7Im2iZvT/2t5X35M4FEgebyODy107yyHKGzzduzu7oVs
         7i7TfIq5srzIjlwZKmlX3jZroJNfrnIQ1x68Be5+BvAhpQdR4Lt22LovPXgMPbV9CvK2
         MHMegHGW8CQq5bNmZmYHk41U8oYO5rmNDaJmqnbL1jYGv4UPPQch0g8RH5W0u8LP9JPF
         I1P5aCQNGqjfe/Ucg4/kCJP2NiPByg0tB4y96td55gv7I751Dg+TsoK2I117gid6PH94
         VCx5HJ/z/ewrUd2Qjq0BOpLjjqMuwTAJgjyAoTZvxaNdqhXFaJOYXH/276CJxZzmv3MQ
         lE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690270515; x=1690875315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qy1+b1K519FpXkmyThSnFmRzN6pFlVKnNg610BuI7MA=;
        b=Rtn2sv8j1anim93Q14nOGqM32weIT/B2z8aX7Tk5YH9UUk3N7BnNlXDN/EOYrvOgyz
         wrRjfmKEROoERBuPIus+IWu2GWzFeZZquQUGGJkGDodbSN2he6CLEFQvuc/6/FNt9jKZ
         3x4TkF5VrTdIpkRTHpvtvuwhfgpKMgpl/UExn8PnqXmoFInWybvmwnGgmlRUIfGcaHZL
         emngqO897gNrBiz3EMmLvLARHfrUJDHKcNauMLLgiPRpzB5+by2qlcCHEJlReqGFZGMA
         xbxl0n7eCEntjDOdSMunXAbk8EKpuib2rsEYi9nW9M/unL0mS/JEDog1c1RYVKXpjERF
         YFng==
X-Gm-Message-State: ABy/qLYg+omELPNuSSKTLeWgA8Lj8KIiiuNEpIjv2NFdwf1xF3vfgFTb
	fkQjBKUR8H0BzTXLjoejfAQ7x8UIhb0F+fdj+WAo9g==
X-Google-Smtp-Source: APBJJlEgoVwzOTj4qyh7bbPD5Y148/nsOgK9/pmcLRCusowR2d/kOU/yMmm/J3uwnDa9WNI+wzL+eqTf98zs6wW3zLg=
X-Received: by 2002:a5d:4e12:0:b0:317:69d2:35c2 with SMTP id
 p18-20020a5d4e12000000b0031769d235c2mr1018661wrt.2.1690270514987; Tue, 25 Jul
 2023 00:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230722113445.630714-1-alexghiti@rivosinc.com>
 <20230722113445.630714-2-alexghiti@rivosinc.com> <b0826064-0cd6-dfd0-a377-5cd56c4035be@infradead.org>
In-Reply-To: <b0826064-0cd6-dfd0-a377-5cd56c4035be@infradead.org>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 25 Jul 2023 09:35:04 +0200
Message-ID: <CAHVXubg_gGqLnoCaQCLe4SgS4eVT0rqSTC1DHc+-CEmifH6V6Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] Documentation: riscv: Add early boot document
To: Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_003517_822682_A745E377 
X-CRM114-Status: GOOD (  39.10  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Song Shuai <songshuaishuai@tinylab.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUmFuZHksCgpPbiBTYXQsIEp1bCAyMiwgMjAyMyBhdCAxMDoxOeKAr1BNIFJhbmR5IER1bmxh
cCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gNy8yMi8yMyAw
NDozNCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4gVGhpcyBkb2N1bWVudCBkZXNjcmliZXMg
dGhlIGNvbnN0cmFpbnRzIGFuZCByZXF1aXJlbWVudHMgb2YgdGhlIGVhcmx5Cj4gPiBib290IHBy
b2Nlc3MgaW4gYSBSSVNDLVYga2VybmVsLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRy
ZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBCasO2cm4g
VMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gPiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5
IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBTdW5pbCBWIEwg
PHN1bmlsdmxAdmVudGFuYW1pY3JvLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMg
PGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+ID4gUmV2aWV3ZWQtYnk6IFBhbG1lciBEYWJiZWx0
IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlz
aHBAcml2b3NpbmMuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IFNvbmcgU2h1YWkgPHNvbmdzaHVhaXNo
dWFpQHRpbnlsYWIub3JnPgo+ID4gQWNrZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2
b3NpbmMuY29tPgo+ID4gLS0tCj4gPiAtIENoYW5nZXMgaW4gdjU6Cj4gPiAgICogUmViYXNlIG9u
IHRvcCBvZiBkb2NzLW5leHQKPiA+Cj4gPiAgRG9jdW1lbnRhdGlvbi9yaXNjdi9ib290LWltYWdl
LWhlYWRlci5yc3QgfCAgIDMgLQo+ID4gIERvY3VtZW50YXRpb24vcmlzY3YvYm9vdC5yc3QgICAg
ICAgICAgICAgIHwgMTY5ICsrKysrKysrKysrKysrKysrKysrKysKPiA+ICBEb2N1bWVudGF0aW9u
L3Jpc2N2L2luZGV4LnJzdCAgICAgICAgICAgICB8ICAgMSArCj4gPiAgMyBmaWxlcyBjaGFuZ2Vk
LCAxNzAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9yaXNjdi9ib290LnJzdAo+ID4KPgo+ID4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vcmlzY3YvYm9vdC5yc3QgYi9Eb2N1bWVudGF0aW9uL3Jpc2N2L2Jvb3QucnN0
Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5mODkwYWM0
NDJjOTEKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vcmlzY3YvYm9v
dC5yc3QKPiA+IEBAIC0wLDAgKzEsMTY5IEBACj4gPiArLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAKPiA+ICsKPiA+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PQo+ID4gK1JJU0MtViBLZXJuZWwgQm9vdCBSZXF1aXJlbWVudHMgYW5kIENv
bnN0cmFpbnRzCj4gPiArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT0KPiA+ICsKPiA+ICs6QXV0aG9yOiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZv
c2luYy5jb20+Cj4gPiArOkRhdGU6IDIzIE1heSAyMDIzCj4gPiArCj4gPiArVGhpcyBkb2N1bWVu
dCBkZXNjcmliZXMgd2hhdCB0aGUgUklTQy1WIGtlcm5lbCBleHBlY3RzIGZyb20gYm9vdGxvYWRl
cnMgYW5kCj4gPiArZmlybXdhcmUsIGJ1dCBhbHNvIHRoZSBjb25zdHJhaW50cyB0aGF0IGFueSBk
ZXZlbG9wZXIgbXVzdCBoYXZlIGluIG1pbmQgd2hlbgo+Cj4gSSB3b3VsZCBzL2J1dC9hbmQvLgoK
T2sgSSBjaGFuZ2UgdGhhdCwgdGhhbmtzLgoKPgo+ID4gK3RvdWNoaW5nIHRoZSBlYXJseSBib290
IHByb2Nlc3MuIEZvciB0aGUgcHVycG9zZXMgb2YgdGhpcyBkb2N1bWVudCwgdGhlCj4gPiArYGBl
YXJseSBib290IHByb2Nlc3NgYCByZWZlcnMgdG8gYW55IGNvZGUgdGhhdCBydW5zIGJlZm9yZSB0
aGUgZmluYWwgdmlydHVhbAo+ID4gK21hcHBpbmcgaXMgc2V0IHVwLgo+ID4gKwo+ID4gK1ByZS1r
ZXJuZWwgUmVxdWlyZW1lbnRzIGFuZCBDb25zdHJhaW50cwo+ID4gKz09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQo+ID4gKwo+ID4gK1RoZSBSSVNDLVYga2VybmVsIGV4cGVj
dHMgdGhlIGZvbGxvd2luZyBvZiBib290bG9hZGVycyBhbmQgcGxhdGZvcm0gZmlybXdhcmU6Cj4g
PiArCj4gPiArUmVnaXN0ZXIgc3RhdGUKPiA+ICstLS0tLS0tLS0tLS0tLQo+ID4gKwo+ID4gK1Ro
ZSBSSVNDLVYga2VybmVsIGV4cGVjdHM6Cj4gPiArCj4gPiArICAqIGBgJGEwYGAgdG8gY29udGFp
biB0aGUgaGFydGlkIG9mIHRoZSBjdXJyZW50IGNvcmUuCj4gPiArICAqIGBgJGExYGAgdG8gY29u
dGFpbiB0aGUgYWRkcmVzcyBvZiB0aGUgZGV2aWNldHJlZSBpbiBtZW1vcnkuCj4gPiArCj4gPiAr
Q1NSIHN0YXRlCj4gPiArLS0tLS0tLS0tCj4gPiArCj4gPiArVGhlIFJJU0MtViBrZXJuZWwgZXhw
ZWN0czoKPiA+ICsKPiA+ICsgICogYGAkc2F0cCA9IDBgYDogdGhlIE1NVSwgaWYgcHJlc2VudCwg
bXVzdCBiZSBkaXNhYmxlZC4KPiA+ICsKPiA+ICtSZXNlcnZlZCBtZW1vcnkgZm9yIHJlc2lkZW50
IGZpcm13YXJlCj4gPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4g
Kwo+ID4gK1RoZSBSSVNDLVYga2VybmVsIG11c3Qgbm90IG1hcCBhbnkgcmVzaWRlbnQgbWVtb3J5
LCBvciBtZW1vcnkgcHJvdGVjdGVkIHdpdGgKPiA+ICtQTVBzLCBpbiB0aGUgZGlyZWN0IG1hcHBp
bmcsIHNvIHRoZSBmaXJtd2FyZSBtdXN0IGNvcnJlY3RseSBtYXJrIHRob3NlIHJlZ2lvbnMKPiA+
ICthcyBwZXIgdGhlIGRldmljZXRyZWUgc3BlY2lmaWNhdGlvbiBhbmQvb3IgdGhlIFVFRkkgc3Bl
Y2lmaWNhdGlvbi4KPiA+ICsKPiA+ICtLZXJuZWwgbG9jYXRpb24KPiA+ICstLS0tLS0tLS0tLS0t
LS0KPiA+ICsKPiA+ICtUaGUgUklTQy1WIGtlcm5lbCBleHBlY3RzIHRvIGJlIHBsYWNlZCBhdCBh
IFBNRCBib3VuZGFyeSAoMk1CIGFsaWduZWQgZm9yIHJ2NjQKPiA+ICthbmQgNE1CIGFsaWduZWQg
Zm9yIHJ2MzIpLiBOb3RlIHRoYXQgdGhlIEVGSSBzdHViIHdpbGwgcGh5c2ljYWxseSByZWxvY2F0
ZSB0aGUKPiA+ICtrZXJuZWwgaWYgdGhhdCdzIG5vdCB0aGUgY2FzZS4KPiA+ICsKPiA+ICtIYXJk
d2FyZSBkZXNjcmlwdGlvbgo+ID4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiArCj4gPiArVGhl
IGZpcm13YXJlIGNhbiBwYXNzIGVpdGhlciBhIGRldmljZXRyZWUgb3IgQUNQSSB0YWJsZXMgdG8g
dGhlIFJJU0MtViBrZXJuZWwuCj4gPiArCj4gPiArVGhlIGRldmljZXRyZWUgaXMgZWl0aGVyIHBh
c3NlZCBkaXJlY3RseSB0byB0aGUga2VybmVsIGZyb20gdGhlIHByZXZpb3VzIHN0YWdlCj4gPiAr
dXNpbmcgdGhlIGBgJGExYGAgcmVnaXN0ZXIsIG9yIHdoZW4gYm9vdGluZyB3aXRoIFVFRkksIGl0
IGNhbiBiZSBwYXNzZWQgdXNpbmcgdGhlCj4gPiArRUZJIGNvbmZpZ3VyYXRpb24gdGFibGUuCj4g
PiArCj4gPiArVGhlIEFDUEkgdGFibGVzIGFyZSBwYXNzZWQgdG8gdGhlIGtlcm5lbCB1c2luZyB0
aGUgRUZJIGNvbmZpZ3VyYXRpb24gdGFibGUuIEluCj4gPiArdGhpcyBjYXNlLCBhIHRpbnkgZGV2
aWNldHJlZSBpcyBzdGlsbCBjcmVhdGVkIGJ5IHRoZSBFRkkgc3R1Yi4gUGxlYXNlIHJlZmVyIHRv
Cj4gPiArIkVGSSBzdHViIGFuZCBkZXZpY2V0cmVlIiBzZWN0aW9uIGJlbG93IGZvciBkZXRhaWxz
IGFib3V0IHRoaXMgZGV2aWNldHJlZS4KPiA+ICsKPiA+ICtLZXJuZWwgZW50cmFuY2UKPiA+ICst
LS0tLS0tLS0tLS0tLS0KPgo+IEhvdyBhYm91dCAiZW50cnkiIGluc3RlYWQgb2YgImVudHJhbmNl
Ij8KCkkgaGF2ZSB0byBhZG1pdCB0aGF0IEkgZG9uJ3QgaGF2ZSB0aGUgbnVhbmNlIGJldHdlZW4g
Ym90aCB3b3JkcywgaWYKJ2VudHJ5JyBpcyBtb3JlIGFwcHJvcHJpYXRlLCBJJ2xsIGNoYW5nZSBp
dC4KCj4KPiA+ICsKPiA+ICtPbiBTTVAgc3lzdGVtcywgdGhlcmUgYXJlIDIgbWV0aG9kcyB0byBl
bnRlciB0aGUga2VybmVsOgo+ID4gKwo+ID4gKy0gYGBSSVNDVl9CT09UX1NQSU5XQUlUYGA6IHRo
ZSBmaXJtd2FyZSByZWxlYXNlcyBhbGwgaGFydHMgaW4gdGhlIGtlcm5lbCwgb25lIGhhcnQKPiA+
ICsgIHdpbnMgYSBsb3R0ZXJ5IGFuZCBleGVjdXRlcyB0aGUgZWFybHkgYm9vdCBjb2RlIHdoaWxl
IHRoZSBvdGhlciBoYXJ0cyBhcmUKPiA+ICsgIHBhcmtlZCB3YWl0aW5nIGZvciB0aGUgaW5pdGlh
bGl6YXRpb24gdG8gZmluaXNoLiBUaGlzIG1ldGhvZCBpcyBtb3N0bHkgdXNlZCB0bwo+ID4gKyAg
c3VwcG9ydCBvbGRlciBmaXJtd2FyZXMgd2l0aG91dCBTQkkgSFNNIGV4dGVuc2lvbiBhbmQgTS1t
b2RlIFJJU0MtViBrZXJuZWwuCj4gPiArLSBgYE9yZGVyZWQgYm9vdGluZ2BgOiB0aGUgZmlybXdh
cmUgcmVsZWFzZXMgb25seSBvbmUgaGFydCB0aGF0IHdpbGwgZXhlY3V0ZSB0aGUKPiA+ICsgIGlu
aXRpYWxpemF0aW9uIHBoYXNlIGFuZCB0aGVuIHdpbGwgc3RhcnQgYWxsIG90aGVyIGhhcnRzIHVz
aW5nIHRoZSBTQkkgSFNNCj4gPiArICBleHRlbnNpb24uIFRoZSBvcmRlcmVkIGJvb3RpbmcgbWV0
aG9kIGlzIHRoZSBwcmVmZXJyZWQgYm9vdGluZyBtZXRob2QgZm9yCj4gPiArICBib290aW5nIHRo
ZSBSSVNDLVYga2VybmVsIGJlY2F1c2UgaXQgY2FuIHN1cHBvcnQgY3B1IGhvdHBsdWcgYW5kIGtl
eGVjLgo+Cj4gcHJlZmVyYWJseSBzL2NwdS9DUFUvCgpEb25lIQoKPgo+ID4gKwo+ID4gK1VFRkkK
PiA+ICstLS0tCj4KPiBbc25pcF0KPgo+IEkgY2FuJ3Qgc2F5IGhvdyBjb3JyZWN0IHRoZSBkb2N1
bWVudGF0aW9uIGlzLCBidXQgaXQgaXMgd2VsbC13cml0dGVuCj4gYW5kIGhhcyBubyBpc3N1ZXMg
d2l0aCBwdW5jdHVhdGlvbiwgZ3JhbW1hciwgb3Igc3BlbGxpbmcgQUZBSUNULCBzbwo+IHlvdSBj
YW4gdGFrZSB0aGlzIGlmIHlvdSB3YW50IGl0Ogo+Cj4gUmV2aWV3ZWQtYnk6IFJhbmR5IER1bmxh
cCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgoKVGhhbmtzIGZvciB0aGUgbmljZSBjb21tZW50cywg
QENvbm9yIERvb2xleSAoYW5kIG90aGVycykgcmVhbGx5IGhlbHBlZCEKCkknbGwgcmVzcGluIGEg
bmV3IHZlcnNpb24gdG9kYXksCgpBbGV4Cgo+Cj4gdGhhbmtzLgo+IC0tCj4gflJhbmR5CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
