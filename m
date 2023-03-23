Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7410EC6FD1C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 21:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3TOLG/rfvAOaP5MhQ+v6wrJER1fTqJ8MgevE+NAaDXE=; b=HfTFBNHUJx0vSd
	QXDSh+r4JiYm+OV7GNqhLRadHfNSGCIWdPu2yPUuWNyXAKwEPUKOLozAxGkqy3hY1Y4rIBgeUB/35
	NtQ9nfkvveFayt2S7TMscO51PoEQiDwM5VvqQjfrVchKS3JPrRffJnWQ1Lee5C3p6YNZ6JEeDOcja
	rH1vMp1vuReT1LE9+DbX5t/WoiE68MANmaT4lxUSG2DgPwZDVi3yyJvjchNhi5nCcojBiKOV45xxo
	ZXBMqVqoqM1Hat5y3ukIhVhmLtqNpubOMBUHXlMcNK7wvHQQrCnghWBxT/cLv9aV53QwVk+kZoblE
	namj/ZjAnFh329xzl1Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfSeu-0031dS-11;
	Thu, 23 Mar 2023 21:39:44 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfSer-0031cO-02
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 21:39:42 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id A822B68B05; Thu, 23 Mar 2023 22:39:30 +0100 (CET)
Date: Thu, 23 Mar 2023 22:39:30 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Christoph Hellwig <hch@lst.de>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, mpe@ellerman.id.au,
	paul.walmsley@sifive.com, palmer@dabbelt.com,
	Rob Herring <robh+dt@kernel.org>, m.szyprowski@samsung.com,
	Robin Murphy <robin.murphy@arm.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/4] Use dma_default_coherent for devicetree default
 coherency
Message-ID: <20230323213930.GA7730@lst.de>
References: <20230321110813.26808-1-jiaxun.yang@flygoat.com> <20230323072944.GA18524@lst.de> <60D7FE31-D708-4495-949F-3F64DDC11377@flygoat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60D7FE31-D708-4495-949F-3F64DDC11377@flygoat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_143941_218177_55E7996E 
X-CRM114-Status: GOOD (  11.19  )
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

T24gVGh1LCBNYXIgMjMsIDIwMjMgYXQgMDk6MDc6MzFQTSArMDAwMCwgSmlheHVuIFlhbmcgd3Jv
dGU6Cj4gCj4gCj4gPiAyMDIz5bm0M+aciDIz5pelIDA3OjI577yMQ2hyaXN0b3BoIEhlbGx3aWcg
PGhjaEBsc3QuZGU+IOWGmemBk++8mgo+ID4gCj4gPiBUaGUgc2VyaWVzIGxvb2tzIGZpbmUgdG8g
bWUuICBIb3cgc2hvdWxkIHdlIG1lcmdlIGl0Pwo+IAo+IFBlcmhhcHMgZ28gdGhyb3VnaCBkbWEt
bWFwcGluZyB0cmVlPwoKSXMgcGF0Y2ggYSA2LjMgY2FuZGlkYXRlIG9yIHNob3VsZCBhbGwgb2Yg
aXQgZ28gaW50byA2LjQ/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
