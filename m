Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9583C35FFA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 12:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FCvd1XTuA7RZi2OosnhWC2cKA7ANbCLojApkZavtYBQ=; b=m2wJgyFqISbRST
	H754X9aklse2j5jUDypmjLx8bvozkOekW11/AOLoIlR9VrXbgvJuWnlGJZOrmLYqgn/+YDU6mHCei
	rtq83T8XgGBHcOtOIPiGcJxYAfrLCy5ocaPPZkNRZpS5FFG28s5aeRgLKxB57RI0emb6TpQY+7JoF
	FSrk7tZ19MSwizTDCIO2khYkT8D4e85MWxSUJXHua7KxnSkPF87l1jxHtRPjQ0IEOvAkuwxdc/DNB
	StaB6f9txC71ZB2ZrMqKOeFQ/5CMMORwP5eU3VOqtzMkE4+ccDyBkP4Gcq1ULqSRoE22gj+Hz+9SH
	3qC1CEFppiN4uhHpgYBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tusCN-00000008vJW-2azc;
	Wed, 19 Mar 2025 12:07:03 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tusCL-00000008vIt-0hp0
	for linux-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 12:07:02 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ac29af3382dso1092270166b.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Mar 2025 05:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742386019; x=1742990819; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78siVUcrqX50+D3XL3UtIOYlvRh1M9mNDzyv1u3Bamk=;
        b=okLrMu1s6vvOnu1XRhrRfW2zDtBiOCaOoF8KKAdOHzrOCypbMVC1t+xH9y5qx6Qfrk
         IkUDZAD/RuCKsyGTsJO5oMX5BvL+vZvIY4ByfcNWWk3sEWrfSjsUs0Szp+Ukr3p3cncf
         luFEO3XUXgAVgkeWGZAyTLNVZmXJ3R8tCVUfI3pOiDALEBSxlOFAoXIj1iZD9n0yW07z
         t2j/PIttt67SMhN82rHBPOcYpD4wpfru5EIMj//nwmTiRxtK6ar4hP2xi510m7F/yUgp
         3r3EXkUxem+Av4dRodpIQoalaW/6I7CbuzPKV5hCBAcGOIa7IUfrEZz5bv2xREgx91QG
         ewHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742386019; x=1742990819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78siVUcrqX50+D3XL3UtIOYlvRh1M9mNDzyv1u3Bamk=;
        b=gcxbhmJAs8Px9C9ZSGjO//bS+fU1w1nP1HN+rpfrabIsendwj/pHcwlaNbUoGwrWe5
         FX5lIqrUPNqK+8NlbzAmLTgG0P7diYebfo4Esrpy89iR16bPdKxCoJU5Pw2OpA5mFONC
         uxl60RNfFTOhD/NHqBZ1jE4B5eT9/zNOGfUrftOAX/cKSZ1/rKhJJ6C7L3fjCjUOlbGj
         VrugiGvWoAEFvxLy8wNEjklF2cyTzVz8UPKgou80dbyCNocYiuPiG0qo8SOc0g0kCRt/
         LhCsWWMP9vJE8/xaU3W+Y9+cfiO9+uFbNDJs38wJQcBYu1PyJb40ItNSs32R1g+OFhMv
         pBbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwb4LPUKtxNjJNe60Ocq+CpDWuFDwsMadJ/SyQNi6TXcP7QY8V3c87iyLYA1tZdZP8VPw1vJbhzuychw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZkkXQ2AWc/5NyUhXDVXsa1MRR7Yyr1r8KX0t0nMhZI3sCPoRC
	Fo9/JCmuf4Mk4nhkln3dKqq0SokD+eohLzQ2JWvQpDTeBvDZKU3wxmY8BwFHwEzvv8Z19mXtAuH
	rUMF8rPfyRP8bPC5ZMSdNQZn1+fv9qBQUwkbsng==
X-Gm-Gg: ASbGncsYRx13wkgtzb+pI2Uc21LbydVszRwfrbxfeEHP3c1q62qlF7Tq8eCaXhbnAmg
	mTciAhagWQbjNQ5RAbBZkBMzg/2Z60+5+EL2jGPz2YqnXhJpscW6kOf5nU06AlHREQMSbZH1nia
	UnolYTMpZADwso6Qfn2VCu9DUsVE9wV2BGO78Wt81PF19OLpx1IrHIkp7dq2I=
X-Google-Smtp-Source: AGHT+IGiAtZ6MEUzl0vHpywyUjhVa6wLjc70DoixDCEpsVWavF8Jtx8EFXS/HyAo6VIz+Kt+JJ/9K+rKpTmj5VxB2jg=
X-Received: by 2002:a17:907:d786:b0:ac2:c26:5608 with SMTP id
 a640c23a62f3a-ac3b7abbc17mr276281066b.8.1742386018860; Wed, 19 Mar 2025
 05:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250318-runtime_const_riscv-v9-0-ddd3534d3e8e@rivosinc.com> <20250318-runtime_const_riscv-v9-1-ddd3534d3e8e@rivosinc.com>
In-Reply-To: <20250318-runtime_const_riscv-v9-1-ddd3534d3e8e@rivosinc.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 19 Mar 2025 13:06:48 +0100
X-Gm-Features: AQ5f1JqRGfd7xwZfyu2cdRM57q3At-EAnqsxfbHWxk-qnkLR0BlmB6Gp6NGNBVY
Message-ID: <CAHVXubjbfVmU4PFD8s-uRF03KjtVKyyUsCHxhKQ6vXJfFhsVzA@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] riscv: Move nop definition to insn-def.h
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	Pasha Bouzarjomehri <pasha@rivosinc.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_050701_415379_42182323 
X-CRM114-Status: GOOD (  19.18  )
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

SGkgQ2hhcmxpZSwKCk9uIFdlZCwgTWFyIDE5LCAyMDI1IGF0IDE6MznigK9BTSBDaGFybGllIEpl
bmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IFdlIGhhdmUgZHVwbGljYXRl
ZCB0aGUgZGVmaW5pdGlvbiBvZiB0aGUgbm9wIGluc3RydWN0aW9uIGluIGZ0cmFjZS5oIGFuZAo+
IGluIGp1bXBfbGFiZWwuYy4gTW92ZSB0aGlzIGRlZmluaXRpb24gaW50byB0aGUgZ2VuZXJpYyBm
aWxlIGluc24tZGVmLmgKPiBzbyB0aGF0IHRoZXkgY2FuIHNoYXJlIHRoZSBkZWZpbml0aW9uIHdp
dGggZWFjaCBvdGhlciBhbmQgd2l0aCBmdXR1cmUKPiBmaWxlcy4KPgo+IFNpZ25lZC1vZmYtYnk6
IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vZnRyYWNlLmggICB8IDEgLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2luc24tZGVmLmggfCAyICsrCj4gIGFyY2gvcmlzY3Yva2VybmVsL2Z0cmFjZS5jICAgICAgICB8
IDYgKysrLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL2p1bXBfbGFiZWwuYyAgICB8IDQgKystLQo+
ICA0IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9mdHJhY2UuaAo+IGluZGV4IGM0NzIxY2U0NGNhNDc0NjU0YjM3YjNkNTFiYzBh
NjNkNDZiYzFlZmYuLmI3ZjM2MWE1MGY2NDQ1ZDAyYTBkODhlZWY1NTQ3ZWUyN2MxZmI1MmUgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaAo+ICsrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vZnRyYWNlLmgKPiBAQCAtNzksNyArNzksNiBAQCBzdHJ1Y3QgZHlu
X2FyY2hfZnRyYWNlIHsKPiAgI2RlZmluZSBBVUlQQ19SQSAgICAgICAgICAgICAgICgweDAwMDAw
MDk3KQo+ICAjZGVmaW5lIEpBTFJfVDAgICAgICAgICAgICAgICAgICAgICAgICAoMHgwMDAyODJl
NykKPiAgI2RlZmluZSBBVUlQQ19UMCAgICAgICAgICAgICAgICgweDAwMDAwMjk3KQo+IC0jZGVm
aW5lIE5PUDQgICAgICAgICAgICAgICAgICAgKDB4MDAwMDAwMTMpCj4KPiAgI2RlZmluZSB0b19q
YWxyX3QwKG9mZnNldCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4gICAgICAgICAoKChvZmZzZXQgJiBKQUxSX09GRlNFVF9NQVNLKSA8PCBKQUxSX1NISUZU
KSB8IEpBTFJfVDApCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi1k
ZWYuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi1kZWYuaAo+IGluZGV4IDlhOTEzMDEw
Y2RkOTNjZGZkZDkzZjQ2N2U3ODgwZTIwY2NlMGRkMmIuLjBhMWZjNTEzNGYyOWRhMTkwNTU0YzU5
ZjhjZWUzYjUzNzRjOWFhMmQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9p
bnNuLWRlZi5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9pbnNuLWRlZi5oCj4gQEAg
LTIwMCw0ICsyMDAsNiBAQAo+ICAjZGVmaW5lIFpBV1JTX1dSU19OVE8gICIuNGJ5dGUgMHgwMGQw
MDA3MyIKPiAgI2RlZmluZSBaQVdSU19XUlNfU1RPICAiLjRieXRlIDB4MDFkMDAwNzMiCj4KPiAr
I2RlZmluZSBSSVNDVl9JTlNOX05PUDQgICAgICAgIDB4MDAwMDAwMTNVCj4gKwo+ICAjZW5kaWYg
LyogX19BU01fSU5TTl9ERUZfSCAqLwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9m
dHJhY2UuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2Z0cmFjZS5jCj4gaW5kZXggMzUyNGRiNWU0ZmEw
MTRhNDU5NDQ2NWY4NDlkODk4YTAzMGJmYjdiOC4uNjc0ZGNkZmFlN2ExNDljMzM5ZjFlNzkxYWRi
NDUwNTM1ZjIyOTkxYiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9mdHJhY2UuYwo+
ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2Z0cmFjZS5jCj4gQEAgLTM2LDcgKzM2LDcgQEAgc3Rh
dGljIGludCBmdHJhY2VfY2hlY2tfY3VycmVudF9jYWxsKHVuc2lnbmVkIGxvbmcgaG9va19wb3Ms
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCAqZXhw
ZWN0ZWQpCj4gIHsKPiAgICAgICAgIHVuc2lnbmVkIGludCByZXBsYWNlZFsyXTsKPiAtICAgICAg
IHVuc2lnbmVkIGludCBub3BzWzJdID0ge05PUDQsIE5PUDR9Owo+ICsgICAgICAgdW5zaWduZWQg
aW50IG5vcHNbMl0gPSB7UklTQ1ZfSU5TTl9OT1A0LCBSSVNDVl9JTlNOX05PUDR9Owo+Cj4gICAg
ICAgICAvKiB3ZSBleHBlY3Qgbm9wcyBhdCB0aGUgaG9vayBwb3NpdGlvbiAqLwo+ICAgICAgICAg
aWYgKCFleHBlY3RlZCkKPiBAQCAtNjgsNyArNjgsNyBAQCBzdGF0aWMgaW50IF9fZnRyYWNlX21v
ZGlmeV9jYWxsKHVuc2lnbmVkIGxvbmcgaG9va19wb3MsIHVuc2lnbmVkIGxvbmcgdGFyZ2V0LAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBlbmFibGUsIGJvb2wgcmEpCj4g
IHsKPiAgICAgICAgIHVuc2lnbmVkIGludCBjYWxsWzJdOwo+IC0gICAgICAgdW5zaWduZWQgaW50
IG5vcHNbMl0gPSB7Tk9QNCwgTk9QNH07Cj4gKyAgICAgICB1bnNpZ25lZCBpbnQgbm9wc1syXSA9
IHtSSVNDVl9JTlNOX05PUDQsIFJJU0NWX0lOU05fTk9QNH07Cj4KPiAgICAgICAgIGlmIChyYSkK
PiAgICAgICAgICAgICAgICAgbWFrZV9jYWxsX3JhKGhvb2tfcG9zLCB0YXJnZXQsIGNhbGwpOwo+
IEBAIC05Nyw3ICs5Nyw3IEBAIGludCBmdHJhY2VfbWFrZV9jYWxsKHN0cnVjdCBkeW5fZnRyYWNl
ICpyZWMsIHVuc2lnbmVkIGxvbmcgYWRkcikKPiAgaW50IGZ0cmFjZV9tYWtlX25vcChzdHJ1Y3Qg
bW9kdWxlICptb2QsIHN0cnVjdCBkeW5fZnRyYWNlICpyZWMsCj4gICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBsb25nIGFkZHIpCj4gIHsKPiAtICAgICAgIHVuc2lnbmVkIGludCBub3BzWzJd
ID0ge05PUDQsIE5PUDR9Owo+ICsgICAgICAgdW5zaWduZWQgaW50IG5vcHNbMl0gPSB7UklTQ1Zf
SU5TTl9OT1A0LCBSSVNDVl9JTlNOX05PUDR9Owo+Cj4gICAgICAgICBpZiAocGF0Y2hfaW5zbl93
cml0ZSgodm9pZCAqKXJlYy0+aXAsIG5vcHMsIE1DT1VOVF9JTlNOX1NJWkUpKQo+ICAgICAgICAg
ICAgICAgICByZXR1cm4gLUVQRVJNOwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9q
dW1wX2xhYmVsLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9qdW1wX2xhYmVsLmMKPiBpbmRleCA2NTRl
ZDE1OWM4MzBiM2Q1ZTM0YWM1OGJmMzY3MTA3MDY2ZWI3M2ExLi5iNGMxYTZhM2ZiZDI4NTMzNTUy
MDM2MTk0ZjI3ZWQyMDZiZWEzMDVkIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2p1
bXBfbGFiZWwuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2p1bXBfbGFiZWwuYwo+IEBAIC0x
MSw4ICsxMSw4IEBACj4gICNpbmNsdWRlIDxhc20vYnVnLmg+Cj4gICNpbmNsdWRlIDxhc20vY2Fj
aGVmbHVzaC5oPgo+ICAjaW5jbHVkZSA8YXNtL3RleHQtcGF0Y2hpbmcuaD4KPiArI2luY2x1ZGUg
PGFzbS9pbnNuLWRlZi5oPgo+Cj4gLSNkZWZpbmUgUklTQ1ZfSU5TTl9OT1AgMHgwMDAwMDAxM1UK
PiAgI2RlZmluZSBSSVNDVl9JTlNOX0pBTCAweDAwMDAwMDZmVQo+Cj4gIGJvb2wgYXJjaF9qdW1w
X2xhYmVsX3RyYW5zZm9ybV9xdWV1ZShzdHJ1Y3QganVtcF9lbnRyeSAqZW50cnksCj4gQEAgLTMz
LDcgKzMzLDcgQEAgYm9vbCBhcmNoX2p1bXBfbGFiZWxfdHJhbnNmb3JtX3F1ZXVlKHN0cnVjdCBq
dW1wX2VudHJ5ICplbnRyeSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAoKCh1MzIpb2Zmc2V0
ICYgR0VOTUFTSygxMCwgIDEpKSA8PCAoMjEgLSAgMSkpIHwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAoKCh1MzIpb2Zmc2V0ICYgR0VOTUFTSygyMCwgMjApKSA8PCAoMzEgLSAyMCkpOwo+ICAg
ICAgICAgfSBlbHNlIHsKPiAtICAgICAgICAgICAgICAgaW5zbiA9IFJJU0NWX0lOU05fTk9QOwo+
ICsgICAgICAgICAgICAgICBpbnNuID0gUklTQ1ZfSU5TTl9OT1A0Owo+ICAgICAgICAgfQo+Cj4g
ICAgICAgICBpZiAoZWFybHlfYm9vdF9pcnFzX2Rpc2FibGVkKSB7Cj4KPiAtLQo+IDIuNDMuMAo+
CgpSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgpU
ZXN0ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KClRoYW5r
cywKCkFsZXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
