Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C67CD0424
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 23:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RWOP/lkBze0SsA5eqhi9r1JjtnFytfvXn47FzVCNk+g=; b=wG+yDibaqJFzC1
	50+yUqDR8hGP6sAUjnWb3bBN/0Mk5nnT2xEbVRhucByiXfcOYJNFscHxBPxgc45wdn1vA++1qhyAa
	/dlzsBdORIuENg9kreG9Oa6hFfH+51ir49JgCFK7Yf+oYVZ5G4ocsnQhb+sHcyp5rbPi1bdkogvK/
	XJnHWVWJRAVQWF2dAQ0hSnmhnjfMuA7cu8CifGNcOIC9oanL+fC755M2tIgFqcPgb3s8GMmLBfnU7
	7xmigkVoZWcRkEYkPba3d0DcIThzIHO9tt8668EzIYtGPbL85JlS7HVcKzQRYuG1rrPIlBFq2ERpk
	q+0/5gqj40VGXwLoecBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctpK-0000000CEKC-1QGF;
	Mon, 05 Jan 2026 23:17:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctpI-0000000CEJh-1nSF
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 23:17:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 69AA86011E;
	Mon,  5 Jan 2026 23:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52937C116D0;
	Mon,  5 Jan 2026 23:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767655047;
	bh=39FKH8D38UVbpuLTkAYB13o8AfvF/nw55c78cDCsOgY=;
	h=Date:From:To:List-Id:cc:Subject:In-Reply-To:References:From;
	b=iKIlzu/T30KzA8IGSHVJG68kdqFKadJ3cdLrJ7XWntv7cI+0FFOG01K3yKbJ15Y76
	 O2chYOImsfUyxMDYZr9A67frEP1zoYvqRNaGHiNXQ5iF/eNeuIFCgWTFwNty8jVV3P
	 OdkWutvDS/nDttpW/193ntNECYIHxdcBfz3nUJJOFZw2Rof/8qD9iivZgRWKx0qL2E
	 /0l+M1DE1EkJehvQ1H/6oqfv/Y2MUCc2tmsdEoR4UdRwZ052T4CMbGv3scb8s3lnLR
	 eEMXQKGntp8as63BG8P3mRmLFaZe/EaSA89vRzQAEUJ3DGXQGbrDt4oEbCSqo9CR7i
	 ZeJbfkdq7ISOg==
Date: Mon, 5 Jan 2026 16:17:22 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Lukas Gerlach <lukas.gerlach@cispa.de>
cc: patchwork-bot+linux-riscv@kernel.org, linux-riscv@lists.infradead.org, 
    palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    linux-kernel@vger.kernel.org, daniel.weber@cispa.de, 
    michael.schwarz@cispa.de, marton.bognar@kuleuven.be, 
    jo.vanbulck@kuleuven.be
Subject: Re: [PATCH 0/2] riscv: Add Spectre v1 mitigations
In-Reply-To: <176715189629.3416240.5165553541798344765.git-patchwork-notify@kernel.org>
Message-ID: <6f196be2-3d56-75f5-78d8-800138a8ba46@kernel.org>
References: <20251218191332.35849-1-lukas.gerlach@cispa.de> <176715189629.3416240.5165553541798344765.git-patchwork-notify@kernel.org>
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

On Wed, 31 Dec 2025, patchwork-bot+linux-riscv@kernel.org wrote:

> This series was applied to riscv/linux.git (fixes)
> by Paul Walmsley <pjw@kernel.org>:
> 
> On Thu, 18 Dec 2025 20:13:30 +0100 you wrote:
> > This series adds Spectre v1 to RISC-V in line with x86 and arm64.
.
> > [...]
> 
> Here is the summary with links:
>   - [1/2] riscv: Use pointer masking to limit uaccess speculation
>     (no matching commit)
>   - [2/2] riscv: Sanitize syscall table indexing under speculation
>     https://git.kernel.org/riscv/c/25fd7ee7bf58

Just to be clear, I only picked up the syscall table indexing patch, not 
the address masking patch.  Am still waiting for an update for that one.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
