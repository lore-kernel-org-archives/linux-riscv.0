Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974826072158
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mGU4+z7P;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E03HRJiW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BZcB5LI/bYkIWMoCx8JciyKuK2OJHAZ597cO8dmUcIU=; b=mGU4+z7PXUpF0NKBxBUwjhuMmq
	eB+FZ1nDcuTp6PNwIolX4hmf6GnjkC9ILi6ri1aCsSPhXFeoGT6u0KMbLXtGxINgI4Yp08+5arOA8
	nRMJP99IBFl6em1EQ2J1q0tyJ2uW94P93UOo0kRw8xuaYpxvXnAbUq8Q5JNySCspV3esd1KbYKNdv
	84BZhY9bv+iIjypFcfUrpRYwf7z28dzvi9I0CplstCYBnYe9POgiJ07u51+8FsB7Mpq9ztCMK+YCV
	Um0zKaWAzhOtMfYn3rOJpE7KOaJtV7w2z3/8dgrQwDlisJaZ8Lz0oj1qxdvj7Vp4qSUEuQnU7xNBy
	K1347jig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqz-0000000F0xR-3ftG;
	Sun, 01 Nov 2026 22:16:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqj-0000000F0BH-146l
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:16:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 96FAF605D6;
	Sun,  1 Nov 2026 22:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 494FC1F00A1D;
	Sun,  1 Nov 2026 22:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571384;
	bh=fIWdtQoZgU+HOxQ8xPE7U0OO9UgX4aiH7YmUwuj+ArM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=E03HRJiWMH7vhzLjAIAvdkSug+FbE0oqKaLpUuUiovEpCVsAAnofPD2ZY4nGlMBTL
	 MsomjHvrrseLRoGulL364cZHAd+rEebKk9OGO0M3Q5qd1LCM/2qapQHY82ORqPwvup
	 Eied/++HJpf91kTVLQ/Y4v2gvHTP9zUVoXb1bLDUS3++xUel388+HfAtrZWOjcOWak
	 de1VDzkC8toobp3DO+dh3bv2XFf7GLPh0eoW8E636a86a1F4GSPJUpoPPW+ATwW6WP
	 Yr2425Y6oR9vAaDACt9obbh8LjTJJ72SqGEaCC1uV5jD403ArDE6DLYdYhk0joVtl2
	 jfN5uoZ0iDBEQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4020938003B8;
	Sun,  1 Nov 2026 22:16:24 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] serial: sifive: fix off-by-one in console port bounds
 check
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357138279.2624073.12379269503301547375.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:22 +0000
References: <20260827014524.19375-1-min_halo@163.com>
In-Reply-To: <20260827014524.19375-1-min_halo@163.com>
To: Zongmin Zhou <min_halo@163.com>
Cc: linux-riscv@lists.infradead.org, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, pjw@kernel.org, samuel.holland@sifive.com,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 zhouzongmin@kylinos.cn
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

This patch was applied to riscv/linux.git (fixes)
by Greg Kroah-Hartman <gregkh@linuxfoundation.org>:

On Thu, 27 Aug 2026 09:45:24 +0800 you wrote:
> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> sifive_serial_console_ports[] is sized SIFIVE_SERIAL_MAX_PORTS (8), so
> valid indices are 0..7. The bounds check in sifive_serial_probe() uses
> "id > SIFIVE_SERIAL_MAX_PORTS", which lets id == 8 pass and causes an
> out-of-bounds write in __ssp_add_console_port() through
> sifive_serial_console_ports[ssp->port.line].
> 
> [...]

Here is the summary with links:
  - serial: sifive: fix off-by-one in console port bounds check
    https://git.kernel.org/riscv/c/bf961847813d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
