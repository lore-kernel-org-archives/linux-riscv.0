Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A89C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 06:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MIbbi1uLeP0WHO3NbLtnMJ36bCQ4LQG6q/6IAnUGC8Q=; b=j/nrpxNKFkytuZ
	+EThExKkuL8SwjxroHC2I65cd3W4c0lCcYUBqSdLa06SjN73Lfy08vkNDlhPVDKMf7cHEY+iE45e3
	NQExFqsf3fiInh14zLDxIOvDvV4BXlZSfRKlHA9qUQZlEgFB7hakFFnX4s+D17yqGVeLrCF1cgYE4
	ZbbY14VsIokHjYXzzcZ7hkPzuS8FiBWqRMml67wj1tZU1Cu9qbwe2e5nsaTfw+G4TXa133tYereqc
	oFjYXZbv3THndc4PFCaNMllQTxAjB7WvmoULU4cP5VvoD0DC8tfWpElXJUoD4flRFRSG5UhIlGXtl
	aYjO4Kwb508BFW/00S1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzWND-00000002wYh-1Y2O;
	Wed, 24 Apr 2024 06:44:55 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzWN8-00000002wXR-2guq
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 06:44:54 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-7d5db134badso277649439f.2
        for <linux-riscv@lists.infradead.org>; Tue, 23 Apr 2024 23:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1713941087; x=1714545887; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sf3+5YALiCVsfizYQ3BDSn74CJsGH44UmM4ytaiZ8LM=;
        b=jb7zjJv7nNOvkpuyBDNidQB2rHoF/YYcEQCXziCUcfsqwOFGkAobYAl/fwa3kTMpRp
         zax671nvsxFgcj/CyMp+YoNb6OGjXWh1m+Ni0VmuxvRYDwQ8CG/tpIhIdAIcETsZCDy7
         ltDfsZ0bW9REsiEFnUrOSb+4npZiEh0HKgjRd/vq22w4sou73T9P3ElNJQUjKyybghQD
         kmdguOSwFn3bKtaADXTYdnd7A+UwSIntxFTpdeDL07HTl2Eg6yimZ8ls89oumDNbxQXk
         oTRjvsP22wgsIrSKxZL0mliiByxUk51kzOuT5TcGqrYPp+en59fhip8GnmX/yOrJcylN
         JJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713941087; x=1714545887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sf3+5YALiCVsfizYQ3BDSn74CJsGH44UmM4ytaiZ8LM=;
        b=VDlIPJ32uSTYB7E0gVS4ZovuieN2p4+X1UQZUdnSyRPumzivPoqbnoYVR+/ZoKAv1N
         yCEtaWzCmdFpCmLWz0HdOBnHz+Y+jG7HBtParbhD1jezcmiDp+mqZV3YO63VSDqHCzUY
         4hS0yhio1xAQh8oTQVtA8aL7TDd+MhfxA4PEawBDXuEIet1Y83ZEgvz/VgNaoGv9HyBZ
         j/Vj2dUJtjH1nM59xVxxvAxYCXr5KhwGs+Gs7c7f8xr3C3yNrI3KgiAmIeLZYIvgGBX6
         ZhMErLQQEe5KBDr4eMWT1wOcnOX5Tr7vpdAq1J98Ew0lLvKc1Dcdi4xqC673V9JbqVxZ
         U3NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmaZJBXVmiZY5c5r/nQB5K4uaQlcn7ni5ShCv66n7mfvV7vwcowHsdRoKvTNllW6KlgVXphZosRrDcBdvFI6Ep6IjYigf4D0ZoNrEXzM4Z
X-Gm-Message-State: AOJu0Yx23YEO3MdxwQ+q5IgFZU7V5Tg04RSuc4tEgpGflSlAMaPeO20s
	XInMzcr9ryTY5znrIDsXCQLZaW6/BzzU48gBQ+Sf746ClGhs2jGg85pj9htNTnduOhuNx+EZg9E
	7rt7S2st1iGqAFOhjMG9GFmzqxGq8NHAXADo+JA==
X-Google-Smtp-Source: AGHT+IErBzM2ZvKYjC/kgSDBdh9xGud9im9ZtDYytTVq3cZLIALDpKA6oVcIv+vfvAqc+qjjb0Q4f5CdYvyjEl60vMI=
X-Received: by 2002:a6b:7e46:0:b0:7da:836:5d82 with SMTP id
 k6-20020a6b7e46000000b007da08365d82mr1731542ioq.7.1713941086645; Tue, 23 Apr
 2024 23:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240416013138.28760-1-zong.li@sifive.com> <Zia29wYvScRVdXUP@ghost>
In-Reply-To: <Zia29wYvScRVdXUP@ghost>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 24 Apr 2024 14:44:35 +0800
Message-ID: <CANXhq0qN-SsC=iO_5gAea=FqQqztmVUHaGxE5Z2me0h10jBU+Q@mail.gmail.com>
Subject: Re: [PATCH] Revert "riscv: disable generation of unwind tables"
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	schwab@suse.de, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_234451_323748_B500A129 
X-CRM114-Status: GOOD (  27.35  )
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

T24gVHVlLCBBcHIgMjMsIDIwMjQgYXQgMzoxNOKAr0FNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBBcHIgMTYsIDIwMjQgYXQgMDk6MzE6
MzhBTSArMDgwMCwgWm9uZyBMaSB3cm90ZToKPiA+IFRoaXMgcmV2ZXJ0cyBjb21taXQgMmYzOTRj
MGU3ZDExMjlhMzUxNTZlNDkyYmM4ZjQ0NWZiMjBmNDNhYy4KPiA+Cj4gPiBSSVNDLVYgaGFzIHN1
cHBvcnRlZCB0aGUgY29tcGxldGUgcmVsb2NhdGlvbiB0eXBlcyBpbiBtb2R1bGUgbG9hZGVyIGJ5
Cj4gPiAnOGZkNmM1MTQyMzk1ICgicmlzY3Y6IEFkZCByZW1haW5pbmcgbW9kdWxlIHJlbG9jYXRp
b25zIiknLgo+ID4gTm93IFJJU0MtViBwb3J0IGNhbiBlbmFibGUgdW53aW5kIHRhYmxlcyBpbiBj
YXNlIGVoX2ZyYW1lIHBhcnNpbmcgaXMKPiA+IG5lZWRlZC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L01h
a2VmaWxlIHwgMyAtLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvTWFrZWZpbGUK
PiA+IGluZGV4IDViMzExNWExOTg1Mi4uOTIxNmJmOGEyNjkxIDEwMDY0NAo+ID4gLS0tIGEvYXJj
aC9yaXNjdi9NYWtlZmlsZQo+ID4gKysrIGIvYXJjaC9yaXNjdi9NYWtlZmlsZQo+ID4gQEAgLTk0
LDkgKzk0LDYgQEAgaWZlcSAoJChDT05GSUdfQ01PREVMX01FREFOWSkseSkKPiA+ICAgICAgIEtC
VUlMRF9DRkxBR1MgKz0gLW1jbW9kZWw9bWVkYW55Cj4gPiAgZW5kaWYKPiA+Cj4gPiAtIyBBdm9p
ZCBnZW5lcmF0aW5nIC5laF9mcmFtZSBzZWN0aW9ucy4KPiA+IC1LQlVJTERfQ0ZMQUdTICs9IC1m
bm8tYXN5bmNocm9ub3VzLXVud2luZC10YWJsZXMgLWZuby11bndpbmQtdGFibGVzCj4gPiAtCj4K
PiBUaGVyZSBhcmUgYSBsb3Qgb2Ygb3JwaGFuZWQgc2VjdGlvbnMgY3JlYXRlZCBieSB0aGlzLCB3
aGljaCB0aHJvd3MgYSBsb3QKPiBvZiB3YXJuaW5ncy4gVGhlc2Ugd2FybmluZ3Mgd2lsbCBvbmx5
IGJlIHByZXNlbnQgb24gR0NDLTEzKyBzaW5jZQo+IC1mbm8tYXN5bmNocm9ub3VzLXVud2luZC10
YWJsZXMgd2FzIGEgZGVmYXVsdCBiZWZvcmUgR0NDLTEzLgo+Cj4gVGhlIC5laF9mcmFtZSBvcnBo
YW5lZCBzZWN0aW9ucyBjYW4gYmUgcmVzb2x2ZWQgYnkgaW5jbHVkaW5nCj4KPiAuZWhfZnJhbWUg
OiB7KiguZWhfZnJhbWUpfQo+Cj4gaW4gYXJjaC9yaXNjdi9rZXJuZWwvdm1saW51eC5sZHMuUy4g
YXJtNjQgcGxhY2VzIGl0IGluIHRoZSBpbml0IHNlY3Rpb24sCj4gYnV0IG91dHNpZGUgaW5pdF9k
YXRhIGFuZCBpbml0X3RleHQsIHNvIHJpZ2h0IGFmdGVyIHRoZSAuYWx0ZXJuYXRpdmUKPiBkZWZp
bml0aW9uIHNlZW1zIGxpa2UgYSBnb29kIHBsYWNlLgo+Cj4gLmluaXQuZWhfZnJhbWUgc2VjdGlv
bnMgaW4gZHJpdmVycy9maXJtd2FyZS9lZmkvbGlic3R1YiBhbHNvIGNvbXBsYWluCj4gYWJvdXQg
YmVpbmcgb3JwaGFuZWQsIGFuZCBvdGhlciBhcmNoaXRlY3R1cmVzIGhhdmUgZGlzYWJsZWQgdW53
aW5kCj4gdGFibGVzIGZvciB0aGF0IGNvbXBpbGF0aW9uIHVuaXQsIHNvIC1mbm8tdW53aW5kLXRh
YmxlcyBhbmQKPiAtZm5vLWFzeW5jaHJvbm91cy11bndpbmQtdGFibGVzIHNob3VsZCBiZSBhZGRl
ZCB0bwo+IGRyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWIvTWFrZWZpbGUgZm9yIHJpc2N2Lgo+
Cj4gVGhpcyBhbHNvIGNhdXNlcyB0aGUgcmVzdWx0aW5nIGltYWdlICh3aXRoIGRlZmNvbmZpZykg
dG8gaW5jcmVhc2UgZnJvbQo+IDIyTSB0byAyNE0uIFRoZXJlIGFyZSBjdXJyZW50bHkgbm8gdXNl
cnMgb2YgdW53aW5kIHRhYmxlcyBpbiByaXNjdiBzbwo+IHRoaXMgc2hvdWxkIGJlIGhpZGRlbiBi
ZWhpbmQgYSBjb25maWcuIGFybTY0IHVzZXMgdGhpcyBjb25maWcgYXM6Cj4KPiAjIEF2b2lkIGdl
bmVyYXRpbmcgLmVoX2ZyYW1lKiBzZWN0aW9ucy4KPiBpZm5lcSAoJChDT05GSUdfVU5XSU5EX1RB
QkxFUykseSkKPiBLQlVJTERfQ0ZMQUdTICAgKz0gLWZuby1hc3luY2hyb25vdXMtdW53aW5kLXRh
YmxlcyAtZm5vLXVud2luZC10YWJsZXMKPiBLQlVJTERfQUZMQUdTICAgKz0gLWZuby1hc3luY2hy
b25vdXMtdW53aW5kLXRhYmxlcyAtZm5vLXVud2luZC10YWJsZXMKPiBlbHNlCj4gS0JVSUxEX0NG
TEFHUyAgICs9IC1mYXN5bmNocm9ub3VzLXVud2luZC10YWJsZXMKPiBLQlVJTERfQUZMQUdTICAg
Kz0gLWZhc3luY2hyb25vdXMtdW53aW5kLXRhYmxlcwo+IGVuZGlmCj4KPiBVc2luZyB0aGlzIHNh
bWUgY29uZmlnIG5hbWUgZm9yIHJpc2N2IHdvdWxkIGFsbG93IHJpc2N2IHRvIHVzZSB0aGUKPiBz
dGFuZGFyZCAuZWhfZnJhbWUgY29kZSBpbnRyb2R1Y2VkIGluCj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtYXJtLWtlcm5lbC8yMDIyMTAyNzE1NTkwOC4xOTQwNjI0LTItYXJkYkBrZXJu
ZWwub3JnLy4KPgo+IFRoaXMgY29uZmlnIGlzIG9ubHkgZW5hYmxlZCBpZiBzb21lIG90aGVyIGNv
bmZpZyBzZWxlY3RzIGl0IGluIGFybTY0LAo+IGJ1dCByaXNjdiBkb2VzIG5vdCBjb250YWluIGFu
eSB1c2VycyBzbyBtYXliZSB0aGlzIGNvbmZpZyBjYW4gYmUgbGVmdAo+IHVuc2VsZWN0ZWQgdW50
aWwgdGhlcmUgaXMgYSB1c2VyIG9mIHVud2luZCB0YWJsZXMgaW4gcmlzY3YuCj4KCkhpIENoYXJs
aWUsClRoYW5rcyBhIGxvdCBmb3IgdGhlIHRpcHMgYW5kIGluZm9ybWF0aW9uLCBJIHdpbGwgdXNl
IGdjYy0xMysgdG8KdmVyaWZ5IHRoZSBuZXh0IHBhdGNoLgoKPiAtIENoYXJsaWUKPgo+ID4gICMg
VGhlIFJJU0MtViBhdHRyaWJ1dGVzIGZyZXF1ZW50bHkgY2F1c2UgY29tcGF0aWJpbGl0eSBpc3N1
ZXMgYW5kIHByb3ZpZGUgbm8KPiA+ICAjIGluZm9ybWF0aW9uLCBzbyBqdXN0IHR1cm4gdGhlbSBv
ZmYuCj4gPiAgS0JVSUxEX0NGTEFHUyArPSAkKGNhbGwgY2Mtb3B0aW9uLC1tbm8tcmlzY3YtYXR0
cmlidXRlKQo+ID4gLS0KPiA+IDIuMTcuMQo+ID4KPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
Cj4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
