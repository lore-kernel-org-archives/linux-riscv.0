Return-Path: <SRS0=FwEc=FV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E23CC4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 08:53:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EB752389B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 08:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EB752389B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YWHSkT1wOtiRo2nlvJN+c2IxdHwio9ft/FGxxKGQbKc=; b=RxehLb0ohrAvJNBSlZQfsCcX4
	E0nBacjq+TgzaBEWfImmUxdzZ8wtZYmuGe6tP8LOwhgyRMKExmwjvuHytfvOc5jelV2mtLgySCrox
	TF/KRodnVho+fKIWbKdrVq8vyY2dnsmlPeUZLxNlk4P8Hkh0Gc1hw7ID/PbENX3OevCF6TeDTRflK
	7yz7nGQ71B6PbQyUNzI2nOEuXL7erH55KyfCSp5uGonVQ1E8opK1hR9oL9XBvg8Qm4Lc3U8z9CI5w
	E2ASMxnuiGK8p+mKBOSjtzKaVLFH33j+SI8N/yB9Iz4cImNYwrPnKy8dvMqk1/aMw/AorJg2NC3mq
	QSmvzTRLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpp2R-0006T5-8K; Thu, 17 Dec 2020 08:53:31 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpp2O-0006S7-K5
 for linux-riscv@lists.infradead.org; Thu, 17 Dec 2020 08:53:29 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id t13so25055689ybq.7
 for <linux-riscv@lists.infradead.org>; Thu, 17 Dec 2020 00:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jl8kFReN3xlQEVNrxs/A2c7FLmN/hmcFGpm4h9sxYP8=;
 b=hJ3bHMmCImusNFvOIXd8Uyu8m1+AbWrG9BQv+vn0WA0G/hmKyxwht8OYy205ytn+WU
 pxsifaLDB57CtA/PRsmaVfdygYmeJCV6Ma4N9zb+0PhBPlx3bA2Jff86OjvNIGMlNRTf
 1sDhwZe9sWe7zGnY3YSEdzrIq07n1H26i35kNrbqowqrASVLSQ7V1AYzseLQFAGSi3Qz
 mZRU/g87QQBy1FE4yxWOwaFxhhlMPfi5m1vWw4veX8IniNvrwhXVfRHGZuTOsXRsY1IJ
 PHT2lo/t2/s8I59KVNbL/YxqYFYalpn7kBDUf30ayDEXnOOgt4JUyJRxLPMH1BtWZQxz
 RU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jl8kFReN3xlQEVNrxs/A2c7FLmN/hmcFGpm4h9sxYP8=;
 b=h/PuYihgykw/5cRdpoz6TcvL9Isqkav3GmL4kXCOW2Ub0cRUiLheO2iyB/J39caETm
 TYuXW1IiZ/Ahd3VzSqRoKN889Y8It5sFgSD8KNQmkDZ8o5Pz64xG5IvE76MKne02b3lD
 9LNEmAIG/UHnz2/zV/fo5c2RhpVARgYuAUzw8uUNHkD9JrrtMeXerJI5b+v9BcLoUQZM
 2r7EmOW5w3cCc7OEW7+RAaoXJdSx2Ok5UJehVVTRWJp7PD6OhVEicX/zL3y8R3930WhA
 oDQYfG0d8TsWtCkYUaStLMBrMzshE433sYG/an+2bCo1bLzy3g+7Nb0SjVoF32F+E+SP
 Mcwg==
X-Gm-Message-State: AOAM5325wo8xxgI63wf2a3JdssvjF7LjRwb0GNAXxFmoC51u+Abh5xsN
 6AniykNMf0goHTvr0JEx/f4GXzZ8NmW1kJPkGEI=
X-Google-Smtp-Source: ABdhPJy7OcJJb/8ON4fVb9DXuTUtW638/7SfECwc3GsnZrqj2EMDfvOF68paNQHgObns0xj3oJ7yt6aT34z7PadgF4U=
X-Received: by 2002:a25:4d7:: with SMTP id 206mr34066987ybe.306.1608195206859; 
 Thu, 17 Dec 2020 00:53:26 -0800 (PST)
MIME-Version: 1.0
References: <20201217074855.1948743-1-atish.patra@wdc.com>
 <CAEUhbmV-AirwmVDN9xWi8eLwH53PFdoc+eU3sKzosA19Xd36Ag@mail.gmail.com>
 <CAOnJCUJSKn-QNwKCcHXc+kYtuwFQE2qatnOtGfqTOG0_Jzt4og@mail.gmail.com>
In-Reply-To: <CAOnJCUJSKn-QNwKCcHXc+kYtuwFQE2qatnOtGfqTOG0_Jzt4og@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 17 Dec 2020 16:53:15 +0800
Message-ID: <CAEUhbmUXXH2P=jagTx88J86ec=C9eur9fkfGM=OdN7oqmD7W0g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Fix usage of memblock_enforce_memory_limit
To: Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_035328_688899_8261864F 
X-CRM114-Status: GOOD (  25.83  )
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

Hi Atish,

On Thu, Dec 17, 2020 at 4:43 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Thu, Dec 17, 2020 at 12:12 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Atish,
> >
> > On Thu, Dec 17, 2020 at 3:49 PM Atish Patra <atish.patra@wdc.com> wrote:
> > >
> > > memblock_enforce_memory_limit accepts the maximum memory size not the last
> > > address. Fix the function invocation correctly.
> > >
> > > Fixes: 1bd14a66ee52 ("RISC-V: Remove any memblock representing unusable memory area")
> > >
> > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > ---
> > >  arch/riscv/mm/init.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> >
> > Thank you for working on this.
> >
> > Tested with QEMU 5.2.0 on 32-bit 'virt' and 'sifive_u', with
> > fw_jump.bin used as the -bios.
>
> fw_dynamic should also work unless you are using more than 1G of memory.
> Linux kernel can only support 1G of memory for RV32. The current

I have always been using -m 2G for testing both 32-bit and 64-bit.
32-bit 'virt' with 2G memory boots the 32-bit kernel fine.

$ qemu-system-riscv32 -nographic -M virt -m 2G -smp 4 -kernel
arch/riscv/boot/Image -bios fw_jump.bin

> Kconfig is bit misleading and
> I will send a patch to update the description.
>
> However, kernel should be able to ignore any memory beyond what it can
> address and continue.
> I will investigate more.
>
> > 32-bit 'virt' boots, but 32-bit 'sifive_u' still does not boot, which
> > should be another issue because reverting the original 1bd14a66ee52 it
> > still does not help 'sifive_u'.
> >
>
> Are you using more than 1G of memory ? Let me know if the kernel boots
> if you use 1G.

Kernel does not boot with 1G memory on 32-bit 'sifive_u', either with
fw_jump.bin or fw_dynamic.bin.

$ qemu-system-riscv32 -nographic -M sifive_u -m 1G -smp 5 -kernel
arch/riscv/boot/Image -bios fw_jump.bin

>
> > Tested-by: Bin Meng <bin.meng@windriver.com>
> >
> > I believe the following tag should also be added and patch cc'ed to
> > stable-kernel:
> >
> > Reported-by: Bin Meng <bin.meng@windriver.com>
> > Cc: <stable@vger.kernel.org> # 5.10

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
