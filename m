Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97770C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 14:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UEBknyCKaexbcjwgAGf6aPnecEgWi86WPF+oYmgg1lo=; b=h+lpcl5WQWUQea
	hooN4RNa+6K/a/NEug9SUtz4HFJXgCJjaBT11GD8V1wXOCvPK2PEHXIvTK2rcwic4cQhqtWxsWlVs
	TU6ps0l96sf1Or/VKBhmWW11yZ04KweGguKTM1LSvFJZg6q41cSxVEpHzEbIRmQLpI5WQxwvKdVNj
	53fTe7qKXUvaNWnRfgR2UBYOBSGfm8/olRT1xW1F3MSLzSfIW08tXQjLecFli1DuWlvHqmLkPjTzo
	iBZPMVsdMJlgUXTySz67MB7sAFG0ZWAiSkNUTby/FAO/h1tiQPMjjIUKywE5dgbX0LIjTj6sji8UC
	Q5lYnseC7nnCm+nTOSPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT21v-00Ecib-3Q; Fri, 17 Feb 2023 14:48:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT21s-00EchX-Jx
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 14:48:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EAC8861C3C;
	Fri, 17 Feb 2023 14:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC67C433EF;
	Fri, 17 Feb 2023 14:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676645283;
	bh=NvyEGpHyytRm8bP4ci9/gCEmD/ZBBVaXW612yQ9oNw8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TECzWnZ4KS4UYQ/mvftfOJxSiK7zpyuaEum1nFkITAbXBoOU3si2SOWOW5ONtYO+Z
	 1TUy+bZtBMcawGqljtMtiYsBvxqzU/XB8BWYqpLe8um8TzoDb1UDP+ZAUIU0A/q+ud
	 ovotTYkp/zrEgAVgtnsrUqzsSYVsP3MSJjIejcgaC0EF85CV2xjVadwng2qWKcJlsL
	 kvw1k6dCW4xkNM0RuVshxLT72VACCPGZaXFmrC8lAm0Lho55kaDLibUc6Ny5s8gmpD
	 +XPf2YQ5Jgu/dH4eyqGCaeiVLZylgPLkafifT9zf6elkx6dtPWfcgGK7t7kMIaqUGg
	 iakJzWYHMklog==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet
 <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
 <conor@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v4 0/1] riscv: Allow to downgrade paging mode from the
 command line
In-Reply-To: <20230131151115.1972740-1-alexghiti@rivosinc.com>
References: <20230131151115.1972740-1-alexghiti@rivosinc.com>
Date: Fri, 17 Feb 2023 15:48:00 +0100
Message-ID: <87sff4mjq7.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_064804_716259_8C00B313 
X-CRM114-Status: GOOD (  14.96  )
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

QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IFRoaXMg
bmV3IHZlcnNpb24gZ2V0cyByaWQgb2YgdGhlIGxpbWl0YXRpb24gdGhhdCBwcmV2ZW50ZWQgS0FT
QU4ga2VybmVscwo+IHRvIHVzZSB0aGUgbmV3bHkgaW50cm9kdWNlZCBwYXJhbWV0ZXJzLgo+Cj4g
V2hpbGUgbG9va2luZyBpbnRvIEtBU0xSLCBJIGZlbGwgb250byBjb21taXQgYWFjZDE0OWI2MjM4
ICgiYXJtNjQ6IGhlYWQ6Cj4gYXZvaWQgcmVsb2NhdGluZyB0aGUga2VybmVsIHR3aWNlIGZvciBL
QVNMUiIpOiBpdCBhbGxvd3MgdG8gdXNlIHRoZSBmZHQKPiBmdW5jdGlvbnMgdmVyeSBlYXJseSBp
biB0aGUgYm9vdCBwcm9jZXNzIHdpdGggS0FTQU4gZW5hYmxlZCBieSBzaW1wbHkKPiBjb21waWxp
bmcgYSBuZXcgdmVyc2lvbiBvZiB0aG9zZSBmdW5jdGlvbnMgd2l0aG91dCBpbnN0cnVtZW50YXRp
b24uCj4KPiBJIGhhZCB0byBjaGFuZ2UgdGhlIGhhbmRsaW5nIG9mIHRoZSBjb21tYW5kIGxpbmUg
cGFyc2luZyB0byBtYWtlIHRoZQo+IGNvZGUgc2VsZi1jb250YWluZWQgaW4ga2VybmVsL3BpL2Nt
ZF9lYXJseS5jIHRvIGF2b2lkIGNhbGxpbmcgdG9vIG1hbnkKPiBfX3BpIHByZWZpeGVkIGZ1bmN0
aW9ucyBmcm9tIG91dHNpZGUgdGhpcyBmaWxlLgo+Cj4gSSdsbCB1c2UgdGhpcyBhcHByb2FjaCBs
aWtlIGFybTY0IHRvIGhhbmRsZSB0aGUgZXh0cmFjdGlvbiBvZiB0aGUgcmFuZG9tCj4gc2VlZGkg
ZnJvbSB0aGUgZGV2aWNlIHRyZWUgZm9yIEtBU0xSLgo+Cj4gQEFyZDogSSBjb3BpZWQgdGhlICJw
aSIgbmFtZSBidXQgSSBoYXZlIHRvIGFkbWl0IEkgZG9uJ3Qga25vdyB3aGF0IGl0Cj4gbWVhbnMu
CgpfX3BpXyBpcyBmb3IgInBvc2l0aW9uLWluZGVwZW5kZW50IiAtLSBLQVNMUiByZWxhdGVkLgoK
Rm9yIHRoZSAodGlueSA7LSkpIHNlcmllczoKClRlc3RlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympv
cm5Acml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3Np
bmMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
