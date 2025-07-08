Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3930C83F0F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 10:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QVWkp0vq9sbTuPyAdNL5GS6562HkFvxFafqhzD+557c=; b=4WZT2dUS3tpfZG
	bc6Z5J4fgDdl625GsMJjdQpfk5F7y7uIHeH4NufwbbUk3D5utnyE4ddknmMSmuD14fnrlLEvbaPsg
	3ZRDi6dojKOU5rP2GjprDi2wkOlpF+r6HS8aOHgosTCPHPEcEJGqamtR+V54oY6iLtDCYEPIScEgM
	gmr4rppzKGXu0wr/cl9yT8jyk+1KsCtzJdTtt/BkidP+AXF37Ifaa8+GYheN5g5jn+flMLA2mStJg
	F7GDYEVHeWQ357OkO/r2qoufUfXwrB5djoz5ql+5dBWGi3CStqAGoDM6Fh7ue1gurqZ1n8VvWA665
	puabPZuqBnGJJK284P4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5lm-000000055o1-1API;
	Tue, 08 Jul 2025 10:41:50 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5W8-000000053rT-2r45
	for linux-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 10:25:42 +0000
Date: Tue, 8 Jul 2025 12:25:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751970338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mrZZuWaHaXVZ4tU14vD0jFwEhA7UyuVBekyaX6/jSvQ=;
	b=arZRCAeWw4M0tWg+Jv2ndJMHzY8loL+3L+xj7PSSU9OdKuA6ViYhAw/7UlQAs+TH2mOWwZ
	fUCMdcrQkSKXtCY5zMIL+gadeIxglMe7LfXqm9GN+gSRvJGqjIS0PBETAGMRVMghQbBiaB
	uZLxR3cOAngVQbQY0Lf+cL0EBnL5qcZeiI8mj6tSBzkhPMgZVZz0+2O0sl1WbzCNoWOlE0
	A1ZOPrxO1Nna+DAbKMw0OdV+I8sZANeetQqIJokP/DlJlrw0mlyLDQuQk8d4BjQ8Kej3Ee
	gK0BsdO/FSWo5hjqmxunZvuCQnmIVLdVsZR69JG28BsONGkEobGnQu0Lqelm1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751970338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mrZZuWaHaXVZ4tU14vD0jFwEhA7UyuVBekyaX6/jSvQ=;
	b=qU4A+HRMxnXbegaEoeOrkeKk7TR725nLMk8ItxqFSKNkBPROlWCShUsoKrjWvD64mui6Se
	EJwnKQR3YnQdZKCA==
From: Nam Cao <namcao@linutronix.de>
To: patchwork-bot+linux-riscv@kernel.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/11] riscv: kprobes: Clean up instruction simulation
Message-ID: <20250708102537.VovauOQC@linutronix.de>
References: <cover.1747215274.git.namcao@linutronix.de>
 <174904758698.2309006.9940004806769596353.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <174904758698.2309006.9940004806769596353.git-patchwork-notify@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_032540_858295_02E593BE 
X-CRM114-Status: GOOD (  13.87  )
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

On Wed, Jun 04, 2025 at 02:33:06PM +0000, patchwork-bot+linux-riscv@kernel.org wrote:
> Hello:
> 
> This series was applied to riscv/linux.git (for-next)
> by Alexandre Ghiti <alexghiti@rivosinc.com>:
> 
> On Wed, 14 May 2025 11:38:39 +0200 you wrote:
> > Hi,
> > 
> > There is some instruction-processing code in kprobes simulate code. These
> > code should be insn.h. In fact, most of them is duplicating insn.h.
> > 
> > This series remove the duplicated bits and make use of macros already
> > defined in insn.h. The non-duplicated bits are moved into insn.h.
> > 
> > [...]
> 
> Here is the summary with links:
>   - [v2,01/11] riscv: kprobes: Move branch_rs2_idx to insn.h
>     https://git.kernel.org/riscv/c/d29656bab74c
>   - [v2,02/11] riscv: kprobes: Move branch_funct3 to insn.h
>     https://git.kernel.org/riscv/c/da6de46c2eed
>   - [v2,03/11] riscv: kprobes: Remove duplication of RV_EXTRACT_JTYPE_IMM
>     https://git.kernel.org/riscv/c/6d47d903b18f
>   - [v2,04/11] riscv: kprobes: Remove duplication of RV_EXTRACT_RS1_REG
>     https://git.kernel.org/riscv/c/5cefc323f32a
>   - [v2,05/11] riscv: kprobes: Remove duplication of RV_EXTRACT_BTYPE_IMM
>     https://git.kernel.org/riscv/c/a285674909ae
>   - [v2,06/11] riscv: kproves: Remove duplication of RVC_EXTRACT_JTYPE_IMM
>     https://git.kernel.org/riscv/c/c7196c136e29
>   - [v2,07/11] riscv: kprobes: Remove duplication of RVC_EXTRACT_C2_RS1_REG
>     https://git.kernel.org/riscv/c/768007ca3fe8
>   - [v2,08/11] riscv: kprobes: Remove duplication of RVC_EXTRACT_BTYPE_IMM
>     https://git.kernel.org/riscv/c/f2c715fff676
>   - [v2,09/11] riscv: kprobes: Remove duplication of RV_EXTRACT_RD_REG
>     https://git.kernel.org/riscv/c/284ca2a100de
>   - [v2,10/11] riscv: kprobes: Remove duplication of RV_EXTRACT_UTYPE_IMM
>     https://git.kernel.org/riscv/c/a60c2933ec74
>   - [v2,11/11] riscv: kprobes: Remove duplication of RV_EXTRACT_ITYPE_IMM
>     https://git.kernel.org/riscv/c/ee4c45f5cbeb

This series was dropped from 6.16 due to conflict. Can it be re-applied? It
applies cleanly to riscv/for-next.

The same story for:
https://lore.kernel.org/linux-riscv/174904758974.2309006.8809303189389627595.git-patchwork-notify@kernel.org/

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
