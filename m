Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7C4C27C4F
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jun 2024 13:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oN44kJf6XSn2aDRGL14L0UKCGSY+/nwPRUI29Dp6QKo=; b=wz0B2bmYMHoU2v
	cNODexy4BffRozGFE5nNk+Za2FkLdIuPwl4XH/MG/fpfY21FO19SY5D6Ma/Od7kv1w6vcGhy87fT5
	96fXdi8+rY2oYvfrw9ginZlcDJx6p6ooifZu7TjJ38TAE1gfzU1CQeyDp228zoHaNpTN5IM2sAX6G
	BoAF6xu3ylnI3bi38U6jutSJMmrOsywY5iM/dtUe9WDJTyQE+bJRdrT8T5XTgIdjwTdgmhRYRzaQv
	rx0MaEngBzO3ZpSVUf7Db9B+EEreHCbS71WErseNqLc8rrzEfDbIQLvO+ZZ4m9eNgdozq1iOUh7S9
	Mv2IfTuemH0+FqxaaPqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNXpv-0000000GQrP-2h0N;
	Sat, 29 Jun 2024 13:09:51 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNXps-0000000GQqU-0z6U
	for linux-riscv@lists.infradead.org;
	Sat, 29 Jun 2024 13:09:50 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4255fc43f1cso10795925e9.0
        for <linux-riscv@lists.infradead.org>; Sat, 29 Jun 2024 06:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1719666586; x=1720271386; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBPHRag8qAvETotyyrYSH4FuLSJO/hkfmF+D7/kiato=;
        b=jbUwgTcJRNA31dbhiDggZtiseMyhVEHs05LcGu2OcEkZTNpOMiEB4PLIxEjH2w8rZ1
         lvXV0ZayeMuGTlGRlT292mn5SJPZCPGe3BpN4HtfUPD2uqfIacvQbj+kW5uAXlw/dtHQ
         cDDnw8bZvA4Bguv1VMe5UPoNqKQTqJrs0VQRMpGIz8h1Eh9xAwSc5dzTXrCCSLIpDiT6
         VGIGAIufj3qStE9F7m9OxU7N5TiP6ftPuUlPuc27Ev2z39GrTlCX0D7iq5/+f4r4L6G9
         UQmKmhG5qCtOw1SPSUiwTkrqHECHxrVIgmELrWxmf5+JE/SIDMm1MzCmKL1s+AdVuxyJ
         xvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719666586; x=1720271386;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBPHRag8qAvETotyyrYSH4FuLSJO/hkfmF+D7/kiato=;
        b=vN6GJuMtx8qAXXRYXPXNmyJotvRfa7eFrXC8wWHOQWHjLbJZwmrbPjBhmv5xznBFge
         j0N3iUuakdomzcGtT9jqDocnl+hC7/5qYnddt9PgNC+fSrgCkHmnZoR/P9XqgB9xp3QZ
         juCUEIidD4n5B46kxA9nG0nPnaZy0fDZPcimqvKF3IyFNmCYaF9oqhsXqFY3oQwCeIlo
         oRcqh8+5QFEUaipQ/CoatTsAYew+vWAlKgnB1kvnssbz7MZY9SjByIORbQPNtryr/QLr
         jXtQzToW3jhAdvygNuUsPHAGDBNKK6HI+TELnfhyX7bKfGotMe+9DSKBY0eYxS78P6qK
         CR0g==
X-Forwarded-Encrypted: i=1; AJvYcCVig5GGYbmkRN0uRmxhnik9WHZ38AUL3kxGAP6wVDDBqP5TNRqc3zjfK3/js1X9SkGkl7rmR2XnRaOlCruQDw1NtElsmcDDg1r50Xy/2XNS
X-Gm-Message-State: AOJu0Yx4i0zDd/XqHksNEtBgQkShfTnSz5ITVNhtl0O6tntMRbtNCk2O
	IBpVbKajs/p3zAbXt5CouatxmAthCV65V1Ws4RtB1EvEyqv5G8RWp2DQUGzhzTc=
X-Google-Smtp-Source: AGHT+IEKNKvTpdSb4CrQTKZ+nBdE/Hft6em8KkuURlNseRT5rthITeiMfEC+Py4YC1wcYfQMxgbr6w==
X-Received: by 2002:a05:600c:3595:b0:425:5e8b:679f with SMTP id 5b1f17b1804b1-4257a02d4ddmr7277755e9.6.1719666585438;
        Sat, 29 Jun 2024 06:09:45 -0700 (PDT)
Received: from smtpclient.apple ([84.207.206.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b0cee27sm76231655e9.48.2024.06.29.06.09.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Jun 2024 06:09:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH v6 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20240628-clamp-vineyard-c7cdd40a6d50@spud>
Date: Sat, 29 Jun 2024 14:09:34 +0100
Cc: Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org,
 Greentime Hu <greentime.hu@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Message-Id: <402C3422-0248-4C0F-991E-C0C4BBB0FA72@jrtc27.com>
References: <20240628093711.11716-1-yongxuan.wang@sifive.com>
 <20240628093711.11716-3-yongxuan.wang@sifive.com>
 <20240628-clamp-vineyard-c7cdd40a6d50@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240629_060948_332612_BF38D242 
X-CRM114-Status: GOOD (  20.17  )
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

T24gMjggSnVuIDIwMjQsIGF0IDE3OjE5LCBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+
IHdyb3RlOgo+IAo+IE9uIEZyaSwgSnVuIDI4LCAyMDI0IGF0IDA1OjM3OjA2UE0gKzA4MDAsIFlv
bmctWHVhbiBXYW5nIHdyb3RlOgo+PiBBZGQgZW50cmllcyBmb3IgdGhlIFN2YWRlIGFuZCBTdmFk
dSBleHRlbnNpb25zIHRvIHRoZSByaXNjdixpc2EtZXh0ZW5zaW9ucwo+PiBwcm9wZXJ0eS4KPj4g
Cj4+IFNpZ25lZC1vZmYtYnk6IFlvbmctWHVhbiBXYW5nIDx5b25neHVhbi53YW5nQHNpZml2ZS5j
b20+Cj4+IC0tLQo+PiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlh
bWwgfCAyOCArKysrKysrKysrKysrKysrKysrCj4+IDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRp
b25zKCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPj4gaW5kZXggNDY4YzY0NjI0N2FhLi5jM2QwNTNj
ZTc3ODMgMTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
aXNjdi9leHRlbnNpb25zLnlhbWwKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+PiBAQCAtMTUzLDYgKzE1MywzNCBAQCBwcm9w
ZXJ0aWVzOgo+PiAgICAgICAgICAgICByYXRpZmllZCBhdCBjb21taXQgM2Y5ZWQzNCAoIkFkZCBh
YmlsaXR5IHRvIG1hbnVhbGx5IHRyaWdnZXIKPj4gICAgICAgICAgICAgd29ya2Zsb3cuICgjMiki
KSBvZiByaXNjdi10aW1lLWNvbXBhcmUuCj4+IAo+PiArICAgICAgICAtIGNvbnN0OiBzdmFkZQo+
PiArICAgICAgICAgIGRlc2NyaXB0aW9uOiB8Cj4+ICsgICAgICAgICAgICBUaGUgc3RhbmRhcmQg
U3ZhZGUgc3VwZXJ2aXNvci1sZXZlbCBleHRlbnNpb24gZm9yIFNXLW1hbmFnZWQgUFRFIEEvRAo+
PiArICAgICAgICAgICAgYml0IHVwZGF0ZXMgYXMgcmF0aWZpZWQgaW4gdGhlIDIwMjQwMjEzIHZl
cnNpb24gb2YgdGhlIHByaXZpbGVnZWQKPj4gKyAgICAgICAgICAgIElTQSBzcGVjaWZpY2F0aW9u
Lgo+PiArCj4+ICsgICAgICAgICAgICBCb3RoIFN2YWRlIGFuZCBTdmFkdSBleHRlbnNpb25zIGNv
bnRyb2wgdGhlIGhhcmR3YXJlIGJlaGF2aW9yIHdoZW4KPj4gKyAgICAgICAgICAgIHRoZSBQVEUg
QS9EIGJpdHMgbmVlZCB0byBiZSBzZXQuIFRoZSBkZWZhdWx0IGJlaGF2aW9yIGZvciB0aGUgZm91
cgo+PiArICAgICAgICAgICAgcG9zc2libGUgY29tYmluYXRpb25zIG9mIHRoZXNlIGV4dGVuc2lv
bnMgaW4gdGhlIGRldmljZSB0cmVlIGFyZToKPj4gKyAgICAgICAgICAgIDEpIE5laXRoZXIgU3Zh
ZGUgbm9yIFN2YWR1IHByZXNlbnQgaW4gRFQgPT4KPiAKPj4gICAgICAgICAgICAgICAgSXQgaXMg
dGVjaG5pY2FsbHkKPj4gKyAgICAgICAgICAgICAgIHVua25vd24gd2hldGhlciB0aGUgcGxhdGZv
cm0gdXNlcyBTdmFkZSBvciBTdmFkdS4gU3VwZXJ2aXNvciBtYXkKPj4gKyAgICAgICAgICAgICAg
IGFzc3VtZSBTdmFkZSB0byBiZSBwcmVzZW50IGFuZCBlbmFibGVkIG9yIGl0IGNhbiBkaXNjb3Zl
ciBiYXNlZAo+PiArICAgICAgICAgICAgICAgb24gbXZlbmRvcmlkLCBtYXJjaGlkLCBhbmQgbWlt
cGlkLgo+IAo+IEkgd291bGQganVzdCB3cml0ZSAiZm9yIGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5
LCBpZiBuZWl0aGVyIFN2YWRlIG5vcgo+IFN2YWR1IGFwcGVhciBpbiB0aGUgZGV2aWNldHJlZSB0
aGUgc3VwZXJ2aXNvciBtYXkgYXNzdW1lIFN2YWRlIHRvIGJlCj4gcHJlc2VudCBhbmQgZW5hYmxl
ZCIuIElmIHRoZXJlIGFyZSBzeXN0ZW1zIHRoYXQgdGhpcyBiZWhhdmlvdXIgY2F1c2VzCj4gcHJv
YmxlbXMgZm9yLCB3ZSBjYW4gZGVhbCB3aXRoIHRoZW0gaWZmIHRoZXkgYXBwZWFyLiBJIGRvbid0
IHRoaW5rCj4gbG9va2luZyBhdCBtKmlkIHdvdWxkIGJlIHN1ZmZpY2llbnQgaGVyZSBhbnl3YXks
IHNpbmNlIHRoZSBmaXJtd2FyZSBjYW4KPiBoYXZlIGFuIGltcGFjdC4gSSdkIGp1c3QgZHJvcCB0
aGF0IHBhcnQgZW50aXJlbHkuCgpPbGRlciBRRU1VIGZhbGxzIGludG8gdGhhdCBjYXRlZ29yeSwg
YXMgZG8gQmx1ZXNwZWPigJlzIHNvZnQtY29yZXMgKHdoaWNoCm91cnMgYXJlIGRlcml2ZWQgZnJv
bSBhdCBDYW1icmlkZ2UpLiBJIGZlZWwgdGhhdCwgaW4gcmVhbGl0eSwgb25lCnNob3VsZCBiZSBw
cmVwYXJlZCB0byBoYW5kbGUgYm90aCB0cmFwcGluZyBhbmQgYXRvbWljIHVwZGF0ZXMgaWYKd3Jp
dGluZyBhbiBPUyB0aGF0IGFpbXMgdG8gc3VwcG9ydCBjYXNlIDEuCgpKZXNzCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
