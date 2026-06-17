Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426A6CD98E2
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 16:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ELVD+Blgm+Xr9GiTLHEWFoPoRv2s42x8EmmTYkFNp0=; b=W4n2RkvHnd+2tc
	RPIjHfhA6LYt/JhgmVMvLrGm2sxsYQF5JBKzaZ3CUh7qpduJbZIXkK3GAY+dMHzo+gwPrsSbhVsS4
	qtS5/scZS3rpu3avAqlg4Cz7/oRdbneP9rNrZXJ8eP3LUxAivxE5wRBTMYK4t6N3xf8kdup+ugSGs
	tQU1D2gSDLF2x9fJhyArHkIsW+lBF59RnSDsZ1tnet/hbyJPmEULsrMoseK1Z6SZSzQgX8wN+mYb4
	9QfYpJtWhU867agHRHjY3Sc3+fs2Y+B9ZN+ruM0O/Jya+LYLCubd2d3QxaNKdNNugO5fmB1VSap6q
	kvWLM7BwkTopUNcZPa8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZt3f-000000002fj-2awm;
	Wed, 17 Jun 2026 16:24:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZt3e-000000002fU-43wh
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jun 2026 16:24:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FB7144571
	for <linux-riscv@lists.infradead.org>; Wed, 17 Jun 2026 16:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C12A1F0155A
	for <linux-riscv@lists.infradead.org>; Wed, 17 Jun 2026 16:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781713446;
	bh=zMJYW7kydDNazx6Bw8WOjSZJ6u/oUi3gTX3Va1528So=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MOR2lfBeN2RIn7jidVM9OeG+FF7V0TqgjpoT2WvaLwERStdMbbrSXWyKG6CA9MEon
	 VaTzfT1OJmZrkiPTojVW+6LRRKfD4rIagctXhFK2PO43sOhvXSA9CMB3U+jXU1sqSP
	 p1LQlxeU1yiWjlWISY6AzrHY6PslS7HtPpd3UkF/EseVniP3hd9p2Y+iiew0d1DCoJ
	 K0UL49YrZazSDGL7TCVwBjVQeKRq8qrt5zanKMICmjOjfIB+ZvygZNdIroQRGE6s55
	 KJyOfuLedp2aVqxC6HDlCmxiN3sfuPE6lj5Ldsl1xYLoShQs7Wfp65JItcVpOk11V+
	 yBND4yZOfnXDQ==
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4905529b933so59981265e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jun 2026 09:24:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8bMOghOLlRAbfiJb5HzCbAdeOMBd42+eAxqRV7rECczTvjuFblUQFZQPHY5rbPxosKbgC1H1QUqKKCPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0o4AE+dNZnyDWelXEf2AixTyL3999Wp7Qg0GYP9I0ZytmBwEf
	lL17QlCJAU5/w8v178ti7SEvFKi52aAb/eWQV7NMzDk8c3gMvSWQzI+npr6Rx584TZHKkJ5OYNn
	bub6CfBmhnOF0ebTXEERtEVfP7rWUxiw=
X-Received: by 2002:a05:600c:a30c:b0:488:b187:3c with SMTP id
 5b1f17b1804b1-492333bf7bamr73511495e9.14.1781713444838; Wed, 17 Jun 2026
 09:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
 <20260615123821.373248-1-guoren@kernel.org> <20260616113651.1048a19a@pumpkin>
 <CAJF2gTTh1zyAZkKt7AQNZptG_H=-8xSum6PVTyxEmw23pN6-9g@mail.gmail.com> <20260616205147.6aa7df98@pumpkin>
In-Reply-To: <20260616205147.6aa7df98@pumpkin>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 18 Jun 2026 00:24:12 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTCLKCnTcY=K9hsepRgKwDRXqg5eqJBPxBPqTp98zqFKw@mail.gmail.com>
X-Gm-Features: AVVi8Cfvc-tWnTcn2xcfgzazGnG3vx-qaJCDfBGn1Ghu68aZ4GdnKiKIHlJic68
Message-ID: <CAJF2gTTCLKCnTcY=K9hsepRgKwDRXqg5eqJBPxBPqTp98zqFKw@mail.gmail.com>
Subject: Re: [PATCH v1] iommu/riscv: Support 32-bit register accesses
To: David Laight <david.laight.linux@gmail.com>
Cc: zhangzhanpeng.jasper@bytedance.com, alex@ghiti.fr, aou@eecs.berkeley.edu, 
	cuiyunhui@bytedance.com, iommu@lists.linux.dev, joro@8bytes.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	luxu.kernel@bytedance.com, palmer@dabbelt.com, pjw@kernel.org, 
	robin.murphy@arm.com, tjeznach@rivosinc.com, will@kernel.org, 
	yuanzhu@bytedance.com
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

T24gV2VkLCBKdW4gMTcsIDIwMjYgYXQgMzo1MeKAr0FNIERhdmlkIExhaWdodAo8ZGF2aWQubGFp
Z2h0LmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIDE2IEp1biAyMDI2IDIzOjQ3
OjA1ICswODAwCj4gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gPiBPbiBU
dWUsIEp1biAxNiwgMjAyNiBhdCA2OjM24oCvUE0gRGF2aWQgTGFpZ2h0Cj4gPiA8ZGF2aWQubGFp
Z2h0LmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIE1vbiwgMTUgSnVuIDIw
MjYgMTI6Mzg6MTcgKzAwMDAKPiA+ID4gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiA+IEhpIFpoYW5wZW5nIFpoYW5nLAo+ID4gPiAuLgo+ID4gPiA+IDMuIE9u
bHkgcGVyZm9ybWFuY2UtbW9uaXRvcmluZyBjb3VudGVycyByZXF1aXJlIDY0LWJpdCBJTyBhY2Nl
c3Mgb3IgdGhlCj4gPiA+ID4gaGlnaC1sb3ctaGlnaCBkby13aGlsZSByZXRyeSBzdHJhdGVneS4g
Rm9yIG9yZGluYXJ5IHN0YXR1cyBhbmQgY29udHJvbAo+ID4gPiA+IE1NSU8gcmVnaXN0ZXJzLCBh
IHNpbmdsZSByZWFkIGlzIHN1ZmZpY2llbnQuCj4gPiA+Cj4gPiA+IEFjdHVhbGx5IHRoaXMgc2Vx
dWVuY2Ugc2hvdWxkIGJlIGVub3VnaCBmb3IgYSBjb3VudGVyOgo+ID4gPiAgICAgICAgIGhpID0g
cmVhZF9oaSgpOwo+ID4gPiAgICAgICAgIGxvID0gcmVhZF9sbygpOwo+ID4gPiAgICAgICAgIGlm
IChoaSAhPSByZWFkX2hpKCkpIHsKPiA+ID4gICAgICAgICAgICAgICAgIC8vIFBpY2sgYSB2YWx1
ZSB0aGF0IGhhcHBlbmVkIHdoaWxlIGRvaW5nIHRoZSByZWFkcy4KPiA+ID4gICAgICAgICAgICAg
ICAgIGhpKys7Cj4gPiA+ICAgICAgICAgICAgICAgICBsbyA9IDA7Cj4gPiA+ICAgICAgICAgfQo+
ID4gVGhpcyBpcyBub3QgYSBmcmVlIG9wdGltaXphdGlvbiDigJQgaXQgZG9lcyBub3QgcHJlc2Vy
dmUgdGhlIHNhbWUKPiA+IHNlbWFudGljcyBhcyBhbiBhdG9taWMgNjQtYml0IHJlYWQuIFRoZXJl
IGFyZSBhdCBsZWFzdCB0d28gY29ycmVjdG5lc3MKPiA+IGlzc3VlczoKPiA+Cj4gPiAxLiBMb3Nz
IG9mIHByZWNpc2lvbjogSWYgaGkgY2hhbmdlZCBkdXJpbmcgdGhlIHJlYWQsIHNldHRpbmcgbG8g
PSAwCj4gPiBkaXNjYXJkcyB0aGUgYWN0dWFsIGxvIHZhbHVlLiBUaGUgY29ycmVjdCBhcHByb2Fj
aCBpcyB0byByZS1yZWFkIGxvCj4gPiBhZnRlciBkZXRlY3RpbmcgdGhlIGNoYW5nZSwgbm90IGZh
YnJpY2F0ZSBhIHZhbHVlLgo+ID4KPiA+IDIuIE11bHRpcGxlIG92ZXJmbG93czogVGhpcyBhc3N1
bWVzIGF0IG1vc3Qgb25lIG92ZXJmbG93IG9jY3Vycwo+ID4gYmV0d2VlbiByZWFkcy4gSWYgdHdv
IG92ZXJmbG93cyBoYXBwZW4gKGUuZy4sIGR1ZSB0byBpbnRlcnJ1cHQKPiA+IGluamVjdGlvbiks
IGhpKysgd2lsbCBwcm9kdWNlIGFuIGluY29ycmVjdCByZXN1bHQsIHNpbGVudGx5IGNvcnJ1cHRp
bmcKPiA+IHRoZSBjb3VudGVyIHZhbHVlLgo+ID4KPiA+IE5lZ2xpZ2libGUgYmVuZWZpdDogaGkg
Y2hhbmdpbmcgYmV0d2VlbiByZWFkcyBpcyBhbiBleHRyZW1lbHkgcmFyZQo+ID4gZXZlbnQuIE9w
dGltaXppbmcgYXdheSB0aGUgcmV0cnkgbG9vcCBmb3Igc3VjaCBhIHJhcmUgY2FzZSBwcm92aWRl
cyBubwo+ID4gbWVhbmluZ2Z1bCBwZXJmb3JtYW5jZSBnYWluLiBBbmQgaWYgaGkgbmV2ZXIgc3Rh
YmlsaXplcywgdGhhdAo+ID4gaW5kaWNhdGVzIGEgaGFyZHdhcmUgZmFpbHVyZSDigJQgaW4gd2hp
Y2ggY2FzZSBoYW5naW5nIGluIHRoZSByZXRyeSBsb29wCj4gPiBpcyBhY3R1YWxseSB0aGUgbW9y
ZSBhcHByb3ByaWF0ZSBiZWhhdmlvciwgYXMgaXQgbWFrZXMgdGhlIGZhaWx1cmUKPiA+IHZpc2li
bGUgcmF0aGVyIHRoYW4gc2lsZW50bHkgcHJvZHVjaW5nIGdhcmJhZ2UgdmFsdWVzLgo+ID4KPiA+
IFRoZSBoaWdoLWxvdy1oaWdoIGRvLXdoaWxlIHJldHJ5IHN0cmF0ZWd5IGV4aXN0cyBwcmVjaXNl
bHkgdG8gaGFuZGxlCj4gPiB0aGVzZSBjYXNlcyBjb3JyZWN0bHkuIEkgZG9uJ3QgdGhpbmsgdGhp
cyBwcm9wb3NlZCBzZXF1ZW5jZSBpcyBhIHZhbGlkCj4gPiByZXBsYWNlbWVudC4KPiA+Cj4KPiBU
aGUgcG9pbnQgaXMgdGhhdCBpZiB0aGUgdmFsdWUgaXMgYW4gaW5jcmVtZW50aW5nIGNvdW50ZXIg
KG9mIHNvbWUgZm9ybSkKPiB0aGVuIHRoZSB2YWx1ZSBpcyBzdGFsZSBieSB0aGUgdGltZSB0aGUg
cmVhZGluZyBzZXF1ZW5jZSBjb21wbGV0ZXMuCj4gU28gYWxsIHRoZSBjb2RlIGNhbiBiZSBhc3N1
bWVkIHRvIGRvIGlzIHJldHVybiBhIHZhbHVlIHRoZSBjb3VudGVyIGhhZAo+IHNvbWV0aW1lIGJl
dHdlZW4gd2hlbiB0aGUgY29kZSBzdGFydGVkIGFuZCB3aGVuIGl0IGZpbmlzaGVkLgo+IElmIGhp
IGNoYW5nZXMgdGhlbiBoaSsxOjAgbXVzdCBoYXZlIGhhcHBlbmVkIHdoaWxlIHRoZSBjb2RlIHdh
cyBydW5uaW5nCj4gc28gaXQgaXMgYSBzYWZlIHJldHVybiB2YWx1ZS4KWW91J3JlIHJpZ2h0IOKA
lCAoaGkgKyAxKTowIGlzIGVub3VnaCBmb3IgaGktbG8taGkuIFRoYW5rIHlvdSBmb3IKc3RpY2tp
bmcgdG8geW91ciBwb2ludDsgaXQgaGVscGVkIG1lIHRoaW5rIG1vcmUgY2FyZWZ1bGx5IGFuZAp1
bmRlcnN0YW5kIHRoZSBzdWJ0bGV0eS4KCj4KPiBJdCBpcyBsaWtlbHkgdGhhdCB0aGUgcmVhZHMg
YXJlIGFsc28gbXVjaCBzbG93ZXIgdGhhbiBtZW1vcnkgcmVhZHMuCj4gSWYgaGkgY2hhbmdlcyBy
ZWxhdGl2ZWx5IGluZnJlcXVlbnRseSAoY29tcGFyZWQgdG8gdGhlIG51bWJlciBvZiByZWFkcykK
PiBpdCBtYXkgYmUgd29ydGggc2F2aW5nIHRoZSBwcmV2aW91c2x5IHJlYWQgdmFsdWUgYW5kIGF2
b2lkaW5nIHRoZSBzZWNvbmQKPiByZWFkIG9mIGhpIGlmIGl0IGlzIHRoZSBzYW1lIGFzIHRoZSBw
cmV2aW91cyByZWFkIGhpIGFuZCBsbyBoYXMgZ290IGxhcmdlci4KCgotLQpCZXN0IFJlZ2FyZHMK
IEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
