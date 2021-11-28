Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57130C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Nov 2021 18:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MY290ELxfRsEzLQRrPF7NorVh69GXFjL3M7WKMoAzVg=; b=J6KCHcn4UNU4wm
	L40C6+D6YVn0mQq0fZ0VPqJ30BvwRU+vptfYFrrEAfwnVAdjU4lfweneZf3sOEihZOOdx+M8EkdZA
	QT8YtzF9TQNk4mXtOqSmvkXm0qRGnOrf7ThRVAizmzOvmVPYje5mvNxsQakmxZXF9Vwdl+fFPDBAF
	YdXSC5VMMqLfDlQtzIwyI/oaEBkr62GrHP+mZ4d1UGkvbj9u9OoiJ6Qc0AIOee/+qFDYrqFL5B2NQ
	X0J1CK80czWG+6elNqQ9VJCS85OVAi0F6Hf7ph2DxatCxkxWDitM+Skq7rwYQ36+wsbcKvT3TbXj4
	FfknyW770gbyFfGzBM2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrOdB-00GQeO-R8; Sun, 28 Nov 2021 18:10:29 +0000
Received: from rere.qmqm.pl ([91.227.64.183])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrOd8-00GQdL-HG; Sun, 28 Nov 2021 18:10:27 +0000
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4J2Gjn33d2zW8;
 Sun, 28 Nov 2021 19:10:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638123024; bh=JZhqOAoOJwkFLsUnNQo8o++CiFK7HEGKhePgc/FSOF4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BSqkw57UlW2pW1NXQ5wZ96M5n0daMnNFg3ZZGk4QpT65f28st6tvSbAjCuaDYp0Y0
 CmyX5dp3fxa/1bsCgFSoiXvYl/Ivrvk/XW5Lhr31jLklN0/6fnKbeszxM4AJMOo6b9
 hs1WVqqJVnnkAxwtLxudxAhzHN+6r0DPz2i1TcI1//mgPfBMhwBro3m3CGjmkmEKO0
 zFXYptfKQJ6Xhp//QSGLBmM8xlFJVmHJ9/rNfVpoRczyIK6/HJ5953QI6d4A5Zxyqw
 UnYVoDxFeKZcNpL0K/UJMA5pXP8gOMjtVWWYJxoXBIppSPMAs/Uq2+pv87S9vD8wOI
 LfWcTnK2w+pRg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Sun, 28 Nov 2021 19:10:20 +0100
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
Subject: Re: [PATCH 2/9] lib/bitmap: implement bitmap_{empty,full} with
 bitmap_weight_eq()
Message-ID: <YaPGDOvBzhiRFcOP@qmqm.qmqm.pl>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-3-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211128035704.270739-3-yury.norov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_101026_758953_BB4D9441 
X-CRM114-Status: GOOD (  19.63  )
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

On Sat, Nov 27, 2021 at 07:56:57PM -0800, Yury Norov wrote:
> Now as we have bitmap_weight_eq(), switch bitmap_full() and
> bitmap_empty() to using it.
> =

> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> ---
>  include/linux/bitmap.h | 26 ++++++++++----------------
>  1 file changed, 10 insertions(+), 16 deletions(-)
> =

> diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> index 996041f771c8..2d951e4dc814 100644
> --- a/include/linux/bitmap.h
> +++ b/include/linux/bitmap.h
> @@ -386,22 +386,6 @@ static inline int bitmap_subset(const unsigned long =
*src1,
>  		return __bitmap_subset(src1, src2, nbits);
>  }
>  =

> -static inline bool bitmap_empty(const unsigned long *src, unsigned nbits)
> -{
> -	if (small_const_nbits(nbits))
> -		return ! (*src & BITMAP_LAST_WORD_MASK(nbits));
> -
> -	return find_first_bit(src, nbits) =3D=3D nbits;
> -}

Since this is supposed to be an optimization, I would go all the way and
replace this with the trivial implementation instead:

bool bitmap_empty(long *bits, size_t nbits)
{
	for (; nbits >=3D BITS_PER_LONG; ++bits, nbits -=3D BITS_PER_LONG)
		if (*bits)
			return false;

	if (nbits && *bits & BITMAP_LAST_WORD_MASK(nbits))
		return false;

	return true;
}
 =

Best Regards
Micha=B3 Miros=B3aw

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
