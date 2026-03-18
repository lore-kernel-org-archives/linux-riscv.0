Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D121088E52
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 23:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GrDxLn5uyepgdeGY2V71OwrbeUkOcgMRAUzfaH0g8cs=; b=Fv0R9vpH1dpnIh
	cmMNP7JkuCPhqom3ik0AoeuR7K/wHFrb2xJuNUWN8wK5KthWnhUh+nn7YZ7di5ZQeHoBWiumQ/zBT
	XUdghodvdXI2e4WryTZDZWLyRe6H0R6NrocNYAF43X1sAA4fCGj1wn9IwMhkndY+uEwoCmC7GwRkA
	QfOe1nEwxxjUExNRvRSFJPLRpU1u87K7r6PN7rTGdFfyuuFpmoxIDS1jKagmaS6xjeOnRkVssM94c
	cTr/Jqe4UO+BdwQX4TNdF5pY1cToc4U0GGuYkgqHTTf4NrNmJqDKF4wRWv/+CIeRrMPOWUZNMyk4X
	rY06gnCIKbdBHpF++IAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w30F2-00000009Vcr-3Ii1;
	Wed, 18 Mar 2026 23:23:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w30F0-00000009VcB-2uP5
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 23:23:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AAF9241811;
	Wed, 18 Mar 2026 23:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD85BC19421;
	Wed, 18 Mar 2026 23:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773876233;
	bh=iX7gUOL5Seq3NkcT+9Kn3/IaV4w3PsjMhU4UZdw7oSo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Zd5O/DU8a5PK0tvblVPBeyJf4h30BEkuJo44GrQKFYILMyuOMq2hJ3cRl2eiz2mic
	 oY6cm/NHpVllwZf5XVf/E6B11UZFPvAINtE1QBbTrvldsWEw5ogM10lg9Ovkjby8Xq
	 o+NqZ6vNYxBO10mam+asOiBXEBLHx8a22RKaskKscfeLVju6ybqoreCuLqEH+nH+0H
	 JOZred3OzkXpRhXRlM1j+Kjjn191OLwkNT9ZUcpYnOXu2HFVOsw6MDj6BzRDUAC5Ld
	 VhKTuKIjiikKxWXoZJffD8A6SHJxfEhHZRr9tR25uGFcVHlz/X7xPAaB2EhlaoppEu
	 NZyron7LcjBSA==
Date: Wed, 18 Mar 2026 17:23:48 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Kunwu Chan <kunwu.chan@linux.dev>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, 
    Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
    Atish Patra <atishp@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
    Deepak Gupta <debug@rivosinc.com>, Zhouyi Zhou <zhouzhouyi@gmail.com>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] riscv: fix minor typos and style issues in
 XIP code
In-Reply-To: <20260214023804.677127-1-kunwu.chan@linux.dev>
Message-ID: <26ca22b1-b6d6-a733-2ab0-7fc83908bec0@kernel.org>
References: <20260214023804.677127-1-kunwu.chan@linux.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_162354_750898_F41E1701 
X-CRM114-Status: UNSURE (   7.09  )
X-CRM114-Notice: Please train this message.
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

Hi,

On Sat, 14 Feb 2026, Kunwu Chan wrote:

> Fix a few minor issues found in riscv XIP-related code:
> 
> - xip_fixup.h: comment typo (_start vs _sdata) and spaces-vs-tab
> - head.S: spelling typo and wrong #endif comment
> 
> Kunwu Chan (2):
>   riscv: xip_fixup.h: fix comment typo and whitespace issue
>   riscv: head.S: fix typo and wrong #endif comment
> 
>  arch/riscv/include/asm/xip_fixup.h | 4 ++--
>  arch/riscv/kernel/head.S           | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Please see:

  https://lore.kernel.org/linux-riscv/609b889a-8bb1-d2b5-8de6-ddeec27cac04@kernel.org/


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
