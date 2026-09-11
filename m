Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE127C88E4C
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 08:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:Mime-Version:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dJ5Qtkx1aZ0ls2hVRzng4rF7S40kui8x7o1E3Kr5tZw=; b=mfSS6Q2vceKbFX
	lrgGtbGQGeazQ6lChpU98UxcVDBE5kT2CeeocfcoKGl0HKCOqRO4F20iTLK7RKSLNbKOJ65KaaZEp
	E5ibZh7brYXZ77xfDs0ne3xo5EiHH3UGGEvlc8ccwgPCxEBpVnT3d1Mu48CNm7ln6UysL3nU+dZPY
	GgNm+/wxqmF+ZUcy1L6ki5+4h84LLdecM+YWXMQ03122WhqQm6j6P/WU8f/OdW++zVTLmuXZ0MeTi
	HO9EUDqZllCq81Y4VUlIOrmHSD3vVnjs7id/sALgTTQBruYo3KMupuuoqpYSdON/vjlr5kdpKK26A
	RfuH/f4wDkwXhnCGajmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4x1k-0000000GBdi-0eVt;
	Fri, 11 Sep 2026 08:54:32 +0000
Received: from va-1-111.ptr.blmpb.com ([209.127.230.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4x1h-0000000GBdO-0yhq
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 08:54:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1789116859; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=ll6mGsQ0NP/yiMN03dJvbR4RMY0hZg71ZwyOyHA0XNw=;
 b=kbj+ZeOr8Zky2fPkoD0pBRRkvfkcwZ08VVIV2G2+QMf0//Y5huajrCzOgEQZTeixqVYcTM
 G6rk8yBz4zIRZiOwiGgtiC7kdLWTZwrd0Doy8PqvpG5My2nk5A41XMc/QinJ7djOG10v2P
 UnVgtRkfY2B8WwfwwyM3ofrIa2gcZc7YECvKcXrkfJUNsnlfyFU4QgvHh1YO7Zl9up6rKT
 WxCdw+KT7alMlN06NijVDYQW32f938A9HXiqLTCWDqznyS8OxehaVBojIZG9kEvp7gmpC7
 wz3UdOgBHGGtwLzIb2sQH2zDQpfYyU9Jqedup21dV9jAE3Iu9YnThMhDowaacQ==
Date: Fri, 11 Sep 2026 16:54:00 +0800
Message-Id: <20260911085359.95227-2-qirui.001@bytedance.com>
Mime-Version: 1.0
To: "Himanshu Chauhan" <himanshu.chauhan@oss.qualcomm.com>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<qingfang.deng@linux.dev>, <alex@ghiti.fr>, <aou@eecs.berkeley.edu>, 
	<palmer@dabbelt.com>, <pjw@kernel.org>, <shuah@kernel.org>, 
	<thecharlesjenkins@gmail.com>, <jtaubepe@redhat.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26aa3c1b9+1d4d0a+lists.infradead.org+qirui.001@bytedance.com>
References: <20260803134913.2013674-2-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
From: "Rui Qi" <qirui.001@bytedance.com>
Subject: Re: [PATCH v6 1/5] riscv: Introduce support for hardware break/watchpoints
In-Reply-To: <20260803134913.2013674-2-himanshu.chauhan@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_015429_366504_C5661DF3 
X-CRM114-Status: UNSURE (   8.59  )
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

Hi Himanshu,

While testing this series on a platform exposing type-6 triggers, I hit a
failure that seems related to the mcontrol6 timing/hit semantics.

The current execute breakpoint path demuxes the event only by comparing
the programmed breakpoint address with regs->epc:

    if (bp->address == args->regs->epc)
        perf_bp_event(event, args->regs);

On our platform the execute trigger did fire, but the breakpoint
exception was reported with EPC pointing to the next instruction. For
example, the trigger was installed at 0x1062e, while the trap came in
with epc=0x10632. As a result the handler did not call perf_bp_event()
and the breakpoint selftest timed out.

This does not look like an instruction-size matching issue. The trigger
itself matched. The problem is that the kernel identifies the matching
execute trigger only by EPC equality.

For mcontrol6, I think the driver also needs to be careful about the
Sdtrig version exposed by tinfo. With tinfo.version > 0, bit 20 of
mcontrol6 is no longer the old timing bit, and hit1/hit0 encode the
fire timing. The series currently still defines/clears
RISCV_DBTR_MC6_TIMING_BIT and, for watchpoints, only checks
RISCV_DBTR_MC6_HIT_BIT. The execute path does not use hit information
at all.

Would it make sense to make the type-6 path version-aware, or otherwise
avoid relying solely on regs->epc == bp->address?

Thanks,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
