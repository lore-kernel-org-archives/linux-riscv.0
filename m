Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7121099B56
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Mar 2026 00:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VBYXZ1JP+Oy9UlBtvjNlrR0zVHMmWx4gQkXrH6x3Yn4=; b=S0Z2KDoL5aRLT8
	GDDQmx2gEA6RSYjqBFvx3DJVufBpX+f9JTP+BrW/FLRjbOs9eLykYiQzJ6b10z+Xwl/nD5bzLdBHy
	cWHsTK77V69M7rm/Jziuep49eg1r0WlBo1ql7jxZGJikG374jD+Ntu0k0liu15txKC05zsNJTmdL4
	cSC5i/dGWcXZXyQHcwMgcAqBg8wZArAqigdBBQ5XgENwKt/w6aAJ2fsAdYJzYkUs41KvTV2FGuqX1
	f9Us4O/Pik/31J9fVvm/50aJLPB1VDWxsT54Nvd4aF/G2yQLjJKZVvNvmYIrojqtPWWNDK/SAcYuz
	bP6HsKRCI7hMb04HaawQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3kaZ-0000000Dqjb-41Lq;
	Sat, 21 Mar 2026 00:53:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3kaY-0000000DqjV-3g1l
	for linux-riscv@lists.infradead.org;
	Sat, 21 Mar 2026 00:53:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E97FD60126;
	Sat, 21 Mar 2026 00:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DD81C4CEF7;
	Sat, 21 Mar 2026 00:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774054393;
	bh=wljedl7NPNOFHFaJgkzavMegTDnNmk/QehJ0RtoHe/A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Z8BBy+AorNRqOunF1aXWuTn2/QbY3cSnips50vfX5Pevj7rpoYZj3tfnqmH2WDT2D
	 xFEMTPd7bIiAPOkur6svMhEYSHMgKSVMCu/580VXFJnx2UmkBm//Z0Env6CNH9aRZu
	 Rbit92Z7T3o2trfadOL5qhNjPrsfp99NuE8+dsemoht+efxu3F+eMYqXfLQaXq8A0a
	 RLWHzRxIoU2QfI5/eQPN1XJBbofOcMO+Zk14sQRZOa75ChqZijbJpS+BQ/mwM6zFfe
	 MsWJ8lBbXQTgC2gq05jSWA2K5YuHpRm1v72+hnlGymy7EyMPGgt7CZU4JzJ5phYEC7
	 YMgZzPblqLX9w==
Date: Fri, 20 Mar 2026 18:53:11 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, 
    Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
    Deepak Gupta <debug@rivosinc.com>, linux-kselftest@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] selftests: riscv: Add definition of BIT() macro
In-Reply-To: <20260309-fix_selftests-v2-1-9d5a553a531e@gmail.com>
Message-ID: <a22c784e-73db-ce16-fc45-222ccef0aa6f@kernel.org>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com> <20260309-fix_selftests-v2-1-9d5a553a531e@gmail.com>
MIME-Version: 1.0
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

On Mon, 9 Mar 2026, Charlie Jenkins via B4 Relay wrote:

> From: Charlie Jenkins <thecharlesjenkins@gmail.com>
> 
> The BIT() macros is used by the validate_v_ptrace() test case, but not
> defined. Include linux/bits.h to pull in this definition. To ensure that
> the header in the kernel source is used, add tools/include to the header
> search path.
> 
> Fixes: 30eb191c895b ("selftests: riscv: verify ptrace rejects invalid vector csr inputs")
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

Thanks, queued for v7.0-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
