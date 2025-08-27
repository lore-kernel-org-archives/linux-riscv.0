Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F3FCA0FED
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Aug 2025 01:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTj0xs4AY5YsLISkbByf5u/tUAkUGEtD7cXS/1yQfpc=; b=opUXIM51rq7OcA
	dfCitNoZfqEoPJ6Zb1ErpgF86jUF9hic8+CXC55bA3x8u9ohMVxUXrzHBLfhTyHfRh51pwtVihndE
	fsJbZICpw0kThNuWx6YB63IM2ZlcZf2Nrmrlqob6XhFv5OBktIXIrq3ofyZJW9k8fDkyM2UHld0sI
	w+eFkXXaRzXj3f+OV1AiUqamr1gtBXpS3/aRayat8k+i3Pzs8I/bW/3bK8RERULIJFxduw+mhLRbM
	c/eSbOTTouL4ipEl1QhfgG5gU9e/OaZRiww4WXWow0fHgIs3EPoPljeZIw/kYCAgqoeZBHK8cEgWH
	S+YymeMfzECGBHWZR1Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur56Z-0000000DYBX-3BeX;
	Wed, 27 Aug 2025 01:37:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur53q-0000000DXe9-3z91;
	Wed, 27 Aug 2025 01:34:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A06843F7E;
	Wed, 27 Aug 2025 01:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78EAC4CEF1;
	Wed, 27 Aug 2025 01:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756258489;
	bh=4eiZvo+hL550WY6CZyKaK4fRP2VeqMte3/ZsoSFK2Bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iNIp4MzCAz/2Su6Q9ie6SJSrrgadQvUrBTeD8Iqgom97Azq/yiTX5YT/3bytvQl+R
	 c77dFs4j5ymA0p96r2A9q2eclhACDC0BeMXTZP3LnGFleYKgQ9mzTP+GLP+5gY/9Ld
	 t7KLAwBt93khS7Q2I4taw+eQH0o+6z/5mLHT/GtxiSd8i5gwIHOrQUTdUKOkadkKml
	 BoJhCES05WcIZSHiAvdbLB6rQmXqn6pV9HA0YzCMKsq74yPYyioPU2x3Lxud9h9HZh
	 77zbyyS0CGOO7salab+iMazbkewswWMxdSjGCMEwRVQAwc5Bm5GbuGBYLRhm1vqbze
	 /uP+OMYTMYmNg==
Date: Tue, 26 Aug 2025 18:34:44 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@outflux.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
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
Message-ID: <20250827013444.GA2859318@ax162>
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-5-kees@kernel.org>
 <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
 <202508250834.E2456B9@keescook>
 <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
 <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_183451_028665_21D5DBF9 
X-CRM114-Status: GOOD (  28.50  )
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

T24gTW9uLCBBdWcgMjUsIDIwMjUgYXQgMDM6MzE6MzRQTSAtMDQwMCwgS2VlcyBDb29rIHdyb3Rl
Ogo+IE9uIEF1Z3VzdCAyNSwgMjAyNSAxOjAwOjIyIFBNIEVEVCwgTWlndWVsIE9qZWRhIDxtaWd1
ZWwub2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToKPiA+T24gTW9uLCBBdWcgMjUsIDIw
MjUgYXQgNTozNeKAr1BNIEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Pgo+
ID4+IFllYWgsIHRoYXQncyBhIGdvb2QgaWRlYS4gV2hhdCB0aGUgcmlnaHQgd2F5IHRvIGRvIHRo
YXQ/Cj4gPj4KPiA+PiBjb25maWcgQ0ZJX0NMQU5HCj4gPj4gICAgICAgICBib29sICJVc2UgQ2xh
bmcncyBDb250cm9sIEZsb3cgSW50ZWdyaXR5IChDRkkpIgo+ID4+ICAgICAgICAgZGVwZW5kcyBv
biBBUkNIX1NVUFBPUlRTX0NGSQo+ID4+ICAgICAgICAgc2VsZWN0IENGSQo+ID4+Cj4gPj4gPwo+
ID4KPiA+SSBkb24ndCByZWNhbGwgd2hhdCBpcyB0aGUgaWRpb21hdGljIHNvbHV0aW9uIGZvciBy
ZW5hbWVzLCBidXQgSQo+ID5yZW1lbWJlciBMaW51cyB0YWxraW5nIGFib3V0IHRoaXMgdG9waWMg
YW5kIGFib3V0IGF2b2lkaW5nIGxvc2luZyBvbGQKPiA+dmFsdWVzIGlmIHBvc3NpYmxlIChwZXJo
YXBzIGdldHRpbmcgYSBuZXcgcXVlc3Rpb24gaW4gYG9sZGNvbmZpZ2AgaXMKPiA+T0sgYXMgbG9u
ZyBhcyB0aGUgYG9sZGRlZmNvbmZpZ2AgcmVzcGVjdHMgdGhlIG9sZCB2YWx1ZSkuCj4gPgo+ID5J
IHRoaW5rIHlvdXIgc3VnZ2VzdGlvbiBhYm92ZSB3aWxsIHN0aWxsIG1ha2UgaXQgYXBwZWFyIHR3
aWNlIGluCj4gPmBtZW51Y29uZmlnYCAtLSB0aGVyZSBtYXkgYmUgYSB3YXkgdG8gcGxheSB3aXRo
IHZpc2liaWxpdHkgdG8gbWFrZSBpdAo+ID5iZXR0ZXIuCj4gPgo+ID5BIHNpbXBsZSBwb3NzaWJp
bGl0eSBJIGNhbiB0aGluayBvZiAoYXNzdW1pbmcgaXQgd29ya3MpIGlzIGhhdmluZyB0aGUKPiA+
Q0ZJIHN5bWJvbCBmb3IgdGhlIHRpbWUgYmVpbmcgaW50cm9kdWNlZCBqdXN0IGFzIGEgYGRlZl9i
b29sCj4gPkNGSV9DTEFOR2AgZm9yIGEgZmV3IHJlbGVhc2VzIHNvIHRoYXQgcGVvcGxlIGdldCB0
aGUgbmV3IG9uZSBpbiB0aGVpcgo+ID5jb25maWdzLgo+IAo+IEFoLCBJIHRoaW5rIHRoaXMgd29y
a3M6Cj4gCj4gY29uZmlnIENGSV9DTEFORwo+ICAgICBib29sCj4gCj4gY29uZmlnIENGSQo+ICAg
ICBib29sICIuLi4uIgo+ICAgICBkZWZhdWx0IENGSV9DTEFORwo+IAo+IEkgd2lsbCBhZGQgdGhh
dCBmb3IgdjIuCgpUaGF0IGRvZXMgbm90IGFwcGVhciB0byB3b3JrIGZvciBtZS4gSSBhcHBsaWVk
CgpkaWZmIC0tZ2l0IGEvYXJjaC9LY29uZmlnIGIvYXJjaC9LY29uZmlnCmluZGV4IGMyNWE0NWQ5
YWE5Ni4uMGQzZWQwM2M3NmMyIDEwMDY0NAotLS0gYS9hcmNoL0tjb25maWcKKysrIGIvYXJjaC9L
Y29uZmlnCkBAIC04NzYsOCArODc2LDEyIEBAIGNvbmZpZyBBUkNIX1NVUFBPUlRTX0NGSQogY29u
ZmlnIEFSQ0hfVVNFU19DRklfVFJBUFMKICAgICAgICBib29sCgorY29uZmlnIENGSV9DTEFORwor
ICAgICAgIGJvb2wKKwogY29uZmlnIENGSQogICAgICAgIGJvb2wgIlVzZSBLZXJuZWwgQ29udHJv
bCBGbG93IEludGVncml0eSAoa0NGSSkiCisgICAgICAgZGVmYXVsdCBDRklfQ0xBTkcKICAgICAg
ICBkZXBlbmRzIG9uIEFSQ0hfU1VQUE9SVFNfQ0ZJCiAgICAgICAgZGVwZW5kcyBvbiAkKGNjLW9w
dGlvbiwtZnNhbml0aXplPWtjZmkpCiAgICAgICAgaGVscAoKb24gdG9wIG9mIHRoaXMgc2VyaWVz
IGFuZAoKICBDT05GSUdfQ0ZJX0NMQU5HPXkKICAjIENPTkZJR19DRklfSUNBTExfTk9STUFMSVpF
X0lOVEVHRVJTIGlzIG5vdCBzZXQKICAjIENPTkZJR19DRklfUEVSTUlTU0lWRSBpcyBub3Qgc2V0
CgpnZXRzIHR1cm5lZCBpbnRvCgogICMgQ09ORklHX0NGSSBpcyBub3Qgc2V0CgphZnRlciBvbGRk
ZWZjb25maWcuIENPTkZJR19DRklfQ0xBTkcgaGFzIHRvIGJlIHVzZXIgc2VsZWN0YWJsZSB3aXRo
IGEKcHJvbXB0IGJ1dCB0aGUgb25seSBzb2x1dGlvbiBJIGNhbiB0aGluayBvZiBhdCB0aGUgbW9t
ZW50IHJlc3VsdHMgaW4gYQpkdXBsaWNhdGUgcHJvbXB0IGZvciBDbGFuZy4KCmRpZmYgLS1naXQg
YS9hcmNoL0tjb25maWcgYi9hcmNoL0tjb25maWcKaW5kZXggYzI1YTQ1ZDlhYTk2Li45M2JmOWI0
MWE5ZGUgMTAwNjQ0Ci0tLSBhL2FyY2gvS2NvbmZpZworKysgYi9hcmNoL0tjb25maWcKQEAgLTg3
Niw4ICs4NzYsMTcgQEAgY29uZmlnIEFSQ0hfU1VQUE9SVFNfQ0ZJCiBjb25maWcgQVJDSF9VU0VT
X0NGSV9UUkFQUwogICAgICAgIGJvb2wKCitjb25maWcgQ0ZJX0NMQU5HCisgICAgICAgYm9vbCAi
VXNlIEtlcm5lbCBDb250cm9sIEZsb3cgSW50ZWdyaXR5IChrQ0ZJKSAtIFRyYW5zaXRpb25hbCIg
aWYgQ0NfSVNfQ0xBTkcKKyAgICAgICBzZWxlY3QgQ0ZJCisgICAgICAgZGVwZW5kcyBvbiBBUkNI
X1NVUFBPUlRTX0NGSQorICAgICAgIGRlcGVuZHMgb24gJChjYy1vcHRpb24sLWZzYW5pdGl6ZT1r
Y2ZpKQorICAgICAgIGhlbHAKKyAgICAgICAgIFRoaXMgaXMgYSB0cmFuc2l0aW9uYWwgc3ltYm9s
IHRvIENPTkZJR19DRkksIHNlZSBpdHMgaGVscCB0ZXh0CisgICAgICAgICBmb3IgbW9yZSBpbmZv
cm1hdGlvbi4KKwogY29uZmlnIENGSQotICAgICAgIGJvb2wgIlVzZSBLZXJuZWwgQ29udHJvbCBG
bG93IEludGVncml0eSAoa0NGSSkiCisgICAgICAgYm9vbCAiVXNlIEtlcm5lbCBDb250cm9sIEZs
b3cgSW50ZWdyaXR5IChrQ0ZJKSIgaWYgQ0NfSVNfR0NDCiAgICAgICAgZGVwZW5kcyBvbiBBUkNI
X1NVUFBPUlRTX0NGSQogICAgICAgIGRlcGVuZHMgb24gJChjYy1vcHRpb24sLWZzYW5pdGl6ZT1r
Y2ZpKQogICAgICAgIGhlbHAKCk1heWJlIHRoYXQgZG9lcyBub3QgbWF0dGVyIGZvciB0aGUgc2Fr
ZSBvZiBrZWVwaW5nIHRoaW5ncyB3b3JraW5nPwpPdGhlcndpc2UsIHdlIGNvdWxkIGp1c3Qga2Vl
cCB0aGluZ3MgYXMgdGhleSBhcmUgd2l0aCB0aGUgcGF0Y2ggc2V0IGFuZApleHBlY3QgcGVvcGxl
IHRvIGFjdHVhbGx5IHVzZSBvbGRjb25maWcgb3IgZGlmZiB0aGUgcmVzdWx0cyBvZgpvbGRkZWZj
b25maWcgKHdoaWNoIEkgdGhpbmsgaXMgZ29vZCBwcmFjdGljZSBhbnl3YXlzKS4KCkNoZWVycywK
TmF0aGFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
