Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542B5C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 17:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UsbleEbR1yLDoo7u2iS6Gcl0ITjSNu8ECNrGbQc6bfk=; b=VCs/4OoH4mM1Qg
	zq2jKwzV2We/R8QFnVSIi3w5GEBtDePcZXQlFQv/bFYlQWfyxKDyQTGQWnfdG76aDnmYpjhK1W7s0
	0WrzW+mz5gfs47WcTeC0iuukmESu45WUL4QEhSUPTnNw6GHxCGJsonPAyCqRG46eW1dpX+afrXERu
	Vroaavyd9uqEXbFd5NaWQtiBJsauAS4NxKVwJVi8XIEeugeYK/TBPeB1xJCdP+3xtT+MeLHxiAYwB
	3R/e2iYGiaSljnnXMbqAFfQnXLEPnfcZzCYeW97EghQ9Z1PaA7SIRkK/+hXtq7VkYcL463zmkEM99
	yy1nsw8yXtL+WqDxMeXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNGIv-00935V-1i;
	Tue, 09 Jan 2024 17:54:21 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNGIr-00933M-0L
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jan 2024 17:54:20 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2ccabf5a4beso35997071fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jan 2024 09:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1704822853; x=1705427653; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CeM+hho/qwbP9Z55ZVvdC0wwc1f1sWXXK1EVcgFxsIo=;
        b=eHvO3cca0jZKi6lQZoi9HsStB/lh/6N1WG0jqp0Cc1JSZx9KPeFmIKCd5h0GuKRQDm
         ejveGKxHbeh78zyrbA8DD/wo8gNF0YdkvMFuzz/s2R0BstCm6r4ey15Tdm2jrRAGRsL+
         InxUA7G8J5jyvJy6N0Erbv7dYeRNEJPinwVzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704822853; x=1705427653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeM+hho/qwbP9Z55ZVvdC0wwc1f1sWXXK1EVcgFxsIo=;
        b=bSgOtGSnAKNgrFxdQ6gU+zM6bSV8RMcpkDn+W79sZbQDXHg6z9fAgbSyJ7tb3KEaR+
         RBsOMFWgpmumqTqbMc5cWg6RCPIH5tbYU/5NAFMMMS2Mdp/JDyz8S69xAK8kFNAyQrbX
         JcIjYFIPVuAO2IeSJDh49Su3upPTxn3STY3948hhaqvO86yqYqyB37/WG3J8aVlFQCKh
         m3OSX5r/obOKUrXJKB/wGDBMfhujLbIZkvT+B1Js7ocKPGHL+rb+yeGuGMpbsHnft+JG
         Qst2RSVaoAsphkz8y488mXiw35sg+V8qyIzPryk9dOFfYI8Q7vrcyqVtRWBWvm00ABEr
         icVQ==
X-Gm-Message-State: AOJu0YxNDWZHnkPXERRr9K6rI/VEAHLrQfdNaDtoLZjXVNOTWq9sP6yB
	c3KJW/AYa281Y/1n/VnjfHSUR/8F3xqmGq4rPmyZJdqUuIgg
X-Google-Smtp-Source: AGHT+IH3m0+wbSzkJ3HS0+ZxHNhvZU64C2KWl2ZLlE00HvrrjpKMtf0cf5i3Ja1KwC83KNs3w46QjXNSKdQtgEFskAs=
X-Received: by 2002:a05:651c:2208:b0:2cd:52fd:9bb with SMTP id
 y8-20020a05651c220800b002cd52fd09bbmr1112283ljq.30.1704822852166; Tue, 09 Jan
 2024 09:54:12 -0800 (PST)
MIME-Version: 1.0
References: <20240108-fencei-v5-0-aa1e51d7222f@rivosinc.com>
 <20240108-fencei-v5-2-aa1e51d7222f@rivosinc.com> <CAOnJCUJQ-M1bVC_VhogMLo47mRyk3Pzq-GFH5P7ADn70BN9ObA@mail.gmail.com>
 <ZZyth6Ijtsmy5D84@ghost> <CAOnJCUL60H16edo6icR-1bzTVk0Tdr+hRf3izharUEEvxCrwhA@mail.gmail.com>
In-Reply-To: <CAOnJCUL60H16edo6icR-1bzTVk0Tdr+hRf3izharUEEvxCrwhA@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 9 Jan 2024 09:54:00 -0800
Message-ID: <CAOnJCU+FonOS4N_WiHPij4ZWv=qAdHo4WY9_+kzLT738CqhM1w@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] documentation: Document PR_RISCV_SET_ICACHE_FLUSH_CTX
 prctl
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, 
	Conor Dooley <conor.dooley@microchip.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_095417_460713_FEEEDBF5 
X-CRM114-Status: GOOD (  33.43  )
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

T24gTW9uLCBKYW4gOCwgMjAyNCBhdCAxMTo1MeKAr1BNIEF0aXNoIFBhdHJhIDxhdGlzaHBAYXRp
c2hwYXRyYS5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBKYW4gOCwgMjAyNCBhdCA2OjIw4oCvUE0g
Q2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24g
TW9uLCBKYW4gMDgsIDIwMjQgYXQgMDU6MjQ6NDdQTSAtMDgwMCwgQXRpc2ggUGF0cmEgd3JvdGU6
Cj4gPiA+IE9uIE1vbiwgSmFuIDgsIDIwMjQgYXQgMTA6NDLigK9BTSBDaGFybGllIEplbmtpbnMg
PGNoYXJsaWVAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IFByb3ZpZGUgZG9j
dW1lbnRhdGlvbiB0aGF0IGV4cGxhaW5zIGhvdyB0byBwcm9wZXJseSBkbyBDTU9EWCBpbiByaXNj
di4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIERvY3VtZW50YXRpb24vYXJjaC9y
aXNjdi9jbW9keC5yc3QgfCA4OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kwo+ID4gPiA+ICBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaW5kZXgucnN0IHwgIDEgKwo+ID4g
PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDg5IGluc2VydGlvbnMoKykKPiA+ID4gPgo+ID4gPiA+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvY21vZHgucnN0IGIvRG9jdW1lbnRh
dGlvbi9hcmNoL3Jpc2N2L2Ntb2R4LnJzdAo+ID4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4g
PiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5hZmQ3MDg2YzIyMmMKPiA+ID4gPiAtLS0gL2Rldi9u
dWxsCj4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2Ntb2R4LnJzdAo+ID4g
PiA+IEBAIC0wLDAgKzEsODggQEAKPiA+ID4gPiArLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAKPiA+ID4gPiArCj4gPiA+ID4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4gPiA+
ICtDb25jdXJyZW50IE1vZGlmaWNhdGlvbiBhbmQgRXhlY3V0aW9uIG9mIEluc3RydWN0aW9ucyAo
Q01PRFgpIGZvciBSSVNDLVYgTGludXgKPiA+ID4gPiArPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4g
PiA+ID4gKwo+ID4gPiA+ICtDTU9EWCBpcyBhIHByb2dyYW1taW5nIHRlY2huaXF1ZSB3aGVyZSBh
IHByb2dyYW0gZXhlY3V0ZXMgaW5zdHJ1Y3Rpb25zIHRoYXQgd2VyZQo+ID4gPiA+ICttb2RpZmll
ZCBieSB0aGUgcHJvZ3JhbSBpdHNlbGYuIEluc3RydWN0aW9uIHN0b3JhZ2UgYW5kIHRoZSBpbnN0
cnVjdGlvbiBjYWNoZQo+ID4gPiA+ICsoaWNhY2hlKSBhcmUgbm90IGd1YXJhbnRlZWQgdG8gYmUg
c3luY2hyb25pemVkIG9uIFJJU0MtViBoYXJkd2FyZS4gVGhlcmVmb3JlLCB0aGUKPiA+ID4gPiAr
cHJvZ3JhbSBtdXN0IGVuZm9yY2UgaXRzIG93biBzeW5jaHJvbml6YXRpb24gd2l0aCB0aGUgdW5w
cml2aWxlZ2VkIGZlbmNlLmkKPiA+ID4gPiAraW5zdHJ1Y3Rpb24uCj4gPiA+ID4gKwo+ID4gPiA+
ICtIb3dldmVyLCB0aGUgZGVmYXVsdCBMaW51eCBBQkkgcHJvaGliaXRzIHRoZSB1c2Ugb2YgZmVu
Y2UuaSBpbiB1c2Vyc3BhY2UKPiA+ID4gPiArYXBwbGljYXRpb25zLiBBdCBhbnkgcG9pbnQgdGhl
IHNjaGVkdWxlciBtYXkgbWlncmF0ZSBhIHRhc2sgb250byBhIG5ldyBoYXJ0LiBJZgo+ID4gPiA+
ICttaWdyYXRpb24gb2NjdXJzIGFmdGVyIHRoZSB1c2Vyc3BhY2Ugc3luY2hyb25pemVkIHRoZSBp
Y2FjaGUgYW5kIGluc3RydWN0aW9uCj4gPiA+ID4gK3N0b3JhZ2Ugd2l0aCBmZW5jZS5pLCB0aGUg
aWNhY2hlIHdpbGwgbm8gbG9uZ2VyIGJlIGNsZWFuLiBUaGlzIGlzIGR1ZSB0byB0aGUKPiA+ID4g
PiArYmVoYXZpb3Igb2YgZmVuY2UuaSBvbmx5IGFmZmVjdGluZyB0aGUgaGFydCB0aGF0IGl0IGlz
IGNhbGxlZCBvbi4gVGh1cywgdGhlIGhhcnQKPiA+ID4gPiArdGhhdCB0aGUgdGFzayBoYXMgYmVl
biBtaWdyYXRlZCB0byBtYXkgbm90IGhhdmUgc3luY2hyb25pemVkIGluc3RydWN0aW9uIHN0b3Jh
Z2UKPiA+ID4gPiArYW5kIGljYWNoZS4KPiA+ID4gPiArCj4gPiA+ID4gK1RoZXJlIGFyZSB0d28g
d2F5cyB0byBzb2x2ZSB0aGlzIHByb2JsZW06IHVzZSB0aGUgcmlzY3ZfZmx1c2hfaWNhY2hlKCkg
c3lzY2FsbCwKPiA+ID4gPiArb3IgdXNlIHRoZSBgYFBSX1JJU0NWX1NFVF9JQ0FDSEVfRkxVU0hf
Q1RYYGAgcHJjdGwoKSBhbmQgZW1pdCBmZW5jZS5pIGluCj4gPiA+ID4gK3VzZXJzcGFjZS4gVGhl
IHN5c2NhbGwgcGVyZm9ybXMgYSBvbmUtb2ZmIGljYWNoZSBmbHVzaGluZyBvcGVyYXRpb24uIFRo
ZSBwcmN0bAo+ID4gPiA+ICtjaGFuZ2VzIHRoZSBMaW51eCBBQkkgdG8gYWxsb3cgdXNlcnNwYWNl
IHRvIGVtaXQgaWNhY2hlIGZsdXNoaW5nIG9wZXJhdGlvbnMuCj4gPiA+ID4gKwo+ID4gPiA+ICtw
cmN0bCgpIEludGVyZmFjZQo+ID4gPiA+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gPiAr
Cj4gPiA+ID4gK0NhbGwgcHJjdGwoKSB3aXRoIGBgUFJfUklTQ1ZfU0VUX0lDQUNIRV9GTFVTSF9D
VFhgYCBhcyB0aGUgZmlyc3QgYXJndW1lbnQuIFRoZQo+ID4gPiA+ICtyZW1haW5pbmcgYXJndW1l
bnRzIHdpbGwgYmUgZGVsZWdhdGVkIHRvIHRoZSByaXNjdl9zZXRfaWNhY2hlX2ZsdXNoX2N0eAo+
ID4gPiA+ICtmdW5jdGlvbiBkZXRhaWxlZCBiZWxvdy4KPiA+ID4gPiArCj4gPiA+ID4gKy4uIGtl
cm5lbC1kb2M6OiBhcmNoL3Jpc2N2L21tL2NhY2hlZmx1c2guYwo+ID4gPiA+ICsgICAgICAgOmlk
ZW50aWZpZXJzOiByaXNjdl9zZXRfaWNhY2hlX2ZsdXNoX2N0eAo+ID4gPiA+ICsKPiA+ID4KPiA+
ID4gRG9jdW1lbnQgdGhlIGFyZ3VtZW50cyBvZiB0aGUgcHJjdGwgYXMgd2VsbCA/Cj4gPgo+ID4g
RG8geW91IG1lYW4gdG8gaW5jbHVkZSB0aGUgYGBQUl9SSVNDVl9TRVRfSUNBQ0hFX0ZMVVNIX0NU
WGBgIGtleSBpbiB0aGUKPiA+IGNvbW1lbnQgb2YgcmlzY3Zfc2V0X2ljYWNoZV9mbHVzaF9jdHg/
IFRoZSBhcmdzIHRvCj4gPiByaXNjdl9zZXRfaWNhY2hlX2ZsdXNoX2N0eCBhcmUgdGhlIGFyZ3Mg
dG8gdGhlIHByY3RsIGV4Y2VwdCBmb3IgdGhlIGtleS4KPiA+Cj4KPiBObywgSSBtZWFuIGRlc2Ny
aWJlIHRoZSBhcmd1bWVudDIoY3R4KSBhbmQgYXJndW1lbnQzKHBlcl90aHJlYWQpIGFzIHdlbGwu
Cj4gU2luY2UgdGhpcyBpcyBhIGRvY3VtZW50YXRpb24gb2YgdGhlIG5ldyBwcmN0bCwgd2Ugc2hv
dWxkIGRvY3VtZW50IGFsbAo+IGFyZ3Mgc28gdGhhdCBhbiB1c2VyCj4gY2FuIHVzZSBpdCB3aXRo
b3V0IGdyZXBwaW5nIHRocm91Z2ggdGhlIGtlcm5lbCBzb3VyY2VzLgo+CgpOZXZlciBtaW5kLiBJ
IG1pc3NlZCB0aGUgaWRlbnRpZmllcnMgdGFnIGZvciBrZXJuZWwgZG9jLiBUaGFua3MgZm9yCnRo
ZSByZW1pbmRlci4KVGhlIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUuCgpSZXZpZXdlZC1ieTogQXRp
c2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cgo+ID4gLSBDaGFybGllCj4gPgo+ID4gPgo+
ID4gPiA+ICtFeGFtcGxlIHVzYWdlOgo+ID4gPiA+ICsKPiA+ID4gPiArVGhlIGZvbGxvd2luZyBm
aWxlcyBhcmUgbWVhbnQgdG8gYmUgY29tcGlsZWQgYW5kIGxpbmtlZCB3aXRoIGVhY2ggb3RoZXIu
IFRoZQo+ID4gPiA+ICttb2RpZnlfaW5zdHJ1Y3Rpb24oKSBmdW5jdGlvbiByZXBsYWNlcyBhbiBh
ZGQgd2l0aCAwIHdpdGggYW4gYWRkIHdpdGggb25lLAo+ID4gPiA+ICtjYXVzaW5nIHRoZSBpbnN0
cnVjdGlvbiBzZXF1ZW5jZSBpbiBnZXRfdmFsdWUoKSB0byBjaGFuZ2UgZnJvbSByZXR1cm5pbmcg
YSB6ZXJvCj4gPiA+ID4gK3RvIHJldHVybmluZyBhIG9uZS4KPiA+ID4gPiArCj4gPiA+ID4gK2Nt
b2R4LmM6Ogo+ID4gPiA+ICsKPiA+ID4gPiArICAgICAgICNpbmNsdWRlIDxzdGRpby5oPgo+ID4g
PiA+ICsgICAgICAgI2luY2x1ZGUgPHN5cy9wcmN0bC5oPgo+ID4gPiA+ICsKPiA+ID4gPiArICAg
ICAgIGV4dGVybiBpbnQgZ2V0X3ZhbHVlKCk7Cj4gPiA+ID4gKyAgICAgICBleHRlcm4gdm9pZCBt
b2RpZnlfaW5zdHJ1Y3Rpb24oKTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICBpbnQgbWFpbigp
Cj4gPiA+ID4gKyAgICAgICB7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIGludCB2YWx1ZSA9IGdl
dF92YWx1ZSgpOwo+ID4gPiA+ICsgICAgICAgICAgICAgICBwcmludGYoIlZhbHVlIGJlZm9yZSBj
bW9keDogJWRcbiIsIHZhbHVlKTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICAgICAgICAgIC8v
IENhbGwgcHJjdGwgYmVmb3JlIGZpcnN0IGZlbmNlLmkgaXMgY2FsbGVkIGluc2lkZSBtb2RpZnlf
aW5zdHJ1Y3Rpb24KPiA+ID4gPiArICAgICAgICAgICAgICAgcHJjdGwoUFJfUklTQ1ZfU0VUX0lD
QUNIRV9GTFVTSF9DVFhfT04sIFBSX1JJU0NWX0NUWF9TV19GRU5DRUksIDApOwo+ID4gPiA+ICsg
ICAgICAgICAgICAgICBtb2RpZnlfaW5zdHJ1Y3Rpb24oKTsKPiA+ID4gPiArCj4gPiA+ID4gKyAg
ICAgICAgICAgICAgIHZhbHVlID0gZ2V0X3ZhbHVlKCk7Cj4gPiA+ID4gKyAgICAgICAgICAgICAg
IHByaW50ZigiVmFsdWUgYWZ0ZXIgY21vZHg6ICVkXG4iLCB2YWx1ZSk7Cj4gPiA+ID4gKyAgICAg
ICAgICAgICAgIHJldHVybiAwOwo+ID4gPiA+ICsgICAgICAgfQo+ID4gPiA+ICsKPiA+ID4gPiAr
Y21vZHguUzo6Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgLm9wdGlvbiBub3J2Ywo+ID4gPiA+
ICsKPiA+ID4gPiArICAgICAgIC50ZXh0Cj4gPiA+ID4gKyAgICAgICAuZ2xvYmFsIG1vZGlmeV9p
bnN0cnVjdGlvbgo+ID4gPiA+ICsgICAgICAgbW9kaWZ5X2luc3RydWN0aW9uOgo+ID4gPiA+ICsg
ICAgICAgbHcgYTAsIG5ld19pbnNuCj4gPiA+ID4gKyAgICAgICBsdWkgYTUsJWhpKG9sZF9pbnNu
KQo+ID4gPiA+ICsgICAgICAgc3cgIGEwLCVsbyhvbGRfaW5zbikoYTUpCj4gPiA+ID4gKyAgICAg
ICBmZW5jZS5pCj4gPiA+ID4gKyAgICAgICByZXQKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICAu
c2VjdGlvbiBtb2RpZmlhYmxlLCAiYXd4Igo+ID4gPiA+ICsgICAgICAgLmdsb2JhbCBnZXRfdmFs
dWUKPiA+ID4gPiArICAgICAgIGdldF92YWx1ZToKPiA+ID4gPiArICAgICAgIGxpIGEwLCAwCj4g
PiA+ID4gKyAgICAgICBvbGRfaW5zbjoKPiA+ID4gPiArICAgICAgIGFkZGkgYTAsIGEwLCAwCj4g
PiA+ID4gKyAgICAgICByZXQKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICAuZGF0YQo+ID4gPiA+
ICsgICAgICAgbmV3X2luc246Cj4gPiA+ID4gKyAgICAgICBhZGRpIGEwLCBhMCwgMQo+ID4gPiA+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaW5kZXgucnN0IGIvRG9jdW1l
bnRhdGlvbi9hcmNoL3Jpc2N2L2luZGV4LnJzdAo+ID4gPiA+IGluZGV4IDRkYWIwY2I0YjkwMC4u
ZWVjZjM0N2NlODQ5IDEwMDY0NAo+ID4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNj
di9pbmRleC5yc3QKPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaW5kZXgu
cnN0Cj4gPiA+ID4gQEAgLTEzLDYgKzEzLDcgQEAgUklTQy1WIGFyY2hpdGVjdHVyZQo+ID4gPiA+
ICAgICAgcGF0Y2gtYWNjZXB0YW5jZQo+ID4gPiA+ICAgICAgdWFiaQo+ID4gPiA+ICAgICAgdmVj
dG9yCj4gPiA+ID4gKyAgICBjbW9keAo+ID4gPiA+Cj4gPiA+ID4gICAgICBmZWF0dXJlcwo+ID4g
PiA+Cj4gPiA+ID4KPiA+ID4gPiAtLQo+ID4gPiA+IDIuNDMuMAo+ID4gPiA+Cj4gPiA+Cj4gPiA+
Cj4gPiA+IC0tCj4gPiA+IFJlZ2FyZHMsCj4gPiA+IEF0aXNoCj4KPgo+Cj4gLS0KPiBSZWdhcmRz
LAo+IEF0aXNoCgoKCi0tIApSZWdhcmRzLApBdGlzaAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
