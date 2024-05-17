Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CF0C04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 15:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qXcGnI/CJGJAipoe4WdT1sPS6Oc7OYE3B+ym/djEqGo=; b=ttL3B8zXZ732rr
	N8JaF4pRg9vPCI9Jist9htP3RsQwZMQRjwQtD5ekWZVKPHvJtD2KUmCSonj48/+HUODEPXdSrda5z
	ZrvDZu6r4Je6C7fkmmC5PPnKSKSvJN5HnHW4jEyqU0fB6ZYcdqKXU4MNo/IydTjOspfUg1b99EAGH
	z+iHOasjhlRNXgnX3P2l5JqgD3QUm6MUEdhcOYL8nlDgKECCz5/xZe1/0ebTCr5l5wgTZiTDhEZgl
	KYxMTpZ/b5rgl1iG1Vbr0rg1U7szXf2zqfWiaeGt3ToS3IrL35WWskKeBjoA5dK+gZVnTjhhPUO3Z
	ECuRoJlJRAlKv4WVHPRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7zLn-00000008EUk-0qbn;
	Fri, 17 May 2024 15:18:27 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7zLk-00000008ENN-0bGU
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 15:18:25 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-36d93568a58so3070015ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 May 2024 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1715959084; x=1716563884; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ef3MF8Rs0G3jit24HO3OWy+0DrrgzGDkN37Y+6PEB9I=;
        b=LcyfPbBGiEts05BXuSPFON0AngZ14H9DHw7gNeV3VNlNeLSg8Kb1QUgT9YGYTgGILO
         41yS9MnRMqW0HZgdUD9XlOonz8UxYUtrUHRS4GOfghBiht+jbrN7+5zEQLAc8GME4XDx
         LHa02RxUVz3hsgtwS8psXPuI2h8BFrm072TVOtl5G2sP8yjOsrvdr172l9RiTgGbc2/X
         gRffSDHWrL1+BSoECurqHOLhPc30joGE98ud22d63i8niAV57htmrrbsJbgr9FTjNgiL
         SCG/ARt0qwAWR3tsSp0QJql+38yGxithqXS1LQ6XS2YUmHYYiX1rg6pVywdDEXR6M61u
         Xlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715959084; x=1716563884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ef3MF8Rs0G3jit24HO3OWy+0DrrgzGDkN37Y+6PEB9I=;
        b=jSKDM4R+r378gMCf8ds5qp4LygJ9fVIx0Lpu/hSOUuiFIF+oGYwEpCnvFbKUeZ3jyE
         PsBjn0GP9PmQbWgdzdtOV67ixg8QtMwns4lDtcB6CB7MnIyrMKywH+t75hlGXXw3JAif
         LgIujUD1g1qqRYfF0GyP7JCJKuKt3FJOzgdJfrhtXMqMr3wuLGrAJ2vvN1+zDbQ0QEPm
         zcuAjWXNkEzVNo6sFXK2Zs0TZsw0Sh9SxgakkEGO8cLKKUJWqo3LmGzDtZa0wpxfmi3U
         RWm/gXLD9FtPm8+PHgqE2DLetOD3CTuNhFUvb9q2T3VY583ed7UHvhzJ80F2xm60aiT7
         E7tw==
X-Forwarded-Encrypted: i=1; AJvYcCX1uYXx6udU2AFikkb4zict85duVMPh/YJW92a6ta5GUFTQ4qjOMS7AMZILbWI5j9ZP8cFVhmlTJQk5v8IJWivkhSi4OnfkF1xCz7js9F4A
X-Gm-Message-State: AOJu0YzrdsdMCtyTcH9IoIbmrQDSGAE3R8FmAFiCTaNoWlUCGuDxV5BN
	Kb8eUJL3ywuXNJUaj8Fmc147fkkakOYS6w3CYLNSX3oienrXubcJMmUSXubTQcHHQj9lK68u76H
	YJqpOkecDIWJs7ny5d/njwAGnccqwBQaCnLzc2g==
X-Google-Smtp-Source: AGHT+IHuY13zH4hhNjNUU8E5CU5OnLiqg38O1otrjb+/eoZzOjdRjWwMMh69eiDOSrh7CQUbUVho6c8rmZEAihhoEvk=
X-Received: by 2002:a05:6e02:1886:b0:36a:1725:e123 with SMTP id
 e9e14a558f8ab-36cc14913bfmr268024205ab.14.1715959084494; Fri, 17 May 2024
 08:18:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240517145302.971019-1-cleger@rivosinc.com> <20240517145302.971019-5-cleger@rivosinc.com>
In-Reply-To: <20240517145302.971019-5-cleger@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 May 2024 20:47:51 +0530
Message-ID: <CAAhSdy0Ft5KV5ABBPNjxhy71jY0ypF7S6vhrb7gfq892WQkv1w@mail.gmail.com>
Subject: Re: [PATCH v5 04/16] RISC-V: KVM: Allow Zimop extension for Guest/VM
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
X-CRM114-CacheID: sfid-20240517_081824_189615_8288727A 
X-CRM114-Status: GOOD (  13.55  )
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

T24gRnJpLCBNYXkgMTcsIDIwMjQgYXQgODoyM+KAr1BNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBFeHRlbmQgdGhlIEtWTSBJU0EgZXh0ZW5zaW9uIE9O
RV9SRUcgaW50ZXJmYWNlIHRvIGFsbG93IEtWTSB1c2VyIHNwYWNlCj4gdG8gZGV0ZWN0IGFuZCBl
bmFibGUgWmltb3AgZXh0ZW5zaW9uIGZvciBHdWVzdC9WTS4KPgo+IFNpZ25lZC1vZmYtYnk6IENs
w6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTog
QW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KQWNrZWQtYnk6IEFudXAgUGF0ZWwgPGFu
dXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvdWFwaS9hc20va3ZtLmggfCAxICsKPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcu
YyAgICAgIHwgMiArKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS91YXBpL2FzbS9rdm0uaAo+IGluZGV4IGIxYzUwM2MyOTU5Yy4uMzVhMTJhYTE5NTNl
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaAo+ICsrKyBi
L2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaAo+IEBAIC0xNjcsNiArMTY3LDcgQEAg
ZW51bSBLVk1fUklTQ1ZfSVNBX0VYVF9JRCB7Cj4gICAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9a
RkEsCj4gICAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9aVFNPLAo+ICAgICAgICAgS1ZNX1JJU0NW
X0lTQV9FWFRfWkFDQVMsCj4gKyAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9aSU1PUCwKPiAgICAg
ICAgIEtWTV9SSVNDVl9JU0FfRVhUX01BWCwKPiAgfTsKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2t2bS92Y3B1X29uZXJlZy5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwo+IGlu
ZGV4IGY0YTYxMjRkMjVjOS4uYzZlZTc2MzQyMmYyIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfb25lcmVnLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCj4g
QEAgLTYwLDYgKzYwLDcgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGxvbmcga3ZtX2lzYV9leHRf
YXJyW10gPSB7Cj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWklISU5UTlRMKSwKPiAgICAgICAg
IEtWTV9JU0FfRVhUX0FSUihaSUhJTlRQQVVTRSksCj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIo
WklIUE0pLAo+ICsgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpJTU9QKSwKPiAgICAgICAgIEtWTV9J
U0FfRVhUX0FSUihaS05EKSwKPiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihaS05FKSwKPiAgICAg
ICAgIEtWTV9JU0FfRVhUX0FSUihaS05IKSwKPiBAQCAtMTM3LDYgKzEzOCw3IEBAIHN0YXRpYyBi
b29sIGt2bV9yaXNjdl92Y3B1X2lzYV9kaXNhYmxlX2FsbG93ZWQodW5zaWduZWQgbG9uZyBleHQp
Cj4gICAgICAgICBjYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1pJSElOVE5UTDoKPiAgICAgICAgIGNh
c2UgS1ZNX1JJU0NWX0lTQV9FWFRfWklISU5UUEFVU0U6Cj4gICAgICAgICBjYXNlIEtWTV9SSVND
Vl9JU0FfRVhUX1pJSFBNOgo+ICsgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aSU1PUDoK
PiAgICAgICAgIGNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWktORDoKPiAgICAgICAgIGNhc2UgS1ZN
X1JJU0NWX0lTQV9FWFRfWktORToKPiAgICAgICAgIGNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWktO
SDoKPiAtLQo+IDIuNDMuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
