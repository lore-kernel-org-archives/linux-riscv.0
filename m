Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10F1C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 09:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BNS6Gv5pHREKHWFouAynhUthTub6WYgvqKEyMf6ye5Q=; b=xwvBz2ATiWifVV
	/CO3fPWVbsN/3VwTd6FO+NKKYWf/Liz65bznaNRq70qPYW0A0aBK6Em1nntyYzlfAuuzelOeL7iQK
	4mpaJzAkTaKeMkEVbUyP5ruujBdj2Ec4MdO6ERU3/y8Jm4QrpVXHqLI3zBGwUSdcWQM5rWZ3F16mv
	4Wb1FllBa4DYqRFXb5grgG5VPi6+cXlsVoXpuHCfdkQfom7lJLNcD0mnoiKDXAtaQai5IGG5tvEAq
	hI759CJEDmO/XdFvHcl8Wf5xfRKK45Qf81L3gt0AMuAfPMsb5DfOI29EHhnF0aSMK3riDJ76jpRg/
	t00f0D/U5mpUSnm3NJhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZrY9-001axn-4o; Thu, 31 Mar 2022 09:57:05 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZrY6-001awR-5i
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 09:57:03 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id E0E8A68BEB; Thu, 31 Mar 2022 11:56:58 +0200 (CEST)
Date: Thu, 31 Mar 2022 11:56:58 +0200
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
 philipp.tomsich@vrull.eu
Subject: Re: [PATCH v8 07/14] riscv: prevent compressed instructions in
 alternatives
Message-ID: <20220331095658.GD23422@lst.de>
References: <20220324000710.575331-1-heiko@sntech.de>
 <20220324000710.575331-8-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220324000710.575331-8-heiko@sntech.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_025702_412364_D752E8E5 
X-CRM114-Status: GOOD (  12.51  )
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

On Thu, Mar 24, 2022 at 01:07:03AM +0100, Heiko Stuebner wrote:
> Instructions are opportunistically compressed by the RISC-V assembler
> when possible, but in alternatives-blocks both the old and new content
> need to be the same size, so having the toolchain do somewhat random
> optimizations will cause strange side-effects like
> "attempt to move .org backwards" compile-time errors.
> 
> Already a simple "and" used in alternatives assembly will cause these
> mismatched code sizes.
> 
> So prevent compressed instructions to be generated in alternatives-
> code and use option-push and -pop to only limit this to the relevant
> code blocks

Yes, that makes sense:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
