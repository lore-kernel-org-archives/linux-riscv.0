Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B190C54ED1
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PztGidQesKMNOWpy8D7DOy3mxdnyBenfltEjsbZsB7w=; b=2dwYgFIz+cLFvt
	1/wQIAWAsleLPFhPdY1t5PotCN+BnQwiIvyQlDQ6dGAqVe72waEwQMuWdSAlewA6RWRlwpEHSTQMA
	9XDylCQocGPBsnk7Ox0eVz5fj2OSFUdyR0UrexVvJutgTKiS6HcEVxdGQIMi6n5fbC+YP9mZKcuRR
	AJFjR3Nl/dIfxrWftCP6sZw39H4prNTcchUrw148RqzvWC/wGe9kVgViPQ1d+eyiy8Cnp47ELRGlD
	Q0lx/oP+YQq3ZXud963J7cpTfWm/w9iw5k5lFkKk3iqUik4t/Xl2KgoOjn8NhqUh5lqST4UrVN4t5
	M96fWwVRJaB4q/xhmVVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJx7Z-0000000B9iV-0C6a;
	Tue, 27 May 2025 16:25:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJx7W-0000000B9i6-1akT
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 16:25:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B2F505C55FB;
	Tue, 27 May 2025 16:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D000C4CEE9;
	Tue, 27 May 2025 16:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748363141;
	bh=khpow4kcf5haMZyrMlXnzn3OiMY4A+7VzQ+k+AAUENc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qhoZgrS9CfrZrUrKsBRtGfXRvzKWwFPvIjU5tBt+JDizFPxfF6WKs4K0/Vh7ytKVP
	 6cA7M5q5J2YF2UHwPGWnoCVcKqjfpMQY01IgQ4OXtAutQS01mCd4KjnIYKASNas6pm
	 SrdixFpXXqICs8qs+h9VLkayRce4SkLqcxQY6ahsALr5Re9w8vTImnJfkV5AvPQ3oq
	 AMlrGH5jYGatla4QLg1D4JYDBoQDIljKSgy/feyudncXxgVNPPUWVV/TA5MWKiVQnU
	 6M2yjo6ud743OqGgmUTz2ThDmfqy0Vv2qI2B39yl/oizxNQLiJdbX/uO3ePvdNaVk6
	 12KI9ftzH1bJw==
Date: Tue, 27 May 2025 11:25:39 -0500
From: Rob Herring <robh@kernel.org>
To: Ze Huang <huangze@whut.edu.cn>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: soc: spacemit: Add K1 MBUS controller
Message-ID: <20250527162539.GA423198-robh@kernel.org>
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
 <20250526-b4-k1-dwc3-v3-v4-2-63e4e525e5cb@whut.edu.cn>
 <20250527-energetic-pink-cricket-a282fd@kuoka>
 <aDWeQfqKfxrgTA__@jean.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aDWeQfqKfxrgTA__@jean.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_092542_462600_6C9C91CA 
X-CRM114-Status: GOOD (  20.98  )
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

T24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgMDc6MTM6MDVQTSArMDgwMCwgWmUgSHVhbmcgd3JvdGU6
Cj4gT24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgMDg6NTE6MTlBTSArMDIwMCwgS3J6eXN6dG9mIEtv
emxvd3NraSB3cm90ZToKPiA+IE9uIE1vbiwgTWF5IDI2LCAyMDI1IGF0IDEwOjQwOjE4UE0gR01U
LCBaZSBIdWFuZyB3cm90ZToKPiA+ID4gU29tZSBkZXZpY2VzIG9uIHRoZSBTcGFjZW1pVCBLMSBT
b0MgcGVyZm9ybSBETUEgdGhyb3VnaCBhIG1lbW9yeSBidXMKPiA+ID4gKE1CVVMpIHRoYXQgaXMg
bm90IHRoZWlyIGltbWVkaWF0ZSBwYXJlbnQgaW4gdGhlIGRldmljZSB0cmVlLiBUaGlzIGJ1cwo+
ID4gPiB1c2VzIGEgZGlmZmVyZW50IGFkZHJlc3MgbWFwcGluZyB0aGFuIHRoZSBDUFUuCj4gPiA+
IAo+ID4gPiBUbyBleHByZXNzIHRoaXMgdG9wb2xvZ3kgcHJvcGVybHksIGRldmljZXMgYXJlIGV4
cGVjdGVkIHRvIHVzZSB0aGUKPiA+ID4gaW50ZXJjb25uZWN0cyB3aXRoIG5hbWUgImRtYS1tZW0i
IHRvIHJlZmVyZW5jZSB0aGUgTUJVUyBjb250cm9sbGVyLgo+ID4gCj4gPiBJIGRvbid0IGdldCBp
dCwgc29ycnkuIERldmljZXMgcGVyZm9ybWluZyBETUEgdGhyb3VnaCBmb28tYmFyIHNob3VsZCB1
c2UKPiA+IGRtYXMgcHJvcGVydHkgZm9yIGZvby1iYXIgRE1BIGNvbnRyb2xsZXIuIEludGVyY29u
bmVjdHMgaXMgbm90IGZvciB0aGF0Lgo+ID4gCj4gCj4gSGkgS3J6eXN6dG9mLAo+IAo+IFNvcnJ5
IGZvciBub3QgY2xhcmlmeWluZyB0aGlzIGVhcmxpZXIgLSBsZXQgbWUgcHJvdmlkZSBzb21lIGNv
bnRleHQuCj4gCj4gVGhlIHB1cnBvc2Ugb2YgdGhpcyBub2RlIGlzIHRvIGRlc2NyaWJlIHRoZSBh
ZGRyZXNzIHRyYW5zbGF0aW9uIHVzZWQgZm9yIERNQQo+IGRldmljZSB0byBtZW1vcnkgdHJhbnNh
Y3Rpb25zLiBJ4oCZbSB1c2luZyB0aGUgImludGVyY29ubmVjdHMiIHByb3BlcnR5IHdpdGggdGhl
Cj4gcmVzZXJ2ZWQgbmFtZSAiZG1hLW1lbSIgWzFdIGluIGNvbnN1bWVyIGRldmljZXMgdG8gZXhw
cmVzcyB0aGlzIHJlbGF0aW9uc2hpcC4KPiBUaGUgYWN0dWFsIHRyYW5zbGF0aW9uIGlzIGhhbmRs
ZWQgYnkgdGhlIGBvZl90cmFuc2xhdGVfZG1hX2FkZHJlc3MoKWAgWzJdLgo+IFRoaXMgc3VwcG9y
dCB3YXMgaW50cm9kdWNlZCBpbiB0aGUgc2VyaWVzIGxpbmtlZCBpbiBbM10uCj4gCj4gVGhpcyBz
ZXR1cCBpcyBzaW1pbGFyIHRvIHdoYXQgd2Ugc2VlIG9uIHBsYXRmb3JtcyBsaWtlIEFsbHdpbm5l
ciBzdW41aSwKPiBzdW44aS1yNDAsIGFuZCBOVklESUEgVGVncmEuIFs0XVs1XQo+IAo+IEkgY29u
c2lkZXJlZCByZXVzaW5nIHRoZSBleGlzdGluZyBBbGx3aW5uZXIgTUJVUyBkcml2ZXIgYW5kIGJp
bmRpbmdzLgo+IEhvd2V2ZXIsIHRoZSBBbGx3aW5uZXIgTUJVUyBpbmNsdWRlcyBhZGRpdGlvbmFs
IGZ1bmN0aW9uYWxpdHkgc3VjaCBhcwo+IGJhbmR3aWR0aCBtb25pdG9yaW5nIGFuZCBmcmVxdWVu
Y3kgY29udHJvbCAtIGZlYXR1cmVzIHRoYXQgYXJlIGVpdGhlcgo+IGFic2VudCBvciB1bmRvY3Vt
ZW50ZWQgb24gdGhlIFNwYWNlbWlUIEsxIFNvQy4KClRoZSBpbnRlcmNvbm5lY3QgYmluZGluZyBp
cyBmb3Igd2hlbiB5b3UgaGF2ZSB0aG9zZSBzb2Z0d2FyZSBjb250cm9scy4gCklmIHlvdSBvbmx5
IGhhdmUgYWRkcmVzcyB0cmFuc2xhdGlvbiwgdGhlbiAnZG1hLXJhbmdlcycgaW4gYSBwYXJlbnQg
bm9kZSAKaXMgYWxsIHlvdSBuZWVkLgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
