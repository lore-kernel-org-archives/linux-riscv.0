Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E80CD128E
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 10:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j4Q2lm587gIxY2WDdWXDLQmVZ6kklsQP3FQZ9ZXRob4=; b=e+z//tcFklppz+
	mpHwOwIvTy8fQ+XaUsMKwDADeKIWNAjRSRyGzO6YeGHq/HNIV3k/S26Mu/BJMj7kYZkzP8fbjYHar
	Aq+bTAud7CM1hB3Ou1Ib7ZSo2+ssZTI3LqrwpN3wcoMApHu/sNJbZQPKHcm3ggnPH5hWUj8jIqjMa
	HEai8NHTtzSursRhX8YRVuRLcrhYPC4XrBHmXGdPM+n0McuA4E3H6LeRA5xa4QUvUCQ0Vybi19lAJ
	hrG+ec4c2l/xs295AHQuHwVo5YHxp81832nYIStoyoLJXvPmCrcO58jwKcSlgfDslSJcYhI1xyVPc
	B3kLDc9Qe9X96geQepow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq9Yp-000000003ay-3Fuz;
	Fri, 29 Mar 2024 10:34:11 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8X4-0000000HUhU-3KQW
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 09:28:23 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1e0bfc42783so16069765ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 02:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711704496; x=1712309296; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/lyzq0wGOrToQ2iQEyeXKMeMPovCKQNw+2NCntCzWKQ=;
        b=fmyPnpel7NRrIOOwXgmS2W7Y5Q4+dB5qKh638lIyP3hvptVXuo1RWBYMMt8rAWw3tl
         ricGMZbTwjvJ3rRnL1mMk31JmrdW2egJk+cN5OfPy9qjV2TcGx7Dxe7V97RlyGv/yUGH
         Vhhfs4Cl8DJdS0leDjrFD4hIzw1U1q4fRynnh2QwT6FMeKnEir8/qjwQwYbI1nHqO4cH
         HrE+Wpzn/yxBuRZOZKIAEmsS3/eftHe9ufNVfCvspZlHy8vyv7z+FQtxFwLVva8U0ZS+
         eJuvAwdTS5ZQY4kXk5cvWrCPpeMScgGOGm+BCYUZPnNvytJsuXMiiF9ERyGEveVlOIqT
         +fsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711704496; x=1712309296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lyzq0wGOrToQ2iQEyeXKMeMPovCKQNw+2NCntCzWKQ=;
        b=ee4HjVsWy6655/O27eiOjngMNwh33etBaiF/lnk1R7pxpSqYeJDv1CHq+daIe60Lkv
         3j4z0xNaxIgPVwX6+KJ9bMmfb9Lzhme04ZvyKwf6NRHLuslO0HMaZNCkKkL69g4Gjp+T
         e/r3YGZQM1zRwdoXAHaX7QUY/krLEm/hqucWpxvwr9dZ5a11FaQZK8Uh4zMKxXECgEHr
         6AH33SiIS5xXe12mbDOYU7VcT42gkD6cZv9190fX7y9yG/RZRuT4mc6qrH9EC1tFaY4n
         zwLguqmE7Iwj4Q/3PvVOZXby5VwUP1RtTRUn+/gCt9uCpEMmAZI+/5gtUPFayH0z7U2S
         Z7HA==
X-Forwarded-Encrypted: i=1; AJvYcCX1XBa44u48HvSUT74HNEw+U+S82jiQj+EvN/xL+mgodj7cickHtSf+7zT80lm3iTTijQT3MPd5OAHs5oyg67Rxet2e/BISbkbADdNUF0u7
X-Gm-Message-State: AOJu0Yx6OLpdKulviMBVyCd9zpVTaMM0NuyHR3PBQuPjpqnum0N8X0rR
	f3+tAz9qh4mJB1Zo/nf+E7Or+2UJFWUY5hhpvSPnn+2F2FK20AZ0ImVF0WEvDkf44LSXNkhFQ0M
	IDWMQMXmZsP5P3/bnNF82s2Z2wITfERvOodAhWqnV1qcBwpBYhmwUySZO6Q5F5Mte39QNbBT0cm
	lRDFk35g0rL3hgAcqXOkYUA3T1a7xPf16hiK+6QJarmS1nKKoleA==
X-Google-Smtp-Source: AGHT+IERD9iL6cC6QBlpwrE+WhviS3lzGnj6I0fmkcIha5EAxHWeUpBSJ6740UpJGEHt1s0r02s0NQ==
X-Received: by 2002:a17:90b:1091:b0:2a0:2b14:6d8d with SMTP id gj17-20020a17090b109100b002a02b146d8dmr1780476pjb.1.1711704496150;
        Fri, 29 Mar 2024 02:28:16 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id cv17-20020a17090afd1100b002a02f8d350fsm2628830pjb.53.2024.03.29.02.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 02:28:15 -0700 (PDT)
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 29 Mar 2024 17:26:26 +0800
Subject: [PATCH RFC 10/11] riscv: KVM: Add hcontext support
MIME-Version: 1.0
Message-Id: <20240329-dev-maxh-lin-452-6-9-v1-10-1534f93b94a7@sifive.com>
References: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
In-Reply-To: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 Max Hsu <max.hsu@sifive.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_022819_118063_B09B8930 
X-CRM114-Status: GOOD (  18.99  )
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

RnJvbTogWW9uZy1YdWFuIFdhbmcgPHlvbmd4dWFuLndhbmdAc2lmaXZlLmNvbT4KCmhjb250ZXh0
IENTUiBzdG9yZSB0aGUgSUQgb2YgdGhlIGN1cnJlbnRseSBydW5uaW5nIG1hY2hpbmUgc3RhdHVz
LgpXaGVuIGEgdmlydHVhbCBtYWNoaW5lIGlzIGluaXRpYWxpemVkLCBpdCB3aWxsIG9idGFpbiBh
bmQgdXRpbGl6ZQp0aGUgZmlyc3QgYXZhaWxhYmxlIElELgpJdCB3aWxsIGJlIHVwZGF0ZWQgdG8g
Vk0gSUQgd2hlbiBzd2l0Y2ggdG8gYSB2aXJ0dWFsIG1hY2hpbmUsCmFuZCB1cGRhdGVkIHRvIDAg
d2hlbiBzd2l0Y2ggYmFjayB0byBob3N0IG1hY2hpbmUuCgpTaWduZWQtb2ZmLWJ5OiBZb25nLVh1
YW4gV2FuZyA8eW9uZ3h1YW4ud2FuZ0BzaWZpdmUuY29tPgpDby1kZXZlbG9wZWQtYnk6IE1heCBI
c3UgPG1heC5oc3VAc2lmaXZlLmNvbT4KU2lnbmVkLW9mZi1ieTogTWF4IEhzdSA8bWF4LmhzdUBz
aWZpdmUuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCAgICAgICB8
ICAzICsrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X2RlYnVnLmggfCAgNyArKysK
IGFyY2gvcmlzY3Yva3ZtL21haW4uYyAgICAgICAgICAgICAgICAgICB8ICA0ICsrCiBhcmNoL3Jp
c2N2L2t2bS92Y3B1X2RlYnVnLmMgICAgICAgICAgICAgfCA3OCArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIGFyY2gvcmlzY3Yva3ZtL3ZtLmMgICAgICAgICAgICAgICAgICAgICB8
ICA0ICsrCiA1IGZpbGVzIGNoYW5nZWQsIDk2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2t2bV9ob3N0LmgKaW5kZXggZDQ5NTI3OWQ5OWUxLi5iNWQ5NzI3ODMxMTYgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2t2bV9ob3N0LmgKQEAgLTEwMyw2ICsxMDMsOSBAQCBzdHJ1Y3Qga3ZtX2FyY2ggewog
CiAJLyogQUlBIEd1ZXN0L1ZNIGNvbnRleHQgKi8KIAlzdHJ1Y3Qga3ZtX2FpYSBhaWE7CisKKwkv
KiBoY29udGV4dCBJRCBmb3IgZ3Vlc3QgVk0gKi8KKwl1bnNpZ25lZCBsb25nIGhjb250ZXh0Owog
fTsKIAogc3RydWN0IGt2bV9jcHVfdHJhcCB7CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2t2bV92Y3B1X2RlYnVnLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1
X2RlYnVnLmgKaW5kZXggNmU3Y2U2YjQwOGE2Li4wYTAyNWZjNGU2ZGQgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfZGVidWcuaAorKysgYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2t2bV92Y3B1X2RlYnVnLmgKQEAgLTExLDYgKzExLDEzIEBACiAKICNpbmNsdWRl
IDxsaW51eC90eXBlcy5oPgogCitERUNMQVJFX1NUQVRJQ19LRVlfRkFMU0UodXNlX2hjb250ZXh0
KTsKK2V4dGVybiBhdG9taWNfbG9uZ190IGhjb250ZXh0X2lkX3NoYXJlOworCit2b2lkIGt2bV9y
aXNjdl9kZWJ1Z19pbml0KHZvaWQpOwordm9pZCBrdm1fcmlzY3ZfZGVidWdfZXhpdCh2b2lkKTsK
K3ZvaWQga3ZtX3Jpc2N2X2RlYnVnX2dldF9oY29udGV4dF9pZChzdHJ1Y3Qga3ZtICprdm0pOwor
dm9pZCBrdm1fcmlzY3ZfZGVidWdfcmV0dXJuX2hjb250ZXh0X2lkKHN0cnVjdCBrdm0gKmt2bSk7
CiB2b2lkIGt2bV9yaXNjdl9kZWJ1Z192Y3B1X3N3YXBfaW5fZ3Vlc3RfY29udGV4dChzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUpOwogdm9pZCBrdm1fcmlzY3ZfZGVidWdfdmNwdV9zd2FwX2luX2hvc3Rf
Y29udGV4dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2t2bS9tYWluLmMgYi9hcmNoL3Jpc2N2L2t2bS9tYWluLmMKaW5kZXggMjI1YTQzNWQ5YzlhLi5m
ZjI4Yjk2YWQ3MGIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva3ZtL21haW4uYworKysgYi9hcmNo
L3Jpc2N2L2t2bS9tYWluLmMKQEAgLTEyNSw2ICsxMjUsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBy
aXNjdl9rdm1faW5pdCh2b2lkKQogCQlyZXR1cm4gcmM7CiAJfQogCisJa3ZtX3Jpc2N2X2RlYnVn
X2luaXQoKTsKKwogCXJldHVybiAwOwogfQogbW9kdWxlX2luaXQocmlzY3Zfa3ZtX2luaXQpOwpA
QCAtMTMzLDYgKzEzNSw4IEBAIHN0YXRpYyB2b2lkIF9fZXhpdCByaXNjdl9rdm1fZXhpdCh2b2lk
KQogewogCWt2bV9yaXNjdl9haWFfZXhpdCgpOwogCisJa3ZtX3Jpc2N2X2RlYnVnX2V4aXQoKTsK
KwogCWt2bV9leGl0KCk7CiB9CiBtb2R1bGVfZXhpdChyaXNjdl9rdm1fZXhpdCk7CmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X2RlYnVnLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X2Rl
YnVnLmMKaW5kZXggZTdlOTI2M2MyZTMwLi41MDgxYzI3MmYwMWQgMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfZGVidWcuYworKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X2RlYnVnLmMK
QEAgLTYsNiArNiw4NCBAQAogI2luY2x1ZGUgPGxpbnV4L2t2bV9ob3N0Lmg+CiAjaW5jbHVkZSA8
YXNtL3N3aXRjaF90by5oPgogCitERUZJTkVfU1BJTkxPQ0soaGNvbnRleHRfbG9jayk7Cit1bnNp
Z25lZCBsb25nICpoY29udGV4dF9iaXRtYXA7Cit1bnNpZ25lZCBsb25nIGhjb250ZXh0X2JpdG1h
cF9sZW47CisKK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCBoYXNfaGNvbnRleHQodm9pZCkK
K3sKKwlyZXR1cm4gc3RhdGljX2JyYW5jaF9saWtlbHkoJnVzZV9oY29udGV4dCk7Cit9CisKK3Zv
aWQga3ZtX3Jpc2N2X2RlYnVnX2luaXQodm9pZCkKK3sKKwkvKgorCSAqIEFzIGZyb20gcmlzY3Yt
ZGVidWctc3BlYywgQ2hhcHRlciA1LjcuOToKKwkgKiBJZiB0aGUgSCBleHRlbnNpb24gaXMgaW1w
bGVtZW50ZWQsIGl04oCZcyByZWNvbW1lbmRlZCB0bworCSAqIGltcGxlbWVudCBubyBtb3JlIHRo
YW4gNyBiaXRzIG9uIFJWMzIgYW5kIDE0IG9uIFJWNjQuCisJICogQWxsb2NhdGluZyBiaXQgYXJy
YXkgYWNjb3JkaW5nIHRvIHNwZWMgc2l6ZS4KKwkgKi8KKyNpZiBfX3Jpc2N2X3hsZW4gPiAzMgor
CXVuc2lnbmVkIGxvbmcgdG1wID0gYXRvbWljX2xvbmdfcmVhZCgmaGNvbnRleHRfaWRfc2hhcmUp
ICYgR0VOTUFTSygxMywgMCk7CisjZWxzZQorCXVuc2lnbmVkIGxvbmcgdG1wID0gYXRvbWljX2xv
bmdfcmVhZCgmaGNvbnRleHRfaWRfc2hhcmUpICYgR0VOTUFTSyg2LCAwKTsKKyNlbmRpZgorCWlm
IChoYXNfaGNvbnRleHQoKSkgeworCQl3aGlsZSAodG1wKSB7CisJCQlrdm1faW5mbygiaGNvbnRl
eHQ6IHRyeSB0byBhbGxvY2F0ZSAweCVseC1iaXQgYXJyYXlcbiIsIHRtcCk7CisJCQloY29udGV4
dF9iaXRtYXBfbGVuID0gdG1wICsgMTsKKwkJCWhjb250ZXh0X2JpdG1hcCA9IGJpdG1hcF96YWxs
b2ModG1wLCAwKTsKKwkJCWlmIChoY29udGV4dF9iaXRtYXApCisJCQkJYnJlYWs7CisJCQl0bXAg
PSB0bXAgPj4gMTsKKwkJfQorCisJCWlmICh0bXAgPT0gMCkgeworCQkJLyogV2UgY2FuJ3QgYWxs
b2NhdGUgYW55IHNwYWNlIGZvciBoY29udGV4dCBiaXRtYXAgKi8KKwkJCXN0YXRpY19icmFuY2hf
ZGlzYWJsZSgmdXNlX2hjb250ZXh0KTsKKwkJfSBlbHNlIHsKKwkJCS8qIElEIDAgaXMgaHlwZXJ2
aXNvciAqLworCQkJc2V0X2JpdCgwLCBoY29udGV4dF9iaXRtYXApOworCQl9CisJfQorfQorCit2
b2lkIGt2bV9yaXNjdl9kZWJ1Z19leGl0KHZvaWQpCit7CisJaWYgKGhhc19oY29udGV4dCgpKSB7
CisJCXN0YXRpY19icmFuY2hfZGlzYWJsZSgmdXNlX2hjb250ZXh0KTsKKwkJa2ZyZWUoaGNvbnRl
eHRfYml0bWFwKTsKKwl9Cit9CisKK3ZvaWQga3ZtX3Jpc2N2X2RlYnVnX2dldF9oY29udGV4dF9p
ZChzdHJ1Y3Qga3ZtICprdm0pCit7CisJaWYgKGhhc19oY29udGV4dCgpKSB7CisJCXVuc2lnbmVk
IGxvbmcgZnJlZV9pZDsKKworCQlzcGluX2xvY2soJmhjb250ZXh0X2xvY2spOworCQlmcmVlX2lk
ID0gZmluZF9maXJzdF96ZXJvX2JpdChoY29udGV4dF9iaXRtYXAsIGhjb250ZXh0X2JpdG1hcF9s
ZW4pOworCisJCS8qIHNoYXJlIHRoZSBtYXhpbXVtIElEIHdoZW4gd2UgcnVuIG91dCBvZiB0aGUg
aGNvbnRleHQgSUQgKi8KKwkJaWYgKGZyZWVfaWQgPD0gaGNvbnRleHRfYml0bWFwX2xlbikKKwkJ
CXNldF9iaXQoZnJlZV9pZCwgaGNvbnRleHRfYml0bWFwKTsKKwkJZWxzZQorCQkJZnJlZV9pZCAt
PSAxOworCisJCWt2bS0+YXJjaC5oY29udGV4dCA9IGZyZWVfaWQ7CisJCXNwaW5fdW5sb2NrKCZo
Y29udGV4dF9sb2NrKTsKKwl9Cit9CisKK3ZvaWQga3ZtX3Jpc2N2X2RlYnVnX3JldHVybl9oY29u
dGV4dF9pZChzdHJ1Y3Qga3ZtICprdm0pCit7CisJaWYgKGhhc19oY29udGV4dCgpKSB7CisJCXNw
aW5fbG9jaygmaGNvbnRleHRfbG9jayk7CisJCWNsZWFyX2JpdChrdm0tPmFyY2guaGNvbnRleHQs
IGhjb250ZXh0X2JpdG1hcCk7CisJCXNwaW5fdW5sb2NrKCZoY29udGV4dF9sb2NrKTsKKwl9Cit9
CisKIHZvaWQga3ZtX3Jpc2N2X2RlYnVnX3ZjcHVfc3dhcF9pbl9ndWVzdF9jb250ZXh0KHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSkKIHsKIAlzdHJ1Y3Qga3ZtX3ZjcHVfc2R0cmlnX2NzciAqY3NyID0g
JnZjcHUtPmFyY2guc2R0cmlnX2NzcjsKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZtLmMg
Yi9hcmNoL3Jpc2N2L2t2bS92bS5jCmluZGV4IGNlNThiYzQ4ZTViOC4uMjc1ZjVmMDVkNGRkIDEw
MDY0NAotLS0gYS9hcmNoL3Jpc2N2L2t2bS92bS5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZtLmMK
QEAgLTQ1LDYgKzQ1LDggQEAgaW50IGt2bV9hcmNoX2luaXRfdm0oc3RydWN0IGt2bSAqa3ZtLCB1
bnNpZ25lZCBsb25nIHR5cGUpCiAKIAlrdm1fcmlzY3ZfZ3Vlc3RfdGltZXJfaW5pdChrdm0pOwog
CisJa3ZtX3Jpc2N2X2RlYnVnX2dldF9oY29udGV4dF9pZChrdm0pOworCiAJcmV0dXJuIDA7CiB9
CiAKQEAgLTUzLDYgKzU1LDggQEAgdm9pZCBrdm1fYXJjaF9kZXN0cm95X3ZtKHN0cnVjdCBrdm0g
Kmt2bSkKIAlrdm1fZGVzdHJveV92Y3B1cyhrdm0pOwogCiAJa3ZtX3Jpc2N2X2FpYV9kZXN0cm95
X3ZtKGt2bSk7CisKKwlrdm1fcmlzY3ZfZGVidWdfcmV0dXJuX2hjb250ZXh0X2lkKGt2bSk7CiB9
CiAKIGludCBrdm1fdm1faW9jdGxfaXJxX2xpbmUoc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3Zt
X2lycV9sZXZlbCAqaXJxbCwKCi0tIAoyLjQzLjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
