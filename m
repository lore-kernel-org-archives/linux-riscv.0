Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F82C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 09:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vAmxjFvpE2zAdamgr5WN3DSNIOR93VHPZOvmw4JVyoQ=; b=R7LFuypScVJcPd
	l81fQBNe7ttpI25Sv7z4Ggdey/NODwb4oYVA1hD3iOc/cN48SGH/+7v0RB/PFsLyWvrk2ChOlAF+6
	LSv2Kmfmpej0sZcWPE5pKlF53iFmU/m67Fj4NiQk9hlGdEAGbShLwAbazayuWHUu1oAm+ZmgtBgZb
	/hIwUVnjAKG2+w8a/urdLItMIaoAM+uQ5E16mQcnnem/0tDEhVWEeADAkk+pvVVmYdVcTjWuy6yUr
	XvJE7/CDd9x8CnXDT+5QsBYt81sP4zzusOYlytdIBX6/I07tkToVM8Yf8naXgEFE+tVzJ+p27ft+z
	oPIdBxseDnEhonm+8+1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfE3A-000000045rV-1pVk;
	Thu, 02 Jul 2026 09:49:40 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfE37-000000045qy-20As
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 09:49:38 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782985775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kYwiwPZDNXRjYdVXG99p6rYoYeRKzgBMXbWC0gZC+A0=;
	b=Y+LDImkwgJjJsnYXOdIw0K1O89I4kBOB1UH5OOMgVnN0/5BcEVcoFRDhQL0I9zjk/v4qYo
	his/BNL+bFtOP+kddmYc3xz4fWgEAbw72wRXqIsxIBgFTX19Sx0sZwYuOyViwH1Qhr/BBm
	9s+lWGhVulCU8LP2ZkV+awdszp3OUmDGla1n2qA0Dc6egLHlnNY/RJl0tHvu0lMM0g9ciy
	7d3RjdfrezwlqUUG2aA42ROZbmZqfs89vFBG4MqLf4sja8jv5OgjNIAxQ14lOSonhhcCge
	6liyQiNvYUf0vN+hykhRJmU2YuLVFLnbVfUmHECTxlcKcXvhgyLc4yLhta1O1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782985775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kYwiwPZDNXRjYdVXG99p6rYoYeRKzgBMXbWC0gZC+A0=;
	b=KKwisRQIC4m6dzRC5atozHcxZ7AMOjJAmQGCNmoO7xsbf/Pj+6DArfCLYkaNDmeCiVXSnf
	P9bc6hVKDG+0ncBw==
To: Xiaofeng Yuan <xiaofengmian@163.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Charlie Jenkins <thecharlesjenkins@gmail.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 xiaofengmian@163.com
Subject: Re: [PATCH v6 1/2] riscv: probes: simulate c.jal instruction
In-Reply-To: <20260701081033.49871-2-xiaofengmian@163.com>
References: <20260701081033.49871-1-xiaofengmian@163.com>
 <20260701081033.49871-2-xiaofengmian@163.com>
Date: Thu, 02 Jul 2026 11:49:34 +0200
Message-ID: <878q7tu3f5.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_024937_660880_8E6A81F5 
X-CRM114-Status: UNSURE (   8.01  )
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

Xiaofeng Yuan <xiaofengmian@163.com> writes:

> The c.jal instruction is currently marked REJECTED in kprobes
> instruction decoding, but it should be SIMULATED like other
> compressed jump instructions.
>
> Add simulate_c_jal() which saves the return address to RA and
> sets the program counter to the target offset, reusing
> simulate_c_j for the common jump logic.
>
> Although c.jal is RV32-only, the function compiles unconditionally.
> On RV64, riscv_insn_is_c_jal() always returns 0, so the simulation
> code is never invoked and the small overhead in kernel size is
> acceptable.
>
> Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>

Reviewed-by: Nam Cao <namcao@linutronix.de>
Tested-by: Nam Cao <namcao@linutronix.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
