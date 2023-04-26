Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B39C77B78
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 16:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJzdKxbjyPk7Y16ZuM/A/PN6tgl1ezXesc0Hv1Dbdvg=; b=Ns74l+l/zShbZ4
	6aAIvCrk70ZCxGjqjDdfOdbpvwtLo9o4Lux602X8lNJuc+TeZx4hhLbEBMjlDxzc/Myc1i6rEZbcG
	elvQ26F30jvwKU+HYnpEaW7V6DRpQPGyfCAE+j/2akxhk14upG7piyH9FFeCmAFEzgIaXxFc/laQm
	GHCnHl0qTgz2W2hHgLKcKxc2pTsFAf0A6nMXgDD1+B6GjiQsvxhtEtwKs2aHqHuGWxyVmn0TmO0yA
	nydxsfq1JLBf7CvFjHSmQ6koY6Ps13uBX4VexHDwnn8t3LBr4bluxMJKHkLnxWe9rSbT9oS+49r0+
	1uS7paUIV596c8U7gT+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1priIk-004REF-00;
	Wed, 26 Apr 2023 16:47:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1priIh-004RCS-39
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 16:47:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8C06363773;
	Wed, 26 Apr 2023 16:47:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60921C433EF;
	Wed, 26 Apr 2023 16:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682527644;
	bh=LQIlZBXyvbpRW/w7bY9aSuiYQzw21Inh3Gti8/6IHO0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sKZvNectox1rW/0Kt+dYBwGPPJyiXg/4k6NvGpRI/m3H/I1ZyTCgo54bLncGXM15x
	 1AQ5mmloG8jT8XJd8KasLmwdRAm0lFLwFMG9Io4HoxUyA0rqXdOlBXI2zrxNazX81q
	 WKgBJBQ6k/Peg/xD7UpueXtlG1s4ySQovbI/kAsmeZAOEU2+nZQBXhZJPyj4ph2Sfe
	 ajKQQm31OtiPNfdz33ot6Y5A8HBt3UNngT3WVqjDNLSpv0L7cYv8dJhTI+f7bqnZZ6
	 DLunByvUsKVa91qD51NoR05GAJDp/UH86hcoNCzQYq4g6dMPlRBqmsSU8gSMCH5uPM
	 G4gwU3FQgRP/w==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-acpi@vger.kernel.org, linux-crypto@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V4 05/23] ACPI: OSL: Make should_use_kmap() 0 for RISC-V
In-Reply-To: <20230404182037.863533-6-sunilvl@ventanamicro.com>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-6-sunilvl@ventanamicro.com>
Date: Wed, 26 Apr 2023 18:47:20 +0200
Message-ID: <87a5yua8vb.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_094728_105719_59BD54F7 
X-CRM114-Status: GOOD (  13.43  )
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
Cc: Weili Qian <qianweili@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>, Herbert Xu <herbert@gondor.apana.org.au>, Tom Rix <trix@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Nick Desaulniers <ndesaulniers@google.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

U3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+IHdyaXRlczoKCj4gV2l0aG91dCB0
aGlzLCBpZiB0aGUgdGFibGVzIGFyZSBsYXJnZXIgdGhhbiA0SywKPiBhY3BpX21hcCgpIHdpbGwg
ZmFpbC4KPgo+IFNpZ25lZC1vZmYtYnk6IFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8u
Y29tPgo+IEFja2VkLWJ5OiBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsLmoud3lzb2NraUBpbnRl
bC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvYWNwaS9vc2wuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9hY3BpL29zbC5jIGIvZHJpdmVycy9hY3BpL29zbC5jCj4gaW5kZXggMzI2OWE4ODhmYjdhLi5m
NzI1ODEzZDBjY2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9hY3BpL29zbC5jCj4gKysrIGIvZHJp
dmVycy9hY3BpL29zbC5jCj4gQEAgLTI3Niw3ICsyNzYsNyBAQCBhY3BpX21hcF9sb29rdXBfdmly
dCh2b2lkIF9faW9tZW0gKnZpcnQsIGFjcGlfc2l6ZSBzaXplKQo+ICAJcmV0dXJuIE5VTEw7Cj4g
IH0KPiAgCj4gLSNpZiBkZWZpbmVkKENPTkZJR19JQTY0KSB8fCBkZWZpbmVkKENPTkZJR19BUk02
NCkKPiArI2lmIGRlZmluZWQoQ09ORklHX0lBNjQpIHx8IGRlZmluZWQoQ09ORklHX0FSTTY0KSB8
fCBkZWZpbmVkKENPTkZJR19SSVNDVikKPiAgLyogaW9yZW1hcCB3aWxsIHRha2UgY2FyZSBvZiBj
YWNoZSBhdHRyaWJ1dGVzICovCj4gICNkZWZpbmUgc2hvdWxkX3VzZV9rbWFwKHBmbikgICAwCgpB
biBvYnNlcnZhdGlvbiwgd2hpY2ggY2FuIGJlIGFkZHJlc3NlZCBsYXRlcjsgVGhlIGFjcGlfb3Nf
aW9yZW1hcCgpCihjYWxsZWQgd2hlbiB0aGUgY29uZmlnIGFib3ZlIGlzIGVuYWJsZWQgZm9yIFJW
KSwgZG9lcyBub3QgaGF2ZSBhbiBhcmNoCnNwZWNpZmljIGltcGxlbWVudGF0aW9uIGZvciBSSVND
LVYuIFRoZSBnZW5lcmljIG9uZSBjYWxscwppb3JlbWFwX2NhY2hlZCgpLCB3aGljaCBvbiBSSVND
LVYgZGVmYXVsdHMgdG8gaW9yZW1hcCgpIC0tIGNhY2hpbmcKZGlzYWJsZWQvX1BBR0VfSU8uCgpU
aGF0IGlzIHByb2JhYmx5IG5vdCB3aGF0IHdlIHdhbnQsIGJ1dCByYXRoZXIgc29tZXRoaW5nIHNp
bWlsYXIgdGhhdAphcm02NCBkb2VzLgoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
