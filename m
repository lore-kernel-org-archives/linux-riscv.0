Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA11BC54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 04:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4WVIWg6ywy1CqFmZNZut6QGN8HfVSIWGmdMtqpaA0ao=; b=CEzTc0KKnjZ+m4
	0+EVoef1ZAD1b5m9n39LjTsCcpBq0PMEogTOOhWyzxIRReBiROVIGxfB7v8WklfIHStdAvYZglq2H
	d1ugQajBqZJRtXzBrwgKOlEaPu0vWxJESYELllaVZ+lW7tmYOqsCGJhJGMqPs97y27/wxHOoH9chv
	JY7e6br5L4lvA9b6JxwGjzem/6I2acEgTlfFZNbp2RQwwIyN4eFBbm7Zh5K+3xiyUnxSmtfM55X1M
	wx/2N75CV3dnL79S9ZT8gB1RoNVTvrKMuMONTw3+Xv54X8L4Y+yvyjWiFkyDleuhRwe57TcspJqjq
	4cn++nufiTa1ahLLntnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rocAU-0000000FE9P-1YI1;
	Mon, 25 Mar 2024 04:42:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rocAO-0000000FE4e-1Uye;
	Mon, 25 Mar 2024 04:42:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6128B60DE9;
	Mon, 25 Mar 2024 04:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5273C43399;
	Mon, 25 Mar 2024 04:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711341754;
	bh=duVRPOkUwtqb9I+6o5VQiYAgtSlpWGf+X+0yQv8TjAs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iZ/b0NE+i7+do8pgZkg46x1uBB/MQJfp/c/XhpH71z/wGKatNJQnfFVi4TsSrJUcx
	 p9B9v3m0m2h+2n352ZneEdcJs25ZuYmCkptcEJJi14CEjUg6fZRWGQjsnzSbTTqpuQ
	 jBLNyyJKgrClKH6Ar2Sk8/u0rVBaZT96gqSwdlSHBYKiJ8LneSrMklScm8Ww85dTEe
	 eja5sWn2jN4CV4FDoeaf5TOJPL86Efy9rTKDI0W7hc3GLlwluHdA9GYm7yTBbMYg6F
	 MrrxjzojsaA/BYbk4OYMb2sE8+b4REldcJ8JhTboSwFB0wiYQTm1AKpQdnuWO2wot9
	 CNckLCoG3Oykg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9F5E8D95071;
	Mon, 25 Mar 2024 04:42:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 00/11] Bump the minimum supported version of LLVM to 13.0.1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171134175464.18749.18342004135343709281.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 04:42:34 +0000
References: <20240125-bump-min-llvm-ver-to-13-0-1-v1-0-f5ff9bda41c5@kernel.org>
In-Reply-To: <20240125-bump-min-llvm-ver-to-13-0-1-v1-0-f5ff9bda41c5@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 masahiroy@kernel.org, nicolas@fjasle.eu, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev, patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, linux@armlinux.org.uk,
 ardb@kernel.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, aneesh.kumar@kernel.org,
 naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 conor@kernel.org, keescook@chromium.org, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_214236_483461_7AC54AF6 
X-CRM114-Status: GOOD (  10.09  )
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
by Andrew Morton <akpm@linux-foundation.org>:

On Thu, 25 Jan 2024 15:55:06 -0700 you wrote:
> Hi all,
> 
> This series bumps the minimum supported version of LLVM for building the
> kernel to 13.0.1. The first patch does the bump and all subsequent
> patches clean up all the various workarounds and checks for earlier
> versions.
> 
> [...]

Here is the summary with links:
  - [07/11] riscv: Remove MCOUNT_NAME workaround
    https://git.kernel.org/riscv/c/de5f3984664e
  - [08/11] riscv: Kconfig: Remove version dependency from CONFIG_CLANG_SUPPORTS_DYNAMIC_FTRACE
    https://git.kernel.org/riscv/c/a38d97181271

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
