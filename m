Return-Path: <SRS0=FwEc=FV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18FC2C4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 08:44:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C547D23715
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 08:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C547D23715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c6+bMDIt8+Usrvl7omq78WAdwIq+0ci8aHr0+LFLnps=; b=jUSg1Xbl5M+I/9FqesAsiaghT
	da4kM3DLYWJzZYUmF+36jAgsdV3vWDhXtn4jotvCT748lp3A2LmG/cyRPi4y6jBvo5yYvifAE6r01
	lbYgEHcjGordGvhXqMa/JDlL61i6Ou7nlwGAfwAoqeqYJBvDEGdEb33/hq9BGJWzg7XkU82JoDq34
	KHB84DoK9u/hG47RxnhIcrhAySUAZsDHczAC9EvQbcBU3ueTAB4Ye+eXM0ydv3Ga4eseYEI7+PRKy
	MfN+v45c+BWCdhVvLCHSB7o/C6fa2CPSO3eRR4B431pnObpSgITDoB3+4vW7Wwv5q4B1X5KWpolyy
	B9aK/KBGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpot7-0005LA-Nt; Thu, 17 Dec 2020 08:43:53 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpot5-0005IN-1c
 for linux-riscv@lists.infradead.org; Thu, 17 Dec 2020 08:43:51 +0000
Received: by mail-il1-x136.google.com with SMTP id g1so25159714ilk.7
 for <linux-riscv@lists.infradead.org>; Thu, 17 Dec 2020 00:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UyvM0JTI1ydl5VSsasQuRjR8gmnzoIsqUBzYnVc9TT4=;
 b=DhBrBRowc9Z5HNcivJKgo5Rgre54UgzfTuKotHhpYXeHMfLn/rSA6EWV22SH84v1Au
 G8H2yxl6OMBVCvcSb1o6KoKt7WWxlqZBmsxvIVA0nrcPm20JiGHJzZXEPt9IwlF4z+mx
 Pb5kzGLNCjg2bLlDY2NTZcdtfAc61ZNxfiUXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UyvM0JTI1ydl5VSsasQuRjR8gmnzoIsqUBzYnVc9TT4=;
 b=gBro5XoOnCMAiiFknowgBUDpohsOWlQYH6SWiqg+oqGQM2OBIUduuGNZ6uRpKbzPoT
 UEBd3OimmAu1mPmlyJmFzJCStdh46AHAyD0rJc8a/EyN/Htee6du1wakpM2QfJMkf2wN
 J2Fvfn0Xdb1CEUmKjbDC+E8zU2Tw/A2o0F2AGnOCjNN+At66LQZhRmyaP95WZn0WYceG
 LPFw50xCNXnznvkclIjOdK+KB+hANJaesgiSrI4RqXYzdXWU1jwgJxtSNO89lL+wjOEZ
 NtQbuGDdETPX0Pi+B7BcFBwOckSwwSw8HOjgi8Gl3Hyq84mSw0T7egDPTDvAyX8lQ/YX
 DqHw==
X-Gm-Message-State: AOAM532jsYHgLxI5lh42JwJEEm1jYUXLx4SuNyxdy+9aYRXYnABcNn1v
 Ay1dohutci8/FUg514G/TJhRD1h7NIHsN2QcPvmV
X-Google-Smtp-Source: ABdhPJy89vpEbfhvusOQEEUbjElFUDT8Yr3qx6v/ayUMzdxTaapyCNKahoiHA8EKbt1mYqkk6bBjHQk9hLVRf7+bJ2U=
X-Received: by 2002:a92:d84a:: with SMTP id h10mr47862427ilq.77.1608194628256; 
 Thu, 17 Dec 2020 00:43:48 -0800 (PST)
MIME-Version: 1.0
References: <20201217074855.1948743-1-atish.patra@wdc.com>
 <CAEUhbmV-AirwmVDN9xWi8eLwH53PFdoc+eU3sKzosA19Xd36Ag@mail.gmail.com>
In-Reply-To: <CAEUhbmV-AirwmVDN9xWi8eLwH53PFdoc+eU3sKzosA19Xd36Ag@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 17 Dec 2020 00:43:37 -0800
Message-ID: <CAOnJCUJSKn-QNwKCcHXc+kYtuwFQE2qatnOtGfqTOG0_Jzt4og@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Fix usage of memblock_enforce_memory_limit
To: Bin Meng <bmeng.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_034351_146682_B517A1A4 
X-CRM114-Status: GOOD (  22.50  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 17, 2020 at 12:12 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Atish,
>
> On Thu, Dec 17, 2020 at 3:49 PM Atish Patra <atish.patra@wdc.com> wrote:
> >
> > memblock_enforce_memory_limit accepts the maximum memory size not the last
> > address. Fix the function invocation correctly.
> >
> > Fixes: 1bd14a66ee52 ("RISC-V: Remove any memblock representing unusable memory area")
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  arch/riscv/mm/init.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
>
> Thank you for working on this.
>
> Tested with QEMU 5.2.0 on 32-bit 'virt' and 'sifive_u', with
> fw_jump.bin used as the -bios.

fw_dynamic should also work unless you are using more than 1G of memory.
Linux kernel can only support 1G of memory for RV32. The current
Kconfig is bit misleading and
I will send a patch to update the description.

However, kernel should be able to ignore any memory beyond what it can
address and continue.
I will investigate more.

> 32-bit 'virt' boots, but 32-bit 'sifive_u' still does not boot, which
> should be another issue because reverting the original 1bd14a66ee52 it
> still does not help 'sifive_u'.
>

Are you using more than 1G of memory ? Let me know if the kernel boots
if you use 1G.

> Tested-by: Bin Meng <bin.meng@windriver.com>
>
> I believe the following tag should also be added and patch cc'ed to
> stable-kernel:
>
> Reported-by: Bin Meng <bin.meng@windriver.com>
> Cc: <stable@vger.kernel.org> # 5.10
>
> Regards,
> Bin
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
