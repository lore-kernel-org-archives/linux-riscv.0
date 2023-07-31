Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22B2C001DC
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 09:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUj89yWIpVu+5MmXRAnZoEsMwTARSFtw68lySD5fc4w=; b=f7EzVVHk5yZVBF
	joMxZ1c28TpazHcc3KZEdwb866pymRAM9s5CrEERuytgVdHl2KXO98Szivlaf2MdD8GKGfjnG9ILV
	eqhUTzXTsQsEfEO5YpI5P0PHeAPxfQGmaPAKQQRsT63m9k/NEP2eFxIBf9IG6nkX25Pzyze+kBO+N
	OCRUyYc3gMBL+zJ0PQ/Q1nwoKE+8GHkcN+eNyYmT39dfle2g54/27KBx1l54LbGbKS6H5Y2clnoyE
	Av7EO+4Q2C5PPPAbHO0/PNMWOCS/C0QBSoc8RoFaJfS+9eHt0cvGTXkuhNYF88z6ef8gXp5LwYtob
	3C8GXsvozvp2lsYxNbTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPdg-00EsdX-2X;
	Mon, 31 Jul 2023 09:56:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPde-00Esaf-0g
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 09:56:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 24FBA60BA1;
	Mon, 31 Jul 2023 09:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7506C433C8;
	Mon, 31 Jul 2023 09:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690797388;
	bh=r6d0QvBm5c3aVqIjW/FjofLf6a13RLH6NmOQw7Kne68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LYf2e2k2bvNFUNfHRA7/KmU1Qs9xCMChe2rHHHCrlhiMgB8lzjmPhSkk2Ba5+Upwz
	 sb9HnepDhjH0fIaoNcj6rZZMTomzNxJSJv232Q5A1hDDv+VNQ9Vs0XM8LtIq9Yt9GX
	 f4kohnPm2aQA1MmU48jz+StoQ+lQ7n1pp7f1OW8NYfQKGRMxvBnEIbr0+Q9kE+r9Fs
	 XIPNF/vfUtWtIDku22RV9vAJKoGuhO4y8/Sw4MC2AeL/ZNPW/Uoe2iKEqdmeH3sJdM
	 t5UuHOZTO2m1nHkvH8H0uKhm+Y8M5QXaf9iXqcjLUBLQKBblWEDNOph4LYTy+BzBxA
	 6Bd9Dpym9xRgA==
Date: Mon, 31 Jul 2023 10:56:23 +0100
From: Will Deacon <will@kernel.org>
To: guoren@kernel.org
Cc: David.Laight@ACULAB.COM, peterz@infradead.org, mingo@redhat.com,
	longman@redhat.com, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V2] asm-generic: ticket-lock: Optimize
 arch_spin_value_unlocked
Message-ID: <20230731095622.GA24621@willie-the-truck>
References: <20230731023308.3748432-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230731023308.3748432-1-guoren@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_025630_312213_48C04471 
X-CRM114-Status: GOOD (  15.57  )
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

On Sun, Jul 30, 2023 at 10:33:08PM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The arch_spin_value_unlocked would cause an unnecessary memory
> access to the contended value. Although it won't cause a significant
> performance gap in most architectures, the arch_spin_value_unlocked
> argument contains enough information. Thus, remove unnecessary
> atomic_read in arch_spin_value_unlocked().
> 
> The caller of arch_spin_value_unlocked() could benefit from this
> change. Currently, the only caller is lockref.
> 
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Waiman Long <longman@redhat.com>
> Cc: David Laight <David.Laight@ACULAB.COM>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> ---
> Changelog
> V2:
>  - Fixup commit log with Waiman advice.
>  - Add Waiman comment in the commit msg.
> ---
>  include/asm-generic/spinlock.h | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

It would be nice to see some numbers showing this actually helps, though.

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
