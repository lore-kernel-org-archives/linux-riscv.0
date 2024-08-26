Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5525C5472C
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 21:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zPAgvYL/bp2FEtn8QTsaqFT2+8X+VjonjOd+Bdg0oug=; b=wVTth4QFeIiXUO
	aTLXeA7h9w4mto7RN6rb97/TLUsD3aCPeS+euHVfu1eSUCNHIbPZbp7SqdyVEH+BYZ9/VmDTEFLo0
	mK6uLu9SG8r18aVUC4Eb23p5e00Qnur9RtPA/MLoRXGUPMimyvjdfryGXKEj4yNhvsz5A+4sUjv5/
	qIIykiXZNVnd2MBYzLlymCzYyjw4x1jp8dC6SG7VWfwEHWr1PYXZDrr3rUFeBR4huLS1GCQIrEaUd
	3NHYu8p8GcLplI62n4S/tIXb2C0lb4Ss6ug01qsZGKuCCcy27lVJ3vpFWRDTCTHdQ/RUBWbPAlPsr
	N7G/n2bOOkmc9H+VfpCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sih73-00000008moE-1URS;
	Mon, 26 Aug 2024 21:18:57 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sih5Y-00000008mLg-10KL;
	Mon, 26 Aug 2024 21:17:28 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1724707041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=43rARpIabmoF/X4nl2L65kxlo3pcBgpwUNSnL7OF7ag=;
	b=f+dwtiMZsAypPINdPYjJMSxRgqTYYkRX8/ijDCkQoPWJ6wCDNuvx/uJBedUE8MdqIizpaW
	+ZvQkcpLq2EeLwe0n7+8+6nBpIlb37VvRw0BGg6VbLv3/TFfOkuSw3rDzL/GHCPAt4dGVM
	BpcDb5jbzqkvlc2LyidGKMP9Y/3pbPqzRITxCECELeSY5iCO3IWvgZz6qgJSyHhqQeLlj/
	vR9aVou0rW9G+a0AHY0ts5BGt9szTX/5GCABfbiR1OSlFuljxNlnyzBkJUU7p14T39I67m
	jO0jpSZXLqjYHuIFE+mo/WAeZpv5nyUxPYntSviUx32hXz79XZ1pUxDhl1a70A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1724707041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=43rARpIabmoF/X4nl2L65kxlo3pcBgpwUNSnL7OF7ag=;
	b=SukSGpuFtbwIxx+NKHCHDL12zE+JC0KFepVFOj288ZMYr7Gjw3F/W6yQ7GQ9sQxNW/LIH4
	rx+3Wq+dLNzvGhDQ==
To: "Rafael J. Wysocki" <rafael@kernel.org>, Sunil V L
 <sunilvl@ventanamicro.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Len Brown
 <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Anup Patel
 <anup@brainfault.org>, Samuel Holland <samuel.holland@sifive.com>, Robert
 Moore <robert.moore@intel.com>, Conor Dooley <conor.dooley@microchip.com>,
 Haibo Xu <haibo1.xu@intel.com>, Andrew Jones <ajones@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Drew Fustini
 <dfustini@tenstorrent.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH v8 00/17] RISC-V: ACPI: Add external interrupt
 controller support
In-Reply-To: <CAJZ5v0hxoT9tBjm3xRPU4fHx3MgHfYAx_Vyf4oe2toa3GWAN+Q@mail.gmail.com>
References: <20240812005929.113499-1-sunilvl@ventanamicro.com>
 <ZrlgVUXC_dCW9ISM@sunil-laptop> <87mskzcnmf.ffs@tglx>
 <CAJZ5v0imJcU4cwDuZKEvGf93fZm4ea4s2Ocp3Cnfb3+nBQ0-Gg@mail.gmail.com>
 <Zsy3o_N8hvc6GfTp@sunil-laptop>
 <CAJZ5v0hxoT9tBjm3xRPU4fHx3MgHfYAx_Vyf4oe2toa3GWAN+Q@mail.gmail.com>
Date: Mon, 26 Aug 2024 23:17:20 +0200
Message-ID: <87jzg3c7bz.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_141724_441470_8B88BD94 
X-CRM114-Status: GOOD (  10.03  )
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

T24gTW9uLCBBdWcgMjYgMjAyNCBhdCAxOToyNywgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4g
T24gTW9uLCBBdWcgMjYsIDIwMjQgYXQgNzoyMuKAr1BNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPj4gVGhlcmUgd2lsbCBiZSBhIGNvbmZsaWN0IGluIFBMSUMg
aXJxY2hpcCBkcml2ZXIgZHVlIHRvIGEgcmVjZW50IHBhdGNoIFsxXS4KPj4gVGhpcyBwYXRjaCBp
cyBub3QgaW4gbGF0ZXN0IFJDNSByZWxlYXNlIGJ1dCBpbiBsaW51eC1uZXh0LiBJIHVzdWFsbHkg
YmFzZSB0aGUKPj4gc2VyaWVzIG9uIGxhdGVzdCBSQyByZWxlYXNlLiBTaG91bGQgSSByZWJhc2Ug
dG8gbGludXgtbmV4dCBpbiB0aGlzIGNhc2UKPj4gYW5kIHNlbmQgdGhlIG5leHQgcmV2aXNpb24g
b2YgdGhlIHNlcmllcyByZXNvbHZpbmcgdGhlIGNvbmZsaWN0Pwo+Cj4gTm8sIHBsZWFzZSBkb24n
dC4KPgo+IFRoYXQgd2lsbCBiZSByZXNvbHZlZCBhdCB0aGUgbWVyZ2UgdGltZS4KCkFsdGVybmF0
aXZlbHkgeW91IGNhbiBwdWxsCgogIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC90aXAvdGlwLmdpdCBpcnEtdXJnZW50LTIwMjQtMDgtMjUKCndoaWNoIEknbSBh
Ym91dCB0byBzZW5kIHRvIExpbnVzIGxhdGVzdCB0b21vcnJvdyBtb3JuaW5nLiBUaGF0IGNvbnRh
aW5zCnRoZSBjb25mbGljdGluZyBjaGFuZ2UuCgpUaGFua3MsCgogICAgICAgIHRnbHgKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
