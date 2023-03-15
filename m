Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A057C6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 02:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cBbLZZV6JHUm6sE/OpKfdTJDjCJFMdd4zzMibUn/TP4=; b=mBo91fK64VFmwo
	kW3zq5n67jhNgbxTKTobdkf8KuSoWeH2myPPdUm1Ss6KsBLY9SdKvtzFWptsiUy27imlvdbCA0GWN
	YAMCMvxx013pZqb9j9FRlyfyUkjcDpgYZYetJBfJgnU9Ailc1LruBj8VGugQB8ELvv8IkYoknYsrT
	/RaCrV/R3zVTqfLW+CMmbDZHLbS+lv0ex2S5r5Mk2qiH+hawpdJx7UopUDVwVPg3SBu/oqiXq//Ln
	GA35EA7Ky/PUec5ARyySserPZ/MM74VUtgRNsW2qXlJEFBUjqw7VNcy6KoSfFXoHyt0B4MDPkKgZV
	et38Pi0mR0FBBl5JCDdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcGkY-00C2cI-2Q;
	Wed, 15 Mar 2023 02:20:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcGkW-00C2be-1M
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 02:20:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A426AB81C57;
	Wed, 15 Mar 2023 02:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C0C6C4339E;
	Wed, 15 Mar 2023 02:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678846818;
	bh=TEopD/Ndpni6SyAjb9ptFAsLvmC33E1XWhm2iz4z8wQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GxHjJDwgr8J25w5BuRR9I6JZxa64YOnHr5Q+7LlHK9QAuznb2t+gzXyys4q8GeNYQ
	 jPEt6W8nqluVGV7X/Yl2omcTVBB9TpoCToe6RndKxy3Uo4IbnBXUESF1T9z0UOD7Gq
	 6cXTWj8Sa8Tjh7eTWb6pdPJKW7EYp98/z6Hc01t6UpLuvBSHRXK13eu/hXe//090xD
	 3NnfhbWX+txIwKMQI1+HDsJ3jA/b/S9bgB0yz8Q4JDtY1a01BtHL9KfU4fa5rrYwSg
	 gAX7v83eyK2uAhwHiSccgSp8VAzT1vHNDsbTUMwiVwwpa0d+JQJdKV5vXVsAjAGNjH
	 kUVqGMm9S/zMg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 30B6DE524FD;
	Wed, 15 Mar 2023 02:20:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [RESEND PATCH v2] RISC-V: mm: Support huge page in vmalloc_fault()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167884681819.17018.8848137969847408206.git-patchwork-notify@kernel.org>
Date: Wed, 15 Mar 2023 02:20:18 +0000
References: <20230310075021.3919290-1-dylan@andestech.com>
In-Reply-To: <20230310075021.3919290-1-dylan@andestech.com>
To: Dylan Jhong <dylan@andestech.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 liushixin2@huawei.com, x5710999x@gmail.com, bjorn@rivosinc.com,
 abrestic@rivosinc.com, peterx@redhat.com, hanchuanhua@oppo.com,
 apopple@nvidia.com, hca@linux.ibm.com, aou@eecs.berkeley.edu,
 palmer@dabbelt.com, paul.walmsley@sifive.com, tim609@andestech.com,
 peterlin@andestech.com, ycliang@andestech.com, alexghiti@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_192020_612197_021F611E 
X-CRM114-Status: UNSURE (   8.47  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 10 Mar 2023 15:50:21 +0800 you wrote:
> Since RISC-V supports ioremap() with huge page (pud/pmd) mapping,
> However, vmalloc_fault() assumes that the vmalloc range is limited
> to pte mappings. To complete the vmalloc_fault() function by adding
> huge page support.
> 
> Fixes: 310f541a027b ("riscv: Enable HAVE_ARCH_HUGE_VMAP for 64BIT")
> Signed-off-by: Dylan Jhong <dylan@andestech.com>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [RESEND,v2] RISC-V: mm: Support huge page in vmalloc_fault()
    https://git.kernel.org/riscv/c/47dd902aaee9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
