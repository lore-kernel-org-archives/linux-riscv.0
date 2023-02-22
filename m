Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B7EC61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 15:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jJsxLoRfEom7DcQVtowyRpdwMXMmlAvIYMg5xMUMgME=; b=BKuc/AyO/W8l5U
	D53A4mtjnGWeizYkfoHnnrBtMNkb2HuL+YB+h3IzuMsp+7fbATNRDiLQe9/JaVJPGbUwWVEk3QsAr
	vsHHzd6P4IuwwsRqTQfuv3M2dWcp8r/Eq/XohN8N9jBVYNNYJKMfE1gvYW4qgc3bvZW6vJBZAAFRB
	A95WAzd5QJBE8nQPdzoZRfbRAWOsA4s9vwMBFXaOWdk2pcgYeqm+3UV+DARAU9o15uYaUBAjWKMPY
	EbT8OSoQQt25/Gt2EFPAPwUUaB9YTSSwjQEV43DvbBHF4ZL3MXywDW0oU4Dy9sZKAFDZ5Yys+RoSq
	C9+5W9/n+b6nBam4Kf+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqbe-00Cm8V-8d; Wed, 22 Feb 2023 15:00:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqbY-00Cm4x-VW
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 15:00:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 80559614B0;
	Wed, 22 Feb 2023 15:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 466F5C433A8;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677078022;
	bh=iRBat2u1+RmG1QEv7W26a47GotBKVLB8ntUrJI9i/oA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pz+qICuPlJ07C3m5mpGnqpXbgSV/sVvFWMg4ECZFxJIE8ngR7LvlpbAvkqP/xmiYA
	 oKnf0xoPPThf1sw+LYcPnvg2Vl7I82I28wnB4e9c/iMInpeZH3xBMaMK9PoUVEcjv0
	 iKrila+XO1MThyknhoCjxxu4OF1mfMWXwP84zA2CvySJ5F6OUh8eENcXYeXAn5sSnF
	 n1xdALsNKpR8lWZQMN02YNxcM7pAj7McciQqO1EBc6QzegO6uuO1Gjd4a/fNnwp+CW
	 3gaDB1rIIhhejYYEQd5NmhkxgIul8LiowJrjqUeZwJIMtMZOUgo3GiwEsHi5tE0SJf
	 S6SlN0Rk6sAig==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 218EDC73FE7;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: alternative: proceed one more instruction for
 auipc/jalr pair
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167707802213.24438.17946403277180818321.git-patchwork-notify@kernel.org>
Date: Wed, 22 Feb 2023 15:00:22 +0000
References: <20230115162811.3146-1-jszhang@kernel.org>
In-Reply-To: <20230115162811.3146-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, ajones@ventanamicro.com,
 heiko.stuebner@vrull.eu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_070025_098966_0F700C15 
X-CRM114-Status: GOOD (  10.09  )
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

On Mon, 16 Jan 2023 00:28:11 +0800 you wrote:
> If we patched auipc + jalr pair, we'd better proceed one more
> instruction. Andrew pointed out "There's not a problem now, since
> we're only adding a fixup for jal, not jalr, but we should
> future-proof this and there's no reason to revisit an already fixed-up
> instruction anyway."
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> 
> [...]

Here is the summary with links:
  - riscv: alternative: proceed one more instruction for auipc/jalr pair
    https://git.kernel.org/riscv/c/91612cfb1736

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
