Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E742AC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 19:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/6KqDJ/tk/hQSEEAVqcPZFJfRiC5bapY88k/UvBQHkk=; b=HaAlKzjD3NMQ2s
	r5AAi/gQvbZrBefD7pqKW6APVF3gHnN24Ji7iw3XIW6M6MUAyx7aUBFRNV7VeJ0yTfbHu+IuGtgx5
	BQgQ2fKPdds54C1uj/ukt2wf8LyZlIapdulowGnASExD5C0FiFOEem6yFCttolrgykYDsqTQtZvV5
	c2A9lu+FodYphF19xQ8rfTR4sDA7xTKsg5ErZD08axxhetv8ylksNtkFY9XhMVErFiOHlOaosoyvV
	RFWs2s1gowXVqKEQalXZf93hgeQE60BtcM1Q+a2MsGClKW2AVobfTkx2dWwXitN+Q8CrjE9wJhYDx
	6IoYHwcpr7xG1ZDdekbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1BGr-000qCI-3G; Fri, 02 Dec 2022 19:00:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1BGm-000q9q-CQ
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 19:00:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BCB2AB8223F;
	Fri,  2 Dec 2022 19:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64EACC433D7;
	Fri,  2 Dec 2022 19:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670007617;
	bh=i7Yw3pRcvuP5oe82eh6Wc0f1Ww942Uih2z4wmZubaXA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VNSe2wdOZhqABfKrE/Jj2cDa0NWqxhsVU2/OrhTfPZRrgzluto7EkZ5Z0mKkTewwb
	 aTyofuCsamkNa4ycpb8qUBJWHliPck4hK+Pe9fseXuM8zCS6jmMD/4RRA9LjywRkgn
	 SjZ5P0rWEmy5kJRIQMSDB4QTie2+rmyIu5pfm4DOVpvb11atGQlhZAZCVvrQuMHHOQ
	 uf9t/762mqhrdP+GCLab5O34HFICu3b0zCLpq6Lf0mGHBOubsF8fz8QgUU1rswSC4z
	 3HXr619SoEcwZF/XlHlfWX/h0jnGkqBxVp+4cviWL1yMJ8MZ7KA6+ZklID4p5ykZYF
	 7CByjomGHQt8Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 41B36C395EC;
	Fri,  2 Dec 2022 19:00:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/4] RISC-V: Dynamic ftrace support for RV32I
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167000761726.13669.7374648603111626230.git-patchwork-notify@kernel.org>
Date: Fri, 02 Dec 2022 19:00:17 +0000
References: <20221115200832.706370-1-jamie@jamieiles.com>
In-Reply-To: <20221115200832.706370-1-jamie@jamieiles.com>
To: Jamie Iles <jamie@jamieiles.com>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_110020_613861_48C49312 
X-CRM114-Status: GOOD (  10.37  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 15 Nov 2022 20:08:28 +0000 you wrote:
> This series enables dynamic ftrace support for RV32I bringing it to
> parity with RV64I.  Most of the work is already there, this is largely
> just assembly fixes to handle register sizes, correct handling of the
> psABI calling convention and Kconfig change.
> 
> Validated with all ftrace boot time self test with qemu for RV32I and
> RV64I in addition to real tracing on an RV32I FPGA design.
> 
> [...]

Here is the summary with links:
  - [v2,1/4] RISC-V: use REG_S/REG_L for mcount
    https://git.kernel.org/riscv/c/8a6841c439df
  - [v2,2/4] RISC-V: reduce mcount save space on RV32
    https://git.kernel.org/riscv/c/3bd7743f8d6d
  - [v2,3/4] RISC-V: preserve a1 in mcount
    https://git.kernel.org/riscv/c/dc58a24db8c1
  - [v2,4/4] RISC-V: enable dynamic ftrace for RV32I
    https://git.kernel.org/riscv/c/f32b4b467ebd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
