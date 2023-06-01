Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15C0C77B7E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 20:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DRHV6rsxJGBQMQXb9k23ujyi1vCO2rcotAQNmSkM2hU=; b=xD8vmz2N8BcqYh
	HyO9buysfa6XpRMC8UWAVYS86ior8h8RHCCxOJe+eDrJKHQIre64XPyEdjdKlTHFB0iY/j43eMR3e
	miRMDgTLVtXU2H6SEHV89vaHB8MHcrhPVs+MlDwSRt0eHJdLafdMMTW5FSJ5Pl3GpVYc4Oa0UtgnH
	vpfeiQAw4ybzdd/zobWlTwufNdbjSSDOlW38dv7KDHOPFevdGUr7HhZI622GwLOYUcIJ3EkGBrIz1
	K84bU1xTWeZDcrXUzs62eiZRA2iGybosPPXdENOtPlSa0xUkrerL1OGZqkWoo2h7h04wqLD1sC4fU
	n1yoChAXPUKwpIabhDBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4omW-004qqu-2t;
	Thu, 01 Jun 2023 20:20:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4omT-004qpU-2l
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jun 2023 20:20:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 093BD64962;
	Thu,  1 Jun 2023 20:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB9CEC433D2;
	Thu,  1 Jun 2023 20:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685650820;
	bh=BsmB3TQT0UqKDYGfBMXSuKQ4Y303rceDlGSh2ELAoAE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QdOa9tCnbNQAChJM6Emg4vuZfL2cpnLL8U2OJV12cuUcXqYHNdU2Z/PnPNhGdYxMK
	 aOWMML0vZAy+BB/VorJEnrY1hlDuUVOWx9CEGc4Yyy0dTAui3/D7xSiE/RtOV6VCln
	 Bl13cTh8RbcTJFDF6fBjvQMpgzKU+CuESI5xvsjRFGqKtQmZlH9dDfD8mbWHgq8nIY
	 93vE/tj2Jv/EVMPKRuuZDyGW7/xi6D1koCf7Mjts4U8NMLGJnCqtXACZ9jbMKNano5
	 aKIDZhi6IkaHqTS+ndkaPYN/1a2i+dHLMLbmxi5Bw4be56RolorRMCYhxS6dkkaIoJ
	 Xdwuzw0hguPIA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CFCA7C395E5;
	Thu,  1 Jun 2023 20:20:19 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv/purgatory: Do not use fortified string functions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168565081984.8603.17593394447980152382.git-patchwork-notify@kernel.org>
Date: Thu, 01 Jun 2023 20:20:19 +0000
References: <20230601160025.gonna.868-kees@kernel.org>
In-Reply-To: <20230601160025.gonna.868-kees@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 linux@leemhuis.info, joanbrugueram@gmail.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, masahiroy@kernel.org, conor.dooley@microchip.com,
 ndesaulniers@google.com, hi@alyssa.is, heiko.stuebner@vrull.eu,
 gustavoars@kernel.org, ajones@ventanamicro.com, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_132021_957071_DFBC13A4 
X-CRM114-Status: UNSURE (   9.90  )
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

On Thu,  1 Jun 2023 09:00:28 -0700 you wrote:
> With the addition of -fstrict-flex-arrays=3, struct sha256_state's
> trailing array is no longer ignored by CONFIG_FORTIFY_SOURCE:
> 
> struct sha256_state {
>         u32 state[SHA256_DIGEST_SIZE / 4];
>         u64 count;
>         u8 buf[SHA256_BLOCK_SIZE];
> };
> 
> [...]

Here is the summary with links:
  - [v2] riscv/purgatory: Do not use fortified string functions
    https://git.kernel.org/riscv/c/0f84097ab015

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
