Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821BFC48297
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 13:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=db5ptehNmAJn21reXctPup+vP9HOIaqsrBXaPoOmUzc=; b=hffmrcvqZ28Mw6
	D8Ziic8sPspwYcQ/6D/PKvR0UKaUY/tWzs/rxQxWFnaDY3m1XXLpKso2pr74FNkE9JL9CLZtiM424
	RBJVARQKX4qUZu8IIA2mb+s8Uh4XR+JTbgFoq0/8tuDJSuckFfOJ8wgLnp+fIr4P8jxUOfzp93RIy
	uxo3a3LT/zzA3z6wipqBlf96oHnF/T+xFlAA1sXiy8aVJlaKxWqFa4+MmT1oLd4BXDOCYuMiLnkWQ
	8sjlQ/TfqlaMperqltvC9wMKcygZKN1s+E+ZWzssRGliXqdb7L72lcK201iblrNlApYIBv9mm53Yp
	9dElMGx1bIILP3YzR/kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZWP7-00000005Wcv-0eFQ;
	Mon, 12 Feb 2024 13:31:25 +0000
Received: from mail-oo1-f46.google.com ([209.85.161.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZWP4-00000005Wc1-131H
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 13:31:23 +0000
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-59cbf204d52so227130eaf.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Feb 2024 05:31:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707744681; x=1708349481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VSLFuMbhZo80/vA+2tLJsi3KFlBp1PmoUoosHnk2JEU=;
        b=db+p4T8mmgJyqS3p0wzzzrNzw5GdZ4RcYxi/t7/yP4PBtHkaqR1htBnhbNwZwfADCH
         DFaEd5wlWOW0kZZzl7cXwdJo7bTGUv8WLU9sZbOguGQcQX3V69fUE61APu3DzmuR3QMy
         1ygWaDFBbotGCL3/viJ72P8hxvIQt9sre2g8scmNn4xHc+QMcVoG9SVYBy1pzdZJ6jlz
         aTRvCngUyNUm9Nol0hcd6ZWuZGyATtLq4/7V3CHaNWZI55kI7ftfDtawjybzOBV4tOF2
         +L4NvqDvoxr7nZqLGtPhgD1KqrA6oAz2hsmWhWk5GH07vvsWwnnlYPZuJCd6/YnjxW4H
         JvIQ==
X-Gm-Message-State: AOJu0YzQip4ZGNqhVeAoHNRIuesj2tJE8qztR7Jw29agOdUO7T6X/J22
	TObklhBaEjwoBBep7RbrNdQeGVZsJi7aTu/Ezcm+HT3v6y+KtuCSzElMbE7YZdIpI03yXsBgk2S
	8kSw8QVfHMfW8nRMAaF2XgsHLww4=
X-Google-Smtp-Source: AGHT+IHHpZHr/EW3Ix32BZGoEiN9Cir64v4CICrnzC68lWclc4B701GZMfD08kwttgpi43EZD+xjbebNgNWXp66eI8c=
X-Received: by 2002:a4a:a6cd:0:b0:59c:d8cd:ecee with SMTP id
 i13-20020a4aa6cd000000b0059cd8cdeceemr5502224oom.1.1707744680881; Mon, 12 Feb
 2024 05:31:20 -0800 (PST)
MIME-Version: 1.0
References: <cover.1706603678.git.haibo1.xu@intel.com> <6473e0bb42524e4f29112290a92539d1a800eb69.1706603678.git.haibo1.xu@intel.com>
In-Reply-To: <6473e0bb42524e4f29112290a92539d1a800eb69.1706603678.git.haibo1.xu@intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 12 Feb 2024 14:31:09 +0100
Message-ID: <CAJZ5v0hC7gxoJK0kszw9GgRjxjrKgh7q0sC1L1FdVfOb-TCSRw@mail.gmail.com>
Subject: Re: [PATCH 1/4] ACPICA: SRAT: Add RISC-V RINTC affinity structure
To: Haibo Xu <haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_053122_334495_37463912 
X-CRM114-Status: GOOD (  16.30  )
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
Cc: Alison Schofield <alison.schofield@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, Baoquan He <bhe@redhat.com>, Marc Zyngier <maz@kernel.org>, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, James Morse <james.morse@arm.com>, Greentime Hu <greentime.hu@sifive.com>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, Chen Jiahao <chenjiahao16@huawei.com>, Yuntao Wang <ytcoode@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, xiaobo55x@gmail.com, Anup Patel <apatel@ventanamicro.com>, Tony Luck <tony.luck@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, ajones@ventanamicro.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKYW4gMzEsIDIwMjQgYXQgMzoxOOKAr0FNIEhhaWJvIFh1IDxoYWlibzEueHVAaW50
ZWwuY29tPiB3cm90ZToKPgo+IEFDUElDQSBjb21taXQgOTNjYWRkYmYyZjYyMDc2OTA1MmM1OWVj
NDcxZjAxODI4MWRjM2EyNAoKTm90IHJlYWxseS4KCj4gQWRkIGRlZmluaXRpb24gb2YgUklTQy1W
IEludGVycnVwdCBDb250cm9sbGVyKFJJTlRDKQo+IGFmZmluaXR5IHN0cnVjdHVyZSB3aGljaCB3
YXMgYXBwcm92ZWQgYnkgVUVGSSBmb3J1bQo+IGFuZCB3aWxsIGJlIHBhcnQgb2YgbmV4dCBBQ1BJ
IHNwZWMgdmVyc2lvbig2LjYpLgo+Cj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL2FjcGljYS9h
Y3BpY2EvY29tbWl0LzkzY2FkZGJmCgpBbmQgdGhpcyBkb2Vzbid0IHBvaW50IHRvIGFuIHVwc3Ry
ZWFtIEFDUElDQSBQUi4KCj4gU2lnbmVkLW9mZi1ieTogSGFpYm8gWHUgPGhhaWJvMS54dUBpbnRl
bC5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvYWNwaS9hY3RibDMuaCB8IDE4ICsrKysrKysrKysrKysr
KysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvYWNwaS9hY3RibDMuaCBiL2luY2x1ZGUvYWNwaS9hY3Ri
bDMuaAo+IGluZGV4IGMwODBkNTc5YTU0Ni4uNTIwMmUzZmM5YjQxIDEwMDY0NAo+IC0tLSBhL2lu
Y2x1ZGUvYWNwaS9hY3RibDMuaAo+ICsrKyBiL2luY2x1ZGUvYWNwaS9hY3RibDMuaAo+IEBAIC0x
OTIsNyArMTkyLDggQEAgZW51bSBhY3BpX3NyYXRfdHlwZSB7Cj4gICAgICAgICBBQ1BJX1NSQVRf
VFlQRV9HSUNfSVRTX0FGRklOSVRZID0gNCwgICAgLyogQUNQSSA2LjIgKi8KPiAgICAgICAgIEFD
UElfU1JBVF9UWVBFX0dFTkVSSUNfQUZGSU5JVFkgPSA1LCAgICAvKiBBQ1BJIDYuMyAqLwo+ICAg
ICAgICAgQUNQSV9TUkFUX1RZUEVfR0VORVJJQ19QT1JUX0FGRklOSVRZID0gNiwgICAgICAgLyog
QUNQSSA2LjQgKi8KPiAtICAgICAgIEFDUElfU1JBVF9UWVBFX1JFU0VSVkVEID0gNyAgICAgLyog
NyBhbmQgZ3JlYXRlciBhcmUgcmVzZXJ2ZWQgKi8KPiArICAgICAgIEFDUElfU1JBVF9UWVBFX1JJ
TlRDX0FGRklOSVRZID0gNywgICAgICAvKiBBQ1BJIDYuNiAqLwo+ICsgICAgICAgQUNQSV9TUkFU
X1RZUEVfUkVTRVJWRUQgPSA4ICAgICAvKiA4IGFuZCBncmVhdGVyIGFyZSByZXNlcnZlZCAqLwo+
ICB9Owo+Cj4gIC8qCj4gQEAgLTI5Niw2ICsyOTcsMjEgQEAgc3RydWN0IGFjcGlfc3JhdF9nZW5l
cmljX2FmZmluaXR5IHsKPiAgI2RlZmluZSBBQ1BJX1NSQVRfR0VORVJJQ19BRkZJTklUWV9FTkFC
TEVEICAgICAoMSkgICAgIC8qIDAwOiBVc2UgYWZmaW5pdHkgc3RydWN0dXJlICovCj4gICNkZWZp
bmUgQUNQSV9TUkFUX0FSQ0hJVEVDVFVSQUxfVFJBTlNBQ1RJT05TICAgKDE8PDEpICAvKiBBQ1BJ
IDYuNCAqLwo+Cj4gKy8qIDc6IFJJTlRDIEFmZmluaXR5IChBQ1BJIDYuNikgKi8KPiArCj4gK3N0
cnVjdCBhY3BpX3NyYXRfcmludGNfYWZmaW5pdHkgewo+ICsgICAgICAgc3RydWN0IGFjcGlfc3Vi
dGFibGVfaGVhZGVyIGhlYWRlcjsKPiArICAgICAgIHUxNiByZXNlcnZlZDsgICAgICAgICAgIC8q
IFJlc2VydmVkLCBtdXN0IGJlIHplcm8gKi8KPiArICAgICAgIHUzMiBwcm94aW1pdHlfZG9tYWlu
Owo+ICsgICAgICAgdTMyIGFjcGlfcHJvY2Vzc29yX3VpZDsKPiArICAgICAgIHUzMiBmbGFnczsK
PiArICAgICAgIHUzMiBjbG9ja19kb21haW47Cj4gK307Cj4gKwo+ICsvKiBGbGFncyBmb3Igc3Ry
dWN0IGFjcGlfc3JhdF9yaW50Y19hZmZpbml0eSAqLwo+ICsKPiArI2RlZmluZSBBQ1BJX1NSQVRf
UklOVENfRU5BQkxFRCAgICAgKDEpICAgICAgICAvKiAwMDogVXNlIGFmZmluaXR5IHN0cnVjdHVy
ZSAqLwo+ICsKPiAgLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKPiAgICoKPiAgICogU1RBTyAtIFN0
YXR1cyBPdmVycmlkZSBUYWJsZSAoX1NUQSBvdmVycmlkZSkgLSBBQ1BJIDYuMAo+IC0tCj4gMi4z
NC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
