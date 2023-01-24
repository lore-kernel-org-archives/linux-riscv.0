Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDE7C54EED
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 22:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QFtMs8lvY6X8GiiSUgrJYo1DnS48siyUu8t+afL5TZE=; b=mdR3SxIAE259XH
	D193uF0rVh7STGRaIyYXEU69rkSzuVXtij36/+dh4za2gzvrbsP/z29c24gnV9YzeszpE4JGpUA5e
	sYo9GJ28F9ngjHFZMyfDb2ymNS5CrjXGUhyXI3gqjRb06Dx9bcdp9wQ8zz4M/JbW/hmyEYLGCbEXi
	2xL4xgKlwQVaitBlSAZz8V1v3shAZOHlLkUe9Ye5oayy3VEvtUjC+zBn0gzrclOP/47NYI36LcJqN
	8C0EjVNCs+UdewrF4LMnpOS2xZoU/Yn15UQKxPk8NiyF6t4iOqCppHgYrMxbWEp90Qx7AdanH6kdB
	6w9fuqiE0TlP6ugqnNSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKRxo-005Xfy-Rd; Tue, 24 Jan 2023 22:40:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKRxl-005Xe5-Uy
	for linux-riscv@lists.infradead.org; Tue, 24 Jan 2023 22:40:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D045361384;
	Tue, 24 Jan 2023 22:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CCEBC433EF;
	Tue, 24 Jan 2023 22:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674600018;
	bh=UZ1bbTP9wKTGHzz4tz3N2CqqtNbE/N6eI+d92JGLXUU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JfSCZo5+sRU0U/bALY3HMljBvquH4FdUnYEM2gl0MaFmQvfRmv+4aKY259UHNywCC
	 +WjGlgPuoPW0qJVDVlEXoR4cPYZN5Ac6j8YQWY7W9UvcAeadZgmrXYLAmxRRYK+VkO
	 c57+R7uav5X0IG5aa5Qprx4tHZkz8yrHSDrDQrNWKRPvn9pF+qWxe+HHa96t9Cb5bS
	 rGQ0zo0SRbMrrN638/jJnOp9Qogoz8QQL2ggo/A2epyQQLEpcvUouQDK3iPxoB8TQq
	 hOpyecPcGbVfnCwZ3XE5uOugXxQ0BpwpN210VCnExS1KrXKJY1TPTAQpeC35SUFyMB
	 VURuSMlzUwkzg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 17520C5C7D4;
	Tue, 24 Jan 2023 22:40:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/2] riscv,isa fixups
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167460001809.14719.16320756846682473720.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jan 2023 22:40:18 +0000
References: <20221205174459.60195-1-conor@kernel.org>
In-Reply-To: <20221205174459.60195-1-conor@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 conor.dooley@microchip.com, jrtc27@jrtc27.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, heiko@sntech.de, ajones@ventanamicro.com,
 guoren@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_144022_056935_A90971B1 
X-CRM114-Status: GOOD (  11.37  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon,  5 Dec 2022 17:44:58 +0000 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> I noticed ~today~ while looking at the isa manual that I had not
> accounted for another couple of edge cases with my regex. As before, I
> think attempting to validate the canonical order for multiletter stuff
> makes no sense - but we should totally try to avoid false-positives for
> combinations that are known to be valid.
> 
> [...]

Here is the summary with links:
  - [v3,1/2] dt-bindings: riscv: fix underscore requirement for multi-letter extensions
    https://git.kernel.org/riscv/c/ec64efc4966e
  - [v3,2/2] dt-bindings: riscv: fix single letter canonical order
    https://git.kernel.org/riscv/c/a943385aa801

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
