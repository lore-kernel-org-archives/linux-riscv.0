Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3AACA0EED
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 01:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f/RtvydycNyAY60idytOLiAclMIL3neSdFxoqBXx6aU=; b=LAYsS1ZmbtO93V
	WuXMJAs+u3JlJkq1DOKpOkIWp6lNVV6nWazR7SCiB8xYCA6LCRkGBYntguYpfJxSRtC8Db3JimExe
	/UihI86U1TC6ylqdMmhyd0/t4yVlitH5hkBrBGJBPHuCM8/JqEF/WkKNsoa67NyjPJ2KCyfeiBgiQ
	Mu1h8TjTpejkWRTE8UUY/ICJnZ9/MrMO8GwAFsKsMysFKPvKZq69Yqf75O5MUmt1Sk5hU1CgKWhEg
	n/Ah2w0v0VTEGRObqNKwBjOQsh1E1hNrtmd31bKR1O6CiZXTusT5WqwuIGqNHi3HDVaNBkZhopKeA
	3MeDiLIBeVV8Mbv3U9kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urndY-00000003xcE-2hb0;
	Fri, 29 Aug 2025 01:10:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urj5d-000000039qW-3Zdr;
	Thu, 28 Aug 2025 20:19:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D48E45229;
	Thu, 28 Aug 2025 20:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8182C4CEEB;
	Thu, 28 Aug 2025 20:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756412361;
	bh=EfjnmzRM4EzcfrEjZb23/Q388aWEyQC6jnzqc5fc3EY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BWYmvZjGSIhGsXSITNjValCU+H/NakH+Ls/Djn/tsb1jdJotNaLCwT5loQOWcouAI
	 L9RCLZblArg6XxZ+165bTtoXHQyfMZbRxY+nq4By7/Vbriu4UDciz9M/fhi292xlfg
	 MlvDF7Q4gmgRW+JnZQb3ugIJFYG51hxAsvnNyrfGhLWRmuR6Q0Z09CQF+EJfYGL/kc
	 ZLYOLaR3Cf0mRUUVYgkqT6Dsu1hWwB2LTJDQceK8ZyzuT6aZQBjTVDVsis5JCRanln
	 EYIsBdufpk0e3794rEjgqj9JtPTkeB3oYtJopEGq552ZGP7crVncu0xWF1Qjhp/ycN
	 0/2Ql3ZHeRFRw==
Date: Thu, 28 Aug 2025 13:19:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@outflux.net>,
	Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
Message-ID: <20250828201915.GA219815@ax162>
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-5-kees@kernel.org>
 <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
 <202508250834.E2456B9@keescook>
 <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
 <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net>
 <20250827013444.GA2859318@ax162>
 <56c2b1ce-00a4-403c-9927-79bfd9a23574@infradead.org>
 <20250827193815.GA2293657@ax162>
 <CANiq72nX7d3XQtQKDdeUh2RFy5HqSg360m4pzesJyBP+y9K7FA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANiq72nX7d3XQtQKDdeUh2RFy5HqSg360m4pzesJyBP+y9K7FA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_131921_931329_2F774A67 
X-CRM114-Status: GOOD (  19.78  )
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

T24gVGh1LCBBdWcgMjgsIDIwMjUgYXQgMDI6MTE6NTFQTSArMDIwMCwgTWlndWVsIE9qZWRhIHdy
b3RlOgo+IE9uIFdlZCwgQXVnIDI3LCAyMDI1IGF0IDk6MzjigK9QTSBOYXRoYW4gQ2hhbmNlbGxv
ciA8bmF0aGFuQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gQW5vdGhlciBpZGVhIEkgaGFkIHRvIGF2
b2lkIHRoaXMgaXMgaW50cm9kdWNpbmcgQ09ORklHX0NGSV9HQ0MgYXMgYSB1c2VyCj4gPiBzZWxl
Y3RhYmxlIHN5bWJvbCBhbmQgbWFraW5nIENPTkZJR19DRkkgdGhlIGhpZGRlbiBzeW1ib2wgdGhh
dCBib3RoCj4gPiBjb21waWxlciBzeW1ib2xzIHNlbGVjdC4gQWZ0ZXIgYSBjb3VwbGUgb2YgcmVs
ZWFzZXMgKG9yIG1heWJlIHRoZSBuZXh0Cj4gPiBMVFMpLCBib3RoIENPTkZJR19DRklfQ0xBTkcg
YW5kIENPTkZJR19DRklfR0NDIGNvdWxkIGJlIGVsaW1pbmF0ZWQgd2l0aAo+ID4gQ09ORklHX0NG
SSBiZWNvbWluZyB1c2VyIHNlbGVjdGFibGUsIHdoaWNoIHdvdWxkIGtlZXAgdGhpbmdzIHdvcmtp
bmcKPiA+IHNpbmNlIENPTkZJR19DRkk9eSB3aWxsIGJlIHByZXNlbnQgaW4gdGhlIHByZXZpb3Vz
IGNvbmZpZ3VyYXRpb24uCj4gCj4gSWYgd2UgYXJlIE9LIHdpdGggc29tZXRoaW5nIGxpa2UgdGhp
cyAoaS5lLiB3YWl0aW5nIGEgZmV3IHJlbGVhc2VzKSwKPiB0aGVuIGlzbid0IGl0IHNpbXBsZXIg
dGhlIGBkZWZfYm9vbGAgYXBwcm9hY2ggSSBtZW50aW9uZWQ/IGkuZS4gaXQKPiBtZWFucyBvbmUg
bGVzcyBzeW1ib2wgYW5kIG9uZSBsZXNzIHJlbmFtZSBsYXRlciwgcmlnaHQ/CgpBaCB5ZXMsIEkg
cmVyZWFkIHlvdXIgc3VnZ2VzdGlvbiBhbmQgdGhhdCB3b3VsZCBwcm9iYWJseSBiZSB0aGUgYmVz
dApjb3Vyc2Ugb2YgYWN0aW9uLCBhcyBpdCBkb2VzIGF2b2lkIHRoZSBleHRyYSBzeW1ib2wgKGFs
dGhvdWdoIEkgYW0gbm90CnN1cmUgd2hhdCB5b3UgbWVhbiBieSBvbmUgbGVzcyByZW5hbWU/KS4g
QXMgSSB1bmRlcnN0YW5kIGl0OgoKICBjb25maWcgQ0ZJX0NMQU5HCiAgICAgIGJvb2wgIlVzZSBL
ZXJuZWwgQ29udHJvbCBGbG93IEludGVncml0eSAoa0NGSSkiCiAgICAgIGRlcGVuZHMgb24gQVJD
SF9TVVBQT1JUU19DRkkKICAgICAgZGVwZW5kcyBvbiAkKGNjLW9wdGlvbiwtZnNhbml0aXplPWtj
ZmkpCiAgICAgIGhlbHAKICAgICAgICA8Z2VuZXJpYyBoZWxwIHRleHQ+CgogIGNvbmZpZyBDRkkK
ICAgICAgZGVmX2Jvb2wgQ0ZJX0NMQU5HCgp0aGVuIGtlZXAgdGhlIHJlc3Qgb2YgdGhlIGNoYW5n
ZSB0aGUgc2FtZSB3aXRoIHRoZSByZW5hbWU/IEkgZ3Vlc3MgdGhlCkNMQU5HIGluIHRoZSBzeW1i
b2wgbmFtZSBjb3VsZCBiZSBjb25mdXNpbmcgZm9yIHNvbWUgcGVvcGxlIGJ1dCB0aGlua2luZwph
Ym91dCB0aGUgdGltZWxpbmUgbW9yZSwga0NGSSB3b3VsZCBub3Qgc2hpcCB1bnRpbCBHQ0MgMTYg
aW4gdGhlIHNwcmluZwpvZiAyMDI2LCB3aGljaCB3b3VsZCBiZSBhZnRlciB0aGUgTGludXggTFRT
IHJlbGVhc2UgYXQgdGhlIGVuZCBvZiAyMDI1LgpUaGF0IG1lYW5zIHdlIGNvdWxkIGVhc2lseSBk
cm9wIENPTkZJR19DRklfQ0xBTkcgaW4gdGhlIGZpcnN0IHJlbGVhc2Ugb2YKMjAyNiBzbyB0aGF0
IGNvbXBhdGlibGUgR0NDIHVzZXJzIHNob3VsZCBvbmx5IGV2ZXIgc2VlIENPTkZJR19DRkkgZnJv
bQptYWlubGluZS4gVGhleSBjb3VsZCBzZWUgQ09ORklHX0NGSV9DTEFORyBpbiB0aGUgTFRTIHJl
bGVhc2UgYnV0IGF0CmxlYXN0IGl0IHdvdWxkIHdvcmsuCgpDaGVlcnMsCk5hdGhhbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
