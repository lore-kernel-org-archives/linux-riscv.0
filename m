Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2982BC76195
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Mar 2023 01:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7A29fB++iwKmXNeKGQaoBXKRrQRMzrZ4QhoxHj+9mqs=; b=mavRlOwgJ+K2kn
	5ReV84NB/3dMGcmVRGvvqknHxVc6XrQZep0492UoKqDK192Zyb6Ms0mMBHTtld0Ty/L9aevBcFqzE
	JFv6Hrthia4Od6Q47JycLLxjF0n92UNR7yCyQ+wGNjpPAYMvFHp6wDaFz4ksqL4Edq8jJn6ZDnE4d
	PgZaCjDeF45Hd+2gKGMatl5Qg7mdfuIJxDHWvj6XNEeWOLcoXqp8HRKKKQEAoGI76dIEi8oJeRJJ6
	diNerx+DySYKSXnXPK7r0pTR2IzSUcy1+iGbJELUdc1vEnUMurU+7YCmho0RaQijd8hdDx2k2PbBM
	iD1Q8t7jbS9wGWeofMmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgxye-00Cm1G-18;
	Tue, 28 Mar 2023 01:18:20 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgxya-00Cm0v-2p
	for linux-riscv@lists.infradead.org;
	Tue, 28 Mar 2023 01:18:18 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7D48968AA6; Tue, 28 Mar 2023 03:18:12 +0200 (CEST)
Date: Tue, 28 Mar 2023 03:18:12 +0200
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
Message-ID: <20230328011812.GA21977@lst.de>
References: <20230321110813.26808-1-jiaxun.yang@flygoat.com> <20230323072944.GA18524@lst.de> <60D7FE31-D708-4495-949F-3F64DDC11377@flygoat.com> <20230323213930.GA7730@lst.de> <CB41D3AF-20F6-42F3-9168-C0D6E716431A@flygoat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CB41D3AF-20F6-42F3-9168-C0D6E716431A@flygoat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_181817_061497_AF9BFBA1 
X-CRM114-Status: GOOD (  11.36  )
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

On Fri, Mar 24, 2023 at 09:17:38AM +0000, Jiaxun Yang wrote:
> > 
> > Is patch a 6.3 candidate or should all of it go into 6.4?
> 
> Please leave it for 6.4, as corresponding MIPS arch part will be a part of 6.4.

Ok.  I'll really need review from the MIPS and drivers/of/ maintainers,
through.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
