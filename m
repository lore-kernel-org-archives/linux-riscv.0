Return-Path: <SRS0=cI7w=RZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E2AC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 17:57:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBF632083D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 17:57:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J7WBE1RZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="VNCrfHoM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBF632083D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yIuf/GabuGWy58vcBUrBE8JBfAbEPFLy1eOxCjO02/c=; b=J7WBE1RZH9qI0w
	KO79VTzQGPFbl5QhfsV1/xjsSLm88vt4bDLCimzWzCoPcOQYMvAL1kxnNT3h1bEBseaCgzjUZtm48
	sQMCKODcQ7lMAFAcjtUYHQMvVTOp7qeCwXooZO6ORoEE4TFDSv8pNupjHPKcdu9rge3kM1+ImT2F6
	dC1KHxLsy7PYOcOec5mSCG/WD5ZLmaV/lk1IpGFGbAK8G9dNOWE03p77HwiEX+65UVrLIspIZ5C/k
	Y8bvPNeG6QdcwfRKpaPGNx5bpjtQXEuWKK8AzStBzOQAxoEXbZgk42JPptQSwHMEllv3ghjXV3ZyY
	jPUEWuUNZtQmsysebPMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7OQF-0001Ih-2C; Fri, 22 Mar 2019 17:57:39 +0000
Received: from a9-35.smtp-out.amazonses.com ([54.240.9.35])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7OQ6-0001Bu-JQ; Fri, 22 Mar 2019 17:57:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1553277446;
 h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type:Feedback-ID;
 bh=GouClBECLF+w+1HvqycKZrpAxUSsAMpAs6Lksc3P9O4=;
 b=VNCrfHoMDWPoL88ZDaTw1dPUwRg3YTdkcF2jkdtyeC51KQ5zlWRrBrCQI20zIfNq
 wheFAy8Op2jv68plbB9LWGiWzegW99u595MzmInaw6Q+YbqeExzr5RhzhlJJvM6gGWn
 kAlj4nmk9tYe++BGH0KFSRNNRM9iwewSrTJW8VsE=
Date: Fri, 22 Mar 2019 17:57:26 +0000
From: Christopher Lameter <cl@linux.com>
X-X-Sender: cl@nuc-kabylake
To: Nick Kossifidis <mick@ics.forth.gr>
Subject: Re: per-cpu thoughts
In-Reply-To: <06e2cd9f9dbaf01fec2f910ebb402c2d@mailhost.ics.forth.gr>
Message-ID: <01000169a68cea72-85bd9098-c9c7-4003-a0d9-3bf70964f098-000000@email.amazonses.com>
References: <CAJ+HfNgSx49dRXDdJGovb=auAjSB703bN9tULjibW1OKHuHcPg@mail.gmail.com>
 <mhng-79f13983-1ea9-4f9a-949a-87dac2060f42@palmer-si-x1c4>
 <CAJ+HfNhmUdz4y81VNnTOsvyvSNw3i3E=qR+F0Qa7XThSOAiJ1A@mail.gmail.com>
 <010001696d414b3a-d35fa0a2-01fa-4e8c-be57-ff703610755a-000000@email.amazonses.com>
 <CAJ+HfNh6bc1A8vskxqJ9CP11aPdTgrPS2SOgLGXMLyefogFLtw@mail.gmail.com>
 <alpine.DEB.2.21.9999.1903110814130.11892@viisi.sifive.com>
 <06e2cd9f9dbaf01fec2f910ebb402c2d@mailhost.ics.forth.gr>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-SES-Outgoing: 2019.03.22-54.240.9.35
Feedback-ID: 1.us-east-1.fQZZZ0Xtj2+TD7V5apTT/NrT6QKuPgzCT/IC7XYgDKI=:AmazonSES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_105730_711721_CB5EEC61 
X-CRM114-Status: UNSURE (   6.98  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Paul Walmsley <paul@pwsan.com>, catalin.marinas@arm.com,
 =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>, will.deacon@arm.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 22 Mar 2019, Nick Kossifidis wrote:

> But keep in mind that 'irqs disabled' is a fundamentally unsafe way of
> disabling preemption - any cond_resched() or cond_resched_lock() might trigger
> a reschedule if the preempt count is 0. A simple printk() might trigger a
> reschedule. So use this implicit preemption-disabling property only if you
> know that the affected codepath does not do any of this. Best policy is to use
> this only for small, atomic code that you wrote and which calls no complex
> functions."

Really? Preemption tracks hardirq status if you use the kernel provided
way to disabling and enabling interrupts. See

linux/include/preempt.h:

/*
 * We put the hardirq and softirq counter into the preemption
 * counter. The bitmask has the following meaning:
 *
 * - bits 0-7 are the preemption count (max preemption depth: 256)
 * - bits 8-15 are the softirq count (max # of softirqs: 256)
 *
 * The hardirq count could in theory be the same as the number of
 * interrupts in the system, but we run all interrupt handlers with
 * interrupts disabled, so we cannot have nesting interrupts. Though
 * there are a few palaeontologic drivers which reenable interrupts in
 * the handler, so we need more than one bit here.
 *
 *         PREEMPT_MASK:        0x000000ff
 *         SOFTIRQ_MASK:        0x0000ff00
 *         HARDIRQ_MASK:        0x000f0000
 *             NMI_MASK:        0x00100000
 * PREEMPT_NEED_RESCHED:        0x80000000
 */
#define PREEMPT_BITS    8
#define SOFTIRQ_BITS    8
#define HARDIRQ_BITS    4
#define NMI_BITS        1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
