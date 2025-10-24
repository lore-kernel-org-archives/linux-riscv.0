Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C60ECCD1BF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 01:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7P2jXe/r0ZLWWKjaEqz+d7JD/GKrctQXPW+sCWJj2UM=; b=YntLgOHjsxxnvG
	oLKyfViSJY7EqsV1VgPFRr27bvKBHkreYcdI7SN2xABO9E79hPynbPIbqX6D85+Fe3u0A6Cxb/M2i
	fDAD+54MuI0HDPBHqwizGt/5FYNqk9NqQuBJeRIXFuyzmCbid78lvEbqcEpCdjB7PHGPyobOnwjiN
	go3k08bo4nWFzP8n75Ar/bmFMl6R3DJJLtVY3jCFHMozZ33CPnllOtsDjsgy3nWW2Xfx/NK+xvhAN
	b+78BRD9OOHpK4CK05BlxHkdPrl47iTID53qk6TextufbQo2VwfNF7TBDvYEo5EBZ4YGG5OdfpVvZ
	hR3H1d0AqIg3apu+hpLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC6AG-00000007vs0-2bfC;
	Fri, 24 Oct 2025 01:00:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC6AF-00000007vru-1ZEW
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 01:00:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C39636044E
	for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 01:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB6EC4CEE7
	for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 01:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761267618;
	bh=ehk5gqYro75ea+kxBOikbp2b/GK50O48GMIz57SlOmE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=M0PZT/z+0uPfmF3EYkTG0YEenwe3enJsw5n0gPlHeJutghzQs8qu1GtLjm8A4Houc
	 IpiuSSBwwz20WqjSVHFd12KQz2blUFJXtRcMoSXBvNSNutEl2KiHMXEPpflVKck525
	 6a0URvMkwseirX/twN3DGWIiHaMXxWe+Gsdqv8NMhF+11LvSgp61ck1o0e1ojs5r7+
	 wmn7KAVmE6wUNRxV7fMNuC2hLwMqEcJrtGIMJ/TVa/ivQomNzKUu+EfNDpbPHNKZ7f
	 QnY3rO/uqMIPnKqXrgkTUbrfQNulGYPB7epHL04iiJgD2oPA8/ZF4krvyE7YpixXdW
	 +p8KXLzPRWIVg==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-637e9f9f9fbso2621100a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 18:00:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPH8U/O0jYPZLu5rireUDm03zQnVo7KKxSFend6kBZOnSdTQqZmzAGMs3MrJpRaeTf5LVh0OmfpV07KQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzX+/9a5svb8GZI+3WxMsOwM6vJJ7mYMsA9BUt9bLTcr2RzyxqK
	0MXZ/V+ypFVt4OWfo77Y7Nyvsb8mKBX2dyfY/eiVBJx/kJkqMLSYUq721CwhBt+Wa0m7BGixX61
	eK6/YUrpJyTAFle6hhYwYOCHMP9HOSg==
X-Google-Smtp-Source: AGHT+IEjEgQeRaKS1MRniIDNB0DeeoIYpOrEvhgQgtjv9aD4ZD7zdo/az8WJFJUar6TfO+DVKuofLO/h/4vazXCE9ws=
X-Received: by 2002:a05:6402:26c4:b0:634:b7a2:3eaf with SMTP id
 4fb4d7f45d1cf-63e3e477b5bmr4280000a12.18.1761267616822; Thu, 23 Oct 2025
 18:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251023160415.705294-1-linux@roeck-us.net> <2bef32d0-2c35-c93d-08a8-71966c1212f2@kernel.org>
In-Reply-To: <2bef32d0-2c35-c93d-08a8-71966c1212f2@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 23 Oct 2025 20:00:05 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJjiB3h+hzstXSbnyFy+U39GgtT=rcb4r+QDv=uL54H8g@mail.gmail.com>
X-Gm-Features: AWmQ_bkV_0VhcZcZAaOK1XDUuJnahwO7hnusuR-jKXe-TZpuwe9eoSVZYP6h4CU
Message-ID: <CAL_JsqJjiB3h+hzstXSbnyFy+U39GgtT=rcb4r+QDv=uL54H8g@mail.gmail.com>
Subject: Re: [PATCH] of: Skip devicetree kunit tests when RISCV+ACPI doesn't
 populate root node
To: Paul Walmsley <pjw@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Han Gao <rabenda.cn@gmail.com>
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

T24gVGh1LCBPY3QgMjMsIDIwMjUgYXQgMTE6NDjigK9BTSBQYXVsIFdhbG1zbGV5IDxwandAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIDIzIE9jdCAyMDI1LCBHdWVudGVyIFJvZWNrIHdy
b3RlOgo+Cj4gPiBTdGFydGluZyB3aXRoIGNvbW1pdCA2OWE4YjYyYTdhYTEgKCJyaXNjdjogYWNw
aTogYXZvaWQgZXJyb3JzIGNhdXNlZCBieQo+ID4gcHJvYmluZyBEVCBkZXZpY2VzIHdoZW4gQUNQ
SSBpcyB1c2VkIiksIHJpc2N2IGltYWdlcyBubyBsb25nZXIgcG9wdWxhdGUKPiA+IGRldmljZXRy
ZWUgaWYgQUNQSSBpcyBlbmFibGVkLiBUaGlzIGNhdXNlcyB1bml0IHRlc3RzIHRvIGZhaWwgd2hp
Y2ggcmVxdWlyZQo+ID4gdGhlIHJvb3Qgbm9kZSB0byBiZSBzZXQuCj4gPgo+ID4gICAjIFN1YnRl
c3Q6IG9mX2R0Ygo+ID4gICAjIG1vZHVsZTogb2ZfdGVzdAo+ID4gICAxLi4yCj4gPiAgICMgb2Zf
ZHRiX3Jvb3Rfbm9kZV9mb3VuZF9ieV9wYXRoOiBFWFBFQ1RBVElPTiBGQUlMRUQgYXQgZHJpdmVy
cy9vZi9vZl90ZXN0LmM6MjEKPiA+ICAgRXhwZWN0ZWQgbnAgaXMgbm90IG51bGwsIGJ1dCBpcwo+
ID4gICAjIG9mX2R0Yl9yb290X25vZGVfZm91bmRfYnlfcGF0aDogcGFzczowIGZhaWw6MSBza2lw
OjAgdG90YWw6MQo+ID4gICBub3Qgb2sgMSBvZl9kdGJfcm9vdF9ub2RlX2ZvdW5kX2J5X3BhdGgK
PiA+ICAgIyBvZl9kdGJfcm9vdF9ub2RlX3BvcHVsYXRlc19vZl9yb290OiBFWFBFQ1RBVElPTiBG
QUlMRUQgYXQgZHJpdmVycy9vZi9vZl90ZXN0LmM6MzEKPiA+ICAgRXhwZWN0ZWQgb2Zfcm9vdCBp
cyBub3QgbnVsbCwgYnV0IGlzCj4gPiAgICMgb2ZfZHRiX3Jvb3Rfbm9kZV9wb3B1bGF0ZXNfb2Zf
cm9vdDogcGFzczowIGZhaWw6MSBza2lwOjAgdG90YWw6MQo+ID4gICBub3Qgb2sgMiBvZl9kdGJf
cm9vdF9ub2RlX3BvcHVsYXRlc19vZl9yb290Cj4gPgo+ID4gU2tpcCB0aG9zZSB0ZXN0cyBmb3Ig
UklTQ1YgaWYgdGhlIHJvb3Qgbm9kZSBpcyBub3QgcG9wdWxhdGVkLgo+ID4KPiA+IEZpeGVzOiA2
OWE4YjYyYTdhYTEgKCJyaXNjdjogYWNwaTogYXZvaWQgZXJyb3JzIGNhdXNlZCBieSBwcm9iaW5n
IERUIGRldmljZXMgd2hlbiBBQ1BJIGlzIHVzZWQiKQo+ID4gQ2M6IEhhbiBHYW8gPHJhYmVuZGEu
Y25AZ21haWwuY29tPgo+ID4gQ2M6IFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJuZWwub3JnPgo+ID4g
U2lnbmVkLW9mZi1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pgo+Cj4gUmV2
aWV3ZWQtYnk6IFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJuZWwub3JnPiAgIyBhcmNoL3Jpc2N2CgpG
V0lXLCB0aGUgZml4ZWQgY29tbWl0IHdpbGwgYWxzbyBwcmV2ZW50IGVuYWJsaW5nIGZlYXR1cmVz
IGxpa2UgdGhpcwpzZXJpZXNbMV0gZW5hYmxlcy4gQXJtNjQgaXMgc3RpbGwgZGlzYWJsZWQgQVRN
IGJlY2F1c2Ugb2YgZGlzYWdyZWVtZW50CndpdGggdGhlIGFybTY0IG1haW50YWluZXJzLCBzbyB0
aGF0IGNhbiB3YXMga2lja2VkIGRvd24gdGhlIHJvYWQuIEl0CndvdWxkIGJlIGJldHRlciB0byBu
b3QgZGlzYWJsZSB0aGlzIGFuZCBhZGRyZXNzIHRoZSBpc3N1ZXMgYXMgdGhleQpoYXBwZW4gcmF0
aGVyIHRoYW4gYnJlYWtpbmcgcGVvcGxlIGRvd24gdGhlIHJvYWQuCgpSb2IKClsxXSBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTEwMTUwNzE0MjAuMTE3MzA2OC0xLWhlcnZlLmNvZGlu
YUBib290bGluLmNvbS8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
