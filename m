Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A141FC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 11:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ujAWskybNor73es/KM5a9syJ1AFYq3B4Ip5zHWLkdBM=; b=yoo9lXt2uW+2xH
	5YgOQTeTEqn87Dt+4zFYUPbB6EYV8xDMZsrGYbfhHVoTtmlaSdtG2lEjIaVD2pmDYSS2ACx4OFTv3
	AD07NsfboKiuywISqW/IS7tGs2BvTeOYrR4Y4LnkfGMB2QRoWwQc8XGrbTAB9d+jiSyXHcV2NmTut
	pKkBaFxwc2MfIGmQtn5xUp8hoJwMjFHBX49P91PULtDENbchDUNrbYvhgEt8C0K/WXh9rd65P5TEI
	Qn1COOhvAc92J1wYW2Y7Z3TGF1X68aPffsZGv/mxc9XZnm5VRvK5OGOP4j2rUMJ1FbHEbTyHXPbSQ
	RPN+wvywzYWKb7dAofpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qy9ng-007Io0-1a;
	Wed, 01 Nov 2023 11:54:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qy9nd-007InU-0W
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 11:54:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E2C36611B6;
	Wed,  1 Nov 2023 11:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0151DC433C9;
	Wed,  1 Nov 2023 11:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698839655;
	bh=DAKOpkEu0Yv4QtMacrgKKjlO2sJrBuQ3cHZl1lGAUy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LesHfzrJGoyCQOMlmzsf21PwcKj5TUnbPPJDY5E+qDmslpMQsJa5dKvC1BuqCDx8k
	 Li0co2en7QM+hmPpGSub6JLwmAFTinep1xxortRgYHw+Ztv9vqpvBfauAc71AXDXNl
	 IRfAzP46DH4cE/58OLtcslpQS1qZa9eOPRogJ4Ap69Np4+qbTJe6GQs5NXBC1faZO3
	 E7X3IiyjukYkuswxAB/UI7DtvDo77YNERD+Kb2x+bB1gYp4bcQQ5iU5ZFpSszbt3OU
	 /ocNHzmYycipwX/JGWQ/Ts3KXl3dBavJlOew2CAEzSWohbSuI8sHa0aTaQuBqHDSwx
	 cRs/BTMifONJQ==
Date: Wed, 1 Nov 2023 19:41:59 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	tobias.schaffner@siemens.com, Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RT v2 0/3] riscv: add PREEMPT_RT support
Message-ID: <ZUI5h6eIhTlPAmGh@xhacker>
References: <20231031143521.441-1-jszhang@kernel.org>
 <20231031153242.k9tLdSby@linutronix.de>
 <ZUEiCUxcd11inlRP@xhacker>
 <20231031164411.9YRGasL-@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231031164411.9YRGasL-@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_045417_240380_0A6E254C 
X-CRM114-Status: GOOD (  19.60  )
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

T24gVHVlLCBPY3QgMzEsIDIwMjMgYXQgMDU6NDQ6MTFQTSArMDEwMCwgU2ViYXN0aWFuIEFuZHJ6
ZWogU2lld2lvciB3cm90ZToKPiBPbiAyMDIzLTEwLTMxIDIzOjQ5OjI5IFsrMDgwMF0sIEppc2hl
bmcgWmhhbmcgd3JvdGU6Cj4gPiBZZXMgdGhlcmUncyBubyB0aGlyZCBwYXRjaC4gSSBkaWRuJ3Qg
dXNlIHRoZSBjb3JyZWN0IG51bWJlciBpbiBwYXRjaDAncwo+ID4gc3ViamVjdC4KPiAKPiBTbyBp
dCBsb29rcyBmaW5lLiBUaGUgd2FybmluZyB3YXMgQ1BVLWhvdHBsdWcgcmVsYXRlZAo+IAlodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMGFiZDBhY2YtNzBhMS1kNTQ2LWE1MTctMTllZmU2MDA0
MmQxQG1pY3JvY2hpcC5jb20vCj4gCj4gYW5kIGl0IGxvb2tzIHRvIGJlIGdvbmUgYXMgb2YgY29t
bWl0Cj4gCTU5NDRjZTA5MmI5N2MgKCJhcmNoX3RvcG9sb2d5OiBCdWlsZCBjYWNoZWluZm8gZnJv
bSBwcmltYXJ5IENQVSIpCj4gCj4gc28gdGhhdCBnb29kLiBBbnkgZG91YmxlIGNoZWNraW5nIGlz
IHdlbGNvbWUgb2YgY291cnNlIDspCj4gSlVNUF9MQUJFTHMgZG9uJ3QgdXNlIHN0b3BfY3B1LiBD
aGVjay4KPiBUaGUgdGltZXIgaXMgUEVSQ1BVLiBDaGVjay4KPiBDYW4ndCBmaW5kIHBlcmYgZXZl
bnRzLiBCdXQgdGhlIGNvbW1pdCBmb3IgdGhyZWFkZWQgaW50ZXJydXB0cyBjbGFpbXMgdG8KPiBo
YXZlIHRoZW0gcGVyLUNQVS4gCj4gSGFzIEhBVkVfUE9TSVhfQ1BVX1RJTUVSU19UQVNLX1dPUksg
d2l0aCBnZW5lcmljIGt2bS4gQ2hlY2suCj4gCj4gZGllKCkgYW5kIGRpZV9sb2NrLiBJdCBsb29r
cyBsaWtlIGRpZV9sb2NrIGlzIGFjcXVpcmVkIHdoZW4gdGhlIHN5c3RlbQo+IGlzIGRvbmUgYW5k
IHJlcXVpcmVzIG1lZGljYWwgYXNzaXN0YW5jZS4gVGhpcyB3b3VsZCBxdWFsaWZ5IGl0IGZvciBh
Cj4gcmF3X3NwaW5sb2NrX3QuIEFsc28sIHNob3VsZCBhbnkgb2YgdGhlIGJhZCB0aGluZ3MgaGFw
cGVuIGluIGEgc2VjdGlvbgo+IHdpdGggZGlzYWJsZWQgcHJlZW1wdGlvbiBvciBpbnRlcnJ1cHRz
IHRoZW4gYSBzcGlubG9ja190IGNhbiBub3QgYmUKPiBhY3F1aXJlZC4gVW5sZXNzIGRpZSgpIGlz
IGFsd2F5cyBpbnZva2VkIGluIGEgcHJlZW1wdGlibGUgY29udGV4dOKApgo+IAo+IFRoZSBvdGhl
ciB0aGluZ3MgYXJlIGNvdmVyZWQgYnkgdGhlIGdlbmVyaWMgY29kZS4gSSB0aGluayBJIGRpZG4n
dCBtaXNzCj4gYW55dGhpbmfigKYKPiBJIGdvaW5nIHRvIGhhdmUgbmV3IHJlbGVhc2UgYnkgdGhl
IGVuZCBvZiB0aGUgd2VlayBhdCB0aGUgbGF0ZXN0IHdpdGgKPiB0aGlzIGJpdHMuIFBsZWFzZSBs
b29rIGFmdGVyIHRoZSBkaWVfbG9jay4KClRoYW5rIHlvdSBzbyBtdWNoLCBJIHdpbGwgY2hlY2su
CgpIaSBAQ29ub3IsCgpJZiB5b3UgaGVscCB0byB0cnkgdGhpcyBzZXJpZXMsIGNhbiB5b3UgcGxl
YXNlIGFwcGx5IEV2YW4nIG1pc2FsaWduZWQKYWNjZXNzIHByb2JlIHByb2JlIHBhdGNoPyBSZWZl
ciB0byBbMV0gZm9yIGRldGFpbHMuIE5PVEU6IHRoaXMgaXMgbm90CnJlbGF0ZWQgd2l0aCBSVCBw
YXRjaGVzIGJlY2F1c2UgSSBjYW4gcmVwcm9kdWNlIHRoZSBidWcgd2l0aCB2Ni42LgoKTGluazog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvWlVJM0pLZmY5U2dzQTNaJTJGQHho
YWNrZXIvIFsxXQo+IAo+IFNlYmFzdGlhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
