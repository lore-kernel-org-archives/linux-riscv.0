Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B882C5472F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 17:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1TYJ3ckGHScBGO32IQL8biVs4w5hIUdSnSZinWrzFDU=; b=CUNaPngU0HW2Co
	zKH8EUxmR2dKjWdU2DCUCOWOTO5eoym+b1/pm6txQXnKQhmLVMs8Di2D7iddiT0H/Q329yWREvy7J
	0ylI2bCpvW265CVyFJSfwskTL6QE77HnW60qojugK1vMDaC9w1ig+NvT7gGkp78OT6mFZ8Ol0Y323
	15nxVytBTxp5EGZ8F2emDe9XyVxKCR6KCSjdko7pH1Gcdg3EO61ehlTQ6vp4WFPzD5PkhTm/qDZlb
	/tQa5gGXIzov7NpmNuTm+HGawhSXrzfctKBGmohd8TcVbMW5ryCfspfNLLGAPw5eppVAfeyCZsumK
	/tslkeofrj6Zdx/MWLYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj07M-0000000CKCu-3WVa;
	Tue, 27 Aug 2024 17:36:32 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj02h-0000000CIs1-0tLy
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 17:31:44 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20231aa8908so46094025ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Aug 2024 10:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724779902; x=1725384702; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eyakK3kXJdL4Hi3Zxsy/Z79bQ5vm7LShwCBS+rqjrc0=;
        b=JHrcihOWNcIKmTgOh0fFmdihMrn4aWd8rod8itRp+YzVisvrvIUOZvYak4G1aW9UqH
         v7yzS7jQk7zfOIbm2gWRviUFiWMsm35qIcifj/YiXsDRndAub7P/BpSUlz4+ydlMGnkz
         7WXAoeXgOn/jTLxdz0Hq8wuF8C1OYLf8qV04WBU0WbeDguJag86or6RwvPwczOz2xrIz
         RcGjuzzN5ESt8cjrmTqSxZxEGIGh8cuRi6OCx8/i5vXqqdOccvKwiGzDyii103q2iymL
         QO3JgmyRlLr/kfiLL2deY9lwaThB2Q+8Tkp0dDwf1mqY/Fylu/WYfj1B51YGu7FYVayT
         3u5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724779902; x=1725384702;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eyakK3kXJdL4Hi3Zxsy/Z79bQ5vm7LShwCBS+rqjrc0=;
        b=qt2QS5wXI8+1KvyMLTpmCtnDbKh8Vg021i3rwhzJd+WtCck0mGRNFIpAf92ZY1rL0M
         M5RKqU8+6XhKwNSDqrMyW+wbApWCrVP+/91+o73mT7mWXn5ySIsJKN3QjC9YuaXrY1z2
         pyrlg8CliCs81egMHLGcyafJIoQdOlDxqexpwUqqzu4yZFNeT/LuL1cJ6ftg7JYWVnjy
         Klk6h2ITsF/rDPEdrPXSS3ZnSJakHJ6petncf8tYt/1YBkf/tbr3nlUWe/AlfD3MJSvU
         ZfGc3yzFgyMmh5XD6M9VZz3uG2n87E0uXdROdDZysUzg40WDdtiS0AhZdsOE6FOlC7y7
         d1aA==
X-Forwarded-Encrypted: i=1; AJvYcCXJxUx+SMqOJFp6M0LaUxhhx3i1roVubxuEAMhRr7CCBWjJQe7guPnKnRxxd4TCEkmZFlM9w41NVxxvGw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3vBCCr9dfTw0KVqwzc67DZ+d3M00uYPepMSYVVinUPMVy1D7f
	7iXFKu73137tDtoVaxzUzCpgnli/imM/KPVwxjuIm+vhmWLFVVBzcdu9A4voAWo=
X-Google-Smtp-Source: AGHT+IHflfR+4oEKIX2AdkLpfmbDgIyQiynrQVhbNue6r8R5xP1CRH6FV9dXMTMD0eIz75yo1iaVkQ==
X-Received: by 2002:a17:903:2349:b0:201:cda4:69cb with SMTP id d9443c01a7336-204df029fbamr35148895ad.9.1724779901775;
        Tue, 27 Aug 2024 10:31:41 -0700 (PDT)
Received: from sunil-laptop ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385566611sm86220445ad.2.2024.08.27.10.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 10:31:41 -0700 (PDT)
Date: Tue, 27 Aug 2024 23:01:30 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Haibo Xu <haibo1.xu@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: Re: [PATCH v8 00/17] RISC-V: ACPI: Add external interrupt controller
 support
Message-ID: <Zs4NcmM79kMUc7Ol@sunil-laptop>
References: <20240812005929.113499-1-sunilvl@ventanamicro.com>
 <ZrlgVUXC_dCW9ISM@sunil-laptop>
 <87mskzcnmf.ffs@tglx>
 <CAJZ5v0imJcU4cwDuZKEvGf93fZm4ea4s2Ocp3Cnfb3+nBQ0-Gg@mail.gmail.com>
 <Zsy3o_N8hvc6GfTp@sunil-laptop>
 <CAJZ5v0hxoT9tBjm3xRPU4fHx3MgHfYAx_Vyf4oe2toa3GWAN+Q@mail.gmail.com>
 <87jzg3c7bz.ffs@tglx>
 <CAJZ5v0iMpaxBevgPWmD2Ym_JG1ChkjzVFf22fV7Xw8-ssg9+Ag@mail.gmail.com>
 <Zs4HCZH3M9nRXUvu@sunil-laptop>
 <CAJZ5v0i-8N8VG-D4FRh0qFxt44Ax4TKY_CiFhZxLCzkhQrt0=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0i-8N8VG-D4FRh0qFxt44Ax4TKY_CiFhZxLCzkhQrt0=Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_103143_267287_02489D02 
X-CRM114-Status: GOOD (  22.41  )
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

T24gVHVlLCBBdWcgMjcsIDIwMjQgYXQgMDc6MTI6MTFQTSArMDIwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gVHVlLCBBdWcgMjcsIDIwMjQgYXQgNzowNOKAr1BNIFN1bmlsIFYgTCA8
c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIEF1ZyAyNywg
MjAyNCBhdCAwNjoyMDoyNFBNICswMjAwLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPiA+ID4g
T24gTW9uLCBBdWcgMjYsIDIwMjQgYXQgMTE6MjLigK9QTSBUaG9tYXMgR2xlaXhuZXIgPHRnbHhA
bGludXRyb25peC5kZT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBNb24sIEF1ZyAyNiAyMDI0
IGF0IDE5OjI3LCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPiA+ID4gPiA+IE9uIE1vbiwgQXVn
IDI2LCAyMDI0IGF0IDc6MjLigK9QTSBTdW5pbCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3JvLmNv
bT4gd3JvdGU6Cj4gPiA+ID4gPj4gVGhlcmUgd2lsbCBiZSBhIGNvbmZsaWN0IGluIFBMSUMgaXJx
Y2hpcCBkcml2ZXIgZHVlIHRvIGEgcmVjZW50IHBhdGNoIFsxXS4KPiA+ID4gPiA+PiBUaGlzIHBh
dGNoIGlzIG5vdCBpbiBsYXRlc3QgUkM1IHJlbGVhc2UgYnV0IGluIGxpbnV4LW5leHQuIEkgdXN1
YWxseSBiYXNlIHRoZQo+ID4gPiA+ID4+IHNlcmllcyBvbiBsYXRlc3QgUkMgcmVsZWFzZS4gU2hv
dWxkIEkgcmViYXNlIHRvIGxpbnV4LW5leHQgaW4gdGhpcyBjYXNlCj4gPiA+ID4gPj4gYW5kIHNl
bmQgdGhlIG5leHQgcmV2aXNpb24gb2YgdGhlIHNlcmllcyByZXNvbHZpbmcgdGhlIGNvbmZsaWN0
Pwo+ID4gPiA+ID4KPiA+ID4gPiA+IE5vLCBwbGVhc2UgZG9uJ3QuCj4gPiA+ID4gPgo+ID4gPiA+
ID4gVGhhdCB3aWxsIGJlIHJlc29sdmVkIGF0IHRoZSBtZXJnZSB0aW1lLgo+ID4gPiA+Cj4gPiA+
ID4gQWx0ZXJuYXRpdmVseSB5b3UgY2FuIHB1bGwKPiA+ID4gPgo+ID4gPiA+ICAgZ2l0Oi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RpcC90aXAuZ2l0IGlycS11cmdl
bnQtMjAyNC0wOC0yNQo+ID4gPiA+Cj4gPiA+ID4gd2hpY2ggSSdtIGFib3V0IHRvIHNlbmQgdG8g
TGludXMgbGF0ZXN0IHRvbW9ycm93IG1vcm5pbmcuIFRoYXQgY29udGFpbnMKPiA+ID4gPiB0aGUg
Y29uZmxpY3RpbmcgY2hhbmdlLgo+ID4gPgo+ID4gPiBTbyBJJ3ZlIGFwcGxpZWQgdGhlIHNlcmll
cyBvbiB0b3Agb2YgdGhlIGFib3ZlLgo+ID4gPgo+ID4gVGhhbmtzIQo+ID4KPiA+ID4gVGhpcyBp
bmNsdWRlZCBhIGZ1bGwtc3dpbmcgcmViYXNlIG9mIHRoZSBsYXN0IHBhdGNoLCB3aGljaCBJIGhv
cGUgSSd2ZQo+ID4gPiBkb25lIGNvcnJlY3RseSwgYnV0IFN1bmlsIHBsZWFzZSBzZWUKPiA+ID4K
PiA+IFllYWgsIHNvcnJ5IGFib3V0IHRoYXQuIFlvdSBoYXZlIHJlc29sdmVkIG1vc3Qgb2YgdGhl
IGNvbmZsaWN0cyBidXQgZmV3Cj4gPiBhcmUgbWlzc2luZyAod2hpY2ggd2VyZSBub3Qgb2J2aW91
cyBhbnl3YXkpLiBDb3VsZCB5b3UgcGxlYXNlIHRha2UgYmVsb3cKPiA+IGNvbW1pdCBhbmQgc3F1
YXNoPwo+ID4KPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS92bHN1bmlsL2xpbnV4L2NvbW1pdC9jODVm
OWQwZGMzMWMwZTc3OTE2ZWNkYmI0NTc3NDhjMDVjZjRlNzVhCj4gCj4gQ2FuIHlvdSBwbGVhc2Ug
c2VuZCBtZSBhIGRpZmY/Cj4gCkhpIFJhZmFlbCwKCkkgaGF2ZSBzZW50IHRoZSBkaWZmIHRvIHlv
dS4gSG9wZSB0aGF0IGlzIGZpbmUuCgpUaGFua3MhClN1bmlsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
