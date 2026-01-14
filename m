Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA16ED31A2A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 08:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PTx8XgjW0Jfw2Kxg182TNBZ5pH/v3MPlIPZ48uMMM1M=; b=u5mQfs/Qj3VijF
	vjaordvD1HIaIUYzlLciDQk4BgKakoSlTPc9Ps0tY9qUJbsyDFXC/KSACarbctDJcrM7cs6Y0gvs8
	1+y2v0q7RJsOJamkPG/7lIAYKV3gpkFrJSRYzSz96T6Tcv6VJZSb2dcShqpU55J1R1Mu+gF/EbkNl
	k9EVaOMwlPTocaQrfzoV7KUPJHEBwYVR93oiCyJtUqE+nPVF6EcfBVLmgxm9VxtwgjNRoviewHimz
	EGnmotM2RXNJAdL+Ea5LT+Cc+CSQWB1PjvAD0CUmYvDg7UO1/Opul60Mu4DZHnoF5K8S0/RvOBjDt
	SVeumoT5rRix1U1An0pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwh5-00000008Qhl-43qq;
	Wed, 14 Jan 2026 08:57:35 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwh3-00000008Qc9-1bEo
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 08:57:35 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-59b710d46ceso7470111e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 00:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1768381050; x=1768985850; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbYE4m63GHOnjyRsQHm5yKPNJ+dqnw+Gr/qu+XAlEUU=;
        b=lwrwRvTbQuwfG/5d7duGpdA9lqk74lNTB6n8TeUnv+aCod29Ifx9o+zO9qxQ+1setN
         1MYZMBpd1wXYfljjCOETYEaRhCCkFH61/3M+iZurM5+dn0YeyNIgwY8M7XbqHCOgxmAe
         jj/lHCZ22k5pV9mDs5BAvHFHwUIxrvlzw+DKcQDnleTs2TNaD/6R/9B2LtlUBWHp6Tyz
         A5xdr39jOhDsgvRFJcZGQz3Vq/FDbYTo6f338HrGWVATbbJrwI8EYhMXhbjh1gfRm1Wu
         RFzGSgQlXFveciYkVArqeIWV68eAIyov+7VDxdBjlMZAyqFOtFNW1qbeVqHdYoBwlOVB
         JIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768381050; x=1768985850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BbYE4m63GHOnjyRsQHm5yKPNJ+dqnw+Gr/qu+XAlEUU=;
        b=tOi/OWh18OJ66KfN90d/iG+Ld2XSsM/Er1yeIOc2VkCucYcgLqtajjw1BU/kIYdNYL
         i5bOss1+nyD41/yd+zjNRdX6O1kg5TLK6gHouzM9AMgG7uFVjVBbMM1unxe3ow7JBkGa
         0td3Jpl7lQ3ErGj8ImqM3pzIvCRGYAT5aXG4HDkEhJp4nQ5VzWBCB6kfWS2PWKPYJfGs
         gztpgGg2ZpOV++qu7QgZpF5suwPxtoxtLHoGgz1OolUUfHJnluKDJv6vyXg2bvg1mBFt
         fpNrFFdMgqp8+QQd5psCiGa7l0y1oGlYLK9pPtxN8dvff8LJ1wCpsDpq5yydkBHgOS3C
         5x3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBedrz7AB86O+PDPAu5NKqWncvMd691hmFgItP2086fnjOGOTjcp0EUZqqyhqXjWzyZ+pDI9fOM9EV0w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu/F271FeoLCsC8EYmFFrO2xLkh9Jl9fTTGl05GX/xMR/3P3vj
	QwSTuumdLxhPcC76Mo3m/4eIb8/BISlb3ftIc2cX2Sylj6PqSwfMprHbSV37PUPj2rKfklnV9A6
	DnfKkK5OQtW0a8OtmsidqVgira558hCJDBe8Yag5cCg==
X-Gm-Gg: AY/fxX4CopP/lKRvVqDHMNfvGrhCpd0SroOyPd254v/PPWnL17cgfR3N3aGgA8iBdQJ
	hVio8ZWB7/Oi8ZbfmMsD1VF1HL1Rsw4/XLs34tVsz5vqCsMW4Jqp6oJfw17H/LpK6nADX41WLYI
	xTwzoCDU+rnzSbdrtAvzcuxMUMCZRo7CXKjtfg6V0gJz5VcGcohpUvMLc4RgqBFE/H7DAtAmhUK
	lbPZhJZIMffExPIbyHRh5ivCT3N5jcBGNVWiyi6kQnZ1ysboAGb4cS0dGzW86gCk1tj0tLME9xN
	xtW+OqNptkwXHdnjNJojBjNm6etGPkqcoRfyEoY=
X-Received: by 2002:a05:6512:23a2:b0:59b:6b64:b390 with SMTP id
 2adb3069b0e04-59ba0f62629mr635023e87.14.1768381049410; Wed, 14 Jan 2026
 00:57:29 -0800 (PST)
MIME-Version: 1.0
References: <20260114063730.78009-1-yang.yicong@picoheart.com>
In-Reply-To: <20260114063730.78009-1-yang.yicong@picoheart.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 14 Jan 2026 14:27:18 +0530
X-Gm-Features: AZwV_QjAenusiO6d0DselLkZFwK47o03-3cx1kZ5XAB0GFmtiZ3_Lc-_K-K_pNU
Message-ID: <CAK9=C2XrExRLihwveMxs-Ourr+8bXja5UAmN_muAJz5FSpFW8A@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-aplic: Register the driver prior to device creation
To: Yicong Yang <yang.yicong@picoheart.com>
Cc: anup@brainfault.org, tglx@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, geshijian@picoheart.com, 
	weidong.wd@picoheart.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_005733_735126_8DCB302A 
X-CRM114-Status: GOOD (  34.65  )
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

T24gV2VkLCBKYW4gMTQsIDIwMjYgYXQgMTI6MDjigK9QTSBZaWNvbmcgWWFuZyA8eWFuZy55aWNv
bmdAcGljb2hlYXJ0LmNvbT4gd3JvdGU6Cj4KPiBPbiBSSVNDLVYgdGhlIEFQTElDIHNlcnZlcyBw
YXJ0IG9mIHRoZSBHU0kgaW50ZXJydXB0cywgYnV0IHVubGlrZQo+IG90aGVyIGFydGhpdGVjdHVy
ZSBpdCdzIGluaXRpYWxpemVkIGEgYml0IGxhdGUgb24gQUNQSSBiYXNlZAo+IHN5c3RlbToKPiAt
IHRoZSBzcGVjIG9ubHkgbWFuZGF0ZXMgdGhlIHJlcG9ydCBpbiBEU0RUIChyaXNjdi1icnMgcnVs
ZSBBTUxfMTAwKQo+ICAgc28gdGhlIEFQTElDIGlzIGNyZWF0ZWQgYXMgcGxhdGZvcm1fZGV2aWNl
IHdoZW4gc2Nhbm5pbmcgRFNEVAo+IC0gdGhlIGRyaXZlciBpcyByZWdpc3RlcmVkIGFuZCBpbml0
aWFsaXplIHRoZSBkZXZpY2UgaW4gZGV2aWNlX2luaXRjYWxsCj4gICBzdGFnZQo+Cj4gVGhlIGNy
ZWF0aW9uIG9mIGRldmljZXMgZGVwZW5kcyBvbiBBUExJQyBpcyBkZWZlcnJlZCBhZnRlciB0aGUg
QVBMSUMKPiBpcyBpbml0aWFsaXplZCAod2hlbiB0aGUgZHJpdmVyIGNhbGxzIGFjcGlfZGV2X2Ns
ZWFyX2RlcGVuZGVuY2llcyksCj4gbm90IGxpa2UgbW9zdCBvdGhlciBkZXZpY2VzIHdoaWNoIGlz
IGNyZWF0ZWQgd2hlbiBzY2FubmluZyB0aGUgRFNEVC4KPiBUaGUgYWZmZWN0ZWQgZGV2aWNlcyBp
bmNsdWRlIHRob3NlIGRlY2xhcmUgdGhlIGRlcGVuZGVuY3kgZXhwbGljaXRseQo+IGJ5IEFDUEkg
X0RFUCBtZXRob2QgYW5kIF9QUlQgZm9yIFBDSWUgaG9zdCBicmlkZ2UgYW5kIHRob3NlIHJlcXVp
cmUKPiB0aGVpciBpbnRlcnJ1cHRzIGFzIEdTSS4gRnVyaHRlcm1vcmUsIHRoZSBkZWZlcnJlZCBj
cmVhdGlvbiBpcwo+IHBlcmZvcm1lZCBpbiBhbiBhc3luYyB3YXkgKHF1ZXVlZCBpbiB0aGUgc3lz
dGVtX2RmbF93cSB3b3JrcXVldWUpCj4gYnV0IGFsbCBjb250ZW5kIG9uIHRoZSBhY3BpX3NjYW5f
bG9jay4KPgo+IFNpbmNlIHRoZSBkZWZlcnJlZCBkZXZjaWUgY3JlYXRpb24gaXMgYXN5bmNocm9u
b3VzIGFuZCB3aWxsIGNvbnRlbmQKPiBmb3IgdGhlIHNhbWUgbG9jaywgdGhlIG9yZGVyIGFuZCB0
aW1pbmcgaXMgbm90IGNlcnRhaW4uIEFuZCB0aGUgdGltZQo+IGlzIGxhdGUgZW5vdWdoIGZvciB0
aGUgZGV2aWNlIGNyZWF0aW9uIHJ1bm5pbmcgcGFyYWxsZWwgd2l0aCB0aGUgaW5pdAo+IHRhc2su
IFRoaXMgd2lsbCBsZWFkIHRvIGJlbG93IGlzc3VlcyAoYWxzbyBvYnNlcnZlZCBvbiBvdXIgcGxh
dGZvcm1zKToKPiAtIHRoZSBjb25zb2xlL3R0eSBkZXZpY2UgaXMgY3JlYXRlZCBsYXRlbHkgYW5k
IHNvbWV0aW1lcyBpdCdzIG5vdCByZWFkeQo+ICAgd2hlbiBpbml0IHRhc2sgY2hlY2sgZm9yIGl0
cyBwcmVzZW5jZS4gdGhlIHN5c3RlbSB3aWxsIGNyYXNoIGluIHRoZQo+ICAgbGF0dGVyIGNhc2Ug
c2luY2UgdGhlIGluaXQgdGFzayBhbHdheXMgcmVxdWlyZXMgYSB2YWxpZCBjb25zb2xlLgo+IC0g
dGhlIHJvb3QgZGV2aWNlIHdpbGwgYnkgcHJvYmVkIGFuZCByZWdpc3RlcmVkIGxhdGVseSAoZS5n
LiBOVk1FLAo+ICAgYWZ0ZXIgdGhlIGluaXQgdGFzayBleGVjdXRlZCkgYW5kIG1heSBydW4gaW50
byB0aGUgcmVzY3VlIHNoZWxsIGlmCj4gICByb290IGRldmljZSBpcyBub3QgZm91bmQuCj4KPiBX
ZSdsbCBydW4gaW50byB0aGUgaXNzdWVzIG1vcmUgb2Z0ZW4gaW4gbGludXhib290IHNpbmNlIHRo
ZSBpbml0IHRhc2tzCj4gaXMgbW9yZSBzaW1wbGVyICh1c3VhbGx5IHUtcm9vdCkgYW5kIHdpbGwg
Y2hlY2sgZm9yIHRoZSBjb25zb2xlL3Jvb3QKPiBkZXZpY2VzIG1vcmUgZWFybGllci4KPgo+IFNv
bHZlIHRoaXMgYnkgcHJvbW90ZSB0aGUgQVBMSUMgZHJpdmVyIHJlZ2lzdGVyIHN0YWdlIHRvIGNv
cmVfaW5pdGNhbGwKPiB3aGljaCBpcyBwcmlvciB0byB0aGUgQVBMSUMgZGV2aWNlIGNyZWF0aW9u
LiBTbyB0aGUgZGVwZW5kZW5jeSBmb3IKPiB0aGUgR1NJIGlzIG1ldCBlYXJsaWVyLiBUaGUga2V5
IHN5c3RlbSBkZXZpY2VzIGxpa2UgdHR5L1BDSSB3aWxsIGJlCj4gY3JlYXRlZCBlYXJsaWVyIHdo
ZW4gc2Nhbm5pbmcgQUNQSSBuYW1lc3BhY2UgaW4gYSBzeW5jaHJvbm91cyBtYW5uZXIKPiBhbmQg
d29uJ3QgYmUgcGFyYWxsZWwgd2l0aCB0aGUgaW5pdCB0YXNrLiBTbyBpdCdzIGNlcnRhaW4gdG8g
aGF2ZQo+IGEgY29uc29sZS9yb290IGRldmljZSB3aGVuIHRoZSBpbml0IHRhc2sgcnVubmluZy4K
CkNoYW5naW5nIHRoZSBkcml2ZXIgcmVnaXN0cmF0aW9uIHByaW9yaXR5IGlzIG5vdCBnb2luZyB0
byBoZWxwLiBGb3IgRFQsCndlIHNob3VsZCByZWx5IG9uIGZ3X2RldmxpbmsgdG8gZW5zdXJlIEFQ
TElDIGlzIHByb2JlZCBiZWZvcmUKZHJpdmVycyBjb25zdW1pbmcgQVBMSUMgaW50ZXJydXB0cy4g
Rm9yIEFDUEkgaW4gdGhlIFJJU0MtViB3b3JsZCwKdGhlIEFQTElDIHByb2JlIG9yZGVyaW5nIHVz
aW5nIEdTSSBtYXBwaW5ncyBhbmQgX0RFUCBvYmplY3RzLgoKVGhlcmUgd2FzIGEgcmVjZW50IGRp
c2N1c3Npb24gb24gdGhpcyBzbyByZWZlcjoKaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMv
a2VybmVsL21zZzU5Mzg4MTYuaHRtbAoKUmVnYXJkcywKQW51cAoKPgo+IFNpZ25lZC1vZmYtYnk6
IFlpY29uZyBZYW5nIDx5YW5nLnlpY29uZ0BwaWNvaGVhcnQuY29tPgo+IC0tLQo+ICBkcml2ZXJz
L2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLW1haW4uYyB8IDE0ICsrKysrKysrKysrKystCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1tYWluLmMgYi9kcml2ZXJzL2ly
cWNoaXAvaXJxLXJpc2N2LWFwbGljLW1haW4uYwo+IGluZGV4IDkzZTdjNTFmOTQ0YS4uODZhM2Qx
OWI2YjI0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbWFp
bi5jCj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1tYWluLmMKPiBAQCAt
MjMxLDQgKzIzMSwxNiBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBhcGxpY19kcml2
ZXIgPSB7Cj4gICAgICAgICB9LAo+ICAgICAgICAgLnByb2JlID0gYXBsaWNfcHJvYmUsCj4gIH07
Cj4gLWJ1aWx0aW5fcGxhdGZvcm1fZHJpdmVyKGFwbGljX2RyaXZlcik7Cj4gKwo+ICtzdGF0aWMg
aW50IF9faW5pdCBhcGxpY19kcml2ZXJfaW5pdCh2b2lkKQo+ICt7Cj4gKyAgICAgICByZXR1cm4g
cGxhdGZvcm1fZHJpdmVyX3JlZ2lzdGVyKCZhcGxpY19kcml2ZXIpOwo+ICt9Cj4gKwo+ICsvKgo+
ICsgKiBBUExJQyBzZXJ2ZXMgcGFydCBvZiBHU0kgaW50ZXJydXB0cyBhbmQgc29tZSBrZXkgc3lz
dGVtIGRldmljZXMgbGlrZQo+ICsgKiBUVFkvUENJIGRlcGVuZHMgb24gaXRzIGluaXRpYWxpemF0
aW9uLiBSZWdpc3RlciB0aGUgZHJpdmVyIHByaW9yIHRvCj4gKyAqIEFQTElDIGRldmljZSAob24g
QUNQSSBpdCdzIGNyZWF0ZWQgaW4gc3Vic3lzX2luaXRjYWxsIHdoZW4gc2Nhbm5pbmcKPiArICog
dGhlIG5hbWVzcGFjZSBkZXZpY2VzKSB0byBtYWtlIHRoZSBHU0kgc2VydmljZSByZWFkeSBlYXJs
eS4KPiArICovCj4gK2NvcmVfaW5pdGNhbGwoYXBsaWNfZHJpdmVyX2luaXQpOwo+IC0tCj4gMi4z
NC4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
