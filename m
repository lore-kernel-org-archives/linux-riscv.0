Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132E3EEB581
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 06:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=geVvyMmGnTHaQFJD6/CJl2B7J7ehdVboq49HkBp6MWA=; b=SKDcPC6bq10qRJ
	eIozrkpWOSxzyyMxF2mdnIp0wXpIks9o9hLpoj8u6ocwwxKeqzJjgYivNnFhSVqen0Y5DVCyJaXQ3
	kgA0ULZGh+zb4VgHt9jCMDs7qvbWpX14KNVqSEiKevg/eZbkZF0fI3MIoDUXBUlbdkNyScAY75wbE
	+oSvMflEsu7mE8rjwif8hQldvvyF8WVSINl9h58jA4uujWlkYb3MRHh6Co++xgoWVjJ0XuCrJ/rDh
	rXD0jf1vSghW6DAazLLUjnDhW7iUENDCm0MWs9HsbfLTZSaa8sKgXfWJSxJVi5Vf0vxxWPZ0/PRA7
	a7q2efRpY+jZEnCo/pOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh263-009t2G-24;
	Fri, 15 Sep 2023 06:14:31 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh261-009t1c-06;
	Fri, 15 Sep 2023 06:14:30 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-502e0b7875dso2983907e87.0;
        Thu, 14 Sep 2023 23:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694758467; x=1695363267; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bl/6t9mcAclJ4xtGmBPz2BA7FLMNa6WCNrJXbkl0XGU=;
        b=TMuMNYGHWTuKZ/xaHlVKpAuwaENUWghc1mc/ZwwuE0kGYolO8UYnyJFpnsuhkmbfHT
         BJixfrF7GYF6IsMao/07SoSYnju/ZAOkNOxj/aLY8sZOwLzhQ4Vz+6Gg360zvwlSLd8p
         plYBAhAFx/L5OxUIzbSc7PFVn/16rAMZUejULB5+f0CjGkFVuuLjVwhQFWM2bQZleY+J
         uQatSdRb3rbXohitZfV1mwuCry7V9iY80ZZBqjh1uLI2YI49PMxXWEwuiL/9FTYOVNaY
         l2frcXVJr6FEo+dBDsnUlyo4Voicu0pO1zVMniNnn69FYi4yJcFkD+LBB/BbuBeufV2N
         WZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694758467; x=1695363267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bl/6t9mcAclJ4xtGmBPz2BA7FLMNa6WCNrJXbkl0XGU=;
        b=kOzdmtom0I4iW5DZGY1n6M//fDw++FFrmo250dyDfZH5HHbVY5ZIYY42/bjKhqmBcq
         atAvLZHGtxqx1X76Bv60PC7EXmGPz/wqf0yLzIPtML/ahHIOhvnSyxperU+Dk/I1ShTc
         cZp4RjUTpg5pc8sVoiUqfU3UCnWZ3Kcso/+UuW1RUf3BBxNBGQIxa1+q0KcTWnSgXVMY
         Pksakymt/Q+jiAa23JAoil8JEJXIOV9KQJy1yyhuvRE81jLp9kJIQFQV/U02fKWbbKMq
         ZOwkb+u6sMayQhiF8Zr6jukMuUnW6lbhbTJeR4ob8J05qgn/1W6HWaEoIZrIikfhscQH
         HjgQ==
X-Gm-Message-State: AOJu0YzhQTumZOqXqDTgfiCzLfvobZTK2WyQXId3eeyTJyr3QJ+nAxOH
	sMki7ZpQ0feEG+6JnXUzYEPCHvTGCo3LjUUdR/XvgF99
X-Google-Smtp-Source: AGHT+IGhJVx1DybM3iYFALHT+fRtR3Sb1TxgK5u1dydWHyG0LYewVIconr2UDCXmyWWs9uSdF346GuK7kKVFChhTmWE=
X-Received: by 2002:ac2:4831:0:b0:500:9dd4:2969 with SMTP id
 17-20020ac24831000000b005009dd42969mr572676lft.59.1694758466969; Thu, 14 Sep
 2023 23:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1694421911.git.haibo1.xu@intel.com> <dd81ef2b87e4cc160cb0ee782010dcf3543e065a.1694421911.git.haibo1.xu@intel.com>
 <20230914-d6645bbc5ac80999674e9685@orel>
In-Reply-To: <20230914-d6645bbc5ac80999674e9685@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Fri, 15 Sep 2023 14:14:15 +0800
Message-ID: <CAJve8omvH67vBoh1tVpUad7sXxRXUgQxNZzqfXFmKj0NHqGDFQ@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] KVM: riscv: selftests: Change vcpu_has_ext to a
 common function
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Vipin Sharma <vipinsh@google.com>, David Matlack <dmatlack@google.com>, Thomas Huth <thuth@redhat.com>, 
	Colton Lewis <coltonlewis@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_231429_073214_7992CD70 
X-CRM114-Status: GOOD (  22.19  )
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

T24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgNTowNeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgMDk6Mzc6
MDJBTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBNb3ZlIHZjcHVfaGFzX2V4dCB0byB0aGUg
cHJvY2Vzc29yLmMgYW5kIHJlbmFtZSBpdCB0byBfX3ZjcHVfaGFzX2V4dAo+ID4gc28gdGhhdCBv
dGhlciB0ZXN0IGNhc2VzIGNhbiB1c2UgaXQgZm9yIHZDUFUgZXh0ZW5zaW9uIGNoZWNrLgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IEhhaWJvIFh1IDxoYWlibzEueHVAaW50ZWwuY29tPgo+ID4gLS0t
Cj4gPiAgLi4uL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9jZXNzb3IuaCAgICAgIHwg
IDIgKysKPiA+ICAuLi4vdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3Iu
YyAgfCAgOSArKysrKysrKysKPiA+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3Yv
Z2V0LXJlZy1saXN0LmMgfCAxNiArLS0tLS0tLS0tLS0tLS0tCj4gPiAgMyBmaWxlcyBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmggYi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9jZXNzb3IuaAo+ID4g
aW5kZXggMmM5NzVkOWNlYWQyLi43ZDU1MTc2NDhlYTcgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9jZXNzb3IuaAo+ID4gKysrIGIv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmgKPiA+
IEBAIC00Miw2ICs0Miw4IEBAIHN0YXRpYyBpbmxpbmUgdWludDY0X3QgX19rdm1fcmVnX2lkKHVp
bnQ2NF90IHR5cGUsIHVpbnQ2NF90IGlkeCwKPiA+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfUkVH
KGlkeCkgICAgICAgX19rdm1fcmVnX2lkKEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCwgXAo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlkeCwgS1ZNX1JFR19TSVpF
X1VMT05HKQo+ID4KPiA+ICtib29sIF9fdmNwdV9oYXNfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwgaW50IGV4dCk7Cj4gPiArCj4gPiAgc3RydWN0IGV4X3JlZ3Mgewo+ID4gICAgICAgdW5zaWdu
ZWQgbG9uZyByYTsKPiA+ICAgICAgIHVuc2lnbmVkIGxvbmcgc3A7Cj4gPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYyBiL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMKPiA+IGluZGV4IDM5
YTFlOTkwMmRlYy4uZTUyN2FkMGFiYzMwIDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYwo+ID4gKysrIGIvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYwo+ID4gQEAgLTE1LDYgKzE1LDE1
IEBACj4gPgo+ID4gIHN0YXRpYyB2bV92YWRkcl90IGV4Y2VwdGlvbl9oYW5kbGVyczsKPiA+Cj4g
PiArYm9vbCBfX3ZjcHVfaGFzX2V4dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGludCBleHQpCj4g
PiArewo+ID4gKyAgICAgdW5zaWduZWQgbG9uZyB2YWx1ZSA9IDA7Cj4gPiArCj4gPiArICAgICBf
X3ZjcHVfZ2V0X3JlZyh2Y3B1LCBSSVNDVl9JU0FfRVhUX1JFRyhleHQpLCAmdmFsdWUpOwo+ID4g
Kwo+ID4gKyAgICAgcmV0dXJuICEhdmFsdWU7Cj4KPiBJJ2QgcmF0aGVyIG5vdCBhc3N1bWUgdGhh
dCB2YWx1ZSB3aWxsIHJlbWFpbiB6ZXJvIGFjcm9zcyBhIHN5c3RlbSBjYWxsCj4gd2hpY2ggZmFp
bHMuIExldCdzIHdyaXRlIHRoaXMgYXMKPgo+ICAgICAgdW5zaWduZWQgbG9uZyB2YWx1ZSA9IDA7
Cj4gICAgICBpbnQgcmV0Owo+Cj4gICAgICByZXQgPSBfX3ZjcHVfZ2V0X3JlZyh2Y3B1LCBSSVND
Vl9JU0FfRVhUX1JFRyhleHQpLCAmdmFsdWUpOwo+Cj4gICAgICByZXR1cm4gIXJldCAmJiAhIXZh
bHVlOwo+CgpTdXJlLiBUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uIQoKPiA+ICt9Cj4gPiArCj4g
PiAgc3RhdGljIHVpbnQ2NF90IHBhZ2VfYWxpZ24oc3RydWN0IGt2bV92bSAqdm0sIHVpbnQ2NF90
IHYpCj4gPiAgewo+ID4gICAgICAgcmV0dXJuICh2ICsgdm0tPnBhZ2Vfc2l6ZSkgJiB+KHZtLT5w
YWdlX3NpemUgLSAxKTsKPiA+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9r
dm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlz
Y3YvZ2V0LXJlZy1saXN0LmMKPiA+IGluZGV4IGQ4ZWNhY2QwM2VjZi4uMGRjZmY4MjNmMjg3IDEw
MDY0NAo+ID4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWct
bGlzdC5jCj4gPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJl
Zy1saXN0LmMKPiA+IEBAIC00NCwyMCArNDQsNiBAQCBib29sIGNoZWNrX3JlamVjdF9zZXQoaW50
IGVycikKPiA+ICAgICAgIHJldHVybiBlcnIgPT0gRUlOVkFMOwo+ID4gIH0KPiA+Cj4gPiAtc3Rh
dGljIGlubGluZSBib29sIHZjcHVfaGFzX2V4dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGludCBl
eHQpCj4gPiAtewo+ID4gLSAgICAgaW50IHJldDsKPiA+IC0gICAgIHVuc2lnbmVkIGxvbmcgdmFs
dWU7Cj4gPiAtCj4gPiAtICAgICByZXQgPSBfX3ZjcHVfZ2V0X3JlZyh2Y3B1LCBSSVNDVl9JU0Ff
RVhUX1JFRyhleHQpLCAmdmFsdWUpOwo+ID4gLSAgICAgaWYgKHJldCkgewo+ID4gLSAgICAgICAg
ICAgICBwcmludGYoIkZhaWxlZCB0byBnZXQgZXh0ICVkIiwgZXh0KTsKPiA+IC0gICAgICAgICAg
ICAgcmV0dXJuIGZhbHNlOwo+ID4gLSAgICAgfQo+ID4gLQo+ID4gLSAgICAgcmV0dXJuICEhdmFs
dWU7Cj4gPiAtfQo+ID4gLQo+ID4gIHZvaWQgZmluYWxpemVfdmNwdShzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUsIHN0cnVjdCB2Y3B1X3JlZ19saXN0ICpjKQo+ID4gIHsKPiA+ICAgICAgIHN0cnVjdCB2
Y3B1X3JlZ19zdWJsaXN0ICpzOwo+ID4gQEAgLTc3LDcgKzYzLDcgQEAgdm9pZCBmaW5hbGl6ZV92
Y3B1KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IHZjcHVfcmVnX2xpc3QgKmMpCj4gPiAg
ICAgICAgICAgICAgIF9fdmNwdV9zZXRfcmVnKHZjcHUsIFJJU0NWX0lTQV9FWFRfUkVHKHMtPmZl
YXR1cmUpLCAxKTsKPiA+Cj4gPiAgICAgICAgICAgICAgIC8qIERvdWJsZSBjaGVjayB3aGV0aGVy
IHRoZSBkZXNpcmVkIGV4dGVuc2lvbiB3YXMgZW5hYmxlZCAqLwo+ID4gLSAgICAgICAgICAgICBf
X1RFU1RfUkVRVUlSRSh2Y3B1X2hhc19leHQodmNwdSwgcy0+ZmVhdHVyZSksCj4gPiArICAgICAg
ICAgICAgIF9fVEVTVF9SRVFVSVJFKF9fdmNwdV9oYXNfZXh0KHZjcHUsIHMtPmZlYXR1cmUpLAo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiJXMgbm90IGF2YWlsYWJsZSwgc2tpcHBp
bmcgdGVzdHNcbiIsIHMtPm5hbWUpOwo+ID4gICAgICAgfQo+ID4gIH0KPiA+IC0tCj4gPiAyLjM0
LjEKPiA+Cj4KPiBPdGhlcndpc2UsCj4KPiBSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9u
ZXNAdmVudGFuYW1pY3JvLmNvbT4KPgo+IFRoYW5rcywKPiBkcmV3CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
