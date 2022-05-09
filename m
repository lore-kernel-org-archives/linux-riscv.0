Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C183C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 14:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tX+8N1bQnfsAae40eCmiamTzuQj6gzHpBOWJglZ/2zI=; b=rDttsYqr9T5TLE
	mJ4jktyPqYQOOuEFx3veqhP70kuyPOjW/GlTsz5vpW0Zh4EZHL+36Z562I13W8VXkHbDZMTxYsBuO
	jU93y4CtvUffw4J5YVW/esp+3YmvkWy1B+ZMHlCW0AADyMPL4GxbgyIpDiUZn2vAUXDrUHnmNZqSc
	eBCq32CIYN6ATDVHSrTtFqTItZ5xKfya+C8lGTep5mOWo2Zw8rfN86mya6fVqrYNzbg+U2XfKKgII
	RNdxK8LlrrPVleo5Gu6FE+8aln0YPXBlZTRlYRgqaLcKwxEZJsrAd4jdAy8kM/yRqXI2Jhgmeqq0D
	0sbPKiCxmtdXD1CdV5tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no46p-00EkL8-TA; Mon, 09 May 2022 14:11:35 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no46m-00EkKF-Oi
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 14:11:34 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id B709068AFE; Mon,  9 May 2022 16:11:24 +0200 (CEST)
Date: Mon, 9 May 2022 16:11:22 +0200
From: Christoph Hellwig <hch@lst.de>
To: Conor.Dooley@microchip.com
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, hch@lst.de,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: linux-next: Tree for May 3
Message-ID: <20220509141122.GA14555@lst.de>
References: <20220503172926.08215c77@canb.auug.org.au>
 <3f94c9a8-c927-5cc0-7d67-4b21c3d9dbaf@microchip.com>
 <9a424be9-380f-f99c-4126-25a00eba0271@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9a424be9-380f-f99c-4126-25a00eba0271@microchip.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_071133_030185_25D69B75 
X-CRM114-Status: GOOD (  14.10  )
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

On Mon, May 09, 2022 at 01:33:07PM +0000, Conor.Dooley@microchip.com wrote:
> @Christoph, I know /nothing/ about swiotlb, so if you have any
> suggestions for debugging that you would like me to try, let me
> know please.

Hi Conor,

sorry for dropping this on the flor.  I was at LSF/MM least week and
my plan to go through my backlog today didn't go to plan as I unepectedly
spent half the day at doctors appointments.

The commit looks like a somewhat unusual culprit for a boot failure,
so any chance you could do another manual verifiation pass where
you checkout 6424e31b1c05 and then the commit before it (i.e. as
git checkout 6424e31b1c05^) to make sure it really is this commits?
Some of the commits around it just seems like more likely culprits to
me, so I'd like to really be 100% sure here.  In the meantime I'll
look through the patch.  Also you don't happen to have earlycon support
on this plaform to see if there are any interesting messages on the
serial console?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
