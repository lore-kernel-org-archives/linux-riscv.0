Return-Path: <SRS0=/4kn=D3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F07B1C4363A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2020 20:41:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F0F02224A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2020 20:41:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lygt/yQn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F0F02224A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9E8PPsdKD4cXcDGMroPgbaK6jDg1GhiCbnUWj/T/Wgo=; b=lygt/yQnXRZ7T8MMCJPlZokk0
	mGXowVbQ792df5wuaoiVi8TXILGZvFz4b4V+rgms8Bw/RjyyrcOseYRtlRyByQkNiNbDVgHtzd6n8
	6kDr63GIup0wke9/Ogf1u2jFy4G3b35Wo3ZsU/Pu1Dnb4MMYLtra53bxRTaa1o3Pi/n6GZozb3dDd
	tKyoU2KQ+HdzzNoVG1AbL5uZZjrdGygtqHcgHjxX+gVmDklph+qbd09ni9t/o6g9T9boGzmXq/qTH
	T09S8+8RIiKHFmFRe6ImtG7FsBfW4Hb2WGDwXjQ0yvrCNdi5gH6AttxcJMeHd+kWbhUXlIKxSBkJG
	llNKX2UQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUyRl-00071S-87; Tue, 20 Oct 2020 20:41:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUyRh-00070W-QF
 for linux-riscv@lists.infradead.org; Tue, 20 Oct 2020 20:41:26 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 88D872224A;
 Tue, 20 Oct 2020 20:41:23 +0000 (UTC)
Date: Tue, 20 Oct 2020 16:41:21 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v4 9/9] riscv: Fixup lockdep_assert_held(&text_mutex) in
 patch_insn_write
Message-ID: <20201020164121.32626e45@gandalf.local.home>
In-Reply-To: <CAJF2gTSU+M+b+bn5zH_EyE7Ksh=5+ZkO8LkAn=Tm-p45CgYW1w@mail.gmail.com>
References: <1602918377-23573-1-git-send-email-guoren@kernel.org>
 <1602918377-23573-10-git-send-email-guoren@kernel.org>
 <CAOnJCU+oTRcJ2p8WQDX5P-EsOHmkn3kP9s54VQa+iw2wXDvzkg@mail.gmail.com>
 <CAJF2gTSU+M+b+bn5zH_EyE7Ksh=5+ZkO8LkAn=Tm-p45CgYW1w@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_164125_947323_099E9162 
X-CRM114-Status: GOOD (  13.19  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Patrick =?UTF-8?B?U3TDpGhsaW4=?= <me@packi.ch>,
 Guo Ren <guoren@linux.alibaba.com>, Alan Kao <alankao@andestech.com>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Atish Patra <atishp@atishpatra.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 20 Oct 2020 19:18:01 +0800
Guo Ren <guoren@kernel.org> wrote:

> > What platform are you testing ? We are seeing a crash while enabling
> > any of the tracers multiple times
> > on Qemu/HiFive Unleashed.  
> I use qemu for testing. I've changed dynamic ftrace mechanism from
> mcount to -fpatchable-entry.
> 
> The problem is made by the lockdep checking of text_mutex.

If you are switching to "patchable-entry" you shouldn't need to use
stop_machine for the updates. No?

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
