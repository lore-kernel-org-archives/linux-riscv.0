Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B16CD6E4A
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 11:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aMbefIGFTs30qrx69ciqQ1esFFn1+jv/owuYPs/PGck=; b=QLfJU+JMDUvptu
	/mSgDyHOtvE4mz3qEL9Ot1BEO6Hns9lHr7dYzJMCu8o+OjNvsUjISQ8wH7Zz6pP+kYvfE8G9dshzO
	ouy2mlphsLr2lnx6NVGbGGSrFpEnQUbJeF4nJCKN7AYFkoWdd+y8omiBDeFluQwmVexVS+mPB63R7
	rJi5gr+OFJeGspvnCgWT0Sh5x2uX8FuYxkY9PEi2mF7hZNHy+oYs3h5boCZl3BsJtQn3Sz1w0l3ke
	zwODn0k2OHJ8B/9zbpUVU896E8XtNmodVXdQsXHKElWQaTTLdSmZ6SwiE5/ApG0zwdiY3sFKaI7V4
	OyqoRiwnyI7yjI1mSQZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNR8-0000000CtcR-3Mt8;
	Tue, 02 Jun 2026 11:37:34 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNR5-0000000Ctbl-42TN
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 11:37:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780400248; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=185K9IDgIj/Feo66qKQnCyRFQ1fH9VLKwHJVJJOu/ts=;
	b=vwotUiYDpASiJ9IaEOoBQJvZhQroxl5futEA+zan9w/t6r4g2F5uP73i4Ke8L0EqgA2K+k7GKRgvHYTAa+FOt1GcFIOke6LdsgWxea/nRz8PURJbz4NWavmWufie7JeqbAMVhwBufPCwumw3x00v6Svv3JnzbspCnWcpMA01MK4=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R321e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=34;SR=0;TI=SMTPD_---0X44RHXL_1780400244;
Received: from 30.100.154.88(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0X44RHXL_1780400244 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 19:37:26 +0800
Message-ID: <d0ea70d2-f38b-4ec9-9522-d2d5b6d92f5c@linux.alibaba.com>
Date: Tue, 2 Jun 2026 19:37:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] riscv: ftrace: always preserve s0 in dynamic
 ftrace register frame
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
 <20260528082310.1994388-5-wanghan@linux.alibaba.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20260528082310.1994388-5-wanghan@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_043732_239452_B5EEF6CD 
X-CRM114-Status: UNSURE (   7.52  )
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
> The dynamic ftrace entry/exit only saved s0 (the architectural frame
> pointer) when HAVE_FUNCTION_GRAPH_FP_TEST was selected. The upcoming
> reliable frame-pointer unwinder needs s0 to be present in
> ftrace_regs unconditionally so it can use the frame pointer as the
> function-graph return-address cookie regardless of FP_TEST.

Nit: A prefered commit log:

struct __arch_ftrace_regs declares s0 unconditionally, and both
ftrace_regs_get_frame_pointer() and ftrace_partial_regs() read it
unconditionally. But the SAVE_ABI_REGS / RESTORE_ABI_REGS macros in
mcount-dyn.S only stored s0 under HAVE_FUNCTION_GRAPH_FP_TEST
(CONFIG_FUNCTION_GRAPH_TRACER && CONFIG_FRAME_POINTER). With
CONFIG_FRAME_POINTER=n the slot held whatever was on the stack before,
so any callback going through ftrace_partial_regs() saw a garbage
regs->s0. RISC-V kernels default to FRAME_POINTER=y, which is why
this has not bitten in practice.

Save and restore s0 unconditionally in the dynamic ftrace ABI register
frame. This fixes the latent garbage-s0 case, brings the dynamic ftrace
path in line with the static _mcount path (mcount.S SAVE_ABI_STATE
already saves s0 unconditionally), and matches the frame layout already
documented in the comment above SAVE_ABI_REGS. It is also a
prerequisite for the upcoming reliable unwinder, which reads
ftrace_regs_get_frame_pointer(fregs) directly.

Save and restore s0 unconditionally in the dynamic ftrace ABI register
frame. This fixes the latent garbage-s0 case, brings the dynamic ftrace
path in line with the static _mcount path (mcount.S SAVE_ABI_STATE
already saves s0 unconditionally), and matches the frame layout already
documented in the comment above SAVE_ABI_REGS. It is also a
prerequisite for the upcoming reliable unwinder, which reads
ftrace_regs_get_frame_pointer(fregs) directly.

The cost is one extra REG_S/REG_L pair per traced call, negligible
compared to the overall ftrace cost; the existing FREGS_SIZE_ON_STACK
already reserved the slot, so no extra stack space is used.

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>

Thanks.
Shuai

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
