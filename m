Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F19FC4707C
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 04:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LHfPveQAjJ7VDA6T988yU9AU8EVcrd5b2Brg7vFMPHg=; b=agXiqtLaD8Gvgb
	LSE8R23jAqgZp7vMmL9Pb2U/6p3mPs2W5q/YaKHCAOmJNSaGdGmwAbJH6MmTKCZ935ljaUDWXjXWg
	KcBlu/ugwWeFRi4LeonaHaPpdiSHfglY4ZQ8mOnft6wWgUGxcEiSqShwgsf2c7Co7+1B40UJPoHz9
	CLX1Xwn8T5csnhjLJQWuLHbJ4wAYJlb9rSqzUnJH8Sd4UE2a4yyVB6UWYHelFQgn4SXwD4bJjjIdt
	7H5/Kdd8ZjH8u8++KuMDMtjwi0Xk4fy49reuMnNMDgG+D/qRumMQEUi075uHIO67lG/i0kgPhARFf
	oFYx3dLsfrDmNpHsTu6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNQcQ-00AKQI-1V;
	Wed, 10 Jan 2024 04:55:10 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNQcL-00AKOg-3C
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 04:55:09 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-7bc332d3a8cso254562139f.2
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jan 2024 20:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20230601.gappssmtp.com; s=20230601; t=1704862504; x=1705467304; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CzVp5mzD+Fj7TLL+nhaVBHlXPHxADhlYIbeceq4hmZc=;
        b=hpeiJu3lQPOIy5pxrPHbE0IqhJ9eLUhLcGWEBJL7ILu3RDr2TvWApPqR+X6bXvmfOR
         1nsjYuy5dhor/x5HC2nJznT90w0yF4XEyPMH89AiOgj/2SFqZ0jN8upheHxspJ5Yx6Co
         2JoXrSk6LNB1lHEvsZ1j12aIi85kH1l3aHR2U1NkVPHQ/LmqDen03fXOlVaaxsesBhYc
         eDKQx21JJmNXibjcDjqjog+eWhaD2K3K7591+6LlYbxcSNwFnebrgTTQoST38bNydgGy
         rkl4h8FzLypBJu+M8R/ldj3qgYqo9Vicf3OzyrCkNQsktfgEOTFHkOD0HK0V7f2zYGfc
         gbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704862504; x=1705467304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CzVp5mzD+Fj7TLL+nhaVBHlXPHxADhlYIbeceq4hmZc=;
        b=wDOaug9gfwqTQYPFmrOagUy9CWTTnKcsfdiI/hfhw0U2Jw2x6/mhSGWXuRCODmUXZq
         dTBrorUkSFsn3iTPXKruMtoOdoAanbHcKtLXTsNfmItAGGsYU1AqR9rnO9OhBlXL12bj
         zyWmH9Lod9pMInajHWiMusxvsKF5Xsy9nb4ycvOnykQRrellCxGl+0oG4xsqagiI9WKQ
         ENSGPngmCEDi/PBa0J2yA8JevvqhZ4xR5YElRal8Wv8PI9nkAtmgM9a4UjwbDvwDV7gz
         4ogwbvvyULoRJL0ojsf3AgyVCs/g3W/2nJEAGnlS0QvsBYwalIW+tHVIqWPb/F1mezmN
         yDog==
X-Gm-Message-State: AOJu0YxcjA/AhtloK/Zruvdjo2gbfYFztUNrbf/IXqn0bnpgoQm5JkPE
	duBp04jlIHKnHM4PVAIkASmoPT4UsstqNA==
X-Google-Smtp-Source: AGHT+IFb0/sWi2xHI0sNc7LK1zG0hgGtr9339MhRxKhI3GiazRtMe5O0d+j7I+eYAKtWStVTQG/jeg==
X-Received: by 2002:a6b:f307:0:b0:7be:f955:c5d6 with SMTP id m7-20020a6bf307000000b007bef955c5d6mr89967ioh.21.1704862503861;
        Tue, 09 Jan 2024 20:55:03 -0800 (PST)
Received: from [172.16.32.83] ([198.232.126.202])
        by smtp.gmail.com with ESMTPSA id b21-20020a5d8915000000b007bc3ebacf3esm93045ion.46.2024.01.09.20.55.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 20:55:03 -0800 (PST)
Message-ID: <a1842251-6b0d-6a8d-3781-fd04c66fa471@landley.net>
Date: Tue, 9 Jan 2024 23:01:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Automated-testing] Call for nommu LTP maintainer [was: Re:
 [PATCH 00/36] Remove UCLINUX from LTP]
Content-Language: en-US
To: "Bird, Tim" <Tim.Bird@sony.com>, Cyril Hrubis <chrubis@suse.cz>,
 Petr Vorel <pvorel@suse.cz>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>, Li Wang <liwang@redhat.com>,
 Andrea Cervesato <andrea.cervesato@suse.com>,
 Greg Ungerer <gerg@linux-m68k.org>, Jonathan Corbet <corbet@lwn.net>,
 Randy Dunlap <rdunlap@infradead.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Christophe Lyon <christophe.lyon@linaro.org>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 "automated-testing@lists.yoctoproject.org"
 <automated-testing@lists.yoctoproject.org>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Niklas Cassel <niklas.cassel@wdc.com>
References: <20240103015240.1065284-1-pvorel@suse.cz>
 <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
 <20240103114957.GD1073466@pevik>
 <CAMuHMdX0s0gLRoPtjJmDnSmZ_MNY590dN+JxM1HKAL1g_bjX+w@mail.gmail.com>
 <ZZVOhlGPg5KRyS-F@yuki> <5a1f1ff3-8a61-67cf-59a9-ce498738d912@landley.net>
 <20240105131135.GA1484621@pevik>
 <90c1ddc1-c608-30fc-d5aa-fdf63c90d055@landley.net>
 <20240108090338.GA1552643@pevik> <ZZvJXTshFUYSaMVH@yuki>
 <SA3PR13MB6372498CC6372F8B16237244FD6A2@SA3PR13MB6372.namprd13.prod.outlook.com>
From: Rob Landley <rob@landley.net>
In-Reply-To: <SA3PR13MB6372498CC6372F8B16237244FD6A2@SA3PR13MB6372.namprd13.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_205506_355517_273BA609 
X-CRM114-Status: GOOD (  62.86  )
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

On 1/9/24 16:37, Bird, Tim wrote:
>> -----Original Message-----
>> From: automated-testing@lists.yoctoproject.org <automated-testing@lists.yoctoproject.org> On Behalf Of Cyril Hrubis
>> Hi!
>> > But as I said, if anybody from nommu decides to maintain it in LTP, I'll try to
>> > support him in my free time (review patches, give advices). And if nobody
>> > stands, this patchset which removes the support in the old API will be merged
>> > after next LTP release (in the end of January).
>> 
>> Let me highlight this part, we are eager to help anybody who is willing
>> to pick the nommu work, but we do not have resources to drive it.
> 
> I have a couple of comments here.
> 
> I think it would be good to give a little bit more time to try to find a helper/maintainer
> for this.  As Rob pointed out, a lot of embedded Linux developers are using very old
> kernels (and, if they are using LTP, likely very old versions of LTP).  They are also
> notorious for not being active on the mailing lists.  So this might take some active
> outreach to find helpers.  (I realize that this thread is part of this
> outreach effort).  For this reason, I'd like a few more weeks to try to advertise this
> need within the embedded Linux community.

I'd like to point out I have the _interest_ in doing this, and might have some
ability, but what I don't have is the spare bandwidth.

I maintain toybox, which Android is using as the command line for both its
installed systems and its build system (which they call "hermetic" builds,
shipping their own build dependencies). I'm trying to get Android to build under
android, which is a slightly heavier lift than turning busybox into a
development environment capable of building Linux From Scratch starting from
just 7 packages (Linux, busybox, uclibc, make, gcc, binutils, and bash) was.

Which I _succeeded_ at some years ago, by the way:

  https://landley.net/aboriginal/about.html

The development work I was doing on busybox was why I wound up maintaining that
project for a bit, and after I got it to work (the project's 1.0 release) other
projects like Alpine and Adelie Linux took it from there.

Unfortunately, this time due to the FSF's spectacular stupidity with GPLv3, the
Android trademark licensing guidelines do not allow adding any GPL code in
userspace beyond what was grandfathered in circa 2007. (Busybox predates
android, yet android does not ship busybox. There's a reason for that.) Even
those grandfathered in ones they've been steadily replacing (rewriting the
bluetooth daemon with an apache licensed version, switching the build from gcc
to llvm, replacing gnu make with kati, and so on...) So I couldn't use ANY
existing gpl code (like busybox could) and largely had to write a new one of
everything. (Android was using a lot of bsd implementations, but have you ever
tried to build the linux kernel with bsd sed or bsd make? Doesn't quite fit.)

Anyway, I'm most of the way done now (see http://landley.net/toybox/status.html
and https://landley.net/toybox/roadmap.html#dev_env) and almost all my toybox
stuff already supports nommu. I'm even writing a bash replacement shell
(handling all the <(bash/{weirdness}/{1..7}) I can manage) that has full nommu
support. To support subshells it does a vfork() and exec of itself, then
marshalls all the local variable and function state across a pipe to the child
instance. (The sending side is at
https://github.com/landley/toybox/blob/master/toys/pending/sh.c#L1360 and the
receiving side at
https://github.com/landley/toybox/blob/master/toys/pending/sh.c#L4146 .)

Speaking of which, I'm still sad that the kernel never implemented a "re-exec
self" that isn't dependent on /proc and doesn't get confused by chroots, but
this is another aspect of "linux-kernel does not care when we bring this stuff
up". The topic comes up from time to time, and some patches have been proposed,
but it has yet to result in a way to do it that I am aware of:

https://lkml.iu.edu/hypermail/linux/kernel/0612.3/0238.html
https://lkml.iu.edu/hypermail/linux/kernel/1709.1/03186.html
https://lkml.iu.edu/hypermail/linux/kernel/2005.2/07206.html

Also, ext4 eventually fixed the ext2/ext3 split, but binfmt_fdpic.c is still a
separate file and not a couple of if() statements in binfmt_elf.c. Sigh...

Anyway...

> I am not using nommu systems myself, so I'm in a similar position as Petr in terms
> of it not making much sense for me to be the maintainer.  However, having said that,
> I have had for a few years now an idea for a background project related to LTP
> that might make this a more interesting fit for me.  Sony uses NuttX, and is considering
> using Zephyr in some of our low-end processor systems.  This includes some nommu
> systems.  For some time now, I have wanted to experiment with using LTP to test
> the compatibility of those systems with the Linux system APIs.  In full disclosure,
> I have no idea if this is a feasible or useful idea or not.  But it's something I'd like
> to investigate.

I've been talking with Rich Felker on IRC about what's involved in porting musl
on top of RTOS du jour. There was a long list of things he said in IRC that I
could try to scrape out of the log if you're interested.

The midipix guy also pointed me at https://midipix.org/sys_sysapi.h and
https://git.midipix.org/mmglue from where he ported musl to Windows.

I also got pointed at
http://lists.landley.net/pipermail/toybox-landley.net/2024-January/029967.html
I.E. https://github.com/apexrtos/apex/blob/master/sys/kern/syscall_table.c from
somebody ELSE who did it for a different RTOS...

> I realize that testing non-Linux RTOSes is out-of-scope for LTP.

What we've basically been discussing is that "the Linux API" is a de-facto
standard somewhere beyond posix, which has been implemented a bunch of different
times now. FreeBSD's Linux emulation layer, Windows Subsystem For Linux, Google
proposed a Linux layer for Fuchsia
(https://9to5google.com/2021/02/12/google-fuchsia-os-android-linux-programs-starnix/),
here's a guy who wrote his own kernel that runs the Linux binaries
(https://github.com/vvaltchev/tilck
I.E. https://www.youtube.com/watch?v=Ce1pMlZO_mI )...

I dunno what subset of the API other operating systems want to support, but
given that Linus is an empty nester now (all three daughters off to college),
idle discussions about his eventual retirement have been quietly going on for a
while now...

> But given that that is
> something I would like to do, and that it might be relevant to the Linux nommu tests,
> I would humbly request a few weeks to investigate this before the nommu code is removed.
> This delay would be to see if it would make sense for me to volunteer to help out with
> maintaining this otherwise abandoned code.

I am interested in helping, but I am overstretched as it is.

My mkroot script builds bootable linux systems and regression tests them under
qemu for a dozen architectures, all in about 350 lines of bash. To make that
work I created an even _more_ compressed kernel config format, microconfig, so
adding support for a new target is... well I recently added or1k support and
everything the script knows about that target is the 3 lines starting at:

https://github.com/landley/toybox/blob/master/mkroot/mkroot.sh#L233

That build script is already mostly self-hosting, in that it first builds a
directory of toybox binaries (line 62) and points the $PATH at those, and then
builds toybox and a Linux kernel under that. Which works, but cheats:

https://github.com/landley/toybox/blob/master/scripts/install.sh#L105

The PENDING= command list is the binaries it symlinks out of the host $PATH, the
ones before the multi-space break are theones I have partial implementations of
in "pending" (but which aren't in defconfig yet because they're not finished),
and the ones after the break are the ones I haven't started writing yet. I.E. I
still need to finish "expr git tr bash sh gzip", and I need to start "awk bison
flex make". But once I've written all of those, I should be able to run
mkroot.sh in a mkroot image.

And THEN I need to get the automated regression test script that makes sure all
the targets still work under qemu
(https://github.com/landley/toybox/blob/master/mkroot/testroot.sh about 100
lines) to also run the toybox test suite in qemu, but that still requires actual
bash to run the test suite, toysh isn't quite finished yet (and I refuse to trim
it because I want toysh to implement all those bash features).

And THEN I need to get it to build Linux From Scratch, which I did back under
aboriginal linux back in the day:

https://landley.net/aboriginal/control-images/

(I have to start over with the current LFS 12.0 stuff because none of those old
packages know what musl is and autoconf is just craptacular. Alas, LFS is full
of gnu packages, and gnu is brittle navel-gazing crap. But that's the best
stress test for my command line stuff handling all the weired evil corner cases
it throws at them. And it's also why both busybox and toybox seds reply to
--version with "this is not gnu sed 9.0" because of STUPID autoconf regexes...)

mkroot's already got the plumbing to add arbitrary extra behavior to the images
as build packages, the
https://github.com/landley/toybox/blob/master/mkroot/packages/tests package is
just a stub for now but I know what I want to have that do once the shell's ready...

And once I've got it building Linux From Scratch, THEN I need to tackle AOSP,
which is its own rant, but luckily its maintainer (Elliott Hughes, the "Android
base OS" maintainer) is the #2 developer on toybox, and I've been discussing
these plans with him for years:

http://lists.landley.net/pipermail/toybox-landley.net/2016-July/024590.html

But he's waiting for me to get through my todo list before actually trying to
add anything like a posix container to Android. It's mostly a security thing,
the ability to create arbitrary code and then execute it is like someone asking
to bring an open flame onto an airplane:

http://lists.landley.net/pipermail/toybox-landley.net/2019-September/026992.html

The other problem is that for historical reasons each app installs as a
different UID and a "posix container" would need to be able to install a UID/GID
_range_ which the container could then remap using container plumbing (and also
lock the hell DOWN using container plumbing, so its ability to trojan the phone
and do evil maid attacks and 37 other bad things was NOT ALLOWED, which is some
design work they seem to be deferring until I wave something otherwise usable at
them)...

(Ok, and he thinks phones are too slow to build android, that nobody does
development on anything less powerful than a 32 processor machine with at least
that many gigs of ram and a fiber connection to the net because nobody at GOOGLE
has less than that. He has boggled at me about this cultural difference before,
skip to about 20:30 in
http://androidbackstage.blogspot.com/2016/07/episode-53-adb-on-adb.html for
example. Anyway, at some point I need to STRIP DOWN the AOSP build so it takes
less than forever. Haven't even opened that can of worms yet, but from a
capability standpoint it's gotta build the whole thing _first_...)

Anyway, the point is this is its own whole ecosystem, which I'd need a staff of
a dozen people to navigate properly, and there's just me. And now that toybox
has users, I get support requests coming in...

> I can't promise anything, but I'd like to find out more about:
> 1) what parts of the current LTP are not supporting nommu (what's currently broken),
> 2) how much code we're talking about, and
> 3) what the desired roadmap going forward would be, to continue to support this code.

I am very interested in these things as well. I would like to help, and am happy
to answer all the questions I can, but caffeine only takes you so far when it
comes to regular commitments...

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
