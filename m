Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17247C7115C
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 13:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KePdikqloncj3thngMMsd1ZIQCpcji3g9e+uz4Cjf2w=; b=ocZdVUDpeEQrgK
	gk5qwrpsocXff1x+93ojQM0smGMEq2mwj5uszsLUO5iG+dop1pA8iDwFKERVfX3Rv2kiuAmjc+S7C
	jStgW0npvBqqYUkFBcTEbTqQyjzEO+Dcgab4aZ222snTb1inCdwbY0oKJdseDDmvYN/ifxIoAje8M
	8pya7ghZ4stnRf1j0czh6QwnV19Ki5NHSBpk8GU/yVpeq34BGIL6aYxlXuxvdLCvWWl7yQCZnPHSU
	E8Vozd8a3OzkUNMfc6CZath981QAFShq768c3SatlLPaIautMDYf+54X0wfRx+zdxwxl6JdBuWJvm
	3rVM1xA21FgA14yRIxIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbyV-0000000FkFR-1R0I;
	Fri, 20 Jun 2025 13:40:11 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbi3-0000000FiDl-2q5b
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 13:23:12 +0000
Date: Fri, 20 Jun 2025 15:23:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750425789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wxgB6aqVu/pCEcTgKgzzcyt3tkOAQan9YRqfq83vllI=;
	b=1EW6K1yKlrmsw53vXY++fO8q63G0RtB/0QBmXMEOzpah/MThkZXkxFVOAT1p7f+vOWlMNn
	zfyWimzJnGMoup2z4JTD4RZXm0ZFiVRfAxHuPWT/GCrUBLNHT3Sk8XNoNgX7W+HjUTfn/0
	G6luI+oLzADDVJXdmWBoxzlfhsg6+G8zk/WwTRyHkXfhHsAWFkxskKfjo06AfigAVVYeR8
	cz/8M5ddRAYKMNSpE3+F7dJUy4MwvfyMtS1QfNFpexaMQT7HoDVmeR0AUIiTwCMWWPY+0w
	91JnGmG2WsxLZw5JXxE0bjk+xrWUyOQDOpX1BGOmc/joVoiGmvPbYKGZZqbHjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750425789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wxgB6aqVu/pCEcTgKgzzcyt3tkOAQan9YRqfq83vllI=;
	b=z7TK+VSqwI4ZfA1aH7wEd0ySYQjyZpyxqN/0ry6nvlpQqrpi7zO+oJsJbZq9ZofmFqKoe6
	ZerOnIESUfwqFLDQ==
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
Subject: Re: [PATCH v3 09/16] kunit: tool: Don't overwrite test status based
 on subtest counts
Message-ID: <20250620152016-7f39b3bb-1738-4593-bc59-6ab37f04feee@linutronix.de>
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
 <20250611-kunit-kselftests-v3-9-55e3d148cbc6@linutronix.de>
 <CABVgOSkG3dY3THo5DQOvWj1xX8XFFnnk7CXvVE2opQJZg4nwXg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABVgOSkG3dY3THo5DQOvWj1xX8XFFnnk7CXvVE2opQJZg4nwXg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_062311_855271_D26A6E15 
X-CRM114-Status: GOOD (  31.54  )
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

On Fri, Jun 20, 2025 at 05:37:44PM +0800, David Gow wrote:
> On Wed, 11 Jun 2025 at 15:38, Thomas Wei=DFschuh
> <thomas.weissschuh@linutronix.de> wrote:
> >
> > If a subtest itself reports success, but the outer testcase fails,
> > the whole testcase should be reported as a failure.
> > However the status is recalculated based on the test counts,
> > overwriting the outer test result.
> > Synthesize a failed test in this case to make sure the failure is not
> > swallowed.
> >
> > Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> > ---
> =

> Hmm... this is definitely a nasty edge-case. I don't completely like
> this solution, but none of the other options seem drastically better.
> =

> I think the more obvious options are either to _always_ count tests
> alongside their subtests, or to _never_ do so, but acknowledge that
> "test failed, but failure count is 0" is a valid option. But neither
> of those are especially satisfying, either greatly inflating test
> counts, or creating obvious contradictions.
> =

> So I'm tentatively in favour of this, but if anyone has a nicer way of
> doing it, I'm all ears.

Agreed, it is not great. I'd also be happy for better ideas.

> The implementation looks good. If we can add the explicit checks for
> the sub(sub)test results as mentioned in the previous patch, that'd be
> even better.
> =

> Reviewed-by: David Gow <davidgow@google.com>
> =

> >  tools/testing/kunit/kunit_parser.py                                  |=
 5 +++++
> >  tools/testing/kunit/kunit_tool_test.py                               |=
 2 +-
> >  tools/testing/kunit/test_data/test_is_test_passed-failure-nested.log |=
 3 +++
> >  3 files changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/testing/kunit/kunit_parser.py b/tools/testing/kunit/=
kunit_parser.py
> > index c176487356e6c94882046b19ea696d750905b8d5..2478beb28fc3db825855ad4=
6200340e884da7df1 100644
> > --- a/tools/testing/kunit/kunit_parser.py
> > +++ b/tools/testing/kunit/kunit_parser.py
> > @@ -686,6 +686,11 @@ def bubble_up_test_results(test: Test) -> None:
> >                 counts.add_status(status)
> >         elif test.counts.get_status() =3D=3D TestStatus.TEST_CRASHED:
> >                 test.status =3D TestStatus.TEST_CRASHED
> > +       if not test.ok_status():
> > +               for t in subtests:
> > +                       if not t.ok_status():
> > +                               counts.add_status(t.status)
> > +                               break
> >
> >  def parse_test(lines: LineStream, expected_num: int, log: List[str], i=
s_subtest: bool, printer: Printer) -> Test:
> >         """
> > diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kun=
it/kunit_tool_test.py
> > index 691cde9b030f7729128490c1bdb42ccee1967ad6..c25f52650837e83325b06bd=
dd2aa665fd29f91d9 100755
> > --- a/tools/testing/kunit/kunit_tool_test.py
> > +++ b/tools/testing/kunit/kunit_tool_test.py
> > @@ -170,7 +170,7 @@ class KUnitParserTest(unittest.TestCase):
> >                 with open(nested_log) as file:
> >                         result =3D kunit_parser.parse_run_tests(file.re=
adlines(), stdout)
> >                 self.assertEqual(kunit_parser.TestStatus.FAILURE, resul=
t.status)
> > -               self.assertEqual(result.counts.failed, 2)
> > +               self.assertEqual(result.counts.failed, 3)
> >                 self.assertEqual(kunit_parser.TestStatus.FAILURE, resul=
t.subtests[0].status)
> =

> Could we add:
> self.assertEqual(kunit_parser.TestStatus.SUCCESS,
> result.subtests[0].subtests[0].status)
> =

> >                 self.assertEqual(kunit_parser.TestStatus.FAILURE, resul=
t.subtests[1].status)

Ack.

> and
> =

> self.assertEqual(kunit_parser.TestStatus.FAILURE,
> result.subtests[1].subtests[0].status)

This is now already in the previous patch.

> >
> > diff --git a/tools/testing/kunit/test_data/test_is_test_passed-failure-=
nested.log b/tools/testing/kunit/test_data/test_is_test_passed-failure-nest=
ed.log
> > index 835816e0a07715a514f5f5afab1b6250037feaf4..cd9033c464792e6294905a5=
676346684182874ad 100644
> > --- a/tools/testing/kunit/test_data/test_is_test_passed-failure-nested.=
log
> > +++ b/tools/testing/kunit/test_data/test_is_test_passed-failure-nested.=
log
> > @@ -1,5 +1,8 @@
> >  KTAP version 1
> >  1..2
> > +    KTAP version 1
> > +    1..1
> > +        ok 1 test 1
> >  not ok 1 subtest 1
> >      KTAP version 1
> >      1..1
> >
> > --
> > 2.49.0
> >



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
