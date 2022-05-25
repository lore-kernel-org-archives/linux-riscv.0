Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB0DC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 23:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ndg7/fJDN4YfZsd9RE6AN0mmfEMxC8d0d/JshjCRXmo=; b=NVqv7I0JsXn4SZ
	4FBUKrzjPXfU+xYceTebuKIM2/7rnR/jV1v62mlWm7fNi5TE2zEShNtpYeP2QFrtjzRpuN6SRmlXp
	5fHDHotlMRtuiGrB0DKkmjV65+b/AWn3QPGTGl6ewKCp9z7ZPVPdmBPLauEsuNYlrNX/TrbVvcQrY
	Vbrr64Aaohu/kgImwmNNLRvhZdSgYkh9o0QrNLqzaHG1df6tE/Bp+Lhg1ggXXtdcoSZvcMNucyC1j
	c4I5Y1lT1gSV7VW9bmFg1dED+H4E73IyV+M4L1LdKYdc7Q9sQhLX+nFnMnkU3MxJh5bVeyyam1o7P
	W2OQjEq91pvg0Ut9vo2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu0YI-00CxdW-8c; Wed, 25 May 2022 23:36:30 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu0YF-00CxcV-Gb
	for linux-riscv@lists.infradead.org; Wed, 25 May 2022 23:36:29 +0000
Received: by mail-wr1-x432.google.com with SMTP id t6so114940wra.4
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 16:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=svxp83ully3titClkRHBPwkiGXlXX0awUR+v2+8RPek=;
        b=f/zQ8Wy4CFG4GCNX2VxulQq1o3t6fAR6PyNAk4FrZBvsIT8O3VQqu9ChxjyzHliEGO
         M4ZsmgMf09xPt1JVLQ5l679Q9UuNUmLF0Xw50ZYXWCxrRICWX8miJyzc/JMwQy0eoMdT
         PXbY7JF+xC4+56QiE65CmdZFJs8KSN5/VP2phyNQAs62yy62Of0/C3XVt0znAkCdLR9l
         sBT1r9Egotq10I39MzTrmDQmY7he939U2LPRpkygYfKLrVjk+JcocEclJ8IO5B+osMND
         E6HMhki6q5qdqtK1AElMfbCGQElQUcDlkRIGEI57d/ZGXbnmIqdsaAG8M8fzUbsWMOnN
         YpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=svxp83ully3titClkRHBPwkiGXlXX0awUR+v2+8RPek=;
        b=VwdGlytN9NDJO6h09j+SLAdJSXYvrcIUIwyvkvW2n4p63S7RIOBnZkdiVmaydDg2Ua
         UWBQyUS5GfUFqlbXb3kQ4zEomsxhxIaOr+uE/nGKCm5mss0i+C5SugHgr5Rh7KUaFB23
         9eRk9rajWMontvkyWF2G59W7xSlBDdlIbzhdqTRC2R8otiyPQvNmIX9BlrjF5TipY9vp
         qC6nV4/KnhqrM49bVTAYrI/wAwrk5dWINGs95HPv98WrT6OUdg3OJUyLFQ+C/4IJLkZW
         vFYW6+yVOBsvMbBABWR1zNScJuTf+dBjTL5feKiq7nDrGffnE5UQs36OJBjOJ2kYHxfh
         s92A==
X-Gm-Message-State: AOAM531Ws9sEnwqqYq3ufI5UPuA64ZzRHfStCBBOQjyLZSiUBODIjRVw
	NmatIdfZiz5Q4nlBtXIK0YYWgg==
X-Google-Smtp-Source: ABdhPJz1PA4YaqrTseWXsPt1FNfLnyyPo6Ed0pJ3xL1TVct0XWzjrwCExTmMuvQDCVe7IUW94sBcww==
X-Received: by 2002:adf:d4ce:0:b0:20d:9b4:2bc2 with SMTP id w14-20020adfd4ce000000b0020d09b42bc2mr29114605wrk.151.1653521786002;
        Wed, 25 May 2022 16:36:26 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.nat-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id d23-20020a1c7317000000b0039736892653sm117725wmb.27.2022.05.25.16.36.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 May 2022 16:36:25 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH 5/5] riscv/efi_stub: Support for 64bit boot-hartid
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CAOnJCU+r6KgR7bd2dx5QLmmVLjJX8GhETHb6rG65wq0e_m6FVA@mail.gmail.com>
Date: Thu, 26 May 2022 00:36:24 +0100
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>,
 Atish Patra <atishp@rivosinc.com>,
 Anup Patel <apatel@ventanamicro.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-efi <linux-efi@vger.kernel.org>,
 Sunil V L <sunil.vl@gmail.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Message-Id: <5829932A-6E45-46CA-AADA-14EDD903C4AD@jrtc27.com>
References: <20220525151106.2176147-1-sunilvl@ventanamicro.com>
 <20220525151106.2176147-6-sunilvl@ventanamicro.com>
 <CAMj1kXFhEBv7MVCKZuXdx9=hZx3qWbkATdLDwXAe_Zn9Xyx=dg@mail.gmail.com>
 <1e90b15b-8c73-0de8-2885-1292923b7575@canonical.com>
 <CAOnJCU+r6KgR7bd2dx5QLmmVLjJX8GhETHb6rG65wq0e_m6FVA@mail.gmail.com>
To: Atish Patra <atishp@atishpatra.org>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_163627_638098_23DB1922 
X-CRM114-Status: GOOD (  26.79  )
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

On 26 May 2022, at 00:11, Atish Patra <atishp@atishpatra.org> wrote:
> 
> On Wed, May 25, 2022 at 9:09 AM Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
>> 
>> On 5/25/22 17:48, Ard Biesheuvel wrote:
>>> On Wed, 25 May 2022 at 17:11, Sunil V L <sunilvl@ventanamicro.com> wrote:
>>>> 
>>>> The boot-hartid can be a 64bit value on RV64 platforms. Currently,
>>>> the "boot-hartid" in DT is assumed to be 32bit only. This patch
>>>> detects the size of the "boot-hartid" and uses 32bit or 64bit
>>>> FDT reads appropriately.
>>>> 
>>>> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
>>>> ---
>>>> drivers/firmware/efi/libstub/riscv-stub.c | 12 +++++++++---
>>>> 1 file changed, 9 insertions(+), 3 deletions(-)
>>>> 
>>>> diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
>>>> index 9e85e58d1f27..d748533f1329 100644
>>>> --- a/drivers/firmware/efi/libstub/riscv-stub.c
>>>> +++ b/drivers/firmware/efi/libstub/riscv-stub.c
>>>> @@ -29,7 +29,7 @@ static int get_boot_hartid_from_fdt(void)
>>>> {
>>>> const void *fdt;
>>>> int chosen_node, len;
>>>> - const fdt32_t *prop;
>>>> + const void *prop;
>>>> 
>>>> fdt = get_efi_config_table(DEVICE_TREE_GUID);
>>>> if (!fdt)
>>>> @@ -40,10 +40,16 @@ static int get_boot_hartid_from_fdt(void)
>>>> return -EINVAL;
>>>> 
>>>> prop = fdt_getprop((void *)fdt, chosen_node, "boot-hartid", &len);
>>>> - if (!prop || len != sizeof(u32))
>>>> + if (!prop)
>>>> + return -EINVAL;
>>>> +
>>>> + if (len == sizeof(u32))
>>>> + hartid = (unsigned long) fdt32_to_cpu(*(fdt32_t *)prop);
>>>> + else if (len == sizeof(u64))
>>>> + hartid = (unsigned long) fdt64_to_cpu(*(fdt64_t *)prop);
>>> 
>>> Does RISC-V care about alignment? A 64-bit quantity is not guaranteed
>>> to appear 64-bit aligned in the DT, and the cast violates C alignment
>>> rules, so this should probably used get_unaligned_be64() or something
>>> like that.
>> 
>> When running in S-mode the SBI handles unaligned access but this has a
>> performance penalty.
>> 
>> We could use fdt64_to_cpu(__get_unaligned_t(fdt64_t, prop)) here.
>> 
> 
> It is better to avoid unaligned access in the kernel. There are some
> plans to disable
> misaligned load/store emulation in the firmware if user space requests
> it via prctl.

Why?

Jess

> We need another SBI extension to do that. The idea is to keep it
> enabled by default in the firmware but
> userspace should have an option to disable it via prctl. If we make
> sure that the kernel doesn't invoke any
> unaligned access, this feature can be implemented easily.
> 
>> Best regards
>> 
>> Heinrich
>> 
>>> 
>>> 
>>>> + else
>>>> return -EINVAL;
>>>> 
>>>> - hartid = fdt32_to_cpu(*prop);
>>>> return 0;
>>>> }
>>>> 
>>>> --
>>>> 2.25.1
>>>> 
>> 
> 
> 
> -- 
> Regards,
> Atish
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
