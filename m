Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E12C27C53
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 14:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0VSJ5eeU19AUV3Sec7N3Yf+E2hW+UjgUblaZNY/PW3M=; b=taWqtLetldvZ7t
	UqUfTXOLcHVT5rDGbU4UA32Y9KL/hBie3C6/xszqwR2UmWu3FvmykXo1kD4iLpuw3KgqIvkOXMZQX
	dwggCJV/+1s+yNoqOBxhgSx+zYhOsI4FXBMHamwjfeJtddD44ZGjvwnS4X9FofERYlZeLMITsgwhS
	s3n/+cmGL8EE5Fq8J1qfG0HDcXXWnZo0TPFf/ln9fXXJgjhLCjOUGjJT7V2Nx7H1HICSw035swXYl
	4l5Ce4jecxKhWqByoCbT+kvL73ZwJVFXwFws/6AD4eNcxXdLb1gXhLPJUsWEkYL9WHlT86j5wIJB2
	gHTVmU14DvxoiA3okfzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sErLe-00000006PhA-30rA;
	Wed, 05 Jun 2024 14:10:42 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sErLa-00000006Pf0-1dKp
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 14:10:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5584CCE17FD;
	Wed,  5 Jun 2024 14:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91976C32782;
	Wed,  5 Jun 2024 14:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717596632;
	bh=UAGR9QnDd/41AzrEWFL4+jkhr/ZCBaiQbiOH3HOBB/g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MpIQlPN5wugTeCpN79pjIFioDuHkCQ3Uqo7ZKSzAu3HaBG2SaiuW9Ao6lw0IBK6tJ
	 qDK2SDXT47L2jstsG81CFjQqPy86xdJFmjc3xgtampCsL6dakhKSESYKuQdJX+Gc/j
	 ye+oZGcjBV0DYFJpdEfMe9zPcEFnuybYoNaJjwDNC2Z3UpEGNkGktNy2HBL+vfhwEi
	 PGollhc2ATqG6cnbf5UNhOg5uX4eudfknjQiExMzwhPk1iSeLHOPBZSDgB3s5/Whnu
	 yGEibjkfImlj1X6lKmpyWLXnZZBrEwsyXHHsDoh8BSyx7+AKRqoggPpp4yR3cU/cuw
	 WWls8/euaummA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 754F4D3E996;
	Wed,  5 Jun 2024 14:10:32 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/8] Support Zve32[xf] and Zve64[xfd] Vector
 subextensions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171759663247.19543.9794299623549255607.git-patchwork-notify@kernel.org>
Date: Wed, 05 Jun 2024 14:10:32 +0000
References: <20240510-zve-detection-v5-0-0711bdd26c12@sifive.com>
In-Reply-To: <20240510-zve-detection-v5-0-0711bdd26c12@sifive.com>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 heiko@sntech.de, guoren@kernel.org, conor@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net, evan@rivosinc.com,
 cleger@rivosinc.com, shuah@kernel.org, linux-kernel@vger.kernel.org,
 palmer@rivosinc.com, vincent.chen@sifive.com, greentime.hu@sifive.com,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, cuiyunhui@bytedance.com,
 j.granados@samsung.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_071038_796154_C94BEB14 
X-CRM114-Status: GOOD (  12.87  )
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

On Fri, 10 May 2024 00:26:50 +0800 you wrote:
> The series composes of two parts. The first part Specifically,
> patch 1 adds a comment at a callsite of riscv_setup_vsize to clarify how
> vlenb is observed by the system. Patch 2 fixes the issue by failing the
> boot process of a secondary core if vlenb mismatches.
> 
> Here is the organization of the series:
>  - Patch 1, 2 provide a fix for mismatching vlen problem [1]. The
>    solution is to fail secondary cores if their vlenb is not the same as
>    the boot core.
>  - Patch 3 is a cleanup for introducing ZVE* Vector subextensions. It
>    gives the obsolete ISA parser the ability to expand ISA extensions for
>    sigle letter extensions.
>  - Patch 4, 5, 6 introduce Zve32x, Zve32f, Zve64x, Zve64f, Zve64d for isa
>    parsing and hwprobe, and document about it.
>  - Patch 7 makes has_vector() check against ZVE32X instead of V, so most
>    userspace Vector supports will be available for bare ZVE32X.
>  - Patch 8 updates the prctl test so that it runs on ZVE32X.
> 
> [...]

Here is the summary with links:
  - [v5,1/8] riscv: vector: add a comment when calling riscv_setup_vsize()
    https://git.kernel.org/riscv/c/77afe3e514b8
  - [v5,2/8] riscv: smp: fail booting up smp if inconsistent vlen is detected
    https://git.kernel.org/riscv/c/38a94c46660f
  - [v5,3/8] riscv: cpufeature: call match_isa_ext() for single-letter extensions
    https://git.kernel.org/riscv/c/98a5700dfaec
  - [v5,4/8] dt-bindings: riscv: add Zve32[xf] Zve64[xfd] ISA extension description
    https://git.kernel.org/riscv/c/037df2966afc
  - [v5,5/8] riscv: cpufeature: add zve32[xf] and zve64[xfd] isa detection
    https://git.kernel.org/riscv/c/1e7483542bf8
  - [v5,6/8] riscv: hwprobe: add zve Vector subextensions into hwprobe interface
    https://git.kernel.org/riscv/c/de8f8282a969
  - [v5,7/8] riscv: vector: adjust minimum Vector requirement to ZVE32X
    https://git.kernel.org/riscv/c/ac295b67422d
  - [v5,8/8] selftest: run vector prctl test for ZVE32X
    https://git.kernel.org/riscv/c/edc96a2b4c79

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
