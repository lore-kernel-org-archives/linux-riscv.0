Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7CCC48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 23:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+mUxSRHWFPVzU6ifI46y/1fmOxfwfZy9Z9hr4PsG1oo=; b=TCUADwRNFVQuTp
	uAKgd+CSOqfBR6k+kzFpSZf8pYi6YwzsMMTXigXEKYGTeA5c0FPZZMI5aHOGov7BZJ/6rJAGHR0AX
	bBWQxmsdiyhfUkn5M5Q3STuJ50ejmVlyUykL4+VIonBqag/R9B2QvspikHRMGSl6n3IdgGuT1hKGT
	Smcs3fjr/86gccZKM+zNOWG+RRws9AX39/tBPXF/Nlgm4z1PjYEF5549M0snN6ZIMTGw4Lle9dDF6
	O328Ge006bP3BYmULCfGwcXwUfWzGnxBS3XCMbP6+wPxyzQc1hT/0WxvcDjUYsEo0jK4CFKi9J6Qb
	TFmM4dI/f5/8AeSrfn5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcZlO-0000000GX8P-0GDS;
	Tue, 20 Feb 2024 23:43:02 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcZlK-0000000GX7v-2XUF
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 23:43:00 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3c0d59a219dso3905287b6e.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Feb 2024 15:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708472577; x=1709077377; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rUPZxx4yc0Fym2aKmm76DxOfwl43+C+AKFEvJFvt0CE=;
        b=zopt7GKKxvGWyGX8Zn3FKWcOYW69g5Cz8vcKLkd1ZLz0Js1wM7goElekF9sIT/a0yp
         ZV66iEtKQICM9lGorOGwHhcLwm+04m5eJ+wpOmBSoJOm7t3e1BiFRueTFXUnPPgc/8sF
         pi27FnNOIc6xXtcxD1DNZIpl23dVixejoT3dH9MP9kP9HFZgi0Cv2Hl5ThAbIi1ikz9b
         Lb9lriT5GKpUlOc8QxvZ5kggaVYhI4zT5tczFDdSAleSR67ALG7cAoVoSguqWGa+lGs8
         h0ubuWB/zvdsMPpYZXikvmNINNDzK0d58/fcaosAj7GnsRNuhTif49Nxc/KDilbV2mPZ
         a//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708472577; x=1709077377;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rUPZxx4yc0Fym2aKmm76DxOfwl43+C+AKFEvJFvt0CE=;
        b=D0ZZxoQQ2U6YbV7lR19Eej391tNUxaXxBDpp7BZLx4XW4Kek/P47Tki+6nR+9w2BRA
         7TGayIZF2iTSLvTIPmVj2DlCBueSA6VGh1VfT578cysOfPVmTAN0OSnFNL6Y4YO8n19z
         9xdl6bKc+zVtbuaaTrTkH5kgndXEI/S+16e3gRXJihzOxpMZ1kQ+o8hoMnAgLpbi+1/N
         942NPoh83leOElj7g09LDXjfVdU1p25wv047Qk3KW4uXfFFB6qdFmiRqY6DUmhYIJ4Uc
         I8unIhMpO0hC6Yy7mdwlqLvGy2t0Cymcd8mEgigGdaPOURyr4AEvmk6HgajHUTsbieZr
         i2Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXMkgSCPBuJr/p2w0l2vUNEgiFv5xo30OiQ51kYJhLxmGbpFFJH75ekvELFjUvIMdYBo49qALNu/Qtv5Ch9HgHsTSZ1kLfBBcKnPCoen+xk
X-Gm-Message-State: AOJu0YwWWIg6/TI+aND8ixUkS1oO7lPd6uecGU8lJ7QPiFwsWKuair3M
	eDvt625HaOs3XoOwwb2HtUDC+k+ycnHsFgQR2Fme28yoOAfgm3/rOASxPDXU3ug=
X-Google-Smtp-Source: AGHT+IGB8ll+ozYI3O381NSidlwWWtxrXnCXwOmpDex8sV8coE6I7gWpQPn7NnyYF6GY6vUHK3eedA==
X-Received: by 2002:a05:6808:2f11:b0:3c1:5d20:179b with SMTP id gu17-20020a0568082f1100b003c15d20179bmr8468422oib.9.1708472576861;
        Tue, 20 Feb 2024 15:42:56 -0800 (PST)
Received: from [10.0.16.226] ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id o19-20020a637313000000b005dbed0ffb10sm7179064pgc.83.2024.02.20.15.42.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 15:42:56 -0800 (PST)
Message-ID: <3cd9c332-1187-4204-94c9-34a3c4f5958c@rivosinc.com>
Date: Tue, 20 Feb 2024 15:42:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: hwprobe: export Zihintpause ISA extension
Content-Language: en-US
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Robbin Ehn <rehn@rivosinc.com>
References: <20240219154905.528301-1-cleger@rivosinc.com>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240219154905.528301-1-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_154258_894810_131EAE23 
X-CRM114-Status: GOOD (  15.42  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMi8xOS8yNCAwNzo0OSwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+IEV4cG9ydCB0aGUgWmlo
aW50cGF1c2UgSVNBIGV4dGVuc2lvbiB0aHJvdWdoIGh3cHJvYmUgd2hpY2ggYWxsb3dzIHVzaW5n
Cj4gInBhdXNlIiBpbnN0cnVjdGlvbnMuIFNvbWUgdXNlcnNwYWNlIGFwcGxpY2F0aW9ucyAoT3Bl
bkpESyBmb3IKPiBpbnN0YW5jZSkgdXNlcyB0aGlzIHRvIGhhbmRsZSBzb21lIGxvY2tpbmcgYmFj
ay1vZmYuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3Np
bmMuY29tPgo+IAo+IC0tLQo+ICAgRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0
ICB8IDQgKysrKwo+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCB8IDEg
Kwo+ICAgYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyAgICAgICB8IDEgKwo+ICAgMyBm
aWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3
cHJvYmUucnN0Cj4gaW5kZXggYjJiY2M5ZWVkOWFhLi4wMDEyYzg0MzM2MTMgMTAwNjQ0Cj4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0Cj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0Cj4gQEAgLTE4OCw2ICsxODgsMTAgQEAgVGhlIGZv
bGxvd2luZyBrZXlzIGFyZSBkZWZpbmVkOgo+ICAgICAgICAgIG1hbnVhbCBzdGFydGluZyBmcm9t
IGNvbW1pdCA5NWNmMWY5ICgiQWRkIGNoYW5nZXMgcmVxdWVzdGVkIGJ5IFZlZAo+ICAgICAgICAg
IGR1cmluZyBzaWdub2ZmIikKPiAgIAo+ICsgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhU
X1pJSElOVFBBVVNFYDogVGhlIFppaGludHBhdXNlIGV4dGVuc2lvbiBpcwo+ICsgICAgICAgc3Vw
cG9ydGVkIGFzIGRlZmluZWQgaW4gdGhlIFJJU0MtViBJU0EgbWFudWFsIHN0YXJ0aW5nIGZyb20g
Y29tbWl0IGNvbW1pdAo+ICsgICAgICAgZDhhYjVjNzhjMjA3ICgiWmloaW50cGF1c2UgaXMgcmF0
aWZpZWQiKS4KPiArCj4gICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzBg
OiBBIGJpdG1hc2sgdGhhdCBjb250YWlucyBwZXJmb3JtYW5jZQo+ICAgICBpbmZvcm1hdGlvbiBh
Ym91dCB0aGUgc2VsZWN0ZWQgc2V0IG9mIHByb2Nlc3NvcnMuCj4gICAKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS91YXBpL2FzbS9od3Byb2JlLmgKPiBpbmRleCA5ZjJhOGUzZmYyMDQuLjMxYzU3MGNiZDFjNSAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4gKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAo+IEBAIC01OSw2ICs1OSw3
IEBAIHN0cnVjdCByaXNjdl9od3Byb2JlIHsKPiAgICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhU
X1pUU08JCSgxVUxMIDw8IDMzKQo+ICAgI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkFDQVMJ
CSgxVUxMIDw8IDM0KQo+ICAgI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWklDT05ECSgxVUxM
IDw8IDM1KQo+ICsjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aSUhJTlRQQVVTRQkoMVVMTCA8
PCAzNikKPiAgICNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8wCTUKPiAgICNkZWZp
bmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9VTktOT1dOCSgwIDw8IDApCj4gICAjZGVmaW5l
CQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRU1VTEFURUQJKDEgPDwgMCkKPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5
c19od3Byb2JlLmMKPiBpbmRleCBhN2M1NmI0MWVmZDIuLjEwMDhkMjU4ODBlMSAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvc3lzX2h3cHJvYmUuYwo+IEBAIC0xMTEsNiArMTExLDcgQEAgc3RhdGljIHZvaWQgaHdw
cm9iZV9pc2FfZXh0MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKPiAgIAkJRVhUX0tFWSha
VFNPKTsKPiAgIAkJRVhUX0tFWShaQUNBUyk7Cj4gICAJCUVYVF9LRVkoWklDT05EKTsKPiArCQlF
WFRfS0VZKFpJSElOVFBBVVNFKTsKPiAgIAo+ICAgCQlpZiAoaGFzX3ZlY3RvcigpKSB7Cj4gICAJ
CQlFWFRfS0VZKFpWQkIpOwoKUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3Np
bmMuY29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
