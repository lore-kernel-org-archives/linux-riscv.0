Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E84C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 10:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AvgzNNbjTksA9UCmemuMcuy+BoBzV0YPtcdtSEIblZg=; b=Q0PeNC93sW/nx4
	bULyKFXGnR9J6Hr4deXDAmKEFMoj8aAOrzFSroN6m+4zKLg81WMMAmg7Gn07Y0lcxJd6phyMC9Qh5
	8lOZeGj4TaYd9U8krbaZrHigAz2t582yFsNSpSm5MrzRJX9nqqvMJDKmFfIQlKCApmveIWu4gVvBc
	zbfzifE0G2kOse09c1vGYmCNG/2qjcuYPEw91gx7dVnAswNmXDzRRNaNLB1/ifsMuiiICPsyzwvm3
	d+Wr/bElQk5wkDBdzER+Jh2+0hRIXwsW8y+sVlhzPqory4EiWfkwGEBZymAzxGaOYwYZj8BYXTRf+
	yhsPGT0ZausP8BARBQ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZreb-001clE-1I; Thu, 31 Mar 2022 10:03:45 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZreY-001ckh-6x
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 10:03:43 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 58A4B68B05; Thu, 31 Mar 2022 12:03:37 +0200 (CEST)
Date: Thu, 31 Mar 2022 12:03:37 +0200
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
 philipp.tomsich@vrull.eu, Wei Wu <lazyparser@gmail.com>,
 Daniel Lustig <dlustig@nvidia.com>, Bill Huffman <huffman@cadence.com>
Subject: Re: [PATCH v8 11/14] riscv: add RISC-V Svpbmt extension support
Message-ID: <20220331100337.GH23422@lst.de>
References: <20220324000710.575331-1-heiko@sntech.de>
 <20220324000710.575331-12-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220324000710.575331-12-heiko@sntech.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_030342_471176_8BBB3D59 
X-CRM114-Status: UNSURE (   6.19  )
X-CRM114-Notice: Please train this message.
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


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
