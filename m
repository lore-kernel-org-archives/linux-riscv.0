Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1A6CD4857
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 15:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kJiegQ4xniarFGEoaxehbgbllLbbAGGfwPF6tlUNqpA=; b=IMmlqVUCzyOo8q
	G+LxkDfw6KUEeUYseZBDBo+EO3UQVv2aN+w7DuzD501W1oGzCKfvewFpua7b+Yn20yMLMPvL860xJ
	N4R6mKCU3NGdiKhjCRTMJJi4yzEy0VbJoxRAHY4snzpaY1hdDGwBPC+pEUBp/ZGAayleQBpIQEK45
	GSmFNAJTfNzpbet6V0GJSgll45f6nW6yMQRrd+4f1INYkpoAYKVl+hYVLIPc8JH/KbFTXnGargnUs
	rw/aQl9vxaf6aeIokLUJff7WY7CINiIts0uyGnQHsnkEP21VOysuzcX8VJl9s4Vbc2Z7RAnlA0XIR
	8ShDa7QYduWqRc0riZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slsPQ-000000058Mk-2FTc;
	Wed, 04 Sep 2024 15:59:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slsMP-000000057l0-1KQA
	for linux-riscv@bombadil.infradead.org;
	Wed, 04 Sep 2024 15:55:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IJfJhTqoZula3HvRr4vB1EKIVpNv9UMUTRfayiacVI8=; b=dT8Rhu6lf8Ma2ZtpsqVR4nqXMe
	Q3LCIX5MqeetMaT5ZbaWZajtLPb7A689x3V8+N1XHGQOzXysvAWUVhGtHCaOFBnMfVpxG+Z3eIj5w
	5c+iX/WFrZSqWbjzGCTKLZ3aKDNxogP4E59k2GzP2SN/CWORssVLbZqFKhsZXhKxWiJS8YLDhIcLs
	cGeVo9bfwmS1CxonGWvkl7MWKmRKon41P3QX3QYBcXYfnnf46mVAyqIAUPO/4syhzNxU111Eh7GTi
	Vjc0NYUzo5Cb11+aemwk+8vhs9kHVOTwnew7WK7X7bwDJG7AIFs8zR3Q/qWeqaF7+m44p8bETPCYj
	FcXA1JuQ==;
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1slsMF-00000000IR0-4AMR
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 15:55:50 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3df06040fa6so3492373b6e.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Sep 2024 08:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1725465344; x=1726070144; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IJfJhTqoZula3HvRr4vB1EKIVpNv9UMUTRfayiacVI8=;
        b=LfWhyUlInQj4gM9otD5HLGP3o96L1nEYM1nTO8oMqrC9Mv9iiFPEPltx4ewgOFtDbt
         UhsiqfwlcMhOjY8dHW5ow3TsV79KbHmF1oe7R1XretQ5hlgZ3NPt9u0LXl7TEJh/Ei9j
         61zxqhDpWt7ZeEkDV7nwSB9qb9NpewBpbz6o8o0zZEeb1v85MWhlPM3v7ukEYsdRp9HJ
         lXhBCVFUZ+K9S1a8oGEc/FjYcPuvn+Mpycn/kQUr1zfePe9c8vWf0vJf6UHGPLcAbjiP
         tVVcHGW5VzrPwgQ66QgqCrfc75JwMPgFXs09CehNE/uYRjf7/aaOyRjp2lgyygc0me/8
         Rs9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725465344; x=1726070144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IJfJhTqoZula3HvRr4vB1EKIVpNv9UMUTRfayiacVI8=;
        b=qofUuUWiZikgqjWCkuEl19chchCR2qOKkHt1g82baOivJhP+Refcb3rTO0AwR7jxf0
         mgaB0xWvIFnRNkOT6wYnKUNhHafZEvry/xuB3i7KhJmaU2UfH163G19EypIjIsILCcmy
         Vc3kqZMwrAVX8EpTYQftbSKBLRhfDQw7ollmUyY1vhcguqGrfLpKSo8B4pgRb3u0HIsw
         6j7PMUZFzNtb35GEZ4QdRFwR4eChlQcHEzdeC1S8oMGHDtlm1iBfW1flIQem17GhbYF+
         pFw57G0W+Es5ecy8aBZkkpazRHyDhm/pK8sHw4yMTH2D9hOlTjJzXMyAL6Li24ZCRYNe
         9Mgw==
X-Forwarded-Encrypted: i=1; AJvYcCVegOarJTevGLo2UpqykNmKmC0pAaGP7g3ht3SlzUWbUJVv+bDqh5TqNBP8qglwTXp4k/3OeRmRlLCgXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIIE3Vx7TlGdVf6zsAuvmZkQghhT7j3Qrsa62KZuk6O5OZzYws
	8HoWXaFtJ59ux0WjJZ5ZLxB7PxJ2uDCc3wQSew6TWI07WNz60oCqMwgW4nFCeMg=
X-Google-Smtp-Source: AGHT+IGSj2mjNP3cd8Y+Wq93jLDk/4D2+bETU3DRxxEgzsXQc26cqw387LSpclivH7vxPgGiROcLBA==
X-Received: by 2002:a05:6808:1687:b0:3dc:15b9:334a with SMTP id 5614622812f47-3df1b6f43f7mr14003462b6e.6.1725465344248;
        Wed, 04 Sep 2024 08:55:44 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3df117a63a5sm2850495b6e.1.2024.09.04.08.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 08:55:43 -0700 (PDT)
Message-ID: <4c010cb1-b57c-427e-a241-1dd3ab15f2ce@sifive.com>
Date: Wed, 4 Sep 2024 10:55:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/10] RISC-V: KVM: Allow Smnpm and Ssnpm extensions
 for guests
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 kasan-dev@googlegroups.com, Atish Patra <atishp@atishpatra.org>,
 Evgenii Stepanov <eugenis@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 kvm-riscv@lists.infradead.org
References: <20240829010151.2813377-1-samuel.holland@sifive.com>
 <20240829010151.2813377-10-samuel.holland@sifive.com>
 <CAK9=C2WjraWjuQCeU2Y4Jhr-gKkOcP42Sza7wVp0FgeGaD923g@mail.gmail.com>
 <b6de8769-7e4e-4a19-b239-a39fd424e0c8@sifive.com>
 <CAAhSdy08SoDoZCii9R--BK7_NKLnRciW7V3mo2aQRKW1dbOgNg@mail.gmail.com>
 <20ab0fa2-d5dd-446d-9fff-a3ef82e8db35@sifive.com>
 <CAAhSdy1pZcEfajg3OZUCaFf9JMYcMzpRVogCT5VL2FHx__vDdA@mail.gmail.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAAhSdy1pZcEfajg3OZUCaFf9JMYcMzpRVogCT5VL2FHx__vDdA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_165548_145615_F280A9B1 
X-CRM114-Status: GOOD (  34.23  )
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

T24gMjAyNC0wOS0wNCAxMDoyMCBBTSwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBXZWQsIFNlcCA0
LCAyMDI0IGF0IDg6MjfigK9QTSBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4+Cj4+IEhpIEFudXAsCj4+Cj4+IE9uIDIwMjQtMDktMDQgOTo0NSBBTSwg
QW51cCBQYXRlbCB3cm90ZToKPj4+IE9uIFdlZCwgU2VwIDQsIDIwMjQgYXQgODowMeKAr1BNIFNh
bXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPj4+PiBPbiAy
MDI0LTA5LTA0IDc6MTcgQU0sIEFudXAgUGF0ZWwgd3JvdGU6Cj4+Pj4+IE9uIFRodSwgQXVnIDI5
LCAyMDI0IGF0IDY6MzLigK9BTSBTYW11ZWwgSG9sbGFuZAo+Pj4+PiA8c2FtdWVsLmhvbGxhbmRA
c2lmaXZlLmNvbT4gd3JvdGU6Cj4+Pj4+Pgo+Pj4+Pj4gVGhlIGludGVyZmFjZSBmb3IgY29udHJv
bGxpbmcgcG9pbnRlciBtYXNraW5nIGluIFZTLW1vZGUgaXMgaGVudmNmZy5QTU0sCj4+Pj4+PiB3
aGljaCBpcyBwYXJ0IG9mIHRoZSBTc25wbSBleHRlbnNpb24sIGV2ZW4gdGhvdWdoIHBvaW50ZXIg
bWFza2luZyBpbgo+Pj4+Pj4gSFMtbW9kZSBpcyBwcm92aWRlZCBieSB0aGUgU21ucG0gZXh0ZW5z
aW9uLiBBcyBhIHJlc3VsdCwgZW11bGF0aW5nIFNtbnBtCj4+Pj4+PiBpbiB0aGUgZ3Vlc3QgcmVx
dWlyZXMgKG9ubHkpIFNzbnBtIG9uIHRoZSBob3N0Lgo+Pj4+Pj4KPj4+Pj4+IFNpbmNlIHRoZSBn
dWVzdCBjb25maWd1cmVzIFNtbnBtIHRocm91Z2ggdGhlIFNCSSBGaXJtd2FyZSBGZWF0dXJlcwo+
Pj4+Pj4gaW50ZXJmYWNlLCB0aGUgZXh0ZW5zaW9uIGNhbiBiZSBkaXNhYmxlZCBieSBmYWlsaW5n
IHRoZSBTQkkgY2FsbC4gU3NucG0KPj4+Pj4+IGNhbm5vdCBiZSBkaXNhYmxlZCB3aXRob3V0IGlu
dGVyY2VwdGluZyB3cml0ZXMgdG8gdGhlIHNlbnZjZmcgQ1NSLgo+Pj4+Pj4KPj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgo+Pj4+
Pj4gLS0tCj4+Pj4+Pgo+Pj4+Pj4gKG5vIGNoYW5nZXMgc2luY2UgdjIpCj4+Pj4+Pgo+Pj4+Pj4g
Q2hhbmdlcyBpbiB2MjoKPj4+Pj4+ICAtIE5ldyBwYXRjaCBmb3IgdjIKPj4+Pj4+Cj4+Pj4+PiAg
YXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oIHwgMiArKwo+Pj4+Pj4gIGFyY2gvcmlz
Y3Yva3ZtL3ZjcHVfb25lcmVnLmMgICAgICB8IDMgKysrCj4+Pj4+PiAgMiBmaWxlcyBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKykKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9p
bmNsdWRlL3VhcGkvYXNtL2t2bS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5o
Cj4+Pj4+PiBpbmRleCBlOTdkYjMyOTY0NTYuLjRmMjQyMDEzNzZiMSAxMDA2NDQKPj4+Pj4+IC0t
LSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaAo+Pj4+Pj4gKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4+Pj4+PiBAQCAtMTc1LDYgKzE3NSw4IEBAIGVu
dW0gS1ZNX1JJU0NWX0lTQV9FWFRfSUQgewo+Pj4+Pj4gICAgICAgICBLVk1fUklTQ1ZfSVNBX0VY
VF9aQ0YsCj4+Pj4+PiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pDTU9QLAo+Pj4+Pj4gICAg
ICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9aQVdSUywKPj4+Pj4+ICsgICAgICAgS1ZNX1JJU0NWX0lT
QV9FWFRfU01OUE0sCj4+Pj4+PiArICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1NTTlBNLAo+Pj4+
Pj4gICAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9NQVgsCj4+Pj4+PiAgfTsKPj4+Pj4+Cj4+Pj4+
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYyBiL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfb25lcmVnLmMKPj4+Pj4+IGluZGV4IGIzMTljNGMxM2M1NC4uNmY4MzNlYzIzNDRh
IDEwMDY0NAo+Pj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwo+Pj4+Pj4g
KysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwo+Pj4+Pj4gQEAgLTM0LDkgKzM0LDEx
IEBAIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBsb25nIGt2bV9pc2FfZXh0X2FycltdID0gewo+Pj4+
Pj4gICAgICAgICBbS1ZNX1JJU0NWX0lTQV9FWFRfTV0gPSBSSVNDVl9JU0FfRVhUX20sCj4+Pj4+
PiAgICAgICAgIFtLVk1fUklTQ1ZfSVNBX0VYVF9WXSA9IFJJU0NWX0lTQV9FWFRfdiwKPj4+Pj4+
ICAgICAgICAgLyogTXVsdGkgbGV0dGVyIGV4dGVuc2lvbnMgKGFscGhhYmV0aWNhbGx5IHNvcnRl
ZCkgKi8KPj4+Pj4+ICsgICAgICAgW0tWTV9SSVNDVl9JU0FfRVhUX1NNTlBNXSA9IFJJU0NWX0lT
QV9FWFRfU1NOUE0sCj4+Pj4+Cj4+Pj4+IFdoeSBub3QgdXNlIEtWTV9JU0FfRVhUX0FSUigpIG1h
Y3JvIGhlcmUgPwo+Pj4+Cj4+Pj4gQmVjYXVzZSB0aGUgZXh0ZW5zaW9uIG5hbWUgaW4gdGhlIGhv
c3QgZG9lcyBub3QgbWF0Y2ggdGhlIGV4dGVuc2lvbiBuYW1lIGluIHRoZQo+Pj4+IGd1ZXN0LiBQ
b2ludGVyIG1hc2tpbmcgZm9yIEhTIG1vZGUgaXMgcHJvdmlkZWQgYnkgU21ucG0uIFBvaW50ZXIg
bWFza2luZyBmb3IgVlMKPj4+PiBtb2RlIGlzIHByb3ZpZGVkIGJ5IFNzbnBtIGF0IHRoZSBoYXJk
d2FyZSBsZXZlbCwgYnV0IHRoaXMgbmVlZHMgdG8gYXBwZWFyIHRvIHRoZQo+Pj4+IGd1ZXN0IGFz
IGlmIFNtbnBtIHdhcyBpbXBsZW1lbnRlZCwgc2luY2UgdGhlIGd1ZXN0IHRoaW5rcyBpdCBpcyBy
dW5uaW5nIG9uIGJhcmUKPj4+PiBtZXRhbC4KPj4+Cj4+PiBPa2F5LCBtYWtlcyBzZW5zZS4KPj4+
Cj4+Pj4KPj4+Pj4+ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFNNU1RBVEVFTiksCj4+Pj4+PiAg
ICAgICAgIEtWTV9JU0FfRVhUX0FSUihTU0FJQSksCj4+Pj4+PiAgICAgICAgIEtWTV9JU0FfRVhU
X0FSUihTU0NPRlBNRiksCj4+Pj4+PiArICAgICAgIEtWTV9JU0FfRVhUX0FSUihTU05QTSksCj4+
Pj4+PiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihTU1RDKSwKPj4+Pj4+ICAgICAgICAgS1ZNX0lT
QV9FWFRfQVJSKFNWSU5WQUwpLAo+Pj4+Pj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoU1ZOQVBP
VCksCj4+Pj4+PiBAQCAtMTI5LDYgKzEzMSw3IEBAIHN0YXRpYyBib29sIGt2bV9yaXNjdl92Y3B1
X2lzYV9kaXNhYmxlX2FsbG93ZWQodW5zaWduZWQgbG9uZyBleHQpCj4+Pj4+PiAgICAgICAgIGNh
c2UgS1ZNX1JJU0NWX0lTQV9FWFRfTToKPj4+Pj4+ICAgICAgICAgLyogVGhlcmUgaXMgbm90IGFy
Y2hpdGVjdHVyYWwgY29uZmlnIGJpdCB0byBkaXNhYmxlIHNzY29mcG1mIGNvbXBsZXRlbHkgKi8K
Pj4+Pj4+ICAgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9TU0NPRlBNRjoKPj4+Pj4+ICsg
ICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9TU05QTToKPj4+Pj4KPj4+Pj4gV2h5IG5vdCBh
ZGQgS1ZNX1JJU0NWX0lTQV9FWFRfU01OUE0gaGVyZSA/Cj4+Pj4+Cj4+Pj4+IERpc2FibGluZyBT
bW5wbSBmcm9tIEtWTSB1c2VyIHNwYWNlIGlzIHZlcnkgZGlmZmVyZW50IGZyb20KPj4+Pj4gZGlz
YWJsaW5nIFNtbnBtIGZyb20gR3Vlc3QgdXNpbmcgU0JJIEZXRlQgZXh0ZW5zaW9uLgo+Pj4+Cj4+
Pj4gVW50aWwgYSBzdWNjZXNzZnVsIFNCSSBGV0ZUIGNhbGwgdG8gS1ZNIHRvIGVuYWJsZSBwb2lu
dGVyIG1hc2tpbmcgZm9yIFZTIG1vZGUsCj4+Pj4gdGhlIGV4aXN0ZW5jZSBvZiBTbW5wbSBoYXMg
bm8gdmlzaWJsZSBlZmZlY3Qgb24gdGhlIGd1ZXN0LiBTbyBmYWlsaW5nIHRoZSBTQkkKPj4+PiBj
YWxsIGlzIHN1ZmZpY2llbnQgdG8gcHJldGVuZCB0aGF0IHRoZSBoYXJkd2FyZSBkb2VzIG5vdCBz
dXBwb3J0IFNtbnBtLgo+Pj4+Cj4+Pj4+IFRoZSBLVk0gdXNlciBzcGFjZSBzaG91bGQgYWx3YXlz
IGFkZCBTbW5wbSBpbiB0aGUKPj4+Pj4gR3Vlc3QgSVNBIHN0cmluZyB3aGVuZXZlciB0aGUgSG9z
dCBJU0Egc3RyaW5nIGhhcyBpdC4KPj4+Pgo+Pj4+IEkgZGlzYWdyZWUuIEFsbG93aW5nIHVzZXJz
cGFjZSB0byBkaXNhYmxlIGV4dGVuc2lvbnMgaXMgdXNlZnVsIGZvciB0ZXN0aW5nIGFuZAo+Pj4+
IHRvIHN1cHBvcnQgbWlncmF0aW9uIHRvIGhvc3RzIHdoaWNoIGRvIG5vdCBzdXBwb3J0IHRob3Nl
IGV4dGVuc2lvbnMuIFNvIEkgd291bGQKPj4+PiBvbmx5IGFkZCBleHRlbnNpb25zIHRvIHRoaXMg
bGlzdCBpZiB0aGVyZSBpcyBubyBwb3NzaWJsZSB3YXkgdG8gZGlzYWJsZSB0aGVtLgo+Pj4KPj4+
IEkgYW0gbm90IHNheWluZyB0byBkaXNhbGxvdyBLVk0gdXNlciBzcGFjZSBkaXNhYmxpbmcgU21u
cG0uCj4+Cj4+IFRoZW4gSSdtIGNvbmZ1c2VkLiBUaGlzIGlzIHRoZSAicmV0dXJuIGZhbHNlOyIg
c3dpdGNoIGNhc2UgaW5zaWRlCj4+IGt2bV9yaXNjdl92Y3B1X2lzYV9kaXNhYmxlX2FsbG93ZWQo
KS4gSWYgSSBhZGQgS1ZNX1JJU0NWX0lTQV9FWFRfU01OUE0gaGVyZSwKPj4gdGhlbiAodW5sZXNz
IEkgYW0gbWlzcmVhZGluZyB0aGUgY29kZSkgSSBhbSBkaXNhbGxvd2luZyBLVk0gdXNlcnNwYWNl
IGZyb20KPj4gZGlzYWJsaW5nIFNtbnBtIGluIHRoZSBndWVzdCAoaS5lLiBwcmV2ZW50aW5nIEtW
TSB1c2Vyc3BhY2UgZnJvbSByZW1vdmluZyBTbW5wbQo+PiBmcm9tIHRoZSBndWVzdCBJU0Egc3Ry
aW5nKS4gSWYgdGhhdCBpcyBub3QgZGVzaXJlZCwgdGhlbiB3aHkgZG8geW91IHN1Z2dlc3QgSQo+
PiBhZGQgS1ZNX1JJU0NWX0lTQV9FWFRfU01OUE0gaGVyZT8KPiAKPiBZZXMsIGFkZGluZyBLVk1f
UklTQ1ZfSVNBX0VYVF9TTU5QTSBoZXJlIG1lYW5zIEtWTQo+IHVzZXIgc3BhY2UgY2FuJ3QgZGlz
YWJsZSBpdCB1c2luZyBPTkVfUkVHIGludGVyZmFjZSBidXQgS1ZNIHVzZXIKPiBzcGFjZSBjYW4g
Y2VydGFpbmx5IG5vdCBhZGQgaXQgaW4gdGhlIEd1ZXN0IElTQSBzdHJpbmcuCgpJcyB0aGVyZSBh
IHByb2JsZW0gd2l0aCBhbGxvd2luZyBLVk0gdXNlcnNwYWNlIHRvIGRpc2FibGUgdGhlIElTQSBl
eHRlbnNpb24gd2l0aAp0aGUgT05FX1JFRyBpbnRlcmZhY2U/CgpJZiBLVk0gdXNlcnNwYWNlIHJl
bW92ZXMgU21ucG0gZnJvbSB0aGUgSVNBIHN0cmluZyB3aXRob3V0IHRoZSBob3N0IGtlcm5lbCdz
Cmtub3dsZWRnZSwgdGhhdCBkb2Vzbid0IGFjdHVhbGx5IHByZXZlbnQgdGhlIGd1ZXN0IGZyb20g
c3VjY2Vzc2Z1bGx5IGNhbGxpbmcKc2JpX2Z3ZnRfc2V0KFBPSU5URVJfTUFTS0lOR19QTUxFTiwg
Li4uKSwgc28gaXQgZG9lc24ndCBndWFyYW50ZWUgdGhhdCB0aGUgVk0KY2FuIGJlIG1pZ3JhdGVk
IHRvIGEgaG9zdCB3aXRob3V0IHBvaW50ZXIgbWFza2luZyBzdXBwb3J0LiBTbyB0aGUgT05FX1JF
RwppbnRlcmZhY2Ugc3RpbGwgaGFzIHZhbHVlLiAoQW5kIHRoYXQncyBteSBhbnN3ZXIgdG8geW91
ciBvcmlnaW5hbCBxdWVzdGlvbiAiV2h5Cm5vdCBhZGQgS1ZNX1JJU0NWX0lTQV9FWFRfU01OUE0g
aGVyZSA/IikKCj4+PiBUaGUgcHJlc2VuY2Ugb2YgU21ucG0gaW4gSVNBIG9ubHkgbWVhbnMgdGhh
dCBpdCBpcyBwcmVzZW50IGluIEhXCj4+PiBidXQgaXQgbmVlZHMgdG8gYmUgZXhwbGljaXRseSBj
b25maWd1cmVkL2VuYWJsZWQgdXNpbmcgU0JJIEZXRlQuCj4+Pgo+Pj4gS1ZNIHVzZXIgc3BhY2Ug
Y2FuIGNlcnRhaW5seSBkaXNhYmxlIGV4dGVuc2lvbnMgYnkgbm90IGFkZGluZyBpdCB0bwo+Pj4g
SVNBIHN0cmluZyBiYXNlZCBvbiB0aGUgS1ZNVE9PTC9RRU1VLUtWTSBjb21tYW5kIGxpbmUgb3B0
aW9uLgo+Pj4gQWRkaXRpb25hbGx5LCB3aGVuIFNCSSBGV0ZUIGlzIGFkZGVkIHRvIEtWTSBSSVND
LVYuIEl0IHdpbGwgaGF2ZSBpdHMKPj4+IG93biB3YXkgdG8gZXhwbGljaXRseSBkaXNhYmxlIGZp
cm13YXJlIGZlYXR1cmVzIGZyb20gS1ZNIHVzZXIgc3BhY2UuCj4+Cj4+IEkgdGhpbmsgd2UgYWdy
ZWUgb24gdGhpcywgYnV0IHlvdXIgZXhwbGFuYXRpb24gaGVyZSBhcHBlYXJzIHRvIGNvbmZsaWN0
IHdpdGgKPj4geW91ciBzdWdnZXN0ZWQgY29kZSBjaGFuZ2UuIEFwb2xvZ2llcyBpZiBJJ20gbWlz
c2luZyBzb21ldGhpbmcuCj4gCj4gSSB0aGluayB0aGUgY29uZnVzaW9uIGlzIGFib3V0IHdoYXQg
ZG9lcyBpdCBtZWFuIHdoZW4gU21ucG0gaXMgcHJlc2VudAo+IGluIHRoZSBJU0Egc3RyaW5nLiBX
ZSBoYXZlIHR3byBhcHByb2FjaGVzOgo+IAo+IDEpIFByZXNlbmNlIG9mIFNtbnBtIGluIElTQSBz
dHJpbmcgb25seSBtZWFucyBpdCBpcyBwcmVzZW50IGluIEhXIGJ1dAo+ICAgICBzYXlzIG5vdGhp
bmcgYWJvdXQgaXRzIGVuYWJsZS9kaXNhYmxlIHN0YXRlLiBUbyBjb25maWd1cmUvZW5hYmxlCj4g
ICAgIFNtbnBtLCB0aGUgc3VwZXJ2aXNvciBtdXN0IHVzZSBTQkkgRldGVC4KPiAKPiAyKSBQcmVz
ZW5jZSBvZiBTbW5wbSBpbiBJU0Egc3RyaW5nIG1lYW5zIGl0IGlzIHByZXNlbnQgaW4gSFcgYW5k
Cj4gICAgIGVuYWJsZWQgYXQgYm9vdC10aW1lLiBUbyByZS1jb25maWd1cmUvZGlzYWJsZSBTbW5w
bSwgdGhlIHN1cGVydmlzb3IKPiAgICAgbXVzdCB1c2UgU0JJIEZXRlQuCj4gCj4gSSBhbSBzdWdn
ZXN0aW5nIGFwcHJvYWNoICMxIGJ1dCBJIGFtIGd1ZXNzaW5nIHlvdSBhcmUgbGVhbmluZyB0b3dh
cmRzCj4gYXBwcm9hY2ggIzIgPwo+IAo+IEZvciBhcHByb2FjaCAjMiwgYWRkaXRpb25hbCBoZW5j
ZmcuUE1NIGNvbmZpZ3VyYXRpb24gaXMgcmVxdWlyZWQgaW4KPiB0aGlzIHBhdGNoIGJhc2VkIG9u
IHRoZSBzdGF0ZSBvZiBLVk1fUklTQ1ZfSVNBX0VYVF9TTU5QTS4KCk5vLCBJIGFtIGRlZmluaXRl
bHkgc3VnZ2VzdGluZyBvbmx5IGFwcHJvYWNoICMxLiBNeSBwcm9wb3NhbCBmb3IgYWRkaW5nIHBv
aW50ZXIKbWFza2luZyB0byB0aGUgU0JJIEZXRlQgZXh0ZW5zaW9uWzFdIHNwZWNpZmllcyB0aGUg
ZmVhdHVyZSBhcyBkaXNhYmxlZCBieQpkZWZhdWx0LCBhbmQgdGhpcyB3b3VsZCBhcHBseSBib3Ro
IGluc2lkZSBhbmQgb3VzaWRlIGEgVk0uCgpCdXQgSSBhbSBhbHNvIHN1Z2dlc3RpbmcgdGhhdCB0
aGUgT05FX1JFRyBpbnRlcmZhY2UgaXMgYSB1c2VmdWwgd2F5IHRvCmNvbXBsZXRlbHkgaGlkZSB0
aGUgZXh0ZW5zaW9uIGZyb20gdGhlIGd1ZXN0LCBsaWtlIHdlIGRvIGZvciBvdGhlciBleHRlbnNp
b25zCnN1Y2ggYXMgU3ZwYm10LiBUaGUgb25seSBkaWZmZXJlbmNlIGJldHdlZW4gc29tZXRoaW5n
IGxpa2UgU3ZwYm10IGFuZCBTbW5wbSBpcwp0aGF0IGluc3RlYWQgb2YgY2xlYXJpbmcgYSBiaXQg
aW4gaGVudmNmZyB0byBoaWRlIHRoZSBleHRlbnNpb24gZnJvbSB0aGUgZ3Vlc3QsCndlIHJlamVj
dCBjYWxscyB0byBzYmlfZndmdF9zZXQoUE9JTlRFUl9NQVNLSU5HX1BNTEVOLCAuLi4pIHdoZW4g
dGhlIElTQQpleHRlbnNpb24gaXMgaGlkZGVuIGZyb20gdGhlIGd1ZXN0LgoKUmVnYXJkcywKU2Ft
dWVsCgpbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LXNiaS1kb2Mv
cHVsbC8xNjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
