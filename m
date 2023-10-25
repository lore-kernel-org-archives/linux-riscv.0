Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B73AC07545
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 05:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r7doFlGcEN3HAt0+WgG+lvAB6eLsnJkOpwbHxmFOljE=; b=ZzsLKTcgA+Y92z
	ZL+rhRkPTiiV8uM9m8CvwczD2CRpg3jCU1bEpVfd0Mximzaae4tB9/an+ozjxb2sb9Uul5KPAWkAX
	nNoqMbUJZ08Z0bHkKR3+VBVp5Hmvp5NwJppxO3FcmJHHc9uW5d5aOIhhBUyTTqIPKjocsM/D1IaVq
	wLfC0+LKfMaR3EH/2mWl2odI/P8VGrXdycSLWHy2Ui1wo4hsCLzTZevj52qST6dNfP/4hgdVREoVt
	hdBw+lHnCGqGK0FdxEj3Jlxs5ToC+GRlbEZCgZOwNDMjO+dI23G5Ro+/ax06vsUlF9k/e033tKzXz
	xp8lgRT33MY6xnDdC2Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvW8D-00BOSS-2f;
	Wed, 25 Oct 2023 05:08:37 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvW8A-00BORf-0I
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 05:08:35 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso3958697a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 22:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698210511; x=1698815311; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFvh81m/EkJYzWlFXi+WuBbUWclMpLB5KNSNRJow4Gk=;
        b=PpDLZ8YZy35TwEkyF4a1GYhuhBxTQ2peUxFQlI0UhFA6a6j5S55PMTqChpOQL5pNTh
         Q393tOTaAjVjs9xRVgv4wntLlHhkZmBMEm9yXaaCEy1xI/jgydyfxyjZAvRK5tcqygvO
         x5TuYHbu/KpW/CiwYDrqtoKv0fqtzTT0yGfdOOE9DbW1FJYP/irIJdModdF9hAz4Pdd+
         gGWW7z1OTH+bRI1aGvTRkdQ3+4WKGFP7ue68jC6FzH6wsEIpj6n1OCBo4hJCl+o0H6Dp
         2tdG0Qn2iv0NnjiZr3Z4qmVrxdACiX7cUnlY4OKF51Sdir7GWcZIPZdCxh3RuoHk+m8i
         1ReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698210511; x=1698815311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFvh81m/EkJYzWlFXi+WuBbUWclMpLB5KNSNRJow4Gk=;
        b=t20MGoadZE0wGVoPchw8hGAw/AlLkP/Oog6LkPQ+yslVavqnXtjbqH0/uQecGSTfVI
         WLhuaJg1WR3yBdXrjhDf5vm4NmjyDxgv2eSBgdhqK5rAEYIYqgbcWd8VUfdY7psZ0vht
         eca6ovOFUwfB1kw+KhyyB8c1naT/vJc1wL61bw6lYmf6I+NF1Ddezj4pV6/Ui8PregXc
         FTcl31mbohpN1t1MnJIRM1RcAOT4wCXryCl0986DLf/KuCpu8D/uea8HBXV5IXg/KBsW
         l1OuQz3m2y9GdbJWrbsoHkOZOwJqopSBXNc1VbitpDhOsP4tqu21XR/6oQ12tlWKeS4J
         Zncg==
X-Gm-Message-State: AOJu0YzgwuDz3QSgWZjtGIwsgQVFj6D/OjYM4Fa3F7UrwCwY2VAjmwT4
	xZB5ftyldxNHMSBX6EYReKzYdW5pafHnbe0AgPWpyw==
X-Google-Smtp-Source: AGHT+IHcaVxUx65KUpdn3fS8Uk95UJXFTtrVhI8I3RT798xBXThkTN9cWmveeVlGayof6ryYYLraHDlLGhg4cwxsmyg=
X-Received: by 2002:a17:90b:4d12:b0:279:2dac:80b3 with SMTP id
 mw18-20020a17090b4d1200b002792dac80b3mr13071676pjb.44.1698210510922; Tue, 24
 Oct 2023 22:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <20231023172800.315343-1-apatel@ventanamicro.com>
 <20231023172800.315343-10-apatel@ventanamicro.com> <8734y0rwtw.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <8734y0rwtw.fsf@all.your.base.are.belong.to.us>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 25 Oct 2023 10:38:20 +0530
Message-ID: <CAK9=C2UVgTd-a0671Lab_ZeOPWP3=wHY+pydKHqaR-Yg65YhrA@mail.gmail.com>
Subject: Re: [PATCH v11 09/14] irqchip/riscv-imsic: Add support for PCI MSI irqdomain
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_220834_150859_2119DCAC 
X-CRM114-Status: GOOD (  18.66  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBPY3QgMjQsIDIwMjMgYXQgNjozOeKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+
IHdyaXRlczoKPgo+ID4gVGhlIExpbnV4IFBDSSBmcmFtZXdvcmsgcmVxdWlyZXMgaXQncyBvd24g
ZGVkaWNhdGVkIE1TSSBpcnFkb21haW4gc28KPiA+IGxldCB1cyBjcmVhdGUgUENJIE1TSSBpcnFk
b21haW4gYXMgY2hpbGQgb2YgdGhlIElNU0lDIGJhc2UgaXJxZG9tYWluLgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4g
PiAgZHJpdmVycy9pcnFjaGlwL0tjb25maWcgICAgICAgICAgICAgICAgICAgIHwgIDcgKysrCj4g
PiAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1wbGF0Zm9ybS5jIHwgNTEgKysrKysr
KysrKysrKysrKysrKysrKwo+ID4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3Rh
dGUuaCAgICB8ICAxICsKPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDU5IGluc2VydGlvbnMoKykKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL0tjb25maWcgYi9kcml2ZXJzL2lycWNo
aXAvS2NvbmZpZwo+ID4gaW5kZXggYmRkODA3MTYxMTRkLi5jMWQ2OWI0MThkZmIgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvS2NvbmZpZwo+ID4gKysrIGIvZHJpdmVycy9pcnFjaGlw
L0tjb25maWcKPiA+IEBAIC01NTIsNiArNTUyLDEzIEBAIGNvbmZpZyBSSVNDVl9JTVNJQwo+ID4g
ICAgICAgc2VsZWN0IElSUV9ET01BSU5fSElFUkFSQ0hZCj4gPiAgICAgICBzZWxlY3QgR0VORVJJ
Q19NU0lfSVJRCj4gPgo+ID4gK2NvbmZpZyBSSVNDVl9JTVNJQ19QQ0kKPiA+ICsgICAgIGJvb2wK
PiA+ICsgICAgIGRlcGVuZHMgb24gUklTQ1ZfSU1TSUMKPiA+ICsgICAgIGRlcGVuZHMgb24gUENJ
Cj4gPiArICAgICBkZXBlbmRzIG9uIFBDSV9NU0kKPiA+ICsgICAgIGRlZmF1bHQgUklTQ1ZfSU1T
SUMKPiA+ICsKPiA+ICBjb25maWcgRVhZTk9TX0lSUV9DT01CSU5FUgo+ID4gICAgICAgYm9vbCAi
U2Ftc3VuZyBFeHlub3MgSVJRIGNvbWJpbmVyIHN1cHBvcnQiIGlmIENPTVBJTEVfVEVTVAo+ID4g
ICAgICAgZGVwZW5kcyBvbiAoQVJDSF9FWFlOT1MgJiYgQVJNKSB8fCBDT01QSUxFX1RFU1QKPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXBsYXRmb3JtLmMg
Yi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXBsYXRmb3JtLmMKPiA+IGluZGV4IDIz
ZDI4NmNiMDE3ZS4uY2RiNjU5NDAxMTk5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9pcnFjaGlw
L2lycS1yaXNjdi1pbXNpYy1wbGF0Zm9ybS5jCj4gPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJx
LXJpc2N2LWltc2ljLXBsYXRmb3JtLmMKPiA+IEBAIC0xMyw2ICsxMyw3IEBACj4gPiAgI2luY2x1
ZGUgPGxpbnV4L2lycWRvbWFpbi5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiA+
ICAjaW5jbHVkZSA8bGludXgvbXNpLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3BjaS5oPgo+ID4g
ICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgv
c3BpbmxvY2suaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvc21wLmg+Cj4gPiBAQCAtMjE1LDYgKzIx
Niw0MiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGlycV9kb21haW5fb3BzIGltc2ljX2Jhc2VfZG9t
YWluX29wcyA9IHsKPiA+ICAjZW5kaWYKPiA+ICB9Owo+ID4KPiA+ICsjaWZkZWYgQ09ORklHX1JJ
U0NWX0lNU0lDX1BDSQo+ID4gKwo+ID4gK3N0YXRpYyB2b2lkIGltc2ljX3BjaV9tYXNrX2lycShz
dHJ1Y3QgaXJxX2RhdGEgKmQpCj4gPiArewo+ID4gKyAgICAgcGNpX21zaV9tYXNrX2lycShkKTsK
PiA+ICsgICAgIGlycV9jaGlwX21hc2tfcGFyZW50KGQpOwo+Cj4gSSd2ZSBhc2tlZCB0aGlzIGJl
Zm9yZSwgYnV0IEkgc3RpbGwgZG9uJ3QgZ2V0IHdoeSB5b3UgbmVlZCB0byBwcm9wYWdhdGUKPiB0
byB0aGUgcGFyZW50PyBXaHkgaXNuJ3QgbWFza2luZyBvbiBQQ0kgZW5vdWdoPwo+CgpXZSBhcmUg
dXNpbmcgaGllcmFyY2hpY2FsIElSUSBkb21haW5zIHdoZXJlIElNU0lDLUJBU0UgaXMKdGhlIHJv
b3QgZG9tYWluIHdoZXJlYXMgSU1TSUMtUExBVCBkb21haW4gKE1TSSBpcnEgZG9tYWluCmZvciBw
bGF0Zm9ybSBkZXZpY2VzKSBhbmQgSU1TSUMtUENJIGRvbWFpbiAoTVNJIGlycSBkb21haW4KZm9y
IFBDSSBkZXZpY2VzKS4gRm9yIGhpZXJhcmNoaWNhbCBJUlEgZG9tYWlucywgaWYgaXJxIGRvbWFp
biBYCmRvZXMgbm90IGltcGxlbWVudCBpcnFfbWFzay91bm1hc2sgdGhlbiB0aGUgcGFyZW50IGly
cQpkb21haW4gaXJxX21hc2svdW5tYXNrIGlzIGNhbGxlZCB3aXRoIHBhcmVudCBpcnEgZGVzY3Jp
cHRvci4KCk5vdyBmb3IgSU1TSUMtUENJIGRvbWFpbiwgdGhlIFBDSSBmcmFtZXdvcmsgZXhwZWN0
cyB0aGUKcGNpX21zaV9tYXNrL3VubWFza19pcnEoKSBmdW5jdGlvbnMgdG8gYmUgY2FsbGVkIGJ1
dCBpZgp3ZSBkaXJlY3RseSBwb2ludCBwY2lfbXNpX21hc2svdW5tYXNrX2lycSgpIGluIHRoZSBJ
TVNJQy1QQ0kKaXJxY2hpcCB0aGVuIElNU0lDLUJBU0UgKHBhcmVudCBkb21haW4pIGlycV9tYXNr
L3VtYXNrCndvbid0IGJlIGNhbGxlZCBoZW5jZSB0aGUgSVJRIHdvbid0IGJlIG1hc2tlZC91bm1h
c2suCkR1ZSB0byB0aGlzLCB3ZSBjYWxsIGJvdGggcGNpX21zaV9tYXNrL3VubWFza19pcnEoKSBh
bmQKaXJxX2NoaXBfbWFzay91bm1hc2tfcGFyZW50KCkgZm9yIElNU0lDLVBDSSBkb21haW4uCgpU
aGUgQVJNIEdJQyBkcml2ZXIgYWxzbyB1c2VzIGhpZXJhcmNoaWNhbCBJUlEgZG9tYWlucwpldmVu
IHRoZXJlIHNhbWUgdGhpbmcgaXMgZG9uZS4KKFJlZmVyLCBmaXJzdCAzMCBsaW5lcyBvZiBkcml2
ZXJzL2lycWNoaXAvaXJxLWdpYy12My1pdHMtcGNpLW1zaS5jKQoKUmVnYXJkcywKQW51cAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
