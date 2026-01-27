Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6169D2FEC8
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 17:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hU9k6DJhyKvHJuKNbqWV2WrAUpnCFObMKNow/LsGkk8=; b=BaTrYOgJfg8tok
	xR/npmPSKvox3gYbVtq+N4IdRDWcxIbA/ULZsgPgQpPWFleIjVjgVzVW8KuaWdHNLf3tqFBs13Tky
	m0G2VYGQa3KMEuJhdo/EPMljcCeEB3WH8MlsA1krhNGmH6Dm00r0DW+SHkrHgcxkop4+hhpLHgZ2D
	iGsFfaMLhaV7smzxe798OtIaGbm1SxrqGNgIL7Jrh+gGb/2muR77roZFP2/3ylyu93tuigPp3ncYi
	qHgt4C6o3ynRXYxSb0I42oAV/QSmVBMZv3GBFV3IRK4zDXKo8mbb3ZhcFPa0li8omPK5THYuBGscx
	11uBDZOQlxbq9E2LMmcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknD8-0000000Ekrr-3hSp;
	Tue, 27 Jan 2026 17:50:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknD6-0000000EkrV-1ubi
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 17:50:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C00F4442C7
	for <linux-riscv@lists.infradead.org>; Tue, 27 Jan 2026 17:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6DCC2BCB9
	for <linux-riscv@lists.infradead.org>; Tue, 27 Jan 2026 17:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769536239;
	bh=vMhVuToLIag3bSMP5xMCZderMPeMrUpStjag0O75BxM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Qz8wkdhfyK8A+2Af8FXEmFdvklwXjP2iLe3Umozm2CpLEnwER2YvfVqDrbkHiwPtk
	 TUYc3TrE2jppxdgPyfd1sLjvj0kn2pCd8AXOB5jmSXGFQlPS1l0GYg4mXDwezc0bah
	 VMwVy/1D/HpDRhb+fvYpRbhdaBdsrrLEU0F4i6GHQaiDphm7EPjUnsf7OxQLgFgcts
	 YDtrsRAqOqaJAQYuklEsYcdI7RyA1+xoNbS1h8CaP4cmo6XTfTLA2RUWr4V6+TZEbf
	 F8DEIqOMGBBtAK5iJ5QEk4REM3HnvL2DjYawDqxZLJ4BdaiaZIwoOicQOvK+S0nlbS
	 bVr6Iid+6WLew==
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-45c87d82bd2so4023192b6e.1
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jan 2026 09:50:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUMtzjSDJ0WPZFYnBkyrWZ/u9nRyAHYGcBVrZFCi762eoDfjSG4GJQhCGi6vLHb6GV30oPxpB/V9PNjYw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywxwkdtd2wHGonojy5corn+9n76uK87ZKMdobnlWtIWKquDGuTy
	9dPgFYPsOay67BXITsdMbnvvhlsYRCqgqWR7IbRn/8JiwXeO8qc8EX31h80aIay3cEcRPlwc8zG
	e7FToyjhluPbAYl0uHKC89qJKAKT5ALo=
X-Received: by 2002:a05:6808:250a:b0:45e:dbc7:2cce with SMTP id
 5614622812f47-45efc4a9c66mr1563505b6e.7.1769536238219; Tue, 27 Jan 2026
 09:50:38 -0800 (PST)
MIME-Version: 1.0
References: <CAJZ5v0ixBFGHwvSEp3Ae_s0tyhK338Gju=1+vb+O3_pH2mHyGA@mail.gmail.com>
 <20260127172557.GA364754@bhelgaas>
In-Reply-To: <20260127172557.GA364754@bhelgaas>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 27 Jan 2026 18:50:24 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iZukqD0atbdfBnmZAxUzNB6sTcJ1YUeAo5a8NRn-emEg@mail.gmail.com>
X-Gm-Features: AZwV_QgiG--Rm2Nj4QEnZklC8c4MsqiqsLSdiwY26DiPpRQjB7sBwYL6cIEaQKo
Message-ID: <CAJZ5v0iZukqD0atbdfBnmZAxUzNB6sTcJ1YUeAo5a8NRn-emEg@mail.gmail.com>
Subject: Re: [PATCH v2] ACPI: pci_root: Clear the acpi dependencies after PCI
 root bridge initialization on RISC-V
To: Bjorn Helgaas <helgaas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_095040_546747_2EB7826A 
X-CRM114-Status: GOOD (  33.61  )
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, hu.yuye@zte.com.cn, guo.chang2@zte.com.cn, deng.weixian@zte.com.cn, Robert Moore <robert.moore@intel.com>, liu.qingtao2@zte.com.cn, zuo.jiang@zte.com.cn, linux-acpi@vger.kernel.org, li.kunpeng@zte.com.cn, wu.jiabao@zte.com.cn, lin.yongchun@zte.com.cn, Albert Ou <aou@eecs.berkeley.edu>, huyuye <huyuye812@163.com>, dai.hualiang@zte.com.cn, Bjorn Helgaas <bhelgaas@google.com>, Alexandre Ghiti <alex@ghiti.fr>, zhang.longxiang@zte.com.cn, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKYW4gMjcsIDIwMjYgYXQgNjoyNuKAr1BNIEJqb3JuIEhlbGdhYXMgPGhlbGdhYXNA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEphbiAyNywgMjAyNiBhdCAwNDowMDo0OVBN
ICswMTAwLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPiA+IE9uIE1vbiwgSmFuIDEyLCAyMDI2
IGF0IDM6MTfigK9QTSBodXl1eWUgPGh1eXV5ZTgxMkAxNjMuY29tPiB3cm90ZToKPiA+ID4KPiA+
ID4gSGkgUmFmYWVsLAo+ID4gPiBUaGFuayB5b3UgZm9yIHlvdXIgdGhvcm91Z2ggcmV2aWV3IGFu
ZCB2YWx1YWJsZSBjb21tZW50cyBvbiB2MS4KPiA+ID4gSSd2ZSB1cGRhdGVkIHRoZSBwYXRjaCBh
cyBmb2xsb3dzOgo+ID4gPiAxLiBSZW1vdmVkIHRoZSByZWR1bmRhbnQgI2lmZGVmIENPTkZJR19B
Q1BJIGFuZCBpZiAoIWFjcGlfZGlzYWJsZWQpCj4gPiA+IGd1YXJkIGFzIHlvdSBwb2ludGVkIG91
dC4gVGhlIGVudGlyZSBjb2RlIGJsb2NrIGluZGVlZCBhbHJlYWR5IGRlcGVuZHMKPiA+ID4gb24g
Q09ORklHX0FDUEkgYXQgYSBoaWdoZXIgbGV2ZWwsIG1ha2luZyB0aGUgaW5uZXIgZ3VhcmQgdW5u
ZWNlc3NhcnkuCj4gPiA+IDIuIE1vdmVkIGFjcGlfZGV2X2NsZWFyX2RlcGVuZGVuY2llcyB0byBS
SVNDLVYgc3BlY2lmaWMgYXJjaGl0ZWN0dXJlCj4gPiA+IGNvZGUgKGRyaXZlci9hY3BpL3Jpc2N2
L2FjcGlfcGNpLmMpLiBUaGlzIGVuc3VyZXMgdGhhdCBBQ1BJIGRlcGVuZGVuY3kKPiA+ID4gY2xl
YXJpbmcgaXMgaGFuZGxlZCB3aXRoaW4gdGhlIGFwcHJvcHJpYXRlIGFyY2hpdGVjdHVyYWwgY29u
dGV4dC4KPiA+ID4KPiA+ID4gQmVzdCByZWdhcmRzCj4gPiA+IFNpZ25lZC1vZmYtYnk6IGh1eXV5
ZSA8aHV5dXllODEyQDE2My5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9hY3BpL3BjaV9y
b290LmMgICAgICAgfCAgNiArKysrKysKPiA+ID4gIGRyaXZlcnMvYWNwaS9yaXNjdi9NYWtlZmls
ZSAgIHwgIDIgKy0KPiA+ID4gIGRyaXZlcnMvYWNwaS9yaXNjdi9hY3BpX3BjaS5jIHwgMTEgKysr
KysrKysrKysKPiA+ID4gIGluY2x1ZGUvYWNwaS9hY3BpX2J1cy5oICAgICAgIHwgIDEgKwo+ID4g
PiAgNCBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9hY3BpL3Jpc2N2L2FjcGlfcGNpLmMKPiA+ID4K
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9wY2lfcm9vdC5jIGIvZHJpdmVycy9hY3Bp
L3BjaV9yb290LmMKPiA+ID4gaW5kZXggOWQ3Zjg1ZGFkYzQ4Li5hMTZlYjkwOTdjZGMgMTAwNjQ0
Cj4gPiA+IC0tLSBhL2RyaXZlcnMvYWNwaS9wY2lfcm9vdC5jCj4gPiA+ICsrKyBiL2RyaXZlcnMv
YWNwaS9wY2lfcm9vdC5jCj4gPiA+IEBAIC0zMCw2ICszMCwxMSBAQCBzdGF0aWMgaW50IGFjcGlf
cGNpX3Jvb3RfYWRkKHN0cnVjdCBhY3BpX2RldmljZSAqZGV2aWNlLAo+ID4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBhY3BpX2RldmljZV9pZCAqbm90X3VzZWQp
Owo+ID4gPiAgc3RhdGljIHZvaWQgYWNwaV9wY2lfcm9vdF9yZW1vdmUoc3RydWN0IGFjcGlfZGV2
aWNlICpkZXZpY2UpOwo+ID4gPgo+ID4gPiArCj4gPiA+ICt2b2lkIF9fd2VhayBhcmNoX2FjcGlf
cGNpX3Jvb3RfYWRkX2NsZWFyX2RlcChzdHJ1Y3QgYWNwaV9kZXZpY2UgKmRldmljZSkKPiA+ID4g
K3sKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiAgc3RhdGljIGludCBhY3BpX3BjaV9yb290X3NjYW5f
ZGVwZW5kZW50KHN0cnVjdCBhY3BpX2RldmljZSAqYWRldikKPiA+ID4gIHsKPiA+ID4gICAgICAg
ICBhY3BpcGhwX2NoZWNrX2hvc3RfYnJpZGdlKGFkZXYpOwo+ID4gPiBAQCAtNzYwLDYgKzc2NSw3
IEBAIHN0YXRpYyBpbnQgYWNwaV9wY2lfcm9vdF9hZGQoc3RydWN0IGFjcGlfZGV2aWNlICpkZXZp
Y2UsCj4gPiA+ICAgICAgICAgcGNpX2xvY2tfcmVzY2FuX3JlbW92ZSgpOwo+ID4gPiAgICAgICAg
IHBjaV9idXNfYWRkX2RldmljZXMocm9vdC0+YnVzKTsKPiA+ID4gICAgICAgICBwY2lfdW5sb2Nr
X3Jlc2Nhbl9yZW1vdmUoKTsKPiA+ID4gKyAgICAgICBhcmNoX2FjcGlfcGNpX3Jvb3RfYWRkX2Ns
ZWFyX2RlcChkZXZpY2UpOwo+ID4KPiA+IEFjdHVhbGx5LCB0aGlzIGNvdWxkIGJlIGFzIHNpbXBs
ZSBhcwo+ID4KPiA+ICAgICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfUklTQ1YpKQo+ID4gICAg
ICAgICAgICAgICBhY3BpX2Rldl9jbGVhcl9kZXBlbmRlbmNpZXMoZGV2aWNlKTsKPiA+Cj4gPiB3
aXRoIGEgYnJpZWYgY29tbWVudCBleHBsYWluaW5nIHdoeSBpdCBpcyBuZWVkZWQuCj4gPgo+ID4g
Qmpvcm4sIGFueSB0aG91Z2h0cz8KPgo+IFRoZSBqdXN0aWZpY2F0aW9uICgiSWYgYSBob3N0IGJy
aWRnZSBCIGRlcGVuZHMgb24gaG9zdCBicmlkZ2UgQSAodmlhCj4gX0RFUCksIHRoaXMgY2FsbCBh
bGxvd3MgYnJpZGdlIEIgdG8gcHJvY2VlZCB3aXRoIGVudW1lcmF0aW9uIGFmdGVyCj4gYnJpZGdl
IEEgaXMgZnVsbHkgaW5pdGlhbGl6ZWQiKSBkb2Vzbid0IHNvdW5kIHNwZWNpZmljIHRvIFJJU0Mt
Vi4KCkJ1dCB0aGVyZSBhcmUgbm8gX0RFUCBkZXBlbmRlbmNpZXMgYmV0d2VlbiBob3N0IGJyaWRn
ZXJzIG9uIG90aGVyCmFyY2hpdGVjdHVyZXMgaW4gcHJhY3RpY2UuCgphY3BpX2Rldl9jbGVhcl9k
ZXBlbmRlbmNpZXMoKSBjb3VsZCBiZSBjYWxsZWQgdW5jb25kaXRpb25hbGx5IGhlcmUsCmJ1dCBp
dCB3b3VsZCBiZSB1c2VsZXNzIG92ZXJoZWFkIGlmIG5vIHN1Y2ggZGVwZW5kZW5jaWVzIGV4aXN0
ZWQuCgo+IEZvciB0aGF0IG1hdHRlciwgaXQgZG9lc24ndCBzb3VuZCBzcGVjaWZpYyB0byBob3N0
IGJyaWRnZXMgZWl0aGVyLgoKTm8sIGl0IGlzIG5vdCBzcGVjaWZpYyB0byBob3N0IGJyaWRnZXMu
Cgo+IFRoZSBfREVQIHNwZWMgbGFuZ3VhZ2UgaXMgYSBiaXQgdmFndWUuICBBQ1BJIHI2LjYsIHNl
YyA2LjUuOCwgc2F5czoKPgo+ICAgX0RFUCBldmFsdWF0ZXMgdG8gYSBwYWNrYWdlIGFuZCBkZXNp
Z25hdGVzIGRldmljZSBvYmplY3RzIHRoYXQgT1NQTQo+ICAgc2hvdWxkIGFzc2lnbiBhIGhpZ2hl
ciBwcmlvcml0eSBpbiBzdGFydCBvcmRlcmluZyBkdWUgdG8KPiAgIGRlcGVuZGVuY2llcyBiZXR3
ZWVuIGRldmljZXMgKGZvciBleGFtcGxlLCByZWxhdGVkIHRvIGZ1dHVyZQo+ICAgb3BlcmF0aW9u
IHJlZ2lvbiBhY2Nlc3NlcykuCj4KPiBJIGRvbid0IGtub3cgd2hhdCAiZGV2aWNlIHN0YXJ0IiBt
ZWFucy4gIEl0IHNvdW5kcyBsaWtlIHRoaXMgYWxsdWRlcwo+IHRvIHRoZSBvcmRlciBpbiB3aGlj
aCBPU1BNIHJ1bnMgc29tZSBkZXZpY2Ugc3RhcnQgbWV0aG9kPyAgX0lOST8KPiBTaG91bGQgYWNw
aV9kZXZfY2xlYXJfZGVwZW5kZW5jaWVzKCkgYmUgZG9uZSBhdCB0aGUgcG9pbnQgd2hlcmUgdGhh
dAo+IGRldmljZSBzdGFydCBtZXRob2QgaXMgcnVuPwoKTm90IHJlYWxseS4KCmFjcGlfZGV2X2Ns
ZWFyX2RlcGVuZGVuY2llcygpIGlzIHJlbGF0ZWQgdG8gdGhlIHdheSBMaW51eCB1c2VzIF9ERVAK
d2hpY2ggaXMgdG8gZGVmZXIgdGhlIGVudW1lcmF0aW9uIG9mIGRlcGVuZGVudCBkZXZpY2VzIHVu
dGlsIHRoZQpkZXZpY2VzIHRoZXkgZGVwZW5kIG9uIGFyZSByZWFkeS4KClNvIGJ5IGNhbGxpbmcg
YWNwaV9kZXZfY2xlYXJfZGVwZW5kZW5jaWVzKCkgdGhlIGRyaXZlciBiYXNpY2FsbHkKYWxsb3dz
IG90aGVyIGRyaXZlcnMgdG8gYmluZCB0byBkZXZpY2VzLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
