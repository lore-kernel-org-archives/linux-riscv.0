Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3071ECDB47E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 15:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iIXybDvISIl40kkC0obOC/3mdtQftFyFVgmHAj9rxxo=; b=UBoUzR0G3uIkh+
	eZuQrmtzpH8zZpfh8J5oFy8Bo/DXCd54GnWijCZgE+QNBP58k9GZeWrxo3pf79pRUXWgcV8E15VLo
	H8o5cRpcZU3MY3JCV72/HKBDd8tZTVm9nRnfiSNYdJRi7FVhGj3OC+t8pfl+jWJtkKXhpOXD+H6Uz
	a7yhDBqsmrawu60dxx4me22gb+atllh7Skx0N7GI4QsxMlBkcwXmRZQtPyVEModQ95Tr0A2H/VsLm
	kcAGICZoEdjYIm4inVciJW8PCEg8DfoGJ2t0uIayNdMiTQ92EoOzSrGfxEN2iSjDfljkYHHOsJ5j5
	hSGFOPv5sTi9BRM2fbPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrKIm-003hqs-11;
	Fri, 13 Oct 2023 15:42:12 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrKIj-003ho7-2L
	for linux-riscv@lists.infradead.org;
	Fri, 13 Oct 2023 15:42:11 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6c644a1845cso1409331a34.2
        for <linux-riscv@lists.infradead.org>; Fri, 13 Oct 2023 08:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697211718; x=1697816518; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58F4pC3mBDu8F+pvcYNIm1FByUJEAPva6M9hCs3f/vs=;
        b=P0zhyEv+fSOlOmDjcKHxHCTPnyzChJhhm6iPC3WmQHZ5sSAb9qujjXg1i4XZRWVBKa
         YJbpM9nLC685iUoRfNqtOlnNHx+xDf0VNYnkK/z5cCAFhXrzwpGxdhPBqTWHFKWVcL9z
         cLERtzUWguylrQ2ZaPIamfN6kkLGQH/t8LyWE9Nx90FwEm09V3XXAszqt57Gi1ZQnA9u
         KGzfZm1FVeLQma9xkLcl5zcTNLaCdOIrdwqOiq5ki/j+pnpcmAb4LzO7fF6mMVcj+uHE
         fvooHxOXDoxpZWjVdeM3b42aPMOu9e9X91PIyoUJCTCUfLXlfVBRsNIZRnJ2SzL9OLpI
         Rxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697211718; x=1697816518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58F4pC3mBDu8F+pvcYNIm1FByUJEAPva6M9hCs3f/vs=;
        b=P5tXwOZbS48a9FanxhSWYGAx5rgG8KEv5gv6r2sAL0ejp3sdSi4T/SsFWC7XA98yuQ
         GIaBtHxXc20QFMfpBFA8rPHnItzE2u225u9djLol1WaOAUluyJlZPCA+q+lRP3bwDwtr
         Ew6Oe7j51LSh/z/hoXfnEVMmya13EIR42hQR/koT6i42C4mDWAC9364rOyABWp4wIE/y
         7UUAtk+rRv5in/B7ACcL3WiAvpH/lAI4Hgw2k+oWBhEbJsHWtHRFGVmXy4iAxO61r9t6
         pATLMZxut5G+pyefNzvbQVcnuhKFoGzJoBoa6Cb65oaWAbVv6vSWJZP/W5iJW0WEHxJx
         Xx7g==
X-Gm-Message-State: AOJu0YzdREa6Ibs+QVivgbRmQvZtY/IQtqxR1VGX5imqF5UKNMzU4OuJ
	8jC03RDltEG6USelvTGzkv5uyLcPte7xDGkLEWU/pg==
X-Google-Smtp-Source: AGHT+IEzcIYsSKMe5bsbRMbzf4xh1PED9ixUfbd1o7ixVah0VHZj9arKWffuv9/jPa1nkBsBkAGklSaRf41sshg9uSY=
X-Received: by 2002:a05:6870:6587:b0:1e9:b7a7:8efe with SMTP id
 fp7-20020a056870658700b001e9b7a78efemr5211668oab.2.1697211718067; Fri, 13 Oct
 2023 08:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231012051509.738750-1-apatel@ventanamicro.com>
 <20231012051509.738750-8-apatel@ventanamicro.com> <87fs2ghxyz.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87fs2ghxyz.fsf@all.your.base.are.belong.to.us>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 13 Oct 2023 21:11:46 +0530
Message-ID: <CAK9=C2XFTULtQ6YoNHDb7WJwm8p3wkG_pJA8h+XYGEOzt18Ctg@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] tty: Add SBI debug console support to HVC SBI driver
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_084209_762089_79117534 
X-CRM114-Status: GOOD (  22.36  )
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

T24gVGh1LCBPY3QgMTIsIDIwMjMgYXQgNTowOOKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+
IHdyaXRlczoKPgo+ID4gRnJvbTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4g
Pgo+ID4gUklTQy1WIFNCSSBzcGVjaWZpY2F0aW9uIHN1cHBvcnRzIGFkdmFuY2VkIGRlYnVnIGNv
bnNvbGUKPiA+IHN1cHBvcnQgdmlhIFNCSSBEQkNOIGV4dGVuc2lvbi4KPiA+Cj4gPiBFeHRlbmQg
dGhlIEhWQyBTQkkgZHJpdmVyIHRvIHN1cHBvcnQgaXQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
QXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVw
IFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvdHR5
L2h2Yy9LY29uZmlnICAgICAgICAgfCAgMiArLQo+ID4gIGRyaXZlcnMvdHR5L2h2Yy9odmNfcmlz
Y3Zfc2JpLmMgfCA3NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KPiA+ICAyIGZp
bGVzIGNoYW5nZWQsIDcwIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdHR5L2h2Yy9LY29uZmlnIGIvZHJpdmVycy90dHkvaHZjL0tjb25m
aWcKPiA+IGluZGV4IDRmOTI2NGQwMDVjMC4uNmUwNWM1YzdiY2ExIDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy90dHkvaHZjL0tjb25maWcKPiA+ICsrKyBiL2RyaXZlcnMvdHR5L2h2Yy9LY29uZmln
Cj4gPiBAQCAtMTA4LDcgKzEwOCw3IEBAIGNvbmZpZyBIVkNfRENDX1NFUklBTElaRV9TTVAKPiA+
Cj4gPiAgY29uZmlnIEhWQ19SSVNDVl9TQkkKPiA+ICAgICAgIGJvb2wgIlJJU0MtViBTQkkgY29u
c29sZSBzdXBwb3J0Igo+ID4gLSAgICAgZGVwZW5kcyBvbiBSSVNDVl9TQklfVjAxCj4gPiArICAg
ICBkZXBlbmRzIG9uIFJJU0NWX1NCSQo+ID4gICAgICAgc2VsZWN0IEhWQ19EUklWRVIKPiA+ICAg
ICAgIGhlbHAKPiA+ICAgICAgICAgVGhpcyBlbmFibGVzIHN1cHBvcnQgZm9yIGNvbnNvbGUgb3V0
cHV0IHZpYSBSSVNDLVYgU0JJIGNhbGxzLCB3aGljaAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dHR5L2h2Yy9odmNfcmlzY3Zfc2JpLmMgYi9kcml2ZXJzL3R0eS9odmMvaHZjX3Jpc2N2X3NiaS5j
Cj4gPiBpbmRleCAzMWY1M2ZhNzdlNGEuLmRhMzE4ZDdmNTVjNSAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvdHR5L2h2Yy9odmNfcmlzY3Zfc2JpLmMKPiA+ICsrKyBiL2RyaXZlcnMvdHR5L2h2Yy9o
dmNfcmlzY3Zfc2JpLmMKPiA+IEBAIC0zOSwyMSArMzksODMgQEAgc3RhdGljIGludCBodmNfc2Jp
X3R0eV9nZXQodWludDMyX3QgdnRlcm1ubywgY2hhciAqYnVmLCBpbnQgY291bnQpCj4gPiAgICAg
ICByZXR1cm4gaTsKPiA+ICB9Cj4gPgo+ID4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgaHZfb3BzIGh2
Y19zYmlfb3BzID0gewo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaHZfb3BzIGh2Y19zYmlfdjAx
X29wcyA9IHsKPiA+ICAgICAgIC5nZXRfY2hhcnMgPSBodmNfc2JpX3R0eV9nZXQsCj4gPiAgICAg
ICAucHV0X2NoYXJzID0gaHZjX3NiaV90dHlfcHV0LAo+ID4gIH07Cj4gPgo+ID4gLXN0YXRpYyBp
bnQgX19pbml0IGh2Y19zYmlfaW5pdCh2b2lkKQo+ID4gK3N0YXRpYyBpbnQgaHZjX3NiaV9kYmNu
X3R0eV9wdXQodWludDMyX3QgdnRlcm1ubywgY29uc3QgY2hhciAqYnVmLCBpbnQgY291bnQpCj4g
PiAgewo+ID4gLSAgICAgcmV0dXJuIFBUUl9FUlJfT1JfWkVSTyhodmNfYWxsb2MoMCwgMCwgJmh2
Y19zYmlfb3BzLCAxNikpOwo+ID4gKyAgICAgcGh5c19hZGRyX3QgcGE7Cj4gPiArICAgICBzdHJ1
Y3Qgc2JpcmV0IHJldDsKPiA+ICsKPiA+ICsgICAgIGlmIChpc192bWFsbG9jX2FkZHIoYnVmKSkK
PiA+ICsgICAgICAgICAgICAgcGEgPSBwYWdlX3RvX3BoeXModm1hbGxvY190b19wYWdlKGJ1Zikp
ICsgb2Zmc2V0X2luX3BhZ2UoYnVmKTsKPgo+IFdoYXQgaXMgYXNzdW1lZCBmcm9tIGJ1ZiBoZXJl
PyBJZiBidWYgaXMgY3Jvc3NpbmcgYSBwYWdlLCB5b3UgbmVlZCB0bwo+IGFkanVzdCB0aGUgY291
bnQsIG5vPwoKSSBuZXZlciBzYXcgYSBwYWdlIGNyb3NzaW5nIGJ1ZmZlciBidXQgSSB3aWxsIGNl
cnRhaW5seSBhZGRyZXNzIHRoaXMKaW4gdGhlIG5leHQgcmV2aXNpb24uCgo+Cj4gPiArICAgICBl
bHNlCj4gPiArICAgICAgICAgICAgIHBhID0gX19wYShidWYpOwo+ID4gKwo+ID4gKyAgICAgaWYg
KElTX0VOQUJMRUQoQ09ORklHXzMyQklUKSkKPiA+ICsgICAgICAgICAgICAgcmV0ID0gc2JpX2Vj
YWxsKFNCSV9FWFRfREJDTiwgU0JJX0VYVF9EQkNOX0NPTlNPTEVfV1JJVEUsCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb3VudCwgbG93ZXJfMzJfYml0cyhwYSksIHVwcGVyXzMy
X2JpdHMocGEpLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMCwgMCwgMCk7Cj4g
PiArICAgICBlbHNlCj4gPiArICAgICAgICAgICAgIHJldCA9IHNiaV9lY2FsbChTQklfRVhUX0RC
Q04sIFNCSV9FWFRfREJDTl9DT05TT0xFX1dSSVRFLAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY291bnQsIHBhLCAwLCAwLCAwLCAwKTsKPiA+ICsgICAgIGlmIChyZXQuZXJyb3Ip
Cj4gPiArICAgICAgICAgICAgIHJldHVybiAwOwo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIGNvdW50
Owo+ID4gIH0KPiA+IC1kZXZpY2VfaW5pdGNhbGwoaHZjX3NiaV9pbml0KTsKPiA+Cj4gPiAtc3Rh
dGljIGludCBfX2luaXQgaHZjX3NiaV9jb25zb2xlX2luaXQodm9pZCkKPiA+ICtzdGF0aWMgaW50
IGh2Y19zYmlfZGJjbl90dHlfZ2V0KHVpbnQzMl90IHZ0ZXJtbm8sIGNoYXIgKmJ1ZiwgaW50IGNv
dW50KQo+ID4gIHsKPiA+IC0gICAgIGh2Y19pbnN0YW50aWF0ZSgwLCAwLCAmaHZjX3NiaV9vcHMp
Owo+ID4gKyAgICAgcGh5c19hZGRyX3QgcGE7Cj4gPiArICAgICBzdHJ1Y3Qgc2JpcmV0IHJldDsK
PiA+ICsKPiA+ICsgICAgIGlmIChpc192bWFsbG9jX2FkZHIoYnVmKSkKPiA+ICsgICAgICAgICAg
ICAgcGEgPSBwYWdlX3RvX3BoeXModm1hbGxvY190b19wYWdlKGJ1ZikpICsgb2Zmc2V0X2luX3Bh
Z2UoYnVmKTsKPgo+IEFuZCBkZWZpbml0ZWx5IGFkanVzdCBjb3VudCBoZXJlLCBpZiB3ZSdyZSBj
cm9zc2luZyBhIHBhZ2UhCgpTdXJlLCBJIHdpbGwgdXBkYXRlIGhlcmUgYXMgd2VsbC4KClRoYW5r
cywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
