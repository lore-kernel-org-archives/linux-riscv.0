Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37252606A329
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xiG775sa;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QphlQCK8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ARiDjm4sIGDSxqmI+kv7f4yBQAKdICMhVLZPVGy6tl4=; b=xiG775saHsvBrZ00JAsTfMnRyv
	hgJHf/ondCma0eBPz7R2ZpkJi6y0/ha2XnlaO6M/komkWuaiGeqEyEZgWHDFfiqUXbVKZqZzSapFC
	VHUQ7eEcMEZAs+hIhNvW3ZM6IcNJgEX4ioO9HxcsPEvoKZps/1iKRyprwQIZRAhtRd7qqAZEBn3y5
	e84wA39lS3ubxlNerDjMHmrg0bsMZqecfa2GpOgU1wrUsr7geBClTM6j9bR+fmeR3tk2sXqxzA8E9
	bQ69HE7g8nICvmHrHduq0bn42drzqTgY3ek1MknvFfqKp2P2W/e+O+abeu+R/kb88T8hjcSRL3g0P
	ISKz6w9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeDG-0000000F9lC-2Ejo;
	Sun, 01 Nov 2026 22:39:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeDG-0000000F9kj-0fqk
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:39:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E3BA84323F;
	Sun,  1 Nov 2026 22:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5CEB1F00A15;
	Sun,  1 Nov 2026 22:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793572781;
	bh=uKOf/sWuocTr+7AtsLJJEtOK0qwIac4arzN8no/qmUE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=QphlQCK8cpyKZuXZE49sZvVNg4wC9zZbAZq8JggdsOIJ5/Jv2HOTHHVSr0SGZ0VfM
	 SGfAJrhIQjrkWNZd67JOm67gETu116yDg0Y8XASkdC0QA/KPSft57ElcJKmgx9sq8n
	 CI6zyrHdsnmPr4N01ivysUI89C+y4mjbbCXC+i5g3V5Hq5DjWt0sI6f38KF3/IjTUq
	 +rgjeOvteGPHVDbr8i7jkfzvIprxCsgDafSYnknEU9zUGJvnacnYVJV+/Bgs1ofO/6
	 uUWECZt8Y7dugr1aIceBUnZrRXbRHK0jqlPPUn5/02FKZLMujct1uqmvCxMnAXDvM4
	 HxQN66YfkYiDQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA41C391AF9C;
	Sun,  1 Nov 2026 22:39:41 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v7.4
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357278029.2624073.4779038529304323110.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:39:40 +0000
References: <aff6ff25-8969-4a35-9543-9113afb2e003@linux.dev>
In-Reply-To: <aff6ff25-8969-4a35-9543-9113afb2e003@linux.dev>
To: Chen Wang <chen.wang@linux.dev>
Cc: linux-riscv@lists.infradead.org, soc@kernel.org, arnd@arndb.de,
 conor+dt@kernel.org, inochiama@gmail.com, sophgo@lists.linux.dev,
 gaohan@iscas.ac.cn, lihangfan@iscas.ac.cn, chenyou910331@gmail.com,
 andrey.lalaev@gmail.com
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This pull request was applied to riscv/linux.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Fri, 9 Oct 2026 17:23:58 +0800 you wrote:
> Hey Arnd,
> 
> Please pull this dt changes for RISC-V/Sophgo.
> 
> Thanks,
> 
> Chen
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Sophgo Devicetrees for v7.4
    https://git.kernel.org/riscv/c/5d299ec9395e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
