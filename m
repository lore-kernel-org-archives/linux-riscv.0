Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0670BC61DA4
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 00:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DlpXmUpcQaktzVBKed9gqnabRIqmr9dteGx181Jl9Dk=; b=hoJDr7AxSKtUQx
	Guie6u0TISh76AwN5tQ7yKWHN0v8uqQHvMZPH9gcjfjWv7lFBoqOewkxxIqkwpETE87S0LhFWhCGO
	ggqQ6hp4rCbNQQgUAUSQdI5iPkhf0vgcDTHKr9ZQDtO+OlvQZoy2tKLoiwy8ALbMnZxrU+FO4L1Ls
	aKqf5oetkepAqMh/kNBzJ+an1Sur9rkWqYSPuwL6fW+HJODmD7uM/3z8T3j+B1XELm8EN2+C3F6pW
	IUw4tdk4eKxrpcnjgg3Z0H9G+UbXOTT2bjiakS91We87Qy8rAYzqk75Ap6K2mWJWvlWzaMhZUE1zw
	X745Z8RZn//uDcQz/IpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZLVz-00FeYn-7G; Tue, 07 Mar 2023 00:49:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZLVm-00FeUX-8L
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 00:49:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3ADD0611A0;
	Tue,  7 Mar 2023 00:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B8C7C4339C;
	Tue,  7 Mar 2023 00:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678150138;
	bh=DTBF08PUaWnq+/WZrF7wRg3Gw3DZpD56+OYHF2OwmDU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Y07kUCp2hLM8zvBJFe4OvNqBFVagn6t9EukGAZvud6hbysxiSK4EOkMznK70nfH6L
	 0imkuDlS3T+d34hzLqbRZHIqG48prR0uSiuR8sk95nSw5j14kWp30nd+iKo/L7m4Y3
	 TD2QvOLBkbWcdPrhdOGToM9C+mGKvKDdobAgTQX4PisWjy0VPKMhuTlOVOV2WWTVtz
	 9KDQWWlTfudUG2qUssDCMv0Zbx1KgMv3OtQ3G9yUfKBFNpmeraaIPsM6eVmIogglql
	 044cOWU0nhh4ZWyQZWXbdSxkyRS2QK0x5TwK3hVBxo0dx93tMoKEtPYNonTSWx9Znv
	 xLzrI36/6Bj3g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 63BDEE68C3A;
	Tue,  7 Mar 2023 00:48:58 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 01/10] alpha: fix livelock in uaccess
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167815013840.19612.4686188583677266510.git-patchwork-notify@kernel.org>
Date: Tue, 07 Mar 2023 00:48:58 +0000
References: <Y9l0EDRr9DpNb5Pb@ZenIV>
In-Reply-To: <Y9l0EDRr9DpNb5Pb@ZenIV>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 monstr@monstr.eu, dinguyen@kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 torvalds@linux-foundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_164902_492057_BA0637E4 
X-CRM114-Status: GOOD (  10.54  )
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
by Al Viro <viro@zeniv.linux.org.uk>:

On Tue, 31 Jan 2023 20:03:28 +0000 you wrote:
> alpha equivalent of 26178ec11ef3 "x86: mm: consolidate VM_FAULT_RETRY handling"
> If e.g. get_user() triggers a page fault and a fatal signal is caught, we might
> end up with handle_mm_fault() returning VM_FAULT_RETRY and not doing anything
> to page tables.  In such case we must *not* return to the faulting insn -
> that would repeat the entire thing without making any progress; what we need
> instead is to treat that as failed (user) memory access.
> 
> [...]

Here is the summary with links:
  - [01/10] alpha: fix livelock in uaccess
    (no matching commit)
  - [02/10] hexagon: fix livelock in uaccess
    (no matching commit)
  - [03/10] ia64: fix livelock in uaccess
    (no matching commit)
  - [04/10] m68k: fix livelock in uaccess
    (no matching commit)
  - [05/10] microblaze: fix livelock in uaccess
    (no matching commit)
  - [06/10] nios2: fix livelock in uaccess
    (no matching commit)
  - [07/10] openrisc: fix livelock in uaccess
    (no matching commit)
  - [08/10] parisc: fix livelock in uaccess
    (no matching commit)
  - [09/10] riscv: fix livelock in uaccess
    https://git.kernel.org/riscv/c/d835eb3a57de
  - [10/10] sparc: fix livelock in uaccess
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
