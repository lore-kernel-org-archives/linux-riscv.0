Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AF1C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 12:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jAl+e1txJr4ja+FUJmWk9ZIfyTjijXwRdWJhD/vdVb0=; b=R5SrSIDRGrZh85
	LkP3rzTSXMNPHXXyR2aWaQQToHw3CYxDZhKNGU5zviJ03WMXHcfZyMJKlwCkp9HZ0k+Jhsa+XZlrm
	IpOzE/ahv51OahucNPPBLEOhgh13z40wpq59kKFh6itv39ZWIPiKIH7dOo8QVbVATzAosWfWzSQSg
	MU/wrQznUVq1fV5W0HomOU8D7JykKD5lY6FKSj57ylarcHKSr8pamI1hkMePhGb0zMD+T8eIUnZTT
	A6pIywKNQchM6oizHDxse6edt/eepViW6Kybueml12XdiyQetE5st6BaRHnEXyqmnErU1DxLkRAhd
	OimpfiS+7lCxUgh5OG7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZtzX-002FHF-24; Thu, 31 Mar 2022 12:33:31 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZtzU-002FGn-5Y
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 12:33:29 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id A77D068AFE; Thu, 31 Mar 2022 14:33:22 +0200 (CEST)
Date: Thu, 31 Mar 2022 14:33:22 +0200
From: Christoph Hellwig <hch@lst.de>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Christoph Hellwig <hch@lst.de>, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, liush@allwinnertech.com, guoren@kernel.org,
 atishp@atishpatra.org, anup@brainfault.org, drew@beagleboard.org,
 arnd@arndb.de, wens@csie.org, maxime@cerno.tech,
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com,
 behrensj@mit.edu, xinhaoqu@huawei.com, mick@ics.forth.gr,
 allen.baum@esperantotech.com, jscheid@ventanamicro.com,
 rtrauben@gmail.com, samuel@sholland.org, cmuellner@linux.com,
 philipp.tomsich@vrull.eu, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v8 01/14] riscv: prevent null-pointer dereference with
 sbi_remote_fence_i
Message-ID: <20220331123322.GA26378@lst.de>
References: <20220324000710.575331-1-heiko@sntech.de>
 <20220324000710.575331-2-heiko@sntech.de> <20220331095155.GA23422@lst.de>
 <2260961.n0HT0TaD9V@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2260961.n0HT0TaD9V@diego>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_053328_399085_8F82374F 
X-CRM114-Status: GOOD (  14.65  )
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

On Thu, Mar 31, 2022 at 02:28:06PM +0200, Heiko St=FCbner wrote:
> so essentially flushes the _local_ icache first and then tries to flush
> caches on other cores, either via an ipi or via sbi.
> =

> The remote-fence callback is set correctly during sbi_init().
> The other cores are only brought up after sbi-init is done.
> =

> So it's not really about error reporting but making sure that flush_icach=
e_all()
> does something sane even when still running on the first core.
> As I assume the "all" means on all available cores (which would be the
> core the system booted on).
> =

> Does this make it clearer what this tries to solve?

A little.  Whatever code calls this early still seems broken to me
and just just do a local flush, though.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
