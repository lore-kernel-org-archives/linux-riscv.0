Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0520EC04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 14:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DG+pvBBXALlMNCx8X0dteKR3Mts7Q/zOf6Y8VfRaJ/I=; b=xh2CGKpw+kYpCjMbMJq/rY97T3
	n8+1LotzAhxcN2DHamjP/6fUdh5VCLPR3IP4VdTczbjCuoos2QHA409LRaQtQoBszJPAbv91AafrF
	//X/4miD2G+t5rM3TLPH+dN9skSUyP/FjzRWUpZBZ7nZP3s5rIAN/LAIdkwtxl/b+6R0ICe10TFWr
	TH6VIDY3ZsjoGK3XJuU6ul4C6iXE7v1P0uLh5HXI1Z8A4FqQ1WyUeHEJ1nuf7YQ7x55mRDUMUufjV
	tw+EgkRKFdNMhVHpDAXMjYw9rubptYIZGegoMSX7Q7ZeBG4MrhpJy0LWbDbon8jJE3/fmNcVmOdb0
	d4TYut3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6tJA-0000000GD42-0A5i;
	Tue, 14 May 2024 14:39:12 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6tJ6-0000000GD29-33Xl
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 14:39:10 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6f490b5c23bso4804331b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 May 2024 07:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715697542; x=1716302342; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WNcVowLF738bBUYU9q9s1F6x75YSSD23yiDfQaIObKk=;
        b=X9hiyNhJvCGSlJCSvHF4jgCDXaRYdAV3oBv284mLKTRisz74yJ4Bm2tDQX3zs6Rw4Z
         0BUzkRnlvj/+caILl3KC0t1CnPlBe0LRW9JIZFH2r6RSnv0VELxRRBI3JpuWKly93lni
         xhhvjMxcTlAsd3k+tHR5wZ5/kFyoupUhVUkI3+3HE36kXbDM4E3/0ukBKjCY0KaXypzz
         YQ7DNTqWLfzPTm/qy8T1Yw5vDf9u5hktnhi6w5rw6r0YR7rE0VPh+vuvhjSbG4sQ7h8P
         UZ2ZA7UwuLSFxC/U4EDyF/TCeaKzySKFDQkJOpDrgHAutKtx+V55d9j2WcwK7zO8ddnp
         Oa1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715697542; x=1716302342;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WNcVowLF738bBUYU9q9s1F6x75YSSD23yiDfQaIObKk=;
        b=gsJwR06wsZ/zo9xbZG8EbE4C05EjxEK96t8RndeUoyURhsKciMO0SlrT9KYC1j0Hn0
         56rXCzDHNBk/d5Fn6Nv96LKPKSVEd6j8GQZFTOzcTcO2VJ7VKVeGmTKEztFJYczsAZrc
         FQwoTL0HFv2ptO7UsoIPqPO/FwnmuBc9k0ugHNjz0DghzW1KpDh/4p/Gj58V8dciAllB
         mN3P2xoBw4sFAc7DWIHADgt3sP1vP0AI//dyszO1jE4ZJEWXraM8ePLN70sR1TF88O26
         FVrXvaxf47nOLZe6n3WHq5pm+E8dbLcN0HdNtZReFx4NQhxpx3sooLrhUM7AfQPfAoHh
         c0FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx0Oe3i3ZvFzR6JN9ofmNsslCs260KoQGag1cS9+8llG5+uTGuitcFPIcGNBfyzGMgEPpxJQBXXE0QpukL1C5DYILfBvZeXt5oGCR3pWbG
X-Gm-Message-State: AOJu0Yy1VSNTGVx+i+BmY/oCyf9aoWiOKjZ0VM/UIID87feYa9kWAgsT
	AiwgkWauFMk/q0Uh3wOfcinr7nKKscEey14nt5qBs4Ni/8jKZgd48DVYVUiGyu8=
X-Google-Smtp-Source: AGHT+IHdkOKBG0DyoFSxyrRHAS+ghpUAA5spIffvQqpiXqFnRsKCPZ4PJ12xD5NX3np4aQAOmlluRg==
X-Received: by 2002:a05:6a00:14d1:b0:6e7:20a7:9fc0 with SMTP id d2e1a72fcca58-6f4e03a70c4mr15441852b3a.34.1715697541813;
        Tue, 14 May 2024 07:39:01 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2b26ceasm9183891b3a.187.2024.05.14.07.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 07:39:01 -0700 (PDT)
Date: Tue, 14 May 2024 07:38:59 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, Ved Shanbhogue <ved@rivosinc.com>
Subject: Re: [RFC PATCH 5/7] riscv: add double trap driver
Message-ID: <ZkN3gyfL1hUcjPgD@debug.ba.rivosinc.com>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
 <20240418142701.1493091-6-cleger@rivosinc.com>
 <Ziw//90J0WfOY/tl@debug.ba.rivosinc.com>
 <e33b8eba-85f0-44b7-8a6f-802a6979f6c8@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e33b8eba-85f0-44b7-8a6f-802a6979f6c8@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_073908_985639_4B030848 
X-CRM114-Status: GOOD (  23.45  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, May 14, 2024 at 10:06:31AM +0200, Cl=E9ment L=E9ger wrote:
>
>
>On 27/04/2024 01:59, Deepak Gupta wrote:
>> On Thu, Apr 18, 2024 at 04:26:44PM +0200, Cl=E9ment L=E9ger wrote:
>>> Add a small driver to request double trap enabling as well as
>>> registering a SSE handler for double trap. This will also be used by KVM
>>> SBI FWFT extension support to detect if it is possible to enable double
>>> trap in VS-mode.
>>>
>>> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
>>> ---
>>> arch/riscv/include/asm/sbi.h=A0=A0=A0 |=A0 1 +
>>> drivers/firmware/Kconfig=A0=A0=A0=A0=A0=A0=A0 |=A0 7 +++
>>> drivers/firmware/Makefile=A0=A0=A0=A0=A0=A0 |=A0 1 +
>>> drivers/firmware/riscv_dbltrp.c | 95 +++++++++++++++++++++++++++++++++
>>> include/linux/riscv_dbltrp.h=A0=A0=A0 | 19 +++++++
>>> 5 files changed, 123 insertions(+)
>>> create mode 100644 drivers/firmware/riscv_dbltrp.c
>>> create mode 100644 include/linux/riscv_dbltrp.h
>>>
>>> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
>>> index 744aa1796c92..9cd4ca66487c 100644
>>> --- a/arch/riscv/include/asm/sbi.h
>>> +++ b/arch/riscv/include/asm/sbi.h
>>> @@ -314,6 +314,7 @@ enum sbi_sse_attr_id {
>>> #define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SPIE=A0=A0=A0 (1 << 2)
>>>
>>> #define SBI_SSE_EVENT_LOCAL_RAS=A0=A0=A0=A0=A0=A0=A0 0x00000000
>>> +#define SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP=A0=A0=A0 0x00000001
>>> #define SBI_SSE_EVENT_GLOBAL_RAS=A0=A0=A0 0x00008000
>>> #define SBI_SSE_EVENT_LOCAL_PMU=A0=A0=A0=A0=A0=A0=A0 0x00010000
>>> #define SBI_SSE_EVENT_LOCAL_SOFTWARE=A0=A0=A0 0xffff0000
>>> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
>>> index 59f611288807..a037f6e89942 100644
>>> --- a/drivers/firmware/Kconfig
>>> +++ b/drivers/firmware/Kconfig
>>> @@ -197,6 +197,13 @@ config RISCV_SSE_TEST
>>> =A0=A0=A0=A0=A0 Select if you want to enable SSE extension testing at b=
oot time.
>>> =A0=A0=A0=A0=A0 This will run a series of test which verifies SSE sanit=
y.
>>>
>>> +config RISCV_DBLTRP
>>> +=A0=A0=A0 bool "Enable Double trap handling"
>>> +=A0=A0=A0 depends on RISCV_SSE && RISCV_SBI
>>> +=A0=A0=A0 default n
>>> +=A0=A0=A0 help
>>> +=A0=A0=A0=A0=A0 Select if you want to enable SSE double trap handler.
>>> +
>>> config SYSFB
>>> =A0=A0=A0=A0bool
>>> =A0=A0=A0=A0select BOOT_VESA_SUPPORT
>>> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
>>> index fb7b0c08c56d..ad67a1738c0f 100644
>>> --- a/drivers/firmware/Makefile
>>> +++ b/drivers/firmware/Makefile
>>> @@ -18,6 +18,7 @@ obj-$(CONFIG_RASPBERRYPI_FIRMWARE) +=3D raspberrypi.o
>>> obj-$(CONFIG_FW_CFG_SYSFS)=A0=A0=A0 +=3D qemu_fw_cfg.o
>>> obj-$(CONFIG_RISCV_SSE)=A0=A0=A0=A0=A0=A0=A0 +=3D riscv_sse.o
>>> obj-$(CONFIG_RISCV_SSE_TEST)=A0=A0=A0 +=3D riscv_sse_test.o
>>> +obj-$(CONFIG_RISCV_DBLTRP)=A0=A0=A0 +=3D riscv_dbltrp.o
>>> obj-$(CONFIG_SYSFB)=A0=A0=A0=A0=A0=A0=A0 +=3D sysfb.o
>>> obj-$(CONFIG_SYSFB_SIMPLEFB)=A0=A0=A0 +=3D sysfb_simplefb.o
>>> obj-$(CONFIG_TI_SCI_PROTOCOL)=A0=A0=A0 +=3D ti_sci.o
>>> diff --git a/drivers/firmware/riscv_dbltrp.c
>>> b/drivers/firmware/riscv_dbltrp.c
>>> new file mode 100644
>>> index 000000000000..72f9a067e87a
>>> --- /dev/null
>>> +++ b/drivers/firmware/riscv_dbltrp.c
>>> @@ -0,0 +1,95 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (C) 2023 Rivos Inc.
>>> + */
>>
>> nit: fix copyright year
>>> +
>>> +#define pr_fmt(fmt) "riscv-dbltrp: " fmt
>>> +
>>> +#include <linux/cpu.h>
>>> +#include <linux/init.h>
>>> +#include <linux/riscv_dbltrp.h>
>>> +#include <linux/riscv_sse.h>
>>> +
>>> +#include <asm/sbi.h>
>>> +
>>> +static bool double_trap_enabled;
>>> +
>>> +static int riscv_sse_dbltrp_handle(uint32_t evt, void *arg,
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct pt_regs =
*regs)
>>> +{
>>> +=A0=A0=A0 __show_regs(regs);
>>> +=A0=A0=A0 panic("Double trap !\n");
>>> +
>>> +=A0=A0=A0 return 0;
>> Curious:
>> Does panic return?
>> What's the point of returning from here?
>
>Hi Deepak,
>
>No, panic() does not return and indeed, the "return 0" is useless. It's
>a leftover of a previous implementation without panic in order to keep
>GCC mouth shut ;).
>
>>
>>> +}
>>> +
>>> +struct cpu_dbltrp_data {
>>> +=A0=A0=A0 int error;
>>> +};
>>> +
>>> +static void
>>> +sbi_cpu_enable_double_trap(void *data)
>>> +{
>>> +=A0=A0=A0 struct sbiret ret;
>>> +=A0=A0=A0 struct cpu_dbltrp_data *cdd =3D data;
>>> +
>>> +=A0=A0=A0 ret =3D sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_SET,
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 SBI_FWFT_DOUBLE_TRAP_ENABLE, 1, 0, 0=
, 0, 0);
>>> +
>>> +=A0=A0=A0 if (ret.error) {
>>> +=A0=A0=A0=A0=A0=A0=A0 cdd->error =3D 1;
>>> +=A0=A0=A0=A0=A0=A0=A0 pr_err("Failed to enable double trap on cpu %d\n=
",
>>> smp_processor_id());
>>> +=A0=A0=A0 }
>>> +}
>>> +
>>> +static int sbi_enable_double_trap(void)
>>> +{
>>> +=A0=A0=A0 struct cpu_dbltrp_data cdd =3D {0};
>>> +
>>> +=A0=A0=A0 on_each_cpu(sbi_cpu_enable_double_trap, &cdd, 1);
>>> +=A0=A0=A0 if (cdd.error)
>>> +=A0=A0=A0=A0=A0=A0=A0 return -1;
>>
>> There is a bug here. If `sbi_cpu_enable_double_trap` failed on all cpus
>> but last cpu.
>> Then cdd.error would not record error and will be reflect as if double
>> trap was enabled.
>
>cdd.error is only written in case of error by the per-cpu callbacks, so
>it is only set if enabled failed. Is there something I'm missing ?

No. Sorry I missed that detail. lgtm.

>
>Thanks,
>
>Cl=E9ment
>
>>
>> Its less likely to happen that FW would return success for one cpu and
>> fail for others.
>> But there is non-zero probablity here.
>>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
