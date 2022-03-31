Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BB8C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 12:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wBummDL1tWsPoMMCubtkvl//d4Qff+fr3PRebQpVsYs=; b=zshqernwf8su3s
	qYiHZidh7bpod9gOyY/50pWTrhW+wsn8NvFKepndRm3HmcIDsEg1wpq763nxMQ0cxfCyNkrkA3Vfh
	BQ1Rh+g7hTZacl4LctlS/jEogHZ7puR1uNgE1wnJsVyxFwiQSk4yuCFtLhnVLL4ro4r4HtAGDcKqV
	b6bXCK/kVbJ76dyO1U1engem2Vb4u/z0pt1fI2YKBId5Ui1V88OdcJP7tE4JWs5AmDc5gu15+Pxcj
	6fO6HLJJVlinIlVIPSF/tqX6ijfeS2wiXO2QZc6mhOGr0Pz/+fYmTveAC+7qqP0iXf27JO+RuraeZ
	SgVLkYxDba6Om7QiZ4oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZtuO-002EMn-Qw; Thu, 31 Mar 2022 12:28:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZtuM-002EM7-AQ
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 12:28:11 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nZtuJ-0000oT-6f; Thu, 31 Mar 2022 14:28:07 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Christoph Hellwig <hch@lst.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, wefu@redhat.com,
 liush@allwinnertech.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, drew@beagleboard.org, hch@lst.de, arnd@arndb.de,
 wens@csie.org, maxime@cerno.tech, gfavor@ventanamicro.com,
 andrea.mondelli@huawei.com, behrensj@mit.edu, xinhaoqu@huawei.com,
 mick@ics.forth.gr, allen.baum@esperantotech.com, jscheid@ventanamicro.com,
 rtrauben@gmail.com, samuel@sholland.org, cmuellner@linux.com,
 philipp.tomsich@vrull.eu, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v8 01/14] riscv: prevent null-pointer dereference with
 sbi_remote_fence_i
Date: Thu, 31 Mar 2022 14:28:06 +0200
Message-ID: <2260961.n0HT0TaD9V@diego>
In-Reply-To: <20220331095155.GA23422@lst.de>
References: <20220324000710.575331-1-heiko@sntech.de>
 <20220324000710.575331-2-heiko@sntech.de> <20220331095155.GA23422@lst.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_052810_401495_935056BE 
X-CRM114-Status: GOOD (  25.51  )
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

Hi,

Am Donnerstag, 31. M=E4rz 2022, 11:51:55 CEST schrieb Christoph Hellwig:
> On Thu, Mar 24, 2022 at 01:06:57AM +0100, Heiko Stuebner wrote:
> > The callback used inside sbi_remote_fence_i is set at sbi probe time
> > to the needed variant. Before that it is a NULL pointer.
> > =

> > Some users like the flush_icache_*() functions suggest a generic
> > functionality, that doesn't depend on a specific boot-stage but
> > uses sbi_remote_fence_i as one option to flush other cpu cores.
> > =

> > So they definitely shouldn't run into null-pointer dereference
> > issues when called "too early" during boot.
> > =

> > So introduce an empty function to be the standard for the __sbi_rfence
> > function pointer until sbi_init has run.
> > =

> > Users of sbi_remote_fence_i will have separate code for the local
> > cpu and sbi_init() is called before other cpus are brought up.
> > So there are no other cpus present at the time when the issue
> > might happen.
> =

> I don't really understand this changelog.  If flush_icache_* or
> other routines using SBI calls are called too early they won't
> do what they are asked to do, which implies a bug in the code.
> =

> So crashing absolutely is the right thing to do here as we don't
> really have any other error reporting method available.
> =

> So unless I'm totally misunderstanding what you are saying here:
> =

> Nacked-by: Christoph Hellwig <hch@lst.de>

The function is defined as

void flush_icache_all(void)
{
	local_flush_icache_all();

	if (IS_ENABLED(CONFIG_RISCV_SBI))
		sbi_remote_fence_i(NULL);
	else
		on_each_cpu(ipi_remote_fence_i, NULL, 1);
}

so essentially flushes the _local_ icache first and then tries to flush
caches on other cores, either via an ipi or via sbi.

The remote-fence callback is set correctly during sbi_init().
The other cores are only brought up after sbi-init is done.

So it's not really about error reporting but making sure that flush_icache_=
all()
does something sane even when still running on the first core.
As I assume the "all" means on all available cores (which would be the
core the system booted on).

Does this make it clearer what this tries to solve?
Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
