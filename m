Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6075C6FD1D
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Apr 2023 12:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K7QCWuml/tKp/z3BatXH7dNutajTrJxEBfRLRgViUP4=; b=viI83NjoTK+B04
	Yg75vWo4nFSkuj4hUirw1carOcwm6J7wn+nTiHTnGr8vH+meTZATr6GsNyK9SPAfcpGZA135RKrwp
	pjkA9+tz0JIdzHlu8rh5gzhRtDLFcpetLdat4bPCsCPzoMb46Q7iCOlE6Nw8g1tfZVHjkPPhsVPBd
	/uw7yQe5ROOjTWIXpiKbChtr/SIQi6/hGAW8cAr2k+I2/3mwPL2kkDYd7lozbYeE8nPckvMmsp4hU
	iK3w2cv3wKE83t9R15qTJsGCy2CbHRkX1pgGW4QMje5pmCdHOIby1BiNKuHsnErfq15IJwHQnp1t9
	+5rZTAudjLweBtSTfS6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkkqM-00A8tx-2T;
	Fri, 07 Apr 2023 12:05:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkkqJ-00A8t1-2v;
	Fri, 07 Apr 2023 12:05:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6C13860A27;
	Fri,  7 Apr 2023 12:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5B7C433EF;
	Fri,  7 Apr 2023 12:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680869122;
	bh=O1PgNY99xnStr1ysLAs1BX2iTotKJxWBIm8q8t8h7FE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A3BWCBHVMwHlO3r3sfy+Rpi2fFBvTr8G2at1muuXs3wnTMTc12JtAM0jVv1+kmicM
	 uhf+vXhef0GYwiJXXkW815xf+QATj3GYgjLjiNbmdvlokpHx1fkpBiYZRlxnLcQ+Nj
	 1fhJMDWQUbpH3kVcudRpZTNwRBEy7Dc2sp5F31os8FFSY2SmCXjQNJqMQOgMXAs2Ma
	 gqZPVAQm3CWZcGzoH8oGSMN82djNJJj1rjQPQS05TncXDGZ0uQ4oqoEjcnkRCYr6SX
	 RhBPke7pYYt1uSYVx5OMieBAvYOe29xk+ZvC1cwO5zXEbYzdXiXmAEU4gyfwUz9Bj1
	 RSYIXBAgYWbMA==
Date: Fri, 7 Apr 2023 14:05:17 +0200
From: Simon Horman <horms@kernel.org>
To: Chen Jiahao <chenjiahao16@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, guoren@kernel.org, heiko@sntech.de,
	bjorn@rivosinc.com, alex@ghiti.fr, akpm@linux-foundation.org,
	atishp@rivosinc.com, bhe@redhat.com, thunder.leizhen@huawei.com
Subject: Re: [PATCH -next v3 0/2] support allocating crashkernel above 4G
 explicitly on riscv
Message-ID: <ZDAG/Re2CbuMFXOg@kernel.org>
References: <20230406220206.3067006-1-chenjiahao16@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230406220206.3067006-1-chenjiahao16@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_050523_983826_BBAEA2B9 
X-CRM114-Status: GOOD (  15.90  )
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

On Fri, Apr 07, 2023 at 06:02:04AM +0800, Chen Jiahao wrote:
> On riscv, the current crash kernel allocation logic is trying to
> allocate within 32bit addressible memory region by default, if
> failed, try to allocate without 4G restriction.
> 
> In need of saving DMA zone memory while allocating a relatively large
> crash kernel region, allocating the reserved memory top down in
> high memory, without overlapping the DMA zone, is a mature solution.
> Hence this patchset introduces the parameter option crashkernel=X,[high,low].
> 
> One can reserve the crash kernel from high memory above DMA zone range
> by explicitly passing "crashkernel=X,high"; or reserve a memory range
> below 4G with "crashkernel=X,low". Besides, there are few rules need
> to take notice:
> 1. "crashkernel=X,[high,low]" will be ignored if "crashkernel=size"
>    is specified.
> 2. "crashkernel=X,low" is valid only when "crashkernel=X,high" is passed
>    and there is enough memory to be allocated under 4G.
> 3. When allocating crashkernel above 4G and no "crashkernel=X,low" is
>    specified, a 128M low memory will be allocated automatically for
>    swiotlb bounce buffer.
> See Documentation/admin-guide/kernel-parameters.txt for more information.
> 
> To verify loading the crashkernel, adapted kexec-tools is attached below:
> https://github.com/chenjh005/kexec-tools/tree/build-test-riscv-v2

Are you planning to submit the kexec-tools patches too?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
