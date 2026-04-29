Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9C7FF8875
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 13:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwcK+I5/3jnnxzXm1vjqnvBA6cGdg0YsWHiNsLP3Aeo=; b=DGfYuM5dOAfrgIHJ9lKUXmXQlU
	PUVxaRKlZmXQuQPwtJxAXS8sV35kAU+i92yAUMlDvPBOkP0Uweg1inTpjrx3y7V+EPXafjsuCCMhh
	ewdcwuT30p+5lp7FciQKI7ed7YMuzRtzQXsw+RL/0QjP/fLFiyAxoVPBZkEEjxYo1C4FN+gvGdTo9
	6V4L3BmI0t3sa6rXb6Ai2PEREWjBFRKlOYvi5ozYg1Fgdns6Uh0ow/ZpSH3ombgdlGy2vz2MnxDS2
	1WSfVOnZM1plIMJF1GmyzWGz0soFGbhJUKD+XQz+ghJPW5MuDNqfzMOnYWjGYGgdUpvP6moDJ5oE2
	er8iBShw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4jQ-00000003e7d-2TgU;
	Wed, 29 Apr 2026 13:13:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4jM-00000003e6S-2NWg
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 13:13:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DBC8460154;
	Wed, 29 Apr 2026 13:13:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF25C2BCC4;
	Wed, 29 Apr 2026 13:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777468411;
	bh=1QiXFlK+cpUi4hqcr+prvsYsDeRL2Jw9GFYpMpl0ggs=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=iHAHa6NjReXFG7NYULW0GLGfg/1Z1d/JajpuAtIsfL3XUVSDU2dGiQCCIparxFIMG
	 VWpiMpGFfiKaIPc8KhriGvfUdvZSi3g52M+3gELC5YbnE71FQxBEd3ABOTZt9JbR2A
	 z4EILQhNIzInTG1oewkDNYD93I+sWre7PjYXpOX5CkegHsqAMqQ1KpqfLZi7iWXkSq
	 XuN2T7WO63tWsdXfdv35XddrKnfs7uqgTemu1KhUYl2NJuVMRx5319hvYE6QLNUA+k
	 JYsjyDJ0+MicjPzMxExnKYKfdCfAMo6/XDS8qX/H9I8cSCAJ3BD/YTt1es0jElqWVJ
	 9NCdvPPUH9/Sw==
Content-Type: multipart/mixed; boundary="===============5654916101703750974=="
MIME-Version: 1.0
Message-Id: <c02284fa950e2f658cc297e94abac1154c7c22b242cd9cb8fd1096fedf27624c@mail.kernel.org>
In-Reply-To: <20260429123513.3477780-3-visitorckw@gmail.com>
References: <20260429123513.3477780-3-visitorckw@gmail.com>
Subject: Re: [PATCH bpf-next 2/3] riscv, bpf: Fix support for BPF_MOVSX in RV32 JIT
From: bot+bpf-ci@kernel.org
To: visitorckw@gmail.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,eddyz87@gmail.com,memxor@gmail.com,luke.r.nels@gmail.com,xi.wang@gmail.com,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu
Cc: martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,alex@ghiti.fr,jserv@ccns.ncku.edu.tw,eleanor15x@gmail.com,marscheng@google.com,bpf@vger.kernel.org,linux-riscv@lists.infradead.org,linux-kernel@vger.kernel.org,visitorckw@gmail.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Wed, 29 Apr 2026 13:13:31 +0000 (UTC)
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5654916101703750974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> riscv, bpf: Fix support for BPF_MOVSX in RV32 JIT

The subject indicates this is a fix, but there's no Fixes: tag in the
commit message. Should this include:

Fixes: 8100928c8814 ("bpf: Support new sign-extension mov insns")

The RV32 BPF JIT never implemented support for BPF_MOVSX instructions,
which were added to the BPF instruction set in commit 8100928c8814.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/25109627626
--===============5654916101703750974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5654916101703750974==--

