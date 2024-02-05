Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA23AC48295
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Feb 2024 13:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yvV50UuygqtGTjC4hU/MkPFUjcdDG0stfDA0zByUEXc=; b=esWES2CkE2HyQ6
	M17dyF5o4O724mUkXaI4wpY0l78+eFZqLNFCkq0+aRJg9TpGxwzG1E6GcLua2IGBCQo/LByEspbvF
	eeAr21AFxvm7aNKHcrDnpA3jCvYKCtA24hLfFylGA/sF4HB9MQxVHgf7bVv/pmurj6RVSb4mzTOMU
	e/HcysRjWhLE4gZDJlnxTN7mSzwdhA7isZdsCYna3/QM3kPwhmWA8r4gls1skNr6tArOsXiUuO63s
	z+2yimcWTtVn4eJkMyKaawMGfOM/bXtN4FjBo24Uqfdb1OpdctLI+qS4KsUJphp38Yt++SvTV2z8k
	UhQkt8NnkOvWT54Kug8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWykE-00000003MeT-42Ix;
	Mon, 05 Feb 2024 13:10:42 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWykD-00000003MdW-0qUx;
	Mon, 05 Feb 2024 13:10:42 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5112d5ab492so5826857e87.0;
        Mon, 05 Feb 2024 05:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707138639; x=1707743439; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l52wGRJpdNZd5ZMPG8emXQNk5j5Wmg7cRfJ4UIcR334=;
        b=C+kBnFYf/BHhtl8Vp6U0ge/TmlFLUIUeSDGsit7/xOLyN+T4j7rejT6l+NI50Y6gfN
         vCzWdIRdy15CUVxCys4ZBMvj+MWrHT52Q+F1pQi4ECfGzU5oKHab71Ujuuu30IK0KOWY
         yIQyGUW7U54eYctTPrFzXZr16Q+h25QBEa3JMae6pX2Raerz6Z0lf66HvOUwOJNhgz0j
         D5S+UOeh8mYSPQeC3A+qSLJUmvZ/iRWXx6Lw2AGKzB+gulNPfQ9B6xeHWDtg/BFs+Wo/
         rTwQeQ7A3sxd5Q5Y+Xa9ZLQO+CzT/QXh09MbgB3tP0v6EY2Waf2eIIt6wvvMYqvOcVPm
         7biQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707138639; x=1707743439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l52wGRJpdNZd5ZMPG8emXQNk5j5Wmg7cRfJ4UIcR334=;
        b=QQXRm/zH6hDD1dyYlFnFR8ecgIUp46rNs/x3H3lKoOydyWyFblER9/Zkybx2e4kMWY
         XtR3CW3IyzCPlyiVJ+PdevFzyKMCfsrKe3sKmPWEmevVRYyTMKmHKVFpbN/ASwl0CJbB
         uxoy70LMMETJ0OqB9YqTTTV1c2xe4YFX83gC3QmsrulzkGXxsV0nePjIKFGP+7ZSf0Bp
         pSNJVEkxMUXhBbn10v5mJqZH3z0Owt9fsMLeCYSU0wsIYd9v9HqUgXORGWpcWht09lXV
         0jmw8z9F8itwSVBIZqFk606gpJ3Gn7R00LR8+HS9PaJormfvTXtvYtY2P+6XQMxPdsQG
         ieQA==
X-Gm-Message-State: AOJu0YwuWT7lGBKmlzwqLs3bkoEDzilMfZoX8AQIInr4q6y6NYsc9Gyd
	7U8FnDbEifXi0iL6wa1lGlLLJEnhtTBoV1C0kt/r+mAgRLkA4B0Z+dkQ0JYjcABftuG9nbFAgTU
	07xC+DHCNWzSP/oi+R1XHwAOTt00=
X-Google-Smtp-Source: AGHT+IHcjgafryspZvflYvXmNwPr/1ZTRC4o5v0aRZqmLV0WFqjr47M7EyynLPGoweDD8l30req/4VrqIPpQvTK6l0U=
X-Received: by 2002:a05:6512:1150:b0:511:4e0c:bc3f with SMTP id
 m16-20020a056512115000b005114e0cbc3fmr2466365lfg.51.1707138638651; Mon, 05
 Feb 2024 05:10:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1705916069.git.haibo1.xu@intel.com>
In-Reply-To: <cover.1705916069.git.haibo1.xu@intel.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Mon, 5 Feb 2024 21:10:26 +0800
Message-ID: <CAJve8onDbX44Ph6a-FdO2+p7QOQLah-7OyF+yUc06wud+SvmQQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/12] RISCV: Add kvm Sstc timer selftests
To: Haibo Xu <haibo1.xu@intel.com>
Cc: ajones@ventanamicro.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	wchen <waylingii@gmail.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Minda Chen <minda.chen@starfivetech.com>, Sean Christopherson <seanjc@google.com>, 
	Peter Xu <peterx@redhat.com>, Like Xu <likexu@tencent.com>, 
	Vipin Sharma <vipinsh@google.com>, Thomas Huth <thuth@redhat.com>, 
	Aaron Lewis <aaronlewis@google.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_051041_278637_EC5E7D9F 
X-CRM114-Status: GOOD (  15.15  )
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

SGkgTWFyYywKCkNvdWxkIHlvdSBoZWxwIHJldmlldyB0aGUgZmlyc3QgMyBwYXRjaGVzIGluIHRo
aXMgc2VyaWVzPwoKVGhhbmtzLApIYWlibwoKT24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgNTo0NeKA
r1BNIEhhaWJvIFh1IDxoYWlibzEueHVAaW50ZWwuY29tPiB3cm90ZToKPgo+IFRoZSBSSVNDLVYg
YXJjaF90aW1lciBzZWxmdGVzdHMgaXMgdXNlZCB0byB2YWxpZGF0ZSBTc3RjIHRpbWVyCj4gZnVu
Y3Rpb25hbGl0eSBpbiBhIGd1ZXN0LCB3aGljaCBzZXRzIHVwIHBlcmlvZGljIHRpbWVyIGludGVy
cnVwdHMKPiBhbmQgY2hlY2sgdGhlIGJhc2ljIGludGVycnVwdCBzdGF0dXMgdXBvbiBpdHMgcmVj
ZWlwdC4KPgo+IFRoaXMgS1ZNIHNlbGZ0ZXN0cyB3YXMgcG9ydGVkIGZyb20gYWFyY2g2NCBhcmNo
X3RpbWVyIGFuZCB0ZXN0ZWQKPiB3aXRoIExpbnV4IHY2LjctcmM4IG9uIGEgUWVtdSByaXNjdjY0
IHZpcnQgbWFjaGluZS4KPgo+IC0tLQo+IENoYW5nZWQgc2luY2UgdjQ6Cj4gICAqIFJlYmFzZWQg
dG8gTGludXggNi43LXJjOAo+ICAgKiBBZGRlZCBuZXcgcGF0Y2goMi8xMikgdG8gY2xlYW4gdXAg
dGhlIGRhdGEgdHlwZSBpbiBzdHJ1Y3QgdGVzdF9hcmdzCj4gICAqIFJlLW9yZGVyZWQgcGF0Y2go
MTEvMTEpIGluIHY0IHRvIHBhdGNoKDMvMTIpCj4gICAqIENoYW5nZWQgdGhlIHRpbWVyX2Vycl9t
YXJnaW5fdXMgdHlwZSBmcm9tIGludCB0byB1aW50MzJfdAo+Cj4gSGFpYm8gWHUgKDExKToKPiAg
IEtWTTogYXJtNjQ6IHNlbGZ0ZXN0czogRGF0YSB0eXBlIGNsZWFudXAgZm9yIGFyY2hfdGltZXIg
dGVzdAo+ICAgS1ZNOiBhcm02NDogc2VsZnRlc3RzOiBFbmFibGUgdHVuaW5nIG9mIGVycm9yIG1h
cmdpbiBpbiBhcmNoX3RpbWVyCj4gICAgIHRlc3QKPiAgIEtWTTogYXJtNjQ6IHNlbGZ0ZXN0czog
U3BsaXQgYXJjaF90aW1lciB0ZXN0IGNvZGUKPiAgIEtWTTogc2VsZnRlc3RzOiBBZGQgQ09ORklH
XzY0QklUIGRlZmluaXRpb24gZm9yIHRoZSBidWlsZAo+ICAgdG9vbHM6IHJpc2N2OiBBZGQgaGVh
ZGVyIGZpbGUgY3NyLmgKPiAgIHRvb2xzOiByaXNjdjogQWRkIGhlYWRlciBmaWxlIHZkc28vcHJv
Y2Vzc29yLmgKPiAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogU3dpdGNoIHRvIHVzZSBtYWNybyBm
cm9tIGNzci5oCj4gICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBleGNlcHRpb24gaGFuZGxp
bmcgc3VwcG9ydAo+ICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgZ3Vlc3QgaGVscGVyIHRv
IGdldCB2Y3B1IGlkCj4gICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IENoYW5nZSB2Y3B1X2hhc19l
eHQgdG8gYSBjb21tb24gZnVuY3Rpb24KPiAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIHNz
dGMgdGltZXIgdGVzdAo+Cj4gUGFvbG8gQm9uemluaSAoMSk6Cj4gICBzZWxmdGVzdHMva3ZtOiBG
aXggaXNzdWVzIHdpdGggJChTUExJVF9URVNUUykKPgo+ICB0b29scy9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2Nzci5oICAgICAgICAgICAgfCA1NDEgKysrKysrKysrKysrKysrKysrCj4gIHRvb2xz
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9wcm9jZXNzb3IuaCB8ICAzMiArKwo+ICB0b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vTWFrZWZpbGUgICAgICAgICAgfCAgMjcgKy0KPiAgLi4u
L3NlbGZ0ZXN0cy9rdm0vYWFyY2g2NC9hcmNoX3RpbWVyLmMgICAgICAgIHwgMjk1ICstLS0tLS0t
LS0KPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2FyY2hfdGltZXIuYyAgICAgIHwgMjU5
ICsrKysrKysrKwo+ICAuLi4vc2VsZnRlc3RzL2t2bS9pbmNsdWRlL2FhcmNoNjQvcHJvY2Vzc29y
LmggfCAgIDQgLQo+ICAuLi4vc2VsZnRlc3RzL2t2bS9pbmNsdWRlL2t2bV91dGlsX2Jhc2UuaCAg
ICAgfCAgIDkgKwo+ICAuLi4vc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L2FyY2hfdGltZXIu
aCAgfCAgNzEgKysrCj4gIC4uLi9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29y
LmggICB8ICA2NSArKy0KPiAgLi4uL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Rlc3Rf
dXRpbC5oIHwgICAyICsKPiAgLi4uL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS90aW1lcl90ZXN0Lmgg
ICAgICAgIHwgIDQ1ICsrCj4gIC4uLi9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9oYW5kbGVycy5T
ICAgICAgICB8IDEwMSArKysrCj4gIC4uLi9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNz
b3IuYyAgICAgICB8ICA4NyArKysKPiAgLi4uL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9h
cmNoX3RpbWVyLmMgIHwgMTExICsrKysKPiAgLi4uL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJl
Zy1saXN0LmMgICAgICAgIHwgIDExICstCj4gIDE1IGZpbGVzIGNoYW5nZWQsIDEzNTMgaW5zZXJ0
aW9ucygrKSwgMzA3IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL3Byb2Nlc3Nvci5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vYXJjaF90aW1lci5jCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9hcmNoX3Rp
bWVyLmgKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9p
bmNsdWRlL3RpbWVyX3Rlc3QuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9oYW5kbGVycy5TCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvYXJjaF90aW1lci5jCj4KPiAtLQo+IDIu
MzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
