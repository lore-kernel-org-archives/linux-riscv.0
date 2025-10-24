Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C88CCD1A5
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 12:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Em7tiVoxpYkVffJe9W1XlKqGp8B/w8nHbN4uF9l6LU=; b=h1jF0UVAvPEZh1
	lyrmUbS1LvLedPmvMp8ikX3vFHEMkyTNIfmyTWH4M5gpLZ80M3LonnFsp+ZvNaLtUMTV65FuynjF7
	Dny+YJb3j1mLDLvaXG+UyCpBmCTR942hqeaUJv4nPWtXW+HmCrqZUYNcjnNX3DRvJfsQm2mqqViJ+
	ZTQ1fq78ECtkg31nKkmV48dTbWWQfCy5vLgY307bIB69LF20cS5OhdbESxHxX//0sxtJ6HEvIQCB/
	kfvchsVe2Jl5FovYRnjJvkFIlZkmTGqLJ882lgvp3v1NlA3DBWuaodp3TFX4o2UdSVJaXiRhKrGoc
	dDlGFD75VoF+Hu6J87aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGVF-00000009Iiu-0PYq;
	Fri, 24 Oct 2025 12:02:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGVD-00000009Iim-3VkU
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 12:02:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FBDB6025C
	for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 12:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFD42C4CEF1
	for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 12:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761307358;
	bh=tFRcY03S9pBysIUMdawmEsfvqrNG+fciCRlcmx7O6Bs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XPcdRU0czc83BsajIw9KFO6NoZSomVwaWfXOi0IgPfjLLQcwPGfGtmQ0UYFQoPTX0
	 jN6AmmnVbyFNYlek3PwG2WXm2jPOLieSDz8VfSo8ZO+uUb3XZD2cNWfxEotCv/9Ika
	 Tdx+vSu+dCrpjf6RZEpholBWj8n/QKagvpL3SeZgMOGzsUeBVMuDBoh0sqXztDtBvI
	 cMlyGT530nhWez3FE8hQjfMaVeLDwcQfBy7J4ULdmjOcsZlXQdmPF/69tTi951456T
	 RLkfakZFk3IcEzmGACrezZH5EivzBaNCFfIhO6dkzjbb3QgYnAoKjwtngXX+BNkSWx
	 w/16F8/2TGaxA==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b6d5c59f2b6so86433366b.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 05:02:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWNP7FkBlaCK3N4HHY5GfBQ7yKMq/iNAuEjFcvkvYI2k4OLsZDvIEBdCY0K70qxnhyeSxtW8YZBZqMFzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4Pugl/29Vj2+SAO2a0enQchOavd7E3/RejWywSFOEbyRdfMcm
	lWZyl1bh4PN/DTwsvWDXWu2ANUO7WoFvqJjQdaGB4qO4xY2aFE6A4kMZD2kCDqvCl+3UfVUCgVC
	W7FBD81n5P1CtwOVqhCuoshL6guiDvw==
X-Google-Smtp-Source: AGHT+IGTfhzju4ppsRKOrxtBpaeTHAnvK9OJtSlhnpNpeQbVDq7TqC2f+5KN7nrrJ1Ua9AMkgX3d1dJ37Sz/n7rfRSo=
X-Received: by 2002:a17:906:794f:b0:b5c:836d:3fda with SMTP id
 a640c23a62f3a-b647324579fmr3242467666b.21.1761307357331; Fri, 24 Oct 2025
 05:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20251023160415.705294-1-linux@roeck-us.net> <2bef32d0-2c35-c93d-08a8-71966c1212f2@kernel.org>
 <CAL_JsqJjiB3h+hzstXSbnyFy+U39GgtT=rcb4r+QDv=uL54H8g@mail.gmail.com> <1260cd8c-2904-1a21-d7ad-ba9b82f67797@kernel.org>
In-Reply-To: <1260cd8c-2904-1a21-d7ad-ba9b82f67797@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 24 Oct 2025 07:02:25 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+=cTOh8YLVaXu-yhn0wKL3ujrtpZEo6_b-c6md0LkK1g@mail.gmail.com>
X-Gm-Features: AWmQ_bluwSCzWVZ_VDiw2fAgBSj1MTumBiAbbRJGgC-PhAG_4d3NVXicPTB_dQc
Message-ID: <CAL_Jsq+=cTOh8YLVaXu-yhn0wKL3ujrtpZEo6_b-c6md0LkK1g@mail.gmail.com>
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

T24gVGh1LCBPY3QgMjMsIDIwMjUgYXQgOTo1NOKAr1BNIFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgMjMgT2N0IDIwMjUsIFJvYiBIZXJyaW5nIHdyb3Rl
Ogo+Cj4gPiBPbiBUaHUsIE9jdCAyMywgMjAyNSBhdCAxMTo0OOKAr0FNIFBhdWwgV2FsbXNsZXkg
PHBqd0BrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gVGh1LCAyMyBPY3QgMjAyNSwg
R3VlbnRlciBSb2VjayB3cm90ZToKPiA+ID4KPiA+ID4gPiBTdGFydGluZyB3aXRoIGNvbW1pdCA2
OWE4YjYyYTdhYTEgKCJyaXNjdjogYWNwaTogYXZvaWQgZXJyb3JzIGNhdXNlZCBieQo+ID4gPiA+
IHByb2JpbmcgRFQgZGV2aWNlcyB3aGVuIEFDUEkgaXMgdXNlZCIpLCByaXNjdiBpbWFnZXMgbm8g
bG9uZ2VyIHBvcHVsYXRlCj4gPiA+ID4gZGV2aWNldHJlZSBpZiBBQ1BJIGlzIGVuYWJsZWQuIFRo
aXMgY2F1c2VzIHVuaXQgdGVzdHMgdG8gZmFpbCB3aGljaCByZXF1aXJlCj4gPiA+ID4gdGhlIHJv
b3Qgbm9kZSB0byBiZSBzZXQuCj4gPiA+ID4KPiA+ID4gPiAgICMgU3VidGVzdDogb2ZfZHRiCj4g
PiA+ID4gICAjIG1vZHVsZTogb2ZfdGVzdAo+ID4gPiA+ICAgMS4uMgo+ID4gPiA+ICAgIyBvZl9k
dGJfcm9vdF9ub2RlX2ZvdW5kX2J5X3BhdGg6IEVYUEVDVEFUSU9OIEZBSUxFRCBhdCBkcml2ZXJz
L29mL29mX3Rlc3QuYzoyMQo+ID4gPiA+ICAgRXhwZWN0ZWQgbnAgaXMgbm90IG51bGwsIGJ1dCBp
cwo+ID4gPiA+ICAgIyBvZl9kdGJfcm9vdF9ub2RlX2ZvdW5kX2J5X3BhdGg6IHBhc3M6MCBmYWls
OjEgc2tpcDowIHRvdGFsOjEKPiA+ID4gPiAgIG5vdCBvayAxIG9mX2R0Yl9yb290X25vZGVfZm91
bmRfYnlfcGF0aAo+ID4gPiA+ICAgIyBvZl9kdGJfcm9vdF9ub2RlX3BvcHVsYXRlc19vZl9yb290
OiBFWFBFQ1RBVElPTiBGQUlMRUQgYXQgZHJpdmVycy9vZi9vZl90ZXN0LmM6MzEKPiA+ID4gPiAg
IEV4cGVjdGVkIG9mX3Jvb3QgaXMgbm90IG51bGwsIGJ1dCBpcwo+ID4gPiA+ICAgIyBvZl9kdGJf
cm9vdF9ub2RlX3BvcHVsYXRlc19vZl9yb290OiBwYXNzOjAgZmFpbDoxIHNraXA6MCB0b3RhbDox
Cj4gPiA+ID4gICBub3Qgb2sgMiBvZl9kdGJfcm9vdF9ub2RlX3BvcHVsYXRlc19vZl9yb290Cj4g
PiA+ID4KPiA+ID4gPiBTa2lwIHRob3NlIHRlc3RzIGZvciBSSVNDViBpZiB0aGUgcm9vdCBub2Rl
IGlzIG5vdCBwb3B1bGF0ZWQuCj4gPiA+ID4KPiA+ID4gPiBGaXhlczogNjlhOGI2MmE3YWExICgi
cmlzY3Y6IGFjcGk6IGF2b2lkIGVycm9ycyBjYXVzZWQgYnkgcHJvYmluZyBEVCBkZXZpY2VzIHdo
ZW4gQUNQSSBpcyB1c2VkIikKPiA+ID4gPiBDYzogSGFuIEdhbyA8cmFiZW5kYS5jbkBnbWFpbC5j
b20+Cj4gPiA+ID4gQ2M6IFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJuZWwub3JnPgo+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4KPiA+ID4KPiA+
ID4gUmV2aWV3ZWQtYnk6IFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJuZWwub3JnPiAgIyBhcmNoL3Jp
c2N2Cj4gPgo+ID4gRldJVywgdGhlIGZpeGVkIGNvbW1pdCB3aWxsIGFsc28gcHJldmVudCBlbmFi
bGluZyBmZWF0dXJlcyBsaWtlIHRoaXMKPiA+IHNlcmllc1sxXSBlbmFibGVzLiBBcm02NCBpcyBz
dGlsbCBkaXNhYmxlZCBBVE0gYmVjYXVzZSBvZiBkaXNhZ3JlZW1lbnQKPiA+IHdpdGggdGhlIGFy
bTY0IG1haW50YWluZXJzLCBzbyB0aGF0IGNhbiB3YXMga2lja2VkIGRvd24gdGhlIHJvYWQuIEl0
Cj4gPiB3b3VsZCBiZSBiZXR0ZXIgdG8gbm90IGRpc2FibGUgdGhpcyBhbmQgYWRkcmVzcyB0aGUg
aXNzdWVzIGFzIHRoZXkKPiA+IGhhcHBlbiByYXRoZXIgdGhhbiBicmVha2luZyBwZW9wbGUgZG93
biB0aGUgcm9hZC4KPgo+IFRoYW5rcyBmb3IgdGhlIGNvbnRleHQsIFJvYi4gIENhbiB5b3Ugc2hh
cmUgYSBwb2ludGVyIHRvIHRoZSBBUk02NAo+IGRpc2FncmVlbWVudCB0aHJlYWQocykgKGVpdGhl
ciBwdWJsaWNseSBvciBwcml2YXRlbHkpPwoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL1ph
WnRiVTlocmUzWWhaYW1ARlZGRjc3UzBRMDVOLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
