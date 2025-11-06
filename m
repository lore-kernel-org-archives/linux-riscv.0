Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F235CCFA13
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Nov 2025 22:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U2Nhw7LYewvbmFLj6KnGJdb6QAMNpk6AtKYvtQGfjAk=; b=jtHEsNb6j5pz+N
	LPt/n1jhCEh+Dv3QCJtleJ6N47dFiw9dFhXjWI3ekHnCP6S7Rn0qk7hI3xZ7o1FFuiZiFI5NnAsZc
	bbBR1udCgc2No39pDEJ7CEu1iTpcbuRW0zSKAP0ermoomFrpOc2zHt8QZ+dKijU1Ci27Cpi9ac94F
	qbE12uPGtH+rF2lF/CGznPiGY2x7bGZvGJzUdYpLvZtcl8reatX2fHLlPq4OrtIaQrukKzFoxm4p8
	OY6byj1A1B2LtxQMTbDyvuYHtg+cPAeuWHpPoR99Q9uSLVgihcJmgiQSY76i+FiT1yaNcL89dap1y
	2ExPOGTpsJrH4/hNjTuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH8vF-0000000GL0o-45Qi;
	Thu, 06 Nov 2025 22:57:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH8vE-0000000GL0g-2i1c
	for linux-riscv@lists.infradead.org;
	Thu, 06 Nov 2025 22:57:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7831F601A4
	for <linux-riscv@lists.infradead.org>; Thu,  6 Nov 2025 22:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A93C113D0
	for <linux-riscv@lists.infradead.org>; Thu,  6 Nov 2025 22:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762469859;
	bh=L4PRd3NTZlrYBd98Qz1zoi0Mnrs7BL/CL+7bVRK7fWc=;
	h=Date:From:To:Subject:In-Reply-To:References:From;
	b=WsyMtY7V3Uazy3CB6dCq2Dvq7h0EPpReXdAajp1maxl8vAcFw1ZRwafN+xBnySM87
	 7pYI0Vfh1DPinMMG9jR3oRIQUYBlh0D6Qs/OXykWjWduVoJ0R7wLAiHsyi2v3Bryym
	 xLVMGFk4/wg5KwTaa5WGumruCJyS7uqWjL3BE/S3Mc288pmeqErBU6rAoAVr3pe34M
	 KUyBk42yuwz8IDYgLndIf43R8vBmWq7bwIjYTIT9+dxIcVOynlf1HjLY6IMO2A2AGx
	 A0PPo9g4n31u5daHJwKiCKsjlfWYBrBBUPaGXnm0po+B62mVu5DAEUpgyOby5plnEM
	 60GqJR457kO7g==
Date: Thu, 6 Nov 2025 15:57:35 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: linux-riscv@lists.infradead.org
Subject: Re: [GIT PULL] RISC-V fixes for v6.18-rc5
In-Reply-To: <43d7b921-8102-0a80-c9bc-3ee1899cfe59@kernel.org>
Message-ID: <428dcd47-777c-a47c-5a86-1d2e7c0ea725@kernel.org>
References: <43d7b921-8102-0a80-c9bc-3ee1899cfe59@kernel.org>
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

On Thu, 6 Nov 2025, Paul Walmsley wrote:

> The following changes since commit dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa:
> 
>   Linux 6.18-rc3 (2025-10-26 15:59:49 -0700)

For the archives: this was sent prematurely - the actual PR request is 
here:

    https://lore.kernel.org/linux-riscv/50a5b4a5-18ae-6dda-bdbd-db67e112bc1b@kernel.org/T/#u


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
