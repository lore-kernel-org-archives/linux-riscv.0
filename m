Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEC6CCF9EE
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 06:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/8cYT6ZuDkgolPbhoA1sMiE/fHY742dzPUUR63mSilg=; b=z0RIC4ZPgz4/Yq
	hRDH3GQ1fu6CnRvG0w/ZiKvW0VkLUgdsz4yGoj7YrmMmgnZPiAhL2Lj6Daow8T53wOvTPspEzMCKn
	/f75aMmM6+h2r3HlS5TIoILaVxPtUWP1deuReD8/OrWV+qZSHGbFiwzsW9wieSIWYaiDpQ5uQD2lR
	rg429ulKrspJgozsV8kDnPXMjsX8siDzqN76+eYFb6RUMqU+uNy+X2Q6Gq5nXAJsDFtzIU5cjlUev
	Yjx74C8rWfuEaZ2ppelPpC7hwjHCgk8+tJHmPgWWdDEg+LoShG8BPKs4Mue6hnwdr8O7tft/d7RPV
	6W5UKRP8v2SV7zhTsvIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEiLv-00000005R8a-0ri8;
	Fri, 31 Oct 2025 06:11:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEiLL-00000005R16-1H9q;
	Fri, 31 Oct 2025 06:10:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C384143601;
	Fri, 31 Oct 2025 06:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6449CC4CEF1;
	Fri, 31 Oct 2025 06:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761891032;
	bh=mtI0bJgcONn/+JNea1wnkILdIZmOmfcP/gzxeMrjXJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rDDA7osPfNKJWxC6aUuvy+jowSUofyqimpL1QvPRJtDoh9joXUz9Z8pp/KYkh+boq
	 TTVrkev+wIydtYDHxM68tfxTbDC0ODJHJPAxIdhsnYjMB8pTb3Ak0EjP+uD5U4DkiO
	 jH19GobKrGOs6SyL56fIa0CDMZMsnivg+4JIRe+Pr6EudiD8BGkYp3q+ROhMzGr/KF
	 sDNnYKqGRoVGXAbpSqe/jaBMfbuxrvMTDRE70DoBg9zVvGJKdqU1vG3PUJuRec39gb
	 j/zSkPyOOih0ERHsQyiULHVo0xgh4JRnAzngtYMf5ZAVbqMx09OWcaCYBdkLjcQgpE
	 iwi5wZpI9EtkA==
Date: Fri, 31 Oct 2025 11:40:20 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: Johannes Erdfelt <johannes@erdfelt.com>, 
	Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, vkoul@kernel.org, 
	kishon@kernel.org, dlan@gentoo.org, guodong@riscstar.com, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de, 
	christian.bruel@foss.st.com, shradha.t@samsung.com, krishna.chundru@oss.qualcomm.com, 
	qiang.yu@oss.qualcomm.com, namcao@linutronix.de, thippeswamy.havalige@amd.com, 
	inochiama@gmail.com, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org, spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] Introduce SpacemiT K1 PCIe phy and host controller
Message-ID: <ywr66wfkfay3xse77mb7ddbga5nced4yg7dapiybj3p2yp2an2@7zsaj5one5in>
References: <20251013153526.2276556-1-elder@riscstar.com>
 <aPEhvFD8TzVtqE2n@aurel32.net>
 <92ee253f-bf6a-481a-acc2-daf26d268395@riscstar.com>
 <aQEElhSCRNqaPf8m@aurel32.net>
 <20251028184250.GM15521@sventech.com>
 <82848c80-15e0-4c0e-a3f6-821a7f4778a5@riscstar.com>
 <20251028204832.GN15521@sventech.com>
 <5kwbaj2eqr4imcaoh6otqo7huuraqhodxh4dbwc33vqpi5j5yq@ueufnqetrg2m>
 <aQOlMcI9jTdd7QNb@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQOlMcI9jTdd7QNb@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_231035_766379_FE9CDC5A 
X-CRM114-Status: GOOD (  33.22  )
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

T24gVGh1LCBPY3QgMzAsIDIwMjUgYXQgMDY6NDk6MzdQTSArMDEwMCwgQXVyZWxpZW4gSmFybm8g
d3JvdGU6Cj4gSGkgTWFuaSwKPiAKPiBPbiAyMDI1LTEwLTMwIDIyOjExLCBNYW5pdmFubmFuIFNh
ZGhhc2l2YW0gd3JvdGU6Cj4gPiArIEF1cmVsaWVuCj4gPiAKPiA+IE9uIFR1ZSwgT2N0IDI4LCAy
MDI1IGF0IDAxOjQ4OjMyUE0gLTA3MDAsIEpvaGFubmVzIEVyZGZlbHQgd3JvdGU6Cj4gPiA+IE9u
IFR1ZSwgT2N0IDI4LCAyMDI1LCBBbGV4IEVsZGVyIDxlbGRlckByaXNjc3Rhci5jb20+IHdyb3Rl
Ogo+ID4gPiA+IE9uIDEwLzI4LzI1IDE6NDIgUE0sIEpvaGFubmVzIEVyZGZlbHQgd3JvdGU6Cj4g
PiA+ID4gPiBJIGhhdmUgYmVlbiB0ZXN0aW5nIHRoaXMgcGF0Y2hzZXQgcmVjZW50bHkgYXMgd2Vs
bCwgYnV0IG9uIGFuIE9yYW5nZSBQaQo+ID4gPiA+ID4gUlYyIGJvYXJkIGluc3RlYWQgKGFuZCBh
biBleHRyYSBSVjIgc3BlY2lmaWMgcGF0Y2ggdG8gZW5hYmxlIHBvd2VyIHRvCj4gPiA+ID4gPiB0
aGUgTS4yIHNsb3QpLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBJIHJhbiBpbnRvIHRoZSBzYW1lIHN5
bXB0b21zIHlvdSBoYWQgKCJRSUQgMCB0aW1lb3V0IiBhZnRlciBhYm91dCA2MAo+ID4gPiA+ID4g
c2Vjb25kcykuIEhvd2V2ZXIsIEknbSB1c2luZyBhbiBJbnRlbCA2MDBwLiBJIGNhbiBjb25maXJt
IG15IE5WTUUgZHJpdmUKPiA+ID4gPiA+IHNlZW1zIHRvIHdvcmsgZmluZSB3aXRoIHRoZSAicGNp
ZV9hc3BtPW9mZiIgd29ya2Fyb3VuZCBhcyB3ZWxsLgo+ID4gPiA+IAo+ID4gPiA+IEkgZG9uJ3Qg
c2VlIHRoaXMgcHJvYmxlbSwgYW5kIGhhdmVuJ3QgdHJpZWQgdG8gcmVwcm9kdWNlIGl0IHlldC4K
PiA+ID4gPiAKPiA+ID4gPiBNYW5pIHRvbGQgbWUgSSBuZWVkZWQgdG8gYWRkIHRoZXNlIGxpbmVz
IHRvIGVuc3VyZSB0aGUgInJ1bnRpbWUKPiA+ID4gPiBQTSBoaWVyYXJjaHkgb2YgUENJZSBjaGFp
biIgd29uJ3QgYmUgImJyb2tlbiI6Cj4gPiA+ID4gCj4gPiA+ID4gCXBtX3J1bnRpbWVfc2V0X2Fj
dGl2ZSgpCj4gPiA+ID4gCXBtX3J1bnRpbWVfbm9fY2FsbGJhY2tzKCkKPiA+ID4gPiAJZGV2bV9w
bV9ydW50aW1lX2VuYWJsZSgpCj4gPiA+ID4gCj4gPiA+ID4gSnVzdCBvdXQgb2YgY3VyaW9zaXR5
LCBjb3VsZCB5b3UgdHJ5IHdpdGggdGhvc2UgbGluZXMgYWRkZWQKPiA+ID4gPiBqdXN0IGJlZm9y
ZSB0aGVzZSBhc3NpZ25tZW50cyBpbiBrMV9wY2llX3Byb2JlKCk/Cj4gPiA+ID4gCj4gPiA+ID4g
CWsxLT5wY2kuZGV2ID0gZGV2Owo+ID4gPiA+IAlrMS0+cGNpLm9wcyA9ICZrMV9wY2llX29wczsK
PiA+ID4gPiAJZHdfcGNpZV9jYXBfc2V0KCZrMS0+cGNpLCBSRVFfUkVTKTsKPiA+ID4gPiAKPiA+
ID4gPiBJIGRvdWJ0IGl0IHdpbGwgZml4IHdoYXQgeW91J3JlIHNlZWluZywgYnV0IGF0IHRoZSBt
b21lbnQgSSdtCj4gPiA+ID4gd29ya2luZyBvbiBzb21ldGhpbmcgZWxzZS4KPiA+ID4gCj4gPiA+
IFVuZm9ydHVuYXRlbHkgdGhlcmUgaXMgbm8gZGlmZmVyZW5jZSB3aXRoIHRoZSBydW50aW1lIFBN
IGhpZXJhcmNoeQo+ID4gPiBhZGRpdGlvbnMuCj4gPiA+IAo+ID4gCj4gPiBUaGVzZSBhcmUgbm90
IHN1cHBvc2VkIHRvIGZpeCB0aGUgaXNzdWVzIHlvdSB3ZXJlIGZhY2luZy4gSSBkaXNjdXNzZWQg
d2l0aCBBbGV4Cj4gPiBvZmZsaW5lIGFuZCBmaWd1cmVkIG91dCB0aGF0IEwxIHdvcmtzIGZpbmUg
b24gaGlzIEJQSS1GMyBib2FyZCB3aXRoIGEgTlZNZSBTU0QuCj4gPiAKPiA+IEFuZCBJIGJlbGll
dmUsIEF1cmVsaWVuIGlzIGFsc28gdXNpbmcgdGhhdCBzYW1lIGJvYXJkLCBidXQgd2l0aCBkaWZm
ZXJlbnQKPiA+IFNTRHMuIEJ1dCB3aGF0IGlzIHB1enpsaW5nIG1lIGlzLCBMMSBpcyBicmVha2lu
ZyBBdXJlbGllbidzIHNldHVwIHdpdGggMyBTU0RzCj4gPiBmcm9tIGRpZmZlcmVudCB2ZW5kb3Jz
LiBJdCBhcHBhcmVudGx5IHdvcmtzIGZpbmUgb24gQWxleCdzIHNldHVwLiBTbyBpdCBzb21laG93
Cj4gPiBjb25maXJtcyB0aGF0IFJvb3QgUG9ydCBzdXBwb3J0cyBhbmQgYmVoYXZlcyBjb3JyZWN0
bHkgd2l0aCBMMS4gQnV0IGF0IHRoZSBzYW1lCj4gPiB0aW1lLCBJIGNhbm5vdCBqdXN0IHNheSB3
aXRob3V0IGV2aWRlbmNlIHRoYXQgTDEgaXMgYnJva2VuIG9uIGFsbCB0aGVzZSBTU0RzCj4gPiB0
aGF0IHlvdSBhbmQgQXVyZWxpZW4gdGVzdGVkIHdpdGguCj4gCj4gSXQgY291bGQgYmUgdGhhdCB3
ZSBoYXZlIGRpZmZlcmVudCByZXZpc2lvbiBvZiB0aGUgQlBJLUYzIGJvYXJkLCBpdCdzIAo+IG5v
dCBpbXBvc3NpYmxlIHRoYXQgSSBnb3QgYW4gZWFybHktaXNoIHZlcnNpb24uIFRoYXQgc2FpZCBJ
IGp1c3QgCj4gdmlzdWFsbHkgY2hlY2tlZCB0aGUgUENCIGFnYWluc3QgdGhlIHNjaGVtYXRpY3Ms
IGFuZCB0aGUgZGV2aWNlcyBvbiB0aGUgCj4gQ0xLUkVRTiBsaW5lIGFwcGVhciB0byBiZSBpbnN0
YWxsZWQuCj4gCgpDTEtSRVEjIGlzIG9ubHkgbmVlZGVkIGZvciBMMSBQTSBTdWJzdGF0ZXMgKEwx
LjEgYW5kIEwxLjIpLiBJbiBvdGhlciBBU1BNIHN0YXRlcwooTDBzIGFuZCBMMSksIFJFRkNMSyBp
cyBzdXBwb3NlZCB0byBiZSBPTi4gU28gdGhvc2UgZG9uJ3QgbmVlZCBDTEtSRVEjIGFzc2VydGlv
bgpieSB0aGUgZW5kcG9pbnQuCgpUaGUgTDEgaXNzdWUgeW91IGFyZSBmYWNpbmcgY291bGQgYmUg
ZHVlIHRvIHRoZSBib2FyZCByb3V0aW5nIGlzc3VlIGFsc28uIEknbQpqdXN0IHNwZWN1bGF0aW5n
IGhlcmUuCgo+IElmIHNvbWVvbmUgaGFzIGNvbnRhY3RzIHRvIGNoZWNrIHdoYXQgY2hhbmdlcyBo
YXZlIGJlZW4gZG9uZSBiZXR3ZWVuIHRoZSAKPiBkaWZmZXJlbnQgYm9hcmQgcmV2aXNpb24sIHRo
YXQgY291bGQgaGVscC4gT3Igc2FtZSBpZiB0aGVyZSBhcmUgCj4gZGlmZmVyZW50IHJldmlzaW9u
cyBvZiB0aGUgU3BhY2VtaVQgSzEgY2hpcC4KPiAKCkkgaG9wZSBBbGV4IGNhbiBnZXQgdGhpcyBp
bmZvcm1hdGlvbi4KCi0gTWFuaQoKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprg
rqTgrr7grprgrr/grrXgrq7gr40KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
