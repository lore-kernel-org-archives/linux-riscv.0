Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1677DC3ABCA
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 17:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZbG67xY3aGrjjaG9jHAG3aNGWsG0CEDdAbFI3mmFksc=; b=IxbPAHS8vdBVMt
	HQg8WzY/LPCV+NsesKJJ4KbsRdMeHBOhqIIgi1YpB7s3Qs8IVB/EwlxrSdFH8KdHHvMKfbHZFwlea
	wNG6VyYA6z5IBgIM+5T74t0852wJdwgopfUNkul9+TkxVn1DuVbsBEbyGrbqeQ85YXjZ1AQn3jLEH
	9Tw+QcqXE+CB+CxsIiXRiICQ+Z0EKiog1uxmbXk8BFnuQyxT5+t07kJtBTqM1NWQlD/sGmM+Sed/n
	jAMImmoTBkpMGt3E5DtQO8WT6fNqRX6/sGr7CzmPZaSQwm1hLGoIIW9VeWb4humRlcrD2CqiR8hRf
	hmlrREckiL+c/qws20sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4vz-00000001NSa-1tYF;
	Thu, 08 May 2025 17:21:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4T4-00000001K5b-45Rb
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 16:51:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2816DA4DF8C;
	Thu,  8 May 2025 16:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F36C4CEEB;
	Thu,  8 May 2025 16:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746723089;
	bh=YiJPxFVH9MriN3MHinddIsL3bUEwnFXdV+9UivOrkRg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DLsycetwDmsyPJB4WHamckxwZkopiBLA00sfuxrLv7euXG1RDBDHK1RMKWkaG39FN
	 jhu0vU6fNkMfd7Gly8UW7gZzR27UMZ4SbqemCsJpxqwcMqZ+pteX5w13TGS6v1AIP4
	 wgjCOcXropBQMZOcMyPr9LuVBF9kBqle1+KSmrfx0qAROATlKnopIx+BvkAgUeOB5S
	 2ssea/yyezjU2DLH+RCLa+lyR/QyMC1OYXkFw5FTaOq1wYT4MMFMd6B9Nq4eRccyVf
	 iUgMIRtrLX4mDHRoa8iLGQ3ucQVlAmw51FU9vIM+OzGl2CSSy3BwYcTjvdob1WYGf5
	 9KD7Oh9bkhhjA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF08380AA70;
	Thu,  8 May 2025 16:52:09 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Disallow PR_GET_TAGGED_ADDR_CTRL without Supm
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174672312824.2976395.79446860575493569.git-patchwork-notify@kernel.org>
Date: Thu, 08 May 2025 16:52:08 +0000
References: <20250507145230.2272871-1-samuel.holland@sifive.com>
In-Reply-To: <20250507145230.2272871-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, alex@ghiti.fr, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, bodonnel@redhat.com, charlie@rivosinc.com,
 conor.dooley@microchip.com, joel.granados@kernel.org,
 paul.walmsley@sifive.com, cuiyunhui@bytedance.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_095131_080938_BA75CDCC 
X-CRM114-Status: GOOD (  10.29  )
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed,  7 May 2025 07:52:18 -0700 you wrote:
> When the prctl() interface for pointer masking was added, it did not
> check that the pointer masking ISA extension was supported, only the
> individual submodes. Userspace could still attempt to disable pointer
> masking and query the pointer masking state. commit 81de1afb2dd1
> ("riscv: Fix kernel crash due to PR_SET_TAGGED_ADDR_CTRL") disallowed
> the former, as the senvcfg write could crash on older systems.
> PR_GET_TAGGED_ADDR_CTRL state does not crash, because it reads only
> kernel-internal state and not senvcfg, but it should still be disallowed
> for consistency.
> 
> [...]

Here is the summary with links:
  - riscv: Disallow PR_GET_TAGGED_ADDR_CTRL without Supm
    https://git.kernel.org/riscv/c/7f1c3de1370b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
