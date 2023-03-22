Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D13DC6FD1C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 16:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4vnCbeDWXpm4k4HZ7urjghj5HSKIjj4+h9q3ETh8HU=; b=PLPnV6CRE6EPMs
	8eb6XKgrPMSbX7UWShlzOQ+uI2znBB578+w4pPlar+uYMXfImrqprn5PRJjDoOKKQgScezcAZMXNM
	dCcDin6AyQFASbAP0h5gZMXh+8SLzo12Ejvb9wYV2n2jbs1avSsEVmYix1zyNC3mEhUd1ECsemk6m
	WN72M5OZ0k2sBdHQLpaQLtT/wFQqOPZLxGwU3nHNufXHHkk/kZrnfMLZqULLJQuksD9LSkBo22/nk
	k61YOnAxBEMmliWLxtdopSx5HfE7jH2+F8A/f0IPauatnvUcH74myiBeiSDc0KjdX2BpnNIOldg5s
	qoiNZFjdHaPxQcaC7qkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf0xZ-00GagN-0r;
	Wed, 22 Mar 2023 16:05:09 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf0xV-00Gado-2q
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 16:05:07 +0000
Received: by mail-lj1-x22b.google.com with SMTP id t14so19491235ljd.5
        for <linux-riscv@lists.infradead.org>; Wed, 22 Mar 2023 09:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1679501101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQMj+UbSGYt/V4ItEl8Atz++wkEESN6wJSeRvZafcDU=;
        b=fXDTK4UwWJxghhGY844FVJkS0jod018sFRa0JBR2+G/lVjO/CNliTnwbakz6nPokPM
         ctesUpwtgM7AtGOBQBk/KcVJvZPTuY4YB+apo51lhApvb0i6T+YI89tfIMxJFGF/7ux5
         juJINe4wcZSKbe5qz65JOk30xQa36Jqx3MzzCnYaHQ5IYG6+PO2I14y5OIXs5kxDTkdF
         1GQzH/YyUtvAXNacXkMC5rRcgMYiaWgSG03Tag7KIj9qW4H+teBEqY4enNWq8SNghfg1
         9+EuKVWvhD8tt7Fbg3arhOW22QAjiVRVddT5aSc3tb9uQ5pIPLeFLjsMPz+Guw2w8av6
         2zDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679501101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQMj+UbSGYt/V4ItEl8Atz++wkEESN6wJSeRvZafcDU=;
        b=3RX4e+SU1CXrPLfpzEz1LRXbYpUT1yMpp4Ua+uwQFOJy889CJBOVVjdIyNNwBuQHIm
         lxjZg6QV2KI8iDzdJpxP1MnAIddjymhSZ78AGwG7B0rRZHpCZ2K8bEc4wpbSpiBra+MK
         6FWavoLhF7Ma9krRzm1sVAwlQ8a2h2cFmKVyoxh3n5VLHpu5NuaMpuLWbRpup0A4I/S2
         a/ni7/377bPKfxU8WnJRsEAy9zkeYj1TAL/OCyhBjJJwxPEkDzXX+HZFy7zFWjBv2HSU
         0W1pnhMkty+MknQdUqa5wtJx3hmtNDOjI1JqSVjxnncR39rtrkkiYyzCSlVQsfeEyqDT
         M17g==
X-Gm-Message-State: AO0yUKUdJj/wGCl7/bPxTBTrY/7rataEM+t8lQQa6eX3rUix0z9e0rJ7
	BZEQa5gqaS0jcydWjUL2Z1hb+ea3lIKsCkPXrSTmNA==
X-Google-Smtp-Source: AK7set9V3VY49u6SCjZkRbppQZLZPGl6botYkgoHJVVX0x35uhukV8uSf3SrWFeWx07P5q2ZlbHvjlPYcJhJ919zgfU=
X-Received: by 2002:a2e:7e05:0:b0:299:ac4e:a8a6 with SMTP id
 z5-20020a2e7e05000000b00299ac4ea8a6mr2145466ljc.9.1679501101548; Wed, 22 Mar
 2023 09:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230314183220.513101-1-evan@rivosinc.com> <20230314183220.513101-4-evan@rivosinc.com>
 <8e132bed-c85a-4bfd-bff8-5147db1cec32@spud>
In-Reply-To: <8e132bed-c85a-4bfd-bff8-5147db1cec32@spud>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 22 Mar 2023 09:04:25 -0700
Message-ID: <CALs-HsskLpLg=yEfULXZNOCFeFU3M9j9Kzcj49gPtw+0VGGhzA@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] RISC-V: hwprobe: Add support for RISCV_HWPROBE_BASE_BEHAVIOR_IMA
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, slewis@rivosinc.com, heiko@sntech.de, 
	vineetg@rivosinc.com, Conor Dooley <conor.dooley@microchip.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Bresticker <abrestic@rivosinc.com>, 
	Celeste Liu <coelacanthus@outlook.com>, Guo Ren <guoren@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_090506_147086_7F31D3ED 
X-CRM114-Status: GOOD (  19.35  )
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

WWVwLCB5b3UgYW5kIEhlaWtvIGFyZSBvbiB0aGUgc2FtZSB3YXZlbGVuZ3RoIHRoZXNlIGRheXMu
IEknbGwgbWFrZSB0aGF0IGNoYW5nZS4KLUV2YW4KCk9uIFdlZCwgTWFyIDIyLCAyMDIzIGF0IDg6
MzbigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVl
LCBNYXIgMTQsIDIwMjMgYXQgMTE6MzI6MTdBTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90ZToKPiA+
IFdlIGhhdmUgYW4gaW1wbGljaXQgc2V0IG9mIGJhc2UgYmVoYXZpb3JzIHRoYXQgdXNlcnNwYWNl
IGRlcGVuZHMgb24sCj4gPiB3aGljaCBhcmUgbW9zdGx5IGRlZmluZWQgaW4gdmFyaW91cyBJU0Eg
c3BlY2lmaWNhdGlvbnMuCj4gPgo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8
cGFsbWVyQHJpdm9zaW5jLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxw
YWxtZXJAcml2b3NpbmMuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogRXZhbiBHcmVlbiA8ZXZhbkBy
aXZvc2luYy5jb20+Cj4gPiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlA
bWljcm9jaGlwLmNvbT4KPgo+ID4gQEAgLTEyNSw2ICsxMjYsMjUgQEAgc3RhdGljIHZvaWQgaHdw
cm9iZV9vbmVfcGFpcihzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKPiA+ICAgICAgIGNhc2Ug
UklTQ1ZfSFdQUk9CRV9LRVlfTUlNUElEOgo+ID4gICAgICAgICAgICAgICBod3Byb2JlX2FyY2hf
aWQocGFpciwgY3B1cyk7Cj4gPiAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gKyAgICAgLyoKPiA+
ICsgICAgICAqIFRoZSBrZXJuZWwgYWxyZWFkeSBhc3N1bWVzIHRoYXQgdGhlIGJhc2Ugc2luZ2xl
LWxldHRlciBJU0EKPiA+ICsgICAgICAqIGV4dGVuc2lvbnMgYXJlIHN1cHBvcnRlZCBvbiBhbGwg
aGFydHMsIGFuZCBvbmx5IHN1cHBvcnRzIHRoZQo+ID4gKyAgICAgICogSU1BIGJhc2UsIHNvIGp1
c3QgY2hlYXQgYSBiaXQgaGVyZSBhbmQgdGVsbCB0aGF0IHRvCj4gPiArICAgICAgKiB1c2Vyc3Bh
Y2UuCj4gPiArICAgICAgKi8KPiA+ICsgICAgIGNhc2UgUklTQ1ZfSFdQUk9CRV9LRVlfQkFTRV9C
RUhBVklPUjoKPiA+ICsgICAgICAgICAgICAgcGFpci0+dmFsdWUgPSBSSVNDVl9IV1BST0JFX0JB
U0VfQkVIQVZJT1JfSU1BOwo+ID4gKyAgICAgICAgICAgICBicmVhazsKPiA+ICsKPiA+ICsgICAg
IGNhc2UgUklTQ1ZfSFdQUk9CRV9LRVlfSU1BX0VYVF8wOgo+ID4gKyAgICAgICAgICAgICBwYWly
LT52YWx1ZSA9IDA7Cj4gPiArICAgICAgICAgICAgIGlmIChoYXNfZnB1KCkpCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgcGFpci0+dmFsdWUgfD0gUklTQ1ZfSFdQUk9CRV9JTUFfRkQ7Cj4gPiAr
Cj4gPiArICAgICAgICAgICAgIGlmIChlbGZfaHdjYXAgJiBSSVNDVl9JU0FfRVhUX2MpCj4KPiBS
YW5kb20gdGhvdWdodCB3aGlsZSByZXZpZXdpbmcgYW5vdGhlciBwYXRjaCwgYW5kIEkga2luZGEg
ZmVsdCBhIGJpdAo+IHN0dXBpZCBmb2xsb3dpbmcgdGhlIGV4aXN0aW5nIGNvZGUgdG8gdHJ5IGFu
ZCBtYWtlIHN1cmUsIGJ1dCBzaG91bGQgdGhpcwo+IGJlY29tZSBhIGNhbGwgdG8gcmlzY3ZfaXNh
X2V4dGVuc2lvbl9hdmFpbGFibGUoTlVMTCwgYyk/Cj4gSXQgbWF5IGJlIG5pY2UgdG8gcHJvcGFn
YXRlIHRoYXQgaGVscGVyLCBpZiBpdCB3b3JrcywgdGhhbiBjaGVjayB0aGUgYml0Cj4gZGlyZWN0
bHkuCj4KPiBDaGVlcnMsCj4gQ29ub3IuCj4KPiA+ICsgICAgICAgICAgICAgICAgICAgICBwYWly
LT52YWx1ZSB8PSBSSVNDVl9IV1BST0JFX0lNQV9DOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICBi
cmVhazsKPiA+Cj4gPiAgICAgICAvKgo+ID4gICAgICAgICogRm9yIGZvcndhcmQgY29tcGF0aWJp
bGl0eSwgdW5rbm93biBrZXlzIGRvbid0IGZhaWwgdGhlIHdob2xlCj4gPiAtLQo+ID4gMi4yNS4x
Cj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
