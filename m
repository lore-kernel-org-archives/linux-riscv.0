Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAA6E6F06D
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 15:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NOb8jk/0hbWb8Aoyqo8U1cHcEmBOlybrkcC1+U9vK88=; b=cqUgXypVSgKFaV
	UBoDfxYjcfs+vFEe9IWQsjrXpVI2FpcHaOzwKNMG3+0bDOe3LZ+XnoO1CPlgyYkDQmEWXuG6BWGqi
	GoKn5YcOTprNcHq6iAuIA7TM2QnUFg4xeOLd1l5nns1WV37Tug0Swl7RoYHcjtKqMKdTPlFRJ4LzE
	cVE0ueFRY7+374pxy8Xqix81mdENkemrmwdWJP5kpEbmuqcQQj7xjJ4VaVSY70Ff47Fxlp2MBqlWF
	ElYg46LVdSo9zb/tdtrTwUpR0QNnH/mzP4zPsMNdkpnlFIccCCFrfd9Zlh2GZbOUi4gKJz240pCcv
	ifSmMCF9zyg7uDk/VT3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ty7-00000007ZS3-2rOG;
	Fri, 01 Nov 2024 15:53:47 +0000
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tjp-00000007XJA-1Jfx
	for linux-riscv@lists.infradead.org;
	Fri, 01 Nov 2024 15:39:03 +0000
Date: Fri, 1 Nov 2024 08:38:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730475537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MDBDtrud5eJtuuxZyPOJXE2RSRr8v+TyeHi88AUx8RA=;
	b=PClTnFcdIrcZ78W4jSshcODMfnNiSvNFtWKdgQXgVaJZCwGgQF3dDPomr/MvL2yA9B2Cwx
	sIxnO1FBfdPS2fhSPK5ZXdGtgALWc9G1JWP6xyny1RXUjNkwgAnqURsd9JAi0B3Jon4w0B
	kiA/rkElVf8i8EK1b4eQnPfLrgKPky8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Jones <ajones@ventanamicro.com>,
	James Houghton <jthoughton@google.com>,
	David Woodhouse <dwmw@amazon.co.uk>, linux-next@vger.kernel.org
Subject: Re: [PATCH v3 03/14] KVM: selftests: Return a value from
 vcpu_get_reg() instead of using an out-param
Message-ID: <ZyT2CB6zodtbWEI9@linux.dev>
References: <20241009154953.1073471-1-seanjc@google.com>
 <20241009154953.1073471-4-seanjc@google.com>
 <39ea24d8-9dae-447a-ae37-e65878c3806f@sirena.org.uk>
 <ZyTpwwm0s89iU9Pk@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZyTpwwm0s89iU9Pk@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_083901_815126_0ECF9DCE 
X-CRM114-Status: GOOD (  25.25  )
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

SGV5LAoKT24gRnJpLCBOb3YgMDEsIDIwMjQgYXQgMDc6NDg6MDBBTSAtMDcwMCwgU2VhbiBDaHJp
c3RvcGhlcnNvbiB3cm90ZToKPiBPbiBGcmksIE5vdiAwMSwgMjAyNCwgTWFyayBCcm93biB3cm90
ZToKPiA+IE9uIFdlZCwgT2N0IDA5LCAyMDI0IGF0IDA4OjQ5OjQyQU0gLTA3MDAsIFNlYW4gQ2hy
aXN0b3BoZXJzb24gd3JvdGU6Cj4gPiA+IFJldHVybiBhIHVpbnQ2NF90IGZyb20gdmNwdV9nZXRf
cmVnKCkgaW5zdGVhZCBvZiBoYXZpbmcgdGhlIGNhbGxlciBwcm92aWRlCj4gPiA+IGEgcG9pbnRl
ciB0byBzdG9yYWdlLCBhcyBub25lIG9mIHRoZSB2Y3B1X2dldF9yZWcoKSB1c2FnZSBpbiBLVk0g
c2VsZnRlc3RzCj4gPiA+IGFjY2Vzc2VzIGEgcmVnaXN0ZXIgbGFyZ2VyIHRoYW4gNjQgYml0cywg
YW5kIHZjcHVfc2V0X3JlZygpIG9ubHkgYWNjZXB0cyBhCj4gPiA+IDY0LWJpdCB2YWx1ZS4gIElm
IGEgdXNlIGNhc2UgY29tZXMgYWxvbmcgdGhhdCBuZWVkcyB0byBnZXQgYSByZWdpc3RlciB0aGF0
Cj4gPiA+IGlzIGxhcmdlciB0aGFuIDY0IGJpdHMsIHRoZW4gYSB1dGlsaXR5IGNhbiBiZSBhZGRl
ZCB0byBhc3NlcnQgc3VjY2VzcyBhbmQKPiA+ID4gdGFrZSBhIHZvaWQgcG9pbnRlciwgYnV0IHVu
dGlsIHRoZW4sIGZvcmNpbmcgYW4gb3V0IHBhcmFtIHlpZWxkcyB1Z2x5IGNvZGUKPiA+ID4gYW5k
IHByZXZlbnRzIGZlZWRpbmcgdGhlIG91dHB1dCBvZiB2Y3B1X2dldF9yZWcoKSBpbnRvIHZjcHVf
c2V0X3JlZygpLgo+ID4gCj4gPiBUaGlzIGNvbW1pdCwgd2hpY2ggaXMgaW4gdG9kYXkncyAtbmV4
dCBhcyA1YzZjN2I3MWE0NWM5YywgYnJlYWtzIHRoZQo+ID4gYnVpbGQgb24gYXJtNjQ6Cj4gPiAK
PiA+IGFhcmNoNjQvcHNjaV90ZXN0LmM6IEluIGZ1bmN0aW9uIOKAmGhvc3RfdGVzdF9zeXN0ZW1f
b2ZmMuKAmToKPiA+IGFhcmNoNjQvcHNjaV90ZXN0LmM6MjQ3Ojk6IGVycm9yOiB0b28gbWFueSBh
cmd1bWVudHMgdG8gZnVuY3Rpb24g4oCYdmNwdV9nZXRfcmVn4oCZCj4gPiAgIDI0NyB8ICAgICAg
ICAgdmNwdV9nZXRfcmVnKHRhcmdldCwgS1ZNX1JFR19BUk1fUFNDSV9WRVJTSU9OLCAmcHNjaV92
ZXJzaW9uKTsKPiA+ICAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn4KPiA+IEluIGZpbGUgaW5j
bHVkZWQgZnJvbSBhYXJjaDY0L3BzY2lfdGVzdC5jOjE4Ogo+ID4gaW5jbHVkZS9rdm1fdXRpbC5o
OjcwNToyNDogbm90ZTogZGVjbGFyZWQgaGVyZQo+ID4gICA3MDUgfCBzdGF0aWMgaW5saW5lIHVp
bnQ2NF90IHZjcHVfZ2V0X3JlZyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVpbnQ2NF90IGlkKQo+
ID4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fgo+ID4gQXQgdG9w
IGxldmVsOgo+ID4gY2MxOiBub3RlOiB1bnJlY29nbml6ZWQgY29tbWFuZC1saW5lIG9wdGlvbiDi
gJgtV25vLWdudS12YXJpYWJsZS1zaXplZC10eXBlLW5vdC1hdAo+ID4gLWVuZOKAmSBtYXkgaGF2
ZSBiZWVuIGludGVuZGVkIHRvIHNpbGVuY2UgZWFybGllciBkaWFnbm9zdGljcwo+ID4gCj4gPiBz
aW5jZSB0aGUgdXBkYXRlcyBkb25lIHRvIHRoYXQgZmlsZSBkaWQgbm90IHRha2UgYWNjb3VudCBv
ZiA3MmJlNWFhNmJlNAo+ID4gKCJLVk06IHNlbGZ0ZXN0czogQWRkIHRlc3QgZm9yIFBTQ0kgU1lT
VEVNX09GRjIiKSB3aGljaCBoYXMgYmVlbiBtZXJnZWQKPiA+IGluIHRoZSBrdm0tYXJtNjQgdHJl
ZS4KPiAKPiBCdWdnZXIuICBJbiBoaW5kc2lnaHQsIGl0J3Mgb2J2aW91cyB0aGF0IG9mIGNvdXJz
ZSBhcmNoIHNlbGZ0ZXN0cyB3b3VsZCBhZGQgdXNhZ2UKPiBvZiB2Y3B1X2dldF9yZWcoKS4KPiAK
PiBVbmxlc3Mgc29tZW9uZSBoYXMgYSBiZXR0ZXIgaWRlYSwgSSdsbCBkcm9wIHRoZSBzZXJpZXMg
ZnJvbSBrdm0teDg2LCBwb3N0IGEgbmV3Cj4gdmVyc2lvbiB0aGF0IGFwcGxpZXMgb24gbGludXgt
bmV4dCwgYW5kIHRoZW4gcmUtYXBwbHkgdGhlIHNlcmllcyBqdXN0IGJlZm9yZSB0aGUKPiB2Ni4x
MyBtZXJnZSB3aW5kb3cgKHJpbnNlIGFuZCByZXBlYXQgYXMgbmVlZGVkIGlmIG1vcmUgdmNwdV9n
ZXRfcmVnKCkgdXNlcnMgY29tZQo+IGFsb25nKS4KCkNhbiB5b3UgaW5zdGVhZCBqdXN0IHB1c2gg
b3V0IGEgdG9waWMgYnJhbmNoIGFuZCBsZXQgdGhlIGFmZmVjdGVkCm1haW50YWluZXJzIGRlYWwg
d2l0aCBpdD8gVGhpcyBpcyB0aGUgdXN1YWwgd2F5IHdlIGhhbmRsZSBjb25mbGljdHMKYmV0d2Vl
biB0cmVlcy4uLgoKPiBUaGF0IHdvdWxkIGJlIGEgZ29vZCBvcHB1cnR1bml0eSB0byBkbyB0aGUg
JChBUkNIKSBkaXJlY3Rvcnkgc3dpdGNoWypdIHRvbywgZS5nLgo+IGhhdmUgYSAic2VsZnRlc3Rz
X2xhdGUiIG9yIHdoYXRldmVyIHRvcGljIGJyYW5jaC4KClRoZSByaWdodCB0aW1lIHRvIGRvIEtW
TS13aWRlIGNoYW5nZXMgKGV2ZW4gc2VsZnRlc3RzKSBpcyAqZWFybHkqIGluIHRoZQpkZXZlbG9w
bWVudCBjeWNsZSwgbm90IGxhc3QgbWludXRlLiBJdCBnaXZlcyB1cyBwbGVudHkgb2YgdGltZSB0
byBpcm9uIG91dAp0aGUgd3JpbmtsZXMuCgo+IFNvcnJ5IGZvciB0aGUgcGFpbiBNYXJrLCB5b3Un
dmUgYmVlbiBwbGF5aW5nIGphbml0b3IgZm9yIHVzIHRvbyBtdWNoIGxhdGVseS4KCisxLCBhcHBy
ZWNpYXRlIHlvdXIgaGVscCBvbiB0aGlzLgoKLS0gClRoYW5rcywKT2xpdmVyCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
