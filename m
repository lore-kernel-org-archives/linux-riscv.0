Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B91C021A0
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 09:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5JBhDEKIoTm17tJvVvsalpXhYf58Ka5TF7ZHCngoU70=; b=bscqCZHPfLaqkV
	3hmXyKec7Mj7/LUD+1FcndzVhmx1qz9HHSpvG6g5hWB7OADdt4UBV7LGot92BFoWr7EUXxpq5DxBE
	6qJshvcbDI+dXam9/u+BIUmTgWUw2IQ3uyXGJ/n4Amp/lvWxdYtHazV8ElwdbBvrG1THW+p7HGoeN
	vTT5ludJHqBaJG+Ns4fHJYEpnUHtJ0/yhRZQEZVNJUuhEI2mzYDqKraepGM/9ovC8m5HDLiO7MDmt
	JhLIOTOF4oQzv5WvTLORQ1g656dlQck+GkZd5LQd0G3TBq7zIFdm1f9mtOglc13vXdhINI2D0taym
	JJHYAtvqz/jwh9VmhJmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxcY-00000003xtg-3MGZ;
	Mon, 17 Feb 2025 09:40:58 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxMw-00000003v71-2XJW
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 09:24:51 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2C19A68BEB; Mon, 17 Feb 2025 10:24:46 +0100 (CET)
Date: Mon, 17 Feb 2025 10:24:45 +0100
From: Christoph Hellwig <hch@lst.de>
To: kernel test robot <lkp@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Carlos Maiolino <cem@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	linux-riscv@lists.infradead.org
Subject: Re: fs/xfs/xfs_buf.c:1534 xfs_buf_submit_bio() warn: unsigned '_x'
 is never less than zero.
Message-ID: <20250217092445.GA29568@lst.de>
References: <202502171326.j4Xd3I0j-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202502171326.j4Xd3I0j-lkp@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_012450_789380_B153976D 
X-CRM114-Status: GOOD (  17.41  )
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

On Mon, Feb 17, 2025 at 01:53:08PM +0800, kernel test robot wrote:
> New smatch warnings:
> fs/xfs/xfs_buf.c:1534 xfs_buf_submit_bio() warn: unsigned '_x' is never less than zero.

Looks like this is an issue in the riscv virt_to_page implementation
which also shows up in various other places.  Any chance this could get
fixed in the riscv code?

> 
> Old smatch warnings:
> fs/xfs/xfs_linux.h:283 kmem_to_page() warn: unsigned '_x' is never less than zero.
> fs/xfs/xfs_buf.c:761 xfs_buf_get_map() error: we previously assumed 'bp' could be null (see line 743)
> arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting
> 
> vim +/_x +1534 fs/xfs/xfs_buf.c
> 
>   1518	
>   1519	static void
>   1520	xfs_buf_submit_bio(
>   1521		struct xfs_buf		*bp)
>   1522	{
>   1523		unsigned int		size = BBTOB(bp->b_length);
>   1524		unsigned int		map = 0, p;
>   1525		struct blk_plug		plug;
>   1526		struct bio		*bio;
>   1527	
>   1528		bio = bio_alloc(bp->b_target->bt_bdev, bp->b_page_count,
>   1529				xfs_buf_bio_op(bp), GFP_NOIO);
>   1530		bio->bi_private = bp;
>   1531		bio->bi_end_io = xfs_buf_bio_end_io;
>   1532	
>   1533		if (bp->b_flags & _XBF_KMEM) {
> > 1534			__bio_add_page(bio, virt_to_page(bp->b_addr), size,
>   1535					bp->b_offset);
>   1536		} else {
>   1537			for (p = 0; p < bp->b_page_count; p++)
>   1538				__bio_add_page(bio, bp->b_pages[p], PAGE_SIZE, 0);
>   1539			bio->bi_iter.bi_size = size; /* limit to the actual size used */
>   1540	
>   1541			if (xfs_buf_is_vmapped(bp))
>   1542				flush_kernel_vmap_range(bp->b_addr,
>   1543						xfs_buf_vmap_len(bp));
>   1544		}
>   1545	
>   1546		/*
>   1547		 * If there is more than one map segment, split out a new bio for each
>   1548		 * map except of the last one.  The last map is handled by the
>   1549		 * remainder of the original bio outside the loop.
>   1550		 */
>   1551		blk_start_plug(&plug);
>   1552		for (map = 0; map < bp->b_map_count - 1; map++) {
>   1553			struct bio	*split;
>   1554	
>   1555			split = bio_split(bio, bp->b_maps[map].bm_len, GFP_NOFS,
>   1556					&fs_bio_set);
>   1557			split->bi_iter.bi_sector = bp->b_maps[map].bm_bn;
>   1558			bio_chain(split, bio);
>   1559			submit_bio(split);
>   1560		}
>   1561		bio->bi_iter.bi_sector = bp->b_maps[map].bm_bn;
>   1562		submit_bio(bio);
>   1563		blk_finish_plug(&plug);
>   1564	}
>   1565	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
---end quoted text---

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
