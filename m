Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBF8C5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 19:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=No5wzVrW4Rl8j2FDGbUvrFqCKrlxzmkJklDjsj28hbo=; b=Zcg3zyquOUnGvy
	zbj6nBnyuUAtBgZtk+AM2r6mybwDwKhack0zyqL90X7pOpHRq3Rgdz0VWY0DpSYo2PuAvetk3ZABU
	hYgIwIIHzei7/SlddGeHUVnShb9mkWQ+Vkvv6pDyV179LOhLSMaaMKYmzJXhBqB13LZAlQalD4TQC
	KQ4stZrJNDB5kgvx7TKlnO2Q1afjHJ6x5WJVXqhR5jfXQiIOFXIt4621a/kMmG4HlLdKRG0+heztB
	Ge4/6S6UgxdIgsOGlSxMjfktAuOWJ2dnOLlKvpXgvxelcu4Cm40akBF3VIoqrahcflUsZ/v5OIDD4
	I6TAbzPpXXQvXKy/ihuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf3O5-00000006fYn-00s1;
	Tue, 27 Feb 2024 19:45:13 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf3O1-00000006fYI-1aot
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 19:45:10 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-51197ca63f5so6997503e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 11:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709063107; x=1709667907; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzyPyl18HcItr2oh7QJ73KXzsNopBuzQaSIWsMutKKQ=;
        b=Zp4ByUS8XVhKEbOmS5kwU26pIYqUzEAL2ZHleDq6apn7RRY3m009zngUBT/7sRzFHc
         9zczRx+7sATexFlkqZUdH2mGEAaQI0FPAaNDVVcrGH8aRQT/ngDgJIe+nOQpqYTGxhpY
         S7OIdJRXAk2gLFGN0xWdU2ouh/H0x7BUmAAFmG91aD5tNP2va+kFm0Lm6D2YX8o/qKGU
         XCkIlwPaKfjdvvCkRbQmdQPjqJAg6yAFKwQXCKNuufmqYWbk5A8dmvYwOF7JZGsDZgMR
         Fv+Jx+tdi9S4X/1rnob4XPYzmJkqlCOrvi6/6OdVm1gqSz3KfhQpE6KuUdNj+WxkS/IF
         QEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709063107; x=1709667907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qzyPyl18HcItr2oh7QJ73KXzsNopBuzQaSIWsMutKKQ=;
        b=liWo7koHgkVJ0k7YdRewNPH8VNJ9z0+RrWfc6fYwOrNIJvqHpZ7f1Eyzq6hTAwKXq7
         1NkvjyrEIVGRK1Xio3wk9ZHIrlKWahoFJhJIF7dpMMGov2vOrJ536qFTRR+FvrFK+CoQ
         iavBjfDsWnzBfBmflCY/BWdPTXVRaDkg4AkRZZg0rSGclY/1aOHMYO5lvOiqbO8ALukz
         54ko+X+z8eFsmMjTeZqSYperuCZt6lwSIqD65Xf/vvIDzfaMY9blMwy8wzr2aIi2l+i4
         9aIedkf2TKlUPLVKze4k05X8Cl2EyMfQ8uSov99fQoPub7mNCydWGaSNwy5unTWrAIoN
         nQjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjm1y8RRgauz+PumkUq6gxrM+z2YAh0XjFD0fmu8Ume5NjhQESATeQauFNPAwSN0qAeOjdG8ONtE9nHrcktXED6JOnsYiaGBYMbuz89IOu
X-Gm-Message-State: AOJu0YwB/fRsecH0wiYJDXlgdF1rV9tyZYYezaeqa/e11U10PaPrNrBN
	9XJa6BrGb4XhCmQ1CJkUlyiJ1UpRSm8yeAKkNK5G9BlijLkwZo72h3B9+Y/w3jd5DhST/kxU0eY
	XtcjUoWHH8dGb71U/WccK1AnH3YIUyLYZpm1S+A==
X-Google-Smtp-Source: AGHT+IH92D/WyVxt0CyoZJb7+4/LBEXw9wuWt1w3xm370DIz8YGVmA3y1qQ7Mqz48tyPrHyjwzQ5UNpkidzVMgG+2ss=
X-Received: by 2002:ac2:4dab:0:b0:513:1652:585b with SMTP id
 h11-20020ac24dab000000b005131652585bmr808015lfe.63.1709063107167; Tue, 27 Feb
 2024 11:45:07 -0800 (PST)
MIME-Version: 1.0
References: <20240216-disable_misaligned_probe_config-v4-0-dc01e581c0ac@rivosinc.com>
 <20240216-disable_misaligned_probe_config-v4-2-dc01e581c0ac@rivosinc.com>
 <20240227-condone-impeach-9469dffc6b47@wendy> <Zd4nMa+x28omuhiF@ghost>
 <20240227-citable-scanning-1fd48c96b758@spud> <Zd414nBtjHcsYWnL@ghost>
In-Reply-To: <Zd414nBtjHcsYWnL@ghost>
From: Evan Green <evan@rivosinc.com>
Date: Tue, 27 Feb 2024 11:44:30 -0800
Message-ID: <CALs-HssaGBHrFdavM=VYm+z0vBWKSnoS2b0cAmjnXA_Kji1KdA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] riscv: Set unalignment speed at compile time
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, 
	Eric Biggers <ebiggers@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	linux-riscv@lists.infradead.org, Charles Lohr <lohr85@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_114509_447509_A4E36020 
X-CRM114-Status: GOOD (  31.50  )
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

T24gVHVlLCBGZWIgMjcsIDIwMjQgYXQgMTE6MjDigK9BTSBDaGFybGllIEplbmtpbnMgPGNoYXJs
aWVAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgRmViIDI3LCAyMDI0IGF0IDA2OjQ4
OjU0UE0gKzAwMDAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+IE9uIFR1ZSwgRmViIDI3LCAyMDI0
IGF0IDEwOjE3OjIxQU0gLTA4MDAsIENoYXJsaWUgSmVua2lucyB3cm90ZToKPiA+ID4gT24gVHVl
LCBGZWIgMjcsIDIwMjQgYXQgMTE6Mzk6MjVBTSArMDAwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+
ID4gPiA+IE9uIEZyaSwgRmViIDE2LCAyMDI0IGF0IDEyOjMzOjE5UE0gLTA4MDAsIENoYXJsaWUg
SmVua2lucyB3cm90ZToKPiA+Cj4gPiA+ID4gPiArY29uZmlnIFJJU0NWX0VNVUxBVEVEX1VOQUxJ
R05FRF9BQ0NFU1MKPiA+ID4gPiA+ICsgICAgICAgYm9vbCAiQXNzdW1lIHRoZSBDUFUgZXhwZWN0
cyBlbXVsYXRlZCB1bmFsaWduZWQgbWVtb3J5IGFjY2Vzc2VzIgo+ID4gPiA+ID4gKyAgICAgICBk
ZXBlbmRzIG9uIE5PTlBPUlRBQkxFCj4gPiA+ID4KPiA+ID4gPiBUaGlzIGlzIHBvcnRhYmxlIHRv
bywgcmlnaHQ/Cj4gPiA+Cj4gPiA+IEkgZ3Vlc3Mgc28/IEkgdGhpbmsgSSB3b3VsZCBwcmVmZXIg
dG8gaGF2ZSB0aGUgcHJvYmluZyBiZWluZyB0aGUgb25seQo+ID4gPiBwb3J0YWJsZSBvcHRpb24u
Cj4gPgo+ID4gSSBkdW5ubywgSSB0aGluayB0aGVyZSBjb3VsZCBiZSB2YWx1ZSB0byBzb21lb25l
IGluIGFsd2F5cyBlbXVsYXRpbmcKPiA+IHRoaXMgaW4gdGhlIGtlcm5lbCBhbmQgSSBkb24ndCB0
aGluayB0aGF0IHNob3VsZCByZWxlZ2F0ZSB0aGVtIHRvIHRoZQo+ID4gbmF1Z2h0eSBzdGVwLCBn
aXZlbiBpdCBjYW4gd29yayBldmVyeXdoZXJlLgo+Cj4gQWxyaWdodCwgSSB3aWxsIHJlbW92ZSB0
aGUgbm9ucG9ydGFibGUuCj4KPiA+Cj4gPgo+ID4gPiA+ID4gK2NvbmZpZyBSSVNDVl9TTE9XX1VO
QUxJR05FRF9BQ0NFU1MKPiA+ID4gPiA+ICsgICAgICAgYm9vbCAiQXNzdW1lIHRoZSBDUFUgc3Vw
cG9ydHMgc2xvdyB1bmFsaWduZWQgbWVtb3J5IGFjY2Vzc2VzIgo+ID4gPiA+ID4gKyAgICAgICBk
ZXBlbmRzIG9uIE5PTlBPUlRBQkxFCj4gPiA+ID4gPiArICAgICAgIGhlbHAKPiA+ID4gPiA+ICsg
ICAgICAgICBBc3N1bWUgdGhhdCB0aGUgQ1BVIHN1cHBvcnRzIHNsb3cgdW5hbGlnbmVkIG1lbW9y
eSBhY2Nlc3Nlcy4gV2hlbgo+ID4gPiA+ID4gKyAgICAgICAgIGVuYWJsZWQsIHRoaXMgb3B0aW9u
IGltcHJvdmVzIHRoZSBwZXJmb3JtYW5jZSBvZiB0aGUga2VybmVsIG9uIHN1Y2gKPiA+ID4gPiA+
ICsgICAgICAgICBDUFVzLgo+ID4gPiA+Cj4gPiA+ID4gRG9lcyBpdD8gQXJlIHlvdSBzdXJlIHRo
YXQgZ2VuZXJhdGluZyB1bmFsaWduZWQgYWNjZXNzZXMgb24gc3lzdGVtcwo+ID4gPiA+IHdoZXJl
IHRoZXkgYXJlIHNsb3cgaXMgYSBwZXJmb3JtYW5jZSBpbmNyZWFzZT8KPiA+ID4gPiBUaGF0IHNh
aWQsIEkgZG9uJ3QgcmVhbGx5IHNlZSB0aGlzIG9wdGlvbiBhY3R1YWxseSBkb2luZyBhbnl0aGlu
ZyBvdGhlcgo+ID4gPiA+IHRoYW4gc2V0dGluZyB0aGUgdmFsdWUgZm9yIGh3cHJvYmUsIHNvIEkg
ZG9uJ3QgYWN0dWFsbHkga25vdyB3aGF0IHRoZQo+ID4gPiA+IGVmZmVjdCBvZiB0aGlzIG9wdGlv
biBhY3R1YWxseSBpcyBvbiB0aGUga2VybmVsJ3MgcGVyZm9ybWFuY2UuCj4gPiA+ID4KPiA+ID4g
PiBHZW5lcmFsbHkgSSB3b3VsZCBsaWtlIHRvIHN1Z2dlc3QgYSBjaGFuZ2UgZnJvbSAiQ1BVIiB0
byAic3lzdGVtIiBoZXJlLAo+ID4gPiA+IHNpbmNlIHRoZSBzbG93IGNhc2VzIHRoYXQgZXhpc3Qg
YXJlIG1vc3RseSBiZWNhdXNlIHRoZSB1bmFsaWduZWQgYWNjZXNzCj4gPiA+ID4gaXMgYWN0dWFs
bHkgZW11bGF0ZWQgaW4gZmlybXdhcmUuCj4gPiA+Cj4gPiA+IEl0IHdvdWxkIGJlIGlkZWFsIGlm
ICJlbXVsYXRlZCIgd2FzIHVzZWQgZm9yIGFueSBjYXNlIG9mIGVtdWxhdGVkCj4gPiA+IGFjY2Vz
c2VzIChmaXJtd2FyZSBvciBpbiB0aGUga2VybmVsKS4gIERvaW5nIGVtdWxhdGVkIGFjY2Vzc2Vz
IHdpbGwgYmUKPiA+ID4gb3JkZXJzIG9mIG1hZ25pdHVkZSBzbG93ZXIgdGhhbiBhIHByb2Nlc3Nv
ciB0aGF0ICJzbG93bHkiIGhhbmRsZXMgdGhlCj4gPiA+IGFjY2Vzc2VzLgo+ID4gPgo+ID4gPiBT
byBldmVuIGlmIHRoZSBwcm9jZXNzb3IgcGVyZm9ybXMgYSAic2xvdyIgYWNjZXNzLCBpdCBjb3Vs
ZCBzdGlsbCBiZQo+ID4gPiBiZW5lZmljaWFsIGZvciB0aGUga2VybmVsIHRvIGRvIHRoZSBtaXNh
bGlnbmVkIGFjY2VzcyByYXRoZXIgdGhhbiBtYW51YWwKPiA+ID4gZG8gdGhlIGFsaWdubWVudC4K
PiA+Cj4gPiBSaWdodC4gQnV0LCBhdCBsZWFzdCBmcm9tIGEgcHJvYmluZyBwZXJzcGVjdGl2ZSwg
U0xPVyBpcyB3aGF0IGdldHMKPiA+IHNlbGVjdGVkIHdoZW4gZmlybXdhcmUgZW11bGF0ZXMgdGhl
IHVuYWxpZ25lZCBhY2Nlc3Mgc28gdG8gdXNlcnNwYWNlCj4gPiBzZWVpbmcgc2xvdyBtZWFucyB0
aGF0IHRoZSBwZXJmb3JtYW5jZSBjb3VsZCBiZSBob3JyaWZpY2FsbHkgYmFkOgo+ID4KPiA+IHwg
ICAgIHJ6Zml2ZToKPiA+IHwgICAgICAgICBjcHUwOiBSYXRpbyBvZiBieXRlIGFjY2VzcyB0aW1l
IHRvIHVuYWxpZ25lZCB3b3JkIGFjY2VzcyBpcwo+ID4gfCAxLjA1LCB1bmFsaWduZWQgYWNjZXNz
ZXMgYXJlIGZhc3QKPiA+IHwKPiA+IHwgICAgIGljaWNsZToKPiA+IHwKPiA+IHwgICAgICAgICBj
cHUxOiBSYXRpbyBvZiBieXRlIGFjY2VzcyB0aW1lIHRvIHVuYWxpZ25lZCB3b3JkIGFjY2VzcyBp
cwo+ID4gfCAwLjAwLCB1bmFsaWduZWQgYWNjZXNzZXMgYXJlIHNsb3cKPiA+IHwgICAgICAgICBj
cHUyOiBSYXRpbyBvZiBieXRlIGFjY2VzcyB0aW1lIHRvIHVuYWxpZ25lZCB3b3JkIGFjY2VzcyBp
cwo+ID4gfCAwLjAwLCB1bmFsaWduZWQgYWNjZXNzZXMgYXJlIHNsb3cKPiA+IHwgICAgICAgICBj
cHUzOiBSYXRpbyBvZiBieXRlIGFjY2VzcyB0aW1lIHRvIHVuYWxpZ25lZCB3b3JkIGFjY2VzcyBp
cwo+ID4gfCAwLjAwLCB1bmFsaWduZWQgYWNjZXNzZXMgYXJlIHNsb3cKPiA+IHwKPiA+IHwgICAg
ICAgICBjcHUwOiBSYXRpbyBvZiBieXRlIGFjY2VzcyB0aW1lIHRvIHVuYWxpZ25lZCB3b3JkIGFj
Y2VzcyBpcwo+ID4gfCAwLjAwLCB1bmFsaWduZWQgYWNjZXNzZXMgYXJlIHNsb3cKPiA+IHwKPiA+
IHwgICAgIGsyMTA6Cj4gPiB8Cj4gPiB8ICAgICAgICAgY3B1MTogUmF0aW8gb2YgYnl0ZSBhY2Nl
c3MgdGltZSB0byB1bmFsaWduZWQgd29yZCBhY2Nlc3MgaXMKPiA+IHwgMC4wMiwgdW5hbGlnbmVk
IGFjY2Vzc2VzIGFyZSBzbG93Cj4gPiB8ICAgICAgICAgY3B1MDogUmF0aW8gb2YgYnl0ZSBhY2Nl
c3MgdGltZSB0byB1bmFsaWduZWQgd29yZCBhY2Nlc3MgaXMKPiA+IHwgMC4wMiwgdW5hbGlnbmVk
IGFjY2Vzc2VzIGFyZSBzbG93Cj4gPiB8Cj4gPiB8ICAgICBzdGFybGlnaHQ6Cj4gPiB8Cj4gPiB8
ICAgICAgICAgY3B1MTogUmF0aW8gb2YgYnl0ZSBhY2Nlc3MgdGltZSB0byB1bmFsaWduZWQgd29y
ZCBhY2Nlc3MgaXMKPiA+IHwgMC4wMSwgdW5hbGlnbmVkIGFjY2Vzc2VzIGFyZSBzbG93Cj4gPiB8
ICAgICAgICAgY3B1MDogUmF0aW8gb2YgYnl0ZSBhY2Nlc3MgdGltZSB0byB1bmFsaWduZWQgd29y
ZCBhY2Nlc3MgaXMKPiA+IHwgMC4wMiwgdW5hbGlnbmVkIGFjY2Vzc2VzIGFyZSBzbG93Cj4gPiB8
Cj4gPiB8ICAgICB2ZXhyaXNjdi9vcmFuZ2VjcmFiOgo+ID4gfAo+ID4gfCAgICAgICAgIGNwdTA6
IFJhdGlvIG9mIGJ5dGUgYWNjZXNzIHRpbWUgdG8gdW5hbGlnbmVkIHdvcmQgYWNjZXNzIGlzCj4g
PiB8IDAuMDAsIHVuYWxpZ25lZCBhY2Nlc3NlcyBhcmUgc2xvdwo+ID4gIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC9DQU11SE1kVnRYR2pQOFZGTWl2LTdPTUZ6MVh2ZlUxY3o9Rnc0akwzZmNw
NHdPMWV0elFAbWFpbC5nbWFpbC5jb20vCj4KPiBJZiB0aGUgYWNjZXNzZXMgYXJlIGhvcnJpZmlj
YWxseSBzbG93IHRoZW4gbWF5YmUgdGhleSBzaG91bGQgYmUgZmxhZ2dlZAo+IGFzIGVtdWxhdGVk
IHJhdGhlciB0aGFuIHNsb3cgYnkgdGhlIHByb2JlLgoKWWVhaCwgSSB0aG91Z2h0IGFib3V0IHRo
YXQgdG9vLiBJIGRpZG4ndCBmZWVsIGxpa2UgSSBoYWQgZW5vdWdoIGluZm8KdG8gY29tZSB1cCB3
aXRoIHRoZSBkZWxpbmVhdGluZyBudW1iZXIgZm9yICJob3JyaWZpY2FsbHkgc2xvdyIuIFBsdXMK
Q2xlbWVudCBjYW1lIGluIHdpdGggYSBzZXJpZXMgdG8gZGV0ZWN0IHNwZWNpZmljYWxseSB0aGF0
IGFjY2Vzc2VzIGFyZQplbXVsYXRlZCAodGhvdWdoIGl0IHdpbGwgb25seSB3b3JrIG9uIGZ1dHVy
ZSBwbGF0Zm9ybXMgdGhhdCBjYW4KZGVsZWdhdGUgdGhlIHRyYXAgdG8gdGhlIGtlcm5lbCkuCgot
RXZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
