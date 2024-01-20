Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B96C47DAF
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 22:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Egt1dwJeIZBo677mF5dLJs8Q+5SKTdBPj+lANzKz5BA=; b=wiomEfIcPnf+Ig
	9BC4f5cB0cbyEVHQH6NBDg31z3OS4MqO0etmF4ssLNdDf4CM07oH5QcKWbIrahIBJ1+T/DRs9NZw9
	6opfMZGPr+wR3d4G9TJCO/iphmvV4OnnlxkOsQ9/8nT4/2CPeFz8HhJWNQYYHuOwEHKQUPy8ERUFB
	tpk6IrPAMkL/Fb4JBO+0eu++tKyMDpzDZ/77j556raAAY/jT2G33F9iyLVsZeANN6qKzKCpJjG9wz
	hoaK6HsgDbdy02aT8ky7Ha7GyrN67w1x0jcmK+3uAzT6RQfCaHc+7k9ifNTdNeBJGOQ1wEv1Vdy42
	noZyAksdAA0I0OG/h3Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRJds-008VIM-2F;
	Sat, 20 Jan 2024 22:16:44 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbC-008O9S-1j
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 21:09:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 37866CE129E;
	Sat, 20 Jan 2024 21:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63B9FC43394;
	Sat, 20 Jan 2024 21:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705784988;
	bh=8sTuArZkVA6RQ53aU6HlMpab2aJNO93qdpnOX/Gbyqs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PdR3wK8eeIMSZYL7Zhl83ZKlrsw55Xy/0WLJjEmZq5LFTnylTmW20pYZiBrtIju/P
	 7cGCO67Mvi+9XshA2sYSFsJYt3FmiNfAm49iP+JCmbZTBWx6W5OEJa39lK7kCqIU+R
	 bweUpLiqskMoXVOsNMmK55IB5TvrIN/CyV6xCYvNN5FIQq1kQ7TMX5h3xCPZ3V8hkh
	 nHw1ndtZvFs2Ja7P125E1Ry+BqY9nRujrMOruUl8F8Y1DlBsjT/SMExMMjBeVTmjdQ
	 PtPnZVNAQymQssc6JnmcV7SO7eDhu+CcPqBVJSW0WKEapZGIwNGXFiMvaG1iOGTugn
	 /EJTHbjn8AVmw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4FEC6D8C96C;
	Sat, 20 Jan 2024 21:09:48 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [v11, 00/10] riscv: support kernel-mode Vector
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170578498832.24348.17748368770465709579.git-patchwork-notify@kernel.org>
Date: Sat, 20 Jan 2024 21:09:48 +0000
References: <20240115055929.4736-1-andy.chiu@sifive.com>
In-Reply-To: <20240115055929.4736-1-andy.chiu@sifive.com>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 bjorn@kernel.org, charlie@rivosinc.com, ardb@kernel.org, arnd@arndb.de,
 peterz@infradead.org, tglx@linutronix.de, ebiggers@kernel.org,
 aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_130954_774154_8E60F8E0 
X-CRM114-Status: GOOD (  11.02  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 15 Jan 2024 05:59:19 +0000 you wrote:
> This series provides support running Vector in kernel mode.
> Additionally, kernel-mode Vector can be configured to run without
> turnning off preemption on a CONFIG_PREEMPT kernel. Along with the
> suport, we add Vector optimized copy_{to,from}_user. And provide a
> simple threshold to decide when to run the vectorized functions.
> 
> We decided to drop vectorized memcpy/memset/memmove for the moment due
> to the concern of memory side-effect in kernel_vector_begin(). The
> detailed description can be found at v9[0]
> 
> [...]

Here is the summary with links:
  - [v11,01/10] riscv: Add support for kernel mode vector
    https://git.kernel.org/riscv/c/ecd2ada8a5e0
  - [v11,02/10] riscv: vector: make Vector always available for softirq context
    https://git.kernel.org/riscv/c/956895b9d8f7
  - [v11,03/10] riscv: Add vector extension XOR implementation
    https://git.kernel.org/riscv/c/c5674d00cacd
  - [v11,04/10] riscv: sched: defer restoring Vector context for user
    https://git.kernel.org/riscv/c/7df56cbc27e4
  - [v11,05/10] riscv: lib: vectorize copy_to_user/copy_from_user
    https://git.kernel.org/riscv/c/c2a658d41924
  - [v11,06/10] riscv: fpu: drop SR_SD bit checking
    https://git.kernel.org/riscv/c/a93fdaf18312
  - [v11,07/10] riscv: vector: do not pass task_struct into riscv_v_vstate_{save,restore}()
    https://git.kernel.org/riscv/c/d6c78f1ca3e8
  - [v11,08/10] riscv: vector: use a mask to write vstate_ctrl
    https://git.kernel.org/riscv/c/5b6048f2ff71
  - [v11,09/10] riscv: vector: use kmem_cache to manage vector context
    https://git.kernel.org/riscv/c/bd446f5df5af
  - [v11,10/10] riscv: vector: allow kernel-mode Vector with preemption
    https://git.kernel.org/riscv/c/2080ff949307

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
