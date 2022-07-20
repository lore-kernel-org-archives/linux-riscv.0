Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7C6C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jul 2022 22:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=zcERa9lWY1qiRwnUA76XoveIDTgXhTMRsrqjHZHL86w=; b=3o6Uhg6u86dAjO
	CFdPzCgbkOFyIFvKLzLpii6Tqu5NOmHpMcapuBZqwTlNk0XcOKuqave5uM0BPu1wJ28Imdhxf+RKN
	ha8n3vBqKp2hKTNEDErOh8Wlb85phW0Dud7T14RCI+yZQ2QPdp7HrwRsh0yLz4pmBnE/oQjzj4ajb
	jzdnp64q6sqsTXQ4WuhRBJedR3WYsAwgDKP/XHqwiTAbzGKzjIvZuTceWvlywECHAnL49qkh8bPTc
	/AIISyYacmt9/yASTGTvFuhD5bwQcQ1/TjErIoiVR907SNO0GV15q0Q7A3k9oCStXpSx65KSf5KCZ
	CsoyJNKY6Dan83on5lOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEIP9-00Camm-4W; Wed, 20 Jul 2022 22:42:55 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEIOx-00CaeJ-Dl; Wed, 20 Jul 2022 22:42:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C53F8B82210;
	Wed, 20 Jul 2022 22:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2933FC341C7;
	Wed, 20 Jul 2022 22:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658356960;
	bh=1V98A2z1F38fHHvrHBoo3HaWj6yGKB/FnX3vGN/AvvA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=m79q/3nOeKxO56yGLe38LNngUjS5YlwsOdqK12cNE9FC0rQpA5M2cKg/8rHwh60Z5
	 BPAAVPRoJ5JJmqHBUcAX4ttH61aNg6RrVZ65eqZElDOUIG3z1nT5nL8QdLrXM/RAi5
	 y0YlLlcHVolcpqBmOq/O70j4oT9+v54KkULa09nMFF0etcuRk2rnIcjvozDv+tp+OV
	 rqo9SjfsM4FuruB28UMpLNS7Oru40GeOfbHjKn3kYTXRQo98BK6Z3F6sfIuqGEW7Ik
	 eCHm/TKEeRLSeVUFF5Bf/qzKi+i6Dt2/JQShBjFekRlJOmVNQaQUA+aekpY3hRDynf
	 2QFzdbfgbYpxg==
Date: Wed, 20 Jul 2022 17:42:38 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Pierre Morel <pmorel@linux.ibm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-um@lists.infradead.org,
	linux-pci@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v4 3/3] asm-generic: Add new pci.h and use it
Message-ID: <20220720224238.GA1666095@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220720131934.373932-4-shorne@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_154243_630485_FD8E9CD7 
X-CRM114-Status: GOOD (  13.72  )
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

On Wed, Jul 20, 2022 at 10:19:34PM +0900, Stafford Horne wrote:
> The asm/pci.h used for many newer architectures share similar
> definitions.  Move the common parts to asm-generic/pci.h to allow for
> sharing code.
> 
> One thing to note:
> 
>  - ARCH_GENERIC_PCI_MMAP_RESOURCE, csky does not define this so we
>    undefine it after including asm-generic/pci.h.  Why doesn't csky
>    define it?
> 
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Link: https://lore.kernel.org/lkml/CAK8P3a0JmPeczfmMBE__vn=Jbvf=nkbpVaZCycyv40pZNCJJXQ@mail.gmail.com/
> Acked-by: Pierre Morel <pmorel@linux.ibm.com>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Stafford Horne <shorne@gmail.com>

> diff --git a/arch/arm64/include/asm/pci.h b/arch/arm64/include/asm/pci.h
> index 0aebc3488c32..016eb6b46dc0 100644
> --- a/arch/arm64/include/asm/pci.h
> +++ b/arch/arm64/include/asm/pci.h

> -extern int isa_dma_bridge_buggy;

Shouldn't this go in the previous patch?  The only definition of a
isa_dma_bridge_buggy variable is in drivers/pci/pci.c, and it's under
#ifdef CONFIG_X86_32.

Same for csky, riscv, um?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
