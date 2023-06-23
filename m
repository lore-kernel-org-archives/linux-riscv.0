Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E048EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 10:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yq+5AEbYYtvMGQg+KSQBcFXciKAfKkUYwoNvNIQCKG8=; b=prEPCvK/zGV4k4
	9lxAkZYQPb0kdM8LtC0Qts84RvxiWphfHGVb8jRNeIkve3DYCX+fvbQVIltNNdftpd1jjCSX2IaQ0
	Ls49ntQfpu5dGG4ksP4pMw+S3pJI9FmJbw1hLbB0tPXy6Jo+ff6r93PZu3+x6VGXWbTqK/I25XKCh
	tuC07BCoVChtCFVWU13dbkQOPBjdqh5utay2ZplIOBvR0YpVdF1yX8fTCMNFEuDX3vNXp3FYUKUbR
	sChLs+EuqK9B5beQBChDyXAGr+2A4f4myJkOGVpTTOeD79d12bUpAupVcrGJPMTsNFJxle4MFdeFi
	aHhphoVgqz8XqhCXsc2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCdwC-0039zE-2h;
	Fri, 23 Jun 2023 10:22:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCdw9-0039wV-1j
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jun 2023 10:22:42 +0000
Received: from i53875bdf.versanet.de ([83.135.91.223] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qCdw4-0005ig-99; Fri, 23 Jun 2023 12:22:36 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>, Stefan O'Rear <sorear@fastmail.com>
Cc: linux-riscv@lists.infradead.org, samuel@sholland.org, guoren@kernel.org,
 christoph.muellner@vrull.eu, conor.dooley@microchip.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] RISC-V: add T-Head vector errata handling
Date: Fri, 23 Jun 2023 12:22:35 +0200
Message-ID: <1961474.usQuhbGJ8B@diego>
In-Reply-To: <c01ee919-9abb-4796-9ed4-9bb4565dc863@app.fastmail.com>
References: <20230228215435.3366914-1-heiko@sntech.de> <9132027.CDJkKcVGEf@diego>
 <c01ee919-9abb-4796-9ed4-9bb4565dc863@app.fastmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_032241_578128_681A201E 
X-CRM114-Status: GOOD (  17.84  )
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

QW0gRnJlaXRhZywgMjMuIEp1bmkgMjAyMywgMDU6MDY6NDQgQ0VTVCBzY2hyaWViIFN0ZWZhbiBP
J1JlYXI6Cj4gT24gVGh1LCBKdW4gMjIsIDIwMjMsIGF0IDQ6MzUgUE0sIEhlaWtvIFN0w7xibmVy
IHdyb3RlOgo+ID4gQW0gRG9ubmVyc3RhZywgMjIuIEp1bmkgMjAyMywgMjA6NTg6MzcgQ0VTVCBz
Y2hyaWViIFN0ZWZhbiBPJ1JlYXI6Cj4gPj4gQXJlIHlvdSBhd2FyZSBvZiAiMy43LiBWZWN0b3Ig
Rml4ZWQtUG9pbnQgRmllbGRzIGluIGZjc3IiIGluCj4gPj4gcmlzY3Ytdi1zcGVjLTAuNy4xLnBk
Zj8KPiA+Cj4gPiBvaCB3b3csIHRoYW5rcyBhIGxvdCBmb3IgdGhhdCBwb2ludGVyLCBub3cgSSB1
bmRlcnN0YW5kIHlvdXIgY29uY2Vybi4KPiA+Cj4gPiBTbyBpbiB2ZWN0b3ItMC43LjEgZmNzclsx
MDo5XSBtaXJyb3JzIHZ4cm0gYW5kIGZjc3JbOF0gbWlycm9ycyB2eHNhdC4KPiA+Cj4gPgo+ID4g
T24gYSBwb3NpdGl2ZSBub3RlLCB0aGUgVC1IZWFkIGNvcmVzIHNlZW0gdG8gbm90IGltcGxlbWVu
dCB0aGUgZnVsbAo+ID4gdmVjdG9yIDAuNy4xIHNwZWNpZmljYXRpb24gYWZ0ZXIgYWxsLCBpbiB0
aGUgZG9jdW1lbnRhdGlvbiBJIGhhdmUgWzBdCj4gPiBmY3NyWzMxOjhdIGFyZSBkZWNsYXJlZCBh
cyAiMCIgYW5kIHVwcGVybW9zdCBiaXRzIGFyZSBbNzo1XSBmb3IgdGhlICJmcm0iCj4gPiBmaWVs
ZC4KPiAKPiBHaXZlbiB0aGF0IHRoZSBwZGYgeW91IGxpbmtlZCBkb2VzIG5vdCBtZW50aW9uIGFu
eSB2ZWN0b3IgQ1NScywgSSBhbSBub3QKPiBjb25maWRlbnQgdGhhdCBpdCBwcm92aWRlcyBhIGNv
bXBsZXRlIGFuZCBhY2N1cmF0ZSBkZXNjcmlwdGlvbiBvZiB2ZWN0b3IKPiBmdW5jdGlvbmFsaXR5
IGluIG90aGVyIHJlZ2lzdGVycyBmb3IgdGhlIEM5MDYgd2l0aCB2ZWN0b3IgZXh0ZW5zaW9uLgo+
IAo+IEFzc3VtaW5nIHRoYXQgeW91IGhhdmUgYWNjZXNzIHRvIHN1Y2ggYSBjaGlwLCBJIHdvdWxk
IGJlIG11Y2ggaGFwcGllciB3aXRoCj4gdGhlIHByb3Bvc2VkICJqdXN0IGEgY29tbWVudCIgYXBw
cm9hY2ggaWYgb3VyIHVuZGVyc3RhbmRpbmcgb2YgdGhlIGJlaGF2aW9yCj4gd2VyZSBjb25maXJt
ZWQgb24gaGFyZHdhcmUgKHNwZWNpZmljYWxseTogY3NyX3dyaXRlKENTUl9GQ1NSLCAweDcwMCkg
c2hvdWxkCj4gbm90IGFmZmVjdCBjc3JfcmVhZChDU1JfVlhSTSkgb3IgY3NyX3JlYWQoQ1NSX1ZY
U0FUKSkuCgpGb3Igb25lLCB5b3UncmUgcmlnaHQgdGhhdCBJIHNob3VsZCBkZWZpbml0bHkgdHJ5
IHRvIGNvbmZpcm0gdGhpcyBvbiBoYXJkd2FyZSA6LSkgLgoKQnV0IGFsc28gdGhlIFZYU0FUIGFu
ZCBWWFJNIENTUnMgYXJlIGFjdHVhbGx5IGRvY3VtZW50ZWQgaW4gdGhhdCBwZGYKb24gcGFnZSAz
MzUKCgpIZWlrbwoKCj4gCj4gLXMKPiAKPiA+IFNvIEkgZ3Vlc3MgYSBjb2RlIGNvbW1lbnQgc2hv
dWxkIHN1ZmZpY2UgdG8gZXhwbGFpbiA6LSkKPiA+Cj4gPgo+ID4gUmVnYXJkcwo+ID4gSGVpa28K
PiA+Cj4gPgo+ID4gWzBdIAo+ID4gaHR0cHM6Ly9naXRodWIuY29tL1QtaGVhZC1TZW1pL29wZW5j
OTA2L2Jsb2IvbWFpbi9kb2MvJUU3JThFJTg0JUU5JTkzJTgxQzkwNiVFNyU5NCVBOCVFNiU4OCVC
NyVFNiU4OSU4QiVFNSU4NiU4Qy5wZGYKPiA+IDE2LjMuMS4zIOa1rueCueaOp+WItueKtuaAgeWv
hOWtmOWZqO+8iEZDU1LvvIkgb24gcGFnZSAzMzQKPiAKCgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
