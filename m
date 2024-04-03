Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E089CD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 05:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oVampuy19XNWeeB01Xi2CeHCNcYVtTex35krBQuRgBw=; b=RyWbBR1CJoQBOl
	g8NiRVFBd8qtP67y15D7ZFewVZW0m4uUs7OcX4sEdPYaZVxfDXR20mHS6xI+XTS7sw1mdn8J5h4zm
	nSNDktU8hib8ji98cuvEXfmJwX0E6a6mAffP665eP1ODV5SVs/Ag0jV+K/jZzBTeeShMcSJ3skDka
	5YaogQVl3F/A0iLKSgT5RWorjFwKJ2VquJftDV6JPlnyFQSnFqRbr+5aWe/0Ya0LSgqw6erRsnIgd
	1kB8U1yvMiGbn7GK5AJO66RZru/wwKDxnWtH8vmS7dRn17s0Pgo8v7cPnEjhplp+3SLZI6Q2qgfX2
	KxPgOPZ5yJNoSn5yyPow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrtJw-0000000E8Up-2anw;
	Wed, 03 Apr 2024 05:38:00 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrtJs-0000000E8SG-1LgI
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 05:37:58 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-615019cd427so19825887b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2024 22:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712122674; x=1712727474; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7ujj04+OlaPcvnr/mU1u92sbiZXtwW3xdBUhXyZWrg=;
        b=0VHZwM7xn+sztvAqvot+kRjGNBWOl+p93KsrIUtZbYTfvIPO69oFM/MogK8JCmE+DD
         KOyyxWZbLRgLlgLuIxcNeuku8+hjJi64VAAGW7DnMFgT68A7MoApB2tEMfmay6Tdqh7+
         97SkfojzhS2qiVsPPGx/XQJy5bm7Vc7jDHr1AMA++FYx7aVfzNPJtPvUPti0FbyGW3Uv
         12vLdnmXd4B6EmYz/v63ylCLun6FuwLPyW5yse39xgfvET7PSEXm4HVIDC8/4FrvPYcd
         UKUWUlU2N/XH6MVXsZ6pdqawhuqjs17OGK1C99eRSmxty4yuhBywQ8jYhvqr9L16o4Jq
         EtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712122674; x=1712727474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7ujj04+OlaPcvnr/mU1u92sbiZXtwW3xdBUhXyZWrg=;
        b=vyJq/UqMl3+HGoeYWdYtPNBj4LzupPVccSQuiFs8WpyscwXCM1h7RtSyykDlp8/Ifh
         UIQxrmNCiYcOa1O0fGIAQqK63XeYtwB6vI1pP18v9tzyN0pHVfSntK+xfV3WJRmlh8cN
         mJXnBjWXnCxdEx2aTTmxFpVz5o1JUKDmNapztr/8cq0XJf62Wwp/RwPfxIUiAjdanW1t
         wMLy8xjPaFvo8zhGCzMmG/1HqPivBHlQ7ylHyU9uPvYyI7Y0NOh0KFneo8IHUgTUCOXS
         dT4NWGBCaaShZ6Z92TM0QO4ErNOOy+l6NGEIWMcaP5PKgtAN0BMpvjn5uTc0nccEQmRa
         zw4g==
X-Forwarded-Encrypted: i=1; AJvYcCUZ3teNqNqyM/KOsd9POyF2GSzvly5w1IjKdSE2xjEI5pnMHSDiur43UU4ELCvlihakD+K1TphBiiSjrrN9rNuDtS6lvWubxyWmU6m2viHl
X-Gm-Message-State: AOJu0YxJtiL99xAPxOik4jAWex2KPSvln81GwjMSig+W9ORKA0hD4yr5
	hgMBQA3CGrG2CgEmbFSmwVshKPzmu8Rvj/GQzCf7conTECZwq7RxPRv4bUMJ54/uRbyXfjNNUnM
	C73vMrB5aWrnsuSkXk8bRIAgUvP4L+TQZYzgp
X-Google-Smtp-Source: AGHT+IHpjlrFXGBHC8xjiSR2pkdos7fU1V4MIpNPbQfj0CNzmJ1GKeTFoSnYGK3QnW6iiu8Gm/GTnJLLIVUWpqvl8zo=
X-Received: by 2002:a25:bfc5:0:b0:dc6:bbeb:d889 with SMTP id
 q5-20020a25bfc5000000b00dc6bbebd889mr12522955ybm.52.1712122673515; Tue, 02
 Apr 2024 22:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240402075142.196265-1-wangkefeng.wang@huawei.com> <20240402075142.196265-6-wangkefeng.wang@huawei.com>
In-Reply-To: <20240402075142.196265-6-wangkefeng.wang@huawei.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 2 Apr 2024 22:37:42 -0700
Message-ID: <CAJuCfpGa746Fn+i=M0oDEGMEJYTJhZ3m-paZ6k3tbZs+yJgu8g@mail.gmail.com>
Subject: Re: [PATCH 5/7] riscv: mm: accelerate pagefault when badaccess
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: akpm@linux-foundation.org, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_223756_399455_9960131D 
X-CRM114-Status: GOOD (  15.90  )
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

T24gVHVlLCBBcHIgMiwgMjAyNCBhdCAxMjo1M+KAr0FNIEtlZmVuZyBXYW5nIDx3YW5na2VmZW5n
LndhbmdAaHVhd2VpLmNvbT4gd3JvdGU6Cj4KPiBUaGUgdm1fZmxhZ3Mgb2Ygdm1hIGFscmVhZHkg
Y2hlY2tlZCB1bmRlciBwZXItVk1BIGxvY2ssIGlmIGl0IGlzIGEKPiBiYWQgYWNjZXNzLCBkaXJl
Y3RseSBoYW5kbGUgZXJyb3IgYW5kIHJldHVybiwgdGhlcmUgaXMgbm8gbmVlZCB0bwo+IGxvY2tf
bW1fYW5kX2ZpbmRfdm1hKCkgYW5kIGNoZWNrIHZtX2ZsYWdzIGFnYWluLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPgoKUmV2aWV3ZWQt
Ynk6IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+Cgo+IC0tLQo+ICBhcmNo
L3Jpc2N2L21tL2ZhdWx0LmMgfCA1ICsrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2ZhdWx0
LmMgYi9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMKPiBpbmRleCAzYmExZDRkZGU1ZGQuLmIzZmNmN2Q2
N2VmYiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMKPiArKysgYi9hcmNoL3Jp
c2N2L21tL2ZhdWx0LmMKPiBAQCAtMjkyLDcgKzI5MiwxMCBAQCB2b2lkIGhhbmRsZV9wYWdlX2Zh
dWx0KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+Cj4gICAgICAgICBpZiAodW5saWtlbHkoYWNjZXNz
X2Vycm9yKGNhdXNlLCB2bWEpKSkgewo+ICAgICAgICAgICAgICAgICB2bWFfZW5kX3JlYWQodm1h
KTsKPiAtICAgICAgICAgICAgICAgZ290byBsb2NrX21tYXA7Cj4gKyAgICAgICAgICAgICAgIGNv
dW50X3ZtX3ZtYV9sb2NrX2V2ZW50KFZNQV9MT0NLX1NVQ0NFU1MpOwo+ICsgICAgICAgICAgICAg
ICB0c2stPnRocmVhZC5iYWRfY2F1c2UgPSBTRUdWX0FDQ0VSUjsKPiArICAgICAgICAgICAgICAg
YmFkX2FyZWFfbm9zZW1hcGhvcmUocmVncywgY29kZSwgYWRkcik7Cj4gKyAgICAgICAgICAgICAg
IHJldHVybjsKPiAgICAgICAgIH0KPgo+ICAgICAgICAgZmF1bHQgPSBoYW5kbGVfbW1fZmF1bHQo
dm1hLCBhZGRyLCBmbGFncyB8IEZBVUxUX0ZMQUdfVk1BX0xPQ0ssIHJlZ3MpOwo+IC0tCj4gMi4y
Ny4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
