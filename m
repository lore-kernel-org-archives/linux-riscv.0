Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E75C433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 10:49:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8230206DF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 10:49:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A3inbytT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8230206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2IUj/RlCh5QWMFLFbZMg/kjmtkIakzUl8ua/lcDzkXY=; b=A3inbytTRdc21lYqnB94xU5Tb
	SXYXnW0rbQfVBjn4dTrMLlFke6oeNBYbuVNT1Bon3ccjzO8d7jZt9sMy0ymv39c9ln8epbmjGexkm
	Jhw8cDdvTOeGxkDJczm7SDr0Nl2wTrCLwu8yNz+bb/GUamoXxG5gTIkGrlXZbLH8Lvw3fdfdZnUgv
	CkeOQJenqqBRTWwBprSeVQw+btwqMwb75r1hzr0LP8ldbNYruYpIztqHnDjlHR2cy//AKKAKYniYw
	cLc7WCLJrS8lltgU555iDx7RxNg7P4oURMFoB3rCe9Q3+yce65uGjoh3+Zs8IWShAehQ1J5FMe1OE
	5J20tfPdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtU7k-0001z8-5Z; Thu, 09 Jul 2020 10:49:52 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtU7g-0001y4-EH
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 10:49:49 +0000
Received: from [10.30.1.142] (lneuilly-657-1-5-103.w81-250.abo.wanadoo.fr
 [81.250.144.103]) (Authenticated sender: alex@ghiti.fr)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id F0D75100004;
 Thu,  9 Jul 2020 10:49:44 +0000 (UTC)
Subject: Re: Random, rare, but reproducible segmentation faults
To: Aurelien Jarno <aurelien@aurel32.net>, linux-riscv@lists.infradead.org
References: <20200708202844.GA2075303@aurel32.net>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <b7de2a27-d3b4-194e-2f80-664406055494@ghiti.fr>
Date: Thu, 9 Jul 2020 06:49:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200708202844.GA2075303@aurel32.net>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_064948_680666_C7A03CE8 
X-CRM114-Status: GOOD (  26.51  )
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

Le 7/8/20 =E0 4:28 PM, Aurelien Jarno a =E9crit=A0:
> Hi all,
> =

> For some time I have seen random but relatively rare segmentation faults
> when building Debian packages, either in a QEMU virtual machine or an
> Hifive Unleashed board. I have recently been able to reproduce the issue
> by building Qt [1]. It usually fails after roughly one hour of build,
> not always on the same C++ file, but always on the same set of files.
> Trying to run make again the build is usually successful. When it
> happens one get the following error from GCC:
> =

> | g++: internal compiler error: Segmentation fault signal terminated prog=
ram cc1plus
> | Please submit a full bug report,
> | with preprocessed source if appropriate.
> =

> And the following kernel error:
> =

> | [267054.967857] cc1plus[1171618]: unhandled signal 11 code 0x1 at 0x000=
000156888a430 in cc1plus[10000+e0e000]
> | [267054.976759] CPU: 3 PID: 1171618 Comm: cc1plus Not tainted 5.7.7+ #1
> | [267054.983101] epc: 0000000000a70e3e ra : 0000000000a71dbe sp : 000000=
3ffff3c870
> | [267054.990293]  gp : 0000000000e33158 tp : 000000156a0f0720 t0 : 00000=
01569feb0d0
> | [267054.997593]  t1 : 0000000000182a2c t2 : 0000000000e30620 s0 : 00000=
0000003b7c0
> | [267055.004880]  s1 : 000000000003b7c0 a0 : 000000156888a420 a1 : 00000=
0000003b7c0
> | [267055.012176]  a2 : 0000000000000002 a3 : 000000000003b7c0 a4 : 00000=
0000003b7c0
> | [267055.019473]  a5 : 0000000000000001 a6 : 61746e656d676553 a7 : 73737=
350581f0402
> | [267055.026763]  s2 : 0000003ffff3c8c8 s3 : 000000156888a420 s4 : 00000=
0007fffffff
> | [267055.034052]  s5 : 0000000070000000 s6 : 0000000000000000 s7 : 00000=
03ffff3d638
> | [267055.041345]  s8 : 0000000000e9ab18 s9 : 0000000000000000 s10: 00000=
00000e9a9d0
> | [267055.048636]  s11: 0000000000000000 t3 : 000000156888a420 t4 : 00000=
00000000001
> | [267055.055930]  t5 : 0000000000000001 t6 : 0000000000000000
> | [267055.061311] status: 8000000200006020 badaddr: 000000156888a430 caus=
e: 000000000000000d
> =

> I have been able to bisect the issue and found it has been introduced by
> this commit:
> =

> |=A0commit 54c95a11cc1b5e1d578209e027adf5775395dafd
> | Author: Alexandre Ghiti <alex@ghiti.fr>
> | Date:   Mon Sep 23 15:39:21 2019 -0700
> |
> |     riscv: make mmap allocation top-down by default
> |
> |     In order to avoid wasting user address space by using bottom-up mmap
> |     allocation scheme, prefer top-down scheme when possible.
> =

> Reverting this commit, even on 5.7.7, fixes the issue. I debugged things
> a bit more, and found that the problem doesn't come from the top-down
> allocation (i.e. setting vm.legacy_va_layout to 1 doesn't change
> anything). However I have found it comes from the randomization, I mean
> that the following patch is enough to fix (or workaround?) the issue:
> =

> | --- a/mm/util.c
> | +++ b/mm/util.c
> | @@ -397,8 +397,8 @@ void arch_pick_mmap_layout(struct mm_struct *mm, st=
ruct rlimit *rlim_stack)
> |  {
> |         unsigned long random_factor =3D 0UL;
> |
> | -       if (current->flags & PF_RANDOMIZE)
> | -               random_factor =3D arch_mmap_rnd();
> | +/*     if (current->flags & PF_RANDOMIZE)
> | +               random_factor =3D arch_mmap_rnd();*/
> |
> |         if (mmap_is_legacy(rlim_stack)) {
> |                 mm->mmap_base =3D TASK_UNMAPPED_BASE + random_factor;
> =

> I have also tried to play with vm.mmap_rnd_bits, but it seems that it
> doesn't have any real effect. =


That's too bad because this is the only riscv specific thing in this =

feature. And it is used by arm, arm64 and mips so we should be looking =

at something riscv specific here, but right now I don't know what.

I will take a look at that.

Thanks,

Alex

I however noticed that setting this value
> to 24 (the maximum) might move the heap next to the stack in some cases,
> although it seems unrelated to the original issue:
> =

> | $ cat /proc/self/maps
> | 340fde4000-340fe06000 rw-p 00000000 00:00 0
> | 340fe06000-340ff08000 r-xp 00000000 fe:01 1835219                      =
  /lib/riscv64-linux-gnu/libc-2.30.so
> | 340ff08000-340ff09000 ---p 00102000 fe:01 1835219                      =
  /lib/riscv64-linux-gnu/libc-2.30.so
> | 340ff09000-340ff0c000 r--p 00102000 fe:01 1835219                      =
  /lib/riscv64-linux-gnu/libc-2.30.so
> | 340ff0c000-340ff0f000 rw-p 00105000 fe:01 1835219                      =
  /lib/riscv64-linux-gnu/libc-2.30.so
> | 340ff0f000-340ff14000 rw-p 00000000 00:00 0
> | 340ff1d000-340ff1f000 r-xp 00000000 00:00 0                            =
  [vdso]
> | 340ff1f000-340ff36000 r-xp 00000000 fe:01 1835039                      =
  /lib/riscv64-linux-gnu/ld-2.30.so
> | 340ff36000-340ff37000 r--p 00016000 fe:01 1835039                      =
  /lib/riscv64-linux-gnu/ld-2.30.so
> | 340ff37000-340ff38000 rw-p 00017000 fe:01 1835039                      =
  /lib/riscv64-linux-gnu/ld-2.30.so
> | 340ff38000-340ff39000 rw-p 00000000 00:00 0
> | 3924505000-392450b000 r-xp 00000000 fe:01 1048640                      =
  /bin/cat
> | 392450b000-392450c000 r--p 00005000 fe:01 1048640                      =
  /bin/cat
> | 392450c000-392450d000 rw-p 00006000 fe:01 1048640                      =
  /bin/cat
> | 3955e23000-3955e44000 rw-p 00000000 00:00 0                            =
  [heap]
> | 3fffa2b000-3fffa4c000 rw-p 00000000 00:00 0                            =
  [stack]
> =

> To come back to the original issue, I don't know how to debug it
> further. I have already tried to get a core dump and analyze it with
> GDB, but the code triggering the failure is not part of the binary. Any
> hint or help would be welcomed.
> =

> Thanks,
> Aurelien
> =

> =

> [1] Technically the qtbase-opensource-src Debian package:
>      https://packages.debian.org/source/sid/qtbase-opensource-src
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
