Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6BCEB8FA5
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 06:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7yRdz8+Td7ESVvVafPsNh/JRrpnk9fZGz9PsDM2L0SQ=; b=XsF+YSdaHYnSii
	an6DAJmvDwD17+VQ4RO0V8Q8pYcnpWhavg6NCkVuGaWkXBszya1BWGVtNizq8lkZVrllKnkwQajzZ
	zI0Tv/LXNGcJKHmiq7p3WAT2DcuF6aCwNBRjSD9iKHjEfwerJ68yLWWq69n3pWsLvx30BD88DjTXe
	Pj0tHQIQP3F61vhG2JQYNrgNBdKXO0ImDzrR1YXQS6cYj6ckBvFCL58sySlHK0nCvfZ0lZxG4rpzR
	ZJDN8v5hlMc99ugYtDum1eK1rWQVwOnPTUilGUX84QKDtUJUKUp9SZiV/jz+vXPN4lQkQTS0NzHBg
	IQ8YiOTJkxzwobnzY1Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmV7-007QJx-0w;
	Wed, 06 Sep 2023 06:58:57 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmV4-007QI9-1q;
	Wed, 06 Sep 2023 06:58:55 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2bcfd3220d3so49715661fa.2;
        Tue, 05 Sep 2023 23:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693983531; x=1694588331; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mj5YAk9nW64JbldMW8YdC1sTTtqvjYgtps2lTsCHpYo=;
        b=PJsm3p+I40V84cUkqpOKVfMrSe2BTAoeLbgYDBhYmx6ImH/mO4T1FNYt0KFO07vd4p
         N/QRlP4/FScFwJmW/I5Z0n5z20zllrY1RPnAZdgE8OYkgl4XcwFuQp+nf3JwIEeFDIxL
         sJ+0StnACHHtNrF2OI/9nlaF2YVGY1Q2l64sCVCMGGedWIpTZgVoW7KcYnaCuQHkn/4b
         OIvRVkXIBNWoHdHAY6GrPffzZDZ9DU6MbzqV2xzjsPGoCs+7NQ3KehH27VTOpp7amJPu
         k7bpAidZDQ134hDj3olTwZNDLqDwsUT8CFn7tm7C62YmaXmW50Jp7mKMEca2rX0S6lci
         ZhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693983531; x=1694588331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mj5YAk9nW64JbldMW8YdC1sTTtqvjYgtps2lTsCHpYo=;
        b=jOjBuiBJwc3/VJ7tOy3WeEUweOjy03Wv91myCCl8Kr/eD3jcNKrAA5xp3xqJwg9bIi
         gykXN4yeu8pcvwxan49YZgGgW6KtP9Rei7WruooUFIM+/jLwsx+nX2iG38VHuqjBQUsH
         TtraTBq9Ccy5mLw+ouXrlC8SrRE30BFeRE2tXRCEvjR0GNMLlHxD6USLyQbKek5FTcPZ
         JHd7tRjzYzDAberygCrSpSrBelV5ZaFgln4mdHbmECQpqN6fqf7863tLwOtA6hvHd01A
         U7DYCI3wiBLKkuJj4QG58NSdk6q0gr1WL9GrKtjVMZ/d+gdv///qlqdaP7IhVhd+2+8H
         I2wA==
X-Gm-Message-State: AOJu0YwDx5BzcLHMMCKUTihuNKjv7r16aqSKh7LIWrUhq4glreiT8msd
	BnUpiAkEduh5TGYb8mItceXFxxxeRrDZEM5WqUI=
X-Google-Smtp-Source: AGHT+IE5k4BkYJLpWFCfNUOmKLfmxEPqFdxQE/tVIpYXTE4NnniGY9MqScwe9jg+eEiCfVTG2Yf6yKtZBBdMlQhXqo0=
X-Received: by 2002:a2e:a16f:0:b0:2b9:36d5:729c with SMTP id
 u15-20020a2ea16f000000b002b936d5729cmr1600017ljl.47.1693983530484; Tue, 05
 Sep 2023 23:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693659382.git.haibo1.xu@intel.com> <c87337cfd7fb135e2efed589360a78c26a402eac.1693659382.git.haibo1.xu@intel.com>
 <20230904-11e853ffe3d8e9cf9ec6079d@orel> <CAJve8onwjBQcbVy75qyOF3A51-T0WyBkmeCV_wOZvzaPcrBVFg@mail.gmail.com>
 <20230906-6996fca9840e6de7b75692ec@orel>
In-Reply-To: <20230906-6996fca9840e6de7b75692ec@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 6 Sep 2023 14:58:39 +0800
Message-ID: <CAJve8okKAMp5dG-=rwmP+8ndk_jzOvAz5s8uhU8JdMer5WbEng@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230905_235854_628892_A19E7C8E 
X-CRM114-Status: GOOD (  15.80  )
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

T24gV2VkLCBTZXAgNiwgMjAyMyBhdCAyOjQx4oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIFNlcCAwNiwgMjAyMyBhdCAxMDoxNDo1
MkFNICswODAwLCBIYWlibyBYdSB3cm90ZToKPiA+IE9uIE1vbiwgU2VwIDQsIDIwMjMgYXQgOToy
NOKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4g
Pgo+ID4gPiBPbiBTYXQsIFNlcCAwMiwgMjAyMyBhdCAwODo1OToyNFBNICswODAwLCBIYWlibyBY
dSB3cm90ZToKPiAuLi4KPiA+ID4gPiArCj4gPiA+ID4gKyNpbmNsdWRlICJrdm1fdXRpbC5oIgo+
ID4gPiA+ICsKPiA+ID4gPiArI2RlZmluZSBOUl9WQ1BVU19ERUYgICAgICAgICAgICA0Cj4gPiA+
ID4gKyNkZWZpbmUgTlJfVEVTVF9JVEVSU19ERUYgICAgICAgNQo+ID4gPiA+ICsjZGVmaW5lIFRJ
TUVSX1RFU1RfUEVSSU9EX01TX0RFRiAgICAxMAo+ID4gPiA+ICsjZGVmaW5lIFRJTUVSX1RFU1Rf
RVJSX01BUkdJTl9VUyAgICAxMDAKPiA+ID4gPiArI2RlZmluZSBUSU1FUl9URVNUX01JR1JBVElP
Tl9GUkVRX01TICAgIDIKPiA+ID4gPiArCj4gPiA+ID4gKyNkZWZpbmUgbXNlY3NfdG9fdXNlY3Mo
bXNlYykgICAgKChtc2VjKSAqIDEwMDBMTCkKPiA+ID4KPiA+ID4gSSdkIG1vdmUgdGhlIGFib3Zl
IHRvIGluY2x1ZGUvdGVzdF91dGlsLmgKPiA+ID4KPiA+Cj4gPiBZZXMsIG1zZWNzX3RvX3VzZWNz
KCkgbWFjcm8gc2hvdWxkIGJlIGEgY29tbW9uIEFQSSBmb3IgYWxsIHRoZSB0ZXN0cy4KPiA+Cj4g
PiA+ID4gKwo+ID4gPiA+ICsjZGVmaW5lIEdJQ0RfQkFTRV9HUEEgICAgMHg4MDAwMDAwVUxMCj4g
PiA+ID4gKyNkZWZpbmUgR0lDUl9CQVNFX0dQQSAgICAweDgwQTAwMDBVTEwKPiA+ID4KPiA+ID4g
VGhlc2UgZGVmaW5lcyBiZWxvbmcgaW4gYWFyY2g2NC9hcmNoX3RpbWVyLmMKPiA+ID4KPiA+Cj4g
PiBUaGVzZSAyIGRlZmluZXMgd2VyZSBhbHNvIGRlZmluZWQgaW4gb3RoZXIgdGVzdCBjYXNlcywg
c2hhbGwgd2UgbW92ZSB0aGVtCj4gPiB0byBhbiBhYXJjaDY0IHNwZWNpZmljIGhlYWRlciBmaWxl
PyBNYXliZQo+ID4gdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvYWFyY2g2NC9n
aWMuaD8KPgo+IEV2ZW4gdGhvdWdoIGN1cnJlbnRseSBhbGwgdGhlIGFhcmNoNjQgdGVzdHMgdGhh
dCB1c2UgdGhlIGdpYyBhcmUgdXNpbmcKPiB0aGVzZSBkZWZpbmVzIGZvciB0aGUgYmFzZSBhZGRy
ZXNzZXMsIGVhY2ggdGVzdCBpcyBmcmVlIHRvIGNob29zZSB3aGF0ZXZlcgo+IGJhc2UgYWRkcmVz
c2VzIGl0IGxpa2VzLiBJJ2QganVzdCBtb3ZlIHRoZW0gYmFjayB0byBhYXJjaDY0L2FyY2hfdGlt
ZXIuYwo+IGZvciBub3cuIENvbnNvbGlkYXRpbmcgdGhlbSBpbnRvIHNoYXJlZCwgZGVmYXVsdCBi
YXNlIGFkZHJlc3NlcywgaWYgZG9uZQo+IGF0IGFsbCwgaXMgd29yayBmb3IgYW5vdGhlciBzZXJp
ZXMuCj4KCk9rLCB3aWxsIG1vdmUgdGhlbSB0byBhYXJjaDY0L2FyY2hfdGltZXIuYyBmb3IgdGhp
cyB0ZXN0LgoKPiBUaGFua3MsCj4gZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
