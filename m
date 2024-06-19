Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A994EC27C79
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 15:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WHJQM5VqyOrGZEYxNGh6EUYQzeBdOdEcqZU98sOl4z4=; b=RkNQkHJ4aXUPps
	ND4PGsr165+nAt07kkEF+9kSHlLNsRXYNQabDbtUfO/jDuW3U/vU6GGUVq+xXuOi+GiJPCthlf1HQ
	UfEGkPJHqYI0ZljhoJySlTCW37eOp3ikeWUy8tLyI6PplyFNKSQMGSOEm4Nl/1Mvs1EU7yojXRhg3
	cqU86+7uIZ9Vh7ld3+yKk4OXN5XSyGaGPzU71V2k01bvI+hQrO8p/noS0Gf5JZ37U9DM5NCPRVZ2J
	HH6a/BjbwFZpwJZsdj92AQDJrmGUrn6NoZ17ocGkg52GeRrz+4H968q2hg1UxecbELNiVdJ1P+yTL
	WCuOYcpilXwjdte1dK9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJxCC-00000001nMX-2q7S;
	Wed, 19 Jun 2024 15:26:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJxC8-00000001nKg-2ZGv
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 15:25:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A1A961E71;
	Wed, 19 Jun 2024 15:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A42AC2BBFC;
	Wed, 19 Jun 2024 15:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718810754;
	bh=/lNGqqqjyjXkzDJYjuWIgiRgUpo/dE1KLA+7wNIMC2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LX7jc9qYTiYzkhKLX1o4Rt/bIQtep/45xFP/ZfdTO7Dr/L6WLtplEm92a5M9s/GM1
	 mlM1yF1C1KkrAzr8p62wG7qQHrXh+K5tU19Vx9u8uyTqayx46QmUtFwHTaZGzFcT2w
	 KKy7K12IXgV8Sw38n4rgAGXYXiLtUz/S1gbQigFt0m7M6g4dMhuhbM0IID22Zd6L55
	 fioTZ2HKsWgFju2ZJPves9EuoAkACWLo9fcBWWV6UWWXRbYRgBXRMokcbnLq+bSWZ/
	 behDbruvkMX5ubDDCsgZQroFL/lFALb27zHho7Klg0O+/Ja7+2vDd6z90g5gYr70I+
	 J/txLVxJemdBg==
Date: Wed, 19 Jun 2024 23:11:53 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Cyril Bur <cyrilbur@tenstorrent.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] riscv: convert bottom half of exception handling to C
Message-ID: <ZnL1OV1GQxV4nS2h@xhacker>
References: <20240616170553.2832-1-jszhang@kernel.org>
 <CANtDSir9O+B1mZx-k+j0+bHo03A653itida8f34frFaY2doM0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANtDSir9O+B1mZx-k+j0+bHo03A653itida8f34frFaY2doM0Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_082556_918135_B61B2001 
X-CRM114-Status: GOOD (  28.20  )
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

T24gV2VkLCBKdW4gMTksIDIwMjQgYXQgMDg6MTY6NThBTSArMTAwMCwgQ3lyaWwgQnVyIHdyb3Rl
Ogo+IE9uIE1vbiwgSnVuIDE3LCAyMDI0IGF0IDM6MjHigK9BTSBKaXNoZW5nIFpoYW5nIDxqc3po
YW5nQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IEZvciByZWFkYWJpbGl0eSwgbWFpbnRhaW5h
YmlsaXR5IGFuZCBmdXR1cmUgc2NhbGFiaWxpdHksIGNvbnZlcnQgdGhlCj4gPiBib3R0b20gaGFs
ZiBvZiB0aGUgZXhjZXB0aW9uIGhhbmRsaW5nIHRvIEMuCj4gPgo+ID4gRHVyaW5nIHRoZSBjb252
ZXJzaW9uLCBJIGZvdW5kIEFudG9uIGZpeGVkIGEgcGVyZm9ybWFuY2UgaXNzdWUKPiA+IGFuZCBt
eSBwYXRjaGVzIHdpbGwgdG91Y2ggdGhlIHNhbWUgZXhjZXB0aW9uIGFzbSBjb2RlLCBzbyBJIGlu
Y2x1ZGUKPiA+IEFudG9uJ3MgcGF0Y2ggZm9yIGNvbXBsZXRlbmVzcy4gSSBhbHNvIGNvb2tlZCBh
IHNpbWlsYXIgcGF0Y2ggdG8gYXZvaWQKPiA+IGNvcnJ1cHRpbmcgdGhlIFJBUyBpbiByZXRfZnJv
bV9mb3JrKCkgcGVyIHRoZSBpbnNwaXJhdGlvbi4KPiA+Cj4gPiBNb3N0bHkgdGhlIGFzc2VtYmx5
IGNvZGUgaXMgY29udmVydGVkIHRvIEMgaW4gYSByZWxhdGl2ZWx5Cj4gPiBzdHJhaWdodGZvcndh
cmQgbWFubmVyLgo+ID4KPiA+IEhvd2V2ZXIsIHRoZXJlIGFyZSB0d28gbW9kaWZpY2F0aW9ucyBJ
IG5lZWQgdG8gbWVudGlvbjoKPiA+Cj4gPiAxLiB0aGUgQ1NSX0NBVVNFIHJlZyByZWFkaW5nIGFu
ZCBzYXZpbmcgaXMgbW92ZWQgdG8gdGhlIEMgY29kZQo+ID4gYmVjYXVzZSB3ZSBuZWVkIHRoZSBj
YXVzZSB0byBkaXNwYXRjaCB0aGUgZXhjZXB0aW9uIGhhbmRsaW5nLAo+ID4gaWYgd2Uga2VlcCB0
aGUgY2F1c2UgcmVhZGluZyBhbmQgc2F2aW5nLCB3ZSBlaXRoZXIgcGFzcyBpdCB0bwo+ID4gZG9f
dHJhcHMoKSB2aWEuIDJuZCBwYXJhbSBvciBnZXQgaXQgZnJvbSBwdF9yZWdzIHdoaWNoIGFuIGV4
dHJhCj4gPiBtZW1vcnkgbG9hZCBpcyBuZWVkZWQsIEkgZG9uJ3QgbGlrZSBhbnkgb2YgdGhlIHR3
byBzb2x1dGlvbnMgYmVjYXNlCj4gPiB0aGUgZXhjZXB0aW9uIGhhbmRsaW5nIHNpdHMgaW4gaG90
IGNvZGUgcGF0aCwgZXZlcnkgaW5zdHJ1Y3Rpb24KPiA+IG1hdHRlcnMuCj4gPgo+ID4gMi5UbyBj
b3BlIHdpdGggU0lGSVZFX0NJUF80NTMgZXJyYXRhLCBpdCBsb29rcyBsaWtlIHdlIGRvbid0IG5l
ZWQKPiA+IGFsdGVybmF0aXZlIG1lY2hhbmlzbSBhbnkgbW9yZSBhZnRlciB0aGUgYXNtLT5jIGNv
bnZlcnRpb24uIEp1c3QKPiA+IHJlcGxhY2UgdGhlIGV4Y3BfdmVjdF90YWJsZSB0d28gZW50cmll
cy4KPiA+Cj4gPgo+ID4KPiA+IEFudG9uIEJsYW5jaGFyZCAoMSk6Cj4gPiAgIHJpc2N2OiBJbXBy
b3ZlIGV4Y2VwdGlvbiBhbmQgc3lzdGVtIGNhbGwgbGF0ZW5jeQo+ID4KPiBJJ3ZlIHJldGVzdGVk
IHRoaXMgcGF0Y2ggd2l0aCB0aGUgcmVzdCBvZiB0aGUgc2VyaWVzIGFwcGxpZWQuIEkgY2FuIGNv
bmZpcm0KPiB0aGF0IHRoZSBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudCBpcyBzdGlsbCB0aGVyZS4g
RGVmaW5pdGVseSB0aHVtYnMgdXAgb24gbXkgZW5kLgoKVGhhbmtzISBUaGUgMm5kIHBhdGNoIGlz
IGluc3BpcmVkIGJ5IEFudG9uJ3MgcGF0Y2guIFRoZSByZW1haW5pbmdzCmFyZSBqdXN0IHRvIGNv
bnZlcnQgdGhlIGFzbSB0byBjIGluIHN0cmFpZ2h0IGZvcndhcmQgc3R5bGUuCgpJZiBwb3NzaWJs
ZSwgY291bGQgeW91IHBsZWFzZSBhZGQgeW91ciBUZXN0ZWQtYnkgdGFnPyBPciBldmVuIGJldHRl
cgpyZXZpZXcgdGhlIHNlcmllcyA7KQoKVGhhbmtzCj4gCj4gPiBKaXNoZW5nIFpoYW5nICg1KToK
PiA+ICAgcmlzY3Y6IGF2b2lkIGNvcnJ1cHRpbmcgdGhlIFJBUwo+ID4gICByaXNjdjogY29udmVy
dCBib3R0b20gaGFsZiBvZiBleGNlcHRpb24gaGFuZGxpbmcgdG8gQwo+ID4gICByaXNjdjogZXJy
YXRhOiByZW1vdmUgQUxUX0lOU05fRkFVTFQgYW5kIEFMVF9QQUdFX0ZBVUxUCj4gPiAgIHJpc2N2
OiBlcnJhdGE6IHNpZml2ZTogcmVtb3ZlIE5PTU1VIGhhbmRsaW5nCj4gPiAgIHJpc2N2OiByZW1v
dmUgYXNtbGlua2FnZSBmcm9tIHVwZGF0ZWQgZnVuY3Rpb25zCj4gPgo+ID4gIGFyY2gvcmlzY3Yv
ZXJyYXRhL3NpZml2ZS9lcnJhdGEuYyAgICAgICAgIHwgMjUgKysrKysrKy0tLQo+ID4gIGFyY2gv
cmlzY3YvZXJyYXRhL3NpZml2ZS9lcnJhdGFfY2lwXzQ1My5TIHwgIDQgLS0KPiA+ICBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2FzbS1wcm90b3R5cGVzLmggICB8ICA3ICstLQo+ID4gIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaCAgICAgIHwgMjEgKystLS0tLS0KPiA+ICBhcmNo
L3Jpc2N2L2tlcm5lbC9lbnRyeS5TICAgICAgICAgICAgICAgICB8IDYxICsrLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFjZS5jICAgICAgICAgICAg
fCAgNCArLQo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgICAgICAgICAgICAgICAgIHwg
NTcgKysrKysrKysrKysrKysrKysrLS0tCj4gPiAgNyBmaWxlcyBjaGFuZ2VkLCA4MSBpbnNlcnRp
b25zKCspLCA5OCBkZWxldGlvbnMoLSkKPiA+Cj4gPiAtLQo+ID4gMi40My4wCj4gPgo+ID4KPiA+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
PiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
