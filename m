Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE7AC54FD2
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 10:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iKcvrwDYxKjVQXl3muR3Bk3DdhTBlYk/d4LyiM5y3DY=; b=NXYahqmf9VevBh
	HhNMIA/ZLc6F0UZA+7YkOQ+U60ll+S3IKTHJ8eVQPKlMue5gGosy9dXCiSsxCTdu2BlRqQ5YezmC2
	XlDJ+O5AYRIrFptXkiSCZsnL4epMnAgBNUHT6FJ81lXDkYCxqf6waaYN4iIfQKAQuUgpd+COJfqS5
	bGcU0S5o+MIb15F7dZ3hBOyqOJ0vxpEnxkgLUym04BGEFZyfmHBjNhzgwSlPiHVV+gFoUi8KzPM6E
	WhZmS7JzVf8hB+nB3fvVsC3np+A3/SIE6kJMtC6HB2IliQngiHTR6zQZ4OhTZQHo05wVcFYxZQFiG
	Is9IQqGlTyvTgaN2bQfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpO1S-0000000ADPL-2upm;
	Thu, 30 Jul 2026 10:29:54 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpO1P-0000000ADOX-1ij7
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 10:29:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=vbTNiedtnxgS+E1WPZ3pa0G/5XHZzK3aTZZcd+th5Qk=; b=X07dHkYPrBZa98ssb7O973MVAG
	HiAc/y5QSF1xAPbSPifiM/XPZa4RKE7rUpaVnqu0hMrKJ1AYWw8ix8SPILXcQ5uryBBVWF0MflNWw
	pbxJCY6SvfsroOkZk2/wFgIjBzloFftigouNaU6Szkp5bB9cijlIoegflej7j259DFP5J6QB7aQsq
	UH4kljUYoJBcz1M5fqlWeBZ+8TfpmxcOBOUKgYMa/6hmx7S4mWbifKhHCek3eVje5ZfNVjfZF6l15
	bztYNs+xJE5hLaSf0OhL/u2oog8pmnE+YmKQG4box9Ze7DAEtj2jMM2hX7H6XY8XSBU5J7HtrcWr8
	exbpJ8uw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wpO1M-000000041GG-37aa;
	Thu, 30 Jul 2026 12:29:48 +0200
Date: Thu, 30 Jul 2026 12:29:45 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Paul Walmsley <pjw@kernel.org>
Cc: linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 1/4] riscv: defconfig: enable RFKILL and RFKILL_GPIO
Message-ID: <amsnmUMKXDWLFJio@aurel32.net>
Mail-Followup-To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Paul Walmsley <pjw@kernel.org>, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
References: <20260729172450.1660418-1-aurelien@aurel32.net>
 <20260729172450.1660418-2-aurelien@aurel32.net>
 <CAEev2e-_jW8OYoJofrT3VATyZg87DHUEM1qHNpdnPAJ-SwOjcw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEev2e-_jW8OYoJofrT3VATyZg87DHUEM1qHNpdnPAJ-SwOjcw@mail.gmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_032951_458148_4F2E0DDE 
X-CRM114-Status: GOOD (  16.71  )
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

SGksIEFuaXJ1ZGgsCgpPbiAyMDI2LTA3LTI5IDEyOjMwLCBBbmlydWRoIFNyaW5pdmFzYW4gd3Jv
dGU6Cj4gSGkgQXVyZWxpZW4sCj4gCj4gT24gV2VkLCBKdWwgMjksIDIwMjYgYXQgMTI6MjTigK9Q
TSBBdXJlbGllbiBKYXJubyA8YXVyZWxpZW5AYXVyZWwzMi5uZXQ+IHdyb3RlOgo+ID4KPiA+IFRo
ZSBTcGFjZW1pVCBLMyBQaWNvLUlUWCByZXF1aXJlcyBSRktJTExfR1BJTyB0byBlbmFibGUgYmx1
ZXRvb3RoIGFuZAo+ID4gd2xhbi4KPiA+Cj4gPiBUZXN0ZWQtYnk6IEFuaXJ1ZGggU3Jpbml2YXNh
biA8YXNyaW5pdmFzYW5Ab3NzLnRlbnN0b3JyZW50LmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEF1
cmVsaWVuIEphcm5vIDxhdXJlbGllbkBhdXJlbDMyLm5ldD4KPiA+IC0tLQo+ID4gIGFyY2gvcmlz
Y3YvY29uZmlncy9kZWZjb25maWcgfCAyICsrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2NvbmZpZ3MvZGVmY29uZmln
IGIvYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZwo+ID4gaW5kZXggNzRiYTVhY2MxMmE0MC4u
ODY2OGFhMzFlNzlhYSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvY29uZmlncy9kZWZjb25m
aWcKPiA+ICsrKyBiL2FyY2gvcmlzY3YvY29uZmlncy9kZWZjb25maWcKPiA+IEBAIC05OSw2ICs5
OSw4IEBAIENPTkZJR19ORVRfQ0xTX0NHUk9VUD1tCj4gPiAgQ09ORklHX05FVExJTktfRElBRz15
Cj4gPiAgQ09ORklHX0NHUk9VUF9ORVRfUFJJTz15Cj4gPiAgQ09ORklHX0NBTj1tCj4gPiArQ09O
RklHX1JGS0lMTD1tCj4gPiArQ09ORklHX1JGS0lMTF9HUElPPW0KPiA+ICBDT05GSUdfTkVUXzlQ
PXkKPiA+ICBDT05GSUdfTkVUXzlQX1ZJUlRJTz15Cj4gPiAgQ09ORklHX1BDST15Cj4gCj4gVGhl
IHJpc2N2IGRlZmNvbmZpZyBkb2Vzbid0IGhhdmUgQ09ORklHX1JUVzg5PW0gYW5kCj4gQ09ORklH
X1JUVzg5Xzg4NTJCRSBpbiBpdC4gRG8gd2UgbmVlZCB0byBhZGQgaXQ/CgpUaGF0J3MgYSBnb29k
IHBvaW50LCBub3Qgc3VyZSB0byB3aGljaCBsZXZlbCB3ZSBuZWVkIHRvIGVuYWJsZSBhbGwgCm1v
ZHVsZXMgb2Ygc3VwcG9ydGVkIGhhcmR3YXJlLiBJIGFkZGVkIFJGS0lMTCBhbmQgUkZLSUxMX0dQ
SU8gYXMgaXQgd2FzIApub3Qgb2J2aW91cyB0byBtZSB0aGF0IHRob3NlIG5lZWQgdG8gYmUgZW5h
YmxlZCB0byBnZXQgcHJvcGVyIFdpRmkgCnN1cHBvcnQuIEFsc28gdGhvc2UgYXJlIHRpbnkgZHJp
dmVycyBjb21wYXJlZCB0byB0aGUgUlRXODkgZHJpdmVyLgpPVE9ILCBJIHNlZSB0aGF0IHRoaXMg
ZHJpdmVyIGlzIGVuYWJsZWQgZm9yIHRoZSBsb29uZ2FyY2ggYXJjaGl0ZWN0dXJlLCAKc28gbWF5
YmUgd2UgY2FuIGRvIHRoZSBzYW1lIGZvciByaXNjdi4uCgpQYXVsLCBhbnkgaWRlYSBhYm91dCB0
aGF0LCBhbnkgcG9saWN5PwoKPiBJIHdhcyB0ZXN0aW5nIHdpdGggYSBkaXN0cm8gZGVmY29uZmln
LCBzbyBkaWRuJ3QgbmVlZCB0byBhZGQgaXQKPiBtYW51YWxseS4gSSBzaG91bGQgaGF2ZSByZWFs
aXplZCB0aGlzIHNvb25lci4KClllcyBzYW1lLCBzbyBJIGFsc28gZGlkbid0IG5vdGljZS4KClJl
Z2FyZHMKQXVyZWxpZW4KCi0tIApBdXJlbGllbiBKYXJubyAgICAgICAgICAgICAgICAgICAgICAg
ICAgR1BHOiA0MDk2Ui8xREREOEM5QgphdXJlbGllbkBhdXJlbDMyLm5ldCAgICAgICAgICAgICAg
ICAgICAgIGh0dHA6Ly9hdXJlbDMyLm5ldAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
