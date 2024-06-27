Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDA3C2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 10:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ek++7flHwID7ecvksZjrfSkr4JuAaLUzNvWOHysFx78=; b=peCXL9Cvmp1YCo
	lxyZQ2GYvyMX51ArBWVk5kJ+0FuGNRT5eYCvU/CVTdYCKzk5lA3Jet8Fs3PAM7i9fpFYjaYT5YLOp
	u06PPaCWX1Y41MLcRJ853rTMV5OwqWDrvHv4bJrGF4BCzOrdsnvchp2P0lgWANdfdHndEvU2rsEc1
	TEvdjyXs0zBUbGunwzadkElOKs+HruNpvLGt5wGiKddVxeF72sdQsu1l+chmlBS6Q8C7vI7YSneP6
	mReq2GLMx9jLSQ4WTzPduiGnIAH29ggYHqqhQjY8pXZqB+KX0Uh+OFtoGo5OqVFSOH2v2jCm8UH9k
	4nLRxDJYI9Y63kBkzQOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmIF-00000009vPL-22bX;
	Thu, 27 Jun 2024 10:23:55 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmIB-00000009vOK-3Zus
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 10:23:54 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-48f463dbbd2so2004216137.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2024 03:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719483830; x=1720088630; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4tiTxCE/s+Dw1a6GkDoGE0tXaKfxvAhXGFctBcchYc=;
        b=R/He6x9twyq4zbkK/rBTTC+tpLqDkEQSIEHZ6xcqnSCR+V+ifL2Wqj+hNazHOFwl9B
         CYXGO4RyZ5ehD4v0N2+CIucI4LOYpQVbbS2W6LPIRheGLDmxGPA0Zak+VySVy+K/IWyE
         nFwmAOe74w1YEFao7MCnts7XkqF01FHxNIYJ+59IbhoqlMBh7PoIPmzZobl0iPM13OAx
         jI6BJcuTYIMbEbYZakJ4Z5uyQVDeg8x48yt8cm2ivZlEJHaMD6ACf7bOv10IRwjIAeSc
         2zHlnPx9J0/Uz9z1bPiV1J6FrwCvp8mlUAykcAr/G4vZaowpt8xzSBcti9pJnvZiOHZX
         zubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719483830; x=1720088630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4tiTxCE/s+Dw1a6GkDoGE0tXaKfxvAhXGFctBcchYc=;
        b=NO8na0b75lYskFaI6FZ7NZM56F9Aqrgi7NlYoLxvKxMf/+cOjmWYDohJnOgy8O7KYX
         Sf9Ayj6sxC9S5pjQXHfIfFy/V1ijb0ZSW3VIY+ZPUY174bPQWX9eJUkFK4F0zGGbpEao
         MdZ5zo6pr5qu43EedBUtR2Cgrz0WhOSM8bBGI9Bh/bfl17/GHuJaMFHsHn1/T3xkCMeW
         4ecjjd2IsksbtBO45C2DMoC0df0mM/tJmCE2YnFZRpq4j8EEC9aAumBm+jCAJLZO6gUx
         0nY+G7+POq/qX2L3ObU/df0GmIrgixy+g+UXC86QNtBYmGB7TmHpkP/RkuUbuh83W3t6
         8VSw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ0nwBlxYPxePMh9DsXWuOkP9r3UBGSiFrYb21PxfTbPchlE2u1qhkujemzhmpW+sEOyRGIpOPgs2AE3CAQE7nToP/P0jZNSbok38ix8pn
X-Gm-Message-State: AOJu0Yx4FfLM+/nHoAJHvW/fSbZCuX5+OaiHiMLV7lLXtPe67DeuMePY
	qY+SzDX9wK49bSe8ME5uzvmgKuZskeTj1qMmUCZuGrPRXc8XTPgPnTobw+PFEJNARG1lFOJA0CF
	SjXjdenArT5GYQ1AMiui068rsDv/9hytsrH7BAKGW/04O5d9pOeM8
X-Google-Smtp-Source: AGHT+IHDmkmKAFG735sI5VBOQUgWmEi6dVBx0++cMhpfNtbIPeMESeasdcYtz3re8mbbPiX2Bsw2pcJrJK82es+TJgI=
X-Received: by 2002:a05:6102:401:b0:48f:92db:8cc6 with SMTP id
 ada2fe7eead31-48f92dba4abmr553246137.1.1719483830137; Thu, 27 Jun 2024
 03:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230801141607.435192-1-CoelacanthusHex@gmail.com>
 <20240627071422.GA2626@altlinux.org> <9c102328-6bb3-46b6-bc2f-d011a284d5b0@gmail.com>
 <CA+FstbVf7TJx==WsY5fBoFrdeY8php5ETn8kMq5s6YScy-2O=A@mail.gmail.com> <20240627095258.GA2977@altlinux.org>
In-Reply-To: <20240627095258.GA2977@altlinux.org>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Date: Thu, 27 Jun 2024 12:23:39 +0200
Message-ID: <CA+FstbUhDy8tjvxZX9k6TOT9xn4CE57AXdjWOemZR19Y5xfsWQ@mail.gmail.com>
Subject: Re: [PATCH v5] riscv: entry: set a0 = -ENOSYS only when syscall != -1
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Celeste Liu <coelacanthushex@gmail.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Guo Ren <guoren@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andreas Schwab <schwab@suse.de>, David Laight <David.Laight@aculab.com>, 
	Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>, 
	Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, "Ivan A. Melnikov" <iv@altlinux.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_032352_150900_15C1A637 
X-CRM114-Status: GOOD (  34.16  )
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

T24gVGh1LCBKdW4gMjcsIDIwMjQgYXQgMTE6NTLigK9BTSBEbWl0cnkgVi4gTGV2aW4gPGxkdkBz
dHJhY2UuaW8+IHdyb3RlOgo+Cj4gT24gVGh1LCBKdW4gMjcsIDIwMjQgYXQgMTE6NDM6MDNBTSAr
MDIwMCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiA+IE9uIFRodSwgSnVuIDI3LCAyMDI0IGF0IDk6
NDfigK9BTSBDZWxlc3RlIExpdSA8Y29lbGFjYW50aHVzaGV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4g
PiA+IE9uIDIwMjQtMDYtMjcgMTU6MTQsIERtaXRyeSBWLiBMZXZpbiB3cm90ZToKPiA+ID4KPiA+
ID4gPiBIaSwKPiA+ID4gPgo+ID4gPiA+IE9uIFR1ZSwgQXVnIDAxLCAyMDIzIGF0IDEwOjE1OjE2
UE0gKzA4MDAsIENlbGVzdGUgTGl1IHdyb3RlOgo+ID4gPiA+PiBXaGVuIHdlIHRlc3Qgc2VjY29t
cCB3aXRoIDYuNCBrZXJuZWwsIHdlIGZvdW5kIGVycm5vIGhhcyB3cm9uZyB2YWx1ZS4KPiA+ID4g
Pj4gSWYgd2UgZGVueSBORVRMSU5LX0FVRElUIHdpdGggRUFGTk9TVVBQT1JULCBhZnRlciBmMGJk
ZGY1MDU4NmQsIHdlIHdpbGwKPiA+ID4gPj4gZ2V0IEVOT1NZUyBpbnN0ZWFkLiBXZSBnb3Qgc2Ft
ZSByZXN1bHQgd2l0aCBjb21taXQgOWMyNTk4ZDQzNTEwICgicmlzY3Y6Cj4gPiA+ID4+IGVudHJ5
OiBTYXZlIGEwIHByaW9yIHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUoKSIpLgo+ID4gPiA+
Pgo+ID4gPiA+PiBBZnRlciBhbmFseXNpbmcgY29kZSwgd2UgdGhpbmsgdGhhdCByZWdzLT5hMCA9
IC1FTk9TWVMgc2hvdWxkIG9ubHkgYmUKPiA+ID4gPj4gZXhlY3V0ZWQgd2hlbiBzeXNjYWxsICE9
IC0xLiBJbiBfX3NlY2NvbXBfZmlsdGVyLCB3aGVuIHNlY2NvbXAgcmVqZWN0ZWQKPiA+ID4gPj4g
dGhpcyBzeXNjYWxsIHdpdGggc3BlY2lmaWVkIGVycm5vLCB0aGV5IHdpbGwgc2V0IGEwIHRvIHJl
dHVybiBudW1iZXIgYXMKPiA+ID4gPj4gc3lzY2FsbCBBQkksIGFuZCB0aGVuIHJldHVybiAtMS4g
VGhpcyByZXR1cm4gbnVtYmVyIGlzIGZpbmFsbHkgcGFzcyBhcwo+ID4gPiA+PiByZXR1cm4gbnVt
YmVyIG9mIHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUsIGFuZCB0aGVuIGlzIGNvbXBhcmVk
IHdpdGgKPiA+ID4gPj4gTlJfc3lzY2FsbHMgYWZ0ZXIgY29udmVydGVkIHRvIHVsb25nIChzbyBp
dCB3aWxsIGJlIFVMT05HX01BWCkuIFRoZQo+ID4gPiA+PiBjb25kaXRpb24gc3lzY2FsbCA8IE5S
X3N5c2NhbGxzIHdpbGwgYWx3YXlzIGJlIGZhbHNlLCBzbyByZWdzLT5hMCA9IC1FTk9TWVMKPiA+
ID4gPj4gaXMgYWx3YXlzIGV4ZWN1dGVkLiBJdCBjb3ZlcmVkIGEwIHNldCBieSBzZWNjb21wLCBz
byB3ZSBhbHdheXMgZ2V0Cj4gPiA+ID4+IEVOT1NZUyB3aGVuIG1hdGNoIHNlY2NvbXAgUkVUX0VS
Uk5PIHJ1bGUuCj4gPiA+ID4+Cj4gPiA+ID4+IEZpeGVzOiBmMGJkZGY1MDU4NmQgKCJyaXNjdjog
ZW50cnk6IENvbnZlcnQgdG8gZ2VuZXJpYyBlbnRyeSIpCj4gPiA+ID4+IFJlcG9ydGVkLWJ5OiBG
ZWxpeCBZYW4gPGZlbGl4b25tYXJzQGFyY2hsaW51eC5vcmc+Cj4gPiA+ID4+IENvLWRldmVsb3Bl
ZC1ieTogUnVpemhlIFBhbiA8YzE0MTAyOEBnbWFpbC5jb20+Cj4gPiA+ID4+IFNpZ25lZC1vZmYt
Ynk6IFJ1aXpoZSBQYW4gPGMxNDEwMjhAZ21haWwuY29tPgo+ID4gPiA+PiBDby1kZXZlbG9wZWQt
Ynk6IFNoaXFpIFpoYW5nIDxzaGlxaUBpc3JjLmlzY2FzLmFjLmNuPgo+ID4gPiA+PiBTaWduZWQt
b2ZmLWJ5OiBTaGlxaSBaaGFuZyA8c2hpcWlAaXNyYy5pc2Nhcy5hYy5jbj4KPiA+ID4gPj4gU2ln
bmVkLW9mZi1ieTogQ2VsZXN0ZSBMaXUgPENvZWxhY2FudGh1c0hleEBnbWFpbC5jb20+Cj4gPiA+
ID4+IFRlc3RlZC1ieTogRmVsaXggWWFuIDxmZWxpeG9ubWFyc0BhcmNobGludXgub3JnPgo+ID4g
PiA+PiBUZXN0ZWQtYnk6IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxlbWlsLnJlbm5lci5iZXJ0aGlu
Z0BjYW5vbmljYWwuY29tPgo+ID4gPiA+PiBSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympv
cm5Acml2b3NpbmMuY29tPgo+ID4gPiA+PiBSZXZpZXdlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtl
cm5lbC5vcmc+Cj4gPiA+ID4+IC0tLQo+ID4gPiA+Pgo+ID4gPiA+PiB2NCAtPiB2NTogYWRkIFRl
c3RlZC1ieSBFbWlsIFJlbm5lciBCZXJ0aGluZyA8ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25p
Y2FsLmNvbT4KPiA+ID4gPj4gdjMgLT4gdjQ6IHVzZSBsb25nIGluc3RlYWQgb2YgdWxvbmcgdG8g
cmVkdWNlIHR5cGUgY2FzdCBhbmQgYXZvaWQKPiA+ID4gPj4gICAgICAgICAgIGltcGxlbWVudGF0
aW9uLWRlZmluZWQgYmVoYXZpb3IsIGFuZCBtYWtlIHRoZSBqdWRnbWVudCBvZiBzeXNjYWxsCj4g
PiA+ID4+ICAgICAgICAgICBpbnZhbGlkIG1vcmUgZXhwbGljaXQKPiA+ID4gPj4gdjIgLT4gdjM6
IHVzZSBpZi1zdGF0ZW1lbnQgaW5zdGVhZCBvZiBzZXQgZGVmYXVsdCB2YWx1ZSwKPiA+ID4gPj4g
ICAgICAgICAgIGNsYXJpZnkgdGhlIHR5cGUgb2Ygc3lzY2FsbAo+ID4gPiA+PiB2MSAtPiB2Mjog
YWRkZWQgZXhwbGFuYXRpb24gb24gd2h5IGFsd2F5cyBnb3QgRU5PU1lTCj4gPiA+ID4+Cj4gPiA+
ID4+ICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIHwgNiArKystLS0KPiA+ID4gPj4gIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPiA+ID4+Cj4gPiA+
ID4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHMuYwo+ID4gPiA+PiBpbmRleCBmOTEwZGZjY2JmNWQyLi43MjlmNzljOTdlMmJm
IDEwMDY0NAo+ID4gPiA+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gPiA+ID4+
ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiA+ID4gPj4gQEAgLTI5Nyw3ICsyOTcs
NyBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfYnJl
YWsoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiA+ID4+ICBhc21saW5rYWdlIF9fdmlzaWJsZSBf
X3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfZWNhbGxfdShzdHJ1Y3QgcHRfcmVncyAqcmVncykK
PiA+ID4gPj4gIHsKPiA+ID4gPj4gICAgICBpZiAodXNlcl9tb2RlKHJlZ3MpKSB7Cj4gPiA+ID4+
IC0gICAgICAgICAgICB1bG9uZyBzeXNjYWxsID0gcmVncy0+YTc7Cj4gPiA+ID4+ICsgICAgICAg
ICAgICBsb25nIHN5c2NhbGwgPSByZWdzLT5hNzsKPiA+ID4gPj4KPiA+ID4gPj4gICAgICAgICAg
ICAgIHJlZ3MtPmVwYyArPSA0Owo+ID4gPiA+PiAgICAgICAgICAgICAgcmVncy0+b3JpZ19hMCA9
IHJlZ3MtPmEwOwo+ID4gPiA+PiBAQCAtMzA2LDkgKzMwNiw5IEBAIGFzbWxpbmthZ2UgX192aXNp
YmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9lY2FsbF91KHN0cnVjdCBwdF9yZWdzICpy
ZWdzKQo+ID4gPiA+Pgo+ID4gPiA+PiAgICAgICAgICAgICAgc3lzY2FsbCA9IHN5c2NhbGxfZW50
ZXJfZnJvbV91c2VyX21vZGUocmVncywgc3lzY2FsbCk7Cj4gPiA+ID4+Cj4gPiA+ID4+IC0gICAg
ICAgICAgICBpZiAoc3lzY2FsbCA8IE5SX3N5c2NhbGxzKQo+ID4gPiA+PiArICAgICAgICAgICAg
aWYgKHN5c2NhbGwgPj0gMCAmJiBzeXNjYWxsIDwgTlJfc3lzY2FsbHMpCj4gPiA+ID4+ICAgICAg
ICAgICAgICAgICAgICAgIHN5c2NhbGxfaGFuZGxlcihyZWdzLCBzeXNjYWxsKTsKPiA+ID4gPj4g
LSAgICAgICAgICAgIGVsc2UKPiA+ID4gPj4gKyAgICAgICAgICAgIGVsc2UgaWYgKHN5c2NhbGwg
IT0gLTEpCj4gPiA+ID4+ICAgICAgICAgICAgICAgICAgICAgIHJlZ3MtPmEwID0gLUVOT1NZUzsK
PiA+ID4gPj4KPiA+ID4gPj4gICAgICAgICAgICAgIHN5c2NhbGxfZXhpdF90b191c2VyX21vZGUo
cmVncyk7Cj4gPiA+ID4KPiA+ID4gPiBVbmZvcnR1bmF0ZWx5LCB0aGlzIGNoYW5nZSBpbnRyb2R1
Y2VkIGEgcmVncmVzc2lvbjogaXQgYnJva2Ugc3RyYWNlCj4gPiA+ID4gc3lzY2FsbCB0YW1wZXJp
bmcgb24gcmlzY3YuICBXaGVuIHRoZSB0cmFjZXIgY2hhbmdlcyBzeXNjYWxsIG51bWJlciB0byAt
MSwKPiA+ID4gPiB0aGUga2VybmVsIGZhaWxzIHRvIGluaXRpYWxpemUgYTAgd2l0aCAtRU5PU1lT
IGFuZCBzdWJzZXF1ZW50bHkgZmFpbHMgdG8KPiA+ID4gPiByZXR1cm4gdGhlIGVycm9yIGNvZGUg
b2YgdGhlIGZhaWxlZCBzeXNjYWxsIHRvIHVzZXJzcGFjZS4KPiA+ID4KPiA+ID4gSW4gdGhlIHBh
dGNoIHYyLCB3ZSBhY3R1YWxseSBkbyB0aGUgcmlnaHQgdGhpbmcuIEJ1dCBhcyBCasO2cm4gVMO2
cGVsJ3MKPiA+ID4gc3VnZ2VzdGlvbiBhbmQgd2UgZm91bmQgY2FzdCBsb25nIHRvIHVsb25nIGlz
IGltcGxlbWVudGF0aW9uLWRlZmluZWQKPiA+ID4gYmVoYXZpb3IgaW4gQywgc28gd2UgY2hhbmdl
IGl0IHRvIGN1cnJlbnQgZm9ybS4gU28gcmV2ZXJ0IHRoaXMgcGF0Y2ggYW5kCj4gPiA+IGFwcGx5
IHBhdGNoIHYyIHNob3VsZCBmaXggdGhpcyBpc3N1ZS4gUGF0Y2ggdjIgdXNlcyB0aHMgc2FtZSB3
YXkgd2l0aAo+ID4gPiBvdGhlciBhcmNoaXRlY3R1cmVzLgo+ID4gPgo+ID4gPiBbMV06IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDcxODE2Mjk0MC4yMjYxMTgtMS1Db2VsYWNhbnRo
dXNIZXhAZ21haWwuY29tLwo+ID4KPiA+IE5vdCByZXZlcnRpbmcsIGJ1dCBhIGZpeCB0byBtYWtl
IHN1cmUgdGhhdCBhMCBpcyBpbml0aWFsaXplZCB0byAtRU5PU1lTLCBlLmcuOgo+ID4KPiA+IC0t
ODwtLQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC90cmFwcy5jCj4gPiBpbmRleCAwNWExNmIxZjBhZWUuLjUxZWJmZDIzZTAwNyAx
MDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiA+ICsrKyBiL2FyY2gv
cmlzY3Yva2VybmVsL3RyYXBzLmMKPiA+IEBAIC0zMTksNiArMzE5LDcgQEAgdm9pZCBkb190cmFw
X2VjYWxsX3Uoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPgo+ID4gICByZWdzLT5lcGMgKz0gNDsK
PiA+ICAgcmVncy0+b3JpZ19hMCA9IHJlZ3MtPmEwOwo+ID4gKyByZWdzLT5hMCA9IC1FTk9TWVM7
Cj4KPiBHaXZlbiB0aGF0IHN0cnVjdCB1c2VyX3JlZ3Nfc3RydWN0IGRvZXNuJ3QgaGF2ZSBvcmln
X2EwLCB3b3VsZG4ndCB0aGlzCj4gY2xvYmJlciBhMCB0b28gZWFybHkgc28gdGhhdCB0aGUgdHJh
Y2VyIHdpbGwgZ2V0IC1FTk9TWVMgaW4gcGxhY2Ugb2YgdGhlCj4gZmlyc3Qgc3lzY2FsbCBhcmd1
bWVudD8KCk5vLCB0aGF0J3Mgb2suIEl0J3MgaGFuZGxlZCBieSB2YXJpb3VzIHdyYXBwZXJzIHdo
ZXJlIHRoZSBhcmd1bWVudHMKYXJlIHB1bGxlZCBvdXQuCgoKQmrDtnJuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
