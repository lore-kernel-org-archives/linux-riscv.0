Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF849CA601E
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 18:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+/cVgzwHWs9OKQANE0BscJ0PsEsT8U/sLhiKqTgLSxw=; b=VEHRIWSBmeCxiy
	/gyfzeX/DldP27IEfPzAMl80EXgUbaC2jzVxgy9BZ4yHrRXcwbzMEy4N6+uoDu2ydJBjczM85EUDe
	iClhZhoA4bUekQVLSKqxfGGqcuUozxosHez2V5ZIzmF0U2KtuQhqBDZn81RlwZaaxlxg6bRXVqMTt
	u10MoKgIR9mKAni35enWFudJxA0FWUTArxEGqjKIxI1iHmeM6WjYTP4fwderpMhpNtP9Jd5hm23uk
	9+MAuWJGZikl4ap0hGcYmIRjDv2XEZz1nJh0+JaDCALcrrEQkwvp1+uo6YyJT4ygA8AhFJNQ8MJtA
	SBoBOYEGaW9o0nG/zCAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFoO-000000073Au-3Hsw;
	Fri, 09 Oct 2026 18:59:20 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFoL-0000000739w-0xzU
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 18:59:19 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so1962775e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Oct 2026 11:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791572355; x=1792177155; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pJrTXNnvNyxoPy6a05idwZooJz9oMMxcUiIT8xGCw0Y=;
        b=drjLTmrZq1scrW17hl11bOcR81lAMVspEBTgAeEIfwaHeOOkm40GGrF7dVNQBkYdN8
         8zKPjGE+e3iOTBRHaaeCWNQKyc1xF1OIXfNCUBXTBpI4YpYpd9h2JRRH/VA/t2Y+Njjn
         Gr7hXHMahjwkjBkh4ybRBYi/i8WyVuu5uLsz7E5OvxqvPyZuuf1nuhVZsERuIE4V+vbR
         wodeG+hLjVCeR9C6w9shUgOKkJyrRYw7jw25eoveTrZYY1ezpj9Zhj4KDRtxoiPMvzwx
         F3+BF5ph4GajsaiQ/sAt6++XhFclZ+VsKAmFT5K3hV1/5kVuMGp+Uw62n8VWIfe8dZ+F
         Mp3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791572355; x=1792177155;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pJrTXNnvNyxoPy6a05idwZooJz9oMMxcUiIT8xGCw0Y=;
        b=CK9c/kXHuZTTflYu7om+4mBcKRWMYUfq2lksUXwqHkof8Bt06lfLJIeW1lZCtlXg84
         CpygWcKg//+0vtLkqv4l9DcYuYoWpBorYXspM4p+Wp+zyMZT4LNm2pB+3CF8Ijl/taXC
         F/PbFYw2Cte+TsyJ6jaF7QG3ZeFsOF3Ax9nwKPz9lbvOD4xM6ugRqxVAFSRQFncverf5
         VIsLiK98mDO4t5iFOZIKJXdM5Dwi93U5xPF25ZDvHjEdAqOoXlWiLa3y7WmfShOKJWPk
         SlEreLwV1YaNdJUxfyUwO6fnb/Vn4Sle4RUQ3+xPf86kS6h4uFT+nHEDdoH0URBb2Qln
         NSsw==
X-Forwarded-Encrypted: i=1; AKwUvByR7decaMSlRspRf1WAAa6jSZKfrbSmNWeI7BK4IlovkfzhpNgawNIUlg/wNmKYfNG3uIagrcBFcjNLaw==@lists.infradead.org
X-Gm-Message-State: AFuF++ku/xo58dEn/V4BSFTlBwcCqlzKW6gg+JfTwsRRK1CV+JYggOSr
	KRDXISMljQO+n4pTxu7Ip01Pz8pdpCpnFutCNCWYKoce2eFJ7vhCj33h
X-Gm-Gg: AYBFou3fZDaEdY+UqzZLfmW/nSBMJTYc6Glng0+3hnPu5F4hHvslsCH6GCnyA2QbA5M
	lwSqbRflTJpXUnfTaMW1YWUKZkRxDotEI19GRPhJkvb+Kw6RC8NY13223Yj/17V4ePnUPgFuu81
	PBecX2R9aNCNx5wsRuBvlv6rCm772+WbfAGAuzwKI8dU4Lqos3ofIwF/+FqxJkFmcNdvqaFszLV
	OD7CzrhAyJkxXr//j67Q/oCWsUC4nS6iTmUOJhCfxejxLCSGGI3W9UNWoC2SvezEYl/6XQvKZMI
	3CmQzCY/Q0UX9gJoX/TUCiJ2mgFdbIdXbkgP5n5vtz5bJCuS0eivFomo1I9ofEGT3LDfsy5wkcr
	MSME+b9l1BVwm/tk2S8UDk7ouKjRHOqgNTw1YrJoPT16zVmsulxfCZrjCJg9hwest/7rGTKOQ08
	4wPazwdWF5GonQtx2UR+XDRKXtjbrPR6znRmli4FBidzb3s1iS5Zbh9snBa3bd5G6pHAqm1cu0K
	DlTb0EW6qGRymiZQ+1vTWaTDxExFoKBJyJ4//ctwA9HO4JvZFO4qHmgbETfGuNb3juHrPqxUbrx
	tyHewzJ32TkbKb+9ZPco+Y/9MgC6Bx5hsVTK/bf+r+ObNfwBJRoQxIXS7dPMXEosovDFOBDb9pk
	mnA==
X-Received: by 2002:a05:600c:8708:b0:4a1:7b05:3a6d with SMTP id 5b1f17b1804b1-4a18e49881amr52257515e9.8.1791572355206;
        Fri, 09 Oct 2026 11:59:15 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a128-aa01-297a-7094-853e-a20c.310.pool.telefonica.de. [2a02:3100:a128:aa01:297a:7094:853e:a20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf21276sm122222075e9.8.2026.10.09.11.59.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 09 Oct 2026 11:59:14 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	oleg@redhat.com,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	jpoimboe@kernel.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	shuah@kernel.org,
	mpdesouza@suse.com,
	oliver.yang@linux.alibaba.com,
	zhuo.song@linux.alibaba.com,
	jkchen@linux.alibaba.com,
	martin@kaiser.cx,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 5/7] riscv: stacktrace: switch to frame-pointer based unwinder
Date: Fri,  9 Oct 2026 20:59:04 +0200
Message-Id: <20261009185904.82385-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260914092648.51254-6-xueshuai@linux.alibaba.com>
References: <20260914092648.51254-1-xueshuai@linux.alibaba.com> <20260914092648.51254-6-xueshuai@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_115918_343522_68068D9B 
X-CRM114-Status: GOOD (  13.58  )
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

On Mon, Sep 14, 2026 at 05:26:46PM +0800, Shuai Xue wrote:
> +noinline noinstr void arch_stack_walk(stack_trace_consume_fn consume_entry,
> +				      void *cookie, struct task_struct *task,
> +				      struct pt_regs *regs)
> +{
> +	struct kunwind_consume_entry_data data = {
> +		.consume_entry = consume_entry,
> +		.cookie = cookie,
> +	};
> +
> +	kunwind_stack_walk(arch_kunwind_consume_entry, &data, task, regs);
> +}

Hi Shuai Xue,

With this patch and FRAME_POINTER enabled, return_address() returns the
caller one level further up than asked for.

return_address() in arch/riscv/kernel/return_address.c skips level + 3
entries from arch_stack_walk(). The arm64 original skips level + 2. The
third entry exists on mainline because the walk starts inside
walk_stackframe() and first reports the return into arch_stack_walk().
With 5/7 the walk starts at the caller of arch_stack_walk(), so
level + 3 now skips a real caller. CALLER_ADDR1 and up are built on
return_address(). The irqsoff tracer and the preemptirq tracepoints use
them.

A KUnit test that calls ftrace_return_address() from
leaf() <- middle() <- outer() <- check() returns:

             af32da41b032   with series   with series, level + 2
  level 0    middle         outer         middle
  level 1    outer          check         outer

The change to level + 2 has to depend on FRAME_POINTER. Without it the
series keeps walk_stackframe() and the result is the same as on
mainline. There, level + 2 makes return_address(0) return an address
inside return_address().

The same extra entry makes stack_trace_save() start one frame too early
on mainline. 5/7 fixes that. I have a small fix for it on mainline,
meant for stable kernels, which conflicts with 5/7. I would post it with
you in Cc. Tell me if you would rather take the return_address.c change
into 5/7 first.

Tested with clang 22 and the series applied on 52318cf0fa6e. The
"with series" column is the same on QEMU's virt machine and on a
BeagleV Ahead (TH1520). Everything else ran on QEMU only.

Karl

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
