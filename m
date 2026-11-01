Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4F86070EA7
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I8qBVh1v;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E/aQ2MKr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B0izYy0lLq+1qBOuByQspO2Cw2QT1BGkT3ZkvPnSa4o=; b=I8qBVh1vYuq2bu1XIgy0qp+8UT
	BvS/aI/N65WBpOH2jiCjKIF+rMx9Lzist7v6p/G2lvIZ0kSAR5a+npuU6n20fPVWpXpUEG3FDrEkv
	CRRhkxJT8dUsglf3xtU1MpcsGex7aoYQXRazdBxFpz84TRnEwQzkVDDi1ckXKwNw26qk3HMttUmFP
	+/meGR4mApjppjvk2th8ZM6SKGv1K+rqtbehALunyheCb3I3wXJIgHUrIktpjoBMzdT0jN364/Laq
	5BhI07zRWTs2iM8lZZbF3y8VjqxHAf9Qs4qNafT93/YelKChMvaZVibWgJ4S0nVYBWPsXznEmMIjh
	Ji7zVynQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqx-0000000F0q9-15Jr;
	Sun, 01 Nov 2026 22:16:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqe-0000000Ezyn-3Qzx
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:16:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 230D66060D;
	Sun,  1 Nov 2026 22:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C768E1F01578;
	Sun,  1 Nov 2026 22:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571379;
	bh=3jtJ8UO3TkxY0olDal3hNFiHyaDqKlexwUqaCAVk6ok=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=E/aQ2MKrGbi8mlSbFdskUu+G46rV8LTVckPtm9QEs2zR6KBVwpg1cdZTLjU3MPKFX
	 8hDyOtmRO2vLQl2nvvOumhVUBUjD2pQLrIGfZJNBq0lVm/FXApgzycubsx3wdOjcvj
	 4GFAtH9vVAYaMyetYOHalb2p1YW6Pgfta/AN0sBlmrOPqWpRoHhM9r7I7A/84zl9vU
	 OQBNREIuzXWERb7PVgKWI4AtxQjpRDSB5g8qSKAAO+c8+jOwBoaGYT3pxPDT3424fI
	 fbbdqrCQERz+qdOUmFCmlujLaGBL575NzeDeupoGvnqLS3Ds5HcDfaAI1XuyNGkpE6
	 ItL837Zn2+DJQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA21038003B8;
	Sun,  1 Nov 2026 22:16:19 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] irqchip/riscv-imsic: Reject overlapping group index
 fields
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357137829.2624073.14938760984077073549.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:18 +0000
References: <caplitmus-rv.v2.imsic.f2c0e5bdc627451c83deb0cf7eb8834a@163.com>
In-Reply-To: <caplitmus-rv.v2.imsic.f2c0e5bdc627451c83deb0cf7eb8834a@163.com>
To: Pengpeng Hou <hppiscas@163.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, tglx@kernel.org,
 alex@ghiti.fr, andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu,
 bjorn@kernel.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com,
 pjw@kernel.org, radu@rendec.net
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@kernel.org>:

On Sun, 20 Sep 2026 21:07:54 +0800 you wrote:
> The IMSIC address layout places the group index above the page offset,
> guest index and HART index. imsic_parse_fwnode() checks the individual
> field widths and the upper end of the group field, but does not check
> that its lower end is above the other fields.
> 
> Reject a nonzero group field whose shift overlaps the lower fields.
> Otherwise a firmware-supplied layout can assign the same address bit to
> different indices when MSI target addresses are constructed.
> 
> [...]

Here is the summary with links:
  - [v2] irqchip/riscv-imsic: Reject overlapping group index fields
    https://git.kernel.org/riscv/c/8caa8fcec8db

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
