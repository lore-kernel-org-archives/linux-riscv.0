Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED57E7D27C
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 10:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9oP55hlSYAmEQ3eZ/6v2CjBPHvbW/bkQw27JVPBaMc8=; b=VF0+sWBnJ625zQ
	OgscsYhlE2bbezGuEjakBZHZC0gLW3wkUjWKt6WvMFtFonJ+8YwQGL4jxXBf2x/WBxJ2tRYHuyBSx
	21sW5WcbQoE+HZutej3sZUoRTN4C19V7hQclco9ShPrJwknsTbbzYg6fSqFofTAHxK1CCcCYAlAHp
	GTm2W3OmP+nidNlQpMGX9/6Yd3/ae28jcigEN5cRRp7OFDFqaBiNjIurtlnTzzsiClWoFekvljfra
	IJQ6uksk5RzVLu8/hTrozCgj2rR2tBUe5uDuOoXHRLPCNWk7ZwTA1GPwa7tCVPKHHkobffJaNT1aj
	LUGhLAZsPr3MILnzfy8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql5Qv-00G7HX-3C;
	Tue, 26 Sep 2023 10:36:49 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql5Qs-00G7Du-0S
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 10:36:47 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-692779f583fso5651005b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Sep 2023 03:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695724604; x=1696329404; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rx4sePY/rSBccbkTwzXRYI99umtH2PVsvZS0TGK67Q=;
        b=O5WAxXY5YMU/cZK3mBlizEQ3Ukc9C/daXtMx8aCfDSNN3zYJHWPuXLssiBNGTt1ulg
         +op89tOf/SttbkkdBy8VV9GQyEPWQvo+DQD2KxE7DzxCJQfdBJQ6uU+s5iHqkXWApEpr
         vMpQ82y2K0akprugudOHg88LEX76WOVvEaoOQfk0HS0w+v2kVN1W9yhwNONMh0yMxbsR
         gMpmOtju92Vd6pguoOQpksUWyzbRB7ur1O1Q+ZyZ1NNnd6OJu9Ua861NMYcWtE9Nqn4K
         v505r+C3mg5SGxE8g/NYNBlZw7PmQFuGXl161warp6kItyX7CRO6pzrNJZi6lsqcSQpV
         IfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695724604; x=1696329404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rx4sePY/rSBccbkTwzXRYI99umtH2PVsvZS0TGK67Q=;
        b=NyZmsKlZLCjjNjI557GWzITlFCgiJ3+M8kK4elzA4tza2s6TBIZyLyEFfWXZJVuv2j
         orhGOaQnzlnWyNTKv2Nli4Y1pYdWPkWkjlEUVL6WdOU4M9AkYY2TPffMEKgh0s/rM8fN
         4FD6eRo/lW1hl3iZG/soWovdo4VtfwEMODj3H3laD+l2KZbAW9F0NVqEzfp2qXlgTAQg
         KeHNZEHAJcFFw5FAVAPffb41qLlksZsAWZOgg7aK7jLxuGGP2x5l0tn5a/FrNeAsfAAI
         9+93WvKfmjoMJpLUhdkzkMwDsQ8btTWz8dq3X5iE1YragCP/pxi+ZCMFGSn1cnWKVtaC
         NUXQ==
X-Gm-Message-State: AOJu0YxLsnsY7od5w5TsUEdaHe0O+j/Vj05ynnnlS9kILK0a5olM1ZWQ
	uGmu63NT/g/J8l7OcjqKBlGUHneYX64PkqgVpvglNHnO5DHET7Nr9KDffA==
X-Google-Smtp-Source: AGHT+IHIRi9ZVDlNT1ohN+8nCSAnjQwp3jtFP6KIrnSHcB3eCSMzD8i9SanrNqP/YOG1gVgtwBdM2u2LAbTydBhfjQk=
X-Received: by 2002:a05:6a20:12cd:b0:137:2f8c:fab0 with SMTP id
 v13-20020a056a2012cd00b001372f8cfab0mr8383450pzg.49.1695724603930; Tue, 26
 Sep 2023 03:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230926102801.1591126-1-dunaev@tecon.ru>
In-Reply-To: <20230926102801.1591126-1-dunaev@tecon.ru>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 26 Sep 2023 16:06:31 +0530
Message-ID: <CAK9=C2UiBNQtv0Q2yJMKqc5pMX_jam+ZmfRz3Rme0ZYuqN68HA@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-intc: Mark INTC nodes for secondary CPUs as initialized.
To: Dmitry Dunaev <dunaev@tecon.ru>
Cc: dunaich@mail.ru, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_033646_211300_0E39DBA7 
X-CRM114-Status: GOOD (  24.73  )
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

T24gVHVlLCBTZXAgMjYsIDIwMjMgYXQgMzo1OeKAr1BNIERtaXRyeSBEdW5hZXYgPGR1bmFldkB0
ZWNvbi5ydT4gd3JvdGU6Cj4KPiBUaGUgY3VycmVudCBMaW51eCBkcml2ZXIgaXJxLXJpc2N2LWlu
dGMgaW5pdGlhbGl6ZSBJUlEgZG9tYWluIG9ubHkgb25jZSwKPiB3aGVuIGluaXQgZnVuY3Rpb24g
Y2FsbGVkIG9uIHByaW1hcnkgaGFydC4gSW4gb3RoZXIgY2FzZXMgbm8gSVJRIGRvbWFpbiBpcwo+
IGNyZWF0ZWQgYW5kIG5vIG9wZXJhdGlvbiBvbiBpbnRlcnJ1cHQtY29udHJvbGxlciBub2RlIGlz
IHBlcmZvcm1lZC4KPiBUaGlzIGlzIGNhdXNlIG9mIHRoYXQgbm8gY29tbW9uIExpbnV4IGRyaXZl
ciBjYW4gdXNlIHBlci1jcHUgaW50ZXJydXB0cwo+IG1hcHBlZCB0byBzZXZlcmFsIENQVXMgYmVj
YXVzZSBmd25vZGUgb2Ygc2Vjb25kYXJ5IGNvcmVzIElOVEMgaXMgbm90Cj4gbWFya2VkIGFzIGlu
aXRpYWxpemVkLiBUaGlzIGRldmljZSBpcyBhbHdheXMgd2lsbCBiZSBtYXJrZWQgYXMgZGVmZXJy
ZWQuCj4gRm9yIGV4YW1wbGUgdGhlIHN5c3RlbSB3aXRoIGRldmljZXRyZWUKPgo+ICAgICBjcHUw
OiBjcHVAMCB7Cj4gICAgICAgICBjcHUwX2ludGM6IGludGVycnVwdC1jb250cm9sbGVyIHsKPiAg
ICAgICAgICAgICBpbnRlcnJ1cHQtY29udHJvbGxlcjsKPiAgICAgICAgICAgICBjb21wYXRpYmxl
ID0gcmlzY3YsY3B1LWludGM7Cj4gICAgICAgICB9Owo+ICAgICB9Owo+Cj4gICAgIGNwdTE6IGNw
dUAxIHsKPiAgICAgICAgIGNwdTFfaW50YzogaW50ZXJydXB0LWNvbnRyb2xsZXIgewo+ICAgICAg
ICAgICAgIGludGVycnVwdC1jb250cm9sbGVyOwo+ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSBy
aXNjdixjcHUtaW50YzsKPiAgICAgICAgIH07Cj4gICAgIH07Cj4KPiAgICAgYnVzZXJyIHsKPiAg
ICAgICAgIGNvbXBhdGlibGUgPSByaXNjdixidXNlcnI7Cj4gICAgICAgICBpbnRlcnJ1cHRzLWV4
dGVuZGVkID0gPCZjcHUwX2ludGMgMTYgJmNwdTFfaW50YyAxNj47Cj4gICAgIH07Cj4KPiB3aWxs
IGFsd2F5cyByZXBvcnQgJ2J1c2Vycicgbm9kZSBhcyBkZWZlcnJlZCB3aXRob3V0IGNhbGxpbmcg
YW55Cj4gYnVzIHByb2JlIGZ1bmN0aW9uLgo+Cj4gVGhpcyBwYXRjaCB3aWxsIG1hcmsgYWxsIHNl
Y29uZGFyeSBub2RlcyBwYXNzZWQgdG8gaXJxLXJpc2N2LWludGMKPiBkcml2ZXIgaW5pdCBmdW5j
dGlvbiBhcyBpbml0aWFsaXplZCB0byBiZSBhYmxlIHRvIGFjdCBhcyBjb3JyZWN0Cj4gSVJRIHBo
YW5kbGUgbm9kZS4KPgo+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBEdW5hZXYgPGR1bmFldkB0ZWNv
bi5ydT4KPiAtLS0KPiAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMgfCA4ICsrKysr
Ky0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMgYi9kcml2ZXJz
L2lycWNoaXAvaXJxLXJpc2N2LWludGMuYwo+IGluZGV4IDRhZGVlZTFiYzM5MS4uYzAxYTRlOGQ0
OTgzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jCj4gKysr
IGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMKPiBAQCAtMTU1LDggKzE1NSwxMCBA
QCBzdGF0aWMgaW50IF9faW5pdCByaXNjdl9pbnRjX2luaXQoc3RydWN0IGRldmljZV9ub2RlICpu
b2RlLAo+ICAgICAgICAgICogZm9yIGVhY2ggSU5UQyBEVCBub2RlLiBXZSBvbmx5IG5lZWQgdG8g
ZG8gSU5UQyBpbml0aWFsaXphdGlvbgo+ICAgICAgICAgICogZm9yIHRoZSBJTlRDIERUIG5vZGUg
YmVsb25naW5nIHRvIGJvb3QgQ1BVIChvciBib290IEhBUlQpLgo+ICAgICAgICAgICovCj4gLSAg
ICAgICBpZiAocmlzY3ZfaGFydGlkX3RvX2NwdWlkKGhhcnRpZCkgIT0gc21wX3Byb2Nlc3Nvcl9p
ZCgpKQo+ICsgICAgICAgaWYgKHJpc2N2X2hhcnRpZF90b19jcHVpZChoYXJ0aWQpICE9IHNtcF9w
cm9jZXNzb3JfaWQoKSkgewo+ICsgICAgICAgICAgICAgICBmd25vZGVfZGV2X2luaXRpYWxpemVk
KG9mX25vZGVfdG9fZndub2RlKG5vZGUpLCB0cnVlKTsKClRoZXJlIGlzIGFscmVhZHkgYSBwYXRj
aCBvbiBMS01MIHRvIGFkZHJlc3MgdGhpcy4KaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMv
a2VybmVsL21zZzQ5Mjk4ODYuaHRtbAoKPiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gKyAg
ICAgICB9Cj4KPiAgICAgICAgIHJldHVybiByaXNjdl9pbnRjX2luaXRfY29tbW9uKG9mX25vZGVf
dG9fZndub2RlKG5vZGUpKTsKPiAgfQo+IEBAIC0xNzksOCArMTgxLDEwIEBAIHN0YXRpYyBpbnQg
X19pbml0IHJpc2N2X2ludGNfYWNwaV9pbml0KHVuaW9uIGFjcGlfc3VidGFibGVfaGVhZGVycyAq
aGVhZGVyLAo+ICAgICAgICAgICogZm9yIGVhY2ggSU5UQy4gV2Ugb25seSBkbyBJTlRDIGluaXRp
YWxpemF0aW9uCj4gICAgICAgICAgKiBmb3IgdGhlIElOVEMgYmVsb25naW5nIHRvIHRoZSBib290
IENQVSAob3IgYm9vdCBIQVJUKS4KPiAgICAgICAgICAqLwo+IC0gICAgICAgaWYgKHJpc2N2X2hh
cnRpZF90b19jcHVpZChyaW50Yy0+aGFydF9pZCkgIT0gc21wX3Byb2Nlc3Nvcl9pZCgpKQo+ICsg
ICAgICAgaWYgKHJpc2N2X2hhcnRpZF90b19jcHVpZChyaW50Yy0+aGFydF9pZCkgIT0gc21wX3By
b2Nlc3Nvcl9pZCgpKSB7Cj4gKyAgICAgICAgICAgICAgIGZ3bm9kZV9kZXZfaW5pdGlhbGl6ZWQo
b2Zfbm9kZV90b19md25vZGUobm9kZSksIHRydWUpOwo+ICAgICAgICAgICAgICAgICByZXR1cm4g
MDsKPiArICAgICAgIH0KCldlIGRvbid0IG5lZWQgdGhpcyBjaGFuZ2UgZm9yIEFDUEkgYmVjYXVz
ZSB3ZSBkb24ndCBoYXZlIGRldmxpbmsKZGVwZW5kZW5jeSBiZXR3ZWVuIGRldmljZXMgYW5kIElO
VEMuCgpSZWdhcmRzLApBbnVwCgo+Cj4gICAgICAgICBmbiA9IGlycV9kb21haW5fYWxsb2NfbmFt
ZWRfZndub2RlKCJSSVNDVi1JTlRDIik7Cj4gICAgICAgICBpZiAoIWZuKSB7Cj4gLS0KPiAyLjM0
LjEKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
