Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343AAEB64DC
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jul 2023 14:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VExgHrLYDK9HD30rDDMExgo3opqZQNSbgc8eyrtCo6k=; b=ZFRq1puHfMfBoq
	q6HFejA1fM4wDqtcmCZuo/EegmLBrW2t83Bz0g4XciJl6eO2WNyq/9zNGzhbACsTnc/7KHHc3I2Rj
	q1FoytV2RWQQbKbuUpg1LsE/0dOeWa7TnOhAUJMb/EZuC/YnxQqWFcGDyQ2nnolgUicsl9P01la3N
	XSXINbloXbxp7qBFd1uXtbiAFJ22cLW4ZXXQlY6PtmLIlPVAd6DMFWF9Nl52Fav5ZxxbM9YaOGNXE
	o4HDmfrke5gIA2qqQRSzO6vsPUs/5/W1/7oYF50DKkChGKSs97P2eSEjw/chHEn7FHLxjmoVpZ21D
	4vnaB1o+6jl3OO2mzG0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFbhI-006ALR-0N;
	Sat, 01 Jul 2023 14:35:36 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFbhD-006AJs-2c;
	Sat, 01 Jul 2023 14:35:33 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b6c5ede714so35337531fa.1;
        Sat, 01 Jul 2023 07:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688222129; x=1690814129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaPOwVOZ+bU3bEOtc3/yyhO3B/rb/2pd2qqDwVfkQLw=;
        b=bhB2OGE3RRzpSj2bI4oYunKjg/pWMxy2hDqeZcwVXDNS4JNlGKZPPR6dsIg2RiBPaA
         XddtT0C/oUJWh/8EsaXkI/6pfYvsrCxu082OUeX+terV56QkZKpqPGpW16Pwpdel1a4B
         QLgeTPgxvU5mpR9X5lQZBuXzd/9ZwtRO9eInZ8Pu2b/C/kRiX9/LM63bOsMdYXt8yeTj
         wrl5s14QrUCKPGIfVbFCHpn9d5LMtSMTCighhe2NY7+r7tE63wj1Rv7Lzp0TBEGhq2wH
         5Smnaj5wB8izhBCVnFjIwmCDjnlMbrwYFlev5c1JICwV1yapgQH01YvLa1jBGhCE+mXp
         VNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688222129; x=1690814129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aaPOwVOZ+bU3bEOtc3/yyhO3B/rb/2pd2qqDwVfkQLw=;
        b=hAxq91YEVmroUJs1Wf2UIy3jAPMoK+4GeqUZ2JqXj7/zWAhtYiE9TTU0xqaJfOGZXZ
         QLSwqJeV+VgutXyWrRmgTNVOYHMvFNgOq2k9WVDIn/S7R4tzCHISduPkDb2c4qICWljS
         kzbHJbYnIqNBVkFDduggpneMWWaVHYg6KUAqM7/fwi19xqvHNELOApaLiGCv7cTIOmQL
         Z25aV1ilVtVakjMG6SkLvS1P2XkwUtd8bZ2Qs0niGuHNiNB5KTSdaibOA4K48qk7Dkkq
         SKmLtdk4gHJDfSlRsXScKx0YIoMiaX6HQ3NH7FXTwqMGYJL9S0Rgyd5T+px/9xtqomd8
         38HA==
X-Gm-Message-State: ABy/qLYKmnQefbQ21MrgVPBbvxEi+2xd5HJHbYclwxSt2IlW+ypuvuj7
	eZ1aA0QZojrHZOG+5ltRCOUCp/PxAAblYQSD8cA=
X-Google-Smtp-Source: APBJJlFNU/x2ikcVqhPAS0JO3x9ydTrnk8SegR8Iy91lyWQNTL7iKMsejrXFyvnMu8IDP8g6AskN8ncwltMBvpm7vv4=
X-Received: by 2002:a2e:a4c4:0:b0:2b6:da7a:3859 with SMTP id
 p4-20020a2ea4c4000000b002b6da7a3859mr675759ljm.15.1688222129294; Sat, 01 Jul
 2023 07:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1688010022.git.haibo1.xu@intel.com> <f5ef26e862260efdf1c809d0eee46ee1c8b457f2.1688010022.git.haibo1.xu@intel.com>
 <20230701-0255de0b29b22f180bb3bbbf@orel>
In-Reply-To: <20230701-0255de0b29b22f180bb3bbbf@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Sat, 1 Jul 2023 22:35:18 +0800
Message-ID: <CAJve8okE3Sa0j4+u+L9UHO9aSbzXU8pXvDNqKe9omoX=fx6XXw@mail.gmail.com>
Subject: Re: [PATCH v5 08/13] KVM: arm64: selftests: Move reject_set check
 logic to a function
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, David Matlack <dmatlack@google.com>, 
	Vipin Sharma <vipinsh@google.com>, Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230701_073531_851112_8DC92360 
X-CRM114-Status: GOOD (  19.69  )
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

T24gU2F0LCBKdWwgMSwgMjAyMyBhdCAxMDoyMeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBKdWwgMDEsIDIwMjMgYXQgMDk6NDI6
NTZQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBObyBmdW5jdGlvbmFsIGNoYW5nZXMuIEp1
c3QgbW92ZSB0aGUgcmVqZWN0X3NldCBjaGVjayBsb2dpYyB0byBhCj4gPiBmdW5jdGlvbiBzbyB3
ZSBjYW4gY2hlY2sgZm9yIHNwZWNpZmljIGVycm5vIGZvciBzcGVjaWZpYyByZWdpc3Rlci4KPgo+
ICdmb3Igc3BlY2lmaWMgcmVnaXN0ZXInIHBhcnQgaXNuJ3QgdHJ1ZSBhbnltb3JlLgo+Cj4gPiBU
aGlzIGlzIGEgcHJlcGFyYXRpb24gZm9yIHN1cHBvcnQgcmVqZWN0X3NldCBpbiByaXNjdi4KPiA+
Cj4gPiBTdWdnZXN0ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBIYWlibyBYdSA8aGFpYm8xLnh1QGludGVsLmNvbT4KPiA+IC0t
LQo+ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9hYXJjaDY0L2dldC1yZWctbGlzdC5j
IHwgNSArKysrKwo+ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9nZXQtcmVnLWxpc3Qu
YyAgICAgICAgIHwgNyArKysrKystCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9hYXJjaDY0L2dldC1yZWctbGlzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL2FhcmNoNjQvZ2V0LXJlZy1saXN0LmMKPiA+IGluZGV4IGFhZjAzNWM5NjllYy4uNGFh
NThmMWFlYmUzIDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2Fh
cmNoNjQvZ2V0LXJlZy1saXN0LmMKPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS9hYXJjaDY0L2dldC1yZWctbGlzdC5jCj4gPiBAQCAtMjcsNiArMjcsMTEgQEAgYm9vbCBmaWx0
ZXJfcmVnKF9fdTY0IHJlZykKPiA+ICAgICAgIHJldHVybiBmYWxzZTsKPiA+ICB9Cj4gPgo+ID4g
K2Jvb2wgY2hlY2tfcmVqZWN0X3NldChpbnQgZXJyKQo+ID4gK3sKPiA+ICsgICAgIHJldHVybiBl
cnIgPT0gRVBFUk07Cj4gPiArfQo+ID4gKwo+ID4gICNkZWZpbmUgUkVHX01BU0sgKEtWTV9SRUdf
QVJDSF9NQVNLIHwgS1ZNX1JFR19TSVpFX01BU0sgfCBLVk1fUkVHX0FSTV9DT1BST0NfTUFTSykK
PiA+Cj4gPiAgI2RlZmluZSBDT1JFX1JFR1NfWFhfTlJfV09SRFMgICAgICAgIDIKPiA+IGRpZmYg
LS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vZ2V0LXJlZy1saXN0LmMgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vZ2V0LXJlZy1saXN0LmMKPiA+IGluZGV4IGY2YWQ3OTkx
YTgxMi4uNzllMTk4OTY4ODYwIDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL2dldC1yZWctbGlzdC5jCj4gPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9r
dm0vZ2V0LXJlZy1saXN0LmMKPiA+IEBAIC05OCw2ICs5OCwxMSBAQCB2b2lkIF9fd2VhayBwcmlu
dF9yZWcoY29uc3QgY2hhciAqcHJlZml4LCBfX3U2NCBpZCkKPiA+ICAgICAgIHByaW50ZigiXHQw
eCVsbHgsXG4iLCBpZCk7Cj4gPiAgfQo+ID4KPiA+ICtib29sIF9fd2VhayBjaGVja19yZWplY3Rf
c2V0KGludCBlcnIpCj4gPiArewo+ID4gKyAgICAgcmV0dXJuIHRydWU7Cj4gPiArfQo+ID4gKwo+
ID4gICNpZmRlZiBfX2FhcmNoNjRfXwo+ID4gIHN0YXRpYyB2b2lkIHByZXBhcmVfdmNwdV9pbml0
KHN0cnVjdCB2Y3B1X3JlZ19saXN0ICpjLCBzdHJ1Y3Qga3ZtX3ZjcHVfaW5pdCAqaW5pdCkKPiA+
ICB7Cj4gPiBAQCAtMjE2LDcgKzIyMSw3IEBAIHN0YXRpYyB2b2lkIHJ1bl90ZXN0KHN0cnVjdCB2
Y3B1X3JlZ19saXN0ICpjKQo+ID4gICAgICAgICAgICAgICAgICAgICAgIGlmIChzLT5yZWplY3Rz
X3NldCAmJiBmaW5kX3JlZyhzLT5yZWplY3RzX3NldCwgcy0+cmVqZWN0c19zZXRfbiwgcmVnLmlk
KSkgewo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVqZWN0X3JlZyA9IHRydWU7
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBfX3ZjcHVfaW9jdGwodmNw
dSwgS1ZNX1NFVF9PTkVfUkVHLCAmcmVnKTsKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGlmIChyZXQgIT0gLTEgfHwgZXJybm8gIT0gRVBFUk0pIHsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGlmIChyZXQgIT0gLTEgfHwgIWNoZWNrX3JlamVjdF9zZXQoZXJybm8p
KSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByaW50ZigiJXM6
IEZhaWxlZCB0byByZWplY3QgKHJldD0lZCwgZXJybm89JWQpICIsIGNvbmZpZ19uYW1lKGMpLCBy
ZXQsIGVycm5vKTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJp
bnRfcmVnKGNvbmZpZ19uYW1lKGMpLCByZWcuaWQpOwo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwdXRjaGFyKCdcbicpOwo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KPgo+
IE90aGVyd2lzZSwKPgo+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5h
bWljcm8uY29tPgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3ISBXaWxsIGZpeCBpdCBpbiB0aGUgbmV4
dCB2ZXJzaW9uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
