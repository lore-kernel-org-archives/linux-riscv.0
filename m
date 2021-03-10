Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F3FC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 16:41:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EAFD64FC3
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 16:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EAFD64FC3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5zG1tiKfZ9IOGviGD4uWTmsjaHGHnCEigdjxK5tPmG4=; b=KjNueZQ0nmGtWt3cWnhZTkwyA
	OWVbJWJptBBHptnn6W/yb5Rl6eep+dpE8kQlFILjasVPdd8S7E3pYawLlJmBHusLV9LOxXOl2J7h4
	b1SIQVPUX4MXJPrKB1ra60Qp+hldT21pTzhyC7cUPtM8Oa2G7PqTkpQrEkjqBRjAEc8/okXDFapOD
	8mMQ5gCITXcwrZHbNMTBehM6SmjaeYEEIRCY8nC1t6r0rc0tHxozlHTw72Vn7Ma6aKg6j+a076qSL
	PwyFO1jufqNbTOrRBPEkN/JAPxyUy+cHKxWdjwqopPWemSCQVorhkhaCrGT95yotDAysCkLgqv+wJ
	9fhA2cokA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK1tl-007Fyq-JI; Wed, 10 Mar 2021 16:41:25 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK1th-007FyS-2s; Wed, 10 Mar 2021 16:41:23 +0000
Received: by mail-oi1-f181.google.com with SMTP id u6so12415900oic.2;
 Wed, 10 Mar 2021 08:41:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ctTsPBzFs9/iTj3sZjy30dXwkVFcrzEvDUDxu6OCH7I=;
 b=tvsSrOdphN6fIX9Wb7D/SOU/0u15VpzEBpxBGFB0SJr6Zoo7THEkh3jOKoF4GKU7Q8
 Zv/4wOO85PDBEULuUdQmdThcf7tcg9DAAH/Nq3v2vlXekWvmaPE/m0xVvQxZZlzv44/j
 zFkNu7EA/AXVOHD6U/oefVGxiXPhfxi2yS4UI8mLLsnucnXTwx9MQO4UiWA1bwOH5XoC
 DI7g98Oepl1UfPgPjwQsb3RD2JJtZ9gHDJXyAS4ccfZtucQJJEaHx6TbBmyRvU8lfl82
 c8LCA/BKHum00WpwHFIdS2iM3md02a5+1ULu9waS1B496jcnTKtxTazea20M3DORRqHh
 T5gg==
X-Gm-Message-State: AOAM530FX3XsFAMtbDdveIApp1F4vUNuZb7GBxhvMZTzbOMMURoUk3C5
 LjBjFbxfncdE9xj7UDc13TvXrI4jfXkfcHTDaKo=
X-Google-Smtp-Source: ABdhPJz6PQkrQ8FEokszgy6fn3LNPI4AA5eciLhoBrgyTmgsLb40B0HyK5VG1qujI9LrZBxnfNxDF/K5nRgTsRrxhP8=
X-Received: by 2002:aca:ac8d:: with SMTP id v135mr2937558oie.2.1615394479189; 
 Wed, 10 Mar 2021 08:41:19 -0800 (PST)
MIME-Version: 1.0
References: <20201119003829.1282810-1-atish.patra@wdc.com>
 <20201119003829.1282810-4-atish.patra@wdc.com>
In-Reply-To: <20201119003829.1282810-4-atish.patra@wdc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Mar 2021 17:41:07 +0100
Message-ID: <CAMuHMdUjh9znKTLZ+bST6aDUFdZzvmv2SGVy=sRQ6+D=pYM9cg@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] riscv: Separate memory init from paging init
To: Atish Patra <atish.patra@wdc.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Greentime Hu <greentime.hu@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmerdabbelt@google.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Baoquan He <bhe@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Mike Rapoport <rppt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>, 
 Zhengyuan Liu <liuzhengyuan@tj.kylinos.cn>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_164121_255175_4E257ABC 
X-CRM114-Status: GOOD (  22.81  )
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

Hi Atish,

On Thu, Nov 19, 2020 at 1:40 AM Atish Patra <atish.patra@wdc.com> wrote:
> Currently, we perform some memory init functions in paging init. But,
> that will be an issue for NUMA support where DT needs to be flattened
> before numa initialization and memblock_present can only be called
> after numa initialization.
>
> Move memory initialization related functions to a separate function.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

This is now commit cbd34f4bb37d62d8 in v5.12-rc1, breaking the boot on
Vexriscv:

[    0.000000] earlycon: sbi0 at I/O port 0x0 (options '')
[    0.000000] printk: bootconsole [sbi0] enabled
[    0.000000] printk: debug: ignoring loglevel setting.
[    0.000000] Initial ramdisk at: 0x(ptrval) (8388608 bytes)
[    0.000000] Unable to handle kernel paging request at virtual
address c8000008
[    0.000000] Oops [#1]
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted
5.11.0-orangecrab-00023-g7c4fc8e3e982 #129
[    0.000000] epc: c04d6624 ra : c04d6524 sp : c05ddf70
[    0.000000]  gp : c0678bc0 tp : c05e5b40 t0 : c8000000
[    0.000000]  t1 : 00030000 t2 : ffffffff s0 : c05ddfc0
[    0.000000]  s1 : c8000000 a0 : 00000000 a1 : c7ffffe0
[    0.000000]  a2 : 00000005 a3 : 00000001 a4 : 0000000c
[    0.000000]  a5 : 00000000 a6 : c04fe000 a7 : 0000000c
[    0.000000]  s2 : c04fe098 s3 : 000000a0 s4 : c7ffff60
[    0.000000]  s5 : c04fe0dc s6 : 80000200 s7 : c059f19c
[    0.000000]  s8 : 81000200 s9 : c059f1b8 s10: 80000200
[    0.000000]  s11: c059f19c t3 : 405dba80 t4 : c05e6f08
[    0.000000]  t5 : 81000200 t6 : 40501000
[    0.000000] status: 00000100 badaddr: c8000008 cause: 0000000f
[    0.000000] random: get_random_bytes called from
print_oops_end_marker+0x38/0x7c with crng_init=0
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!

Note that I have "[PATCH v2 3/4] RISC-V: Fix L1_CACHE_BYTES for RV32"[1]
applied, to avoid another crash (7c4fc8e3e982 = v5.11 + [1] +
cherry-picked commits from the riscv-for-linus-5.12-mw0 pull request).

If I revert the L1_CACHE_BYTES change, the boot continues, but I'm back
to the old issue fixed by [1]:

[   22.126687] Freeing initrd memory: 8192K
[   22.321811] workingset: timestamp_bits=30 max_order=15 bucket_order=0
[   29.001509] Block layer SCSI generic (bsg) driver version 0.4
loaded (major 253)
[   29.021555] io scheduler mq-deadline registered
[   29.033692] io scheduler kyber registered
[   29.141294] Unable to handle kernel paging request at virtual
address 69726573
[   29.158523] Oops [#1]
[   29.162232] CPU: 0 PID: 1 Comm: swapper Not tainted
5.11.0-orangecrab-00023-g7c4fc8e3e982-dirty #132
[   29.171970] epc: c000d3b0 ra : c000eb74 sp : c182dca0
[   29.178786]  gp : c067aee0 tp : c1830000 t0 : c18d75e0
[   29.185935]  t1 : 00030000 t2 : 00000000 s0 : c182dcb0
[   29.193028]  s1 : 00000000 a0 : c05eab14 a1 : c18d75c0
[   29.200067]  a2 : c7ffe384 a3 : 69726573 a4 : f000000b
[   29.207095]  a5 : f0000000 a6 : c7fffff8 a7 : 00000000
[   29.214141]  s2 : 01001f00 s3 : c05eb000 s4 : c067c000
[   29.221171]  s5 : c000ec0c s6 : 80000000 s7 : c05eaad4
[   29.228200]  s8 : c05eab58 s9 : c05a1000 s10: c18d75c0
[   29.235238]  s11: c05eab14 t3 : 20b9a6cc t4 : 00000001
[   29.242277]  t5 : 00000000 t6 : c188cd50
[   29.247588] status: 00000120 badaddr: 69726573 cause: 0000000d
[   29.274424] ---[ end trace 69dee1b9ca96f1d6 ]---
[   29.282859] note: swapper[1] exited with preempt_count 1
[   29.293156] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x0000000b

[1] https://lore.kernel.org/linux-riscv/20210111234504.3782179-4-atish.patra@wdc.com/

Will have a deeper look later...

Thanks for any suggestions!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
