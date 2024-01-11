Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D44C47DB0
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 14:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/1iBQZiyH/Mrj0W42TljwwCZWGffEirA+ngAea2+Ank=; b=4zDnt9ingwTL2y
	ZPR0tRNw6TR9irBmUzbdxUUUM1l6Jsnqe/qoGM/ywnwCWS8bEHr3OQMursDpZt0Ck2kqN+HreDZNe
	+019+xmZIQDAJcuGNJoCJmGB5VvaqxDPNaLUGkc2kXApOxKA8rdF2Brpx3mBJmgKYVhc0rZiiIU0h
	B6KiXVYYoVV+dRASZgeSsxyCQtBxykcSL3CBaceDBvAHUTb42xsqUFUVexk5V5c2fjwaEaLjsxEf6
	KutSekKAftLoJtIPbbB6bh2u3xN4cLWpjf7tYS1u/rOlkYycunqZXR/nRrSVcHR+tfBYMF9kp239d
	98MnMW8mF2BMmMI5cezg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwOU-000KQS-22;
	Thu, 11 Jan 2024 14:50:54 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwOJ-000KJv-1y
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 14:50:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 76FBEB82063;
	Thu, 11 Jan 2024 14:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED2CEC4166B;
	Thu, 11 Jan 2024 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704984638;
	bh=QWatFqK+FZtSrigvY3VYuU2+QMxyML/XXXBrhQ7Moh8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IyfmibMmfWFE9VNHB3wbJEXlRYEUBGsWAjvujFbU0flIiCwiSO4o85MURxgEF7iUC
	 8umdxZWRYV/Tn5pdwiaPK6hlrvseibDY6nHq93ewD9LoLMQcIXah6zThpSZmJITNVa
	 CV6GZlrUKjvLtu+9+4dJSYCChQMiApeSj1yVFYpCLj3KUSEgECJUjfLf/LgIuGPpo7
	 NPQ0ss/LL3+9EqP2vzf4tXKiHs/Qvz8RyxivJy98NauVnrvx+Jm4W28o0Z9Pwqnm7O
	 aFE0OdtKOlUOmo97KGDLsOb6ODc2g63/XhwK4T2U2dNxKUlHT3WpMVWu1vNsiGOdD5
	 zqag26HoHLv7w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D84CDD8C96D;
	Thu, 11 Jan 2024 14:50:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1] dt-bindings: riscv: permit numbers in "riscv,isa"
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170498463788.20080.14469126182221973580.git-patchwork-notify@kernel.org>
Date: Thu, 11 Jan 2024 14:50:37 +0000
References: <20231208-uncolored-oxidant-5ab37dd3ab84@spud>
In-Reply-To: <20231208-uncolored-oxidant-5ab37dd3ab84@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 conor.dooley@microchip.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_065043_799069_C6F4263B 
X-CRM114-Status: UNSURE (   8.32  )
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

On Fri,  8 Dec 2023 16:06:51 +0000 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> There are some extensions that contain numbers, such as Zve32f, which
> are enabled by the "max" cpu type in QEMU.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> [...]

Here is the summary with links:
  - [v1] dt-bindings: riscv: permit numbers in "riscv,isa"
    https://git.kernel.org/riscv/c/baa04909d100

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
