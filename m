Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7812C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 12:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mmeYPFO6RlbGoM6dVUvP401hV8B2CjEfdkVdtZOZNuY=; b=2l0vNy2wnWhSez
	kYjsgD1CEiqUigIUP8J9bo7J49fsPTytUqTRDE3qkn4BcvD9RbiTL5VszuY3atjcyddIOeUDRmjdH
	MK/2QrR12jAo4K4ZX3uN/Dc/0m7qjnH0cAYH4cX8aAK5+Uy7t6Ookg9LaKuGu/NS5ormyQGOSUF8G
	/Y8vMULyDkmE4l4sVkG9PL4A0fYtwO1Kf71egt8LZY8kFCzA2E9AXnfR6VbRPP3MWpPYgsiUJILfy
	DUfcofjG+17lQfqh7uWXQcGyeLOZ3HiI0IZmsNWcQePLYKYuf35z2ZyPP/EL0W02pfu/1nMEuyc1M
	aZG9Nef/wdIx1NWLI1KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDkaj-000FB6-3C;
	Thu, 14 Dec 2023 12:13:25 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDkah-000F9a-0b
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 12:13:24 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5ca29c131ebso3197942a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 04:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702556001; x=1703160801; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxoH3e1pqfRG5EpbAAgxwCw1oRjLeMfi1qyzwQu8z4E=;
        b=FirESSfXfuRKmSGHRRFF34KqUjfsvzvAKMf4YzHIrcT/BCSgKHOsr+BNUUGBS9QSZz
         ar9gpU5fNRlf+y/lqX7QB8LDpmzbXB24LKwtNwVUHeOACSZJfi+BrjlWE20BJGxis7xX
         7MlfVbxT+yoMWSpswTdxEwBMqyEStJvbzuGB7GcZEyRVXKb+Jf87gQVshPtz7sqlS4W2
         jaXUAosSFwjxtJWnIjLQmSmqAxnKwoum8C0IQQMW/jx5wqH9PTgljZQR8wb4+K1WyY6k
         Dmf8cMZR6cV2ysphxxzLTP2n75xsW1j8BxDS0/nb8NT/3i5Iw4aTEnEof/F1ujrQUxQs
         En0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702556001; x=1703160801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxoH3e1pqfRG5EpbAAgxwCw1oRjLeMfi1qyzwQu8z4E=;
        b=bTuqx9zL+ja9HjiJX3XQSBNZPHhFBJJJRKwW/TEGOjuXxbis5lr+AKYl7+MDDj09Cp
         nBHzFPT7D4X4JLnYRh4lty1Shst9lB7JSiB6lCncrd44xT9nQ9U4Xdn8zEVZ7naZOZqF
         hQO1Ejf90zFutYSvAKtwqHjsDzcdrGwxeB3V/P981gtj4It7JKaeUP+JXBJVQXDys61w
         +F4L6NyHXaNfAA11saJ222k90hOD7Ai+wGwr/GkIivmCwAdV5Q/cTOpVqK+szJ3KlPYV
         hsFSMvObnmIODvAyJz4lppPwAcB0Fzk6V5NOXA2lwtmtVo5uvvZAT5Z0DyKIqB+vlMzZ
         5BpQ==
X-Gm-Message-State: AOJu0YzlbEqQopg3Y37Oohpsnv+W9gJhaY2LsUh6VxOpq9N89HobktSq
	ezYam0hLdy+pJD+D4jZmQjUqNcwIExEXFFI5bpxTAA==
X-Google-Smtp-Source: AGHT+IEooiD5rkngFLDpel3wTKhmmCpJGezIc1l7FQ/uXS5019jlAjf7Ozjts7D2t9f+t/Nftwhsc5T2VEWM2r0TPEI=
X-Received: by 2002:a17:90a:ae0d:b0:286:9b69:a0f6 with SMTP id
 t13-20020a17090aae0d00b002869b69a0f6mr7104084pjq.39.1702556000638; Thu, 14
 Dec 2023 04:13:20 -0800 (PST)
MIME-Version: 1.0
References: <20231205024310.1593100-1-atishp@rivosinc.com> <20231205024310.1593100-2-atishp@rivosinc.com>
In-Reply-To: <20231205024310.1593100-2-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 Dec 2023 17:43:09 +0530
Message-ID: <CAAhSdy0j=BKfoNFr2+P+z0YK29LkudpHQ5XQUZhY_F1mfWQAug@mail.gmail.com>
Subject: Re: [RFC 1/9] RISC-V: Fix the typo in Scountovf CSR name
To: Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_041323_224477_9B8F25E9 
X-CRM114-Status: GOOD (  12.91  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBEZWMgNSwgMjAyMyBhdCA4OjEz4oCvQU0gQXRpc2ggUGF0cmEgPGF0aXNocEByaXZv
c2luYy5jb20+IHdyb3RlOgo+Cj4gVGhlIGNvdW50ZXIgb3ZlcmZsb3cgQ1NSIG5hbWUgaXMgInNj
b3VudG92ZiIgbm90ICJzc2NvdW50b3ZmIi4KPgo+IEZpeCB0aGUgY3NyIG5hbWUuCj4KPiBGaXhl
czogNDkwNWVjMmZiN2U2ICgiUklTQy1WOiBBZGQgc3Njb2ZwbWYgZXh0ZW5zaW9uIHN1cHBvcnQi
KQo+Cj4gU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+CgpM
R1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdh
cmRzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oICAgICAgICAg
fCAyICstCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaCB8IDIgKy0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vY3NyLmgKPiBpbmRleCAzMDZhMTlhNTUwOWMuLjg4Y2RjOGEzZTY1NCAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9jc3IuaAo+IEBAIC0yODEsNyArMjgxLDcgQEAKPiAgI2RlZmluZSBDU1JfSFBNQ09V
TlRFUjMwSCAgICAgIDB4YzllCj4gICNkZWZpbmUgQ1NSX0hQTUNPVU5URVIzMUggICAgICAweGM5
Zgo+Cj4gLSNkZWZpbmUgQ1NSX1NTQ09VTlRPVkYgICAgICAgICAweGRhMAo+ICsjZGVmaW5lIENT
Ul9TQ09VTlRPVkYgICAgICAgICAgMHhkYTAKPgo+ICAjZGVmaW5lIENTUl9TU1RBVFVTICAgICAg
ICAgICAgMHgxMDAKPiAgI2RlZmluZSBDU1JfU0lFICAgICAgICAgICAgICAgICAgICAgICAgMHgx
MDQKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oCj4gaW5kZXggODNlZDI1ZTQzNTUz
Li43MDI2ZmJhMTJlZWIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lcnJh
dGFfbGlzdC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oCj4g
QEAgLTE1Miw3ICsxNTIsNyBAQCBhc20gdm9sYXRpbGUoQUxURVJOQVRJVkVfMiggICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPgo+ICAjZGVmaW5lIEFMVF9TQklfUE1V
X09WRVJGTE9XKF9fb3ZsKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAg
YXNtIHZvbGF0aWxlKEFMVEVSTkFUSVZFKCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gLSAgICAgICAiY3NyciAlMCwgIiBfX3N0cmluZ2lmeShDU1JfU1ND
T1VOVE9WRiksICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgImNzcnIgJTAsICIg
X19zdHJpbmdpZnkoQ1NSX1NDT1VOVE9WRiksICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAg
ICAgICAgICJjc3JyICUwLCAiIF9fc3RyaW5naWZ5KFRIRUFEX0M5WFhfQ1NSX1NDT1VOVEVST0Yp
LCAgICAgICAgICAgICBcCj4gICAgICAgICAgICAgICAgIFRIRUFEX1ZFTkRPUl9JRCwgRVJSQVRB
X1RIRUFEX1BNVSwgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgICAgICAgICBDT05G
SUdfRVJSQVRBX1RIRUFEX1BNVSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAt
LQo+IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
