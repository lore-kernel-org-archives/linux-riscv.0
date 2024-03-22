Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1744AC54E71
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 17:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8fkTH70sRRx2zNM1NZvmzGQ2jHzY4l1WPVOBVS/vuTM=; b=kdUgB+rRHwE8ds
	KAAk9c41zqo8587A/ydFXZl4GL8aMsYtzf6Be+gwfnGuwe9BXFbj0qsRNK3Nl10AVWauB6pHUXY2B
	hygpSatG+t/zHSE0XVnyK3NjhYIFKlIGq6h+j2ouhn2kAni4jbCt4QhkWIF2scbq1j6bVad5DYxi4
	byTwpxI1RE0VZS6njosRJfN5eCiPJI2YbGt5AMM/wzAHPaQiarHwd993Afb3dwo/aROwVQM91w+Y8
	kNRichMgUqTBnR1KXf+ahOV/tUCVfp4K0+QUOl1C2lBCOEtkGB8ZHotSKa5dvGtc0K9GgkYqe0s6e
	wwU9ZpDTT4phTxA5vikg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rniT3-000000087sE-3e42;
	Fri, 22 Mar 2024 17:14:09 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rniT0-000000087qt-3k3a
	for linux-riscv@lists.infradead.org;
	Fri, 22 Mar 2024 17:14:08 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-dc74435c428so2378147276.2
        for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2024 10:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711127638; x=1711732438; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrCZcezSHtMHgCYV9eTeglWhzn7+4jU5szarE8AAqMc=;
        b=yXCvzfRKRQWFPV2t2JYQXysm3kqjZKd6LW+aLgGRVhrus2DyZCJ0LXZhpmmFtKYVLH
         MQIsguYfyTU7WxGbx7Ds0NhV1ZaIEMINpdZWoSRBPtzEI0Z9syPYTVG9LAypTH1z91A5
         OuwHg0ffjk0wEEocKECoPMFJ9UECUe5Y8A8YARNDn7yF7RmsGR7KVltvxovq87TM3tfb
         /l1P7WL/5NIPMmqYJXyrXeARMXYg5OF8/o6bYNl1IkOl0VY/P9tXnvBmg4qsm2s6HX21
         +Fr/i6iC7jEmy5OxEQ3QNNbO7e1g9DkJKcgvSogZrKyjhFKPV5MZjArgOEB6JOwDV/EQ
         Rxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711127638; x=1711732438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JrCZcezSHtMHgCYV9eTeglWhzn7+4jU5szarE8AAqMc=;
        b=FpeSYs6VZs4euBu9Q/KFuF/R0fBOL1FJhGh3bPpf30g1AwPdF7RKR2aQDABsLF/be4
         4SPiW/sCNO7HR4qGNurBtc7rOzCATMCNY09kKa8pu/+Z+eB5xMek9kVIeroxJyDuMRL/
         A8kW1RkfZM3xi+L3KnOMkw5yfr+aT2UY+L/wPf4TAQhJii3axbFWe2kM3CYmVTd1AmYd
         jPesL3XRjU0/0ZAECSZLoBCVxVZNhaLK1vZEsFY3AXsZuAepUfMNfUWGc5b7Hs+MLA9n
         Jron52pJ7vRKY4izF2H71YUEDlt7UtR1RsUWkoxmLcOoYEdJqBNkryIQDLUvO77TkPq+
         qyUg==
X-Forwarded-Encrypted: i=1; AJvYcCURXPdhRHmLjzGqIlZ+VeSqdtajYRmege2OPfORxYBV1BuwItIeVYYsEA4zq0r3ssekoQ1xKGIvJ0c+GBf/acFySGcIKuoX8s8he0gnZw0+
X-Gm-Message-State: AOJu0Yw8x9xVvM1JcbLOa1Vqo2plYWF7g3ilrb08dItUzOyshQrGBLf/
	qOpb5ta8V7t+AwFaycdssbNSdSEo0YWId2vyTKqNQE+VIdHQ39klqnemYs5qLmPNkZgiIJF+i/Y
	/hMCR7tVzZ68lQb/LGOfJZbxUvnfYthqBlcQlCg==
X-Google-Smtp-Source: AGHT+IE+dsR/xonqkKbxamX8f+YQ5K1V1B8ZXMDiZAfjLGnUm36k6juYRhEDctP2PuCEMODRsbZ2Htfibx0XdOXU0Jg=
X-Received: by 2002:a25:b121:0:b0:dc6:d2d3:a57c with SMTP id
 g33-20020a25b121000000b00dc6d2d3a57cmr2856379ybj.59.1711127638274; Fri, 22
 Mar 2024 10:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240319215915.832127-1-samuel.holland@sifive.com>
 <20240319215915.832127-6-samuel.holland@sifive.com> <CAKC1njSg9-hJo6hibcM9a-=FUmMWyR39QUYqQ1uwiWhpBZQb9A@mail.gmail.com>
 <40ab1ce5-8700-4a63-b182-1e864f6c9225@sifive.com> <CAKC1njQYZHbQJ71mapeG1DEw=A+aGx77xsuQGecsNFpoJ=tzGQ@mail.gmail.com>
 <d9452ab4-a783-4bcf-ac25-40baa4f31fac@sifive.com>
In-Reply-To: <d9452ab4-a783-4bcf-ac25-40baa4f31fac@sifive.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 22 Mar 2024 10:13:48 -0700
Message-ID: <CAKC1njRBbzM+gWowg1LOjq5GzVn4q+vJP9JUswVYfWmEw+yHSg@mail.gmail.com>
Subject: Re: [RISC-V] [tech-j-ext] [RFC PATCH 5/9] riscv: Split per-CPU and
 per-thread envcfg bits
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, 
	tech-j-ext@lists.risc-v.org, kasan-dev@googlegroups.com, 
	Evgenii Stepanov <eugenis@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_101407_034935_B746D2D9 
X-CRM114-Status: GOOD (  19.53  )
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

T24gVGh1LCBNYXIgMjEsIDIwMjQgYXQgNToxM+KAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IE9uIDIwMjQtMDMtMTkgMTE6MzkgUE0sIERl
ZXBhayBHdXB0YSB3cm90ZToKPiA+Pj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3dp
dGNoX3RvLmgKPiA+Pj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3dpdGNoX3RvLmgK
PiA+Pj4+IEBAIC02OSw2ICs2OSwxNyBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIGJvb2wgaGFz
X2ZwdSh2b2lkKSB7IHJldHVybiBmYWxzZTsgfQo+ID4+Pj4gICNkZWZpbmUgX19zd2l0Y2hfdG9f
ZnB1KF9fcHJldiwgX19uZXh0KSBkbyB7IH0gd2hpbGUgKDApCj4gPj4+PiAgI2VuZGlmCj4gPj4+
Pgo+ID4+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBzeW5jX2VudmNmZyhzdHJ1Y3QgdGFza19zdHJ1
Y3QgKnRhc2spCj4gPj4+PiArewo+ID4+Pj4gKyAgICAgICBjc3Jfd3JpdGUoQ1NSX0VOVkNGRywg
dGhpc19jcHVfcmVhZChyaXNjdl9jcHVfZW52Y2ZnKSB8IHRhc2stPnRocmVhZC5lbnZjZmcpOwo+
ID4+Pj4gK30KPiA+Pj4+ICsKPiA+Pj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgX19zd2l0Y2hfdG9f
ZW52Y2ZnKHN0cnVjdCB0YXNrX3N0cnVjdCAqbmV4dCkKPiA+Pj4+ICt7Cj4gPj4+PiArICAgICAg
IGlmIChyaXNjdl9jcHVfaGFzX2V4dGVuc2lvbl91bmxpa2VseShzbXBfcHJvY2Vzc29yX2lkKCks
IFJJU0NWX0lTQV9FWFRfWExJTlVYRU5WQ0ZHKSkKPiA+Pj4KPiA+Pj4gSSd2ZSBzZWVuIGByaXNj
dl9jcHVfaGFzX2V4dGVuc2lvbl91bmxpa2VseWAgZ2VuZXJhdGluZyBicmFuY2h5IGNvZGUKPiA+
Pj4gZXZlbiBpZiBBTFRFUk5BVElWRVMgd2FzIHR1cm5lZCBvbi4KPiA+Pj4gQ2FuIHlvdSBjaGVj
ayBkaXNhc20gb24geW91ciBlbmQgYXMgd2VsbC4gIElNSE8sIGBlbnRyeS5TYCBpcyBhIGJldHRl
cgo+ID4+PiBwbGFjZSB0byBwaWNrIHVwICplbnZjZmcuCj4gPj4KPiA+PiBUaGUgYnJhbmNoaW5l
c3MgaXMgc29ydCBvZiBleHBlY3RlZCwgc2luY2UgdGhhdCBmdW5jdGlvbiBpcyBpbXBsZW1lbnRl
ZCBieQo+ID4+IHN3aXRjaGluZyBvbi9vZmYgYSBicmFuY2ggaW5zdHJ1Y3Rpb24sIHNvIHRoZSBh
bHRlcm5hdGUgY29kZSBpcyBuZWNlc3NhcmlseSBhCj4gPj4gc2VwYXJhdGUgYmFzaWMgYmxvY2su
IEl0J3MgYSB0cmFkZW9mZiBzbyB3ZSBkb24ndCBoYXZlIHRvIHdyaXRlIGFzc2VtYmx5IGNvZGUK
PiA+PiBmb3IgZXZlcnkgYml0IG9mIGNvZGUgdGhhdCBkZXBlbmRzIG9uIGFuIGV4dGVuc2lvbi4g
SG93ZXZlciwgdGhlIGNvc3Qgc2hvdWxkIGJlCj4gPj4gc29tZXdoYXQgbG93ZXJlZCBzaW5jZSB0
aGUgYnJhbmNoIGlzIHVuY29uZGl0aW9uYWwgYW5kIHNvIGVudGlyZWx5IHByZWRpY3RhYmxlLgo+
ID4+Cj4gPj4gSWYgdGhlIGJyYW5jaCB0dXJucyBvdXQgdG8gYmUgcHJvYmxlbWF0aWMgZm9yIHBl
cmZvcm1hbmNlLCB0aGVuIHdlIGNvdWxkIHVzZQo+ID4+IEFMVEVSTkFUSVZFIGRpcmVjdGx5IGlu
IHN5bmNfZW52Y2ZnKCkgdG8gTk9QIG91dCB0aGUgQ1NSIHdyaXRlLgo+ID4KPiA+IFllYWggSSBs
ZWFuIHRvd2FyZHMgdXNpbmcgYWx0ZXJuYXRpdmVzIGRpcmVjdGx5Lgo+Cj4gT25lIHRoaW5nIHRv
IG5vdGUgaGVyZTogd2UgY2FuJ3QgdXNlIGFsdGVybmF0aXZlcyBkaXJlY3RseSBpZiB0aGUgYmVo
YXZpb3IgbmVlZHMKPiB0byBiZSBkaWZmZXJlbnQgb24gZGlmZmVyZW50IGhhcnRzIChpLmUuIGEg
c3Vic2V0IG9mIGhhcnRzIGltcGxlbWVudCB0aGUgZW52Y2ZnCj4gQ1NSKS4gSSB0aGluayB3ZSBu
ZWVkIHNvbWUgcG9saWN5IGFib3V0IHdoaWNoIElTQSBleHRlbnNpb25zIGFyZSBhbGxvd2VkIHRv
IGJlCj4gYXN5bW1ldHJpYyBhY3Jvc3MgaGFydHMsIG9yIGVsc2Ugd2UgYWRkIHRvbyBtdWNoIGNv
bXBsZXhpdHkuCgpBcyBJJ3ZlIHJlc3BvbmRlZCBvbiB0aGUgc2FtZSB0aHJlYWQgLiBXZSBhcmUg
YWRkaW5nIHRvbyBtdWNoCmNvbXBsZXhpdHkgYnkgYXNzdW1pbmcKdGhhdCBoZXRlcm9nZW5lb3Vz
IElTQSBleGlzdHMgKHdoaWNoIGl0IGRvZXNuJ3QgdG9kYXkpLiBBbmQgZXZlbiBpZiBpdApleGlz
dHMsIGl0IHdvdWxkbid0IHdvcmsuCk5vYm9keSB3YW50cyB0byBzcGVuZCBhIGxvdCBvZiB0aW1l
IGZpZ3VyaW5nIG91dCB3aGljaCBoYXJ0cyBoYXZlCndoaWNoIElTQSBhbmQgd2hpY2gKcGFja2Fn
ZXMgYXJlIGNvbXBpbGVkIHdpdGggd2hpY2ggSVNBLiBNb3N0IG9mIHRoZSBlbmQgdXNlcnMgZG8g
YHN1ZG8KYXB0IGdldCBpbnN0YWxsIGJsYWggYmxhaGAKQW5kIHRoZW4gZXhwZWN0IGl0IHRvIGp1
c3Qgd29yay4gSXQgZG9lc24ndCB3b3JrIGZvciBvdGhlcgphcmNoaXRlY3R1cmVzIGFuZCBldmVu
IHdoZW4gc29tZW9uZQp0cmllZCwgdGhleSBoYWQgdG8gZGlzYWJsZSBjZXJ0YWluIElTQSBmZWF0
dXJlcyB0byBtYWtlIHN1cmUgdGhhdCBhbGwKY29yZXMgaGF2ZSB0aGUgc2FtZSBJU0EgZmVhdHVy
ZQooc2VhcmNoIEFWWDEyIEludGVsIEFsZGVyIExha2UgRGlzYWJsZSkuCgo+Cj4gUmVnYXJkcywK
PiBTYW11ZWwKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
