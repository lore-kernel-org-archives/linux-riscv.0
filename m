Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171E9C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Apr 2022 22:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bxSOIs3roy7Py2vkx1RlcCL0XSIsbENE4psrb6xMK4s=; b=WQAM6tOumDZGOa
	ZlhC+33lWQNSJg/CNrmm+fJw2MHeD+fR5LLZGiTVgl6RwMfu7+en+kG9PTekDK+b14vykdZSkDGKb
	s2Q8AxUIV6irBWMesKWyzTbmPCa2aBzCg/9AR9TF0GdhNXommM6KMv8F8CGceevyAWPt6jbXC8rG1
	gCsGilKRAboZWkGclq0Cq8tq/SrNU8pGsweHV0ZwzIVPVVqM1ADaCzNfiOWKdkzfARzuiLxZIWzxk
	Wq8oQJKRpsuBKTwXaoq/vXCKEWp7msxZcFLfQpS5iffuj6u4j/g9zvhqZGGIjJHOddjHoCT8zmBfN
	jm7hEFtW7KTk6CzUZIGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfrK3-00DdvM-CN; Sat, 16 Apr 2022 22:55:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfrJo-00DdtF-B0; Sat, 16 Apr 2022 22:55:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0C20860FFE;
 Sat, 16 Apr 2022 22:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED602C385A1;
 Sat, 16 Apr 2022 22:54:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Ke3CzabD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1650149696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+2nP+VdPEpPNPoKQqSrgbL4ZK7I/c4P/cLhbUMeqeEs=;
 b=Ke3CzabDCTCN7z1X+blAnwmP5mSkY04Aqwf/G5fDtQU6WM6tPriviP3rwnh0y2BbiEiSI5
 kxvqYG3bXaLOy2oV1jIUlAv1SxvW/krAz60U3oZjY/ozmULtrXkPvuBaIxrnDhhjiRe7WK
 DiZ/+FwTFNQXboYw4FOs1PNDoMoDXRw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cef1d983
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Sat, 16 Apr 2022 22:54:56 +0000 (UTC)
Date: Sun, 17 Apr 2022 00:54:49 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Theodore Ts'o <tytso@mit.edu>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "David S . Miller" <davem@davemloft.net>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, John Stultz <john.stultz@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-um@lists.infradead.org, X86 ML <x86@kernel.org>,
 linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH v4 04/11] mips: use fallback for random_get_entropy()
 instead of zero
Message-ID: <YltJOfEylRC0rhKv@zx2c4.com>
References: <20220413115411.21489-1-Jason@zx2c4.com>
 <20220413115411.21489-5-Jason@zx2c4.com>
 <20220413122546.GA11860@alpha.franken.de>
 <alpine.DEB.2.21.2204131331450.9383@angie.orcam.me.uk>
 <CAHmME9pQ4xdeTUDxAdrOu=S9NRTonYzJVk50fa0Zfz4knZt5WA@mail.gmail.com>
 <alpine.DEB.2.21.2204140014580.9383@angie.orcam.me.uk>
 <YlfoeGRM6w2O+eXA@zx2c4.com>
 <alpine.DEB.2.21.2204142349180.9383@angie.orcam.me.uk>
 <CAHmME9qzkZqkGntLn--XfMKzyR=tYiCaZu1uFpoQBzAzCipZ-A@mail.gmail.com>
 <alpine.DEB.2.21.2204161533420.9383@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2204161533420.9383@angie.orcam.me.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220416_155504_561991_1AD31006 
X-CRM114-Status: GOOD (  31.76  )
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

SGkgTWFjaWVqLAoKT24gU2F0LCBBcHIgMTYsIDIwMjIgYXQgMDM6NDQ6NTNQTSArMDEwMCwgTWFj
aWVqIFcuIFJvenlja2kgd3JvdGU6Cj4gPiBPa2F5LCBJIGNhbiBnaXZlIHRoaXMgYSBzaG90LCBi
dXQgdGhpcyBjZXJ0YWlubHkgaXNuJ3QgbXkgZm9ydMOpLiBJdAo+ID4gbWF5IHVsdGltYXRlbHkg
d2luZCB1cCBiZWluZyBzaW1wbGVyIGZvciB5b3UgdG8ganVzdCBzZW5kIHNvbWUgY29kZSBvZgo+
ID4gd2hhdCB5b3UgZW52aXNpb24gZm9yIHRoaXMsIGJ1dCBpZiBJIHVuZGVyc3RhbmQgeW91ciBp
ZGVhIGNvcnJlY3RseSwKPiA+IHdoYXQgeW91J3JlIHNheWluZyBpcyBzb21ldGhpbmcgbGlrZToK
PiA+IAo+ID4gc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIHJhbmRvbV9nZXRfZW50cm9weSh2
b2lkKQo+ID4gewo+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgcHJpZCA9IHJlYWRfYzBfcHJpZCgp
Owo+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgaW1wID0gcHJpZCAmIFBSSURfSU1QX01BU0s7Cj4g
PiAgICAgICAgIHVuc2lnbmVkIGludCBjMF9yYW5kb207Cj4gPiAKPiA+ICAgICAgICAgaWYgKGNh
bl91c2VfbWlwc19jb3VudGVyKHByaWQpKQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiByZWFk
X2MwX2NvdW50KCk7Cj4gPiAKPiA+ICAgICAgICAgaWYgKGNwdV9oYXNfM2tleCkKPiA+ICAgICAg
ICAgICAgICAgICBjMF9yYW5kb20gPSAocmVhZF9jMF9yYW5kb20oKSA+PiA4KSAmIDB4M2Y7Cj4g
PiAgICAgICAgIGVsc2UKPiA+ICAgICAgICAgICAgICAgICBjMF9yYW5kb20gPSByZWFkX2MwX3Jh
bmRvbSgpICYgMHgzZjsKPiA+ICAgICAgICAgcmV0dXJuIChyYW5kb21fZ2V0X2VudHJvcHlfZmFs
bGJhY2soKSA8PCA2KSB8ICgweDNmIC0gYzBfcmFuZG9tKTsKPiA+IH0KPiA+IAo+ID4gV2hhdCBk
byB5b3UgdGhpbmsgb2YgdGhhdD8gU29tZSB0d2VhayBJJ20gbWlzc2luZz8KPiAKPiAgSXQgY2Vy
dGFpbmx5IGxvb2tzIGdvb2QgdG8gbWUuICBEbyB5b3UgaGF2ZSBhIHdheSBJIGNvdWxkIHZlcmlm
eSBob3cgdGhpcyAKPiBmdW5jdGlvbiBwZXJmb3Jtcz8gIElmIHNvLCB0aGVuIEkgY291bGQgcHV0
IGl0IHRocm91Z2ggbXkgc3lzdGVtcyBhcyBJIGNhbiAKPiBjb3ZlciBhbGwgdGhlIGNhc2VzIGhh
bmRsZWQgaGVyZS4KCk9oLCBhd2Vzb21lIGFib3V0IHRoZSB0ZXN0IHJpZy4gQmVsb3cgaXMgYSBs
aXR0bGUgcGF0Y2ggdGhhdCBhZGRzIHNvbWUKcHJpbnRmIGNvZGUgdG8gaW5pdCwgY2FsbGluZyB0
aGUgYWJvdmUgc2VxdWVuY2UgNzAgdGltZXMgaW4gYSBidXN5IGxvb3AKYW5kIHRoZW4gMzAgdGlt
ZXMgYWZ0ZXIgdGhhdCB3aXRoIGEgc2NoZWR1bGVyIDEgbXMgZGVsYXkgaW4gdGhlcmUsCnByaW50
aW5nIGxvdHMgb2YgdmFyaW91cyBhYm91dCB0aGUgYWJvdmUgY2FsY3VsYXRpb24uIEhvcGVmdWxs
eSB0aGF0J3MKZW5vdWdoIGluZm9ybWF0aW9uIHRoYXQgaXQnbGwgYmUgcG9zc2libGUgdG8gbm90
aWNlIGlmIHNvbWV0aGluZyBsb29rcwpyZWFsbHkgb2ZmIHdoZW4gd2Ugc3F1aW50IGF0IGl0LgoK
SmFzb24KCi0tLS0tLS0tLS0tLS0tLS0tLS04PC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jaGFyL3JhbmRv
bS5jIGIvZHJpdmVycy9jaGFyL3JhbmRvbS5jCmluZGV4IDNhMjkzZjkxOWFmOS4uMGIzMjIwM2Fh
NDdmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2NoYXIvcmFuZG9tLmMKKysrIGIvZHJpdmVycy9jaGFy
L3JhbmRvbS5jCkBAIC00OCw2ICs0OCw3IEBACiAjaW5jbHVkZSA8bGludXgvcHRyYWNlLmg+CiAj
aW5jbHVkZSA8bGludXgvd29ya3F1ZXVlLmg+CiAjaW5jbHVkZSA8bGludXgvaXJxLmg+CisjaW5j
bHVkZSA8bGludXgvZGVsYXkuaD4KICNpbmNsdWRlIDxsaW51eC9yYXRlbGltaXQuaD4KICNpbmNs
dWRlIDxsaW51eC9zeXNjYWxscy5oPgogI2luY2x1ZGUgPGxpbnV4L2NvbXBsZXRpb24uaD4KQEAg
LTE3ODEsNiArMTc4MiwyNiBAQCBzdGF0aWMgc3RydWN0IGN0bF90YWJsZSByYW5kb21fdGFibGVb
XSA9IHsKICAqLwogc3RhdGljIGludCBfX2luaXQgcmFuZG9tX3N5c2N0bHNfaW5pdCh2b2lkKQog
eworCisJaW50IGk7CisJZm9yIChpID0gMDsgaSA8IDEwMDsgKytpKSB7CisJCWlmIChjYW5fdXNl
X21pcHNfY291bnRlcihyZWFkX2MwX3ByaWQoKSkpCisJCQlwcl9lcnIoIlNBUlUgJWQgYzAgY291
bnQ6ICUwOHhcbiIsIGksIHJlYWRfYzBfY291bnQoKSk7CisJCWVsc2UgeworCQkJdW5zaWduZWQg
aW50IGMwX3JhbmRvbSA9IHJlYWRfYzBfcmFuZG9tKCksIGMwX3JhbmRvbV9tYXNrOworCQkJdW5z
aWduZWQgbG9uZyBmYWxsYmFjayA9IHJhbmRvbV9nZXRfZW50cm9weV9mYWxsYmFjaygpLCBvdXQ7
CisJCQlpZiAoY3B1X2hhc18za2V4KQorCQkJCWMwX3JhbmRvbV9tYXNrID0gKGMwX3JhbmRvbSA+
PiA4KSAmIDB4M2Y7CisJCQllbHNlCisJCQkJYzBfcmFuZG9tX21hc2sgPSBjMF9yYW5kb20gJiAw
eDNmOworCQkJb3V0ID0gKGZhbGxiYWNrIDw8IDYpIHwgKDB4M2YgLSBjMF9yYW5kb21fbWFzayk7
CisJCQlwcl9lcnIoIlNBUlU6ICVkICglMDh4ID4+IG4pICYgMHgzZiA9ICUwOHgsIGludmVydGVk
ID0gJTA4eCwgZmFsbGJhY2sgPSAlMDhseCwgZmFsbGJhY2sgPDwgNiA9ICUwOGx4LCBjb21iaW5l
ZCA9ICUwOGx4XG4iLAorCQkJICAgICAgIGksIGMwX3JhbmRvbSwgYzBfcmFuZG9tX21hc2ssIDB4
M2YgLSBjMF9yYW5kb21fbWFzaywgZmFsbGJhY2ssIGZhbGxiYWNrIDw8IDYsIG91dCk7CisJCX0K
KwkJaWYgKGkgPiA3MCkKKwkJCW1zbGVlcCgxKTsKKwl9CisKIAlyZWdpc3Rlcl9zeXNjdGxfaW5p
dCgia2VybmVsL3JhbmRvbSIsIHJhbmRvbV90YWJsZSk7CiAJcmV0dXJuIDA7CiB9CmRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L3RpbWV4LmggYi9pbmNsdWRlL2xpbnV4L3RpbWV4LmgKaW5kZXgg
NTc0NWM5MGM4ODAwLi4zODcxYjA2YmQzMDIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvdGlt
ZXguaAorKysgYi9pbmNsdWRlL2xpbnV4L3RpbWV4LmgKQEAgLTYyLDYgKzYyLDggQEAKICNpbmNs
dWRlIDxsaW51eC90eXBlcy5oPgogI2luY2x1ZGUgPGxpbnV4L3BhcmFtLmg+CgordW5zaWduZWQg
bG9uZyByYW5kb21fZ2V0X2VudHJvcHlfZmFsbGJhY2sodm9pZCk7CisKICNpbmNsdWRlIDxhc20v
dGltZXguaD4KCiAjaWZuZGVmIHJhbmRvbV9nZXRfZW50cm9weQpAQCAtNzQsOCArNzYsMTQgQEAK
ICAqCiAgKiBCeSBkZWZhdWx0IHdlIHVzZSBnZXRfY3ljbGVzKCkgZm9yIHRoaXMgcHVycG9zZSwg
YnV0IGluZGl2aWR1YWwKICAqIGFyY2hpdGVjdHVyZXMgbWF5IG92ZXJyaWRlIHRoaXMgaW4gdGhl
aXIgYXNtL3RpbWV4LmggaGVhZGVyIGZpbGUuCisgKiBJZiBhIGdpdmVuIGFyY2ggZG9lcyBub3Qg
aGF2ZSBnZXRfY3ljbGVzKCksIHRoZW4gd2UgZmFsbGJhY2sgdG8KKyAqIHVzaW5nIHJhbmRvbV9n
ZXRfZW50cm9weV9mYWxsYmFjaygpLgogICovCisjaWZkZWYgZ2V0X2N5Y2xlcwogI2RlZmluZSBy
YW5kb21fZ2V0X2VudHJvcHkoKQkoKHVuc2lnbmVkIGxvbmcpZ2V0X2N5Y2xlcygpKQorI2Vsc2UK
KyNkZWZpbmUgcmFuZG9tX2dldF9lbnRyb3B5KCkJcmFuZG9tX2dldF9lbnRyb3B5X2ZhbGxiYWNr
KCkKKyNlbmRpZgogI2VuZGlmCgogLyoKZGlmZiAtLWdpdCBhL2tlcm5lbC90aW1lL3RpbWVrZWVw
aW5nLmMgYi9rZXJuZWwvdGltZS90aW1la2VlcGluZy5jCmluZGV4IGRjZGNiODUxMjFlNC4uN2Nk
MmVjMjM5Y2FlIDEwMDY0NAotLS0gYS9rZXJuZWwvdGltZS90aW1la2VlcGluZy5jCisrKyBiL2tl
cm5lbC90aW1lL3RpbWVrZWVwaW5nLmMKQEAgLTE3LDYgKzE3LDcgQEAKICNpbmNsdWRlIDxsaW51
eC9jbG9ja3NvdXJjZS5oPgogI2luY2x1ZGUgPGxpbnV4L2ppZmZpZXMuaD4KICNpbmNsdWRlIDxs
aW51eC90aW1lLmg+CisjaW5jbHVkZSA8bGludXgvdGltZXguaD4KICNpbmNsdWRlIDxsaW51eC90
aWNrLmg+CiAjaW5jbHVkZSA8bGludXgvc3RvcF9tYWNoaW5lLmg+CiAjaW5jbHVkZSA8bGludXgv
cHZjbG9ja19ndG9kLmg+CkBAIC0yMzgwLDYgKzIzODEsMTUgQEAgc3RhdGljIGludCB0aW1la2Vl
cGluZ192YWxpZGF0ZV90aW1leChjb25zdCBzdHJ1Y3QgX19rZXJuZWxfdGltZXggKnR4YykKIAly
ZXR1cm4gMDsKIH0KCisvKioKKyAqIHJhbmRvbV9nZXRfZW50cm9weV9mYWxsYmFjayAtIFJldHVy
bnMgdGhlIHJhdyBjbG9jayBzb3VyY2UgdmFsdWUsCisgKiB1c2VkIGJ5IHJhbmRvbS5jIGZvciBw
bGF0Zm9ybXMgd2l0aCBubyB2YWxpZCByYW5kb21fZ2V0X2VudHJvcHkoKS4KKyAqLwordW5zaWdu
ZWQgbG9uZyByYW5kb21fZ2V0X2VudHJvcHlfZmFsbGJhY2sodm9pZCkKK3sKKwlyZXR1cm4gdGtf
Y2xvY2tfcmVhZCgmdGtfY29yZS50aW1la2VlcGVyLnRrcl9tb25vKTsKK30KK0VYUE9SVF9TWU1C
T0xfR1BMKHJhbmRvbV9nZXRfZW50cm9weV9mYWxsYmFjayk7CgogLyoqCiAgKiBkb19hZGp0aW1l
eCgpIC0gQWNjZXNzb3IgZnVuY3Rpb24gdG8gTlRQIF9fZG9fYWRqdGltZXggZnVuY3Rpb24KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
