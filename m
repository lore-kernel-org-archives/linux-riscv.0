Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4EEC41513
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 15:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vSlQQLiGCDlLotCoRmK+2LCQt9QJJVPaCxEduWNxBEU=; b=mGB5S6EkT0Qbn2
	r6EVU+YrlwMfTSxW/15GqC6D3zwd3YhpxO1CO++4yLmCO1oOTkzmMVhrtJku35Bzw/CwL6M13qAqf
	xVr1bQ7FnzDP0PNuP2Vw4t85n/2yoNrOgA1R3i+Rpzh0pQqGb2YqRYYYLRaXtqtznIcLL1HPopQ27
	Z1vA+irlWucx4oLbCg7WrvbHdOCqQCH+UK5VvXQkDAg7gJ7EIg4W74Jox+exAfKVVbdpnvAAHbECq
	2f5XF/1ygA8t1oI2wCQcgP5PhUiby0FU07PrQJUOkj3ww5YgO904j7xltVmWLndKD1ekZICt6Q6rL
	81njZqwfWUdUXmOYkYlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRZy7-00A42V-1m;
	Thu, 03 Aug 2023 15:10:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRZy4-00A3zA-2e
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 15:10:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ABB9261DEF;
	Thu,  3 Aug 2023 15:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1AE43C433CB;
	Thu,  3 Aug 2023 15:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691075423;
	bh=OR7ORL/WtWYYQsez0TJeKB4aloYKQCRJyB84PHkeOMc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rpFlw4AZZsJpZciYfrdUcdyYoxGa9eHUIB8rPJ+UOI53Wo03O4yxnOX/04xev9+x4
	 XJlZfLp2MzbqZN5NQjccyNjJMvJ5BFElI9Pv7kiuoGe/fSEh9ewvpk2cWj4zUbqQhL
	 Adv7+/oD+fY4le6Miu+LwYGTRR5GcYCrgjeaBtH8606nGp2+ADnAx/bZ47zbbzmG1U
	 EdWIh9LEDbtBHum44STILNsX0SOJYlmRvghuBsRFTJERpCxn4f+9bDLKe1QvwcP9bL
	 TBqOaW8LJ/zgfFeqwogkaubMsp6XgDy2QIM/g/kS25QILxKSdqIVAO/ENYsPSFJxJY
	 PKMdS/rogAkhQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 01E7BC3274D;
	Thu,  3 Aug 2023 15:10:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Start of DRAM should at least be aligned on PMD size
 for the direct mapping
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169107542300.19238.17913302600007143325.git-patchwork-notify@kernel.org>
Date: Thu, 03 Aug 2023 15:10:23 +0000
References: <20230704121837.248976-1-alexghiti@rivosinc.com>
In-Reply-To: <20230704121837.248976-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, suagrfillet@gmail.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_081024_945792_03FACA31 
X-CRM114-Status: GOOD (  10.94  )
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue,  4 Jul 2023 14:18:37 +0200 you wrote:
> So that we do not end up mapping the whole linear mapping using 4K
> pages, which is slow at boot time, and also very likely at runtime.
> 
> So make sure we align the start of DRAM on a PMD boundary.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - riscv: Start of DRAM should at least be aligned on PMD size for the direct mapping
    https://git.kernel.org/riscv/c/9d3e8e1ff0d8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
