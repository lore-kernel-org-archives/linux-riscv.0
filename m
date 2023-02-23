Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E93FC64ED8
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 08:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SvFE/KMndoePtgAHUpYuA60Po3MHkBvlSxIBMPa/HQo=; b=c1ViipIjDgS/lE
	5tURhL6WqdW9nYUnX5T6j5NWK112K9QM+DNN0T43j5SJLLVpga842x0pvcqQAaCOUwBpmu/tBp1N4
	ML4QL33etozu3N3Pnx+6bU2ei8Zls2Mba2Q2RCCa2UkyJYc6HuOocEI4JN6JcvmRbiq3TE0Nq/OO8
	tbRMlvmDQaY5RU9bIvubGmRxOFYNzOHKp6GKaPvANEbHmCTN4H48VEVnBVcW79wXtGQoaMl6Qc9/c
	/eYN2i7sny9tuT8/wmlu0uEWp4DB1mH+x8Qq9r/KG9sPyA5Nwpwe5DugoIJSz/i1iV9yEL5m5XNP9
	vbfvrB/IIxjMyOUgnGDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV6wc-00FXgJ-Ul; Thu, 23 Feb 2023 08:27:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV6wb-00FXfx-I3
	for linux-riscv@bombadil.infradead.org; Thu, 23 Feb 2023 08:27:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=R1GIMlyP5PmQ6SSQoioYTffHvrdpX2DoA1X1TWCwifQ=; b=jS9dsEsb5Fd/0eEkO0zUtow29J
	o5wgECtpniTBjdA+Vb0yrmQPVKc2v8KOZHZTyVVbtgyaibYrMJU9ZBpGg+TMVh/IkLkWabfplx+Br
	tmO+FrxbsBNroteuBOZUTbZjhfgxSlWczot+KzJ8kZnWY43ZtNv0Ky68OTsKb2/X19u8lNwemqdeF
	Qi/AsX8fwFYr1FQOZCQgKZb6AE2hl1rNf86uTdhXvbKb4/OVH47bpyQQYIgZoiQj1H7vm/tTzl+tb
	mU0rS+kkPKl6pIQBaFJHMsj2q3uf2YsceGb70dXOQw62BFBSp+goy/3u4Go25kRBviu5U49H+kC1o
	2X2QkhFA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV6wW-00ECNn-Jw; Thu, 23 Feb 2023 08:27:09 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 942BF30013F;
	Thu, 23 Feb 2023 09:27:07 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3025620831B67; Thu, 23 Feb 2023 09:27:07 +0100 (CET)
Date: Thu, 23 Feb 2023 09:27:07 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Atish Patra <atishp@atishpatra.org>
Cc: linux-perf-users@vger.kernel.org,
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	Beeman Strong <beeman@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: Perf event to counter mapping question
Message-ID: <Y/cjW8qVhRTPiz0t@hirez.programming.kicks-ass.net>
References: <CAOnJCUKHq_8msJtU-H1JvWJ8nY94J0tcarQMBsPNpBZO8sP6HQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCUKHq_8msJtU-H1JvWJ8nY94J0tcarQMBsPNpBZO8sP6HQ@mail.gmail.com>
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

On Wed, Feb 22, 2023 at 04:28:36PM -0800, Atish Patra wrote:

> AFAIK, ARM64 allows all-to-all mapping in pmuv3[1]. That makes life
> much easier. It just needs to pick the next available counter.
> On the other hand, x86 allows selective counter mapping which is
> discovered from the json file and maintained in per event
> constraints[4].

All the contraint management is done in kernel, and yes, it's a giant
pain in the rear side.

From what I understand the reason for these contraints is complexity of
implementation, less constraints is more 'wires' in the hardware.

With PMU use being ever more popular, we're seeing the x86 PMU move
towards less constraints -- although I don't think we'll ever get rid of
them :/

> 2. Mandate all-to-all mapping similar to ARM64.

If at all possible, I would strongly recommend taking this route. Yes,
the hardware people will complain, but newer x86 hardware having less,
or simpler, constraints might be sufficient to convince them.

(and if you do have to do contraints, please take a lesson from x86 and
 *never* allow overlapping contraints as AMD had, solving those
 constraints is not fun)

As you note, this is *much* simpler to program and virtualize.

> Note: This is only for programmable counters. If the platform supports
> any fixed counters (i.e. can monitor
> only a specific event), that needs to be provisioned via some other
> method. IIRC the fixed counters(apart from cycle) in ARM64 are part of
> AMU not PMU.

So free running counters are ideal and fairly simple to multiplex/use.

The moment you start adding overflow interrupts / filters and any other
complexities to fixed function counters it becomes a mess (look at the
x86 PMU again).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
