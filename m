Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04678C98310
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 06:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N4suxMy1nVkz5EF/RJE0KEEUW8gJPFBhcuZfodbTBRo=; b=u0uN3ApRj4y740
	I6bpg/tjeyFsrlKoU4n1DudHoQ5x87wph4avdyJl/DRbGCqMiKslCVHb0LNK0S5uZwKep2bmQ0g2k
	9sizxCa/OvgdpF/Roe23nkSIYBVOxkZhN6Ad58h1ac3BWVNRWgbgqN7FB/yi63kDDEcEDwqZwSyDa
	jQ2eSGpdkks8svKdRiSMpCuwChoEMAA4CHQkx2sLcBGsgVJllci1yijbAO4uE3XSNC4M7Z0uqxeA7
	fHR/ywbMpKs5tJ/NMq0qLihCMUb123AUCWoFN2aoJdsR/WrmvFH/qMZKYVa72gl+HrsQiIf6XTOmv
	BRiTcIbD7D7eCCklnnqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9cpJ-0000000A8wf-1Jyh;
	Thu, 24 Sep 2026 06:21:01 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9cpH-0000000A8wI-09FG
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 06:21:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790230853; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=UZmmCpa9iQGypCYX6K6r43HbgZn3fz9spOS64iksXTs=;
	b=ldix3Ne3+9sO2eMsKeLXrXRkSZNYFjD96PKUARWcza4N92lo+DSuLQSGiTml6deieiKXBw5XaZpNz3WDD8pWmjiD+p37zd8RmoX5mSzYIijpLB26h8Yu4rdSkUZKmPcl6g73o1ZS3W0jDeL2WsKN8/ae78auOF0ve+cko+8lr6A=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0XBYn2f4_1790230804;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XBYn2f4_1790230804 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 24 Sep 2026 14:20:53 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: JaeJoon Jung <rgbi3307@gmail.com>,
	rgbi3307@nate.com
Cc: bjorn@kernel.org,
	bjorn.topel@gmail.com,
	luke.r.nels@gmail.com,
	xi.wang@gmail.com,
	puranjay@kernel.org,
	andrii@kernel.org,
	daniel@iogearbox.net,
	ast@kernel.org,
	memxor@gmail.com,
	pulehui@huawei.com,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: net: bpf: add bpf_jit_supports_private_stack()
Date: Thu, 24 Sep 2026 14:19:59 +0800
Message-ID: <20260923114951-private-stack-rfc-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810031418.95364-1-rgbi3307@gmail.com>
References: <20260810031418.95364-1-rgbi3307@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_232059_471900_5A7B0EAA 
X-CRM114-Status: GOOD (  10.64  )
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

Hi JaeJoon,

Thanks for the report. I have been looking at what still blocks
sched_ext on riscv64, and the private stack is indeed an important part
of it.

> $ sudo ./build/bin/scx_simple
> libbpf: prog 'simple_dispatch': BPF program load failed: -EACCES
> libbpf: prog 'simple_dispatch': -- BEGIN PROG LOAD LOG --
> Private stack not supported by jit

I don't think we can take the hook on its own, though.

The other architectures paid for this with real JIT work rather than
with the hook alone: arm64 (6c17a882d380), x86 (7d1cd70d4b16) and
powerpc64 (156d985123b6) each added the per-CPU allocation with
overflow/underflow guard regions, the prologue work that puts the
program on that stack, and the guard check plus free on the program
free path.

> It seems that it should be defined in the same way in RISCV as well.

Defining it the same way means that JIT work, not just the hook. With
the hook alone the verifier would let these programs load while riscv64
still runs them on the per-task stack and has no guard region, turning
the clean -EACCES above into a silent stack overflow.

Going through those three commits, this is what I expect the riscv64
side to need, and I plan to post it as an RFC series:

  1) per-CPU private stack allocation with overflow/underflow guard
     regions, plus the guard check and free_percpu() on program free;
  2) pointing BPF_REG_FP (S5) at priv_sp + the program's stack size
     while leaving SP on the kernel stack, the way arm64 does;
  3) emitting the per-CPU lookup that produces that pointer after the
     tail-call entry point, since RV_TAILCALL_OFFSET is a constant
     added to the target program's bpf_func;
  4) bpf_jit_supports_private_stack() returning true only once the
     above is in place.

Aiming to send RFC v1 within the next couple of weeks. JaeJoon, I hope
we can go over the testing together once it is posted.

Thanks,
Pei

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
