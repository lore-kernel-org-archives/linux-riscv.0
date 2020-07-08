Return-Path: <SRS0=nZh1=AT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6551C433DF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2020 20:29:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52F9A20720
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2020 20:29:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DfVdH8+h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="q1PXl1al"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52F9A20720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aurel32.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gj2fFeD5oT3MIGnmdHRJf1OFt+ruhFQ6KmPBut/xjJw=; b=DfVdH8+hxXFnjdmDh432+y+vOd
	vFOeI9fl95ipSIqxzfT9FZ3PO8bsTLAsVeJq/PHwADQpLvxLGQ64anEA5KFEjofzq7NaWMM4m6OsK
	XOF4bN96+LgnVscOskKdZkD+UlESonm5krigvovy+C3hzX/kuhjForcZRAyZghcNMsuhODoMbpNUQ
	AJDYbM0wJXkSkPid1Y4onhyHoXuI2LieAhd2JJ2LvkHXBb5g9DLm4EszlOi5ifyDQeEXjRhnXunif
	9gZZ7rRvhQpJJb+cdwJ94e1g0HOI9gHGIym1sN2+Yw0JECce16j4JfgXwKoALyFBvyiZaQOtNCgvT
	0rrtVw2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtGge-0007h4-L3; Wed, 08 Jul 2020 20:29:00 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtGgb-0007es-4F
 for linux-riscv@lists.infradead.org; Wed, 08 Jul 2020 20:28:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
 ; s=202004.hall;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:From:Reply-To:Subject:Content-ID:
 Content-Description:In-Reply-To:References:X-Debbugs-Cc;
 bh=CHqDAkezNB3SXgVuRagOunuxvNQetFpMYpASSesB8wk=; b=q1PXl1al1E9NbhzcHCzwY3t3vS
 sWeg7XLpTOa1a7cjKDGgK6pLPpu8ePPgH29SBBx/WvAy/+A06P359/qaOYC5adbpfJwHh1A3koM4Y
 C1ORJjmr0XvaCUR+y/8zsp65fUJHJY0iJqHKaMHBMBJilUC89HISXZUXmyJW3MMK9fewsORTY1GKP
 nGQ9fUAwyEeCoV1l270AnBikpa35tjhju5a+YAdgOEvWaiOFTpvfod3/Uu9KXiCL/21HKOoEbHxg3
 ZfjASHU1n8fTwk0qrDda3H59AW+471tjzi2qNaK1VHDiSnhlhPEKtHsG16m3+nhpMB2DcgK31rZIW
 V0wrZBUw==;
Received: from [2a01:e35:2fdd:a4e1:fe91:fc89:bc43:b814] (helo=ohm.rr44.fr)
 by hall.aurel32.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <aurelien@aurel32.net>)
 id 1jtGgR-0004qk-3M; Wed, 08 Jul 2020 22:28:47 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.94)
 (envelope-from <aurelien@aurel32.net>)
 id 1jtGgP-008iGT-0G; Wed, 08 Jul 2020 22:28:45 +0200
Date: Wed, 8 Jul 2020 22:28:44 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-riscv@lists.infradead.org
Subject: Random, rare, but reproducible segmentation faults
Message-ID: <20200708202844.GA2075303@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.14.0 (2020-05-02)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_162857_462748_A4B242EA 
X-CRM114-Status: GOOD (  14.81  )
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
Cc: Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi all,

For some time I have seen random but relatively rare segmentation faults
when building Debian packages, either in a QEMU virtual machine or an
Hifive Unleashed board. I have recently been able to reproduce the issue
by building Qt [1]. It usually fails after roughly one hour of build,
not always on the same C++ file, but always on the same set of files.
Trying to run make again the build is usually successful. When it
happens one get the following error from GCC:

| g++: internal compiler error: Segmentation fault signal terminated progra=
m cc1plus
| Please submit a full bug report,
| with preprocessed source if appropriate.

And the following kernel error:

| [267054.967857] cc1plus[1171618]: unhandled signal 11 code 0x1 at 0x00000=
0156888a430 in cc1plus[10000+e0e000]
| [267054.976759] CPU: 3 PID: 1171618 Comm: cc1plus Not tainted 5.7.7+ #1
| [267054.983101] epc: 0000000000a70e3e ra : 0000000000a71dbe sp : 0000003f=
fff3c870
| [267054.990293]  gp : 0000000000e33158 tp : 000000156a0f0720 t0 : 0000001=
569feb0d0
| [267054.997593]  t1 : 0000000000182a2c t2 : 0000000000e30620 s0 : 0000000=
00003b7c0
| [267055.004880]  s1 : 000000000003b7c0 a0 : 000000156888a420 a1 : 0000000=
00003b7c0
| [267055.012176]  a2 : 0000000000000002 a3 : 000000000003b7c0 a4 : 0000000=
00003b7c0
| [267055.019473]  a5 : 0000000000000001 a6 : 61746e656d676553 a7 : 7373735=
0581f0402
| [267055.026763]  s2 : 0000003ffff3c8c8 s3 : 000000156888a420 s4 : 0000000=
07fffffff
| [267055.034052]  s5 : 0000000070000000 s6 : 0000000000000000 s7 : 0000003=
ffff3d638
| [267055.041345]  s8 : 0000000000e9ab18 s9 : 0000000000000000 s10: 0000000=
000e9a9d0
| [267055.048636]  s11: 0000000000000000 t3 : 000000156888a420 t4 : 0000000=
000000001
| [267055.055930]  t5 : 0000000000000001 t6 : 0000000000000000
| [267055.061311] status: 8000000200006020 badaddr: 000000156888a430 cause:=
 000000000000000d

I have been able to bisect the issue and found it has been introduced by
this commit:

|=A0commit 54c95a11cc1b5e1d578209e027adf5775395dafd
| Author: Alexandre Ghiti <alex@ghiti.fr>
| Date:   Mon Sep 23 15:39:21 2019 -0700
|
|     riscv: make mmap allocation top-down by default
|
|     In order to avoid wasting user address space by using bottom-up mmap
|     allocation scheme, prefer top-down scheme when possible.

Reverting this commit, even on 5.7.7, fixes the issue. I debugged things
a bit more, and found that the problem doesn't come from the top-down
allocation (i.e. setting vm.legacy_va_layout to 1 doesn't change
anything). However I have found it comes from the randomization, I mean
that the following patch is enough to fix (or workaround?) the issue:

| --- a/mm/util.c
| +++ b/mm/util.c
| @@ -397,8 +397,8 @@ void arch_pick_mmap_layout(struct mm_struct *mm, stru=
ct rlimit *rlim_stack)
|  {
|         unsigned long random_factor =3D 0UL;
|  =

| -       if (current->flags & PF_RANDOMIZE)
| -               random_factor =3D arch_mmap_rnd();
| +/*     if (current->flags & PF_RANDOMIZE)
| +               random_factor =3D arch_mmap_rnd();*/
|  =

|         if (mmap_is_legacy(rlim_stack)) {
|                 mm->mmap_base =3D TASK_UNMAPPED_BASE + random_factor;

I have also tried to play with vm.mmap_rnd_bits, but it seems that it
doesn't have any real effect. I however noticed that setting this value
to 24 (the maximum) might move the heap next to the stack in some cases,
although it seems unrelated to the original issue:

| $ cat /proc/self/maps
| 340fde4000-340fe06000 rw-p 00000000 00:00 0 =

| 340fe06000-340ff08000 r-xp 00000000 fe:01 1835219                        =
/lib/riscv64-linux-gnu/libc-2.30.so
| 340ff08000-340ff09000 ---p 00102000 fe:01 1835219                        =
/lib/riscv64-linux-gnu/libc-2.30.so
| 340ff09000-340ff0c000 r--p 00102000 fe:01 1835219                        =
/lib/riscv64-linux-gnu/libc-2.30.so
| 340ff0c000-340ff0f000 rw-p 00105000 fe:01 1835219                        =
/lib/riscv64-linux-gnu/libc-2.30.so
| 340ff0f000-340ff14000 rw-p 00000000 00:00 0 =

| 340ff1d000-340ff1f000 r-xp 00000000 00:00 0                              =
[vdso]
| 340ff1f000-340ff36000 r-xp 00000000 fe:01 1835039                        =
/lib/riscv64-linux-gnu/ld-2.30.so
| 340ff36000-340ff37000 r--p 00016000 fe:01 1835039                        =
/lib/riscv64-linux-gnu/ld-2.30.so
| 340ff37000-340ff38000 rw-p 00017000 fe:01 1835039                        =
/lib/riscv64-linux-gnu/ld-2.30.so
| 340ff38000-340ff39000 rw-p 00000000 00:00 0 =

| 3924505000-392450b000 r-xp 00000000 fe:01 1048640                        =
/bin/cat
| 392450b000-392450c000 r--p 00005000 fe:01 1048640                        =
/bin/cat
| 392450c000-392450d000 rw-p 00006000 fe:01 1048640                        =
/bin/cat
| 3955e23000-3955e44000 rw-p 00000000 00:00 0                              =
[heap]
| 3fffa2b000-3fffa4c000 rw-p 00000000 00:00 0                              =
[stack]

To come back to the original issue, I don't know how to debug it
further. I have already tried to get a core dump and analyze it with
GDB, but the code triggering the failure is not part of the binary. Any
hint or help would be welcomed.

Thanks,
Aurelien


[1] Technically the qtbase-opensource-src Debian package:
    https://packages.debian.org/source/sid/qtbase-opensource-src

-- =

Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
