Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A598EC6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 14:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cbL+oGyhm9EQ3n+/YGrsFEvOFuUbbmdOrzT07gix1Hw=; b=Oi27iW9OBIYyyC
	ueCFwQvJ/9HMmkcWcdlJKQutFm9ytVCzO6l9+jX82lDsmoExtjnM7nAqaCt/8G1EOlef+tBO31+eM
	7yejd/lbGnsvRJAmL32yAHIzPFVgiE1Eu1k7bIbe/l4wJ1WaxmUrlhkN7+lZXcqxJ0n4zmzA/joPI
	30wH4rGovl5d1iJMrn9MhgikfPztIdWQ/aA5IDBpi0VAZCzJiR0AjyjjdAk7b/II8TCwoZ22HsqU/
	TosAdwvagE20zMjJ6U2wEAivkrBEnJWZ8Y9kxKx/vh6Ia6SLxPgMdJ5MxoxJbzOCIrlKmjgdPx57f
	EcKAT2M9zt6bI+6LGnWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phWyX-000eXr-2S;
	Wed, 29 Mar 2023 14:40:33 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phWyV-000eXK-0W
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 14:40:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id o32so9087909wms.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Mar 2023 07:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680100829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3ixFB+QbvxNuTUQ+9uGUyxwBpcWsdgUOQuT9hmx8Eo=;
        b=ZzeMNASizro0DCX9uwISypPThwqsFl+cZwUJb8YUGxhfjqQ8/SxCcOk4qmwsNlo7M0
         Qz1+Y8FmONI+a4poP0M1zVB2a/cEzzF7AtV1P5lvNYmDErZSNxXnqTcaA8GhSzfcVihx
         58mjP5NpqgHxxd64VKl2DGbMalfctzr89HlxdyTxyq/1sEGjBmnuHkSWh030Dx4VS3yg
         s4vwc5NymraZRVuMhF4zS7TaOHTnhLyDO3zH+FvtLKu65GRLqns/Q3aI4Ot51yb5xa4r
         PmVfoG/WLHCUJS6abadujM0+aaT7LdWwsyVIPuZIIjjEZSYVYurISPrR4rt0nP3J77zc
         TDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680100829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3ixFB+QbvxNuTUQ+9uGUyxwBpcWsdgUOQuT9hmx8Eo=;
        b=7ZNHQTEzXl8/uWyM/G4yYEWOwLzJgEXGHn58HeVAhjWSL7FEL0M7vbFZ5YmxA9mbqa
         LhpbQ8YJ49P8Q6Pfsu+LuA9kDgqUzk26ah25K9t/1rkYY+36nv3iPNM7yXGxnlRf61Zh
         QtX8uXHehzO7ULHsMSyaT99XdnBDIF89MXw49ZqkkiXLAO/q5sAO+6IE7OPlzU3RA7c1
         btPEY6QyhySbZWS2sAVeFNa599dHh1fzIc7cUUed+twvy0IKavZ4xbYJK22eAkjGymHg
         DVzgRLv+2HM2vTb9oGcP43uDJhuJLM1EniqbKGmxcrWv000JO/uHX9J6fJPYEtGZkJdQ
         gJKg==
X-Gm-Message-State: AO0yUKW718JfHN/8LcOq5l7gz4/V2EoctkKVWsRBwhsPkkXrvTk7Gi2m
	LseJ8dc1l8BAPhYT6VEuOzrUSuDvV5OIW0ef6Ay40w==
X-Google-Smtp-Source: AK7set/r5FDsIfVCcTouvt4BuewvjeXCoqh4AN0X/5B2UlHmX8Zjsb8G5Xepj+i2tfuaC8Pr0yg3CQAFxmFa2VYAUTc=
X-Received: by 2002:a1c:7714:0:b0:3ee:3e07:5d35 with SMTP id
 t20-20020a1c7714000000b003ee3e075d35mr4552357wmi.3.1680100828896; Wed, 29 Mar
 2023 07:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230329081932.79831-1-alexghiti@rivosinc.com>
 <20230329081932.79831-4-alexghiti@rivosinc.com> <381c2753-cbcc-40a0-bcb2-67d18e367822@spud>
In-Reply-To: <381c2753-cbcc-40a0-bcb2-67d18e367822@spud>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 29 Mar 2023 16:40:18 +0200
Message-ID: <CAHVXubhVGR1vjqFVv1vuDGDMSiG0JBpKtRZnzgzpa9VBK+BuNw@mail.gmail.com>
Subject: Re: [PATCH -fixes v2 3/3] riscv: No need to relocate the dtb as it
 lies in the fixmap region
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_074031_394458_949BEB9A 
X-CRM114-Status: GOOD (  28.36  )
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

T24gV2VkLCBNYXIgMjksIDIwMjMgYXQgMzo1NuKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1hciAyOSwgMjAyMyBhdCAxMDoxOTozMkFNICsw
MjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPiBXZSB1c2VkIHRvIGFjY2VzcyB0aGUgZHRi
IHZpYSBpdHMgbGluZWFyIG1hcHBpbmcgYWRkcmVzcyBidXQgbm93IHRoYXQgdGhlCj4gPiBkdGIg
ZWFybHkgbWFwcGluZyB3YXMgbW92ZWQgaW4gdGhlIGZpeG1hcCByZWdpb24sIHdlIGNhbiBrZWVw
IHVzaW5nIHRoaXMKPiA+IGFkZHJlc3Mgc2luY2UgaXQgaXMgcHJlc2VudCBpbiBzd2FwcGVyX3Bn
X2RpciwgYW5kIHJlbW92ZSB0aGUgZHRiCj4gPiByZWxvY2F0aW9uLgo+ID4KPiA+IE5vdGUgdGhh
dCB0aGUgcmVsb2NhdGlvbiB3YXMgd3JvbmcgYW55d2F5IHNpbmNlIGVhcmx5X21lbXJlbWFwKCkg
aXMKPiA+IHJlc3RyaWN0ZWQgdG8gMjU2SyB3aGVyZWFzIHRoZSBtYXhpbXVtIGZkdCBzaXplIGlz
IDJNQi4KPgo+IFNvLCBzaG91bGQgdGhpcyBiZSBtYXJrZWQgYXMgYSBmaXgsIGFuZCBiYWNrcG9y
dGVkIGFsb25nIHdpdGggMS8zPwoKSG1tbSB0aGUgd2hvbGUgc2VyaWVzIHNob3VsZCBiZSBiYWNr
cG9ydGVkLCBpdCBkb2VzIG5vdCBtYWtlIHNlbnNlIHRvCm1vdmUgdGhlIGR0YiBtYXBwaW5nIGFu
ZCBrZWVwIGFjY2Vzc2luZyBpdCB1c2luZyBpdHMgbGluZWFyIG1hcHBpbmcKYWRkcmVzcyBzaW5j
ZSBpdCBjb3VsZCBmYWlsIGZvciB0aGUgZXhhY3QgcmVhc29uIHRoZSByZWxvY2F0aW9uIHdhcwpp
bXBsZW1lbnRlZCBpbiB0aGUgZmlyc3QgcGxhY2UgYW5kIHRoZSByZWxvY2F0aW9uIGlzIHdyb25n
LgoKTWF5YmUgd2Ugc2hvdWxkIHNpbXBseSBhZGQgYSAiQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmciIG9uIGFsbCB0aGUgcGF0Y2hlcz8KCj4gRWl0aGVyIHdheSwKPiBSZXZpZXdlZC1ieTogQ29u
b3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPgo+IEFuZCBmcm9tIHYxIChh
bHRob3VnaCBJIGRpZG4ndCBhY3R1YWxseSBzZW5kIGl0IGZvciBpZGsgd2hhdCByZWFzb24pOgo+
IFRlc3RlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KClRo
YW5rcyEKCj4KPiBUaGFua3MsCj4gQ29ub3IuCj4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4
YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jp
c2N2L21tL2luaXQuYyB8IDIxICsrLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gPiBpbmRleCBm
Yjc4ZDZiYmFiYWUuLjBmMTRmNGE4ZDE3OSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvbW0v
aW5pdC5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ID4gQEAgLTI0OSwyNSArMjQ5
LDggQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX2Jvb3RtZW0odm9pZCkKPiA+ICAgICAgICAq
IGVhcmx5X2luaXRfZmR0X3Jlc2VydmVfc2VsZigpIHNpbmNlIF9fcGEoKSBkb2VzCj4gPiAgICAg
ICAgKiBub3Qgd29yayBmb3IgRFRCIHBvaW50ZXJzIHRoYXQgYXJlIGZpeG1hcCBhZGRyZXNzZXMK
PiA+ICAgICAgICAqLwo+ID4gLSAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19CVUlMVElOX0RU
QikpIHsKPiA+IC0gICAgICAgICAgICAgLyoKPiA+IC0gICAgICAgICAgICAgICogSW4gY2FzZSB0
aGUgRFRCIGlzIG5vdCBsb2NhdGVkIGluIGEgbWVtb3J5IHJlZ2lvbiB3ZSB3b24ndAo+ID4gLSAg
ICAgICAgICAgICAgKiBiZSBhYmxlIHRvIGxvY2F0ZSBpdCBsYXRlciBvbiB2aWEgdGhlIGxpbmVh
ciBtYXBwaW5nIGFuZAo+ID4gLSAgICAgICAgICAgICAgKiBnZXQgYSBzZWdmYXVsdCB3aGVuIGFj
Y2Vzc2luZyBpdCB2aWEgX192YShkdGJfZWFybHlfcGEpLgo+ID4gLSAgICAgICAgICAgICAgKiBU
byBhdm9pZCB0aGlzIHNpdHVhdGlvbiBjb3B5IERUQiB0byBhIG1lbW9yeSByZWdpb24uCj4gPiAt
ICAgICAgICAgICAgICAqIE5vdGUgdGhhdCBtZW1ibG9ja19waHlzX2FsbG9jIHdpbGwgYWxzbyBy
ZXNlcnZlIERUQiByZWdpb24uCj4gPiAtICAgICAgICAgICAgICAqLwo+ID4gLSAgICAgICAgICAg
ICBpZiAoIW1lbWJsb2NrX2lzX21lbW9yeShkdGJfZWFybHlfcGEpKSB7Cj4gPiAtICAgICAgICAg
ICAgICAgICAgICAgc2l6ZV90IGZkdF9zaXplID0gZmR0X3RvdGFsc2l6ZShkdGJfZWFybHlfdmEp
Owo+ID4gLSAgICAgICAgICAgICAgICAgICAgIHBoeXNfYWRkcl90IG5ld19kdGJfZWFybHlfcGEg
PSBtZW1ibG9ja19waHlzX2FsbG9jKGZkdF9zaXplLCBQQUdFX1NJWkUpOwo+ID4gLSAgICAgICAg
ICAgICAgICAgICAgIHZvaWQgKm5ld19kdGJfZWFybHlfdmEgPSBlYXJseV9tZW1yZW1hcChuZXdf
ZHRiX2Vhcmx5X3BhLCBmZHRfc2l6ZSk7Cj4gPiAtCj4gPiAtICAgICAgICAgICAgICAgICAgICAg
bWVtY3B5KG5ld19kdGJfZWFybHlfdmEsIGR0Yl9lYXJseV92YSwgZmR0X3NpemUpOwo+ID4gLSAg
ICAgICAgICAgICAgICAgICAgIGVhcmx5X21lbXVubWFwKG5ld19kdGJfZWFybHlfdmEsIGZkdF9z
aXplKTsKPiA+IC0gICAgICAgICAgICAgICAgICAgICBfZHRiX2Vhcmx5X3BhID0gbmV3X2R0Yl9l
YXJseV9wYTsKPiA+IC0gICAgICAgICAgICAgfSBlbHNlCj4gPiAtICAgICAgICAgICAgICAgICAg
ICAgbWVtYmxvY2tfcmVzZXJ2ZShkdGJfZWFybHlfcGEsIGZkdF90b3RhbHNpemUoZHRiX2Vhcmx5
X3ZhKSk7Cj4gPiAtICAgICB9Cj4gPiArICAgICBpZiAoIUlTX0VOQUJMRUQoQ09ORklHX0JVSUxU
SU5fRFRCKSkKPiA+ICsgICAgICAgICAgICAgbWVtYmxvY2tfcmVzZXJ2ZShkdGJfZWFybHlfcGEs
IGZkdF90b3RhbHNpemUoZHRiX2Vhcmx5X3ZhKSk7Cj4gPgo+ID4gICAgICAgZG1hX2NvbnRpZ3Vv
dXNfcmVzZXJ2ZShkbWEzMl9waHlzX2xpbWl0KTsKPiA+ICAgICAgIGlmIChJU19FTkFCTEVEKENP
TkZJR182NEJJVCkpCj4gPiAtLQo+ID4gMi4zNy4yCj4gPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
