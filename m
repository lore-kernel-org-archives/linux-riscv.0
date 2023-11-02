Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8659CC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 15:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4sHo0xqlpIYVcI/q0jyYtfliyTYOCAT8JTZl8231dQ=; b=r9Yv7cJSc3Avgy
	LH3ChxUjkSnsL2ftq0RxsISTYBWTzxoyJUd8FqPcVqUkgSL4noQVFkbQUWdYlwWXaW6iB1/05mWXK
	kMJDDYMdtt4Z5DNAn3y1QyN5LnkBS3ZxXfvtAccCSrxa9VH77+2Mll3cELZOkJM6QDY8Jm7JtnKqe
	BmX/N3Bx8bxdx4he6NOZ0EHNbLTWpo0KpaSlXWYT9FhFtZlAPMF0n7sQ7Y4b487eyr8UivxsPoZaY
	Z1jSMJQQVH79bGS8Z+KrWmUc7MLv3AgoU3UqAlsYiNOMBoDqlUOOpNQdbFZgRXzI84WcRPWeClDgG
	eUCOx0/dsI13u2hIj+rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qya3M-009oU4-2L;
	Thu, 02 Nov 2023 15:56:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qya3H-009oTg-15
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 15:56:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F39C61490;
	Thu,  2 Nov 2023 15:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE72C433C7;
	Thu,  2 Nov 2023 15:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1698940570;
	bh=Mg3ASjH3LGIBymJxkih3/f/vhHtATnZRAp+P/YEAyuM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aT18hCEfRPJkqEubpGGoqZBA0L44HkaPk+EYf1O9ZO31iBAnfyGAC+wcSay8CksJL
	 9MyKdqpQ7/CEWiYvKpn61FBO1A972EF1iq22aVe9CszshMST8QB3PnRCFEY4ECD0Hr
	 aYwDixHAGFHbuCB8q2mB5hHN54ocKaTkWeDjKYmk=
Date: Thu, 2 Nov 2023 08:56:09 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Deepak Gupta <debug@rivosinc.com>
Cc: woodrow.shen@sifive.com, Andrew Jones <ajones@ventanamicro.com>, Palmer
 Dabbelt <palmer@rivosinc.com>, Jan Kiszka <jan.kiszka@siemens.com>, Kieran
 Bingham <kbingham@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Glenn Washburn <development@efficientek.com>, Jeff Xie
 <xiehuan09@gmail.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6] scripts/gdb: add lx_current support for riscv
Message-Id: <20231102085609.39a22424bba9a75a1523e23b@linux-foundation.org>
In-Reply-To: <ZUPEDWofcqgzsgMS@debug.ba.rivosinc.com>
References: <20231026233837.612405-1-debug@rivosinc.com>
	<ZUPEDWofcqgzsgMS@debug.ba.rivosinc.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_085611_447519_2BC29685 
X-CRM114-Status: GOOD (  10.89  )
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

On Thu, 2 Nov 2023 08:45:17 -0700 Deepak Gupta <debug@rivosinc.com> wrote:

> Ping
> 
> + CC: akpm@linux-foundation.org
> 
> Who should I ping to make sure that it lands up in mainline?
> It's quite a trivial change to support lx_current riscv arch.

I moved it from mm.git's mm-nonmm-unstable branch into the
mm-nonmm-stable branch earlier this week.  mm-nonmm-stable is what I'll
be sending to Linus later this merge window.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
