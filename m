Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64410C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Dec 2021 18:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bsoPaqbNvuKC+9godDS88lzZozdKbWBz0ysMJ4WhZk4=; b=NNPko4QbYydFQ4
	dvqSgQzLrFUz/5PNEVmcd5I7B0kiginnL82yBzpYcF6adARxeauZZOiOkPbtFN3oPvAfpRdf3xZql
	HgzBDtd+ijBkgwJkCTpHn5J0t4mmB4VlXmvTKTJH5YLtplI03IdIkvrMVbukA2W0xbK+w1h8aqUX9
	twWou8GidPY7q9ZJkneyDmZB2DRfU75JQ2vDD9fQtuKc8zcK87HCI1wkUeV8T9DgSg2mZW81C58+j
	gp0LVCnOoh6qs9QhpaBLVObcfbvSkWCnDw/1VqYtzteBUmd9xsSVaB1SONBFM1AuY4jVHedI7KTfm
	iyU92RL/ppQtdsxNCxqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msUVx-009qZZ-Nt; Wed, 01 Dec 2021 18:39:33 +0000
Received: from rere.qmqm.pl ([91.227.64.183])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrOYB-00GQCG-Ax; Sun, 28 Nov 2021 18:05:20 +0000
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4J2Gbw0CGMzWG;
 Sun, 28 Nov 2021 19:05:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638122717; bh=sEqOa0ZEPEWEUlBRSLFAiVwd6iLDymwK+DV3juGIkQI=;
 h=Date:From:To:Cc:Subject:From;
 b=XxvJmPPWazylznPkDFNVygPkohQ37AeYwywQvuepL1w31LahkAW0gP0LAhZyVJpcw
 QCkB6BljQdra5dN8zW66BSxqJNFsOQZ3SXN/IvfR7aJdEfhChJ01RFDgEXy7ZRidew
 5AuU0watcW2VhJ8VLEKa/g48uwHd6hUjzetMQJoBwvwxwQVSA3IWggzLzC2joJiPHp
 8JY+UhUQ+oYzz2QsWC6IREdA0RA0M1lN6rt3R0c026YIrrdzB0zCSa9TOmB+kCXZPl
 HMxpZwG7mci2iV7G+PnmCZt5b87M/uk6yQ9shXg1YFXT3Bi4Ka8VZS9Szm3f/vvMWn
 w1e6Lkbu+s3yw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Sun, 28 Nov 2021 19:05:14 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexey Klimov <aklimov@redhat.com>,
 Amitkumar Karwar <amitkarwar@gmail.com>,
 Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Andy Shevchenko <andy@infradead.org>,
 Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christoph Hellwig <hch@lst.de>, Christoph Lameter <cl@linux.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Airlie <airlied@linux.ie>, David Laight <David.Laight@aculab.com>,
 Dennis Zhou <dennis@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geetha sowjanya <gakula@marvell.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guo Ren <guoren@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Ian Rogers <irogers@google.com>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Jens Axboe <axboe@fb.com>, Jiri Olsa <jolsa@redhat.com>,
 Jonathan Cameron <jic23@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
 Kalle Valo <kvalo@codeaurora.org>, Kees Cook <keescook@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Lee Jones <lee.jones@linaro.org>, Marc Zyngier <maz@kernel.org>,
 Marcin Wojtas <mw@semihalf.com>, Mark Gross <markgross@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Zijlstra <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Roy Pledge <Roy.Pledge@nxp.com>, Russell King <linux@armlinux.org.uk>,
 Saeed Mahameed <saeedm@nvidia.com>, Sagi Grimberg <sagi@grimberg.me>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Solomon Peachy <pizza@shaftnet.org>, Stephen Boyd <sboyd@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Steven Rostedt <rostedt@goodmis.org>,
 Subbaraya Sundeep <sbhatta@marvell.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Sunil Goutham <sgoutham@marvell.com>,
 Tariq Toukan <tariqt@nvidia.com>, Tejun Heo <tj@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Vineet Gupta <vgupta@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, kvm@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-perf-users@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/9] lib/bitmap: optimize bitmap_weight() usage
Message-ID: <YaPEfZ0t9UFGwpml@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Disposition: inline
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_100519_568640_AFD59D8F 
X-CRM114-Status: GOOD (  17.50  )
X-Mailman-Approved-At: Wed, 01 Dec 2021 10:39:25 -0800
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20211128180514.eGIVS8BO4zSnKQznid7g9kRgpYbWIwQORiO6dx9JDrA@z>

On Sat, Nov 27, 2021 at 07:56:55PM -0800, Yury Norov wrote:
> In many cases people use bitmap_weight()-based functions like this:
> =

> 	if (num_present_cpus() > 1)
> 		do_something();
> =

> This may take considerable amount of time on many-cpus machines because
> num_present_cpus() will traverse every word of underlying cpumask
> unconditionally.
> =

> We can significantly improve on it for many real cases if stop traversing
> the mask as soon as we count present cpus to any number greater than 1:
> =

> 	if (num_present_cpus_gt(1))
> 		do_something();
> =

> To implement this idea, the series adds bitmap_weight_{eq,gt,le}
> functions together with corresponding wrappers in cpumask and nodemask.

Having slept on it I have more structured thoughts:

First, I like substituting bitmap_empty/full where possible - I think
the change stands on its own, so could be split and sent as is.

I don't like the proposed API very much. One problem is that it hides
the comparison operator and makes call sites less readable:

	bitmap_weight(...) > N

becomes:

	bitmap_weight_gt(..., N)

and:
	bitmap_weight(...) <=3D N

becomes:

	bitmap_weight_lt(..., N+1)
or:
	!bitmap_weight_gt(..., N)

I'd rather see something resembling memcmp() API that's known enough
to be easier to grasp. For above examples:

	bitmap_weight_cmp(..., N) > 0
	bitmap_weight_cmp(..., N) <=3D 0
	...

This would also make the implementation easier in not having to
copy and paste the code three times. Could also use a simple
optimization reducing code size:

#include <linux/overflow.h>

int bitmap_weight_cmp(long *bits, size_t nbits, size_t cmp)
{
	for (size_t i =3D 0; i < nbits / BITS_PER_LONG; ++i, ++bits)
		if (check_sub_overflow(cmp, popcount(*bits), &cmp))
			return 1;

	nbits %=3D BITS_PER_LONG;
	if (nbits && check_sub_overflow(cmp,
			popcount(*bits & GENMASK(nbits)), &cmp))
		return 1;

	return cmp ? -1 : 0;
}

Best Regards
Micha=B3 Miros=B3aw

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
