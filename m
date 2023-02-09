Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5016EC636D3
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 19:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvMiVc8DddxGqReGzClA/dq1hXWqj178+ObynVOCRss=; b=FdBdb/J/fcCTrs
	ejHNRhA9s9DKIDErcT5LIjfS5Zt2o0tD19C/abQJngXDh5piCj/TmSiTtYYAo1Rq03IHDnsVjfTUX
	6qtAez9gk3KHJODV9exEqoWAVk0twMl6XnjFdEQUBZseYcAWG9rRR41CHe8Gw6MPy65jY06B3cLep
	H0tvd9DVAoKYhidG/nrQyC+xsycPthWR/t+DXOY8ZqqGjKJW+EsXmaT/IAqPoJP/DYWIJ5KUw2GYD
	+AVz4rc5VKNCMlueUluypBhY+rW8HG9DNybn5NP68pI1jCy5q8Z/qz+b6lxuUc+lVu5FeCsuqscf3
	eCC0HHUIIodV1zjT2OlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQCmP-0031rE-Ri; Thu, 09 Feb 2023 19:40:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQCmN-0031pg-Ev
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 19:40:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1B4F9B822E4;
	Thu,  9 Feb 2023 19:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FCA6C4339B;
	Thu,  9 Feb 2023 19:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675971618;
	bh=TgmrnC/M5HXZGBRzFdINy6NLvEYYMbHiA4VgIM1fb3k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Zobd8bf4shU+7TgwlyO/tvuH9iFjLJUi8MXNllc+GXQL3pHFMBS8w+XB8dDIMXSHj
	 6a01mwz6I4dcdvxwqVj2pcnnTUXHS6I+VkeEs3kvxjCN8j1myMfdNbUFSnPNqZPsrx
	 FZQul7aKl+oqUwID1hnxPbiSe5UNLcRQ4YBh57CcsRxO1BfdLtHB5kzi+jwq5W4hfo
	 hOTDQIv/FE2T7a8lOdKWziWHjbiZC4UBoeYxnW49WDwOyGZ4eipd/9DKxKxENgD4Cj
	 LKQgYzSUveyTxGL2vkz2efzE5oWlJQvgJ5zWED160MZrMpfR+gi15zHcdqL3bNMkCd
	 HRHV7e61LyL1w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8750EE21EC9;
	Thu,  9 Feb 2023 19:40:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: stacktrace: Fix missing the first frame
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167597161855.28032.12085099343569341369.git-patchwork-notify@kernel.org>
Date: Thu, 09 Feb 2023 19:40:18 +0000
References: <20221207025038.1022045-1-liushixin2@huawei.com>
In-Reply-To: <20221207025038.1022045-1-liushixin2@huawei.com>
To: Liu Shixin <liushixin2@huawei.com>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 changbin.du@intel.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_114023_697202_CA8ADDCC 
X-CRM114-Status: UNSURE (   9.59  )
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

On Wed, 7 Dec 2022 10:50:38 +0800 you wrote:
> When running kfence_test, I found some testcases failed like this:
> 
>  # test_out_of_bounds_read: EXPECTATION FAILED at mm/kfence/kfence_test.c:346
>  Expected report_matches(&expect) to be true, but is false
>  not ok 1 - test_out_of_bounds_read
> 
> The corresponding call-trace is:
> 
> [...]

Here is the summary with links:
  - [v2] riscv: stacktrace: Fix missing the first frame
    https://git.kernel.org/riscv/c/cb80242cc679

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
