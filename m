Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAF9CAC5B9
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Sep 2025 12:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EtfM3hV0UXLA7ZA5n+YIlfBCTyag36ew0PL/z+AR+C8=; b=iYpOPj7SGKmKc2
	qwZnwCZipx5XOzOg/pnT92oSbs/j+c3F/tWg8EP7SsyTkjkpBr5pR/+zQcKYs/s25mY35erCdG1Dm
	OdwSw+qDtyPGcVrbiTGDH4MrqmLNK851X8GO4oUCbRzxj8TS06SwNsQxgBDJsrHV6XnhREAn9YTih
	ezYOPufuP1lUov5lfMJa5veqbGo4AA9eD8nS6ma0VqRfvvK8RqAUykVXjUQabA097i3e8bG40KlNB
	SXtcCMhuO9BqAqd5RSIlDe2TodKizYlDk+jxvLYHCnKeIGgEZnGLFtnYmMa8gF1KxbYWny70e0oB3
	itFZ6cUOvVLWlWoc2nmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v27Lr-000000014B3-3tYb;
	Fri, 26 Sep 2025 12:15:03 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v27Lp-00000001467-0tOn
	for linux-riscv@lists.infradead.org;
	Fri, 26 Sep 2025 12:15:02 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758888883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nhDPg+3tDEf9MpUD75Uir8jON0jMqHC/BgN+drVu6Ik=;
	b=RT5BCGClk8eYNLsWrCT9NGMhUhGTFCT+g6BuEE/ZgSTz46KzxrFGrxf5rfbhKDlmDfZ2dF
	0ZS3KTcwV38r/I9xpofwrp6oDTVzXVb1vUNGtVC5atdEjQoMCLN+n17IHw1IKYK5tNyqjl
	PpsWxBxMWoXH4oPHzHMNzFAg/azXKAospDHtzCjy+vga4mDcDWhgimkYd1OvPRfnzspNID
	2Ze8EmQLtt7inp+OT80QkQZUC/jlS4Y1D19uQy1zaHa3NBESKAPm1UybMXTmNJKVjTNHb7
	XuUCnx4CzTfl++4zbRBP36czEvE8qfTZL5xpxLFdff+pfnHvbojif7ItbBMl6A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758888883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nhDPg+3tDEf9MpUD75Uir8jON0jMqHC/BgN+drVu6Ik=;
	b=qZ9RmACIatl+hYddkSm7Z/zYxpY3meldLubKjVCBj7S4i2twoQgOwyHOKFHWfdMdyRASsV
	T6yNn6QBRnHYPVCg==
To: Thomas Huth <thuth@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: Add kprobes KUnit test
In-Reply-To: <16b74b63-f223-4f0b-b6e5-31cea5e620b4@redhat.com>
References: <20250513151631.3520793-1-namcao@linutronix.de>
 <16b74b63-f223-4f0b-b6e5-31cea5e620b4@redhat.com>
Date: Fri, 26 Sep 2025 14:14:43 +0200
Message-ID: <87frc9h0lo.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_051501_401144_538F0DC5 
X-CRM114-Status: GOOD (  12.21  )
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

Thomas Huth <thuth@redhat.com> writes:

> On 13/05/2025 17.16, Nam Cao wrote:
>> Add KUnit test for riscv kprobes, mostly for simulated instructions. The
>> test install kprobes into multiple sample functions, and check that these
>> functions still return the expected magic value.
>> 
>> This test can detect some kprobe bugs reported in the past (in Link:).
>> 
>> Link: https://lore.kernel.org/linux-riscv/20241119111056.2554419-1-namcao@linutronix.de/
>> Link: https://lore.kernel.org/stable/c7e463c0-8cad-4f4e-addd-195c06b7b6de@iscas.ac.cn/
>> Link: https://lore.kernel.org/linux-riscv/20230829182500.61875-1-namcaov@gmail.com/
>> Signed-off-by: Nam Cao <namcao@linutronix.de>
>> ---
> ...
>> diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes.h b/arch/riscv/kernel/tests/kprobes/test-kprobes.h
>> new file mode 100644
>> index 000000000000..3886ab491ecb
>> --- /dev/null
>> +++ b/arch/riscv/kernel/tests/kprobes/test-kprobes.h
>> @@ -0,0 +1,24 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +#ifndef TEST_KPROBES_H
>> +#define TEST_KPROBES_H
>> +
>> +/*
>> + * The magic value that all the functions in the test_kprobes_functions array return. The test
>> + * installs kprobes into these functions, and verify that the functions still correctly return this
>> + * value.
>> + */
>> +#define KPROBE_TEST_MAGIC          0xcafebabe
>> +#define KPROBE_TEST_MAGIC_LOWER    0x0000babe
>> +#define KPROBE_TEST_MAGIC_UPPER    0xcafe0000
>> +
>> +#ifndef __ASSEMBLY__
>
> Could you maybe change that into "__ASSEMBLER__" instead of "__ASSEMBLY__" ? 
> I'm currently trying to get rid of the latter in the kernel sources, see: 
> https://lore.kernel.org/all/20250606070952.498274-1-thuth@redhat.com/

It's been applied, it's up to riscv's maintainers how we should do this.

I can send v3, or a follow-up patch.

Or riscv maintainers can also squash that change into this patch, or
into your patch.

I'm fine with any options.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
