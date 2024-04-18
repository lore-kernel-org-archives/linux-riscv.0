Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71723C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 13:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NPUb04U0bE0faBxdG7jUj+3embp0jP5NdctdvMISY1Q=; b=CAfoW3zDXDlsze
	4KrweT9Y0XpzZWybKgjWIs+K4lhkjJt5QWBFiYwGRffAefV9UkjqRYP6mIpC2RZKNMFN8P0oIWGwV
	JJ2HuDBqdQ04VY0vPvH5D/aMAuhBO25VrIwbGhd3LF0thgvd/bhT9e99osxWbp0V30NoHI9skLF44
	pySQH18O0BiTKojyHc2NlosjkCqMn2sSl76hmVc679M27+pdBXsh7pd9Jlz0PIv78o7aTYVihI3BG
	v1C179k8+O57JnC+uyNt1QOnONjqSfjEPTmcO1H8FpKQDJj80rw4vZIJ1t6VQDZTdMwxYETL2z7LP
	Zx8fvToFM4dlbjUXAr3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxRW0-00000002Juf-2pPH;
	Thu, 18 Apr 2024 13:09:24 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxRVv-00000002Jtj-1nrW
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 13:09:24 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-53fa455cd94so593662a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 06:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1713445757; x=1714050557; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7DOuhy0FvgdVscxhexEi9GDhNcDoFdv6wRWpKftVNE=;
        b=fvuNubzb9s5zt+AS4/hhpRBZRamzKYvJoKxpZ3f5l9vyLdiNCJQtW5ol2bOyv6AlpT
         o3cdlv3M7HbuSnbMNWbULdUhQ09fQDsb/sqBGh9m99Q9VtWdCYk2wHaUgVMch2NvgRci
         EG4IdjbFzEm4aeJRdRYONVz1VBZ6YRs1SiLlC3PnFw8Qrhq0GebAOU5xsDTa2+z4SIPt
         gyu6I2MxbAXhGE2y5JooXsHUlR1wvqgOiEooNQ11hMzCJESC2rEqwaSwlO3W3ekHqMkf
         JgrpENKR/u6YcJA4LGQkGgUH6NA25Lw0CIzfjEII5+v69KxD8VXh4qMqOHZTOjX2HL8x
         rQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713445757; x=1714050557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7DOuhy0FvgdVscxhexEi9GDhNcDoFdv6wRWpKftVNE=;
        b=sY+OGs7H0ct2DlggWxVCZSCzr/T1U/PLqiX7ElkwjzvnNdHOtscPuvuQnpJTzG9pXb
         aMolT8YzjdY3dXgsr6APrO7/dBAtqcRb8ivotk8F0zzh4JXCmavfkP3aM4/9WzmYI/Hf
         NyBK/+g6hb1/ry6cG1iXoxxiTBsElTojZG187b+RWsIJzXksNVIsZjI1f1wzFF9WxT5C
         ko+EEg7IXrPV/3KchGpumzECR4emwVAcXDbHg35zR+YMgp8O52enmLca7xrFgpXETdAh
         IINph6SQg+2c+17aWUFo+MQXR3DB6/BJz3VYEKueNvIXnjmn4zOpmMjWggg5D+vZWMym
         N8Zw==
X-Forwarded-Encrypted: i=1; AJvYcCUnROnb3svYKklNTbF1CorhOMFx1+lr3V0JIEm0MHMkQ2Np8y8h0+HxmoNwPnFyiWth+oZlcQ+/vogH0axtlzj3yKJVit6BT6KoUkmsl/17
X-Gm-Message-State: AOJu0YwR/Wg0Mvnb8J6KIXo5KICqsjGVnI7syKenCs6xdG39YJJwrZwz
	OlBrgW2pkN0BuyPbkyTukNV3T3e/gDPpHxuQ+rAFrAPFiHgH+MKAA+5mPhK0EhFJpZXaAnrov2B
	0uWNSIIxsYcaOIV7YGt+RnKeA3kVv1zjYEQvAJg==
X-Google-Smtp-Source: AGHT+IGvWMiggmbzELLI8cJWt85uuFMvS8w1Ajbr7CdDz7vIKCaJYhq4lRASe+ONnZ4awnQwlxjff2VW/aPJt29tYlU=
X-Received: by 2002:a17:90b:b14:b0:29d:dd93:5865 with SMTP id
 bf20-20020a17090b0b1400b0029ddd935865mr2258889pjb.46.1713445757422; Thu, 18
 Apr 2024 06:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240418114942.52770-1-luxu.kernel@bytedance.com>
 <CAEg0e7gDk6SFRh4oF0KsA7xZoMr7RuZXFWL8qD7rmM2cBDLwcg@mail.gmail.com>
 <CAPYmKFsQQPCd-34GArHfC-Sv8PCYHgmZxprK3WHKnJquQDoXiQ@mail.gmail.com> <CAEg0e7hpjAec=2k+PwJeb0WezmJCFdUD=HbCiGe7+RxKgPHgtg@mail.gmail.com>
In-Reply-To: <CAEg0e7hpjAec=2k+PwJeb0WezmJCFdUD=HbCiGe7+RxKgPHgtg@mail.gmail.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Thu, 18 Apr 2024 21:09:06 +0800
Message-ID: <CAPYmKFudqq6Yg=uaVjAubCMM5TBMj8dkC0mXz+6eq3vNizTt7A@mail.gmail.com>
Subject: Re: [External] Re: [RFC 0/2] riscv: Idle thread using Zawrs extension
To: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Cc: Andrew Jones <ajones@ventanamicro.com>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, andy.chiu@sifive.com, guoren@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	lihangjing@bytedance.com, dengliang.1214@bytedance.com, 
	xieyongji@bytedance.com, chaiwen.cc@bytedance.com, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_060919_505770_CA8368DD 
X-CRM114-Status: GOOD (  28.89  )
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

T24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgODo1NuKAr1BNIENocmlzdG9waCBNw7xsbG5lcgo8Y2hy
aXN0b3BoLm11ZWxsbmVyQHZydWxsLmV1PiB3cm90ZToKPgo+IE9uIFRodSwgQXByIDE4LCAyMDI0
IGF0IDI6NDTigK9QTSBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4g
Pgo+ID4gT24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgODoyNuKAr1BNIENocmlzdG9waCBNw7xsbG5l
cgo+ID4gPGNocmlzdG9waC5tdWVsbG5lckB2cnVsbC5ldT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9u
IFRodSwgQXByIDE4LCAyMDI0IGF0IDE6NTDigK9QTSBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0ZWRh
bmNlLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBUaGlzIHBhdGNoIHNlcmllcyBpbnRyb2R1
Y2VzIGEgbmV3IGltcGxlbWVudGF0aW9uIG9mIGlkbGUgdGhyZWFkIHVzaW5nCj4gPiA+ID4gWmF3
cnMgZXh0ZW5zaW9uLgo+ID4gPgo+ID4gPiBUaGlzIG92ZXJsYXBzIHdpdGggdGhlIGZvbGxvd2lu
ZyBzZXJpZXM6Cj4gPiA+ICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwMzE1MTM0
MDA5LjU4MDE2Ny03LWFqb25lc0B2ZW50YW5hbWljcm8uY29tLwo+ID4KPiA+IEhpIENocmlzdG9w
aC4KPiA+IFRoYW5rcyBmb3IgeW91ciByZXBseSEKPiA+IEFjdHVhbGx5IG91ciBwYXRjaCBzZXJp
ZXMgaXMgZGlmZmVyZW50IGZyb20gdGhpcy4gVGhlIHdvcmsgZnJvbSB5b3VyCj4gPiBsaW5rIGZv
Y3VzZXMgb24gcHJvdmlkaW5nIHN1cHBvcnQgZm9yIFphd3JzIGFuZCBpbXBsZW1lbnRpbmcgc3Bp
bmxvY2sKPiA+IHVzaW5nIGl0LCB3aGlsZSBvdXIgd29yayBmb2N1c2VzIG9uIGltcGxlbWVudGlu
ZyBpZGxlIHRocmVhZCB1c2luZwo+ID4gWmF3cnMgYW5kIGFjY2VsZXJhdGluZyBJUEkgdG8gaWRs
ZSBjcHUuIE9mIGNvdXJzZSwgdGhlIElTQSBaQVdSUwo+ID4gY29uZmlnIHBhcnQgY2FuIGJlIG1l
cmdlZC4gV2Ugd2lsbCByZWZpbmUgb3VyIGNvZGUgaW4gdGhlIG5leHQgdmVyc2lvbgo+ID4gdG8g
cmVkdWNlIGNvZGUgY29uZmxpY3RzLgo+Cj4gWWVzLCBJJ3ZlIHNlZW4gdGhhdCB0aGlzIHRhcmdl
dHMgYW5vdGhlciBvcHRpbWl6YXRpb24sIGJ1dCB0aGUgYmFzaWMKPiBaYXdycyBzdXBwb3J0Cj4g
d291bGQgYmUgaWRlbnRpY2FsIHRvIHRoZSBvdGhlciBwYXRjaHNldCAoZXZlbiBpZiBpdCBpcyBu
b3QpLgo+IEkgd291bGQgcHJvcG9zZSB0aGF0IHdlIHdvcmsgb24gYSBiYXNpYyBaYXdycyBzdXBw
b3J0IHBhdGNoc2V0IHRoYXQgaW50cm9kdWNlcwo+IHRoZSBLY29uZmlnLCBEVFMgYW5kIGh3cHJv
YmUgcGFydHMgKGEgc3Vic2V0IG9mIEFuZHJldydzIHBhdGNoc2V0KS4KPiBPbmNlIHRoaXMgaXMg
bWVyZ2VkLCBhbGwgb3RoZXIgb3B0aW1pemF0aW9ucyBjYW4gYmUgYnVpbHQgdXBvbiBpdAo+IChz
cGlubG9ja3MsIGlkbGUgdGhyZWFkLCBnbGliYyBDUFUgc3Bpbm5pbmcpLgo+IElmIHRoaXMgcHJv
cG9zYWwgaXMgZmluZSBmb3IgdGhlIG1haW50YWluZXJzL3Jldmlld2VycywgdGhlbiBBbmRyZXcg
Y291bGQgcmVzZW5kCj4gdGhlc2UgYmFzaWMtc3VwcG9ydCBwYXRjaGVzLgo+Cj4gQlIKPiBDaHJp
c3RvcGgKClJvZ2VyIHRoYXQhIFRoaXMgZG9lcyBtYWtlIG1vcmUgc2Vuc2UuIFdlIHdpbGwgcmVi
YXNlIG91ciBjb2RlIG9uCkFuZHJldydzIGJhc2ljIHN1cHBvcnQgcGF0Y2hlcyBpbiB0aGUgbmV4
dCB2ZXJzaW9uLgoKUmVnYXJkcywKWHUgTHUKCj4KPgo+ID4KPiA+ID4KPiA+ID4gQlIKPiA+ID4g
Q2hyaXN0b3BoCj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBUaGUgWmF3cnNbMF0gZXh0ZW5zaW9uIGlu
dHJvZHVjZXMgdHdvIG5ldyBpbnN0cnVjdGlvbnMgbmFtZWQgV1JTLlNUTyBhbmQKPiA+ID4gPiBX
UlMuTlRPIGluIFJJU0MtVi4gV2hlbiBzb2Z0d2FyZSByZWdpc3RlcnMgYSByZXNlcnZhdGlvbiBz
ZXQgdXNpbmcgTFIKPiA+ID4gPiBpbnN0cnVjdGlvbiwgYSBzdWJzZXF1ZW50IFdSUy5TVE8gb3Ig
V1JTLk5UTyBpbnN0cnVjdGlvbiB3aWxsIGNhdXNlIHRoZQo+ID4gPiA+IGhhcnQgdG8gc3RhbGwg
aW4gYSBsb3ctcG93ZXIgc3RhdGUgdW50aWwgYSBzdG9yZSBoYXBwZW5zIHRvIHRoZQo+ID4gPiA+
IHJlc2VydmF0aW9uIHNldCBvciBhbiBpbnRlcnJ1cHQgYmVjb21lcyBwZW5kaW5nLiBUaGUgZGlm
ZmVyZW5jZSBiZXR3ZWVuCj4gPiA+ID4gdGhlc2UgdHdvIGluc3RydWN0aW9ucyBpcyB0aGF0IFdS
Uy5TVE8gd2lsbCB0ZXJtaW5hdGUgc3RhbGwgYWZ0ZXIgYW4KPiA+ID4gPiBpbXBsZW1lbnRhdGlv
bi1kZWZpbmVkIHRpbWVvdXQgd2hpbGUgV1JTLk5UTyB3b24ndC4KPiA+ID4gPgo+ID4gPiA+IFRo
aXMgcGF0Y2ggc2VyaWVzIGltcGxlbWVudHMgaWRsZSB0aHJlYWQgdXNpbmcgV1JTLk5UTyBpbnN0
cnVjdGlvbi4KPiA+ID4gPiBCZXNpZGVzLCB3ZSBmb3VuZCB0aGVyZSBpcyBubyBuZWVkIHRvIHNl
bmQgYSByZWFsIElQSSB0byB3YWtlIHVwIGFuIGlkbGUKPiA+ID4gPiBDUFUuIEluc3RlYWQsIHdl
IHdyaXRlIElQSSBpbmZvcm1hdGlvbiB0byB0aGUgcmVzZXJ2YXRpb24gc2V0IG9mIGFuIGlkbGUK
PiA+ID4gPiBDUFUgdG8gd2FrZSBpdCB1cCBhbmQgbGV0IGl0IGhhbmRsZSBJUEkgcXVpY2tseSwg
d2l0aG91dCBnb2luZyB0aHJvdWdoCj4gPiA+ID4gdHJhbmRpdGlvbmFsIGludGVycnVwdCBoYW5k
bGluZyByb3V0aW5lLgo+ID4gPiA+Cj4gPiA+ID4gWzBdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNj
di9yaXNjdi16YXdycy9ibG9iL21haW4vemF3cnMuYWRvYwo+ID4gPiA+Cj4gPiA+ID4gWHUgTHUg
KDIpOgo+ID4gPiA+ICAgcmlzY3Y6IHByb2Nlc3M6IEludHJvZHVjZSBpZGxlIHRocmVhZCB1c2lu
ZyBaYXdycyBleHRlbnNpb24KPiA+ID4gPiAgIHJpc2N2OiBVc2UgWmF3cnMgdG8gYWNjZWxlcmF0
ZSBJUEkgdG8gaWRsZSBjcHUKPiA+ID4gPgo+ID4gPiA+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAg
ICAgICAgICAgICAgIHwgIDI0ICsrKysrKysKPiA+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9jcHVpZGxlLmggICB8ICAxMSArLS0tCj4gPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
aHdjYXAuaCAgICAgfCAgIDEgKwo+ID4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nl
c3Nvci5oIHwgIDMxICsrKysrKysrKwo+ID4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Nt
cC5oICAgICAgIHwgIDE0ICsrKysKPiA+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMgICAg
ICAgICAgICB8ICAgNSArKwo+ID4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMg
ICAgIHwgICAxICsKPiA+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jICAgICAgICB8
IDEwMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ID4gPiA+ICBhcmNoL3Jpc2N2L2tl
cm5lbC9zbXAuYyAgICAgICAgICAgIHwgIDM5ICsrKysrKystLS0tCj4gPiA+ID4gIDkgZmlsZXMg
Y2hhbmdlZCwgMjA1IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4gPiA+
ID4gLS0KPiA+ID4gPiAyLjIwLjEKPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gPiBsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKPiA+ID4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiA+
ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
