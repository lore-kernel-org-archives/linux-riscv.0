Return-Path: <SRS0=lSM2=ML=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32785C43143
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 29 Sep 2018 00:13:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 008882073F
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 29 Sep 2018 00:13:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L7I7sK6s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="VUZawglJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 008882073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=81n5TNhzjFvswFcD2MNsABDMoY+rYbjZxKqnWxxBdng=; b=L7I7sK6sSh2KelWd1IRdaAqXT
	wRYhm1nffCEtv+eyF6421WzA0Ewdl8LnIY781lFXr3n21IP9URKWwzBEMUa+05LT3vbMU7EIAn8AM
	G3KoqHv0P6Y2KTvxx9I6u1lL1v023QXECmrrVDYJhkyQt4crK7YF/EooxpVJhyp7PCjytBgQRxQE8
	llJ0OJIa4tN4SZ66kXmnRdl2FaGB+8t3kR1q4TJYvTRzw3QUCKaSf0pngoaHOwUTkg62LXiUXFK1n
	ysEh633wFeRITLwgS2F7eDZS3L+A6CC1uR3Ny96XQ4n5T0aX9RdxOcLlMfC9vtRVMlHL2NSgx6j6t
	vRkf+Z/yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g62tL-0005d7-8A; Sat, 29 Sep 2018 00:13:51 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g62tH-0005bt-Qa
 for linux-riscv@lists.infradead.org; Sat, 29 Sep 2018 00:13:49 +0000
Received: by mail-pf1-x443.google.com with SMTP id j26-v6so5309222pfi.10
 for <linux-riscv@lists.infradead.org>; Fri, 28 Sep 2018 17:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=V3PPVFuAw7d7GVOffOjIMLdLtbHfHXr85pTfXyiWsJg=;
 b=VUZawglJ9Gj9AWTj0MEcBfL4+GMk6ytyB2MixqEGPbO9t9Nxm93A44jNaMxkF8bp9L
 TsMcqN0qZAJO4Iwdl30YWMTVk2J7dCRZjW8cyRMfPshGQ0ozxf/vUOXp+005H/vMByNh
 KJItA7yuH2NvBUnYVhxpEM3quwzNlwg+qLQHyBvUpKKzGJpybcGq4bQQbxdTImU8n5BC
 x7C34AnT7YTF2CPfdxXn/nsIZ1++8ivl/V0/gND4+KCBRV56OYT6Qp4IVcn+jyYvGcwi
 okITfOEs9ExVx/cthmvWKlWpi9A7ymPDbSr9R0ubvieButxLdPZl3xaFUF0LHPghLmXI
 XNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=V3PPVFuAw7d7GVOffOjIMLdLtbHfHXr85pTfXyiWsJg=;
 b=O7sjc6gPwbV7/js/sy/YWRGXSHOuRq4RMzOd0i2E7VuWCHIpnrZg28tN/2UV1aIuW0
 iekylbdrR1SrZ3GMgNfyQK4L4GvUKvCDv+7VjKVJ+kX/xmiLPP3AR1Ld/vCF3N49ACRe
 SPPhI7hBUnd4fM2/4IfKj7CRHstglvbpcRnut0JyncChUYIhPYPQrobdvjk/qyyildM3
 oyypTTh8ulwIsUTw+Eg1ThzXtgK3ojwUtCK33J8I0BzdvFVmrGN01Md3/KaouWdl5Twb
 XL03V/KIM5fLh6/rMoOVADy1lKcmSzTpgB3RIH1zeRo08U49SDh/pRWGVy9xxZvgPS3z
 EbjA==
X-Gm-Message-State: ABuFfohUrrlRklIpvb4oJJYKeZg2aeqe75T2f6LIG2Um1xEOpYVu89pA
 +un4SiODeOikWkyM5xpEnXnxwrbpG7I=
X-Google-Smtp-Source: ACcGV63NVV+yR4S4LDI1GihzPGBOsTwQ4RXn4GpF0EqVOM6I+J9wlsLXCj5WlzJar6sTzy/srx08zA==
X-Received: by 2002:a62:11cb:: with SMTP id 72-v6mr900671pfr.120.1538180016459; 
 Fri, 28 Sep 2018 17:13:36 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id q26-v6sm9309503pfj.127.2018.09.28.17.13.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Sep 2018 17:13:34 -0700 (PDT)
Date: Fri, 28 Sep 2018 17:13:34 -0700 (PDT)
X-Google-Original-Date: Fri, 28 Sep 2018 17:13:19 PDT (-0700)
Subject: Re: [PATCH v5 00/12] SMP cleanup and new features
In-Reply-To: <1536863825-66808-1-git-send-email-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: atish.patra@wdc.com
Message-ID: <mhng-206c9841-0e02-4d09-8860-160c0d917c94@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180928_171347_901133_F0B48E34 
X-CRM114-Status: GOOD (  17.44  )
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
Cc: mark.rutland@arm.com, Damien.LeMoal@wdc.com, catalin.marinas@arm.com,
 jason@lakedaemon.net, ard.biesheuvel@linaro.org, marc.zyngier@arm.com,
 anup@brainfault.org, dmitriy@oss-tech.org, linux-kernel@vger.kernel.org,
 jeremy.linton@arm.com, Christoph Hellwig <hch@infradead.org>,
 atish.patra@wdc.com, schwab@linux-m68k.org,
 Greg KH <gregkh@linuxfoundation.org>, linux-riscv@lists.infradead.org,
 tglx@linutronix.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180929001334.9aKXq-Itu6ZqffETs0pagaIcGMNuLJcVjRMpxF8OixA@z>

On Thu, 13 Sep 2018 11:36:53 PDT (-0700), atish.patra@wdc.com wrote:
> This patch series has updated the assorted cleanup series by palmer.
> The original cleanup patch series can be found here.
> http://lists.infradead.org/pipermail/linux-riscv/2018-August/001232.html
>
> It also implemented decoupling linux logical CPU ids from hart id.
> Some of the work has been inspired from ARM64.
> Tested on QEMU & HighFive Unleashed board with/without SMP enabled.
>
> Both the patch series have been combined to avoid conflicts as a lot
> of common code is changed in both the series. I have mostly addressed
> review comments and fixed checkpatch errors from palmer's series.
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
> Anup Patel (1):
>   RISC-V: No need to pass scause as arg to do_IRQ()
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
>  arch/riscv/include/asm/smp.h       | 38 ++++++++++++-----
>  arch/riscv/include/asm/tlbflush.h  | 16 ++++++--
>  arch/riscv/kernel/cacheinfo.c      |  7 ----
>  arch/riscv/kernel/cpu.c            | 83 ++++++++++++++++++++++++++++++++------
>  arch/riscv/kernel/entry.S          |  1 -
>  arch/riscv/kernel/head.S           |  4 +-
>  arch/riscv/kernel/irq.c            |  4 +-
>  arch/riscv/kernel/setup.c          | 10 +++++
>  arch/riscv/kernel/smp.c            | 43 +++++++++++++++-----
>  arch/riscv/kernel/smpboot.c        | 46 ++++++++++++++-------
>  drivers/clocksource/riscv_timer.c  | 12 ++++--
>  drivers/irqchip/irq-sifive-plic.c  | 10 +++--
>  13 files changed, 207 insertions(+), 69 deletions(-)

I didn't look closely because I assume your cleanups are better than mine, and 
than you at least gave this a boot test to ensure I didn't do anything too 
stupid :)

I'm preparing our first meaningful for-next now, I'll drop this one in.

Thanks for taking this over!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
