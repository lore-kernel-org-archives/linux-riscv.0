Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF243C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 09:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gTOkOx3kyAHDY3xRdv1ZWHloxskEqktPWzG5hXNrt3M=; b=r/TR/+5f5exWkG
	0pzZ3mOpZSa4AKxRCUp1g4JVAvzh1bcJfLMYCtHe+yIo7mR7dJ4O4WAeG1mbfv2H5ofI2GpgE5G2g
	Ki1PRvtubotY1OzEAwHnZs+MXUncol0FT8aFthDp1YI+vKWZoW+oYn09J+kv1owAwHmtqZ/nDiLwf
	lqiQCbLogy+F9CALHtVAqmiAVjV7l/dn0zpKrF94HHmOirT/3S/cA3XgE0KddHgIAbQ9ukfYCoxTt
	wCr2brXLNinX73jhkr5wX7SkTC/YyAUOntpBmdOmf0KDXmQ6rIbfHkWDS/4+mj8wZRx2wJgenfDgz
	t59JvnrMivaPeh8reidQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZrTH-001ZgH-Rm; Thu, 31 Mar 2022 09:52:03 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZrTE-001Ze1-Qr
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 09:52:02 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id D117D68AA6; Thu, 31 Mar 2022 11:51:55 +0200 (CEST)
Date: Thu, 31 Mar 2022 11:51:55 +0200
From: Christoph Hellwig <hch@lst.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, liush@allwinnertech.com, guoren@kernel.org,
 atishp@atishpatra.org, anup@brainfault.org, drew@beagleboard.org,
 hch@lst.de, arnd@arndb.de, wens@csie.org, maxime@cerno.tech,
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com,
 behrensj@mit.edu, xinhaoqu@huawei.com, mick@ics.forth.gr,
 allen.baum@esperantotech.com, jscheid@ventanamicro.com,
 rtrauben@gmail.com, samuel@sholland.org, cmuellner@linux.com,
 philipp.tomsich@vrull.eu, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v8 01/14] riscv: prevent null-pointer dereference with
 sbi_remote_fence_i
Message-ID: <20220331095155.GA23422@lst.de>
References: <20220324000710.575331-1-heiko@sntech.de>
 <20220324000710.575331-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220324000710.575331-2-heiko@sntech.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_025201_050364_CA77D158 
X-CRM114-Status: GOOD (  17.48  )
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

On Thu, Mar 24, 2022 at 01:06:57AM +0100, Heiko Stuebner wrote:
> The callback used inside sbi_remote_fence_i is set at sbi probe time
> to the needed variant. Before that it is a NULL pointer.
> 
> Some users like the flush_icache_*() functions suggest a generic
> functionality, that doesn't depend on a specific boot-stage but
> uses sbi_remote_fence_i as one option to flush other cpu cores.
> 
> So they definitely shouldn't run into null-pointer dereference
> issues when called "too early" during boot.
> 
> So introduce an empty function to be the standard for the __sbi_rfence
> function pointer until sbi_init has run.
> 
> Users of sbi_remote_fence_i will have separate code for the local
> cpu and sbi_init() is called before other cpus are brought up.
> So there are no other cpus present at the time when the issue
> might happen.

I don't really understand this changelog.  If flush_icache_* or
other routines using SBI calls are called too early they won't
do what they are asked to do, which implies a bug in the code.

So crashing absolutely is the right thing to do here as we don't
really have any other error reporting method available.

So unless I'm totally misunderstanding what you are saying here:

Nacked-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
