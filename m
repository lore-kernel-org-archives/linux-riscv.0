Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCF3C6FD1C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 07:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cmV6H4sQo8t41Ehp01+okOoeS23W7YHyF6hsq9qFRt0=; b=F/xV/pn4Lx0E2Y
	/SqbR9bPH/ZsS/uvLf12MU0QtnT+2LktpednHAKCuFEY2Wo1TVSYfcs+vAYk9QBinwmSsAJE+clgY
	VGIFTY4VRAmIhRq9jpKaOt/ZtKA4aobW7vnGNgIwrpquUj4pR0twXaJIWPqbdbVZ8w9D3Uxpz0jAc
	CCHekG16XeShPf+RGxB9/3LZRLsfEsVbfX5hfjigYw7KjmK26BNedA+GXMVcD9FQGpXny6nIWkozy
	i8mz6oae/CKXcDktyjWEzPmXx0ODlRRrFLq2c5UKrFimouEsYi19Lm2IzpIecip8G+ms6BBcY/7VF
	2p5P+JsTXD4Ni7GqLRmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfFOW-0016Vn-0w;
	Thu, 23 Mar 2023 07:29:56 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfFOT-0016V2-2u
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 07:29:55 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 0F3D468AA6; Thu, 23 Mar 2023 08:29:45 +0100 (CET)
Date: Thu, 23 Mar 2023 08:29:44 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, tsbogend@alpha.franken.de,
	mpe@ellerman.id.au, paul.walmsley@sifive.com, palmer@dabbelt.com,
	robh+dt@kernel.org, hch@lst.de, m.szyprowski@samsung.com,
	robin.murphy@arm.com, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/4] Use dma_default_coherent for devicetree default
 coherency
Message-ID: <20230323072944.GA18524@lst.de>
References: <20230321110813.26808-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230321110813.26808-1-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_002954_085479_04D0D243 
X-CRM114-Status: UNSURE (   7.45  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The series looks fine to me.  How should we merge it?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
