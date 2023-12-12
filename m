Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477BEC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 19:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xnw7+n/Is1MsFMjNIiJGsWVpfiy3kmk3Gt5IXStZUVs=; b=H6zJIhKmAfitKl
	jPyuzkHKoWWce4Y8uYIZuWX6oppRTNdPy4/SlxmMeCoXvkl4o1QRSQ2TIUZ4ZPzZOmvD0q5ljzXPM
	kanYocxUxHRnq/wDMBh6JCSUOn5cjf3+ga7OEBTQdHCeSxlh1ObAfPQRbOgMIexFL54AIkXVDqt5b
	hjuIqBQxbvlMMWba9AsfCFKYCbCeXzCYKqF5pQRP0Asvav5C6wl6e0aiaI8XSjzj11F9cr3WanGCP
	SlapwTfTmEamQjIKnn6iruoQ1T8ED4pEP5mKD+leLO+u36gvJlHrCFKk1tTCBS0Z3by1lHJDg2zDo
	gDa4QHnmwyNHdBsqhoCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD8uI-00CeUC-0f;
	Tue, 12 Dec 2023 19:59:06 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD8uD-00CeSV-3B;
	Tue, 12 Dec 2023 19:59:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tzSIob+ZloljYLW+tLDyKC/69ft7pcQwsMOiIXpJIok=; b=vw1L6XLYMrjE3sFENIwANCt1v3
	7cAzma3wPHfPcHoG9wwkMxGWUzWDApvWXx2iDNH1wm+zJnUto1Pm0srAC0ESTdJFqRhA5HgZkecv8
	6ZxXy2SdOV32NspEw3waqQJesyFiNyElMKU1mfQ7hGyutNpt8Eu8Cl0dTo9npe2YUMHIcFLtUzR2U
	r0CtlsCPasqY8qOEIs+t339Sv6zjT1PVHzSLP70GRefywlApYbHkmdsoRLcx9nXuUlWRQTuyIkVQH
	vfIu2gbTC4MCO7Zmq8ZOWgZZVe6GhwFIl7d/pw5GgsMAFTOUidPZyLz8lj/YwebHDzhG7lGYuwBiP
	2nXhXZXA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33796)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rD8u0-0007MS-0Z;
	Tue, 12 Dec 2023 19:58:48 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rD8ty-0000ih-JG; Tue, 12 Dec 2023 19:58:46 +0000
Date: Tue, 12 Dec 2023 19:58:46 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, acpica-devel@lists.linuxfoundation.org,
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
	Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>
Subject: Re: [RFC PATCH v3 00/39] ACPI/arm64: add support for virtual
 cpuhotplug
Message-ID: <ZXi7do4mVfdsz/k0@shell.armlinux.org.uk>
References: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
 <CAJZ5v0j-73_+9U3ngDAf9w1ADDhBTKctJdWboqUk-okH2TQGyg@mail.gmail.com>
 <ZW4ZBkj2oCmxv55T@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZW4ZBkj2oCmxv55T@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_115902_029541_CBC50B40 
X-CRM114-Status: GOOD (  48.34  )
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

T24gTW9uLCBEZWMgMDQsIDIwMjMgYXQgMDY6MjM6MDJQTSArMDAwMCwgUnVzc2VsbCBLaW5nIChP
cmFjbGUpIHdyb3RlOgo+IE9uIFR1ZSwgT2N0IDI0LCAyMDIzIGF0IDA4OjI2OjU4UE0gKzAyMDAs
IFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4gT24gVHVlLCBPY3QgMjQsIDIwMjMgYXQgNTox
NeKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo+ID4gPGxpbnV4QGFybWxpbnV4Lm9yZy51az4g
d3JvdGU6Cj4gPiA+Cj4gPiA+IEhpLAo+ID4gPgo+ID4gPiBJJ20gcG9zdGluZyBKYW1lcycgcGF0
Y2ggc2V0IHVwZGF0ZWQgd2l0aCBtb3N0IG9mIHRoZSByZXZpZXcgY29tbWVudHMKPiA+ID4gZnJv
bSBoaXMgUkZDIHYyIHNlcmllcyBiYWNrIGluIFNlcHRlbWJlci4gSW5kaXZpZHVhbCBwYXRjaGVz
IGhhdmUgYQo+ID4gPiBjaGFuZ2Vsb2cgYXR0YWNoZWQgYXQgdGhlIGJvdHRvbSBvZiB0aGUgY29t
bWl0IG1lc3NhZ2UuIFRob3NlIHdoaWNoCj4gPiA+IEkgaGF2ZSBmaW5pc2hlZCB1cGRhdGluZyBo
YXZlIG15IFMtby1iIG9uIHRoZW0sIHRob3NlIHdoaWNoIHN0aWxsIGhhdmUKPiA+ID4gb3V0c3Rh
bmRpbmcgcmV2aWV3IGNvbW1lbnRzIGZyb20gUkZDIHYyIGRvIG5vdC4gSW4gc29tZSBvZiB0aGVz
ZSBjYXNlcwo+ID4gPiBJJ3ZlIGFza2VkIHF1ZXN0aW9ucyBhbmQgYW0gd2FpdGluZyBmb3IgcmVz
cG9uc2VzLgo+ID4gPgo+ID4gPiBJJ20gcG9zdGluZyB0aGlzIGFzIFJGQyB2MyBiZWNhdXNlIHRo
ZXJlJ3Mgc3RpbGwgc29tZSB1bmFkZHJlc3NlZAo+ID4gPiBjb21tZW50cyBhbmQgaXQncyBjbGVh
cmx5IG5vdCByZWFkeSBmb3IgbWVyZ2luZy4gRXZlbiBpZiBpdCB3YXMgcmVhZHkKPiA+ID4gdG8g
YmUgbWVyZ2VkLCBpdCBpcyB0b28gbGF0ZSBpbiB0aGlzIGRldmVsb3BtZW50IGN5Y2xlIHRvIGJl
IHRha2luZwo+ID4gPiB0aGlzIGNoYW5nZSBpbiwgc28gdGhlcmUgd291bGQgYmUgbGl0dGxlIHBv
aW50IHBvc3RpbmcgaXQgbm9uLVJGQy4KPiA+ID4gQWxzbyBKYW1lcyBzdGF0ZWQgdGhhdCBoZSdz
IHdhaXRpbmcgZm9yIGNvbmZpcm1hdGlvbiBmcm9tIHRoZQo+ID4gPiBLdWJlcm5ldGVzL0thdGEg
Zm9sayAtIEkgaGF2ZSBubyBpZGVhIHdoYXQgdGhlIHN0YXR1cyBpcyB0aGVyZS4KPiA+ID4KPiA+
ID4gSSB3aWxsIGJlIHNlbmRpbmcgZWFjaCBwYXRjaCBpbmRpdmlkdWFsbHkgdG8gYSB3aWRlciBh
dWRpZW5jZQo+ID4gPiBhcHByb3ByaWF0ZSBmb3IgdGhhdCBwYXRjaCAtIGFwb2xvZ2llcyB0byB0
aG9zZSBtaXNzaW5nIG91dCBvbiB0aGlzCj4gPiA+IGNvdmVyIG1lc3NhZ2UuIEkgaGF2ZSBhZGRl
ZCBtb3JlIG1haWxpbmcgbGlzdHMgdG8gdGhlIHNlcmllcyB3aXRoIHRoZQo+ID4gPiBleGNlcHRp
b24gb2YgdGhlIGFjcGljYSBsaXN0IGluIGEgaG9wZSBvZiB0aGlzIGNvdmVyIG1lc3NhZ2UgYWxz
bwo+ID4gPiByZWFjaGluZyB0aG9zZSBmb2xrLgo+ID4gPgo+ID4gPiBUaGUgY2hhbmdlcyB0aGF0
IGFyZW4ndCBpbmNsdWRlZCBhcmU6Cj4gPiA+Cj4gPiA+IDEuIFVwZGF0ZXMgZm9yIG15IHBhdGNo
IHRoYXQgd2FzIG1lcmdlZCB2aWEgVGhvbWFzICh0aGFua3MhKToKPiA+ID4gICAgYzRkZDg1NGY3
NDBjIGNwdS1ob3RwbHVnOiBQcm92aWRlIHByb3RvdHlwZXMgZm9yIGFyY2ggQ1BVIHJlZ2lzdHJh
dGlvbgo+ID4gPiAgICByYXRoZXIgdGhhbiBoYXZpbmcgdGhpcyBjaGFuZ2Ugc3ByZWFkIHRocm91
Z2ggSmFtZXMnIHBhdGNoZXMuCj4gPiA+Cj4gPiA+IDIuIE5ldyBwYXRjaCAtIHNpbXBsaWZpY2F0
aW9uIG9mIFBBLVJJU0MncyBzbXBfcHJlcGFyZV9ib290X2NwdSgpCj4gPiA+Cj4gPiA+IDMuIE1v
dmVkICJBQ1BJOiBVc2UgdGhlIGFjcGlfZGV2aWNlX2lzX3ByZXNlbnQoKSBoZWxwZXIgaW4gbW9y
ZSBwbGFjZXMiCj4gPiA+ICAgIGFuZCAiQUNQSTogUmVuYW1lIGFjcGlfc2Nhbl9kZXZpY2Vfbm90
X3ByZXNlbnQoKSB0byBiZSBhYm91dAo+ID4gPiAgICBlbnVtZXJhdGlvbiIgdG8gdGhlIGJlZ2lu
bmluZyBvZiB0aGUgc2VyaWVzIC0gdGhlc2UgdHdvIHBhdGNoZXMgYXJlCj4gPiA+ICAgIGFscmVh
ZHkgcXVldWVkIHVwIGZvciBtZXJnaW5nIGludG8gNi43Lgo+ID4gPgo+ID4gPiA0LiBNb3ZlZCAi
YXJtNjQsIGlycWNoaXAvZ2ljLXYzLCBBQ1BJOiBNb3ZlIE1BRFQgR0lDQyBlbmFibGVkIGNoZWNr
IGludG8KPiA+ID4gICAgYSBoZWxwZXIiIHRvIHRoZSBiZWdpbm5pbmcgb2YgdGhlIHNlcmllcywg
d2hpY2ggaGFzIGJlZW4gc3VibWl0dGVkLAo+ID4gPiAgICBidXQgYXMgeWV0IHRoZSBmYXRlIG9m
IHRoYXQgcG9zdGluZyBpc24ndCBrbm93bi4KPiA+ID4KPiA+ID4gVGhlIGZpcnN0IGZvdXIgcGF0
Y2hlcyBpbiB0aGlzIHNlcmllcyBhcmUgcHJvdmlkZWQgZm9yIGNvbXBsZXRuZXNzIG9ubHkuCj4g
PiA+Cj4gPiA+IFRoZXJlIGlzIGFuIGFkZGl0aW9uYWwgcGF0Y2ggaW4gSmFtZXMnIGdpdCB0cmVl
IHRoYXQgaXNuJ3QgaW4gdGhlIHNldAo+ID4gPiBvZiBwYXRjaGVzIHRoYXQgSmFtZXMgcG9zdGVk
OiAiQUNQSTogcHJvY2Vzc29yOiBPbmx5IGNhbGwKPiA+ID4gYXJjaF91bnJlZ2lzdGVyX2NwdSgp
IGlmIEhPVFBMVUdfQ1BVIGlzIHNlbGVjdGVkIiB3aGljaCBsb29rcyB0byBtZSB0bwo+ID4gPiBi
ZSBhIHdvcmthcm91bmQgZm9yIGFyY2hfdW5yZWdpc3Rlcl9jcHUoKSBiZWluZyB1bmRlciB0aGUg
aWZkZWYuIEkndmUKPiA+ID4gY29tbWVudGVkIG9uIHRoaXMgb24gdGhlIFJGQyB2MiBwb3N0aW5n
IG1ha2luZyBhIHN1Z2dlc3Rpb24sIGJ1dCBhcyB5ZXQKPiA+ID4gaGF2ZW4ndCBoYWQgYW55IHJl
c3BvbnNlLgo+ID4gPgo+ID4gPiBJJ3ZlIGluY2x1ZGVkIGFsbW9zdCBhbGwgb2YgSmFtZXMnIG9y
aWdpbmFsIGNvdmVyaW5nIGJvZHkgYmVsb3cgdGhlCj4gPiA+IGRpZmZzdGF0Lgo+ID4gPgo+ID4g
PiBUaGUgcmVhc29uIHRoYXQgSSdtIGRvaW5nIHRoaXMgaXMgdG8gaGVscCBtb3ZlIHRoaXMgY29k
ZSBmb3J3YXJkIHNvCj4gPiA+IGhvcGVmdWxseSBpdCBjYW4gYmUgbWVyZ2VkIC0gd2hpY2ggaXMg
d2h5IEkgaGF2ZSBiZWVuIGtlZW4gdG8gZGlnIG91dAo+ID4gPiBmcm9tIEphbWVzJyBwYXRjaGVz
IGFueXRoaW5nIHRoYXQgY2FuIGJlIG1lcmdlZCBhbmQgc3VibWl0IGl0Cj4gPiA+IHNlcGFyYXRl
bHksIHNpbmNlIHRoaXMgaXMgYSBmZWF0dXJlIGZvciB3aGljaCBzb21lIHVzZXJzIGhhdmUgYQo+
ID4gPiBkZWZpbml0ZSBuZWVkIGZvci4KPiA+IAo+ID4gSSd2ZSBnb25lIHRocm91Z2ggdGhlIHNl
cmllcyBhbmQgdGhlcmUgaXMgYXQgbGVhc3Qgb25lIHRoaW5nIGluIGl0Cj4gPiB0aGF0IGNvbmNl
cm5zIG1lIGEgbG90IGFuZCBzb21lIG90aGVycyB0aGF0IGF0IGxlYXN0IGFwcGVhciB0byBiZQo+
ID4gcmVhbGx5IHF1ZXN0aW9uYWJsZS4KPiA+IAo+ID4gSSBuZWVkIG1vcmUgdGltZSB0byBzZW5k
IGNvbW1lbnRzIHdoaWNoIEknbSBub3QgZ29pbmcgdG8gZG8gYmVmb3JlIHRoZQo+ID4gNi43IG1l
cmdlIHdpbmRvdyAoc29ycnkpLCBidXQgZnJvbSB3aGF0IEkgY2FuIHNheSByaWdodCBub3csIHRo
aXMgaXMKPiA+IG5vdCBsb29raW5nIGdvb2QuCj4gCj4gSGkgUmFmYWVsLAo+IAo+IFdpbGwgeW91
IGJlIGFibGUgdG8gc2VuZCB5b3VyIGNvbW1lbnRzLCBzbyB0aGF0IHdlIGNhbiBmaW5kIG91dCB3
aGF0Cj4geW91ciBvdGhlciBjb25jZXJucyBhcmUgcGxlYXNlPyBJJ20gZ2V0dGluZyBxdWVzdGlv
bnMgZnJvbSBpbnRlcmVzdGVkCj4gcGFydGllcyB3aG8gd2FudCB0byBrbm93IHdoYXQgeW91ciBj
b25jZXJucyBhcmUuCj4gCj4gTm90aGluZyBtdWNoIGhhcyBjaGFuZ2VkIHRvIHRoZSBBQ1BJIGNo
YW5nZXMsIHNvIEkgdGhpbmsgaXQncyBzdGlsbAo+IHZhbGlkIHRvIGhhdmUgdGhlIGNvbW1lbnRz
IGJhY2sgZm9yIHRoaXMuCgpIaSBSYWZhZWwsCgpBbm90aGVyIGdlbnRsZSBwcm9kIG9uIHRoaXMu
Li4KCi0tIApSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9k
ZXZlbG9wZXIvcGF0Y2hlcy8KRlRUUCBpcyBoZXJlISA4ME1icHMgZG93biAxME1icHMgdXAuIERl
Y2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
