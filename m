Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED16C54E67
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 21:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2l7YIXho+XIg9XvVfJV1QNN41hUME8409l6ju9gIZl4=; b=KO6sNTRgzIJ10u
	+zIuVrDzdSuMsjhPkCcwWNbzC0etVBaBw1tpRzWeQvnnZ6WdMzGhuhbNhQwnNwyvwCdiiw2yDOovA
	Rr9KYx6MGwaalssCuYe8JeBDE7QxQtqBo9I567nJKIkwtptj5gKI2IFwoF+R0Ce34fDbBeHsBf9P2
	xTPV2ClF2TIGU+yEkXCJx2UxpCOxnR39gOfsDHMGfz9kOY9+l01uNXcSzflrI2VFhUdPzrFhVpQj2
	ob7jFFxkycWsjydUqRSu0GpKvIzu4xtGKWM47Rbyb9XhV/Qrnyz8HrG7QguhJAlLbXLJS/4CxOX6d
	qKQs1cvqALfvrkBhjWFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpE4O-00000006VDI-0LPY;
	Tue, 26 Mar 2024 21:10:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpE40-00000006V2H-0bCC
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 21:10:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C179661449;
	Tue, 26 Mar 2024 21:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E392C433C7;
	Tue, 26 Mar 2024 21:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711487429;
	bh=cmg/gfbaHxKApJm02IgCoAJKmmpQOZUMbvz4pjlnRu0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=X8kZ7O8M4Cz8kl2noXtB0nNd1//akN6Tc3BUOm8lCvjrK5MuOrQBRay7llaio6Wr0
	 uO2XtXTKTuyMqbTZ6Zn5Nd23OWDBat3a+WIbEPBLb9ze27c2ISnowQyG821w3lAuom
	 vLyCTZTWYFg808+R6UfwOh+ly2CTqhfhQHpWrCDQMFmYUrHKzsH+B4qepRolI3IUbx
	 mYoQcrgNkwxaKPcCTEPVd2HB4W6ik8mSQcnNQKQJeNKcsv6ENFXWLHmOfYxl3cD8d9
	 X3/pah795VETR5lXWimFHkiZCpgg4Erh9lKMX+aABTR755qqyYrZ+4mLoAhcWgHuSQ
	 GJPsRaxhihPig==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5A157D2D0E9;
	Tue, 26 Mar 2024 21:10:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Fix spurious errors from __get/put_kernel_nofault
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171148742936.11448.9647028655336928846.git-patchwork-notify@kernel.org>
Date: Tue, 26 Mar 2024 21:10:29 +0000
References: <20240312022030.320789-1-samuel.holland@sifive.com>
In-Reply-To: <20240312022030.320789-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_141032_259005_BD330B0C 
X-CRM114-Status: UNSURE (   8.35  )
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

On Mon, 11 Mar 2024 19:19:13 -0700 you wrote:
> These macros did not initialize __kr_err, so they could fail even if
> the access did not fault.
> 
> Cc: stable@vger.kernel.org
> Fixes: d464118cdc41 ("riscv: implement __get_kernel_nofault and __put_user_nofault")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> 
> [...]

Here is the summary with links:
  - riscv: Fix spurious errors from __get/put_kernel_nofault
    https://git.kernel.org/riscv/c/d080a08b06b6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
