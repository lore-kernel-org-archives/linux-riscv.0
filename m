Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEF5C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Apr 2022 18:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ICGg4/fGBXZ6poL8BAxFVjrFWLcHHv6J2AgXxpbzXs=; b=z+tIusOmQmxyX8
	HwRmFNlxCIdqphwFk7NSYmCITgK2K+rIQ7zMTyXoJYlgIXC3EHtYrfqT8rLHKhC931cMncKJhK7od
	vsovEX2owRlVbr44itdbNheXiALtk7CQ2/GdHp8Mx/SnIFtytloeZAabQ8nIElfobeXH891EgHfya
	aBAQbrmbrUkDYGfTBO3O5jdmKzI+4DdcGq959NY9bPYIuqLqaA5/kinO/WNbYdY7GESk1cjSvCdyB
	5QZVpEE6GYpL1IIzbVrFih+Qk/WT1FC6kGDc9D3Zi6U0adDHmFfBrTzAChcph2YsQxQOBN2/TkMkl
	GLT/YwozkI+ULEDeDRug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncXDc-00DbLK-Ho; Thu, 07 Apr 2022 18:50:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncXDZ-00DbKA-Oz
 for linux-riscv@lists.infradead.org; Thu, 07 Apr 2022 18:50:55 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1ncXDQ-0007Iv-1o; Thu, 07 Apr 2022 20:50:44 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Christoph Hellwig <hch@lst.de>, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, wefu@redhat.com,
 liush@allwinnertech.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, drew@beagleboard.org, arnd@arndb.de, wens@csie.org,
 maxime@cerno.tech, gfavor@ventanamicro.com, andrea.mondelli@huawei.com,
 behrensj@mit.edu, xinhaoqu@huawei.com, mick@ics.forth.gr,
 allen.baum@esperantotech.com, jscheid@ventanamicro.com, rtrauben@gmail.com,
 samuel@sholland.org, cmuellner@linux.com, philipp.tomsich@vrull.eu,
 Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v8 01/14] riscv: prevent null-pointer dereference with
 sbi_remote_fence_i
Date: Thu, 07 Apr 2022 20:50:42 +0200
Message-ID: <2627651.mvXUDI8C0e@diego>
In-Reply-To: <20220331123322.GA26378@lst.de>
References: <20220324000710.575331-1-heiko@sntech.de>
 <2260961.n0HT0TaD9V@diego> <20220331123322.GA26378@lst.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_115053_848925_EC8AB4EC 
X-CRM114-Status: GOOD (  17.87  )
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

Am Donnerstag, 31. M=E4rz 2022, 14:33:22 CEST schrieb Christoph Hellwig:
> On Thu, Mar 31, 2022 at 02:28:06PM +0200, Heiko St=FCbner wrote:
> > so essentially flushes the _local_ icache first and then tries to flush
> > caches on other cores, either via an ipi or via sbi.
> > =

> > The remote-fence callback is set correctly during sbi_init().
> > The other cores are only brought up after sbi-init is done.
> > =

> > So it's not really about error reporting but making sure that flush_ica=
che_all()
> > does something sane even when still running on the first core.
> > As I assume the "all" means on all available cores (which would be the
> > core the system booted on).
> > =

> > Does this make it clearer what this tries to solve?
> =

> A little.  Whatever code calls this early still seems broken to me
> and just just do a local flush, though.

Looking at this again made me realize that we don't need this patch
anymore at all.

In a previous revision the "main" alternatives apply-point was earlier,
triggering the issue when the generic patching-functions wanted to
flush the cache, but with the alternatives getting applied where they
are now, the issue is not triggered anymore.

And the "early" alternatives use a local flush anyway.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
