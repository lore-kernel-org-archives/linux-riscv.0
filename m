Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F151C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 21:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=uDbCizkPjO95MXajnAwKP2yg/Jb0Hir2xe6fPfIAMWY=; b=T/C+6AlhUFsZ+J5t8kPyHElBff
	R/NJ9d8L+ZYtydchQTPVrZpUUY0pbAfY/eEfEHYz2wPaJETA8QQ4ghkAd1GHztTgL/SIhfTMwz3dv
	9gQusk9uFFiHv04VEBoCA6MAWRAoiLtq4DpuswTHdjsgVTVAYfQLISMMq2Qrk06KpukyKZbt97Y3x
	sdhN+1WnyUAFKCvfI6KqFZQ2euB+tnU7r8wJLdnm5J05Kq5Bp2d8u0Y+N8dTsv8NaEnMciB8ZDz7g
	IZLY/UrtXXZES5HBRRZv8t3cZKdehQv8Z6D9bm12/h157ktX+HJOJA/hlGkhGn9SzI/d4i8SDg1wo
	UJF9u4vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyfNL-00AK5N-3B;
	Thu, 02 Nov 2023 21:37:15 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyfNG-00AK4d-0c
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 21:37:14 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1f05247791fso583422fac.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 14:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1698961026; x=1699565826; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrItmnaGbsKiOelCJPIdQS2OSLahzR2PL+r+O6ih4CQ=;
        b=mqB/oCzJThoekW+8lZkx56ELiZk9/qjShx1kV673MJSHeOg99xoIpqyRgBPS0OX6xA
         oQTNrl1a7oJGEUr5n8UFyub/yt17cUa8+fpdytf1vy9h/+/3Eh7MWVFlC/T1tzDe0NUb
         UFNkFTi0IIo6DwjGcv2ryCl7ZAp9HpCGMqnxHZwKTNSgqEPaJBoFpH3LZEZkGU+Y69nl
         nZQxlhyNSaNGLhxvZOtHlwVR6zX8e0KM3SKo50EqRuUAB62kDKz/Z2J1v1h3t0xTy0qC
         XoUWmyUDUQZwhd4XV1aSrO7DKua26h3ZyJtYzqVtNWvmsg1MQWaAYKCiqI5blZzlYNOf
         INaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698961026; x=1699565826;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrItmnaGbsKiOelCJPIdQS2OSLahzR2PL+r+O6ih4CQ=;
        b=MZ6JRuHJd0tmrDU/E7wcnTdlCEum16011lCehHMpAyHEzNhcJjjRcRCYCT0tKnlR19
         pqtkBLrW9OvQYWUMLdQ84OH+T37cjC9Y8m1uHvFlSYoNqIM/ZpNDf2KpOfqMHu5OMgMX
         wutzScr5iBkn7rVkBNEjqGxkmzMR8ep2dmF9RyR3onNJJIJKbOYN2EpoAIp0Zl/iZwX1
         xQtjzu8TtA/rIxycyxJ85t4MsP+BMWaJ3zUmcHFxxCRVDnLLw4jue/2Jm4R71FPdIsUx
         TiHGK+a5spu0iHw5oxRjO93WAVgj7CAQeBhtJruP1nfyq45KquoKOi3q4fJtpbh5GDLy
         LKKg==
X-Gm-Message-State: AOJu0YyBA4C5u2GunLw9Jvfn2oLu5wzIgZDQV5JHrUN3OvL64hA2zTlT
	oDF73mKqgBNDxsciPRn5IoqM/4kYfoZYdhOlAs4=
X-Google-Smtp-Source: AGHT+IG93kBxUnh1lB5fEQUekx4Tv77fzj/fJFebnLIHqCIxsorcZ4sScCgUw2/JOAweTIvLu4VcUQ==
X-Received: by 2002:a05:6870:be8b:b0:1ef:ac8e:2833 with SMTP id nx11-20020a056870be8b00b001efac8e2833mr21640518oab.42.1698961026482;
        Thu, 02 Nov 2023 14:37:06 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id c4-20020a056870b28400b001efcb7b4717sm84011oao.53.2023.11.02.14.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 14:37:05 -0700 (PDT)
Date: Thu, 02 Nov 2023 14:37:05 -0700 (PDT)
X-Google-Original-Date: Thu, 02 Nov 2023 14:37:01 PDT (-0700)
Subject: Re: [PATCH RT v2 0/3] riscv: add PREEMPT_RT support
In-Reply-To: <20231102155423.SyuAibSe@linutronix.de>
CC: Conor Dooley <conor.dooley@microchip.com>, jszhang@kernel.org,
  tglx@linutronix.de, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, tobias.schaffner@siemens.com, Arnd Bergmann <arnd@arndb.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bigeasy@linutronix.de
Message-ID: <mhng-e4437055-dc5b-4105-859c-02297f54d0bd@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_143710_596785_4CBFFD1A 
X-CRM114-Status: GOOD (  15.75  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 02 Nov 2023 08:54:23 PDT (-0700), bigeasy@linutronix.de wrote:
> On 2023-11-02 12:31:15 [+0000], Conor Dooley wrote:
>> [    1.130384] BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
>> [    1.130418]
>> [    1.130414] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, name: swapper/1
>> [    1.130971] [<ffffffff80267d78>] __alloc_pages+0xac/0x1be
>> [    1.130978]   alloc_workqueue+0x96/0x6de
>> [    1.131005] [<ffffffff8000412a>] check_unaligned_access+0x34/0x336
>> [    1.131010]   kmem_cache_init_late+0x1c/0x36
>> [    1.131038] [<ffffffff80004660>] check_unaligned_access_nonboot_cpu+0x12/0x1a
>> [    1.131046]   start_kernel+0x204/0x7e6
>> [    1.131082] irq event stamp: 822
>> [    1.131071] [<ffffffff800fcba0>] __flush_smp_call_function_queue+0x1de/0x790
>> [    1.131093] hardirqs last  enabled at (821): [<ffffffff80bd75b0>] default_idle_call+0xfa/0x152
>> [    1.131111] [<ffffffff800fd3a0>] generic_smp_call_function_single_interrupt+0xe/0x1a
>> [    1.131124] hardirqs last disabled at (822): [<ffffffff80bd52a0>] do_irq+0x16/0xa6
>
> Without the patch check_unaligned_access_boot_cpu() ->
> check_unaligned_access() is okay. The SMP/IPI variant (the patch imho)
> is bad. There must be no memory allocation from IRQ-off region - the

Ya, sorry I didn't catch it.  I'm just going to drop Evan's patch, it'd 
missed the batch I was going to send tomorrow anyway.

> smp-function call in this case.
>
> Would it be okay if I delay it until this solved? If you have something,
> then I could apply the two patches plus the fixup for this.
>
> Sebastian
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
