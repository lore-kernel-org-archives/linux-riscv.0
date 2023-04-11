Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D96C76196
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 07:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BwiWubbqD1aKqdLSgiddglEFfkdVNIIFarpukpY1Tt0=; b=bPQfwA095K0bvN
	+VvEX//HJYmpMbF5Mq2m+Fg9tdNZE5ob3jhXYVMmeTk6/mIxBbsxVK4vgeQ2S647ehC2tNlzOxTMn
	av1Jid8chN9gnEdSbZhUIlwJPDR/AffOsgBn5UWivnKFC7ZlLDtG/Nat9P24+jivAgzfQffyP0+E0
	JfDWlXq3Oqez86Q/bqO0NX2mls8y7bZuLWcwvnwJU/MoTpFaFCs1ddFi/6C+LgWmHKX/imoA9ULCW
	rQXm/aeofvQaO4bV/8dQlHWR3FVdM7xA4VHCQcyLFAQfBX5PiM8J17Jbi8/XFKQ/91q9z6m1oE2xh
	Wqg5hzfNV8QAR4iW5C1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm8Xt-00GkE6-2H;
	Tue, 11 Apr 2023 07:36:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm8Xq-00GkD7-1t;
	Tue, 11 Apr 2023 07:36:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 881336224B;
	Tue, 11 Apr 2023 07:36:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE4DC433EF;
	Tue, 11 Apr 2023 07:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681198561;
	bh=9ighdUcP/UTYLMiyXaga2dDu7U1Ozp7TXI7PHr3dDYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pc3B3hgSIKCjI2c/0a4HjZdd2ehgt6z2AB/2lkt3ZD6vimWx/pG5aGfdOrQOKPqBx
	 gjPeI3PzxplsapH8uFKl4f+UNMeQlirH6NJ6KQEL4JYpMdrlAhgc1e/+qQSLPnJ6Jt
	 Z1r3Ty3+mnw9Oj7MUoOrTlHiUY2ndF8deB2I3KnvL3FWE7fXSuDRq+RSoWwlPp3c6D
	 qv/asV3Ccah13L3j+wQu/EayolE5EbXi4uitIEu42TucY1rgfDOee6evA4HatXTpwF
	 6dJhup7XFRTiwuy8FxHXbRACloOKnZ5kfXVq4yfp6LSnzMlnfs/3XmYg/cP3gsVGh1
	 8lMMn383lj2Lw==
Date: Tue, 11 Apr 2023 09:35:55 +0200
From: Simon Horman <horms@kernel.org>
To: Chen Jiahao <chenjiahao16@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, guoren@kernel.org, heiko@sntech.de,
	bjorn@rivosinc.com, alex@ghiti.fr, akpm@linux-foundation.org,
	atishp@rivosinc.com, bhe@redhat.com, thunder.leizhen@huawei.com
Subject: Re: [PATCH -next v4 1/2] riscv: kdump: Implement
 crashkernel=X,[high,low]
Message-ID: <ZDUN2+WG3OKGN/oq@kernel.org>
References: <20230410130553.3226347-1-chenjiahao16@huawei.com>
 <20230410130553.3226347-2-chenjiahao16@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230410130553.3226347-2-chenjiahao16@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_003602_682644_C98308FE 
X-CRM114-Status: GOOD (  11.63  )
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

On Mon, Apr 10, 2023 at 09:05:52PM +0800, Chen Jiahao wrote:
> On riscv, the current crash kernel allocation logic is trying to
> allocate within 32bit addressible memory region by default, if
> failed, try to allocate without 4G restriction.
> 
> In need of saving DMA zone memory while allocating a relatively large
> crash kernel region, allocating the reserved memory top down in
> high memory, without overlapping the DMA zone, is a mature solution.
> Here introduce the parameter option crashkernel=X,[high,low].
> 
> One can reserve the crash kernel from high memory above DMA zone range
> by explicitly passing "crashkernel=X,high"; or reserve a memory range
> below 4G with "crashkernel=X,low".
> 
> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
> Acked-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Zhen Lei <thunder.leizhen@huawei.com>

Reviewed-by: Simon Horman <horms@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
