Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E675BC3DA63
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 14:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kS6QfyCTcl9k1Q9Xm/4mbXaU8miwJyYJA+yRqFTVq94=; b=MRLt8YM4YOMxD3
	RY69fovz9k5xs5loLYoizc9fwJMlvpWyY8yQlnYU/jSvxOA9FCJNDbCryh9T35FXp2unFxv72AqXa
	GSyovHO9/WuvNfbaewvDnsBJWElaVOHmSuDkGmFo78O1oct1xYhw+rP3E81ds2QaO96p6AKs4Xwuj
	BbBAdSw3dp6ZZb1Y992tU+j74YUwEsDetH47scHeWSKXfwtqyypojMAB5jG9YBxn9hABCwzigqWfX
	+f5Jh6M1s/DI8AMXjPq5GkWhjQTZ48aWsmdYQIcTfJdrWi7EqQAIOt43kdHURu5oYqKL+X0VgRnR9
	NvAst5L7dMSazKqPf+pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWGOu-0000000CgoL-0ICP;
	Tue, 23 Jul 2024 14:22:00 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWGOU-0000000CggN-2gkj;
	Tue, 23 Jul 2024 14:21:36 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-52efc60a6e6so4416799e87.1;
        Tue, 23 Jul 2024 07:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721744492; x=1722349292; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYMdjIba5GVjSk5LLCgsucuwd1uTMo/SWZKsqPwbIS0=;
        b=ZK0k0LXvuctkmSvhiGmZs47nT6cKBt1qb2GFMazO3/+vu+np7S4972ChkaZGZPU+Z7
         1Bttco0t5cQRBcHuYlkwzocRHoSwjqZkDdWEXcHvjMAf5Fp7I7P9iP2kSBFtxIOOytr5
         myrW81lr+MX/PVgX+kDxqzV/QUl87v8v6mEohd39sCfy9gzoiE3L0phX9dUMhWRdp6XK
         UHcQw/LPHBGbAUBB5Xc3z4ZFXhwWKl/vwTF2ZNo5FK76B00WqiPvMP8QWGlHp+BgQAD/
         92kTry72c86N+2UzTTirJLpFiBvWW9QHGHgR8JH4RkmnCnzSyUK81KT7U9KrQT5Ku12Y
         K/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721744492; x=1722349292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYMdjIba5GVjSk5LLCgsucuwd1uTMo/SWZKsqPwbIS0=;
        b=psV2C5VtENQOgqBZni/K98kXi3ow6ILJuvKgaTdBNfR02bLLuKbu2og9iE2BwaHQaw
         AdXqNpEpAPWy/saWGIpuNmxBVlrbVkproJ+94PcLtLJ7mgNhHrZ75sS3G8eVGIF6GejG
         SqGf81l/ttlAZeC4xLnHM7pQ3FtQj3xCZx2nj5j9yYs9B1UpLt6BD1XJOWQ8iA42Nuok
         qadgPOCSOQT3c7WEMrez1oCCDtIUR03BD6eFG1Y6nyCJUATreOZu7tXmMeQjver9ODuP
         SI39wIooW1nalpKjRQvGhexZZoly9K1EVvxrUzC5NRQXK76HgD9o0FKH3M2prBcBzbwd
         F+Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVjvgiGE/mH9fJCvbLu6nUHOtjNxTJFE/yvYLX4rq2TaUs0Ngbeo/25T+yJaGi4cb3ZEi5+lzwgrbPIzlkvi4fly7Tv+YG4Smt88VNvz1z8JI2EsYJk79LS51DZaXdDyayb6I8fM15DLHjno3VkJXlwNH+eF+s=
X-Gm-Message-State: AOJu0Yxz5HUHOhJ2QMXK30DCKc8PEipRB3DmTpclM9/pfi6iQMx347hu
	TzZjgKfg2rnvWdgRw1AkTiPZdj/pnmi8cjQ4CMLf5NPqdaa6dzKWgPyvN+xEuY7TT7N4Q+2h3up
	TuECxSyNi8yLdbfi16wOnKeU8iR8=
X-Google-Smtp-Source: AGHT+IHHK4zzI0FK6dtJOc4sOSTKvTpBc8BrSaSqFkRUk7Pli2OGk28Gtofg4RA96R38FMJpb/0BtPOqBp98J0CCXQw=
X-Received: by 2002:a05:6512:a86:b0:52e:969c:db83 with SMTP id
 2adb3069b0e04-52efb53b775mr6049905e87.17.1721744490858; Tue, 23 Jul 2024
 07:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1718268003.git.haibo1.xu@intel.com> <65dbad1fda08a32922c44886e4581e49b4a2fecc.1718268003.git.haibo1.xu@intel.com>
 <20240723-23811cc47f7863d12b6a78e8@orel>
In-Reply-To: <20240723-23811cc47f7863d12b6a78e8@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Tue, 23 Jul 2024 22:21:19 +0800
Message-ID: <CAJve8omO0DwQEO+KEjhJFn=uYNAyZNYsnQieETocRzwb0RTGiA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] ACPI: RISCV: Add NUMA support based on SRAT and SLIT
To: Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_072134_723097_A247B664 
X-CRM114-Status: GOOD (  30.72  )
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
Cc: Alison Schofield <alison.schofield@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Zong Li <zong.li@sifive.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Dave Jiang <dave.jiang@intel.com>, Haibo Xu <haibo1.xu@intel.com>, Baoquan He <bhe@redhat.com>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org, Robert Richter <rrichter@amd.com>, linux-acpi@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, James Morse <james.morse@arm.com>, Dan Williams <dan.j.williams@intel.com>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, arnd@arndb.de, Charlie Jenkins <charlie@rivosinc.com>, Chen Jiahao <chenjiahao16@huawei.com>, Yuntao Wang <ytcoode@gmail.com>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>, Zhao Ke <ke.zhao@shingroup.cn>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Samuel Holland <samuel.holland@sifive.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andy.chiu@sifive.com>, Marc Zyngier <maz@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdWwgMjMsIDIwMjQgYXQgOTozMOKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBKdW4gMTMsIDIwMjQgYXQgMDQ6NTQ6
MzNQTSBHTVQsIEhhaWJvIFh1IHdyb3RlOgo+ID4gQWRkIGFjcGlfbnVtYS5jIGZpbGUgdG8gZW5h
YmxlIHBhcnNlIE5VTUEgaW5mb3JtYXRpb24gZnJvbQo+ID4gQUNQSSBTUkFUIGFuZCBTTElUIHRh
Ymxlcy4gU1JBVCB0YWJsZSBwcm92aWRlIENQVXMoSGFydCkgYW5kCj4gPiBtZW1vcnkgbm9kZXMg
dG8gcHJveGltaXR5IGRvbWFpbiBtYXBwaW5nLCB3aGlsZSBTTElUIHRhYmxlCj4gPiBwcm92aWRl
IHRoZSBkaXN0YW5jZSBtZXRyaWNzIGJldHdlZW4gcHJveGltaXR5IGRvbWFpbnMuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogSGFpYm8gWHUgPGhhaWJvMS54dUBpbnRlbC5jb20+Cj4gPiBSZXZpZXdl
ZC1ieTogU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiAtLS0KPiA+ICBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FjcGkuaCB8ICAxNSArKystCj4gPiAgYXJjaC9yaXNjdi9r
ZXJuZWwvTWFrZWZpbGUgICAgfCAgIDEgKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2FjcGkuYyAg
ICAgIHwgICA1IC0tCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvYWNwaV9udW1hLmMgfCAxMzEgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3Nl
dHVwLmMgICAgIHwgICA0ICstCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jICAgfCAg
IDIgLQo+ID4gIGluY2x1ZGUvbGludXgvYWNwaS5oICAgICAgICAgIHwgICA2ICsrCj4gPiAgNyBm
aWxlcyBjaGFuZ2VkLCAxNTQgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4gPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL2FjcGlfbnVtYS5jCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYWNwaS5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9hY3BpLmgKPiA+IGluZGV4IDdkYWQwY2Y5ZDcwMS4uZTBhMWY4NDQwNGYzIDEwMDY0
NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hY3BpLmgKPiA+ICsrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vYWNwaS5oCj4gPiBAQCAtNjEsMTEgKzYxLDE0IEBAIHN0YXRpYyBp
bmxpbmUgdm9pZCBhcmNoX2ZpeF9waHlzX3BhY2thZ2VfaWQoaW50IG51bSwgdTMyIHNsb3QpIHsg
fQo+ID4KPiA+ICB2b2lkIGFjcGlfaW5pdF9yaW50Y19tYXAodm9pZCk7Cj4gPiAgc3RydWN0IGFj
cGlfbWFkdF9yaW50YyAqYWNwaV9jcHVfZ2V0X21hZHRfcmludGMoaW50IGNwdSk7Cj4gPiAtdTMy
IGdldF9hY3BpX2lkX2Zvcl9jcHUoaW50IGNwdSk7Cj4gPiArc3RhdGljIGlubGluZSB1MzIgZ2V0
X2FjcGlfaWRfZm9yX2NwdShpbnQgY3B1KQo+ID4gK3sKPiA+ICsgICAgIHJldHVybiBhY3BpX2Nw
dV9nZXRfbWFkdF9yaW50YyhjcHUpLT51aWQ7Cj4gPiArfQo+ID4gKwo+ID4gIGludCBhY3BpX2dl
dF9yaXNjdl9pc2Eoc3RydWN0IGFjcGlfdGFibGVfaGVhZGVyICp0YWJsZSwKPiA+ICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGludCBjcHUsIGNvbnN0IGNoYXIgKippc2EpOwo+ID4KPiA+
IC1zdGF0aWMgaW5saW5lIGludCBhY3BpX251bWFfZ2V0X25pZCh1bnNpZ25lZCBpbnQgY3B1KSB7
IHJldHVybiBOVU1BX05PX05PREU7IH0KPiA+ICB2b2lkIGFjcGlfZ2V0X2Nib19ibG9ja19zaXpl
KHN0cnVjdCBhY3BpX3RhYmxlX2hlYWRlciAqdGFibGUsIHUzMiAqY2JvbV9zaXplLAo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdTMyICpjYm96X3NpemUsIHUzMiAqY2JvcF9zaXplKTsK
PiA+ICAjZWxzZQo+ID4gQEAgLTg3LDQgKzkwLDEyIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBhY3Bp
X2dldF9jYm9fYmxvY2tfc2l6ZShzdHJ1Y3QgYWNwaV90YWJsZV9oZWFkZXIgKnRhYmxlLAo+ID4K
PiA+ICAjZW5kaWYgLyogQ09ORklHX0FDUEkgKi8KPiA+Cj4gPiArI2lmZGVmIENPTkZJR19BQ1BJ
X05VTUEKPiA+ICtpbnQgYWNwaV9udW1hX2dldF9uaWQodW5zaWduZWQgaW50IGNwdSk7Cj4gPiAr
dm9pZCBhY3BpX21hcF9jcHVzX3RvX25vZGVzKHZvaWQpOwo+ID4gKyNlbHNlCj4gPiArc3RhdGlj
IGlubGluZSBpbnQgYWNwaV9udW1hX2dldF9uaWQodW5zaWduZWQgaW50IGNwdSkgeyByZXR1cm4g
TlVNQV9OT19OT0RFOyB9Cj4gPiArc3RhdGljIGlubGluZSB2b2lkIGFjcGlfbWFwX2NwdXNfdG9f
bm9kZXModm9pZCkgeyB9Cj4gPiArI2VuZGlmIC8qIENPTkZJR19BQ1BJX05VTUEgKi8KPiA+ICsK
PiA+ICAjZW5kaWYgLypfQVNNX0FDUElfSCovCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZQo+ID4gaW5kZXggNWIy
NDNkNDZmNGIxLi4xZTJhZmVjMTQxYjUgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9NYWtlZmlsZQo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUKPiA+IEBAIC0x
MTAsMyArMTEwLDQgQEAgb2JqLSQoQ09ORklHX0NPTVBBVCkgICAgICAgICAgICAgICs9IGNvbXBh
dF92ZHNvLwo+ID4KPiA+ICBvYmotJChDT05GSUdfNjRCSVQpICAgICAgICAgICs9IHBpLwo+ID4g
IG9iai0kKENPTkZJR19BQ1BJKSAgICAgICAgICAgKz0gYWNwaS5vCj4gPiArb2JqLSQoQ09ORklH
X0FDUElfTlVNQSkgICAgICArPSBhY3BpX251bWEubwo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL2FjcGkuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2FjcGkuYwo+ID4gaW5kZXggZTYx
OWVkYzhiMGNjLi4wNDBiZGJmZWEyYjQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9hY3BpLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2FjcGkuYwo+ID4gQEAgLTE5MSwx
MSArMTkxLDYgQEAgc3RydWN0IGFjcGlfbWFkdF9yaW50YyAqYWNwaV9jcHVfZ2V0X21hZHRfcmlu
dGMoaW50IGNwdSkKPiA+ICAgICAgIHJldHVybiAmY3B1X21hZHRfcmludGNbY3B1XTsKPiA+ICB9
Cj4gPgo+ID4gLXUzMiBnZXRfYWNwaV9pZF9mb3JfY3B1KGludCBjcHUpCj4gPiAtewo+ID4gLSAg
ICAgcmV0dXJuIGFjcGlfY3B1X2dldF9tYWR0X3JpbnRjKGNwdSktPnVpZDsKPiA+IC19Cj4gPiAt
Cj4gPiAgLyoKPiA+ICAgKiBfX2FjcGlfbWFwX3RhYmxlKCkgd2lsbCBiZSBjYWxsZWQgYmVmb3Jl
IHBhZ2luZ19pbml0KCksIHNvIGVhcmx5X2lvcmVtYXAoKQo+ID4gICAqIG9yIGVhcmx5X21lbXJl
bWFwKCkgc2hvdWxkIGJlIGNhbGxlZCBoZXJlIHRvIGZvciBBQ1BJIHRhYmxlIG1hcHBpbmcuCj4g
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvYWNwaV9udW1hLmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9hY3BpX251bWEuYwo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAw
MDAwMDAwMDAwMC4uMDIzMTQ4MmQ2OTQ2Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9hY3BpX251bWEuYwo+ID4gQEAgLTAsMCArMSwxMzEgQEAKPiA+ICsvLyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ID4gKy8qCj4gPiArICogQUNQSSA2LjYg
YmFzZWQgTlVNQSBzZXR1cCBmb3IgUklTQ1YKPiA+ICsgKiBMb3RzIG9mIGNvZGUgd2FzIGJvcnJv
d2VkIGZyb20gYXJjaC9hcm02NC9rZXJuZWwvYWNwaV9udW1hLmMKPiA+ICsgKgo+ID4gKyAqIENv
cHlyaWdodCAyMDA0IEFuZGkgS2xlZW4sIFN1U0UgTGFicy4KPiA+ICsgKiBDb3B5cmlnaHQgKEMp
IDIwMTMtMjAxNiwgTGluYXJvIEx0ZC4KPiA+ICsgKiAgICAgICAgICAgQXV0aG9yOiBIYW5qdW4g
R3VvIDxoYW5qdW4uZ3VvQGxpbmFyby5vcmc+Cj4gPiArICogQ29weXJpZ2h0IChDKSAyMDI0IElu
dGVsIENvcnBvcmF0aW9uLgo+ID4gKyAqCj4gPiArICogUmVhZHMgdGhlIEFDUEkgU1JBVCB0YWJs
ZSB0byBmaWd1cmUgb3V0IHdoYXQgbWVtb3J5IGJlbG9uZ3MgdG8gd2hpY2ggQ1BVcy4KPiA+ICsg
Kgo+ID4gKyAqIENhbGxlZCBmcm9tIGFjcGlfbnVtYV9pbml0IHdoaWxlIHJlYWRpbmcgdGhlIFNS
QVQgYW5kIFNMSVQgdGFibGVzLgo+ID4gKyAqIEFzc3VtZXMgYWxsIG1lbW9yeSByZWdpb25zIGJl
bG9uZ2luZyB0byBhIHNpbmdsZSBwcm94aW1pdHkgZG9tYWluCj4gPiArICogYXJlIGluIG9uZSBj
aHVuay4gSG9sZXMgYmV0d2VlbiB0aGVtIHdpbGwgYmUgaW5jbHVkZWQgaW4gdGhlIG5vZGUuCj4g
PiArICovCj4gPiArCj4gPiArI2RlZmluZSBwcl9mbXQoZm10KSAiQUNQSTogTlVNQTogIiBmbXQK
PiA+ICsKPiA+ICsjaW5jbHVkZSA8bGludXgvYWNwaS5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9i
aXRtYXAuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gPiArI2luY2x1ZGUgPGxp
bnV4L21tLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L21lbWJsb2NrLmg+Cj4gPiArI2luY2x1ZGUg
PGxpbnV4L21tem9uZS5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiA+ICsjaW5j
bHVkZSA8bGludXgvdG9wb2xvZ3kuaD4KPiA+ICsKPiA+ICsjaW5jbHVkZSA8YXNtL251bWEuaD4K
PiA+ICsKPiA+ICtzdGF0aWMgaW50IGFjcGlfZWFybHlfbm9kZV9tYXBbTlJfQ1BVU10gX19pbml0
ZGF0YSA9IHsgTlVNQV9OT19OT0RFIH07Cj4KPiBUaGlzIG9ubHkgc2V0cyBhY3BpX2Vhcmx5X25v
ZGVfbWFwWzBdIHRvIE5VTUFfTk9fTk9ERS4gQXNzdW1pbmcgd2Ugd2FudAo+IHRvIGVuc3VyZSBh
bGwgb2YgdGhlbSBhcmUgaW5pdGlhbGl6ZWQgdG8gTlVNQV9OT19OT0RFLCB0aGVuIHdlIG5lZWQK
Pgo+IHN0YXRpYyBpbnQgYWNwaV9lYXJseV9ub2RlX21hcFtOUl9DUFVTXSBfX2luaXRkYXRhID0g
eyBbMCAuLi4gTlJfQ1BVUyAtIDFdID0gTlVNQV9OT19OT0RFIH07Cj4KCkdvb2QgY2F0Y2ghIFRo
YW5rcyEKCkBQYWxtZXIgRGFiYmVsdApJIG5vdGljZWQgdGhpcyBzZXJpZXMgaGFkIGJlZW4gbWVy
Z2VkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZm9yLW5leHQpLApjb3VsZCB5b3UgaGVscCBpbmNsdWRl
IHRoZSBhYm92ZSBjaGFuZ2UgZnJvbSBEcmV3PwpPciBzaGFsbCBJIHNlbmQgb3V0IGEgbmV3IHNl
cmllcz8KClJlZ2FyZHMsCkhhaWJvCgo+IFRoYW5rcywKPiBkcmV3CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
