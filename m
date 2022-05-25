Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D14C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 21:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hXZhFDNt2CNL6tk755/AaEQE8mAlfQmeVrBH2DNiyyk=; b=0h8KI0kXvYWk+C
	R1NpegENqDJ9gLhJ7ZD5xA51s6KKai081YJnCFzJJPegjHyYMWNdZRzN0qCLTkTs7vq+MnktvGA4R
	HzP61VnecAP+Xr8956d9njMdnZrRunoYk52GeNcJ+5i1xlMcvQdsDEm0oBVwX2SutGMLVu5pftVjc
	RrVC/2Gtq4ZLrREVtnDT2v9nEmaI5hAxqQYGLec9eZOLWNcmwqJ3HHMQGBycq1Sk8tGVd42mjIAf+
	RYu6xVr+QxbXqZl9vq/ikxsmJCMwFQ793MQLHAP3MLTlW/hRmf22DvSpRNm9/ds81SnMB8I2m+Pao
	hB7lvJm0QSKiq+XjCN2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntyuP-00CmtQ-7c; Wed, 25 May 2022 21:51:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntyuD-00CmoR-36; Wed, 25 May 2022 21:51:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EA7F761AB6;
	Wed, 25 May 2022 21:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68EFC385B8;
	Wed, 25 May 2022 21:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1653515457;
	bh=RJBqCEbCNY0ooTTHUDW8T5ccFZ9a+R65ZzhmVt+2S44=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=R8xzes5UjWb8BqqxzRNWgPf7cEHyaAbeSDj+v3F0k3sq8Asguyz6Vmo/uMlX6uzmY
	 8HryaeniW2c258rIiLOGG2MjKsnv6NbBuzhNNsrGT4ET41NSmI5sqMNPKOc8It7ZVv
	 QGSPkTQx3i5p9WrHix2LggCVXiwA2BU9p5l/o92c=
Date: Wed, 25 May 2022 14:50:56 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-rdma@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-parport@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-mm@kvack.org, linux-fbdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bpf@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org
Subject: Re: [linux-next:master] BUILD REGRESSION
 8cb8311e95e3bb58bd84d6350365f14a718faa6d
Message-Id: <20220525145056.953631743a4c494aabf000dc@linux-foundation.org>
In-Reply-To: <628ea118.wJYf60YnZco0hs9o%lkp@intel.com>
References: <628ea118.wJYf60YnZco0hs9o%lkp@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_145101_196339_34A24352 
X-CRM114-Status: GOOD (  13.12  )
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

On Thu, 26 May 2022 05:35:20 +0800 kernel test robot <lkp@intel.com> wrote:

> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> branch HEAD: 8cb8311e95e3bb58bd84d6350365f14a718faa6d  Add linux-next specific files for 20220525
> 
> Error/Warning reports:
> 
> ...
>
> Unverified Error/Warning (likely false positive, please contact us if interested):

Could be so.

> mm/shmem.c:1948 shmem_getpage_gfp() warn: should '(((1) << 12) / 512) << folio_order(folio)' be a 64 bit type?

I've been seeing this one for a while.  And from this report I can't
figure out what tool emitted it.  Clang?

>
> ...
>
> |-- i386-randconfig-m021
> |   `-- mm-shmem.c-shmem_getpage_gfp()-warn:should-((()-)-)-folio_order(folio)-be-a-bit-type

If you're going to use randconfig then shouldn't you make the config
available?  Or maybe quote the KCONFIG_SEED - presumably there's a way
for others to regenerate.

Anyway, the warning seems wrong to me.


#define PAGE_SIZE               (_AC(1,UL) << PAGE_SHIFT)

#define BLOCKS_PER_PAGE  (PAGE_SIZE/512)

	inode->i_blocks += BLOCKS_PER_PAGE << folio_order(folio);

so the RHS here should have unsigned long type.  Being able to generate
the cpp output would be helpful.  That requires the .config.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
