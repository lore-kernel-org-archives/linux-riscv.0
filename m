Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4A1C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 01:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VztgAxC1DgYrkdnv91V5YricA/Tuv0DJEp2q5D00B/o=; b=SvoeSmVjx/mm5j
	GKgMMSAFOh21hLwo7HFk2CveZDglWiRnXLOG6ikRS+DdlBiZhjAjOimcygyOOMr9DSm5fIBHlQLyK
	6311xfE+jGUCsWr5Pt1SqECfkQVdU8TdBI1mUZEla9NSGcJauiqL+WAOWqXNH9GXU1dnFkcR/JUqo
	i9NlGNsw8/Q0n2b7TMQH+fc5JZJ0Zb5HSwfwFUomNJ2giBttsOtm3mY4kJsa3XF0YIL5ilS87YMw0
	CvpAWwQVtSNmi+PbL8TEXEbZIOMlwteOjnGKYpY9571F9/wUMzo2yDJ1Dedkf7kp/kLu0SM1SedW6
	zH7YxNacQP45HoDuOu2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcG7z-00Bypq-05;
	Wed, 15 Mar 2023 01:40:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcG7v-00Byp8-16
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 01:40:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 02DDFB81C39;
	Wed, 15 Mar 2023 01:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B88EFC4339B;
	Wed, 15 Mar 2023 01:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678844418;
	bh=XhEHyb9RFf9lu117xkYXKrdJu7geiPfXN441Rj+1e2c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=p/OfDeFAT9UUyt3kD5ScPHgsViHT/SneAcXSxUYphKmsim3fAp06ZCNuTFFtTsHZv
	 T+Joepv2px7DS1S8Lk6h7WGaC0ipCshqlFN9JFk0zn2SNmCWc9yjTt/3KO/WHdVbta
	 uBYH5SBDIDdZ2IKspVa5BJupXrOU03Uj7ZTsTthXSfydnROandXh1Vq85fB4j7hMJN
	 lRnYTZrXEYr4IGTOBJwCucaMtxQxsz4QHBG3U5B5DvGDvpfZ8k0AsVu3FKoSe84riX
	 oaeiYiIozq5UDXk47Q7dkrHHkuIXv7Y/RuN213zLgOfpcW7Mat6J6KXIFq0cka3Yg9
	 g0jV9Mmfvu8pg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 97975E66CBD;
	Wed, 15 Mar 2023 01:40:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v14 0/3] riscv, mm: detect svnapot cpu support at runtime
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167884441861.5193.11313363491551108845.git-patchwork-notify@kernel.org>
Date: Wed, 15 Mar 2023 01:40:18 +0000
References: <20230308074853.4393-1-panqinglin00@gmail.com>
In-Reply-To: <20230308074853.4393-1-panqinglin00@gmail.com>
To: Qinglin Pan <panqinglin00@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, jeff@riscv.org, xuyinan@ict.ac.cn, conor@kernel.org,
 ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_184027_554420_143EDC8E 
X-CRM114-Status: GOOD (  10.92  )
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

On Wed,  8 Mar 2023 15:48:50 +0800 you wrote:
> Svnapot is a RISC-V extension for marking contiguous 4K pages as a non-4K
> page. This patch set is for using Svnapot in hugetlb fs and huge vmap.
> 
> This patchset adds a Kconfig item for using Svnapot in
> "Platform type"->"SVNAPOT extension support". Its default value is on,
> and people can set it off if they don't allow kernel to detect Svnapot
> hardware support and leverage it.
> 
> [...]

Here is the summary with links:
  - [v14,1/3] riscv: mm: modify pte format for Svnapot
    (no matching commit)
  - [v14,2/3] riscv: mm: support Svnapot in hugetlb page
    (no matching commit)
  - [v14,3/3] riscv: mm: support Svnapot in huge vmap
    https://git.kernel.org/riscv/c/ce173474cf19

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
