Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CC5C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 16:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SMlsn4MbZUxU/1TA7/c3zb6urTa07MbT1fSaEvEQDPk=; b=trdILpNCd0RzIY
	3AoHdNov3eAATebkPHwhRe+5MCbwU583vfoY76XE6L55Mi8DZag+dPUeaY9S+hHAIlBsJeIK7ineZ
	Egkmqo35AcbtQVgptWceUT7JjABrMbteuirdTPT7ieOXwOaKI8RH8EY7sIReuRo2o+CvZHMsbi3bA
	+fRgkFqfvbwsoXfkFuJLh42hT2TIZowPp+gYy45UENUzmuaROZOIbuLgSOt8EkLYJwjDbLOuYBuQ/
	IuWXtR6fa0fV15tfEMqX1ppj5MoFoTo+nH3neYoSXg9wkyV7+V6wZQl5ZOStq2QgfznMpxb3/mtkK
	I0q5fqHFtdymC1B1sVbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Tpn-00000003Zna-1Bz2;
	Mon, 29 Apr 2024 16:26:31 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Tpk-00000003Zmo-1MNT
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 16:26:30 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-de596c078c2so4398483276.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 09:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1714407982; x=1715012782; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CrS8Hh3nfWDYBnimGcOfd9CKdp//ogZ+PunEhiC75hs=;
        b=P5tAnD7rik7CWtQyQCt/UC/EvD9bC8ymiHbhkeMx2k8LiNsIcWfHU5VkcpuATZYMXy
         EbxthS+QJdhWyP/A6pHZzn+3NjxX/3afqzh72v62NY+61x+UyTF3Gk3gJsSa6dRj53Th
         se9HixfA60UXeyApVjhXnECiMtiTe6YW2fvsOmVXiLqtRkO/U61OircjkVrbSFyGvDby
         cmx+6hsxCbS019qKUKhxVioGcMMV2kt7qHxpjoiYeQMTRdn2Bewcnrt43eQ3krkfZv3/
         7fpxldVoKFO3k2V/Amz4r3cSLEE1UntXU+3nKc++g7EEihhZ0/l63gJhwcZvyS+XjLae
         SxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714407982; x=1715012782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CrS8Hh3nfWDYBnimGcOfd9CKdp//ogZ+PunEhiC75hs=;
        b=eq8gvA89ykrwkcXfSmm6KB22pmujpxWuonrSLP4qZFBkNl3ZPv/+pz5ObgzVzsHiIw
         ROSkfHz2oKFd84Ou0Nuion2syj/WaYr33t898mqNvPNJ9OCCaURiK32SjGNdx5fDMraA
         IlIfDnIl52hFl/nujuIW35HOELEC4HO8rzRg30LbDOccGhpRtzK+awbf7/18pceV+W/o
         lwaWPyE1LTuWIIOBnpF/h6U+hxSPhXCZLS/OnI6kXU8W9Ir1P8O9aapFOdvxff56AmjT
         KWJIyzeDaD8pLZXkQo75IqtFEm+7/7ZXoUGOxPfWPbxUrTT03zFnu3YCiaFJr1UxyO/2
         wO/w==
X-Forwarded-Encrypted: i=1; AJvYcCXBCapToF085IQVRqsiou5+QoM+gLKoidb9B90Mdxhh10F0aG209lJ+Uq8KRpvEIF3ePumG+ybknzribSLfa2jNKTslIQuq1LD9aUZUmNvb
X-Gm-Message-State: AOJu0YywNaBFNuoFZINHsRz8xWTfKmH8Y/WwmMvqHZu/bgRYsrOdvptY
	p/QqbKNp35HFB7h7gzblEAPSkta6L9wCPtGJQAIIqGoM3gwHNtqp7bCKe67fQZlZbLK6q1yGMcG
	0ufqPXdD4QB7mUNvS67tZb4LCt7P9fAPBDbu3Qg==
X-Google-Smtp-Source: AGHT+IGcQ0a/bJ7Wbo1QYQaakNkvhLKajpQcqDOdTeslfWLHwgPsDPVfEB7hwsFcTNWmdEL5wmgcdsTu0TGmuHEbonM=
X-Received: by 2002:a05:6902:510:b0:de5:c619:3f6b with SMTP id
 x16-20020a056902051000b00de5c6193f6bmr7236404ybs.59.1714407982421; Mon, 29
 Apr 2024 09:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240226065113.1690534-1-nick.hu@sifive.com> <CAPDyKFph3WsZMmALnzBQKE4S_80Ji5h386Wi0vHda37QUsjMtg@mail.gmail.com>
 <CAKddAkDcdaXKzpcKN=LCCx9S4Trv+joLX2s=nyhzaRtM5HorqA@mail.gmail.com>
In-Reply-To: <CAKddAkDcdaXKzpcKN=LCCx9S4Trv+joLX2s=nyhzaRtM5HorqA@mail.gmail.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Tue, 30 Apr 2024 00:26:11 +0800
Message-ID: <CAKddAkC6N=Cfo0z+F8herKTuJzCyt_MA0vWNbLCr6CbQnj0y8g@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: riscv-sbi: Add cluster_pm_enter()/exit()
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: palmer@dabbelt.com, anup@brainfault.org, rafael@kernel.org, 
	daniel.lezcano@linaro.org, paul.walmsley@sifive.com, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_092628_391830_4941DE2D 
X-CRM114-Status: GOOD (  27.76  )
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

T24gVHVlLCBBcHIgMzAsIDIwMjQgYXQgMTI6MjLigK9BTSBOaWNrIEh1IDxuaWNrLmh1QHNpZml2
ZS5jb20+IHdyb3RlOgo+Cj4gSGkgVWxmCj4KPiBPbiBNb24sIEFwciAyOSwgMjAyNCBhdCAxMDoz
MuKAr1BNIFVsZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBsaW5hcm8ub3JnPiB3cm90ZToKPiA+Cj4g
PiBPbiBNb24sIDI2IEZlYiAyMDI0IGF0IDA3OjUxLCBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5j
b20+IHdyb3RlOgo+ID4gPgo+ID4gPiBXaGVuIHRoZSBjcHVzIGluIHRoZSBzYW1lIGNsdXN0ZXIg
YXJlIGFsbCBpbiB0aGUgaWRsZSBzdGF0ZSwgdGhlIGtlcm5lbAo+ID4gPiBtaWdodCBwdXQgdGhl
IGNsdXN0ZXIgaW50byBhIGRlZXBlciBsb3cgcG93ZXIgc3RhdGUuIENhbGwgdGhlCj4gPiA+IGNs
dXN0ZXJfcG1fZW50ZXIoKSBiZWZvcmUgZW50ZXJpbmcgdGhlIGxvdyBwb3dlciBzdGF0ZSBhbmQg
Y2FsbCB0aGUKPiA+ID4gY2x1c3Rlcl9wbV9leGl0KCkgYWZ0ZXIgdGhlIGNsdXN0ZXIgd29rZW4g
dXAuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNv
bT4KPiA+Cj4gPiBJIHdhcyBub3QgY2NlZCB0aGlzIHBhdGNoLCBidXQgbm90aWNlZCB0aGF0IHRo
aXMgcGF0Y2ggZ290IHF1ZXVlZCB1cAo+ID4gcmVjZW50bHkuIFNvcnJ5IGZvciBub3Qgbm90aWNp
bmcgZWFybGllci4KPiA+Cj4gPiBJZiBub3QgdG9vIGxhdGUsIGNhbiB5b3UgcGxlYXNlIGRyb3Av
cmV2ZXJ0IGl0PyBXZSBzaG91bGQgcmVhbGx5IG1vdmUKPiA+IGF3YXkgZnJvbSB0aGUgQ1BVIGNs
dXN0ZXIgbm90aWZpZXJzLiBTZWUgbW9yZSBpbmZvcm1hdGlvbiBiZWxvdy4KPiA+Cj4gPiA+IC0t
LQo+ID4gPiAgZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMgfCAyNCArKysrKysr
KysrKysrKysrKysrKysrLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcHVpZGxl
L2NwdWlkbGUtcmlzY3Ytc2JpLmMgYi9kcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1yaXNjdi1zYmku
Ywo+ID4gPiBpbmRleCBlODA5NGZjOTI0OTEuLjI5OGRjNzZhMDBjZiAxMDA2NDQKPiA+ID4gLS0t
IGEvZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMKPiA+ID4gKysrIGIvZHJpdmVy
cy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMKPiA+ID4gQEAgLTM5NCw2ICszOTQsNyBAQCBz
dGF0aWMgaW50IHNiaV9jcHVpZGxlX3BkX3Bvd2VyX29mZihzdHJ1Y3QgZ2VuZXJpY19wbV9kb21h
aW4gKnBkKQo+ID4gPiAgewo+ID4gPiAgICAgICAgIHN0cnVjdCBnZW5wZF9wb3dlcl9zdGF0ZSAq
c3RhdGUgPSAmcGQtPnN0YXRlc1twZC0+c3RhdGVfaWR4XTsKPiA+ID4gICAgICAgICB1MzIgKnBk
X3N0YXRlOwo+ID4gPiArICAgICAgIGludCByZXQ7Cj4gPiA+Cj4gPiA+ICAgICAgICAgaWYgKCFz
dGF0ZS0+ZGF0YSkKPiA+ID4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+ID4gPiBAQCAtNDAx
LDYgKzQwMiwxMCBAQCBzdGF0aWMgaW50IHNiaV9jcHVpZGxlX3BkX3Bvd2VyX29mZihzdHJ1Y3Qg
Z2VuZXJpY19wbV9kb21haW4gKnBkKQo+ID4gPiAgICAgICAgIGlmICghc2JpX2NwdWlkbGVfcGRf
YWxsb3dfZG9tYWluX3N0YXRlKQo+ID4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FQlVTWTsK
PiA+ID4KPiA+ID4gKyAgICAgICByZXQgPSBjcHVfY2x1c3Rlcl9wbV9lbnRlcigpOwo+ID4gPiAr
ICAgICAgIGlmIChyZXQpCj4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4KPiA+
IFJhdGhlciB0aGFuIHVzaW5nIHRoZSBDUFUgY2x1c3RlciBub3RpZmllcnMsIGNvbnN1bWVycyBv
ZiB0aGUgZ2VucGQKPiA+IGNhbiByZWdpc3RlciB0aGVtc2VsdmVzIHRvIHJlY2VpdmUgZ2VucGQg
b24vb2ZmIG5vdGlmaWVycy4KPiA+Cj4gPiBJbiBvdGhlciB3b3Jkcywgbm9uZSBvZiB0aGlzIHNo
b3VsZCBiZSBuZWVkZWQsIHJpZ2h0Pwo+ID4KPiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjayEKPiBN
YXliZSBJIG1pc3Mgc29tZXRoaW5nLCBJJ20gd29uZGVyaW5nIGFib3V0IGEgY2FzZSBsaWtlIGJl
bG93Ogo+IElmIHdlIGhhdmUgYSBzaGFyZWQgTDIgY2FjaGUgY29udHJvbGxlciBpbnNpZGUgdGhl
IGNwdSBjbHVzdGVyIHBvd2VyCj4gZG9tYWluIGFuZCB3ZSBhZGQgdGhpcyBjb250cm9sbGVyIHRv
IGJlIGEgY29uc3VtZXIgb2YgdGhlIHBvd2VyCj4gZG9tYWluLCBTaG91bGRuJ3QgdGhlIGdlbnBk
IGludm9rZSB0aGUgZG9tYWluIGlkbGUgb25seSBhZnRlciB0aGUKPiBzaGFyZWQgTDIgY2FjaGUg
Y29udHJvbGxlciBpcyBzdXNwZW5kZWQ/Cj4gSXMgdGhlcmUgYSB3YXkgdGhhdCB3ZSBjYW4gcHV0
IHRoZSBMMiBjYWNoZSBkb3duIHdoaWxlIGFsbCBjcHVzIGluIHRoZQo+IHNhbWUgY2x1c3RlciBh
cmUgaWRsZT8KPiA+IFsuLi5dClNvcnJ5LCBJIG1hZGUgc29tZSBtaXN0YWtlIGluIG15IHNlY29u
ZCBxdWVzdGlvbi4KVXBkYXRlIHRoZSBxdWVzdGlvbiBoZXJlOgpJcyB0aGVyZSBhIHdheSB0aGF0
IHdlIGNhbiBzYXZlIHRoZSBMMiBjYWNoZSBzdGF0ZXMgd2hpbGUgYWxsIGNwdXMgaW4gdGhlCnNh
bWUgY2x1c3RlciBhcmUgaWRsZSBhbmQgdGhlIGNsdXN0ZXIgY291bGQgYmUgcG93ZXJlZCBkb3du
Pwo+ID4KPiA+IEtpbmQgcmVnYXJkcwo+ID4gVWZmZQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
