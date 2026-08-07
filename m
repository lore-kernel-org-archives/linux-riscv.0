Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A6AC5AD2B
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 23:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LA6l3izVzV8O+6Cbpa5H9fOH1GpoKif1HQqGAi+k4a8=; b=xolu4+g75zfYHJ
	ZRsseTGopjsIcrgTqh0Qe2xE4tQd6r65Zo4yIfY7OiBFRB+YvminUzudxiJBSpSfzfzPU4eejieao
	Vprn+pYZtWQFc+6xZPZK7TJvOs2C0UjtCwiF3NcVsvyWZ0+NZXZ85ZtkuAGIcBdWgCt5IqDcYsB0Z
	E2y0zNAIfpvKNMMPgeDh0hgUqYr8Jh6KMFh2PkOUSPoA/8rIzPa6ezeWIpdL6en4GvFtAfSk1ZJmh
	lfY6tzyu9tm0VVPmvVrPupImm/wLy2cPvF71bxC8qArFp45afz9UboLStKRfA1eynH80GH3Jh6sfS
	cNqpD7+ura+tJoJ6wE0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsU0G-00000008sMG-0vGe;
	Fri, 07 Aug 2026 23:29:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsU0F-00000008sMA-2lCi
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 23:29:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0018140220;
	Fri,  7 Aug 2026 23:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 913F11F000E9;
	Fri,  7 Aug 2026 23:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786145366;
	bh=EDHXjLL0Gwpa6aaAOpxjGDadUXy7hM/gH+SlNv9whxM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=VeKri/r10u1mitX1go8Ar+UQMuAUJykyiPX9PQxDCAR+1bsrJF6lCpXU84+uruLNd
	 72y79mukVUPgQPh24Hs3O8qqcBsuWAm0Zr4GR+OpvDp2nSwgOVAzdDov2tJJvZHnxa
	 Xp7UF9tEwg3w89Eynu/2WRRy6JEph3XZFZOOIo/2JPzF4Rl5ws572156IUccNQa+zk
	 sjChHn4i42AnZemvWCTrfp8FWSixx9nzi0QhwXzYfQZU54d0CBy82YcDJNr5lYV7ea
	 nFjgc4OT/rjPepBGtOQ5iYCMSKsHUe5fAkHG7mF2egitqkqZXacX64PLfpY2utr4zm
	 o/NOiJ6srebJA==
Date: Fri, 7 Aug 2026 17:29:21 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Nam Cao <namcao@linutronix.de>
cc: Paul Walmsley <pjw@kernel.org>, Rui Qi <qirui.001@bytedance.com>, 
    linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Kees Cook <kees@kernel.org>, Jingwei Wang <wangjingwei@iscas.ac.cn>, 
    open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: hwprobe: Register unaligned probes before
 usermode
In-Reply-To: <871pcaa2g6.fsf@yellow.woof>
Message-ID: <5a181a44-4f25-6cff-fe17-ac1995da8ebb@kernel.org>
References: <20260721150511.1607105-1-qirui.001@bytedance.com> <8884ef1b-9fd2-7300-d7f1-38d061cabf0c@kernel.org> <871pcaa2g6.fsf@yellow.woof>
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

On Fri, 7 Aug 2026, Nam Cao wrote:

> Paul Walmsley <pjw@kernel.org> writes:
> > Now that we've queued a patch to get rid of the async hwprobe 
> > infrastructure, is this patch still needed?
> 
> Yes. Removing async probe only ensures probe is finished before the
> kernel is done booting.
> 
> But there are usermode helpers which run while the kernel is still booting.
> This patch ensures probe is done before that.

Okay, thanks for taking a look.  

Thanks Rui Qi for the patch; queued for v7.2-rc with a cc: to stable.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
