Return-Path: <SRS0=FwEc=FV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98D8C4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 23:44:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B51F22511
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 23:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B51F22511
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iXuxsuR9ir7dNYQHEiG6f4A41ihsvz1jSSGQtFBVkhw=; b=LppF7UZQZX1e9V2Co81FqJKyh
	zD1kfVS+QvXjP6qU9rMauk66zu5Quq/vWD8QIRWsZuw+X9RFW+xsIdGIkCktt508LFAWzv3H7YWGK
	gDD7emXTWbHzg6Me/jr4iylgPck0BVT5ImxwfWBWeT/WA2mI9cQ9dO2Rpp9j8ZBV844ghaSF+zNZo
	9RKJIhkGa1sby0eHav0P/o8YhoyX3yfmGKMwHJlXHnc4E+P0mCN2FaS3966EOFXSxkLghY8IBkhSt
	nncAC5K4xZxK0mOYT1v0LVgiNwgenZdOXlWk2oINYq3dzhX28uY5UEz9248vOjdUHL+kSpv2EyxkB
	iBFhoPieQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kq2wj-0007dq-9N; Thu, 17 Dec 2020 23:44:33 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kq2wg-0007dV-7u
 for linux-riscv@lists.infradead.org; Thu, 17 Dec 2020 23:44:31 +0000
Received: by mail-io1-xd35.google.com with SMTP id 81so333573ioc.13
 for <linux-riscv@lists.infradead.org>; Thu, 17 Dec 2020 15:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YEsoTw48HMH8u6aKM5ZpQGVmiSJ4UnL8pOP47zgvLqg=;
 b=AIS4fbcrDeyed9MR+yN2RrrrnUxX9oiei4nj/N9mZ4k332HAQBBeKxZQ2t6Phuhqji
 JTUeuxE7UwMIi4tMkfeHX1gl8RBiuU4vYPe7Kgqd84BwrrX2J1IPSI7LKg0+cwmt7e6Q
 0nmYSu2TD6tpiGu6AUoTRb9Xsyt8+XdYqe8XU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YEsoTw48HMH8u6aKM5ZpQGVmiSJ4UnL8pOP47zgvLqg=;
 b=bMcXQOQGSEBv491DcSWBNkvza7xt3qk06BIMCaHzK7dz/zoirNuzi1dKNUPDWF7SUN
 bNQzybHVKmk+2Qb9QXzZ2BTzu15V0M1cmrYL9Rs3h1/x4B7fvZ88Yw+UBqxUTTVrD/EJ
 P/oUwfI0xGDWdDhcIImfl8hfLgEDDnyniDzUedoZljbXNCUQD2xfcgfgMuwIQ90WbS6l
 9GvvonzRBqCN4B59ixINuk8hSks5+a5/Qiglk+1X2b+23U6+CE3DJViIQiMWGvKHYXib
 pUPALJC6rWbnqVgr5N3V1HSD+8ky328k3u+nPnrS006cDqb8kjZr7+qFw2K5SRPLgaBU
 dHsw==
X-Gm-Message-State: AOAM5315LAmRikx5FtdTKcBbnsnaYi+/KYnBSnoG9ifkXWsDT8EwAKfT
 En4HcwqFbogExWkVqjynZs7brVp96WUAHQpsUc+R
X-Google-Smtp-Source: ABdhPJxj1CDRaWz46oHY3Jchfo7ka+jUSepiJY1e2m3W1CRcmz+5I8hUc4CDF0PrQrRT7sznVrdT0Tr5pQOCXQETvRk=
X-Received: by 2002:a6b:2c52:: with SMTP id s79mr1494649ios.53.1608248668030; 
 Thu, 17 Dec 2020 15:44:28 -0800 (PST)
MIME-Version: 1.0
References: <20201217074855.1948743-1-atish.patra@wdc.com>
 <CAEUhbmV-AirwmVDN9xWi8eLwH53PFdoc+eU3sKzosA19Xd36Ag@mail.gmail.com>
 <CAOnJCUJSKn-QNwKCcHXc+kYtuwFQE2qatnOtGfqTOG0_Jzt4og@mail.gmail.com>
 <CAEUhbmUXXH2P=jagTx88J86ec=C9eur9fkfGM=OdN7oqmD7W0g@mail.gmail.com>
In-Reply-To: <CAEUhbmUXXH2P=jagTx88J86ec=C9eur9fkfGM=OdN7oqmD7W0g@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 17 Dec 2020 15:44:17 -0800
Message-ID: <CAOnJCUJJCSjCYfALAUXJoZbChi617Nd_Yeu6o4q_jyvoofQE3Q@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Fix usage of memblock_enforce_memory_limit
To: Bin Meng <bmeng.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_184430_482122_3FEF267A 
X-CRM114-Status: GOOD (  30.78  )
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

On Thu, Dec 17, 2020 at 12:53 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Atish,
>
> On Thu, Dec 17, 2020 at 4:43 PM Atish Patra <atishp@atishpatra.org> wrote:
> >
> > On Thu, Dec 17, 2020 at 12:12 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > Hi Atish,
> > >
> > > On Thu, Dec 17, 2020 at 3:49 PM Atish Patra <atish.patra@wdc.com> wrote:
> > > >
> > > > memblock_enforce_memory_limit accepts the maximum memory size not the last
> > > > address. Fix the function invocation correctly.
> > > >
> > > > Fixes: 1bd14a66ee52 ("RISC-V: Remove any memblock representing unusable memory area")
> > > >
> > > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > > ---
> > > >  arch/riscv/mm/init.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > >
> > > Thank you for working on this.
> > >
> > > Tested with QEMU 5.2.0 on 32-bit 'virt' and 'sifive_u', with
> > > fw_jump.bin used as the -bios.
> >
> > fw_dynamic should also work unless you are using more than 1G of memory.
> > Linux kernel can only support 1G of memory for RV32. The current
>
> I have always been using -m 2G for testing both 32-bit and 64-bit.
> 32-bit 'virt' with 2G memory boots the 32-bit kernel fine.
>

2GB issue with fw_dynamic is fixed with this patch.

https://www.mail-archive.com/qemu-devel@nongnu.org/msg768341.html

> $ qemu-system-riscv32 -nographic -M virt -m 2G -smp 4 -kernel
> arch/riscv/boot/Image -bios fw_jump.bin
>
> > Kconfig is bit misleading and
> > I will send a patch to update the description.
> >
> > However, kernel should be able to ignore any memory beyond what it can
> > address and continue.
> > I will investigate more.
> >
> > > 32-bit 'virt' boots, but 32-bit 'sifive_u' still does not boot, which
> > > should be another issue because reverting the original 1bd14a66ee52 it
> > > still does not help 'sifive_u'.
> > >
> >
> > Are you using more than 1G of memory ? Let me know if the kernel boots
> > if you use 1G.
>
> Kernel does not boot with 1G memory on 32-bit 'sifive_u', either with
> fw_jump.bin or fw_dynamic.bin.
>
> $ qemu-system-riscv32 -nographic -M sifive_u -m 1G -smp 5 -kernel
> arch/riscv/boot/Image -bios fw_jump.bin
>

This happened because of the incorrect loading address. It is already
fixed by Alistair.
https://www.mail-archive.com/qemu-devel@nongnu.org/msg768279.html

> >
> > > Tested-by: Bin Meng <bin.meng@windriver.com>
> > >

Thanks for testing it.

> > > I believe the following tag should also be added and patch cc'ed to
> > > stable-kernel:
> > >
> > > Reported-by: Bin Meng <bin.meng@windriver.com>
> > > Cc: <stable@vger.kernel.org> # 5.10
>

Sure. I will add that and resend it.

> Regards,
> Bin



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
