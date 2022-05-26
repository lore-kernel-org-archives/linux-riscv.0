Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808BCC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 01:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IlIcldbfMEd/A90ncmzzu1vWHqSH1Rl1DDj/oF+e6vs=; b=nlArNtr4e4/Ko4
	gjKorft50dJMVLENNrHozd7Pna8qy7fIiBMudMgB9VMOf13Ce6H1uJvWLzonda+azbXkzDowB3+5T
	g+msbM0/RCXdPN+EUHdZKCtCyhQ790VByejI8/ySyY+BuJ2ckZLIpa2xxbt83adUTM6jWT9FBDXE/
	/KzPbH9qViHmhVBzhCIsEZG4GvrF8HcL+Pzt3+Hgeu1GCzHSZ8N4MjSmJuhwxWPRbhDEMk7GQ5N2u
	QRAfmF7AxhAWCSzOCMG81IBn154LpcEc+shBNpzQpjztY9vyr4vx6hUVN0iiNreg2296gjyRSw47a
	unmsbcc6s0qE0pimdE2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu27K-00DABg-LH; Thu, 26 May 2022 01:16:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu27I-00DABG-PI; Thu, 26 May 2022 01:16:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qYg8IKyL/r8f2Vg1ESuYjuOnE5g2jafpU06hhSyNUpw=; b=FU/B4l/86GX2mfAVzdnOZlet7o
	4YIMhkZpbCoSmgTvSZ+0srZ6BwOG40pWCCMj19qhaZ7LyhuSaw2+YdDV5a6+88avQFq2cWdQHfPWr
	byuXc0vT/MGU7fDuPvzVefIP3U6jrYIpaAmCNdJioEzp88SsKae4gtRxxjsbwJwKjR30fWyrk6jS+
	6N+w+qBIVJaEKMA2SIN/QJXQZdAFNIwoALKz9JWYzo9WKGMkqQ+rWdT359dIGkZ8Sy1ZcS2tNgQxZ
	uFqnsZqHJyvAVlUVWnv0GfWFHqg8A7Yfpa485ULCi1tDMGcQd2T2bgnhjP4//0FFa8Q9P8q43x6cS
	bXqNJBtA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu278-000pxs-VA; Thu, 26 May 2022 01:16:35 +0000
Date: Thu, 26 May 2022 02:16:34 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, kernel test robot <lkp@intel.com>,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-rdma@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-parport@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-mm@kvack.org, linux-fbdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org
Subject: Re: [linux-next:master] BUILD REGRESSION
 8cb8311e95e3bb58bd84d6350365f14a718faa6d
Message-ID: <Yo7U8kglHlcvQ0Ri@casper.infradead.org>
References: <628ea118.wJYf60YnZco0hs9o%lkp@intel.com>
 <20220525145056.953631743a4c494aabf000dc@linux-foundation.org>
 <F0E25DFF-8256-48FF-8B88-C0E3730A3E5E@jrtc27.com>
 <20220525152006.e87d3fa50aca58fdc1b43b6a@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220525152006.e87d3fa50aca58fdc1b43b6a@linux-foundation.org>
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

On Wed, May 25, 2022 at 03:20:06PM -0700, Andrew Morton wrote:
> On Wed, 25 May 2022 23:07:35 +0100 Jessica Clarke <jrtc27@jrtc27.com> wrote:
> 
> > This is i386, so an unsigned long is 32-bit, but i_blocks is a blkcnt_t
> > i.e. a u64, which makes the shift without a cast of the LHS fishy.
> 
> Ah, of course, thanks.  I remember 32 bits ;)
> 
> --- a/mm/shmem.c~mm-shmemc-suppress-shift-warning
> +++ a/mm/shmem.c
> @@ -1945,7 +1945,7 @@ alloc_nohuge:
>  
>  	spin_lock_irq(&info->lock);
>  	info->alloced += folio_nr_pages(folio);
> -	inode->i_blocks += BLOCKS_PER_PAGE << folio_order(folio);
> +	inode->i_blocks += (blkcnt_t)BLOCKS_PER_PAGE << folio_order(folio);

Bizarre this started showing up now.  The recent patch was:

-       info->alloced += compound_nr(page);
-       inode->i_blocks += BLOCKS_PER_PAGE << compound_order(page);
+       info->alloced += folio_nr_pages(folio);
+       inode->i_blocks += BLOCKS_PER_PAGE << folio_order(folio);

so it could tell that compound_order() was small, but folio_order()
might be large?

Silencing the warning is a good thing, but folio_order() can (at the
moment) be at most 9 on i386, so it isn't actually going to be
larger than 4096.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
