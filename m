Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFB4C5B549
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 00:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sLaYF5Y3QnZXhM6EsqAEhPTfiWNNwFDRZ2ejOopdR4A=; b=Maxk6fIKJPB6q7
	2tPrttf6Yq2evizb65i108Hlf3phWEchoJlW+vhB85Spy2xA3vs3vC+YimN5onpKijVNTYbq3KJ3o
	wP53NVDe1Swv+y5wspbnD+M5QzDMEEwbTgfmmnA1sCxDqjUV0/uFsymxQeE8D2zTm/z/9kNxXMa8Q
	W3BbTWOGeRaTWWNbNZUk+ut3wv5P70JEwcOO1YZbsvrCL/omVTIIoheUrKYXqfGmH28x8NRQ9mJQv
	I2JlMNpYfksY+FlwKLdrFkWA05F4Z9AY+UhY+w2suXMiZZRGWn5uKHdpdiCxAAaM5Xu1yOMK6h/mP
	2Ilz04nGhLl9uahADBKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMFVx-00000009PuI-2yQB;
	Tue, 03 Jun 2025 00:28:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDOA-000000099jo-03yb
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 22:12:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B90764A3DF;
	Mon,  2 Jun 2025 22:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A307C4CEEB;
	Mon,  2 Jun 2025 22:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748902333;
	bh=mnMBuXPc2ZQFw3argKuVRCHSdMH2r8EVc5rT2Tz2hRY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=reKmYbUXF9j28zyl2c7Q/9//n7V4xK/4Coo/W/hzAvJPrf0ORw0BQlsHauVn/0zyE
	 XwY5lmrm7vc644GWrKGnTLME2QBQh+JR3U+l35NKi0YL50UHgoSz1yuVdUnaZTqB3L
	 /b4UTQVNblan8RaLS4sTAg13GjH/8g8o85eKfNQpB8VABlkghAWSKCFXSLdZkyOLSk
	 032+0NfHSWUvvBQjvKTnuv5tePxMd3PvDYaNlQhEfrPWI7++yNrFjUiQXz571wLz24
	 W8yipZwo2JbbfA1y7fodKIN0w+st6jrAgRQ3WSFmBjup2WPdxqQvtidlJwLj2NWs5X
	 xd7PEQKPqVn8g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71209380AAD0;
	Mon,  2 Jun 2025 22:12:47 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv/kexec_file: Fix comment in purgatory relocator
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174890236599.925497.11306329780731063365.git-patchwork-notify@kernel.org>
Date: Mon, 02 Jun 2025 22:12:45 +0000
References: <20250326073450.57648-2-ziyao@disroot.org>
In-Reply-To: <20250326073450.57648-2-ziyao@disroot.org>
To: Yao Zi <ziyao@disroot.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 ajones@ventanamicro.com, sunying@isrc.iscas.ac.cn, arnd@arndb.de,
 kent.overstreet@linux.dev, lizhengyu3@huawei.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_151214_080251_1448C526 
X-CRM114-Status: UNSURE (   8.21  )
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed, 26 Mar 2025 07:34:51 +0000 you wrote:
> Apparently sec_base doesn't mean relocated symbol value, which seems a
> copy-pasting error in the comment. Assigned with the address of section
> indexed by sym->st_shndx, it should represent base address of the
> relevant section. Let's fix the comment to avoid possible confusion.
> 
> Fixes: 838b3e28488f ("RISC-V: Load purgatory in kexec_file")
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> 
> [...]

Here is the summary with links:
  - riscv/kexec_file: Fix comment in purgatory relocator
    https://git.kernel.org/riscv/c/0f6edcccfbd8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
