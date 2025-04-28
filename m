Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BADEC36005
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 08:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tn+aRTaOd4gK4CgP26/Q4LluwvEaDl2or/qlTrxi7RI=; b=Gu7s07HXJRYK4E
	Fgy93cKvEVUeWWe6bR9DtodijS5uxSj10HnOCo/Bw+Nh+U81m/btFfRyXpv9YFv+TeultZW0HPkun
	3ur4/qzV4yhHZUX8cyxtO6skoCThmKeB5pbHD1lLAcuT/lpEs5z3tf3Jo8Q3Danlau4SKx1Ynt72j
	Bz2xoWhrgo5RCG1NYlg1livCptxcbxK0Trnz1KTcWpXOOpSCv9IozioNxG8n4x7Kl4Z9Oax27E/TT
	nHBqtItmupvOF9m1Csz0BqZYUJqxp+5xLn3ZsNFpiqebdOsG08EKxvu9EjoYMXDosrhfmhVr19uuq
	SF85GVzAWOeDB7Q/FQww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9KDf-00000005WAd-3Lyu;
	Mon, 28 Apr 2025 08:52:07 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9K33-00000005UgI-1r7Q
	for linux-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 08:41:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745829663; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l9CCsdDAh6tsjxtN/TOfvG9j13fTA7TAWVCieAMPFSkEUmTpUcyZpbeppeIRZZbe7IltlqRQU7E6XtIw+iTIBxMjIMz/3bpla7I4LDAr8jsPeRbMdGZEClgqNAZU7av4KL8vuBLeiVaEHJcjbNOR4h9sIfzr6z/wp2Smv3vT3WQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745829663; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HyXSYfMMKQseO6ErwcJ30OkhOu+WTDjzD4zXwnMsaXQ=; 
	b=SAj2s8b+YdFgoQ3vVB6eidZwAp3t3Xv2KMMZl+zoZZChQE0mGHD1zCj2t3TxOBqMnswbJVW4V5La9xre0hfHp+7+UUs675ZTikWhoKCcVBIeI3WwhHMx0GX8ZNhFrEa4LglHyXuLJDQYCj2rqDIPapgWBIAlksycNdRqrKjnXEs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745829663;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=HyXSYfMMKQseO6ErwcJ30OkhOu+WTDjzD4zXwnMsaXQ=;
	b=UmImgtO9ZZV9yD7Ao2LiYfnGQirY4Hz8tHLBSxvm3yM1eOixPa/M0XMmHH33d7JI
	SLP6g1M0p5f17dTV/q4ElH59zMBcdFuetwG9Pdqezt80dpmaV28om5dPGds5XBJNFVE
	8ra4QnfNgSPSQpcLvBy4aH/e/RM1VzjngcZM4s7KRmmQWqqPKE8GJseMi5nTKT8Vxs7
	oYUoeqRmLkGuXM3OVYjXi/8Uzut3+k0FPVKQVzuXnf1vcwdKgdZbE419fzMF5424q1P
	wtGXXMPCgbXo3V10MFgAFKPa0FDDTKF5knNjqy33miArp74J55vDrt1ogyPFswH6dRk
	5N0/jedw5g==
Received: by mx.zohomail.com with SMTPS id 1745829661806841.7939793535281;
	Mon, 28 Apr 2025 01:41:01 -0700 (PDT)
Message-ID: <34c92033f4bbf289c6048a85f0f6ba04435e7bf8.camel@icenowy.me>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: starfive,jh7110: add
 PAD_INTERNAL_* virtual pins
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang
 <jianlong.huang@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Date: Mon, 28 Apr 2025 16:40:56 +0800
In-Reply-To: <20250428-smiling-azure-sunfish-7c1c25@kuoka>
References: <20250424062017.652969-1-uwu@icenowy.me>
	 <20250424062017.652969-2-uwu@icenowy.me>
	 <20250428-smiling-azure-sunfish-7c1c25@kuoka>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_014109_551609_A75AE545 
X-CRM114-Status: GOOD (  15.63  )
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

5ZyoIDIwMjUtMDQtMjjmmJ/mnJ/kuIDnmoQgMDk6MjAgKzAyMDDvvIxLcnp5c3p0b2YgS296bG93
c2tp5YaZ6YGT77yaCj4gT24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgMDI6MjA6MTVQTSBHTVQsIElj
ZW5vd3kgWmhlbmcgd3JvdGU6Cj4gPiBUaGUgSkg3MTEwIFNvQyBjb3VsZCBzdXBwb3J0IGludGVy
bmFsIEdQSSBzaWduYWxzIHRvIGJlIHJvdXRlZCB0bwo+ID4gbm90Cj4gPiBleHRlcm5hbCBHUElP
IGJ1dCBpbnRlcm5hbCBsb3cvaGlnaCBsZXZlbHMuCj4gPiAKPiA+IEFkZCB0d28gbWFjcm9zLCBQ
QURfSU5URVJOQUxfTE9XIGFuZCBQQURfSU5URVJOQUxfSElHSCwgYXMgdHdvCj4gPiB2aXJ0dWFs
Cj4gPiAicGFkcyIgdG8gcmVwcmVzZW50IGludGVybmFsIEdQSSBzb3VyY2VzIHdpdGggZml4ZWQg
bG93L2hpZ2gKPiA+IGxldmVscy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVu
ZyA8dXd1QGljZW5vd3kubWU+Cj4gPiAtLS0KPiA+IMKgaW5jbHVkZS9kdC1iaW5kaW5ncy9waW5j
dHJsL3N0YXJmaXZlLGpoNzExMC1waW5jdHJsLmggfCA0ICsrKysKPiA+IMKgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5k
aW5ncy9waW5jdHJsL3N0YXJmaXZlLGpoNzExMC1waW5jdHJsLmgKPiA+IGIvaW5jbHVkZS9kdC1i
aW5kaW5ncy9waW5jdHJsL3N0YXJmaXZlLGpoNzExMC1waW5jdHJsLmgKPiA+IGluZGV4IDM4NjVm
MDEzOTYzOTUuLjNjY2E4NzRiMmJlZjcgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2R0LWJpbmRp
bmdzL3BpbmN0cmwvc3RhcmZpdmUsamg3MTEwLXBpbmN0cmwuaAo+ID4gKysrIGIvaW5jbHVkZS9k
dC1iaW5kaW5ncy9waW5jdHJsL3N0YXJmaXZlLGpoNzExMC1waW5jdHJsLmgKPiA+IEBAIC0xMjYs
NiArMTI2LDEwIEBACj4gPiDCoCNkZWZpbmXCoMKgwqDCoMKgwqDCoMKgUEFEX0dNQUMwX1RYRU7C
oMKgwqDCoMKgwqDCoMKgwqDCoDE4Cj4gPiDCoCNkZWZpbmXCoMKgwqDCoMKgwqDCoMKgUEFEX0dN
QUMwX1RYQ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAxOQo+ID4gwqAKPiA+ICsvKiB2aXJ0dWFsIHBp
bnMgZm9yIGZvcmNpbmcgR1BJICovCj4gPiArI2RlZmluZSBQQURfSU5URVJOQUxfTE9XwqDCoMKg
wqDCoMKgwqAyNTQKPiA+ICsjZGVmaW5lIFBBRF9JTlRFUk5BTF9ISUdIwqDCoMKgwqDCoMKgMjU1
Cj4gCj4gV2h5IHRoaXMgY2Fubm90IGJlIDIwIGFuZCAyMT8gVGhlc2UgYXJlIG5vdCB2YWx1ZXMg
Zm9yIHJlZ2lzdGVycywgYnV0Cj4gYWJzdHJhY3QgbnVtYmVycy4KClRoZSBudW1iZXIgbXVzdCBu
b3QgY29sbGlkZSB3aXRoIFNZUyBHUElPIHBhZHMgdG9vLgoKVXNpbmcgOTUgYW5kIDk2IGlzIG9r
YXksIGJ1dCBkaXJ0eS4KCj4gCj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgo+IAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
