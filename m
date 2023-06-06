Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E17CC7EE37
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 22:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bwlDtRq95agQtOYkkp5+RNVgyo1GBehnygY+zSoJNKU=; b=R5LK6EQ5uwfDGb
	J2g9gwhyicz3cZyb+6calEEZ8xWNwHzJwYw5n0Yx4hqSrO40pkJ2yTRIo/fM+Qxe0Ca8i7DA98zkr
	St1T7b5oy1yyg2bgbPQtoQE2f/S5d2GVKiw+hghOv5wJ+/k5m6rEcJow4bZkqo9SqKXoI1hRh97S5
	hdhg1fpyfKg+ipHItMdZPhETDBoxMh++PQ/lBJ1GR3DaoIH5uACqOIuVD/GsUTSr6Os3WoONpfXe5
	o94inGSGLNM7TL+O3/aRmsjrV+/d16iP7g1vhomTvzCFoaE8UMxZAmBOnqBLYWdomHlkeEKwAysdA
	MfAQH515/MScx3Q/Txag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6fYn-003WHK-10;
	Tue, 06 Jun 2023 22:53:53 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6fYl-003WFA-05
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 22:53:52 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f122ff663eso8295740e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jun 2023 15:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1686092027; x=1688684027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjJMiQ5w1XTPPbpdRBELR1zKtrWIvK1twSB7HWY4pu8=;
        b=mfskhz4iEylIjlHni1fvj3nELXtwocVQsqkILmDfLRyghnqtTZFCzI+Gab38jBRltq
         n4853KaTlAWS1M/yVUy+e8SLsResMCgkqobcG5KE0I9jC58+y2vwKOXQaLFSGxtNC3EZ
         qKqL3rd9sZVbpc1ZW89zUMZueMELW1MNfxSCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686092027; x=1688684027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjJMiQ5w1XTPPbpdRBELR1zKtrWIvK1twSB7HWY4pu8=;
        b=AAuvki4KIp4XBgKre2V7gewJG4XhBB00AB9Xf6FyagUgnrjUYoKWaee8SpwOv9wQk2
         GCAyKwEYyMIDTu4XrRjMUcsa+gyVE7I7SJUZVjrC0C+57pfS2jN14skKBapYAv6mAtKd
         3q6sZEyuyxPMY0+cKc35LYOK+gQuL3nw9ipxS4Q9R3CTZeqR+FhauZqkHoB6UIDtaK8F
         qzZjeytDOZzqLjF44VrlZ3hjTtaGi29paGA1sWODvLm3V06zzXBVEjkmpkffetponwh9
         vjLjxamEFjVkIlAIi0Dq39QGwnY/epc+R4Vh18BMOQlFbRFqIhmtV4S+itf5wJS25ayn
         hjYw==
X-Gm-Message-State: AC+VfDzmK44P568+xKLtrnhbF6jkCg/a/+U7B5L2aJMENuxdKuHKGw1q
	5TDrl+j1nm/0+ZTJxCdmZqwQxNr2m0TEkdiFU9zE
X-Google-Smtp-Source: ACHHUZ7gSkQmw1YJLMlVzZ00W76dJMzR9peUN3YL4RBzO3ovm1RvKi+qFvcmNU7mz3JiSjCw5WFvJuiT2SqQe3bqj2o=
X-Received: by 2002:a2e:9795:0:b0:2ae:d39c:4c36 with SMTP id
 y21-20020a2e9795000000b002aed39c4c36mr1492715lji.7.1686092027210; Tue, 06 Jun
 2023 15:53:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230517105135.1871868-1-apatel@ventanamicro.com> <20230517105135.1871868-5-apatel@ventanamicro.com>
In-Reply-To: <20230517105135.1871868-5-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 6 Jun 2023 15:53:35 -0700
Message-ID: <CAOnJCUKpPAZ5-49xNxhYRZ01o9pbQx84j3xbtL-5CsJuSrR18g@mail.gmail.com>
Subject: Re: [PATCH 04/10] RISC-V: KVM: Set kvm_riscv_aia_nr_hgei to zero
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_155351_066055_8D304A1F 
X-CRM114-Status: GOOD (  16.09  )
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

T24gV2VkLCBNYXkgMTcsIDIwMjMgYXQgMzo1MuKAr0FNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFdlIGhhcmQtY29kZSB0aGUga3ZtX3Jpc2N2X2FpYV9u
cl9oZ2VpIHRvIHplcm8gdW50aWwgSU1TSUMgSFcKPiBndWVzdCBmaWxlIHN1cHBvcnQgaXMgYWRk
ZWQgaW4gS1ZNIFJJU0MtVi4KPgo+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2
ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWEuYyB8IDEwICsrKysr
KysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYS5jIGIvYXJjaC9yaXNjdi9rdm0vYWlh
LmMKPiBpbmRleCBjNzhjMDZkOTllMzkuLjNmOTc1NzU3MDdlYiAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2t2bS9haWEuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYS5jCj4gQEAgLTQwOCw3
ICs0MDgsNyBAQCBpbnQga3ZtX3Jpc2N2X2FpYV9hbGxvY19oZ2VpKGludCBjcHUsIHN0cnVjdCBr
dm1fdmNwdSAqb3duZXIsCj4KPiAgICAgICAgIHJhd19zcGluX3VubG9ja19pcnFyZXN0b3JlKCZo
Z2N0cmwtPmxvY2ssIGZsYWdzKTsKPgo+IC0gICAgICAgLyogVE9ETzogVG8gYmUgdXBkYXRlZCBs
YXRlciBieSBBSUEgaW4ta2VybmVsIGlycWNoaXAgc3VwcG9ydCAqLwo+ICsgICAgICAgLyogVE9E
TzogVG8gYmUgdXBkYXRlZCBsYXRlciBieSBBSUEgSU1TSUMgSFcgZ3Vlc3QgZmlsZSBzdXBwb3J0
ICovCj4gICAgICAgICBpZiAoaGdlaV92YSkKPiAgICAgICAgICAgICAgICAgKmhnZWlfdmEgPSBO
VUxMOwo+ICAgICAgICAgaWYgKGhnZWlfcGEpCj4gQEAgLTYxMCw2ICs2MTAsMTQgQEAgaW50IGt2
bV9yaXNjdl9haWFfaW5pdCh2b2lkKQo+ICAgICAgICAgaWYgKGt2bV9yaXNjdl9haWFfbnJfaGdl
aSkKPiAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2FpYV9ucl9oZ2VpLS07Cj4KPiArICAgICAg
IC8qCj4gKyAgICAgICAgKiBOdW1iZXIgb2YgdXNhYmxlIEhHRUkgbGluZXMgc2hvdWxkIGJlIG1p
bmltdW0gb2YgcGVyLUhBUlQKPiArICAgICAgICAqIElNU0lDIGd1ZXN0IGZpbGVzIGFuZCBudW1i
ZXIgb2YgYml0cyBpbiBIR0VJRQo+ICsgICAgICAgICoKPiArICAgICAgICAqIFRPRE86IFRvIGJl
IHVwZGF0ZWQgbGF0ZXIgYnkgQUlBIElNU0lDIEhXIGd1ZXN0IGZpbGUgc3VwcG9ydAo+ICsgICAg
ICAgICovCj4gKyAgICAgICBrdm1fcmlzY3ZfYWlhX25yX2hnZWkgPSAwOwo+ICsKPiAgICAgICAg
IC8qIEluaXRpYWxpemUgZ3Vlc3QgZXh0ZXJuYWwgaW50ZXJydXB0IGxpbmUgbWFuYWdlbWVudCAq
Lwo+ICAgICAgICAgcmMgPSBhaWFfaGdlaV9pbml0KCk7Cj4gICAgICAgICBpZiAocmMpCj4gLS0K
PiAyLjM0LjEKPgoKUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29t
PgoKLS0gClJlZ2FyZHMsCkF0aXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
