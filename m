Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787A8C76195
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 22:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mWWR1ksqtM/OkGqQp/0Cb+EX6abGrioqozNCScdth8E=; b=JUt6dNiv8ff9mq
	3t4XknfbLDAufNF4k18fBBg2aw4qYWqBC+Nupb7In4hfivgo0W+kOTRihd5OiBrKByZfzGKNNigFG
	8Hnb+W7/wFzSTloYDHKus4EJ0tH8js0D5Nlg4bK1mkFNuB67Efwqf8HAbRdUqTjBCyxQZWZox/paT
	TMkv5U2kGAPna5X8kt6bC4Tt7aruoAFlKmxWeoGKeQ1UyYUog2hWh0QWh5BGHm+HykZ/8lyuh8b7A
	EKrRSlYzzp1v6CTzKH4hF5sX5cF1/pLrMy8AfpBM3Oo75raoKyBe9eoXFMEEnC/LinU9RFjSmzDJN
	ZmIViIkZ97VvPhy6Ru9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgv52-00CV4M-38;
	Mon, 27 Mar 2023 22:12:44 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgv50-00CV1r-0T
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 22:12:43 +0000
Received: by mail-pf1-x42d.google.com with SMTP id s8so6715131pfk.5
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 15:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679955155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7ZNQ5vjpwd7R42XQrkWv8310d6dUWZkU3XZU5SoAJo=;
        b=Q1yKGQLoJfM+HWC7tP5mFSqWLk4J0mVSYBJ2lQf2l3yZQEnGF0+dXkdNTH+MrhfUNM
         OXLWPIC2xI+XdrAznpFxXQoi6DhZ+FxiafpprzeZIi4YfHHNVOe53bcy1DsOWzEPMfeF
         PGr/eYKlzUohPyMY31QdHgsBHR6d3QFWSXqKGyClR9cuBLBPtEuogiWZP+B/z5Teo2Dr
         DYdpl3QQW0z9GZYN+MSUMmlGV7bg+IH1MB2mN+bBiSIYK/6lEGL9OnDB29vLBJNLamH6
         nWljN0GZfjFF5K5WhenQxTIpJutOrhy+blWEAkArggo0viTvvj177ckimP0gO/eafVwi
         yvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679955155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7ZNQ5vjpwd7R42XQrkWv8310d6dUWZkU3XZU5SoAJo=;
        b=eKF45CelQoz5Z8IOfYDiZlI/gVIn1PuvVz44WoQwufrmaZoDDMgqs2GgmhESqqGigw
         km9y4kosNUGEaTx0u9kBWJI71D/RVVPpgTZhU6azvLw207lKbA9DPWWi9GYL6Vvc0QP+
         9wflFfA74BsX1jd1fitRH/MlSKg9pdtMZQIrunJBoMjDjI4fiOc4S3ljpCQQe/V9S3Tg
         2zLUdcAb6zVNF3UFkIxqnHhiYaTaMwREH+7jBZR9OP+HEaPySO4sPu1aH0jsIV9GlZLx
         3cCdkoF/MeXX45KgLkkaxsA3OzMMgr5pnUDQKCo+ImwEKGAYzc9ML+SneOo7is3/AW9V
         bErQ==
X-Gm-Message-State: AAQBX9cV307HH0lRnkJS/IkKBYPBa6UXa9cRrIZS3EXbJriYDqy1wI1v
	4qzgSaecwOihi5WlR4PzTHPMT3AFiJ23AHp5jKDYbA==
X-Google-Smtp-Source: AKy350bYwQem0GhjZOScZ9GwtnL6TWyI1IM4jybdrpoYRsAE3bh54QWxNFYp2c1iazl+9mV7SBW0PIgm8yA8LdllWa0=
X-Received: by 2002:a63:446:0:b0:503:7be3:e81d with SMTP id
 67-20020a630446000000b005037be3e81dmr3549449pge.1.1679955155235; Mon, 27 Mar
 2023 15:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230326182120.194541-1-hi@alyssa.is>
In-Reply-To: <20230326182120.194541-1-hi@alyssa.is>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 27 Mar 2023 15:12:23 -0700
Message-ID: <CAKwvOdmTLCqLV8bfXY4X0xgg9eYaVNDEUwzbvNrK-SUTVhuxRQ@mail.gmail.com>
Subject: Re: [PATCH v2] purgatory: fix disabling debug info
To: Alyssa Ross <hi@alyssa.is>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nick Cao <nickcao@nichi.co>, linux-kbuild@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, Tom Rix <trix@redhat.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_151242_184887_A0D353CF 
X-CRM114-Status: GOOD (  16.95  )
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

T24gU3VuLCBNYXIgMjYsIDIwMjMgYXQgMTE6MjPigK9BTSBBbHlzc2EgUm9zcyA8aGlAYWx5c3Nh
LmlzPiB3cm90ZToKPgo+IFNpbmNlIDMyZWY5ZTUwNTRlYywgLVdhLC1nZHdhcmYtMiBpcyBubyBs
b25nZXIgdXNlZCBpbiBLQlVJTERfQUZMQUdTLgo+IEluc3RlYWQsIGl0IGluY2x1ZGVzIC1nLCB0
aGUgYXBwcm9wcmlhdGUgLWdkd2FyZi0qIGZsYWcsIGFuZCBhbHNvIHRoZQo+IC1XYSB2ZXJzaW9u
cyBvZiBib3RoIG9mIHRob3NlIGlmIGJ1aWxkaW5nIHdpdGggQ2xhbmcgYW5kIEdOVSBhcy4gIEFz
IGEKPiByZXN1bHQsIGRlYnVnIGluZm8gd2FzIGJlaW5nIGdlbmVyYXRlZCBmb3IgdGhlIHB1cmdh
dG9yeSBvYmplY3RzLCBldmVuCj4gdGhvdWdoIHRoZSBpbnRlbnRpb24gd2FzIHRoYXQgaXQgbm90
IGJlLgoKQWgsIGdvb2QgY2F0Y2ghCgo+Cj4gRml4ZXM6IDMyZWY5ZTUwNTRlYyAoIk1ha2VmaWxl
LmRlYnVnOiByZS1lbmFibGUgZGVidWcgaW5mbyBmb3IgLlMgZmlsZXMiKQo+IFNpZ25lZC1vZmYt
Ynk6IEFseXNzYSBSb3NzIDxoaUBhbHlzc2EuaXM+Cj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmcKPiAtLS0KPgo+IERpZmZlcmVuY2UgZnJvbSB2MjogcmVwbGFjZSBlYWNoIEFGTEFHU19SRU1P
VkVfKiBhc3NpZ25tZW50IHdpdGggYQo+IHNpbmdsZSBhZmxhZ3MtcmVtb3ZlLXkgbGluZSwgYW5k
IHVzZSBmb3JlYWNoIHRvIGFkZCB0aGUgLVdhIHZlcnNpb25zLAo+IGFzIHN1Z2dlc3RlZCBieSBN
YXNhaGlybyBZYW1hZGEuCj4KPiAgYXJjaC9yaXNjdi9wdXJnYXRvcnkvTWFrZWZpbGUgfCA3ICst
LS0tLS0KPiAgYXJjaC94ODYvcHVyZ2F0b3J5L01ha2VmaWxlICAgfCAzICstLQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L3B1cmdhdG9yeS9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvcHVyZ2F0b3J5L01h
a2VmaWxlCj4gaW5kZXggZDE2YmY3MTVhNTg2Li41NzMwNzk3YTZiNDAgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9wdXJnYXRvcnkvTWFrZWZpbGUKPiArKysgYi9hcmNoL3Jpc2N2L3B1cmdhdG9y
eS9NYWtlZmlsZQo+IEBAIC04NCwxMiArODQsNyBAQCBDRkxBR1Nfc3RyaW5nLm8gICAgICAgICAg
ICAgICAgICAgICAgKz0gJChQVVJHQVRPUllfQ0ZMQUdTKQo+ICBDRkxBR1NfUkVNT1ZFX2N0eXBl
Lm8gICAgICAgICAgKz0gJChQVVJHQVRPUllfQ0ZMQUdTX1JFTU9WRSkKPiAgQ0ZMQUdTX2N0eXBl
Lm8gICAgICAgICAgICAgICAgICs9ICQoUFVSR0FUT1JZX0NGTEFHUykKPgo+IC1BRkxBR1NfUkVN
T1ZFX2VudHJ5Lm8gICAgICAgICAgKz0gLVdhLC1nZHdhcmYtMgo+IC1BRkxBR1NfUkVNT1ZFX21l
bWNweS5vICAgICAgICAgKz0gLVdhLC1nZHdhcmYtMgo+IC1BRkxBR1NfUkVNT1ZFX21lbXNldC5v
ICAgICAgICAgKz0gLVdhLC1nZHdhcmYtMgo+IC1BRkxBR1NfUkVNT1ZFX3N0cmNtcC5vICAgICAg
ICAgKz0gLVdhLC1nZHdhcmYtMgo+IC1BRkxBR1NfUkVNT1ZFX3N0cmxlbi5vICAgICAgICAgKz0g
LVdhLC1nZHdhcmYtMgo+IC1BRkxBR1NfUkVNT1ZFX3N0cm5jbXAubyAgICAgICAgICAgICAgICAr
PSAtV2EsLWdkd2FyZi0yCgpSZW1vdmluZyB0aGUgZXhwbGljaXQgYC1XYSwtZ2R3YXJmLTJgIG1h
a2VzIHNlbnNlOyBub3RoaW5nIGV2ZXIgc2V0cyBpdC4KCj4gK2FzZmxhZ3MtcmVtb3ZlLXkgICAg
ICAgICAgICAgICArPSAkKGZvcmVhY2ggeCwgLWcgLWdkd2FyZi00IC1nZHdhcmYtNSwgJCh4KSAt
V2EsJCh4KSkKCklzIGl0IHNpbXBsZXIgdG8ganVzdCBhcHBlbmQgYC1nMGAgdG8gdGhlIHJ1bm5p
bmcgbGlzdCBvZiBhc2ZsYWdzOwp0aGF0IHNob3VsZCBhbHNvIGRpc2FibGUgdGhlIGVtaXNzaW9u
IG9mIGRlYnVnIGluZm8/IE9yIGRvZXMgdGhhdCBub3QKcmVtb3ZlIGRlYnVnIGluZm8gZnJvbSB0
aGUgYXNzZW1ibGVyPwoKRWl0aGVyIHdheToKQWNrZWQtYnk6IE5pY2sgRGVzYXVsbmllcnMgPG5k
ZXNhdWxuaWVyc0Bnb29nbGUuY29tPgphbmQgdGhhbmtzIGZvciB0aGUgcGF0Y2ghCgo+Cj4gICQo
b2JqKS9wdXJnYXRvcnkucm86ICQoUFVSR0FUT1JZX09CSlMpIEZPUkNFCj4gICAgICAgICAgICAg
ICAgICQoY2FsbCBpZl9jaGFuZ2VkLGxkKQo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9wdXJnYXRv
cnkvTWFrZWZpbGUgYi9hcmNoL3g4Ni9wdXJnYXRvcnkvTWFrZWZpbGUKPiBpbmRleCAxN2YwOWRj
MjYzODEuLjgyZmVjNjZkNDZkMiAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni9wdXJnYXRvcnkvTWFr
ZWZpbGUKPiArKysgYi9hcmNoL3g4Ni9wdXJnYXRvcnkvTWFrZWZpbGUKPiBAQCAtNjksOCArNjks
NyBAQCBDRkxBR1Nfc2hhMjU2Lm8gICAgICAgICAgICAgICAgICAgICAgICs9ICQoUFVSR0FUT1JZ
X0NGTEFHUykKPiAgQ0ZMQUdTX1JFTU9WRV9zdHJpbmcubyAgICAgICAgICs9ICQoUFVSR0FUT1JZ
X0NGTEFHU19SRU1PVkUpCj4gIENGTEFHU19zdHJpbmcubyAgICAgICAgICAgICAgICAgICAgICAg
ICs9ICQoUFVSR0FUT1JZX0NGTEFHUykKPgo+IC1BRkxBR1NfUkVNT1ZFX3NldHVwLXg4Nl8kKEJJ
VFMpLm8gICAgICArPSAtV2EsLWdkd2FyZi0yCj4gLUFGTEFHU19SRU1PVkVfZW50cnk2NC5vICAg
ICAgICAgICAgICAgICAgICAgICAgKz0gLVdhLC1nZHdhcmYtMgo+ICthc2ZsYWdzLXJlbW92ZS15
ICAgICAgICAgICAgICAgKz0gJChmb3JlYWNoIHgsIC1nIC1nZHdhcmYtNCAtZ2R3YXJmLTUsICQo
eCkgLVdhLCQoeCkpCj4KPiAgJChvYmopL3B1cmdhdG9yeS5ybzogJChQVVJHQVRPUllfT0JKUykg
Rk9SQ0UKPiAgICAgICAgICAgICAgICAgJChjYWxsIGlmX2NoYW5nZWQsbGQpCj4KPiBiYXNlLWNv
bW1pdDogZGE4ZTdkYTExZTRiYTc1OGNhZjRjMTQ5Y2M4ZDhjZDU1NWFlZmU1Zgo+IC0tCj4gMi4z
Ny4xCj4KCgotLSAKVGhhbmtzLAp+TmljayBEZXNhdWxuaWVycwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
