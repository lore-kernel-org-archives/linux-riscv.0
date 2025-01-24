Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389A4C02181
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 13:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9tvHIjJ6dyWEqUSWT4ZfRQ7HVTZGBKPm0AL7NdxF8UA=; b=cetM1ygSQr2OUc
	MBuL0128p8/rpThBi9rAsd2r6HIs19CA94/Jn3dkrg1QaLTPVgIBb04vHUU/dTxI4LRpqgr07sXwM
	JAqU0RB7SPYN8AQoAWYkv6JNdfgCXUUo9ckzCAKIFfwtZ6/wutHEiz7UsFzx1EjQhLQSawQkiC7Tt
	n3Bk2iwtD0tXLJmxgMguWdh0ZrEXZuVVtqCcpYuMu6OZm7MuZesJ+G0JBKwg0KoX1dYvK1LVijBf3
	oau37+v/NKTrWdqpNAZJ+9/7xx2J1NFnCdc89eDkgZr5UjYnTFXx+WMy9/IdlukaopKYjQNDYJ1Kp
	OTDnkvGYWa8aXIuwxRfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbJVw-0000000Eipc-2Vd9;
	Fri, 24 Jan 2025 13:14:24 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbJVu-0000000Eiov-1O7I
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jan 2025 13:14:23 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso2224849e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jan 2025 05:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737724461; x=1738329261; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NC2yTzK8NlSU4Cwgnl73gs8h6Jp1JNKpbTuyPayDCE4=;
        b=TQmGar7QlSyqs4AsAIAjA7X6OX4w3pg8KRzt/P6Gf8v+sM/WGPKPo/qi6NPnwWccjL
         Laowg1xEtaVBbDZPWPJHT8DsbzQ7APIFbfYMah0fpxz/uPJ03pGkklVXdxEJaxdHxdX7
         z5KsQDZ9B418ShosOH2be2sTRy7FM8Kw0EAXx40RuqIQ9eh6z/0jt6CzcYqimAuGV3tc
         doNMSU8r7NX1eSbbF3ueVEXa+liRVYsUFCWHPcJnK167df2Kdv+UJ4fg/MZG3Aoet871
         9hOqC85UJsRLuc6kCEwT83bWKCvRWh/14m6MMqZfj0boqMnNiGKTVLheAF4UD7V1Wm+J
         pkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737724461; x=1738329261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NC2yTzK8NlSU4Cwgnl73gs8h6Jp1JNKpbTuyPayDCE4=;
        b=dcr4SkciofTvkBVQI+rcSSmCMWN0y97LVerXF4nUR+TVjIdx2hwtqtPezc92u+WiEq
         NRbwypsHlL7HGa3EyIcGQsrQM7XbrDuEN+62k8/uVxi8E5Vo/1zmedwXUB5WA3+dV87u
         0l/hNqq/h3oKpXVEZ4W4exPzOoPGANvWK8TrgK4gw0rNUMTyBXtwxaX8TiEc1DRc/Iep
         6yxnhyNsF8CbgmWEr/RVax56HZ704nDd+sbjD+xHdGr92QqyzD90zF1rgN9eLv1duiMA
         xWwQyYZhMNnYhadVwJv63d1vPk+x1hu04opQ1/EH6vkfTsJspg+rIpAgXhQYQptgTkil
         5Y2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbHsbLIq+dBgESuRsnoKjqLjcCRoQvr4LpkhIOTLll3SiOBN6cDT5jpIJ+uNXMDtzzLjYwXTfTWkCRDw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+AAjr2/HPOYeynGg+c3v9xK1MQx5Eb0KS6CnB1sqVc2vtSgyj
	s1YJnDgjWsczK8HlVRJUzOzOF9EHzQoiyEXuVRz1wEarkM09oVS+RkpkWM2v6btWdmtXc2oMLs0
	RbxAr1BNKpNcD0nkQ/jb9CXmxGQ3o
X-Gm-Gg: ASbGncuqiO6WUzCG8oUkuaSHLYldYZ/gb7WNaxcltX0Fx7TexKEh+lJkWFOieFDZJmF
	nUeTRDsOdBqiGSrAyFhRNf4bW4IdZE7aIV/sbu32AaFaJu7W5uP5boTI9udN5dy9AkW86OqULEp
	xn
X-Google-Smtp-Source: AGHT+IH+KvzJHaBHBXGO+RKDTTaxF3dQyjfjmqAp7LLumZtS6SwcRxLQMF1eOIJBsvKWAhVUAORXGdyTR8KOE/uJovw=
X-Received: by 2002:a05:6512:b94:b0:542:2240:8c0 with SMTP id
 2adb3069b0e04-5439c23f364mr10465174e87.12.1737724460425; Fri, 24 Jan 2025
 05:14:20 -0800 (PST)
MIME-Version: 1.0
References: <20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com> <20250123-riscv_optimize_entry-v2-1-7c259492d508@rivosinc.com>
In-Reply-To: <20250123-riscv_optimize_entry-v2-1-7c259492d508@rivosinc.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Fri, 24 Jan 2025 08:14:08 -0500
X-Gm-Features: AWEUYZn_d1UqcapzOaVQPSA4ZFujGiTaEyjTyTvGvgwrsZe0oNKflw9JGjkne7k
Message-ID: <CAMzpN2gZrL8xusm8oDz-Oy6sZwjmYWshfx=hTUe7yL5M6UJSmw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] riscv: entry: Convert ret_from_fork() to C
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Andy Lutomirski <luto@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_051422_375601_B2DCE867 
X-CRM114-Status: GOOD (  18.56  )
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

T24gVGh1LCBKYW4gMjMsIDIwMjUgYXQgMjoxNeKAr1BNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gTW92ZSB0aGUgbWFpbiBzZWN0aW9uIG9mIHJldF9m
cm9tX2ZvcmsoKSB0byBDIHRvIGFsbG93IGlubGluaW5nIG9mCj4gc3lzY2FsbF9leGl0X3RvX3Vz
ZXJfbW9kZSgpLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJp
dm9zaW5jLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20tcHJvdG90eXBl
cy5oIHwgIDEgKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TICAgICAgICAgICAgICAgfCAx
NSArKysrKystLS0tLS0tLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jICAgICAgICAg
ICAgIHwgMTQgKysrKysrKysrKysrLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25z
KCspLCAxMSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2FzbS1wcm90b3R5cGVzLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS1wcm90b3R5
cGVzLmgKPiBpbmRleCBjZDYyN2VjMjg5ZjE2M2E2MzBiNzNkZDAzZGQ1MmE2YjI4NjkyOTk3Li43
MzNmZjYwOTc3ODc5NzAwMTAwNmMzM2JiYTllM2NjNWIxZjE1Mzg3IDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLXByb3RvdHlwZXMuaAo+ICsrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vYXNtLXByb3RvdHlwZXMuaAo+IEBAIC01Miw2ICs1Miw3IEBAIERFQ0xBUkVf
RE9fRVJST1JfSU5GTyhkb190cmFwX2VjYWxsX3MpOwo+ICBERUNMQVJFX0RPX0VSUk9SX0lORk8o
ZG9fdHJhcF9lY2FsbF9tKTsKPiAgREVDTEFSRV9ET19FUlJPUl9JTkZPKGRvX3RyYXBfYnJlYWsp
Owo+Cj4gK2FzbWxpbmthZ2Ugdm9pZCByZXRfZnJvbV9mb3JrKHZvaWQgKmZuX2FyZywgaW50ICgq
Zm4pKHZvaWQgKiksIHN0cnVjdCBwdF9yZWdzICpyZWdzKTsKPiAgYXNtbGlua2FnZSB2b2lkIGhh
bmRsZV9iYWRfc3RhY2soc3RydWN0IHB0X3JlZ3MgKnJlZ3MpOwo+ICBhc21saW5rYWdlIHZvaWQg
ZG9fcGFnZV9mYXVsdChzdHJ1Y3QgcHRfcmVncyAqcmVncyk7Cj4gIGFzbWxpbmthZ2Ugdm9pZCBk
b19pcnEoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpOwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tl
cm5lbC9lbnRyeS5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwo+IGluZGV4IDMzYTVhOWYy
YTBkNGUxZWVjY2ZiMzYyMWI5ZTUxOGI4OGUxYjA3MDQuLjkyMjVjMzIyMjc5YWE5MGU3MzdiMWQ3
MTQ0ZGIwODQzMTljZjgxMDMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnku
Uwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKPiBAQCAtMzE5LDE3ICszMTksMTQg
QEAgU1lNX0NPREVfRU5EKGhhbmRsZV9rZXJuZWxfc3RhY2tfb3ZlcmZsb3cpCj4gIEFTTV9OT0tQ
Uk9CRShoYW5kbGVfa2VybmVsX3N0YWNrX292ZXJmbG93KQo+ICAjZW5kaWYKPgo+IC1TWU1fQ09E
RV9TVEFSVChyZXRfZnJvbV9mb3JrKQo+ICtTWU1fQ09ERV9TVEFSVChyZXRfZnJvbV9mb3JrX2Fz
bSkKPiAgICAgICAgIGNhbGwgc2NoZWR1bGVfdGFpbAo+IC0gICAgICAgYmVxeiBzMCwgMWYgICAg
IC8qIG5vdCBmcm9tIGtlcm5lbCB0aHJlYWQgKi8KPiAtICAgICAgIC8qIENhbGwgZm4oYXJnKSAq
Lwo+IC0gICAgICAgbW92ZSBhMCwgczEKPiAtICAgICAgIGphbHIgczAKPiAtMToKPiAtICAgICAg
IG1vdmUgYTAsIHNwIC8qIHB0X3JlZ3MgKi8KPiAtICAgICAgIGNhbGwgc3lzY2FsbF9leGl0X3Rv
X3VzZXJfbW9kZQo+ICsgICAgICAgbW92ZSBhMCwgczEgLyogZm4gKi8KPiArICAgICAgIG1vdmUg
YTEsIHMwIC8qIGZuX2FyZyAqLwo+ICsgICAgICAgbW92ZSBhMiwgc3AgLyogcHRfcmVncyAqLwo+
ICsgICAgICAgY2FsbCByZXRfZnJvbV9mb3JrCj4gICAgICAgICBqIHJldF9mcm9tX2V4Y2VwdGlv
bgo+IC1TWU1fQ09ERV9FTkQocmV0X2Zyb21fZm9yaykKPiArU1lNX0NPREVfRU5EKHJldF9mcm9t
X2ZvcmtfYXNtKQo+Cj4gICNpZmRlZiBDT05GSUdfSVJRX1NUQUNLUwo+ICAvKgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9j
ZXNzLmMKPiBpbmRleCA1OGI2NDgyYzJiZjY2MmJmNTIyNGNhNTBjOGUyMWE2ODc2MGE2YjQxLi4w
ZDA3ZTZkOGY2YjU3YmViYTQzOGRiYmE1ZThjNzRhMDE0NTgyYmVlIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nl
c3MuYwo+IEBAIC0xNyw3ICsxNyw5IEBACj4gICNpbmNsdWRlIDxsaW51eC9wdHJhY2UuaD4KPiAg
I2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BlcnNvbmFsaXR5
Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9lbnRyeS1jb21tb24uaD4KPgo+ICsjaW5jbHVkZSA8YXNt
L2FzbS1wcm90b3R5cGVzLmg+Cj4gICNpbmNsdWRlIDxhc20vdW5pc3RkLmg+Cj4gICNpbmNsdWRl
IDxhc20vcHJvY2Vzc29yLmg+Cj4gICNpbmNsdWRlIDxhc20vY3NyLmg+Cj4gQEAgLTM2LDcgKzM4
LDcgQEAgdW5zaWduZWQgbG9uZyBfX3N0YWNrX2Noa19ndWFyZCBfX3JlYWRfbW9zdGx5Owo+ICBF
WFBPUlRfU1lNQk9MKF9fc3RhY2tfY2hrX2d1YXJkKTsKPiAgI2VuZGlmCj4KPiAtZXh0ZXJuIGFz
bWxpbmthZ2Ugdm9pZCByZXRfZnJvbV9mb3JrKHZvaWQpOwo+ICtleHRlcm4gYXNtbGlua2FnZSB2
b2lkIHJldF9mcm9tX2ZvcmtfYXNtKHZvaWQpOwo+Cj4gIHZvaWQgbm9pbnN0ciBhcmNoX2NwdV9p
ZGxlKHZvaWQpCj4gIHsKPiBAQCAtMjA2LDYgKzIwOCwxNCBAQCBpbnQgYXJjaF9kdXBfdGFza19z
dHJ1Y3Qoc3RydWN0IHRhc2tfc3RydWN0ICpkc3QsIHN0cnVjdCB0YXNrX3N0cnVjdCAqc3JjKQo+
ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+ICthc21saW5rYWdlIHZvaWQgcmV0X2Zyb21fZm9y
ayh2b2lkICpmbl9hcmcsIGludCAoKmZuKSh2b2lkICopLCBzdHJ1Y3QgcHRfcmVncyAqcmVncykK
PiArewo+ICsgICAgICAgaWYgKHVubGlrZWx5KGZuKSkKPiArICAgICAgICAgICAgICAgZm4oZm5f
YXJnKTsKPiArCj4gKyAgICAgICBzeXNjYWxsX2V4aXRfdG9fdXNlcl9tb2RlKHJlZ3MpOwo+ICt9
Cj4gKwo+ICBpbnQgY29weV90aHJlYWQoc3RydWN0IHRhc2tfc3RydWN0ICpwLCBjb25zdCBzdHJ1
Y3Qga2VybmVsX2Nsb25lX2FyZ3MgKmFyZ3MpCj4gIHsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcg
Y2xvbmVfZmxhZ3MgPSBhcmdzLT5mbGFnczsKPiBAQCAtMjQyLDcgKzI1Miw3IEBAIGludCBjb3B5
X3RocmVhZChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnAsIGNvbnN0IHN0cnVjdCBrZXJuZWxfY2xvbmVf
YXJncyAqYXJncykKPiAgICAgICAgIHAtPnRocmVhZC5yaXNjdl92X2ZsYWdzID0gMDsKPiAgICAg
ICAgIGlmIChoYXNfdmVjdG9yKCkpCj4gICAgICAgICAgICAgICAgIHJpc2N2X3ZfdGhyZWFkX2Fs
bG9jKHApOwo+IC0gICAgICAgcC0+dGhyZWFkLnJhID0gKHVuc2lnbmVkIGxvbmcpcmV0X2Zyb21f
Zm9yazsKPiArICAgICAgIHAtPnRocmVhZC5yYSA9ICh1bnNpZ25lZCBsb25nKXJldF9mcm9tX2Zv
cmtfYXNtOwo+ICAgICAgICAgcC0+dGhyZWFkLnNwID0gKHVuc2lnbmVkIGxvbmcpY2hpbGRyZWdz
OyAvKiBrZXJuZWwgc3AgKi8KPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiAtLQo+IDIuNDMu
MAo+Cj4KCklzIHRoZXJlIGEgc3BlY2lmaWMgcmVhc29uIHlvdSBkaWRuJ3QgbW92ZSB0aGUgY2Fs
bCB0byBzY2hlZHVsZV90YWlsKCkKdG8gdGhlIEMgZnVuY3Rpb24sIGxpa2Ugb24geDg2PwoKCkJy
aWFuIEdlcnN0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
