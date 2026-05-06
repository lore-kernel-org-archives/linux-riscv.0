Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCFFCD342C
	for <linux-riscv@archiver.kernel.org>; Wed,  6 May 2026 08:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJseDU4b8LqyKUF4lFOR12/RJdaYt4KAR9KAIb2etFY=; b=RyIlAI8TY8E4k8
	VVbJNyZJJf7XVHiFqhQfrlDLT9Iy6nM9D6ZTic9pC2NUbGEVDkS4QEpdXv/8YSJBZOHiQH+s8ZZE8
	CS5oZaM67VSRb3xCudaF2GaVufemTFNuBZWNxgLufAQARYJ6IYp7iQFh6XDpeyw2Oke6jloLn/FsL
	9cbUC0onlvsuaXAvlVWx21KdRdmk8y3StEv9bqZ7t9pTx7Bccd3XCTPdIfKlqxcad9d1r2COVvEk/
	gbInCg0F6XHhdvXJrgPwYFYvGaHW69uZcZ2Ct8m8ayNP5M9kQt5MSimWxAdMRuCzLqgiYIqQoacME
	/Bkr8tyoP0sB3HrybGGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXlU-00000000BWv-39jx;
	Wed, 06 May 2026 08:37:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXlT-00000000BVk-0QOo
	for linux-riscv@lists.infradead.org;
	Wed, 06 May 2026 08:37:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778056672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IMA+C0TJi4LM3UTvwkCroeu4Tv8AgJe8bHK3v1p/l2E=;
	b=OUCtbXAIom0lydhN+lO9z+XtYHlZR6wu9cdq5HmSfK7CnJmXsciTN8Z3v02qLumj4DI2id
	OFfliZaXwRqboOidSL8DG8FSq3zIeVC+zGqsDIcr5AbjoaZn8D+b1L/0E0TUJhM4l78YbY
	/rSWyMCExd/9MblSpzuuY17E1n7ino4=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-nb8oN8NqNYGUbiEpxm-HPA-1; Wed, 06 May 2026 04:37:51 -0400
X-MC-Unique: nb8oN8NqNYGUbiEpxm-HPA-1
X-Mimecast-MFC-AGG-ID: nb8oN8NqNYGUbiEpxm-HPA_1778056670
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7bd5af04312so123044267b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 May 2026 01:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778056670; x=1778661470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IMA+C0TJi4LM3UTvwkCroeu4Tv8AgJe8bHK3v1p/l2E=;
        b=K4WSVdqEjZ5GzLHI/TdVazZg7h32ZXZA1k513h7pJ1G9s9yi9k40IbpQYQcDN+PzA6
         qEAmVV75OCVzT8ZFK235GcT4Tzvyhzgp67c8ITmD+eI85FJUywVFLSUOyZkL5R0VlrA5
         vBXj+z+DBb+mxv73fRkH4n0QO2EAXIsSb3oXtdlT05NZzqUwpQAa1bRSSu4ey59vwTon
         hYHW2CB55gvmCCcTZlGyuQBcZBLazlWqfbgkuO57WScTeSbozPM0yi/p1x2D64t88Y3P
         b0tDMn21F3sedK9B3Rk8x097g3WJko6+o7lgMIqXN1+CnTJsFzovRpWksstiS056XFKr
         vsWA==
X-Forwarded-Encrypted: i=1; AFNElJ8xS2HZiU7CnOIuNqn1PJsivbqJjHnUL1lpDM+XRhwzXTrzl6KMoVOC3yuhs/ZdMYprqLM9Vel/7Wyq8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzINTNqfNorkDcCcixbQdlo0I3q9DcGr9xL18i4PdBRBYKd9SCu
	k5/pxoOagTikiFV9o2oBnYOYuTuikQ2kgSN1mUo/OCz7rW4I4e+TZjLqa94RLtQQTIU434NAoDK
	SH/3rKVqtRw1cF614gkfqVeISLGzz12YSumY6luLJRLLDhZ1x5uYomXtdq4yQNQL6vA8nl7NHbf
	mbfu+3PJUnIy11tYd1oY0wjkh1VibAJMZ3CSISOtxSsBce
X-Gm-Gg: AeBDiet/hBfTL8EPNGvicpPOSpYamz6vP//lK8xgnQtBlO8Phx6UctD1cp/t4tXgJQH
	LtSpQxNvb7RlKO0uSzCnAJ+czT3ATZ59E9OX8H87R+AqpgpeVly2PjvGtMfzzh0lCXwroRWFPmw
	cjQQmiWrXvhSzVtw4thrZ3P6Ws8RicHqhH6sDrYDfdcIRysdgF7vRqnK3aAoq6YVQqp8ZfV/c/8
	3J5enjo7NFdU7qU
X-Received: by 2002:a05:690c:60c3:b0:7bd:696d:5137 with SMTP id 00721157ae682-7bdf5eb872emr28069927b3.41.1778056670483;
        Wed, 06 May 2026 01:37:50 -0700 (PDT)
X-Received: by 2002:a05:690c:60c3:b0:7bd:696d:5137 with SMTP id
 00721157ae682-7bdf5eb872emr28069617b3.41.1778056670063; Wed, 06 May 2026
 01:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260504-kunit_add_support-v8-0-3e5957cdd235@redhat.com>
 <20260504-kunit_add_support-v8-3-3e5957cdd235@redhat.com> <20260504-tentacled-free-lobster-38d8d9@houat>
In-Reply-To: <20260504-tentacled-free-lobster-38d8d9@houat>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 6 May 2026 10:37:39 +0200
X-Gm-Features: AVHnY4LGPM5httthyZYEMeSVpsAZZGIetxyr0Irj5BEH6JEFnHV4PP6tgxL43VM
Message-ID: <CADSE00+TPGWPjD7DGHy5f+=QzwUqYHc=X-G1sEER8=NS5VvV-Q@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] drm: Suppress intentional warning backtraces in
 scaling unit tests
To: Maxime Ripard <mripard@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	peterz@infradead.org, Guenter Roeck <linux@roeck-us.net>, 
	Linux Kernel Functional Testing <lkft@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Alessandro Carminati <acarmina@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sntBtZUASX8Qskt34vIucZwMxLoaH-6SrTR4iNQ8Z80_1778056670
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_013755_222051_963A111F 
X-CRM114-Status: GOOD (  26.80  )
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

T24gTW9uLCBNYXkgNCwgMjAyNiBhdCAxMjowNOKAr1BNIE1heGltZSBSaXBhcmQgPG1yaXBhcmRA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBIaSwKPgo+IE9uIE1vbiwgTWF5IDA0LCAyMDI2IGF0IDA5
OjQxOjI3QU0gKzAyMDAsIEFsYmVydCBFc3RldmUgd3JvdGU6Cj4gPiBGcm9tOiBHdWVudGVyIFJv
ZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+Cj4gPgo+ID4gVGhlIGRybV90ZXN0X3JlY3RfY2FsY19o
c2NhbGUgYW5kIGRybV90ZXN0X3JlY3RfY2FsY192c2NhbGUgdW5pdCB0ZXN0cwo+ID4gaW50ZW50
aW9uYWxseSB0cmlnZ2VyIHdhcm5pbmcgYmFja3RyYWNlcyBieSBwcm92aWRpbmcgYmFkIHBhcmFt
ZXRlcnMgdG8KPiA+IHRoZSB0ZXN0ZWQgZnVuY3Rpb25zLiBXaGF0IGlzIHRlc3RlZCBpcyB0aGUg
cmV0dXJuIHZhbHVlLCBub3QgdGhlIGV4aXN0ZW5jZQo+ID4gb2YgYSB3YXJuaW5nIGJhY2t0cmFj
ZS4gU3VwcHJlc3MgdGhlIGJhY2t0cmFjZXMgdG8gYXZvaWQgY2xvZ2dpbmcgdGhlCj4gPiBrZXJu
ZWwgbG9nIGFuZCBkaXN0cmFjdGlvbiBmcm9tIHJlYWwgcHJvYmxlbXMuCj4gPgo+ID4gVGVzdGVk
LWJ5OiBMaW51eCBLZXJuZWwgRnVuY3Rpb25hbCBUZXN0aW5nIDxsa2Z0QGxpbmFyby5vcmc+Cj4g
PiBBY2tlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3JnPgo+ID4g
QWNrZWQtYnk6IE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+Cj4gPiBDYzogTWFhcnRl
biBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiA+IENjOiBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJv
ZWNrLXVzLm5ldD4KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXNzYW5kcm8gQ2FybWluYXRpIDxhY2Fy
bWluYUByZWRoYXQuY29tPgo+ID4gQWNrZWQtYnk6IERhdmlkIEdvdyA8ZGF2aWRAZGF2aWRnb3cu
bmV0Pgo+ID4gU2lnbmVkLW9mZi1ieTogQWxiZXJ0IEVzdGV2ZSA8YWVzdGV2ZUByZWRoYXQuY29t
Pgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL3Rlc3RzL2RybV9yZWN0X3Rlc3QuYyB8IDIz
ICsrKysrKysrKysrKysrKysrKystLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS90ZXN0cy9kcm1fcmVjdF90ZXN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVzdHMvZHJtX3JlY3Rf
dGVzdC5jCj4gPiBpbmRleCAxN2UxZjM0Yjc2MTAxLi44MThlMTZlODBjOGY5IDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rlc3RzL2RybV9yZWN0X3Rlc3QuYwo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3Rlc3RzL2RybV9yZWN0X3Rlc3QuYwo+ID4gQEAgLTQwOSw4ICs0MDksMTYg
QEAgc3RhdGljIHZvaWQgZHJtX3Rlc3RfcmVjdF9jYWxjX2hzY2FsZShzdHJ1Y3Qga3VuaXQgKnRl
c3QpCj4gPiAgICAgICBjb25zdCBzdHJ1Y3QgZHJtX3JlY3Rfc2NhbGVfY2FzZSAqcGFyYW1zID0g
dGVzdC0+cGFyYW1fdmFsdWU7Cj4gPiAgICAgICBpbnQgc2NhbGluZ19mYWN0b3I7Cj4gPgo+ID4g
LSAgICAgc2NhbGluZ19mYWN0b3IgPSBkcm1fcmVjdF9jYWxjX2hzY2FsZSgmcGFyYW1zLT5zcmMs
ICZwYXJhbXMtPmRzdCwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFyYW1zLT5taW5fcmFuZ2UsIHBhcmFtcy0+bWF4X3JhbmdlKTsKPiA+ICsgICAgIC8q
Cj4gPiArICAgICAgKiBkcm1fcmVjdF9jYWxjX2hzY2FsZSgpIGdlbmVyYXRlcyBhIHdhcm5pbmcg
YmFja3RyYWNlIHdoZW5ldmVyIGJhZAo+ID4gKyAgICAgICogcGFyYW1ldGVycyBhcmUgcGFzc2Vk
IHRvIGl0LiBUaGlzIGFmZmVjdHMgYWxsIHVuaXQgdGVzdHMgd2l0aCBhbgo+ID4gKyAgICAgICog
ZXJyb3IgY29kZSBpbiBleHBlY3RlZF9zY2FsaW5nX2ZhY3Rvci4KPiA+ICsgICAgICAqLwo+ID4g
KyAgICAga3VuaXRfd2FybmluZ19zdXBwcmVzcyh0ZXN0KSB7Cj4gPiArICAgICAgICAgICAgIHNj
YWxpbmdfZmFjdG9yID0gZHJtX3JlY3RfY2FsY19oc2NhbGUoJnBhcmFtcy0+c3JjLCAmcGFyYW1z
LT5kc3QsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFyYW1zLT5taW5fcmFuZ2UsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGFyYW1zLT5tYXhfcmFuZ2UpOwo+ID4gKyAgICAgfQo+
ID4KPiA+ICAgICAgIEtVTklUX0VYUEVDVF9FUSh0ZXN0LCBzY2FsaW5nX2ZhY3RvciwgcGFyYW1z
LT5leHBlY3RlZF9zY2FsaW5nX2ZhY3Rvcik7Cj4gPiAgfQo+ID4gQEAgLTQyMCw4ICs0MjgsMTUg
QEAgc3RhdGljIHZvaWQgZHJtX3Rlc3RfcmVjdF9jYWxjX3ZzY2FsZShzdHJ1Y3Qga3VuaXQgKnRl
c3QpCj4gPiAgICAgICBjb25zdCBzdHJ1Y3QgZHJtX3JlY3Rfc2NhbGVfY2FzZSAqcGFyYW1zID0g
dGVzdC0+cGFyYW1fdmFsdWU7Cj4gPiAgICAgICBpbnQgc2NhbGluZ19mYWN0b3I7Cj4gPgo+ID4g
LSAgICAgc2NhbGluZ19mYWN0b3IgPSBkcm1fcmVjdF9jYWxjX3ZzY2FsZSgmcGFyYW1zLT5zcmMs
ICZwYXJhbXMtPmRzdCwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFyYW1zLT5taW5fcmFuZ2UsIHBhcmFtcy0+bWF4X3JhbmdlKTsKPiA+ICsgICAgIC8q
Cj4gPiArICAgICAgKiBkcm1fcmVjdF9jYWxjX3ZzY2FsZSgpIGdlbmVyYXRlcyBhIHdhcm5pbmcg
YmFja3RyYWNlIHdoZW5ldmVyIGJhZAo+ID4gKyAgICAgICogcGFyYW1ldGVycyBhcmUgcGFzc2Vk
IHRvIGl0LiBUaGlzIGFmZmVjdHMgYWxsIHVuaXQgdGVzdHMgd2l0aCBhbgo+ID4gKyAgICAgICog
ZXJyb3IgY29kZSBpbiBleHBlY3RlZF9zY2FsaW5nX2ZhY3Rvci4KPiA+ICsgICAgICAqLwo+ID4g
KyAgICAga3VuaXRfd2FybmluZ19zdXBwcmVzcyh0ZXN0KSB7Cj4gPiArICAgICAgICAgICAgIHNj
YWxpbmdfZmFjdG9yID0gZHJtX3JlY3RfY2FsY192c2NhbGUoJnBhcmFtcy0+c3JjLCAmcGFyYW1z
LT5kc3QsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFyYW1zLT5taW5fcmFuZ2UsIHBhcmFtcy0+bWF4X3JhbmdlKTsKPiA+ICsgICAgIH0K
PiA+Cj4gPiAgICAgICBLVU5JVF9FWFBFQ1RfRVEodGVzdCwgc2NhbGluZ19mYWN0b3IsIHBhcmFt
cy0+ZXhwZWN0ZWRfc2NhbGluZ19mYWN0b3IpOwo+ID4gIH0KPgo+IEZvciBib3RoIEkgdGhpbmsg
d2Ugc2hvdWxkIGFkZCBLVU5JVF9FWFBFQ1RfU1VQUFJFU1NFRF9XQVJOSU5HX0NPVU5UIGNhbGxz
LCBubz8KCkhpIE1heGltZSwKCkl0IG1heSBpbmRlZWQgYWRkIHZlcmlmaWNhdGlvbiB2YWx1ZSBi
eSBlbnN1cmluZyB0aGUgY2FsbCBhY3R1YWxseQpnZW5lcmF0ZXMgdGhlIGV4cGVjdGVkIHdhcm5p
bmcuCgpUaGUgb3JpZ2luYWwgcGF0Y2ggZGlkIG5vdCBpbmNsdWRlIGNvdW50IGNoZWNrcyBvbiB0
aGUgdmVyc2lvbiBJCmluaGVyaXRlZCBpdCBmcm9tIChpLmUuLApodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyNTA1MjYxMzI3NTUuMTY2MTUwLTUtYWNhcm1pbmFAcmVkaGF0LmNvbS8pLApz
byBJIGtlcHQgdGhlIHNhbWUgYXBwcm9hY2ggd2hpbGUgYWRhcHRpbmcgdG8gdGhlIEFQSSBjaGFu
Z2VzLiBUaGF0CnNhaWQsIHRoZSBjaGVjayBpcyBzaW1wbGUgdG8gYWRkLCBzbyBJIGNvdWxkIGlu
Y2x1ZGUgaXQgaW4gdGhlIG5leHQKdmVyc2lvbi4KCkJSLApBbGJlcnQKCj4KPiBNYXhpbWUKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
