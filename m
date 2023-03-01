Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B92C64ED6
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 13:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=isrzQ3OiXCO08zIN9bDdusHedNFbvcpX8Kifr5wG0as=; b=udhzgMz/nhW5Op
	Ei3/oXFNxZMRSzPd3A5ctcdNPh+vm7rC3DFSk9jfOW9q2vlm278QpM6QRcrag8dFpgWmxX8Va4Jf2
	OvVjmdtueY8NTCTMIIkpD7Gn8h2VEVO5sx+Pql9+XVx4xCDfIM0MB/Hg7P1FbK38dPyzA1gQ4x5s6
	FKqBRiIbgK2sNGYCZQItDdg4UqI5z0XMnbTnoyY6j9/ecpjNdNrM1PoZ7ERHaTswOVUkIQ68KnW92
	M1M99ZwW86ety0CFWURaBrdMx4MxLcuCWTOHoYoEHY9IWo/YYuKi/3a0vIMbs+n4hCsK+XfxZFlPl
	rz8pimod1MAVkw5r2Pjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXMBy-00GJ0u-AC; Wed, 01 Mar 2023 13:08:22 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXM7Z-00GCkd-9F
	for linux-riscv@lists.infradead.org; Wed, 01 Mar 2023 13:03:50 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 634FF68C7B; Wed,  1 Mar 2023 14:03:46 +0100 (CET)
Date: Wed, 1 Mar 2023 14:03:45 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, tsbogend@alpha.franken.de,
	mpe@ellerman.id.au, paul.walmsley@sifive.com, palmer@dabbelt.com,
	robh+dt@kernel.org, hch@lst.de, m.szyprowski@samsung.com,
	robin.murphy@arm.com, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/5] dma-mapping: Provide
 CONFIG_ARCH_DMA_DEFAULT_COHERENT
Message-ID: <20230301130345.GB467@lst.de>
References: <20230223113644.23356-1-jiaxun.yang@flygoat.com> <20230223113644.23356-4-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230223113644.23356-4-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_050349_490690_2B6F386A 
X-CRM114-Status: UNSURE (   7.59  )
X-CRM114-Notice: Please train this message.
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

PiArY29uZmlnIEFSQ0hfRE1BX0RFRkFVTFRfQ09IRVJFTlQKPiArCWJvb2wKClBsZWFzZSBhZGQg
YSBjb21tZW50IGhlcmUgZXhwbGFpbmluZyB3aGVuIGFuIGFyY2hpdGVjdHVyZSBzaG91bGQK0ZVl
bGVjdCB0aGlzIHN5bWJvbC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
