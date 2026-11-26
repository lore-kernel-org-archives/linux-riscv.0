Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C78606A323
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pm4D7niI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HRD+/zzWaA7CyGFoqPRk6+TwFtK5vohQTr+7fKMNINc=; b=Pm4D7niIHGfT5l97wyJ9tpd1VV
	NzzqPm6SvDmnGZktaofxsJfTpGfUloXIMZDgiKDDLZWrUYn+jbEt8GbU+Yl/UMiYDqBzEbeTQWvZ2
	xuCMbCpMZSCHrtZmc92lrpT0pc4AjFi2xZiRBNnWITzOE8EQZO1f4u235UXgSHGNsyVeyvRGwmdhR
	XUZN68BMZK9LmVBYu1bP6R7l5fK179thFICbucqRNYbjLpS+VaVSMjbfqr7sNXR5PkuJbT6LkisVk
	xsEDSUFerxVfD6+uu2Eu1AXPUTOXToEnfZzHlcTTVmGPkXdqFo7IBd6ymGQ83qUy7PuWOk921YXPz
	PfdUijuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVz2-0000000Casp-45pd;
	Thu, 26 Nov 2026 09:41:40 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVyz-0000000CasC-2Bqr;
	Thu, 26 Nov 2026 09:41:39 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.207])
	by APP-03 (Coremail) with SMTP id rQCowABXY5TN_gdrxEHXAQ--.17711S2;
	Thu, 26 Nov 2026 17:41:34 +0800 (CST)
Message-ID: <2da5ea0d928af93418c54f70ea52bd9b1f0fc36d.camel@iscas.ac.cn>
Subject: Re: [PATCH v4 2/2] phy: add a driver for T-Head TH1520 USB PHY
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Drew Fustini <fustini@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Manivannan Sadhasivam	 <mani@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Wei
 Fu <wefu@redhat.com>, Drew Fustini	 <dfustini@tenstorrent.com>,
 linux-phy@lists.infradead.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-riscv@lists.infradead.org, Han Gao
 <rabenda.cn@gmail.com>
Date: Thu, 26 Nov 2026 17:41:33 +0800
In-Reply-To: <83e1a995131aaed2a7e1119f97254c6b460dbbb3.camel@iscas.ac.cn>
References: <20261103081444.1983071-1-zhengxingda@iscas.ac.cn>
		 <20261103081444.1983071-3-zhengxingda@iscas.ac.cn>
		 <awXrnQVKZBXKsV2c@thelio>
	 <83e1a995131aaed2a7e1119f97254c6b460dbbb3.camel@iscas.ac.cn>
User-Agent: Evolution 3.58.3 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABXY5TN_gdrxEHXAQ--.17711S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGr45trW8uF15tF47JF13urg_yoW5CF4Upa
	yrGF4YkF4ktFnFka1fKr1UCFyFyw1xXFy5WryfJ34fZF90kr1fXay3tF98uFWDXrWrW3y2
	qF15tFy3CF1Yy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU5IAp7UUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_014137_954145_72AFED8A 
X-CRM114-Status: GOOD (  29.73  )
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYtMTEtMjblm5vnmoQgMTc6MzMgKzA4MDDvvIxJY2Vub3d5IFpoZW5n5YaZ6YGT77ya
Cj4g5ZyoIDIwMjYtMTEtMjTkuoznmoQgMTE6NTUgLTA4MDDvvIxEcmV3IEZ1c3RpbmnlhpnpgZPv
vJoKPiA+IE9uIFR1ZSwgTm92IDAzLCAyMDI2IGF0IDA0OjE0OjQ0UE0gKzA4MDAsIEljZW5vd3kg
Wmhlbmcgd3JvdGU6Cj4gPiA+IFRoZSBVU0IgUEhZIG9uIFQtSGVhZCBUSDE1MjAgU29DIGlzIGEg
U3lub3BzeXMgVVNCIDMuMCBGZW10b1BIWSwgd2l0aAo+ID4gPiBzb21lIFBIWSBwYXJhbWV0ZXJz
IGV4cG9ydGVkIGFzIGFub3RoZXIgc3lzdGVtIGNvbnRyb2xsZXIgYWxvbmcgd2l0aCBpdC4KPiA+
ID4gCj4gPiA+IEEgZmV3IFBIWSBwYXJhbWV0ZXJzIGhhdmUgdW51c2FibGUgZGVmYXVsdHMuIEFk
ZCBhIGRyaXZlciB0aGF0IHByb2dyYW1zCj4gPiA+IHRoZW0gYmVmb3JlIHJlbGVhc2luZyB0aGUg
UEhZIGZyb20gcmVzZXQgaW4gYWRkaXRpb24gdG8KPiA+ID4gY2xvY2svcmVzZXQvcmVndWxhdG9y
IG1hbmFnZW1lbnQuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDx6
aGVuZ3hpbmdkYUBpc2Nhcy5hYy5jbj4KPiA+ID4gLS0tCj4gPiA+IENoYW5nZXMgaW4gdjQ6Cj4g
PiA+IC0gTWFrZSBleGl0IGNhbGxiYWNrIGFsd2F5cyBzdWNjZXNzIHRvIHByZXZlbnQgUEhZIHN0
YXRlIG1hY2hpbmUgZGVzeW5jCj4gPiA+ICAgd2l0aCBjbGsvcnN0IHN0YXRlIGFzIHN1Z2dlc3Rl
ZCBieSBTYXNoaWtvLgo+ID4gPiAtIFJlLXdyYXAgc29tZSBjb21tZW50cyB0YXJnZXR0aW5nIGZ1
bGwgODAgY29sdW1ucy4KPiA+ID4gLSBVc2UgZGV2X2Vycl9wcm9iZSBmb3IgUEhZIGNyZWF0aW9u
IGVycm9yIGhhbmRsaW5nLCB0byBwcmV2ZW50IHNwYW1taW5nCj4gPiA+ICAgdGhlIGtlcm5lbCBs
b2cgd2l0aCAtRVBST0JFX0RFRkVSLgo+ID4gPiBDaGFuZ2VzIGluIHYzOgo+ID4gPiAtIFVzZSBm
c2xlZXAoKSB0byByZXBsYWNlIHVkZWxheSgpLCBhbmQgYWRkIHByb3BlciBpbmNsdXNpb24gb2YK
PiA+ID4gICBsaW51eC9kZWxheS5oIGZvciB0aGlzIGZ1bmN0aW9uLiAoZnNsZWVwKCkgc3VnZ2Vz
dGVkIGJ5IERyZXcgYW5kCj4gPiA+ICAgaW5jbHVzaW9uIHN1Z2dlc3RlZCBieSBTYXNoaWtvKQo+
ID4gPiAtIEFkYXB0IERyZXcncyBzdWdnZXN0aW9uIG9uIHRoZSB3b3JkaW5nIG9mIHRoZSBjb21t
aXQgbWVzc2FnZSdzIDJuZAo+ID4gPiAgIHBhcmFncmFwaC4KPiA+ID4gQ2hhbmdlcyBpbiB2MjoK
PiA+ID4gLSBSZW1vdmVkIHVucmVmZXJlbmNlZCByZWdpc3RlciBuYW1lcy4KPiA+ID4gLSBDaGFu
Z2VkIHRoZSBiZWhhdmlvciB0byBsZWF2aW5nIGJ1cyBjbG9jayBvbiBpbnN0ZWFkIG9mIGJpbmRp
bmcgaXQgdG8KPiA+ID4gICB0aGUgcmVnbWFwLgo+ID4gPiAtIFJlbW92ZWQgZWFybHkgcmV0dXJu
IGZvciByZXNldCBkZWFzc2VydCBmYWlsdXJlIGluIHBoeSBleGl0IGNhbGxiYWNrLgo+ID4gPiAt
IFR3ZWFrZWQgdGhlIEtjb25maWcgaXRlbSAocmVtb3ZlZCBkZWZhdWx0IHZhbHVlIGFuZCBhZGRl
ZCAic2VsZWN0Cj4gPiA+ICAgUkVHTUFQX01NSU8pLgo+ID4gPiAKPiA+ID4gIGRyaXZlcnMvcGh5
L0tjb25maWcgICAgICAgICAgICAgICAgfCAgIDEgKwo+ID4gPiAgZHJpdmVycy9waHkvTWFrZWZp
bGUgICAgICAgICAgICAgICB8ICAgMSArCj4gPiA+ICBkcml2ZXJzL3BoeS90aGVhZC9LY29uZmln
ICAgICAgICAgIHwgIDEyICsrCj4gPiA+ICBkcml2ZXJzL3BoeS90aGVhZC9NYWtlZmlsZSAgICAg
ICAgIHwgICAyICsKPiA+ID4gIGRyaXZlcnMvcGh5L3RoZWFkL3BoeS10aDE1MjAtdXNiLmMgfCAx
NzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gIDUgZmlsZXMgY2hhbmdlZCwg
MTk1IGluc2VydGlvbnMoKykKPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BoeS90
aGVhZC9LY29uZmlnCj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9waHkvdGhlYWQv
TWFrZWZpbGUKPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BoeS90aGVhZC9waHkt
dGgxNTIwLXVzYi5jCj4gPiAKPiA+IFNvcnJ5IGZvciB0aGUgZGVsYXkgaW4gcmV2aWV3LiBJIHRo
aW5rIGJpbmRpbmcgYW5kIGRyaXZlciBkaXIgc2hvdWxkIGJlCj4gPiBhZGRlZCB1bmRlciB0aGVh
ZCBzb2Mgc3VwcG9ydCBpbiBNQUlOVEFJTkVSUywgcmlnaHQ/Cj4gCj4gSSBhbSBhZGRpbmcgaXQs
IGJ1dCBtYXliZSBpdCdkIGJlIHdvcnRoIHRvIGFkZCBhIE46IGNsYXVzZSBpbnRvIHRoZQo+IE1B
SU5UQUlORVJTIGZpbGU/Cj4gCj4gQWx0aG91Z2ggdGhpcyB3b3VsZG4ndCBiZWxvbmcgdG8gdGhp
cyBwYXRjaHNldC4KCldlbGwgdG8gcHJldmVudCBtZXJnaW5nIGNvbmZsaWN0LCBtYXliZSBpdCdk
IGJlIGJldHRlciB0byBzdWJzdGl0dXRlIHRoZQpmaWxlIGxpc3Qgd2l0aCBhbiBOOiBpdGVtIGlu
IGEgY29tbWl0IGdvaW5nIHRocm91Z2ggdGhlIFNvQyB0cmVlLCBhbmQKcHJldmVudCBjaGFuZ2lu
ZyB0aGlzIGZpbGUgaW4gdGhlIFBIWSB0cmVlLgoKVGhhbmtzLApJY2Vub3d5Cgo+IAo+IFRoYW5r
cywKPiBJY2Vub3d5Cj4gCj4gPiAKPiA+ID4gK3N0cnVjdCB0aDE1MjBfdXNiX3BoeSB7Cj4gPiA+
ICsJc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldjsKPiA+IAo+ID4gSXQgc2VlbXMgdGhhdCBw
ZGV2IGlzIG9ubHkgYXNzaWduZWQgaW4gdGgxNTIwX3VzYl9waHlfcHJvYmUoKSBhbmQgbmV2ZXIK
PiA+IHJlYWQuIEkgdGhpbmsgaXQgY2FuIGJlIGRyb3BwZWQuCj4gPiAKPiA+IFdpdGggdGhvc2Ug
YWRkcmVzc2VkOgo+ID4gCj4gPiBSZXZpZXdlZC1ieTogRHJldyBGdXN0aW5pIDxmdXN0aW5pQGtl
cm5lbC5vcmc+Cj4gPiAKPiA+IEJUVywgSSBzZWUgdGhhdCBJIG5ldmVyIGFwcGxpZWQgdGhlIE1J
U0MgY2xvY2sgcGF0Y2hlcyAoMSB0byAzKSBmcm9tIHRoZQo+ID4gdjEgc2VyaWVzIFsxXSBsaWtl
IEkgc2FpZCBJIHdvdWxkLiBEbyB5b3Ugc3RpbGwgd2FudCBtZSB0byBhcHBseSB0aGVtPwo+ID4g
SWYgc28sIEkgd2lsbCBmaXggdXAgdGhlIHBsYXRmb3JtIGRhdGEgY2hlY2sgZm9yIHVzYl9zdXNw
ZW5kX2Rpdl9jbGsgaW4KPiA+IHBhdGNoIDIgd2hlbiBhcHBseWluZy4KPiA+IAo+ID4gVGhhbmtz
LAo+ID4gRHJldwo+ID4gCj4gPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MDUw
NzA4MTcxMC40MDkwODE0LTEtemhlbmd4aW5nZGFAaXNjYXMuYWMuY24vCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
