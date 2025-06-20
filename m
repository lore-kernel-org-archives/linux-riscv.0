Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3105BC7115C
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 15:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UYWgo3RmlVCbcm5Y0RJIGkOLE1N7YWheE21s/INHzbQ=; b=BP8uEoNvT/Pg27
	W2ZQATjM9MVxDGNILStnMO9bO5bJrCI77QNVPWaycLmqt+vou4MKs76HomS7AX7XfCxp9UzZvAxFH
	deQiolvVxaOyp2Ssst25doDqnAKodPwZkuUgFb+gq2F+eiXRgSqkJi1u6RhrZo5TCKncUOhQbu838
	QR5UDwcGjuulyB17BKnFhkrdSJdNE+NyG01XvMi7HvjVElx+vTN1D54tTedu8Drh4XSwcyOQWcHEv
	ZRmIpD5Meo2U9JC554VDfU/fzc3N3h3oyrktLsBsVXM3kzWdQT1P6g+8NtDuixOapuioAFpRVuRN1
	PSF9oGixHm/GCEpJdJmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSdFt-0000000FvR6-3ztB;
	Fri, 20 Jun 2025 15:02:13 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSc8L-0000000Fm8p-3sr5
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 13:50:23 +0000
Date: Fri, 20 Jun 2025 15:50:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750427420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cjzSfiMgzjbJPtz34LRfOtXpbo+tLxgxkNks+JkVZ88=;
	b=bL6iBar9j84mRqpnw2Bb/piFTqoCtYiys7YQUV+/ydPaRa9/fY/7fEmjlVkAPc/XakoGbw
	sW2MRFs8TMcPHCu413LXsftJlEZtMdQdroNYGVFOEJSOrr3ZDc8ojpD2YCFN76LtYjZEjR
	4EfS+iShJfP33H6stThryXblX1IdUp/Cdda5ynWW0cQ3lFkgF6HOcfRqnaNjwTiLyYLTNb
	y12aoeOdhC6kF0OmuZonAZ5aAwgiE+bgI17vTKmGjUsZZAq1qgGmDJOCwDrAFCY2LJz84f
	DLgeQD5IG/+cHQhnUm7zAJZyhzMUuG89/h/ufq5rIJkNgbuxqgadJZhe9U1Kzw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750427420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cjzSfiMgzjbJPtz34LRfOtXpbo+tLxgxkNks+JkVZ88=;
	b=uI2lqy+e+cujbEB1wBGlRvE7HiY0YGnrv1yYnXFyP+bB8A2OhDYaslLPUpICycctN+U2CO
	rpo8YxbPjbrhKrDw==
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
Subject: Re: [PATCH v3 16/16] kunit: uapi: Validate usability of /proc
Message-ID: <20250620154408-bc103402-56f0-4ac1-a06f-63b2ed30ed29@linutronix.de>
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
 <20250611-kunit-kselftests-v3-16-55e3d148cbc6@linutronix.de>
 <CABVgOSkzpY8327ePSjuLcbz2jWZkavJvJfF7eehCsS0uzkB65g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABVgOSkzpY8327ePSjuLcbz2jWZkavJvJfF7eehCsS0uzkB65g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_065022_104283_B05A936E 
X-CRM114-Status: GOOD (  27.82  )
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

On Fri, Jun 20, 2025 at 05:48:07PM +0800, David Gow wrote:
> On Wed, 11 Jun 2025 at 15:38, Thomas Wei=DFschuh
> <thomas.weissschuh@linutronix.de> wrote:
> >
> > Show that the selftests are executed from a fairly "normal"
> > userspace context.
> >
> > Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> > ---
> =

> This is good. I'm not 100% sure the example test is the best place for
> it, though.
> =

> Would it make more sense to either have this:
> - in the main kunit test (since it's really _verifying_ the KUnit
> environment, rather than documenting it)
> - in a separate kunit-uapi test (if we want to keep some separation
> between the UAPI and entirely in-kernel tests)
> - in a separate procfs test (since it tests procfs functionality as
> much as it's testing the KUnit environment)

Originally this change was really meant as an example for users.
But moving it into the main kunit test probably makes more sense.

> Personally, my gut feeling is the main kunit-test is the best place
> for this, even if it means spinning up a separate file is best here.

Ack.

> As for the actual implementation, though, that looks fine to me. A few
> small comments below, but nothing particularly important.
> =

> Reviewed-by: David Gow <davidgow@google.com>
> =

> Cheers,
> -- David
> =

> >  lib/kunit/kunit-example-uapi.c | 34 +++++++++++++++++++++++++++++++++-
> >  1 file changed, 33 insertions(+), 1 deletion(-)
> >
> > diff --git a/lib/kunit/kunit-example-uapi.c b/lib/kunit/kunit-example-u=
api.c
> > index 4ce657050dd4a576632a41ca0309c4cb5134ce14..5e7a0f3b68f182c42b03e66=
7567e66f02d8c2b86 100644
> > --- a/lib/kunit/kunit-example-uapi.c
> > +++ b/lib/kunit/kunit-example-uapi.c
> > @@ -8,13 +8,45 @@
> >   * This is *userspace* code.
> >   */
> >
> > +#include <fcntl.h>
> > +#include <unistd.h>
> > +#include <string.h>
> > +
> >  #include "../../tools/testing/selftests/kselftest.h"
> >
> > +static void test_procfs(void)
> > +{
> > +       char buf[256];
> > +       ssize_t r;
> > +       int fd;
> > +
> > +       fd =3D open("/proc/self/comm", O_RDONLY);
> > +       if (fd =3D=3D -1) {
> > +               ksft_test_result_fail("procfs: open() failed: %s\n", st=
rerror(errno));
> > +               return;
> > +       }
> > +
> > +       r =3D read(fd, buf, sizeof(buf));
> > +       close(fd);
> > +
> > +       if (r =3D=3D -1) {
> > +               ksft_test_result_fail("procfs: read() failed: %s\n", st=
rerror(errno));
> > +               return;
> > +       }
> > +
> =

> Do we want to use TASK_COMM_LEN rather than hardcoding 16 below?

> (And, if so, do we need something more complicated in case it's not 16?)

TASK_COMM_LEN is not part of the UAPI headers.
But I don't think it can ever change.

> > +       if (r !=3D 16 || strncmp("kunit-example-u\n", buf, 16) !=3D 0) {
> > +               ksft_test_result_fail("procfs: incorrect comm\n");
> > +               return;
> > +       }
> > +
> > +       ksft_test_result_pass("procfs\n");
> > +}
> > +
> >  int main(void)
> >  {
> >         ksft_print_header();
> >         ksft_set_plan(4);
> > -       ksft_test_result_pass("userspace test 1\n");
> > +       test_procfs();
> >         ksft_test_result_pass("userspace test 2\n");
> >         ksft_test_result_skip("userspace test 3: some reason\n");
> >         ksft_test_result_pass("userspace test 4\n");
> >
> > --
> > 2.49.0
> >



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
