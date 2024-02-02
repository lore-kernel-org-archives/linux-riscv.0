Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D777AC4828E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 08:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=26PMH764IFiv2BxLf6Kg1oBUQraEb9uFwdULR6jyZlc=; b=x045JhqF9V4G4p
	e8Tsow9fDC3HjbVdfrA6q4AP+zYvCAux1btsKLC1mr+zxW+lWtFSxFObD8MIl6TEUg3NINIybzWUV
	0bFEX77pzJywIcVqJxkdbm7Z6QPyvpSBG8G0xKrjsv6rQMsS/6N//u/6hxBrnsQMiV7kh3deRtUhy
	H8MUsdpfwUONtfU2fm3fpm8O/wFvN/pT9gGEMoKz4fGJw5IvRBiEodbd0gSULm25uhtfLyEJR8LbN
	48r++BxLUcu+rlqFqikthFaKpZliF8tZdXd0TtLZJHvFzhwyYbYLLfkWeKBTZahqsi24ikFZxH7cx
	4NnGsDIO7bQ9d03bY0Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVpE6-0000000ApGD-0d3t;
	Fri, 02 Feb 2024 08:48:46 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVpE3-0000000ApDq-2RUA
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 08:48:45 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso1717047a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 00:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706863720; x=1707468520; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TItsROaQHyjEbJFLwPA4KC7BHoQVWA8FloUjcj8REgk=;
        b=YcuxZ0qAkTkMBl/XGaTheRLqXXBeNpJai12SWPtyXiY2kwlvFCCJnx4f9bcyULiBzz
         rrM7QGQ+IgsAYvpucYF+tkCnTr9FmDPhGEEzpcGiBpAd/bLQlHZOKoQP9JhZpFzlRFdB
         eU9ewCvoHwf+xZ2H0gQ34BIEoifi5CdFNxE/hpNeJljamNzi9H1PtKQY66oVwDID+joG
         bJBS8/aUlOwz+GdreYgttht664JFUEmjj7VidLYx9Po0l+DVQzZStKnErFswbUZwiKGr
         14Ohk36CTR3Ox+O34AEb6gIrJo1b8g76XT0M5/iaZgLCaY09P30SOtZP8PDi2uqboThX
         JmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706863720; x=1707468520;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TItsROaQHyjEbJFLwPA4KC7BHoQVWA8FloUjcj8REgk=;
        b=saYaUslccPOvE2AlVPJ3e2YgV4516pVqKt7K7V5XXWqsb/fVy3Ju3W1jQbbu5EGiYI
         70RvAmjvWk5R3Zwd2uY5zbs1kS4gUucipbyufiB3Zu0FcpqS7EdrIUaz00KM3mVMeYKP
         dm12STgZ8cvVKH4iHurgJxZrruBsHWWsA9ty4zWXFXyk3osBlBktPpHHbeTsSVMjfCii
         NF0yes4I0goOEbmk3xxKoboDWkWAHsG8Wve7gPT1rIGoL0OIAUahSpwCtlxWQwOc5f2O
         vNicwVNc/qBbTitidpfMA/qfGQE8YlmNzRoByYh6lX0Ec8p0MaTGY/CI8oEslhckgDTs
         yUJA==
X-Gm-Message-State: AOJu0YztyarAf6IUs6S6WiC3ibe0wf6spSZbxhAb5DAdteRPj8JmJ2Wm
	NfbqNrI07HS/YoBjHbgY833EF6ffLptvarVpQoF1xlkMbxWzYZgSdcnyiDH73No=
X-Google-Smtp-Source: AGHT+IFKJTKBJ1qZaEdzHRI6R3ULv7nSG6aIb1erLw8eof4kdB83jJqiV5IsTHm9r+TtHnCR1jZmWQ==
X-Received: by 2002:a17:90a:9415:b0:293:eaec:fd67 with SMTP id r21-20020a17090a941500b00293eaecfd67mr7058447pjo.14.1706863719736;
        Fri, 02 Feb 2024 00:48:39 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXTEwJbtE+hsf4fe9iCtFquFGaddaPiWZ6SnyAr0Einu4dhTiJbRdR7UsVh3wDijhbLCJy4cgq+WMa32kNB4DVIJ2CTvjvXu0QA+jepl2n5oU047rQfjh9yHEHsiiZ+3aZVPN2LIIzPHR59vKArcMIcOGJnWSGcxBhqXb0TN0G04w4wTYfPowAIDmztFuw3hXmNVpH/zvuBW4p/QvlVMswA4AJlDPiFke0+cJC8VBOZEPAQgzm4hnXEjuGRTNbSYioOI/Q++uuarI9wkhlxcl5I/iYC8zOTF+O5BAWMOKXF8GJmHwEOCoeUxQ21aQ/KeZpdSNG+68oMJ51E2GniW1hMaJrxApOTFBMSMCQGwlT0ne8wRSNvA2p5z5j4f9Y1MkgOUW/sdryWa5PgJxIHDqPHSheCrCT7xbEOIL8mNdusCKQpve8UzaMbCRG6fEz3HztBo4io4GCsbdgYf/1hEo6jY7yscTM4euX7ng586XMYFPY4lUWHwAeHZb1XYtHyRIKmbQ43J31dY25rJbxYBSi2SXlZTf1I+etr5v6pZjLBurjzWF9YzWmS602pOBZV+Th8SH99xW9a0+HO/D+WYHwmaRpdLRXX+xGrUGyJKI4iS992HPL5L2yc2C19Aiu/pkxxCLNMOjjMh6SewbZHG5CEqgva9cPnS9GJGjqgxTvbudduv7QTe0cO9p6r6VSsC1kZ
Received: from sunil-laptop ([106.51.184.12])
        by smtp.gmail.com with ESMTPSA id kb3-20020a17090ae7c300b0029647c140ddsm564007pjb.17.2024.02.02.00.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 00:48:39 -0800 (PST)
Date: Fri, 2 Feb 2024 14:18:31 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Haibo Xu <haibo1.xu@intel.com>
Subject: Re: [RFC PATCH v2 05/21] pnp.h: Return -EPROBE_DEFER for disabled
 IRQ resource in pnp_irq()
Message-ID: <ZbysXzWX6FH5e6AH@sunil-laptop>
References: <20231025202344.581132-1-sunilvl@ventanamicro.com>
 <20231025202344.581132-6-sunilvl@ventanamicro.com>
 <CAJZ5v0hHYa4c2U-tegdBtoTak=MirXwyBXbN9yrWPx_x-+yMzg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0hHYa4c2U-tegdBtoTak=MirXwyBXbN9yrWPx_x-+yMzg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_004843_648841_28191586 
X-CRM114-Status: GOOD (  23.55  )
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

T24gVGh1LCBGZWIgMDEsIDIwMjQgYXQgMDc6MDA6NTFQTSArMDEwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gV2VkLCBPY3QgMjUsIDIwMjMgYXQgMTA6MjTigK9QTSBTdW5pbCBWIEwg
PHN1bmlsdmxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gVG8gc3VwcG9ydCBkZWZl
cnJlZCBQTlAgZHJpdmVyIHByb2JlLCBwbnBfaXJxKCkgbXVzdCByZXR1cm4gLUVQUk9CRV9ERUZF
Ugo+ID4gc28gdGhhdCB0aGUgZGV2aWNlIGRyaXZlciBjYW4gZG8gZGVmZXJyZWQgcHJvYmUgaWYg
dGhlIGludGVycnVwdCBjb250cm9sbGVyCj4gPiBpcyBub3QgcHJvYmVkIGVhcmx5Lgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPgo+ID4g
LS0tCj4gPiAgaW5jbHVkZS9saW51eC9wbnAuaCB8IDEwICsrKysrKysrLS0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L3BucC5oIGIvaW5jbHVkZS9saW51eC9wbnAuaAo+ID4gaW5kZXgg
YzJhN2NmYmNhNzEzLi4yMWNmODMzNzg5ZmIgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4
L3BucC5oCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L3BucC5oCj4gPiBAQCAtMTQ3LDEyICsxNDcs
MTggQEAgc3RhdGljIGlubGluZSByZXNvdXJjZV9zaXplX3QgcG5wX21lbV9sZW4oc3RydWN0IHBu
cF9kZXYgKmRldiwKPiA+ICB9Cj4gPgo+ID4KPiA+IC1zdGF0aWMgaW5saW5lIHJlc291cmNlX3Np
emVfdCBwbnBfaXJxKHN0cnVjdCBwbnBfZGV2ICpkZXYsIHVuc2lnbmVkIGludCBiYXIpCj4gPiAr
c3RhdGljIGlubGluZSBpbnQgcG5wX2lycShzdHJ1Y3QgcG5wX2RldiAqZGV2LCB1bnNpZ25lZCBp
bnQgYmFyKQo+ID4gIHsKPiA+ICAgICAgICAgc3RydWN0IHJlc291cmNlICpyZXMgPSBwbnBfZ2V0
X3Jlc291cmNlKGRldiwgSU9SRVNPVVJDRV9JUlEsIGJhcik7Cj4gPgo+ID4gLSAgICAgICBpZiAo
cG5wX3Jlc291cmNlX3ZhbGlkKHJlcykpCj4gPiArICAgICAgIGlmIChwbnBfcmVzb3VyY2VfdmFs
aWQocmVzKSkgewo+ID4gKyNpZiBJU19FTkFCTEVEKENPTkZJR19BUkNIX0FDUElfREVGRVJSRURf
R1NJKQo+ID4gKyAgICAgICAgICAgICAgIGlmICghcG5wX3Jlc291cmNlX2VuYWJsZWQocmVzKSkK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRVBST0JFX0RFRkVSOwo+ID4gKyNl
bmRpZgo+IAo+IFdoYXQgd291bGQgYmUgd3Jvbmcgd2l0aAo+IAo+IGlmIChJU19FTkFCTEVEKENP
TkZJR19BUkNIX0FDUElfREVGRVJSRURfR1NJKSAmJiAhcG5wX3Jlc291cmNlX2VuYWJsZWQocmVz
KSkKPiAgICAgICAgIHJldHVybiAtRVBST0JFX0RFRkVSOwo+IAo+ID8KSGkgUmFmYWVsLAoKQWN0
dWFsbHksIHRoaXMgaXMgdjIgdmVyc2lvbiBvZiB0aGUgcGF0Y2ggYW5kIHRoZXJlIGlzIHJlY2Vu
dCB2My4gUGxlYXNlCnRha2UgYSBsb29rIGF0IFsxXSBmb3IgdGhlIGxhdGVzdCB2ZXJzaW9uLgoK
SG93ZXZlciwgeW91ciBjb21tZW50IGlzIHN0aWxsIHZhbGlkIGZvciB2My4gSSB3aWxsIHVwZGF0
ZSBhcyB5b3UKbWVudGlvbmVkLgoKWzFdIC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
YXJtLWtlcm5lbC8yMDIzMTIxOTE3NDUyNi4yMjM1MTUwLTctc3VuaWx2bEB2ZW50YW5hbWljcm8u
Y29tLwoKVGhhbmtzLApTdW5pbAo+IAo+ID4gKwo+ID4gICAgICAgICAgICAgICAgIHJldHVybiBy
ZXMtPnN0YXJ0Owo+ID4gKyAgICAgICB9Cj4gPiAgICAgICAgIHJldHVybiAtMTsKPiA+ICB9Cj4g
Pgo+ID4gLS0KPiA+IDIuMzkuMgo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
