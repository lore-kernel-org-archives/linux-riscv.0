Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282A5CA0EED
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 23:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VG2AtkLHnaBG+u4Gk/p48k0Rr3JRgkQjVSbePEoxdNk=; b=ilsYRxZM03MEjB
	YUea9P2xwOkZG0oe+2ap29TavHCqdeymagHhAkrJPkwYeanjGWLtjbMFtngFRz6Q1eB0Ovk/yqChN
	QYnWMTiJ4Qdgrzd5irzHHVgacp8JPAQT5ArO8RpxHj8J7ULcqw8I+RFeeYdlggK9QzKJPofnhXpsA
	9/ugu8+0u2bEyoLdhNFx7kM5075qlZvfWSMArgNpbV43afRTpCZcWjsLevhwhEuUbTLQwd3TzRRRW
	LinxSRGBHQJ4hFs+4PUAHddeig3jnntZRRl6SBQK9zjMhFAV434mTW5Q+Y+rjRulE30su1RObWcsE
	JiHN2H5ZWsiu+XYZnuTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urm0r-00000003f9N-2Ctj;
	Thu, 28 Aug 2025 23:26:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urjIC-00000003BFt-2dRb;
	Thu, 28 Aug 2025 20:32:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EFE33432C4;
	Thu, 28 Aug 2025 20:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34509C4CEEB;
	Thu, 28 Aug 2025 20:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756413139;
	bh=LJ/nYBW1tIRXTpCBSiKp71T/i9+fSZdNs8DZzPqY1Ow=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=DGl5m61tjFO/RGbdmcv8xyDmu/ykBezYs0GHdT4DZw9Xhk3fSMKGKVpOWVqw5/86+
	 jK5yY+L4Bo1ZIZ8v3R6pXEW+Fjm53GisvnYMX/XpdM+rD/Z6hIBavWTcDeIfuLkZV1
	 OujLD+Q0WWVGa/LUPqHTaRku9THwma5s8N+6X6Ert3RAhSE6UW+cGdCYjC4CScygIJ
	 Cj1DHZR7LIX821VJ2VhiEWxiG59HzBd0B8RaijpHpGW7OMJ8muA6HNFHK13GjY0yLf
	 N1Mj4ArOxrslcU9fjauS/Fhpnt/uL/EXomlp9/E5Eieg9kjphzcZPHUoOzR0suUrJK
	 kAVWObwlnDGbw==
Date: Thu, 28 Aug 2025 16:32:16 -0400
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@outflux.net>,
 Peter Zijlstra <peterz@infradead.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Puranjay Mohan <puranjay@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 x86@kernel.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
User-Agent: K-9 Mail for Android
In-Reply-To: <20250828201915.GA219815@ax162>
References: <20250825141316.work.967-kees@kernel.org> <20250825142603.1907143-5-kees@kernel.org> <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com> <202508250834.E2456B9@keescook> <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com> <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net> <20250827013444.GA2859318@ax162> <56c2b1ce-00a4-403c-9927-79bfd9a23574@infradead.org> <20250827193815.GA2293657@ax162> <CANiq72nX7d3XQtQKDdeUh2RFy5HqSg360m4pzesJyBP+y9K7FA@mail.gmail.com> <20250828201915.GA219815@ax162>
Message-ID: <25B398C8-4D9A-46C6-AED9-9DA2805DF9D7@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_133220_691474_69451570 
X-CRM114-Status: GOOD (  14.21  )
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

CgpPbiBBdWd1c3QgMjgsIDIwMjUgNDoxOToxNSBQTSBFRFQsIE5hdGhhbiBDaGFuY2VsbG9yIDxu
YXRoYW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj5PbiBUaHUsIEF1ZyAyOCwgMjAyNSBhdCAwMjoxMTo1
MVBNICswMjAwLCBNaWd1ZWwgT2plZGEgd3JvdGU6Cj4+IE9uIFdlZCwgQXVnIDI3LCAyMDI1IGF0
IDk6MzjigK9QTSBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+IHdyb3RlOgo+
PiA+IEFub3RoZXIgaWRlYSBJIGhhZCB0byBhdm9pZCB0aGlzIGlzIGludHJvZHVjaW5nIENPTkZJ
R19DRklfR0NDIGFzIGEgdXNlcgo+PiA+IHNlbGVjdGFibGUgc3ltYm9sIGFuZCBtYWtpbmcgQ09O
RklHX0NGSSB0aGUgaGlkZGVuIHN5bWJvbCB0aGF0IGJvdGgKPj4gPiBjb21waWxlciBzeW1ib2xz
IHNlbGVjdC4gQWZ0ZXIgYSBjb3VwbGUgb2YgcmVsZWFzZXMgKG9yIG1heWJlIHRoZSBuZXh0Cj4+
ID4gTFRTKSwgYm90aCBDT05GSUdfQ0ZJX0NMQU5HIGFuZCBDT05GSUdfQ0ZJX0dDQyBjb3VsZCBi
ZSBlbGltaW5hdGVkIHdpdGgKPj4gPiBDT05GSUdfQ0ZJIGJlY29taW5nIHVzZXIgc2VsZWN0YWJs
ZSwgd2hpY2ggd291bGQga2VlcCB0aGluZ3Mgd29ya2luZwo+PiA+IHNpbmNlIENPTkZJR19DRkk9
eSB3aWxsIGJlIHByZXNlbnQgaW4gdGhlIHByZXZpb3VzIGNvbmZpZ3VyYXRpb24uCj4+IAo+PiBJ
ZiB3ZSBhcmUgT0sgd2l0aCBzb21ldGhpbmcgbGlrZSB0aGlzIChpLmUuIHdhaXRpbmcgYSBmZXcg
cmVsZWFzZXMpLAo+PiB0aGVuIGlzbid0IGl0IHNpbXBsZXIgdGhlIGBkZWZfYm9vbGAgYXBwcm9h
Y2ggSSBtZW50aW9uZWQ/IGkuZS4gaXQKPj4gbWVhbnMgb25lIGxlc3Mgc3ltYm9sIGFuZCBvbmUg
bGVzcyByZW5hbWUgbGF0ZXIsIHJpZ2h0Pwo+Cj5BaCB5ZXMsIEkgcmVyZWFkIHlvdXIgc3VnZ2Vz
dGlvbiBhbmQgdGhhdCB3b3VsZCBwcm9iYWJseSBiZSB0aGUgYmVzdAo+Y291cnNlIG9mIGFjdGlv
biwgYXMgaXQgZG9lcyBhdm9pZCB0aGUgZXh0cmEgc3ltYm9sIChhbHRob3VnaCBJIGFtIG5vdAo+
c3VyZSB3aGF0IHlvdSBtZWFuIGJ5IG9uZSBsZXNzIHJlbmFtZT8pLiBBcyBJIHVuZGVyc3RhbmQg
aXQ6Cj4KPiAgY29uZmlnIENGSV9DTEFORwo+ICAgICAgYm9vbCAiVXNlIEtlcm5lbCBDb250cm9s
IEZsb3cgSW50ZWdyaXR5IChrQ0ZJKSIKPiAgICAgIGRlcGVuZHMgb24gQVJDSF9TVVBQT1JUU19D
RkkKPiAgICAgIGRlcGVuZHMgb24gJChjYy1vcHRpb24sLWZzYW5pdGl6ZT1rY2ZpKQo+ICAgICAg
aGVscAo+ICAgICAgICA8Z2VuZXJpYyBoZWxwIHRleHQ+Cj4KPiAgY29uZmlnIENGSQo+ICAgICAg
ZGVmX2Jvb2wgQ0ZJX0NMQU5HCgpPaCEgS2VlcCBDRklfQ0xBTkcgdGhlIHZpc2libGUgb3B0aW9u
PyBXaWxsIHRoZSBsYXRlciByZW5hbWUgd29yayByaWdodD8gSSdsbCBnaXZlIGl0IGEgdHJ5LgoK
LUtlZXMKCi0tIApLZWVzIENvb2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
