Return-Path: <SRS0=r0AO=M3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB72C28CF8
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 08:40:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB1AB2064E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 08:40:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GTpNrQyZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB1AB2064E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XyEgjvQ5X0Vdgj6DxVJgJcXv/pgeWMXa3wVtqL65JTg=; b=GTpNrQyZsrJOMI
	iZy+zmv9aywy1gsxKj/Wf/5dmhXnksSmltSCamDG7JSXn9lPPKAGuCld8e0jvFPlzsvwySGeZBL15
	HiucXVLfKXEX3ivW2iKy3U8nRREjme7MEwo1dALgxHUC8jEQfS7c3ZVq965yM8PgY5QwDBqWdm4Rh
	nNOFK+w+Tv1/uHRqJ+YzzWYPwYBJ8fL4GHFDxMjkI37iDsPbbQj+pyRU0HNBT3mVGRGFvQlqy3Jle
	bFTriUazHJwCrw10vWMAJ0rY4nzR58nxQMMwSKsR9YNT2A+NX4/o+67FCEfxlLvXOjCGZRy9hjjnb
	Re54Qs8Ux0DtJxuwOoQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gByQC-0000Li-W2; Mon, 15 Oct 2018 08:40:17 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gByQ9-00009T-W2; Mon, 15 Oct 2018 08:40:14 +0000
Date: Mon, 15 Oct 2018 01:40:13 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jim Wilson <jimw@sifive.com>
Subject: Re: [PATCH] RISC-V: Add FP register ptrace support for gdb.
Message-ID: <20181015084013.GB11826@infradead.org>
References: <20181013005649.14379-1-jimw@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181013005649.14379-1-jimw@sifive.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181015084013.vi3wlhSRwNZrzxyzzrjWwUStFhp-vuQrFYlX4I7KSDo@z>

> I think there is room for improvement here, but not sure if that is required
> before this can be accepted.  I'm abusing the ELF_NGREG macro because we don't
> have one for FP registers, and the elf_greg_t type again because there isn't
> one for FP registers.

So why don't we have a proper macro / type for the FP registers?

> In the riscv_fpr_get function, I'm using a single call
> to user_regset_copyout which means effectively the entire fstate struct is
> being copied from kernel space to user space.  That may include some padding
> at the end of the structure.  I don't know if that is safe or not.

In general we should avoid copying padding to userspace as it might be
uninitialized.  If you can't avoid that the structures always need to be
zeroed explicitly first, which might to lead to security issues later
on.

> This could
> be fixed by using two user_regset_copyout calls with a little bit of extra
> complexity.  Similarly with riscv_fpr_set and user_regset_copyin.  This
> probably only works for targets that have the D extension.  Not sure if
> this matters; I don't have a system with only F support, or no FP support,
> to test against.

The kernel currently assumes the D extension is presend if the F
extension is present.

I don't really know enough about the ptrace code to have useful
comments, but the code should depend on CONFIG_FPU, otherwise builds
without support for the F and D extensions will fail.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
