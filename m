Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FE5CD4F5F
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 11:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ftx9L8w8V8vyhBVRXTBfXtqsPdhTXmo0/PuUWmF/n8M=; b=NHbRmbf5BxMn+l
	eKaJVh/23YZdz7+3fD36j0D2sn4enT0TcaBUWipqpC/cjG+/2N+CYe+W9U7OSSUX05yifIIUp22ah
	qhd5XyJQ0C+j4pXaz1b48eB0S4TNyrinx2A6wmUjORlOx0DDjm77So2gxX8MR9wfiCgkIlGWfPGI7
	Wyg+3tGuVRWJRa5/l90stW2fip59Zo2q07ttwpRLnkYfmD4W+EWsAoTeE5ynPWH8xx9zrF9b4f4zn
	l+OdYnBH35olOwB15pxdxnA4Z+4TSbn8dcqddQ+tz9WTzGxJooAY3rNiYwL7KzYswKCHlUaiR56qq
	7S01WJLtmNv6KW3vFCTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjeXe-008yp8-2o;
	Fri, 22 Sep 2023 11:41:50 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjeXc-008ymv-0F
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 11:41:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1695382902;
	bh=9tS+t+9ne/achIv7oKXeD3phZJ7C1Jx1QC/gCOCkAJw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gF2j4UiOogzBDjYD8oxN34bmy2Sftbo+qN3LnAvHjAnvzN1+MgDs7xMhw8UaUvPfY
	 1ajoom+NH/l6RGptV5B8xBFQdGoGY1ApU8cN08XLoxhIECZ8jUPlZ4NMP6Eh7fqKOh
	 YIeRIyWmUAmLXdcNR82qk8nIsDbgmjGY3F088qbs=
Received: from [127.0.0.1] (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 271226599B;
	Fri, 22 Sep 2023 07:41:38 -0400 (EDT)
Message-ID: <c1a4a7ab5c68c00dd8b3bb249c0371dbb8bcb929.camel@xry111.site>
Subject: Re: [PATCH 0/6] RISC-V: Add eMMC support for TH1520 boards
From: Xi Ruoyao <xry111@xry111.site>
To: Drew Fustini <dfustini@baylibre.com>, Ulf Hansson
 <ulf.hansson@linaro.org>,  Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Adrian Hunter
 <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>,  Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,  Conor
 Dooley <conor@kernel.org>
Date: Fri, 22 Sep 2023 19:41:37 +0800
In-Reply-To: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
Autocrypt: addr=xry111@xry111.site; prefer-encrypt=mutual;
 keydata=mDMEYnkdPhYJKwYBBAHaRw8BAQdAsY+HvJs3EVKpwIu2gN89cQT/pnrbQtlvd6Yfq7egugi0HlhpIFJ1b3lhbyA8eHJ5MTExQHhyeTExMS5zaXRlPoiTBBMWCgA7FiEEkdD1djAfkk197dzorKrSDhnnEOMFAmJ5HT4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQrKrSDhnnEOPHFgD8D9vUToTd1MF5bng9uPJq5y3DfpcxDp+LD3joA3U2TmwA/jZtN9xLH7CGDHeClKZK/ZYELotWfJsqRcthOIGjsdAPuDgEYnkdPhIKKwYBBAGXVQEFAQEHQG+HnNiPZseiBkzYBHwq/nN638o0NPwgYwH70wlKMZhRAwEIB4h4BBgWCgAgFiEEkdD1djAfkk197dzorKrSDhnnEOMFAmJ5HT4CGwwACgkQrKrSDhnnEOPjXgD/euD64cxwqDIqckUaisT3VCst11RcnO5iRHm6meNIwj0BALLmWplyi7beKrOlqKfuZtCLbiAPywGfCNg8LOTt4iMD
User-Agent: Evolution 3.50.0 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_044148_123492_0D6CCB33 
X-CRM114-Status: GOOD (  19.25  )
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
Cc: devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, Jason Kridner <jkridner@beagleboard.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyMDIzLTA5LTIxIGF0IDE4OjQ5IC0wNzAwLCBEcmV3IEZ1c3Rpbmkgd3JvdGU6Cj4g
VGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgZU1NQyBvbiB0aGUgQmVhZ2xlViBBaGVh
ZCBhbmQgdGhlCj4gU2lwZWVkIExpY2hlZVBpIDRBLiBUaGlzIGFsbG93cyB0aGUga2VybmVsIHRv
IGJvb3Qgd2l0aCB0aGUgcm9vdGZzIG9uCj4gZU1NQy4KPiAKPiBJIHRlc3RlZCBvbiB0b3Agb2Yg
djYuNi1yYzIgd2l0aCB0aGlzIGNvbmZpZyBbMV0uIEkgd2FzIGFibGUgdG8gYm9vdAo+IGJvdGgg
dGhlIEFoZWFkIFsyXSBhbmQgTFBpNGEgWzNdIGZyb20gZU1NQy4gVGhlIGZvbGxvd2luZyBwcmVy
ZXF1aXNpdGVzCj4gYXJlIHJlcXVpcmVkOgo+IAo+IMKgIFtQQVRDSCB2Ml0gcmlzY3Y6IGR0czog
dGhlYWQ6IHNldCBkbWEtbm9uY29oZXJlbnQgdG8gc29jIGJ1cyBbNF0KPiAKPiBJIHB1c2hlZCBh
IGJyYW5jaCBbNV0gd2l0aCB0aGlzIHBhdGNoIHNlcmllcyBhbmQgdGhlIGFib3ZlIHBhdGNoIGZv
cgo+IHRob3NlIHRoYXQgZmluZCBhIGdpdCBicmFuY2ggZWFzaWVyIHRvIHRlc3QuCj4gCj4gUGxl
YXNlIG5vdGUgdGhhdCBvbmx5IHRoZSBNTUMgY29udHJvbGxlciBjb25uZWN0ZWQgdG8gdGhlIGVN
TUMgZGV2aWNlCj4gaXMgZW5hYmxlZCBpbiB0aGUgZGV2aWNlIHRyZWVzIGZvciB0aGVzZSB0d28g
Ym9hcmRzLiBJIGRpZCBub3QgeWV0Cj4gYXR0ZW1wdCB0byBjb25maWd1cmUgYW5kIHVzZSB0aGUg
bWljcm9TRCBjYXJkIHNsb3QuIE15IHByZWZlcmVuY2UgaXMgdG8KPiBhZGRyZXNzIHRoYXQgaW4g
YSBmdXR1cmUgcGF0Y2ggc2VyaWVzLgo+IAo+IFJlZmVyZW5jZXM6Cj4gWzFdIGh0dHBzOi8vZ2lz
dC5naXRodWIuY29tL3BkcDcvNWZiZGNmMmE2NWViMWFiZGQzYTI5ZDUxOWMxOWNkZDIKPiBbMl0g
aHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vcGRwNy85MWE4MDFhNWY4ZDEwNzBjNTM1MDllZGE5ODAw
YWQ3OAo+IFszXSBodHRwczovL2dpc3QuZ2l0aHViLmNvbS9wZHA3LzE0NDVjM2M5OTFlODhmZDY5
YzYwMTY1Y2VmNjU3MjZhCj4gWzRdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2
LzIwMjMwOTEyMDcyMjMyLjI0NTUtMS1qc3poYW5nQGtlcm5lbC5vcmcvCj4gWzVdIGh0dHBzOi8v
Z2l0aHViLmNvbS9wZHA3L2xpbnV4L3RyZWUvYjQvdGgxNTIwLW1tYwoKSSd2ZSB0ZXN0ZWQgdGhp
cyBicmFuY2ggYW5kIHN1Y2Nlc3NmdWxseSBib290ZWQgYSByb290ZnMgb24gTGljaGVlIFBpIDRB
CmVNTUMgd2l0aCByb290ZGVsYXk9MTAuCgpDdXJpb3VzbHkgaXMgdGhlcmUgc29tZSB3YXkgdG8g
bWFrZSBpdCB3b3JrIHdpdGhvdXQgcm9vdGRlbGF5PwoKRm9yIGV2ZXJ5dGhpbmcgZXhjZXB0ICJF
bmFibGUgQmVhZ2xlViBBaGVhZCBlTU1DIGNvbnRyb2xsZXIiOgoKVGVzdGVkLWJ5OiBYaSBSdW95
YW8gPHhyeTExMUB4cnkxMTEuc2l0ZT4KCi0tIApYaSBSdW95YW8gPHhyeTExMUB4cnkxMTEuc2l0
ZT4KU2Nob29sIG9mIEFlcm9zcGFjZSBTY2llbmNlIGFuZCBUZWNobm9sb2d5LCBYaWRpYW4gVW5p
dmVyc2l0eQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
