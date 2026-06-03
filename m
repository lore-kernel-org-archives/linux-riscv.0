Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9340CD6E55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 07:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6fxehwIfCDtvV6MQTVnKCQgGMHxX7DymlFmGopyNgwM=; b=m1VLp1JeWwIBMG
	OsIfCCA5zN9sxQKebN8YGpQKRI0zrJgrIs6KzEM9TsoacSsrs7S/mAOZRbfn1K/Kob5HAge4+4e55
	Ra8CSlNv9zLAiWR/0pINtA4aSrt8BLgw7vjPcNXhO587aWiZtKxqCJhgwjJoPhmaZ+FdHRYBm14Gt
	YcS3uYP0vQTcxiYQfDXa3+cOdhdwMvig+GeE6mSyvuuaqYu+a64B0kAj1z9zTKaFseIx3780gj2wk
	S6o3j6gdvWRPe+AN+zCm9DU1FuvLYtAEEoa6RoYjL0gbl1eZ1e3gRqYdCPmi87jiDq5oaudILyKJv
	YLSwnuTmT5JO0gBOqLSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfoW-0000000ESTF-0oDz;
	Wed, 03 Jun 2026 07:14:56 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfoR-0000000ESNN-0QxJ
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 07:14:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780470883; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=S3SFKFoWcboEPyPNGOUmpMlqfzFH7srYWpl0FUhqNPI=;
	b=xRznNZgAozlzQG6yVl3AB/wfg8G/UAlOpDkQkjx9fytWyBRyVAVatZadSTPArhWP8WMKAFvi6+meKKeJERMmlSEDCFfG7Rvqs31AT+1mY8Rwt6gaX9X2RfShP2sfuE93elBvbCgmg5gFs6BWS/DmjdCK1xl/pUkyAyp4p56YD+g=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R611e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=31;SR=0;TI=SMTPD_---0X46a5-T_1780470878;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X46a5-T_1780470878 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 15:14:42 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: wanghan@linux.alibaba.com
Cc: acme@kernel.org,
	alex@ghiti.fr,
	andybnac@gmail.com,
	aou@eecs.berkeley.edu,
	bjorn@rivosinc.com,
	catalin.marinas@arm.com,
	conor.dooley@microchip.com,
	cp0613@linux.alibaba.com,
	debug@rivosinc.com,
	jikos@kernel.org,
	joe.lawrence@redhat.com,
	jpoimboe@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	mark.rutland@arm.com,
	mbenes@suse.cz,
	mhiramat@kernel.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	palmer@dabbelt.com,
	peterz@infradead.org,
	pjw@kernel.org,
	pmladek@suse.com,
	puranjay@kernel.org,
	rostedt@goodmis.org,
	shuah@kernel.org
Subject: Re: [PATCH 1/8] scripts/sorttable: Handle RISC-V patchable ftrace entries
Date: Wed,  3 Jun 2026 15:14:29 +0800
Message-ID: <20260603071430.59794-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527123530.2593918-2-wanghan@linux.alibaba.com>
References: <20260527123530.2593918-2-wanghan@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_001452_470539_830A8FBF 
X-CRM114-Status: UNSURE (   6.47  )
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

On Wed, 27 May 2026 20:35:23 +0800, wanghan@linux.alibaba.com wrote:

> On an affected RISC-V QEMU boot with both CONFIG_FTRACE_SORT_STARTUP_TEST
> and CONFIG_FTRACE_STARTUP_TEST enabled, the sort check still passes
> while ftrace reports zero usable entries and the early selftests fail:
> 
>   [    0.000000] ftrace section at ffffffff8101da98 sorted properly
>   [    0.000000] ftrace: allocating 0 entries in 128 pages
>   [    0.054999] Testing tracer function: .. no entries found ..FAILED!
>   [    0.172407] tracer: function failed selftest, disabling
>   [    0.178186] Failed to init function_graph tracer, init returned -19
> 
> Handle RISC-V like arm64 for the function-range check and allow
> patchable entries up to 8 bytes before the function address.
> 
> With this fix, a RISC-V QEMU smoke boot with ftrace startup tests shows
> the vmlinux ftrace table is populated and dynamic ftrace still works:
> 
>   [    0.000000] ftrace: allocating 46749 entries in 184 pages
>   [    0.051115] Testing tracer function: PASSED
>   [    1.283782] Testing dynamic ftrace: PASSED
>   [    6.275456] Testing tracer function_graph: PASSED
> 
> Fixes: 0ca1724b56af ("riscv: ftrace: select HAVE_BUILDTIME_MCOUNT_SORT")

Oops, sorry for missing that. Thanks for the quick fix!

Reviewed-by: Chen Pei <cp0613@linux.alibaba.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
