Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1443C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 17:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Py1WdfLryX7Qzn/NWOFjsYMOaEEIywwI59d1p+2Eyx4=; b=JnwJeG0UsNQ0Mx
	WEnrsrSRRDwDpl3LZercATBJZAIolU1tt+I/QfxD3nBmjiaRg3Onv9CgrZx7+SwO6S1BBdp44o2Co
	KMCQxdffdRgL23ttflDZvxIc1gPHZSiYMOXf4/W8WF/ZoerHr9i86IFg1E1aucfesqST/GnkFUpRc
	rKaq06bFkGxne2+pmo8uXEai4hDgPrTb6XemUNLwVnwaX0nf3xnzv+1cEBG03YlNYGe+UtG87SSxj
	B904vyMpXfH8iNxZF50HeOg9IXtNp7fmfIXrSKUt8sRZphl14dkX8tHvdpJw3JXcPbOcOjf2baNHu
	hLSREGlyE4fB8DN4vZzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCjvs-006EEU-2Q;
	Mon, 11 Dec 2023 17:19:04 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCjvo-006EBz-3A
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 17:19:03 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso3910820a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 09:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702315140; x=1702919940; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iN9bN85mkk9gb8ZXTbv0vDp/cwGaFm0XvPZtFw0AYAo=;
        b=ijj9ddPT5bqlEAhjMk7gQfShbng23aFMcjFc9zoMj8lYfXZsVgFdZVCRiPN9LrOyYb
         F7QqDZIzZZV8HzhU9xh3KcYs9PMRASM6ygk7Nxnu6iximpfvsMgGHly+GCCRdk60qsJF
         qyoH1O/EVN/i0Ua2BJxP65EHopUeK/6XA0cqpoNB9zQowv1Gz3yx9OcDwBs1DZUgPdLB
         mN4Uas8RrJfwhtnNeXVqJ48OdBcTnbFutfsw1TafbKzjdy6zpKCGH5PG7EY/Yxa4RHSK
         MjjP4/Qz/lGtS2GoKARm4be55P0UtF8KEwnad5ViIAzwq+H8J5rCmSRs339eifn4Cc9m
         txlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702315140; x=1702919940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iN9bN85mkk9gb8ZXTbv0vDp/cwGaFm0XvPZtFw0AYAo=;
        b=qA90nUAlCOGdRV/wqbPdDO4LuMvnpt+Go/rrEiSg4qBeduFzRjZ6O+TMYUt6T3lG0d
         A4rHVr1XBfYuyj4zGnPeZzPT3f1xHkQ2rxrV/c2ashZeUWJyeWgY/0z9nm7LEy+SIOfr
         Xf6avPNkqbzya3XUuuwXMDvAigz6v9HPabJURqE6OEdX+JxbGL/8QEl7yV2IPoH3gUo/
         0TG5XrkGmEaQeacL6Lf0VSkVC/vcd5YhDlcGBW1u0UPIjsyt7VOf93eOlzxnUnubb8t1
         YsulXm6BQccVrXNGuSGap4qtWUoquv2S7BvECjZov5kYUIEf9ZKbLNLSU4tfNPgItDBC
         qoEw==
X-Gm-Message-State: AOJu0YwA8bmMK1V8U49wg8LGOPqOeqp6aH9ihF6RYDpMV/AtCasxl27R
	OCaG4mWtOKF8CVsJmC1ijAGNTRPPLa+LW15g2f3eUQ==
X-Google-Smtp-Source: AGHT+IGVodSbepAQwKoZ95nkl+0HFnF1yHOk1xm8E0xgTkFXuMvl+0Rpg/a165J2vySkq7RuQhuJnw==
X-Received: by 2002:ad4:4352:0:b0:67a:9b59:8af7 with SMTP id q18-20020ad44352000000b0067a9b598af7mr5530003qvs.2.1702308470068;
        Mon, 11 Dec 2023 07:27:50 -0800 (PST)
Received: from ?IPV6:2600:1700:2000:b002:f8a3:26ec:ac85:392e? ([2600:1700:2000:b002:f8a3:26ec:ac85:392e])
        by smtp.gmail.com with ESMTPSA id o17-20020a0cfa91000000b0067a56b6adfesm3362804qvn.71.2023.12.11.07.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 07:27:49 -0800 (PST)
Message-ID: <b9292e35-6870-4c6d-8831-c9b15a33f52f@sifive.com>
Date: Mon, 11 Dec 2023 09:27:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: pgtable: Enhance set_pte to prevent OoO risk
Content-Language: en-US
To: Guo Ren <guoren@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, akpm@linux-foundation.org,
 catalin.marinas@arm.com, willy@infradead.org, david@redhat.com,
 muchun.song@linux.dev, will@kernel.org, peterz@infradead.org,
 rppt@kernel.org, paulmck@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, alex@ghiti.fr, mike.kravetz@oracle.com,
 dfustini@baylibre.com, wefu@redhat.com, jszhang@kernel.org,
 falcon@tinylab.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
References: <20231208151036.2458921-1-guoren@kernel.org>
 <CAHVXubjfuKZ1PBYQ8By41OX65YpAma3_kmSL7urT8L0PmMxFnQ@mail.gmail.com>
 <CAJF2gTSB-4hDo8ncSLVKvbnOOEwLSrV716kQM9d9HrzXFs7D8A@mail.gmail.com>
 <CAHVXubiK0TXMuhZhYjLq7tyk_dhFP9W2uReacECWDC7HToYuXA@mail.gmail.com>
 <CAJF2gTSCZ4ytzkenibT+38TzqoYKjBebRRabzn7YQ79bY5yp3g@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAJF2gTSCZ4ytzkenibT+38TzqoYKjBebRRabzn7YQ79bY5yp3g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_091901_139872_E671C0E3 
X-CRM114-Status: GOOD (  25.83  )
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

T24gMjAyMy0xMi0xMSA1OjM2IEFNLCBHdW8gUmVuIHdyb3RlOgo+IE9uIE1vbiwgRGVjIDExLCAy
MDIzIGF0IDU6MDTigK9QTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+
IHdyb3RlOgo+Pgo+PiBPbiBNb24sIERlYyAxMSwgMjAyMyBhdCA5OjQx4oCvQU0gR3VvIFJlbiA8
Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4KPj4+IE9uIE1vbiwgRGVjIDExLCAyMDIzIGF0
IDE6NTLigK9QTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3Rl
Ogo+Pj4+Cj4+Pj4gSGkgR3VvLAo+Pj4+Cj4+Pj4gT24gRnJpLCBEZWMgOCwgMjAyMyBhdCA0OjEw
4oCvUE0gPGd1b3JlbkBrZXJuZWwub3JnPiB3cm90ZToKPj4+Pj4KPj4+Pj4gRnJvbTogR3VvIFJl
biA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+Pj4+Pgo+Pj4+PiBXaGVuIGNoYW5naW5nIGZy
b20gYW4gaW52YWxpZCBwdGUgdG8gYSB2YWxpZCBvbmUgZm9yIGEga2VybmVsIHBhZ2UsCj4+Pj4+
IHRoZXJlIGlzIG5vIG5lZWQgZm9yIHRsYl9mbHVzaC4gSXQncyBva2F5IGZvciB0aGUgVFNPIG1l
bW9yeSBtb2RlbCwgYnV0Cj4+Pj4+IHRoZXJlIGlzIGFuIE9vTyByaXNrIGZvciB0aGUgV2VhayBv
bmUuIGVnOgo+Pj4+Pgo+Pj4+PiBzZCB0MCwgKGEwKSAvLyBhMCA9IHB0ZSBhZGRyZXNzLCBwdGV2
YWwgaXMgY2hhbmdlZCBmcm9tIGludmFsaWQgdG8gdmFsaWQKPj4+Pj4gLi4uCj4+Pj4+IGxkIHQx
LCAoYTEpIC8vIGExID0gdmEgb2YgYWJvdmUgcHRlCj4+Pj4+Cj4+Pj4+IElmIHRoZSBsZCBpbnN0
cnVjdGlvbiBpcyBleGVjdXRlZCBzcGVjdWxhdGl2ZWx5IGJlZm9yZSB0aGUgc2QKPj4+Pj4gaW5z
dHJ1Y3Rpb24uIFRoZW4gaXQgd291bGQgYnJpbmcgYW4gaW52YWxpZCBlbnRyeSBpbnRvIHRoZSBU
TEIsIGFuZCB3aGVuCj4+Pj4+IHRoZSBsZCBpbnN0cnVjdGlvbiByZXRpcmVkLCBhIHNwdXJpb3Vz
IHBhZ2UgZmF1bHQgb2NjdXJyZWQuIEJlY2F1c2UgdGhlCj4+Pj4+IHZtZW1tYXAgaGFzIGJlZW4g
aWdub3JlZCBieSB2bWFsbG9jX2ZhdWx0LCB0aGUgc3B1cmlvdXMgcGFnZSBmYXVsdCB3b3VsZAo+
Pj4+PiBjYXVzZSBrZXJuZWwgcGFuaWMuCj4+Pj4+Cj4+Pj4+IFRoaXMgcGF0Y2ggd2FzIGluc3Bp
cmVkIGJ5IHRoZSBjb21taXQ6IDdmMGIxYmYwNDUxMSAoImFybTY0OiBGaXggYmFycmllcnMKPj4+
Pj4gdXNlZCBmb3IgcGFnZSB0YWJsZSBtb2RpZmljYXRpb25zIikuIEZvciBSSVNDLVYsIHRoZXJl
IGlzIG5vIHJlcXVpcmVtZW50Cj4+Pj4+IGluIHRoZSBzcGVjIHRvIGd1YXJhbnRlZSBhbGwgdGxi
IGVudHJpZXMgYXJlIHZhbGlkIGFuZCBubyByZXF1aXJlbWVudCB0bwo+Pj4+PiBQVFcgZmlsdGVy
IG91dCBpbnZhbGlkIGVudHJpZXMuIE9mIGNvdXJzZSwgbWljcm8tYXJjaCBjb3VsZCBnaXZlIGEg
bW9yZQo+Pj4+PiByb2J1c3QgZGVzaWduLCBidXQgaGVyZSwgdXNlIGEgc29mdHdhcmUgZmVuY2Ug
dG8gZ3VhcmFudGVlLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5A
bGludXguYWxpYmFiYS5jb20+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBr
ZXJuZWwub3JnPgo+Pj4+PiAtLS0KPj4+Pj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJs
ZS5oIHwgNyArKysrKysrCj4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4+
Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4+Pj4+IGluZGV4IDI5NDA0NDQyOWU4
ZS4uMmZhZTVhNTQzOGUwIDEwMDY0NAo+Pj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3BndGFibGUuaAo+Pj4+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+
Pj4+PiBAQCAtNTExLDYgKzUxMSwxMyBAQCBzdGF0aWMgaW5saW5lIGludCBwdGVfc2FtZShwdGVf
dCBwdGVfYSwgcHRlX3QgcHRlX2IpCj4+Pj4+ICBzdGF0aWMgaW5saW5lIHZvaWQgc2V0X3B0ZShw
dGVfdCAqcHRlcCwgcHRlX3QgcHRldmFsKQo+Pj4+PiAgewo+Pj4+PiAgICAgICAgICpwdGVwID0g
cHRldmFsOwo+Pj4+PiArCj4+Pj4+ICsgICAgICAgLyoKPj4+Pj4gKyAgICAgICAgKiBPbmx5IGlm
IHRoZSBuZXcgcHRlIGlzIHByZXNlbnQgYW5kIGtlcm5lbCwgb3RoZXJ3aXNlIFRMQgo+Pj4+PiAr
ICAgICAgICAqIG1haW50ZW5hbmNlIG9yIHVwZGF0ZV9tbXVfY2FjaGUoKSBoYXZlIHRoZSBuZWNl
c3NhcnkgYmFycmllcnMuCj4+Pj4+ICsgICAgICAgICovCj4+Pj4+ICsgICAgICAgaWYgKHB0ZV92
YWwocHRldmFsKSAmIChfUEFHRV9QUkVTRU5UIHwgX1BBR0VfR0xPQkFMKSkKPj4+Pj4gKyAgICAg
ICAgICAgICAgIFJJU0NWX0ZFTkNFKHJ3LHJ3KTsKPj4+Pgo+Pj4+IE9ubHkgYSBzZmVuY2Uudm1h
IGNhbiBndWFyYW50ZWUgdGhhdCB0aGUgUFRXIGFjdHVhbGx5IHNlZXMgYSBuZXcKPj4+PiBtYXBw
aW5nLCBhIGZlbmNlIGlzIG5vdCBlbm91Z2guIFRoYXQgYmVpbmcgc2FpZCwgbmV3IGtlcm5lbCBt
YXBwaW5ncwo+Pj4+ICh2bWFsbG9jIG9uZXMpIGFyZSBjb3JyZWN0bHkgaGFuZGxlZCBpbiB0aGUg
a2VybmVsIGJ5IHVzaW5nCj4+Pj4gZmx1c2hfY2FjaGVfdm1hcCgpLiBEaWQgeW91IG9ic2VydmUg
c29tZXRoaW5nIHRoYXQgdGhpcyBwYXRjaCBmaXhlcz8KPj4+IFRoeCBmb3IgdGhlIHJlcGx5IQo+
Pj4KPj4+IFRoZSBzZmVuY2Uudm1hIGlzIHRvbyBleHBlbnNpdmUsIHNvIHRoZSBzaXR1YXRpb24g
aXMgdHJpY2t5LiBTZWUgdGhlCj4+PiBhcm02NCBjb21taXQ6IDdmMGIxYmYwNDUxMSAoImFybTY0
OiBGaXggYmFycmllcnMgdXNlZCBmb3IgcGFnZSB0YWJsZQo+Pj4gbW9kaWZpY2F0aW9ucyIpLCB3
aGljaCBpcyBzaW1pbGFyLiBUaGF0IGlzLCBsaW51eCBhc3N1bWVzIGludmFsaWQgcHRlCj4+PiB3
b24ndCBnZXQgaW50byBUTEIuIFRoaW5rIGFib3V0IG1lbW9yeSBob3RwbHVnOgo+Pj4KPj4+IG1t
L3NwYXJzZS5jOiBzcGFyc2VfYWRkX3NlY3Rpb24oKSB7Cj4+PiAuLi4KPj4+ICAgICAgICAgbWVt
bWFwID0gc2VjdGlvbl9hY3RpdmF0ZShuaWQsIHN0YXJ0X3BmbiwgbnJfcGFnZXMsIGFsdG1hcCwg
cGdtYXApOwo+Pj4gICAgICAgICBpZiAoSVNfRVJSKG1lbW1hcCkpCj4+PiAgICAgICAgICAgICAg
ICAgcmV0dXJuIFBUUl9FUlIobWVtbWFwKTsKPj4+Cj4+PiAgICAgICAgIC8qCj4+PiAgICAgICAg
ICAqIFBvaXNvbiB1bmluaXRpYWxpemVkIHN0cnVjdCBwYWdlcyBpbiBvcmRlciB0byBjYXRjaCBp
bnZhbGlkIGZsYWdzCj4+PiAgICAgICAgICAqIGNvbWJpbmF0aW9ucy4KPj4+ICAgICAgICAgICov
Cj4+PiAgICAgICAgIHBhZ2VfaW5pdF9wb2lzb24obWVtbWFwLCBzaXplb2Yoc3RydWN0IHBhZ2Up
ICogbnJfcGFnZXMpOwo+Pj4gLi4uCj4+PiB9Cj4+PiBUaGUgc2VjdGlvbl9hY3RpdmF0ZSB3b3Vs
ZCB1c2Ugc2V0X3B0ZSB0byBzZXR1cCB2bWVtbWFwLCBhbmQKPj4+IHBhZ2VfaW5pdF9wb2lzb24g
d291bGQgYWNjZXNzIHRoZXNlIHBhZ2VzJyBzdHJ1Y3QuCj4+Cj4+IFNvIEkgdGhpbmsgdGhlIGdl
bmVyaWMgY29kZSBtdXN0IGJlIGZpeGVkIGJ5IGFkZGluZyBhCj4+IGZsdXNoX2NhY2hlX3ZtYXAo
KSBpbiB2bWVtbWFwX3BvcHVsYXRlX3JhbmdlKCkgb3Igc2ltaWxhcjogc2V2ZXJhbAo+PiBhcmNo
aXRlY3R1cmVzIGltcGxlbWVudCBmbHVzaF9jYWNoZV92bWFwKCkgYmVjYXVzZSB0aGV5IG5lZWQg
dG8gZG8KPj4gInNvbWV0aGluZyIgYWZ0ZXIgYSBuZXcgbWFwcGluZyBpcyBlc3RhYmxpc2hlZCwg
c28gdm1lbW1hcCBzaG91bGQgbm90Cj4+IGJlIGFueSBkaWZmZXJlbnQuCj4gUGVyaGFwcyBnZW5l
cmljIGNvZGUgYXNzdW1lcyBUTEIgd29uJ3QgY29udGFpbiBpbnZhbGlkIGVudHJpZXMuIFdoZW4K
PiBpbnZhbGlkIC0+IHZhbGlkLCBMaW51eCB3b24ndCBkbyBhbnkgdGxiX2ZsdXNoLCByZWY6Cj4g
Cj4gKiBVc2Ugc2V0X3AqX3NhZmUoKSwgYW5kIGVsaWRlIFRMQiBmbHVzaGluZywgd2hlbiBjb25m
aWRlbnQgdGhhdCAqbm8qCj4gICogVExCIGZsdXNoIHdpbGwgYmUgcmVxdWlyZWQgYXMgYSByZXN1
bHQgb2YgdGhlICJzZXQiLiBGb3IgZXhhbXBsZSwgdXNlCj4gICogaW4gc2NlbmFyaW9zIHdoZXJl
IGl0IGlzIGtub3duIGFoZWFkIG9mIHRpbWUgdGhhdCB0aGUgcm91dGluZSBpcwo+ICAqIHNldHRp
bmcgbm9uLXByZXNlbnQgZW50cmllcywgb3IgcmUtc2V0dGluZyBhbiBleGlzdGluZyBlbnRyeSB0
byB0aGUKPiAgKiBzYW1lIHZhbHVlLiBPdGhlcndpc2UsIHVzZSB0aGUgdHlwaWNhbCAic2V0IiBo
ZWxwZXJzIGFuZCBmbHVzaCB0aGUKPiAgKiBUTEIuCj4gCj4+Cj4+Pgo+Pj4gVGhhdCBtZWFuczoK
Pj4+IHNkIHQwLCAoYTApIC8vIGEwID0gc3RydWN0IHBhZ2UncyBwdGUgYWRkcmVzcywgcHRldmFs
IGlzIGNoYW5nZWQgZnJvbQo+Pj4gaW52YWxpZCB0byB2YWxpZAo+Pj4gIC4uLgo+Pj4gbHcvc3cg
dDEsIChhMSkgLy8gYTEgPSB2YSBvZiBzdHJ1Y3QgcGFnZQo+Pj4KPj4+IElmIHRoZSBsdy9zdyBp
bnN0cnVjdGlvbiBpcyBleGVjdXRlZCBzcGVjdWxhdGl2ZWx5IGJlZm9yZSB0aGUgc2V0X3B0ZSwK
Pj4+IHdlIG5lZWQgYSBmZW5jZSB0byBwcmV2ZW50IHRoaXMuCj4+Cj4+IFllcyBJIGFncmVlLCBi
dXQgdG8gbWUgd2UgbmVlZCB0aGUgZmVuY2UgcHJvcGVydHkgb2Ygc2ZlbmNlLnZtYSB0bwo+PiBt
YWtlIHN1cmUgdGhlIFBUVyBzZWVzIHRoZSBuZXcgcHRlLCB1bmxlc3MgSSdtIG1pc3Rha2VuIGFu
ZCBzb21ldGhpbmcKPj4gaW4gdGhlIHByaXZpbGVnZWQgc3BlY2lmaWNhdGlvbiBzdGF0ZXMgdGhh
dCBhIGZlbmNlIGlzIGVub3VnaD8KPiBBbGwgUFRXIGFyZSB0cmlnZ2VyZWQgYnkgSUZVICYgbG9h
ZC9zdG9yZS4gRm9yIHRoZSAic2V0IiBzY2VuYXJpb3MsIHdlCj4ganVzdCBuZWVkIHRvIHByZXZl
bnQgdGhlIGFjY2VzcyB2YSBiZWZvcmUgdGhlIHNldF9wdGUuIFNvOgo+ICAtIERvbid0IHdvcnJ5
IGFib3V0IElGVSwgd2hpY2ggZmV0Y2hlcyB0aGUgY29kZSBzZXF1ZW50aWFsbHkuCj4gIC0gVXNl
IGEgZmVuY2UgcHJldmVudCBsb2FkL3N0b3JlIGJlZm9yZSBzZXRfcHRlLgo+IAo+IFNmZW5jZS52
bWEgaXMgdXNlZCBmb3IgaW52YWxpZGF0ZSBUTEIsIG5vdCBmb3IgaW52YWxpZCAtPiB2YWxpZC4K
CkkgdGhpbmsgdGhlIHByb2JsZW0gaXMgdGhhdCwgYXJjaGl0ZWN0dXJhbGx5LCB5b3UgY2FuJ3Qg
cHJldmVudCBhIFBUVyBieQpwcmV2ZW50aW5nIGFjY2VzcyB0byB0aGUgdmlydHVhbCBhZGRyZXNz
LiBUaGUgUklTQy1WIHByaXZpbGVnZWQgc3BlYyBhbGxvd3MKY2FjaGluZyB0aGUgcmVzdWx0cyBv
ZiBQVFdzIGZyb20gc3BlY3VsYXRpdmUgZXhlY3V0aW9uLCBhbmQgaXQgYWxsb3dzIGNhY2hpbmcK
aW52YWxpZCBQVEVzLiBTbyBlZmZlY3RpdmVseSwgYXMgc29vbiBhcyBzYXRwIGlzIHdyaXR0ZW4s
IHNvZnR3YXJlIG11c3QgYmUgYWJsZQp0byBoYW5kbGUgX2FueV8gdmlydHVhbCBhZGRyZXNzIGJl
aW5nIGluIHRoZSBUTEIuCgpUbyBhdm9pZCB0aGUgc2ZlbmNlLnZtYSBpbiB0aGUgaW52YWxpZC0+
dmFsaWQgY2FzZSwgeW91IG5lZWQgdG8gaGFuZGxlIHRoZQpwb3NzaWJsZSBwYWdlIGZhdWx0LCBs
aWtlIGluIEFsZXgncyBzZXJpZXMgaGVyZToKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LXJpc2N2LzIwMjMxMjA3MTUwMzQ4LjgyMDk2LTEtYWxleGdoaXRpQHJpdm9zaW5jLmNvbS8KClJl
Z2FyZHMsClNhbXVlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
