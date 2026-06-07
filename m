Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9BDCD8C88
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 05:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pDuK5DbCLdzcKFqiEM0R31xYPYjACMejUBw4+K1OPKg=; b=i9iwPIE+wFq/bB
	kPUkkq3jgd173gfkc3QvL0gXKVXbFE64/IG7LuEVBxbOE/akrz1s60bV7/M+oqFzZGDZaN5DUWXai
	e+Pdnj+BdY5TaJy8sE0b0z3EH5qziSHgPTiXXcDctr99pfenKqAQpo1HN1NpYNy9QW+VWsVTmuErN
	DeOIVWg4wOmwZp5obvNRNH/DuzlqBxqnbuXqMW5hRczI0lqYzM80ry1tboX3FkW7i7QM6UhkA2s+W
	QOZGN785PSwU9xjz2KtwFFgrAja+W3KpuCtqFrz/ctCK4C9r9dEmGulD/Nsm4gK9YLQpM7XHmIv4E
	XLzJB9HcQ/sPSXlSYTXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW5m3-0000000221p-2N3I;
	Sun, 07 Jun 2026 05:10:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW5m2-0000000221f-1lCT
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 05:10:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 72C1343F63;
	Sun,  7 Jun 2026 05:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 473D31F00893;
	Sun,  7 Jun 2026 05:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780809013;
	bh=FhxLVLV7boFVF3rVaqt0wvqfHLkviyFEXdpRZw9osbk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=HoOY4/k6kZLk4VObrc4IZpk1BrXUnWQKwMCNqQzI1wxtBiecN131M7LAsQncVbs8e
	 T8do8P/w2Y/g/4DPsD+JzyKr7OtST8nP0+3gmedzexkn5s9qQ3c5sgWA5PA3mA1ofB
	 jbOBDRztbQoGea2/zwfb2yaEcfPm5bJvG4jojqZ6q0VHJ6kl2xGvaz/FYbik2cgeR5
	 BOKpazgTFo3Nac8aALZ03Az0nG/LBDXyqUGQJsp291kcVFo6e7z47UGJRkzh97Dj78
	 BelZo1NaIPvbCp/CvXY/r5Qs3JkpZBZVNNsrNuyDougR0ldjYeYeoYj/U+bvmIuP2b
	 WR7U/BV383sRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1987B3930C3F;
	Sun,  7 Jun 2026 05:10:14 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] riscv: stacktrace: Fix return address handling in
 non-FP unwinder
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178080901279.114658.9003538182499897339.git-patchwork-notify@kernel.org>
Date: Sun, 07 Jun 2026 05:10:12 +0000
References: <20260605082034.1426923-1-qirui.001@bytedance.com>
In-Reply-To: <20260605082034.1426923-1-qirui.001@bytedance.com>
To: Rui Qi <qirui.001@bytedance.com>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, linux-kernel@vger.kernel.org
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
by Paul Walmsley <pjw@kernel.org>:

On Fri,  5 Jun 2026 16:20:32 +0800 you wrote:
> This 2-patch series fixes how the non-frame-pointer version of
> walk_stackframe handles return addresses, addressing both the
> unwinder layer and the display layer.
> 
> Background
> ==========
> 
> [...]

Here is the summary with links:
  - [v2,1/2] riscv: stacktrace: Remove bogus -0x4 offset in non-FP walk_stackframe
    https://git.kernel.org/riscv/c/73b6d019c851
  - [v2,2/2] riscv: stacktrace: Use %pB for return addresses and %pS for exact IPs
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
