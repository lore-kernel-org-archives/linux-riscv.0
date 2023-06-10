Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5D1C7EE2E
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 02:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Iyz9QYeqD3t9C6aeEg+uv36xsgNBS5XawA124sqbYA=; b=RC55HX0iYBwfw1
	IqNY8PtuKogjgEIuOEluDcwNviiRgf6imx3GMnl48O8zR9FlSQ7B9DKl6zzgVjwMoNxqiB4RWyOWB
	D/v1eEAZwrRmVAoaS4DwskR6H5AQtmyDzNNtOiTeLYUEJiWSYUVGd3pA/npE8f+fEqPQxxYx7JLuD
	bKKQcPE6r9s+vqEE/IKNEWGSo4R6jRSpPLCXEz5/LOH4wwOtmca+XmKUCes+87C6eM1fzyMXntFlz
	5sNqsZ9JEFDOCVqR4E0ir2EJz0CAQdrY5DapFk3D3VnzGiB2yuJh+WatGCAkzRWAZCkghr73ABnKZ
	bonNqDIcOyIsmQB1BXew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7oS6-00EysK-0l;
	Sat, 10 Jun 2023 02:35:42 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7oS1-00EyqR-1Z;
	Sat, 10 Jun 2023 02:35:40 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-65055aa4ed7so2095054b3a.3;
        Fri, 09 Jun 2023 19:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686364535; x=1688956535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+cQ2OwbycVyxFVqiOSniKxXaS+hWOW1t5Cl7Mhvz3A=;
        b=Kb6eH8l3yhks8jc06qIZNQE1A8b6Q8s5z7YxYMQtG84G5idJNCwHY54K2aO+07BVS5
         kVtoqyGLMuNUelZqpalq41FDA8pNkYCcXjCVGGBapbfFqUJ4WSsdkvz7PCNssfTj/Xa8
         5MeFd1LjBHZo35Zu32oCkV1iO99HnUueFmuPioQlNu6KFlTDvjXnvErrqP+mmyAkZtbF
         gka37/1OCMSyGaD6KC6epfW2C0i/wirz53++DZI0bR0cNqJfWjqW/1PpEyU5NZDpv7O0
         CnKTY14bKBRCa5kXDZSvXPOsmMxbMOpwlAqTcIhkUC/6dIUhbTKPiD7sS5/BZgVX7Mvt
         xkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686364535; x=1688956535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+cQ2OwbycVyxFVqiOSniKxXaS+hWOW1t5Cl7Mhvz3A=;
        b=UB/dtB9OxV+W5sPsd4SX8Zj5h1adWd5jPJOhGB8Yz8Micte3L7fywPpaC0v2AU2mhE
         Cg3XgOvg2jj4lUFdwM79xDPupxaUIWwVu2ComjKRmpzxXM4hbO1McwRhxrxvsPJYejli
         K+tTTrvUmIPL+YvtnYCvtoBzzF9hKTSwJWM1EI50lDQqV9WROC/0Hlk74zKyYaEhQVXq
         T7ZNGp4xAp7yhdvZHpS91J0RjCwyLlke4cdrjcm1LB/fmDdLgEqBuIAW+VD+BhAeh2BF
         kjys7w5ieuEsVlu2Iinq84jcEcD6vu1+I7Ec+CGA+qq3mbCAj8Q1Gyqc/tEb0cl9XAB3
         ojOQ==
X-Gm-Message-State: AC+VfDxWk1N09d14iyU9XHpE3TudXg9Ti83yfqv9BjnPaDrRS/q6gl+Z
	DnffXxxZWKuxz3gZZ7MJFupL6QKRGj08MtzH4zY=
X-Google-Smtp-Source: ACHHUZ6rNnkh2m1Yt4Pj3/pGOqJ4UHP9zSc6CE3jFoWY+FrVfA5ENGv5ysmIcDXuIOSFDb9BxkKoP9BiytTg0kXa/dU=
X-Received: by 2002:a05:6a20:e616:b0:105:94e5:f5c5 with SMTP id
 my22-20020a056a20e61600b0010594e5f5c5mr2595006pzb.56.1686364535616; Fri, 09
 Jun 2023 19:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1686275310.git.haibo1.xu@intel.com> <73045958d9ab71d5266d012f1e13061afa8c5331.1686275310.git.haibo1.xu@intel.com>
 <20230609-05521f954b0485c69612f00b@orel>
In-Reply-To: <20230609-05521f954b0485c69612f00b@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Sat, 10 Jun 2023 10:35:24 +0800
Message-ID: <CAJve8omPV_XgCSvw8POZwisb6uTOFMJU4FyAKArryui2SAsqtw@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] KVM: riscv: selftests: Skip some registers set operation
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, David Matlack <dmatlack@google.com>, 
	Ben Gardon <bgardon@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_193537_527544_0DAC7174 
X-CRM114-Status: GOOD (  26.62  )
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

T24gRnJpLCBKdW4gOSwgMjAyMyBhdCA1OjI04oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1biAwOSwgMjAyMyBhdCAxMDoxMjox
N0FNICswODAwLCBIYWlibyBYdSB3cm90ZToKPiA+IFNldCBvcGVyYXRpb24gb24gc29tZSByaXNj
diByZWdpc3RlcnMobW9zdGx5IHBlc3VkbyBvbmVzKSB3YXMgbm90Cj4gPiBzdXBwb3J0ZWQgYW5k
IHNob3VsZCBiZSBza2lwcGVkIGluIHRoZSBnZXQtcmVnLWxpc3QgdGVzdC4gSnVzdAo+ID4gcmV1
c2UgdGhlIHJlamVjdHNfc2V0IHV0aWxpdGllcyB0byBoYW5kbGUgaXQgaW4gcmlzY3YuCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogSGFpYm8gWHUgPGhhaWJvMS54dUBpbnRlbC5jb20+Cj4gPiBSZXZp
ZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiA+IC0tLQo+
ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9nZXQtcmVnLWxpc3QuYyB8IDIwICsrKysr
KysrKysrKystLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDcg
ZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2t2bS9nZXQtcmVnLWxpc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9nZXQtcmVn
LWxpc3QuYwo+ID4gaW5kZXggYzRiZDVhNTI1OWRhLi5hYmFjYjk1YzIxYzYgMTAwNjQ0Cj4gPiAt
LS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vZ2V0LXJlZy1saXN0LmMKPiA+ICsrKyBi
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9nZXQtcmVnLWxpc3QuYwo+ID4gQEAgLTIxMSwx
NiArMjExLDIyIEBAIHN0YXRpYyB2b2lkIHJ1bl90ZXN0KHN0cnVjdCB2Y3B1X3JlZ19saXN0ICpj
KQo+ID4gICAgICAgICAgICAgICAgICAgICAgICsrZmFpbGVkX2dldDsKPiA+ICAgICAgICAgICAg
ICAgfQo+ID4KPiA+IC0gICAgICAgICAgICAgLyogcmVqZWN0c19zZXQgcmVnaXN0ZXJzIGFyZSBy
ZWplY3RlZCBhZnRlciBLVk1fQVJNX1ZDUFVfRklOQUxJWkUgKi8KPiA+ICsgICAgICAgICAgICAg
LyoKPiA+ICsgICAgICAgICAgICAgICogcmVqZWN0c19zZXQgcmVnaXN0ZXJzIGFyZSByZWplY3Rl
ZCBhZnRlciBLVk1fQVJNX1ZDUFVfRklOQUxJWkUgb24gYWFyY2g2NCwKPiA+ICsgICAgICAgICAg
ICAgICogb3IgcmVnaXN0ZXJzIHRoYXQgc2hvdWxkIHNraXAgc2V0IG9wZXJhdGlvbiBvbiByaXNj
di4KPiA+ICsgICAgICAgICAgICAgICovCj4gPiAgICAgICAgICAgICAgIGZvcl9lYWNoX3N1Ymxp
c3QoYywgcykgewo+ID4gICAgICAgICAgICAgICAgICAgICAgIGlmIChzLT5yZWplY3RzX3NldCAm
JiBmaW5kX3JlZyhzLT5yZWplY3RzX3NldCwgcy0+cmVqZWN0c19zZXRfbiwgcmVnLmlkKSkgewo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVqZWN0X3JlZyA9IHRydWU7Cj4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBfX3ZjcHVfaW9jdGwodmNwdSwgS1ZN
X1NFVF9PTkVfUkVHLCAmcmVnKTsKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlm
IChyZXQgIT0gLTEgfHwgZXJybm8gIT0gRVBFUk0pIHsKPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcHJpbnRmKCIlczogRmFpbGVkIHRvIHJlamVjdCAocmV0PSVkLCBl
cnJubz0lZCkgIiwgY29uZmlnX25hbWUoYyksIHJldCwgZXJybm8pOwo+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwcmludF9yZWcoY29uZmlnX25hbWUoYyksIHJlZy5p
ZCk7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHB1dGNoYXIoJ1xu
Jyk7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICsrZmFpbGVkX3Jl
amVjdDsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmICgocmVnLmlkICYgS1ZN
X1JFR19BUkNIX01BU0spID09IEtWTV9SRUdfQVJNNjQpIHsKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmV0ID0gX192Y3B1X2lvY3RsKHZjcHUsIEtWTV9TRVRfT05F
X1JFRywgJnJlZyk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlm
IChyZXQgIT0gLTEgfHwgZXJybm8gIT0gRVBFUk0pIHsKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwcmludGYoIiVzOiBGYWlsZWQgdG8gcmVqZWN0IChy
ZXQ9JWQsIGVycm5vPSVkKSAiLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25maWdfbmFtZShjKSwgcmV0LCBlcnJubyk7
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJpbnRf
cmVnKGNvbmZpZ19uYW1lKGMpLCByZWcuaWQpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHB1dGNoYXIoJ1xuJyk7Cj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKytmYWlsZWRfcmVqZWN0Owo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4KPiBUaGlua2luZyBhYm91dCB0aGlz
IHNvbWUgbW9yZSwgc2hvdWxkbid0IHdlIGF0dGVtcHQgdGhlIHNldCBpb2N0bCBmb3IKPiByaXNj
diByZWplY3QgcmVnaXN0ZXJzIGFzIHdlbGwsIGJ1dCBsb29rIGZvciBkaWZmZXJlbnQgZXJyb3Ig
bnVtYmVycz8KPgoKWWVzLCB3ZSBjYW4uIEN1cnJlbnRseSwgMiBkaWZmZXJlbnQgZXJybm8oRU9Q
Tk9UU1VQUC9FSU5WQUwpIHdvdWxkIGJlCnJlcG9ydGVkIGZvciB0aGUgcmVqZWN0ZWQgcmVnaXN0
ZXJzIGluIHJpc2Mtdi4KVGhlc2UgMiBlcnJub3MgY2FuIGJlIGhhbmRsZWQgc3BlY2lhbGx5IGxp
a2UgYmVsb3c6CgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2dldC1y
ZWctbGlzdC5jCmIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2dldC1yZWctbGlzdC5jCmlu
ZGV4IDczZjQwZTA4NDJiOC4uZjNmMmM0NTE5MzE4IDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9rdm0vZ2V0LXJlZy1saXN0LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL2dldC1yZWctbGlzdC5jCkBAIC0yNTUsNiArMjU1LDE1IEBAIHN0YXRpYyB2b2lkIHJ1
bl90ZXN0KHN0cnVjdCB2Y3B1X3JlZ19saXN0ICpjKQogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwdXRjaGFyKCdcbicpOwogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICArK2ZhaWxlZF9yZWplY3Q7CiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9CisgICAgICAgICAgICAgICAgfSBlbHNlIHsK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IF9fdmNwdV9pb2N0
bCh2Y3B1LApLVk1fU0VUX09ORV9SRUcsICZyZWcpOworICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgaWYgKHJldCAhPSAtMSB8fCAoZXJybm8gIT0KRUlOVkFMICYmIGVycm5v
ICE9IEVPUE5PVFNVUFApKSB7CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHByaW50ZigiJXM6IEZhaWxlZCB0bwpyZWplY3QgKHJldD0lZCwgZXJybm89JWQp
ICIsCisKY29uZmlnX25hbWUoYyksIHJldCwgZXJybm8pOworCnByaW50X3JlZyhjb25maWdfbmFt
ZShjKSwgcmVnLmlkKTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcHV0Y2hhcignXG4nKTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgKytmYWlsZWRfcmVqZWN0OworICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfQoKT25lIHBvc3NpYmxlIGlzc3VlIGZvciB0aGUgYWJvdmUgY2hhbmdlIGlz
IHRoYXQgd2hlbiBuZXcgcmVnaXN0ZXJzCnRoYXQgZG9uJ3Qgc3VwcG9ydCBzZXRzIHdlcmUgYWRk
ZWQsIHdlIG5lZWQKdG8gYWRkIHRoZW0gdG8gdGhlIHJlamVjdCByZWdpc3RlcnMgbGlzdCwgb3Ig
dGhlIHRlc3Qgd291bGQgZmFpbC4KCkluaXRpYWxseSwgaW4gdGhlIHYxIHBhdGNoLCB0aGUgZGVz
aWduIHdhcyB0byBqdXN0IHNraXAgdGhlIEVPUE5PVFNVUFAKZXJybm8gaW4gc2V0IG9wZXJhdGlv
bnMgZm9yIGFsbCByZWdpc3RlcnMKc2luY2UgaXQncyBhIGtub3duIGVycm5vIGZvciByZWdpc3Rl
cnMgdGhhdCBkb24ndCBzdXBwb3J0IHNldHMuIFRoaXMKY2hhbmdlIGNvdmVyIGFsbCB0aGUgcmVn
aXN0ZXJzIGV2ZW4gZm9yIGZ1dHVyZQpuZXcgb25lcy4KCldoYXQncyB5b3VyIG9waW5pb24/CgpU
aGFua3MsCkhhaWJvCj4gVGhhbmtzLAo+IGRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
