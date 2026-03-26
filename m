Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC4310A88E6
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 17:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UjMVUi8zJm3JuQg/GlcfwU5XhL518L00lDpgSPbvKy4=; b=VWXhvddc8ZHCZE
	b9D+lqwmuscqBXZB2usGlK+8bRM5icEa4KtNgwS76ETLQ5gdg7j94l1P41lXIR62/60iHI8x2k+tC
	YM8jJ5vOLWV3w60jkWX+8TeUyIcbvSLsQTOnuUF2YzlkRcgHbdwKSOqwpYUNxC74a5rrgcyr5tZF4
	ISrTYVCQL+fpmBc3/r+i4nVMY44Zs1eyK0v7ZZ4lXXrTUu1POuKyZSYcDtHotB/2uty6+TAdR3Mjf
	R4Zvs0YjRe+YzBj4pulnPYaZFxdEB6cxVfRcpnwUVhU+YWEdmVvrWyN57xIs8Fh5BK4TkvjE+TQpT
	ud0bKxl8/wvDFEVmiSnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oPD-00000005wK1-1umW;
	Thu, 26 Mar 2026 17:22:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oPB-00000005wJn-2nUS;
	Thu, 26 Mar 2026 17:22:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E4E660054;
	Thu, 26 Mar 2026 17:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CC95C2BCB0;
	Thu, 26 Mar 2026 17:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774545720;
	bh=gWAQKtriBxFBte89uPYeWlvezYh2OvK63i/Tp6/VF7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ruj8LsbcbV4dCDq0E48OMRhVzsMLuW17ySAFidrwpOPI40LzVLOiGQ8tlIpee46IV
	 NVnj/U+ctWN8apMnF7ah0Z3pKHeoYBjboAHwulMGFECwUtBmsUbqZElv8W1/Rhnjjj
	 cdxnu5ZGxYk9zca2iRoQ7nuKRj8+/FhHDSPUuFWcAajYRoZuibqnMX7q51UAhjTwnE
	 VdRHq5EpNHzWQEoZibO89qbiOBYCdScrXm11x8doEqQ0e64wsj3Qmep3EO9qmp3YMy
	 EDl7rxZQeMxuvDvukj9qbgbHeJ33ud4N3udWdBh4q0bSCB3iXYH/sb5PVHHkBAHaCB
	 IXnzD3kyCiDSA==
Date: Thu, 26 Mar 2026 17:21:52 +0000
From: Simon Horman <horms@kernel.org>
To: =?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	maxime.chevallier@bootlin.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com
Subject: Re: Re: [PATCH net-next v5 3/3] riscv: dts: eswin:
 eic7700-hifive-premier-p550: enable Ethernet controller
Message-ID: <20260326172152.GQ111839@horms.kernel.org>
References: <20260324073017.376-1-lizhi2@eswincomputing.com>
 <20260324073408.439-1-lizhi2@eswincomputing.com>
 <20260325180330.GL111839@horms.kernel.org>
 <2a12c839.5e64.19d28232537.Coremail.lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a12c839.5e64.19d28232537.Coremail.lizhi2@eswincomputing.com>
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

T24gVGh1LCBNYXIgMjYsIDIwMjYgYXQgMTE6MTQ6NDVBTSArMDgwMCwg5p2O5b+XIHdyb3RlOgoK
Li4uCgo+IEhpIFNpbW9uLAo+IAo+IFRoYW5rcyBmb3IgeW91ciByZXZpZXcuCj4gCj4gWW91J3Jl
IHJpZ2h0LCB0aGlzIGJ1aWxkIGZhaWx1cmUgaXMgZHVlIHRvIGFuIGludmFsaWQgY2xvY2sgcmVm
ZXJlbmNlCj4gKCJjbGsiKSBpbiB0aGUgRXRoZXJuZXQgbm9kZSwgd2hpY2ggZG9lcyBub3QgY29y
cmVzcG9uZCB0byBhbiBleGlzdGluZwo+IGNsb2NrIHByb3ZpZGVyIGxhYmVsIGluIHRoZSBjdXJy
ZW50IERUUy4KPiAKPiBGb3IgY29udGV4dCwgdGhpcyB3YXMgZGlzY3Vzc2VkIGR1cmluZyBhbiBl
YXJsaWVyIHJldmlzaW9uOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvNWRlYThjZTAu
NDQzNS4xOWM0NzEyMzFmNS5Db3JlbWFpbC5saXpoaTJAZXN3aW5jb21wdXRpbmcuY29tLwo+IAo+
IFRoZSBFSUM3NzAwIGNsb2NrIGNvbnRyb2xsZXIgc3VwcG9ydCBoYXMgc2luY2UgYmVlbiBhcHBs
aWVkLCBzbyBJIHdpbGwKPiB1cGRhdGUgdGhlIERUUyB0byByZWZlcmVuY2UgdGhlIGNvcnJlY3Qg
Y2xvY2sgcHJvdmlkZXIgYW5kIGVuc3VyZSB0aGUKPiBidWlsZCBwYXNzZXMgY2xlYW5seS4KPiAK
PiBJIHdpbGwgZml4IHRoaXMgaW4gdGhlIG5leHQgcmV2aXNpb24gKHY2KS4KClRoYW5rcy4KClBs
ZWFzZSBiZSBhd2FyZSB0aGF0IGlmIHRoZSBwYXRjaCBpcyByb3V0ZWQgdmlhIG5ldC1uZXh0LAp0
aGVuIHRoZSBkZXBlbmRlbmN5IHdpbGwgbmVlZCB0byBiZSBwcmVzZW50IGluIG5ldC1uZXh0LgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
