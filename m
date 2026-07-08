Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005ADC43458
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 07:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VN8IOboDoWpDsE6qsNnWd9io7i5aXDWahtwkGwo4ENY=; b=Qv2h4b1YycXXc5
	PVR1FCUXo3GKC/cTnBYqWuMYT1SD0PwzCZ5+X/qwWl4IT5yLgMhpa9PJOffQ68b2m9wprGS1eAQlh
	fNgA091R15nqGAFo/OO3ca3txLBTrgCF+6oXdAqoOD+HaZTOp4ZN3Y779Tis/qj0Ip6yqL15u5MBX
	Sciw/VfA0wJa0d1Sc4vNOH9ZioHDEIIUu7oK0MSnAqatWymfwvb79cZJbe50zij9EjVmhGvlKc/62
	2EXUCKlPlqyLpM/VWsvrx2Zp6Pf5SHooRy4O5Cin0VhM9RvOXgQ/Qn2TrvsSqDlHTIBoaaujIXK9C
	LvbEOXSozy/DPEN/l4uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMWf-0000000GTbO-0k5J;
	Wed, 08 Jul 2026 07:16:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMWe-0000000GTb5-0Zfr
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 07:16:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E078B4177C;
	Wed,  8 Jul 2026 07:16:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 645341F000E9;
	Wed,  8 Jul 2026 07:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783495015;
	bh=/dRpSm0Wfc3gb2hQ1lfBTFrclpun0KfQynpXPzaG5S8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=iDnbou0Rj6/sk1duNwUGKMJ2pWe2fL1AKR0c7OGvlYweLhnQxbfSPk6/9q1QgdfLW
	 bXxfB6wZh/dJqBsYiVsCSamd4C/efqZvymjgUHz/bPTz/LSl/IeO97IkJQBQgg5KGx
	 dShWf6EHvFGZsDmLgw0932qKOsobhnMnLrmA1vQZLADmUoYR/uWxcRe+410dJkUV6l
	 ZMzmy0Pn9Kpw0seMmnK829ZqEJ2PQkqkdn2ZwB98FD3eBN+lQjiFGJM/GIA2FBuX8h
	 5LKnepT5tW/ZN9NiqfoYuKDo+BgbdG3R7GZMoAPnqcPft+CJ8P4tYmRK9us3kA1u1b
	 cKaUrdolYK4+g==
Date: Wed, 8 Jul 2026 01:16:52 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    pjw@kernel.org, palmer@dabbelt.com, Andy Chiu <tchiu@tenstorrent.com>
Subject: Re: [PATCH] selftests: riscv: Bypass libc in inactive vector ptrace
 test
In-Reply-To: <20260707153827.175245-1-andrew.jones@oss.qualcomm.com>
Message-ID: <7d7bcba8-7fe7-a7ed-c493-17f8c82dc37d@kernel.org>
References: <20260707153827.175245-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
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

On Tue, 7 Jul 2026, Andrew Jones wrote:

> The ptrace_v_not_enabled test expects the child to reach its ebreak
> before it has used the vector extension. That is not guaranteed when
> using fork(), because libc may run child atfork handlers before
> returning to the test code. In those cases PTRACE_GETREGSET for
> NT_RISCV_VECTOR then succeeds instead of returning ENODATA for
> inactive vector state.
> 
> Use the raw clone syscall with SIGCHLD to keep fork-like semantics
> while bypassing libc's fork wrapper and atfork handler chain.
> 
> Cc: Andy Chiu <tchiu@tenstorrent.com>
> Assisted-by: Claude:claude-sonnet-4-6
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

Thanks, queued for v7.2-rc.

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
