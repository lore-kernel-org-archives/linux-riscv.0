Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4512EEEC1C
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jan 2026 22:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bm+GmnnYsffQ5iKakgcOQclGRAN1gA4YBTvBioMg0pg=; b=JmiI4ru2DyScGA
	0PapAruz8tlhGQa6iIkKCYG41aodid3etMbj4NZUOBrmZyWsfCrlsrL0SCCJ8nvr3uKK6cLEwo41P
	PfXoLRtRPwZG0wCz6drd8BC+8DwkvGOgdqgKHM6B84BdA6VFlx+/ocxXwrw4zRdXrFhxv8BRJUYXh
	doA5XfYygyoH9XIWOXVUq/JUpwdALEfa/OC07yqgNK5l5n8qdoFGr6ByvbPwUo+WyM3mNjR2KrSmY
	dqozaiDXihVIPlSiIbYodxdr4Bq1Etey4IKZRYkF7AsQX4SsVB69dNglWCc3o9LWEk0GucCLPHS65
	2154XGjF/zz1ZZrLBIHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbRYf-00000007ciZ-42CB;
	Thu, 01 Jan 2026 22:54:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbRYe-00000007ci2-0MAd
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jan 2026 22:54:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D2E6C60017
	for <linux-riscv@lists.infradead.org>; Thu,  1 Jan 2026 22:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85309C4CEF7
	for <linux-riscv@lists.infradead.org>; Thu,  1 Jan 2026 22:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767308053;
	bh=SdIk42cDOk2dycISNtX5+PpGDaZCWGgsqUMPWf4qg9A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Mz+aMuEpXt4rAzZOX259vYhz7HwxssjCDEDW9HtT7kX5sHUYA2MNiDSfabVnEj5SG
	 ArWadhLuZdw8xxc3j+Vb8mqipZAKg/vDsrEsAIfKbjVM+mFGTFLVbStDbKL86363c4
	 gFJRRzJrdeK2wbxNysUk7JGNLz05Q1/7lkt1QwyFPbkQOq7bKbnoYSnbfFOVJm3Y+h
	 depROBRYtDimJSLoU7vkpCGdwpOuwGWVAqT/kpHMc1zOVoueKVav/DQ2F6fEyPbbQt
	 SU6iY/pHS+VVI/J6DC0o1kKQ/DciyKUlLQx+4oC96ObAVvzMo2haKZOQATebYzCVYb
	 hAPpF5gN4X/Zw==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-63fc6d9fde5so10062967d50.3
        for <linux-riscv@lists.infradead.org>; Thu, 01 Jan 2026 14:54:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+GEXhGOlL5u0QNunTeEax1m6GPJ3bJKx2z9uxEBTRdAQQsx5zLV13iScHcQ37BUAU5YbYKzqJqNBkLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMvoN0vbvv5siiD3h7ocxDX2oKU1aV9ypZZMN81NLZsm4LB13E
	lb2LVzx96Eh1ok++CDhuTiFUGkL6F3kh/YGXapdp3nhzYdgOx812dnz+8193D60g6IiRiRP0/Iz
	VLTxwNcdk5Z65bettqtdk6RqHOchjcMQ=
X-Google-Smtp-Source: AGHT+IHOoFykERP0lAwZMoeMOFbxzQzpVVct6iBZoi4uZM7OehAI1cvgRKKw5UjMcQVmbNq+jXfwDnpUleitrWdX8JI=
X-Received: by 2002:a05:690e:130b:b0:646:903c:1b90 with SMTP id
 956f58d0204a3-646903c2353mr20637639d50.41.1767308052926; Thu, 01 Jan 2026
 14:54:12 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-1-5f1090a487c7@linux.spacemit.com>
In-Reply-To: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-1-5f1090a487c7@linux.spacemit.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Jan 2026 23:54:02 +0100
X-Gmail-Original-Message-ID: <CAD++jL=frL+GiwCRPKfnVe0i6Q+6vwcmvvdGmVLotOk37N_t4Q@mail.gmail.com>
X-Gm-Features: AQt7F2oAuS27OFHvHrgL7QzWBM7k70aHQ15ssQkK2fmMB8ibqgtBtkyMJgUw5is
Message-ID: <CAD++jL=frL+GiwCRPKfnVe0i6Q+6vwcmvvdGmVLotOk37N_t4Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: add syscon property
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
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

SGkgVHJveSwKCnRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCk9uIFR1ZSwgRGVjIDIzLCAyMDI1IGF0
IDEwOjEx4oCvQU0gVHJveSBNaXRjaGVsbAo8dHJveS5taXRjaGVsbEBsaW51eC5zcGFjZW1pdC5j
b20+IHdyb3RlOgoKPiArICBzcGFjZW1pdCxhcGJjOgo+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlw
ZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZS1hcnJheQo+ICsgICAgaXRlbXM6Cj4gKyAgICAg
IC0gaXRlbXM6Cj4gKyAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBwaGFuZGxlIHRvIHN5c2NvbiB0
aGF0IGFjY2VzcyB0aGUgcHJvdGVjdGVkIHJlZ2lzdGVyCj4gKyAgICAgICAgICAtIGRlc2NyaXB0
aW9uOiBvZmZzZXQgb2YgYWNjZXNzIHNlY3VyZSByZWdpc3RlcnMKKC4uLikKPiArICAgICAgICAg
ICAgc3BhY2VtaXQsYXBiYyA9IDwmc3lzY29uX2FwYmMgMHg1MD47CgpJc24ndCB0aGUgb2Zmc2V0
IGltcGxpY2l0IGZyb20gdGhlIGNvbXBhdGlibGUgb2YgdGhlIHBpbiBjb250cm9sbGVyIG9yCnRo
ZSBzeXNjb24gb3IgYW55IG90aGVyIGNvbXBhdGlibGU/CgpJdCdzIGVhc3kgdG8gY2hlY2sgY29t
cGF0aWJsZXMgaW4gdGhlIGRldmljZSB0cmVlIGFuZCBqdXN0IHNheQp0aGlzIG9mZnNldCBpcyAw
eDUwIGlmIGNvbXBhdGlibGUgaXMgc28tb3Itc28sIGFuZCBzb21ldGhpbmcgZWxzZQpmb3IgYW5v
dGhlciBjb21wYXRpYmxlIGFuZCBqdXN0IGdpdmUgYW4gZXJyb3IgaWYgYW4gdW5rbm93bgpjb21w
YXRpYmxlIGFwcGVhcnMuCgpTbzogcGxlYXNlIHRyeSB0byBhdm9pZCB0byBwdXQgdGhpbmdzIHRo
ZSBjb2RlIGNhbiBlYXNpbHkgbG9vawp1cCBpbnRvIHRoZSBkZXZpY2UgdHJlZS4KCllvdXJzLApM
aW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
