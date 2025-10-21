Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A32DCCD1A5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 22:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ksy1/6RI9t7Up/Jx69BWbcqJtgDI2aYAm+KRIw1EsZU=; b=D5nWsfu5pZLX04
	qgtB5cNhXN2FxxK3lxOzFnz/LxmoQIaKKY1U2Td8vwbSfyDguohWTcbZ4TtpAHG4ofT3fkrLRx8Ng
	C/hKzCJS04axY2rXIG1dW6j22DxGvd8v4EVzGHEWs558aXIAwHuInR0CNc72dFm1SJiIon7sGLEJe
	dE+/C0KObaKTrFFeH68sV5gF0FbTiyaBfEsA8jGds9+4Q3a3UTQJX0+8IU7cekN01BeJlnmwDB3Uj
	qWgI+fbrl5AFRh5THsJBL938tTtHAFnBtuntn9Tj0KxcuTszkau6BJC7ZGw1sonme+uFN2LjmW0Rl
	sbqRicVtrdsfy1ocgtmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBKWZ-00000000ld2-3aNr;
	Tue, 21 Oct 2025 22:08:11 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBKWW-00000000lcW-3KIW
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 22:08:10 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b5b823b4f3dso1169042066b.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 Oct 2025 15:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761084487; x=1761689287; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SJXvV85x5jMosgE1Az7dDeZnp5kW+qnV7kl2NORTrk=;
        b=KJhdFZ2hjlMrjxJBUm/l85jT7O0ky8i0a7i5iLrzBlK0BVAMkZ2Rr2MkHtlLUJhS1C
         9ayDZEvehyjmhGmmKLB2KNLP3psdCOmno5MTS+i1fbpxZl9gDpd/TBr189840kOE0z9M
         iNYr/LrmqVyWPJtKsbfy729PnQ6R13kq7D7SwAbPF5cb0VMF4k7QbdAp/sEAP5gH/uOZ
         vq7jd9GCQ60USi0Ahj4d4Rg6e7KCzZYJmKp8H/41nF6FhlgvuH0UQa/QQAOSrxZfRklw
         t9IdEk4QpL47QFZIZl6PiLo9Wt0ryzFYCQt8lGGuJJp01Zi/KbCpZFhq6TTMh32drw9h
         BvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761084487; x=1761689287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1SJXvV85x5jMosgE1Az7dDeZnp5kW+qnV7kl2NORTrk=;
        b=H4si3rxHUy/vCMeT/g8nCgq8wtzv8DW647DovqUOoWFo6oZrJ1eozwK+mRrXLCNpiP
         KWzHBRZwDK9oJ1slv+uxdLLuVpM/zPTaKNdueNE1kOvYwpT9grRK5U8E8ERwpXRB0Xi0
         8ON++3i3FGc1sHQUMrzitBu/PW6E5IQCiJMxJ+7aE3EEUdLgc4kiulqpKwAyiRt0A95x
         EJJWvtr+/7a4HS8WsGE1AZBURMLv2H6L4+V8hlDDMkHMiz3NmGPuqMVoZkXWM/x8Rhlo
         2Msx38J17Om3UuVXCnDgCuOXRcBxbqECYJCTWMM9AXXgNVvNkSsuX4D+IZfgaPRbKWOY
         hiEA==
X-Gm-Message-State: AOJu0YwHOUJM3ONttjwZ6aEgo8hsLJgNVgEXtU9yKUK3QNFdPGWMq6l6
	j1SeaggTbG2Um5yWlJgDDfkWeEVccdUQckOkACN1utXlQ/9h89E0h+vvHM0xizRDQdFqmC4A+5H
	dn0m2LhxoAc7CWFIPMTiQrrA1UYA6xmE=
X-Gm-Gg: ASbGncvt2zgZjkTM4po4AvTiLG1vmsWwvE9sm8P6ZK7f+tlXi4c5TaK16XNCIybqzhR
	TAOSoHT3xPTkCkAJkbg6GSmXuc1F2hv0yLEhC7U0NGt/dpCo4VYwBWcuktQsc2fB7zhieG8H6tE
	dkFDYm0KRfjLHBmMosSVWb1suhCosGOrfx/fUPx/ipul77nJnJ78rzgXYNkvvCXigYWhimmcJJm
	K0uPtbfVQyhnCVlAalQsGgEkOV9LeApZEZBFuBcZI9KrJh8VmvR6m7kDg==
X-Google-Smtp-Source: AGHT+IGDo+j3YXKHOCH7efiHHOrt3v6TVVXF/wuEOE3mxT2beymntSTmRW6G/B3jC0eiwCHDf4Q5xC6fF6QnKR0lv5g=
X-Received: by 2002:a17:906:dc92:b0:b4f:ee15:8af4 with SMTP id
 a640c23a62f3a-b6474b35fe6mr2129834666b.34.1761084486712; Tue, 21 Oct 2025
 15:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <20251007115840.2320557-1-geomatsi@gmail.com> <20251007115840.2320557-7-geomatsi@gmail.com>
 <CAFTtA3PyEnscQx+JtM3wBb0YZJxFjoJp4JB6QJQXbN6q3HVFyA@mail.gmail.com> <aPVba5_moA6g-0Uo@curiosity>
In-Reply-To: <aPVba5_moA6g-0Uo@curiosity>
From: Andy Chiu <andybnac@gmail.com>
Date: Tue, 21 Oct 2025 17:07:55 -0500
X-Gm-Features: AS18NWBxOA6BKOJR9HnSchM5A8gYAiLSQ89wMSBHMqfEeBqTwrIduyXHCKRwkyg
Message-ID: <CAFTtA3NW=8JDnr=JN2X9q9YwYLihsF3zE06VTGSzg7kVjDLJZQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] riscv: vector: initialize vlenb on the first
 context switch
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Thomas Huth <thuth@redhat.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Han Gao <rabenda.cn@gmail.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Nam Cao <namcao@linutronix.de>, 
	Joel Granados <joel.granados@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_150808_877218_3F088A51 
X-CRM114-Status: GOOD (  30.73  )
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

T24gU3VuLCBPY3QgMTksIDIwMjUgYXQgNDo0M+KAr1BNIFNlcmdleSBNYXR5dWtldmljaCA8Z2Vv
bWF0c2lAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgT2N0IDE1LCAyMDI1IGF0IDAyOjU0
OjM5UE0gLTA1MDAsIEFuZHkgQ2hpdSB3cm90ZToKPiA+IEhpIFNlcmdleSwKPiA+Cj4gPiBPbiBU
dWUsIE9jdCA3LCAyMDI1IGF0IDY6NTjigK9BTSBTZXJnZXkgTWF0eXVrZXZpY2ggPGdlb21hdHNp
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IFRoZSB2c3RhdGUgaW4gdGhyZWFkX3N0cnVj
dCBpcyB6ZXJvZWQgd2hlbiB0aGUgdmVjdG9yIGNvbnRleHQgaXMKPiA+ID4gaW5pdGlhbGl6ZWQu
IFRoYXQgaW5jbHVkZXMgcmVhZC1vbmx5IHJlZ2lzdGVyIHZsZW5iLCB3aGljaCBob2xkcwo+ID4g
PiB0aGUgdmVjdG9yIHJlZ2lzdGVyIGxlbmd0aCBpbiBieXRlcy4gVGhpcyB6ZXJvZWQgc3RhdGUg
cGVyc2lzdHMKPiA+ID4gdW50aWwgbXN0YXR1cy5WUyBiZWNvbWVzICdkaXJ0eScgYW5kIGEgY29u
dGV4dCBzd2l0Y2ggc2F2ZXMgdGhlCj4gPiA+IGFjdHVhbCBoYXJkd2FyZSB2YWx1ZXMuCj4gPiA+
Cj4gPiA+IFRoaXMgY2FuIGV4cG9zZSB0aGUgemVybyB2bGVuYiB2YWx1ZSB0byB0aGUgdXNlci1z
cGFjZSBpbiBlYXJseQo+ID4gPiBkZWJ1ZyBzY2VuYXJpb3MsIGUuZy4gd2hlbiBwdHJhY2UgYXR0
YWNoZXMgdG8gYSB0cmFjZWQgcHJvY2Vzcwo+ID4gPiBlYXJseSwgYmVmb3JlIGFueSB2ZWN0b3Ig
aW5zdHJ1Y3Rpb24gZXhjZXB0IHRoZSBmaXJzdCBvbmUgd2FzCj4gPiA+IGV4ZWN1dGVkLgo+ID4g
Pgo+ID4gPiBGaXggdGhpcyBieSBmb3JjaW5nIHRoZSB2ZWN0b3IgY29udGV4dCBzYXZlIG9uIHRo
ZSBmaXJzdCBjb250ZXh0IHN3aXRjaC4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5
IE1hdHl1a2V2aWNoIDxnZW9tYXRzaUBnbWFpbC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9y
aXNjdi9rZXJuZWwvdmVjdG9yLmMgfCA0ICsrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Zl
Y3Rvci5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMKPiA+ID4gaW5kZXggOTAxZTY3YWRm
NTc2Li4zZGQyMmE3MWFhMTggMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Zl
Y3Rvci5jCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jCj4gPiA+IEBAIC0x
MjAsNiArMTIwLDcgQEAgc3RhdGljIGludCByaXNjdl92X3RocmVhZF96YWxsb2Moc3RydWN0IGtt
ZW1fY2FjaGUgKmNhY2hlLAo+ID4gPgo+ID4gPiAgICAgICAgIGN0eC0+ZGF0YXAgPSBkYXRhcDsK
PiA+ID4gICAgICAgICBtZW1zZXQoY3R4LCAwLCBvZmZzZXRvZihzdHJ1Y3QgX19yaXNjdl92X2V4
dF9zdGF0ZSwgZGF0YXApKTsKPiA+ID4gKwo+ID4gPiAgICAgICAgIHJldHVybiAwOwo+ID4gPiAg
fQo+ID4gPgo+ID4gPiBAQCAtMjE2LDggKzIxNywxMSBAQCBib29sIHJpc2N2X3ZfZmlyc3RfdXNl
X2hhbmRsZXIoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiA+ICAgICAgICAgICAgICAgICBmb3Jj
ZV9zaWcoU0lHQlVTKTsKPiA+ID4gICAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ID4gPiAg
ICAgICAgIH0KPiA+ID4gKwo+ID4gPiAgICAgICAgIHJpc2N2X3ZfdnN0YXRlX29uKHJlZ3MpOwo+
ID4gPiAgICAgICAgIHJpc2N2X3ZfdnN0YXRlX3NldF9yZXN0b3JlKGN1cnJlbnQsIHJlZ3MpOwo+
ID4gPiArICAgICAgIHNldF90c2tfdGhyZWFkX2ZsYWcoY3VycmVudCwgVElGX1JJU0NWX1ZfRk9S
Q0VfU0FWRSk7Cj4gPiA+ICsKPiA+Cj4gPiBJIGFtIGFmcmFpZCB0aGF0IHRoaXMgYXBwcm9hY2gg
Y2FuIHJlc3VsdCBpbiBhIHNlY3VyaXR5IGlzc3VlIHdoZXJlIGEKPiA+IGNvbnRleHQgc3dpdGNo
IGhhcHBlbnMgYmVmb3JlIHRoZSB2LXJlc3RvcmUgcGFydCBvZiB0aGUgY3VycmVudAo+ID4gcHJv
Y2VzcywgY2hlYXRpbmcgdGhlIGtlcm5lbCB0byBzdG9yZSBzdGFsZSB2LXJlZ3Mgb250byB0aGUg
Y3VycmVudAo+ID4gY29udGV4dCBtZW1vcnkuIFBsZWFzZSBub3RlIHRoYXQgdGhpcyBoYW5kbGVy
IGlzIHJ1biB3aXRoIGlycSBlbmFibGVkCj4gPiBzbyBwcmVlbXB0aW9uIGlzIGFsbG93ZWQuCj4g
Pgo+ID4gSSB3b3VsZCBleHBlY3Qgc2ltcGx5IGluaXRpYWxpemluZyB0aGUgdmxlYiBpbiByaXNj
dl92X3RocmVhZF96YWxsb2MsCj4gPiBwZXJoYXBzIGRyb3BwaW5nIHRoZSAieiIgaW4gdGhlIG5h
bWUgdG8gcHJldmVudCBjb25mdXNpb24uCj4KPiBPaywgc28gd2UgY2FuIGp1c3Qgc2V0ICdjdHgt
PnZsZW5iID0gcmlzY3Zfdl92c2l6ZSAvIDMyJyBpbiB0aGUgcmVuYW1lZAo+IHJpc2N2X3ZfdGhy
ZWFkX2FsbG9jIGZ1bmN0aW9uLiBCdXQgbm90ZSwgdGhhdCB3L28gZm9yY2VkIGNvbnRleHQgc2F2
ZQo+IHdlIGltcGxpY2l0bHkgcmVzZXQgdGhlIHZlY3RvciBjb25maWd1cmF0aW9uIHRvICdhbGwg
emVyb3MnLCBvdmVyd3JpdGluZwo+IHRoZSBoYXJkd2FyZSBkZWZhdWx0cy4KClJlc2V0dGluZyBh
bGwgdnJlZ3MgdG8gemVybyBpcyBkZXNpcmVkIGFzIG90aGVyd2lzZSB3ZSBtYXkKdW5pbnRlbnRp
b25hbGx5IGxlYWsgc3RhbGUgc3RhdGVzIGZyb20gb3RoZXIgdXNlcnMgb3IgdGhlIGtlcm5lbCB0
bwp0aGUgdXNlciBwcm9jZXNzLgoKPgo+IEJ5IHRoZSB3YXksIGNvdWxkIHlvdSBwbGVhc2UgZWxh
Ym9yYXRlIGEgbGl0dGxlIGJpdCBtb3JlIGFib3V0IHlvdXIgc2VjdXJpdHkKPiBjb25jZXJucyB3
aXRoIHRoZSBUSUZfUklTQ1ZfVl9GT1JDRV9TQVZFIGFwcHJvYWNoID8gVGhlIGF0b21pYyBhbmQg
cGVyLXByb2Nlc3MKPiBmbGFnIG1vZGlmaWNhdGlvbiBsb29rcyBzYWZlIHRvIG1lLCBzbyBJJ2Qg
bGlrZSB0byB1bmRlcnN0YW5kIHdoYXQgSSBhbQo+IG1pc3NpbmcuCj4KClRoZSBjb25jZXJuIGlz
IGluZm9ybWF0aW9uIGxlYWsuIEEgY29udGV4dCBzd2l0Y2ggY2FuIGhhcHBlbiByaWdodAphZnRl
ciB0aGUgRk9SQ0VfU0FWRSBiaXQgaXMgc2V0LiBBdCB0aGlzIHBvaW50IHRoZSBrZXJuZWwgc2F2
ZXMgbGl2ZQp2cmVncyBvbiB0aGUgbWFjaGluZSB0byB0aGUgY29udGV4dCBtZW1vcnkgKHZzdGF0
ZSkgb2YgdGhhdCBwcm9jZXNzLgpUaGUgY29udGVudCBvZiBsaXZlIHJlZ2lzdGVycyBtYXkgY29t
ZSBmcm9tIGFub3RoZXIgcHJvY2Vzcywgb3Igc3RhbGUKdmFsdWUgb2YgaW4ta2VybmVsIFZlY3Rv
ciB1c2VzLCBzaW5jZSB3ZSBkb24ndCBmbHVzaCByZWdpc3RlcnMgYXQKZXZlcnkgb3duZXJzaGlw
IGNoYW5nZS4gV2hlbiB3ZSBzd2l0Y2ggYmFjayB0byB0aGUgb3JpZ2luYWwgcHJvY2VzcwphbmQg
cmV0dXJuIHRvIHRoZSB1c2VyIHNwYWNlLCB0aGUgc2F2ZWQgc3RhbGUgY29udGVudCBpcyByZXN0
b3JlZCBiYWNrCnRvIHJlZ2lzdGVycy4gQXMgYSByZXN1bHQsIHRoZSB1c2VyIHNwYWNlIGNhbiBy
ZWFkIFZlY3RvciByZWdpc3RlcnMKZnJvbSBvdGhlciBjb250ZXh0cy4KClRoYW5rcywKQW5keQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
