Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89D7C636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 14:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PY/c8qjCbENr3/d5RDWGPjG2iRKDiF0QaFnjKW12fa0=; b=m1I7G2BrGp5jwe
	e2bh/HUKUmbSmFijTA+Qqev4cTNpRxt5q7x096rcO+ERZRmFq12xrklbKKQQEO04inotw4jfmOhFe
	gED6uMzoIUW7aBGRwL7Dx7voPo9LP5hmt4JFSW2USrvFq7s4fFqwn3cIKTePhlm8qzwZwza9s8qUR
	2/yFVRSfPPPRl9gpKd2AG9zA8BAYTbhl6NMhoBEJ62XBMDgY4kK/+v20LygGC9pIWk+4musvJ3t3z
	h9JN6lF/q1Rj9trpNyn6ZGK14fwunoGcEA0LIVHlg3LbHzmuGDtB5jCgEqX270/eYzFBxGH/pzXWy
	MntcQgC2uMnV+7XBIOJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSIwq-006EjG-Vw; Wed, 15 Feb 2023 14:39:53 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSIwn-006EhD-Vz
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 14:39:51 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-530b85f118cso48729237b3.9
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 06:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWoLS1pI97YxZKfXgrwt/VC4vanGmb3d/NBmdfDh1ow=;
        b=VC6zCtyX8kxZEEUTT16T9v99GNa+CfGmhXQjrezGx6UTiHwTZQnGYmPlasZgrW6oRG
         2nSvbwo5kW3+iXP8HeFUwBXcBjKeArOdJsIhDW5UUIpk6h6cpkPKbAGvRPpKKq8QAQZr
         EaXt1jW1O+yABnFlL1MHKGZAeKNczhMxkDaaGIaAYQsAdmE2Xl/riBgb82L5HGz5Clfa
         6KtbmAHyhPrvZyXlD+BhAjNWlk+dChIfpMx+41VeDFsWLoQPb2KZ6q2cnu/E8eIQn3cQ
         SoBiEvdxXz2E2eoqSwCpkc4cG2Ff6hSflif0rBKr9QuRg8gmWHCCV7m7H/EC61nxJSz4
         Ah8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWoLS1pI97YxZKfXgrwt/VC4vanGmb3d/NBmdfDh1ow=;
        b=EPUMXzv0HbZ34uez7j1QNKeD8wWXLtHOkLzWexbjLTr23NRQaCxr9J6iaF5gSOTt4Z
         oGYrGsCHMF4zoyrwiaHiqeX2dtv5sjbhDWi+btJJBcielnFN8Ym2oEWzXasGViK6pc0g
         52CJt22D/iqSlIImY6GEHxvdgG/MgzQ7s1eVVM5uxmByQrfri9dj8wkaB2xvh/ydVkFz
         TqntJ4JNKIRcn9ixFqWufSs5SP501o3fHzmi9TqOFIQOtWKmriNREgnzmrXi06g87uub
         MY8xi2ZBUphrzHqsqZ4dvDZLQMU2BBGdb4wUocmhUnVxVLuf3zFbke8gjmvrpBFGM/Tk
         0/hA==
X-Gm-Message-State: AO0yUKVXjiZH7kMNiVO2bvtKnHngD5B9+Psz7FMAyB3AFFAyUkn0iowC
	RXYSEKAw2Lx8wX3CIAexN+bp3kf3TtFZkZ/WC+iUDw==
X-Google-Smtp-Source: AK7set+JXbsP1u5cYEi/qjZNhwhCQctaYSX2quajc43/BMVwFTwmT2/68eZ1p6XW8PNm0zfgKPfEOayUfS9yaFYFcEo=
X-Received: by 2002:a25:9983:0:b0:88f:946:bd98 with SMTP id
 p3-20020a259983000000b0088f0946bd98mr231855ybo.24.1676471987585; Wed, 15 Feb
 2023 06:39:47 -0800 (PST)
MIME-Version: 1.0
References: <20230125142056.18356-1-andy.chiu@sifive.com> <20230125142056.18356-11-andy.chiu@sifive.com>
 <875ycdy22c.fsf@all.your.base.are.belong.to.us> <82551518-7b7e-8ac9-7325-5d99d3be0406@rivosinc.com>
 <87sff8ags6.fsf@all.your.base.are.belong.to.us> <CABgGipXSsqgtTx9bCy-gt7CTBkXN--t1wHgLfCxA3=vs6y+qUw@mail.gmail.com>
 <873578faxg.fsf@all.your.base.are.belong.to.us> <5e440cfa-27c5-f216-5529-350ac19c07ff@rivosinc.com>
 <87wn4jjt8f.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87wn4jjt8f.fsf@all.your.base.are.belong.to.us>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 15 Feb 2023 22:39:36 +0800
Message-ID: <CABgGipVvDXdeEfaUivevQJ+dphayPbFh0X3TNCKhHCyFZakZ1Q@mail.gmail.com>
Subject: Re: [PATCH -next v13 10/19] riscv: Allocate user's vector context in
 the first-use trap
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Vineet Gupta <vineetg@rivosinc.com>, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, greentime.hu@sifive.com, 
	guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Andrew Jones <ajones@ventanamicro.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Vincent Chen <vincent.chen@sifive.com>, Guo Ren <guoren@kernel.org>, 
	Li Zhengyu <lizhengyu3@huawei.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_063950_037949_E8BE4E1A 
X-CRM114-Status: GOOD (  33.90  )
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

T24gV2VkLCBGZWIgMTUsIDIwMjMgYXQgMzoxNCBQTSBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IFZpbmVldCBHdXB0YSA8dmluZWV0Z0ByaXZvc2luYy5jb20+IHdy
aXRlczoKPgo+ID4gT24gMi8xNC8yMyAwODo1MCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiA+PiBB
bmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPiB3cml0ZXM6Cj4gPj4KPiA+Pj4gSGV5IEJq
w7ZybiwKPiA+Pj4KPiA+Pj4gT24gVHVlLCBGZWIgMTQsIDIwMjMgYXQgMjo0MyBQTSBCasO2cm4g
VMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Pj4+IFNvLCB0d28gY2hhbmdlczoK
PiA+Pj4+Cj4gPj4+PiAxLiBEaXNhbGxvdyBWLWVuYWJsZW1lbnQgaWYgdGhlIGV4aXN0aW5nIGFs
dHN0YWNrIGRvZXMgbm90IGZpdCBhIFYtc2l6ZWQKPiA+Pj4+ICAgICBmcmFtZS4KPiA+Pj4gVGhp
cyBjb3VsZCBwb3RlbnRpYWxseSBicmVhayBvbGQgcHJvZ3JhbXMgKG5vbi1WKSB0aGF0IGxvYWQg
bmV3IHN5c3RlbQo+ID4+PiBsaWJyYXJpZXMgKHdpdGggViksIElmIHRoZSBwcm9ncmFtIHNldHMg
YSBzbWFsbCBhbHQgc3RhY2sgYW5kIHRha2VzCj4gPj4+IHRoZSBmYXVsdCBpbiBzb21lIGxpYnJh
cmllcyB0aGF0IHVzZSBWLiBIb3dldmVyLCBleGlzdGluZwo+ID4+PiBpbXBsZW1lbnRhdGlvbiB3
aWxsIGFsc28ga2lsbCB0aGUgcHJvY2VzcyB3aGVuIHRoZSBzaWduYWwgYXJyaXZlcywKPiA+Pj4g
ZmluZGluZyBpbnN1ZmZpY2llbnQgc3RhY2sgZnJhbWUgaW4gc3VjaCBjYXNlcy4gSSdkIGNob29z
ZSB0aGUgc2Vjb25kCj4gPj4+IG9uZSBpZiB3ZSBvbmx5IGhhdmUgdGhlc2UgdHdvIG9wdGlvbnMs
IGJlY2F1c2UgdGhlcmUgaXMgYSBjaGFuY2UgdGhhdAo+ID4+PiB0aGUgc2lnbmFsIGhhbmRsZXIg
bWF5IG5vdCBldmVuIHJ1bi4KPiA+PiBJIHRoaW5rIHdlIG1pZ2h0IGhhdmUgZGlmZmVyZW50IHZp
ZXdzIGhlcmUuIEEgcHJvY2VzcyBoYXMgYSBwcmUtViwgYSBhbmQKPiA+PiBwb3N0LVYgc3RhdGUu
IElzIGFsbG93aW5nIGEgcHJvY2VzcyB0byBlbnRlciBWIHdpdGhvdXQgdGhlIGNvcnJlY3QKPiA+
PiBwcmVjb25kaXRpb25zIGEgZ29vZCBpZGVhPyBBbGxvdyB0byBydW4gd2l0aCBWIHR1cm5lZCBv
biwgYnV0IG5vdCBhYmxlCj4gPj4gdG8gY29ycmVjdGx5IGhhbmRsZSBhIHNpZ25hbCAodGhlIHN0
YWNrIGlzIHRvbyBzbWFsbCk/Cj4gPgo+ID4gVGhlIHJlcXVpcmVtZW50IGlzIHNhbmUsIGJ1dCB0
aGUgaXNzdWUgaXMgdXNlciBleHBlcmllbmNlOiBVc2VyIHRyeWluZwo+ID4gdG8gYnJpbmcgdXAg
c29tZSBWIGNvZGUgaGFzIG5vIGNsdWUgdGhhdCBkZWVwIGluIHNvbWUgc3RhcnR1cCBjb2RlIHNv
bWUKPiA+IGFsdCBzdGFjayBoYWQgYmVlbiBzZXR1cCBhbmQgY2F1c2luZyBoaXMgcHJvY2VzcyB0
byBiZSB0ZXJtaW5hdGVkIG9uCj4gPiBmaXJzdCBWIGNvZGUuCj4gPgo+ID4+Cj4gPj4gVGhpcyB3
YXMgdGhlIHNhbWUgYXJndW1lbnQgdGhhdCB0aGUgSW50ZWwgZm9sa3MgaGFkIHdoZW4gZW5hYmxp
bmcKPiA+PiBBTVguIFN1cmUsIEFNWCByZXF1aXJlcyAqZXhwbGljaXQqIGVuYWJsZW1lbnQsIGJ1
dCBzYW1lIHJ1bGVzIHNob3VsZAo+ID4+IGFwcGx5LCBubz8KPiA+Pgo+ID4+Pj4gMi4gU2FuaXRp
emUgYWx0c3RhY2sgY2hhbmdlcyB3aGVuIFYgaXMgZW5hYmxlZC4KPiA+Pj4gWWVzLCBJJ2QgbGlr
ZSB0byBoYXZlIHRoaXMuIEJ1dCBpdCBtYXkgYmUgdHJpY2t5IHdoZW4gaXQgY29tZXMgdG8KPiA+
Pj4gZGVjaWRpbmcgd2hldGhlciBWIGlzIGVuYWJsZWQsIGR1ZSB0byB0aGUgZmlyc3QtdXNlIHRy
YXAuIElmIFYgaXMKPiA+Pj4gY29tbW9ubHkgdXNlZCBpbiBzeXN0ZW0gbGlicmFyaWVzIHRoZW4g
aXQgaXMgbGlrZWx5IHRoYXQgViB3aWxsIGJlCj4gPj4+IGVuYWJsZWQgYmVmb3JlIGFuIHVzZXIg
c2V0IGFuIGFsdHN0YWNrLiBTYW5pdGl6aW5nIHRoaXMgY2FzZSB3b3VsZCBiZQo+ID4+PiBlYXN5
IGFuZCBzdHJhaWdodGZvcndhcmQuCj4gPgo+ID4gR29vZC4gTGV0cyBoYXZlIHRoaXMgaW4gdjE0
IGFzIGl0IHNlZW1zIHJlYXNvbmFibHkgZWFzeSB0byBpbXBsZW1lbnQuCj4gPgo+ID4+PiBCdXQg
d2hhdCBpZiB0aGUgdXNlciBzZXRzIGFuIGFsdHN0YWNrIGJlZm9yZQo+ID4+PiBlbmFibGluZyBW
IGluIHRoZSBmaXJzdC11c2UgdHJhcD8gVGhpcyBjb3VsZCBoYXBwZW4gb24gYSBzdGF0aWNhbGx5
Cj4gPj4+IHByb2dyYW0gdGhhdCBoYXMgaGFuZC13cml0dGVuIFYgcm91dGluZXMuIFRoaXMgdGFr
ZXMgdXMgdG8gdGhlIDFzdAo+ID4+PiBxdWVzdGlvbiBhYm92ZSwgc2hvdWxkIHdlIGZhaWwgdGhl
IHVzZXIgcHJvZ3JhbSBpbW1lZGlhdGVseSBpZiB0aGUKPiA+Pj4gYWx0c3RhY2sgaXMgc2V0IHRv
byBzbWFsbD8KPiA+Cj4gPiBQbGVhc2UgbGV0cyBub3QgY3Jvc3MgdGhyZWFkcy4gV2UgZGlzY3Vz
c2VkIHRoaXMgYWxyZWFkeSBhdCB0b3AuIFdoaWxlCj4gPiBpZGVhbGx5IHJlcXVpcmVkLCBzZWVt
cyB0cmlja3kgc28gbGV0cyBzdGFydCB3aXRoIHBvc3QtViBhbHQgc3RhY2sgY2hlY2suCj4gPgo+
ID4+IEZvciBtZSBpdCdzIG9idmlvdXMgdG8gZmFpbCAoYWx3YXlzKSAiaWYgdGhlIGFsdHN0YWNr
IGlzIHRvbyBzbWFsbCB0bwo+ID4+IGVuYWJsZSBWIiwgYmVjYXVzZSBpdCBhbGxvd3MgdG8gZXhl
Y3V0ZSBWIHdpdGhvdXQgcHJvcGVyIHByZWNvbmRpdGlvbnMuCj4gPj4KPiA+PiBQZXJzb25hbGx5
LCBJIHByZWZlciBhIHN0cmljdGVyIG1vZGVsLiBPbmx5IGVudGVyIFYgaWYgeW91IGNhbiwgYW5k
Cj4gPj4gYWZ0ZXIgZW50ZXJpbmcgaXQgZGlzYWxsb3cgY2hhbmdpbmcgdGhlIGFsdHN0YWNrLgo+
ID4+Cj4gPj4gVGhlbiBhZ2FpbiwgdGhpcyBpcyAqbXkqIG9waW5pb24gYW5kIGNvbmNlcm4uIFdo
YXQgZG8gb3RoZXIgcGVvcGxlCj4gPj4gdGhpbms/IEkgZG9uJ3Qgd2FudCB0byBzdGFsbCB0aGUg
c2VyaWVzLgo+ID4KPiA+IEkgY29uY3VyIHRoYXQgdGhlIGFsdCBzdGFjayBjaGVja2luZyByZXF1
aXJlbWVudHMgYXJlIHNlbnNpYmxlIGluIHRoZQo+ID4gbG9uZyBydW4uIFdlIGNhbiBhZGQgdGhl
IG9idmlvdXMgY2hlY2sgZm9yIHBvc3QtViBjYXNlIGFuZCBzZWUgaWYgdGhlcmUKPiA+IGlzIGEg
c2FuZSB3YXkgdG8gZmxhZyBwcmUtViBjYXNlIHRvLgo+Cj4gUmVhc29uYWJsZS4gQEFuZHkgZG9l
cyB0aGlzIHJlc29uYXRlIHdpdGggeW91IGFzIHdlbGw/ClllcywgaXQgbWFrZXMgc2Vuc2UgdG8g
bWUuIEkgYW0gbWFraW5nIHRoaXMgaGFwcGVuIG9uIHYxNCA6KQoKVGhhbmtzLApBbmR5CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
