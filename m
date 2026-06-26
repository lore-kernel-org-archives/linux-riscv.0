Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2377C43327
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 14:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UcHtKydtKbgx6Vx4VtZhFshu4c4MccsTsn2t/DyFir8=; b=wRFFcHr8HlqdKjjib2jhbMPWi8
	NxwipCXV3EBXMsKuBetmhNkkD+yb3Mfd7L1Io2AmJvsEgETqRtDhTBKifNHiYLeZkjmnYCZOjnxaT
	oNchOgU2GpcDbmLpiSRM6/UPk6xUp2cNMPuGu8NtEYZqMfQJDILBao1R6sdMkiaBf3xKUPXz7aajj
	+a8mQnG1WL5VXa8a+S2Nl4ORa1GNCVnldN2ONooiYsyaQiwe2/3030EnONLJCjXjLRB5tpwYyrJad
	lPEvWblCgVyG7wH4OTBg2wdaIbxSJLD8rPKd2I1J6JKP2n10PQpTmyRuGGwoEhy5rEQcVJkufRBhH
	EfGJOH4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7iY-0000000BTrG-1v9P;
	Fri, 26 Jun 2026 14:39:42 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7iU-0000000BTph-2rmA
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 14:39:41 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gmyxH6lZ5z9v5T;
	Fri, 26 Jun 2026 16:39:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mssola.com; s=MBO0001;
	t=1782484772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6QuIfY6oUwtWtwewOgfdOd/x8weQfNgnxAwil5W3gLI=;
	b=ykDHQmFYjumzd+TXQ5oFkWpnKZNRRyRrbH9ipSHjxs8fhCCHaz3N+/GYwXahU43DrHof9K
	SgRDRC2iV7fgS46iknpgSABqLaHI0PQ+IBvbAnzSzDUnPRLV/2tUvEDyyf6yNtbBFC78B0
	yIhqeerGJLJZ7rItolOTOhzev1pdKi2CcBw9yStpkBzJiK56OwpFJEqiQ02/JZtDiTVJfP
	PdUEzbxCfkqXDzSMxZnwb4vhzu7LCYscMXUJ8fw0Bkkd/BxYjcEMoTr4Qv8uCIMcsJLqwk
	ZOh03kAtimq13j6kLYPUBqb+5tgjUaaFb3ZQ0/95A/6cGZ9vj6IWH33PaYcRww==
From: =?utf-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mssola@mssola.com>
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org,  corbet@lwn.net,
  skhan@linuxfoundation.org,  palmer@dabbelt.com,  alex@ghiti.fr,
  linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] riscv: enable HAVE_CMPXCHG_{DOUBLE,LOCAL}
In-Reply-To: <87a4t6w0gi.fsf@> ("Miquel =?utf-8?Q?Sabat=C3=A9_Sol=C3=A0=22?=
 =?utf-8?Q?'s?= message of "Sun, 07 Jun
	2026 22:38:05 +0200")
References: <20260605141247.253315-1-mssola@mssola.com>
	<f63eefc9-769d-409c-4099-274254432129@kernel.org>
Date: Fri, 26 Jun 2026 16:39:27 +0200
Message-ID: <87ldc12wo0.fsf@mssola.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_073938_951335_16759BD9 
X-CRM114-Status: GOOD (  47.30  )
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
Content-Type: multipart/mixed; boundary="===============5678946602673147374=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5678946602673147374==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Miquel Sabat=C3=A9 Sol=C3=A0 @ 2026-06-07 22:38 +02:

> Hi,
>
> Paul Walmsley @ 2026-06-06 18:50 -06:
>
>> Hi,
>>
>> On Fri, 5 Jun 2026, Miquel Sabat=C3=A9 Sol=C3=A0 wrote:
>>
>>> Support for atomic Compare-And-Swap instructions has been in the RISC-V
>>> port of the Linux kernel for a long time. That being said, we apparently
>>> never bothered to set HAVE_CMPXCHG_DOUBLE and HAVE_CMPXCHG_LOCAL in the
>>> Kconfig, despite having all the framework to support them.
>>>
>>> Signed-off-by: Miquel Sabat=C3=A9 Sol=C3=A0 <mssola@mssola.com>
>>> ---
>>> This is a resend of [1], rebased on top of the latest commit from the
>>> for-next branch.
>>>
>>> I have built this patch with multiple configurations and ran it with KVM
>>> (the VisionFive2 board that I have lacks the needed extensions). All se=
ems
>>> to work, but I do wonder if we did not enable these for a reason or this
>>> just slipped through. So far in the code I believe everything is in pla=
ce,
>>> and I haven't seen any commit in the git log stating otherwise.
>>>
>>> [1] https://lore.kernel.org/all/20260220074449.8526-1-mssola@mssola.com/
>>
>> Thanks for the patch.  Your comments above are why I've been hesitant to
>> merge it.  I'm not aware of any publicly available hardware that supports
>> Zacas/Zabha.  No one has stepped forward to provide any Tested-by:s on
>> hardware that hasn't been released yet.  You mention that you tested on
>> your VisionFive2 board, but it would not have exercised those code paths.
>
> No, I mention that I ran it _only_ on KVM, as my VisionFive2 board lacks
> these extensions and hence I couldn't possible have tested this there :)
>
>>
>> Of course, we already have Zacas/Zabha support, merged back in 2024, in
>> cmpxchg.h.  I assume (?) that it was tested in QEMU, but I don't see any
>> comments about that in the patch series.  No one sent any Tested-by:s
>> then, either.
>>
>> It would be good if you (and ideally others) could put this patch through
>> some testing on QEMU with Zacas and Zabha enabled, before we merge it.
>> The affected code paths for HAVE_CMPXCHG_LOCAL seem to primarily involve
>> per-CPU counters and MM zone counters, so those would be the areas to
>> focus.  HAVE_CMPXCHG_DOUBLE seems to do nothing useful other than
>> preventing the AMD IOMMU driver from being selected if it's not present,
>> so that part of the patch seems fairly useless.  In fact I'd suggest
>> dropping that from the patch and just sending a separate patch to remove
>> HAVE_CMPXCHG_DOUBLE from the kernel completely.
>
> To be fair, on QEMU I only "tested" it by booting it, running a few
> things for some time and ensuring that nothing got totally broken in the
> process while taking a look at the kernel logs.
>
> In any case, let me double check with QEMU with these extensions enabled
> and I'll try to be more thorough about it. I'll do just that whenever I
> have some spare time during the following week :)

So much for "the following week" :) Sorry for being a bit late.

I have finally taken a deeper look at this, and I have the following
comments that I hope you can further clarify so we can land a more
precise patch.

First of all, HAVE_CMPXCHG_LOCAL is fundamentally used in two places: in
mm/vmstat.c and in lib/percpu_counter.c. In the latter it is used in the
percpu_counter_add_batch() function, which is used tree-wide. Hence,
selecting this config option has a wide effect.

As far as I can tell, both HAVE_CMPXCHG_LOCAL and HAVE_CMPXCHG_DOUBLE
could have been added in this patch series [1] by Alexandre Ghiti, but
I've been unable to tell how it was actually tested (no mentions on that
on no Tested-by either). On my side, the board I have doesn't have
neither Zacas nor the Zabha extensions so, as I mentioned on my previous
email, I have to test everything via KVM.

Having that into account, if I build the kernel with or without the
patch applied, functions like percpu_counter_add_batch() have a
different implementation, as expected (good ol' objdump -d vmlinux
=2D-disassemble=3Dpercpu_counter_add_batch confirmed as much); and from a
general outlook, the given assembly code is what I'd expect. In order to
test it, I have to say that I've relied on checking that selftests and
similar continue to pass before/after the patch. In particular, I've run
the selftests from btrfs, and they seem just fine (and toggling a
breakpoint inside of percpu_counter_add_batch() confirms that it's being
constantly called, so we are definitely calling the "new" code).

>
> As for HAVE_CMPXCHG_DOUBLE, removing it makes sense. Let me just take
> another look and I will send a separate patch whenever I'm ready for it.

Here I'm a bit conflicted, because you mentioned that it's only used for th=
e AMD
IOMMU driver, but support on different architectures like 5284e1b4bc8a ("ar=
m64:
xchg: Implement cmpxchg_double") or f0e4b1b6e295 ("LoongArch: Add 128-bit a=
tomic
cmpxchg support") hint into other places where this is needed. In fact, for
loongarch, it's apparently needed to fix multiple tests on sched_ext. Thus,=
 I
believe that sending a patch to drop it from the kernel would be misguided.

As for RISC-V, first of all I believe that my patch should've also included=
 that
HAVE_CMPXCHG_DOUBLE can only be selected on CONFIG_64BIT. In fact, commit
f7bd2be7663c ("riscv: Implement arch_cmpxchg128() using Zacas"), which brin=
gs
support for this (again, from the same series [1]), also requires this
configuration option. That being said, this commit doesn't say how it was
tested, and there are not Tested-by either. On my end, so far I got no luck
trying the sched_ext route mentioned in the loongarch support, which is a b=
it of
a hussle in KVM with cross-compilation and the library requirements.

But as a final note, I have used hackbench on this. I have statically compi=
led
hackbench from source [2] at commit e6fb0b2c8ad1 ("rt-tests: Add AGENTS.md =
guide
for AI coding assistants") (i.e. current master). This binary has been depl=
oyed
in three iterations where the kernel was built as:

1. Before the patch.
2. With the patch (both HAVE_CMPXCHG_LOCAL and HAVE_CMPXCHG_DOUBLE selected=
).
3. With only HAVE_CMPXCHG_LOCAL selected.

Again, given that I can only test this on QEMU, this whole thing is tested =
on
virtualized environments, so take it with a grain of salt :)

In any case, I got the following results:

|        | Mainline | Both selected | Only _LOCAL selected |
|--------+----------+---------------+----------------------|
| Mean   |  50.9966 |       54.2076 |              51.6488 |
| StdDev |   0.1508 |        0.1097 |               0.7051 |

As you can see, the results on Mainline and "only _LOCAL selected" are more=
 or
less the same, but not so much whenever _DOUBLE is also selected. I figure =
that
that these instructions are not as fast as expected on my virtualized
environment.

With all of this, I'm torned on whether we should include HAVE_CMPXCHG_DOUB=
LE,
as code-wise is pretty much the same as HAVE_CMPXCHG_LOCAL, but I can also =
see
how it can be removed as I cannot properly test it. As a middle ground, may=
be we
can leave a TODO in __arch_cmpxchg128() asking to introduce HAVE_CMPXCHG_DO=
UBLE
whenever someone can actually test it and guarantee that there are no
performance penalties as I saw on my virtualized environment.

And that's enough of my rumblings :) I'd appreciate any comments on this.

Thanks,
Miquel

[1] https://lore.kernel.org/all/20241103145153.105097-1-alexghiti@rivosinc.=
com/
[2] https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git

>
>>
>>
>> - Paul
>
> Thanks for your input!
> Miquel
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJiBAEBCgBMFiEEG6U8esk9yirP39qXlr6Mb9idZWUFAmo+jx8bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyEhxtc3NvbGFAbXNzb2xhLmNvbQAKCRCWvoxv2J1l
ZSkEEAC/UJnS2KUqUtMvQtktarz+n+vlPlB+5/s4hDStCIDX2OXJ0wTC5urKFvO4
lJ91/tLQ/ZBwoCcRAFLlikFGfXYJ4PCbZrXnGhwLOfgZXLPrZUOc5iUm1UskgR09
CR9gTnUCNTmzCuShFqyZyAZcuXUJxOYtL3nP5/JPQed6OmkfLxQAwlJVxz8bzyHS
S8QXnzLDbbukp//wVuDG6NUgkFpnuEpIP1zgu4LZl13topSFdFTR1NvEl2AsjsZf
jhXwIgJ+sa9ErgC24EVN4xDpBPYlhVa047TRHtx9pU2RqRPO3Dd6bN5UcNXzBVcv
luDu3Mf1XM9K1WN6mE+JaLXuY4vGV2iojK/mbY0wlrZTEH9L74vACXd62Ey5Q6hy
ls4z3w1KA97d339KWb1NoM5jTb2D9dNsqWQasav/jmt7XIZFFlRQsWtmOk32ss/z
cVy1K8J7/6CVn69KyEkvSYLega4cIJZLgV9PCKbR3ZiVQFubsYd8oynqPNs3Djs4
k4Ybw4DgqkH6MHY34UjoCm4qwEEdt8GBO3tALDDEV26n0848CMEhCZHIjc+pvv2f
aoxCbdbG7ApeTchHLSWiQac0Gebv9F5Z4uYoyKM0I07clKB4/iVPFD1lFoHPtQSn
DmIpdyvkFIBuei+/t3NW7Sz33lUxZ3r7gP+mx/WDk9+W+3JnUg==
=FCGf
-----END PGP SIGNATURE-----
--=-=-=--


--===============5678946602673147374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5678946602673147374==--

