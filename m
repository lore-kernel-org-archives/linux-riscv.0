Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F640C61DD3
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 00:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KPSVV6yB2sOgaZN4Dk9BqS71Ut36xrVkkEbkzMFmF/o=; b=Na6Q4yOpbswg7t
	Z8chwOmpqVQSPmtQn9oD4JEnjUh8TjNAJsoISWKFwCR69QG589YN/vVKlIooCEOiyoLi7Ecn8HS5V
	M9Hio3nbIckzpwBwSXADVEk1qt8hoqc+AL+MikARuQPs29bBFSAVkR+QWVY0T1HDhUn/LwK6lrxpJ
	zhmm4ImnfUH0UU1aVv7hf4c/ox0JPmH0XDUNhMy3WzbyQfqQd1Hh6PISn0eLVsyv2p6fwVp8ccCJP
	8dGlo7zYmLUgPBKk7kyA1uA/Ked3D3mrPdOSFzHePe+7ztytQF/xXuJThnjLADI4VyfD1UqtNWzLC
	xnxoZ4XoPt6swt2faXPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1YzL-0000000Daad-1QZv;
	Wed, 02 Sep 2026 00:38:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1YzK-0000000DaZs-0IkN
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 00:38:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 79F2940877;
	Wed,  2 Sep 2026 00:38:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6EE1F000E9;
	Wed,  2 Sep 2026 00:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788309481;
	bh=DfJR0EFs1P7jIVGQK3ee6U3nMEEukmCAC0AcSA8LoEs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Nv0u25bU63GiMtvTjgt9PffUpQDdrhNk6Q/YNYBMXZZUpdHQrzrdR/t+r8xBkM3oB
	 LAQFGbwJ9RZKc8BSJWMz/T9q99Ix3PWPW8pjO7Vdr0h+sRgWR7fBHWtPVXhSoY6VtR
	 6cO/rmvqhiEYzQPsoUyZcWNOG/ScRnyB1Ff6LDjxetz0MsvNKdOgFS5JFv4ipKM0LP
	 IfTin31ZCdVYMdkP9yMXRFtDJVye9B7POPgUz7lbpMpDcN1va9qB0Nc3GNlvBVPvCk
	 PioZNu/C5wj/tQPprHih8lHg04hHE1NEm+HwzLo47oBluIfTXx2O+66JOK5wH7N2yE
	 6PN9W319iFQrg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A613926244;
	Wed,  2 Sep 2026 00:37:04 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1] riscv: skip software algning code for
 HAVE_EFFICIENT_UNALIGNED_ACCESS
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178830942362.1844276.13472654962321376660.git-patchwork-notify@kernel.org>
Date: Wed, 02 Sep 2026 00:37:03 +0000
References: <20260901192334.3543340-1-tchiu@tenstorrent.com>
In-Reply-To: <20260901192334.3543340-1-tchiu@tenstorrent.com>
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, andybnac@gmail.com,
 antonb@tenstorrent.com, dfustini@oss.tenstorrent.com, greentime.hu@sifive.com
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
by Paul Walmsley <pjw@kernel.org>:

On Tue,  1 Sep 2026 14:23:32 -0500 you wrote:
> We can jump straight into the copy loop if the kernel is compiled for a
> hardware that natively supports misaligned access. The user copy
> bandwidth improvement on K3 and Ascaolon is shown as below:
> 
> Misaligned user copy, size: 512B (offset: [0:15] except 0, 8)
> BW Improvement	| Write	| Read	|
> K3		| 6.19%	| 3.43%	|
> Ascalon		| 10.0%	| 11.4%	|
> 
> [...]

Here is the summary with links:
  - [v1] riscv: skip software algning code for HAVE_EFFICIENT_UNALIGNED_ACCESS
    https://git.kernel.org/riscv/c/980de8be1332

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
