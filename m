Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DADC27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 07:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5FhbjPPLkr3NLTcvE0r47s3KmguFuUfAEt9coleJ4UM=; b=x0vKkBneWuRT6P
	UtP4i5MKCvO06TIZuxJ9ivZr99Gm0Zv0jaAoa9e41FlRpOjhwPpQgKOxq+rtcPsAUMRKCwvWVpMYn
	EUehC+6DE8zvmRWd14uZ/kkCU7V3ARpJHvr0eP7UchCwEof1K4uVlpiaT3VGpoyF2Nrjw00svrbUd
	WApUPxXI2S8Kivccm66E4NmvveQbgY+QkVJztLNeSjzpEX2sf5E3y3NchxnL0pyWsoDfGr8ZxoYcr
	ynwvaaYiNXoGFOp5T/vjUSZTafFoyJDIGkLtYXvORiFf3ewtme7ShA9R+7gJGYBGLX3Wogt1GAprf
	p2dFa79SXBS1t1xPA5Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHICp-0000000BODn-3yKb;
	Wed, 12 Jun 2024 07:15:39 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHICm-0000000BOCk-3214
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 07:15:38 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4223427513eso1117035e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jun 2024 00:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718176528; x=1718781328; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jsA9fUmKBK5EdL/aJskGAqPwShxYcp+fy8oN2nYqXck=;
        b=1w7LzA7YB1D0CUpJEP48yOsF7nW7m8hS4M3LWvUfEz7ugbtlL2muUzfQZ4/pvtqqtd
         Q3LqD919ELSSToa1tHr9/R8v0tLZ/+VJEJM0U/TwhLFiYcu9mzrvytBZ3Zw9bAun55EJ
         XEQOsf9cAuatBK2mRzCuD7vlih/HNYlozLI6qq+oHcZH8/AGN1/5Zdyf+83cQe1ONEuk
         N8osgdXyNPX99kgwB5ivU0k2Atg8I7tdkbIAwvWcW/d7xCezPk0tlPkZiO8KCleyL7Oo
         GgJaBiXRj7zNpBVNC+N9N4fqbxvKn+JWzDmROPD7OxnoLOOa7rTMIJSlazsX2r9DVP3s
         7CTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718176528; x=1718781328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jsA9fUmKBK5EdL/aJskGAqPwShxYcp+fy8oN2nYqXck=;
        b=xU4lARkELe0Fn5PYUVmhlYvZI3TxXYGcaVVCXEhzG9J2FV8on9o8NYTlBAyp9gT4w2
         m51yR9xtMYEZvH4ot1UDj5dJq3rTLtamX1kdNyH/2tZG/hj0mMH6joMpQ2dEG3L8QyB4
         F7bylmvAK0MGYZbVgdlwy2plyeDWhFk8WsR2J0TBTTLplZqvo72u5J/60gOmUGXZIf/b
         tVevxS+TAjrjnXSZ3oM6Kc5ATjH0dREgA3jEdcbp49gVrs3C5yOdXSKDMNDryBd98o+8
         /Ge4GjWGQyCZw5SgUdDWdYiSNxY3d0NNETx7sWO5n4dGhi4HDgIWi0vvbsjN0eoqZlLb
         bVvA==
X-Forwarded-Encrypted: i=1; AJvYcCVYdZX1w5GqHBQfz0QiZ9Z/pUKjPyXAo6xJN8TpEyNQXU/ju0GG8DBPT8Rv6t9+nh9czIWTuO9P8Fkm0Y944SaVanMIz1ihTjuAhRYQdigG
X-Gm-Message-State: AOJu0YwbtOlmUsQGLTj3vlmujFPrEEQ9THVf3d1hfyy4OU7rD0+dEQe1
	5sDon24jByt2N0ZBCmoNoFsz7UcCZdEwwknMS2klVUVNToYVYMLYWef16BhSCSw=
X-Google-Smtp-Source: AGHT+IEQ29/S9QpyDljWJ4Q4lcG+cZp9+XdCUGpDNx727bkXJb6iRVuXIr3ff2x3ippJIse1bLhIPw==
X-Received: by 2002:a05:600c:5487:b0:421:7ee4:bbfe with SMTP id 5b1f17b1804b1-42285d851b0mr6833735e9.0.1718176528377;
        Wed, 12 Jun 2024 00:15:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:e10f:8f03:e7e9:a919? ([2a01:e0a:999:a3a0:e10f:8f03:e7e9:a919])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286fe75ebsm13845365e9.9.2024.06.12.00.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 00:15:27 -0700 (PDT)
Message-ID: <c1f5a958-1130-4bdb-a154-0c0eeb06c8f9@rivosinc.com>
Date: Wed, 12 Jun 2024 09:15:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
To: Deepak Gupta <debug@rivosinc.com>, Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Jesse Taube <jesse@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Atish Patra <atishp@rivosinc.com>
References: <20240531162327.2436962-1-jesse@rivosinc.com>
 <20240531-uselessly-spied-262ecf44e694@spud>
 <b199fde6-c24e-4c18-9c38-fdc923294551@ghiti.fr>
 <20240603-stinking-roster-cfad46696ae5@spud>
 <ZmNWmxak9Rc80Kpb@debug.ba.rivosinc.com>
 <c288f739-2a1a-4fd7-884b-12e360a33142@rivosinc.com>
 <20240610-qualm-chalice-72d0cc743658@wendy>
 <01547275-8c8c-43cf-9da0-64825c234707@rivosinc.com>
 <Zmdq6kszPBxAvLdD@debug.ba.rivosinc.com>
 <20240610-earplugs-anybody-ebd04a5fa777@spud>
 <Zmht+h75GgxP3ocz@debug.ba.rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <Zmht+h75GgxP3ocz@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_001536_893473_4CDCC8C2 
X-CRM114-Status: GOOD (  35.61  )
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

CgpPbiAxMS8wNi8yMDI0IDE3OjMyLCBEZWVwYWsgR3VwdGEgd3JvdGU6Cj4gT24gTW9uLCBKdW4g
MTAsIDIwMjQgYXQgMTA6NTY6MzVQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+PiBPbiBN
b24sIEp1biAxMCwgMjAyNCBhdCAwMjowNjo1MFBNIC0wNzAwLCBEZWVwYWsgR3VwdGEgd3JvdGU6
Cj4+PiBPbiBNb24sIEp1biAxMCwgMjAyNCBhdCAxMToxNjo0MkFNICswMjAwLCBDbMOpbWVudCBM
w6lnZXIgd3JvdGU6Cj4+PiA+IE9uIDEwLzA2LzIwMjQgMTE6MDIsIENvbm9yIERvb2xleSB3cm90
ZToKPj4+ID4gPiBPbiBNb24sIEp1biAxMCwgMjAyNCBhdCAxMDozMzozNEFNICswMjAwLCBDbMOp
bWVudCBMw6lnZXIgd3JvdGU6Cj4+PiA+ID4gPiBPbiAwNy8wNi8yMDI0IDIwOjUxLCBEZWVwYWsg
R3VwdGEgd3JvdGU6Cj4+PiA+ID4gPiA+IE9uIE1vbiwgSnVuIDAzLCAyMDI0IGF0IDAxOjQ3OjQw
UE0gKzAxMDAsIENvbm9yIERvb2xleSB3cm90ZToKPj4+ID4gPiA+ID4gPiBPbiBNb24sIEp1biAw
MywgMjAyNCBhdCAxMToxNDo0OUFNICswMjAwLCBBbGV4YW5kcmUgR2hpdGkKPj4+IHdyb3RlOgo+
Pj4gPiA+ID4gPiBJIGRvbid0IGtub3cgYWxsIHRoZSBkZXRhaWxzIGJ1dCBvbiBmaXJzdCBnbGFu
Y2UgaXQgc2VlbXMKPj4+IGxpa2UgaW5zdGVhZAo+Pj4gPiA+ID4gPiBvZiBBQ1BJLAo+Pj4gPiA+
ID4gPiBtYXkgYmUgRldGVCBpcyBhIGJldHRlciBwbGFjZSBmb3IgZGlzY292ZXJ5ID8KPj4+ID4g
PiA+ID4KPj4+IGh0dHBzOi8vbGlzdHMucmlzY3Yub3JnL2cvdGVjaC1wcnMvdG9waWMvcGF0Y2hf
djEyX2FkZF9maXJtd2FyZS8xMDY0Nzk1NzEKPj4+ID4gPiA+Cj4+PiA+ID4gPiBJTUhPLCBkb2lu
ZyBkaXNjb3ZlcnkgaW4gRldGVCBpcyBub3QgdGhlIGdvYWwgb2YgdGhpcwo+Pj4gZXh0ZW5zaW9u
LiBJIHRoaW5rCj4+PiA+ID4gPiB0aGUgInJlYWwiIHNvbHV0aW9uIHdvdWxkIGJlIHRvIHdhaXQg
Zm9yIHRoZSB1bmlmaWVkIGRpc2NvdmVyeQo+Pj4gdGFzawo+Pj4gPiA+ID4gZ3JvdXAgdG8gY29t
ZSB1cCB3aXRoIHNvbWV0aGluZyBmb3IgdGhhdCAod2hpY2ggaXMgdGhlaXIgZ29hbCBJCj4+PiB0
aGluaykgWzFdCj4+Pgo+Pj4gWWVhaCBJIHVuZGVyc3RhbmQgdGhlIGNvbnVuZHJ1bSBoZXJlLgo+
Pj4KPj4+ID4gPgo+Pj4gPiA+IEknbSBjdXJpb3VzIHRvIHNlZSBob3cgdGhhdCB3b3JrcyBvdXQu
IFRoZSBwcm9wb3NhbCBkb2N1bWVudHMgYW4KPj4+IG0tbW9kZQo+Pj4gPiA+IGNzciwgc28gd2Un
ZCBoYXZlIHRvIHNtdWdnbGUgdGhlIGluZm9ybWF0aW9uIHRvIHMtbW9kZSBzb21laG93Li4uCj4+
PiA+Cj4+PiA+IEFoZW0sIHllYWgsIEkgc3Bva2UgYSBiaXQgdG9vIGZhc3QuIExvb2tlZCBhdCB0
aGUgcHJvcG9zYWwgYW5kIHRoZQo+Pj4gPiBtY29uZmlncHRyIENTUiB3aWxsIGJlIGFjY2Vzc2li
bGUgYnkgTS1tb2RlIG9ubHkgc28gSSBndWVzcyB3ZSB3aWxsCj4+PiBoYXZlCj4+PiA+IHRvIGZp
bmQgYW5vdGhlciB3YXkuLi4KPj4+Cj4+PiBUaGF0J3Mgbm90IHRoZSBvbmx5IHByb2JsZW0uIEV2
ZW4gaWYgeW91IGdldCBtY29uZmlncHRyIGFjY2VzcywKPj4+IHBhcnNpbmcgdGhlIGZvcm1hdAo+
Pj4gaXMgYW5vdGhlciB0aGluZyB0aGF0IGhhcyB0byBiZSBkb25lLiBUaGlzIGlzIGVhcmx5IGlu
IGJvb3QuIEFsdGhvdWdoCj4+PiBpdHMgc3RyaWN0bHkgKHB1bgo+Pj4gaW50ZW5kZWQpIG5vdCBh
IGZpcm13YXJlIGZlYXR1cmUgZXh0ZW5zaW9uLCBJIHRoaW5rIGl0J3MgbXVjaCBlYXNpZXIKPj4+
IHRvIGFzayB1bmRlcmx5aW5nCj4+PiBmaXJtd2FyZSBpZiBwbGF0Zm9ybSBpcyBgU3N0cmljdGAu
IG9yIG1heSBiZSBleHBvc2Ugc29tZXRoaW5nIGxpa2UgYmVsb3cKPj4+Cj4+PiBgRU5BQkxFX1NT
VFJJQ1RgLgo+Pj4gUGxhdGZvcm1zIHdoaWNoIHN1cHBvcnQgYFNzdHJpY3RgIGNhbiByZXR1cm4g
c3VjY2VzcyBmb3IgdGhpcyB3aGlsZQo+Pj4gcGxhdGZvcm1zIHdoaWNoIGRvbid0Cj4+PiBoYXZl
IGBTc3RyaWN0YCBjYW4gcmV0dXJuIGVycm9yIGNvZGUgKG5vdCBzdXBwb3J0ZWQgb3Igbm90IGlt
cGxlbWVudGVkKS4KPj4+IFRoaXMgd2F5IGl0cyBub3QgZmVhdHVyZSBkaXNjb3ZlcnkuCj4+Cj4+
IEkgbWVhbiwgaXQncyBmZWF0dXJlIGRpc2NvdmVyeSBpbiBhbGwgYnV0IG5hbWUuIFlvdSdyZSBj
YWxsaW5nIGl0Cj4+IGVuYWJsZSwgYnV0IHRoZSBiZWhhdmlvdXIgeW91IGRlc2NyaWJlIGlzIGZl
YXR1cmUgZGlzY292ZXJ5IC0gbm90IHRoYXQgSQo+PiBhbSBhZ2FpbnN0IHRoaXMgYmVpbmcgZmVh
dHVyZSBkaXNjb3Zlcnkgc2luY2UgaXQgZ2V0cyB1cyBvdXQgb2YgYW4KPj4gYW5ub3lpbmcgYmlu
ZC4KPiAKPiBZZXMgSSBrbm93IGl0J3MgY2hlYXRpbmcgYnV0IGF0IGxlYXN0IGZvciB0aGlzIGNh
c2UsIGl0IHNlZW1zIGxpa2UgZWFzeQo+IHNvbHV0aW9uIHdoaWNoCj4gZG9lc24ndCBicmVhayBh
bnl0aGluZy4gTmVpdGhlciBJIHNlZSBpdCBjcmVhdGluZyBhbnkgZnV0dXJlIHByb2JsZW1zCj4g
KGV4Y2VwdCBGV0ZUIGJlY29taW5nCj4gdG8gbG9vayBsaWtlIGRpc2NvdmVyeSBtZWNoYW5pc20g
Oi0pIGFuZCBDbGVtZW50L0F0aXNoIGhhdGluZyBtZSBmb3IgdGhhdCkKCkFoYWggbm8gd29ycmll
czspIFRoaW5raW5nIGEgYml0IG1vcmUgYWJvdXQgaXQsIGlmIHdlIG5lZWQgb25seSBhIGZldwpl
eHRlbnNpb25zIHRvIGJlIGRpc2NvdmVyYWJsZSwgaXQgc2VlbXMgbWFuYWdlYWJsZSAoaWUgYWRk
IGEgImxvY2tlZCIKZmVhdHVyZSB0aGF0IHJlcG9ydCB0aGUgZXh0ZW5zaW9uIGF2YWlsYWJpbGl0
eSBpdHNlbGYsIGdldCBvbmx5IHdpbGwKd29yaywgc2V0IHdpbGwgcmV0dXJuIFNCSV9FREVOSUVE
KS4gQnV0IGlmIG5lZWQgbW9yZSBvZiB0aGVtLCB0aGVuIGEKZGVkaWNhdGVkIG1lY2hhbmlzbSBz
aG91bGQgcHJvYmFibHkgYmUgZGVzaWduZWQuCgpDbMOpbWVudAoKPiAKPiBBbm90aGVyIHNvbHV0
aW9uIHRvIHRoaXMgY291bGQgYmUgaW50cm9kdWNpbmcgYSByaXNjdiBjb25maWcKPiBgQ09ORklH
X1JJU0NWX1NTVFJJQ1RgLgo+IEJ5IGRlZmF1bHQgYWx3YXlzIHNlbGVjdCBgQ09ORklHX1JJU0NW
X1NTVFJJQ1RgIGFuZCBhbnkgcGxhdGZvcm0gb3duZXIKPiB3aG8gYXJlIG5vdAo+IHNzdHJpY3Qs
IHRoZXkgY2FuIGJ1aWxkIHRoZWlyIG93bi4KPiBJIGV4cGVjdCBkaXN0cm8gKHVidW50dSwgcmVk
IGhhdCwgZXRjKSB3b3VsZCB3YW50IGJ5IGRlZmF1bHQKPiBgQ09ORklHX1JJU0NWX1NTVFJJQ1Rg
Lgo+IAo+Pgo+PiBJIGZvcmdldCB3aGljaCBleHRlbnNpb24gQWxleCBhbmQgSSBkaXNjdXNzZWQg
cHJldmlvdXNseSwgYnV0IHRoZXJlJ3MKPj4gc29tZSBtbS1yZWxhdGVkIHRoaW5ncyB0aGF0IHlv
dSdyZSBnb25uYSBoYXZlIHRvIHByb2JlIHN1cGVyIGVhcmx5IGFuZAo+PiB3ZSBuZWVkIHRvIGZp
Z3VyZSBvdXQgaWYgd2UgY2FuIGdldCB0aGF0IGluZm8gZnJvbSBBQ1BJIG9yIG5vdC4gSSBrbm93
Cj4+IHdlIGRpc2N1c3NlZCBpdCB3LnIudC4gb25lIG9mIHRoZSBULUhlYWQgdmVuZG9yIGV4dGVu
c2lvbnMsIGJ1dCBJIHRoaW5rCj4+IGFub3RoZXIgc3RhbmRhcmQgb25lIGdvdCBtZW50aW9uZWQg
dG9vLgo+Pgo+Pj4gSXQgc2VlbXMgbGlrZSBhcm02NCBwYXJzZXMgZmR0IGFuZCBpdCByZWFkcyBj
ZXJ0YWluIENTUnMgdG9vCj4+PiAoYGFyY2gvYXJtNjQva2VybmVsL3BpL2thc2xyX2Vhcmx5LmNg
KS4gQWx0aG91Z2ggaXQgZG9lc24ndCBsb29rIGxpa2UKPj4+IGl0IGhhcyB0byBkbyBhbnkKPj4+
IGRpc2NvdmVyeSBmb3IgdGhlbS4KPj4KPj4gQSBkZWNyZWUgZnJvbSB0aGUgUGFsbWVyIHRoYXQg
d2UgZG9uJ3Qgc3VwcG9ydCB0aGluZ3MgdGhhdCBkbyBub3QgY29uZm9ybQo+PiBpbiB0aGlzIG1h
bm5lciB3b3VsZCBhbGxvdyB1cyB0byBkbyB3aGF0IGFybTY0IGRvZXMuIEkgYnJvdWdodCB0aGlz
IHVwCj4+IG9yaWdpbmFsbHkgYmVjYXVzZSBpdCdzIGJlZW4gZGlzY3Vzc2VkIGJlZm9yZSB0aGF0
IHdlIGNhbm5vdCByZWx5IG9uCj4+IGNvbmZvcm1hbmNlIGJlY2F1c2Ugd2Ugd2FudCB0byBzdXBw
b3J0IHBlb3BsZSdzIHBsYXRmb3Jtcywgd2hldGhlciB0aGV5Cj4+IGNvbXBseSBvciBub3QuIEkn
ZCBiZSB3YXJ5IG9mIG1ha2luZyB0aGlzIGFuIGV4Y2VwdGlvbiBub3csIGFuZCB0aGVuCj4+IGxh
dGVyIG9uIHNvbWVvbmUgbWFrZXMgYSBwbGF0Zm9ybSB3ZSB3YW50IHRvIHN1cHBvcnQgdGhhdCBk
b2Vzbid0Cj4+IGNvbmZvcm0gYW5kIGhleSBwcmVzdG8sIHdlIHJlZ3Jlc3MgS0FTTFIgc3VwcG9y
dCAtIGV2ZW4gaWYgSSB0aGluayBpdCBpcwo+PiBwcmV0dHkgdW5saWtlbHkgdGhhdCBzb21lb25l
IGlzIGdvaW5nIHRvIHJlcHVycG9zZSB0aGUgWmtyIENTUnMuCj4+Cj4+IE9uZSBvZiB0aGUgcHJv
YmxlbXMgd2l0aCBvbmx5IHN1cHBvcnRpbmcgY29uZm9ybWluZyBwbGF0Zm9ybXMgaXMgdGhhdAo+
PiB0aGUgZGVmaW5pdGlvbiBvZiBjb25mb3JtaW5nIGNoYW5nZXMgb3ZlciB0aW1lISBUaGlzIGhh
cyBoYXBwZW5lZCB3aXRoCj4+IHRoZSBBbmRlcyBQTVUgZm9yIGV4YW1wbGUsIHdoaWNoIEkgYmVs
aWV2ZSB1c2VzIGFuIGludGVycnVwdCBudW1iZXIgdGhhdAo+PiB3YXMgbGF0ZXIgY28tb3B0ZWQg
YnkgQUlBIHNwZWMuIFRoYXQgY29uZm9ybWVkIGF0IHRoZSB0aW1lLCBidXQgZG9lc24ndAo+PiBh
bnltb3JlIC0gZG8gdGhleSBnZXQgdG8gbWFyayB0aGVtc2VsdmVzIGFzIFNzdHJpY3Q/Cj4+Cj4+
IE1heWJlIHdlIGNhbiBkbyB0aGlzIG9uIGEgY2FzZS1ieS1jYXNlIGJhc2lzLCBidXQgaXQncyB1
cCB0byBQYWxtZXIKPj4gd2hldGhlciBvciBub3Qgd2UgY2FuIGRvIHRoYXQuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
