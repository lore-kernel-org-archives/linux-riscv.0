Return-Path: <SRS0=N5Fz=EW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F0ACC2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 19:29:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C33E32225B
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 19:29:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jYR7Lkl8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C33E32225B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X6H2r2U5iEhd2lnZBEJuzL2VWAWLBZUHS3FJLkwHI8E=; b=jYR7Lkl8k6xSD20qwDj/sWuN1
	THsp+T7cktN7Kv4fmVoC+SI6c9Fsqy+wWJ3neBamG+903UQtuhXd9cHeNCAnRISdqEbCXYFdJGvvC
	BNDkLjMH8PWs/96vlv8TKFcZbgtD8IHAGn6+BhSPw7Jdr6djhGZPYdCYdIGKBzWYJx9doBKsPDSeq
	WVx6HPf141/9zyJ2Wmjf7HW8OAJKIXySYWw8GK5EDYy6sN4Af7hEm3ildfvqtxvpkFh+yhR/la2R8
	7GKQSUqeaf+JuzSEhIIaXeaykztx5VQpgkHWHkznPXx0M5Sldm+RdwjkPFGbSvbvWzXUS1A7we9uc
	LcFMdoRPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kekBR-0006Vq-8v; Mon, 16 Nov 2020 19:29:01 +0000
Received: from [2601:1c0:6280:3f0::990e] (helo=dragon.site)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kekBP-0006V2-LK; Mon, 16 Nov 2020 19:28:59 +0000
Subject: Re: [PATCH] compiler.h: Fix barrier_data() on clang
To: Andreas Schwab <schwab@linux-m68k.org>
References: <20201014212631.207844-1-nivedita@alum.mit.edu>
 <87sg999ot0.fsf@igel.home>
 <0dbaca2d-9ad0-8c1a-a280-97be01cac2bd@infradead.org>
 <87k0ul9msr.fsf@igel.home>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3fff1eb9-83c0-1c29-6f57-fa50f1ec6ee7@infradead.org>
Date: Mon, 16 Nov 2020 11:28:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87k0ul9msr.fsf@igel.home>
Content-Language: en-US
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Arvind Sankar <nivedita@alum.mit.edu>,
 Nathan Chancellor <natechancellor@gmail.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/16/20 10:30 AM, Andreas Schwab wrote:
> On Nov 16 2020, Randy Dunlap wrote:
> 
>> What kernel version are you building?
> 
> 5.10-rc4
> 
> Andreas.

OK, thanks.

My build machine is slow, but I have a patch that I am testing:

---
From: Randy Dunlap <rdunlap@infradead.org>

riscv's <vdso/processor.h> uses barrier() so it should
#include <asm/barrier.h> to prevent build errors.

Reported-by: Andreas Schwab <schwab@linux-m68k.org>
---
  arch/riscv/include/asm/vdso/processor.h |    2 ++
  1 file changed, 2 insertions(+)

--- lnx-510-rc4.orig/arch/riscv/include/asm/vdso/processor.h
+++ lnx-510-rc4/arch/riscv/include/asm/vdso/processor.h
@@ -4,6 +4,8 @@

  #ifndef __ASSEMBLY__

+#include <asm/barrier.h>
+
  static inline void cpu_relax(void)
  {
  #ifdef __riscv_muldiv






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
