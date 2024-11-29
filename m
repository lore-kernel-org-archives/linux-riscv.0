Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BFED729FE
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Nov 2024 19:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=p7CuQCMl2dgsoZb9tOQQuBVVUT/Nz8+8FsqloobcK9o=; b=s4dmTpW8VB5dvi
	BrALl733LTfG/2j5i6oD1aQsHzxwdBiNKHXYQxfTR/P1iJU1HUgfNF+YJuj8VtfXOF4SoYUWzLOWc
	1ErcV0dHt3oOESCjdPSX9sPm+1TwyWVTq/ysiPa7t5Aoij1gp15EcSsgTBNyLSsKHFyvQWVfbUN9Q
	6LsebhDi8gv8qi+RtEARYCRIIPblfcI0NjPUIiq3LsbCEmopbEODBzlZWN6wpo2zeLR5YVpryD9q8
	tDCJ/10o8zSQAPuDVzwwhQyiEzUnJMPRJ/H90qjKgdTE6flkcfa0J9ERfsqdAYMIJQBZ+3bWtZ8OG
	BQ1xbMIcu/6B45sXZTCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH70A-00000000rmy-2cgV;
	Fri, 29 Nov 2024 19:50:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tH708-00000000rmS-0P5M
	for linux-riscv@lists.infradead.org;
	Fri, 29 Nov 2024 19:50:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2C8BC5C5D39;
	Fri, 29 Nov 2024 19:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C627EC4CECF;
	Fri, 29 Nov 2024 19:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732909802;
	bh=oRzBt4nPMu99Ci+wT4DlAwimuDa54cGJKx/M3usRIKg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=pub/LeizZgMYiJGOjc4mtj9HeGJ2vGWzjTJP1QZvQTg8T3Wb0tTXOhsLsqHttqRI9
	 9AaEtGxfrs3/6KSj26ZNjKN/e9IiAFlAxWt1LBaCUCHTHrO/2LAYmZ4XrPrWjchmt5
	 ljwlc4w2cWTwHGlEmHIaX5rkIbp0hAzEWNsaWkY4vBAjfBmjgWV+jukztINfZFFUfX
	 r4I6K887CdLk2W3z9l6tyLI1dH+qrxvUxUYdnmjmTJzQvAIoxZOBFFwVFgH/bSC/2p
	 /h2WBlKtTJA5o+4KkXN/7m3aXIyezj0WHy0zB+R0lLMvcpm3dNdwk3sRlhOJHq28Nd
	 uzqIOaJXt8j0Q==
Date: Fri, 29 Nov 2024 13:50:00 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: kw@linux.com, u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu,
	arnd@arndb.de, bhelgaas@google.com, conor+dt@kernel.org,
	guoren@kernel.org, inochiama@outlook.com, krzk+dt@kernel.org,
	lee@kernel.org, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, pbrobinson@gmail.com, robh@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com, xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: Re: [PATCH 2/5] PCI: sg2042: Add Sophgo SG2042 PCIe driver
Message-ID: <20241129195000.GA2770247@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MAXPR01MB3984C307B163E615811A25AAFE2A2@MAXPR01MB3984.INDPRD01.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_115004_222176_98EEA7B4 
X-CRM114-Status: GOOD (  23.75  )
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

T24gRnJpLCBOb3YgMjksIDIwMjQgYXQgMDU6NTE6MzlQTSArMDgwMCwgQ2hlbiBXYW5nIHdyb3Rl
Ogo+IE9uIDIwMjQvMTEvMTMgNToyMCwgQmpvcm4gSGVsZ2FhcyB3cm90ZToKPiA+IE9uIE1vbiwg
Tm92IDExLCAyMDI0IGF0IDAxOjU5OjU2UE0gKzA4MDAsIENoZW4gV2FuZyB3cm90ZToKPiA+ID4g
RnJvbTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+Cj4gPiA+IAo+ID4gPiBB
ZGQgc3VwcG9ydCBmb3IgUENJZSBjb250cm9sbGVyIGluIFNHMjA0MiBTb0MuIFRoZSBjb250cm9s
bGVyCj4gPiA+IHVzZXMgdGhlIENhZGVuY2UgUENJZSBjb3JlIHByb2dyYW1tZWQgYnkgcGNpZS1j
YWRlbmNlKi5jLiBUaGUKPiA+ID4gUENJZSBjb250cm9sbGVyIHdpbGwgd29yayBpbiBob3N0IG1v
ZGUgb25seS4KPiA+ID4gKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9jYWRlbmNlL0tjb25m
aWcKPiA+ID4gQEAgLTY3LDQgKzY3LDE1IEBAIGNvbmZpZyBQQ0lfSjcyMUVfRVAKPiA+ID4gICAJ
ICBTYXkgWSBoZXJlIGlmIHlvdSB3YW50IHRvIHN1cHBvcnQgdGhlIFRJIEo3MjFFIFBDSWUgcGxh
dGZvcm0KPiA+ID4gICAJICBjb250cm9sbGVyIGluIGVuZHBvaW50IG1vZGUuIFRJIEo3MjFFIFBD
SWUgY29udHJvbGxlciB1c2VzIENhZGVuY2UgUENJZQo+ID4gPiAgIAkgIGNvcmUuCj4gPiA+ICsK
PiA+ID4gK2NvbmZpZyBQQ0lFX1NHMjA0Mgo+ID4gPiArCWJvb2wgIlNvcGhnbyBTRzIwNDIgUENJ
ZSBjb250cm9sbGVyIChob3N0IG1vZGUpIgo+ID4gPiArCWRlcGVuZHMgb24gQVJDSF9TT1BIR08g
fHwgQ09NUElMRV9URVNUCj4gPiA+ICsJZGVwZW5kcyBvbiBPRgo+ID4gPiArCXNlbGVjdCBQQ0lF
X0NBREVOQ0VfSE9TVAo+ID4gPiArCWhlbHAKPiA+ID4gKwkgIFNheSBZIGhlcmUgaWYgeW91IHdh
bnQgdG8gc3VwcG9ydCB0aGUgU29waGdvIFNHMjA0MiBQQ0llIHBsYXRmb3JtCj4gPiA+ICsJICBj
b250cm9sbGVyIGluIGhvc3QgbW9kZS4gU29waGdvIFNHMjA0MiBQQ0llIGNvbnRyb2xsZXIgdXNl
cyBDYWRlbmNlCj4gPiA+ICsJICBQQ0llIGNvcmUuCj4gPgo+ID4gUmVvcmRlciB0byBrZWVwIHRo
ZXNlIG1lbnUgaXRlbXMgaW4gYWxwaGFiZXRpY2FsIG9yZGVyIGJ5IHZlbmRvci4KPiAKPiBTb3Jy
eSwgSSBkb24ndCB1bmRlcnN0YW5kIHlvdXIgcXVlc3Rpb24uIEkgdGhpbmsgdGhlIG1lbnUgaXRl
bXMgaW4gdGhpcwo+IEtjb25maWcgZmlsZSBhcmUgYWxyZWFkeSBzb3J0ZWQgYWxwaGFiZXRpY2Fs
bHkuCgpIZXJlJ3Mgd2hhdCBtZW51Y29uZmlnIGxvb2tzIGxpa2UgYWZ0ZXIgdGhpcyBwYXRjaDoK
CiAgWypdIENhZGVuY2UgcGxhdGZvcm0gUENJZSBjb250cm9sbGVyIChob3N0IG1vZGUpCiAgWypd
IENhZGVuY2UgcGxhdGZvcm0gUENJZSBjb250cm9sbGVyIChlbmRwb2ludCBtb2RlKQogIFsqXSBU
SSBKNzIxRSBQQ0llIGNvbnRyb2xsZXIgKGhvc3QgbW9kZSkKICBbKl0gVEkgSjcyMUUgUENJZSBj
b250cm9sbGVyIChlbmRwb2ludCBtb2RlKQogIFsgXSBTb3BoZ28gU0cyMDQyIFBDSWUgY29udHJv
bGxlciAoaG9zdCBtb2RlKSAoTkVXKQoKIlNvcGhnbyIgc29ydHMgKmJlZm9yZSogIlRJIi4KCj4g
PiA+ICsJaWYgKHBjaWUtPmxpbmtfaWQgPT0gMSkgewo+ID4gPiArCQlyZWdtYXBfd3JpdGUocGNp
ZS0+c3lzY29uLCBSRUdfTElOSzFfTVNJX0FERFJfTE9XLAo+ID4gPiArCQkJICAgICBsb3dlcl8z
Ml9iaXRzKHBjaWUtPm1zaV9waHlzKSk7Cj4gPiA+ICsJCXJlZ21hcF93cml0ZShwY2llLT5zeXNj
b24sIFJFR19MSU5LMV9NU0lfQUREUl9ISUdILAo+ID4gPiArCQkJICAgICB1cHBlcl8zMl9iaXRz
KHBjaWUtPm1zaV9waHlzKSk7Cj4gPiA+ICsKPiA+ID4gKwkJcmVnbWFwX3JlYWQocGNpZS0+c3lz
Y29uLCBSRUdfTElOSzFfTVNJX0FERFJfU0laRSwgJnZhbHVlKTsKPiA+ID4gKwkJdmFsdWUgPSAo
dmFsdWUgJiBSRUdfTElOSzFfTVNJX0FERFJfU0laRV9NQVNLKSB8IE1BWF9NU0lfSVJRUzsKPiA+
ID4gKwkJcmVnbWFwX3dyaXRlKHBjaWUtPnN5c2NvbiwgUkVHX0xJTksxX01TSV9BRERSX1NJWkUs
IHZhbHVlKTsKPiA+ID4gKwl9IGVsc2Ugewo+ID4gPiArCQlyZWdtYXBfd3JpdGUocGNpZS0+c3lz
Y29uLCBSRUdfTElOSzBfTVNJX0FERFJfTE9XLAo+ID4gPiArCQkJICAgICBsb3dlcl8zMl9iaXRz
KHBjaWUtPm1zaV9waHlzKSk7Cj4gPiA+ICsJCXJlZ21hcF93cml0ZShwY2llLT5zeXNjb24sIFJF
R19MSU5LMF9NU0lfQUREUl9ISUdILAo+ID4gPiArCQkJICAgICB1cHBlcl8zMl9iaXRzKHBjaWUt
Pm1zaV9waHlzKSk7Cj4gPiA+ICsKPiA+ID4gKwkJcmVnbWFwX3JlYWQocGNpZS0+c3lzY29uLCBS
RUdfTElOSzBfTVNJX0FERFJfU0laRSwgJnZhbHVlKTsKPiA+ID4gKwkJdmFsdWUgPSAodmFsdWUg
JiBSRUdfTElOSzBfTVNJX0FERFJfU0laRV9NQVNLKSB8IChNQVhfTVNJX0lSUVMgPDwgMTYpOwo+
ID4gPiArCQlyZWdtYXBfd3JpdGUocGNpZS0+c3lzY29uLCBSRUdfTElOSzBfTVNJX0FERFJfU0la
RSwgdmFsdWUpOwo+ID4gPiArCX0KPiA+Cj4gPiBMb3Qgb2YgcGNpZS0+bGlua19pZCBjaGVja2lu
ZyBnb2luZyBvbiBoZXJlLiAgQ29uc2lkZXIgc2F2aW5nIHRoZXNlCj4gPiBvZmZzZXRzIGluIHRo
ZSBzdHJ1Y3Qgc2cyMDQyX3BjaWUgc28geW91IGRvbid0IG5lZWQgdG8gdGVzdAo+ID4gZXZlcnl3
aGVyZS4KPiAKPiBBY3R1YWxseSwgdGhlcmUgYXJlIG5vdCBtYW55IHBsYWNlcyBpbiB0aGUgY29k
ZSB0byBjaGVjayBsaW5rX2lkLiBJZiB0byBhZGQKPiBzdG9yYWdlIGluZm9ybWF0aW9uIGluIHN0
cnVjdCBzZzIwNDJfcGNpZSwgYXQgbGVhc3QgZm91csKgIHUzMiBhcmUgbmVlZGVkLgo+IEFuZCB0
aGlzIGxvZ2ljIHdpbGwgb25seSBiZSBjYWxsZWQgb25lIHRpbWUgaW4gdGhlIHByb2JlLiBTbyBJ
IHRoaW5rIGl0IGlzCj4gYmV0dGVyIHRvIGtlZXAgdGhlIGN1cnJlbnQgbWV0aG9kLiBXaGF0IGRv
IHlvdSB0aGluaz8KCjEpIEkgZG9uJ3QgdGhpbmsgImxpbmtfaWQiIGlzIGEgdmVyeSBnb29kIG5h
bWUgc2luY2UgaXQgYXBwZWFycyB0bwpyZWZlciB0byBvbmUgb2YgdHdvIFBDSWUgUm9vdCBQb3J0
cy4gIG12ZWJ1IHVzZXMgIm1hcnZlbGwscGNpZS1wb3J0Igp3aGljaCBsb29rcyBsaWtlIGEgc2lt
aWxhciB1c2FnZSwgYWx0aG91Z2ggdW5uZWNlc3NhcmlseQpNYXJ2ZWxsLXNwZWNpZmljLiAgQW5k
IGFyY2gvYXJtL2Jvb3QvZHRzL21hcnZlbGwvYXJtYWRhLTM3MC1kYi5kdHMgaGFzCnNlcGFyYXRl
IHN0YW56YXMgZm9yIHR3byBSb290IFBvcnRzLCB3aXRob3V0IG5lZWRpbmcgYSBwcm9wZXJ0eSB0
bwpkaXN0aW5ndWlzaCB0aGVtLCB3aGljaCB3b3VsZCBiZSBldmVuIGJldHRlci4gIEknbSBub3Qg
c3VyZSB3aHkKYXJjaC9hcm0vYm9vdC9kdHMvbWFydmVsbC9hcm1hZGEtMzcwLmR0c2kgbmVlZHMg
Im1hcnZlbGwscGNpZS1wb3J0IgpldmVuIHRob3VnaCBpdCBhbHNvIGhhcyBzZXBhcmF0ZSBzdGFu
emFzLgoKMikgSSB0aGluayBjaGVja2luZyBwY2llLT5saW5rX2lkIGlzIGxpa2VseSB0byBiZSBo
YXJkZXIgdG8gbWFpbnRhaW4KaW4gdGhlIGZ1dHVyZSwgZS5nLiwgaWYgYSBuZXcgY2hpcCBhZGRz
IG1vcmUgUm9vdCBQb3J0cywgeW91J2xsIGhhdmUKdG8gdG91Y2ggZWFjaCB1c2UuCgpCam9ybgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
