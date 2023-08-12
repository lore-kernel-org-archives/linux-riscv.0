Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D95C0015E
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Aug 2023 17:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=for+jiD5iim9znQm+irI3fiU3fVLTQArwWHTJHAdtio=; b=2Hl3UzDdzc8RtK
	pZRJ5Gdbl7EFn9kHkBnP2DJ8XDPnRn6OEV6qzaEaG6ZxhYk3AW7F7aQAsxgbBYslrtPPD9ukiEy/6
	YyVDPKQwpz6RytDEJebkNDw6joHft+zH5m/gjBYzZkM8kdMsAgZOvg2n8IkHcmhxmoX+hE3oaC5RW
	oC6gNIDd9xGWm7nb/idMn6cVsQAP6AQeY01pK0p1kS/Qy3ncGghBqyMTpsPn19cKY0w2Y1cokVSMM
	EQJofjX7T56xU/Akm9DEoXrc6G3OkvMIYVuXLjhMUyvdA04zi/9vKl6Wf1W+FnNcLw92MNtHyiF83
	+go36fgpP9CCoI1d+NQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUsA9-00DlBL-12;
	Sat, 12 Aug 2023 17:12:29 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUsA5-00DlAg-1T
	for linux-riscv@lists.infradead.org;
	Sat, 12 Aug 2023 17:12:27 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 9CD8592009D; Sat, 12 Aug 2023 19:12:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 9A1F992009C;
	Sat, 12 Aug 2023 18:12:18 +0100 (BST)
Date: Sat, 12 Aug 2023 18:12:18 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Palmer Dabbelt <palmer@rivosinc.com>
cc: linux-riscv@lists.infradead.org, andy.chiu@sifive.com
Subject: Re: [PATCH] RISC-V: Remove ptrace support for vectors
In-Reply-To: <20230810214810.21905-1-palmer@rivosinc.com>
Message-ID: <alpine.DEB.2.21.2308121810120.8596@angie.orcam.me.uk>
References: <20230810214810.21905-1-palmer@rivosinc.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_101225_673156_98E13DF9 
X-CRM114-Status: UNSURE (   8.38  )
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

On Thu, 10 Aug 2023, Palmer Dabbelt wrote:

> We've found two bugs here: NT_RISCV_VECTOR steps on NT_RISCV_CSR (which
> is only for embedded), and we don't have vlenb in the core dumps.  Given
> that we've have a pair of bugs croup up as part of the GDB review we've
> probably got other issues, so let's just cut this for 6.5 and get it
> right.

 It might be worth mentioning that vlenb isn't there in ptrace(2) either, 
but otherwise:

Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk>

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
