Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2A7C41535
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 01:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nMBhauCAL/Qx/4j/7V8M+oYh7hntTIHzwsm2uE5j6wA=; b=icQ4gkXprz2pyp
	XgoNt/h1lRVqqfZOK4Z9sORIQ5ArDXe6YQA7+eLEpJQqVWBOQ9/7Q1M42cWN4l283rEHJCg4Tg0Ni
	II3KlYCVIqFCj+r43PPW2TNLfc+n8YFbUFB/VRM7gFBco1RBtPRXxBHrP5AnIhAppc7aGzD22mGKF
	LqIeuQYinPbWrZKLMuCf58CrTEmdwVkPb+TE0eFkVuXAVPb6eMTTADcwtn515kQfbOpJMCPN+W/8j
	w47V3QtaUiN74Ww1TejKy0it9fl7n3ZJljLtiPWUI/HqM0+RwRDiVUZjQ4DlyiNYcnSH+P/aDOlAl
	yUCD6Gkc6Zs3sokl17Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFlYX-00Fv0W-2K;
	Wed, 20 Dec 2023 01:39:29 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFlYU-00Fv07-0k
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 01:39:27 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-7cbfccbbbafso408321241.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 17:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703036365; x=1703641165; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xklWh878n9zMRjCUB/qhIRAN0/9joOwxfuJLhvpD1Jo=;
        b=RdYfrGkktQSuOQnJ+fdJyTdz2DlU39upm15yaZJNjo2lFnGOnJqVTyRTefoxOPjHEU
         4lVTtl7m/4hZYrycHa5NA2m4w4KQs8ZR12/KjN8LIwlVlYVzvey7vbZtR3CmweoNp2KR
         oAQGI5iXhQovJ4ov0+hmI4hc6FjBMQK4NUb1ihnuDDhRElA+QTqGLy5canbZNx/DFiMA
         YfeZI2TvPKT0fjz+pO6TmScCrqElKm42Iqb1LhSKYI34vfsC/k6x2ha0kkOmt+ELBJRj
         HUAMUI2QVWS0EBWrFxseIUjDT8r+1OYpah/WLl2uerkexdnPlWmqQMLbbdVw6s2cIpeP
         kEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703036365; x=1703641165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xklWh878n9zMRjCUB/qhIRAN0/9joOwxfuJLhvpD1Jo=;
        b=LITEsFH6bwvMyqp2lNnEK3fsJ7DV4GSsZj8MIufTed4DZtmpmdi1s9tacJX/XjQv/2
         3WTap/JqxoMmj6Hw0fRpdDT9M+85XWO54wHkmZFP7Ze2C0bDCvlwjLzoiHUzOIvly+3Y
         B76TsdthZwnlAy0CxjeAGKj/qvKuVy78C/2EKz11vWZ3c+p64Ee454CCQ8yOEzIecs5l
         F7B7MH3zeSvHqCyfCbkkp3m+xThMEiMjc+apq8rFujseLBgoNd0OolasXVXSdBC6Bb5Y
         5VBTV0fdJTn+b2YcB+KyW67hPuvuSSti0Xz+gtH89btjZOjR7aVEczHSG6AHTN1801yP
         xlEg==
X-Gm-Message-State: AOJu0Yytzbtr8EBOdRtxObRaaQyN6oyt/mQfahIGFFwHpvKSaIKLxNfS
	MQoDtKUXJaOECL0nZt5TuQjq+juQobORhf4J0YI7Og==
X-Google-Smtp-Source: AGHT+IHq5M+ifjRgUhwlvYPTK/9dNoGx/FEinO3023Jlhl6LZIFCWg4PxAXuQt3TNAiJZAg66TwbupnZlroDSpg/L8s=
X-Received: by 2002:a05:6122:1d87:b0:4b6:da2d:6444 with SMTP id
 gg7-20020a0561221d8700b004b6da2d6444mr2538883vkb.19.1703036364784; Tue, 19
 Dec 2023 17:39:24 -0800 (PST)
MIME-Version: 1.0
References: <20231220012906.1482456-1-vincent.chen@sifive.com>
In-Reply-To: <20231220012906.1482456-1-vincent.chen@sifive.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Wed, 20 Dec 2023 09:39:14 +0800
Message-ID: <CABvJ_xjUR-DLi4hMC3UEEmse0k_FaZdtGP7XZmzOpj764j_KVQ@mail.gmail.com>
Subject: Re: [v4 PATCH] riscv: mm: execute local TLB flush after populating vmemmap
To: paul.walmsley@sifive.com, palmer@dabbelt.com, ajones@ventanamicro.com, 
	alexghiti@rivosinc.com
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_173926_298723_577C7129 
X-CRM114-Status: GOOD (  21.29  )
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

U29ycnksIEkganVzdCBkaXNjb3ZlcmVkIGEgY29tcGlsZXIgZXJyb3Igd2hlbiBDT05GSUdfU01Q
IGlzIGRpc2FibGVkLgpQbGVhc2UgaWdub3JlIHRoaXMgcGF0Y2g7IEkgd2lsbCBzZW5kIHRoZSB2
NSBwYXRjaCB0byByZXNvbHZlIHRoaXMKaXNzdWUuCgoKT24gV2VkLCBEZWMgMjAsIDIwMjMgYXQg
OToyOeKAr0FNIFZpbmNlbnQgQ2hlbiA8dmluY2VudC5jaGVuQHNpZml2ZS5jb20+IHdyb3RlOgo+
Cj4gVGhlIHNwYXJlX2luaXQoKSBjYWxscyBtZW1tYXBfcG9wdWxhdGUoKSBtYW55IHRpbWVzIHRv
IGNyZWF0ZSBWQSB0byBQQQo+IG1hcHBpbmcgZm9yIHRoZSBWTUVNTUFQIGFyZWEsIHdoZXJlIGFs
bCAic3RydWN0IHBhZ2UiIGFyZSBsb2NhdGVkIG9uY2UKPiBDT05GSUdfU1BBUlNFTUVNX1ZNRU1N
QVAgaXMgZGVmaW5lZC4gVGhlc2UgInN0cnVjdCBwYWdlIiBhcmUgbGF0ZXIKPiBpbml0aWFsaXpl
ZCBpbiB0aGUgem9uZV9zaXplc19pbml0KCkgZnVuY3Rpb24uIEhvd2V2ZXIsIGR1cmluZyB0aGlz
Cj4gcHJvY2Vzcywgbm8gc2ZlbmNlLnZtYSBpbnN0cnVjdGlvbiBpcyBleGVjdXRlZCBmb3IgdGhp
cyBWTUVNTUFQIGFyZWEuCj4gVGhpcyBvbWlzc2lvbiBtYXkgY2F1c2UgdGhlIGhhcnQgdG8gZmFp
bCB0byBwZXJmb3JtIHBhZ2UgdGFibGUgd2Fsawo+IGJlY2F1c2Ugc29tZSBkYXRhIHJlbGF0ZWQg
dG8gdGhlIGFkZHJlc3MgdHJhbnNsYXRpb24gaXMgaW52aXNpYmxlIHRvIHRoZQo+IGhhcnQuIFRv
IHNvbHZlIHRoaXMgaXNzdWUsIHRoZSBsb2NhbF9mbHVzaF90bGJfa2VybmVsX3JhbmdlKCkgaXMg
Y2FsbGVkCj4gcmlnaHQgYWZ0ZXIgdGhlIHNwYXJlX2luaXQoKSB0byBleGVjdXRlIGEgc2ZlbmNl
LnZtYSBpbnN0cnVjdGlvbiBmb3IgdGhpcwo+IFZNRU1NQVAgYXJlYSwgZW5zdXJpbmcgdGhhdCBh
bGwgZGF0YSByZWxhdGVkIHRvIHRoZSBhZGRyZXNzIHRyYW5zbGF0aW9uCj4gaXMgdmlzaWJsZSB0
byB0aGUgaGFydC4KPgo+IEZpeGVzOiBkOTVmMWE1NDJjM2QgKCJSSVNDLVY6IEltcGxlbWVudCBz
cGFyc2VtZW0iKQo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgQ2hlbiA8dmluY2VudC5jaGVuQHNp
Zml2ZS5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaCB8IDEg
Kwo+ICBhcmNoL3Jpc2N2L21tL2luaXQuYyAgICAgICAgICAgICAgfCA1ICsrKysrCj4gIGFyY2gv
cmlzY3YvbW0vdGxiZmx1c2guYyAgICAgICAgICB8IDYgKysrKysrCj4gIDMgZmlsZXMgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vdGxiZmx1c2guaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaAo+IGluZGV4
IDhmMzQxOGM1ZjE3Mi4uYmY4YzUyNzE5YTNhIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vdGxiZmx1c2guaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1
c2guaAo+IEBAIC02OCw0ICs2OCw1IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF90bGJfa2Vy
bmVsX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gICNkZWZpbmUgZmx1c2hfdGxiX21tX3Jh
bmdlKG1tLCBzdGFydCwgZW5kLCBwYWdlX3NpemUpIGZsdXNoX3RsYl9hbGwoKQo+ICAjZW5kaWYg
LyogIUNPTkZJR19TTVAgfHwgIUNPTkZJR19NTVUgKi8KPgo+ICt2b2lkIGxvY2FsX2ZsdXNoX3Rs
Yl9rZXJuZWxfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQpOwo+
ICAjZW5kaWYgLyogX0FTTV9SSVNDVl9UTEJGTFVTSF9IICovCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiBpbmRleCAyZTAxMWNiZGRm
M2EuLmNjNTZhMDk0NTEyMCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ICsr
KyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gQEAgLTEzNzcsNiArMTM3NywxMCBAQCB2b2lkIF9f
aW5pdCBtaXNjX21lbV9pbml0KHZvaWQpCj4gICAgICAgICBlYXJseV9tZW10ZXN0KG1pbl9sb3df
cGZuIDw8IFBBR0VfU0hJRlQsIG1heF9sb3dfcGZuIDw8IFBBR0VfU0hJRlQpOwo+ICAgICAgICAg
YXJjaF9udW1hX2luaXQoKTsKPiAgICAgICAgIHNwYXJzZV9pbml0KCk7Cj4gKyNpZmRlZiBDT05G
SUdfU1BBUlNFTUVNX1ZNRU1NQVAKPiArICAgICAgIC8qIFRoZSBlbnRpcmUgVk1FTU1BUCByZWdp
b24gaGFzIGJlZW4gcG9wdWxhdGVkLiBGbHVzaCBUTEIgZm9yIHRoaXMgcmVnaW9uICovCj4gKyAg
ICAgICBsb2NhbF9mbHVzaF90bGJfa2VybmVsX3JhbmdlKFZNRU1NQVBfU1RBUlQsIFZNRU1NQVBf
RU5EKTsKPiArI2VuZGlmCj4gICAgICAgICB6b25lX3NpemVzX2luaXQoKTsKPiAgICAgICAgIGFy
Y2hfcmVzZXJ2ZV9jcmFzaGtlcm5lbCgpOwo+ICAgICAgICAgbWVtYmxvY2tfZHVtcF9hbGwoKTsK
PiBAQCAtMTM4Niw2ICsxMzkwLDcgQEAgdm9pZCBfX2luaXQgbWlzY19tZW1faW5pdCh2b2lkKQo+
ICBpbnQgX19tZW1pbml0IHZtZW1tYXBfcG9wdWxhdGUodW5zaWduZWQgbG9uZyBzdGFydCwgdW5z
aWduZWQgbG9uZyBlbmQsIGludCBub2RlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3Qgdm1lbV9hbHRtYXAgKmFsdG1hcCkKPiAgewo+ICsgICAgICAgLyogRGVmZXIgdGhl
IHJlcXVpcmVkIFRMQiBmbHVzaCB1bnRpbCB0aGUgZW50aXJlIFZNRU1NQVAgcmVnaW9uIGhhcyBi
ZWVuIHBvcHVsYXRlZCAqLwo+ICAgICAgICAgcmV0dXJuIHZtZW1tYXBfcG9wdWxhdGVfYmFzZXBh
Z2VzKHN0YXJ0LCBlbmQsIG5vZGUsIE5VTEwpOwo+ICB9Cj4gICNlbmRpZgo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMgYi9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKPiBp
bmRleCBlNjY1OWQ3MzY4YjMuLmQxMWE0YWU4N2VjMSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L21tL3RsYmZsdXNoLmMKPiArKysgYi9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKPiBAQCAtMTkz
LDYgKzE5MywxMiBAQCB2b2lkIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UodW5zaWduZWQgbG9uZyBz
dGFydCwgdW5zaWduZWQgbG9uZyBlbmQpCj4gICAgICAgICBfX2ZsdXNoX3RsYl9yYW5nZShOVUxM
LCBzdGFydCwgZW5kIC0gc3RhcnQsIFBBR0VfU0laRSk7Cj4gIH0KPgo+ICsvKiBGbHVzaCBhIHJh
bmdlIG9mIGtlcm5lbCBwYWdlcyB3aXRob3V0IGJyb2FkY2FzdGluZyAqLwo+ICt2b2lkIGxvY2Fs
X2ZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9u
ZyBlbmQpCj4gK3sKPiArICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9yYW5nZV9hc2lkKHN0YXJ0LCBl
bmQgLSBzdGFydCwgUEFHRV9TSVpFLCBGTFVTSF9UTEJfTk9fQVNJRCk7Cj4gK30KPiArCj4gICNp
ZmRlZiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UKPiAgdm9pZCBmbHVzaF9wbWRfdGxiX3Jh
bmdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIHN0YXJ0LAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZW5kKQo+IC0tCj4gMi4zNC4xCj4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
