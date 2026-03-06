Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DC9FCB602
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 22:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QnJvnE3/oCfPAWwSyYD0tPXSl5kDzNNKAmpQQcmwibI=; b=Vv550/iry5IWn4
	B8SIDGj9YHzPd5qSYBncqmcuEBIKrtqa5yEbwvtt2zVGwEIvYgQtkx3etSjQVvT1d+w09kMv6Ducs
	O1O2uQnDbTwh/BQl3b9OxkAEm5odL2xwCTAKGU25QTiYF9ajCeh9V++OV4QTSD7QaRGG8Nh2TxVkB
	weqTdNXYmksLCXUaxteETjOdqvKwLuagr3vSd6q2CkGOxw0K28kVfgaOqWNkIFdk1lsf8A18eVwVW
	lPcRDtkhavz/gsObrvZSbTj+FpGJriticn0IB0lCJDpnVO4oG6Bl99VlqeiWtPovrDq59k7KHScFC
	adxGS6yZ8JtLYooOiK8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vydq0-00000004bHG-2JgO;
	Fri, 06 Mar 2026 22:40:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vydpy-00000004bGv-1LWg
	for linux-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 22:40:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 034F043C6A;
	Fri,  6 Mar 2026 22:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F48BC4CEF7;
	Fri,  6 Mar 2026 22:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772836800;
	bh=2pliSVYtv80Y4TlYoK1pP6t8MG+RWP+9x0mqyGizOec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MniWxJ9+U76Igg4sPGN5XFVHpZGsZlN0u1T6ycOxXlOOFIB8GG7lOXq+ZhpOpBdMA
	 NJDZTCVBhDoRVmoBoQ3dEMPijuVwxdonrNbZM4v6ptD6Ec0SiNXFuFMfArjpljmzgq
	 cI1s2Y60hwx9PSKIfW0gfsgNyEIqUhHHNMjUsfuq3gUqk1OKu7JKLXFm0H7mpSQj/i
	 UGPCSfavNXYV/gQmgLIgEk2WM699lQ6ajXou+Eppq1avysz+EFE9CXvDGeIQ5mlIIS
	 nGIrO6MFd0JXQI2q2/bP78/heNK+pM/LCdEnMqyzl8zEyjAL70Vq5VxQUQ6hfwYhYX
	 UyyqUitTiixoQ==
Date: Sat, 7 Mar 2026 06:39:58 +0800
From: Yixun Lan <dlan@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Alex Elder <elder@riscstar.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <guodong@riscstar.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v4 1/3] dt-bindings: mfd: spacemit,p1: Add
 individual regulator supply properties
Message-ID: <20260306223958-GKB302167@kernel.org>
References: <20260206-spacemit-p1-v4-1-8f695d93811e@riscstar.com>
 <177280476778.1042627.3296790673262334325.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <177280476778.1042627.3296790673262334325.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_144002_382756_517C044D 
X-CRM114-Status: GOOD (  10.40  )
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

SGkgSm9uZXMsCgpPbiAxMzo0NiBGcmkgMDYgTWFyICAgICAsIExlZSBKb25lcyB3cm90ZToKPiBP
biBGcmksIDA2IEZlYiAyMDI2IDEwOjMyOjAyICswODAwLCBHdW9kb25nIFh1IHdyb3RlOgo+ID4g
QWRkIHN1cHBseSBwcm9wZXJ0aWVzIHRoYXQgbWF0Y2ggdGhlIFAxIFBNSUMncyBhY3R1YWwgaGFy
ZHdhcmUgdG9wb2xvZ3kKPiA+IHdoZXJlIGVhY2ggYnVjayBjb252ZXJ0ZXIgaGFzIGl0cyBvd24g
VklOIHBpbiBhbmQgTERPIGdyb3VwcyBzaGFyZQo+ID4gY29tbW9uIGlucHV0IHBpbnMuIFN1cHBs
eSBuYW1lcyBhcmUgZGVmaW5lZCBhY2NvcmRpbmcgdG8gdGhlIHBpbm91dAo+ID4gbmFtZXMgaW4g
dGhlIFAxIGRhdGFzaGVldC4KPiA+IAo+ID4gVGhlIGV4aXN0aW5nICJ2aW4tc3VwcGx5IiBpcyBk
cm9wcGVkIGZyb20gdGhlIGJpbmRpbmcgZG9jdW1lbnQgYXMgdGhlCj4gPiB1cGRhdGVkIHNwYWNl
bWl0IFAxIGRyaXZlciBubyBsb25nZXIgcGFyc2VzIGl0LiBPbmx5IHRoZSBwZXItcmFpbCBuYW1l
cwo+ID4gKCJ2aW4xLXN1cHBseSIsICJ2aW4yLXN1cHBseSIsIC4uLikgYXJlIHN1cHBvcnRlZC4K
PiA+IAo+ID4gWy4uLl0KPiAKPiBBcHBsaWVkLCB0aGFua3MhCj4gCj4gWzEvM10gZHQtYmluZGlu
Z3M6IG1mZDogc3BhY2VtaXQscDE6IEFkZCBpbmRpdmlkdWFsIHJlZ3VsYXRvciBzdXBwbHkgcHJv
cGVydGllcwo+ICAgICAgIGNvbW1pdDogZTEzZWJiNGNmY2ZmNDM5OWEzNGMzYTg5YzQ5MzAyMDg5
OWE0MzFmNwo+IApOb3QgZnVyZSBpZiB0aGlzIHdpbGwgY2F1c2UgYSBjb25mbGljdCwgdGhlIHBh
dGNoIGhhcyBhbHJlYWR5IGJlZW4gbWVyZ2VkCmJ5IE1hcmssIHNlZQoKaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8xNzcyMDQ2NDM5MTEuMTY4NTIzLjM3MjQ1NDg2OTIyMDA2NDc5NzguYjQtdHlA
a2VybmVsLm9yZy8KCj4gLS0KPiBMZWUgSm9uZXMgW+adjueQvOaWr10KPiAKCi0tIApZaXh1biBM
YW4gKGRsYW4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
