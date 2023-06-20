Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D53FEB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 10:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z7E1nd6bS/7g9dq98M1Znb/bhCIKfUlFIZ4h2ZRu7Pw=; b=SFZEQs8BOy58zm
	9qPzZVV0zBwYCCdVmPVx/4SMQuMoiK6KNPomXFuSp66Oxiavmz6/BZkfQ7j/B9AJfq4Zo90c1h8jV
	Z+jBJRoUvX/ajcJvOaY3duVhwRxA19M2ro4J5vjdRXycD0DAr84OvISi6WNAZANWMf/JjMc9C9pv+
	NKq5LiHmIeTkF1BSqPlv6aQRhwDHBE2A/ZJCpDxgYAamyIG+0kPR7/pCzCm4RBTInZ90DhhIkeG07
	nmaBwHsYWeqc3lMdVo9QtqJIigAisDjvxAwmqhkovForKw1yNnZid8UpybXttnQbG6m5NNRLO2HRM
	/uYVESAYqbZ6ojUMuBkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBYFe-00AoKt-2z;
	Tue, 20 Jun 2023 10:06:18 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBYFc-00AoJq-02;
	Tue, 20 Jun 2023 10:06:17 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b4725e9917so35299261fa.2;
        Tue, 20 Jun 2023 03:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687255571; x=1689847571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtXc4PCbTDlAHZAVqhvtwaRICGJ6lazGNb1ljaV+Ftw=;
        b=ldW/ylsuWZH3AXZueyYlRT0nh9Gl/MhIKISAju1Ir5dsyEDOYv8I/dKPmBee/odzkK
         SDbVl0f1M1Z+H7UtPcorlVsRZ1YEUg+5forY69CwXp/YyhIvg9aUPWStKrGV2gmYsZNf
         NowMzGu9Th8C8x1f9CVWdoHwEa07JlDa8276RyVLTkeEuOuDgoqnuPXbaJN0RQp9CxTN
         scEmXUBZ0g6uTFZ/EWqPVXJUnHpeqXlZJ82NBJRiFQfJgWE85T8UqdlMfqHEootOMNc4
         iiLGC6mmOBawCmItBjo8MjcoUJOAgAXU+CIrdSEtjUQzRSJ6ljr4Z5qpcnpXOjSwCxRp
         vlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687255571; x=1689847571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wtXc4PCbTDlAHZAVqhvtwaRICGJ6lazGNb1ljaV+Ftw=;
        b=aHMekvYk8citsnRfmnRC/F6fSW7z9EvOVTgNFA5ErkloHP6tGpnX+73hy+ADWhS6zB
         WzB2VMp5nDBvrt0w9M01etx05XvDjo25f1CtfEQ05Fc4xXmxzj9z5Dnq/7JeonVLPpUi
         QUBhQJnl3YJWdRyycjdjukJPKhsjsevb8lrLLJLoqvTqxv6Li9brN/czoH9+S/0grWub
         SCg2WlEUuGYb1vIYqmNdBgu44D/wpyFLMEaSKGKIpMYXklUvlI2hcvizPoF0DHsMMmG0
         lcchh9m40bmk6OMzCGKCvN0jEjlV9nN0eMGCf41gboVykmRE0FuMp0MFPXB7mHFpPW0I
         /LnA==
X-Gm-Message-State: AC+VfDy6HfKAQXOGuR0+ebRm0Vya51pS8e1fOjT0uMGeScblFnLG/qvn
	8+U04lormMUwVk9nTW+BWfmKb8jn/TPJAUQUFag=
X-Google-Smtp-Source: ACHHUZ7b29WcQEpJBxPgynKh2dxcEjQKO63R0QvBncBcn4CVZjBKqj6DvExU9PFON2qlRV1iXePc6q0qi5nDf7A9U3Q=
X-Received: by 2002:a2e:9b06:0:b0:2b1:dc7a:ebf2 with SMTP id
 u6-20020a2e9b06000000b002b1dc7aebf2mr7647520lji.17.1687255570896; Tue, 20 Jun
 2023 03:06:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1686275310.git.haibo1.xu@intel.com> <8cd4ce50f5f4a639f4508085959aae222d4d4386.1686275310.git.haibo1.xu@intel.com>
 <20230609-fba04b424a4d46574e04e587@orel>
In-Reply-To: <20230609-fba04b424a4d46574e04e587@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Tue, 20 Jun 2023 18:05:59 +0800
Message-ID: <CAJve8okjRZEt6_6SB9EWm+6c7utpExzenfWo2T1N-J6G9w9czQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] KVM: riscv: selftests: Add get-reg-list test
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Ben Gardon <bgardon@google.com>, 
	David Matlack <dmatlack@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_030616_071794_971A597F 
X-CRM114-Status: GOOD (  20.44  )
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

T24gRnJpLCBKdW4gOSwgMjAyMyBhdCA5OjM14oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1biAwOSwgMjAyMyBhdCAxMDoxMjox
OEFNICswODAwLCBIYWlibyBYdSB3cm90ZToKPiA+ICtzdGF0aWMgc3RydWN0IHZjcHVfcmVnX2xp
c3QgYWlhX2NvbmZpZyA9IHsKPiA+ICsgICAgIC5zdWJsaXN0cyA9IHsKPiA+ICsgICAgIEJBU0Vf
U1VCTElTVCwKPiA+ICsgICAgIEFJQV9SRUdTX1NVQkxJU1QsCj4gPiArICAgICB7MH0sCj4gPiAr
ICAgICB9LAo+ID4gK307Cj4gPiArCj4gPiArc3RhdGljIHN0cnVjdCB2Y3B1X3JlZ19saXN0IGZw
X2ZfZF9jb25maWcgPSB7Cj4gPiArICAgICAuc3VibGlzdHMgPSB7Cj4gPiArICAgICBCQVNFX1NV
QkxJU1QsCj4gPiArICAgICBGUF9GX1JFR1NfU1VCTElTVCwKPiA+ICsgICAgIEZQX0RfUkVHU19T
VUJMSVNULAo+ID4gKyAgICAgezB9LAo+ID4gKyAgICAgfSwKPiA+ICt9Owo+ID4gKwo+ID4gK3N0
cnVjdCB2Y3B1X3JlZ19saXN0ICp2Y3B1X2NvbmZpZ3NbXSA9IHsKPiA+ICsgICAgICZ6aWNib19j
b25maWcsCj4gPiArICAgICAmYWlhX2NvbmZpZywKPiA+ICsgICAgICZmcF9mX2RfY29uZmlnLAo+
ID4gK307Cj4gPiAraW50IHZjcHVfY29uZmlnc19uID0gQVJSQVlfU0laRSh2Y3B1X2NvbmZpZ3Mp
Owo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KPgo+IEkgc2VlIHdlIGhhdmUgYSBiaXQgb2YgYSBwcm9i
bGVtIHdpdGggdGhlIGNvbmZpZ3MgZm9yIHJpc2N2LiBTaW5jZSB3ZQo+IGRvbid0IGRpc2FibGUg
YW55dGhpbmcgd2UncmUgbm90IHRlc3RpbmcsIHRoZW4gZm9yIGFueSB0ZXN0IHRoYXQgaXMKPiBt
aXNzaW5nLCBmb3IgZXhhbXBsZSwgdGhlIGYgYW5kIGQgcmVnaXN0ZXJzLCB3ZSdsbCBnZXQgb3V0
cHV0IGxpa2UKPiAiVGhlcmUgYXJlIDY2IG5ldyByZWdpc3RlcnMuIENvbnNpZGVyIGFkZGluZyB0
aGVtIHRvIHRoZSBibGVzc2VkIHJlZwo+IGxpc3Qgd2l0aCB0aGUgZm9sbG93aW5nIGxpbmVzOiIg
YW5kIHRoZW4gYSBkdW1wIG9mIGFsbCB0aGUgZiBhbmQgZAo+IHJlZ2lzdGVycy4gVGhlIHRlc3Qg
ZG9lc24ndCBmYWlsLCBidXQgaXQncyBtZXNzeSBhbmQgY29uZnVzaW5nLiBJZGVhbGx5Cj4gd2Un
ZCBkaXNhYmxlIGFsbCByZWdpc3RlcnMgb2YgYWxsIHN1Ymxpc3RzIG5vdCBpbiB0aGUgY29uZmln
LCBwcm9iYWJseQo+IGJ5IHN0YXJ0aW5nIGJ5IGRpc2FibGluZyBldmVyeXRoaW5nIGFuZCB0aGVu
IG9ubHkgcmVlbmFibGluZyB0aGUgb25lcwo+IGluIHRoZSBjb25maWcuCj4KPiBBbnl0aGluZyB0
aGF0IGNhbid0IGJlIGRpc2FibGVkIGlzIGVpdGhlciBhIEtWTSBidWcsIGkuZS4gd2Ugc2hvdWxk
Cj4gYmUgYWJsZSB0byBkaXNhYmxlIGl0LCBiZWNhdXNlIHdlIGNhbid0IGV4cGVjdCBldmVyeSBo
b3N0IHRvIGhhdmUgaXQsCj4gb3IgaXQgbmVlZHMgdG8gYmUgaW4gdGhlIGJhc2UgcmVnaXN0ZXIg
c3VibGlzdCAobWVhbmluZyBldmVyeSBob3N0Cj4gd2lsbCBhbHdheXMgaGF2ZSBpdCkuCj4KCkhJ
IEFuZHJldywKCkkgZm91bmQgc2V2ZXJhbCBtdWx0aS1sZXR0ZXJzIElTQSBFWFQoQUlBL1NTVEMg
ZXRjKSB3ZXJlIG5vdCBhbGxvd2VkCnRvIGJlIGRpc2FibGVkLgpJcyBpdCBhIGJ1Zz8gc2hhbGwg
d2UgZml4IGl077yfCgpUaGFua3MsCkhhaWJvCgpzdGF0aWMgYm9vbCBrdm1fcmlzY3ZfdmNwdV9p
c2FfZGlzYWJsZV9hbGxvd2VkKHVuc2lnbmVkIGxvbmcgZXh0KQogewogICAgIHN3aXRjaCAoZXh0
KSB7CiAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9BOgogICAgIGNhc2UgS1ZNX1JJU0NWX0lT
QV9FWFRfQzoKICAgICBjYXNlIEtWTV9SSVNDVl9JU0FfRVhUX0k6CiAgICAgY2FzZSBLVk1fUklT
Q1ZfSVNBX0VYVF9NOgogICAgIGNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfU1NBSUE6CiAgICAgY2Fz
ZSBLVk1fUklTQ1ZfSVNBX0VYVF9TU1RDOgogICAgIGNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfU1ZJ
TlZBTDoKICAgICBjYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1pJSElOVFBBVVNFOgogICAgIGNhc2Ug
S1ZNX1JJU0NWX0lTQV9FWFRfWkJCOgogICAgICAgICByZXR1cm4gZmFsc2U7CiAgICAgZGVmYXVs
dDoKICAgICAgICAgYnJlYWs7CiAgICAgfQoKICAgICByZXR1cm4gdHJ1ZTsKIH0KCj4gVGhhbmtz
LAo+IGRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
