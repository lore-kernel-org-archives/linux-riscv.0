Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A397C3601A
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 13:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=on8+Y1OAmbkTl32Bs76bLn87tEswYNZYNl3Bu2DYHcY=; b=mp+IJnS2vZqILz
	3UTbbAPv6wS8eqjuXcRpxcTv6P9mJMUdfjVw9mYZ53+IZFSr9yP/iT0uecyEtnnpFE3+KzofDZYX4
	CNZE8SCfkItekRnfNp4n2YtPLJxcu3vrt6ph66SxMMWHvrRw60v3M+eyZZrzoyHHlNs9hUEdRULoR
	XFO/5iTtTdrlpQWXQHEOVNYNFs8aKwNML151pgvEiH16B1/A7E1aDm3z+hJ/EykY25TmGEa5m7236
	ruj/D+VKFQUZihYBij/2UcPR1LTsEl+rvQ3TDItmThXAr0n2HJOLLkpZ8PALeSi+SnGw6K/+i8rDf
	E6ivaoVR57sbc6YK0WMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXoz-00000006AuB-3tZI;
	Tue, 17 Sep 2024 13:00:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXox-00000006AsQ-160g
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 13:00:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 122EFA40D31;
	Tue, 17 Sep 2024 13:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87200C4CEC5;
	Tue, 17 Sep 2024 13:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726578039;
	bh=9Gsf0XeTsK3+zxYmz4SLt9TBXmm12cmW+FmYYyde/jQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XvkWVfFBS0yGxri4DBZK0wb2fwA+bChCszfYIaQ38iEC1L6LmIpDcynQwBwm5CzC7
	 jDglvcv0ZaqHVtH90QrKlFTnoSacoTaZAcGpQlpXtv4x+bKEuJSXVtk9n+0y6MAeTY
	 Opd5GLMGdyo8oDis1gDU7/IuwK5h9hqS5JBV5FJC8/dq6nQ0Uy1IgWwz+lWK7Nq1+O
	 YxrdGDkJkJu100j/Y+7FQJGntQN81sx/5dK2T25JNnAK2O6uNf5YCLUUBOiCoHfRdX
	 jDkZ7zP8fpwPcHdvNoJpTBMMfvCvNQ5mF8dKo+mY5NGET3zHU3D7hf6gZDlPPolu4p
	 Oe8YGz+PsLi/A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F743809A80;
	Tue, 17 Sep 2024 13:00:42 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: define ILLEGAL_POINTER_VALUE for 64bit
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172657804096.126252.17380283904864990104.git-patchwork-notify@kernel.org>
Date: Tue, 17 Sep 2024 13:00:40 +0000
References: <20240705170210.3236-1-jszhang@kernel.org>
In-Reply-To: <20240705170210.3236-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_060043_384978_CF919157 
X-CRM114-Status: UNSURE (   9.03  )
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

On Sat,  6 Jul 2024 01:02:10 +0800 you wrote:
> This is used in poison.h for poison pointer offset. Based on current
> SV39, SV48 and SV57 vm layout, 0xdead000000000000 is a proper value
> that is not mappable, this can avoid potentially turning an oops to
> an expolit.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> 
> [...]

Here is the summary with links:
  - [v2] riscv: define ILLEGAL_POINTER_VALUE for 64bit
    https://git.kernel.org/riscv/c/5c178472af24

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
