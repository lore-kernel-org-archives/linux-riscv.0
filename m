Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFC2EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 15:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dY/RX8ZnIpA1HHiV1AR9v2k5BUTJIQygJCcpz1DOnSs=; b=NFJB+KbcAhxHFI
	/+WQpfmxf9wVF4VBlxiX3LUrlX3LGzQw8tBMRQxfn/acU8rK04QJJPKWql/xs1YDuS9McX/lbdFm/
	exkmFxe2UUZT6PXrw986Tq+QM42H93Bd6HKjAELHPI+O0QGhVSE7clq6EF5YBOHuRdbUklvMHAt2r
	Dcipw8WWGZYRBFCDglsYyP1KwrSdCrIhr5eMIM0mvC/KCjwh69Pe/m+VNokGiPisMM6VhshorKFFH
	OLwKreESmNICu4sqFcwkuhFKidtKxocf6sNERLlCEU2Smx2ad5DntiqlUT7m5zuGXa6wA6+9DQ41d
	7u9/J2vBC/r/CDyMF6Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHn6K-004zEZ-1H;
	Fri, 07 Jul 2023 15:10:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHn6H-004zDC-13
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 15:10:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1B8E7619F1;
	Fri,  7 Jul 2023 15:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82547C433CB;
	Fri,  7 Jul 2023 15:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688742623;
	bh=U6KsKCn+WysnmmbrKOIXVZaK03AvzvVVtbaS0UtZWdU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oMsmNkvsB+udmG04CA2mWFShB2ak92LOvlg18iswTS7zAKUycHWR13XLmG4TsvRjD
	 Tan8FsRRYv8n1ceHy3fCVg5G2qYa/7T2fcmedvaXD31hbMLhGQk81hgJwx9AYtXcz2
	 NVdfsVr2iyGDOX1EXJxSdh7DDFYzpDuQzRCNyAGojBjBW1jmkQAqwITre1mzTc2zJ+
	 Wb31x5KCLsPN9AsZKpxFAa8ne8jxpUCV24FJUd+SldOhl3SE7sgesk/TWIIY1vV4j0
	 wTLfET8VQKG3lKx0J2R2gC9zml+JcjJzGZ9pIv5VpbNsMOf4ctfAXSRN7v5wLT5KJD
	 EAHvZZ58b7Hjw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 67829C59A4C;
	Fri,  7 Jul 2023 15:10:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: Document the ISA string parsing rules for ACPI
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168874262341.15275.3814062796916398993.git-patchwork-notify@kernel.org>
Date: Fri, 07 Jul 2023 15:10:23 +0000
References: <20230629031705.15575-1-palmer@rivosinc.com>
In-Reply-To: <20230629031705.15575-1-palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, apatel@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_081025_432136_EDB893B4 
X-CRM114-Status: UNSURE (   8.19  )
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

Hello:

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 28 Jun 2023 20:17:05 -0700 you wrote:
> We've had a ton of issues around the ISA string parsing rules elsewhere
> in RISC-V, so let's at least be clear about what the rules are so we can
> try and avoid more issues.
> 
> Link: https://lore.kernel.org/r/CAK9=C2Vy-4V9kgnga98tiC3TeHkR2LFPakyBbS8s_h3_Z=ieyQ@mail.gmail.com/
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - RISC-V: Document the ISA string parsing rules for ACPI
    https://git.kernel.org/riscv/c/5177978ee074

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
