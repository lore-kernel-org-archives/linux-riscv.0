Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CB4C71153
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 07:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H2rqgcLsyBal0J/CslabA7SzBq5tZ7VoxSnCYjWW51U=; b=MRWSC1K8bb7nzl
	lVe5m+sQ8FR15aL9Fxse8YeI3oPi7ktg3TQRHe2MZHDjcZ5tDSfpv0qt1EyievC2mxrNgjY3gW1si
	ljfv9onRLVsQP6UwxcLqfI9zWl5fft7pVRuPjjdP56SuvrZn6aUxaYfmZYB52ddUXuUc12+/0l16e
	Zjox34auGyhuubRtW7p7yEvlYvKJzqem5WhYv2mti/Hps8rG3k7rwcqZhcwgmLdLPKa46KJhHvivG
	vZpUHH4B4V5sX8cIVOdtWi7zBYSgqlgGvhOt3KbBH/QfQ7WxNFB5y+Yhbp1Vwwpm8SOYsOwggNlsX
	ASM68/7FJ6FscWx1fDSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaWdd-0093I2-2H;
	Mon, 28 Aug 2023 07:26:17 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaWda-0093H3-2y
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 07:26:16 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-565f2567422so1697208eaf.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Aug 2023 00:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1693207572; x=1693812372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vleBfG73dh7bJwkNGyPr2b1/w7KVwTHRq/QGiLU/Y8k=;
        b=BrS/MIx6hYHBxl3MR0MS1/1C9jNXuyp+akURuy08kzv7rNnKxhNker1ZHQPsuSkdjM
         RbmOZUkjDvB96rbJyiQ9tud5WUP7AOxzdzt1oZYuxeyfRADhIKuxRyhZibu/nCRkI5Lx
         HV3qFOn/b94kBdbcHSfM+IDbn4O+0Fp1NVvRrMqzSh9jFNsdBH4GOHH/K8F85DHNXBhM
         cr/8i9mx/2RR7Jh8bqRb9de4J9brOrpdh/Tycs6tFmwPyqh8bWU5p1Rat+Ax8jbwbCEk
         Y6k4z7nzhJtNUKcrmT4sMe0tCsdx6tyDgIKuXtyRpdf3d+aTnRXGKPTbfpE76K6xv/e8
         2/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693207572; x=1693812372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vleBfG73dh7bJwkNGyPr2b1/w7KVwTHRq/QGiLU/Y8k=;
        b=mEdNPHDCEK77ylblFv9RRzwBtMgFGmKkTKTJVWEXhVCljMCyApSwR8dPujsfzHseJu
         nr9bZyIzdgvOlSUvlpEuQ85gzeeE+rKNQRvno5Gs2it3DTQL2L+6ZTcg8LICa87Ml3TQ
         fh3nf3JqYIHzg/oI32l4CkE2cyoOeqfw1ZuLkUv8FrD9jj7h/4mb5d+9VNfzMjGxz+e7
         B4WIBENpKIMD5TbjnQ4vfsY6nYpyTZuXPTA0z9olYjsst4fASXteoivd7BR0rUJlbfqe
         hP2uCxOlRF8bFrPnrwTmAWzWwT3Kn3x4i6iNK0Hz2Fq6hx70NORpkKo5C9+1dL8o83kE
         4Rfw==
X-Gm-Message-State: AOJu0YwG0V0l2K56Jb05gf19ZFj1glHbsKqpSkXbfN3jNJ1IoTgkuOLK
	qdeBqZI2uVO9lbDQzl1D0dQkfJpEBHbTF2674JvXnw==
X-Google-Smtp-Source: AGHT+IGYCw0s4XqRr6eH3dESRTk9/xreZOsRixT90RR4vh26isG1q3NHV4KAVoSKfpKkBfOhgL4w51UACc7StJ2QpMA=
X-Received: by 2002:a4a:6211:0:b0:56e:4921:deb0 with SMTP id
 x17-20020a4a6211000000b0056e4921deb0mr9998569ooc.8.1693207572126; Mon, 28 Aug
 2023 00:26:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230129064956.143664-1-tjytimi@163.com> <CAMWQL2gBj84qhBopi=YKmHaUose2ggALKtOWqb6adDiuvS5xcg@mail.gmail.com>
 <6dcfcf22-08a4-ba1f-17c2-75f93efb6329@ghiti.fr>
In-Reply-To: <6dcfcf22-08a4-ba1f-17c2-75f93efb6329@ghiti.fr>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Mon, 28 Aug 2023 15:26:01 +0800
Message-ID: <CAMWQL2h3OTeiV=P+LOp2FwJsc8SKTUH1gi3gYTGDdhP+KNQpdw@mail.gmail.com>
Subject: Re: [PATCH v1] riscv: support arch_has_hw_pte_young()
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Jinyu Tang <tjytimi@163.com>, palmer@rivosinc.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, yuzhao@google.com, conor.dooley@microchip.com, 
	ajones@ventanamicro.com, guoren@kernel.org, tongtiangen@huawei.com, 
	anup@brainfault.org, akpm@linux-foundation.org, falcon@tinylab.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Greentime Hu <greentime.hu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_002614_989508_C34EA6BD 
X-CRM114-Status: GOOD (  29.62  )
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

SGkgQWxleCwKCk9uIFNhdCwgQXVnIDI2LCAyMDIzIGF0IDM6MznigK9BTSBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhAZ2hpdGkuZnI+IHdyb3RlOgo+Cj4gSGkgWW9uZy1YdWFuLAo+Cj4KPiBPbiAyNS8w
OC8yMDIzIDA3OjQyLCBZb25nLVh1YW4gV2FuZyB3cm90ZToKPiA+IEhpIEppbnl1LAo+ID4KPiA+
IEl0IHNlZW1zIGxpa2UgaXQgaGFzIGJlZW4gYSB3aGlsZSBzaW5jZSB0aGUgbGFzdCByZWxlYXNl
IG9mIHRoaXMgcGF0Y2guIERvCj4gPiB5b3UgaGF2ZSBhbnkgcGxhbnMgZm9yIHRoZSBwYXRjaCBy
ZWNlbnRseT8gT3IsIGRvIHlvdSBtaW5kIHNoYXJpbmcgYW55Cj4gPiBpbnRlcm5hbCBwcm9ncmVz
cyBvbiB0aGUgcGF0Y2g/Cj4gPgo+ID4gV2UgYXJlIHN0YXJ0aW5nIHRvIHdvcmsgb24gdGhlIFN2
YWR1IGV4dGVuc2lvbiBvZiBwdGUgQS9EIGJpdCBmZWF0dXJlIG9uCj4gPiBMaW51eC4KPgo+Cj4g
VGhpcyB0YXNrIHdhcyBhc3NpZ25lZCB0byBtZSBvbiB0aGUgUklTRSBrZXJuZWwgc3ByZWFkc2hl
ZXQsIGlmIHlvdQo+IGluZGVlZCB0YWtlIG92ZXIsIEknbGwgY2hhbmdlIGl0IHRvIHlvdXIgbmFt
ZTogYW55IG9iamVjdGlvbj8KPgo+CgpZZXMsIHRoYXQncyBmaW5lIHdpdGggbWUuIFRoYW5rIHlv
dSEKClJlZ2FyZHMsCllvbmctWHVhbgoKPiBUaGFua3MsCj4KPgo+IEFsZXgKPgo+Cj4gPiBEbyB5
b3UgZmluZCBhbnkgcGxhY2VzIHdoZXJlIHdlIG1heSBwb3RlbnRpYWxseSB3b3JrIHRvZ2V0aGVy
IHRvCj4gPiBnZXQgdGhpbmdzIG1vdmluZz8gQWxzbywgSSBhbSB3aWxsaW5nIHRvIGJhc2Ugb24g
dG9wIG9mIHlvdXIgd29yayBhbmQKPiA+IGNvbnRpbnVlIHNlbmRpbmcgdGhlIHNlcmllcyAoYnkg
a2VlcGluZyBhbGwgdGhlIGNyZWRpdHMgZnJvbSB0aGUgb3JpZ2luYWwKPiA+IHdvcmspCj4gPgo+
ID4gUGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSBoYXZlIGFueSB0aG91Z2h0cywgdGhhbmtzIDop
Cj4gPgo+ID4gUmVnYXJkcywKPiA+IFlvbmctWHVhbgo+ID4KPiA+IE9uIFN1biwgSmFuIDI5LCAy
MDIzIGF0IDI6NTPigK9QTSBKaW55dSBUYW5nIDx0anl0aW1pQDE2My5jb20+IHdyb3RlOgo+ID4+
IFRoZSBhcmNoX2hhc19od19wdGVfeW91bmcoKSBpcyBmYWxzZSBmb3IgcmlzY3YgYnkgZGVmYXVs
dC4gSWYgaXQncwo+ID4+IGZhbHNlLCBwYWdlIHRhYmxlIHdhbGsgaXMgYWxtb3N0IHNraXBwZWQg
Zm9yIE1HTFJVIHJlY2xhaW0uIEFuZCBpdAo+ID4+IHdpbGwgYWxzbyBjYXVzZSB1c2VsZXNzIHN0
ZXAgaW4gX193cF9wYWdlX2NvcHlfdXNlcigpLgo+ID4+Cj4gPj4gUklTQy1WIFByaXZpbGVnZWQg
Qm9vayBzYXlzIHRoYXQgcmlzY3YgaGF2ZSB0d28gc2NoZW1lcyB0byBtYW5hZ2UgQQo+ID4+IGFu
ZCBEIGJpdC4KPiA+Pgo+ID4+IFNvIGFkZCBhIGNvbmZpZyBmb3Igc2VsZWN0aW5nLCB0aGUgZGVm
YXVsdCBpcyB0cnVlLiBGb3Igc2ltcGxlCj4gPj4gaW1wbGVtZW50YXRpb24gcmlzY3YgQ1BVIHdo
aWNoIGp1c3QgZ2VuZXJhdGUgcGFnZSBmYXVsdCwgdW5zZWxlY3QgaXQuCj4gPj4KPiA+PiBTaWdu
ZWQtb2ZmLWJ5OiBKaW55dSBUYW5nIDx0anl0aW1pQDE2My5jb20+Cj4gPj4gLS0tCj4gPj4gICBh
cmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICB8IDEwICsrKysrKysrKysKPiA+PiAgIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgIDcgKysrKysrKwo+ID4+ICAgMiBmaWxl
cyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPj4gaW5kZXggZTJiNjU2MDQzYWJm
Li4xN2M4Mjg4NTU0OWMgMTAwNjQ0Cj4gPj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gPj4g
KysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPj4gQEAgLTE4MCw2ICsxODAsMTYgQEAgY29uZmln
IFBBR0VfT0ZGU0VUCj4gPj4gICAgICAgICAgZGVmYXVsdCAweDgwMDAwMDAwIGlmIDY0QklUICYm
ICFNTVUKPiA+PiAgICAgICAgICBkZWZhdWx0IDB4ZmY2MDAwMDAwMDAwMDAwMCBpZiA2NEJJVAo+
ID4+Cj4gPj4gK2NvbmZpZyBBUkNIX0hBU19IQVJEV0FSRV9QVEVfWU9VTkcKPiA+PiArICAgICAg
IGJvb2wgIkhhcmR3YXJlIFNldCBQVEUgQWNjZXNzIEJpdCIKPiA+PiArICAgICAgIGRlZmF1bHQg
eQo+ID4+ICsgICAgICAgaGVscAo+ID4+ICsgICAgICAgICBTZWxlY3QgaWYgaGFyZHdhcmUgc2V0
IEEgYml0IHdoZW4gUFRFIGlzIGFjY2Vzc2VkLiBUaGUgZGVmYXVsdCBpcwo+ID4+ICsgICAgICAg
ICAnWScsIGJlY2F1c2UgbW9zdCBSSVNDLVYgQ1BVIGhhcmR3YXJlIGNhbiBtYW5hZ2UgQSBhbmQg
RCBiaXQuCj4gPj4gKyAgICAgICAgIEJ1dCBSSVNDLVYgbWF5IGhhdmUgc2ltcGxlIGltcGxlbWVu
dGF0aW9uIHRoYXQgZG8gbm90IHN1cHBvcnQKPiA+PiArICAgICAgICAgaGFyZHdhcmUgc2V0IEEg
Yml0IGJ1dCBvbmx5IGdlbmVyYXRlIHBhZ2UgZmF1bHQsIGZvciB0aGF0IGNhc2UganVzdAo+ID4+
ICsgICAgICAgICB1bnNlbGVjdCBpdC4KPiA+PiArCj4gPj4gICBjb25maWcgS0FTQU5fU0hBRE9X
X09GRlNFVAo+ID4+ICAgICAgICAgIGhleAo+ID4+ICAgICAgICAgIGRlcGVuZHMgb24gS0FTQU5f
R0VORVJJQwo+ID4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUu
aCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPj4gaW5kZXggNGViYTlhOThk
MGUzLi4xZGI1NGFiNGUxYmEgMTAwNjQ0Cj4gPj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wZ3RhYmxlLmgKPiA+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+
ID4+IEBAIC01MzIsNiArNTMyLDEzIEBAIHN0YXRpYyBpbmxpbmUgaW50IHB0ZXBfY2xlYXJfZmx1
c2hfeW91bmcoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4gPj4gICAgICAgICAgICovCj4g
Pj4gICAgICAgICAgcmV0dXJuIHB0ZXBfdGVzdF9hbmRfY2xlYXJfeW91bmcodm1hLCBhZGRyZXNz
LCBwdGVwKTsKPiA+PiAgIH0KPiA+PiArI2lmZGVmIENPTkZJR19BUkNIX0hBU19IQVJEV0FSRV9Q
VEVfWU9VTkcKPiA+PiArI2RlZmluZSBhcmNoX2hhc19od19wdGVfeW91bmcgYXJjaF9oYXNfaHdf
cHRlX3lvdW5nCj4gPj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBhcmNoX2hhc19od19wdGVfeW91bmco
dm9pZCkKPiA+PiArewo+ID4+ICsgICAgICAgcmV0dXJuIHRydWU7Cj4gPj4gK30KPiA+PiArI2Vu
ZGlmCj4gPj4KPiA+PiAgICNkZWZpbmUgcGdwcm90X25vbmNhY2hlZCBwZ3Byb3Rfbm9uY2FjaGVk
Cj4gPj4gICBzdGF0aWMgaW5saW5lIHBncHJvdF90IHBncHJvdF9ub25jYWNoZWQocGdwcm90X3Qg
X3Byb3QpCj4gPj4gLS0KPiA+PiAyLjMwLjIKPiA+Pgo+ID4+Cj4gPj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+PiBsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKPiA+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPj4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+ID4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdAo+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
