Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EB2C072A2
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Nov 2023 13:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZhXpOcDE425wjAOs5Lf+M/fl2YAJjDkIYk+HIkb66SE=; b=KoMMHe4lWVDXTI
	nSBldBGeAs8YLuDrUxspxmHb3jevyFo0OhZWPAAqN0pBvXoxUBMMIDaaV2oSvSNvTqYVHl8QJ+MvT
	aqsgNcRIbJCoXrlixDYCosqNA3howgc9d4c3tiTXzz+eA5NlOUj2d5db5fR8msC4liuaV5QVgXRSr
	loO1ow2Xm6vXr/mXWgj7BMbZw85tKsB8nvctpP3vzCMID5s4RiYaiT6MseyEnWQpcY/KBlhG1jllN
	APjb4wERUDaEP31KMeMIyJOGitunTKdhNEOAjyHYuW06ca9vP/u0Ss9a/4oUUq+bcFT0viO5351Z1
	V8zjarG4+NEmYj+s1hbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3ydF-006cac-2i;
	Fri, 17 Nov 2023 13:11:37 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3ydD-006cZu-2e
	for linux-riscv@lists.infradead.org;
	Fri, 17 Nov 2023 13:11:37 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5bd306f86a8so1480481a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 Nov 2023 05:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1700226694; x=1700831494; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6E9rdo8qzUdOfFpLyb8P/NwaQhOJy8xXp5m1DZcVMbs=;
        b=bLphkpCstsBLpb5Fdho9HU0LwhrdtEw6xis6hZLeKNovvu6QiQL1s6J6BYyKOdxiqF
         CuSX+8wnfHyfLkotR9atjTydBtJH6uBCBIjeaNlylZdb9iAf+pkHjZJODIKwsxdPwXBG
         wWmUVHSrZLdJOz99s/7ew5RqjgrTaIA3bIsXBiZsmiQO6sgUO4f0cbf2UISGJyQSagFf
         ASUd5hAArVGD+2NlhadIi+9oCDhwn8B2ZWkkeimeDXmwdZFwebHxZFuo464g/9Vq7U+8
         fil9CZwKWoxt75MIMpownioW3+t7A64lPA13tefXoXayK1z8AJT4oyufOncNGeL9IS6m
         Qjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700226694; x=1700831494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6E9rdo8qzUdOfFpLyb8P/NwaQhOJy8xXp5m1DZcVMbs=;
        b=bJ5MJzn5ocCvagWhVnOItKKr6x+nsqYw1ueSTxlhd1h5t/Y7CeUtcbLhx/mlm+4qFQ
         VQ2L9bcMfyqFqrH44cfu3gEXPQtqAE6z9J0ky7ohfqhcNTi/PxiKMF4SnWbojMaJme/n
         qQvqWCAEKu+OnhnBwvaMkdF3h6+86v6aDDIfJdRhIIsq/DHpldR1L13weEFr5BNXRgto
         +tgyn2VmiR1V0hg8WWOsCHNZJnL7HNBF5n1o1ThNspZ6zovzt6r7bAkNDzg6mWg9+TK7
         WkNxxsLl3yyE36331x9z6nvg+WMjpOJ0fT6IyGop5dn772vGZedpk2q5oAu6dfLzcJUq
         QU4A==
X-Gm-Message-State: AOJu0YxXf3ioZEHVwcZ80NncFRja/3QOiEbU+G+cGGAH0vYyCIb7aA9a
	AZZRehFQCV2cHda5rOsiq8jVyCiyzsybjaGx5FS/bg==
X-Google-Smtp-Source: AGHT+IFgkLOaY0/DJgU/R9AI39sZ+6DPT8zwZKvyF4UaFzfmMFJIGvIF2iBAT0bJLBWK5QSv+GXZ5swJVYptGL1IhU4=
X-Received: by 2002:a17:90a:974a:b0:281:3a4a:2e61 with SMTP id
 i10-20020a17090a974a00b002813a4a2e61mr14672875pjw.14.1700226694377; Fri, 17
 Nov 2023 05:11:34 -0800 (PST)
MIME-Version: 1.0
References: <20231020072140.900967-1-apatel@ventanamicro.com>
 <20231020072140.900967-9-apatel@ventanamicro.com> <2023102153-retread-narrow-54ee@gregkh>
In-Reply-To: <2023102153-retread-narrow-54ee@gregkh>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Nov 2023 18:41:23 +0530
Message-ID: <CAAhSdy1T-Ca7V21SSW=UCByujv39te7wRYGm40ZqDQ-JxH6pbA@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] tty: Add SBI debug console support to HVC SBI driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_051135_861031_5CE6B4E3 
X-CRM114-Status: GOOD (  22.33  )
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

T24gU2F0LCBPY3QgMjEsIDIwMjMgYXQgMTA6MTbigK9QTSBHcmVnIEtyb2FoLUhhcnRtYW4KPGdy
ZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgT2N0IDIwLCAyMDIz
IGF0IDEyOjUxOjM5UE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBGcm9tOiBBdGlzaCBQ
YXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiA+Cj4gPiBSSVNDLVYgU0JJIHNwZWNpZmljYXRp
b24gc3VwcG9ydHMgYWR2YW5jZWQgZGVidWcgY29uc29sZQo+ID4gc3VwcG9ydCB2aWEgU0JJIERC
Q04gZXh0ZW5zaW9uLgo+ID4KPiA+IEV4dGVuZCB0aGUgSFZDIFNCSSBkcml2ZXIgdG8gc3VwcG9y
dCBpdC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5j
LmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8u
Y29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy90dHkvaHZjL0tjb25maWcgICAgICAgICB8ICAyICst
Cj4gPiAgZHJpdmVycy90dHkvaHZjL2h2Y19yaXNjdl9zYmkuYyB8IDgyICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNzYgaW5zZXJ0aW9ucygr
KSwgOCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvaHZjL0tj
b25maWcgYi9kcml2ZXJzL3R0eS9odmMvS2NvbmZpZwo+ID4gaW5kZXggNGY5MjY0ZDAwNWMwLi42
ZTA1YzVjN2JjYTEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3R0eS9odmMvS2NvbmZpZwo+ID4g
KysrIGIvZHJpdmVycy90dHkvaHZjL0tjb25maWcKPiA+IEBAIC0xMDgsNyArMTA4LDcgQEAgY29u
ZmlnIEhWQ19EQ0NfU0VSSUFMSVpFX1NNUAo+ID4KPiA+ICBjb25maWcgSFZDX1JJU0NWX1NCSQo+
ID4gICAgICAgYm9vbCAiUklTQy1WIFNCSSBjb25zb2xlIHN1cHBvcnQiCj4gPiAtICAgICBkZXBl
bmRzIG9uIFJJU0NWX1NCSV9WMDEKPiA+ICsgICAgIGRlcGVuZHMgb24gUklTQ1ZfU0JJCj4gPiAg
ICAgICBzZWxlY3QgSFZDX0RSSVZFUgo+ID4gICAgICAgaGVscAo+ID4gICAgICAgICBUaGlzIGVu
YWJsZXMgc3VwcG9ydCBmb3IgY29uc29sZSBvdXRwdXQgdmlhIFJJU0MtViBTQkkgY2FsbHMsIHdo
aWNoCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvaHZjL2h2Y19yaXNjdl9zYmkuYyBiL2Ry
aXZlcnMvdHR5L2h2Yy9odmNfcmlzY3Zfc2JpLmMKPiA+IGluZGV4IDMxZjUzZmE3N2U0YS4uNTZk
YTFhNGI1YWNhIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy90dHkvaHZjL2h2Y19yaXNjdl9zYmku
Ywo+ID4gKysrIGIvZHJpdmVycy90dHkvaHZjL2h2Y19yaXNjdl9zYmkuYwo+ID4gQEAgLTM5LDIx
ICszOSw4OSBAQCBzdGF0aWMgaW50IGh2Y19zYmlfdHR5X2dldCh1aW50MzJfdCB2dGVybW5vLCBj
aGFyICpidWYsIGludCBjb3VudCkKPiA+ICAgICAgIHJldHVybiBpOwo+ID4gIH0KPiA+Cj4gPiAt
c3RhdGljIGNvbnN0IHN0cnVjdCBodl9vcHMgaHZjX3NiaV9vcHMgPSB7Cj4gPiArc3RhdGljIGNv
bnN0IHN0cnVjdCBodl9vcHMgaHZjX3NiaV92MDFfb3BzID0gewo+ID4gICAgICAgLmdldF9jaGFy
cyA9IGh2Y19zYmlfdHR5X2dldCwKPiA+ICAgICAgIC5wdXRfY2hhcnMgPSBodmNfc2JpX3R0eV9w
dXQsCj4gPiAgfTsKPiA+Cj4gPiAtc3RhdGljIGludCBfX2luaXQgaHZjX3NiaV9pbml0KHZvaWQp
Cj4gPiArc3RhdGljIGludCBodmNfc2JpX2RiY25fdHR5X3B1dCh1aW50MzJfdCB2dGVybW5vLCBj
b25zdCBjaGFyICpidWYsIGludCBjb3VudCkKPiA+ICB7Cj4gPiAtICAgICByZXR1cm4gUFRSX0VS
Ul9PUl9aRVJPKGh2Y19hbGxvYygwLCAwLCAmaHZjX3NiaV9vcHMsIDE2KSk7Cj4gPiArICAgICBw
aHlzX2FkZHJfdCBwYTsKPiA+ICsgICAgIHN0cnVjdCBzYmlyZXQgcmV0Owo+ID4gKwo+ID4gKyAg
ICAgaWYgKGlzX3ZtYWxsb2NfYWRkcihidWYpKSB7Cj4gPiArICAgICAgICAgICAgIHBhID0gcGFn
ZV90b19waHlzKHZtYWxsb2NfdG9fcGFnZShidWYpKSArIG9mZnNldF9pbl9wYWdlKGJ1Zik7Cj4g
PiArICAgICAgICAgICAgIGlmIChQQUdFX1NJWkUgPCAob2Zmc2V0X2luX3BhZ2UoYnVmKSArIGNv
dW50KSkKPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb3VudCA9IFBBR0VfU0laRSAtIG9mZnNl
dF9pbl9wYWdlKGJ1Zik7Cj4gPiArICAgICB9IGVsc2Ugewo+ID4gKyAgICAgICAgICAgICBwYSA9
IF9fcGEoYnVmKTsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIGlmIChJU19FTkFCTEVEKENP
TkZJR18zMkJJVCkpCj4gPiArICAgICAgICAgICAgIHJldCA9IHNiaV9lY2FsbChTQklfRVhUX0RC
Q04sIFNCSV9FWFRfREJDTl9DT05TT0xFX1dSSVRFLAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY291bnQsIGxvd2VyXzMyX2JpdHMocGEpLCB1cHBlcl8zMl9iaXRzKHBhKSwKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAsIDAsIDApOwo+ID4gKyAgICAgZWxzZQo+
ID4gKyAgICAgICAgICAgICByZXQgPSBzYmlfZWNhbGwoU0JJX0VYVF9EQkNOLCBTQklfRVhUX0RC
Q05fQ09OU09MRV9XUklURSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvdW50
LCBwYSwgMCwgMCwgMCwgMCk7Cj4KPiBBZ2FpbiwgeW91IG5lZWQgYSBoZWxwZXIgZnVuY3Rpb24g
aGVyZSB0byBrZWVwIHlvdSBmcm9tIGhhdmluZyB0byBrZWVwCj4gdGhpcyBhbGwgaW4gc3luYy4K
ClN1cmUsIEkgd2lsbCB1cGRhdGUuCgo+Cj4gPiArICAgICBpZiAocmV0LmVycm9yKQo+ID4gKyAg
ICAgICAgICAgICByZXR1cm4gMDsKPiA+ICsKPiA+ICsgICAgIHJldHVybiBjb3VudDsKPiA+ICB9
Cj4gPiAtZGV2aWNlX2luaXRjYWxsKGh2Y19zYmlfaW5pdCk7Cj4gPgo+ID4gLXN0YXRpYyBpbnQg
X19pbml0IGh2Y19zYmlfY29uc29sZV9pbml0KHZvaWQpCj4gPiArc3RhdGljIGludCBodmNfc2Jp
X2RiY25fdHR5X2dldCh1aW50MzJfdCB2dGVybW5vLCBjaGFyICpidWYsIGludCBjb3VudCkKPiA+
ICB7Cj4gPiAtICAgICBodmNfaW5zdGFudGlhdGUoMCwgMCwgJmh2Y19zYmlfb3BzKTsKPiA+ICsg
ICAgIHBoeXNfYWRkcl90IHBhOwo+ID4gKyAgICAgc3RydWN0IHNiaXJldCByZXQ7Cj4gPiArCj4g
PiArICAgICBpZiAoaXNfdm1hbGxvY19hZGRyKGJ1ZikpIHsKPiA+ICsgICAgICAgICAgICAgcGEg
PSBwYWdlX3RvX3BoeXModm1hbGxvY190b19wYWdlKGJ1ZikpICsgb2Zmc2V0X2luX3BhZ2UoYnVm
KTsKPiA+ICsgICAgICAgICAgICAgaWYgKFBBR0VfU0laRSA8IChvZmZzZXRfaW5fcGFnZShidWYp
ICsgY291bnQpKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNvdW50ID0gUEFHRV9TSVpFIC0g
b2Zmc2V0X2luX3BhZ2UoYnVmKTsKPiA+ICsgICAgIH0gZWxzZSB7Cj4gPiArICAgICAgICAgICAg
IHBhID0gX19wYShidWYpOwo+ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAgICAgaWYgKElTX0VOQUJM
RUQoQ09ORklHXzMyQklUKSkKPiA+ICsgICAgICAgICAgICAgcmV0ID0gc2JpX2VjYWxsKFNCSV9F
WFRfREJDTiwgU0JJX0VYVF9EQkNOX0NPTlNPTEVfUkVBRCwKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvdW50LCBsb3dlcl8zMl9iaXRzKHBhKSwgdXBwZXJfMzJfYml0cyhwYSks
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwLCAwLCAwKTsKPiA+ICsgICAgIGVs
c2UKPiA+ICsgICAgICAgICAgICAgcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfREJDTiwgU0JJX0VY
VF9EQkNOX0NPTlNPTEVfUkVBRCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
dW50LCBwYSwgMCwgMCwgMCwgMCk7Cj4KPiBBbmQgaGVyZSB0b28uCgpPa2F5LgoKPgo+IHRoYW5r
cywKPgo+IGdyZWcgay1oCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
