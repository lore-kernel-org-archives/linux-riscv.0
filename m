Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39452C369DC
	for <linux-riscv@archiver.kernel.org>; Thu,  1 May 2025 20:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=43crAsAP+T0M4Mt4zfAL+FfsewmGTsCx4E1OvXFdQ3Y=; b=I2mnb5UPUCeoB1
	CeJyKX78Mj6cGnj0Im9JBKr/IPsXp5cB9XrolESzhxPD6epT1I/4Tv5gJnGTgqrDWOE939H+lOpUQ
	zsQGTtzZjMGP/7RJpQ63kviw4pIJKqdbfEAsQF8hAwpKL6o1clwVM8XKUL87hope60BX8rIYOVq/G
	FFuzJp/mUT4zzOL49/P6tvXIEf//3acDhj/LmOeVdkHfLLQRA7hRUrYNNiQzIwWrOfiSnqPKguo2Y
	98hE6WD0mGciv1n6t46l3mo32cpzbP0ISga2YoEeTagepB6iIgkp7LFhpo60aWql3CD259QYeLn+I
	ure5EbbcpAArOXRl6LeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAaiz-0000000Gdoo-2FCZ;
	Thu, 01 May 2025 20:41:41 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAaiw-0000000GdkG-0pd7
	for linux-riscv@lists.infradead.org;
	Thu, 01 May 2025 20:41:40 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id AA78F92009C; Thu,  1 May 2025 22:41:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id A33F492009B;
	Thu,  1 May 2025 21:41:31 +0100 (BST)
Date: Thu, 1 May 2025 21:41:31 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: =?UTF-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>
cc: Peter Zijlstra <peterz@infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
    "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
    open list <linux-kernel@vger.kernel.org>, 
    "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
    "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
    Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Shuah Khan <shuah@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, 
    Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH 1/5] riscv: misaligned: factorize trap handling
In-Reply-To: <6e2ed6a9-aed0-4727-b1e3-903d3a7751b5@rivosinc.com>
Message-ID: <alpine.DEB.2.21.2505012126250.31828@angie.orcam.me.uk>
References: <20250414123543.1615478-1-cleger@rivosinc.com> <20250414123543.1615478-2-cleger@rivosinc.com> <ba11b910-9959-4845-b3a3-dd9a52466823@ghiti.fr> <2c4f4422-d9c9-4d36-b0ef-f68779b91ee9@rivosinc.com> <20250422094419.GC14170@noisy.programming.kicks-ass.net>
 <6e2ed6a9-aed0-4727-b1e3-903d3a7751b5@rivosinc.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_134138_402207_1CCDF0CC 
X-CRM114-Status: GOOD (  14.08  )
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

T24gVHVlLCAyMiBBcHIgMjAyNSwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgoKPiA+IHg4NiBtb3N0
bHkgZG9lcyB0aGUgZmlyc3QsIGFueSB0cmFwIHRoYXQgY2FuIGhhcHBlbiB3aXRoIElSUXMgZGlz
YWJsZWQKPiA+IGlzIHRyZWF0ZWQgdW5jb25kaXRpb25hbGx5IGFzIE5NSSBsaWtlLiBUaGUgb2J2
aW91cyBleGNlcHRpb24gaXMKPiA+IHBhZ2UtZmF1bHQsIGJ1dCB0aGF0IGFscmVhZHkgaGFzIGEg
ZnJvbS1ub24tcHJlZW1wdGlibGUtY29udGV4dCBicmFuY2gKPiA+IHRoYXQgaXMgJ2NhcmVmdWwn
Lgo+ID4gCj4gPiBBcyB0byB1bmFsaWduZWQgdHJhcHMgZnJvbSBrZXJuZWwgc3BhY2UsIEkgd291
bGQgaW1hZ2luZSB0aGV5IG1vc3RseSBCVUcKPiA+IHRoZSBrZXJuZWwsIGV4Y2VwdCB3aGVuIHRo
ZXJlJ3MgYW4gZXhjZXB0aW9uIGVudHJ5IGZvciB0aGF0IGxvY2F0aW9uLCBpbgo+ID4gd2hpY2gg
Y2FzZSBpdCBtaWdodCBkbyBhIGZpeHVwPwo+IAo+IFRoZSBtaXNhbGlnbmVkIGFjY2VzcyBleGNl
cHRpb24gaGFuZGxpbmcgY3VycmVudGx5IGhhbmRsZXMgbWlzYWxpZ25lZAo+IGFjY2VzcyBmb3Ig
dGhlIGtlcm5lbCBhcyB3ZWxsIChleGNlcHQgaWYgZXhwbGljaXRseSBkaXNhYmxlZCkuCgogSXQn
cyBjdXJyZW50bHkgbm90IGNsZWFyIHRoYXQgYSBrZXJuZWwgbW9kZSB1bmFsaWduZWQgYWNjZXNz
IGlzIGluZGVlZCBhIApidWcsIGFzIHNvbWUgbmV0d29yayBwcm90b2NvbCBzdGFja3MgbWF5IHN0
aWxsIHJlbHkgb24gdW5hbGlnbmVkIGFjY2Vzc2VzIApmb3IgcGVyZm9ybWFuY2UgcmVhc29ucyBm
b3IgdGhlIHJlZ3VsYXIgY2FzZSB3aGVyZSBuZXR3b3JrIGhlYWRlcnMgZG8gY29tZSAKb3V0IGFs
aWduZWRbMV1bMl0uCgogSG9wZWZ1bGx5IG5vdCBpbiB0aGUgaGFyZGlycSBjb250ZXh0IHRob3Vn
aCwgYW5kIHRoZSB1c3VhbCBhcHByb2FjaCBpcyB0byAKa2VlcCBpbnRlcnJ1cHRzIGRpc2FibGVk
IGluIHRoZSBlbXVsYXRpb24gcGF0aCBpZiBhcnJpdmluZyBmcm9tIHRoZSBrZXJuZWwgCm1vZGUg
YXMgd2UgZG9uJ3QgZXhwZWN0IGtlcm5lbCBjb2RlIHRvIGJlIGV2ZXIgcGFnZWQgb3V0ICh0aGUg
c2FtZSBhcHBsaWVzIAp0byBhbGwga2luZHMgb2YgbWFjaGluZSBpbnN0cnVjdGlvbiBlbXVsYXRp
b24pLgoKUmVmZXJlbmNlczoKClsxXSAiVENQIFNZTnMgYnJva2VuIGluIDIuMy40MSIsIAogICAg
PGh0dHBzOi8vbWFyYy5pbmZvLz9sPWxpbnV4LWtlcm5lbCZtPTk0OTI3Njg5OTI5NDYzPgoKWzJd
ICJBbHBoYTogRW11bGF0ZSB1bmFsaWduZWQgTER4X0wvU1R4X0MgZm9yIGRhdGEgY29uc2lzdGVu
Y3kiLCAKICAgIDxodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzg3djdyZDhoOTkuZnNmQGVt
YWlsLmZyb3dhcmQuaW50LmViaWVkZXJtLm9yZy8+CgogSFRILAoKICBNYWNpZWoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
