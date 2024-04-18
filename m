Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A86FC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 13:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/vwM5gk5o9UIIWdzYTpk5GhlCzvzx5hPsJ9J3Ol1M3w=; b=j4vIUsdSHFpWFD
	e+gZsiAwUpBMzUc1dEA+7ZtHEGutuO09o+Kya+gQt6ytp1Z+iM9G07qYekRUsQ9MsQqbw1bg0AuAE
	/yomOb+yPx1cy4tn9HFph6pvzP/HTVccKn7KxKC5K3wWKCULiuKfpUphYy5zqRPzxQfeQhvoDIdE2
	TMW6mv+bK1UXL1W0Dfv42KcUIo7MrOde9sI3gZ9MSKP4vhzVJ0JNPkyONWCwpPLLXZxjDZ5dNJRQO
	X6prvrvCODaGvcJ1jMuvPAYert8n5XerC4iHuOXEG9Ey7aR9BN5irG3dP6NHbnveIR49GvwaQKPYE
	WHH4EEjDdvohdHQ7SP1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxRiD-00000002MZm-1UtL;
	Thu, 18 Apr 2024 13:22:01 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxRi7-00000002MW2-0MUI
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 13:21:59 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-36a165b8845so2695745ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 06:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1713446514; x=1714051314; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoKv/RvImu/DvMyByUVz7vVdzNGU4YtRJIIOcys5EGM=;
        b=CWB9YTCSQoU9PqxdzWZwbKPU5uQHQsXR8NqbJ2q5H0W0edo60xpgHO8ZWiZWRG9gFH
         Xtd9UFLcO+iLiOiH+ONEgzUXk8kLQ+IQwzyxaRw+rvTF5va86FHHzOW6cV105PKrPeSb
         5GjfvMd3ibYZtAcp/iZXjBZ7RTfm7BKG+AYz8tIHta3UGdIZK9y42rZ87qL2Uy9NgDa6
         H0pxvHnbU/a8BWVlfjnsteUTVcYRi+4jNgJmHe9l5jsSxk81ZrTrEu1JYAF41EbGoNip
         kL3jRK8nOIf8MnsMEAztrVTnaQgcofTV3Fc3H4qaKPfCqDy/PRMKoOpWh4DqP8EJlHra
         qg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713446514; x=1714051314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoKv/RvImu/DvMyByUVz7vVdzNGU4YtRJIIOcys5EGM=;
        b=s8qBmgdQHvncC4QZWMZo6rMggxCOPsdIfB0jrKNFQE/sa2hPh2YX8vYOmmiOUtpxI/
         Knm6bYYqF7tf7+qwPFSHjYsLAZ6tP6MC4WvUGuvOQEYGB3qehueUYf5nKGb4EM5Dvl98
         /+VJwg6WAXTu+6LWwvoqIcjwgyUgcDZxJ2QdfG0UIRVabxfo2rs39m2o9BVxWrwsORIm
         Ez/+wS6B8sLlKAlWtnGxMZ8swXraexXcCR7LH/cSXfmFSBwUDqOGcHsQI638JrkAMp0P
         Xc7o5nGlba050CdjcjGBeViCZNa5kMNghYoqaX0zJVX1ozfOkV8cinVQghKOimhWQL2j
         0ivQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWalhXIdFV2SWIwDqCfmqothHOcUw8jda7cT6ibzXSjFUm8mQFSQInfUDcpzhDk4ZODUAvwvm9uw89TZ4Q+uOuCuOYw1CW9L+zEhqsWVBp
X-Gm-Message-State: AOJu0Yx2G80kYrgujUyQB9Vpe9JzhAUAh2NX7M9+IK0/PPRiSpdu0ICh
	F/4J8MDTwMYQOlRC6NnygTNWgDo/sVxU9kpFsMPdXmjOkWm7IBHJ9CAc4EcmUYa41n4h6p4NVgG
	uGcDdj4+c7jjUdFu4YIxvQeAhgOK9V5H0IlsBaA==
X-Google-Smtp-Source: AGHT+IEApINqgeOPDHJLzzONqjKCkFgNoR1r7odlJyA+5mEx0EiPGBX8zhfWadQ1GLIFdXLBTz+rTCuaedf0Dv5uyZs=
X-Received: by 2002:a05:6e02:1688:b0:36a:3c40:3e34 with SMTP id
 f8-20020a056e02168800b0036a3c403e34mr3335042ila.1.1713446514294; Thu, 18 Apr
 2024 06:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240418124300.1387978-1-cleger@rivosinc.com> <20240418124300.1387978-13-cleger@rivosinc.com>
In-Reply-To: <20240418124300.1387978-13-cleger@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 18 Apr 2024 18:51:42 +0530
Message-ID: <CAAhSdy1VTn_etwfYa-pYM-1hFFK02aBvynHJA7JVsOZvSdDx6w@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] KVM: riscv: selftests: Add Zcmop extension to
 get-reg-list test
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_062155_158376_06CB9ECF 
X-CRM114-Status: GOOD (  13.30  )
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

T24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgNjoxNOKAr1BNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGUgS1ZNIFJJU0MtViBhbGxvd3MgWmNtb3AgZXh0
ZW5zaW9uIGZvciBHdWVzdC9WTSBzbyBhZGQgdGhpcwo+IGV4dGVuc2lvbiB0byBnZXQtcmVnLWxp
c3QgdGVzdC4KPgo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9z
aW5jLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0
Lm9yZz4KQWNrZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpUaGFua3Ms
CkFudXAKCj4gLS0tCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVn
LWxpc3QuYyB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBk
aWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlz
dC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCj4g
aW5kZXggNjFjYWQ0NTE0MTk3Li45NjA0YzhlY2U3ODcgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCj4gKysrIGIvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCj4gQEAgLTU5LDYgKzU5LDcg
QEAgYm9vbCBmaWx0ZXJfcmVnKF9fdTY0IHJlZykKPiAgICAgICAgIGNhc2UgS1ZNX1JFR19SSVND
Vl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRf
WkNCOgo+ICAgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NW
X0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0Q6Cj4gICAgICAgICBjYXNlIEtWTV9S
RUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVNDVl9J
U0FfRVhUX1pDRjoKPiArICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JF
R19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkNNT1A6Cj4gICAgICAgICBj
YXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtW
TV9SSVNDVl9JU0FfRVhUX1pGQToKPiAgICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhU
IHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkZIOgo+ICAg
ICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5H
TEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aRkhNSU46Cj4gQEAgLTQyOSw2ICs0MzAsNyBAQCBzdGF0
aWMgY29uc3QgY2hhciAqaXNhX2V4dF9zaW5nbGVfaWRfdG9fc3RyKF9fdTY0IHJlZ19vZmYpCj4g
ICAgICAgICAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihaQ0IpLAo+ICAgICAgICAgICAgICAgICBL
Vk1fSVNBX0VYVF9BUlIoWkNEKSwKPiAgICAgICAgICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpD
RiksCj4gKyAgICAgICAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihaQ01PUCksCj4gICAgICAgICAg
ICAgICAgIEtWTV9JU0FfRVhUX0FSUihaRkEpLAo+ICAgICAgICAgICAgICAgICBLVk1fSVNBX0VY
VF9BUlIoWkZIKSwKPiAgICAgICAgICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpGSE1JTiksCj4g
QEAgLTk1Nyw2ICs5NTksNyBAQCBLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpjYSwgWkNBKSwK
PiAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6Y2IsIFpDQiksCj4gIEtWTV9JU0FfRVhUX1NJ
TVBMRV9DT05GSUcoemNkLCBaQ0QpLAo+ICBLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpjZiwg
WkNGKSwKPiArS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6Y21vcCwgWkNNT1ApOwo+ICBLVk1f
SVNBX0VYVF9TSU1QTEVfQ09ORklHKHpmYSwgWkZBKTsKPiAgS1ZNX0lTQV9FWFRfU0lNUExFX0NP
TkZJRyh6ZmgsIFpGSCk7Cj4gIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemZobWluLCBaRkhN
SU4pOwo+IEBAIC0xMDE3LDYgKzEwMjAsNyBAQCBzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAqdmNwdV9j
b25maWdzW10gPSB7Cj4gICAgICAgICAmY29uZmlnX3pjYiwKPiAgICAgICAgICZjb25maWdfemNk
LAo+ICAgICAgICAgJmNvbmZpZ196Y2YsCj4gKyAgICAgICAmY29uZmlnX3pjbW9wLAo+ICAgICAg
ICAgJmNvbmZpZ196ZmEsCj4gICAgICAgICAmY29uZmlnX3pmaCwKPiAgICAgICAgICZjb25maWdf
emZobWluLAo+IC0tCj4gMi40My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
