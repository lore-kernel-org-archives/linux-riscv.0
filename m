Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7B7EB8FAD
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 09:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pb1SqrRex/UvYELxqENyjEw9WCJQkCmIVz79ha2iQrc=; b=pspy6i4xfMXx4o
	dQ/VbIZtvr/tXTg1OpI+b4mi0Xt9HtwQf2eT27GovZZQFvbIGHRKYNxr3u+Oj/QxeY4lJyshZc3TA
	3Plwo+3GVkj2XnLtCKKbZyex8pTQBmfXB9ADvtvx+b6JLx//VSeJ0rbemwQQ5UyX7XBbU3lplV5Vk
	8QkRh0bWk/37lN5GeGt6sqK9uaYpEgjz5li7I39MnURHHt85q+tX/YRVnHmFdYcasMJaoPEli7eId
	CXN5fy+n0IZEQvFAoXvBJqFi3bvb2ZX8XB/luH5hZ+A1x4k+RTJgA1iXgZ8eg8wUv2rS2J2pE3las
	eIfct2VyEyjKPnmIPldw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdoPY-007pxL-2H;
	Wed, 06 Sep 2023 09:01:20 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdoPV-007puc-0g;
	Wed, 06 Sep 2023 09:01:18 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2bd0d135ca3so57734751fa.3;
        Wed, 06 Sep 2023 02:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693990872; x=1694595672; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGBcwbFPU/bGY4zSYaJ1ifEXL5+F/gokQ5BwkUen+qA=;
        b=MDJ3py+nLLnM1kOagdPDAnrXslSRo9OTU2UeXMY9BwC8jgFFG7/ZEKuNhWSZKeXtdX
         a/4ikCya1gWWrMGYwT8jeMJxd0i/5jO0c6XbsH8NELGVeTOUweVVS65S8ZAX28EUghuB
         FSTj+S/7JkbS0nyWazVo9rDWpW4W8BujbPwOJUs+Xvn+D6htLPxTy24mCNr0lyqSV/5X
         2tOfEt/PNEy4Uz3xcFLnPDLYByMppqB/2Q7ZyPc0Ey/sOMbcek33athdonvXzvsyd49A
         jTK3dKJAOtgS/SMSDfKsyO+9jLnjnkNJmsVuOd9lvIAzj1qv8kPBC+2ZK4z5y6l8KhIB
         3ZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693990872; x=1694595672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGBcwbFPU/bGY4zSYaJ1ifEXL5+F/gokQ5BwkUen+qA=;
        b=SNjIKoXXmvUyzJHkYfUBaA7+l6+VNoRcfqQDdBNiipZksJ5nLLAHl8dpZmwai6iOVM
         YcW6UDy/7kJbENNKA5hEWgMcrdqFIlu9Fee4WceZh3OM+4hcbNjiONW80gLXsZMFXzSJ
         S00xt14UkT/QVUuoFYKvSXNMZaMgfH52nwPKvmNCA9o/rmrITLlKSj1ftPD3+30QxdAo
         QAmfQLq49R15h1F1A+BTgfNsJyVFkz6UX5+MzXRSp2pcWbce/eN7X60rFzfp0pfZAbuf
         f2mezGwq+QHyVt9Y1An+aqX6Gdc6JpWquFCv9UE3wr4Rcs63f2dGj+3mxixOIU4+xSN7
         6ySQ==
X-Gm-Message-State: AOJu0YzQ+3XZaXQcIUlq6zdqAXNJcMqScoJbBrhVDNZlHULYGqKhebfP
	K7GwJylrTUMYh4BNca+8Xk0ixRfnAWoSZVoPh1s=
X-Google-Smtp-Source: AGHT+IFEeFdFaGaTLQBI687uLLemZurhXtmM5YDshrwY9B8n6Jsr0TB3y/S2wMiOM3uqcoQPE8js1WezowOosvA6ZU4=
X-Received: by 2002:a2e:3603:0:b0:2b9:e53f:e201 with SMTP id
 d3-20020a2e3603000000b002b9e53fe201mr1722458lja.31.1693990872213; Wed, 06 Sep
 2023 02:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693659382.git.haibo1.xu@intel.com> <c87337cfd7fb135e2efed589360a78c26a402eac.1693659382.git.haibo1.xu@intel.com>
 <20230904-11e853ffe3d8e9cf9ec6079d@orel> <CAJve8onwjBQcbVy75qyOF3A51-T0WyBkmeCV_wOZvzaPcrBVFg@mail.gmail.com>
 <CAJve8ok-zZAG7T3t5XD-CtJn47tTE867Xaaw_YHYy1XmUL41rw@mail.gmail.com> <20230906-3f0318fa20365f9211998bae@orel>
In-Reply-To: <20230906-3f0318fa20365f9211998bae@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 6 Sep 2023 17:01:00 +0800
Message-ID: <CAJve8omsTQB04dZDCtK=0Fz3ExTuPFVQKvxz9Du5WyfqOwnuSg@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] KVM: arm64: selftest: Split arch_timer test code
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	David Matlack <dmatlack@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Ackerley Tng <ackerleytng@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Vipin Sharma <vipinsh@google.com>, Lei Wang <lei4.wang@intel.com>, Like Xu <likexu@tencent.com>, 
	Peter Gonda <pgonda@google.com>, Maxim Levitsky <mlevitsk@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	David Woodhouse <dwmw@amazon.co.uk>, Michal Luczaj <mhal@rbox.co>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_020117_253180_AAD5F49F 
X-CRM114-Status: GOOD (  20.31  )
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

T24gV2VkLCBTZXAgNiwgMjAyMyBhdCAzOjAx4oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIFNlcCAwNiwgMjAyMyBhdCAxMTo0NDoy
NkFNICswODAwLCBIYWlibyBYdSB3cm90ZToKPiA+IE9uIFdlZCwgU2VwIDYsIDIwMjMgYXQgMTA6
MTTigK9BTSBIYWlibyBYdSA8eGlhb2JvNTV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+
IE9uIE1vbiwgU2VwIDQsIDIwMjMgYXQgOToyNOKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+IC4uLgo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gK2VudW0g
Z3Vlc3Rfc3RhZ2Ugewo+ID4gPiA+ID4gKyAgICAgR1VFU1RfU1RBR0VfVlRJTUVSX0NWQUw9MSwK
PiA+ID4gPiA+ICsgICAgIEdVRVNUX1NUQUdFX1ZUSU1FUl9UVkFMLAo+ID4gPiA+ID4gKyAgICAg
R1VFU1RfU1RBR0VfUFRJTUVSX0NWQUwsCj4gPiA+ID4gPiArICAgICBHVUVTVF9TVEFHRV9QVElN
RVJfVFZBTCwKPiA+ID4gPiA+ICsgICAgIEdVRVNUX1NUQUdFX01BWCwKPiA+ID4gPiA+ICt9Owo+
ID4gPiA+Cj4gPiA+ID4gVGhpcyBlbnVtIGFsc28gYmVsb25ncyBpbiBhYXJjaDY0L2FyY2hfdGlt
ZXIuYwo+ID4gPiA+Cj4gPiA+Cj4gPiA+IFllcywgaXQgc2hvdWxkIGJlIGluIGFhcmNoNjQvYXJj
aF90aW1lci5jCj4gPiA+Cj4gPgo+ID4gQWZ0ZXIgbW92aW5nIHRoZSBhYm92ZSBlbnVtIGRlZmlu
aXRpb24gdG8gYWFyY2g2NC9hcmNoX3RpbWVyLmMsIHRoZQo+ID4gYmVsb3cgZXJyb3JzIHdhcyBy
ZXBvcnRlZAo+ID4gd2hpbGUgY29tcGlsaW5nIGt2bS9hcmNoX3RpbWVyLm8KPiA+Cj4gPiBpbmNs
dWRlL3RpbWVyX3Rlc3QuaDozNzoyNjogZXJyb3I6IGZpZWxkIOKAmGd1ZXN0X3N0YWdl4oCZIGhh
cyBpbmNvbXBsZXRlIHR5cGUKPiA+ICAgIDM3IHwgICAgICAgICBlbnVtIGd1ZXN0X3N0YWdlIGd1
ZXN0X3N0YWdlOwo+ID4gICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF5+fn5+fn5+fn5+Cj4gPgo+ID4gU2luY2Uga3ZtL2FyY2hfdGltZXIuYyB3YXMgaW5k
ZXBlbmRlbnQgb2Yga3ZtL2FhcmNoNjQvYXJjaF90aW1lci5jCj4gPiBkdXJpbmcgT0JKIGNvbXBp
bGluZywKPiA+IEkgdGhpbmsgaXQgbWF5IGJlIG5vdCBwb3NzaWJsZSB0byBtb3ZlIHRoZSBlbnVt
IGRlZmluaXRpb24gdG8KPiA+IGFhcmNoNjQvYXJjaF90aW1lci5jCj4gPgo+ID4gSWYgd2Uga2Vl
cCB0aGUgZGVmaW5pdGlvbiBpbiB0aGlzIGhlYWRlciBmaWxlLCB3ZSBjYW4gZW5jbG9zZSBpdCB3
aXRoCj4gPiAjaWZkZWYgX19hYXJjaDY0X18gZm9yIGFhcmNoNjQgb25seS4KPiA+Cj4KPiBMZXQn
cyBjaGFuZ2Ugc3RydWN0IHRlc3RfdmNwdV9zaGFyZWRfZGF0YSB0bwo+Cj4gIHN0cnVjdCB0ZXN0
X3ZjcHVfc2hhcmVkX2RhdGEgewo+ICAgICAgICAgaW50IG5yX2l0ZXI7Cj4gICAgICAgICBpbnQg
Z3Vlc3Rfc3RhZ2U7Cj4gICAgICAgICB1aW50NjRfdCB4Y250Owo+ICB9Owo+Cj4gYW5kIHRoZW4g
bGV0IHRoZSBhYXJjaDY0IGNvZGUgdHJlYXQgZ3Vlc3Rfc3RhZ2UgYXMgYW4gZW51bSBhbmQgdGhl
IHJpc2N2Cj4gY29kZSBjYW4gY29tcGxldGVseSBpZ25vcmUgaXQgKG5vIG5lZWQgdG8gY3JlYXRl
IGFuIHVudXNlZCBlbnVtKS4KPgoKR29vZCBpZGVhISBXaWxsIGZpeCBpdCBpbiB2My4KCj4gVGhh
bmtzLAo+IGRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
