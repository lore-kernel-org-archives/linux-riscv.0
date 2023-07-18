Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A19BC0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 05:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WYtGMbFO/x9w4xePwGzBM+SePGlBuxZCgZbHTmcv52s=; b=XgS4z24BXKC6WZ
	bXlRxWLbbYx8CgUM3iP9w0RC9Hpp7EIBwbtPJ+toYWP9C68rQkoXPsyCaZqW4WY3/vRp54+jLgmFd
	BXIT8BzVnxNIWuOCkhGM7qDFHUYt1ezNt0t1nPT0oih/PbMYcEIwQKq4F1ZTA86IuUFb9Dd3AXlvx
	vHRrGvKZGSP96EhiKdUjXaQATp94J32RRnYAMQ7D2GjbQixJ8nFX17mnbRvzEzoc1K6JpzvTsogsf
	mJxv3NtJoUCVjco5on/muw1YZwdDGCCbDduXEV7fvg+V9kmEKIY8asCBzIgry5q9/GDTbyGLOJ30j
	AKoGNlFtw4UFWMxHJSIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0BI-005TLd-2A;
	Wed, 19 Jul 2023 05:57:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0BC-005TGP-37
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:56:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FOUt0ycfIIC4G92ZHk96f3py83XofJ3hc7BWl3IwSXo=; b=MGlP/Pi8qpSV/p6H+ocMzDw6WI
	PshRFgSM0E3twPnx814jSRRelYN4naHy7uYka+rjmN2si4QRA2SN2P6Qc0kx190rgsUvlbZ8KhpdT
	m8KbyxCIcavEOr3EqRakXMADiNvpL+FtXxUIsGObfMA8044/DBIOvDbThQqeHd9aqd5r4gz+dA+jB
	S44wYuH51oDnVez9zi8BFrARUfh96k71r4+LoG2ftZNFKwOo0Hd67GpB2bpITZ/+Yu+d+aVtcmhYa
	6678SMykEwWN/aAQBCII2MCosoVcXJWNsQxm8HqshpTVIz7xTbhxJSLCDDJ/sQnFZA6xzFPcOfygO
	aBEggrYg==;
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLnd1-00Bl6Y-0N
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 16:32:50 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-345bc4a438fso141245ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 09:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689697893; x=1690302693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOUt0ycfIIC4G92ZHk96f3py83XofJ3hc7BWl3IwSXo=;
        b=70EYw8mQUne1cNpTuVS0kMr31zvHYUt7jMEY5WFkQMZBfCcJIiLIETbDzK0JXOJ4Nb
         o7zLGOeq5Y4Kcl59mMGBHYDHb1N2qivCEsecXmwhGzqyIktQtxxQgfZa0nuVzldc1mYK
         1YVDEGGtjV910sPWe+g+ml5wvq3TqGoCYgLeILNgyRlGhe6eJ3lIRsm7QrAHqbIc16iO
         xXQvaTZ84vTOaqA9NUMCMXvrhEiThuuMWZhAGrbCWnGHX7sDiEk0cnpqvdzZUB4ghQGY
         QtT89zT9eN26NqxZPsW6fDAu67sawQDnR4GVx8BwBSuTs2HltUcGsgtm53Amj8OI093n
         dK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689697893; x=1690302693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOUt0ycfIIC4G92ZHk96f3py83XofJ3hc7BWl3IwSXo=;
        b=EDpqjR65crAK6Eo2TbzShcb+6pzpXxtx7V9WrHk9rbmp1NYpz2ShaEhmHfgeXHp1nW
         9DXTbV4qMukeqLNfmUIfEPhbrA5xTunEjx7Ji4Z/1ogiDqm9m3V6+WS9jtNgxJ8oIJsN
         hoQxonez70GXEh2uRe1SHWZc7NZ48ZIZCgduWMhJnOX8UEgcKrSmSNH/N/XHb2g+l58S
         zP6yI4a5wq2ds0gquOL/tsfBdGmlR6dH411qiGBK5o5PQioiwcD8qlQfvabri24XbOsj
         gvS4dr3g/GShhxjYYN0xgF5DPZXZ8pczXSP+ApuQn1KMtwITrKEz7beDhzYis4BBxtK/
         6mUw==
X-Gm-Message-State: ABy/qLZXB0H96pRtEq7tpf95erhCbtDigGqD0pfq6gXdbrtzgTAfDgVx
	N16GK9gAF43C6HXsiJSdPWYzHJQn1v6hPN9feR82Bw==
X-Google-Smtp-Source: APBJJlFqQdwopGyRSQ6vPehJzW/apQ8j3vOGXsWwGhXT5m1KRrmjOL5Jyef2j1KLskn4+6D/a0FXbZ81TqZtnje6akU=
X-Received: by 2002:a05:6e02:1a0b:b0:33c:a46c:23b3 with SMTP id
 s11-20020a056e021a0b00b0033ca46c23b3mr252894ild.1.1689697893605; Tue, 18 Jul
 2023 09:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230715005405.3689586-1-rananta@google.com> <20230715005405.3689586-4-rananta@google.com>
 <199d18de-1214-7683-b87a-03cc7e49719a@redhat.com> <CAJHc60zhVco3uTq97vDHMk8cgg1psPtwHT6MN1eKP1Yr18d9cw@mail.gmail.com>
 <fb52139b-5854-6370-7de3-bd87b31e3148@redhat.com>
In-Reply-To: <fb52139b-5854-6370-7de3-bd87b31e3148@redhat.com>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Tue, 18 Jul 2023 09:31:20 -0700
Message-ID: <CAJHc60yYUYnPxdC3PAM_bcd4w2JpMvZFJ6R3mQWXjqt3YMQgUg@mail.gmail.com>
Subject: Re: [PATCH v6 03/11] KVM: Allow range-based TLB invalidation from
 common code
To: Shaoqin Huang <shahuang@redhat.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Gavin Shan <gshan@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_173247_352532_52A07BF6 
X-CRM114-Status: GOOD (  24.48  )
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

SGkgU2hhb3FpbiwKCk9uIE1vbiwgSnVsIDE3LCAyMDIzIGF0IDc6NDnigK9QTSBTaGFvcWluIEh1
YW5nIDxzaGFodWFuZ0ByZWRoYXQuY29tPiB3cm90ZToKPgo+Cj4KPiBPbiA3LzE4LzIzIDAwOjM3
LCBSYWdoYXZlbmRyYSBSYW8gQW5hbnRhIHdyb3RlOgo+ID4gT24gTW9uLCBKdWwgMTcsIDIwMjMg
YXQgNDo0MOKAr0FNIFNoYW9xaW4gSHVhbmcgPHNoYWh1YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+
ID4+Cj4gPj4KPiA+Pgo+ID4+IE9uIDcvMTUvMjMgMDg6NTMsIFJhZ2hhdmVuZHJhIFJhbyBBbmFu
dGEgd3JvdGU6Cj4gPj4+IEZyb206IERhdmlkIE1hdGxhY2sgPGRtYXRsYWNrQGdvb2dsZS5jb20+
Cj4gPj4+Cj4gPj4+IE1ha2Uga3ZtX2ZsdXNoX3JlbW90ZV90bGJzX3JhbmdlKCkgdmlzaWJsZSBp
biBjb21tb24gY29kZSBhbmQgY3JlYXRlIGEKPiA+Pj4gZGVmYXVsdCBpbXBsZW1lbnRhdGlvbiB0
aGF0IGp1c3QgaW52YWxpZGF0ZXMgdGhlIHdob2xlIFRMQi4KPiA+Pj4KPiA+Pj4gVGhpcyBwYXZl
cyB0aGUgd2F5IGZvciBzZXZlcmFsIGZ1dHVyZSBmZWF0dXJlcy9jbGVhbnVwczoKPiA+Pj4KPiA+
Pj4gICAgLSBJbnRyb2R1Y3Rpb24gb2YgcmFuZ2UtYmFzZWQgVExCSSBvbiBBUk0uCj4gPj4+ICAg
IC0gRWxpbWluYXRpbmcga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYnNfbWVtc2xvdCgpCj4gPj4+
ICAgIC0gTW92aW5nIHRoZSBLVk0veDg2IFREUCBNTVUgdG8gY29tbW9uIGNvZGUuCj4gPj4+Cj4g
Pj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+ID4+Pgo+ID4+PiBTaWduZWQtb2Zm
LWJ5OiBEYXZpZCBNYXRsYWNrIDxkbWF0bGFja0Bnb29nbGUuY29tPgo+ID4+PiBTaWduZWQtb2Zm
LWJ5OiBSYWdoYXZlbmRyYSBSYW8gQW5hbnRhIDxyYW5hbnRhQGdvb2dsZS5jb20+Cj4gPj4+IFJl
dmlld2VkLWJ5OiBHYXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPgo+ID4+PiAtLS0KPiA+Pj4g
ICAgYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCB8ICAzICsrKwo+ID4+PiAgICBhcmNo
L3g4Ni9rdm0vbW11L21tdS5jICAgICAgICAgIHwgIDkgKysrKy0tLS0tCj4gPj4+ICAgIGFyY2gv
eDg2L2t2bS9tbXUvbW11X2ludGVybmFsLmggfCAgMyAtLS0KPiA+Pj4gICAgaW5jbHVkZS9saW51
eC9rdm1faG9zdC5oICAgICAgICB8ICA5ICsrKysrKysrKwo+ID4+PiAgICB2aXJ0L2t2bS9rdm1f
bWFpbi5jICAgICAgICAgICAgIHwgMTMgKysrKysrKysrKysrKwo+ID4+PiAgICA1IGZpbGVzIGNo
YW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gPj4+Cj4gPj4+IGRpZmYg
LS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIGIvYXJjaC94ODYvaW5jbHVk
ZS9hc20va3ZtX2hvc3QuaAo+ID4+PiBpbmRleCBhMmQzY2ZjMmViNzUuLjA4OTAwYWZiZjJhZCAx
MDA2NDQKPiA+Pj4gLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+ID4+PiAr
KysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gPj4+IEBAIC0xODA0LDYgKzE4
MDQsOSBAQCBzdGF0aWMgaW5saW5lIGludCBrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxicyhzdHJ1
Y3Qga3ZtICprdm0pCj4gPj4+ICAgICAgICAgICAgICAgIHJldHVybiAtRU5PVFNVUFA7Cj4gPj4+
ICAgIH0KPiA+Pj4KPiA+Pj4gKyNkZWZpbmUgX19LVk1fSEFWRV9BUkNIX0ZMVVNIX1JFTU9URV9U
TEJTX1JBTkdFCj4gPj4+ICtpbnQga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2Uoc3Ry
dWN0IGt2bSAqa3ZtLCBnZm5fdCBzdGFydF9nZm4sIHU2NCBwYWdlcyk7Cj4gPj4+ICsKPiA+Pj4g
ICAgI2RlZmluZSBrdm1fYXJjaF9wbWlfaW5fZ3Vlc3QodmNwdSkgXAo+ID4+PiAgICAgICAgKCh2
Y3B1KSAmJiAodmNwdSktPmFyY2guaGFuZGxpbmdfaW50cl9mcm9tX2d1ZXN0KQo+ID4+Pgo+ID4+
PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL21tdS9tbXUuYyBiL2FyY2gveDg2L2t2bS9tbXUv
bW11LmMKPiA+Pj4gaW5kZXggZWMxNjlmNWM3ZGNlLi5hYWE1ZTMzNjcwM2EgMTAwNjQ0Cj4gPj4+
IC0tLSBhL2FyY2gveDg2L2t2bS9tbXUvbW11LmMKPiA+Pj4gKysrIGIvYXJjaC94ODYva3ZtL21t
dS9tbXUuYwo+ID4+PiBAQCAtMjc4LDE2ICsyNzgsMTUgQEAgc3RhdGljIGlubGluZSBib29sIGt2
bV9hdmFpbGFibGVfZmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2Uodm9pZCkKPiA+Pj4gICAgICAgIHJl
dHVybiBrdm1feDg2X29wcy5mbHVzaF9yZW1vdGVfdGxic19yYW5nZTsKPiA+Pj4gICAgfQo+ID4+
Pgo+ID4+PiAtdm9pZCBrdm1fZmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2Uoc3RydWN0IGt2bSAqa3Zt
LCBnZm5fdCBzdGFydF9nZm4sCj4gPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBn
Zm5fdCBucl9wYWdlcykKPiA+Pj4gK2ludCBrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxic19yYW5n
ZShzdHJ1Y3Qga3ZtICprdm0sIGdmbl90IHN0YXJ0X2dmbiwgdTY0IHBhZ2VzKQo+ID4+PiAgICB7
Cj4gPj4+ICAgICAgICBpbnQgcmV0ID0gLUVPUE5PVFNVUFA7Cj4gPj4+Cj4gPj4+ICAgICAgICBp
ZiAoa3ZtX3g4Nl9vcHMuZmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2UpCj4gPj4+ICAgICAgICAgICAg
ICAgIHJldCA9IHN0YXRpY19jYWxsKGt2bV94ODZfZmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2UpKGt2
bSwgc3RhcnRfZ2ZuLAo+ID4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5yX3BhZ2VzKTsKPiA+Pj4gLSAgICAgaWYgKHJl
dCkKPiA+Pj4gLSAgICAgICAgICAgICBrdm1fZmx1c2hfcmVtb3RlX3RsYnMoa3ZtKTsKPiA+Pj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBhZ2VzKTsKPiA+PiBUaGlzIHdpbGwgYmUgZ29vZCBpZiBwYXJhbWV0ZXIg
cGFnZXMgYWxpZ25lZCB3aXRoIHBhcmFtZXRlciBrdm0uCj4gPj4KPiA+IEFncmVlZCwgYnV0IHB1
bGxpbmcgJ3BhZ2VzJyBhYm92ZSBicmluZ3MgdGhlIGNoYXIgY291bnQgdG8gODMuIElmCj4gPiB0
aGF0J3MgYWNjZXB0YWJsZSwgSSdtIGhhcHB5IHRvIGRvIGl0IGluIHY3Lgo+ID4gSGkgUmFnaGF2
ZW5kcmEsCj4KPiBubyBuZWVkIHRvIHB1bGxpbmcgJ3BhZ2VzJyBhYm92ZSwganVzdCBkZWxldGUg
b25lIHRhYiwgYW5kIGFkZCBzb21lCj4gc3BhY2UgYmVmb3JlIHRoZSBwYWdlcywganVzdCBsaWtl
IHRoZSBvcmlnaW5hbCBgbnJfcGFnZXNgIHBvc2l0aW9uLgo+Ck9oIHllcywgdGhhdCBjYW4gYmUg
ZG9uZS4gVGhhbmtzIQoKLSBSYWdoYXZlbmRyYQo+IFRoYW5rcywKPiBTaGFvcWluCj4gPiBUaGFu
ayB5b3UuCj4gPiBSYWdoYXZlbmRyYQo+ID4+IFJldmlld2VkLWJ5OiBTaGFvcWluIEh1YW5nIDxz
aGFodWFuZ0ByZWRoYXQuY29tPgo+ID4+PiArCj4gPj4+ICsgICAgIHJldHVybiByZXQ7Cj4gPj4+
ICAgIH0KPiA+Pj4KPiA+Pj4gICAgc3RhdGljIGdmbl90IGt2bV9tbXVfcGFnZV9nZXRfZ2ZuKHN0
cnVjdCBrdm1fbW11X3BhZ2UgKnNwLCBpbnQgaW5kZXgpOwo+ID4+PiBkaWZmIC0tZ2l0IGEvYXJj
aC94ODYva3ZtL21tdS9tbXVfaW50ZXJuYWwuaCBiL2FyY2gveDg2L2t2bS9tbXUvbW11X2ludGVy
bmFsLmgKPiA+Pj4gaW5kZXggZDM5YWY1NjM5Y2U5Li44NmNiODNiYjM0ODAgMTAwNjQ0Cj4gPj4+
IC0tLSBhL2FyY2gveDg2L2t2bS9tbXUvbW11X2ludGVybmFsLmgKPiA+Pj4gKysrIGIvYXJjaC94
ODYva3ZtL21tdS9tbXVfaW50ZXJuYWwuaAo+ID4+PiBAQCAtMTcwLDkgKzE3MCw2IEBAIGJvb2wg
a3ZtX21tdV9zbG90X2dmbl93cml0ZV9wcm90ZWN0KHN0cnVjdCBrdm0gKmt2bSwKPiA+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpz
bG90LCB1NjQgZ2ZuLAo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlu
dCBtaW5fbGV2ZWwpOwo+ID4+Pgo+ID4+PiAtdm9pZCBrdm1fZmx1c2hfcmVtb3RlX3RsYnNfcmFu
Z2Uoc3RydWN0IGt2bSAqa3ZtLCBnZm5fdCBzdGFydF9nZm4sCj4gPj4+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBnZm5fdCBucl9wYWdlcyk7Cj4gPj4+IC0KPiA+Pj4gICAgLyogRmx1
c2ggdGhlIGdpdmVuIHBhZ2UgKGh1Z2Ugb3Igbm90KSBvZiBndWVzdCBtZW1vcnkuICovCj4gPj4+
ICAgIHN0YXRpYyBpbmxpbmUgdm9pZCBrdm1fZmx1c2hfcmVtb3RlX3RsYnNfZ2ZuKHN0cnVjdCBr
dm0gKmt2bSwgZ2ZuX3QgZ2ZuLCBpbnQgbGV2ZWwpCj4gPj4+ICAgIHsKPiA+Pj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaCBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAo+
ID4+PiBpbmRleCBlM2Y5NjhiMzhhZTkuLmE3MzE5NjdiMjRmZiAxMDA2NDQKPiA+Pj4gLS0tIGEv
aW5jbHVkZS9saW51eC9rdm1faG9zdC5oCj4gPj4+ICsrKyBiL2luY2x1ZGUvbGludXgva3ZtX2hv
c3QuaAo+ID4+PiBAQCAtMTM1OSw2ICsxMzU5LDcgQEAgaW50IGt2bV92Y3B1X3lpZWxkX3RvKHN0
cnVjdCBrdm1fdmNwdSAqdGFyZ2V0KTsKPiA+Pj4gICAgdm9pZCBrdm1fdmNwdV9vbl9zcGluKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgYm9vbCB5aWVsZF90b19rZXJuZWxfbW9kZSk7Cj4gPj4+Cj4g
Pj4+ICAgIHZvaWQga3ZtX2ZsdXNoX3JlbW90ZV90bGJzKHN0cnVjdCBrdm0gKmt2bSk7Cj4gPj4+
ICt2b2lkIGt2bV9mbHVzaF9yZW1vdGVfdGxic19yYW5nZShzdHJ1Y3Qga3ZtICprdm0sIGdmbl90
IGdmbiwgdTY0IHBhZ2VzKTsKPiA+Pj4KPiA+Pj4gICAgI2lmZGVmIEtWTV9BUkNIX05SX09CSlNf
UEVSX01FTU9SWV9DQUNIRQo+ID4+PiAgICBpbnQga3ZtX21tdV90b3B1cF9tZW1vcnlfY2FjaGUo
c3RydWN0IGt2bV9tbXVfbWVtb3J5X2NhY2hlICptYywgaW50IG1pbik7Cj4gPj4+IEBAIC0xNDg2
LDYgKzE0ODcsMTQgQEAgc3RhdGljIGlubGluZSBpbnQga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3Rs
YnMoc3RydWN0IGt2bSAqa3ZtKQo+ID4+PiAgICB9Cj4gPj4+ICAgICNlbmRpZgo+ID4+Pgo+ID4+
PiArI2lmbmRlZiBfX0tWTV9IQVZFX0FSQ0hfRkxVU0hfUkVNT1RFX1RMQlNfUkFOR0UKPiA+Pj4g
K3N0YXRpYyBpbmxpbmUgaW50IGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJzX3JhbmdlKHN0cnVj
dCBrdm0gKmt2bSwKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGdmbl90IGdmbiwgdTY0IHBhZ2VzKQo+ID4+PiArewo+ID4+PiArICAgICByZXR1
cm4gLUVPUE5PVFNVUFA7Cj4gPj4+ICt9Cj4gPj4+ICsjZW5kaWYKPiA+Pj4gKwo+ID4+PiAgICAj
aWZkZWYgX19LVk1fSEFWRV9BUkNIX05PTkNPSEVSRU5UX0RNQQo+ID4+PiAgICB2b2lkIGt2bV9h
cmNoX3JlZ2lzdGVyX25vbmNvaGVyZW50X2RtYShzdHJ1Y3Qga3ZtICprdm0pOwo+ID4+PiAgICB2
b2lkIGt2bV9hcmNoX3VucmVnaXN0ZXJfbm9uY29oZXJlbnRfZG1hKHN0cnVjdCBrdm0gKmt2bSk7
Cj4gPj4+IGRpZmYgLS1naXQgYS92aXJ0L2t2bS9rdm1fbWFpbi5jIGIvdmlydC9rdm0va3ZtX21h
aW4uYwo+ID4+PiBpbmRleCBkNmIwNTA3ODYxNTUuLjgwNDQ3MGZjY2FjNyAxMDA2NDQKPiA+Pj4g
LS0tIGEvdmlydC9rdm0va3ZtX21haW4uYwo+ID4+PiArKysgYi92aXJ0L2t2bS9rdm1fbWFpbi5j
Cj4gPj4+IEBAIC0zNjYsNiArMzY2LDE5IEBAIHZvaWQga3ZtX2ZsdXNoX3JlbW90ZV90bGJzKHN0
cnVjdCBrdm0gKmt2bSkKPiA+Pj4gICAgfQo+ID4+PiAgICBFWFBPUlRfU1lNQk9MX0dQTChrdm1f
Zmx1c2hfcmVtb3RlX3RsYnMpOwo+ID4+Pgo+ID4+PiArdm9pZCBrdm1fZmx1c2hfcmVtb3RlX3Rs
YnNfcmFuZ2Uoc3RydWN0IGt2bSAqa3ZtLCBnZm5fdCBnZm4sIHU2NCBwYWdlcykKPiA+Pj4gK3sK
PiA+Pj4gKyAgICAgaWYgKCFrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxic19yYW5nZShrdm0sIGdm
biwgcGFnZXMpKQo+ID4+PiArICAgICAgICAgICAgIHJldHVybjsKPiA+Pj4gKwo+ID4+PiArICAg
ICAvKgo+ID4+PiArICAgICAgKiBGYWxsIGJhY2sgdG8gYSBmbHVzaGluZyBlbnRpcmUgVExCcyBp
ZiB0aGUgYXJjaGl0ZWN0dXJlIHJhbmdlLWJhc2VkCj4gPj4+ICsgICAgICAqIFRMQiBpbnZhbGlk
YXRpb24gaXMgdW5zdXBwb3J0ZWQgb3IgY2FuJ3QgYmUgcGVyZm9ybWVkIGZvciB3aGF0ZXZlcgo+
ID4+PiArICAgICAgKiByZWFzb24uCj4gPj4+ICsgICAgICAqLwo+ID4+PiArICAgICBrdm1fZmx1
c2hfcmVtb3RlX3RsYnMoa3ZtKTsKPiA+Pj4gK30KPiA+Pj4gKwo+ID4+PiAgICBzdGF0aWMgdm9p
ZCBrdm1fZmx1c2hfc2hhZG93X2FsbChzdHJ1Y3Qga3ZtICprdm0pCj4gPj4+ICAgIHsKPiA+Pj4g
ICAgICAgIGt2bV9hcmNoX2ZsdXNoX3NoYWRvd19hbGwoa3ZtKTsKPiA+Pgo+ID4+IC0tCj4gPj4g
U2hhb3Fpbgo+ID4+Cj4gPgo+Cj4gLS0KPiBTaGFvcWluCj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
