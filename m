Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C16C001DF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 20:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RqWIBMeqnThErEYGPohC3mDuHbzjOdjQHm5IdPiobAs=; b=YtbltfitWNohSc
	fhpIb92TlZVqBhTzHEqJfKSZKJ6A+YzbP4BBXNh0k7obw1IfxQQQA8pXpghwgxq4gIKAqR8U9FIX3
	REWkrt39trmWdzKaX2cf+McJx2L+HniLyY6o2FjcUrk/4nVHsWyIAhQ3gedulHE5jd5bi8Yj2Ks3g
	d8nRz7i/ZFZaG/LVl8H8JPjEP4hY8fBwBTEXGkO6TvUL+rx+I6afBC924dIe7yLLGSJDKA7eS6beH
	27hILXXqhExwgvcH0s4ajS+M+4ll8RwPenU+9aJP/ELBGr8XCZ7dWWFXxzUVhrQTDdK1prTzXLwuD
	TabHCqabp7tfU0tytMPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRIFw-005o7K-0A;
	Wed, 02 Aug 2023 20:15:40 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRIFs-005o6U-3C
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 20:15:38 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bc34b32785so2010995ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 13:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691007334; x=1691612134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqaiD0oWwblWodb1STkSm+MDiqVpucLuhqfe3hzQhdE=;
        b=yAiX8FxYkc605M0cG+7yI0Nl+xuCcB1+e2VLfkaxupBO4Hj4NNiGpqu1274aRHw/KB
         QFTNVLNa2vGOhhLnixSOScJrplMeRvS6oweKOEiuYnxobjOL980rDlte4j8dvjXY82dL
         JLVEYMK1nPzTZMK1x5bzfn0tY3JhzreMu/znJxGySZrF8hq4I7VWEfjgXn3zWMR3+57H
         IRf+OcXBUUPMf+yycDv7kFDnp4dGE8uJACu/C93f0R/plZXHkX7E/p9Xbcd34jFW3CdN
         pomzxFkfzRUvhRLvj6raPg5WHZI9z56OG97ChW6kAjslaZA72E9OyTlUnZwXw0MB4f9Y
         vZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691007334; x=1691612134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bqaiD0oWwblWodb1STkSm+MDiqVpucLuhqfe3hzQhdE=;
        b=PeEz010lv/Us7XNA3GQF563jT6ly923QhafDh6s9nHjYfSVCQ6/55Kqf5qq716HtCg
         UV+5ZNMWy3A2pwmyKqe+aQL3t6dihrh1bSnJ4YDgpeTStODGVwuSQRoDDcKt40jRTyMg
         8m0kO7jBYK7UAZ29qVm9OY1TqLQZu2Z8dl6isprRPj7XyO/5slFbqQkDgGozxt9RUXP8
         zDYzYRuDP0CVaYduIXbeEEyHcq8VUv+mt4xwd/1OPIJ0xVbrWVwL5DuI2Fr3tzyO2jB1
         GbQ3w4vNfFBugg8zz2MA0IeFuE2PsyZFNxjSAnfpZ9+KjFL7D7skz88mL1J5Nw82+qUF
         9kLQ==
X-Gm-Message-State: AOJu0YyVSonoo8hDNSi+FH9UKATL9AQC92yZ4Pj05RvfFxo6pJOU+gJ7
	4ndE0h4cEt1ZecTNO4MTFsDm1B7Hb7pJoBjYISLlfA==
X-Google-Smtp-Source: AGHT+IEldlUzLdMbLeNZ5QAQ0zR94lcB3YjBYjuINZSrYFnfre7W0+RGSobst9wqQSqSuGXumKZlxDhigTUDgnGM86U=
X-Received: by 2002:a17:90b:110f:b0:268:fb85:3b2 with SMTP id
 gi15-20020a17090b110f00b00268fb8503b2mr3104373pjb.7.1691007333727; Wed, 02
 Aug 2023 13:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689792825.git.tjeznach@rivosinc.com> <c33c24036c06c023947ecb47177da273569b3ac7.1689792825.git.tjeznach@rivosinc.com>
 <CANXhq0qRYvTffMnep-aQyTq2tMxbP-s_Lunc+cZ2Rio+BvAE=g@mail.gmail.com>
In-Reply-To: <CANXhq0qRYvTffMnep-aQyTq2tMxbP-s_Lunc+cZ2Rio+BvAE=g@mail.gmail.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Wed, 2 Aug 2023 13:15:22 -0700
Message-ID: <CAH2o1u5Sr0XigUbhna0E-Zk=U76CLZZ4LbM0u4ahPaN5+nOK6A@mail.gmail.com>
Subject: Re: [PATCH 01/11] RISC-V: drivers/iommu: Add RISC-V IOMMU - Ziommu support.
To: Zong Li <zong.li@sifive.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, 
	linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_131537_246715_6CB53150 
X-CRM114-Status: GOOD (  18.47  )
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

T24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgNzo0MuKAr1BNIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1bCAyMCwgMjAyMyBhdCAzOjM04oCvQU0gVG9tYXN6
IEplem5hY2ggPHRqZXpuYWNoQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4gK3N0YXRpYyBp
bnQgcmlzY3ZfaW9tbXVfcGxhdGZvcm1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPiA+ICt7Cj4gPiArICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4g
PiArICAgICAgIHN0cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11ID0gTlVMTDsKPiA+ICsg
ICAgICAgc3RydWN0IHJlc291cmNlICpyZXMgPSBOVUxMOwo+ID4gKyAgICAgICBpbnQgcmV0ID0g
MDsKPiA+ICsKPiA+ICsgICAgICAgaW9tbXUgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmlv
bW11KSwgR0ZQX0tFUk5FTCk7Cj4gPiArICAgICAgIGlmICghaW9tbXUpCj4gPiArICAgICAgICAg
ICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gPiArCj4gPiArICAgICAgIGlvbW11LT5kZXYgPSBkZXY7
Cj4gPiArICAgICAgIGRldl9zZXRfZHJ2ZGF0YShkZXYsIGlvbW11KTsKPiA+ICsKPiA+ICsgICAg
ICAgcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsK
PiA+ICsgICAgICAgaWYgKCFyZXMpIHsKPiA+ICsgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwg
ImNvdWxkIG5vdCBmaW5kIHJlc291cmNlIGZvciByZWdpc3RlciByZWdpb25cbiIpOwo+ID4gKyAg
ICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gKyAgICAgICB9Cj4gPiArCj4gPiArICAg
ICAgIGlvbW11LT5yZWcgPSBkZXZtX3BsYXRmb3JtX2dldF9hbmRfaW9yZW1hcF9yZXNvdXJjZShw
ZGV2LCAwLCAmcmVzKTsKPiA+ICsgICAgICAgaWYgKElTX0VSUihpb21tdS0+cmVnKSkgewo+ID4g
KyAgICAgICAgICAgICAgIHJldCA9IGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGlvbW11LT5y
ZWcpLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImNvdWxkIG5vdCBt
YXAgcmVnaXN0ZXIgcmVnaW9uXG4iKTsKPiA+ICsgICAgICAgICAgICAgICBnb3RvIGZhaWw7Cj4g
PiArICAgICAgIH07Cj4gPiArCj4gPiArICAgICAgIGlvbW11LT5yZWdfcGh5cyA9IHJlcy0+c3Rh
cnQ7Cj4gPiArCj4gPiArICAgICAgIHJldCA9IC1FTk9ERVY7Cj4gPiArCj4gPiArICAgICAgIC8q
IFNhbml0eSBjaGVjazogRGlkIHdlIGdldCB0aGUgd2hvbGUgcmVnaXN0ZXIgc3BhY2UgPyAqLwo+
ID4gKyAgICAgICBpZiAoKHJlcy0+ZW5kIC0gcmVzLT5zdGFydCArIDEpIDwgUklTQ1ZfSU9NTVVf
UkVHX1NJWkUpIHsKPiA+ICsgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgImRldmljZSByZWdp
b24gc21hbGxlciB0aGFuIHJlZ2lzdGVyIGZpbGUgKDB4JWxseClcbiIsCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICByZXMtPmVuZCAtIHJlcy0+c3RhcnQpOwo+ID4gKyAgICAgICAgICAgICAg
IGdvdG8gZmFpbDsKPiA+ICsgICAgICAgfQo+Cj4gQ291bGQgd2UgYXNzdW1lIHRoYXQgRFQgc2hv
dWxkIGJlIHJlc3BvbnNpYmxlIGZvciBzcGVjaWZ5aW5nIHRoZSByaWdodCBzaXplPwo+CgpUaGlz
IG9ubHkgdG8gdmFsaWRhdGUgRFQgcHJvdmlkZWQgaW5mbyBhbmQgZHJpdmVyIGV4cGVjdGVkIHJl
Z2lzdGVyCmZpbGUgc2l6ZS4gRXhwZWN0YXRpb24gaXMgdGhhdCBEVCB3aWxsIHByb3ZpZGUgcmln
aHQgc2l6ZS4KCgo+ID4gK3N0YXRpYyBzdHJ1Y3QgaW9tbXVfZG9tYWluICpyaXNjdl9pb21tdV9k
b21haW5fYWxsb2ModW5zaWduZWQgdHlwZSkKPiA+ICt7Cj4gPiArICAgICAgIHN0cnVjdCByaXNj
dl9pb21tdV9kb21haW4gKmRvbWFpbjsKPiA+ICsKPiA+ICsgICAgICAgaWYgKHR5cGUgIT0gSU9N
TVVfRE9NQUlOX0lERU5USVRZICYmCj4gPiArICAgICAgICAgICB0eXBlICE9IElPTU1VX0RPTUFJ
Tl9CTE9DS0VEKQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ID4gKwo+ID4gKyAg
ICAgICBkb21haW4gPSBremFsbG9jKHNpemVvZigqZG9tYWluKSwgR0ZQX0tFUk5FTCk7Cj4gPiAr
ICAgICAgIGlmICghZG9tYWluKQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ID4g
Kwo+ID4gKyAgICAgICBtdXRleF9pbml0KCZkb21haW4tPmxvY2spOwo+ID4gKyAgICAgICBJTklU
X0xJU1RfSEVBRCgmZG9tYWluLT5lbmRwb2ludHMpOwo+ID4gKwo+ID4gKyAgICAgICBkb21haW4t
PmRvbWFpbi5vcHMgPSAmcmlzY3ZfaW9tbXVfZG9tYWluX29wczsKPiA+ICsgICAgICAgZG9tYWlu
LT5tb2RlID0gUklTQ1ZfSU9NTVVfRENfRlNDX01PREVfQkFSRTsKPiA+ICsgICAgICAgZG9tYWlu
LT5wc2NpZCA9IGlkYV9hbGxvY19yYW5nZSgmcmlzY3ZfaW9tbXVfcHNjaWRzLCAxLAo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFJJU0NWX0lPTU1VX01BWF9QU0NJ
RCwgR0ZQX0tFUk5FTCk7Cj4gPiArCj4gPiArICAgICAgIHByaW50aygiZG9tYWluIHR5cGUgJXgg
YWxsb2MgJXVcbiIsIHR5cGUsIGRvbWFpbi0+cHNjaWQpOwo+ID4gKwo+Cj4gQ291bGQgaXQgdXNl
cyBwcl94eHggaW5zdGVhZCBvZiBwcmludGs/Cj4KCkFic29sdXRlbHksIGZpeGVkIGhlcmUgYW5k
IGVsc2V3aGVyZS4gQWxzbywgdXNlZCBkZXZfZGJnIHdoZXJldmVyIGFwcGxpY2FibGUuCgo+ID4g
Kwo+ID4gK3N0YXRpYyBpbnQgcmlzY3ZfaW9tbXVfZW5hYmxlKHN0cnVjdCByaXNjdl9pb21tdV9k
ZXZpY2UgKmlvbW11LCB1bnNpZ25lZCByZXF1ZXN0ZWRfbW9kZSkKPiA+ICt7Cj4gPiArICAgICAg
IHN0cnVjdCBkZXZpY2UgKmRldiA9IGlvbW11LT5kZXY7Cj4gPiArICAgICAgIHU2NCBkZHRwID0g
MDsKPiA+ICsgICAgICAgdTY0IGRkdHBfcGFkZHIgPSAwOwo+ID4gKyAgICAgICB1bnNpZ25lZCBt
b2RlID0gcmVxdWVzdGVkX21vZGU7Cj4gPiArICAgICAgIHVuc2lnbmVkIG1vZGVfcmVhZGJhY2sg
PSAwOwo+ID4gKwo+ID4gKyAgICAgICBkZHRwID0gcmlzY3ZfaW9tbXVfZ2V0X2RkdHAoaW9tbXUp
Owo+ID4gKyAgICAgICBpZiAoZGR0cCAmIFJJU0NWX0lPTU1VX0REVFBfQlVTWSkKPiA+ICsgICAg
ICAgICAgICAgICByZXR1cm4gLUVCVVNZOwo+ID4gKwo+ID4gKyAgICAgICAvKiBEaXNhbGxvdyBz
dGF0ZSB0cmFuc3Rpb24gZnJvbSB4TFZMIHRvIHhMVkwuICovCj4gPiArICAgICAgIHN3aXRjaCAo
RklFTERfR0VUKFJJU0NWX0lPTU1VX0REVFBfTU9ERSwgZGR0cCkpIHsKPiA+ICsgICAgICAgY2Fz
ZSBSSVNDVl9JT01NVV9ERFRQX01PREVfQkFSRToKPiA+ICsgICAgICAgY2FzZSBSSVNDVl9JT01N
VV9ERFRQX01PREVfT0ZGOgo+ID4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gKyAgICAgICBk
ZWZhdWx0Ogo+ID4gKyAgICAgICAgICAgICAgIGlmICgobW9kZSAhPSBSSVNDVl9JT01NVV9ERFRQ
X01PREVfQkFSRSkKPiA+ICsgICAgICAgICAgICAgICAgICAgJiYgKG1vZGUgIT0gUklTQ1ZfSU9N
TVVfRERUUF9NT0RFX09GRikpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsKPiA+ICsgICAgICAgICAgICAgICBicmVhazsKPiA+ICsgICAgICAgfQo+ID4gKwo+ID4g
KyByZXRyeToKPgo+IFdlIG5lZWQgdG8gY29uc2lkZXIgdGhlIGBpb21tdS5wYXNzdGhyb3VnaGAg
YmVmb3JlIHdlIHNldCB1cCB0aGUgbW9kZQo+IGluIHN3aXRjaCBjYXNlLCBzb21ldGhpbmcgbGlr
ZQo+CgpUaGlzIGZ1bmN0aW9uIGlzIG9ubHkgdG8gZXhlY3V0ZSBjb25maWd1cmF0aW9uIGFuZCBz
ZXQgZGV2aWNlIGRpcmVjdG9yeSBtb2RlLgpIYW5kbGluZyBnbG9iYWwgaW9tbXUucGFzc3Rocm91
Z2ggcG9saWN5IGlzIGltcGxlbWVudGVkIGluCnJpc2N2X2lvbW11X2luaXQoKSBjYWxsIChwYXRj
aCAjNykuCgpCZXN0LAotIFRvbWFzegoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
