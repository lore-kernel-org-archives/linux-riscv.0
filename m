Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D3BC77B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 13:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yCPhNJtLR3E4fWgpcLrPHg7704TaxLHaaKctGM8G748=; b=LJ6DgyOL+kKVPI
	NJsTuTefEPwK1BcqLo1buIqLZyuFxjAkJHaan7Pu+fjOvWDON8wnNKwNIa9P6eRz19svVFvOe9vC/
	9t1//IDWbRYd0eXGSgsyqJroiC3RB8EoJT8XrnRJtX+SQwNfDqAMTJp3ln/QAxFKg01pz8Pk6uL+l
	0V9bUL8T6xTELfK0reAs94wA0/BzDuhHQC16EDluQj3WiGBtdruz+1pC/RUfJmJAm1gASLI5vCgSI
	Q0IgIVAlBiqiHuRSQiJGKNT+ifOPY4VuqEURiSDxdixoYp+Em6QOBnoPTtIgv1sfz9Exgvci1p+2X
	2wVscXsuetshc9GIX3Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbyT-0000000FkEf-2bgq;
	Fri, 20 Jun 2025 13:40:09 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbdS-0000000Fhcw-32Om
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 13:18:28 +0000
Date: Fri, 20 Jun 2025 15:18:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750425503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xFAOt2MavbSZy6+6CRRkv0iVG6HD+B7/Z0Dvh8oYqA4=;
	b=Cg6/0ounJmq7Cw+OltJXvfJ830rXTfB6nNkMuuLtwvHcbK4Amj50MeTEZtoILLNjlUPR3U
	sCaq+l2jH8M7czq685gfwR+DMATSEQMN7JKPCns6TDsFOwW4YNSzdSQe5w/mt61BhtWkhE
	TF6dktdEgpIye5JR3oxO/ctekctnPc6g6LPzGIKDckV8P2+r1CCVj4AzhQuGlrzKupDnry
	W6lbCoGD6WTYbpj95tb53M1vSGRuEcusOrMfJ2Sa5anHigllsQKmWtK16DdCCdf3YjuxpX
	m1CP1QZIryF1iAMSlSU0vw/GXw+zi7fhdhaK+GY5Kw7vSzC7Azd3aEzawgp8oQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750425503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xFAOt2MavbSZy6+6CRRkv0iVG6HD+B7/Z0Dvh8oYqA4=;
	b=hveZh6xAQHMQoFD472CWRsLBzqWtE6Cv6mC3P0CCPCwZ8Mvls39XPbu0vdKaTy+6KQ+Dq/
	NIPrJfXvr2KvonAw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: David Gow <davidgow@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Willy Tarreau <w@1wt.eu>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <rmoar@google.com>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, workflows@vger.kernel.org
Subject: Re: [PATCH v3 00/16] kunit: Introduce UAPI testing framework
Message-ID: <20250620145812-e6fc0e34-28bd-4a8a-8376-63c3ac6b6b30@linutronix.de>
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
 <CABVgOSn+530YJ3OPNJQncLDQNbd9JEDtZ04Amyyxk57jOVYUyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABVgOSn+530YJ3OPNJQncLDQNbd9JEDtZ04Amyyxk57jOVYUyQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_061827_043836_F350435F 
X-CRM114-Status: GOOD (  51.17  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jun 20, 2025 at 05:37:24PM +0800, David Gow wrote:
> On Wed, 11 Jun 2025 at 15:38, Thomas Wei=DFschuh
> <thomas.weissschuh@linutronix.de> wrote:
> >
> > Currently testing of userspace and in-kernel API use two different
> > frameworks. kselftests for the userspace ones and Kunit for the
> > in-kernel ones. Besides their different scopes, both have different
> > strengths and limitations:
> >
> > Kunit:
> > * Tests are normal kernel code.
> > * They use the regular kernel toolchain.
> > * They can be packaged and distributed as modules conveniently.
> >
> > Kselftests:
> > * Tests are normal userspace code
> > * They need a userspace toolchain.
> >   A kernel cross toolchain is likely not enough.
> > * A fair amout of userland is required to run the tests,
> >   which means a full distro or handcrafted rootfs.
> > * There is no way to conveniently package and run kselftests with a
> >   given kernel image.
> > * The kselftests makefiles are not as powerful as regular kbuild.
> >   For example they are missing proper header dependency tracking or more
> >   complex compiler option modifications.
> >
> > Therefore kunit is much easier to run against different kernel
> > configurations and architectures.
> > This series aims to combine kselftests and kunit, avoiding both their
> > limitations. It works by compiling the userspace kselftests as part of
> > the regular kernel build, embedding them into the kunit kernel or module
> > and executing them from there. If the kernel toolchain is not fit to
> > produce userspace because of a missing libc, the kernel's own nolibc can
> > be used instead.
> > The structured TAP output from the kselftest is integrated into the
> > kunit KTAP output transparently, the kunit parser can parse the combined
> > logs together.
> >
> > Further room for improvements:
> > * Call each test in its completely dedicated namespace
> > * Handle additional test files besides the test executable through
> >   archives. CPIO, cramfs, etc.
> > * Compatibility with kselftest_harness.h (in progress)
> > * Expose the blobs in debugfs
> > * Provide some convience wrappers around compat userprogs
> > * Figure out a migration path/coexistence solution for
> >   kunit UAPI and tools/testing/selftests/
> >
> > Output from the kunit example testcase, note the output of
> > "example_uapi_tests".
> >
> > $ ./tools/testing/kunit/kunit.py run --kunitconfig lib/kunit example
> > ...
> > Running tests with:
> > $ .kunit/linux kunit.filter_glob=3Dexample kunit.enable=3D1 mem=3D1G co=
nsole=3Dtty kunit_shutdown=3Dhalt
> > [11:53:53] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D examp=
le (10 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [11:53:53] [PASSED] example_simple_test
> > [11:53:53] [SKIPPED] example_skip_test
> > [11:53:53] [SKIPPED] example_mark_skipped_test
> > [11:53:53] [PASSED] example_all_expect_macros_test
> > [11:53:53] [PASSED] example_static_stub_test
> > [11:53:53] [PASSED] example_static_stub_using_fn_ptr_test
> > [11:53:53] [PASSED] example_priv_test
> > [11:53:53] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D ex=
ample_params_test  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > [11:53:53] [SKIPPED] example value 3
> > [11:53:53] [PASSED] example value 2
> > [11:53:53] [PASSED] example value 1
> > [11:53:53] [SKIPPED] example value 0
> > [11:53:53] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] examp=
le_params_test =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [11:53:53] [PASSED] example_slow_test
> > [11:53:53] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D (4 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > [11:53:53] [PASSED] procfs
> > [11:53:53] [PASSED] userspace test 2
> > [11:53:53] [SKIPPED] userspace test 3: some reason
> > [11:53:53] [PASSED] userspace test 4
> > [11:53:53] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] ex=
ample_uapi_test =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [11:53:53] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D [PASSED] example =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > [11:53:53] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [11:53:53] Testing complete. Ran 16 tests: passed: 11, skipped: 5
> > [11:53:53] Elapsed time: 67.543s total, 1.823s configuring, 65.655s bui=
lding, 0.058s running
> >
> > Based on v6.15-rc1.
> >
> > Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> > ---
> > Changes in v3:
> > - Reintroduce CONFIG_CC_CAN_LINK_STATIC
> > - Enable CONFIG_ARCH_HAS_NOLIBC for m68k and SPARC
> > - Properly handle 'clean' target for userprogs
> > - Use ramfs over tmpfs to reduce dependencies
> > - Inherit userprogs byte order and ABI from kernel
> > - Drop now unnecessary "#ifndef NOLIBC"
> > - Pick up review tags
> > - Drop usage of __private in blob.h,
> >   sparse complains and it is not really necessary
> > - Fix execution on loongarch when using clang
> > - Drop userprogs libgcc handling, it was ugly and is not yet necessary
> > - Link to v2: https://lore.kernel.org/r/20250407-kunit-kselftests-v2-0-=
454114e287fd@linutronix.de
> >
> > Changes in v2:
> > - Rebase onto v6.15-rc1
> > - Add documentation and kernel docs
> > - Resolve invalid kconfig breakages
> > - Drop already applied patch "kbuild: implement CONFIG_HEADERS_INSTALL =
for Usermode Linux"
> > - Drop userprogs CONFIG_WERROR integration, it doesn't need to be part =
of this series
> > - Replace patch prefix "kconfig" with "kbuild"
> > - Rename kunit_uapi_run_executable() to kunit_uapi_run_kselftest()
> > - Generate private, conflict-free symbols in the blob framework
> > - Handle kselftest exit codes
> > - Handle SIGABRT
> > - Forward output also to kunit debugfs log
> > - Install a fd=3D0 stdin filedescriptor
> > - Link to v1: https://lore.kernel.org/r/20250217-kunit-kselftests-v1-0-=
42b4524c3b0a@linutronix.de
> >
> > ---
> =

> =

> Thanks very much for persisting with this, and sorry for the delayed resp=
onse.

Thanks for the review.

> I've taken quite a liking to it: it'd definitely have made my life
> easier more than once.
>
> As a more general wrapping of selftests in KUnit tests, I do think
> that there's still some risk of confusion as to when a KUnit UAPI test
> makes sense versus a simple selftest. The UAPI tests are definitely
> (IMO) easier to build and run, but won't be easier to debug, or to run
> on an existing, non-test system as a part of troubleshooting (which
> has been a complaint when selftests have been ported to KUnit in the
> past).

The tests I am currently running with this framework are actually real
kselftests. They primarily live in tools/testing/selftests/ but I have a
wrapper in the "real" source tree and also build as part of KUnit.
This gives the advantages of both systems.
FWIW, the KUnit UAPI tests still exist as regular binaries in the output
tree and can also be used on their own.

> Nevertheless, I'm pretty happy to have this be a part of KUnit, though
> I have three slight reservations:
> 1. There's no real _user_ of this yet -- save for the small test of
> /proc/self/comm in the example -- I'd like to see a real-world test
> using this.

As mentioned before I am using this with real kselftests.
So far I have plugged in:

* all of tools/testing/selftests/vDSO/
* all of tools/testing/selftests/timens/
* a bit of tools/testing/selftests/x86/
* a bit of tools/testing/selftests/timers/

The selftests require a few small changes but these are mostly to resolve
warnings introduced by the more struct userprogs CFLAGS.
Or make the tests compatible with nolibc by changing syscall constants
from the generic SYS_foo to the Linux UAPI variant __NR_foo.

If you want to take a look at the (very WIP) code:
https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git=
/log/?h=3Dkunit-kselftests-integration

In addition, some extensions to nolibc and the vDSO selftest libraries were
necessary. But all of that has been upstreamed already.

> 2. There's a fair bit of complexity here, and we're already a bit
> behind with KUnit reviews. I'd love it if you could commit to helping
> maintain the KUnit parts of this in MAINTAINERS.

Ack. I'll add this in the next revision.

> 3. We need to make sure that there's a clear understanding of when to
> use this, versus in-kernel KUnit tests, versus kselftest. This'll
> probably involve (a) making sure Shuah is on board -- or at least not
> strongly opposed, and (b) updating
> Documentation/dev-tools/testing-overview.rst.

As mentioned above, I think for most testcases both can be used from the sa=
me
codebase. So far I don't have any other requirements, although I am fairly =
sure
those will come up at some point. Let's go there when necessary.

I talked to Shuah about the proposal before and she had a positive reaction.
But I still would be very happy to get more feedback from her, also about t=
he
posted patches.

I'll also update testing-overview.rst.

> But thanks very much -- it's working well in my testing here, and
> running the tests is very pleasant.

Good to hear!

<snip>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
