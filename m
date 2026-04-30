Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC24DCD13DA
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 20:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R8gKeBMmwc+5+Ba0aNlMPvXyiW8mY0wdtmWPLGNXAtM=; b=YWcosejhp/sUU1
	KMFMQVAJPBPGFEL9yVeCGPWZP0/yp7dv1dV/oHcE7ApRyKKNAyyBWllQ08ONqzuZenUL+OHwXt5mT
	88zjvcZ2Q/Pd5+K36hgaf6vmYkM5W8AC8BOEFsaZwFcr9/KpQ1jUAv3LOy9oqgwHeAGNeRb7gSsne
	E+XYfZ98ARMPkGHGMwSIW0gqH6sQx3vrGvNGiMQWUbe1++ZRdQJSxeQwbW4G7OggbLx6f51jp5b2s
	SfQq54lcT+JVyTdeco/oMHRiVSDmy+xD90gDDTmI7f9xIUWE3bVAH9xFvDuseprkyvpSHFVZxgNZt
	/Tcl5BVDbq36ulaQLHhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIXcb-00000005tbY-2ptO;
	Thu, 30 Apr 2026 20:04:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIXcZ-00000005tbD-2mZJ
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 20:04:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C37A8402DF;
	Thu, 30 Apr 2026 20:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4527C2BCB4;
	Thu, 30 Apr 2026 20:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777579464;
	bh=bjg0jLvJ21ZMtw5VtGEoNnjlwyplDrWkboAuQnSfgWU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uRKHo4x8xDxpQ3hiI9p4PUB/9C6mfRJc8R9kcLrmof++B3BchnuBfB4aGK2TGKm1f
	 UnnZY7+mnQmIrbQYQw8uMNpihc2BvdADyRMRgmvejlwAItgz/SoprR3YkAnVZ/XArt
	 dqopdqK5SiErts2wdoQAtNAfmDIkKojjKl1fJ8WQXb3oRipHj1gZ/r90kT1cz9qUub
	 mpk6Y8YAb9f5ybEuUJK0k4uO/5m8Eudj9g1G8UxAXhb5HL0Q9lOLweIKUpAtdcT7Xx
	 CRli+5PIHWfy13qJgFpJfmIMfRQGZsR8FsRsD1mbhYPjJYagjb69rp/wGO6LEk5i3e
	 TRowJab+IOT+g==
Date: Thu, 30 Apr 2026 14:04:20 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Zishun Yi <vulab@iscas.ac.cn>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Kees Cook <kees@kernel.org>, Will Pierce <wgpierce17@gmail.com>, 
    Maxim Kochetkov <fido_max@inbox.ru>, 
    Samuel Holland <samuel.holland@sifive.com>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Markus.Elfring@web.de, patchwork@lists.ozlabs.org
Subject: Re: [PATCH] riscv: Check the return value of reloc handlers
In-Reply-To: <20260321113419.34437-1-vulab@iscas.ac.cn>
Message-ID: <6c1715e6-2bb9-40fd-dfb2-791468522614@kernel.org>
References: <20260321113419.34437-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_130427_731167_6B0B796E 
X-CRM114-Status: GOOD (  12.78  )
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

Hello Zishun Yi (and, apparently, Wentao Liang), 

On Sat, 21 Mar 2026, Zishun Yi wrote:

> Currently, process_accumulated_relocations() ignores the return values
> from both reloc_handler() and accumulate_handler().
> 
> As a result, the kernel will proceed to load the module with corrupted
> or incomplete sections, which can lead to unpredictable behavior or
> kernel panics.
> 
> So we need to check the return values of the handlers to propagate the
> error, and fall back to the cleanup mode.
> 
> Fixes: 8fd6c5142395 ("riscv: Add remaining module relocations")
> Signed-off-by: Zishun Yi <vulab@iscas.ac.cn>

Thank you for sending this and several other fixes.  I would like to 
accept the RISC-V-oriented fixes, but have a few questions first -- 
similar to the ones that Markus already asked you several weeks ago.

First: were these fixes found and/or generated by LLM tools?  They appear 
to be.  If so, please add an Assisted-by: tag, according to the directions 
documented here:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n637 

and here:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-assistants.rst


Second: is it possible for you both to get your own unique E-mail 
accounts?  Many kernel developers and tools assume that a specific E-mail 
address will be used by only one person.  For example, Patchwork is now 
incorrectly attributing patches originally sent by Zishun Yi to Wentao 
Liang, under the not-unreasonable assumption that each developer will have 
their own E-mail address.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
