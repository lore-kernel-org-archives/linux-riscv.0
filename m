Return-Path: <SRS0=zqna=AV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 449B3C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 05:16:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC17C206E2
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 05:16:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KQ/Gq/Xz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC17C206E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VBzN+NXj2gg+RDxPXCiySkV7BJaClUQUMTMS0gxYTRU=; b=KQ/Gq/Xz9wctpdL1WY2mUWXTT
	68fWI1fZrcy1AJasNymzVvKFl+GeVDcAqECWptJbP8hGbJQYGgCLf8kY+rjN6ZQbkjvy9EC+Y38ZO
	Kr6zMAGSXgSURcLLGO/6yIRgaDHhn8N9CNTzK9MXEfoyNy7eBzlSEmE2KXweA5lOHq5keD+EyhYSt
	MiChZZ2TrKndZ+3AdJBpBDL+ilS7XGfpWzgmhCNrtI09Uc0zS26KLLbpUh4KZTaU7EfWGa/Q430Xn
	NAOhF2vS/qIURSd28ZKNOghLPHNavD+2S2WDGchrTutHlQjgagAfK70y7a2mg89sFgLuR3Bq+H8RV
	FCjLv6ZKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtlO8-0006tE-NE; Fri, 10 Jul 2020 05:15:56 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtlO6-0006sp-4d
 for linux-riscv@lists.infradead.org; Fri, 10 Jul 2020 05:15:55 +0000
X-Originating-IP: 90.112.45.105
Received: from [192.168.1.14] (lfbn-gre-1-325-105.w90-112.abo.wanadoo.fr
 [90.112.45.105]) (Authenticated sender: alex@ghiti.fr)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id A36EEFF803;
 Fri, 10 Jul 2020 05:15:50 +0000 (UTC)
Subject: Re: Random, rare, but reproducible segmentation faults
From: Alex Ghiti <alex@ghiti.fr>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-riscv@lists.infradead.org
References: <20200708202844.GA2075303@aurel32.net>
 <b7de2a27-d3b4-194e-2f80-664406055494@ghiti.fr>
Message-ID: <c83cd510-b407-7f57-3850-de53653254dd@ghiti.fr>
Date: Fri, 10 Jul 2020 01:15:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b7de2a27-d3b4-194e-2f80-664406055494@ghiti.fr>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_011554_407991_DE338147 
X-CRM114-Status: GOOD (  33.68  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Aur=E9lien,

Le 7/9/20 =E0 6:49 AM, Alex Ghiti a =E9crit=A0:
> Hi Aur=E9lien,
> =

> Le 7/8/20 =E0 4:28 PM, Aurelien Jarno a =E9crit=A0:
>> Hi all,
>>
>> For some time I have seen random but relatively rare segmentation faults
>> when building Debian packages, either in a QEMU virtual machine or an
>> Hifive Unleashed board. I have recently been able to reproduce the issue
>> by building Qt [1]. It usually fails after roughly one hour of build,
>> not always on the same C++ file, but always on the same set of files.
>> Trying to run make again the build is usually successful. When it
>> happens one get the following error from GCC:
>>
>> | g++: internal compiler error: Segmentation fault signal terminated =

>> program cc1plus
>> | Please submit a full bug report,
>> | with preprocessed source if appropriate.
>>
>> And the following kernel error:
>>
>> | [267054.967857] cc1plus[1171618]: unhandled signal 11 code 0x1 at =

>> 0x000000156888a430 in cc1plus[10000+e0e000]
>> | [267054.976759] CPU: 3 PID: 1171618 Comm: cc1plus Not tainted 5.7.7+ #1
>> | [267054.983101] epc: 0000000000a70e3e ra : 0000000000a71dbe sp : =

>> 0000003ffff3c870
>> | [267054.990293]=A0 gp : 0000000000e33158 tp : 000000156a0f0720 t0 : =

>> 0000001569feb0d0
>> | [267054.997593]=A0 t1 : 0000000000182a2c t2 : 0000000000e30620 s0 : =

>> 000000000003b7c0
>> | [267055.004880]=A0 s1 : 000000000003b7c0 a0 : 000000156888a420 a1 : =

>> 000000000003b7c0
>> | [267055.012176]=A0 a2 : 0000000000000002 a3 : 000000000003b7c0 a4 : =

>> 000000000003b7c0
>> | [267055.019473]=A0 a5 : 0000000000000001 a6 : 61746e656d676553 a7 : =

>> 73737350581f0402
>> | [267055.026763]=A0 s2 : 0000003ffff3c8c8 s3 : 000000156888a420 s4 : =

>> 000000007fffffff
>> | [267055.034052]=A0 s5 : 0000000070000000 s6 : 0000000000000000 s7 : =

>> 0000003ffff3d638
>> | [267055.041345]=A0 s8 : 0000000000e9ab18 s9 : 0000000000000000 s10: =

>> 0000000000e9a9d0
>> | [267055.048636]=A0 s11: 0000000000000000 t3 : 000000156888a420 t4 : =

>> 0000000000000001
>> | [267055.055930]=A0 t5 : 0000000000000001 t6 : 0000000000000000
>> | [267055.061311] status: 8000000200006020 badaddr: 000000156888a430 =

>> cause: 000000000000000d
>>
>> I have been able to bisect the issue and found it has been introduced by
>> this commit:
>>
>> |=A0commit 54c95a11cc1b5e1d578209e027adf5775395dafd
>> | Author: Alexandre Ghiti <alex@ghiti.fr>
>> | Date:=A0=A0 Mon Sep 23 15:39:21 2019 -0700
>> |
>> |=A0=A0=A0=A0 riscv: make mmap allocation top-down by default
>> |
>> |=A0=A0=A0=A0 In order to avoid wasting user address space by using bott=
om-up =

>> mmap
>> |=A0=A0=A0=A0 allocation scheme, prefer top-down scheme when possible.
>>
>> Reverting this commit, even on 5.7.7, fixes the issue. I debugged things
>> a bit more, and found that the problem doesn't come from the top-down
>> allocation (i.e. setting vm.legacy_va_layout to 1 doesn't change
>> anything). However I have found it comes from the randomization, I mean
>> that the following patch is enough to fix (or workaround?) the issue:
>>
>> | --- a/mm/util.c
>> | +++ b/mm/util.c
>> | @@ -397,8 +397,8 @@ void arch_pick_mmap_layout(struct mm_struct *mm, =

>> struct rlimit *rlim_stack)
>> |=A0 {
>> |=A0=A0=A0=A0=A0=A0=A0=A0 unsigned long random_factor =3D 0UL;
>> |
>> | -=A0=A0=A0=A0=A0=A0 if (current->flags & PF_RANDOMIZE)
>> | -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 random_factor =3D arch_mma=
p_rnd();
>> | +/*=A0=A0=A0=A0 if (current->flags & PF_RANDOMIZE)
>> | +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 random_factor =3D arch_mma=
p_rnd();*/
>> |
>> |=A0=A0=A0=A0=A0=A0=A0=A0 if (mmap_is_legacy(rlim_stack)) {
>> |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mm->mmap_base =3D TASK=
_UNMAPPED_BASE + random_factor;
>>
>> I have also tried to play with vm.mmap_rnd_bits, but it seems that it
>> doesn't have any real effect. =

> =

> That's too bad because this is the only riscv specific thing in this =

> feature. And it is used by arm, arm64 and mips so we should be looking =

> at something riscv specific here, but right now I don't know what.
> =

> I will take a look at that.
> =

> Thanks,
> =

> Alex
> =

> I however noticed that setting this value
>> to 24 (the maximum) might move the heap next to the stack in some cases,
>> although it seems unrelated to the original issue:
>>
>> | $ cat /proc/self/maps
>> | 340fde4000-340fe06000 rw-p 00000000 00:00 0
>> | 340fe06000-340ff08000 r-xp 00000000 fe:01 =

>> 1835219=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 /lib/riscv64-linux-gnu/libc-2.30.so
>> | 340ff08000-340ff09000 ---p 00102000 fe:01 =

>> 1835219=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 /lib/riscv64-linux-gnu/libc-2.30.so
>> | 340ff09000-340ff0c000 r--p 00102000 fe:01 =

>> 1835219=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 /lib/riscv64-linux-gnu/libc-2.30.so
>> | 340ff0c000-340ff0f000 rw-p 00105000 fe:01 =

>> 1835219=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 /lib/riscv64-linux-gnu/libc-2.30.so
>> | 340ff0f000-340ff14000 rw-p 00000000 00:00 0
>> | 340ff1d000-340ff1f000 r-xp 00000000 00:00 =

>> 0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 [vdso]
>> | 340ff1f000-340ff36000 r-xp 00000000 fe:01 =

>> 1835039=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 /lib/riscv64-linux-gnu/ld-2.30.so
>> | 340ff36000-340ff37000 r--p 00016000 fe:01 =

>> 1835039=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 /lib/riscv64-linux-gnu/ld-2.30.so
>> | 340ff37000-340ff38000 rw-p 00017000 fe:01 =

>> 1835039=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 /lib/riscv64-linux-gnu/ld-2.30.so
>> | 340ff38000-340ff39000 rw-p 00000000 00:00 0
>> | 3924505000-392450b000 r-xp 00000000 fe:01 =

>> 1048640=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 /bin/cat
>> | 392450b000-392450c000 r--p 00005000 fe:01 =

>> 1048640=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 /bin/cat
>> | 392450c000-392450d000 rw-p 00006000 fe:01 =

>> 1048640=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 /bin/cat
>> | 3955e23000-3955e44000 rw-p 00000000 00:00 =

>> 0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 [heap]
>> | 3fffa2b000-3fffa4c000 rw-p 00000000 00:00 =

>> 0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 [stack]
>>
>> To come back to the original issue, I don't know how to debug it
>> further. I have already tried to get a core dump and analyze it with
>> GDB, but the code triggering the failure is not part of the binary. Any
>> hint or help would be welcomed.
>>
>> Thanks,
>> Aurelien
>>
>>
>> [1] Technically the qtbase-opensource-src Debian package:
>> =A0=A0=A0=A0 https://packages.debian.org/source/sid/qtbase-opensource-src
>>
> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

I have a debian kernel downloaded from here =

https://people.debian.org/~gio/dqib/ that runs using the following qemu =

command:

qemu-system-riscv64 -machine virt -cpu rv64 -m 1G -device =

virtio-blk-device,drive=3Dhd -drive file=3Dimage.qcow2,if=3Dnone,id=3Dhd -d=
evice =

virtio-net-device,netdev=3Dnet -netdev user,id=3Dnet,hostfwd=3Dtcp::2222-:2=
2 =

-bios ~/wip/lpc/buildroot/build_rv64/images/fw_jump.elf -kernel kernel =

-initrd initrd -object rng-random,filename=3D/dev/urandom,id=3Drng -device =

virtio-rng-device,rng=3Drng -nographic -append "root=3D/dev/vda1 console=3D=
ttyS0"

First is this kernel version ok to reproduce the bug ? Or should I =

download another image ? I'd like to avoid having to rebuild the kernel =

myself if possible.

Now I would like to reproduce the bug: can you give me instructions on =

how to compile the qt package ?

Is the page fault address always in the same area ? It might be =

interesting to find some pattern in those addresses, maybe you could =

also print the random offset to try to link both ? Also print the entire =

virtual memory mapping at the time of the fault (I don't know how to do =

that) to check what the address is close to ? The 0xd cause implies that =

the virtual address does not exist at all, which is weird, my guess is =

that the randomization "reveals" the bug but that the bug is still there =

once the randomization is disabled.

I'm sorry I don't have much more to propose here :(

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
