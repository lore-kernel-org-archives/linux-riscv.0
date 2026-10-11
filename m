Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4595CA9EC7
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Oct 2026 13:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ig/A7N76so2EtIINlOWK+bdHe7x9sdy+tl9R7/ntXaU=; b=ZIv4TxP8BILgva
	4vq3aMFw2Rge+zO7RvC9XYqhnM6abomp6tkPZVsJfiaKORMzHeScth0yiMRGmMKCJYty1aqUvckMG
	Jbp5m/b7nSkKMcxIlvBhstYdyRdCgnbgdk160JJtiFMS1yIH+5fpsJWiDDriac+nIAmVWo/j4jFoH
	0n3Tno6pan2ZJTZrhW4V6O06iVoqJPYfa1fZwtBrgOPAUt0RXlwqA8BwtSCrTEBGAYGEOysx2u1KU
	X6fSzTp2oBrAMbYOGOfhjLBhmB0+q0jLTRl2AKNHiZo9yWqEhdyBcKECuA1o7dnz3C5WtIJUTKC/T
	JmwMa+7i3nTN4PnBYqmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtme-000000094Y9-0ikJ;
	Sun, 11 Oct 2026 13:40:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtmd-000000094Xt-0dgG
	for linux-riscv@lists.infradead.org;
	Sun, 11 Oct 2026 13:40:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 52D8A600E2;
	Sun, 11 Oct 2026 13:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0576A1F0089B;
	Sun, 11 Oct 2026 13:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791726010;
	bh=FHIQ2/ttZvMYlRT/6D0OsTdIGEr5QcIRPG0J3e/7ydw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=TVNxiJVFxiZu10UZZKt5BVzgzA1RCMwG+ei5e/IPlQ/Mhonxn7em2yJQLZ+gaJ1LI
	 BLmCYoZjgzug7QV6NcN0c5KKhxgj8LaDrI5dgu/cMhzdi6i1Xg0KV6fO9fTOIxXmDD
	 h2iy+Vv+XnNrgNH7gcBk+PHXaQhCsY/+5/RV3oe2VNrPw4LxSwaNDNZTICDZ747/r5
	 Pazr/GETGutrTqzZtyMUSMpPSqpreKTfZFnR3WMzj+q6yIVffdZA+gJCWJ3JbZ16AW
	 S2Gr7KMI+KjGGaA6sS11Vm1TI1rS9HFENgqX5Tpt9teyuIAxmSSMRMpleE3LxyIDnV
	 PrTJQL6QMqqkw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14F33811966;
	Sun, 11 Oct 2026 13:40:09 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [RESEND PATCH bpf-next 0/2] riscv,
 bpf: Support indirect calls to bpf subprogs (callx)
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179172600877.2055679.12548960666463019147.git-patchwork-notify@kernel.org>
Date: Sun, 11 Oct 2026 13:40:08 +0000
References: <20260930064928.1909085-1-pulehui@huaweicloud.com>
In-Reply-To: <20260930064928.1909085-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bjorn@kernel.org, bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev,
 song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
 emil@etsalapatis.com, ihor.solodrai@linux.dev, puranjay@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr, pulehui@huawei.com
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

This series was applied to bpf/bpf-next.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Wed, 30 Sep 2026 06:49:26 +0000 you wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> This series implements support for indirect calls to bpf subprogs on
> riscv64 and enables the corresponding selftests.
> 
> Meanwhile, this series also resolves the test_verifier failures
> previously captured by riscv-bpf-daily due to missing callx support [0].
> 
> [...]

Here is the summary with links:
  - [RESEND,bpf-next,1/2] riscv, bpf: Support indirect calls to bpf subprogs (callx)
    https://git.kernel.org/bpf/bpf-next/c/1cec0b70fdc6
  - [RESEND,bpf-next,2/2] selftests/bpf: Enable callx related testcases for RV64
    https://git.kernel.org/bpf/bpf-next/c/530dfafc6107

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
