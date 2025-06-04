Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BFDC5B552
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 09:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Gsj3A7yzNNRGe+BNLr3ERvmnhJ5XWBq7Bvn5sPVTtg=; b=vag+nqxmHW1qzf
	vqk5bSnv8sCissZX8h/RQzYRuce+QmpSsQuff4IyNsUqevaVsgSLPIhIBRcQTI6JjU0M7Zbr5SbcW
	7+Qli+5bBeutIyyCrD8MfWAN/3GfD+ZHAvg+40fmJYtm8MnEtBVWGHOc94f7ISGCnCvodZXEVncZi
	km6OxMsQ2xyyDZXtYen6sPmnuxkCjlkqnVQSnM9XOJQZQYuMf/M1+tP1lbwBaJMWj6R4XmkKEmvTj
	uyDb+bDoVVEdtCv1NnI8kTKjKTxv25RWv/AVdM2KhV9/xPu2W4E/TVTmHp8l4VPSoVAcOZeNGKYfL
	X9QBT0aHPABCSU/oYoRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMkbo-0000000D3Ig-3JTL;
	Wed, 04 Jun 2025 09:40:32 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMkZj-0000000D335-3TiG
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 09:38:25 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3d8020ba858so66440625ab.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jun 2025 02:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1749029903; x=1749634703; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOIWCXEE0RxznYIyh26beXHBZUfQdbelgMFfKBCSM8U=;
        b=TsmrRTSsIhGcClV3MRejj6st4nFe4rpgFSvmG9HQRnpbBPOvAWm3mHCLwZi+U22Xzv
         5EYSCg3nV4v68EcoJPazlF6vFZSXov7XBVZw5j1XziSxwO4FYX7m+N59TDuBdesCRCMf
         ed4FwkHjGUoG2vrCx5aiEfa5lsqf7T/6W2UQQOPQBqIBe/oxAJ8KbbQmQ2O63r/C+5uf
         NMs8S7lUmDlH8riheCSbiLQ1avWm1dpWwbqBxUr0/Bzgb8EfgwK033PgZUp50g/pZ+UG
         2LWb9uWmQb6R3tkTJ2l1HS37vLmgQBGGtBgr6AjAQ9OZHoEI7+cuSEw95ukPq1J+QolX
         s7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749029903; x=1749634703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOIWCXEE0RxznYIyh26beXHBZUfQdbelgMFfKBCSM8U=;
        b=RB1yZX6FFyA1lQkg089f7+ugu1zXk2639d5lVlegFYWQnbut+05L5/dzSWLfGhn+F3
         b/++0jGJRG0eNSrR3wzvLsaI09lkiZQ6Q/7mZKl1wJRioJMSLKXh73QbmIMHMNP7f7gR
         H1DhKatH2IESHEybQGkQYu5BkB8OY6LqWbFzWbx/yzCaaMCg3cb0bypjnYFbJ8BQ7dNw
         os3g4PP4SYblIBEj3yBj5sI4hg658mZxqy4bsq9TgpiVLNw1oVqgbMU+ucKvebQ3tW2j
         f32LxRjwRLsBoQxnyVTvA2+tncf2yORT9NvyJd07/uLswzNtdqX6T3M+uS1fLNlc4bt/
         ob1A==
X-Forwarded-Encrypted: i=1; AJvYcCX2lHBkZfOh/3O2gds/AtFzJIsOCdFhQGQvHfCVgmmxq6uKL1vfyOlyFLSh2U+7hJtATP6BukeBhbktTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWwpli0JYeZtK5/xOKHbEvOCpq2ujvOM6VXiyvBMfxjgfTgmu2
	IyLMZZH8l0FZzry0S+iZEV/odFfu4WB1Xuj0xfPPx1GZBqC/JEq7yhxpZnZ7vyuCjQ6Nb31PcEo
	L1Yvur8bNl9L96aq2a+IYDsJWI2vIQiqHUHyA8KCtNg==
X-Gm-Gg: ASbGncs+8RC/VqbcZ/Kc1NkUS0+sHAVowzWCE6ZRYr/S/I1hokcRKMz6VJvLH5YlU1a
	d1tSe7EsDbCbySTrs0MgiiWKvrwdqAcUv+5BnpwOr91Bk6CmFWEQeM7ZupPbF1dDohtm1ZHy6RE
	FGF7X7zf8R/hvSTG+uPd78qj06tWeI08MMl1tZH+nXXH4YVA==
X-Google-Smtp-Source: AGHT+IG8vOXK+h+y2p/PdmXHtYUOgTT0CvnkZ6qhAFOmZ6ZirSdzqcS/OrgftpiwqYuby9tRcEPX+da9XrFykmbetkg=
X-Received: by 2002:a05:6e02:1c29:b0:3dc:87c7:a5b9 with SMTP id
 e9e14a558f8ab-3ddbededa44mr20700675ab.10.1749029902722; Wed, 04 Jun 2025
 02:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250314092614.27372-1-zong.li@sifive.com> <aD3WKnyp_ffk60oF@debug.ba.rivosinc.com>
 <CANXhq0r8DeksFQC2ht8jeLpfn-0Tvuy4LU52BOMAj-AAB83+5A@mail.gmail.com> <aD-cE9IGrV6nOUjX@debug.ba.rivosinc.com>
In-Reply-To: <aD-cE9IGrV6nOUjX@debug.ba.rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 4 Jun 2025 17:38:11 +0800
X-Gm-Features: AX0GCFv8-KLRNyJz3iFIGgmal8-qIs3VXEvUr1UzUc56Y1s2sLF1iT12dkOeEaE
Message-ID: <CANXhq0pATf+gOHLbft5bo5GxoD9xKBfq=NA4t3o_2M=0DeKWEA@mail.gmail.com>
Subject: Re: [PATCH] riscv: traps: handle uprobe event in software-check exception
To: Deepak Gupta <debug@rivosinc.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_023823_869889_3EF57002 
X-CRM114-Status: GOOD (  27.81  )
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

T24gV2VkLCBKdW4gNCwgMjAyNSBhdCA5OjA24oCvQU0gRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZv
c2luYy5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBKdW4gMDMsIDIwMjUgYXQgMDk6NDg6MDhBTSAr
MDgwMCwgWm9uZyBMaSB3cm90ZToKPiA+T24gVHVlLCBKdW4gMywgMjAyNSBhdCAxMjo1MOKAr0FN
IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+Pgo+ID4+IEhpIFpv
bmcsCj4gPj4KPiA+PiBUaGFua3MgZm9yIHRha2luZyB0aGUgaW5pdGlhdGl2ZSBmb3IgbWFraW5n
IGNmaSB3b3JrIHdpdGggdXByb2JlLgo+ID4+IEFuZCBzb3JyeSBmb3Igbm90IG5vdGljaW5nIHRo
ZSBwYXRjaCBlYXJsaWVyLgo+ID4+IEZldyBjb21tZW50cyBpbmxpbmUuCj4gPj4KPiA+Pgo+ID4+
IE9uIEZyaSwgTWFyIDE0LCAyMDI1IGF0IDA1OjI2OjE0UE0gKzA4MDAsIFpvbmcgTGkgd3JvdGU6
Cj4gPj4gPkhhbmRsZSB0aGUgdXByb2JlIGV2ZW50IGZpcnN0IGJlZm9yZSBoYW5kbGluZyB0aGUg
Q0ZJIHZpb2xhdGlvbiBpbgo+ID4+ID5zb2Z0d2FyZS1jaGVjayBleGNlcHRpb24gaGFuZGxlci4g
QmVjYXVzZSB3aGVuIHRoZSBsYW5kaW5nIHBhZCBpcwo+ID4+ID5hY3RpdmF0ZWQsIGlmIHRoZSB1
cHJvYmUgcG9pbnQgaXMgc2V0IGF0IHRoZSBscGFkIGluc3RydWN0aW9uIGF0Cj4gPj4gPnRoZSBi
ZWdpbm5pbmcgb2YgYSBmdW5jdGlvbiwgdGhlIHN5c3RlbSB0cmlnZ2VycyBhIHNvZnR3YXJlLWNo
ZWNrCj4gPj4gPmV4Y2VwdGlvbiBpbnN0ZWFkIG9mIGFuIGVicmVhayBleGNlcHRpb24gZHVlIHRv
IHRoZSBleGNlcHRpb24KPiA+PiA+cHJpb3JpdHksIHRoZW4gdXByb2JlIGNhbid0IHdvcmsgc3Vj
Y2Vzc2Z1bGx5Lgo+ID4+ID4KPiA+PiA+Q28tZGV2ZWxvcGVkLWJ5OiBEZWVwYWsgR3VwdGEgPGRl
YnVnQHJpdm9zaW5jLmNvbT4KPiA+PiA+U2lnbmVkLW9mZi1ieTogRGVlcGFrIEd1cHRhIDxkZWJ1
Z0ByaXZvc2luYy5jb20+Cj4gPj4gPlNpZ25lZC1vZmYtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lm
aXZlLmNvbT4KPiA+PiA+LS0tCj4gPj4gPgo+ID4+ID5UaGlzIHBhdGNoIGlzIGJhc2VkIG9uIHRv
cCBvZiB0aGUgZm9sbG93aW5nIHNlcmllcwo+ID4+ID5bUEFUQ0ggdjExIDAwLzI3XSByaXNjdiBj
b250cm9sLWZsb3cgaW50ZWdyaXR5IGZvciB1c2VybW9kZQo+ID4+ID4KPiA+PiA+IGFyY2gvcmlz
Y3Yva2VybmVsL3RyYXBzLmMgfCA5ICsrKysrKy0tLQo+ID4+ID4gMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+PiA+Cj4gPj4gPmRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+ID4+
ID5pbmRleCAzZjc3MDlmNDU5NWEuLmVmNWE5MjExMWVlMSAxMDA2NDQKPiA+PiA+LS0tIGEvYXJj
aC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+ID4+ID4rKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFw
cy5jCj4gPj4gPkBAIC0zODYsOSArMzg2LDEyIEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJh
cF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9zb2Z0d2FyZV9jaGVjayhzdHJ1Y3QgcHRfcmVncyAqCj4g
Pj4gPiAgICAgICBpZiAodXNlcl9tb2RlKHJlZ3MpKSB7Cj4gPj4gPiAgICAgICAgICAgICAgIGly
cWVudHJ5X2VudGVyX2Zyb21fdXNlcl9tb2RlKHJlZ3MpOwo+ID4+ID4KPiA+PiA+LSAgICAgICAg
ICAgICAgLyogbm90IGEgY2ZpIHZpb2xhdGlvbiwgdGhlbiBtZXJnZSBpbnRvIGZsb3cgb2YgdW5r
bm93biB0cmFwIGhhbmRsZXIgKi8KPiA+PiA+LSAgICAgICAgICAgICAgaWYgKCFoYW5kbGVfdXNl
cl9jZmlfdmlvbGF0aW9uKHJlZ3MpKQo+ID4+ID4tICAgICAgICAgICAgICAgICAgICAgIGRvX3Ry
YXBfdW5rbm93bihyZWdzKTsKPiA+PiA+KyAgICAgICAgICAgICAgLyogaGFuZGxlIHVwcm9iZSBl
dmVudCBmcmlzdCAqLwo+ID4+ID4rICAgICAgICAgICAgICBpZiAoIXByb2JlX2JyZWFrcG9pbnRf
aGFuZGxlcihyZWdzKSkgewo+ID4+Cj4gPj4gSWYgdGFzayBoYXMgdXByb2JlIGVuYWJsZWQgYW5k
IHRoZXJlIGlzIGEgY2ZpIHZpb2xhdGlvbiBkdWUgdG8gbWlzbWF0Y2ggaW4KPiA+PiByZXR1cm4g
YWRkcmVzcyBvbiBzaGFkb3cgc3RhY2sgYW5kIHJlZ3VsYXIgc3RhY2ssIHRoZW4gaXQgd291bGQg
YmUgYSBjZmkKPiA+PiBieXBhc3MsIHJpZ2h0Pwo+ID4+IFBlcmhhcHMgd2Ugc2hvdWxkIGJlIGRv
aW5nIHRoaXMgb25seSB3aGVuIHdlIG1hdGNoIHRoYXQgc3cgY2hlY2sgZXhjZXB0aW9uCj4gPj4g
aXMgZHVlIHRvIGZvcndhcmQgY2ZpIHZpb2xhdGlvbj8KPiA+Pgo+ID4+IERvIHlvdSBhZ3JlZT8K
PiA+Cj4gPlllcywgbGV0IG1lIGFkZCBhIGNvbmRpdGlvbiBmb3IgZm9yd2FyZCBjZmkgdmlvbGF0
aW9uIGhlcmUuIFRoYW5rcyBmb3IKPiA+cG9pbnRpbmcgaXQgb3V0Lgo+Cj4gQ29vbCwgSSdsbCBz
ZW5kIG91dCBhbm90aGVyIHJldmlzaW9uIGZvciBteSBjZmkgc2VyaWVzIHRoaXMgd2Vlay4KPiBJ
ZiB5b3Ugc2VuZCBvdXQgeW91ciB1cHJvYmUgZml4LCBJIGNhbiBpbmNsdWRlIGl0IGluIG15IHBh
dGNoc2V0LgoKSGkgRGVlcGFrLApJIGhhdmUgc3VibWl0dGVkIHRoZSB2MiBwYXRjaC4gUGxlYXNl
IGxldCBtZSBrbm93IGlmIGZ1cnRoZXIKbW9kaWZpY2F0aW9ucyBhcmUgcmVxdWlyZWQuIFRoYW5r
cwpodHRwczovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LXJpc2N2LzIwMjUt
SnVuZS8wNzE0ODMuaHRtbAoKPgo+ID4KPiA+Pgo+ID4+ID4rICAgICAgICAgICAgICAgICAgICAg
IC8qIG5vdCBhIGNmaSB2aW9sYXRpb24sIHRoZW4gbWVyZ2UgaW50byBmbG93IG9mIHVua25vd24g
dHJhcCBoYW5kbGVyICovCj4gPj4gPisgICAgICAgICAgICAgICAgICAgICAgaWYgKCFoYW5kbGVf
dXNlcl9jZmlfdmlvbGF0aW9uKHJlZ3MpKQo+ID4+ID4rICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZG9fdHJhcF91bmtub3duKHJlZ3MpOwo+ID4+ID4rICAgICAgICAgICAgICB9Cj4gPj4g
Pgo+ID4+ID4gICAgICAgICAgICAgICBpcnFlbnRyeV9leGl0X3RvX3VzZXJfbW9kZShyZWdzKTsK
PiA+PiA+ICAgICAgIH0gZWxzZSB7Cj4gPj4gPi0tCj4gPj4gPjIuMTcuMQo+ID4+ID4KPiA+Pgo+
ID4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPj4g
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+ID4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
