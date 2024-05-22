Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EB5C41513
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 14:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ol1j/vPQtGu6ndqc719vN3X6xQ3KCReDRDoE02pnPOw=; b=t96t1We/p7H6oA
	H6ani1rX+Hc3Knrml935tBw6mQHRAgGCXHd43XtH45OV/Do4AADhg+IgRSXDI1iJ4BtjduEW0ZEj+
	kalPVVuQwUVkZ2NW6i6GhXxvPyINNlQ1AA+EWylF59A/nkQ4RWOYibz5rqq3eIoF+RtZX+BLZsoor
	EaKiFN8vS3wG32+g0+c1kqm/HE/FO5y34qvZG1Et5RpFv0QMSB0t29jtF0GP85EXjBo9KLulUXmR8
	gvq2AQb1IZM+eNU5NFujndX9Nyh8lQgkVtSGDQ0+MV4UCOaCeIbjvK4+L+4IdVHFuiPPSv+coednC
	EdiMJMAmnkdj58hQxTJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9mfy-000000039vy-3nFN;
	Wed, 22 May 2024 14:10:42 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9mfr-000000039tW-3BiS
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 14:10:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 189BDCE1235;
	Wed, 22 May 2024 14:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0798C32789;
	Wed, 22 May 2024 14:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716387031;
	bh=H6wkHOajvXn6+cY79nDCCgocbFMaRJ82qposdSxXrt8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=I2z2mSZdt0LFzGbYgA5pwGuLhqFI//Owq0m+hmtNAfqXFqrmCP49riHxFyV17wLud
	 A01b+2rviHUgg9xzR4SvbIcchvZLQjnPTL86sdIp8OBXH5FukWp//zeKScr0HqG96b
	 PLYi+1BieLlRQTdCBKXTycwRwau2DoSkxAbWRP8zm0lUBKPMnaJgEul9ACmcfVMXgL
	 nAW8QdIzneqSzlir4PJbgtDdwKrPXaGcTYLeTYTbEPEkkprTMIE80lnStwn+iojYsk
	 0ISBJR3nzgxPsKGnaGJxiNCl50LubRlVZnQd3VZcu+cVg+/K78iOnNZMryvaFbVEcO
	 B3wiGWsDnk6hw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BA4ADC43638;
	Wed, 22 May 2024 14:10:31 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] riscv: access_ok() optimization
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171638703175.12705.17804024426868195175.git-patchwork-notify@kernel.org>
Date: Wed, 22 May 2024 14:10:31 +0000
References: <20240327143858.711792-1-samuel.holland@sifive.com>
In-Reply-To: <20240327143858.711792-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, mark.rutland@arm.com,
 David.Laight@ACULAB.COM, arnd@arndb.de, alexghiti@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_071036_112042_04B1AC8A 
X-CRM114-Status: UNSURE (   8.54  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 27 Mar 2024 07:38:11 -0700 you wrote:
> This series optimizes access_ok() by defining TASK_SIZE_MAX. At Alex's
> suggestion, I also tried making TASK_SIZE constant (specifically by
> making PGDIR_SHIFT a variable instead of a ternary expression, then
> replacing the load with an immediate using ALTERNATIVE). This appeared
> to slightly improve performance on some implementations (C906) but
> regressed it on others (FU740). So I am leaving further optimizations to
> a later series.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] riscv: Remove PGDIR_SIZE_L3 and TASK_SIZE_MIN
    https://git.kernel.org/riscv/c/9ad6bb3298d1
  - [v2,2/2] riscv: Define TASK_SIZE_MAX for __access_ok()
    https://git.kernel.org/riscv/c/ad5643cf2f69

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
