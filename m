Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0669C3DA63
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 12:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CGbkAsWWKxVVoUom/5CUfgtHSVB/+vPquRHxuo2Mwno=; b=zM6CSr6FaBee1t
	EAwoIoLZwfwosF8e+lPypZhRSJBLGGysqRfIVdVjvJFUkkZin+pWV5ns9UH45iQasCrH3CQ7Ro59i
	PJW3JdYo5OJcaXeLTkQVvmibwENT1WLEJSzlscZDC1rV6k26htqFOjmbByBJY8oUDWLqQUVV69aqC
	FpZFxgyWhY0mRZ9eRpLK7aXMCxOsFbtfgID55dQIhsM8oa7Pi57yy/0wrM7GsRRhH4mft5Ua/BNhV
	rxTpBbSe2HF/T1PmrH/Y8nunNtk9Qo3tw7F6KxlLa8w4KIWwEhzcm+ZIdZOoMLSxVlszUisAbv65a
	DdW5iyo4hMRxV6J7WXtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWF75-0000000CRgA-3ccx;
	Tue, 23 Jul 2024 12:59:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWF6G-0000000CRH6-1sS7
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jul 2024 12:58:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 87A1B60EAA;
	Tue, 23 Jul 2024 12:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD7A5C4AF50;
	Tue, 23 Jul 2024 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721739516;
	bh=WajohK/Qu4zEpddE3qakoWHVAncIfRVEiqpOcTt35YA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=vImnpBuvXem+cpOSDW3F9q9E1IEBFU4A8s/5N5SrvOwHDpzfMIbP5X6ynpJq4SNut
	 5f71/NrQsotHg+FugzxtfGfwE+D8OSnMLJeCfCCDgEu7CvWgcqn7Mi2GaF9UsK+eCu
	 4rX7Goe5SBBhtkSuw+HDovjGIOJO86gBJ+IlJ0pSHtEr2/NIWgLC6ZFiwOOx9fhBM2
	 smHI37p+HSHaIlkqFgRlojfESiHcbx9w0zDMx6zlOv95qeRWqf0B8jWRN1aUOXTS5y
	 Ysj8ObXqLcB0lG4TUoLyRXk1VScwjdrLG7zZ/MRVdKwj3En5MY4eyO3NFBylPpvdR9
	 3f4IGNEAy/iaA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 97932C4333D;
	Tue, 23 Jul 2024 12:58:36 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V Sophgo SG2042 clock drivers for v6.11
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172173951661.10883.11626056916219005908.git-patchwork-notify@kernel.org>
Date: Tue, 23 Jul 2024 12:58:36 +0000
References: <MA0P287MB28221A333D852974F55E3228FEC22@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB28221A333D852974F55E3228FEC22@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: linux-riscv@lists.infradead.org, sboyd@kernel.org,
 linux-clk@vger.kernel.org, conor@kernel.org, inochiama@outlook.com,
 xiaoguang.xing@sophgo.com, haijiao.liu@sophgo.com, chao.wei@sophgo.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_055840_685568_1BBC595E 
X-CRM114-Status: UNSURE (   9.66  )
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

This pull request was applied to riscv/linux.git (for-next)
by Stephen Boyd <sboyd@kernel.org>:

On Fri, 14 Jun 2024 15:28:22 +0800 you wrote:
> Hey, Stephen,
> 
> Please pull clock changes for RISC-V/Sophgo/SG2042.
> 
> For dts part, I will handle it at my side.
> 
> I send this PR just want to expedite patches for this clock driver. The
> patches have gone through 16 rounds of review [1], and I have carefully
> checked and revised all of them based on everyone's comments.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Sophgo SG2042 clock drivers for v6.11
    https://git.kernel.org/riscv/c/54cb3bb48337

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
