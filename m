Return-Path: <SRS0=zqna=AV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C79C433E1
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 20:38:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82E9C207BB
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 20:38:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l4TkjE8+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82E9C207BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1ciROMnc0o2tDrSKA+XlWRhRriCSVgw2Atk6qzPzLX0=; b=l4TkjE8+3JbPS3Et5fphyZaxD
	uNG6mMVgTNMKbTxgHdjl30yKNV23WxGumGOrfeLjigb+qKABe8SmOaEV7DmidWM0FoaXK4TwGpK2E
	l7UyFTSV/21YWSUxAQ/v2BzPbk3+q3Fq0g0dJaV71Tg1o/j/cOIgTmtarLN7r8+WSohmwjdTT8YOG
	2uJGFiVzF+TIFXDN2pjVUAlfFcz5ClrIr7fInkWYlpnuzihoreX8e/ymm2QFkPaJ1NoQg5kWKagds
	lx6ohn0waLHBRJsTSwQ4tqoRNkyfXfyDyIKnbsVsUI2hu8JYrp3aoptMcz7pM3KgoOJjKGTiKa5N0
	GcLaqZ/ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtzmH-0003LU-6n; Fri, 10 Jul 2020 20:37:49 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtzmE-0003Kc-En
 for linux-riscv@lists.infradead.org; Fri, 10 Jul 2020 20:37:47 +0000
X-Originating-IP: 90.112.45.105
Received: from [192.168.1.14] (lfbn-gre-1-325-105.w90-112.abo.wanadoo.fr
 [90.112.45.105]) (Authenticated sender: alex@ghiti.fr)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 07BC7FF807;
 Fri, 10 Jul 2020 20:37:41 +0000 (UTC)
Subject: Re: Random, rare, but reproducible segmentation faults
To: Aurelien Jarno <aurelien@aurel32.net>
References: <20200708202844.GA2075303@aurel32.net>
 <b7de2a27-d3b4-194e-2f80-664406055494@ghiti.fr>
 <c83cd510-b407-7f57-3850-de53653254dd@ghiti.fr>
 <20200710191250.GA2242132@aurel32.net>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <2fc1fd46-8377-2f06-8346-d5c587d2d18e@ghiti.fr>
Date: Fri, 10 Jul 2020 16:37:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200710191250.GA2242132@aurel32.net>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_163746_688795_BF547FCE 
X-CRM114-Status: GOOD (  28.93  )
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
Cc: linux-riscv@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Aur=E9lien,

Le 7/10/20 =E0 3:12 PM, Aurelien Jarno a =E9crit=A0:
> Hi Alex,
> =

> On 2020-07-10 01:15, Alex Ghiti wrote:
>> I have a debian kernel downloaded from here
>> https://people.debian.org/~gio/dqib/ that runs using the following qemu
>> command:
>>
>> qemu-system-riscv64 -machine virt -cpu rv64 -m 1G -device
>> virtio-blk-device,drive=3Dhd -drive file=3Dimage.qcow2,if=3Dnone,id=3Dhd=
 -device
>> virtio-net-device,netdev=3Dnet -netdev user,id=3Dnet,hostfwd=3Dtcp::2222=
-:22 -bios
>> ~/wip/lpc/buildroot/build_rv64/images/fw_jump.elf -kernel kernel -initrd
>> initrd -object rng-random,filename=3D/dev/urandom,id=3Drng -device
>> virtio-rng-device,rng=3Drng -nographic -append "root=3D/dev/vda1 console=
=3DttyS0"
>>
>> First is this kernel version ok to reproduce the bug ? Or should I downl=
oad
>> another image ? I'd like to avoid having to rebuild the kernel myself if
>> possible.
> =

> Yes, that should do it, it's running kernel 5.7.6 so enough to reproduce
> the issue. You just need to increase the memory a bit more (4 to 8GB)
> and add more CPU with for example -smp 4.

Ok thanks.

> =

>> Now I would like to reproduce the bug: can you give me instructions on h=
ow
>> to compile the qt package ?
> =

> The following sequence should allow you to build it:
> - sudo apt-get update
> - sudo apt-get install build-essential
> - sudo apt-get build-dep qtbase-opensource-src
> - apt-get source qtbase-opensource-src
> - cd qtbase-opensource-src-5.14.2+dfsg/
> - dpkg-buildpackage -B
> =

> Alternatively I can prepare you an image with everything ready.

I hope my laptop will survive that :)

> =

>> Is the page fault address always in the same area ? It might be interest=
ing
>> to find some pattern in those addresses, maybe you could also print the
>> random offset to try to link both ?
> =

> It seems really random to me, with 3 outliers:
> 0x0000003fe7ef3140
> 0x0000003fcd16cff0
> 0x0000003fb9e96170
> 0x0000003fd3f4a120
> 0x448173f67cdbc8b0
> 0x0000003fdfe093f0
> 0x0000003fdfe093f0
> 0x0000003fe1d4aa70
> 0x0000003fc2cfef90
> 0x0000003fc0f5d050
> 0x0000003fe1d879d0
> 0x0000003fe9d3e990
> 0xf0ef4585be2ae01f
> 0x00000034484f71b0
> 0x0000003fde30e960
> 0x000000156888a430
> 0x0000003eb8560936
> 0x0000003fb121a490
> 0x0000003fb9abddd0
> 0x0000003fe41fc5d0

Indeed, that's random. And the outliers are weird, at first sight I =

would say the userspace program is responsible for that, but that =

deserves more thinking.

> =

>> Also print the entire virtual memory
>> mapping at the time of the fault (I don't know how to do that) to check =
what
>> the address is close to ?
> =

> Yes, I'll try to find a way to do that.
> =


In case you want to try:

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c =


index ae7b7fe24658..32efe9e750d6 100644 =


--- a/arch/riscv/mm/fault.c =


+++ b/arch/riscv/mm/fault.c =


@@ -13,6 +13,7 @@ =


  #include <linux/perf_event.h> =


  #include <linux/signal.h> =


  #include <linux/uaccess.h> =


+#include <linux/dcache.h> =


 =


  #include <asm/pgalloc.h> =


  #include <asm/ptrace.h> =


@@ -166,6 +167,18 @@ asmlinkage void do_page_fault(struct pt_regs *regs) =


         mmap_read_unlock(mm); =


         /* User mode accesses just cause a SIGSEGV */ =


         if (user_mode(regs)) { =


+        char filename[512], *f; =


+ =


+        for (vma =3D mm->mmap; vma; vma =3D vma->vm_next) { =


+            f =3D filename; =


+            if (vma->vm_file) =


+                f =3D dentry_path_raw(vma->vm_file->f_path.dentry, =

filename, 512);
+            else =


+                strcpy(filename, "none"); =


+            pr_err("%px -> %px %s\n", =


+                    (void *)vma->vm_start, (void *)vma->vm_end, f); =


+        } =


+ =


                 do_trap(regs, SIGSEGV, code, addr); =


                 return; =


         }

which will result in something like that:
  # segfault
[   44.297718] 0000000000010000 -> 0000000000011000 /usr/bin/segfault
[   44.298067] 0000000000011000 -> 0000000000012000 /usr/bin/segfault
[   44.298346] 0000000000012000 -> 0000000000013000 /usr/bin/segfault
[   44.298623] 0000003fc89e8000 -> 0000003fc8b26000 /lib/libc-2.29.so
[   44.298897] 0000003fc8b26000 -> 0000003fc8b27000 /lib/libc-2.29.so
[   44.299171] 0000003fc8b27000 -> 0000003fc8b2b000 /lib/libc-2.29.so
[   44.299444] 0000003fc8b2b000 -> 0000003fc8b2d000 /lib/libc-2.29.so
[   44.299770] 0000003fc8b2d000 -> 0000003fc8b33000 none
[   44.300000] 0000003fc8b33000 -> 0000003fc8b34000 none
[   44.300225] 0000003fc8b34000 -> 0000003fc8b35000 none
[   44.300454] 0000003fc8b35000 -> 0000003fc8b52000 =

/lib/ld-linux-riscv64-lp64.so.1
[   44.300974] 0000003fc8b52000 -> 0000003fc8b53000 =

/lib/ld-linux-riscv64-lp64.so.1
[   44.301323] 0000003fc8b53000 -> 0000003fc8b54000 =

/lib/ld-linux-riscv64-lp64.so.1
[   44.301708] 0000003fc8b54000 -> 0000003fc8b55000 none
[   44.301986] 0000003fffbe1000 -> 0000003fffc02000 none
[   44.302684] segfault[123]: unhandled signal 11 code 0x1 at =

0x00000000007b3238 in segfault[10000+1000]
[   44.304009] CPU: 2 PID: 123 Comm: segfault Tainted: G      D =

  5.8.0-rc4 #23
[   44.304448] epc: 0000000000010450 ra : 0000003fc8a08250 sp : =

0000003fffc01c30

>> The 0xd cause implies that the virtual address
>> does not exist at all, which is weird, my guess is that the randomization
>> "reveals" the bug but that the bug is still there once the randomization=
 is
>> disabled.
> =

> I have also that feeling. It could even be a userland issue, with the
> userland not able to cope with some memory mapping.
> =

> Aurelien
> =


Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
