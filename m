Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832D4C7EE25
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 21:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hllzmphjb3mDi1etBfnRxfhWHlE8hXU0NRhPIgroXX8=; b=As+e2P3D1iNojz
	rZb2VgQDR4QAkg5dWtlQQX2p0sjc3GW0+ARcS5D71sXjHFyY2FtE6OshVXUAR5qaGsummUHJUD8Ne
	6f6IJ4s1Jbs7fsMzrBahtQ2G/aIScRpG+MYfNgQKMne/Fjvd3VKnYufybU8qZf+WtDxvuvS5Qt6gk
	fUjrgS2RD2kY+CVE8iXUpB1RrYyyB7Wr5mgF785I50kFgi+baTzQoDbZi/1PtZWBL3OHuTo34WY3l
	8Haqpo3kjSwjrhoBJtFZzBgeRQuvGSTwGO6rtVAE8oF4PUqFHSmK7NLfpES3CO3YSOAF8/sbRXfzG
	E9EpdXhzXSRrb9RpWAGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7jUh-00EHvl-1F;
	Fri, 09 Jun 2023 21:18:03 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7jUe-00EHuZ-1d
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jun 2023 21:18:01 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-3f9d619103dso8571cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jun 2023 14:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686345477; x=1688937477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRAQr078BUUokwlWeruPfu3tXC8xw/eiJppeWzlI2XY=;
        b=3FYxoqPq77YWBq1uXh5PHe0KR04muNees/64GTBJ3WLOoddlZZJOWQ9cCs1QmEc6jA
         KTKvl5SIxzSAQ84C49Wp9W/PmWEKisRx/aTZ8dxyaVuWokCmQ1f0SXhS3205hWmUBWf0
         JqyvxXyej0s+pxNiPsGjks7W83JbtWcDdw3IH4SEaz52jhKy0GI580f8KAV1JxxACOkT
         YzsthLYJuDlIBxazBhBfwLMYaGXjqEUv2bnrkr4zq2If1RvB7US/VJsAngtbSL9Eh1BB
         RvyfAuEl1sgzdM/YBgIcySSzylAIWRbgfYkwfzdMvPTtxjdqAGFdMvbF7QRJ68pPGD7q
         PjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686345477; x=1688937477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kRAQr078BUUokwlWeruPfu3tXC8xw/eiJppeWzlI2XY=;
        b=JHkoHZmnO8Q3iDbfz0D9KPdlcxv5gZh8Ujf1qM626qD7E5HPpUJhMH+WsZH2mXNQeP
         cPbscOvyuP3Um1YvoKZSpPiCvSC69MP/kqGF0P9wZPOCZNytJKcmFG/YWrcZTmOtXBYZ
         cwwg7NKDre/qzIqXB/wMYi+EPvm4SyhhnCpBxxUrhN1oslO1XC7MfuXkXQwAK6VSe6zO
         cfSAbF5u7F6/a0AMh2yGCqMxgFy+bUzMQkgiy1uAWATy9PXR6qfYmXbsQ6KYdcwUb19e
         D1iiXWorqFRNhEFUZ6D7uZtFeIMMLx6FqsUcm591Cik05srTMeuZWC+Q4Y7+ueSmfvq4
         S6wQ==
X-Gm-Message-State: AC+VfDz9o9G00ZbnS/Iof5WX/H9yb7FKRQiMnx+nTL9LfE/90tG+6zke
	4WSHTjpLa6AQcu8Tvz5bPiFk85CIvEi8PIiLXeYonQ==
X-Google-Smtp-Source: ACHHUZ7Mn1+bgpCnLIc/VkQ8WULvWZFq0p8HGTm7OUv0T7eX+3mfTWyw5RHUXrEDbgxLlANAQhZYqvg2Jlya4CHYamc=
X-Received: by 2002:a05:622a:2c6:b0:3ef:2f55:2204 with SMTP id
 a6-20020a05622a02c600b003ef2f552204mr26088qtx.6.1686345477542; Fri, 09 Jun
 2023 14:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230508142842.854564-1-apatel@ventanamicro.com>
 <20230508142842.854564-3-apatel@ventanamicro.com> <20230608182828.GA3183987-robh@kernel.org>
 <CAGETcx_4OH=EmSUL2-rwKa=1uoOj+AH_xn4PoPsc0kt_aU0WOg@mail.gmail.com> <CAK9=C2V1LH0739Nq5Ji7gGbgbyFtNAtBYR43fU7vr9omD5tKSA@mail.gmail.com>
In-Reply-To: <CAK9=C2V1LH0739Nq5Ji7gGbgbyFtNAtBYR43fU7vr9omD5tKSA@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Fri, 9 Jun 2023 14:17:21 -0700
Message-ID: <CAGETcx--aEEB6ag1qGcEeygPyZM9Q-T1NOY+wK911LGJGisN8Q@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] of/irq: Set FWNODE_FLAG_BEST_EFFORT for the
 interrupt controller DT nodes
To: Anup Patel <apatel@ventanamicro.com>
Cc: Rob Herring <robh@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Atish Patra <atishp@atishpatra.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, iommu@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_141800_580810_11BC8A56 
X-CRM114-Status: GOOD (  31.98  )
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

T24gRnJpLCBKdW4gOSwgMjAyMyBhdCA0OjQw4oCvQU0gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdW4gOSwgMjAyMyBhdCAxOjM14oCvQU0g
U2FyYXZhbmEgS2FubmFuIDxzYXJhdmFuYWtAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24g
VGh1LCBKdW4gOCwgMjAyMyBhdCAxMToyOOKAr0FNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+IHdyb3RlOgo+ID4gPgo+ID4gPiArU2FyYXZhbmEKPiA+ID4KPiA+ID4gT24gTW9uLCBNYXkg
MDgsIDIwMjMgYXQgMDc6NTg6MzNQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+ID4gPiBU
aGUgUklTQy1WIEFQTElDIGludGVycnVwdCBjb250cm9sbGVyIGRyaXZlciBpcyBhIHJlZ3VsYXIg
cGxhdGZvcm0KPiA+ID4gPiBkcml2ZXIgc28gd2UgbmVlZCB0byBlbnN1cmUgdGhhdCBpdCBpcyBw
cm9iZWQgYXMgc29vbiBhcyBwb3NzaWJsZS4KPiA+ID4gPiBUbyBhY2hpZXZlIHRoaXMsIHdlIG1h
cmsgdGhlIGludGVycnVwdCBjb250cm9sbGVyIGRldmljZSBub2RlcyB3aXRoCj4gPiA+ID4gRldO
T0RFX0ZMQUdfQkVTVF9FRkZPUlQgKGp1c3QgbGlrZSBjb25zb2xlIERUIG5vZGUpLgo+ID4gPiA+
Cj4gPiA+ID4gRml4ZXM6IDhmNDg2Y2FiMjYzYyAoImRyaXZlciBjb3JlOiBmd19kZXZsaW5rOiBB
bGxvdyBmaXJtd2FyZSB0byBtYXJrIGRldmljZXMgYXMgYmVzdCBlZmZvcnQiKQo+ID4gPgo+ID4g
PiBJdCBpcyBnb29kIHByYWN0aWNlIHRvIENjIHRoZSBjb21taXQgYXV0aG9yIG9mIHdoYXQgeW91
IGFyZSBmaXhpbmcuCj4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBh
dGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvb2YvaXJx
LmMgfCAxMCArKysrKysrKysrCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9pcnEuYyBiL2RyaXZl
cnMvb2YvaXJxLmMKPiA+ID4gPiBpbmRleCAxNzQ5MDAwNzJjMTguLjk0ZTFkOTI0NWNmZiAxMDA2
NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL29mL2lycS5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9v
Zi9pcnEuYwo+ID4gPiA+IEBAIC01MzUsNiArNTM1LDE2IEBAIHZvaWQgX19pbml0IG9mX2lycV9p
bml0KGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgKm1hdGNoZXMpCj4gPiA+ID4gICAgICAgSU5J
VF9MSVNUX0hFQUQoJmludGNfZGVzY19saXN0KTsKPiA+ID4gPiAgICAgICBJTklUX0xJU1RfSEVB
RCgmaW50Y19wYXJlbnRfbGlzdCk7Cj4gPiA+ID4KPiA+ID4gPiArICAgICAvKgo+ID4gPiA+ICsg
ICAgICAqIFdlIG5lZWQgaW50ZXJydXB0IGNvbnRyb2xsZXIgcGxhdGZvcm0gZHJpdmVycyB0byB3
b3JrIGFzIHNvb24KPiA+ID4KPiA+ID4gSWYgaXQncyBwbGF0Zm9ybSBkcml2ZXJzL2RldmljZXMg
eW91IGNhcmUgYWJvdXQsIHRoZW4gcGVyaGFwcyB0aGlzCj4gPiA+IHNob3VsZCBiZSBkb25lIHdo
ZW4gcGxhdGZvcm0gZGV2aWNlcyBhcmUgY3JlYXRlZC4KPiA+ID4KPiA+ID4gPiArICAgICAgKiBh
cyBwb3NzaWJsZSBzbyBtYXJrIHRoZSBpbnRlcnJ1cHQgY29udHJvbGxlciBkZXZpY2Ugbm9kZXMg
d2l0aAo+ID4gPiA+ICsgICAgICAqIEZXTk9ERV9GTEFHX0JFU1RfRUZGT1JUIHNvIHRoYXQgZndf
ZGVsaW5rIGtub3dzIG5vdCB0byBkZWxheQo+ID4gPiA+ICsgICAgICAqIHRoZSBwcm9iZSBvZiB0
aGUgaW50ZXJydXB0IGNvbnRyb2xsZXIgZGV2aWNlIGZvciBzdXBwbGllcnMKPiA+ID4gPiArICAg
ICAgKiB3aXRob3V0IGRyaXZlcnMuCj4gPiA+ID4gKyAgICAgICovCj4gPiA+ID4gKyAgICAgZm9y
X2VhY2hfbm9kZV93aXRoX3Byb3BlcnR5KG5wLCAiaW50ZXJydXB0LWNvbnRyb2xsZXIiKQo+ID4g
Pgo+ID4gPiBUaGlzIGZ1bmN0aW9uIG9ubHkgb3BlcmF0ZXMgb24gbm9kZXMgbWF0Y2hpbmcgJ21h
dGNoZXMnLCBidXQgdGhpcwo+ID4gPiBvcGVyYXRlcyBvbiBldmVyeXRoaW5nLgo+ID4gPgo+ID4g
PiBJdCBkb2VzIG1ha2Ugc2Vuc2UgdGhhdCBpZiB3ZSBpbml0IGFuIGludGVycnVwdCBjb250cm9s
bGVyIGhlcmUsIHRoZW4gd2UKPiA+ID4gd2lsbCBzdXJlbHkgd2FudCB0byBwcm9iZSBpdHMgZHJp
dmVyIGxhdGVyIG9uLiBTbyBtYXliZSBqdXN0IG1vdmUKPiA+ID4gc2V0dGluZyBGV05PREVfRkxB
R19CRVNUX0VGRk9SVCB3aXRoaW4KPiA+ID4gZm9yX2VhY2hfbWF0Y2hpbmdfbm9kZV9hbmRfbWF0
Y2goKSBiZWxvdy4KPiA+ID4KPiA+ID4gPiArICAgICAgICAgICAgIG5wLT5md25vZGUuZmxhZ3Mg
fD0gRldOT0RFX0ZMQUdfQkVTVF9FRkZPUlQ7Cj4gPiA+ID4gKwo+ID4KPiA+IERlZmluaXRlIE5h
Y2suIFlvdSBhcmUgcHJldHR5IG11Y2ggZGlzYWJsaW5nIGZ3X2RldmxpbmsgZm9yIGFsbAo+ID4g
aW50ZXJydXB0IGNvbnRyb2xsZXJzLiBUaGVyZSBhcmUgcGxlbnR5IG9mIGV4YW1wbGVzIG9mIHRo
ZSBJUlEgZHJpdmVycwo+ID4gYmVpbmcgbmVlZGVkIHZlcnkgZWFybHkgb24gYW5kIHN0aWxsIHBy
b2JpbmcgcHJvcGVybHkgd2l0aG91dCB0aGUgbmVlZAo+ID4gZm9yIHRoaXMgZmxhZy4gUGxlYXNl
IGZpeCB5b3VyIGRyaXZlci9EVC4KPgo+IE9rYXksIEkgd2lsbCB0cnkgdG8gc2V0IEZXTk9ERV9G
TEFHX0JFU1RfRUZGT1JUIG9ubHkgZm9yCj4gQVBMSUMgZGV2aWNlX25vZGUgdmlhIElSUUNISVBf
REVDTEFSRSgpLgoKTm8sIG15IHBvaW50IGlzIHRoYXQgeW91IHZlcnkgbGlrZWx5IGRvbid0IG5l
ZWQgdG8gdXNlIHRoYXQgZmxhZy4KCldoYXQgZXhhY3RseSBpcyB0aGUgcHJvYmxlbSB5b3UgYXJl
IGZhY2luZz8gUG9pbnQgdG8gYW4gZXhhbXBsZSBSSVNDLVYKZHRzIChub3QgZHRzaSkgaW4gdXBz
dHJlYW0gYW5kIGdpdmUgc3BlY2lmaWNzIHBsZWFzZS4KCi1TYXJhdmFuYQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
