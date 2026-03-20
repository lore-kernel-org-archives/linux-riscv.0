Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD05108B8E6
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 09:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aqKjgaZdmILJ4CFnZdBSjCNQ8T+93uzFeWoAnJe3sf8=; b=2ELl3uDt5A53c0
	aC+MSevRGyWPo4DeyXl2Fc/V28UkyY4Topbs9FRZmHEr5hHcMi8Yty1UVFe0s0vN4yQP7Bz4r2oOE
	NW7mTAG6h/4BPkPaa+YpHpLTdsKRCX4SCqDSuedqwN5ZQik7aaoTlv5SApmWFKImjt833oEqCqL18
	xCpaZW83NpYIcI/wwbL6XNImNAxBDhUNQtFsqq87mAq1boF0YLbYW+/2OHwak6c8o6d/49UxRv2Tz
	zY2QK6g3rqlDuI59zQC11Imrd/s6kwa/r4ggEwiabNE8Qub8FzY3YLdfPXMAOlPIeVzP6vNdO6uH5
	h+x6x1WNE5JOA7SdHaVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WQo-0000000CVyX-3lPL;
	Fri, 20 Mar 2026 09:46:14 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WQi-0000000CVy0-1Ufp
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 09:46:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3WQO-0008JH-6B; Fri, 20 Mar 2026 10:45:48 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3WQN-001Dhj-1Z;
	Fri, 20 Mar 2026 10:45:47 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3WQN-000000003mj-1jdq;
	Fri, 20 Mar 2026 10:45:47 +0100
Message-ID: <a3d34ebb16b9ce19c0b81ce07f26ed6b1f73bdaf.camel@pengutronix.de>
Subject: Re: [PATCH v4] reset: spacemit: k3: Decouple composite reset lines
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Junzhong Pan <junzhong.pan@spacemit.com>, Guodong Xu
 <guodong@riscstar.com>, 	devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Fri, 20 Mar 2026 10:45:47 +0100
In-Reply-To: <20260320-01-k3-reset-usb-pci-v4-1-7b4950c1d9e2@kernel.org>
References: <20260320-01-k3-reset-usb-pci-v4-1-7b4950c1d9e2@kernel.org>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_024608_439304_E3C7DACB 
X-CRM114-Status: GOOD (  16.61  )
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

T24gRnIsIDIwMjYtMDMtMjAgYXQgMDY6NTEgKzAwMDAsIFlpeHVuIExhbiB3cm90ZToKPiBJbnN0
ZWFkIG9mIGdyb3VwaW5nIHNldmVyYWwgZGlmZmVyZW50IHJlc2V0IGxpbmVzIGludG8gb25lIGNv
bXBvc2l0ZQo+IHJlc2V0LCBkZWNvdXBsZSB0aGVtIHRvIGluZGl2aWR1YWwgb25lcyB3aGljaCBt
YWtlIGl0IG1vcmUgYWxpZ25lZAo+IHdpdGggdW5kZXJseWluZyBoYXJkd2FyZS4gQW5kIGZvciBE
V0MgVVNCIGRyaXZlciwgaXQgd2lsbCBtYXRjaCB3ZWxsCj4gd2l0aCB0aGUgbnVtYmVyIG9mIHRo
ZSByZXNldCBwcm9wZXJ0eSBpbiB0aGUgRFQgYmluZGluZ3MuCj4gCj4gVGhlIERXQzMgVVNCIGhv
c3QgY29udHJvbGxlciBpbiBLMyBTb0MgaGFzIHRocmVlIHJlc2V0IGxpbmVzIC0gQUhCLCBWQ0Ms
Cj4gUEhZLiBUaGUgUENJZSBjb250cm9sbGVyIGFsc28gaGFzIHRocmVlIHJlc2V0IGxpbmVzIC0g
REJJLCBTbGF2ZSwgTWFzdGVyLgo+IEFsc28gdGhyZWUgcmVzZXQgbGluZXMgZWFjaCBmb3IgVUNJ
RSBhbmQgUkNQVSBibG9jay4KPiAKPiBBcyBhbiBhZ3JlZW1lbnQgd2l0aCBtYWludGFpbmVyLCB0
aGUgcmVzZXQgSURzIGhhcyBiZWVuIHJlYXJyYW5nZWQgYXMKPiBjb250aWd1b3VzIG51bWJlciBi
dXQga2VlcCBFTUFDIHBhcnQgdW5jaGFuZ2VkIHRvIGF2b2lkIGJyZWFrIHBhdGNoZXMKPiB3aGlj
aCBhbHJlYWR5IHNlbnQgdG8gbWFpbGluZyBsaXN0LiBUaGUgY2hhbmdlcyBvZiBEVCBiaW5kaW5n
IGhlYWRlciBmaWxlCj4gYW5kIHJlc2V0IGRyaXZlciBhcmUgbWVyZ2VkIHRvZ2V0aGVyIGFzIG9u
ZSBzaW5nbGUgY29tbWl0IHRvIGF2b2lkCj4gZ2l0LWJpc2VjdCBicmVha2FnZS4KPiAKPiBGaXhl
czogOTM4Y2UzYjE2NTgyICgicmVzZXQ6IHNwYWNlbWl0OiBBZGQgU3BhY2VtaVQgSzMgcmVzZXQg
ZHJpdmVyIikKPiBGaXhlczogMjE2ZTBhNWU5OGU1ICgiZHQtYmluZGluZ3M6IHNvYzogc3BhY2Vt
aXQ6IEFkZCBLMyByZXNldCBzdXBwb3J0IGFuZCBJRHMiKQo+IFNpZ25lZC1vZmYtYnk6IFlpeHVu
IExhbiA8ZGxhbkBrZXJuZWwub3JnPgo+IC0tLQo+IFByZXZpb3VzbHksIHRoZSByZXNldCBvZiBU
aGUgVVNCIGFuZCBQQ0llIHdhcyBzdWJtaXRlZCBhcyBhIGNvbXBvc2l0ZQo+IHJlc2V0LCB0cnkg
dG8gZGVjb3VwbGUgdGhlbSBpbiB0aGlzIHNlcmllcy4KPiAKPiBUaGUgbW90aXZhdGlvbiBiZWhp
bmQgaXMgdGhhdCBpdCB3aWxsIHdpbGwgbWFrZSB0aGUgcmVzdWx0IG1vcmUgYWxpZ25lZAo+IHdp
dGggdGhlIGhhcmR3YXJlIHdoaWNoIGRlc2NyaWJlIHRoZW0gYXMgZGlmZmVyZW50IHJlc2V0IGxp
bmVzLCBhbmQgYWxzbwo+IG1hdGNoIHdpdGggdGhlIEszIGR3YzMgRFQgYmluZGluZyB3aGljaCBy
ZXF1ZXN0IGRpZmZlcmVudCByZXNldCwgCj4gSzEgYW5kIEszIFNvQyBzaGFyZSBzYW1lIHRvcG9s
b2d5IG9mIHRoZSByZXNldCBsaW5lIGRlc2lnbi4KPiAKPiBTZWUgdGhlIHJlc2V0IHBhcnQgaW5m
byBpbiBiaW5kaW5nIGRvYwo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Iv
c3BhY2VtaXQsazEtZHdjMy55YW1sCj4gCj4gSW4gVjIsIEkndmUgdmlzaXRlZCB0aHJvdWdoIHdo
b2xlIHJlc2V0IGRyaXZlciBhbmQgZGVjb3VwbGUgbW9yZSByZXNldHMsCj4gd2hpY2ggaW5jbHVk
ZSB0aGUgYmxvY2sgLSBVQ0lFIGFuZCBSUENVLiBBbHNvIGFkZCBhbiBleHBsYW5hdGlvbiBvZiB3
aHkKPiByZWFycmFuZ2UgdGhlIHJlc2V0IElEcyBhcyBjb250aWd1b3VzIG51bWJlci4KPiAKPiBJ
biBWNCwgSSd2ZSByZWFycmFuZ2VkIGFsbCByZXNldCBJRHMgdG8ga2VlcCB0aGVtIGxpbmVhcihu
byBob2xlKSwgd2hpbGUKPiBrZWVwIEVNQUMgcGFydCBJRHMgdW5jaGFuZ2VkLCB0aGlzIHN0aWxs
IGJyaW5nIGxvdHMgY2hhbmdlcyB0byBJRCBudW1iZXIsCj4gbGV0IG1lIGtub3cgaWYgaXQncyBv
ay4KCkl0IHdvdWxkIGJlIHNhZmVyIHRvIGp1c3Qga2VlcCBhbGwgcmVzZXTCoElEcyB0aGF0IGRv
bid0IGhhdmUgdG8gYmUKc3BsaXQgdW5jaGFuZ2VkLiBQYXRjaGVzIHVzaW5nIHRoZW0gYXJlIHRy
aWNrbGluZyBpbi4KClRoZSBzZWFyY2ggZm9yIGNoYW5nZWQgSURzIFsxXSBub3cgeWllbGRzIGEg
dXNlciBvZiBSRVNFVF9BUE1VX0RNQSBbMl0uCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLz9xPWRmYjpSRVNFVF9BUE1VX1VTQjIlMjBPUiUyMGRmYjpSRVNFVF9BUE1VX1VTQjNfUE9S
VEElMjBPUiUyMGRmYjpSRVNFVF9BUE1VX1VTQjNfUE9SVEIlMjBPUiUyMGRmYjpSRVNFVF9BUE1V
X1VTQjNfUE9SVEMlMjBPUiUyMGRmYjpSRVNFVF9BUE1VX1VTQjNfUE9SVEQlMjBPUiUyMGRmYjpS
RVNFVF9BUE1VX1FTUEklMjBPUiUyMGRmYjpSRVNFVF9BUE1VX1FTUElfQlVTJTIwT1IlMjBkZmI6
UkVTRVRfQVBNVV9ETUElMjBPUiUyMGRmYjpSRVNFVF9BUE1VX0FFU19XVE0lMjBPUiUyMGRmYjpS
RVNFVF9BUE1VX01DQl9EQ0xLJTIwT1IlMjBkZmI6UkVTRVRfQVBNVV9NQ0JfQUNMSyUyME9SJTIw
ZGZiOlJFU0VUX0FQTVVfVlBVJTIwT1IlMjBkZmI6UkVTRVRfQVBNVV9EVEMlMjBPUiUyMGRmYjpS
RVNFVF9BUE1VX0dQVSUyME9SJTIwZGZiOlJFU0VUX0FQTVVfQUxaTyUyME9SJTIwZGZiOlJFU0VU
X0FQTVVfTUMlMjBPUiUyMGRmYjpSRVNFVF9BUE1VX0NQVTBfUE9QJTIwT1IlMjBkZmI6UkVTRVRf
QVBNVV9DUFUwX1NXJTIwT1IlMjBkZmI6UkVTRVRfQVBNVV9DUFUxX1BPUCUyME9SJTIwZGZiOlJF
U0VUX0FQTVVfQ1BVMV9TVyUyME9SJTIwZGZiOlJFU0VUX0FQTVVfQ1BVMl9QT1AlMjBPUiUyMGRm
YjpSRVNFVF9BUE1VX0NQVTJfU1clMjBPUiUyMGRmYjpSRVNFVF9BUE1VX0NQVTNfUE9QJTIwT1Il
MjBkZmI6UkVTRVRfQVBNVV9DUFUzX1NXJTIwT1IlMjBkZmI6UkVTRVRfQVBNVV9DMF9NUFNVQl9T
VyUyME9SJTIwZGZiOlJFU0VUX0FQTVVfQ1BVNF9QT1AlMjBPUiUyMGRmYjpSRVNFVF9BUE1VX0NQ
VTRfU1clMjBPUiUyMGRmYjpSRVNFVF9BUE1VX0NQVTVfUE9QJTIwT1IlMjBkZmI6UkVTRVRfQVBN
VV9DUFU1X1NXJTIwT1IlMjBkZmI6UkVTRVRfQVBNVV9DUFU2X1BPUCUyME9SJTIwZGZiOlJFU0VU
X0FQTVVfQ1BVNl9TVyUyME9SJTIwZGZiOlJFU0VUX0FQTVVfQ1BVN19QT1AlMjBPUiUyMGRmYjpS
RVNFVF9BUE1VX0NQVTdfU1clMjBPUiUyMGRmYjpSRVNFVF9BUE1VX0MxX01QU1VCX1NXJTIwT1Il
MjBkZmI6UkVTRVRfQVBNVV9NUFNVQl9EQkclMjBPUiUyMGRmYjpSRVNFVF9BUE1VX1VDSUUlMjBP
UiUyMGRmYjpSRVNFVF9BUE1VX1JDUFUlMjBPUiUyMGRmYjpSRVNFVF9BUE1VX0RTSTRMTjJfRVND
Q0xLJTIwT1IlMjBkZmI6UkVTRVRfQVBNVV9EU0k0TE4yX0xDRF9TVyUyME9SJTIwZGZiOlJFU0VU
X0FQTVVfRFNJNExOMl9MQ0RfTUNMSyUyME9SJTIwZGZiOlJFU0VUX0FQTVVfRFNJNExOMl9MQ0Rf
RFNDQ0xLJTIwT1IlMjBkZmI6UkVTRVRfQVBNVV9EU0k0TE4yX0RQVV9BQ0xLJTIwT1IlMjBkZmI6
UkVTRVRfQVBNVV9EUFVfQUNMSyUyME9SJTIwZGZiOlJFU0VUX0FQTVVfVUZTX0FDTEslMjBPUiUy
MGRmYjpSRVNFVF9BUE1VX0VEUDAlMjBPUiUyMGRmYjpSRVNFVF9BUE1VX0VEUDElMjBPUiUyMGRm
YjpSRVNFVF9BUE1VX1BDSUVfUE9SVEElMjBPUiUyMGRmYjpSRVNFVF9BUE1VX1BDSUVfUE9SVEIl
MjBPUiUyMGRmYjpSRVNFVF9BUE1VX1BDSUVfUE9SVEMlMjBPUiUyMGRmYjpSRVNFVF9BUE1VX1BD
SUVfUE9SVEQlMjBPUiUyMGRmYjpSRVNFVF9BUE1VX1BDSUVfUE9SVEUKWzJdIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC8yMDI2MDMxNy1rMy1wZG1hLXYxLTEtZjM5ZDNlOTdiNTNhQGxpbnV4
LnNwYWNlbWl0LmNvbS8KCldoaWNoIG1lYW5zCgojZGVmaW5lIFJFU0VUX0FQTVVfRE1BICAgICAg
ICAgICAyMwoKc2hvdWxkIHN0YXkgdW5jaGFuZ2VkIGFzIHdlbGwuCgpyZWdhcmRzClBoaWxpcHAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
