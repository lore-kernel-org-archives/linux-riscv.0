Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C7DC43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 17:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RhttdtFAW4PEqd+RbLg+dB4ECvEe+t1Y2tvALVCPD9w=; b=cudfX71bVoIRYw
	KXSoridYZs4GBFyxNfr4gssD0C6+E5B89f8J9Tmtqy3TLEt2MHzueIZCNWW6auJlFzDPXNjTo56QF
	Xdtdx6w8P+QS6deBlSwIAGH6vq6EtOCHe7sc6Pq/BYP+biwLaDVq1bYEPhgAp3X+EOCw6x8LQhlSw
	nwMzwG+9fadaPJ8sHBn7zutKXkRyo0ySYduY2rdh78RisSEcO78H6T7GElNiSQziF8UmTh4VdInmK
	1YplDvHPZuR4J6o4lkhdgtIbXDSaX0Fwjln3qmTgXKS1ymGv97//UU8/DWYOMwZrrT9NQIPD2wfzI
	BcQTe/Zv95an1GQ74f6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKdb-0000000A8CY-3q3p;
	Mon, 13 Jul 2026 17:40:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKdb-0000000A8CS-0fhV
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 17:40:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C6B442E5A;
	Mon, 13 Jul 2026 17:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D311F000E9;
	Mon, 13 Jul 2026 17:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783964414;
	bh=zFtG0nvrj3NH4oQfVqsdZuKnWzNdjcmSutSX77OAy68=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=ncnNgxNQDHgL/D4fmP+v4PhhqBUNuku1df2jFag9T79beLLfxxUntnTHnUA7vCIyg
	 FzKcxCXVZzM1/wWCDDr7EDdBuOHmAJ8MWgPjndb4wY617EwPMKTkpte5UXedrvf/C9
	 qgUk+AOlvQTaTBrzYv4iEghO8R54/vgloB8VKh2QCCkTDJ2yzexOsq0c6/mKGBF6AY
	 +RftqSaNkxgpfRDGjoDpHjZVbpG64H+pk3hp86xk46Bgb2+xisyPmTTyRsEYdplUBf
	 ntDrlW7ZUBQIdDSJzEMsXTXRhSUTvpqKWWZf1th2fuUrYaEsBFWgZYNhPb6rxiFzuM
	 JOIzborr4J6Gw==
Date: Mon, 13 Jul 2026 11:40:10 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Rui Qi <qirui.001@bytedance.com>
cc: palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, 
    Alexandre Ghiti <alex@ghiti.fr>, Andy Chiu <andybnac@gmail.com>, 
    =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, 
    "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
    open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Gate FUNCTION_ALIGNMENT_4B on DYNAMIC_FTRACE
In-Reply-To: <20260706130415.463682-1-qirui.001@bytedance.com>
Message-ID: <03933583-e2ce-ead0-65c8-320e43d9be97@kernel.org>
References: <20260706130415.463682-1-qirui.001@bytedance.com>
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

On Mon, 6 Jul 2026, Rui Qi wrote:

> The FUNCTION_ALIGNMENT_4B select forces the whole kernel to be built
> with -fmin-function-alignment=4. This alignment is only needed so the
> patchable-function-entry NOPs, which arch/riscv/Makefile emits under
> CONFIG_DYNAMIC_FTRACE, can be patched reliably on RISCV_ISA_C=y builds
> where compressed instructions otherwise allow 2-byte function
> alignment.
> 
> The select is currently gated on HAVE_DYNAMIC_FTRACE, a capability bit
> that is selected whenever the toolchain supports dynamic ftrace, rather
> than on whether tracing is actually enabled. As a result every
> RISCV_ISA_C=y build gets 4-byte function alignment across the entire
> kernel even when function tracing is disabled, needlessly growing the
> kernel image and wasting instruction cache for a feature that is not
> in use.
> 
> Gate the select on DYNAMIC_FTRACE instead, matching the condition under
> which arch/riscv/Makefile emits -fpatchable-function-entry, so the
> alignment is only applied when it is actually needed.
> 
> Fixes: c41bf4326c7b ("riscv: ftrace: align patchable functions to 4 Byte boundary")
> Signed-off-by: Rui Qi <qirui.001@bytedance.com>

Thanks, queued for v7.2-rc.

- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
