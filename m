Return-Path: <SRS0=P6b6=UX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7F6C43613
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2019 13:20:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41C0420820
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2019 13:20:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BUYO96Vt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41C0420820
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nQtvmnSDgFpuMx7V2E11gWWjYc41eFvT7RDb5uoMEF4=; b=BUYO96VtCH4aJh
	/mrkfT7I+PZdLclIEDYuYmeRX+k26YJLPxFzdwp83fKyR3qJtBz+tJfvOJjLrf0biQRhBSTMxk5ce
	H1hdyTsL0Q5GFqaOecwNoUFbhhqN6xU3PPTu+zDh+oI+RpkLDzLcWLzRkoMagmpTaErVmKC8EXqpX
	2K9nJtPh1ETX2o/BFMWUuUtPUxf+8ZyUl1hRaOHylpfAULpRuhIMvn0g0ccG1GYHtugj3MTxNVPTt
	QBjQlnPR1b4Ye4OMhXjKz7Te7pWWQEKvPj4CXunuZESmXpDAdyB3KVEpckeaWg5UQ4eunrfmXgRSc
	OK+/0OOOA/4NDNIJ+uYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfOtZ-0005V7-Fg; Mon, 24 Jun 2019 13:20:29 +0000
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfOqJ-0002D3-Ms
 for linux-riscv@lists.infradead.org; Mon, 24 Jun 2019 13:17:09 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id D879268AFE; Mon, 24 Jun 2019 15:16:33 +0200 (CEST)
Date: Mon, 24 Jun 2019 15:16:33 +0200
From: Christoph Hellwig <hch@lst.de>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Subject: Re: RISC-V nommu support v2
Message-ID: <20190624131633.GB10746@lst.de>
References: <20190624054311.30256-1-hch@lst.de>
 <28e3d823-7b78-fa2b-5ca7-79f0c62f9ecb@arm.com> <20190624115428.GA9538@lst.de>
 <d4fd824d-03ff-e8ab-b19f-9e5ef5c22449@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4fd824d-03ff-e8ab-b19f-9e5ef5c22449@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_061708_212810_6812CFA0 
X-CRM114-Status: UNSURE (   8.24  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 24, 2019 at 02:08:50PM +0100, Vladimir Murzin wrote:
> True, yet my observation was that elf2flt utility assumes that address
> space cannot exceed 32-bit (for header and absolute relocations). So,
> from my limited point of view straightforward way to guarantee that would
> be to build incoming elf in 32-bit mode (it is why I mentioned COMPAT/ILP32).
> 
> Also one of your patches expressed somewhat related idea
> 
> "binfmt_flat isn't the right binary format for huge executables to
> start with"
> 
> Since you said there is no support for compat/ilp32, probably I'm missing some
> toolchain magic?

There is no magic except for the tiny elf2flt patch, which for
now is just in the buildroot repo pointed to in the cover letter
(and which I plan to upstream once the kernel support has landed
in Linus' tree).  We only support 32-bit code and data address spaces,
but we otherwise use the normal RISC-V ABI, that is 64-bit longs and
pointers.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
