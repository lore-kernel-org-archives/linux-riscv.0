Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8C0C3DA6E
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 04:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mP5qspmaP9VP4FdZZ1MY4YzUjT4+QikOWgppDdRporc=; b=LlZ3Ya2ufJDUkQ
	KOG6TkejOkwWUR2QzFc6X1nbQC63sCe+/S6fWypVI5oR99PFxksl/w4lEHgbsqx1PVEQIo0VzQVZc
	/YNv+xFEBqWGDyZCTH7VIyeHz4nWooHMI3vYjTKQ9eTH+KnDsyMC4qNDvEQ06VZgN/bodAWLlmG/a
	vLbFszYi46UktNd+PKexd583NGIjnmU/xLbHU5X32zo4Nfg4ucR3WUpKI9T5OZ2S3MHYN3arq/FOl
	DQ2tWxpERGrx4/26Mz87xRQPS9xmvgfd5wjQGX6jtBDNrWXp60ZeFzW+KKaJThR+Nz24UDGSCPoZV
	38jC+N52IPNGREWEpNZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGu6e-007O5u-11;
	Sat, 23 Dec 2023 04:59:24 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGu6b-007O4z-0B
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 04:59:22 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id C624168B05; Sat, 23 Dec 2023 05:59:12 +0100 (CET)
Date: Sat, 23 Dec 2023 05:59:12 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Maxim Kochetkov <fido_max@inbox.ru>, Conor Dooley <conor@kernel.org>,
	Christoph Hellwig <hch@lst.de>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, mpe@ellerman.id.au,
	aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: Re: [PATCH 1/1] riscv: set ARCH_DMA_DEFAULT_COHERENT if
 RISCV_DMA_NONCOHERENT is not set
Message-ID: <20231223045912.GA21836@lst.de>
References: <20231221185152.327231-1-fido_max@inbox.ru> <20231221-discount-decade-e306e5878c46@spud> <f31d929c-fa0a-4046-be05-38e92afa5d92@flygoat.com> <20231222041428.GA2803@lst.de> <c53c22dd-c482-4808-bdd7-e81c01c04f9e@inbox.ru> <20231222-outburst-spoiling-75082a7826dd@spud> <be10eb21-a0ef-416e-9c0c-d53326996fba@inbox.ru> <7bc138f7-d5e9-471a-ae82-d6c490645623@flygoat.com> <6fe34090-656d-491f-8173-217d20144166@inbox.ru> <a25d3736-f6ca-478d-8e58-69a7c0e529f7@flygoat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a25d3736-f6ca-478d-8e58-69a7c0e529f7@flygoat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_205921_264776_0DC431F1 
X-CRM114-Status: GOOD (  11.82  )
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

On Fri, Dec 22, 2023 at 04:01:43PM +0000, Jiaxun Yang wrote:
>>
>> But arch_setup_dma_ops() is called only from of_dma_configure_id() and 
>> acpi_dma_configure_id(). So it works only for DT and ACPI devices. What 
>> about platform_device?
>
> Ah I see, that's the problem, in MIPS's use case all DMA capable devices
> are following platform's default coherency. For RISC-V we assume all device 
> are enabled by ACPI or DT.
>
> Perhaps you can override it in driver, but that will make drivers platform 
> dependent.
>
> I'll leave this question to Christoph.

I've already said it.  You must not have DMA capable devices that aren't
declared in ACPI or OF, just like on any modern Linux platform.

What devices are you concerned about anyway Maxim?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
