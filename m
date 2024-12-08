Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A029AE7717F
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Dec 2024 00:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8ofnqbaR8rnQG3aiwAJwsDcgB4e733uJAuSF2Frdlk=; b=V61GU4S6qkn7Ge
	vRtSf2zRc300u6DAmBxsT6NzuSObcOY5RAMgdiRoGCmQOldzOsxaJlblP2+Ds1E3y5E27tNKV6Z/p
	sj8mO1knC9l3smkyg5k/0xWbgcZTLz68ZcvWFncWXSqqL4NLoRjyIDQZwJtvfNxIh50+afLQiRNuH
	nTsGfdMdAgBAzsinPNTGbGU3Cjtc2j4durMdenVNCOz2ZYY1fqi7Tbvpb9rV1oYD6uy2CJyhi08Bx
	jUYC4HuJRPK2sGqcafIbQTZ/sgUt3b0V5d6pIH9IGvu4RGjitxU1+RM3az8b/uTqejznXaW16+8ne
	3ugmjlYnB+xlirMzbTAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tK5H8-00000004d3t-04yI;
	Sun, 08 Dec 2024 00:35:54 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tK5H5-00000004d30-08kd
	for linux-riscv@lists.infradead.org;
	Sun, 08 Dec 2024 00:35:52 +0000
Date: Sun, 8 Dec 2024 07:35:23 +0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733618146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hQSDHmZlOf90U5CrXTl/6j/p+tmRLqohyZBHy+85kAI=;
	b=qxMy/8+fV0epzUv08Xqt7R9FAmLkCHMdmkSBdYJBEPwvkzTO10RPbSkvNI0cwtzlHgvTDN
	xKg3jYS6zODxcabRdhbnJ3616JCdQ/YHA096g1BXPTVHj7HkcMldlPUCeQlQ9IFX4Lf0GV
	kkbkzaZw6TqkejCXcnuv5TxuoAitGAN9XeDkEkFWaqP8oI2PI4unCqnSXD32hTYIk0zD/C
	24eHY/iy/MARCHM7BHr8OH0EuHUrzw9eQDfMeI0w3mh11CHUB/b90sUzVC2CiUdj5kl+9C
	V8mEoMT/gZq+xMPr8xyjGZG9DVNMlPCLANYTKDUqoQvB+z+NGtx757GTtqkVPQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733618146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hQSDHmZlOf90U5CrXTl/6j/p+tmRLqohyZBHy+85kAI=;
	b=x51RJgprGTH765aqhrjAhtUv1MZ9IXa0GXdafEIMkY6SwEAKjHkjhWlvm8tFJKfB+xLqEE
	oI+UoIcTO/alzzCw==
From: Nam Cao <namcao@linutronix.de>
To: guoren@kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, bjorn@rivosinc.com,
	conor@kernel.org, leobras@redhat.com, peterz@infradead.org,
	parri.andrea@gmail.com, will@kernel.org, longman@redhat.com,
	boqun.feng@gmail.com, arnd@arndb.de, alexghiti@rivosinc.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [RESEND PATCH] riscv: Fixup boot failure when
 CONFIG_DEBUG_RT_MUTEXES=y
Message-ID: <20241208003523.4zAbPMzd@linutronix.de>
References: <20241130153310.3349484-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241130153310.3349484-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_163551_277131_EE188EE7 
X-CRM114-Status: GOOD (  10.28  )
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

On Sat, Nov 30, 2024 at 10:33:10AM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> When CONFIG_DEBUG_RT_MUTEXES=y, mutex_lock->rt_mutex_try_acquire
> would change from rt_mutex_cmpxchg_acquire to
> rt_mutex_slowtrylock():
> 	raw_spin_lock_irqsave(&lock->wait_lock, flags);
> 	ret = __rt_mutex_slowtrylock(lock);
> 	raw_spin_unlock_irqrestore(&lock->wait_lock, flags);
> 
> Because queued_spin_#ops to ticket_#ops is changed one by one by
> jump_label, raw_spin_lock/unlock would cause a deadlock during the
> changing.
> 
> That means in arch/riscv/kernel/jump_label.c:
> 1.
> arch_jump_label_transform_queue() ->
> mutex_lock(&text_mutex); +-> raw_spin_lock  -> queued_spin_lock
> 			 |-> raw_spin_unlock -> queued_spin_unlock
> patch_insn_write -> change the raw_spin_lock to ticket_lock
> mutex_unlock(&text_mutex);
> ...
> 
> 2. /* Dirty the lock value */
> arch_jump_label_transform_queue() ->
> mutex_lock(&text_mutex); +-> raw_spin_lock -> *ticket_lock*
>                          |-> raw_spin_unlock -> *queued_spin_unlock*
> 			  /* BUG: ticket_lock with queued_spin_unlock */
> patch_insn_write  ->  change the raw_spin_unlock to ticket_unlock
> mutex_unlock(&text_mutex);
> ...
> 
> 3. /* Dead lock */
> arch_jump_label_transform_queue() ->
> mutex_lock(&text_mutex); +-> raw_spin_lock -> ticket_lock /* deadlock! */
>                          |-> raw_spin_unlock -> ticket_unlock
> patch_insn_write -> change other raw_spin_#op -> ticket_#op
> mutex_unlock(&text_mutex);
> 
> So, the solution is to disable mutex usage of
> arch_jump_label_transform_queue() during early_boot_irqs_disabled, just
> like we have done for stop_machine.
> 
> Reported-by: Conor Dooley <conor@kernel.org>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Fixes: ab83647fadae ("riscv: Add qspinlock support")
> Link: https://lore.kernel.org/linux-riscv/CAJF2gTQwYTGinBmCSgVUoPv0_q4EPt_+WiyfUA1HViAKgUzxAg@mail.gmail.com/T/#mf488e6347817fca03bb93a7d34df33d8615b3775
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Alexandre Ghiti <alexghiti@rivosinc.com>

Tested-by: Nam Cao <namcao@linutronix.de>

Thanks for the fix,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
