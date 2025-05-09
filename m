Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B080BC3ABC9
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 20:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SBNj6vV/s+Iox28GDhwz1EeWu+zs9hwWyq/CGYtlXIE=; b=UxDHypY26reqWJ
	lIKswfiQIkwPR8upRfyQ9cvTA4sixlpv6F5qMLPl1ZB4D/Omjxn2ivmLuQshUfh//TaZBQtlf9USM
	BOveRcXjEuedJBt952tZaxUpk7BFsc+IVG6Q47axQ0MfAUYeS52FqoQdLKrYU5fXyS7s06J/tA9dz
	lqdbWf5NLuMiLj2Wif0UYGbpUcIkiHPyt8xM9ycrJ1UoDJ80eiLxLJ/BkhVU5kWZ9+SxF29EP6e59
	TLD+Cc5+woOTpffn1kDO5TfGAmV1Ho+AOR+UvSn1ycIzPUrQ7+uSyrqiIjEcLGAh2VwxKzaOumCBe
	DyIJYPQJT2yQ7NU2Up8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUI7-00000004nAn-1VuP;
	Fri, 09 May 2025 20:25:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRXq-00000004RL3-2n3H
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 17:29:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AFEFC61120;
	Fri,  9 May 2025 17:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F2C9C4CEEE;
	Fri,  9 May 2025 17:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746811797;
	bh=etDsIxt76pe2uk/B9drL0wcQPb5b1z/MtT4+J3JduI4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aQMHR6xyE5UP1RdRHiJ9tbHGeftJChLoLCQABr/cgqNexjgRdf+M3/HnHOykeVBp+
	 1cyUo4chGPTgrs0SyittY8u4PC8fzQ91pvLM+126Fw+3qYcE0R/2lpRPUW/JVrvNXT
	 kryN8nqD1sBqxbY+BIBczxAupGpWZNG2mqauR4x7QiUgsI4viWhAd4NxScbTKBkKQg
	 TOfjoNQAo+Ta/BYQxFB2JAtrqhWwGYW/rsKLLI2AeJgsdxRkDRBMBbKaC+soEoyPRl
	 jbdAIVdEHeEw56OC6w/tGqV2/Bk27Y2WtqV4DaYbprsTVd5Q9h8SI1LrNLw/2lpavq
	 hKXO1Sff8OYFQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADE0380DBCB;
	Fri,  9 May 2025 17:30:36 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v6 0/5] riscv: uaccess: optimisations
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174681183574.3697320.3349869843167722914.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 17:30:35 +0000
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
In-Reply-To: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
To: Cyril Bur <cyrilbur@tenstorrent.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, paul.walmsley@sifive.com, charlie@rivosinc.com,
 jrtc27@jrtc27.com, ben.dooks@codethink.co.uk, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, jszhang@kernel.org
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

On Thu, 10 Apr 2025 07:05:21 +0000 you wrote:
> This series tries to optimize riscv uaccess by allowing the use of
> user_access_begin() and user_access_end() which permits grouping user accesses
> and avoiding the CSR write penalty for each access.
> 
> The error path can also be optimised using asm goto which patches 3 and 4
> achieve. This will speed up jumping to labels by avoiding the need of an
> intermediary error type variable within the uaccess macros
> 
> [...]

Here is the summary with links:
  - [v6,1/5] riscv: save the SR_SUM status over switches
    https://git.kernel.org/riscv/c/788aa64c01f1
  - [v6,2/5] riscv: implement user_access_begin() and families
    https://git.kernel.org/riscv/c/19500c6dbc5c
  - [v6,3/5] riscv: uaccess: use input constraints for ptr of __put_user()
    https://git.kernel.org/riscv/c/62135bf660b2
  - [v6,4/5] riscv: uaccess: use 'asm goto' for put_user()
    https://git.kernel.org/riscv/c/cdf647e81714
  - [v6,5/5] riscv: uaccess: use 'asm_goto_output' for get_user()
    https://git.kernel.org/riscv/c/f6bff7827a48

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
