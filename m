Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197DFC77B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 16:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Usr7vgyDA5LLeD1Wkia1bLNjnyocwzt5FYFK9PMuH9M=; b=kEEB7WkwYvAbp6
	8soKS0oiMznw+mFCyyjzxhTdjDCvz4OgvjiwxjpDZjMMujbAKMeSQbd3+Y7+cjG5qQ32dUs820qrM
	g5zDuA4JVhLyBuNlobH1pWhKp1vDAaqs/4IgN0OOLZU8FWnhammtnedM7INxEViMRgWb2tvPxTUeG
	LnJ2kxVMHDsXo4r+bRQ4IFj4VCN/5JxC/zh6C0G8+1kuHvjrCBLMB/57H1qWt0nJqYWcdcoYZqSSX
	eebFFjwDuthv9Ugsh2wcPbkWbGD5ouALh+WGV8HI+DQ3Ax/OJ4ySMSMcmzw7+OCP5QTfBfM09ZkQ8
	xCpIChU3fAj3qCz47OzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU64e-00000006DEO-2DLG;
	Tue, 24 Jun 2025 16:00:40 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4Yz-00000005tbf-3rf5
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 14:23:55 +0000
Date: Tue, 24 Jun 2025 16:23:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750775032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lrpSBL/DLIzI8Jp1GABlBZa1QLU8cOGFC43YvRyDTwg=;
	b=ki3e8wtCd9SJ7t9BIbk/33RI2H3L4u1EgoQsMqDtqMTIucEh+FwvCt6HLpzmcgpfiQk2LK
	9ZIWfpRTRuthrnt+vbLsy9Bm8osVRcZ0sKoVpCiN2+o0gCrwELuoU2JwEgQEx/LOxXbTSd
	b9f+NTbWKejtUmZVGDhIV7Dkw9MbMlwPCFISMIvS/k5ErRAHRN3q1yT1EPYWVqa3M7rUTX
	qnrtAVkJeMkr88US/gVcQb2bq4tGi45elRV+1UrugGKc+OeBDiDwCs01YwKw/JBjkG1fNV
	0wyUbsTRfFDhlwQUZewhAT9FNC4SkCyzdD5A9/0pa5zxYKSs0bJYk4+z1zCsNw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750775032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lrpSBL/DLIzI8Jp1GABlBZa1QLU8cOGFC43YvRyDTwg=;
	b=+Ox1q9upvHIs+HqG0mecMSWkZTr4CpN8Ir6qcIVFg6RmjyCmJcl5BucqBcplFnhDne/GxY
	/krpYf0/y4Tu7cCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
	Nam Cao <namcao@linutronix.de>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	Alexandre Ghiti <alex@ghiti.fr>, clrkwllms@kernel.org,
	rostedt@goodmis.org, linux-rt-devel@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Enable interrupt during exception handling
Message-ID: <20250624142350.xZ_DdClH@linutronix.de>
References: <mhng-60581B88-6FC7-4349-96B6-730D908ABF4A@palmerdabbelt-mac>
 <alpine.DEB.2.21.2506240303170.61655@angie.orcam.me.uk>
 <19cf2371-7293-4e71-a17d-669db4c8270a@rivosinc.com>
 <20250624131730.XqPd1HUR@linutronix.de>
 <d135d6cc-5117-4b3a-9abe-2e5fd9e3e490@rivosinc.com>
 <20250624140815.GU1613200@noisy.programming.kicks-ass.net>
 <20250624141130.gZVv4WnP@linutronix.de>
 <20250624141801.GV1613200@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250624141801.GV1613200@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_072354_173995_40F0D243 
X-CRM114-Status: UNSURE (   4.17  )
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

On 2025-06-24 16:18:01 [+0200], Peter Zijlstra wrote:
> I'm confused, sending signals is for exception from userspace. That has
> nothing to do with exceptions from kernelspace being NMI like.

Yes. See the original submission
	https://lore.kernel.org/linux-riscv/20250620114346.1740512-1-namcao@linutronix.de/

Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
