Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB38D132A2
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 10:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8G2kwdOVk3y+ifq44w6mZewL9PXaB0fxcVhoHxUcPpk=; b=NEQIwGhiq0p1+c
	1dP6njLTNAa+FKDGGjcdGxOdSNCN/hXcMIRDJO8eGQO3U0UsnX2GdI8Rj90wonG0AXYbboZG7rEU3
	0D2mmFYx1NysN+A3fiJsHB3IZYYliXdbfW3RAP0YKcYTa0SULzM2jsSUKdcxiW4ZPXG/S2zKfYJwM
	Q1PpEebLrOFIQPqiuOozqNdghku4OK4bKxgBxEavSUrVYdR4uBT9JE8Q5f/PoHQGj5yhlcecTsN1L
	d/7HPjTgjh3Sf4QTOsWKYquytF7nZPYlg1ychS3EJNe3q/dpUpL8YIy9+OMoe1UR7tj4A9XdgUpNV
	ATWBNNjufpIgyG1VngJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7u57-0000000DHIS-3Fzf;
	Mon, 04 Nov 2024 10:13:09 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7txF-0000000DFdo-3Qcl
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 10:05:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B85F71BF209;
	Mon,  4 Nov 2024 10:04:56 +0000 (UTC)
Message-ID: <a48514dc-6fe0-4f06-a5ee-10b1cf0f55e1@ghiti.fr>
Date: Mon, 4 Nov 2024 11:04:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 1/2] libbpf: Add missing per-arch include path
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Mykola Lysenko <mykolal@fb.com>, bpf@vger.kernel.org, netdev@vger.kernel.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Charlie Jenkins <charlie@rivosinc.com>
References: <20240927131355.350918-1-bjorn@kernel.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240927131355.350918-1-bjorn@kernel.org>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_020502_130057_64527D51 
X-CRM114-Status: GOOD (  11.80  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQmpvcm4sCgpPbiAyNy8wOS8yMDI0IDE1OjEzLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IEZy
b206IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPgo+IGxpYmJwZiBkb2VzIG5v
dCBpbmNsdWRlIHRoZSBwZXItYXJjaCB0b29scyBpbmNsdWRlIHBhdGgsIGUuZy4KPiB0b29scy9h
cmNoL3Jpc2N2L2luY2x1ZGUuIFNvbWUgYXJjaGl0ZWN0dXJlcyBkZXBlbmQgdGhvc2UgZmlsZXMg
dG8KPiBidWlsZCBwcm9wZXJseS4KPgo+IEluY2x1ZGUgdG9vbHMvYXJjaC8kKFNVQkFSQ0gpL2lu
Y2x1ZGUgaW4gdGhlIGxpYmJwZiBidWlsZC4KPgo+IEZpeGVzOiA2ZDc0ZDE3OGZlNmUgKCJ0b29s
czogQWRkIHJpc2N2IGJhcnJpZXIgaW1wbGVtZW50YXRpb24iKQo+IFNpZ25lZC1vZmYtYnk6IEJq
w7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgIHRvb2xzL2xpYi9icGYv
TWFrZWZpbGUgfCAzICsrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYi9icGYvTWFrZWZpbGUgYi90b29s
cy9saWIvYnBmL01ha2VmaWxlCj4gaW5kZXggMWIyMmYwZjM3Mjg4Li44NTdhNWY3YjQxM2QgMTAw
NjQ0Cj4gLS0tIGEvdG9vbHMvbGliL2JwZi9NYWtlZmlsZQo+ICsrKyBiL3Rvb2xzL2xpYi9icGYv
TWFrZWZpbGUKPiBAQCAtNjEsNyArNjEsOCBAQCBpZm5kZWYgVkVSQk9TRQo+ICAgZW5kaWYKPiAg
IAo+ICAgSU5DTFVERVMgPSAtSSQob3IgJChPVVRQVVQpLC4pIFwKPiAtCSAgIC1JJChzcmN0cmVl
KS90b29scy9pbmNsdWRlIC1JJChzcmN0cmVlKS90b29scy9pbmNsdWRlL3VhcGkKPiArCSAgIC1J
JChzcmN0cmVlKS90b29scy9pbmNsdWRlIC1JJChzcmN0cmVlKS90b29scy9pbmNsdWRlL3VhcGkg
XAo+ICsJICAgLUkkKHNyY3RyZWUpL3Rvb2xzL2FyY2gvJChTUkNBUkNIKS9pbmNsdWRlCj4gICAK
PiAgIGV4cG9ydCBwcmVmaXggbGliZGlyIHNyYyBvYmoKPiAgIAo+Cj4gYmFzZS1jb21taXQ6IGRi
NWNhMjY1ZTMzMzRiNDhjNGUzZmEwN2VlZjc5ZThiYzU3OGM0MzAKCgpZb3UgY2FuIGFkZDoKClRl
c3RlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgoKVGhhbmtz
LAoKQWxleAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
