Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C86E109E52D
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 23:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8zG9jKVI7uZeW26tUoh7oXVu0G/rbuOUbx/836jFAc=; b=GfQ0hthxmkIGl1
	L5pQeV88auvbxumg/ffWLr35robvgF8DgxiRJT972VGz1FgRwHhnRwsieeGmekVi2K79KfvyT8yTT
	dl50mbiMytZ1U29RMkc21IPyTmbVbgWZzQBxJsOaJVXVt5BzzWD6x2Ksqm8a6BnWRv6gfn31wtCRZ
	d3fIbMKAwpWk1zwoG8+2JvXkhOScRPN99j01VmIlHqPK5+mBGrTBm+u2iK4UsU6+d4lDYOdacbcxi
	cYBhukhNkBKpAWKaMKgA+ybozzGVLr5tPRzA1rnA2fQnPUn0KH4UROTc0xDf0so2YrzRtPXaRMkHK
	VMIOnIfCYAQQszSDuG/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5XOI-00000004PGa-3U5s;
	Wed, 25 Mar 2026 23:11:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5XOH-00000004PGT-0SKL
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 23:11:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 19D1A60053;
	Wed, 25 Mar 2026 23:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E52C4CEF7;
	Wed, 25 Mar 2026 23:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774480315;
	bh=CoijEhfKP+7uttDnMp7Oa/n8h7udRADYfzNGBzWJsXo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JSICdvC/ABLFDEu5oxvRjGHOX5cDUiKMklZCoJLd03zB4V46S8spvkA3e2ksCY/qE
	 MQnoHY97e9ZZ6sKgbLsgs4nDjWJu4skL+qVXm6KBT979IuNlhQ9icH7gV3g2azqpjD
	 gxnFxGjHBR0HVblgMkPcEOmDDpmKMTmKHY0cZBxRwiP5+jkPlYBNlSd4q44E0AntvU
	 Sm1UAnwaeFJuSarID4fZe5h3vham7bdPdnyIJilVoG+PVdxCjYRS/nbDZAGKuzMAOO
	 U45tRYJEgEeMPX4o1hq69+kgj4+/x+umjuloH1Mb1MQE4ewAXufW5576aczn+wOBan
	 f185K/n2WNBLw==
Date: Wed, 25 Mar 2026 17:11:54 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, sophgo@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: mm: WARN_ON() for bad addresses in
 vmemmap_populate()
In-Reply-To: <20260309-riscv-sparsemem-vmemmap-limits-v1-1-f40efe18e3cd@iscas.ac.cn>
Message-ID: <305ca5f3-3f07-05b2-e1ee-38da86a64a26@kernel.org>
References: <20260309-riscv-sparsemem-vmemmap-limits-v1-0-f40efe18e3cd@iscas.ac.cn> <20260309-riscv-sparsemem-vmemmap-limits-v1-1-f40efe18e3cd@iscas.ac.cn>
MIME-Version: 1.0
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

On Mon, 9 Mar 2026, Vivian Wang wrote:

> Similarly to the same check in arch/arm64/mm/mmu.c, in
> vmemmap_populate(), add a warning for start and end being outside of the
> range of vmemmap.
> 
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

Thanks, queued for v7.1.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
