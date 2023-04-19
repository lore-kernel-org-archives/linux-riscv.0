Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8498FC77B7F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 14:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S0HiefkrT0aElhIKmlCBMO7Zl+2+Qg3cJPPCxj/9QL0=; b=RjSvyW6fNtDTBd
	XlSWTttsVdgNtIbYV/nEoRNf0dKyn4J216Kq74/oxjEGACc0Zg+RGN1+K9fwRzgcOGa10oC+i1ma5
	rqzf8bxNtZjvmJi24qw9heEmI2NE5LZMvQl4TFOP90J25FjqIY1E2FxRrv684+uCIBeVcmdDKRGbN
	pqAQOokcBc22YKoe9226lMwH7XfXD1F1ZC1iJVAtAqpXCpGPXfWP7i+LpXMFmrKoWG7ZETC4bYbxF
	T1WQxFrUTKQwJ6HZX8W3WJ4xTvkDmEsiO+h/OvpfCrz1oDSySwfjY+InDPb+Xd0f7voo00AqA7AXH
	+oYEUh1pvlDmNIcs795w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8pJ-005fx8-1N;
	Wed, 19 Apr 2023 14:30:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8pD-005ftJ-2t
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 14:30:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 02A27636B2;
	Wed, 19 Apr 2023 14:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5ABF9C4339C;
	Wed, 19 Apr 2023 14:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681914622;
	bh=VZxl14Tb5yyIRkuvHwe5N/hFs9h+A+yfCS95wDv+H8s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jKtMDx3Q+Ndv0cufNmrwuNg5bl/xbSZ162fA/6acYaeIGz+DOdouXraycBQTxYS+R
	 B4c4ZzuZOts1ZVrJquS5bXQ5HcEBAqrd+tlDXf+76bJxEn81G2Ey4MQianIbqbcBWf
	 Tt3nedVJsfAyWrcBbOzY8vu7af9UtCBQRzIhpOqGbY5OYnn5ea1TfcFyRMF0gw1ipR
	 8unBTqhhkwQ6+gjrG8pT7w6z/mqFEZjlJUpDTKrxWcKrhOCog70koGQd3FvK2f2UGK
	 C12Bt2SDB1AQTrluvDBFCEaRgIl3nq0qiA4W+eigZ9U1DROIHl3yQzLsYvMEqJhuuH
	 hYSDfG8vzWi2Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3EB90E3309C;
	Wed, 19 Apr 2023 14:30:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v6 1/6] RISC-V: Move struct riscv_cpuinfo to new header
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <168191462224.22791.2281450562691381145.git-patchwork-notify@kernel.org>
Date: Wed, 19 Apr 2023 14:30:22 +0000
References: <20230407231103.2622178-2-evan@rivosinc.com>
In-Reply-To: <20230407231103.2622178-2-evan@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, palmer@rivosinc.com,
 apatel@ventanamicro.com, aou@eecs.berkeley.edu, heiko@sntech.de,
 atishp@rivosinc.com, vineetg@rivosinc.com, linux-kernel@vger.kernel.org,
 conor@kernel.org, conor.dooley@microchip.com, palmer@dabbelt.com,
 slewis@rivosinc.com, paul.walmsley@sifive.com, heiko.stuebner@vrull.eu,
 ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_073024_005058_F44A37B9 
X-CRM114-Status: GOOD (  11.45  )
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

On Fri,  7 Apr 2023 16:10:58 -0700 you wrote:
> In preparation for tracking and exposing microarchitectural details to
> userspace (like whether or not unaligned accesses are fast), move the
> riscv_cpuinfo struct out to its own new cpufeatures.h header. It will
> need to be used by more than just cpu.c.
> 
> Signed-off-by: Evan Green <evan@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>
> 
> [...]

Here is the summary with links:
  - [v6,1/6] RISC-V: Move struct riscv_cpuinfo to new header
    https://git.kernel.org/riscv/c/ff77cf5b2e03
  - [v6,2/6] RISC-V: Add a syscall for HW probing
    https://git.kernel.org/riscv/c/ea3de9ce8aa2
  - [v6,3/6] RISC-V: hwprobe: Add support for RISCV_HWPROBE_BASE_BEHAVIOR_IMA
    https://git.kernel.org/riscv/c/00e76e2c6a2b
  - [v6,4/6] RISC-V: hwprobe: Support probing of misaligned access performance
    https://git.kernel.org/riscv/c/62a31d6e38bd
  - [v6,5/6] selftests: Test the new RISC-V hwprobe interface
    https://git.kernel.org/riscv/c/287dcc2b0c83
  - [v6,6/6] RISC-V: Add hwprobe vDSO function and data
    https://git.kernel.org/riscv/c/aa5af0aa90ba

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
