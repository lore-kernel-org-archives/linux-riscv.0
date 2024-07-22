Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65479C3DA5D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 04:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=drVcuvev9DZTCHKI7bTvOJO7n2H1CSKtrQ4/TduCsSg=; b=KDc59p0QB4lgp7
	yg7mUiz7qXRQ1Jua/V3ziHXV1jfd0xnM9rICxrjsulA8n5yay5Tpt/r+fl1+15qU9QLMZ9lhUS3/6
	3eaVmk98ed/LQ32igYTaSG/QcycokZ6Yw6ZMX7Rq6jdiF1V/W8OCbXrt90FPegjWhIXA3g7rgwgRl
	wpIPdwplrjBbEtSyBpXrRlI7ZnOyWVtF9bPmEUGx9Kz6jDKJ8wx1kvaHcvgIwigKITwZGG30kioEa
	wYsiU/aYcGBCtyef75hqFncKNrgablH/NPFbZ9bY+bCLkr+pBSxwsjE4hn8cDSPkxgg0RVGTd+DJL
	NFUx2UvcdmeKeo4hkK3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVkEB-00000008GJ1-1cj2;
	Mon, 22 Jul 2024 04:00:47 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVkE7-00000008GI7-3FHE
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 04:00:45 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-25e3d388580so2124971fac.0
        for <linux-riscv@lists.infradead.org>; Sun, 21 Jul 2024 21:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1721620842; x=1722225642; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UU/U9aT/yCpp05DYRB+Jlkcig4GcoVKKEP6zUCdSbio=;
        b=Rt2ltl3ouV9daT3emwawIeajbiyRPEKCjBxhJZdeLMyxCKireCS5cp24JCILErLOyy
         eaz41JblRuePJ7+0c4oK5PZ45NqisKhEP6pmuBSfIVxlFojd4YNC9gSsy8H4ajrtehZM
         4pca6fkrnLaMik5jihCs2zmiLnIt5MivfD9eXNXoYj9TFXUPC8WbR78CbDRT8129awFW
         mtODXrVVqY/UH4Tq+4tJhRLdFKkdWiqKECamFHf+eX1F80Q/4A25xUpnL7cmLZwuHqfQ
         bilGLQIGRM/aBxGs5VK+j3Qvt9MhcMOBqJLkeCFdHADJzkK/3G5o8LNaNXB3b5yOZFNC
         gyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721620842; x=1722225642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UU/U9aT/yCpp05DYRB+Jlkcig4GcoVKKEP6zUCdSbio=;
        b=r+6XVA+ouI6jW6zcBE4OmsBWrTzA6LQZI9CgrD/VpZDxGk6jwoPsBt2w4YH1UU/jpr
         UWyWPrCDvdHtoadmA/5fyL8c68eUSf08biU01I+sbgTPVT0ngYfkNRhGhnOanIm4d313
         yk/z25uhlD4CQ7c4RH7N+OqsLyxIfx8McUwOzj/+629TNjf/Gn/Xw7MKrdatMbgGLDiA
         dBVSsJ9YZuwoQZ3FsL6HKeBhm85c8pnaEMh7i6JUsAIVz3Uz/JrPPGprMeLfl7OackCS
         F5NG+26PwspJ2uDQp00/ZMCnRCN7nSsn4pPqTGk8KEl0OS54EHhqqL0gVM41ukElpLtU
         IZeg==
X-Forwarded-Encrypted: i=1; AJvYcCWOJP4g57fZrE3LVQrqJfYlCu/y/3Kb73fgvKoZqzcNyPwBuJRUD9y9QfGjjgcBgnkdfCxExgPC41AnCCwCN1MQ64b8Zc0TNBgVbneAInIZ
X-Gm-Message-State: AOJu0Yx5X2xizfi4kwePxXE5HuZH/0I2YR4WZnkYzsx7QJnVn8ETSMiv
	C1/Y9GkQeoq4CMiKO1Y4rb6M4JbUo08e9Opkao2nipiIVIfqxmW4R8y1QKNxYlzWrrdc1bzszP7
	0GoVKXypQZeT7E+lsQN1x4bYOBQCcyB/Z5+GNvK2aZ1f/jtcsXBD21Q==
X-Google-Smtp-Source: AGHT+IFufRHIYdTg2myge8uAn3TBHPQBEg7AxWUisYIUvVxbwCM8e7mtmaptcuhhHHsopWJlBCy1ww8Pnv0TCceAK6E=
X-Received: by 2002:a05:6870:55ca:b0:260:e713:ae8b with SMTP id
 586e51a60fabf-263ab42d509mr5067699fac.20.1721620841722; Sun, 21 Jul 2024
 21:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240718020935.12803-1-cuiyunhui@bytedance.com> <CAHVXubiYbLs9j=boM7yVg0nRBg3kY9EQiv2R+edLs+B7qJTZug@mail.gmail.com>
In-Reply-To: <CAHVXubiYbLs9j=boM7yVg0nRBg3kY9EQiv2R+edLs+B7qJTZug@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 22 Jul 2024 12:00:30 +0800
Message-ID: <CAEEQ3wm3vk4Yyix+507SH=Qyi4b1dwiGu0-Ep2ikweDTTLLfOg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] riscv/mm/fault: add show_pte() before die()
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: punit.agrawal@bytedance.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, akpm@linux-foundation.org, surenb@google.com, 
	peterx@redhat.com, willy@infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240721_210044_280085_D843915B 
X-CRM114-Status: GOOD (  22.07  )
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

SGkgQWxleO+8jAoKT24gU2F0LCBKdWwgMjAsIDIwMjQgYXQgMTI6MjbigK9BTSBBbGV4YW5kcmUg
R2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gSGkgWXVuaHVpLAo+Cj4g
T24gVGh1LCBKdWwgMTgsIDIwMjQgYXQgNDoyMOKAr0FNIFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBi
eXRlZGFuY2UuY29tPiB3cm90ZToKPiA+Cj4gPiBXaGVuIHRoZSBrZXJuZWwgZGlzcGxheXMgIlVu
YWJsZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0IGF0Cj4gPiB2aXJ0dWFsIGFkZHJl
c3MiLCB3ZSB3b3VsZCBsaWtlIHRvIGNvbmZpcm0gdGhlIHN0YXR1cyBvZiB0aGUgdmlydHVhbAo+
ID4gYWRkcmVzcyBpbiB0aGUgcGFnZSB0YWJsZS4gU28gYWRkIHNob3dfcHRlKCkgYmVmb3JlIGRp
ZSgpLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFu
Y2UuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9tbS9mYXVsdC5jIHwgNDcgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0
NyBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vZmF1bHQu
YyBiL2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+ID4gaW5kZXggOTBkNGJhMzZkMWQwLi5kZmUzY2Uz
OGUxNmIgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMKPiA+ICsrKyBiL2Fy
Y2gvcmlzY3YvbW0vZmF1bHQuYwo+ID4gQEAgLTIyLDYgKzIyLDUyIEBACj4gPgo+ID4gICNpbmNs
dWRlICIuLi9rZXJuZWwvaGVhZC5oIgo+ID4KPiA+ICtzdGF0aWMgdm9pZCBzaG93X3B0ZSh1bnNp
Z25lZCBsb25nIGFkZHIpCj4gPiArewo+ID4gKyAgICAgICBwZ2RfdCAqcGdkcCwgcGdkOwo+ID4g
KyAgICAgICBwNGRfdCAqcDRkcCwgcDRkOwo+ID4gKyAgICAgICBwdWRfdCAqcHVkcCwgcHVkOwo+
ID4gKyAgICAgICBwbWRfdCAqcG1kcCwgcG1kOwo+ID4gKyAgICAgICBwdGVfdCAqcHRlcCwgcHRl
Owo+ID4gKyAgICAgICBzdHJ1Y3QgbW1fc3RydWN0ICptbSA9IGN1cnJlbnQtPm1tOwo+ID4gKwo+
ID4gKyAgICAgICBpZiAoIW1tKQo+ID4gKyAgICAgICAgICAgICAgIG1tID0gJmluaXRfbW07Cj4g
PiArICAgICAgIHBnZHAgPSBwZ2Rfb2Zmc2V0KG1tLCBhZGRyKTsKPiA+ICsgICAgICAgcGdkID0g
UkVBRF9PTkNFKCpwZ2RwKTsKPiA+ICsgICAgICAgcHJfYWxlcnQoIlslMDE2bHhdIHBnZD0lMDE2
bHgiLCBhZGRyLCBwZ2RfdmFsKHBnZCkpOwo+ID4gKyAgICAgICBpZiAocGdkX25vbmUocGdkKSB8
fCBwZ2RfYmFkKHBnZCkpCj4gPiArICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gPiArCj4gPiAr
ICAgICAgIHA0ZHAgPSBwNGRfb2Zmc2V0KHBnZHAsIGFkZHIpOwo+ID4gKyAgICAgICBwNGQgPSBS
RUFEX09OQ0UoKnA0ZHApOwo+ID4gKyAgICAgICBwcl9jb250KCIsIHA0ZD0lMDE2bHgiLCBwNGRf
dmFsKHA0ZCkpOwo+ID4gKyAgICAgICBpZiAocDRkX25vbmUocDRkKSB8fCBwNGRfYmFkKHA0ZCkp
Cj4gPiArICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gPiArCj4gPiArICAgICAgIHB1ZHAgPSBw
dWRfb2Zmc2V0KHA0ZHAsIGFkZHIpOwo+ID4gKyAgICAgICBwdWQgPSBSRUFEX09OQ0UoKnB1ZHAp
Owo+ID4gKyAgICAgICBwcl9jb250KCIsIHB1ZD0lMDE2bHgiLCBwdWRfdmFsKHB1ZCkpOwo+ID4g
KyAgICAgICBpZiAocHVkX25vbmUocHVkKSB8fCBwdWRfYmFkKHB1ZCkpCj4gPiArICAgICAgICAg
ICAgICAgZ290byBvdXQ7Cj4gPiArCj4gPiArICAgICAgIHBtZHAgPSBwbWRfb2Zmc2V0KHB1ZHAs
IGFkZHIpOwo+ID4gKyAgICAgICBwbWQgPSBSRUFEX09OQ0UoKnBtZHApOwo+ID4gKyAgICAgICBw
cl9jb250KCIsIHBtZD0lMDE2bHgiLCBwbWRfdmFsKHBtZCkpOwo+ID4gKyAgICAgICBpZiAocG1k
X25vbmUocG1kKSB8fCBwbWRfYmFkKHBtZCkpCj4gPiArICAgICAgICAgICAgICAgZ290byBvdXQ7
Cj4gPiArCj4gPiArICAgICAgIHB0ZXAgPSBwdGVfb2Zmc2V0X21hcChwbWRwLCBhZGRyKTsKPiA+
ICsgICAgICAgaWYgKCFwdGVwKQo+ID4gKyAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4gKwo+
ID4gKyAgICAgICBwdGUgPSBSRUFEX09OQ0UoKnB0ZXApOwo+Cj4gQWxsIHRoZSBSRUFEX09OQ0Uo
KSBjYW4gYmUgcmVwbGFjZWQgYnkgcFhYcF9nZXQoKSBtYWNyb3MgZGVmaW5lZCBoZXJlOgo+IGh0
dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjEwL3NvdXJjZS9pbmNsdWRlL2xpbnV4
L3BndGFibGUuaCNMMzE1Cj4KPiBBbmQgd2Ugc2hvdWxkIHN0b3AgYXMgc29vbiBhcyB3ZSBlbmNv
dW50ZXIgYSBsZWFmIGVudHJ5IHVzaW5nIHBYZF9sZWFmKCkuCj4KT2theSwgSSdsbCB1cGRhdGUg
aXQgaW4gdjIuCgo+IFRoYW5rcywKPgo+IEFsZXgKPgo+ID4gKyAgICAgICBwcl9jb250KCIsIHB0
ZT0lMDE2bHgiLCBwdGVfdmFsKHB0ZSkpOwo+ID4gKyAgICAgICBwdGVfdW5tYXAocHRlcCk7Cj4g
PiArb3V0Ogo+ID4gKyAgICAgICBwcl9jb250KCJcbiIpOwo+ID4gK30KPiA+ICsKPiA+ICBzdGF0
aWMgdm9pZCBkaWVfa2VybmVsX2ZhdWx0KGNvbnN0IGNoYXIgKm1zZywgdW5zaWduZWQgbG9uZyBh
ZGRyLAo+ID4gICAgICAgICAgICAgICAgIHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4gIHsKPiA+
IEBAIC0zMSw2ICs3Nyw3IEBAIHN0YXRpYyB2b2lkIGRpZV9rZXJuZWxfZmF1bHQoY29uc3QgY2hh
ciAqbXNnLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gPiAgICAgICAgICAgICAgICAgYWRkcik7Cj4g
Pgo+ID4gICAgICAgICBidXN0X3NwaW5sb2NrcygwKTsKPiA+ICsgICAgICAgc2hvd19wdGUoYWRk
cik7Cj4gPiAgICAgICAgIGRpZShyZWdzLCAiT29wcyIpOwo+ID4gICAgICAgICBtYWtlX3Rhc2tf
ZGVhZChTSUdLSUxMKTsKPiA+ICB9Cj4gPiAtLQo+ID4gMi4zOS4yCj4gPgo+Cj4gT3RoZXJ3aXNl
LCB0aGF0J3MgYSBnb29kIGlkZWEgdG8gcHJpbnQgdGhlIHBhZ2UgdGFibGUgY29udGVudCBvbiBm
YXVsdCBzbzoKPgo+IFJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZv
c2luYy5jb20+Cj4KPiBUaGFua3MsCj4KPiBBbGV4CgpUaGFua3MsCll1bmh1aQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
