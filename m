Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F07C52D7C
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Aug 2024 06:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ePJ0rFteq9Ai6+9YRsqTe5P/rAkVL1X2UmPkgqhbeB0=; b=XJHv2TT+asVkgW
	vVp5dtDGgeE14ejMG9k4+Auti3qILx7YFAPk39Ro7hfMgP3AncIgesKZeclGkc1hBVP7i4YJjChna
	4Ngmy7MNRNM86331O4OJw/BPWkCRWkVbDNpX5MPpn89mVmrYZvdGNHs6HPU6Wul1aP17eo0plBZFV
	jX/c33pGjk0xmLLDiUaBEqggNsrggyeaIiXDEWvyYwobxmkx8S5kmMUI/EhUo9y/HOSCCmuvRC7Qc
	p07XyYpHYoa5J8NmoBm20XudoCOGGaI8hc9v2a4YCRQKGl+l7EAQuickDehtE6e2viTC388+0rzJe
	D62rfVDPkghHH+ww9uAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shNsU-0000000FTOs-1tkI;
	Fri, 23 Aug 2024 06:34:30 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shNri-0000000FTHU-2srI
	for linux-riscv@lists.infradead.org;
	Fri, 23 Aug 2024 06:33:44 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-428e1915e18so11495285e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Aug 2024 23:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724394820; x=1724999620; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nwwa4zZWKWT0C7ngpvIXaYQp8a5Xf4joWxzD56LK+ns=;
        b=Xu2Uuk6CTUqfZOeMtT+oqlPVA0h08LCtGhoz8ZXF/c06qsOoz22bf1u99euX2j2jNX
         gwumriBtgPO0lgvV0XgKkbSCNMIuLsWr5LcnjIs6TJhAK4u82mnPwAszEzCOLxVQ+Yiz
         iFaUCN4xiawLabXJL2a7o1HK0bZUhjLCVNEhXfnq8n21um2gfq3ITheHrYuQBfR1py6U
         aWqw4yUiHd5HUnEc4HP/mqPnEuLJKSOWJsw+/HmpwFFIccfa0LolE2vUpMtzOzWFxsZy
         P4/aCWPK4CQoviZAC79PATqMEQwTluRc8hwTfHR16S+rG0TYCyOxmMokxV5/l1n892LT
         hxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724394820; x=1724999620;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nwwa4zZWKWT0C7ngpvIXaYQp8a5Xf4joWxzD56LK+ns=;
        b=VMgdMEyBTz6XVEly8rmfUTQMQYspjdIEYMk5MjhOjX/UXGduA9CfCx38TJNV0Ht+LB
         TamiVnMCCYJu/NNhxAEvkJfiRCGdHoCFP+cK6PRWUZ1mnveJ4VWPAvtQWDLC41VoQTKx
         YkOPAymQC9JlH7vKIY5PepCyj1VOwZeuOAf+My0KM+JiW5wz1jJUgKI3mfweH83YGpak
         nTLKrHO5aJNQbWdQ1U45iQ8dxcCINng4ILSV7c4d2BFMpEUBuTEM85dyJXFMmVlMCHNh
         qaKetuiteipRnrBVuAbtbfYwkXfdrbu+SO5dWAZP1NfVi2YG0bjThJ+6K7RaW+wyuX3C
         i6Uw==
X-Forwarded-Encrypted: i=1; AJvYcCU0Cjo6RAsjx8CbDHTZ5aLyj8eU9KPHGr30DKT6AEOjIs9+Nl8LEPMc3BgsesG2sg3GdT+4cC02yorS+A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw55ffHlhG8AKucMrVADsi8rdpQ7dYW6jSGi2Rc9PZbqM6UYHJN
	Cm76FFlvkaYHtqJrxCMni3k5L6tAPqBkg+h/VCdaZNlewucMuCM/ajOoaNjW1tg=
X-Google-Smtp-Source: AGHT+IE1rLgEUi/E+JRWhk5yegpaazjUMmQ/t/cN3D8r5PCsnRrmCPHJTAiKkoCLeX2MUJRaLJ7WWw==
X-Received: by 2002:a05:600c:4e01:b0:426:654e:16da with SMTP id 5b1f17b1804b1-42acd39e07cmr7246735e9.0.1724394820150;
        Thu, 22 Aug 2024 23:33:40 -0700 (PDT)
Received: from sunil-laptop ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abee8c2dbsm83828835e9.21.2024.08.22.23.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 23:33:39 -0700 (PDT)
Date: Fri, 23 Aug 2024 12:03:25 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev, Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Haibo Xu <haibo1.xu@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Subject: Re: [PATCH v8 08/17] ACPI: pci_link: Clear the dependencies after
 probe
Message-ID: <ZsgtNbBLfP3SygYv@sunil-laptop>
References: <20240812005929.113499-9-sunilvl@ventanamicro.com>
 <20240822214415.GA351762@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822214415.GA351762@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_233342_733219_01BD8A4A 
X-CRM114-Status: GOOD (  28.99  )
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

SGkgQmpvcm4sCgpPbiBUaHUsIEF1ZyAyMiwgMjAyNCBhdCAwNDo0NDoxNVBNIC0wNTAwLCBCam9y
biBIZWxnYWFzIHdyb3RlOgo+IE9uIE1vbiwgQXVnIDEyLCAyMDI0IGF0IDA2OjI5OjIwQU0gKzA1
MzAsIFN1bmlsIFYgTCB3cm90ZToKPiA+IFJJU0MtViBwbGF0Zm9ybXMgbmVlZCB0byB1c2UgZGVw
ZW5kZW5jaWVzIGJldHdlZW4gUENJIGhvc3QgYnJpZGdlLCBMaW5rCj4gPiBkZXZpY2VzIGFuZCB0
aGUgaW50ZXJydXB0IGNvbnRyb2xsZXJzIHRvIGVuc3VyZSBwcm9iZSBvcmRlci4gVGhlCj4gPiBk
ZXBlbmRlbmN5IGlzIGxpa2UgYmVsb3cuCj4gPiAKPiA+IEludGVycnVwdCBjb250cm9sbGVyIDwt
LSBMaW5rIERldmljZSA8LS0gUENJIEhvc3QgYnJpZGdlLgo+ID4gCj4gPiBJZiB0aGVyZSBpcyBu
byBkZXBlbmRlbmN5IGJldHdlZW4gTGluayBkZXZpY2UgYW5kIFBDSSBIb3N0IEJyaWRnZSwKPiA+
IHRoZW4gUENJIGRldmljZXMgbWF5IGJlIHByb2JlZCBwcmlvciB0byBMaW5rIGRldmljZXMuICBJ
ZiBhIFBDSQo+ID4gZGV2aWNlIGlzIHByb2JlZCBiZWZvcmUgaXRzIExpbmsgZGV2aWNlLCB3ZSB3
b24ndCBiZSBhYmxlIHRvIGZpbmQKPiA+IGl0cyBJTlR4IG1hcHBpbmcuCj4gCj4gVGhpcyBzZWVt
cyB0byBleHBsYWluIHdoeSB3ZSB3YW50IHRoZXNlIGRlcGVuZGVuY2llcywgd2hpY2ggaXMgdXNl
ZnVsLAo+IGJ1dCAqdGhpcyogcGF0Y2ggb25seSByZW1vdmVzIHRoZSBkZXBlbmRlbmNpZXMuCj4g
Cj4gTWF5YmUgdGhpcyBkZXNjcmlwdGlvbiBzaG91bGQgYmUgaW4gdGhlIHBhdGNoIHRoYXQgKmFk
ZHMqIHRoZQo+IGRlcGVuZGVuY2llcywgZS5nLiwgIkFDUEk6IFJJU0MtVjogSW1wbGVtZW50IGZ1
bmN0aW9uIHRvIGFkZCBpbXBsaWNpdAo+IGRlcGVuZGVuY2llcyI/Cj4KT2theS4gTGV0IG1lIG1v
dmUgdGhpcyB0byB0aGUgcGF0Y2ggeW91IHN1Z2dlc3RlZC4KIAo+ID4gU28sIGFkZCB0aGUgbGlu
ayBkZXZpY2UncyBISUQgdG8gZGVwZW5kZW5jeSBob25vciBsaXN0IGFuZCBjbGVhciB0aGUKPiA+
IGRlcGVuZGVuY3kgYWZ0ZXIgcHJvYmUgaXMgZG9uZSBzbyB0aGF0IHRoZSBkZXBlbmRlbnQgZGV2
aWNlcyBhcmUKPiA+IHVuYmxvY2tlZCB0byBwcm9iZS4KPiAKPiBUaGlzIHN0aWxsIGNsYWltcyB0
aGlzIHBhdGNoIGFkZHMgSElELCB3aGljaCBJIGRvbid0IHRoaW5rIGl0IGRvZXMuCj4KUGxlYXNl
IHNlZSBiZWxvdy4KIAo+ID4gU2lnbmVkLW9mZi1ieTogU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRh
bmFtaWNyby5jb20+Cj4gPiBUZXN0ZWQtYnk6IEJqw4PCtnJuIFTDg8K2cGVsIDxiam9ybkByaXZv
c2luYy5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2FjcGkvcGNpX2xpbmsuYyB8IDIgKysKPiA+
ICBkcml2ZXJzL2FjcGkvc2Nhbi5jICAgICB8IDEgKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvcGNpX2xpbmsu
YyBiL2RyaXZlcnMvYWNwaS9wY2lfbGluay5jCj4gPiBpbmRleCBhYTEwMzhiOGFlYzQuLmI3Mjdk
Yjk2OGYzMyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvYWNwaS9wY2lfbGluay5jCj4gPiArKysg
Yi9kcml2ZXJzL2FjcGkvcGNpX2xpbmsuYwo+ID4gQEAgLTc0OCw2ICs3NDgsOCBAQCBzdGF0aWMg
aW50IGFjcGlfcGNpX2xpbmtfYWRkKHN0cnVjdCBhY3BpX2RldmljZSAqZGV2aWNlLAo+ID4gIAlp
ZiAocmVzdWx0KQo+ID4gIAkJa2ZyZWUobGluayk7Cj4gPiAgCj4gPiArCWFjcGlfZGV2X2NsZWFy
X2RlcGVuZGVuY2llcyhkZXZpY2UpOwo+ID4gKwo+ID4gIAlyZXR1cm4gcmVzdWx0IDwgMCA/IHJl
c3VsdCA6IDE7Cj4gPiAgfQo+ID4gIAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9zY2Fu
LmMgYi9kcml2ZXJzL2FjcGkvc2Nhbi5jCj4gPiBpbmRleCAyOGEyMjFmOTU2ZDcuLjc1MzUzOWEx
ZjI2YiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvYWNwaS9zY2FuLmMKPiA+ICsrKyBiL2RyaXZl
cnMvYWNwaS9zY2FuLmMKPiA+IEBAIC04NjMsNiArODYzLDcgQEAgc3RhdGljIGNvbnN0IGNoYXIg
KiBjb25zdCBhY3BpX2hvbm9yX2RlcF9pZHNbXSA9IHsKPiA+ICAJIklOVEMxMENGIiwgLyogSVZT
QyAoTVRMKSBkcml2ZXIgbXVzdCBiZSBsb2FkZWQgdG8gYWxsb3cgaTJjIGFjY2VzcyB0byBjYW1l
cmEgc2Vuc29ycyAqLwo+ID4gIAkiUlNDVjAwMDEiLCAvKiBSSVNDLVYgUExJQyAqLwo+ID4gIAki
UlNDVjAwMDIiLCAvKiBSSVNDLVYgQVBMSUMgKi8KPiA+ICsJIlBOUDBDMEYiLCAgLyogUENJIExp
bmsgRGV2aWNlICovClRoaXMgaXMgdGhlIGNoYW5nZSB3aGljaCBJIG1lYW50IGFkZGluZyBISUQg
dG8gdGhlIGhvbm9yIGxpc3QuIERvIHlvdQpyZWNvbW1lbmQgdG8gbWFrZSB0aGlzIGNoYW5nZSBz
ZXBhcmF0ZSBwYXRjaCBzbyB0aGF0IGl0IGRvZXNuJ3QgY29uZnVzZQp3aXRoIGFkZGluZyBhIG5l
dyBISUQgdG8gdGhlIHByb2JlIG1hdGNoIHRhYmxlPwoKVGhhbmtzIQpTdW5pbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
