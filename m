Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7537DEB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 21:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EIMuj17bu/id0tJRRy/g8LFpo3d4qrQlvkcXN0rKSpg=; b=GgUJzu8VWuEoED
	8/dzyf8RL3n0vI/QWeWIe7k2MiHk3MWjiJgqqWgo10xu9BBMGO5SE7FxCR9Z6KKYj18C+ihSIW/KI
	B0SkLeanIS+BqZYk4OjQIH7eXKB5XUYgLD8RzGe2ZRud4FZylnbX+qHREE07nLCf9T9WSRiWY1ghn
	3fhEdfAwnxVEdIDqpD5+I3iFIgYny7JxyfvOcZm6gZj989TAsJm6sA/0681C5CfcON3Vn1GSRJOWZ
	ZYfeBzY4Q0JYxqMGmZ4i38OxqpYIf+GjgZpcI/7rFFfVMP+416b7yR2DAluaNoBDmrrUDMo1Fn6SQ
	HQkQU8u7oQIIBUpwFnPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCS3G-001skl-2P;
	Thu, 22 Jun 2023 21:41:14 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCS3E-001skC-0c
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 21:41:13 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-62fe6580f17so60219756d6.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jun 2023 14:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687470071; x=1690062071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKMhtKFgdWfySpTweTXU9j4cru4Ry9zStYx1evxgaA8=;
        b=Y87dbw+cg+wTMcIpPAtf85ukrOYybmHletqopcUQkoSrYPCxLkeUlvHLlbETcKGAsq
         ZNmZck/5BEnT8PesoEeeDhOXhQ48R6+TZ8vVR7DhbrSAUoqxT7zZv5AgWdC4lhSfZakI
         g+Q1KhqrS0QbfALMKqALAWQJjiM+o+sRmd+v+dBmGGlGwBy1i3uvNkxst1ywqA/cC8kk
         0EGRHcCeYrPMwgH7SKkgS+4wrp/CcpVAV3U9eftiJIHmApYlAqUg0VREho4AabQEtA9/
         WdSj9HxWNNhpMhGAL8FAVQb/EzlwW61rZjQ7yjeEd4niYKFiUkp4Rayk8LLmVJbH0faV
         DqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687470071; x=1690062071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKMhtKFgdWfySpTweTXU9j4cru4Ry9zStYx1evxgaA8=;
        b=J6WEH6fiKYxnxhR0E+ypEB16sqSEv9VCSgNEhZb43zTsVghF6zlBRjF2Ib8rPeJ1QT
         gzQmN3O7sclBQo2hjsAyZCJMNSDILJg0CKL/SA8GCMPdbrkUgXEIDOJLvWpVw3zFJrB5
         Cntbsb0dVaRBziKQOhAewxAQODS29OBufA0IDOLYdEW2naOyXLw1jHtjLSIJTeeexQcc
         SOMXrPrDAdcp0+gsU469O0jhKKkCI5yOp7bsM1QLvU7beYIvf4WaimuVEdXlKmXSauLd
         xWidokCCDcOgbFdMzuWoa2/ReDh0zPjB5hsg1SBzdL3qjfmWE1Igjmdr4FBgwl3X7uJW
         iRog==
X-Gm-Message-State: AC+VfDxgK/TkS9OefgW5NNVlS7huATFg5JgGKCI2+EXyvSR5Eo8QY6qJ
	X4lzpq4IJv4EGvRqeOrR28R5LV2V2rjjWosN7q1gnw==
X-Google-Smtp-Source: ACHHUZ6mCI1jN5S3s7ShvvInAUX/6XlWctrvaeIXm/Y08Ms1/dqk8yh1L7hnRjD6E7oASdxzNWEi8VTMlPOi9UYUjdc=
X-Received: by 2002:a05:6214:2a8b:b0:62d:df48:baf0 with SMTP id
 jr11-20020a0562142a8b00b0062ddf48baf0mr23221940qvb.61.1687470070594; Thu, 22
 Jun 2023 14:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-1d790a82-44ad-4b9c-bfe4-6303f09b0705@palmer-ri-x1c9a> <mhng-ad2d02fa-2d4d-4bf1-ab2a-fd84fa4bcb40@palmer-ri-x1c9a>
In-Reply-To: <mhng-ad2d02fa-2d4d-4bf1-ab2a-fd84fa4bcb40@palmer-ri-x1c9a>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 22 Jun 2023 14:40:59 -0700
Message-ID: <CAKwvOd=bHe07O=eBimOg5G-XxXgs6=h5OXzkfS+ayfuAHGOUew@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: nathan@kernel.org, bjorn@kernel.org, Conor Dooley <conor@kernel.org>, 
	jszhang@kernel.org, llvm@lists.linux.dev, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_144112_254646_8523E1C4 
X-CRM114-Status: GOOD (  24.19  )
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

T24gV2VkLCBKdW4gMjEsIDIwMjMgYXQgMTI6NDbigK9QTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QGRhYmJlbHQuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgMjEgSnVuIDIwMjMgMTE6MTk6MzEgUERU
ICgtMDcwMCksIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+ID4gT24gV2VkLCAyMSBKdW4gMjAyMyAx
MDo1MToxNSBQRFQgKC0wNzAwKSwgYmpvcm5Aa2VybmVsLm9yZyB3cm90ZToKPiA+PiBDb25vciBE
b29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyaXRlczoKPiA+Pgo+ID4+IFsuLi5dCj4gPj4KPiA+
Pj4+IFNvIEknbSBubyBsb25nZXIgYWN0dWFsbHkgc3VyZSB0aGVyZSdzIGEgaGFuZywganVzdCBz
b21ldGhpbmcgc2xvdy4KPiA+Pj4+IFRoYXQncyBldmVuIG1vcmUgb2YgYSBncmV5IGFyZWEsIGJ1
dCBJIHRoaW5rIGl0J3Mgc2FuZSB0byBjYWxsIGEgMS1ob3VyCj4gPj4+PiBsaW5rIHRpbWUgYSBy
ZWdyZXNzaW9uIC0tIHVubGVzcyBpdCdzIGV4cGVjdGVkIHRoYXQgdGhpcyBpcyBqdXN0IHZlcnkK
PiA+Pj4+IHNsb3cgdG8gbGluaz8KPiA+Pj4KPiA+Pj4gSSBkdW5ubywgaWYgaXQgd2FzIG9ubHkg
YSB0aGluZyBmb3IgYWxseWVzY29uZmlnLCB0aGVuIHdoYXRldmVyIC0gYnV0Cj4gPj4+IGl0J3Mg
Z29ubmEgc2lnbmlmaWNhbnRseSBpbmNyZWFzZSBidWlsZCB0aW1lcyBmb3IgYW55IGxhcmdlIGtl
cm5lbHMgaWYgTExECj4gPj4+IGlzIHRoaXMgbXVjaCBzbG93ZXIgdGhhbiBMRC4gUmVncmVzc2lv
biBpbiBteSBib29rLgo+ID4+Pgo+ID4+PiBJJ20gZ29ubmEgZ28gYW5kIGV4cGVyaW1lbnQgd2l0
aCBtaXhlZCB0b29sY2hhaW4gYnVpbGRzLCBJJ2xsIHJlcG9ydAo+ID4+PiBiYWNrLi4KPiA+Pgo+
ID4+IEkgdG9vayBwYWxtZXIvZm9yLW5leHQgKDFiZDI5NjNiMjE3NSAoIk1lcmdlIHBhdGNoIHNl
cmllcyAicmlzY3Y6IGVuYWJsZQo+ID4+IEhBVkVfTERfREVBRF9DT0RFX0RBVEFfRUxJTUlOQVRJ
T04iIikpIGZvciBhIHR1eG1ha2UgYnVpbGQgd2l0aCBsbHZtLTE2Ogo+ID4+Cj4gPj4gICB8IH4v
c3JjL3R1eG1ha2UvcnVuIC12IC0td3JhcHBlciBjY2FjaGUgLS10YXJnZXQtYXJjaCByaXNjdiBc
Cj4gPj4gICB8ICAgICAtLXRvb2xjaGFpbj1sbHZtLTE2IC0tcnVudGltZSBkb2NrZXIgLS1kaXJl
Y3RvcnkgLiAtayBcCj4gPj4gICB8ICAgICBhbGx5ZXNjb25maWcKPiA+Pgo+ID4+IFRvb2sgZm9y
ZXZlciwgYnV0IHBhc3NlZCBhZnRlciAyLjVoLgo+ID4KPiA+IFRoYW5rcy4gIEkganVzdCByZS1y
YW4gbWluZSAxNy90cnVuayBMTEQgdW5kZXIgdGltZSAocmF0aGVyIHRoYXQganVzdAo+ID4gY2hl
Y2tpbmcgdG9wIHNvbWV0aW1lcyksIGl0J3MgYXQgMS41aCBidXQgZXZlbiB0aGF0IHNlZW1zIHF1
aXRlIGxvbmcuCj4gPgo+ID4gSSBndWVzcyB0aGlzIGlzIHNvcnQgb2YgdXAgdG8gdGhlIExMVk0g
Zm9sa3M6IGlmIGl0J3MgZXhwZWN0ZWQgdGhhdCBEQ0UKPiA+IHRha2VzIGEgdmVyeSBsb25nIHRp
bWUgdG8gbGluayB0aGVuIEknbSBub3Qgb3Bwb3NlZCB0byBhbGxvd2luZyBpdCwgYnV0Cj4gPiBp
ZiB0aGlzIGlzIHByb2JhYmx5IGEgYnVnIGluIExMRCB0aGVuIGl0IHNlZW1zIGJlc3QgdG8gdHVy
biBpdCBvZmYgdW50aWwKPiA+IHdlIHNvcnQgdGhpbmdzIG91dCBvdmVyIHRoZXJlLgo+ID4KPiA+
IEkgdGhpbmsgbWF5YmUgTmljayBvciBOYXRoYW4gaXMgdGhlIGJlc3QgYmV0IHRvIGtub3c/Cj4K
PiBMb29rcyBsaWtlIGl0J3MgYWJvdXQgMmggZm9yIG1lLiAgSSdtIGdvaW5nIHRvIGRyb3AgdGhl
c2UgZnJvbSBteQo+IHN0YWdpbmcgdHJlZSBpbiB0aGUgaW50ZXJlc3Qgb2YgbWFraW5nIHByb2dy
ZXNzIG9uIG90aGVyIHN0dWZmLCBidXQgaWYKPiB0aGlzIGlzIGp1c3QgZXhwZWN0ZWQgYmVoYXZp
b3IgdGhlbSBJJ20gT0sgdGFraW5nIHRoZW0gKHRob3VnaCB0aGF0J3MKPiB0b28gbXVjaCBjb21w
dXRlIGZvciBtZSB0byB0ZXN0IHJlZ3VsYXJseSk6Cj4KPiAkIHRpbWUgLi4vLi4vLi4vLi4vbGx2
bS9pbnN0YWxsL2Jpbi9sZC5sbGQgLW1lbGY2NGxyaXNjdiAteiBub2V4ZWNzdGFjayAtciAtbyB2
bWxpbnV4Lm8gLS13aG9sZS1hcmNoaXZlIHZtbGludXguYSAtLW5vLXdob2xlLWFyY2hpdmUgLS1z
dGFydC1ncm91cCAuL2RyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWIvbGliLmEgLS1lbmQtZ3Jv
dXAKPgo+IHJlYWwgICAgMTExbTUwLjY3OHMKPiB1c2VyICAgIDExMW0xOC43MzlzCj4gc3lzICAg
ICAxbTEzLjE0N3MKCkFoLCBJIHRoaW5rIHlvdSBtZWFudCBzL2FsbG1vZGNvbmZpZy9hbGx5ZXNj
b25maWcvIGluIHlvdXIgaW5pdGlhbApyZXBvcnQuICBUaGF0IG1ha2VzIG1vcmUgc2Vuc2UsIGFu
ZCBJIGNhbiByZXByb2R1Y2UuICBMZXQgbWUgd29yayBvbiBhCnJlcG9ydC4KCj4KPiA+PiBDT05G
SUdfQ0NfVkVSU0lPTl9URVhUPSJEZWJpYW4gY2xhbmcgdmVyc2lvbiAxNi4wLjYgKCsrMjAyMzA2
MTAxMTMzMDcrN2NiZjFhMjU5MTUyLTF+ZXhwMX4yMDIzMDYxMDIzMzQwMi4xMDYpIgo+ID4+Cj4g
Pj4KPiA+PiBCasO2cm4KCgoKLS0KVGhhbmtzLAp+TmljayBEZXNhdWxuaWVycwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
