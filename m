Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FC7C531DC
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 16:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yRvpN+/Oh4/T3qAlrJ4mn1KX78CA821MAUa5O2UjnJ4=; b=In5mFfKwG5/eh1
	m6moDVUP0pT6TfJjKyTdGOn/W7XvrRVBnr6XgtzNKYzvj1/1qKfdrmejQVSN5QI+9TFXVIAsUi1/A
	jmig8kDVWI8oBHogHOs3YBlQEw4Il+yBpW7wqPQ3mYSBnoanILckpoMASCowL6biz9TSUiGVACzzM
	MIOyc4gdVupW31VMfpFWrnmyh7wUQ8jn6jhGgJAPKmWti4iRTHwSftmp3ZxHITlGGzVHYk/k4HWmB
	m7PFpW9DtfyaDllFouHUzVOv9RoIZpPU5IozYupZSjIA9MRtPgQWmR+aEquLGD/9QTu3TmUL2SkaA
	xPehFwM3GezMPvcb7PNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sezSh-0000000DWEs-2Pnf;
	Fri, 16 Aug 2024 16:05:59 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sezSe-0000000DWEW-0hWn
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 16:05:57 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-81f861f369aso102859639f.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2024 09:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723824354; x=1724429154; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o84N4ouk6Dkhcje+6ztzZIHY0vWe2YxL+gh1TxT0Vmk=;
        b=DmZD+hlN4bwH0TvUBmc5fEaVVKhZHYOA6xx/7jMotcXNUsp+ME9B0WEZXR2fKH1Pr6
         rysZAIqWti0ucK1LcsbuHic5EeAa8eF3aStyHPAG5sadoJvsliT1S0v/c5hGfsC0Os/Y
         wRvqdhvb67cViNvKK3hSE3dnvKZKTC8woxSvZr/0LKlzEEMVK7YGFYGCg0tLkyDgI+E6
         qdxAckgYQovrtGIOk6Mj/cz91KLKWeKTI6WWlvcVvGCXwVAIhDEEYS+nRPLeMeBtNT/8
         dPOgf7emCZgUY1imoD5RVK+NA1uOGg9hKRqzu2N4iVqyecfGjphYgabUN6Bp4IN4vFGE
         nnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723824354; x=1724429154;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o84N4ouk6Dkhcje+6ztzZIHY0vWe2YxL+gh1TxT0Vmk=;
        b=VkDZ7qP+RmLjY4Nz0HOHz5hkqnPrAOEkL3aV3G4APa6RmVf+lK7znyXBicagRfC0BI
         NDoUcVWlru3R5HQsKtvCAUx5EQ2BdClPvwzWzyNQ2iFec24xcY+XbokahQhbeE2hMN7/
         bnayXxDDxLP+0U8FGeVBxVvzvspx/kHk/TAc0wzOP38W/3NewJXI1lEyqm++1tGKUHD/
         11FTppnikL52xfmHnPwduAa9SxsnRWfZ32/hekRi8BdWRm+o2HAsBRgJWsAN49wNcDV2
         f2XUyIehcNIdpnP75tfV+/lMJWKrw710NEc56glQX/IEwWxOpP8k4plwWNwSf5rEep8Z
         3K4w==
X-Forwarded-Encrypted: i=1; AJvYcCX8DXIJ4kTJxYUPryqTzuwLsnT79GUCJzRHuCWiIqxDi25dCgsqcNAzah+0xjY3ZkAGYo8Iml9qNdVG52YDFXZ6/xrBJAxHXn9D2I2yuxpQ
X-Gm-Message-State: AOJu0YyP+qFsOLZTK8f+fKYqD6QAqQ2+Z7Txng/3lLj4J5ma+S3W5KOi
	pKCa2uqwOeN+75UDwxIlvvcVmDPhVnTLlDpLAJgdBndfeeHdy7owfJBERbcBhIJiPzi+U3f/Thc
	H
X-Google-Smtp-Source: AGHT+IG4laNFDhHnrQVOSwBV9czZ1pZoYL3nYxxmHeLOYJCIUBgZ9DJquHb1GQnoxRC0uU+qj0Q7Hg==
X-Received: by 2002:a05:6e02:1c49:b0:39a:e9b8:cdae with SMTP id e9e14a558f8ab-39d1bc97b4emr73110195ab.0.1723824353392;
        Fri, 16 Aug 2024 09:05:53 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-39d247324afsm11366425ab.13.2024.08.16.09.05.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 09:05:52 -0700 (PDT)
Message-ID: <7d741701-8966-45f1-8404-4b3618d44ea4@sifive.com>
Date: Fri, 16 Aug 2024 11:05:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] riscv: Add support for userspace pointer masking
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
 Conor Dooley <conor@kernel.org>, kasan-dev@googlegroups.com,
 Atish Patra <atishp@atishpatra.org>, Evgenii Stepanov <eugenis@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20240814081437.956855-1-samuel.holland@sifive.com>
 <20240814081437.956855-5-samuel.holland@sifive.com>
 <CAK9=C2XOktu5kPXEWKMY4Wsf0D9kwh3rZNXricWqLQaiaqWnnQ@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <CAK9=C2XOktu5kPXEWKMY4Wsf0D9kwh3rZNXricWqLQaiaqWnnQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_090556_394584_2C552495 
X-CRM114-Status: GOOD (  23.88  )
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

SGkgQW51cCwKCk9uIDIwMjQtMDgtMTYgODoyMSBBTSwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBX
ZWQsIEF1ZyAxNCwgMjAyNCBhdCAxOjQ14oCvUE0gU2FtdWVsIEhvbGxhbmQKPiA8c2FtdWVsLmhv
bGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4+Cj4+IFJJU0MtViBzdXBwb3J0cyBwb2ludGVyIG1h
c2tpbmcgd2l0aCBhIHZhcmlhYmxlIG51bWJlciBvZiB0YWcgYml0cwo+PiAod2hpY2ggaXMgY2Fs
bGVkICJQTUxFTiIgaW4gdGhlIHNwZWNpZmljYXRpb24pIGFuZCB3aGljaCBpcyBjb25maWd1cmVk
Cj4+IGF0IHRoZSBuZXh0IGhpZ2hlciBwcml2aWxlZ2UgbGV2ZWwuCj4+Cj4+IFdpcmUgdXAgdGhl
IFBSX1NFVF9UQUdHRURfQUREUl9DVFJMIGFuZCBQUl9HRVRfVEFHR0VEX0FERFJfQ1RSTCBwcmN0
bHMKPj4gc28gdXNlcnNwYWNlIGNhbiByZXF1ZXN0IGEgbG93ZXIgYm91bmQgb24gdGhlIG51bWJl
ciBvZiB0YWcgYml0cyBhbmQKPj4gZGV0ZXJtaW5lIHRoZSBhY3R1YWwgbnVtYmVyIG9mIHRhZyBi
aXRzLiBBcyB3aXRoIGFybTY0J3MKPj4gUFJfVEFHR0VEX0FERFJfRU5BQkxFLCB0aGUgcG9pbnRl
ciBtYXNraW5nIGNvbmZpZ3VyYXRpb24gaXMKPj4gdGhyZWFkLXNjb3BlZCwgaW5oZXJpdGVkIG9u
IGNsb25lKCkgYW5kIGZvcmsoKSBhbmQgY2xlYXJlZCBvbiBleGVjdmUoKS4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4+IC0t
LQo+Pgo+PiBDaGFuZ2VzIGluIHYzOgo+PiAgLSBSZW5hbWUgQ09ORklHX1JJU0NWX0lTQV9QT0lO
VEVSX01BU0tJTkcgdG8gQ09ORklHX1JJU0NWX0lTQV9TVVBNLAo+PiAgICBzaW5jZSBpdCBvbmx5
IGNvbnRyb2xzIHRoZSB1c2Vyc3BhY2UgcGFydCBvZiBwb2ludGVyIG1hc2tpbmcKPj4gIC0gVXNl
IElTX0VOQUJMRUQgaW5zdGVhZCBvZiAjaWZkZWYgd2hlbiBwb3NzaWJsZQo+PiAgLSBVc2UgYW4g
ZW51bSBmb3IgdGhlIHN1cHBvcnRlZCBQTUxFTiB2YWx1ZXMKPj4gIC0gU2ltcGxpZnkgdGhlIGxv
Z2ljIGluIHNldF90YWdnZWRfYWRkcl9jdHJsKCkKPj4KPj4gQ2hhbmdlcyBpbiB2MjoKPj4gIC0g
UmViYXNlIG9uIHJpc2N2L2xpbnV4LmdpdCBmb3ItbmV4dAo+PiAgLSBBZGQgYW5kIHVzZSB0aGUg
ZW52Y2ZnX3VwZGF0ZV9iaXRzKCkgaGVscGVyIGZ1bmN0aW9uCj4+ICAtIElubGluZSBmbHVzaF90
YWdnZWRfYWRkcl9zdGF0ZSgpCj4+Cj4+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAg
ICAgIHwgMTEgKysrKwo+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCB8ICA4
ICsrKwo+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8uaCB8IDExICsrKysKPj4g
IGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyAgICAgICAgfCA5MCArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKPj4gIGluY2x1ZGUvdWFwaS9saW51eC9wcmN0bC5oICAgICAgICAgfCAg
MyArCj4+ICA1IGZpbGVzIGNoYW5nZWQsIDEyMyBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPj4gaW5kZXggMGYz
Y2Q3YzNhNDM2Li44MTc0MzcxNTcxMzggMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZp
Zwo+PiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPj4gQEAgLTUxMiw2ICs1MTIsMTcgQEAgY29u
ZmlnIFJJU0NWX0lTQV9DCj4+Cj4+ICAgICAgICAgICBJZiB5b3UgZG9uJ3Qga25vdyB3aGF0IHRv
IGRvIGhlcmUsIHNheSBZLgo+Pgo+PiArY29uZmlnIFJJU0NWX0lTQV9TVVBNCj4+ICsgICAgICAg
Ym9vbCAiU3VwbSBleHRlbnNpb24gZm9yIHVzZXJzcGFjZSBwb2ludGVyIG1hc2tpbmciCj4+ICsg
ICAgICAgZGVwZW5kcyBvbiA2NEJJVAo+PiArICAgICAgIGRlZmF1bHQgeQo+PiArICAgICAgIGhl
bHAKPj4gKyAgICAgICAgIEFkZCBzdXBwb3J0IGZvciBwb2ludGVyIG1hc2tpbmcgaW4gdXNlcnNw
YWNlIChTdXBtKSB3aGVuIHRoZQo+PiArICAgICAgICAgdW5kZXJseWluZyBoYXJkd2FyZSBleHRl
bnNpb24gKFNtbnBtIG9yIFNzbnBtKSBpcyBkZXRlY3RlZCBhdCBib290Lgo+PiArCj4+ICsgICAg
ICAgICBJZiB0aGlzIG9wdGlvbiBpcyBkaXNhYmxlZCwgdXNlcnNwYWNlIHdpbGwgYmUgdW5hYmxl
IHRvIHVzZQo+PiArICAgICAgICAgdGhlIHByY3RsKFBSX3tTRVQsR0VUfV9UQUdHRURfQUREUl9D
VFJMKSBBUEkuCj4+ICsKPj4gIGNvbmZpZyBSSVNDVl9JU0FfU1ZOQVBPVAo+PiAgICAgICAgIGJv
b2wgIlN2bmFwb3QgZXh0ZW5zaW9uIHN1cHBvcnQgZm9yIHN1cGVydmlzb3IgbW9kZSBOQVBPVCBw
YWdlcyIKPj4gICAgICAgICBkZXBlbmRzIG9uIDY0QklUICYmIE1NVQo+PiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcHJvY2Vzc29yLmgKPj4gaW5kZXggNTg2ZTRhYjcwMWM0Li41YzRkNGZiOTczMTQgMTAwNjQ0
Cj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKPj4gKysrIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+PiBAQCAtMjAwLDYgKzIwMCwxNCBAQCBl
eHRlcm4gaW50IHNldF91bmFsaWduX2N0bChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaywgdW5zaWdu
ZWQgaW50IHZhbCk7Cj4+ICAjZGVmaW5lIFJJU0NWX1NFVF9JQ0FDSEVfRkxVU0hfQ1RYKGFyZzEs
IGFyZzIpIHJpc2N2X3NldF9pY2FjaGVfZmx1c2hfY3R4KGFyZzEsIGFyZzIpCj4+ICBleHRlcm4g
aW50IHJpc2N2X3NldF9pY2FjaGVfZmx1c2hfY3R4KHVuc2lnbmVkIGxvbmcgY3R4LCB1bnNpZ25l
ZCBsb25nIHBlcl90aHJlYWQpOwo+Pgo+PiArI2lmZGVmIENPTkZJR19SSVNDVl9JU0FfU1VQTQo+
PiArLyogUFJfe1NFVCxHRVR9X1RBR0dFRF9BRERSX0NUUkwgcHJjdGwgKi8KPj4gK2xvbmcgc2V0
X3RhZ2dlZF9hZGRyX2N0cmwoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLCB1bnNpZ25lZCBsb25n
IGFyZyk7Cj4+ICtsb25nIGdldF90YWdnZWRfYWRkcl9jdHJsKHN0cnVjdCB0YXNrX3N0cnVjdCAq
dGFzayk7Cj4+ICsjZGVmaW5lIFNFVF9UQUdHRURfQUREUl9DVFJMKGFyZykgICAgICBzZXRfdGFn
Z2VkX2FkZHJfY3RybChjdXJyZW50LCBhcmcpCj4+ICsjZGVmaW5lIEdFVF9UQUdHRURfQUREUl9D
VFJMKCkgICAgICAgICBnZXRfdGFnZ2VkX2FkZHJfY3RybChjdXJyZW50KQo+PiArI2VuZGlmCj4+
ICsKPj4gICNlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8KPj4KPj4gICNlbmRpZiAvKiBfQVNNX1JJ
U0NWX1BST0NFU1NPUl9IICovCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3N3aXRjaF90by5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8uaAo+PiBpbmRl
eCA5Njg1Y2Q4NWU1N2MuLjk0ZTMzMjE2YjJkOSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9zd2l0Y2hfdG8uaAo+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3N3
aXRjaF90by5oCj4+IEBAIC03MCw2ICs3MCwxNyBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIGJv
b2wgaGFzX2ZwdSh2b2lkKSB7IHJldHVybiBmYWxzZTsgfQo+PiAgI2RlZmluZSBfX3N3aXRjaF90
b19mcHUoX19wcmV2LCBfX25leHQpIGRvIHsgfSB3aGlsZSAoMCkKPj4gICNlbmRpZgo+Pgo+PiAr
c3RhdGljIGlubGluZSB2b2lkIGVudmNmZ191cGRhdGVfYml0cyhzdHJ1Y3QgdGFza19zdHJ1Y3Qg
KnRhc2ssCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQg
bG9uZyBtYXNrLCB1bnNpZ25lZCBsb25nIHZhbCkKPj4gK3sKPj4gKyAgICAgICB1bnNpZ25lZCBs
b25nIGVudmNmZzsKPj4gKwo+PiArICAgICAgIGVudmNmZyA9ICh0YXNrLT50aHJlYWQuZW52Y2Zn
ICYgfm1hc2spIHwgdmFsOwo+PiArICAgICAgIHRhc2stPnRocmVhZC5lbnZjZmcgPSBlbnZjZmc7
Cj4+ICsgICAgICAgaWYgKHRhc2sgPT0gY3VycmVudCkKPj4gKyAgICAgICAgICAgICAgIGNzcl93
cml0ZShDU1JfRU5WQ0ZHLCBlbnZjZmcpOwo+PiArfQo+PiArCj4+ICBzdGF0aWMgaW5saW5lIHZv
aWQgX19zd2l0Y2hfdG9fZW52Y2ZnKHN0cnVjdCB0YXNrX3N0cnVjdCAqbmV4dCkKPj4gIHsKPj4g
ICAgICAgICBhc20gdm9sYXRpbGUgKEFMVEVSTkFUSVZFKCJub3AiLCAiY3NydyAiIF9fc3RyaW5n
aWZ5KENTUl9FTlZDRkcpICIsICUwIiwKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L3Byb2Nlc3MuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYwo+PiBpbmRleCBlNGJjNjFj
NGU1OGEuLjEyODBhN2M0YTQxMiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJv
Y2Vzcy5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYwo+PiBAQCAtNyw2ICs3
LDcgQEAKPj4gICAqIENvcHlyaWdodCAoQykgMjAxNyBTaUZpdmUKPj4gICAqLwo+Pgo+PiArI2lu
Y2x1ZGUgPGxpbnV4L2JpdGZpZWxkLmg+Cj4+ICAjaW5jbHVkZSA8bGludXgvY3B1Lmg+Cj4+ICAj
aW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4+ICAjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4KPj4g
QEAgLTE3MSw2ICsxNzIsOSBAQCB2b2lkIGZsdXNoX3RocmVhZCh2b2lkKQo+PiAgICAgICAgIG1l
bXNldCgmY3VycmVudC0+dGhyZWFkLnZzdGF0ZSwgMCwgc2l6ZW9mKHN0cnVjdCBfX3Jpc2N2X3Zf
ZXh0X3N0YXRlKSk7Cj4+ICAgICAgICAgY2xlYXJfdHNrX3RocmVhZF9mbGFnKGN1cnJlbnQsIFRJ
Rl9SSVNDVl9WX0RFRkVSX1JFU1RPUkUpOwo+PiAgI2VuZGlmCj4+ICsgICAgICAgaWYgKElTX0VO
QUJMRUQoQ09ORklHX1JJU0NWX0lTQV9TVVBNKSAmJgo+PiArICAgICAgICAgICByaXNjdl9oYXNf
ZXh0ZW5zaW9uX3VubGlrZWx5KFJJU0NWX0lTQV9FWFRfU1VQTSkpCj4+ICsgICAgICAgICAgICAg
ICBlbnZjZmdfdXBkYXRlX2JpdHMoY3VycmVudCwgRU5WQ0ZHX1BNTSwgRU5WQ0ZHX1BNTV9QTUxF
Tl8wKTsKPiAKPiBTZWVpbmcgYSBjb21waWxlIHdhcm5pbmcgd2l0aCB0aGlzIHBhdGNoIG9uIFJW
MzIuCj4gCj4gbGludXgvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jOiBJbiBmdW5jdGlvbiAn
Zmx1c2hfdGhyZWFkJzoKPiBsaW51eC9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oOjIwMjo0
MTogd2FybmluZzogY29udmVyc2lvbiBmcm9tCj4gJ2xvbmcgbG9uZyB1bnNpZ25lZCBpbnQnIHRv
ICdsb25nIHVuc2lnbmVkIGludCcgY2hhbmdlcyB2YWx1ZSBmcm9tCj4gJzEyODg0OTAxODg4JyB0
byAnMCcgWy1Xb3ZlcmZsb3ddCj4gICAyMDIgfCAjZGVmaW5lIEVOVkNGR19QTU0gICAgICAgICAg
ICAgICAgICAgICAgKF9BQygweDMsIFVMTCkgPDwgMzIpCj4gICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gbGludXgv
YXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jOjE3OTo0NTogbm90ZTogaW4gZXhwYW5zaW9uIG9m
IG1hY3JvCj4gJ0VOVkNGR19QTU0nCj4gICAxNzkgfCAgICAgICAgICAgICAgICAgZW52Y2ZnX3Vw
ZGF0ZV9iaXRzKGN1cnJlbnQsIEVOVkNGR19QTU0sCj4gRU5WQ0ZHX1BNTV9QTUxFTl8wKTsKPiAg
ICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+
fn5+fgoKUmlnaHQsIHRoYW5rcywgdGhhdCdzIHdoeSBJIG5lZWRlZCB0byB1c2UgI2lmZGVmIGhl
cmUgYmVmb3JlLiBJJ2xsIHN3aXRjaCB0aGlzCmluc3RhbmNlIGJhY2sgZm9yIHY0LgoKUmVnYXJk
cywKU2FtdWVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
