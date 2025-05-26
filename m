Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEB6C54FB3
	for <linux-riscv@archiver.kernel.org>; Mon, 26 May 2025 20:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZL6Qh7iFIBY5PhC5m0K6JogTrNgB9jS+9d+8LFAvI8w=; b=vDkW52RI6ZMZLk
	Y67A00hkqUZ7XiObJivZZUhXrj90zQl1V6XYdZNILazSTGZYpqRrU9Ckc4kDDNl32WDWIVLkyBk33
	J4U5zRbpMNeqN1kqSlk6105CJBzmg2iQlBIcOvVnUKjOfWw5ybdiVFO410ECYZ5TRjAo5IH+lD0wg
	oMVt6rPK0R2Z9DwZLtSqgPl3uv4yOC9Zt41VGNGCSkQLoUBZ/ZiJr1sm0AjmPkgUxjsHGr+tGYtay
	0TdjUe1tv2wljyaYYaF+P3W2WSezmivhH3QY5E35FUFT2vJoKH6Ql7HVZ78u2ImAxKqi4MYdQPy1R
	LUK3cPmdnHCFFd+8SAPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJeMH-00000009Tdf-3gqH;
	Mon, 26 May 2025 20:23:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJeLH-00000009TZN-39je
	for linux-riscv@lists.infradead.org;
	Mon, 26 May 2025 20:22:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748290958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xMGaQapG6+nm97TfKW/OCSgmi2X3lyhE0Z44n/TtsM0=;
	b=YUdeQPeHKYgFg9TJtBM3bm/fuqzVYvfMKjly7cNBhEsvKCH1EqesAZ7P6Pqz4gcmWdeSId
	yfSB/FYdjOZO+pQOqQgspGAlwYQdfG5bW6J+u24/Uf116CeM9FSy4JXHSqADAufg8oBBma
	sW7HS28bXi3CLy/4R7MpD5RCTj8HJSs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-NAJAZQpaNeae_SR53-26vA-1; Mon, 26 May 2025 16:22:37 -0400
X-MC-Unique: NAJAZQpaNeae_SR53-26vA-1
X-Mimecast-MFC-AGG-ID: NAJAZQpaNeae_SR53-26vA_1748290956
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4cfda0ab8so793851f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 26 May 2025 13:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748290956; x=1748895756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMGaQapG6+nm97TfKW/OCSgmi2X3lyhE0Z44n/TtsM0=;
        b=chMrHjKxRk7CmsddfENryT0vmr35vJskeEDavLqN1IglfTJEySn+m7a2ngeR/7TV/U
         ORRnBHIMTaHVHVHcU+/2H+kf225ZutBkyDR4xWmvQFwb6BpJhsLiBmYgepglNZTzmiX+
         nZmHjBCwmRqdHNWa1gLUOKHLE9THzlqQVPKSBZ7o2bxJ9ZOFhyEX7apCBpzWL133dR5x
         16UKvPpLMjw/Jozy+3t7SwWW9AlMTJfwHkKIG92iw++ldjxbC0no3iO8RrPYsKZXOSO4
         cdHBGgj4dvU282F5JYNDhNi5XsIbS9j4Ttb65Z2BEMsTHfnKxlMWmfAF1BBvHcaO5oyY
         xpGg==
X-Forwarded-Encrypted: i=1; AJvYcCULEulYPIRab3/HtBbWK2hoT0n4+zR6U9U757Rs26Lvn8p1Ipt0o9DaJU4p6OWpUGheJEdI/7TLJVIcCA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9RP2M7UqJ0u90zHPd+BvgfI7xjqhZlaRU24GSC93oumifC2N9
	DAIbf2ELBtP43YZaVnkD4ohcI9sFvG7O6/Y9ViZ3WYUs797dnE5xorlP3rkQlzaYty7AMWG8Khi
	DjPsAWw+dxRfjPrYJwm6jMJABtgpAouNn3Gi3Zx+pbKMMSoijiWduqqvCy9xIGJU6peyVX0d6LP
	Eg0ZEi9e0dFHyTo5nweAB0Lp+Cf0QGaEdo1xdXeL+aQZjf
X-Gm-Gg: ASbGncsaOmazi79BaG55uJHtEnBgz4hcaWZIygX6TRKPLYnzdao4L4RNI15tkphN1lz
	VQ6whbpaIV7ybWd6MqUHfDT3WTG0Rjdz2bBTvTqd/SijFsN5GkMfYNGpZeteUqSI+RJE=
X-Received: by 2002:a05:6000:1814:b0:3a4:cb8e:d118 with SMTP id ffacd0b85a97d-3a4cb8ed307mr6669841f8f.24.1748290956043;
        Mon, 26 May 2025 13:22:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDiymxARCDcZPCHxy/Xz46jJP275t8/OtIIOm6ZkqfxnurlcmDMDRRtdCzNxlU2TSGevwUXa1uw0tO3yKwJTQ=
X-Received: by 2002:a05:6000:1814:b0:3a4:cb8e:d118 with SMTP id
 ffacd0b85a97d-3a4cb8ed307mr6669831f8f.24.1748290955743; Mon, 26 May 2025
 13:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy0H6GEBaY1NfCyF5O1PsHAmuxgW4mQyoC47bVFmMjqk-Q@mail.gmail.com>
In-Reply-To: <CAAhSdy0H6GEBaY1NfCyF5O1PsHAmuxgW4mQyoC47bVFmMjqk-Q@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 26 May 2025 22:22:24 +0200
X-Gm-Features: AX0GCFuO9oYQV6T3lK7DsSjx0oOC2d8-4m0DKglynmA2n2l4ofByHtcVbnPU7QQ
Message-ID: <CABgObfa0P5gnNoqsh6d-Bg8s5otJxVK-5MHH4O47Z2k2WZL-8Q@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.16
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DpdjAZx8wJ_8TH8n3iuTAidjcIf21yR1L7L3CPEqyTY_1748290956
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_132239_853495_A7201DE7 
X-CRM114-Status: GOOD (  17.13  )
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

T24gU2F0LCBNYXkgMjQsIDIwMjUgYXQgNjo1M+KAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4KPiBXZSBoYXZlIHRoZSBmb2xsb3dpbmcg
S1ZNIFJJU0MtViBjaGFuZ2VzIGZvciA2LjE2Ogo+IDEpIEFkZCB2ZWN0b3IgcmVnaXN0ZXJzIHRv
IGdldC1yZWctbGlzdCBzZWxmdGVzdAo+IDIpIFZDUFUgcmVzZXQgcmVsYXRlZCBpbXByb3ZlbWVu
dHMKPiAzKSBSZW1vdmUgc2NvdW50ZXJlbiBpbml0aWFsaXphdGlvbiBmcm9tIFZDUFUgcmVzZXQK
PiA0KSBTdXBwb3J0IFZDUFUgcmVzZXQgZnJvbSB1c2Vyc3BhY2UgdXNpbmcgc2V0X21wc3RhdGUo
KSBpb2N0bAo+ICAgICAoTk9URTogd2UgaGF2ZSByZS11c2VkIEtWTV9NUF9TVEFURV9JTklUX1JF
Q0VJVkVECj4gICAgICBmb3IgdGhpcyBwdXJwb3NlIHNpbmNlIGl0IGlzIGEgdGVtcG9yYXJ5IHN0
YXRlLiBUaGlzIHdheSBvZgo+ICAgICAgVkNQVSByZXNldCBvbmx5IHJlc2V0cyB0aGUgcmVnaXN0
ZXIgc3RhdGUgYW5kIGRvZXMgbm90Cj4gICAgICBhZmZlY3QgdGhlIGFjdHVhbCBWQ1BVIE1QX1NU
QVRFLiBUaGlzIG5ldyBtZWNoYW5pc20KPiAgICAgIG9mIFZDUFUgcmVzZXQgY2FuIGJlIHVzZWQg
YnkgS1ZNIHVzZXIgc3BhY2UgdXBvbgo+ICAgICAgU0JJIHN5c3RlbSByZXNldCB0byByZXNldCB0
aGUgcmVnaXN0ZXIgc3RhdGUgb2YgdGhlIFZDUFUKPiAgICAgIGluaXRpYXRpbmcgU0JJIHN5c3Rl
bSByZXNldC4gKQoKUHVsbGVkLCB0aGFua3MuIE5vdGUgdGhhdCBLVk1fQ0FQX1JJU0NWX01QX1NU
QVRFX1JFU0VUIGlzIDI0MiBkdWUgdG8KY29uZmxpY3RzIHdpdGgga3ZtLWFybSdzIGFzc2lnbm1l
bnQgb2YgY2FwYWJpbGl0eSBudW1iZXJzLgoKUGFvbG8KCj4gUGxlYXNlIHB1bGwuCj4KPiBSZWdh
cmRzLAo+IEFudXAKPgo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgODdlYzdk
NTI0OWJiOGViZjQwMjYxNDIwZGEwNjlmYTIzOGMyMTc4OToKPgo+ICAgS1ZNOiBSSVNDLVY6IHJl
c2V0IHNtc3RhdGVlbiBDU1JzICgyMDI1LTA1LTAxIDE4OjI2OjE0ICswNTMwKQo+Cj4gYXJlIGF2
YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4KPiAgIGh0dHBzOi8vZ2l0aHViLmNv
bS9rdm0tcmlzY3YvbGludXguZ2l0IHRhZ3Mva3ZtLXJpc2N2LTYuMTYtMQo+Cj4gZm9yIHlvdSB0
byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDc5MTdiZTE3MDkyODE4OWZlZmFkNDkwZDFhMTIzN2ZkZmE2
Yjg1NmY6Cj4KPiAgIFJJU0MtVjogS1ZNOiBsb2NrIHRoZSBjb3JyZWN0IG1wX3N0YXRlIGR1cmlu
ZyByZXNldCAoMjAyNS0wNS0yNAo+IDIxOjMwOjQ3ICswNTMwKQo+Cj4gLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IEtWTS9y
aXNjdiBjaGFuZ2VzIGZvciA2LjE2Cj4KPiAtIEFkZCB2ZWN0b3IgcmVnaXN0ZXJzIHRvIGdldC1y
ZWctbGlzdCBzZWxmdGVzdAo+IC0gVkNQVSByZXNldCByZWxhdGVkIGltcHJvdmVtZW50cwo+IC0g
UmVtb3ZlIHNjb3VudGVyZW4gaW5pdGlhbGl6YXRpb24gZnJvbSBWQ1BVIHJlc2V0Cj4gLSBTdXBw
b3J0IFZDUFUgcmVzZXQgZnJvbSB1c2Vyc3BhY2UgdXNpbmcgc2V0X21wc3RhdGUoKSBpb2N0bAo+
Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+IEF0aXNoIFBhdHJhICg1KToKPiAgICAgICBLVk06IHJpc2N2OiBzZWxmdGVz
dHM6IEFsaWduIHRoZSB0cmFwIGluZm9ybWF0aW9uIHdpaHQgcHRfcmVncwo+ICAgICAgIEtWTTog
cmlzY3Y6IHNlbGZ0ZXN0czogRGVjb2RlIHN0dmFsIHRvIGlkZW50aWZ5IGV4YWN0IGV4Y2VwdGlv
biB0eXBlCj4gICAgICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgdmVjdG9yIGV4dGVuc2lv
biB0ZXN0cwo+ICAgICAgIFJJU0MtVjogS1ZNOiBSZW1vdmUgZXhwZXJpbWVudGFsIHRhZyBmb3Ig
UklTQy1WCj4gICAgICAgUklTQy1WOiBLVk06IFJlbW92ZSBzY291bnRlcmVuIGluaXRpYWxpemF0
aW9uCj4KPiBSYWRpbSBLcsSNbcOhxZkgKDUpOgo+ICAgICAgIEtWTTogUklTQy1WOiByZWZhY3Rv
ciB2ZWN0b3Igc3RhdGUgcmVzZXQKPiAgICAgICBLVk06IFJJU0MtVjogcmVmYWN0b3Igc2JpIHJl
c2V0IHJlcXVlc3QKPiAgICAgICBLVk06IFJJU0MtVjogcmVtb3ZlIHVubmVjZXNzYXJ5IFNCSSBy
ZXNldCBzdGF0ZQo+ICAgICAgIFJJU0MtVjogS1ZNOiBhZGQgS1ZNX0NBUF9SSVNDVl9NUF9TVEFU
RV9SRVNFVAo+ICAgICAgIFJJU0MtVjogS1ZNOiBsb2NrIHRoZSBjb3JyZWN0IG1wX3N0YXRlIGR1
cmluZyByZXNldAo+Cj4gIERvY3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnJzdCAgICAgICAgICAg
ICAgICAgICAgIHwgIDExICsrCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2FpYS5oICAg
ICAgICAgICAgICAgICAgIHwgICAzIC0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9z
dC5oICAgICAgICAgICAgICAgICAgfCAgMTcgKystCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
a3ZtX3ZjcHVfc2JpLmggICAgICAgICAgICAgIHwgICAzICsKPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9rdm1fdmNwdV92ZWN0b3IuaCAgICAgICAgICAgfCAgIDYgKy0KPiAgYXJjaC9yaXNjdi9r
ZXJuZWwvaGVhZC5TICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTAgKysKPiAgYXJjaC9y
aXNjdi9rdm0vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAg
YXJjaC9yaXNjdi9rdm0vYWlhX2RldmljZS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQg
Ky0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgNjQgKysrKystLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAzMiArKysrLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9oc20u
YyAgICAgICAgICAgICAgICAgICAgICB8ICAxMyArLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3Ni
aV9zeXN0ZW0uYyAgICAgICAgICAgICAgICAgICB8ICAxMCArLQo+ICBhcmNoL3Jpc2N2L2t2bS92
Y3B1X3ZlY3Rvci5jICAgICAgICAgICAgICAgICAgICAgICB8ICAxMyArLQo+ICBhcmNoL3Jpc2N2
L2t2bS92bS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMyArKwo+ICBpbmNs
dWRlL3VhcGkvbGludXgva3ZtLmggICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4g
IC4uLi9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmggICAgICAgIHwgIDIz
ICsrKy0KPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9oYW5kbGVycy5T
ICAgfCAxMzkgKysrKysrKysrKystLS0tLS0tLS0tCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2t2bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMgIHwgICAyICstCj4gIHRvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9yaXNjdi9hcmNoX3RpbWVyLmMgICAgIHwgICAyICstCj4gIHRvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9lYnJlYWtfdGVzdC5jICAgIHwgICAyICstCj4gIHRvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyAgIHwgMTMyICsrKysr
KysrKysrKysrKysrKysKPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L3NiaV9w
bXVfdGVzdC5jICAgfCAgMjQgKysrLQo+ICAyMiBmaWxlcyBjaGFuZ2VkLCAzNzQgaW5zZXJ0aW9u
cygrKSwgMTUyIGRlbGV0aW9ucygtKQo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
