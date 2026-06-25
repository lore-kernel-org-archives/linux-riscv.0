Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF2ACDE001
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 18:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ooPhO6O5lAu6oPcMrImFCyMO/6xhRbLBWiV8Jp/ZLIg=; b=fW/NNuiUc5gKDR
	MT7Nff8buN1YLUfexKznsVHJ1KjLcc9Y0dcVlI0tQ1x7O31batE6Q0mPulzl/2K3C3p/KZQPSLr7P
	PKWKTVF6H33a0EjsNH9OleUuWFWlfSCaf9UCm2jP5conP8+uxh0LSk9uhLmez/qoR5k7VPBgmdyI/
	10wU/8ly29IArwV+OP+cP8kzBoLb30oyds2ihBX59p8J7qc1atiqsdi7ao3MhbaZshoBiCzvQdGrU
	S3sZEFwNQ/rD8rRIiKpycYZQzktRlgznsXIp5luqP7bYlSxZAdcBiOiNZkaqUV4FrZSsc6jAF2gNT
	27n1J1RhVg0LqEB503xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcoQZ-00000009ems-4A5e;
	Thu, 25 Jun 2026 18:03:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcoQY-00000009emi-2u76
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 18:03:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 56BE7407B5;
	Thu, 25 Jun 2026 18:03:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B741F000E9;
	Thu, 25 Jun 2026 18:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782410630;
	bh=ldT3ZutHnlLTCWaVkRW0eAVXtxjtKLGOznBPZGps30o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=JGbPKCCCqs05F2yhEokShHu5Uk9KOg2AgyMzKJ50zPSXbU3iBE3O2EzUTF1PS+Oum
	 zC4IDaaDyksVxH0CfD2xyNnjvI6sjPC6MKMcAuISQJNEqcWZdxuvsJk/s8Pk3rDPlE
	 arkMirEAW/kQ9Gm4qHfD6Sx42m+LhaJiB9CqA6E3s6kgPVLlYqIXeEke1FwvtcRz7D
	 5uwnsSQ8B5lJcKxhDeiOM6WJEryN6r3DO9tj3pxOpRrHXUjmYcHj/sRjajrOV+f2SI
	 /YxHcCi5UxCDtqhT0v7U2kuVReUcmNJUTrI4ttebz51VzB2ciYKseJ3rjZZlMBZLqI
	 kB1HE7xwtK6bg==
Date: Thu, 25 Jun 2026 12:03:48 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Joel Stanley <joel@jms.id.au>
cc: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Jim Shu <jim.shu@sifive.com>, Zong Li <zong.li@sifive.com>, 
    Deepak Gupta <debug@rivosinc.com>, 
    "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] arch/riscv: vdso: remove CFI landing pad from
 rt_sigreturn
In-Reply-To: <20260623204058.498120-1-aurelien@aurel32.net>
Message-ID: <fd0c06ce-f842-95cc-c517-7e6fb2c5b2c5@kernel.org>
References: <20260623204058.498120-1-aurelien@aurel32.net>
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

Hi Joel,

On Tue, 23 Jun 2026, Aurelien Jarno wrote:

> When CONFIG_RISCV_USER_CFI is enabled, the CFI version of the vDSO, has
> a CFI landing pad instruction at the start of __vdso_rt_sigreturn. This
> breaks libgcc's unwinding code which matches on the first two
> instructions. Other unwinders that rely on similar instruction matching
> may also be affected.
> 
> Since __vdso_rt_sigreturn is reached as part of signal-return handling
> rather than via an indirect call/jump from userspace, it does not need a
> CFI landing pad. Remove it and restore the instruction sequence expected
> by existing unwinding code.
> 
> This matches what was done on arm64 in commit 9a964285572b ("arm64:
> vdso: Don't prefix sigreturn trampoline with a BTI C instruction") for a
> similar issue.
> 
> Fixes: 37f57bd3faea ("arch/riscv: compile vdso with landing pad and shadow stack note")
> Co-authored-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

I'd like to take this one.   But since you're listed as the co-author, I 
probably need your Signed-off-by: as well.  Care to reply with it?

thanks 

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
