Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F33FC43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 17:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NaAW2i/64ZwdniPwz7BjXfyOZltz6ghN8mrGdcZLZVM=; b=mAran/R2gEsNGr
	CWs7KZrv94/DQHGExymcf46JRCQ+nYdNTlVHwUIgsBbDMz3pD2nMGFM/yLJm+FBMMssqa9wno3ehw
	lk4yKezlqpO0/DjSxIYXJUWghKGBlTzN4bw04/yrPwlx5em4XZ/hhdqwaBzawq6SRZNS0OTYUzQ2S
	8PlGnoE2U5DyLZTgyTa9pEoxBcYbAPpia4wmbdjE9iBUcxJpDQgE8B1iiq02B/HRZ//0Zb5didsAv
	tmfsf0zB01pGMb3gHaeIVxYvDHAjAUkQ0hFxD2TNAcnXKEPwq9DOMIk4wU6MUduWvW5nZKTz8Ek9N
	6drXgZKg944iTCBS+00w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEyT-00000005QvQ-0t3B;
	Fri, 10 Jul 2026 17:25:17 +0000
Received: from 93-87-244-166.static.isp.telekom.rs ([93.87.244.166] helo=fx.arvanta.net)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEyQ-00000005Qsk-1b1F
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 17:25:15 +0000
Received: from air.arvanta.net (air.arvanta.net [10.5.1.4])
	by fx.arvanta.net (Postfix) with ESMTP id ED996CF;
	Fri, 10 Jul 2026 19:25:06 +0200 (CEST)
Date: Fri, 10 Jul 2026 19:25:06 +0200
From: Milan =?utf-8?Q?P=2E_Stani=C4=87?= <mps@arvanta.net>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/2] cpufreq: spacemit: Add cpufreq support for K1 SoC
Message-ID: <20260710172506.GA7260@air.arvanta.net>
References: <20260626-shadow-deps-v4-0-bba9831f2f1d@mailbox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260626-shadow-deps-v4-0-bba9831f2f1d@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_102514_587383_3C6B0A9D 
X-CRM114-Status: GOOD (  16.81  )
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

T24gRnJpLCAyMDI2LTA2LTI2IGF0IDE2OjEwLCBTaHV3ZWkgV3Ugd3JvdGU6Cj4gVGhpcyBzZXJp
ZXMgZW5hYmxlcyBDUFUgRFZGUyBmb3IgdGhlIFNwYWNlbWlUIEsxIFNvQyB1c2luZyB0aGUgZ2Vu
ZXJpYwo+IGNwdWZyZXEtZHQgZHJpdmVyLgo+IAo+IEsxIGhhcyB0d28gQ1BVIGNsb2NrIGNsdXN0
ZXJzLiBUaGUgdHdvIGNsdXN0ZXJzIGhhdmUgc2VwYXJhdGUgQ1BVIGNsb2NrcywKPiBzbyB0aGV5
IGFyZSByZXByZXNlbnRlZCBhcyB0d28gY3B1ZnJlcSBwb2xpY2llczogcG9saWN5MCBmb3IgQ1BV
cyAwLTMgYW5kCj4gcG9saWN5NCBmb3IgQ1BVcyA0LTcuCj4gCj4gVGhlIENQVSB2b2x0YWdlIHJh
aWwgaXMgc2hhcmVkIGJldHdlZW4gdGhlIGNsdXN0ZXJzLiBUbyBtb2RlbCB0aGlzIHdpdGggdHdv
Cj4gcG9saWNpZXMsIHRoZSBPUFAgZW50cmllcyBkZXNjcmliZSB2b2x0YWdlIHJhbmdlcyBpbnN0
ZWFkIG9mIGEgc2luZ2xlIGZpeGVkCj4gdm9sdGFnZSwgc28gdGhlIHNoYXJlZCByZWd1bGF0b3Ig
Y2FuIGtlZXAgdGhlIHJhaWwgd2l0aGluIGEgcmFuZ2UgYWNjZXB0YWJsZQo+IGZvciB0aGUgYWN0
aXZlIE9QUCBjb25zdHJhaW50cy4KPiAKPiBUZXN0ZWQgb24gQmFuYW5hIFBpIEJQSS1GMzoKPiAK
PiB+ICMgY2F0IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L29ubGluZQo+IDAtNwo+IAo+IH4gIyBs
cyAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHVmcmVxLwo+IHBvbGljeTAgIHBvbGljeTQKPiAK
PiB+ICMgY2F0IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdWZyZXEvcG9saWN5MC9zY2FsaW5n
X2RyaXZlcgo+IGNwdWZyZXEtZHQKPiB+ICMgY2F0IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dWZyZXEvcG9saWN5MC9hZmZlY3RlZF9jcHVzCj4gMCAxIDIgMwo+IAo+IH4gIyBjYXQgL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1ZnJlcS9wb2xpY3k0L3NjYWxpbmdfZHJpdmVyCj4gY3B1ZnJl
cS1kdAo+IH4gIyBjYXQgL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1ZnJlcS9wb2xpY3k0L2Fm
ZmVjdGVkX2NwdXMKPiA0IDUgNiA3Cj4gCj4gQm90aCBwb2xpY2llcyBleHBvc2UgdGhlIHNhbWUg
T1BQIGZyZXF1ZW5jaWVzOgo+IAo+IH4gIyBjYXQgL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
ZnJlcS9wb2xpY3kwL3NjYWxpbmdfYXZhaWxhYmxlX2ZyZXF1ZW5jaWVzCj4gNjE0NDAwIDgxOTAw
MCAxMDAwMDAwIDEyMjg4MDAgMTYwMDAwMAo+IAo+IH4gIyBjYXQgL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1ZnJlcS9wb2xpY3k0L3NjYWxpbmdfYXZhaWxhYmxlX2ZyZXF1ZW5jaWVzCj4gNjE0
NDAwIDgxOTAwMCAxMDAwMDAwIDEyMjg4MDAgMTYwMDAwMAo+IAo+IEZvciBlYWNoIHBvbGljeSwg
c2NhbGluZ19zZXRzcGVlZCB3YXMgc2V0IHRvIGVhY2ggc3VwcG9ydGVkIE9QUCBhbmQgdGhlCj4g
d29ya2xvYWQgd2FzIHBpbm5lZCB0byBvbmUgQ1BVIGNvdmVyZWQgYnkgdGhhdCBwb2xpY3kgd2l0
aCB0YXNrc2V0Lgo+IENQVTAgd2FzIHVzZWQgZm9yIHBvbGljeTAsIGFuZCBDUFU0IHdhcyB1c2Vk
IGZvciBwb2xpY3k0LiBUaGUgY2xvY2sgcmF0ZXMgYmVsb3cKPiBhcmUgZnJvbSAvc3lzL2tlcm5l
bC9kZWJ1Zy9jbGsvY2xrX3N1bW1hcnkuCj4gCj4gcG9saWN5MCAvIENQVTA6Cj4gLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IEZyZXF1
ZW5jeSAgICB8ICBjcHVfYzBfY29yZV9jbGsgIHwgIFJlYWwgKHMpICB8ICBVc2VyIChzKQo+IChr
SHopICAgICAgICB8ICAoSHopICAgICAgICAgICAgIHwgICAgICAgICAgICB8Cj4gLS0tLS0tLS0t
LS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLQo+IDEsNjAw
LDAwMCAgICB8ICAxLDYwMCwwMDAsMDAwICAgIHwgICAgMS44MSAgICB8ICAgIDEuODAKPiAxLDIy
OCw4MDAgICAgfCAgMSwyMjgsODAwLDAwMCAgICB8ICAgIDIuMzcgICAgfCAgICAyLjM3Cj4gMSww
MDAsMDAwICAgIHwgIDEsMDAwLDAwMCwwMDAgICAgfCAgICAyLjg5ICAgIHwgICAgMi44OQo+ICAg
ODE5LDAwMCAgICB8ICAgIDgxOSwyMDAsMDAwICAgIHwgICAgMy41NiAgICB8ICAgIDMuNTUKPiAg
IDYxNCw0MDAgICAgfCAgICA2MTQsNDAwLDAwMCAgICB8ICAgIDQuNzEgICAgfCAgICA0LjcxCj4g
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+IAo+IHBvbGljeTQgLyBDUFU0Ogo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBGcmVxdWVuY3kgICAgfCAgY3B1X2MxX2NvcmVf
Y2xrICB8ICBSZWFsIChzKSAgfCAgVXNlciAocykKPiAoa0h6KSAgICAgICAgfCAgKEh6KSAgICAg
ICAgICAgICB8ICAgICAgICAgICAgfAo+IC0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0t
LSstLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0KPiAxLDYwMCwwMDAgICAgfCAgMSw2MDAsMDAwLDAw
MCAgICB8ICAgIDEuODEgICAgfCAgICAxLjgwCj4gMSwyMjgsODAwICAgIHwgIDEsMjI4LDgwMCww
MDAgICAgfCAgICAyLjM2ICAgIHwgICAgMi4zNgo+IDEsMDAwLDAwMCAgICB8ICAxLDAwMCwwMDAs
MDAwICAgIHwgICAgMi44OSAgICB8ICAgIDIuODkKPiAgIDgxOSwwMDAgICAgfCAgICA4MTksMjAw
LDAwMCAgICB8ICAgIDMuNTUgICAgfCAgICAzLjU1Cj4gICA2MTQsNDAwICAgIHwgICAgNjE0LDQw
MCwwMDAgICAgfCAgICA0LjcxICAgIHwgICAgNC43MAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAKPiBTaWduZWQtb2ZmLWJ5OiBT
aHV3ZWkgV3UgPHNodXdlaS53dUBtYWlsYm94Lm9yZz4KPiAtLS0KPiBDaGFuZ2VzIGluIHY0Ogo+
IC0gUmVwcmVzZW50IEsxIGFzIHR3byBjcHVmcmVxLWR0IHBvbGljaWVzLCBvbmUgcGVyIENQVSBj
bG9jayBjbHVzdGVyCj4gLSBVc2UgT1BQIHZvbHRhZ2UgcmFuZ2VzIGZvciB0aGUgc2hhcmVkIENQ
VSBzdXBwbHkKPiAtIExpbmsgdG8gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjA2
MTItc2hhZG93LWRlcHMtdjMtMC0yZjNiYTg4NjExZmZAbWFpbGJveC5vcmcKPiAKPiBDaGFuZ2Vz
IGluIHYzOgo+IC0gQWRkIGEgSzEtc3BlY2lmaWMgY3B1ZnJlcSBkcml2ZXIgZm9yIHRoZSBzaGFy
ZWQtcmFpbCwgZHVhbC1jbG9jayB0b3BvbG9neQo+IC0gVXNlIG9uZSBzaGFyZWQgQ1BVIE9QUCB0
YWJsZSBhbmQgb25lIGNwdWZyZXEgcG9saWN5IGZvciBhbGwgQ1BVcwo+IC0gTGluayB0byB2Mjog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MDQxMC1zaGFkb3ctZGVwcy12Mi0wLTRlMTZi
OGMwZjYwZUBtYWlsYm94Lm9yZwo+IAo+IENoYW5nZXMgaW4gdjI6Cj4gLSBNb3ZlIE9QUCB0YWJs
ZXMgdG8gZGVkaWNhdGVkIGsxLW9wcC5kdHNpCj4gLSBFbmFibGUgT1BQIG9ubHkgb24gQlBJLUYz
IHdpdGggY3B1LXN1cHBseSBwcmVzZW50Cj4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9yLzIwMjYwMzA4LXNoYWRvdy1kZXBzLXYxLTAtMGNlYjVjN2MwN2ViQG1haWxib3gu
b3JnCj4gCgpUZXN0ZWQgb24gYmFuYW5hcGktRjMgYW5kIE11c2Vib29rLCB3b3JrcyBmaW5lLgoK
VGVzdGVkLWJ5OiBNaWxhbiBQLiBTdGFuacSHIDxtcHNAYXJ2YW50YS5uZXQ+Cgo+IC0tLQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
