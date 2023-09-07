Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7768CEE14D3
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 03:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uQzxmnEY6ddQXh2zHi5vRLZuaFQhxlz++UgSx8gQxWg=; b=2kLU0YEu6LgLiK
	ofKMByZLnh4XR2oCTCVveUWqZEyAC1ZqJ6RfeKBw8XCy/iwrjeI/pmTQIfY1AT86UUNxDaNqinwh8
	hd2UW/P3u8FCKV6Etn563Jp5UbrWyXrSquvZFu+7Q29OdYRCw2G7fDRBIJ9S/uWTAR1c8y/YUzqLP
	UgRkvvNP+4+ZPvTkvlmzXdzw+cq1sggxnouk8ofFBqCAcdDrzFpuhDehNsOFgWAxMr2utxjmwqIlU
	cOE1x49cl1JUwOZLy04iRoyE1sFaL8fWCYPNBd0dVIFj9R0cbVgWqhCW+S2Ijs/Z143V+N8oL9y+F
	9C8cjcqb4kTbM0s1p99Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qe68u-00BGwt-1B;
	Thu, 07 Sep 2023 03:57:20 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qe68r-00BGwO-0p;
	Thu, 07 Sep 2023 03:57:18 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2bd0d19a304so9304141fa.1;
        Wed, 06 Sep 2023 20:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694059032; x=1694663832; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3UQs6noN/LuXhMaxtbcJru+m5+v+IlSKIcqynK+aM9Y=;
        b=G6f7wXHYqVug+7l5SP9UpPxXlldeLycNCmcZ0BstiNgg7/On4d/+owwbQQUZLasdSm
         1sGw+wIV1VIRitQaYgEIHzTZrrpA1H51w8R7cbZFa5fktSUkvo5QiDWsHgZQOleV0Pcq
         Imjoylr3IUu48Q71f+MpTUZGqNb4kRKr86aw5mimu8Cb2VH/BKlCQVkGG5L8EYaGwZP7
         onOcFxXMo6OzEcAy3offP87fUtw9mT/WSHY5n3W1OKBCc8Qskxp7dAEBD9DpwH21p7Dp
         nwcIR3KAXbxoUUB5Hrsbymtdm8YiwhSU1lJQNRbdgsu0ZXLrT0xl4yW/WKr2Ui//hbS6
         5DcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694059032; x=1694663832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3UQs6noN/LuXhMaxtbcJru+m5+v+IlSKIcqynK+aM9Y=;
        b=dEDuEsKoB5sNV8NuDScTTm4vWwGyErtprPXbbyQbn0I50vBglqNQLnShmY85exliXU
         l3QFjBPlTxG6ykpnu8A4KPQ2AzgJZJzUzLZAbbItlX8E1FZI5kMitN87wZwTR25nKSOO
         qmR+j9fPJPWAmxcZKAFw2vSTESh2DBVY9Jwcq75YqRpHHvyh9yYrfzGzZVdHiPBCccHd
         j1sTS9jr/t1bBOoFBOPKgFKbPCg5MafsL4hpVdlpfBQxm6Xvb1iA+tGa5AMebL41hnHR
         7dpEjL7cyskslW59jI4FCHsQM2kyW5fm+uJsDV+ERGoOs60/DAzL+xFc5esANE5hdXIo
         rP2Q==
X-Gm-Message-State: AOJu0YzZ/Si20cSnjtrpqg25SMyF4HAfBwrHbTTCImfqOeT7JuDAPu1z
	OIvwQn9TZ8ES7sktg2XPs04EeS4Z5DWWQ79UzBE=
X-Google-Smtp-Source: AGHT+IGI6qgIYSsAicMI6I+r6ioP3/2vp5QnhFlwnPmei3QJDcCP4J/D9Z4FZEYYhTF0QZ1jr8qCxHSm6ZraniakZgA=
X-Received: by 2002:a2e:9c10:0:b0:2bc:b70d:9cb5 with SMTP id
 s16-20020a2e9c10000000b002bcb70d9cb5mr3530939lji.33.1694059032084; Wed, 06
 Sep 2023 20:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693659382.git.haibo1.xu@intel.com> <b6ef1b031e3a581f481cf19a26623388163444b4.1693659382.git.haibo1.xu@intel.com>
 <20230904-aa8b0d8d23d391586686038a@orel> <CAJve8ok5cU+h1K+WJ+aDpB+u+PBo8XosUyyVbMGy-xR0XiWFdw@mail.gmail.com>
In-Reply-To: <CAJve8ok5cU+h1K+WJ+aDpB+u+PBo8XosUyyVbMGy-xR0XiWFdw@mail.gmail.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Thu, 7 Sep 2023 11:57:00 +0800
Message-ID: <CAJve8om+dLcG+4trDfG1yx8vhj52RhPZrJoF-emWDX+OPM088A@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] KVM: riscv: selftest: Change vcpu_has_ext to a
 common function
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, wchen <waylingii@gmail.com>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, David Matlack <dmatlack@google.com>, 
	Aaron Lewis <aaronlewis@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Ackerley Tng <ackerleytng@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Jim Mattson <jmattson@google.com>, Lei Wang <lei4.wang@intel.com>, 
	Vipin Sharma <vipinsh@google.com>, Maxim Levitsky <mlevitsk@redhat.com>, Like Xu <likexu@tencent.com>, 
	Peter Gonda <pgonda@google.com>, Thomas Huth <thuth@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	David Woodhouse <dwmw@amazon.co.uk>, Michal Luczaj <mhal@rbox.co>, Paul Durrant <paul@xen.org>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_205717_318741_B1C4C1C7 
X-CRM114-Status: GOOD (  17.32  )
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

T24gV2VkLCBTZXAgNiwgMjAyMyBhdCA2OjEw4oCvUE0gSGFpYm8gWHUgPHhpYW9ibzU1eEBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBTZXAgNCwgMjAyMyBhdCAxMDowNOKAr1BNIEFuZHJl
dyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFNhdCwg
U2VwIDAyLCAyMDIzIGF0IDA4OjU5OjI5UE0gKzA4MDAsIEhhaWJvIFh1IHdyb3RlOgo+ID4gPiBk
aWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlz
dC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCj4g
PiA+IGluZGV4IGQ4ZWNhY2QwM2VjZi4uYzQwMjhiZjMyZTNmIDEwMDY0NAo+ID4gPiAtLS0gYS90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMKPiA+ID4gKysr
IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCj4gPiA+
IEBAIC00NCwyMCArNDQsNiBAQCBib29sIGNoZWNrX3JlamVjdF9zZXQoaW50IGVycikKPiA+ID4g
ICAgICAgcmV0dXJuIGVyciA9PSBFSU5WQUw7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+IC1zdGF0aWMg
aW5saW5lIGJvb2wgdmNwdV9oYXNfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IGV4dCkK
PiA+ID4gLXsKPiA+ID4gLSAgICAgaW50IHJldDsKPiA+ID4gLSAgICAgdW5zaWduZWQgbG9uZyB2
YWx1ZTsKPiA+ID4gLQo+ID4gPiAtICAgICByZXQgPSBfX3ZjcHVfZ2V0X3JlZyh2Y3B1LCBSSVND
Vl9JU0FfRVhUX1JFRyhleHQpLCAmdmFsdWUpOwo+ID4gPiAtICAgICBpZiAocmV0KSB7Cj4gPiA+
IC0gICAgICAgICAgICAgcHJpbnRmKCJGYWlsZWQgdG8gZ2V0IGV4dCAlZCIsIGV4dCk7Cj4gPiA+
IC0gICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4gPiAtICAgICB9Cj4gPiA+IC0KPiA+ID4g
LSAgICAgcmV0dXJuICEhdmFsdWU7Cj4gPgo+ID4gZ2V0LXJlZy1saXN0IHdpbGwgbm93IGFzc2Vy
dCBvbiBnZXQtcmVnIHdoZW4gYW4gZXh0ZW5zaW9uIGlzbid0IHByZXNlbnQsCj4gPiByYXRoZXIg
dGhhbiBmYWlsaW5nIHRoZSBfX1RFU1RfUkVRVUlSRSgpLCB3aGljaCB3b3VsZCBkbyBhIHNraXAg
aW5zdGVhZC4KPiA+IFdlIG5lZWQgYm90aCB0aGUgcmV0dXJuIGZhbHNlIHZlcnNpb24gYW5kIHRo
ZSBhc3NlcnQgdmVyc2lvbi4KPiA+Cj4KPiBPaywgV2lsbCBrZWVwIHRoaXMgb25lIGZvciBnZXQt
cmVnLWxpc3QgYW5kIGFkZCBhbm90aGVyIG9uZSBmb3IKPiBhcmNoLXRpbWVyIHNwZWNpZmljIHVz
YWdlLgo+CgpKdXN0IHRob3VnaHQgYWJvdXQgaXQgYWdhaW4sIG1heWJlIHdlIG9ubHkgbmVlZCB0
aGUgInJldHVybiBmYWxzZSIKdmVyc2lvbiBmb3IgYm90aCBnZXQtcmVnLWxpc3QKYW5kIGFyY2gt
dGltZXIgdGVzdHMgc2luY2UgaWYgYW4gZXh0ZW5zaW9uIHdhcyBub3QgYXZhaWxhYmxlLCB0aGUg
dGVzdApjYW4gYmUgc2tpcHBlZCB3aXRoIGEgbWVzc2FnZS4KCmJvb2wgdmNwdV9oYXNfZXh0KHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IGV4dCkKewogICAgICAgdW5zaWduZWQgbG9uZyB2YWx1
ZSA9IDA7CgogICAgICAgX192Y3B1X2dldF9yZWcodmNwdSwgUklTQ1ZfSVNBX0VYVF9SRUcoZXh0
KSwgJnZhbHVlKTsKCiAgICAgICByZXR1cm4gISF2YWx1ZTsKfQoKPiA+ID4gLX0KPiA+ID4gLQo+
ID4gPiAgdm9pZCBmaW5hbGl6ZV92Y3B1KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IHZj
cHVfcmVnX2xpc3QgKmMpCj4gPiA+ICB7Cj4gPiA+ICAgICAgIHN0cnVjdCB2Y3B1X3JlZ19zdWJs
aXN0ICpzOwo+ID4gPiAtLQo+ID4gPiAyLjM0LjEKPiA+ID4KPiA+Cj4gPiBUaGFua3MsCj4gPiBk
cmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
