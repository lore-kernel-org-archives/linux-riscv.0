Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426FDC83F03
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 15:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V8Lz+B4WYHrcueXa5ofwuLZXtXHhIEKd7jkldQeX2S4=; b=YCe2Drl7iuSIIC
	JkYSBswUP588mwJigNnl2wsGtZBJaOp4GEcPtmKf0IkISJj9Ej9ahSP4PzVQ0BPfDRqJPeLezQ/cm
	ENbz6w92LYkejfH+waKa29Hk8DE+AvmOat2iitbgc4SBEu4C3Oe2ypZ1enZL0/6gGzfS0+4aGXQfX
	sPcOT+neV05tCInRzH4l/Cm9AW11oki6LjfNlhkSLohujzxQskry1C+8kwCQIwOXXCruzNpetZwOw
	hi5IqhVusa0BnHEiSwN07DFE5CWoFXbmZBqFZvX36azsoCWvIO+Ch+hxtEzpCJbTB6mfTYG3iEhim
	d4Ik6QdgLWQHt0Hg0nqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWO8-000000096J4-2Wzn;
	Wed, 09 Jul 2025 15:07:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTyq-00000008eP5-1vtJ;
	Wed, 09 Jul 2025 12:32:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C4AFC445BF;
	Wed,  9 Jul 2025 12:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6DCC4CEF4;
	Wed,  9 Jul 2025 12:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752064375;
	bh=k7oBzbUjKiMJ0Q6br+E4o5sLW0SuJMJPvvMOS+TTwB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uRo2ZBknsQXEL2PqhpkMfov9GoHoVLEFK+mGaAD/zykvYjQoxAFBbWBESB7gT+Afe
	 4vJlGVe6oDN8cTQoK6+nMdRNbw4zpfcOKW7McKj1ZhrlHnGWc2C9F6oajfHdpTq2fE
	 45o/gKZGbTQfWpXwiwblIFd90+riYbc8NM1+apOYwxTpwnirc7co5q6qt90GhXMZYA
	 H5F02DWDnqeMDqfrcEnJ/NNdQoQAtpioxpjGgqIKnvvryLVFAUVMrPkxnw+VDb/YtI
	 bsNGtm/53f4RO28Z+SbrhhMTL/jmEm02GocgFDe02LFwK1LUuOadkd4WvSydBZwQp2
	 XajktGCcknU9A==
Date: Wed, 9 Jul 2025 18:02:42 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Zhou Wang <wangzhou1@hisilicon.com>, Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	dingwei@marvell.com, Lukas Wunner <lukas@wunner.de>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 4/5] PCI: host-common: Add link down handling for host
 bridges
Message-ID: <fpb23ogxfppvrkbr7mwk5jinq3m5bswzzepkt4hqpchycvttfl@o72xdeqm3eia>
References: <fr6orvqq62hozn5g3svpyyazdshv4kh4xszchxbmpdcpgp5pg6@mlehmlasbvrm>
 <20250530113404.GA138859@bhelgaas>
 <bixtbu7hzs5rwrgj22ff53souxvpd7vqysktpcnxvd66jrsizf@pelid4rjhips>
 <aGuqA92VDLK8eRY1@ryzen>
 <aGuvkkeVkezGJWXn@ryzen>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aGuvkkeVkezGJWXn@ryzen>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_053256_515425_27F1F20C 
X-CRM114-Status: GOOD (  21.59  )
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

T24gTW9uLCBKdWwgMDcsIDIwMjUgYXQgMDE6Mjk6MjJQTSBHTVQsIE5pa2xhcyBDYXNzZWwgd3Jv
dGU6Cj4gKyBNYW5pJ3Mga2VybmVsLm9yZyBlbWFpbC4KPiAKPiBPbiBNb24sIEp1bCAwNywgMjAy
NSBhdCAwMTowNTozOVBNICswMjAwLCBOaWtsYXMgQ2Fzc2VsIHdyb3RlOgo+ID4gSGVsbG8gTWFu
aSwKPiA+IAo+ID4gT24gRnJpLCBNYXkgMzAsIDIwMjUgYXQgMDk6Mzk6MjhQTSArMDUzMCwgTWFu
aXZhbm5hbiBTYWRoYXNpdmFtIHdyb3RlOgo+ID4gPiBPbiBGcmksIE1heSAzMCwgMjAyNSBhdCAw
NjozNDowNEFNIC0wNTAwLCBCam9ybiBIZWxnYWFzIHdyb3RlOgo+ID4gPiAKPiA+ID4gPiBJIHRo
aW5rIHBjaV9ob3N0X2hhbmRsZV9saW5rX2Rvd24oKSBzaG91bGQgdGFrZSBhIFJvb3QgUG9ydCwg
bm90IGEKPiA+ID4gPiBob3N0IGJyaWRnZSwgYW5kIHRoZSBjb250cm9sbGVyIGRyaXZlciBzaG91
bGQgZmlndXJlIG91dCB3aGljaCBwb3J0Cj4gPiA+ID4gbmVlZHMgdG8gYmUgcmVjb3ZlcmVkLCBv
ciB0aGUgY29udHJvbGxlciBkcml2ZXIgY2FuIGhhdmUgaXRzIG93biBsb29wCj4gPiA+ID4gdG8g
cmVjb3ZlciBhbGwgb2YgdGhlbSBpZiBpdCBjYW4ndCBmaWd1cmUgb3V0IHdoaWNoIG9uZSBuZWVk
cyBpdC4KPiA+ID4gPiAKPiA+ID4gCj4gPiA+IFRoaXMgc2hvdWxkIGFsc28gd29yay4gRmVlbCBm
cmVlIHRvIGRyb3AgdGhlIHJlbGV2YW50IGNvbW1pdHMgZm9yIHY2LjE2LCBJIGNhbgo+ID4gPiBy
ZXN1Ym1pdCB0aGVtIChpbmNsdWRpbmcgZHctcm9ja2NoaXAgYWZ0ZXIgLXJjMSkuCj4gPiAKPiA+
IFdoYXQgaXMgdGhlIGN1cnJlbnQgc3RhdHVzIG9mIHRoaXM/Cj4gPiAKClRoYW5rcyBmb3IgdGhl
IG51ZGdlIQoKSSBjb3VsZG4ndCByZXNwaW4gdGhlIHNlcmllcyBhcyBJIGxvc3QgYWNjZXNzIHRv
IHRoZSBoYXJkd2FyZSBJIHdhcyB0ZXN0aW5nIG9uCmR1ZSB0byBqb2IgY2hhbmdlLiBJJ2xsIGZp
Z3VyZSBvdXQgYSB3YXkgdG8gdGVzdCBpdCBhbmQgcmVzcGluIGl0IGFzYXAuCgo+ID4gSSBhc3N1
bWUgdGhhdCB0aGVyZSBpcyBub3QgbXVjaCB0aW1lIGxlZnQgYmVmb3JlIDYuMTcgY3V0LW9mZi4K
Ck1pZCBvZiAtcmM1IGlzIG5vdCB0aGF0IGJhZCA7KSBMZXQncyBzZWUgaG93IGxvbmcgaXQgdGFr
ZXMuCgotIE1hbmkKCi0tIArgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a
4K6/4K614K6u4K+NCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
