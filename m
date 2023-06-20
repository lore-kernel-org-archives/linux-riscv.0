Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16903EB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 19:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/V49nKAGmNfjXPEXE1QjxC3V7D2xBJrfRS8toe4iTqs=; b=ecxYaR45T0ZD72
	eVs4j6hqDiqXjHFr0u5OutvXieEANDaw83u7H9/U++4kB2AWqfa6zwMBxOk1+Fc/koCOKMH4bOnh6
	BF/Lhbyf6zSjjRq9cVYIJy8+LwZ7C/LkrBoDThStthncKKopTZJ0C007jbcNEgStoiQkK89dCYcyO
	aDEcZ4lLDISFlsMBno8DVkdVZCrMPqlRxGMyJdbEFfZ6aNLuLi1W8hG9GD71u+n1XzHCw2ziAXdK5
	ajTNbv9u0+EGGPX5IwtH1JwQE8I9aMDND6n62SRzlVuENEtVtFrnUT7apdgrcCR65ZkMI72po2gh/
	zTj6g6AYAQTFru+b3OcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBhDH-00CCO6-04;
	Tue, 20 Jun 2023 19:40:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBhDE-00CCNK-1q
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 19:40:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 025186115E;
	Tue, 20 Jun 2023 19:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6150CC433C0;
	Tue, 20 Jun 2023 19:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687290023;
	bh=zgcTRaso7zOqdnf27+oRPafh2nunNGgBt0ylwF5bYSw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sSgig7NeqP/GSgCDTgstKw7jdR1p7DQ1e20gTHemkiS4JTYy+Vpyi+MR39WurVSeX
	 4hDIImqOsYlwr0mCn92So/kIeb2BGGe8uw21kh8pYKEuiZ+vWLRdVfuwHcKXN8/n98
	 4id4047RpyUW/CkOQf1vMRaKEMGA4LWjcgNFK+/463G1zs1lEmkyYPVhoDLm084VQs
	 e/E+3cgtMwlVA1EhAzIeVVnUJ9dYzDr1zoU7E43MTeHHc5Tt5MB1ink2O7uxnyyL3T
	 LisiPI94iXwF87wC1Nqn5tEaP16s9reUJNrBORuQV3lHkHRkXBYZKYeLCM6au2xq/6
	 MC7aJJLdVxLxw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 44271E301FA;
	Tue, 20 Jun 2023 19:40:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: mm: try VMA lock-based page fault handling first
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168729002327.20607.14070522749867476225.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 19:40:23 +0000
References: <20230523165942.2630-1-jszhang@kernel.org>
In-Reply-To: <20230523165942.2630-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 surenb@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_124024_679023_7CACD72D 
X-CRM114-Status: UNSURE (   9.07  )
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

On Wed, 24 May 2023 00:59:42 +0800 you wrote:
> Attempt VMA lock-based page fault handling first, and fall back to the
> existing mmap_lock-based handling if that fails.
> 
> A simple running the ebizzy benchmark on Lichee Pi 4A shows that
> PER_VMA_LOCK can improve the ebizzy benchmark by about 32.68%. In
> theory, the more CPUs, the bigger improvement, but I don't have any
> HW platform which has more than 4 CPUs.
> 
> [...]

Here is the summary with links:
  - riscv: mm: try VMA lock-based page fault handling first
    https://git.kernel.org/riscv/c/648321fa0d97

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
