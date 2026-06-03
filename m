Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE559CD6E5D
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 01:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZEqiFuzpRU9d+EOnHIEyXUs1nU5y7VhokI8OCJC4fbM=; b=arMiL2ftLKlrWS
	k9+ew3f282rqyh0xTaizp18+bm3v/hLYUSmFGl2KaMcNq04X0TmqxLHN3aJfBIdk7dvqwg9VUO7p+
	DCfyJUNcHh1q/cgkyZZApOFMUxbTdFKGPOgphXSmvcrbKPfjav30nIRDfuIrACR3oQOEPaNjavwe8
	SO0EmDzIfWuS1yodubKwqZTiBcxZzE+MxY11yBY0nbGqpGqAba2p8WF3sK/JBdKJ/q6fM1PElxGmi
	J7UOebQrdYfou7S/LuFdDzAfiXsYgnlu8StTy74XAjNrC/ej1wX0zGPK3UV5MWVqVz3pSD1Clib6B
	axHq1IPx/kQgGS2uwCig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUajf-0000000E46Z-41gt;
	Wed, 03 Jun 2026 01:49:35 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUajc-0000000E45R-46YZ
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 01:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780451370; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=5c6u0pQsZNF6kyUVcoFwMxuHgokBKqWxj4uNhSsZtgs=;
	b=mtFfXHboSadWwWaVxaDeFDDEYpTfrg5hjpYK2Fwaq1Oal/rz9sNYoUUxhFhc1KUFUnU0ufA2+MgZ4nss5/U7lTfPD43XIy9k88ZLx2O1oiKqyHBZQgwSVxoNKKoediKlF2tvJW8ej6R/n+gU+vgUaNQR/euvoVQrcZrSgg0Mlmo=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=34;SR=0;TI=SMTPD_---0X45nr59_1780451367;
Received: from 30.246.177.175(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0X45nr59_1780451367 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 09:49:28 +0800
Message-ID: <a88b8245-04d1-41db-9507-aaddfbd8e042@linux.alibaba.com>
Date: Wed, 3 Jun 2026 09:49:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] riscv: Kconfig: enable HAVE_RELIABLE_STACKTRACE
 and HAVE_LIVEPATCH
To: Wang Han <wanghan@linux.alibaba.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Steven Rostedt <rostedt@goodmis.org>, Alexandre Ghiti <alex@ghiti.fr>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Chen Pei <cp0613@linux.alibaba.com>, Andy Chiu <andybnac@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Deepak Gupta <debug@rivosinc.com>, Puranjay Mohan <puranjay@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, oliver.yang@linux.alibaba.com,
 zhuo.song@linux.alibaba.com, jkchen@linux.alibaba.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, live-patching@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-perf-users@vger.kernel.org
References: <20260527123530.2593918-1-wanghan@linux.alibaba.com>
 <20260528082310.1994388-8-wanghan@linux.alibaba.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20260528082310.1994388-8-wanghan@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_184933_515938_CCE56551 
X-CRM114-Status: UNSURE (   7.78  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 5/28/26 4:23 PM, Wang Han wrote:
> Now that the metadata frame records, the kunwind state machine and
> arch_stack_walk_reliable() are all in place, advertise the capability
> to the rest of the kernel:
> 
>    * select HAVE_RELIABLE_STACKTRACE under FRAME_POINTER && 64BIT, so
>      only the configurations that actually have the metadata records
>      and the FP-based reliable walker enable it.


The 64BIT gate is conservative scoping rather than a hard technical
requirement: the metadata frame record, kunwind state machine and
arch_stack_walk_reliable() all build on RV32 too (and the
call_on_irq_stack change in patch 2/8 actually fixes a latent RV32
issue). However, the syscall livepatch selftest and module relocation
path have only been exercised on RV64 (QEMU virt SMP=2/4/8). The
64BIT gate can be dropped in a follow-up once RV32 has equivalent
coverage.

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>

Thanks.
Shuai

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
