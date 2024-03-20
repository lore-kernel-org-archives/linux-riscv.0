Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152C2C54E58
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 15:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jen/shzGAI4qXOiuCh6D0yJ2NgQ1MDl2QlP/UsR1h0M=; b=jznXcnC2zu78Dc
	h4Y68/6igpNB/eWJiC7SiBqA1UPWuk2ZZcAUT/xa3RpZAQ9JsOTVHdXf+Hp1VqwMFHjBAtxdUWrpg
	weV9/vTcia21jxYRqRFWibWE2uxUiPsxsies6UOiT3J9Te2ki29XI9Zjswv9z6L0LA3OPVJCPzT4m
	7GU1Y7A2QLYsx+1I1htyjbp2zuXVm4ff6N1ZNOQts8/r36IxXBuGgOU7FGxn6K7eRv+tJkM8VMjht
	WW4jscYAwjQDLa/rvZNj+bDnEhhRzEYHAq0fsZyqeeBrXEns9QFiJ6X1zBuE3D8VmsDh0hdH+Q6Qa
	Xf/VjUr21s3BT9A/jPdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmxQ6-0000000HZDJ-0Zct;
	Wed, 20 Mar 2024 14:59:58 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmxQ2-0000000HZBv-3Drc
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 14:59:56 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-366b45a1515so14898975ab.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Mar 2024 07:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710946793; x=1711551593; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uu3XrTQnPclK188rbkolek/Ountn/o+HfDpmNTirMmE=;
        b=m98uywwHmMnm2ZUpjfGydjE5LCObH0bJ0rXzeBOknEqDchVoM3cu2gVMMTBxdxhOVV
         nY7HP4vXK8sjSRi0yr5zKsIFS3dd8lgaOMz2T8YeXX0oVHPC8jg0i28kEaAvwo/gx6yS
         M7r0rrCIiseqXNX7zKfU58ITQVCEef2tCuWTeRIdXnk0XKcfZG/Evewdi8PWiJUR8TOs
         Gz6nTCHJVkKVf1RKRMixtbI6WzXlpjqR9brIjP+pQRzd/BqxMyHXGv6GV1Hd1TRKc3XI
         1S7WBP5Ounb83KdbKSdjC7vqnqygfwbCi088lrWGAXpgS5Mtg3KUpu1b4YzxolNiuOC3
         B2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710946793; x=1711551593;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uu3XrTQnPclK188rbkolek/Ountn/o+HfDpmNTirMmE=;
        b=i6U7wpXDzMX8znF6hMyy4gTENQDQsqv49tRhgU6dzBO0HHcm0Hd/qBXiLwlEGfpBG+
         bt5PtQMx+c6ml97sZN0AR2xPBnhdkeZ1QE/HUyP3bID4PdaJLGcRrsW7KLXh6FxGZHxB
         5h9/fRL6gKhaoR2sbg/mDdBA3UvtsSs18vktKNZ23sh/ue9D9QF/HvaKW++27E7CoZjK
         +9IxDn45OPv9egp57Edsg9LGl9p7fbg/OcPv+b9p5qeHLp9SXzCceDwBMb+ZmlGDiW3P
         rZo6SkLJEYCrFf+wC4ktZE6RTS0kAFOA+8x1w2FMwl7lMymkQe8pws3mj+3Oga/Aeg8r
         5Umg==
X-Forwarded-Encrypted: i=1; AJvYcCVBFGSkg8bFH8odPE3Hz5x0i5R6xtPLIGEjoa0FF8bCOhIVujeh4TFPvW7SQGzrAx5oisIYkrfQda2Z0q6RBOxjSKGya9ZfR/m4AdpQx9RP
X-Gm-Message-State: AOJu0YzBoBeHKwOrvG/ioeJ8SqmeVjCIHy57QdZv/Gz1ePS4hQqVino5
	Rv/Mr8N/ieo3zuwKnNvHAy7PBD0nRDBdIq3nQRQ+Ebti06TzQidyDIEBFZXaGP0=
X-Google-Smtp-Source: AGHT+IHYs3xz0pWt4lkNcOSOAn3q+vYaOoPxrg3Wre2/j0EachnEDYKI6x8jefgAtnsQtnh4JD77YQ==
X-Received: by 2002:a05:6e02:1a8a:b0:366:c779:f955 with SMTP id k10-20020a056e021a8a00b00366c779f955mr12702751ilv.17.1710946793353;
        Wed, 20 Mar 2024 07:59:53 -0700 (PDT)
Received: from [100.64.0.1] ([136.226.86.189])
        by smtp.gmail.com with ESMTPSA id a9-20020a92d109000000b00366895ef367sm3491581ilb.38.2024.03.20.07.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 07:59:52 -0700 (PDT)
Message-ID: <0a807505-221c-4aa9-ac63-c442417f3030@sifive.com>
Date: Wed, 20 Mar 2024 09:59:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: starfive: jh7100: Use clk_hw for external input
 clocks
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>,
 Hal Feng <hal.feng@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor.dooley@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
References: <beb746c7538a4ff720a25fd8f309da20d8d854ef.1710933713.git.geert@linux-m68k.org>
 <47bddec7-953d-4ea4-84f1-b0dcf0641baa@sifive.com>
 <CAMuHMdWP4R6Y6G0qzhMKJy1zJEeHE8a0XEK+Hs_D4wXB2i2BFA@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAMuHMdWP4R6Y6G0qzhMKJy1zJEeHE8a0XEK+Hs_D4wXB2i2BFA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_075954_998296_8E6DE154 
X-CRM114-Status: GOOD (  15.00  )
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

SGkgR2VlcnQsCgpPbiAyMDI0LTAzLTIwIDk6MjggQU0sIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90
ZToKPiBPbiBXZWQsIE1hciAyMCwgMjAyNCBhdCAyOjMx4oCvUE0gU2FtdWVsIEhvbGxhbmQKPiA8
c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4+IE9uIDIwMjQtMDMtMjAgNjoyNCBB
TSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+Pj4gVGhlIFN0YXJmaXZlIEpINzEwMCBjbG9j
ayBkcml2ZXIgZG9lcyBub3QgdXNlIHRoZSBEVCAiY2xvY2tzIiBwcm9wZXJ0eQo+Pj4gdG8gZmlu
ZCB0aGUgZXh0ZXJuYWwgbWFpbiBpbnB1dCBjbG9jaywgYnV0IGluc3RlYWQgcmVsaWVzIG9uIHRo
ZSBuYW1lIG9mCj4+PiB0aGUgYWN0dWFsIGNsb2NrIHByb3ZpZGVyICgib3NjX3N5cyIpLiAgVGhp
cyBpcyBmcmFnaWxlLCBhbmQgY2F1c2VkCj4+PiBicmVha2FnZSB3aGVuIHNhbml0aXppbmcgY2xv
Y2sgbm9kZSBuYW1lcyBpbiBEVFMuCj4+Pgo+Pj4gRml4IHRoaXMgYnkgb2J0YWluaW5nIHRoZSBl
eHRlcm5hbCBtYWluIGlucHV0IGNsb2NrIHVzaW5nCj4+PiBkZXZtX2Nsa19nZXQoKSwgYW5kIHBh
c3NpbmcgdGhlIHJldHVybmVkIGNsa19odyBvYmplY3QgdG8KPj4+IGRldm1fY2xrX2h3X3JlZ2lz
dGVyX2ZpeGVkX2ZhY3Rvcl9wYXJlbnRfaHcoKS4KPj4+Cj4+PiBXaGlsZSBuYW1lLWJhc2VkIGxv
b2stdXAgb2YgdGhlIG90aGVyIGV4dGVybmFsIGlucHV0IGNsb2NrcyB3b3JrcyBhcy1pcywKPj4+
IGNvbnZlcnQgdGhlbSB0byBhIHNpbWlsYXIgY2xrX2h3LWJhc2VkIHNjaGVtZSB0byBpbmNyZWFz
ZSB1bmlmb3JtaXR5LAo+Pj4gYW5kIHRvIGRlY3JlYXNlIHRoZSBudW1iZXIgb2YgbmFtZS1iYXNl
ZCBsb29rLXVwcy4KPj4+Cj4+PiBGaXhlczogZjAzNjA2NDcwODg2ICgicmlzY3Y6IGR0czogc3Rh
cmZpdmU6IHJlcGxhY2UgdW5kZXJzY29yZXMgaW4gbm9kZSBuYW1lcyIpCj4+PiBGaXhlczogNDIx
MGJlNjY4YTA5ZWUyMCAoImNsazogc3RhcmZpdmU6IEFkZCBKSDcxMDAgY2xvY2sgZ2VuZXJhdG9y
IGRyaXZlciIpCj4+PiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxp
bnV4LW02OGsub3JnPgo+IAo+IAo+Pj4gLS0tIGEvZHJpdmVycy9jbGsvc3RhcmZpdmUvY2xrLXN0
YXJmaXZlLWpoNzEwMC5jCj4+PiArKysgYi9kcml2ZXJzL2Nsay9zdGFyZml2ZS9jbGstc3RhcmZp
dmUtamg3MTAwLmMKPiAKPj4+IEBAIC0yODQsOCArMjkzLDExIEBAIHN0YXRpYyBzdHJ1Y3QgY2xr
X2h3ICpqaDcxMDBfY2xrX2dldChzdHJ1Y3Qgb2ZfcGhhbmRsZV9hcmdzICpjbGtzcGVjLCB2b2lk
ICpkYXRhCj4+Pgo+Pj4gIHN0YXRpYyBpbnQgX19pbml0IGNsa19zdGFyZml2ZV9qaDcxMDBfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4+ICB7Cj4+PiArICAgICBzdGF0aWMg
Y29uc3QgY2hhciAqamg3MTAwX2V4dF9jbGtbRVhUX05VTV9DTEtTXSA9Cj4+PiArICAgICAgICAg
ICAgIHsgIm9zY19zeXMiLCAib3NjX2F1ZCIsICJnbWFjX3JtaWlfcmVmIiwgImdtYWNfZ3JfbWlp
X3J4Y2xrIiB9Owo+Pgo+PiBUaGlzIHNob3VsZCBiZSBfX2luaXRjb25zdC4gT3RoZXJ3aXNlOgo+
IAo+IFdpdGgKPiAKPiAgICAgLSAgICAgICBzdGF0aWMgY29uc3QgY2hhciAqamg3MTAwX2V4dF9j
bGtbRVhUX05VTV9DTEtTXSA9Cj4gICAgICsgICAgICAgc3RhdGljIGNvbnN0IGNoYXIgKmpoNzEw
MF9leHRfY2xrW0VYVF9OVU1fQ0xLU10gX19pbml0Y29uc3QgPQo+IAo+IEkgZ2V0Ogo+IAo+ICAg
ICBkcml2ZXJzL2Nsay9zdGFyZml2ZS9jbGstc3RhcmZpdmUtamg3MTAwLmM6IEluIGZ1bmN0aW9u
Cj4g4oCYY2xrX3N0YXJmaXZlX2poNzEwMF9wcm9iZeKAmToKPiAgICAgZHJpdmVycy9jbGsvc3Rh
cmZpdmUvY2xrLXN0YXJmaXZlLWpoNzEwMC5jOjM1OjM3OiBlcnJvcjoKPiDigJhqaDcxMDBfY2xr
X2RhdGHigJkgY2F1c2VzIGEgc2VjdGlvbiB0eXBlIGNvbmZsaWN0IHdpdGgg4oCYamg3MTAwX2V4
dF9jbGvigJkKPiAgICAgICAgMzUgfCBzdGF0aWMgY29uc3Qgc3RydWN0IGpoNzF4MF9jbGtfZGF0
YSBqaDcxMDBfY2xrX2RhdGFbXQo+IF9faW5pdGNvbnN0ID0gewo+ICAgICAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fgo+ICAgICBkcml2
ZXJzL2Nsay9zdGFyZml2ZS9jbGstc3RhcmZpdmUtamg3MTAwLmM6Mjk2OjI4OiBub3RlOgo+IOKA
mGpoNzEwMF9leHRfY2xr4oCZIHdhcyBkZWNsYXJlZCBoZXJlCj4gICAgICAgMjk2IHwgICAgICAg
ICBzdGF0aWMgY29uc3QgY2hhciAqamg3MTAwX2V4dF9jbGtbRVhUX05VTV9DTEtTXQo+IF9faW5p
dGNvbnN0ID0KPiAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+
fn5+fn5+fgo+IAo+IHdoaWNoIGlzIGEgYml0IHN0cmFuZ2UuLi4KPiBXaGF0IGFtIEkgbWlzc2lu
Zz8KCkkgdGhpbmsgeW91IG5lZWQgdG8gYWRkIGFub3RoZXIgImNvbnN0IiBjb3ZlcmluZyB0aGUg
YXJyYXkgaXRzZWxmOgoKCXN0YXRpYyBjb25zdCBjaGFyICpjb25zdCBqaDcxMDBfZXh0X2Nsa1tF
WFRfTlVNX0NMS1NdIF9faW5pdGNvbnN0ID0KClJlZ2FyZHMsClNhbXVlbAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
