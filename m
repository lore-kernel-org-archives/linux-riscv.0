Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF25C10F1B
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 16:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=goqWdrrnF3xt2fDAoFQLqMl0Nsiezy/Kgh7yQE9ZYYg=; b=3LwiWyFonqEXUj
	yg5r7p14US/HtLiYZsIWIygkq3Y9NrLPKj4kg1wIySub7P3A1cXjVfGs+Oi/B+huMtj36jJndgKB1
	25nchd+1721qNKjmaiudy8hJckm98cSicUynMyNvvY8ZpCLZDIrra/JeU2j6ffO+YSWDWHpVkiR4i
	qGQ8jG5Dsilgsljz1QRR8Iyid6S0C2QqDeQmMhLEfEdK+dxCOJ+7U5g9CLmZTGjIT9F2MB1TSnUpd
	LZiLepdjZpZdJkXLPV0YdaKQFvlxXEyWW6pa7ry0r6lpF5A7HxOtc2jpB4EmjxUp4LDsRFD8T1BGP
	x4sLUk1zBi+RaHQCS+sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p58Ah-002r5M-Vz; Tue, 13 Dec 2022 16:30:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p58Ad-002r2i-MV
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 16:30:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2B0B7B81269;
	Tue, 13 Dec 2022 16:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB52FC433EF;
	Tue, 13 Dec 2022 16:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670949016;
	bh=huwUWZssvH9lvSZGoaMuHrQIi4jrbV1rQm5T58bLcKs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Kob48Mt+e+TpcN5moFEyPyJyBB60q6/CMsm1DI6kC71q4ui6fUxhhGyKgRIaXtSCP
	 zL3u0sFKCiVaOhKApDvJmsJlZhe+P0x0DOuGAmurO+3v0nA6U/QjLAza7d4llTZkUk
	 JMbiBw6UvQWYXTvyCHSuTuCuhlJdr2gDNeYzZCa0Ik4eZyte0pLEkcghYLk5WnvPzv
	 VwwxrxvdVhQessX8PqMylGnrrursyRuF6zKKkWOfg21PYEdldzYi+rNRK3EXjl8+9Y
	 duMMEvMzgzYRaKfCKWilvmUbEwYGRJffQpbdB+7sFqIqr/yF2X9g9CvyNWEQUCJkfN
	 rjfb77q4xmBYw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C2931C41612;
	Tue, 13 Dec 2022 16:30:16 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Apply a static assert to riscv_isa_ext_id
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167094901679.29011.12310651252612402692.git-patchwork-notify@kernel.org>
Date: Tue, 13 Dec 2022 16:30:16 +0000
References: <20221201113750.18021-1-ajones@ventanamicro.com>
In-Reply-To: <20221201113750.18021-1-ajones@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, heiko@sntech.de,
 conor.dooley@microchip.com, jszhang@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_083019_895426_7E988F1A 
X-CRM114-Status: GOOD (  11.54  )
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

Hello:

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu,  1 Dec 2022 12:37:50 +0100 you wrote:
> Add a static assert to ensure a RISCV_ISA_EXT_* enum is never
> created with a value >= RISCV_ISA_EXT_MAX. We can do this by
> putting RISCV_ISA_EXT_ID_MAX to more work. Before it was
> redundant with RISCV_ISA_EXT_MAX and hence only used to
> document the limit. Now it grows with the enum and is used to
> check the limit.
> 
> [...]

Here is the summary with links:
  - riscv: Apply a static assert to riscv_isa_ext_id
    https://git.kernel.org/riscv/c/e923f4625ed3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
