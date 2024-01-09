Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA68FC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 07:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wVQ9OZ08jvEcIrmh/hhAcRd3z+g0rW1PD6I+NRvRfE8=; b=nzPMTsZl0V02ky
	w/w/SA/S79EnzrGlPS1wxrel8uWqlqlzsDTWZCvKo4Smnlw36ujhFuXkOho5RyOZb6Le3Fdn3UUp0
	8QamXvQrd2yJRt/ogiwzzbVh0MbFuciaNFxkylljFUAe7NGkljBXp7J3Ga+TKtua1PHKYlcAK24kF
	w1zFVrindbAAk+Ay3PkgppXMAZBWBFL/5xiGF4ayOs/ZRsEP82fqVeWZiufxslOKHwBSdQHXALq4I
	veFuZ+991NmpIt9kq25dqTwOpxFOqDcmZm81VTb44ZmO9W2zbgnp1kTde0Ga6XTrk5jMSNH/usu6u
	bsAhvTbpQOiEAs9ZfUyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rN6uD-007DLj-1a;
	Tue, 09 Jan 2024 07:52:13 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rN6u9-007DKU-2s
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jan 2024 07:52:11 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2cc9fa5e8e1so30149101fa.3
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jan 2024 23:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1704786726; x=1705391526; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHMsXlWZWaGsrXYEDte+sg2DqzlgrW3ZmXNJD62Sg6A=;
        b=GP2wBQdzw7fY107XwYW2FggTJOGETzvQy61Ubg7+97DTwRtbdLbRv6yRpiA8zQDAYD
         Ah4T7RftAB16lVhEN1lxVmk5n14AHiuZxwx+Wr+FIQVDVskd2boMT5E+61+3igr8dcCn
         rHyOmP3ly5F5NvctZOZiCp5k4iTGLnTi+Fa1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704786726; x=1705391526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHMsXlWZWaGsrXYEDte+sg2DqzlgrW3ZmXNJD62Sg6A=;
        b=qiyYlvfbe0DJ52eY797wcByanebjBA3o2ydNFzIKb0AnJi6ITSJ17hk3qaAcv18/yN
         +ktJwAiZ7bitPU8pvKjpGCk+tGwIhPAqOsYp72CartKFe7fcDiou/9S2ohsQW8DrjlRI
         mYenGG2EgBP/VSqR9k07p8Fl9bcbT2muGqpnDgnDBuxDbxPtnd7IFV16fXuP5KKf95EA
         VCk4I5QXi17H5aeYhbtcRWxB/LsjNvv2KksAvr6inKubZaVVqfvISw7GZZjiONV3Q3zJ
         o1m6+YWpyvnCqyhZDoI8yRf5o7qJGz3oMhQbioElV/jxndO6NohMPgXdC9jS2m4YXFBB
         BKaQ==
X-Gm-Message-State: AOJu0YyMvZLeH+ASbScq5tFzoJNsBHN7S3v/CLRRkGSrgFSCgcEN6ut6
	AANPLps0ERAXRO/rxgVS5uxPGdjEu7MfaSBf0Q7+9vUFvXeg
X-Google-Smtp-Source: AGHT+IHuTXV8NIt4gJXv79KBRfV+UGFAihQ0TgFFGOGOxerlXPw9DAp+fttPBvgWz9Og/8JF+FtL8tu+tG90k/BMnMU=
X-Received: by 2002:a2e:8894:0:b0:2cc:ea0d:f6be with SMTP id
 k20-20020a2e8894000000b002ccea0df6bemr2000733lji.86.1704786725784; Mon, 08
 Jan 2024 23:52:05 -0800 (PST)
MIME-Version: 1.0
References: <20240108-fencei-v5-0-aa1e51d7222f@rivosinc.com>
 <20240108-fencei-v5-2-aa1e51d7222f@rivosinc.com> <CAOnJCUJQ-M1bVC_VhogMLo47mRyk3Pzq-GFH5P7ADn70BN9ObA@mail.gmail.com>
 <ZZyth6Ijtsmy5D84@ghost>
In-Reply-To: <ZZyth6Ijtsmy5D84@ghost>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 8 Jan 2024 23:51:54 -0800
Message-ID: <CAOnJCUL60H16edo6icR-1bzTVk0Tdr+hRf3izharUEEvxCrwhA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] documentation: Document PR_RISCV_SET_ICACHE_FLUSH_CTX
 prctl
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, 
	Conor Dooley <conor.dooley@microchip.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_235210_201301_05DD7354 
X-CRM114-Status: GOOD (  30.31  )
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

T24gTW9uLCBKYW4gOCwgMjAyNCBhdCA2OjIw4oCvUE0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGll
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEphbiAwOCwgMjAyNCBhdCAwNToyNDo0
N1BNIC0wODAwLCBBdGlzaCBQYXRyYSB3cm90ZToKPiA+IE9uIE1vbiwgSmFuIDgsIDIwMjQgYXQg
MTA6NDLigK9BTSBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPiB3cm90ZToK
PiA+ID4KPiA+ID4gUHJvdmlkZSBkb2N1bWVudGF0aW9uIHRoYXQgZXhwbGFpbnMgaG93IHRvIHBy
b3Blcmx5IGRvIENNT0RYIGluIHJpc2N2Lgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaGFy
bGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+ID4gPiAtLS0KPiA+ID4gIERvY3Vt
ZW50YXRpb24vYXJjaC9yaXNjdi9jbW9keC5yc3QgfCA4OCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ID4gPiAgRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2luZGV4LnJz
dCB8ICAxICsKPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgODkgaW5zZXJ0aW9ucygrKQo+ID4gPgo+
ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2Ntb2R4LnJzdCBiL0Rv
Y3VtZW50YXRpb24vYXJjaC9yaXNjdi9jbW9keC5yc3QKPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5hZmQ3MDg2YzIyMmMKPiA+ID4gLS0tIC9kZXYv
bnVsbAo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvY21vZHgucnN0Cj4gPiA+
IEBAIC0wLDAgKzEsODggQEAKPiA+ID4gKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wCj4gPiA+ICsKPiA+ID4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4gPiArQ29uY3VycmVu
dCBNb2RpZmljYXRpb24gYW5kIEV4ZWN1dGlvbiBvZiBJbnN0cnVjdGlvbnMgKENNT0RYKSBmb3Ig
UklTQy1WIExpbnV4Cj4gPiA+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiA+ID4gKwo+ID4gPiAr
Q01PRFggaXMgYSBwcm9ncmFtbWluZyB0ZWNobmlxdWUgd2hlcmUgYSBwcm9ncmFtIGV4ZWN1dGVz
IGluc3RydWN0aW9ucyB0aGF0IHdlcmUKPiA+ID4gK21vZGlmaWVkIGJ5IHRoZSBwcm9ncmFtIGl0
c2VsZi4gSW5zdHJ1Y3Rpb24gc3RvcmFnZSBhbmQgdGhlIGluc3RydWN0aW9uIGNhY2hlCj4gPiA+
ICsoaWNhY2hlKSBhcmUgbm90IGd1YXJhbnRlZWQgdG8gYmUgc3luY2hyb25pemVkIG9uIFJJU0Mt
ViBoYXJkd2FyZS4gVGhlcmVmb3JlLCB0aGUKPiA+ID4gK3Byb2dyYW0gbXVzdCBlbmZvcmNlIGl0
cyBvd24gc3luY2hyb25pemF0aW9uIHdpdGggdGhlIHVucHJpdmlsZWdlZCBmZW5jZS5pCj4gPiA+
ICtpbnN0cnVjdGlvbi4KPiA+ID4gKwo+ID4gPiArSG93ZXZlciwgdGhlIGRlZmF1bHQgTGludXgg
QUJJIHByb2hpYml0cyB0aGUgdXNlIG9mIGZlbmNlLmkgaW4gdXNlcnNwYWNlCj4gPiA+ICthcHBs
aWNhdGlvbnMuIEF0IGFueSBwb2ludCB0aGUgc2NoZWR1bGVyIG1heSBtaWdyYXRlIGEgdGFzayBv
bnRvIGEgbmV3IGhhcnQuIElmCj4gPiA+ICttaWdyYXRpb24gb2NjdXJzIGFmdGVyIHRoZSB1c2Vy
c3BhY2Ugc3luY2hyb25pemVkIHRoZSBpY2FjaGUgYW5kIGluc3RydWN0aW9uCj4gPiA+ICtzdG9y
YWdlIHdpdGggZmVuY2UuaSwgdGhlIGljYWNoZSB3aWxsIG5vIGxvbmdlciBiZSBjbGVhbi4gVGhp
cyBpcyBkdWUgdG8gdGhlCj4gPiA+ICtiZWhhdmlvciBvZiBmZW5jZS5pIG9ubHkgYWZmZWN0aW5n
IHRoZSBoYXJ0IHRoYXQgaXQgaXMgY2FsbGVkIG9uLiBUaHVzLCB0aGUgaGFydAo+ID4gPiArdGhh
dCB0aGUgdGFzayBoYXMgYmVlbiBtaWdyYXRlZCB0byBtYXkgbm90IGhhdmUgc3luY2hyb25pemVk
IGluc3RydWN0aW9uIHN0b3JhZ2UKPiA+ID4gK2FuZCBpY2FjaGUuCj4gPiA+ICsKPiA+ID4gK1Ro
ZXJlIGFyZSB0d28gd2F5cyB0byBzb2x2ZSB0aGlzIHByb2JsZW06IHVzZSB0aGUgcmlzY3ZfZmx1
c2hfaWNhY2hlKCkgc3lzY2FsbCwKPiA+ID4gK29yIHVzZSB0aGUgYGBQUl9SSVNDVl9TRVRfSUNB
Q0hFX0ZMVVNIX0NUWGBgIHByY3RsKCkgYW5kIGVtaXQgZmVuY2UuaSBpbgo+ID4gPiArdXNlcnNw
YWNlLiBUaGUgc3lzY2FsbCBwZXJmb3JtcyBhIG9uZS1vZmYgaWNhY2hlIGZsdXNoaW5nIG9wZXJh
dGlvbi4gVGhlIHByY3RsCj4gPiA+ICtjaGFuZ2VzIHRoZSBMaW51eCBBQkkgdG8gYWxsb3cgdXNl
cnNwYWNlIHRvIGVtaXQgaWNhY2hlIGZsdXNoaW5nIG9wZXJhdGlvbnMuCj4gPiA+ICsKPiA+ID4g
K3ByY3RsKCkgSW50ZXJmYWNlCj4gPiA+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gKwo+
ID4gPiArQ2FsbCBwcmN0bCgpIHdpdGggYGBQUl9SSVNDVl9TRVRfSUNBQ0hFX0ZMVVNIX0NUWGBg
IGFzIHRoZSBmaXJzdCBhcmd1bWVudC4gVGhlCj4gPiA+ICtyZW1haW5pbmcgYXJndW1lbnRzIHdp
bGwgYmUgZGVsZWdhdGVkIHRvIHRoZSByaXNjdl9zZXRfaWNhY2hlX2ZsdXNoX2N0eAo+ID4gPiAr
ZnVuY3Rpb24gZGV0YWlsZWQgYmVsb3cuCj4gPiA+ICsKPiA+ID4gKy4uIGtlcm5lbC1kb2M6OiBh
cmNoL3Jpc2N2L21tL2NhY2hlZmx1c2guYwo+ID4gPiArICAgICAgIDppZGVudGlmaWVyczogcmlz
Y3Zfc2V0X2ljYWNoZV9mbHVzaF9jdHgKPiA+ID4gKwo+ID4KPiA+IERvY3VtZW50IHRoZSBhcmd1
bWVudHMgb2YgdGhlIHByY3RsIGFzIHdlbGwgPwo+Cj4gRG8geW91IG1lYW4gdG8gaW5jbHVkZSB0
aGUgYGBQUl9SSVNDVl9TRVRfSUNBQ0hFX0ZMVVNIX0NUWGBgIGtleSBpbiB0aGUKPiBjb21tZW50
IG9mIHJpc2N2X3NldF9pY2FjaGVfZmx1c2hfY3R4PyBUaGUgYXJncyB0bwo+IHJpc2N2X3NldF9p
Y2FjaGVfZmx1c2hfY3R4IGFyZSB0aGUgYXJncyB0byB0aGUgcHJjdGwgZXhjZXB0IGZvciB0aGUg
a2V5Lgo+CgpObywgSSBtZWFuIGRlc2NyaWJlIHRoZSBhcmd1bWVudDIoY3R4KSBhbmQgYXJndW1l
bnQzKHBlcl90aHJlYWQpIGFzIHdlbGwuClNpbmNlIHRoaXMgaXMgYSBkb2N1bWVudGF0aW9uIG9m
IHRoZSBuZXcgcHJjdGwsIHdlIHNob3VsZCBkb2N1bWVudCBhbGwKYXJncyBzbyB0aGF0IGFuIHVz
ZXIKY2FuIHVzZSBpdCB3aXRob3V0IGdyZXBwaW5nIHRocm91Z2ggdGhlIGtlcm5lbCBzb3VyY2Vz
LgoKPiAtIENoYXJsaWUKPgo+ID4KPiA+ID4gK0V4YW1wbGUgdXNhZ2U6Cj4gPiA+ICsKPiA+ID4g
K1RoZSBmb2xsb3dpbmcgZmlsZXMgYXJlIG1lYW50IHRvIGJlIGNvbXBpbGVkIGFuZCBsaW5rZWQg
d2l0aCBlYWNoIG90aGVyLiBUaGUKPiA+ID4gK21vZGlmeV9pbnN0cnVjdGlvbigpIGZ1bmN0aW9u
IHJlcGxhY2VzIGFuIGFkZCB3aXRoIDAgd2l0aCBhbiBhZGQgd2l0aCBvbmUsCj4gPiA+ICtjYXVz
aW5nIHRoZSBpbnN0cnVjdGlvbiBzZXF1ZW5jZSBpbiBnZXRfdmFsdWUoKSB0byBjaGFuZ2UgZnJv
bSByZXR1cm5pbmcgYSB6ZXJvCj4gPiA+ICt0byByZXR1cm5pbmcgYSBvbmUuCj4gPiA+ICsKPiA+
ID4gK2Ntb2R4LmM6Ogo+ID4gPiArCj4gPiA+ICsgICAgICAgI2luY2x1ZGUgPHN0ZGlvLmg+Cj4g
PiA+ICsgICAgICAgI2luY2x1ZGUgPHN5cy9wcmN0bC5oPgo+ID4gPiArCj4gPiA+ICsgICAgICAg
ZXh0ZXJuIGludCBnZXRfdmFsdWUoKTsKPiA+ID4gKyAgICAgICBleHRlcm4gdm9pZCBtb2RpZnlf
aW5zdHJ1Y3Rpb24oKTsKPiA+ID4gKwo+ID4gPiArICAgICAgIGludCBtYWluKCkKPiA+ID4gKyAg
ICAgICB7Cj4gPiA+ICsgICAgICAgICAgICAgICBpbnQgdmFsdWUgPSBnZXRfdmFsdWUoKTsKPiA+
ID4gKyAgICAgICAgICAgICAgIHByaW50ZigiVmFsdWUgYmVmb3JlIGNtb2R4OiAlZFxuIiwgdmFs
dWUpOwo+ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgICAvLyBDYWxsIHByY3RsIGJlZm9yZSBm
aXJzdCBmZW5jZS5pIGlzIGNhbGxlZCBpbnNpZGUgbW9kaWZ5X2luc3RydWN0aW9uCj4gPiA+ICsg
ICAgICAgICAgICAgICBwcmN0bChQUl9SSVNDVl9TRVRfSUNBQ0hFX0ZMVVNIX0NUWF9PTiwgUFJf
UklTQ1ZfQ1RYX1NXX0ZFTkNFSSwgMCk7Cj4gPiA+ICsgICAgICAgICAgICAgICBtb2RpZnlfaW5z
dHJ1Y3Rpb24oKTsKPiA+ID4gKwo+ID4gPiArICAgICAgICAgICAgICAgdmFsdWUgPSBnZXRfdmFs
dWUoKTsKPiA+ID4gKyAgICAgICAgICAgICAgIHByaW50ZigiVmFsdWUgYWZ0ZXIgY21vZHg6ICVk
XG4iLCB2YWx1ZSk7Cj4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+ID4gKyAgICAg
ICB9Cj4gPiA+ICsKPiA+ID4gK2Ntb2R4LlM6Ogo+ID4gPiArCj4gPiA+ICsgICAgICAgLm9wdGlv
biBub3J2Ywo+ID4gPiArCj4gPiA+ICsgICAgICAgLnRleHQKPiA+ID4gKyAgICAgICAuZ2xvYmFs
IG1vZGlmeV9pbnN0cnVjdGlvbgo+ID4gPiArICAgICAgIG1vZGlmeV9pbnN0cnVjdGlvbjoKPiA+
ID4gKyAgICAgICBsdyBhMCwgbmV3X2luc24KPiA+ID4gKyAgICAgICBsdWkgYTUsJWhpKG9sZF9p
bnNuKQo+ID4gPiArICAgICAgIHN3ICBhMCwlbG8ob2xkX2luc24pKGE1KQo+ID4gPiArICAgICAg
IGZlbmNlLmkKPiA+ID4gKyAgICAgICByZXQKPiA+ID4gKwo+ID4gPiArICAgICAgIC5zZWN0aW9u
IG1vZGlmaWFibGUsICJhd3giCj4gPiA+ICsgICAgICAgLmdsb2JhbCBnZXRfdmFsdWUKPiA+ID4g
KyAgICAgICBnZXRfdmFsdWU6Cj4gPiA+ICsgICAgICAgbGkgYTAsIDAKPiA+ID4gKyAgICAgICBv
bGRfaW5zbjoKPiA+ID4gKyAgICAgICBhZGRpIGEwLCBhMCwgMAo+ID4gPiArICAgICAgIHJldAo+
ID4gPiArCj4gPiA+ICsgICAgICAgLmRhdGEKPiA+ID4gKyAgICAgICBuZXdfaW5zbjoKPiA+ID4g
KyAgICAgICBhZGRpIGEwLCBhMCwgMQo+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9h
cmNoL3Jpc2N2L2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9pbmRleC5yc3QK
PiA+ID4gaW5kZXggNGRhYjBjYjRiOTAwLi5lZWNmMzQ3Y2U4NDkgMTAwNjQ0Cj4gPiA+IC0tLSBh
L0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9pbmRleC5yc3QKPiA+ID4gKysrIGIvRG9jdW1lbnRh
dGlvbi9hcmNoL3Jpc2N2L2luZGV4LnJzdAo+ID4gPiBAQCAtMTMsNiArMTMsNyBAQCBSSVNDLVYg
YXJjaGl0ZWN0dXJlCj4gPiA+ICAgICAgcGF0Y2gtYWNjZXB0YW5jZQo+ID4gPiAgICAgIHVhYmkK
PiA+ID4gICAgICB2ZWN0b3IKPiA+ID4gKyAgICBjbW9keAo+ID4gPgo+ID4gPiAgICAgIGZlYXR1
cmVzCj4gPiA+Cj4gPiA+Cj4gPiA+IC0tCj4gPiA+IDIuNDMuMAo+ID4gPgo+ID4KPiA+Cj4gPiAt
LQo+ID4gUmVnYXJkcywKPiA+IEF0aXNoCgoKCi0tIApSZWdhcmRzLApBdGlzaAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
