Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164C2C3ABC9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 08:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZBPjx8JxcPnB1IF+atgDdIQfhhbE5hza2IcjYfB/gmQ=; b=YgaXaIZpIJ4VLN
	ucYPKqbAUEGRifToik+6xaf2u5+mF/W/UdgNxzzpbaErP9mSwMl0UwYgppOT3SBCYARhFnHXr36aJ
	dSkaUforlX23O8bObpk8Y8F/8YUe90RnRbSRq3fpTSpkvk1R7rxCan6BOG38ZZofI4AbHLsC2W2Sx
	ykjKYczsshDxQJGQwpCcC07BjltGcxEni8c8hXZNGWR7aDEkujHNtGvlya3DXHJYoH0LCOAKoq51X
	r/q1+0nCyqLWWe75FR1qZOSnBw+YxPS8X5dYnLVmfiz2kLAz0IDoxnQ40xR0mRYl3CYrXmHCEpi5E
	U2wbTTVAc+U+gujaOhgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqNJ-00000002qEt-0Bgd;
	Fri, 16 May 2025 08:25:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqK9-00000002olU-0Pbc;
	Fri, 16 May 2025 08:21:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E7B185C4A4F;
	Fri, 16 May 2025 08:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA9CC4CEE4;
	Fri, 16 May 2025 08:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747383703;
	bh=rSp1lfbQL3HqFGs8Qxo+9gIOoVGubU2xru7Z0ayuSa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=khjJJ4Y9oh6fHJXx5oXsnkK/z+Bp0SEf0wsA33MAPawNxml0laU5uzOmMoWVpY7Ln
	 Gj3Tl2iBJJVkNddWg5xRz73uzR1vSwWG4F7zjN7TVXXx0U88dj3I//4vJV2Keeya8b
	 NnCjnxILnaIikCCPvaUJYjQNYE3RUNtG1yf3W4yTeMhbcnVe8u4qKQ+5VFCxZvNGmy
	 l1hPm/Vgtim5RdnJXDS+rgS3ZWBbEDJ6i1l7pLe6Ie0t1y4iKtG6B4B14Ir3AUViOH
	 F5LQeF7RNHt/8g7ZAb5Xe5cHwO+8ba2zzrlDsweh632bqVboRtrgeDnyy/lRrplA02
	 vObKzuweIWSsg==
Date: Fri, 16 May 2025 10:21:36 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Nam Cao <namcao@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	john.ogness@linutronix.de, Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 00/22] RV: Linear temporal logic monitors for RT
 application
Message-ID: <aCb1kBEkiriPbMo4@gmail.com>
References: <cover.1747046848.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1747046848.git.namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_012145_179979_83C6970F 
X-CRM114-Status: UNSURE (   6.08  )
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


* Nam Cao <namcao@linutronix.de> wrote:

> Nam Cao (22):
>   x86/tracing: Remove redundant trace_pagefault_key
>   x86/tracing: Move page fault trace points to generic

Does the renaming of the tracepoint class from 'x86_exceptions' to 
'exceptions' have any negative effects on tooling?

Thanks,

	Ingo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
