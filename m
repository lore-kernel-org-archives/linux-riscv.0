Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3770FCCA471
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Oct 2025 13:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rmmXCU4BehU/wN3uauS7OeyfKd3l7LeGgUeDvGF2pNs=; b=YQnjzBMmeTAQ5g
	f0LvKSsMl7bA/GHat5u+wkktU5RBgnHwW0R0YVyqN+tMb0ZJ8EgLFOFp7ouHy1IN4F7ETmFjGKONJ
	e5UMQFJQHI83M9KzuZ9ZVjLdh2pUgec/eETWm1a3oxrGOAQ+EXfW0/pdhSEg4a01Ul6WYcVNW5RSH
	nRfq0nrWDNFZ/T8C+rPIzpbQy/f2FF1aWO6D9pWlsDyNelH6wbBCSfdmB4xogXWU8U0yENRI99n/5
	/GX8eiWSfp4byBSlvkagtPxIVGUwZU/OXjJ5TR09Y57GI86BJ+b9Cfq+JcoHTRYcgFbKROcQYA/rb
	7ylOqsOqoEx16uHS/L8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4fuJ-0000000CPEm-3EdC;
	Fri, 03 Oct 2025 13:33:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4fuJ-0000000CPEa-1OEE
	for linux-riscv@lists.infradead.org;
	Fri, 03 Oct 2025 13:33:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 915B362157
	for <linux-riscv@lists.infradead.org>; Fri,  3 Oct 2025 13:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF86C4CEFB
	for <linux-riscv@lists.infradead.org>; Fri,  3 Oct 2025 13:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759498390;
	bh=C0IfBPyV7UBF2PDQ6o0zMb4JYo7b3LeT2lZxvzwA1zo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hgTfYbBj1Bf8IDVz126EWVCUWqOjd7ddVb6RNVV6y/wXj98nXkZlaTK970C+QRa5D
	 aAsD17JkeksYxzGVhfK9RR6lJXqWU9AN2LXnU3eLYryX4pzKoU2QTTi5qDYjrcSe30
	 ykOGkdZnP5JnoZAw/g2wMFIl1JfHgakD3d73aP0dgfLv5On1Erpq1CI8bwCH7T65ST
	 Mdl9kZyQuBXz1kBs7mZ2QmjxRHUJs7N9DS445xMBCQrRZ/gXekLCKjoW5053LCU6oE
	 dIwOk1NB72snQee0rSpRpBAt7FFJceP85+7R7Ize9rJISNfLYSiNi9H8mEn8n8Siq1
	 OlCnotycrfmNA==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b3d50882cc2so447462066b.2
        for <linux-riscv@lists.infradead.org>; Fri, 03 Oct 2025 06:33:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJjKjwg2HtdOpC1J1sToS329G//dDO0F1iNUwj+HfQDnocJS5qEdcWDD5phOsxSU/TccYteg0x5sWmLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPfCEhB4WAxEUKKxhGZ5RSawakd1c74hQsvCpb5qum4fpQkHa4
	GbxrRzE70GxIuzxX6DfecaeyfvDE9ZI1TmSzG8xtA+xin8b7l4w8NoqnZBVUQH9X+bKnX4NDA3j
	LAtV8fgmhT8DrBfVxhtzP+H60qVG2jg==
X-Google-Smtp-Source: AGHT+IGaUVVXIqhC9lovJbOg6iFmKgFvDhzHqwsGL+BfWqtS/NinqS+uML7tkmyQ2x8FtOpCPjCiO9PBD+v4XaQbRRE=
X-Received: by 2002:a17:906:c146:b0:b04:5e64:d7cd with SMTP id
 a640c23a62f3a-b49c4cde217mr381764366b.46.1759498388819; Fri, 03 Oct 2025
 06:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1759485668.git.geert+renesas@glider.be> <98e13934d06116d5c116bd2b2187842ec3a8c11a.1759485668.git.geert+renesas@glider.be>
In-Reply-To: <98e13934d06116d5c116bd2b2187842ec3a8c11a.1759485668.git.geert+renesas@glider.be>
From: Rob Herring <robh@kernel.org>
Date: Fri, 3 Oct 2025 08:32:57 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJACXgfgLBn4bpz9uG2zEsoH+FX+8wHmTSj2rLVV59=hg@mail.gmail.com>
X-Gm-Features: AS18NWCJ1lihSi5v5QI8_-KXwh5QzGMdW1l0dkB9L36RcYjtaMnOS5EVXEekAWI
Message-ID: <CAL_JsqJACXgfgLBn4bpz9uG2zEsoH+FX+8wHmTSj2rLVV59=hg@mail.gmail.com>
Subject: Re: [PATCH/RFC 1/2] of/irq: Ignore interrupt parent for nodes without interrupts
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
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

T24gRnJpLCBPY3QgMywgMjAyNSBhdCA1OjA44oCvQU0gR2VlcnQgVXl0dGVyaG9ldmVuCjxnZWVy
dCtyZW5lc2FzQGdsaWRlci5iZT4gd3JvdGU6Cj4KPiBUaGUgRGV2aWNldHJlZSBTcGVjaWZpY2F0
aW9uIHN0YXRlczoKPgo+ICAgICBUaGUgcm9vdCBvZiB0aGUgaW50ZXJydXB0IHRyZWUgaXMgZGV0
ZXJtaW5lZCB3aGVuIHRyYXZlcnNhbCBvZiB0aGUKPiAgICAgaW50ZXJydXB0IHRyZWUgcmVhY2hl
cyBhbiBpbnRlcnJ1cHQgY29udHJvbGxlciBub2RlIHdpdGhvdXQgYW4KPiAgICAgaW50ZXJydXB0
cyBwcm9wZXJ0eSBhbmQgdGh1cyBubyBleHBsaWNpdCBpbnRlcnJ1cHQgcGFyZW50Lgo+Cj4gSG93
ZXZlciwgb2ZfaXJxX2luaXQoKSBncmF0dWl0b3VzbHkgYXNzdW1lcyB0aGF0IGEgbm9kZSB3aXRo
b3V0Cj4gaW50ZXJydXB0cyBoYXMgYW4gYWN0dWFsIGludGVycnVwdCBwYXJlbnQgaWYgaXQgZmlu
ZHMgYW4KPiBpbnRlcnJ1cHQtcGFyZW50IHByb3BlcnR5IGhpZ2hlciB1cCBpbiB0aGUgZGV2aWNl
IHRyZWUuICBIZW5jZSB3aGVuIHN1Y2gKPiBhIHByb3BlcnR5IGlzIHByZXNlbnQgKGUuZy4gaW4g
dGhlIHJvb3Qgbm9kZSksIHRoZSByb290IGludGVycnVwdAo+IGNvbnRyb2xsZXIgbWF5IG5vdCBi
ZSBkZXRlY3RlZCBhcyBzdWNoLCBjYXVzaW5nIGEgcGFuaWM6Cj4KPiAgICAgT0Y6IG9mX2lycV9p
bml0OiBjaGlsZHJlbiByZW1haW4sIGJ1dCBubyBwYXJlbnRzCj4gICAgIEtlcm5lbCBwYW5pYyAt
IG5vdCBzeW5jaW5nOiBObyBpbnRlcnJ1cHQgY29udHJvbGxlciBmb3VuZC4KPgo+IENvbW1pdCBl
OTEwMzM2MjFkNTZlMDU1ICgib2YvaXJxOiBVc2UgaW50ZXJydXB0cy1leHRlbmRlZCB0byBmaW5k
Cj4gcGFyZW50IikgYWxyZWFkeSBmaXhlZCBhIGZpcnN0IHBhcnQsIGJ5IGNoZWNraW5nIGZvciB0
aGUgcHJlc2VuY2Ugb2YgYW4KPiBpbnRlcnJ1cHRzLWV4dGVuZGVkIHByb3BlcnR5LiAgRml4IHRo
ZSBzZWNvbmQgcGFydCBieSBvbmx5IGNhbGxpbmcKPiBvZl9pcnFfZmluZF9wYXJlbnQoKSB3aGVu
IGFuIGludGVycnVwdHMgcHJvcGVydHkgaXMgcHJlc2VudC4KClNlZW1zIHJlYXNvbmFibGUuIFdo
eSB0aGUgUkZDIHRhZz8KCk5vcm1hbGx5IEknZCB3b3JyeSBhYm91dCBzb21lIGFuY2llbnQgUFBD
IG9yIFNwYXJjIHN5c3RlbSwgYnV0IHRoZXkKZG9uJ3QgdXNlIG9mX2lycV9pbml0KCkuCgpSb2IK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
