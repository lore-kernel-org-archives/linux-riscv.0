Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2530CC3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 18:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+NZjm3f+yjeRSvHjK/ZrdJk5C8fsxlhfn4PUd6aSiMY=; b=TfTncdvooIRPbu
	PFtHSqK7DiYwTvzxVtF6+2qSJqYCHsrK0ljZyYZawmSXe0V3lonqPGqCGLiX2ZXKJ2DZe5Gon8Mom
	ks47EFQTehKATPn2ayT8PJ93ZgSQpCeoAf7OvOFoQjLPhxrhwSIzNR4phwkuTR4j63AOm2YtqGPJ9
	+TcQflEM10bXgGumdhc+2nKqQG9M64MoDLaglLVg0JQrZwb1tiNqkUx5rnfQwkWYsMO88BpYepCgA
	Vko6NJkDjSDz++UXgnkut0xaP4yBM8+qhbH5Za+h1f/853l3WlhO1Rd4X/5OpMLh3uf8OVjPiPBW2
	+wzkuYFhTpJhyL9r2XEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZDcp-000000024rf-2KHO;
	Wed, 31 Jul 2024 18:00:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZDcn-000000024qp-0zXx
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 18:00:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 620D962576;
	Wed, 31 Jul 2024 18:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C347C4AF09;
	Wed, 31 Jul 2024 18:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722448832;
	bh=QlnmxtwAARTZlkJz+Yt/175l065sJ6S1HGtyh0yi5yA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Nn9jpnbpXSa6uOd5lzxbOqS22J8i017YYLVR6zp7IM1INroQ70xe3KRwbZXIuV+xx
	 HxlQQQWWG1wt9NG2BLaDbrg4RycPvdVfyR1eMZpEiLs0QkIw9LULbo1WDCwzji2Lg8
	 06NPTJayVe1vXo0dlUACGVkY07TWzdiatSmvoGLXSV3Qg4KB7nx0L5UDdmuwjEBggU
	 ZsNfkLJLaHkfLPIQey2J2Sd2ZOHGbpGm9TTEZ1TUfV+nR6+bL7V3/sb3PJnpKwkNIP
	 atV5SQc+vt6b98pNhA6/6QWkPHahyItcbLsnDQBSSUfAFEshW8AlpsGJkkyYtIKZkh
	 McgBPaFrfh7vA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EF4B1C6E398;
	Wed, 31 Jul 2024 18:00:31 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes] riscv: cpufeature: Do not drop Linux-internal
 extensions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172244883197.728.4079912694148388299.git-patchwork-notify@kernel.org>
Date: Wed, 31 Jul 2024 18:00:31 +0000
References: <20240718213011.2600150-1-samuel.holland@sifive.com>
In-Reply-To: <20240718213011.2600150-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, ajones@ventanamicro.com, andy.chiu@sifive.com,
 charlie@rivosinc.com, cleger@rivosinc.com, conor@kernel.org,
 evan@rivosinc.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_110033_341215_8504E164 
X-CRM114-Status: UNSURE (   7.82  )
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

On Thu, 18 Jul 2024 14:29:59 -0700 you wrote:
> The Linux-internal Xlinuxenvcfg ISA extension is omitted from the
> riscv_isa_ext array because it has no DT binding and should not appear
> in /proc/cpuinfo. The logic added in commit 625034abd52a ("riscv: add
> ISA extensions validation callback") assumes all extensions are included
> in riscv_isa_ext, and so riscv_resolve_isa() wrongly drops Xlinuxenvcfg
> from the final ISA string. Instead, accept such Linux-internal ISA
> extensions as if they have no validation callback.
> 
> [...]

Here is the summary with links:
  - [-fixes] riscv: cpufeature: Do not drop Linux-internal extensions
    https://git.kernel.org/riscv/c/b75a22e7d4f2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
