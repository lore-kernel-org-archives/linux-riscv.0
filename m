Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842C8EDE98C
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 07:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Inyi735SF4aZq98e/GkCbuYYLSBBw1jynXV8NcP9T2g=; b=HnkEHSbYYLHMIX
	dbhQNHjJ6vTZ8NrLC5qZy8Z2Kx26/lj/bsTHaSBdz6nUpRTFW3wuVv4m3eXtGZyunDYCIurAiWpe/
	Otq4xnL40CzlLJx9APZSWp6odMyo+xT9DqEyA3WweDVDlnsd4lxGcOCALzxkZGGS7D1twjK//aTbH
	Gz36l+g9A8dS6XVMK6WxjbOwiuCFJVElCuVvmF72dzZCkp10DW7+SJWSpWQlH7RDJr8mhLHFQgm13
	dt9QIL9t3bLFMFsaFUUNbOaFTw3vMFui569MLgGqhFmDFURWIWVvker8u2NS6H8Ndg13/o2/B0MzS
	kD2/0j8SeQE8ev1LUG7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qggqP-007bd7-30;
	Thu, 14 Sep 2023 07:32:57 +0000
Received: from mail-yw1-f176.google.com ([209.85.128.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qggqM-007bc1-1x
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 07:32:56 +0000
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-58c92a2c52dso6964787b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 00:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694676770; x=1695281570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2n2ubhZrp/XvWyr+KX+wmdWC0Ev8ICvzidMCC6Gicsk=;
        b=D++P5rc7GdEP2Dk/l+ZMS/JIlHC17VI20NrRI+gFwU1RoOk7lMCY/n2GLvBnHoeVne
         gDVo+kDqiGCPaW45H4/b3qeO8to/H685rAWLFaQ7NvEMbts0sxhevX7ruimmKN+5WAYW
         XAR+YsiInPiMdDu7JbtaNhvkf6It/ubLDPjtHc7tHnNOYJsL1cmazrQ0D0dGkhv9KGG2
         EFLnMDWrRigj9w171H/tqd5ZYYoCzuJIOSyDsJ8/gc0ulVgs9HdaRQ5ehc+bGDwYE2xw
         lo63uWsMvpoZnbgl5K9KyzJlwBqXNhr0ews4gUWUDXHRKojsa34QBuF0aDi4yrpf6Vnr
         wBoA==
X-Gm-Message-State: AOJu0Yzg+F+DFlBxC2/VoWbvPob+mYz7TQXkVuttwygX9rg7yFG63pkE
	Tc4MGrSARcjPvpsT/scsLmx/cDJaJ8jXbQ==
X-Google-Smtp-Source: AGHT+IEsGGH6dtY0EZ7naMbsNDW//bNbxOB8xphy971RfWPiEb/Y+1/gGRGoDiWSo/xTwDFw7+lqbg==
X-Received: by 2002:a0d:d5d7:0:b0:58c:b5d2:bbd8 with SMTP id x206-20020a0dd5d7000000b0058cb5d2bbd8mr4580080ywd.28.1694676770424;
        Thu, 14 Sep 2023 00:32:50 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id b64-20020a0df243000000b005869fd2b5bcsm198459ywf.127.2023.09.14.00.32.49
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 00:32:49 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d8164e661abso727085276.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 00:32:49 -0700 (PDT)
X-Received: by 2002:a25:ea05:0:b0:d7a:d923:4493 with SMTP id
 p5-20020a25ea05000000b00d7ad9234493mr5250742ybd.64.1694676769523; Thu, 14 Sep
 2023 00:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230818194136.4084400-1-evan@rivosinc.com> <20230818194136.4084400-2-evan@rivosinc.com>
 <CAMuHMdVtXGjP8VFMiv-7OMFz1XvfU1cz=Fw4jL3fcp4wO1etzQ@mail.gmail.com> <CALs-Hsvu7BsK8P0+xeuLmKEqg-q=kQANbf8FkiPGPhwhnSXpmA@mail.gmail.com>
In-Reply-To: <CALs-Hsvu7BsK8P0+xeuLmKEqg-q=kQANbf8FkiPGPhwhnSXpmA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Sep 2023 09:32:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV594xA1UoTeVixpXm3i5LDFO5cT=dd_iRwWLwvxQctZg@mail.gmail.com>
Message-ID: <CAMuHMdV594xA1UoTeVixpXm3i5LDFO5cT=dd_iRwWLwvxQctZg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] RISC-V: Probe for unaligned access speed
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, linux-doc@vger.kernel.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, 
	Jonathan Corbet <corbet@lwn.net>, Sia Jee Heng <jeeheng.sia@starfivetech.com>, 
	Marc Zyngier <maz@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Greentime Hu <greentime.hu@sifive.com>, Simon Hosie <shosie@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, 
	linux-kernel@vger.kernel.org, Xianting Tian <xianting.tian@linux.alibaba.com>, 
	David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andy Chiu <andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_003254_948787_05B6CDF8 
X-CRM114-Status: GOOD (  44.61  )
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

SGkgRXZhbiwKCk9uIFdlZCwgU2VwIDEzLCAyMDIzIGF0IDc6NDbigK9QTSBFdmFuIEdyZWVuIDxl
dmFuQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gT24gV2VkLCBTZXAgMTMsIDIwMjMgYXQgNTozNuKA
r0FNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+ID4g
T24gRnJpLCBBdWcgMTgsIDIwMjMgYXQgOTo0NOKAr1BNIEV2YW4gR3JlZW4gPGV2YW5Acml2b3Np
bmMuY29tPiB3cm90ZToKPiA+ID4gUmF0aGVyIHRoYW4gZGVmZXJyaW5nIHVuYWxpZ25lZCBhY2Nl
c3Mgc3BlZWQgZGV0ZXJtaW5hdGlvbnMgdG8gYSB2ZW5kb3IKPiA+ID4gZnVuY3Rpb24sIGxldCdz
IHByb2JlIHRoZW0gYW5kIGZpbmQgb3V0IGhvdyBmYXN0IHRoZXkgYXJlLiBJZiB3ZQo+ID4gPiBk
ZXRlcm1pbmUgdGhhdCBhbiB1bmFsaWduZWQgd29yZCBhY2Nlc3MgaXMgZmFzdGVyIHRoYW4gTiBi
eXRlIGFjY2Vzc2VzLAo+ID4gPiBtYXJrIHRoZSBoYXJkd2FyZSdzIHVuYWxpZ25lZCBhY2Nlc3Mg
YXMgImZhc3QiLiBPdGhlcndpc2UsIHdlIG1hcmsKPiA+ID4gYWNjZXNzZXMgYXMgc2xvdy4KPiA+
ID4KPiA+ID4gVGhlIGFsZ29yaXRobSBpdHNlbGYgcnVucyBmb3IgYSBmaXhlZCBhbW91bnQgb2Yg
amlmZmllcy4gV2l0aGluIGVhY2gKPiA+ID4gaXRlcmF0aW9uIGl0IGF0dGVtcHRzIHRvIHRpbWUg
YSBzaW5nbGUgbG9vcCwgYW5kIHRoZW4ga2VlcHMgb25seSB0aGUgYmVzdAo+ID4gPiAoZmFzdGVz
dCkgbG9vcCBpdCBzYXcuIFRoaXMgYWxnb3JpdGhtIHdhcyBmb3VuZCB0byBoYXZlIGxvd2VyIHZh
cmlhbmNlIGZyb20KPiA+ID4gcnVuIHRvIHJ1biB0aGFuIG15IGZpcnN0IGF0dGVtcHQsIHdoaWNo
IGNvdW50ZWQgdGhlIHRvdGFsIG51bWJlciBvZgo+ID4gPiBpdGVyYXRpb25zIHRoYXQgY291bGQg
YmUgZG9uZSBpbiB0aGF0IGZpeGVkIGFtb3VudCBvZiBqaWZmaWVzLiBCeSB0YWtpbmcKPiA+ID4g
b25seSB0aGUgYmVzdCBpdGVyYXRpb24gaW4gdGhlIGxvb3AsIGFzc3VtaW5nIGF0IGxlYXN0IG9u
ZSBsb29wIHdhc24ndAo+ID4gPiBwZXJ0dXJiZWQgYnkgYW4gaW50ZXJydXB0LCB3ZSBlbGltaW5h
dGUgdGhlIGVmZmVjdHMgb2YgaW50ZXJydXB0cyBhbmQKPiA+ID4gb3RoZXIgIndhcm0gdXAiIGZh
Y3RvcnMgbGlrZSBicmFuY2ggcHJlZGljdGlvbi4gVGhlIG9ubHkgZG93bnNpZGUgaXMgaXQKPiA+
ID4gZGVwZW5kcyBvbiBoYXZpbmcgYW4gcmR0aW1lIGdyYW51bGFyIGFuZCBhY2N1cmF0ZSBlbm91
Z2ggdG8gbWVhc3VyZSBhCj4gPiA+IHNpbmdsZSBjb3B5LiBJZiB3ZSBldmVyIG1hbmFnZSB0byBj
b21wbGV0ZSBhIGxvb3AgaW4gMCByZHRpbWUgdGlja3MsIHdlCj4gPiA+IGxlYXZlIHRoZSB1bmFs
aWduZWQgc2V0dGluZyBhdCBVTktOT1dOLgo+ID4gPgo+ID4gPiBUaGVyZSBpcyBhIHNsaWdodCBj
aGFuZ2UgaW4gdXNlci12aXNpYmxlIGJlaGF2aW9yIGhlcmUuIFByZXZpb3VzbHksIGFsbAo+ID4g
PiBib2FyZHMgZXhjZXB0IHRoZSBUSGVhZCBDOTA2IHJlcG9ydGVkIG1pc2FsaWduZWQgYWNjZXNz
IHNwZWVkIG9mCj4gPiA+IFVOS05PV04uIEM5MDYgcmVwb3J0ZWQgRkFTVC4gV2l0aCB0aGlzIGNo
YW5nZSwgc2luY2Ugd2UncmUgbm93IG1lYXN1cmluZwo+ID4gPiBtaXNhbGlnbmVkIGFjY2VzcyBz
cGVlZCBvbiBlYWNoIGhhcnQsIGFsbCBSSVNDLVYgc3lzdGVtcyB3aWxsIGhhdmUgdGhpcwo+ID4g
PiBrZXkgc2V0IGFzIGVpdGhlciBGQVNUIG9yIFNMT1cuCj4gPiA+Cj4gPiA+IEN1cnJlbnRseSwg
d2UgZG9uJ3QgaGF2ZSBhIHdheSB0byBjb25maWRlbnRseSBtZWFzdXJlIHRoZSBkaWZmZXJlbmNl
IGJldHdlZW4KPiA+ID4gU0xPVyBhbmQgRU1VTEFURUQsIHNvIHdlIGxhYmVsIGFueXRoaW5nIG5v
dCBmYXN0IGFzIFNMT1cuIFRoaXMgd2lsbAo+ID4gPiBtaXNsYWJlbCBzb21lIHN5c3RlbXMgdGhh
dCBhcmUgYWN0dWFsbHkgRU1VTEFURUQgYXMgU0xPVy4gV2hlbiB3ZSBnZXQKPiA+ID4gc3VwcG9y
dCBmb3IgZGVsZWdhdGluZyBtaXNhbGlnbmVkIGFjY2VzcyB0cmFwcyB0byB0aGUga2VybmVsIChh
cyBvcHBvc2VkCj4gPiA+IHRvIHRoZSBmaXJtd2FyZSBxdWlldGx5IGhhbmRsaW5nIGl0KSwgd2Ug
Y2FuIGV4cGxpY2l0bHkgdGVzdCBpbiBMaW51eCB0bwo+ID4gPiBzZWUgaWYgdW5hbGlnbmVkIGFj
Y2Vzc2VzIHRyYXAuIFRob3NlIHN5c3RlbXMgd2lsbCBzdGFydCB0byByZXBvcnQKPiA+ID4gRU1V
TEFURUQsIHRob3VnaCBvbGRlciAodG9kYXkncykgc3lzdGVtcyB3aXRob3V0IHRoYXQgbmV3IFNC
SSBtZWNoYW5pc20KPiA+ID4gd2lsbCBjb250aW51ZSB0byByZXBvcnQgU0xPVy4KPiA+ID4KPiA+
ID4gSSd2ZSB1cGRhdGVkIHRoZSBkb2N1bWVudGF0aW9uIGZvciB0aG9zZSBod3Byb2JlIHZhbHVl
cyB0byByZWZsZWN0Cj4gPiA+IHRoaXMsIHNwZWNpZmljYWxseTogU0xPVyBtYXkgb3IgbWF5IG5v
dCBiZSBlbXVsYXRlZCBieSBzb2Z0d2FyZSwgYW5kIEZBU1QKPiA+ID4gcmVwcmVzZW50cyBtZWFu
cyBiZWluZyBmYXN0ZXIgdGhhbiBlcXVpdmFsZW50IGJ5dGUgYWNjZXNzZXMuIFRoZSBjaGFuZ2UK
PiA+ID4gaW4gZG9jdW1lbnRhdGlvbiBpcyBhY2N1cmF0ZSB3aXRoIHJlc3BlY3QgdG8gYm90aCB0
aGUgZm9ybWVyIGFuZCBjdXJyZW50Cj4gPiA+IGJlaGF2aW9yLgo+ID4gPgo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBFdmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KPiA+ID4gQWNrZWQtYnk6IENv
bm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gPgo+ID4gVGhhbmtzIGZv
ciB5b3VyIHBhdGNoLCB3aGljaCBpcyBub3cgY29tbWl0IDU4NGVhNjU2NGJjYWVhZDIgKCJSSVND
LVY6Cj4gPiBQcm9iZSBmb3IgdW5hbGlnbmVkIGFjY2VzcyBzcGVlZCIpIGluIHY2LjYtcmMxLgo+
ID4KPiA+IE9uIHRoZSBib2FyZHMgSSBoYXZlLCBJIGdldDoKPiA+Cj4gPiAgICAgcnpmaXZlOgo+
ID4gICAgICAgICBjcHUwOiBSYXRpbyBvZiBieXRlIGFjY2VzcyB0aW1lIHRvIHVuYWxpZ25lZCB3
b3JkIGFjY2VzcyBpcwo+ID4gMS4wNSwgdW5hbGlnbmVkIGFjY2Vzc2VzIGFyZSBmYXN0Cj4KPiBI
cm0sIEknbSBhIGxpdHRsZSBzdXJwcmlzZWQgdG8gYmUgc2VlaW5nIHRoaXMgbnVtYmVyIGNvbWUg
b3V0IHNvIGNsb3NlCj4gdG8gMS4gSWYgeW91IHJlYm9vdCBhIGZldyB0aW1lcywgd2hhdCBraW5k
IG9mIHZhcmlhbmNlIGRvIHlvdSBnZXQgb24KPiB0aGlzPwoKUm9jay1zb2xpZCBhdCAxLjA1IChl
dmVuIHdpdGggaW5jcmVhc2VkIHJlc29sdXRpb246IDEuMDU4NTMgb24gMyB0cmllcykKCj4gPiAg
ICAgaWNpY2xlOgo+ID4KPiA+ICAgICAgICAgY3B1MTogUmF0aW8gb2YgYnl0ZSBhY2Nlc3MgdGlt
ZSB0byB1bmFsaWduZWQgd29yZCBhY2Nlc3MgaXMKPiA+IDAuMDAsIHVuYWxpZ25lZCBhY2Nlc3Nl
cyBhcmUgc2xvdwo+ID4gICAgICAgICBjcHUyOiBSYXRpbyBvZiBieXRlIGFjY2VzcyB0aW1lIHRv
IHVuYWxpZ25lZCB3b3JkIGFjY2VzcyBpcwo+ID4gMC4wMCwgdW5hbGlnbmVkIGFjY2Vzc2VzIGFy
ZSBzbG93Cj4gPiAgICAgICAgIGNwdTM6IFJhdGlvIG9mIGJ5dGUgYWNjZXNzIHRpbWUgdG8gdW5h
bGlnbmVkIHdvcmQgYWNjZXNzIGlzCj4gPiAwLjAwLCB1bmFsaWduZWQgYWNjZXNzZXMgYXJlIHNs
b3cKPiA+Cj4gPiAgICAgICAgIGNwdTA6IFJhdGlvIG9mIGJ5dGUgYWNjZXNzIHRpbWUgdG8gdW5h
bGlnbmVkIHdvcmQgYWNjZXNzIGlzCj4gPiAwLjAwLCB1bmFsaWduZWQgYWNjZXNzZXMgYXJlIHNs
b3cKCmNwdTE6IFJhdGlvIG9mIGJ5dGUgYWNjZXNzIHRpbWUgdG8gdW5hbGlnbmVkIHdvcmQgYWNj
ZXNzIGlzIDAuMDAzNDQsCnVuYWxpZ25lZCBhY2Nlc3NlcyBhcmUgc2xvdwpjcHUyOiBSYXRpbyBv
ZiBieXRlIGFjY2VzcyB0aW1lIHRvIHVuYWxpZ25lZCB3b3JkIGFjY2VzcyBpcyAwLjAwMzQzLAp1
bmFsaWduZWQgYWNjZXNzZXMgYXJlIHNsb3cKY3B1MzogUmF0aW8gb2YgYnl0ZSBhY2Nlc3MgdGlt
ZSB0byB1bmFsaWduZWQgd29yZCBhY2Nlc3MgaXMgMC4wMDM0MywKdW5hbGlnbmVkIGFjY2Vzc2Vz
IGFyZSBzbG93CmNwdTA6IFJhdGlvIG9mIGJ5dGUgYWNjZXNzIHRpbWUgdG8gdW5hbGlnbmVkIHdv
cmQgYWNjZXNzIGlzIDAuMDAzNDAsCnVuYWxpZ25lZCBhY2Nlc3NlcyBhcmUgc2xvdwoKPiA+ICAg
ICBrMjEwOgo+ID4KPiA+ICAgICAgICAgY3B1MTogUmF0aW8gb2YgYnl0ZSBhY2Nlc3MgdGltZSB0
byB1bmFsaWduZWQgd29yZCBhY2Nlc3MgaXMKPiA+IDAuMDIsIHVuYWxpZ25lZCBhY2Nlc3NlcyBh
cmUgc2xvdwo+ID4gICAgICAgICBjcHUwOiBSYXRpbyBvZiBieXRlIGFjY2VzcyB0aW1lIHRvIHVu
YWxpZ25lZCB3b3JkIGFjY2VzcyBpcwo+ID4gMC4wMiwgdW5hbGlnbmVkIGFjY2Vzc2VzIGFyZSBz
bG93CgpjcHUxOiBSYXRpbyBvZiBieXRlIGFjY2VzcyB0aW1lIHRvIHVuYWxpZ25lZCB3b3JkIGFj
Y2VzcyBpcyAwLjAyMzkyLAp1bmFsaWduZWQgYWNjZXNzZXMgYXJlIHNsb3cKY3B1MDogUmF0aW8g
b2YgYnl0ZSBhY2Nlc3MgdGltZSB0byB1bmFsaWduZWQgd29yZCBhY2Nlc3MgaXMgMC4wMjA4NCwK
dW5hbGlnbmVkIGFjY2Vzc2VzIGFyZSBzbG93Cgo+ID4gICAgIHN0YXJsaWdodDoKPiA+Cj4gPiAg
ICAgICAgIGNwdTE6IFJhdGlvIG9mIGJ5dGUgYWNjZXNzIHRpbWUgdG8gdW5hbGlnbmVkIHdvcmQg
YWNjZXNzIGlzCj4gPiAwLjAxLCB1bmFsaWduZWQgYWNjZXNzZXMgYXJlIHNsb3cKPiA+ICAgICAg
ICAgY3B1MDogUmF0aW8gb2YgYnl0ZSBhY2Nlc3MgdGltZSB0byB1bmFsaWduZWQgd29yZCBhY2Nl
c3MgaXMKPiA+IDAuMDIsIHVuYWxpZ25lZCBhY2Nlc3NlcyBhcmUgc2xvdwoKY3B1MTogUmF0aW8g
b2YgYnl0ZSBhY2Nlc3MgdGltZSB0byB1bmFsaWduZWQgd29yZCBhY2Nlc3MgaXMgMC4wMTg3MiwK
dW5hbGlnbmVkIGFjY2Vzc2VzIGFyZSBzbG93CmNwdTA6IFJhdGlvIG9mIGJ5dGUgYWNjZXNzIHRp
bWUgdG8gdW5hbGlnbmVkIHdvcmQgYWNjZXNzIGlzIDAuMDE5MzAsCnVuYWxpZ25lZCBhY2Nlc3Nl
cyBhcmUgc2xvdwoKPiA+ICAgICB2ZXhyaXNjdi9vcmFuZ2VjcmFiOgo+ID4KPiA+ICAgICAgICAg
Y3B1MDogUmF0aW8gb2YgYnl0ZSBhY2Nlc3MgdGltZSB0byB1bmFsaWduZWQgd29yZCBhY2Nlc3Mg
aXMKPiA+IDAuMDAsIHVuYWxpZ25lZCBhY2Nlc3NlcyBhcmUgc2xvdwoKY3B1MDogUmF0aW8gb2Yg
Ynl0ZSBhY2Nlc3MgdGltZSB0byB1bmFsaWduZWQgd29yZCBhY2Nlc3MgaXMgMC4wMDQxNywKdW5h
bGlnbmVkIGFjY2Vzc2VzIGFyZSBzbG93Cgo+ID4gSSBhbSBhIGJpdCBzdXJwcmlzZWQgYnkgdGhl
IG5lYXItemVybyB2YWx1ZXMuICBBcmUgdGhlc2UgZXhwZWN0ZWQ/Cj4KPiBUaGlzIGNvdWxkIGJl
IGV4cGVjdGVkLCBpZiBmaXJtd2FyZSBpcyB0cmFwcGluZyB0aGUgdW5hbGlnbmVkIGFjY2Vzc2Vz
Cj4gYW5kIGNvbWluZyBvdXQgPjEwMHggc2xvd2VyIHRoYW4gYSBuYXRpdmUgYWNjZXNzLiBJZiB5
b3UncmUgaW50ZXJlc3RlZAo+IGluIGdldHRpbmcgYSBsaXR0bGUgbW9yZSByZXNvbHV0aW9uLCB5
b3UgY291bGQgdHJ5IHRvIHByaW50IGEgZmV3IG1vcmUKPiBkZWNpbWFsIHBsYWNlcyB3aXRoIHNv
bWV0aGluZyBsaWtlIChzb3JyeSBnbWFpbCBtYW5nbGVzIHRoZSB3aGl0ZXNwYWNlCj4gb24gdGhp
cyk6CgpMb29rcyBsaWtlIHlvdSBuZWVkIHRvIGFkZCBvbmUgZGlnaXQgdG8gZ2V0IGFueXRoaW5n
IHVzZWZ1bCBvbiBoYWxmIG9mIHRoZQpzeXN0ZW1zLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAg
ICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVy
ZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCklu
IHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlz
ZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qg
c2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
