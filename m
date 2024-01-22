Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84142C4725D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 13:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3g3UCSU8oJUCSsZoYQTiaL65jTwMfXQlay7tl+Pna4A=; b=RfUhI0XDRaVyin
	50VSdmMa7b3MrocBnaxeUgUPJEqbew5Yv0yA71+O58N0xuUrj3a7pIuZTSEA5YuSMx4oyqAh2il/e
	rBoF0rekO7xvvRLiivuEhyDB6wBl/EDbctrIZ5Iqa/e7ujwfUZF3OwJvjcAKg0RbqtBfImqKnNefC
	u2RxYfuYkBC34TIZrMzQZZTUCo6ke7CCNXsU+ri67C/p8n+fRPmLGdfE4bNCMXf+q2CLer5x8BwTg
	at5Jk4g6nvB7vWGFtN875Aviear2fa7s+W5rPBu08aF/oHgyWs4TEffOAKxvCnwbsIWYX+jKsxhdJ
	cy4rqbtrsi2y/htBqUvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRu2W-00CEBb-0N;
	Mon, 22 Jan 2024 13:08:36 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRu2T-00CEAI-05;
	Mon, 22 Jan 2024 13:08:34 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50e7d6565b5so3650348e87.0;
        Mon, 22 Jan 2024 05:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705928908; x=1706533708; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+I4p4d7+rP24cbQOhthF3qkqodnNh9+wAcSbkAH/bzs=;
        b=GLrWUsIkcqGhTnQXkZoyHxuOiev1oEf0Pr7d39mtr2OcGNsrN5KpOdzyagm4hhFu1p
         tut6DfWlKla5+NEUHzWTRGiPYKpAVdXpru7kKcCszrXKQFm+UiGTywtuUPBrGvl676JA
         JILfOUMPbvxjLZcOAADgjNM5Y5WxQv/IuUzGoRCLghB8UPqCmqOv1yrjWlXQ5DGJwkUI
         Nkbl4Fjk46nS1BpdNlMqpSQ2/sce8pUxFV/dKMuzdMJaZIzHvVQYqSAEuf1A76cl5o9X
         xcL2wz9sU+AVT9n1XkxYTfnE8WGklXHaitbEZh3L0ksUEH12TlbuIBqcW+N3FcHeMvJk
         ML+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705928908; x=1706533708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+I4p4d7+rP24cbQOhthF3qkqodnNh9+wAcSbkAH/bzs=;
        b=ngMyti5/PxQENCChRhgJnxvqp9QKjgDqeFNAfN0uQywk6P7/MmBz22y+j8MADaSid4
         duKNyMPnQbMQLjeMT8+zEj6MzeUGt0y3AdoXrmFJ8glYzxKj1SpI5BMjOuPqBdIzzvAf
         RPSXN6uPXHtiN8iIBrthhNoa0G2ZAlPSEtSTlFTjfZvKoxZpuEDaSBINRYdYo/eLPHR9
         dk4v0XjGaGr+o4eFczQQFDyPf11A+CK6ICREzXhItS9h3jh3BFYx4VYpkPAg6oVQ4/+d
         rtc0b+vODxcI48Y+UW7D/0Z6JROEQTa1C9XzBCAY6qiNV8JMwO3o9oi51afWLzyB3f3H
         qs0A==
X-Gm-Message-State: AOJu0Yz28uK/57FFIrAPTQV99JFErPFtE4RiEC+iitgytYUca1/qKcxu
	y5v7E/3iH5gMT+Kj+VuTCegWezS7xell9ECXxWhlbO/nW/ldvPD5dHx0sOHFI8mArfEHb/BRJjz
	7jc43iO8xbXj2WqvEeZtPVvSUlDc=
X-Google-Smtp-Source: AGHT+IFxMr1N5U9JEAKS7V3w8GVY3Jj+ucXTqHlbxRUbtCIR7nwq3gck9SN+dTPf/AtQUb++qPGvaIBbGYY8gF5qz9I=
X-Received: by 2002:a19:690d:0:b0:50e:abd1:bfca with SMTP id
 e13-20020a19690d000000b0050eabd1bfcamr1596377lfc.128.1705928908378; Mon, 22
 Jan 2024 05:08:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1705916069.git.haibo1.xu@intel.com> <173c9b64c4c43cd585f6b177a7d434dcedc905fa.1705916069.git.haibo1.xu@intel.com>
 <20240122-0ddedacdeb64808477a7911d@orel>
In-Reply-To: <20240122-0ddedacdeb64808477a7911d@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Mon, 22 Jan 2024 21:08:16 +0800
Message-ID: <CAJve8om6EG7nE891UOBCHJ6t2dsbJGeKDKUfNfJeffBB1QP8NQ@mail.gmail.com>
Subject: Re: [PATCH v5 02/12] KVM: arm64: selftests: Data type cleanup for
 arch_timer test
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	wchen <waylingii@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Samuel Holland <samuel@sholland.org>, Jisheng Zhang <jszhang@kernel.org>, 
	Minda Chen <minda.chen@starfivetech.com>, Sean Christopherson <seanjc@google.com>, 
	Peter Xu <peterx@redhat.com>, Like Xu <likexu@tencent.com>, 
	Vipin Sharma <vipinsh@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_050833_063113_4FE64BC4 
X-CRM114-Status: GOOD (  15.67  )
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

T24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgODoyMeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgMDU6NTg6
MzJQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBDaGFuZ2Ugc2lnbmVkIHR5cGUgdG8gdW5z
aWduZWQgaW4gdGVzdF9hcmdzIHN0cnVjdCB3aGljaAo+ID4gb25seSBtYWtlIHNlbnNlIGZvciB1
bnNpZ25lZCB2YWx1ZS4KPiA+Cj4gPiBTdWdnZXN0ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVz
QHZlbnRhbmFtaWNyby5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBIYWlibyBYdSA8aGFpYm8xLnh1
QGludGVsLmNvbT4KPiA+IC0tLQo+ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9hYXJj
aDY0L2FyY2hfdGltZXIuYyB8IDEyICsrKysrKy0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9hYXJjaDY0L2FyY2hfdGltZXIuYyBiL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2t2bS9hYXJjaDY0L2FyY2hfdGltZXIuYwo+ID4gaW5kZXggMjc0Yjg0NjVi
NDJhLi4zMjYwZmVmY2MxYjMgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9rdm0vYWFyY2g2NC9hcmNoX3RpbWVyLmMKPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2t2bS9hYXJjaDY0L2FyY2hfdGltZXIuYwo+ID4gQEAgLTQyLDEwICs0MiwxMCBAQAo+ID4g
ICNkZWZpbmUgVElNRVJfVEVTVF9NSUdSQVRJT05fRlJFUV9NUyAyCj4gPgo+ID4gIHN0cnVjdCB0
ZXN0X2FyZ3Mgewo+ID4gLSAgICAgaW50IG5yX3ZjcHVzOwo+ID4gLSAgICAgaW50IG5yX2l0ZXI7
Cj4gPiAtICAgICBpbnQgdGltZXJfcGVyaW9kX21zOwo+ID4gLSAgICAgaW50IG1pZ3JhdGlvbl9m
cmVxX21zOwo+ID4gKyAgICAgdWludDMyX3QgbnJfdmNwdXM7Cj4gPiArICAgICB1aW50MzJfdCBu
cl9pdGVyOwo+ID4gKyAgICAgdWludDMyX3QgdGltZXJfcGVyaW9kX21zOwo+ID4gKyAgICAgdWlu
dDMyX3QgbWlncmF0aW9uX2ZyZXFfbXM7Cj4gPiAgICAgICBzdHJ1Y3Qga3ZtX2FybV9jb3VudGVy
X29mZnNldCBvZmZzZXQ7Cj4gPiAgfTsKPiA+Cj4gPiBAQCAtNTcsNyArNTcsNyBAQCBzdGF0aWMg
c3RydWN0IHRlc3RfYXJncyB0ZXN0X2FyZ3MgPSB7Cj4gPiAgICAgICAub2Zmc2V0ID0geyAucmVz
ZXJ2ZWQgPSAxIH0sCj4gPiAgfTsKPiA+Cj4gPiAtI2RlZmluZSBtc2Vjc190b191c2Vjcyhtc2Vj
KSAgICAgICAgICgobXNlYykgKiAxMDAwTEwpCj4gPiArI2RlZmluZSBtc2Vjc190b191c2Vjcyht
c2VjKSAgICAgICAgICgobXNlYykgKiAxMDAwVUxMKQo+ID4KPiA+ICAjZGVmaW5lIEdJQ0RfQkFT
RV9HUEEgICAgICAgICAgICAgICAgICAgICAgICAweDgwMDAwMDBVTEwKPiA+ICAjZGVmaW5lIEdJ
Q1JfQkFTRV9HUEEgICAgICAgICAgICAgICAgICAgICAgICAweDgwQTAwMDBVTEwKPiA+IEBAIC03
Miw3ICs3Miw3IEBAIGVudW0gZ3Vlc3Rfc3RhZ2Ugewo+ID4KPiA+ICAvKiBTaGFyZWQgdmFyaWFi
bGVzIGJldHdlZW4gaG9zdCBhbmQgZ3Vlc3QgKi8KPiA+ICBzdHJ1Y3QgdGVzdF92Y3B1X3NoYXJl
ZF9kYXRhIHsKPiA+IC0gICAgIGludCBucl9pdGVyOwo+ID4gKyAgICAgdWludDMyX3QgbnJfaXRl
cjsKPiA+ICAgICAgIGVudW0gZ3Vlc3Rfc3RhZ2UgZ3Vlc3Rfc3RhZ2U7Cj4gPiAgICAgICB1aW50
NjRfdCB4Y250Owo+ID4gIH07Cj4gPiAtLQo+ID4gMi4zNC4xCj4gPgo+Cj4gUmV2aWV3ZWQtYnk6
IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+CgpUaGFua3MhCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
