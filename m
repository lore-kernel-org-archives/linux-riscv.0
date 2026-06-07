Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D21CD8C8C
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 06:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+iDsSarJ/OV/brAvXJqcVJsYm5c5Cq09mnsSI6ZcP8=; b=qfUGp7avInrYyp
	l3Nf+gt3WnhW9l+/T5WYSxTZlo1NybPV7Qwh4I8mq9ezZITP10H+1QsUvYX5k8v7dX3ODseA53ys8
	6CkrnPujL9pa6MPK09nRqPamJTmIfkDqOgOYK5ar19NWEm0N+j6ub+o3XPqD1sG0Q+fZ1hby6CLsH
	3ilpFS6nl1/UBQHDbuuEV5xkdnWZ7Rk8DYC0Fku6w2tHrN4V+X1VHkBGt1JMAAEL30Ea2L779PhDa
	4JvcrePTAyW4oGI1JUsG3WVGyiRcJpCoqfhqmOt8JSub7EqccSRQZ+HbCbX3M3K69dplklhiBDOgg
	LsDFBtdD/6ZIhs8YBHIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW7Dt-000000024hb-0bUV;
	Sun, 07 Jun 2026 06:43:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW7Ds-000000024hM-3Tf0
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 06:43:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D98260008;
	Sun,  7 Jun 2026 06:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 669B01F00893;
	Sun,  7 Jun 2026 06:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780814582;
	bh=L0RBItlob1/lCm2QEqFsy3L9ByS4dHuuq7PrYLHZthM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=NPrdMqZvcxVQhGRt4EBBfKFEkzzqQlXZNGWu4ls/OPkopsHtzYttxd9I1hKQas7LW
	 qoFbrWyVcmYin+8cBlYcBkTDMDozfZ4hHilmdab3DBkXn/SrblXaQ4B9lg1m199hga
	 PNWahamio2r4q9QKQrlFhn+8zk1iPDBzueNwRT4p5UXQCjR5KcfROCbNF462Nwiv7j
	 3BnQwG3qb0nQpzeVIKACQ5wOTixXnaOB4iQXXtBVCs2CHDGcEGPfYemWbWUW1Y5DqJ
	 plek6KJKcanjlnOGiGzf/m8eB+XeaaxnhD+WyQhgl9FQ7iUPxAJMrkDkUMLyDgK3jg
	 VmWCQJVfmCB6g==
Date: Sun, 7 Jun 2026 00:40:34 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, Alexander Potapenko <glider@google.com>, 
    Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
    Yunhui Cui <cuiyunhui@bytedance.com>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
    Palmer Dabbelt <palmer@rivosinc.com>, stable@vger.kernel.org, 
    Yanko Kaneti <yaneti@declera.com>
Subject: Re: [PATCH v2 0/5] riscv: kfence: Handle the spurious fault after
 kfence_unprotect(), and related fixes
In-Reply-To: <20260303-handle-kfence-protect-spurious-fault-v2-0-f80d8354d79d@iscas.ac.cn>
Message-ID: <85e01c4c-6616-3ece-520f-30c6f8e53974@kernel.org>
References: <20260303-handle-kfence-protect-spurious-fault-v2-0-f80d8354d79d@iscas.ac.cn>
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

On Tue, 3 Mar 2026, Vivian Wang wrote:

> kfence_unprotect() on RISC-V doesn't flush TLBs, because we can't send
> IPIs in some contexts where kfence objects are allocated. This leads to
> spurious faults and kfence false positives.
> 
> Avoid these spurious faults using the same "new_vmalloc" mechanism,
> which I have renamed new_valid_map_cpus to avoid confusion, since the
> kfence pool comes from the linear mapping, not vmalloc.
> 
> Commit b3431a8bb336 ("riscv: Fix IPIs usage in kfence_protect_page()")
> only seemed to consider false negatives, which are indeed tolerable.
> False positives on the other hand are not okay since they waste
> developer time (or just my time somehow?) and spam kmsg making
> diagnosing other problems difficult.
> 
> Patch 2 is the implementation to poke (what was called) new_vmalloc upon
> kfence_unprotect(). Patch 1 is some refactoring that patch 2 depends on.
> Patch 3 through 5 are some additional refactoring and minor fixes.

Thanks, queued for v7.2.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
