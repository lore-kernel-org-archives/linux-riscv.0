Return-Path: <SRS0=3Oe1=PR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F4AC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 00:07:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89AB660FF2
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 00:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 89AB660FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=beUzy/fcnObYcxJXq5f7x49cnzRuzx+WAfdpS8GJMRE=; b=w4aGtQNT/lWlpY
	fbOiNANtf3UK22Zw/7hXHd9SRq8cZ08dJNS7SrVNhXsccjCbaLEUIKzFSOCSbOgQ4rWvYHFRjAyqb
	ZH7LoDWUHCiVAaeheIYKo/kB+W0TmpKNhadWqc1LgrWPqWX2/j3vkc3OJjsKiBb38JWA6EnDxFP3L
	SC7gATmDHjlsCJP7MOsWpQyRRNWTGPHLTzAKv2KqrDOyo2zK9qEPUxGNkM1d4USpuA81fkVwrrcss
	RlwUSsqIUulyP39PdlNs0XqxAEyVvS9t2zm8wChWMJeMm5jXkiKo6dEBZyw+pR9YP4z/KbPT4Hh+l
	VmZyAhlfxk6Vpbq1DSdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgFQM-009KRB-EF; Fri, 29 Oct 2021 00:07:10 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgFQI-009KQH-V0
 for linux-riscv@lists.infradead.org; Fri, 29 Oct 2021 00:07:08 +0000
Received: by mail-wr1-x42a.google.com with SMTP id s13so5947827wrb.3
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 17:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=JM9ovXUoMQGYKoaMhT3SRYdxd24hIbjK2ebF0cmxAXY=;
 b=ZuKxTiy+FIXkT3r4QoosEwipVKEPKjVz65mQqrv9DXeFRdrLUGpI2Kx7CpiV1vYZQP
 G1hSiEXVntdl/cYopDkTkhVDyOiw/TBpwm3anuceKfqCzmDWpyi9MrhZz8vyVGDK5dXL
 uTaQ8gU6a6gd8J7agSEI60+jPY8eMHR28xu6L2UtsiPZsXc0QLHC8WTFiKVu33ZPGT+H
 7kvPcLCBRs4RjmfmQ+Jar5fgLOGGlhRXG3nqIRlKh5mmdmCI34GzNSZONWyNSC7gSmz5
 +f4xvWGiODrGTqq3sUB5E7Avtk07HR41a/Q3Tg4J6Wn/qPXSS3YT5WNFF4lohG0Rym26
 BpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=JM9ovXUoMQGYKoaMhT3SRYdxd24hIbjK2ebF0cmxAXY=;
 b=aYRkQF3hx2sj45V2Uw8Fx5JY7Mr2Iv4Zuy5gGflfdf+4x11lc7Q7JB4NFdQqMC5qri
 7iN9TvFhMba0a6gHUsrg103smt87fp5mXCrvSpkMpnH8WTuvRSOLw6PRIrieUj8g5P0U
 ueC8gm7HFi+KiwpWTQxyu85Ein38QFfTatABKoCL5busyv/G9S4MJqTcH51s3z2eQokb
 6QgYLkcRXhgLvBrJuH2uaRfW7GCNwf1FWlURP5K9tIN6CGv0vzbEB5qePXVg2QEJike/
 tI2/ATk2ek2VcY/IK3M75g0KL4d5lrpR3RfREeBunNDNm50Pn5a4EpNWAc34G35qEIrw
 hobQ==
X-Gm-Message-State: AOAM533768a1dnalZfcehLjPt0uskrawDaGOlRJvLiJ/OrfPir6iPXTn
 3uGA4eoYSWK/8cSprBtKFXuiVg==
X-Google-Smtp-Source: ABdhPJxTZjsXKcFp8GnpfePalwr6klJnooGoh56zJ/LCNGXAeML3ODkDshvA2ZbtNAjmvvc7tNctjg==
X-Received: by 2002:adf:dc43:: with SMTP id m3mr9937982wrj.66.1635466024151;
 Thu, 28 Oct 2021 17:07:04 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.nat-2.net.cam.ac.uk.
 [131.111.5.141])
 by smtp.gmail.com with ESMTPSA id h14sm8013871wmq.34.2021.10.28.17.07.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Oct 2021 17:07:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [v4 10/11] riscv: dts: fu740: Add pmu node
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CAOnJCULqwZvK52nczp2HNinDCBjThnbGbvJpAvdameny1fK4Vw@mail.gmail.com>
Date: Fri, 29 Oct 2021 01:07:02 +0100
Cc: Atish Patra <atish.patra@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Anup Patel <anup.patel@wdc.com>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 devicetree <devicetree@vger.kernel.org>,
 Greentime Hu <greentime.hu@sifive.com>, Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-perf-users@vger.kernel.org,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Nick Kossifidis <mick@ics.forth.gr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Vincent Chen <vincent.chen@sifive.com>
Message-Id: <EDB030D6-D37A-43D6-9027-222794FDA80D@jrtc27.com>
References: <20211025195350.242914-1-atish.patra@wdc.com>
 <20211025195350.242914-11-atish.patra@wdc.com>
 <YXsMtrmuavGAHk8S@Jessicas-MacBook-Pro.local>
 <CAOnJCULqwZvK52nczp2HNinDCBjThnbGbvJpAvdameny1fK4Vw@mail.gmail.com>
To: Atish Patra <atishp@atishpatra.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_170707_104275_3A6E39F6 
X-CRM114-Status: GOOD (  27.49  )
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

T24gMjkgT2N0IDIwMjEsIGF0IDAwOjM3LCBBdGlzaCBQYXRyYSA8YXRpc2hwQGF0aXNocGF0cmEu
b3JnPiB3cm90ZToKPiAKPiBPbiBUaHUsIE9jdCAyOCwgMjAyMSBhdCAxOjQ5IFBNIEplc3NpY2Eg
Q2xhcmtlIDxqcnRjMjdAanJ0YzI3LmNvbT4gd3JvdGU6Cj4+IAo+PiBPbiBNb24sIE9jdCAyNSwg
MjAyMSBhdCAxMjo1Mzo0OVBNIC0wNzAwLCBBdGlzaCBQYXRyYSB3cm90ZToKPj4+IEhpRml2ZSB1
bm1hdGNoZWQgc3VwcG9ydHMgSFBNQ291bnRlcnMgYnV0IGRvZXMgbm90IGltcGxlbWVudCBtY291
bnRpbmhpYml0Cj4+PiBvciBzc2NvZiBleHRlbnNpb24uIFRodXMsIHBlcmYgbW9uaXRvcmluZyBj
YW4gYmUgdXNlZCBvbiB0aGUgdW5tYXRjaGVkCj4+PiBib2FyZCB3aXRob3V0IHNhbXBsaW5nLgo+
Pj4gCj4+PiBBZGQgdGhlIFBNVSBub2RlIHdpdGggY29tcGF0aWJsZSBzdHJpbmcgc28gdGhhdCBM
aW51eCBwZXJmIGRyaXZlciBjYW4KPj4+IHV0aWxpemUgdGhpcyB0byBlbmFibGUgUE1VLgo+Pj4g
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2gucGF0cmFAd2RjLmNvbT4KPj4+
IC0tLQo+Pj4gYXJjaC9yaXNjdi9ib290L2R0cy9zaWZpdmUvZnU3NDAtYzAwMC5kdHNpIHwgMyAr
KysKPj4+IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPj4+IAo+Pj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2Z1NzQwLWMwMDAuZHRzaSBiL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvc2lmaXZlL2Z1NzQwLWMwMDAuZHRzaQo+Pj4gaW5kZXggYWJiYjk2MGY5MGEw
Li5iMzViOTZiNTg4MjAgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2
ZS9mdTc0MC1jMDAwLmR0c2kKPj4+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2Z1
NzQwLWMwMDAuZHRzaQo+Pj4gQEAgLTE0MCw2ICsxNDAsOSBAQCBzb2Mgewo+Pj4gICAgICAgICAg
ICAgICNzaXplLWNlbGxzID0gPDI+Owo+Pj4gICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic2lt
cGxlLWJ1cyI7Cj4+PiAgICAgICAgICAgICAgcmFuZ2VzOwo+Pj4gKyAgICAgICAgICAgICBwbXUg
ewo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmlzY3YscG11IjsKPj4+
ICsgICAgICAgICAgICAgfTsKPj4gCj4+IFRoaXMgaXMgYSBwcm9wZXJ0eSBvZiB0aGUgdXNlci1y
ZXBsYWNlYWJsZSBmaXJtd2FyZSwgbm90IGEgcHJvcGVydHkgb2YKPj4gdGhlIGhhcmR3YXJlLAo+
IAo+IEl0J3MgYSBwcm9wZXJ0eSBvZiBoYXJkd2FyZSB0aGF0IGluZGljYXRlcyB0aGF0IHRoZSBo
YXJkd2FyZSBzdXBwb3J0cyBQTVUuCgpBbGwgUklTQy1WIGhhcmR3YXJlIHByb3ZpZGVzIHRoZSBD
U1JzLCB0aGV54oCZcmUgcGFydCBvZiB0aGUgcHJpdmlsZWdlZApzcGVjIGFuZCBub3QgbWFya2Vk
IG9wdGlvbmFsLiBIb3cgbWFueSBhcmVu4oCZdCBoYXJkLXdpcmVkIHRvIHplcm8gaXMgdXAKdG8g
dGhlIGltcGxlbWVudGF0aW9uLiBCdXQgZXZlbiB0aGVuIHlvdSBjYW7igJl0IGtub3cgZnJvbSB0
aGUgaGFyZHdhcmUKYWxvbmUgd2hhdCBpcyBzdXBwb3J0ZWQ7IHRoZSBmaXJtd2FyZSBoYXMgdG8g
ZW5hYmxlIFMtbW9kZSAoYW5kClUtbW9kZSnigJlzIGFiaWxpdHkgdG8gcmVhZCB0aGVtLCBzbyB5
b3UgY2Fu4oCZdCBhc3N1bWUgYW55dGhpbmcgaW4gYQpzdGF0aWMgZGV2aWNlIHRyZWUgaGFyZC1j
b2RlZCBpbiBMaW51eCBhYm91dCB3aGF0IGZpcm13YXJlIGhhcyBkb25lLgpTaW5jZSB5b3UgY3Vy
cmVudGx5IGhhdmUgdG8gcXVlcnkgdGhlIGZpcm13YXJlIHRvIGRldGVybWluZSB3aGF04oCZcwph
dmFpbGFibGUgdG8geW91IGFueXdheSwgSSBzZWUgbm8gYmVuZWZpdCBmcm9tIGhhdmluZyBhIG5v
ZGUgaW4gdGhlCmRldmljZSB0cmVlIHRoYXQgdGVsbHMgeW91IHlvdXIgZmlybXdhcmUgKm1pZ2h0
KiBoYXZlIGNvdW50ZXJzIHlvdSBjYW4KdXNlLgoKPiBBZGRpdGlvbmFsbHksIHRoZSBjb3VudGVy
IG92ZXJmbG93IGludGVycnVwdCBudW1iZXIgbmVlZHMgdG8gYmUKPiBkZWZpbmVkIHRocm91Z2gg
dGhlIERUIGFzIHdlbGwKPiBzbyB0aGF0IGEgY2xlYW4gcGxhdGZvcm0gZHJpdmVyIGNhbiBiZSBp
bXBsZW1lbnRlZC4KClRoZSBpbnRlcnJ1cHQgbnVtYmVyIGlzIHNwZWNpZmllZCBhcyAxMyBieSB0
aGUgU3Njb2ZtcGYgc3BlYy4KQnV0IHRoYXTigJlzIG5vdCByZWxldmFudCBoZXJlLCB0aGUgRlU3
NDAgcHJlZGF0ZXMgYW5kIGRvZXNu4oCZdCBpbXBsZW1lbnQKU3Njb2ZtcGYsIG1lYW5pbmcgdGhl
cmUgaXMgbm8gaW50ZXJydXB0IHRvIGV2ZW4gZGVmaW5lIGhlcmUuIEFuZCBhcyBJCnNhaWQgb24g
dGhlIG90aGVyIHBhdGNoLCBkb27igJl0IGNvbmZsYXRlIOKAnFNCSSBQTVUgZmlybXdhcmUgaW50
ZXJmYWNlIGlzCnN1cHBvcnRlZOKAnSBhbmQg4oCcU3Njb2ZtcGYgaXMgaW1wbGVtZW50ZWQgaW4g
dGhlIGhhcmR3YXJl4oCdOyB0aGUgZm9ybWVyCnNob3VsZCBiZSBkaXNjb3ZlcmVkIGJ5IHRhbGtp
bmcgdG8gZmlybXdhcmUsIGFuZCB0aGUgbGF0dGVyIHNob3VsZCBiZQpkaXNjb3ZlcmVkIGxpa2Ug
YW55IG90aGVyIGV4dGVuc2lvbiAoaG93ZXZlciB0aGF0IGVuZHMgdXAgaGFwcGVuaW5nKS4KCj4+
IHNvIGhhdmluZyB0aGlzIGluIHRoZSBkZXZpY2UgdHJlZSB1bmRlciAvc29jLCBsZXQgYWxvbmUK
Pj4gaGFyZC1jb2RlZCBpbiBMaW51eCwgaXMgdXR0ZXJseSB3cm9uZy4gV2h5IGNhbiB0aGlzIG5v
dCBqdXN0IGJlIHByb2JlZAo+PiBsaWtlIGFueSBvdGhlciBTQkkgaW50ZXJmYWNlPyBUaGUgIlBy
b2JlIFNCSSBleHRlbnNpb24iIGludGVyZmFjZSBpcwo+PiBwcmVjaXNlbHkgZm9yIHRoaXMga2lu
ZCBvZiB0aGluZy4KPj4gCj4gU0JJIGV4dGVuc2lvbiBpcyBhbnl3YXlzIHByb2JlZCB0byB2ZXJp
ZnkgaWYgdGhlIGZpcm13YXJlIGhhcyBQTVUKPiBleHRlbnNpb24gb3Igbm90Lgo+IEhvd2V2ZXIs
IGFkZGluZyB0aGUgRFQgcHJvcGVydHkgYWxsb3dzIGRpZmZlcmVudCBwbGF0Zm9ybXMgKHdpdGgg
b3IKPiB3aXRob3V0IHNzY29mIGV4dGVuc2lvbikKPiB0byB1c2UgdGhlIHNhbWUgY29kZSBwYXRo
LgoKWW91IGRvbuKAmXQgbmVlZCBhIGRldmljZSB0cmVlIGZvciB0aGF0OyB0aGF0IHNhbWUgY29k
ZSBwYXRoIGNhbiBqdXN0IGJlCuKAnHVzZSB0aGUgZXhpc3Rpbmcgc3RhbmRhcmQgZmlybXdhcmUg
aW50ZXJmYWNl4oCdLiBUaGF0IGFsc28gaGFzIHRoZQpiZW5lZml0IHRoYXQgaXTigJlzIG5vdCB0
aWVkIHRvIGRldmljZSB0cmVlIGFuZCBzbyB3b3JrcyBpZGVudGljYWxseSBmb3IKQUNQSSwgcmF0
aGVyIHRoYW4gbmVlZGluZyBhbiBBQ1BJIHZlcnNpb24gb2YgaXQuCgpJIHNlZSBub3RoaW5nIGhl
cmUgdGhhdCBjYW7igJl0IGJlIGRpc2NvdmVyZWQgdGhyb3VnaCBwcmUtZXhpc3RpbmcgbWVhbnMu
CklmIGl0IGNhbiBiZSBkaXNjb3ZlcmVkIHdpdGhvdXQgdXNlIG9mIHRoZSBkZXZpY2UgdHJlZSB0
aGVuIGl0IGRvZXMgbm90CmJlbG9uZyBpbiB0aGUgZGV2aWNlIHRyZWU7IHRoZSBkZXZpY2UgdHJl
ZSBpcyBwdXJlbHkgZm9yIHRoaW5ncyB0aGF0CmNhbm5vdCBvdGhlcndpc2UgYmUgZGlzY292ZXJl
ZC4KCkplc3MKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
