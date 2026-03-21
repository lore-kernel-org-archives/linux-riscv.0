Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57851093170
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Mar 2026 05:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DSnSQJoWlKoY7Btvekv4FRtrtMMCWE/RnvIRbTTW4aU=; b=EQAPdtB2B2pbao
	BNR8XRGObY+a79UoubupaF+GZSURK2KY+ymkwHbh1NS1TjWDSPL7qv/xJlRMDrtsGPnDKENRkqOJC
	JQeaFaUgipz8MxF7560jrnoTTD5TVbWDRETdLBOtUQZBLenLeARwXaGqE+thrTeTSL9JrPn/gejrk
	D7+9LMSJVvbdCds3CPzmWHrnF2HNx3EsxvNy/sgs+SulVhlhQcJUHHv7g6wkwlrd4+OSDLKYTk+Yp
	MsCF29Najos6DVxZp/l50b7jPpuNAxG3s1EonImqPeNBK8d2qVzk+1oxz5wjvVlnB7za2/PwgtUJj
	6TSS0AcDtYyFIjzN9diw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3olB-0000000E4tY-2BbM;
	Sat, 21 Mar 2026 05:20:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3olA-0000000E4sx-1TJh
	for linux-riscv@lists.infradead.org;
	Sat, 21 Mar 2026 05:20:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3700960126;
	Sat, 21 Mar 2026 05:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9796C19421;
	Sat, 21 Mar 2026 05:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774070426;
	bh=AgNhP8YlvpxDri8kLMZnKIYSzwh6Atbnsw047hhQ7kQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LhS7mv5r4EsagSdYSn3Pf/WkCaES9YPpujqBaf2B+QNzzMkP/xmJP8SYS2rx2PADA
	 rgbuzZ4pXPJI3WOg9PlCSR/XXaoNLIOrPz4p3ty31MAXD9vXI3LpTLLAZeb31h4mQO
	 AqxhTrSwHAXDJmwByQFIEHWnfh9mnCtR3HJPcSx7Hto4l6HxiU6ELTkWyCB4JoQjja
	 DC90d1RrrdiO9YidUKYJRVovVKYc0DtFRJaqY4M9RR2nF1pl5lUsRLgjUS3oSCXkEF
	 /26DngztyXazzavTKdap3oXHFDT6L/Vmxn+TqCojfO/QAoiSStrsOlNTeI7zbN9I2n
	 2UOzgohjrRBzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02DBC3808200;
	Sat, 21 Mar 2026 05:20:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/4] selftests: riscv: Fix compilation issues for
 v_ptrace and cfi
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177407041680.2771302.15564937503592221226.git-patchwork-notify@kernel.org>
Date: Sat, 21 Mar 2026 05:20:16 +0000
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
In-Reply-To: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: linux-riscv@lists.infradead.org, shuah@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, geomatsi@gmail.com, andybnac@gmail.com,
 debug@rivosinc.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

This series was applied to riscv/linux.git (fixes)
by Paul Walmsley <pjw@kernel.org>:

On Mon, 09 Mar 2026 18:52:09 -0700 you wrote:
> There are a couple of compilation issues of the riscv selftests.
> Coincidentally two of the issues are independent problems with not
> including the header that includes the BIT() macro and the other issue
> is from checkpatch incorrectly suggesting to remove non-redundant
> braces.
> 
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> 
> [...]

Here is the summary with links:
  - [v2,1/4] selftests: riscv: Add definition of BIT() macro
    https://git.kernel.org/riscv/c/e93c2978c9db
  - [v2,2/4] selftests: riscv: Add braces around EXPECT_EQ()
    (no matching commit)
  - [v2,3/4] riscv: ptrace: Fix BIT() compilation issues
    https://git.kernel.org/riscv/c/b1b59c40962e
  - [v2,4/4] selftests: riscv: Add license to cfi selftest
    https://git.kernel.org/riscv/c/5ccc568075c9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
