Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90037C64EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 19:40:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D89120666
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 19:40:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nb4cg7R9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="nl6b4mFH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D89120666
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=nvwoayi3N5Lq/7nt0p5QOZsx5lr9kIDVePQmkLdgarA=; b=Nb4cg7R9Mz9LlDHnTTLDaSeNz
	rfZgDGhlodN4PLFAgnkENz6WxWqw42fHj21yKeSo6mJOuolCO6MvLg+4B0VDNNQGdQ7TgqedWyJpO
	botuThDUmPCffcj+Q5MWFmrWpOUU21oB+QxEYo8GV3KvjJ61pQWK81toDMeU+sO6polVTw3/9lT45
	x+GO80lbRWIQ+hQZzThuly1FdKb4jT+FooV70Jmr50IsAIF9r2ixxWslCytPvT0c8n60mSYvuBbvZ
	9YgetiefTJPv5AcBPRBmFg7Hg/OmGW+uLJLbEjbkaJudg4dDVrZTfHMAXpx+eH782iyI9+volRd3I
	wTXyZumGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7QWt-0008Hc-OB; Tue, 02 Oct 2018 19:40:23 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7QWr-0007It-1e
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 19:40:22 +0000
Received: by mail-pf1-x444.google.com with SMTP id p12-v6so477643pfh.2
 for <linux-riscv@lists.infradead.org>; Tue, 02 Oct 2018 12:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=7suzKwatlHr9M7xGO4UQp1KUv/TEhtWrQAPSE+rrWZo=;
 b=nl6b4mFHsmqjSB4PwRcBn9itnYvHC/2M35mVZYfBwax5a+F23wBYnUZVzTV8xnXN62
 BxhZwaj/9+FhD3jH0nh9mC3hhwXkeezBz0B25TONHu7xKHcohvuvLddtMRZxbOC+gbYC
 DAUKkQgEQtydcQvzeSMRz6ZuxYNSf9Q/7PBCMqrQC0wt8nwa148rIWOc8TgBvqB+n/Lm
 PPSIgkZwTl1Kl+SrVUZDZbk5ZEGIT0EDKQPK2/t7Z/RaaIBJHKVNRMlzfykDe616uAIY
 QIUmvhIEpDqXK88iOParrKaGHvDaJ7eeGf5VpMhigfyS8fRQezdldXeu/pY+cexYvnXY
 my5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=7suzKwatlHr9M7xGO4UQp1KUv/TEhtWrQAPSE+rrWZo=;
 b=GMUhOx7FT55Uyei8ry/HBvt/WUusfZAF+2zXZI5CxHDIrnEwHtCCtnC/wJru7819BK
 pVpbjjlz7ni4yDRtvFAv/4vjpyukg9SIYMya+cAhYaEzzv4KLhu+6IVp+KUOqFK4k6MD
 8TQHUqV3sKDzJsZGOzxe5/dxDNwM+k4/0iykDBZ5xH/BHr9/S6LmpLksGu2UisBuWAzd
 vgEGcSfKuCEQUmkKtbUHZw5KOCQVO5zjysJ/2S5HGyUhwarb8qKT0LuyIs9dBM+ujA/J
 0LnyJfHu8UeYoD7AyAkcZxNdOAJniY3Cqr/tZarrycZPI2zZj1WZtuWkLaQMHTtktsyj
 Kpog==
X-Gm-Message-State: ABuFfohkPPX9JWAauskpV+W4BC1CJUNHWXfAPXkAZ8272myUzWg9bGFe
 Pk39j5SnxmG3HjTFGUIrRqozHEeqBaA=
X-Google-Smtp-Source: ACcGV60DG3p4q1e9+vHezqEx8qPhpkDsWN13OR3K/n8Etiis/upaZdwzs7trGQy0AeThkICwCwg9DQ==
X-Received: by 2002:a65:4849:: with SMTP id
 i9-v6mr15341070pgs.350.1538509209554; 
 Tue, 02 Oct 2018 12:40:09 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 64-v6sm7681043pfq.10.2018.10.02.12.40.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Oct 2018 12:40:08 -0700 (PDT)
Date: Tue, 02 Oct 2018 12:40:08 -0700 (PDT)
X-Google-Original-Date: Tue, 02 Oct 2018 12:39:57 PDT (-0700)
Subject: Re: [PATCH v6 00/14] SMP cleanup and new features
In-Reply-To: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: atish.patra@wdc.com
Message-ID: <mhng-d52d60ae-732e-4252-9258-21ea6bed8a31@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_124021_092910_A297F085 
X-CRM114-Status: GOOD (  16.23  )
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
Cc: Christoph Hellwig <hch@infradead.org>, anup@brainfault.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 atish.patra@wdc.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181002194008.vShOJI6ZgyiOPuVXjfNTp0rUQk8Ikw0HavK2_Ap6d70@z>

On Tue, 02 Oct 2018 12:14:53 PDT (-0700), atish.patra@wdc.com wrote:
> This patch series now has evolved to contain several related changes.
>
> 1. Updated the assorted cleanup series by palmer.
> The original cleanup patch series can be found here.
> http://lists.infradead.org/pipermail/linux-riscv/2018-August/001232.html
>
> 2. Implemented decoupling linux logical CPU ids from hart id.
> Some of the work has been inspired from ARM64.
> Tested on QEMU & HighFive Unleashed board with/without SMP enabled.
>
> 3. Included Anup's cleanup and IPI stat patch.
>
> All the patch series have been combined to avoid conflicts as a lot
> of common code is changed different patch sets. I have mostly addressed
> review comments and fixed checkpatch errors from palmer's and anup's series.
>
> v1->v2:
>
> 1. Dropped cpu_ops patch.
> 2. Moved back IRQ cause definitions to irq.h
> 3. Keep boot CPU hart id and assign zero as the CPU id for boot CPU.
> 4. Renamed CPU id and hart id correctly.
>
> v2-v3:
>
> 1. Added cleanup patches from palmer.
> 2. Moved the hotplug related functions to it's own file.
> 3. Updated stub functions as per coding guidelines.
> 4. Renamed __cpu_logical_map to a more coherent name.
>
> v3-v4:
>
> 1. Addressed minor typos in commit text and code.
> 2. Included Anup's do_IRQ patch.
> 3. Dropped CPU hotplug patch. As there are some concerns
>    about approach, I will submit it separately.
>
> v4->v5:
>
> 1. Minor typo fixes in commit text.
>
> v5->v6:
> 1. Included Anup's IPI stat and cpuinfo patch.
> 2. Fixed a typo cpuid_to_hardid_map->cpuid_to_hartid_map
>
>
> Anup Patel (3):
>   RISC-V: No need to pass scause as arg to do_IRQ()
>   RISC-V: Show CPU ID and Hart ID separately in /proc/cpuinfo
>   RISC-V: Show IPI stats
>
> Atish Patra (4):
>   RISC-V: Disable preemption before enabling interrupts
>   RISC-V: Use WRITE_ONCE instead of direct access
>   RISC-V: Add logical CPU indexing for RISC-V
>   RISC-V: Use Linux logical CPU number instead of hartid
>
> Palmer Dabbelt (7):
>   RISC-V: Don't set cacheinfo.{physical_line_partition,attributes}
>   RISC-V: Filter ISA and MMU values in cpuinfo
>   RISC-V: Comment on the TLB flush in smp_callin()
>   RISC-V: Provide a cleaner raw_smp_processor_id()
>   RISC-V: Rename riscv_of_processor_hart to riscv_of_processor_hartid
>   RISC-V: Rename im_okay_therefore_i_am to found_boot_cpu
>   RISC-V: Use mmgrab()
>
>  arch/riscv/include/asm/processor.h |  2 +-
>  arch/riscv/include/asm/smp.h       | 47 +++++++++++++++-----
>  arch/riscv/include/asm/tlbflush.h  | 16 +++++--
>  arch/riscv/kernel/cacheinfo.c      |  7 ---
>  arch/riscv/kernel/cpu.c            | 87 ++++++++++++++++++++++++++++++++------
>  arch/riscv/kernel/entry.S          |  1 -
>  arch/riscv/kernel/head.S           |  4 +-
>  arch/riscv/kernel/irq.c            | 12 +++++-
>  arch/riscv/kernel/setup.c          | 10 +++++
>  arch/riscv/kernel/smp.c            | 82 ++++++++++++++++++++++++++++-------
>  arch/riscv/kernel/smpboot.c        | 46 ++++++++++++++------
>  drivers/clocksource/riscv_timer.c  | 12 ++++--
>  drivers/irqchip/irq-sifive-plic.c  | 10 +++--
>  13 files changed, 259 insertions(+), 77 deletions(-)

These are on my "next-smp" branch, and will land in for-next as soon as it's 
done regenerating.  I've replaced the "next-cleanups" branch.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
