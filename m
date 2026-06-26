Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0735DCDE00E
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WtEb18ssHV+Xeh3hdhz156U3Nf0i+ujhW8wZMgGARCk=; b=g1BzCwjvv9WIYu
	ArB5CvEsERg3Dc5sE0QVKa4ygRqEKuDJ3Uq7TXLyuxTmBpYdPzVwxaFuJKejKr02RkXEtllh+RYwl
	rJIGcnZLaFjsmEMPFOKros0wYAMhqsjAbaKRygztVDFjiCuE4CqKATXFbRm7SILANX5tZUcdQ8rK/
	qOmWvzJTglphYVUBiLBmpX3zbbcEyfVNVPsSSKL+w0iDL0/C+qkih0jL63UzzsyLNQQ1Nq0bRrPqW
	CqW+f1YuQnYW7RZyWk452OrOumMxTwUC0OkkH+zW10rPbs9d0gm+MqHviwQqZPHAt0bZG0V3RgcUx
	Clmp6oJddkUvhxq3SEYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1og-0000000Anlh-1STS;
	Fri, 26 Jun 2026 08:21:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oU-0000000AnQq-3TQO
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 08:21:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D11E443B7;
	Fri, 26 Jun 2026 08:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5728E1F00A3E;
	Fri, 26 Jun 2026 08:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462086;
	bh=zsScqxEdMhuN7RDDDXh0ed+YZPuMqpL3ArI4WO1ybVk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=g1bqmy0Kp4g9VaQu2yr2zVYlOynszE/KmM+iSDj7cw4DeRLc4KFm1BsQgAROhaNI6
	 1yvnhJG2UuOI9kPmeK04S3ASG4+TheDpFXvEHORJR/QLZrCLgz7sxklwE9eb0KnOXi
	 aSKpnA7KG4QvZ0a638RFUEXrNszZG+KJAo+vN6fTzmKxTtrKWbpJU+BGzFzfm1jhcm
	 yo1A+sBu9dg1V0bomrp2Dwvti6FJW/YCk6S68SoQSO+mIIjXXKuvMJjB5mis2Y2RuK
	 3dbrOHshP7pPbr70ugmFP3C6DwmE9z0RboUWZQFtkaZk7UPGNLRK8rNGDjDytS/uIz
	 sMJSMjqZKWAgQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93C0839389E8;
	Fri, 26 Jun 2026 08:21:14 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/8] scripts/sorttable: Handle RISC-V patchable ftrace
 entries
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246207319.3816447.13538002278089334459.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:21:13 +0000
References: <20260609063002.3943001-1-wanghan@linux.alibaba.com>
In-Reply-To: <20260609063002.3943001-1-wanghan@linux.alibaba.com>
To: Wang Han <wanghan@linux.alibaba.com>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, rostedt@goodmis.org, alex@ghiti.fr,
 mhiramat@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com,
 cp0613@linux.alibaba.com, andybnac@gmail.com, bjorn@rivosinc.com,
 debug@rivosinc.com, puranjay@kernel.org, conor.dooley@microchip.com,
 jpoimboe@kernel.org, jikos@kernel.org, mbenes@suse.cz, pmladek@suse.com,
 joe.lawrence@redhat.com, shuah@kernel.org, peterz@infradead.org,
 mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
 oliver.yang@linux.alibaba.com, xueshuai@linux.alibaba.com,
 zhuo.song@linux.alibaba.com, jkchen@linux.alibaba.com,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-perf-users@vger.kernel.org
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
by Paul Walmsley <pjw@kernel.org>:

On Tue,  9 Jun 2026 14:29:52 +0800 you wrote:
> RISC-V uses -fpatchable-function-entry=8,4 when the compressed ISA is
> enabled and -fpatchable-function-entry=4,2 otherwise. In both cases, the
> patchable NOP area starts 8 bytes before the function symbol address.
> The __mcount_loc entries therefore point at the patchable NOP area
> associated with a function, while nm reports the function symbol at the
> entry address used for the function range check.
> 
> [...]

Here is the summary with links:
  - [v3,1/8] scripts/sorttable: Handle RISC-V patchable ftrace entries
    https://git.kernel.org/riscv/c/57ad674d032b
  - [v3,2/8] riscv: stacktrace: Add frame record metadata
    (no matching commit)
  - [v3,3/8] riscv: stacktrace: disable KASAN and KCOV instrumentation for stacktrace.o
    (no matching commit)
  - [v3,4/8] riscv: ftrace: always preserve s0 in dynamic ftrace register frame
    (no matching commit)
  - [v3,5/8] riscv: stacktrace: introduce stack-bound tracking helpers
    (no matching commit)
  - [v3,6/8] riscv: stacktrace: switch to frame-pointer based unwinder
    (no matching commit)
  - [v3,7/8] riscv: Kconfig: enable HAVE_RELIABLE_STACKTRACE and HAVE_LIVEPATCH
    (no matching commit)
  - [v3,8/8] selftests/livepatch: Add RISC-V syscall wrapper prefix
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
