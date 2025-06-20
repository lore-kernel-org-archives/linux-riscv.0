Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F018BC71155
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 13:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qk5kIEvmTv519vfBcE2TUy/a1DeVXa44ha7+pFbn+s8=; b=Idr/ZRq+a9BS6F
	AxiusptKG9VDoRhiMGJ0VCmtiKpllmJ5IkJMxosQxmvFMscuScozWGe4hAFa+iCa3JjSZebAASlFe
	6Oo6ElPEq6WJvY1D7E/ICeu2WbIonWThLRgeyBWoCN0sNi+ZD833j+bqWrIQs9sAr5lbgW7dj8nIj
	xd1gAfDle+Z/FTN/UPfvSlyOo6L0vbF96YiN2QFCnMwdK1tGzKsicxXlxQEFT6Fwmzg+SxWM1WvL+
	UIYxPKB5Sw2zSjY0Cf+lPAuFEGvUFd78exYAjJcz+IDmtTuQtE03u7RPnw7TzhY47OXdR8khXi/qc
	9pB/vK20ErVSGUG/cQww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbyU-0000000FkEs-0rsp;
	Fri, 20 Jun 2025 13:40:10 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbfB-0000000Fhus-3BCs
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 13:20:15 +0000
Date: Fri, 20 Jun 2025 15:20:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750425611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8wtKTkQ0DJEvdIq2uKb64fr5/HkxwWYfnbB81VGsqgQ=;
	b=xbpk1GcvM2CXI7N+DS6uqb548rLThLHg/zqPom8QVEOT5a/F66PvrvtRfsQsj06JgllVrN
	cxVqhsouaY7hRE/8702pTpFKqf19ByPCB/Se+NqvTUziRwYMndFAJYn1AJ/e2+QYjInlnl
	QlFn4C+i4aON3q32OHt2+FiEAUnXlnJTeLFhSf8aWted+OZzjUIM4YP5M4m5lEhadIJlj5
	68yuQbDlQI8clAyATZE9bkeYahAlnNHeyTIRLlGVQO59ReNhRdfeAEbQ8uW1r6G6KwpUoW
	HWIgt14WEuN/AZVgEQogB0xD0a+OKnv83IceXbXM/7PDWrpQ/SW8js51gSeNiQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750425611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8wtKTkQ0DJEvdIq2uKb64fr5/HkxwWYfnbB81VGsqgQ=;
	b=dSETFzgg52sTw+31LwsX+wqORY9FaScJ2yCaW+8TvpLO5n2KBPBHCHdH46BRV6EWHtb8tR
	kBZZlj4ovuzufjBw==
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
Subject: Re: [PATCH v3 08/16] kunit: tool: Add test for nested test result
 reporting
Message-ID: <20250620151847-953c56f6-5a20-4e46-82ce-8b58fd409250@linutronix.de>
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
 <20250611-kunit-kselftests-v3-8-55e3d148cbc6@linutronix.de>
 <CABVgOSmTXj_t0_nJyjhc=mvpPkGGW5D4qGd0WajmVgVyMgd_Hg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABVgOSmTXj_t0_nJyjhc=mvpPkGGW5D4qGd0WajmVgVyMgd_Hg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_062013_940903_632897E3 
X-CRM114-Status: GOOD (  23.64  )
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

On Fri, Jun 20, 2025 at 05:37:39PM +0800, David Gow wrote:
> On Wed, 11 Jun 2025 at 15:38, Thomas Wei=DFschuh
> <thomas.weissschuh@linutronix.de> wrote:
> >
> > Currently there is no test validating the result reporting from nested
> > tests. Add one, it will also be used to validate upcoming changes to the
> > nested test parsing.
> >
> > Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> > ---
> =

> This looks good, modulo a couple of minor suggestions below.
> =

> Regardless,
> Reviewed-by: David Gow <davidgow@google.com>
> =

> Cheers,
> -- David
> =

> >  tools/testing/kunit/kunit_tool_test.py                           | 9 +=
++++++++
> >  .../kunit/test_data/test_is_test_passed-failure-nested.log       | 7 +=
++++++
> >  2 files changed, 16 insertions(+)
> >
> > diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kun=
it/kunit_tool_test.py
> > index bbba921e0eacb18663abfcabb2bccf330d8666f5..691cde9b030f7729128490c=
1bdb42ccee1967ad6 100755
> > --- a/tools/testing/kunit/kunit_tool_test.py
> > +++ b/tools/testing/kunit/kunit_tool_test.py
> > @@ -165,6 +165,15 @@ class KUnitParserTest(unittest.TestCase):
> >                 self.assertEqual(kunit_parser.TestStatus.FAILURE, resul=
t.status)
> >                 self.assertEqual(result.counts.errors, 0)
> >
> > +       def test_parse_failed_nested_tests_log(self):
> > +               nested_log =3D test_data_path('test_is_test_passed-fail=
ure-nested.log')
> > +               with open(nested_log) as file:
> > +                       result =3D kunit_parser.parse_run_tests(file.re=
adlines(), stdout)
> > +               self.assertEqual(kunit_parser.TestStatus.FAILURE, resul=
t.status)
> > +               self.assertEqual(result.counts.failed, 2)
> > +               self.assertEqual(kunit_parser.TestStatus.FAILURE, resul=
t.subtests[0].status)
> =

> Is it worth also testing the value of the nested test's result here? i.e.,
> self.assertEqual(kunit_parser.TestStatus.FAILURE,
> result.subtests[0].subtests[0].status)

This should be result.subtests[1].subtests[0].status.
But Ack and done.

> > +               self.assertEqual(kunit_parser.TestStatus.FAILURE, resul=
t.subtests[1].status)
> > +
> >         def test_no_header(self):
> >                 empty_log =3D test_data_path('test_is_test_passed-no_te=
sts_run_no_header.log')
> >                 with open(empty_log) as file:
> > diff --git a/tools/testing/kunit/test_data/test_is_test_passed-failure-=
nested.log b/tools/testing/kunit/test_data/test_is_test_passed-failure-nest=
ed.log
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..835816e0a07715a514f5f5a=
fab1b6250037feaf4
> > --- /dev/null
> > +++ b/tools/testing/kunit/test_data/test_is_test_passed-failure-nested.=
log
> > @@ -0,0 +1,7 @@
> > +KTAP version 1
> > +1..2
> > +not ok 1 subtest 1
> > +    KTAP version 1
> > +    1..1
> > +        not ok 1 test 1
> > +not ok 2 subtest 2
> =

> Having these named 'subtest 1' and 'test 1' is a bit confusing to me
> (as it implies the outer tests are subtests of the inner ones, which
> isn't right).
> =

> Could we either swap 'subtest' and 'test' here, or -- if we want to
> preserve the match between 'subtest' here and the subtest in the
> python code -- label the inner one something like 'subsubtest'?

Ack.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
