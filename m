Return-Path: <SRS0=Wf4V=NL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB16C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 19:11:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B813520657
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 19:11:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UjKJLccC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tqdHHPpG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B813520657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CNAkxotf9ZVkWfRk5SYab9TZwK5WM303cBWRF1NC5zY=; b=UjKJLccCMTmjAJ
	WUt6AbX+8Df1Sh0X4398RmJ6cu/MBlKe/zQBA+L/ltR+YGbL/us8g1tozwI0Y4RQgcLR6u2GsPVpU
	8oqEhJlCTzhCVIqt5T6fXm+PWIab4zXFc+KZCOMNdUraQEobhn0fIYkAe1P7zliWDTHKbTvoxpsyr
	QB/YqmELTnR41mSJoe9Y8d/BWOSZpf7KOzmKCG5l/YdzxB7TVpWawXNKVuIhXy6sgS2oT6/sConhJ
	ooLkQK44vA7G2bsQfyxPoe4uofBz39R8qA4kLCHlwklcUAHEF+9KehkDn2WqlExT3P2/uKJlsvdG8
	lHqGcysqA0NDr7+7Yh3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHvtx-0002Mw-Py; Wed, 31 Oct 2018 19:11:37 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHvtu-0002MF-Nk
 for linux-riscv@lists.infradead.org; Wed, 31 Oct 2018 19:11:36 +0000
Received: by mail-ot1-x342.google.com with SMTP id q5so10152826otl.13
 for <linux-riscv@lists.infradead.org>; Wed, 31 Oct 2018 12:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=alZ3AKs35+CX5J5w6urDBfjYkSAsG8tSiyOCm/DIxnM=;
 b=tqdHHPpGZi9gihrtn+NufwNw5Rs8onVkx1Rk0JulSP6IZ9jK3wVGpBr1VwgOhLzjbh
 IHAwcXJwLBxt9lnL+hyToRwONZ9JuFRq5pFKIx2SX6+/E0+THeaO0eTxOmtt4kV2jMns
 47Src9nanej9jexYkPv05/JJPY4WBDMZqwy8upr5l1rXQ/WYGZN2/wuiUllZWBdG5CVp
 /WMq70inHQ5uAkAA6UB0kKqHi7FDh/h1z/c+2OKF8Dwyx9SH2SwYkq2UIrCfv+s4qK8A
 RXwK7xKhB5GTLQrS4sjXsFd5WfsSc9Gr6ommRh7lUgknBHGOg2d+2O+NL8vbJyj/PMXd
 IPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=alZ3AKs35+CX5J5w6urDBfjYkSAsG8tSiyOCm/DIxnM=;
 b=LFxs8Wm6A6GOWtjdC74gyYszFAyOYBgMa3QdpOZsKTNGzcGEuES9Myr2TMXw3/sF5s
 DwHhON1AVoJzUk1s9MJ0nfk/9cA/FOvWBsd5O3tsh1hqgp7DbYvt0U1NlCiYPxtLeF0+
 +4xQMY89yOZ+SfSOs632BAT088mV2P2R+EXHRP/Hs6hrtWd0XYMDCdBdwUKl5gwt2M9D
 zuRWy9/juAUQAKVdmlLY23FOX5aQDz1MzxagMCYhyjqYx4hRB5vDbf+C3tVOQtEaq66B
 xnFr5j9H8bg7DyrfwF33Hf7n+8jRZIzcZaiMVkjfwbviXIUvLVtzl2Sy0oYJjiNBK6M0
 I1xA==
X-Gm-Message-State: AGRZ1gLvBvTb4RdfimOkQDO0zKlqWQW92lIYX1kGu8hC+WcBD+q5vSNa
 fyXh/nLayZ+09jfS5gC8z5ZBXZvny98H7b0IWTI=
X-Google-Smtp-Source: AJdET5dM0N6AkDEAp99fuLmY/W4ENeITfT6WS8Vz+sFvkPw6plYQbyAyUz8PiUaGrSY5rF5TxNBoz/gz4f7JbdvPO3g=
X-Received: by 2002:a9d:4b08:: with SMTP id q8mr2717618otf.121.1541013082979; 
 Wed, 31 Oct 2018 12:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <7f2a546a-6ebb-43c6-83a0-5e712ec2e2c7@wdc.com>
 <CAK-hmcQeiGa3BwnzEVB_dyhFiC7rXHFN-wTsJomg-jAo7a+v3Q@mail.gmail.com>
In-Reply-To: <CAK-hmcQeiGa3BwnzEVB_dyhFiC7rXHFN-wTsJomg-jAo7a+v3Q@mail.gmail.com>
From: Olof Johansson <olof.johansson@gmail.com>
Date: Wed, 31 Oct 2018 12:11:11 -0700
Message-ID:
 <CAK-hmcSTg=AbXfDwx-O-8WuMsaVbJXP7Jd7HYoFh3jDJHGZ2iQ@mail.gmail.com>
Subject: Re: SBI extension proposal
To: atish.patra@wdc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181031_121134_800313_9ECDD24F 
X-CRM114-Status: GOOD (  24.88  )
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
Cc: mark.rutland@arm.com, zong@andestech.com, Damien.LeMoal@wdc.com,
 Andrew Waterman <andrew@sifive.com>, alankao@andestech.com,
 anup@brainfault.org, Palmer Dabbelt <palmer@sifive.com>, rjones@redhat.com,
 hch@infradead.org, vincentc@andestech.com, mjc@sifive.com,
 Arnd Bergmann <arnd@arndb.de>, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, abner.chang@hpe.com,
 David.Abdurachmanov@cern.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181031191111.nfLVjuvJ4Fu4TLAGuI9RDHGoWwFCZBIOLQy3BmtV390@z>

One more try, this time in plain text.

On Wed, Oct 31, 2018 at 12:01 PM Olof Johansson
<olof.johansson@gmail.com> wrote:
>
> Hi,
>
> On Wed, Oct 31, 2018 at 11:23 AM Atish Patra <atish.patra@wdc.com> wrote:
>>
>> Here is a proposal to make SBI a flexible and extensible interface.
>> It is based on the foundation policy of RISC-V i.e. modularity and
>> openness. It is designed in such a way that it introduces very few new
>> mandatory SBI APIs that are absolutely required to maintain backward
>> compatibility. Everything else is optional so that it remains an open
>> standard yet robust.
>
>
> Thanks for starting this discussion.
>
>>
>> 1. Introduction:
>> ----------------
>> The current RISC-V SBI only defines a few mandatory functions such as
>> inter-processor interrupts (IPI) interface, reprogramming timer, serial
>> console and memory barrier instructions. The existing SBI documentation
>> can be found here [1]. Many important functionalities such as power
>> management/cpu-hotplug are not yet defined due to difficulties in
>> accommodating modifications without breaking the backward compatibility
>> with the current interface.
>>
>> Its design is inspired by Power State Coordination Interface (PSCI) from
>> ARM world. However, it adds only two new mandatory SBI calls providing
>> version information and supported APIs, unlike PSCI where a significant
>> number of functions are mandatory. The version of the existing SBI will
>> be defined as a minimum version(0.1) which will always be backward
>> compatible. Similarly, any Linux kernel with newer feature will fall
>> back if an older version of SBI does not support the updated
>> capabilities. Both the operating system and SEE can be implemented to be
>> two way backward compatible.
>
>
> To clarify: There is no way a kernel can request an older version of the SBI, but with backwards compatibility that shouldn't be required.
>
>> 2. New functions:
>> -----------------
>
>
> These should have their API numbers specified by each function, including aliases between 0.1 and 0.2.
>
>>
>>
>> -- u32 sbi_get_version(void):
>>
>> Returns the current SBI version implemented by the firmware.
>> version: uint32: Bits[31:16] Major Version
>>               Bits[15:0] Minor Version
>>
>> The existing SBI version can be 0.1. The proposed version will be at 0.2
>> A different major version may indicate possible incompatible functions.
>> A different minor version must be compatible with each other even if
>> they have a higher number of features.
>>
>> -- u32 sbi_check_api(unsigned long start_api_id, unsigned long count):
>>
>> Accepts a start_api_id as an argument and returns if start_api_id to
>>
>> (start_api_id + count - 1) are supported or not.
>> The API numbering scheme is described in section 3.
>>
>> A count is introduced so that a range of APIs can be checked at one SBI
>> call to minimize the M-mode traps.
>
>
> This will quickly fall back to a one-by-one probe if one of the early count IDs are unavailable. It's likely to mostly be done at boot time anyway, and the number of functions will be relatively limited. It's also possible we'll have a sparse numbering scheme in the future. Returning a 32-bit bitmap starting at start_api_id might be a more flexible approach.
>
> Also, API numbers are 32-bit, but it takes unsigned long? Having fixed length types here would be useful, to avoid confusion with ILP32/LP64. Same goes for other functions.
>
>> -- int sbi_hart_up(unsigned long hartid, unsigned long start, unsigned
>> long priv)
>>
>> Brings up "hartid" either during initial boot or after a sbi_hart_down
>> SBI call.
>>
>> "start" points to a runtime-specified address where a hart can enter
>> into supervisor mode. This must be a physical address.
>>
>> "priv" is a private data that caller can use to pass information about
>> execution context.
>>
>> Return the appropriate SBI error code.
>>
>> -- int sbi_hart_suspend(u32 state, unsigned long resume_entry, unsigned
>> long priv)
>>
>> Suspends the calling hart to a particular power state. Suspended hart
>> will automatically wake-up based on some wakeup events at resume_entry
>> physical address.
>>
>> "priv" is a private data that caller can use to pass information about
>> execution context. The SBI implementation must save a copy so that
>> caller can reuse while restoring hart from suspend.
>>
>> Return the appropriate SBI error code.
>>
>> -- int sbi_hart_down()
>>
>> It powers off the hart and will be used in cpu-hotplug.
>> Only individual hart can remove itself from supervisor mode. It can be
>> moved to normal state only by sbi_hart_up function.
>>
>> Return the appropriate SBI error code.
>>
>> -- u32 sbi_hart_state(unsigned long hartid)
>>
>> Returns the RISCV_POWER_STATE for a specific hartid. This will help make
>> kexec like functionality more robust.
>>
>> -- void sbi_system_shutdown()
>>
>> Powers off the entire system.
>
>
> This is a slightly weird one to put in SBI. There's usually other actions needed for _system_ level shutdown, such as external power regulators.
>
>
>> 3. SBI API ID numbering scheme:
>> ------------------------------
>> An API Set is a set of SBI APIs which collectively implement some
>> kind of feature/functionality.
>>
>> Let's say SBI API ID is u32  then
>> Bit[31:24] =  API Set Number
>> Bit[23:0] = API Number within API Set
>>
>> Here are few API Sets for SBI v0.2:
>> 1. Base APIs
>> API Set Number: 0x0
>> Description: Base APIs mandatory for any SBI version
>>
>> 2. HART PM APIs
>> API Set Number: 0x1
>> Description: Hart UP/Down/Suspend APIs for per-Hart
>> power management
>>
>> 3. System PM APIs
>> API Set Number; 0x2
>> Description: System Shutdown/Reboot/Suspend for system-level
>> power management
>>
>> 4. Vendor APIs
>> API Set Number: 0xff
>> Description: Vendor specific APIs.
>> There is a possibility that different vendors can choose to assign same
>> API numbers for different functionality. In that case, vendor specific
>> strings in Device Tree can be used to verify if a specific API belongs
>> to the intended vendor or not.
>
>
> Yeah, having a binding for description of <function,version> to SBI API ID in DT will be needed, especially once "vendor" becomes fluid (projects migrating between vendors, mixing and matching, etc).
>
> Having long-lived vendor extensions are usually a bad idea, but it's also common to need a place to do custom support or to prove out next-generation API versions.
>
> How strict guidelines might we need/want here?
>
>
>> 4. Return error code Table:
>> ---------------------------
>>
>> Here are the SBI return error codes defined.
>>
>>        SBI_SUCCESS           0
>>        SBI_NOT_SUPPORTED    -1
>>        SBI_INVALID_PARAM    -2
>>        SBI_DENIED           -3
>>        SBI_INVALID_ADDRESS  -4
>>
>> A mapping function between SBI error code & Linux error code should be
>> provided.
>
>
> This isn't Linux-specific, and what Linux maps it to is sort of out of scope for this spec.
>
> (There's no generic "failed" return code, or -EAGAIN equivalent?)
>
>> 5. Power State
>> --------------
>>
>> A RISC-V core can exist in any of the following power states.
>>
>> enum RISCV_POWER_STATE {
>>         //Powered up & operational.
>>         RISCV_HART_ON              =  0,
>>         //Powered up but at reduced energy consumption. WFI instruction
>> can be used to achieve this state.
>>         RISCV_HART_STANDBY        =   1,
>>         //Deeper low power state. No reset required but higher wakeup
>> latency.
>>         RISCV_HART_RETENTION       =  2,
>>         //Powered off. Reset of the core required after power restore.
>>         RISCV_HART_OFF             =  3
>> }
>
>
> If this table changes, we'd need a new SBI version covering the new numbers. That's probably OK -- a future version can introduce a separate power state numbering scheme if needed too.
>
>> TODO:
>> Any other power management related features or state?
>
>
> We probably also need system-level power state reporting at some point, and non-HART components (caches, memory, etc).  Likely aligned with platform specs, once those start to show up.
>
>> 6. Implementation
>> -------------------
>> Currently, SBI is implemented as a part of BBL. There is a different SBI
>> implementation available in coreboot as well.
>>
>> Alternatively, a separate open BSD/MIT licensed SBI project can be
>> created which can be used by anybody to avoid these kind of SBI
>> fragmentation in future. This project can generate both a firmware
>> binary (to executed directly in M mode) or a static library that can be
>> used by different boot loaders. It will also help individual boot
>> loaders to either work from M or S mode without a separate SBI
>> implementation.
>
>
> Strong +1 on providing a shared place for a reference implementation that different code bases can import, and a place for vendors to upstream their vendor-specific pieces if needed.
>
>> This proposal is far from perfect and absolutely any suggestion is
>> welcome. Obviously, there are many other functionalities that can be
>> added or removed from this proposal. However, I just wanted to start
>> with something that is an incremental change at best to kick off the
>> discussion. The aim here is initiate a discussion that can lead to a
>> robust SBI specification.
>>
>> Looking forward to discuss other ideas as well or any feedback on this
>> proposal.
>>
>> Reference:
>> -----------
>> [1]
>> http://infocenter.arm.com/help/topic/com.arm.doc.den0022d/Power_State_Coordination_Interface_PDD_v1_1_DEN0022D.pdf
>> [2] https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.md
>>
>
>
> -Olof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
