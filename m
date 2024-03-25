Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C509C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 04:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OTj251DBXLaoMya+3P7JdkBY7PzcgUCt4MQhSD0zaFc=; b=rvWT2Lh+Lshg0l
	cyxdeKRcC1o8lluwuj+QUfJOiZIrn/tB/smrrapw4ruZfRvTWz7LDdC+yoy0ZuRYHpwHMyN4CjQXe
	IZQJRa64KcBdKFdG5QLe6CpbjVeB0H0YyG2Jkuurz8dx/uS2wZfh6IyRdQ8CopUH9RKHcy8EwcLCI
	8yFP/QWOcYW4Dy0PmvNbK8I2ZT0nNGYA3YwyNakWx/kxYr8O7IU01EZIT9m2QY4ECFoxUzCIHG5sj
	FIZ3Qah/iSBfZrQLYl22og7DuIT5pZJxFT7fltjIjoQsUx8ZM6cNB+dC4kj5rNUr7V9G7rmeMGdho
	AxF73M2zvBNKcurVMKhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rocBI-0000000FEbU-0KWG;
	Mon, 25 Mar 2024 04:43:32 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rocAP-0000000FE5A-3rpS
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 04:42:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3D143CE1053;
	Mon, 25 Mar 2024 04:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1E17C43142;
	Mon, 25 Mar 2024 04:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711341754;
	bh=bBw56LJubXCStxVYQUSiFNc8WgVMrbS3NMqW6gTTz8k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UXNezA5JyU+tGdGowOVGyO/cxwigyBxXofjJbIlEHctB7kxJVlpjIMY8YGrfzoad+
	 DNOfdeJOz/E1Hv8J+YYCzXUqryOoYbzjCfZPcO98eEsZLMcEznBlZAG2wk/P2LDP5A
	 btZesN49bjjxxR7WBR1D/sjk3AzEEMrywqDdLn+h/Ahh9xfdyDvBngI097Q0tH1iMZ
	 mF6L0MmuePAyOHzJWIT/XWp/RUl00B3tSrybObifexTD4E8gqC2oXaBDKV4LU4fVkC
	 xtTVhsgYjPmkPbzIEaSCvdUvMYMlLxH3zusNe2o2HoVSWssmW3XgSPLzhWHnlxR3dX
	 HOApdiMb/gbBA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C60C9D8BD1C;
	Mon, 25 Mar 2024 04:42:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] MAINTAINERS: Setup proper info for SOPHGO vendor support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171134175480.18749.10483414416084336702.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 04:42:34 +0000
References: <IA1PR20MB4953B158F6F575840F3D4267BB7D2@IA1PR20MB4953.namprd20.prod.outlook.com>
In-Reply-To: <IA1PR20MB4953B158F6F575840F3D4267BB7D2@IA1PR20MB4953.namprd20.prod.outlook.com>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, unicorn_wang@outlook.com,
 conor@kernel.org, chao.wei@sophgo.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_214238_381624_5A2F76E3 
X-CRM114-Status: UNSURE (   7.11  )
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

This patch was applied to riscv/linux.git (fixes)
by Inochi Amaoto <inochiama@outlook.com>:

On Tue, 30 Jan 2024 09:40:42 +0800 you wrote:
> Add git tree that maintaines sophgo vendor code.
> Also replace Chao Wei with myself, since he does not have enough time.
> Since sophgo vendor code is maintained, remove itself from
> `RISC-V MISC SOC`
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Acked-by: Chao Wei <chao.wei@sophgo.com>
> 
> [...]

Here is the summary with links:
  - [v2] MAINTAINERS: Setup proper info for SOPHGO vendor support
    https://git.kernel.org/riscv/c/0f46e1339ef1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
