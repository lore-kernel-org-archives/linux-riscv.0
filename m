Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB815C00A8F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 11:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a1yeWz5mK0UlIwLUa4V3l8qePXQRrleXDLqsKwMukuI=; b=2tqLtNZOVOK9QE
	4Elf/9SJ22mLyo3GyTEm9fQtp8+nLuL21FwMMliG+1/6AdTPa7iDb9ls3haQNqDqJ2b/LHEe6ckpu
	8wNyD3YRYmb2Gf7oB7CsNmDB04Q0BZg5+uX3vqJoMPwjD+z7ojjqMEcf1KBMz5GVMxICANWUiVjMT
	ojdWCh7UeHjWrg/Y7HxPuHlQPOKwktTxANifYQg8G1bDkPL1RQ1pjpL/Pkx6BpFRLnIThoLL4QC7B
	BTLrKJLEzcpp/nWZfDDyh54YpRIFmKa6uAHeB0fuPMx1h/QuaSvUgSSB9pGEyfDBsDZfvpK0ze6i5
	XQ0fefo/djvQ4Rk3SGDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvG0V-009hAY-0x;
	Tue, 24 Oct 2023 11:55:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvG0S-009h9W-2B
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 11:55:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id AF778B811FC;
	Tue, 24 Oct 2023 11:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56BB9C433C7;
	Tue, 24 Oct 2023 11:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698148529;
	bh=ozsPNKeRYz2u0iELn3HbnuXXLgIDYAVxNBxhsn13OoU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gp/kARWkeQCvZcJG51906PXhGlm2ymUqGxZ0YpevWlinAhdCJ8ccWWJ7UI4/r3z8E
	 OT35Ycq8hze2eR21Dv7CifcmXJLQc9h4N6Sq0e4Zw0ZMVpVaIepz36MdvFlEOLwlq+
	 DELIVmHBREeVxPD7McDdYBrugbGj0anqLa5spDHY+qD6QF4kT6RLBWgH36psqrk3YV
	 NdWiQY5wlw126R6bLEx8scnNL4MiJHILywR1lCcJYKWG0+I33zpgAD5OrNu4MXEkHI
	 4+Gho6kZkaMG7wsX6BgCqV/mBP/OwPToli+7r+LluAlsSOtTc0olHSUos3ayccLada
	 LvtEhPyprQBTg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas
 Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v11 01/14] RISC-V: Don't fail in
 riscv_of_parent_hartid() for disabled HARTs
In-Reply-To: <20231023172800.315343-2-apatel@ventanamicro.com>
References: <20231023172800.315343-1-apatel@ventanamicro.com>
 <20231023172800.315343-2-apatel@ventanamicro.com>
Date: Tue, 24 Oct 2023 13:55:24 +0200
Message-ID: <87h6mgs09f.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_045532_885948_502203BC 
X-CRM114-Status: GOOD (  10.14  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyaXRlczoKCj4gVGhlIHJpc2N2
X29mX3Byb2Nlc3Nvcl9oYXJ0aWQoKSB1c2VkIGJ5IHJpc2N2X29mX3BhcmVudF9oYXJ0aWQoKSBm
YWlscwo+IGZvciBIQVJUcyBkaXNhYmxlZCBpbiB0aGUgRFQuIFRoaXMgcmVzdWx0cyBpbiB0aGUg
Zm9sbG93aW5nIHdhcm5pbmcKPiB0aHJvd24gYnkgdGhlIFJJU0MtViBJTlRDIGRyaXZlciBmb3Ig
dGhlIEUtY29yZSBvbiBTaUZpdmUgYm9hcmRzOgo+Cj4gWyAgICAwLjAwMDAwMF0gcmlzY3YtaW50
YzogdW5hYmxlIHRvIGZpbmQgaGFydCBpZCBmb3IgL2NwdXMvY3B1QDAvaW50ZXJydXB0LWNvbnRy
b2xsZXIKPgo+IFRoZSByaXNjdl9vZl9wYXJlbnRfaGFydGlkKCkgaXMgb25seSBleHBlY3RlZCB0
byByZWFkIHRoZSBoYXJ0aWQgZnJvbQo+IHRoZSBEVCBzbyB3ZSBzaG91bGQgZGlyZWN0bHkgY2Fs
bCBvZl9nZXRfY3B1X2h3aWQoKSBpbnN0ZWFkIG9mIGNhbGxpbmcKPiByaXNjdl9vZl9wcm9jZXNz
b3JfaGFydGlkKCkuCj4KPiBGaXhlczogYWQ2MzVlNzIzZTE3ICgicmlzY3Y6IGNwdTogQWRkIDY0
Yml0IGhhcnRpZCBzdXBwb3J0IG9uIFJWNjQiKQoKUGF0Y2ggMSBhbmQgMzogVGhlc2UgZml4ZXMg
YXJlIHN0YW5kIGFsb25lLCBhbmQgZG9lc24ndCBoYXZlIHRvIGJlIHBhcnQKb2YgdGhlIHNlcmll
cy4KCldvdWxkbid0IGl0IGJlIGJldHRlciB0byBwdWxsIHRoZXNlIG91dCBvZiB0aGUgbG9uZy1n
b2luZyBzZXJpZXMsIGFuZAp0cnkgdG8gZ2V0IGluIHRoZSBmaXhlcyBBU0FQPwoKCkJqw7ZybgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
